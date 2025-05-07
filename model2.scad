// model2.scad: 3D-printed scaffolding for Kelly Kettle distillation with water intake and steerable steam nozzle
// Supports water replenishment and ~270-degree steam direction

// Parameters (adjust based on your Kelly Kettle and tubing)
spout_diameter = 20; // Outer diameter of Kelly Kettle spout (mm)
tubing_od = 10; // Outer diameter of plastic/copper tubing (mm)
wall_thickness = 2; // Thickness of printed parts (mm)
tolerance = 0.5; // Fit tolerance for spout and tubing (mm)
coil_diameter = 100; // Approximate diameter of condenser coil (mm)
coil_holder_height = 50; // Height of coil holder (mm)
ball_diameter = 15; // Diameter of ball in ball-and-socket joint (mm)
socket_angle = 60; // Angle of socket opening for ~270-degree movement (degrees)

// Module: Spout Adapter with Water Intake
// Clamps onto spout, supports steam output and water intake tubing
module spout_adapter() {
    difference() {
        // Main body: cylinder to fit over spout
        cylinder(d=spout_diameter + 2*wall_thickness + tolerance, h=25, $fn=60);
        // Hole for spout
        translate([0, 0, -0.1])
            cylinder(d=spout_diameter + tolerance, h=25.2, $fn=60);
        // Hole for steam tubing (to ball joint)
        translate([0, 0, 15])
            cylinder(d=tubing_od + tolerance, h=20, $fn=60);
        // Hole for water intake tubing (angled for gravity feed)
        rotate([0, 45, 0])
            translate([0, 0, 10])
                cylinder(d=tubing_od + tolerance, h=30, $fn=60);
    }
    // Steam tubing support flange
    translate([0, 0, 15])
        difference() {
            cylinder(d=tubing_od + 2*wall_thickness, h=5, $fn=60);
            translate([0, 0, -0.1])
                cylinder(d=tubing_od + tolerance, h=5.2, $fn=60);
        }
    // Water intake tubing support flange
    rotate([0, 45, 0])
        translate([0, 0, 15])
            difference() {
                cylinder(d=tubing_od + 2*wall_thickness, h=5, $fn=60);
                translate([0, 0, -0.1])
                    cylinder(d=tubing_od + tolerance, h=5.2, $fn=60);
            }
}

// Module: Ball-and-Socket Steam Nozzle
// Allows ~270-degree steam redirection
module ball_socket_nozzle() {
    // Ball component (attached to steam tubing)
    translate([0, 0, 30]) // Position above spout adapter
    difference() {
        sphere(d=ball_diameter, $fn=60);
        // Hole for steam tubing
        cylinder(d=tubing_od + tolerance, h=ball_diameter, center=true, $fn=60);
        // Trim bottom for tubing entry
        translate([0, 0, -ball_diameter/2])
            cylinder(d=tubing_od + 2*wall_thickness, h=ball_diameter/2, $fn=60);
    }
    // Socket component (holds ball, allows rotation)
    translate([0, 0, 30 + ball_diameter/2])
    difference() {
        // Socket body
        cylinder(d=ball_diameter + 2*wall_thickness, h=ball_diameter/2, $fn=60);
        // Spherical cavity for ball
        translate([0, 0, -ball_diameter/4])
            sphere(d=ball_diameter + tolerance, $fn=60);
        // Opening for nozzle movement (~270 degrees)
        translate([0, 0, -ball_diameter/2])
            cylinder(d=ball_diameter * sin(socket_angle), h=ball_diameter, $fn=60);
        // Hole for output tubing
        translate([0, 0, ball_diameter/4])
            cylinder(d=tubing_od + tolerance, h=ball_diameter, $fn=60);
    }
}

// Module: Condenser Coil Holder
// Frame to hold coiled tubing in cold water bath (optional for distillation)
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
                    // Notches for tubing
                    for (z = [10:10:coil_holder_height-10]) {
                        translate([-0.1, 5 - tubing_od/2, z])
                            cube([wall_thickness + 0.2, tubing_od + tolerance, tubing_od]);
                    }
                }
    }
}

// Render components
// Spout adapter with water intake
translate([0, 0, 0])
    spout_adapter();

// Ball-and-socket nozzle (connected to steam tubing)
translate([0, 0, 0])
    ball_socket_nozzle();

// Condenser coil holder (positioned for visualization, adjust for printing)
translate([coil_diameter + 20, 0, 0])
    coil_holder();
