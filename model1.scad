// Minimal 3D-printed scaffolding for Kelly Kettle water distillation
// Adapts spout for tubing and supports condenser coil

// Parameters (adjust based on your Kelly Kettle and tubing)
spout_diameter = 20; // Outer diameter of Kelly Kettle spout (mm)
tubing_od = 10; // Outer diameter of plastic/copper tubing (mm)
wall_thickness = 2; // Thickness of printed parts (mm)
tolerance = 0.5; // Fit tolerance for spout and tubing (mm)
coil_diameter = 100; // Approximate diameter of condenser coil (mm)
coil_holder_height = 50; // Height of coil holder (mm)

// Module: Spout Adapter
// Clamps onto kettle spout, provides port for tubing
module spout_adapter() {
    difference() {
        // Main body: cylinder to fit over spout
        cylinder(d=spout_diameter + 2*wall_thickness + tolerance, h=20, $fn=60);
        // Hole for spout
        translate([0, 0, -0.1])
            cylinder(d=spout_diameter + tolerance, h=20.2, $fn=60);
        // Hole for tubing (angled for steam exit)
        rotate([0, -30, 0])
            translate([0, 0, 10])
                cylinder(d=tubing_od + tolerance, h=30, $fn=60);
    }
    // Tubing support flange
    translate([0, 0, 10])
        rotate([0, -30, 0])
            difference() {
                cylinder(d=tubing_od + 2*wall_thickness, h=10, $fn=60);
                translate([0, 0, -0.1])
                    cylinder(d=tubing_od + tolerance, h=10.2, $fn=60);
            }
}

// Module: Condenser Coil Holder
// Frame to hold coiled tubing in cold water bath
module coil_holder() {
    // Base ring to rest on container
    difference() {
        cylinder(d=coil_diameter + 2*wall_thickness, h=wall_thickness, $fn=60);
        translate([0, 0, -0.1])
            cylinder(d=coil_diameter - 2*wall_thickness, h=wall_thickness + 0.2, $fn=60);
    }
    // Vertical supports (4 arms) to hold coil
    for (i = [0:3]) {
        rotate([0, 0, i*90])
            translate([coil_diameter/2, 0, 0])
                difference() {
                    // Arm
                    cube([wall_thickness, 10, coil_holder_height]);
                    // Notches for tubing (spaced to hold coil loops)
                    for (z = [10:10:coil_holder_height-10]) {
                        translate([-0.1, 5 - tubing_od/2, z])
                            cube([wall_thickness + 0.2, tubing_od + tolerance, tubing_od]);
                    }
                }
    }
}

// Render components
// Spout adapter
translate([0, 0, 0])
    spout_adapter();

// Condenser coil holder (positioned for visualization, adjust for printing)
translate([coil_diameter + 20, 0, 0])
    coil_holder();
