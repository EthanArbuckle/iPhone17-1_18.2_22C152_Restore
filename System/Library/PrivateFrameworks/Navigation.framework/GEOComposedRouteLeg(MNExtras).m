@interface GEOComposedRouteLeg(MNExtras)
- (id)destinationListInstructionString;
- (id)originListInstructionString;
- (id)waypointSubstitutedComposedStringForString:()MNExtras waypoint:useWaypointAddress:;
@end

@implementation GEOComposedRouteLeg(MNExtras)

- (id)originListInstructionString
{
  v2 = [a1 originListInstruction];
  v3 = [a1 origin];
  v4 = [a1 waypointSubstitutedComposedStringForString:v2 waypoint:v3 useWaypointAddress:0];

  v5 = [v4 stringWithDefaultOptions];

  return v5;
}

- (id)destinationListInstructionString
{
  v2 = [a1 destinationListInstruction];
  v3 = [a1 destination];
  v4 = [a1 waypointSubstitutedComposedStringForString:v2 waypoint:v3 useWaypointAddress:0];

  v5 = [v4 stringWithDefaultOptions];

  return v5;
}

- (id)waypointSubstitutedComposedStringForString:()MNExtras waypoint:useWaypointAddress:
{
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (a3 && v7)
  {
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __104__GEOComposedRouteLeg_MNExtras__waypointSubstitutedComposedStringForString_waypoint_useWaypointAddress___block_invoke;
    v16 = &unk_1E60FBF80;
    char v18 = a5;
    id v17 = v7;
    id v10 = a3;
    v11 = [v10 optionsWithArgumentHandler:&v13];
    v9 = objc_msgSend(v10, "composedStringWithOptions:", v11, v13, v14, v15, v16);
  }
  return v9;
}

@end