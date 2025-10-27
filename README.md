# adoorn-number-frame

A parametric OpenSCAD design for a mailbox number positioning frame, specifically for https://www.adoorn.com/products/post-mount-mailbox. This project creates a template frame that helps position four individual house numbers (e.g., adhesive digits) at precise locations on a mailbox or other surface.

![IMG_1097](https://github.com/user-attachments/assets/3bdcb04a-e62b-4782-8fd8-81edc7da89b1)


## Overview

The code generates a positioning frame with:
- **Four cutout windows** (2.875" × 4" each) spaced 0.75" apart for placing individual numbers
- **Rear alignment tab** (1" wide) for consistent positioning against the mailbox edge
- **Bottom flange** (0.75" deep) for alignment with the mailbox bottom edge
- **Split design** that divides the frame into two interlocking parts (Part A and Part B) to fit smaller 3D printer beds like the Bambu P1S

## Technical Implementation

### Parametric Dimensions
All dimensions are defined using inch-to-mm conversion and can be easily customized:
- Number cutout size: 4" height × 2.875" width
- Spacing between numbers: 0.75"
- Frame thickness: 0.15"
- Rear offset: 17.3125" (total frame length)
- Bottom/top offset: 0.75" each

### Two-Part Design
The frame is split at the midpoint (split_pos) into:
- **Part A (rear half)**: Contains female notches at top and bottom
- **Part B (front half)**: Contains male tabs that fit into Part A's notches

The alignment notches (0.25" × 0.25" × 0.125" overlap) ensure the two parts align correctly when assembled.

## Features

- **Parametric Design**: All dimensions defined as variables for easy customization
- **Split for Small Print Beds**: Two-part design fits printers with limited bed size
- **Alignment System**: Notch-and-tab connection ensures proper part alignment
- **Reference Points**: Rear tab and bottom flange provide consistent positioning on the mailbox

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/f1fe/adoorn-number-frame.git
   ```

2. **Open in OpenSCAD**:
   - Launch [OpenSCAD](https://www.openscad.org/)
   - Open `adoorn_number_frame.scad`

3. **Export Part A**:
   - Ensure line 100 has `partA();` uncommented and line 101 has `//partB();` commented
   - Press F6 to render
   - Export to STL: File → Export → Export as STL
   - Save as `adoorn_number_frame-partA.stl`

4. **Export Part B**:
   - Comment out line 100: `//partA();`
   - Uncomment line 101: `partB();`
   - Press F6 to render
   - Export to STL
   - Save as `adoorn_number_frame-partB.stl`

5. **Customize Parameters** (optional):
   - Edit lines 8-15 in the code to adjust dimensions:
     - `num_height`, `num_width`: Size of number cutouts
     - `spacing`: Gap between numbers
     - `rear_offset`: Total frame length
     - `bottom_offset`, `top_offset`: Vertical positioning
     - `frame_thickness`: Frame depth

6. **3D Print**:
   - Print both parts flat on the bed
   - No supports needed
   - Assemble by sliding the male tabs of Part B into the female notches of Part A

## License

_No license information is currently provided. Please contact the repository owner for usage terms._

---

For more details, visit the [GitHub repository](https://github.com/f1fe/adoorn-number-frame).
