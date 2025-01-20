@interface RouteMiddleStepLabelListView
+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6;
+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6 forAccessibility:(BOOL)a7;
+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5;
+ (int64_t)_instructionsContext;
@end

@implementation RouteMiddleStepLabelListView

+ (id)voiceOverStringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return _[a1 stringsForRoute:a3 step:a4 tableMode:a5 isPrinting:0 forAccessibility:1];
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5
{
  return [a1 stringsForRoute:a3 step:a4 tableMode:a5 isPrinting:0];
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6
{
  return _[a1 stringsForRoute:a3 step:a4 tableMode:a5 isPrinting:a6 forAccessibility:0];
}

+ (id)stringsForRoute:(id)a3 step:(id)a4 tableMode:(BOOL)a5 isPrinting:(BOOL)a6 forAccessibility:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  if ([v12 transportType] == 1)
  {
    id v14 = &__NSArray0__struct;
    goto LABEL_60;
  }
  BOOL v72 = a5;
  v15 = sub_100CFEC64(v13, v12);
  id v16 = [v12 legIndexForStepIndex:[v13 stepIndex]];
  v17 = [v12 legs];
  if (v16 >= [v17 count])
  {
    v19 = 0;
  }
  else
  {
    v18 = [v12 legs];
    v19 = [v18 objectAtIndexedSubscript:v16];
  }
  v20 = [v19 destination];
  v21 = [v20 chargingInfo];

  if (!v15 || v21)
  {
    v28 = [v13 contentsForContext:[a1 _instructionsContext]];
    v71 = [v28 stringForDistance:-1.0];
    v73 = [v13 notice];
    id v29 = [v73 length];
    v68 = v28;
    if (v8 && (v30 = (char *)[v13 stepIndex], (unint64_t)v30 >= 2))
    {
      v31 = v30;
      id v32 = v29;
      v33 = [v12 steps];
      v34 = [v33 objectAtIndexedSubscript:v31 - 1];

      v35 = [v34 geoStep];
      unsigned int v36 = [v35 expectedTime];

      if (v36)
      {
        v37 = +[NSString _navigation_stringWithSeconds:v36 abbreviated:1];
        v69 = +[NSString stringWithFormat:@" (%@)", v37];
      }
      else
      {
        v69 = &stru_101324E70;
      }

      id v29 = v32;
    }
    else
    {
      v69 = &stru_101324E70;
    }
    unsigned int v38 = [v13 transportType];
    v39 = [v13 chargingStationInfo];
    v67 = v19;
    if ([v13 isStartOrResumeStep])
    {
      id v40 = 0;
      v70 = 0;
LABEL_23:
      v41 = v68;
LABEL_35:
      uint64_t v52 = 1;
      if (v40) {
        uint64_t v52 = 2;
      }
      if (v29) {
        uint64_t v53 = v52 + 1;
      }
      else {
        uint64_t v53 = v52;
      }
      v54 = +[NSMutableArray arrayWithCapacity:v53];
      if (v40)
      {
        if (v8)
        {
          id v55 = [objc_alloc((Class)UIColor) initWithRed:0.254901961 green:0.435294118 blue:0.658823529 alpha:1.0];
          [v54 addObject:v55];
        }
        [v54 addObject:v40];
      }
      if (v8)
      {
        v56 = +[UIColor darkGrayColor];
        [v54 addObject:v56];
      }
      v57 = [v41 instruction];
      if ([v13 transportType] == 4 && !v57)
      {
        v58 = +[NSBundle mainBundle];
        v57 = [v58 localizedStringForKey:@"Navigation_DirectionsForUnknownTransport" value:@"localized string not found" table:0];
      }
      if (v57)
      {
        id v59 = 0;
        if (v40 && !v72) {
          id v59 = [v54 count];
        }
        [v54 insertObject:v57 atIndex:v59];
      }
      if (v29) {
        [v54 addObject:v73];
      }
      if (v39)
      {
        [v39 batteryPercentageAfterCharging];
        v60 = +[GEOComposedRouteEVChargingStationInfo chargeToStringForChargePercentage:](GEOComposedRouteEVChargingStationInfo, "chargeToStringForChargePercentage:");
        [v54 addObject:v60];
      }
      id v14 = [v54 copy];

      v19 = v67;
      goto LABEL_59;
    }
    if (a7)
    {
      id v42 = [v13 accessibilityDistance];
    }
    else
    {
      id v42 = v71;
    }
    v70 = v42;
    if (v39)
    {
      id v66 = v29;
      [v39 chargingTime];
      v44 = +[NSString _navigation_stringWithSeconds:v43 abbreviated:1];
      v45 = +[NSBundle mainBundle];
      v46 = v45;
      if (v44)
      {
        v47 = [v45 localizedStringForKey:@"Directions_Driving_EV" value:@"localized string not found" table:0];
        v48 = [v39 name];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v44, v48);
      }
      else
      {
        v47 = [v45 localizedStringForKey:@"Directions_Driving_EV_no_charge_time" value:@"localized string not found" table:0];
        v48 = [v39 name];
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48, v65);
      }
      id v40 = (id)objc_claimAutoreleasedReturnValue();

      v41 = v68;
      id v29 = v66;
      goto LABEL_35;
    }
    if (v38 == 2)
    {
      if (v8)
      {
        v49 = +[NSBundle mainBundle];
        v50 = v49;
        CFStringRef v51 = @"Directions_Walking_DistanceTime";
LABEL_66:
        [v49 localizedStringForKey:v51 value:@"localized string not found" table:0];
        v63 = id v62 = v29;
        v65 = v69;
LABEL_71:
        +[NSString stringWithFormat:](NSString, "stringWithFormat:", v63, v70, v65);
        id v40 = (id)objc_claimAutoreleasedReturnValue();

        id v29 = v62;
        goto LABEL_23;
      }
      v41 = v68;
      if (a7 || ![v68 hasServerContent])
      {
        v50 = +[NSBundle mainBundle];
        [v50 localizedStringForKey:@"Walk %@ then" value:@"localized string not found" table:0];
        v63 = id v62 = v29;
        goto LABEL_71;
      }
    }
    else
    {
      v41 = v68;
      if (v8)
      {
        if (![v13 stepIndex])
        {
          v64 = [v12 origin];
          id v40 = [v64 directionsListAddress];

          goto LABEL_35;
        }
        v49 = +[NSBundle mainBundle];
        v50 = v49;
        CFStringRef v51 = @"Directions_Driving_DistanceTime";
        goto LABEL_66;
      }
    }
    id v40 = v70;
    v70 = v40;
    goto LABEL_35;
  }
  v22 = [v19 destinationListInstructionString];
  if (![v22 length])
  {
    v23 = +[NSBundle mainBundle];
    uint64_t v24 = [v23 localizedStringForKey:@"Arrive [Directions Step]" value:@"localized string not found" table:0];

    v22 = (void *)v24;
  }
  v25 = [v15 singleLineAddress];
  id v26 = [v25 length];

  if (v26)
  {
    v75[0] = v22;
    v27 = [v15 singleLineAddress];
    v75[1] = v27;
    id v14 = +[NSArray arrayWithObjects:v75 count:2];
  }
  else
  {
    v74 = v22;
    id v14 = +[NSArray arrayWithObjects:&v74 count:1];
  }

LABEL_59:
LABEL_60:

  return v14;
}

+ (int64_t)_instructionsContext
{
  return 2;
}

@end