# Kelly Kettle Distillation Scaffolding: Model2 Specifications

## Assumptions
- **Kelly Kettle spout**: ~20mm outer diameter (adjustable).
- **Tubing**: ~10mm outer diameter (plastic or copper, adjustable).
- **Water intake**: A second tube feeds water into the kettle, gravity-fed from a stream or elevated source.
- **Steam redirection**: A ball-and-socket joint allows ~270-degree steam direction (limited by mechanical constraints).
- **Condenser**: Same coil holder as before, for when condensation is needed (optional for textile processing).
- **Use case**: Kettle placed near a stream, fed wood for fire, with water intake from the stream and steam redirected for processing.

## Explanation of Components

### Spout Adapter with Water Intake
- Clamps onto the Kelly Kettle spout (~20mm diameter, adjustable via `spout_diameter`).
- Features two ports:
  - **Steam output**: Directs steam into tubing leading to the ball-and-socket nozzle.
  - **Water intake**: A second tube (angled at 45 degrees for gravity feed) allows water to enter the kettle from an external source (e.g., a stream via a siphon or elevated container).
- Both ports have support flanges to secure tubing (plastic or copper, ~10mm OD, adjustable via `tubing_od`).

### Ball-and-Socket Steam Nozzle
- A ball-and-socket joint for ~270-degree steam redirection (controlled by `socket_angle` and `ball_diameter`).
- The **ball** connects to the steam tubing from the spout adapter and has a through-hole for steam.
- The **socket** holds the ball, with an opening allowing ~270-degree movement (limited by the socket’s geometry).
- The socket has an output port for tubing to direct steam (e.g., for textile processing) or connect to the condenser.
- The design is compact and printable, with `tolerance` ensuring a snug but movable fit.

### Condenser Coil Holder
- Identical to the previous model: a base ring with four notched arms to hold a coiled tubing in a cold water bath.
- Included for optional distillation (e.g., if you want purified water instead of steam for textiles).
- Adjustable via `coil_diameter` and `coil_holder_height`.

## Usage Instructions

### Measure and Adjust Parameters
- Measure your Kelly Kettle’s spout outer diameter and update `spout_diameter`.
- Measure your tubing’s outer diameter and update `tubing_od`.
- Adjust `ball_diameter` and `socket_angle` for desired nozzle mobility (larger ball = more material, smaller angle = less range).
- Update `coil_diameter` if using a condenser coil.

### 3D Printing
- Print the spout adapter, ball-and-socket nozzle (ball and socket as separate parts), and coil holder (if needed).
- Use heat-resistant filament (e.g., PETG or ABS) for the spout adapter and ball-and-socket nozzle due to steam exposure. PLA is fine for the coil holder.
- Comment out the `translate` commands in the render section to export individual STLs.

### Assembly
- **Spout adapter**: Fit over the Kelly Kettle spout. Insert steam tubing into the vertical port and water intake tubing into the angled port. Secure with food-grade silicone if needed.
- **Water intake**: Connect the intake tubing to a stream or elevated water source (e.g., a bucket or siphon). Ensure the water source is higher than the kettle for gravity feed.
- **Ball-and-socket nozzle**: Attach the ball to the steam tubing. Snap the socket onto the ball (apply slight force; `tolerance` ensures a snug fit). Attach output tubing to the socket’s port for steam direction.
- **Condenser (optional)**: If distilling, coil the output tubing and snap it into the coil holder’s notches, then submerge in a cold water bath.
- **Operation**: Place the kettle near a stream, feed wood to the fire, and position the water intake tubing in the stream. Adjust the ball-and-socket nozzle to direct steam (e.g., for textiles). Monitor water levels to prevent dry boiling.

## Notes
- **Water Intake**: The intake relies on gravity or siphon pressure. Ensure the kettle isn’t over-pressurized; the open spout design allows excess steam to escape, but test the flow rate to balance intake and boiling.
- **Ball-and-Socket**: The ~270-degree range is achieved by the socket’s opening angle (`socket_angle = 60`). Adjust for more/less freedom, but note that a full 360 degrees may weaken the joint.
- **Tubing**: The model assumes equivalent diameters for plastic/copper tubing. Verify your tubing fits the `tubing_od` parameter.
- **Minimal Design**: The scaffolding uses minimal material (thin walls, simple geometry) while ensuring functionality for stream-side operation and steam redirection.
- **Textile Processing**: The steerable nozzle allows precise steam application. If condensation is needed, use the coil holder; otherwise, direct steam via the nozzle’s output tubing.
