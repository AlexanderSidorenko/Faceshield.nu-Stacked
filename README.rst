Overview
========
This repo contains a short `OpenSCAD <https://www.openscad.org/>`_ script that generates a stack of 3D printable face shields designed by 3D Verkstan. You can find more information about the original design on `their official web site <https://3dverkstan.se/protective-visor/>`_. Original STL files can be found in their `GitHub repo <https://github.com/Cederb/Faceshield.nu/>`_.

Solid forehead version
======================
Originally I tried stacking `V3, 6 hole, US version STL <https://github.com/Cederb/Faceshield.nu/blob/master/North%20America/3D%20Printing%20Files%20(STL)/Visor_Frame_NORTH_AMERICA_letter_6-hole_v3.stl>`_ from 3D Verkstan, but after printing a couple of small, test stacks, I discovered the original design doesn't stack well.

The problem happens due to the hollowing in the forehead area. When printing original (hollowed) version of the part with thick layers (I am printing ``0.4mm`` think layers), there are only few layers in the forehead area (in case of ``0.4mm`` layers, only 2). The first layer "hangs" over the hollow area in the part below, and doesn't adhere to the second layer. This results in very brittle parts. The hollowing was probably added to reduce print time and save material, but unfortunately it makes it harder to stack the parts.

I remixed the part to fill the hollowing in the forehead area. You can find it under name ``Visor_Frame_NORTH_AMERICA_letter_6-hole_v3_solid_forehead.stl``.

In my experience, filling the hollowing doesn't significantly impact the print time and/or material usage.

When sliced using ``0.6mm`` nozzle, ``0.4mm`` layer height and ``30%`` rectilinear infill for ``Original Prusa i3 MK3``, ``PrusaSlicer`` produces the following estimates. The original (hollowed) model uses ``15.94g`` of PETG and takes ``34`` minutes to print. The remixed (solid) model uses ``18.91g`` of PETG and takes ``39`` minutes to print. The difference isn't that big, but allows for better stacking.

I left an option to stack hollowed version of the part. I had bad luck with that, but YMMV.

General comments
================
The script stacks the STLs up to specified number, leaving a specified gap in between.

Optionally, it can also insert a flat "spacer" between the parts to make separation easier. I tried to address the issue with the hollowing using a spacer. I had no luck with this approach, but, again, YMMV.

Last, but not least, there are 1 (or 3 if stacking hollowed) cylindrical pillars added that are going through all the parts. They are necessary for 2 reasons:

1. Without the pillars, some slicers complain that there are empty layers and refuse to slice. Since we left the empty layers by design, this is a great hack to trick the slicer.
2. When printing hollowed, pillars help support layers that are hanging in the air.

Parameters
==========

``N`` - number of parts in the stack.

``gap`` - total gap, in millimeters, to be left between two parts. Has to be at least ``spacer_thickness``.

``pillar_radius`` - radius of cylindrical pillars.

``spacer_thickness`` - thickness, in millimeters, of the spacer. Can be 0. Please note that thickness of the spacer is not added to ``gap``! In other words, the total gap is shared by the spacer and the actual gap. I had no luck with spacers, but YMMV, so I left the option in.

``solid_forehead`` - if 0, this will use the original (hollowed) version of the part model, and add 3 pillars. I had no luck with this approach, but YMMV.

My experience printing
======================
I successfully printed a couple of stacks, all ``30`` high, on an ``Original Prusa i3 MK3``. I used ``0.6mm`` nozzle, ``0.4mm`` layer height, ``30%`` rectilinear infill and ``AmazonBasics PETG filament``.

The gap of ``0.4mm`` and no spacer worked great for me! YMMV, and **different combinations of nozzle diameter/layer thickness will most likely require different parameters!**

You can find the STL that worked for me in this repo.

Coming soon: "the splitter"
===========================
Once stack is printed, parts need to be split apart. I am in the process of designing a 3D printable "splitter" that will make it easier.

The first iteration of the design almost worked, but needs some further tweaks. I will update the repo when I have the design fine-tuned and verified to work.
