@interface CPManeuver
- (id)_maps_description;
@end

@implementation CPManeuver

- (id)_maps_description
{
  v2 = self;
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    if (objc_opt_respondsToSelector())
    {
      v5 = [(CPManeuver *)v2 performSelector:"accessibilityIdentifier"];
      v6 = v5;
      if (v5 && ![v5 isEqualToString:v4])
      {
        CFStringRef v7 = +[NSString stringWithFormat:@"%@<%p, %@>", v4, v2, v6];

        goto LABEL_7;
      }
    }
    CFStringRef v7 = +[NSString stringWithFormat:@"%@<%p>", v4, v2];
LABEL_7:

    goto LABEL_9;
  }
  CFStringRef v7 = @"<nil>";
LABEL_9:

  v47[0] = v7;
  v45 = +[NSString stringWithFormat:@"    index: %d", [(CPManeuver *)v2 index]];
  v47[1] = v45;
  [(CPManeuver *)v2 maneuverType];
  v44 = NSStringFromCPManeuverType();
  v43 = +[NSString stringWithFormat:@"    maneuverType: %@", v44];
  v47[2] = v43;
  v42 = [(CPManeuver *)v2 instructionVariants];
  v41 = [v42 componentsJoinedByString:@" | "];
  v40 = +[NSString stringWithFormat:@"    instructionVariants: %@", v41];
  v47[3] = v40;
  v39 = [(CPManeuver *)v2 attributedInstructionVariants];
  v38 = [v39 componentsJoinedByString:@" | "];
  v37 = +[NSString stringWithFormat:@"    attributedInstructionVariants: %@", v38];
  v47[4] = v37;
  v36 = [(CPManeuver *)v2 roadFollowingManeuverVariants];
  v35 = [v36 componentsJoinedByString:@" | "];
  v34 = +[NSString stringWithFormat:@"    roadFollowingManeuverVariants: %@", v35];
  v47[5] = v34;
  v33 = [(CPManeuver *)v2 initialTravelEstimates];
  uint64_t v8 = [v33 distanceRemaining];
  v31 = [(CPManeuver *)v2 initialTravelEstimates];
  [v31 timeRemaining];
  v32 = (void *)v8;
  v30 = +[NSString stringWithFormat:@"    initialTravelEstimates: %@, %0.1fs", v8, v9];
  v47[6] = v30;
  [(CPManeuver *)v2 trafficSide];
  v29 = NSStringFromCPTrafficSide();
  v28 = +[NSString stringWithFormat:@"    trafficSide: %@", v29];
  v47[7] = v28;
  [(CPManeuver *)v2 junctionType];
  v27 = NSStringFromCPJunctionType();
  v26 = +[NSString stringWithFormat:@"    junctionType: %@", v27];
  v47[8] = v26;
  v25 = [(CPManeuver *)v2 junctionElementAngles];
  v24 = [v25 allObjects];
  v23 = [v24 valueForKey:@"doubleValue"];
  v10 = [v23 componentsJoinedByString:@", "];
  v11 = +[NSString stringWithFormat:@"    junctionElementAngles: %@", v10];
  v47[9] = v11;
  v12 = [(CPManeuver *)v2 junctionExitAngle];
  v46 = (__CFString *)v7;
  if (v12)
  {
    v22 = [(CPManeuver *)v2 junctionExitAngle];
    [v22 doubleValue];
    v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  }
  else
  {
    v13 = 0;
  }
  v14 = +[NSString stringWithFormat:@"    junctionExitAngle: %@", v13];
  v47[10] = v14;
  v15 = [(CPManeuver *)v2 exitInfo];
  v16 = +[NSString stringWithFormat:@"    exitInfo: %@", v15];
  v47[11] = v16;
  v17 = [(CPManeuver *)v2 symbolImage];
  v18 = +[NSString stringWithFormat:@"    symbolImage: %@", v17];
  v47[12] = v18;
  v19 = +[NSArray arrayWithObjects:v47 count:13];

  if (v12)
  {
  }
  v20 = [v19 componentsJoinedByString:@"\n"];

  return v20;
}

@end