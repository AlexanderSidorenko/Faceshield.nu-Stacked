N = 30;
gap = 0.4;

// Constant - usually don't need to change.
pillar_radius = 1.5;
// Constant - usually don't need to change.
spacer_thickness = 0.0;
// Constant - usually don't need to change.
part_height = 5; // height, in mm, of the part.
// Constant - usually don't need to change.
pillar_facets = 32; // number of facets on cylindrical pillars.
// Constant - usually don't need to change.
solid_forehead = 1;

module part()
{
    if (solid_forehead)
    {
        import("Visor_Frame_NORTH_AMERICA_letter_6-hole_v3_solid_forehead.stl");
    }
    else
    {
        import("Visor_Frame_NORTH_AMERICA_letter_6-hole_v3.stl");
    }
}

module spacer(spacer_thickness)
{
    translate([0, 0, -spacer_thickness / 2]) scale ([1, 1, spacer_thickness / 0.2]) import("Visor_Frame_NORTH_AMERICA_letter_6-hole_v3_spacer_0.2.stl");
}

module part_and_spacer(gap, spacer_thickness, spacer_needed)
{
    part();
    if (spacer_needed)
    {
        translate([0, 0, part_height+gap / 2]) spacer(spacer_thickness);
    }
}

module pillar(parts_distance)
{
    // OpenSCAD is super picky about surfaces of objects being united not being in the same plane.
    // So we have to make ends of the pillars penetrate into the parts both at the top and at the bottom.
    margin = 0.2;
    pillar_height = (N - 1) * parts_distance;
    translate([0, 0, margin]) cylinder(h = pillar_height, r1 = pillar_radius, r2 = pillar_radius, $fn=pillar_facets);
}

module stack(N, gap, spacer_thickness, pillar_radius)
{
    union()
    {
        parts_distance = gap + part_height;
        for (i = [0:N-1])
        {
            translate([0, 0, i * parts_distance]) part_and_spacer(gap, spacer_thickness, i < N-1);
        }
        if (!solid_forehead)
        {
            for (i = [-1:2:1])
            {
                translate([i * 40, 15, 0]) pillar(parts_distance);
            }
        }
        translate([0, 22, 0]) pillar(parts_distance);
    }
}
stack(N, gap, spacer_thickness, pillar_radius);
