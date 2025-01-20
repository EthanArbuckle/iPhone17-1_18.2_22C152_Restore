@interface GEOComposedRouteStep
- ($C79183323B9A0D5602617FF3BE5395AC)mapRectAroundStartCoordinate;
- (BOOL)isEVChargerStep;
- (GEOComposedWaypoint)waypoint;
- (NSString)accessibilityDistance;
- (NSString)distanceString;
- (NSString)notice;
- (id)attributedChargeStringForWaypointType:(unint64_t)a3 font:(id)a4 textColor:(id)a5 includeDaysAgo:(BOOL)a6;
- (id)chargingStationInfo;
- (id)representativeSignGuidanceEvent;
- (id)transitInstructionInContext:(int64_t)a3;
@end

@implementation GEOComposedRouteStep

- (BOOL)isEVChargerStep
{
  v2 = [(GEOComposedRouteStep *)self chargingStationInfo];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)chargingStationInfo
{
  BOOL v3 = [(GEOComposedRouteStep *)self composedRoute];
  id v4 = [v3 legIndexForStepIndex:[self stepIndex]];

  v5 = [(GEOComposedRouteStep *)self composedRoute];
  v6 = [v5 legs];
  id v7 = [v6 count];

  if (v4 >= v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = [(GEOComposedRouteStep *)self composedRoute];
    v9 = [v8 legs];
    v10 = [v9 objectAtIndexedSubscript:v4];

    id v11 = [(GEOComposedRouteStep *)self stepIndex];
    if (v11 == [v10 endStepIndex])
    {
      v12 = [v10 chargingStationInfo];
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (id)attributedChargeStringForWaypointType:(unint64_t)a3 font:(id)a4 textColor:(id)a5 includeDaysAgo:(BOOL)a6
{
  id v9 = a4;
  id v10 = a5;
  if (qword_10160F278 != -1) {
    dispatch_once(&qword_10160F278, &stru_1012F2038);
  }
  if (a3 - 1 < 2)
  {
    id v11 = +[NSBundle mainBundle];
    v12 = v11;
    CFStringRef v13 = @"[EV] Battery at arrival";
LABEL_7:
    v14 = [v11 localizedStringForKey:v13 value:@"localized string not found" table:0];
    v15 = [(GEOComposedRouteStep *)self evInfo];
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, [v15 remainingBatteryPercentage]);

    goto LABEL_9;
  }
  if (!a3)
  {
    id v11 = +[NSBundle mainBundle];
    v12 = v11;
    CFStringRef v13 = @"[EV] Battery at start";
    goto LABEL_7;
  }
  v16 = 0;
LABEL_9:
  v17 = objc_opt_new();
  [v9 pointSize];
  double v19 = v18;
  v20 = [(GEOComposedRouteStep *)self evInfo];
  v21 = +[UIImage chargeImageOfSize:batteryLevel:](UIImage, "chargeImageOfSize:batteryLevel:", [v20 remainingBatteryPercentage], v19);

  [v17 setImage:v21];
  [v9 capHeight];
  double v23 = v22;
  [v21 size];
  double v25 = (v23 - v24) * 0.5;
  [v21 size];
  double v27 = v26;
  [v21 size];
  [v17 setBounds:0.0, v25, v27, v28];
  v29 = +[NSAttributedString attributedStringWithAttachment:v17];
  id v30 = [v29 mutableCopy];

  id v31 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
  [v30 appendAttributedString:v31];

  id v32 = [objc_alloc((Class)NSAttributedString) initWithString:v16];
  [v30 appendAttributedString:v32];

  v33 = [v30 string];
  id v34 = [v33 length];

  NSAttributedStringKey v40 = NSFontAttributeName;
  id v41 = v9;
  v35 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
  [v30 addAttributes:v35 range:0];

  if (v10)
  {
    NSAttributedStringKey v38 = NSForegroundColorAttributeName;
    id v39 = v10;
    v36 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    [v30 addAttributes:v36 range:0];
  }

  return v30;
}

- (GEOComposedWaypoint)waypoint
{
  BOOL v3 = [(GEOComposedRouteStep *)self composedRoute];
  id v4 = [v3 legIndexForStepIndex:[self stepIndex]];
  v5 = [v3 legs];
  id v6 = [v5 count];

  if (v4 >= v6)
  {
    id v9 = 0;
  }
  else
  {
    id v7 = [v3 legs];
    v8 = [v7 objectAtIndexedSubscript:v4];

    id v9 = [v8 destination];
  }

  return (GEOComposedWaypoint *)v9;
}

- (id)transitInstructionInContext:(int64_t)a3
{
  v5 = [(GEOComposedRouteStep *)self transitStep];

  if (v5)
  {
    id v6 = +[MNTransitStepInstruction instructionForStep:self context:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (NSString)notice
{
  v2 = [(GEOComposedRouteStep *)self geoStep];
  BOOL v3 = [v2 notice];

  return (NSString *)v3;
}

- (NSString)distanceString
{
  [(GEOComposedRouteStep *)self distance];
  if (v3 == 0.0)
  {
    v5 = 0;
  }
  else
  {
    [(GEOComposedRouteStep *)self distance];
    v5 = +[NSString _mapkit_localizedDistanceStringWithMeters:v4 abbreviated:0];
  }

  return (NSString *)v5;
}

- (NSString)accessibilityDistance
{
  [(GEOComposedRouteStep *)self distance];

  return (NSString *)+[NSString _mapkit_voiceOverLocalizedDistanceStringWithMeters:v2];
}

- ($C79183323B9A0D5602617FF3BE5395AC)mapRectAroundStartCoordinate
{
  [(GEOComposedRouteStep *)self distance];
  [(GEOComposedRouteStep *)self startCoordinate];

  MKMapRectMakeWithRadialDistance();
  result.var1.var1 = v6;
  result.var1.var0 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (id)representativeSignGuidanceEvent
{
  double v4 = objc_getAssociatedObject(self, a2);
  if (v4)
  {
LABEL_4:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v4;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;
    goto LABEL_8;
  }
  double v5 = [(GEOComposedRouteStep *)self geoStep];
  double v6 = [v5 guidanceEvents];
  double v4 = sub_1009338EC(v6);

  if (v4)
  {
    objc_setAssociatedObject(self, a2, v4, (void *)1);
    goto LABEL_4;
  }
  double v4 = +[NSNull null];
  objc_setAssociatedObject(self, a2, v4, (void *)1);
  id v8 = 0;
LABEL_8:

  return v8;
}

@end