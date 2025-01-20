@interface GEOComposedRouteLeg
@end

@implementation GEOComposedRouteLeg

void __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 18)
  {
    if (*(unsigned char *)(a1 + 40)) {
      uint64_t v4 = 7;
    }
    else {
      uint64_t v4 = [*(id *)(a1 + 32) waypointCategory];
    }
    v5 = [v3 substitutionFormat];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke_2;
    v6[3] = &unk_1E60FBF58;
    char v8 = *(unsigned char *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v5 setSubstitutionForWaypointCategory:v4 handler:v6];
  }
}

id __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    [v7 navDisplayAddress];
  }
  else {
  char v8 = [v7 bestDisplayName:0];
  }
  if (v8)
  {
    v9 = [v6 firstObject];
    v10 = [v9 stringFormat];
    [v10 setOverrideValue:v8];

    id v11 = v5;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end