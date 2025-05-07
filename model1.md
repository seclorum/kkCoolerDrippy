# Kelly Kettle Distillation Scaffolding: Model1 Specifications

## Assumptions
- **Spout diameter**: ~20mm (adjustable in parameters; measure your kettle’s spout for precision).
- **Tubing diameter**: ~10mm outer diameter (common for plastic/copper tubing; adjustable).
- **Condenser coil**: Copper/plastic tubing coiled manually, submerged in a separate cold water container (not modeled).
- **Design goals**: Minimal material, simple print, secure tubing attachment, and condenser support.

## Components
- **Spout adapter**: Clamps onto the kettle spout, with a port for tubing.
- **Condenser coil holder**: A frame to hold the coiled tubing in a cold water bath.

## Explanation of Components

### Spout Adapter
- A cylindrical clamp that fits over the Kelly Kettle’s spout.
- Includes a port angled at 30 degrees to direct steam into the tubing (plastic or copper).
- The tubing fits snugly into the port, with a flange for extra support.
- Adjustable via `spout_diameter` and `tubing_od`.

### Condenser Coil Holder
- A circular base with four vertical arms to hold the coiled tubing in a cold water bath.
- Each arm has notches spaced 10mm apart to secure loops of the tubing coil.
- The base rests on a container (e.g., a bucket), keeping the coil submerged.
- Adjustable via `coil_diameter` and `coil_holder_height`.

## Usage Instructions

### Measure and Adjust
- Measure your Kelly Kettle’s spout outer diameter and update `spout_diameter`.
- Measure your tubing’s outer diameter and update `tubing_od`.
- Adjust `coil_diameter` based on your coiled tubing’s approximate diameter.

### 3D Printing
- Print the spout adapter and coil holder separately (use the `translate` in the code for visualization only; comment it out for single-part STLs).
- Use a heat-resistant filament (e.g., PETG or ABS) for the spout adapter, as it will be near steam. PLA is fine for the coil holder.

### Assembly
- Fit the spout adapter over the Kelly Kettle’s spout.
- Insert one end of the tubing into the adapter’s port (secure with food-grade silicone if needed).
- Form the other end of the tubing into a coil and snap it into the notches of the coil holder.
- Place the coil holder in a cold water bath, ensuring the coil is submerged.
- Collect distilled water from the tubing’s exit in a clean container.

## Notes
- The model assumes equivalent diameters for plastic and copper tubing, so the `tubing_od` parameter works for both.
- The design is minimal to reduce print time and material while ensuring functionality.
- If your spout or tubing sizes differ significantly, update the parameters and test-fit the parts.
- The coil holder assumes a manual coil; you may need to adjust notch spacing (10mm in the code) based on your coil’s loop density.