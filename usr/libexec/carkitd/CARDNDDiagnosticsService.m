@interface CARDNDDiagnosticsService
+ (id)TTRURLforEvent:(unint64_t)a3;
+ (id)_radarURLForDiagnosticsAndDescriptionText:(id)a3;
+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didEnterRhodesGeofence:(BOOL)a4;
+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didStartRhodes:(BOOL)a4;
+ (id)_radarURLForDiagnosticsAtTime:(id)a3 withEvent:(unint64_t)a4;
@end

@implementation CARDNDDiagnosticsService

+ (id)TTRURLforEvent:(unint64_t)a3
{
  v5 = +[NSDate date];
  v6 = CRStringForDate();

  v7 = [a1 _radarURLForDiagnosticsAtTime:v6 withEvent:a3];

  return v7;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 withEvent:(unint64_t)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0uLL:
      id v7 = a1;
      id v8 = v6;
      uint64_t v9 = 1;
      goto LABEL_4;
    case 1uLL:
      id v7 = a1;
      id v8 = v6;
      uint64_t v9 = 0;
LABEL_4:
      v10 = [v7 _radarURLForDiagnosticsAtTime:v8 didStartRhodes:v9];
      goto LABEL_8;
    case 2uLL:
      id v11 = a1;
      id v12 = v6;
      uint64_t v13 = 1;
      goto LABEL_7;
    case 3uLL:
      id v11 = a1;
      id v12 = v6;
      uint64_t v13 = 0;
LABEL_7:
      v10 = [v11 _radarURLForDiagnosticsAtTime:v12 didEnterRhodesGeofence:v13];
LABEL_8:
      a1 = v10;
      break;
    default:
      break;
  }

  return a1;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didStartRhodes:(BOOL)a4
{
  CFStringRef v4 = @"Exited DNDWD at %@";
  if (a4) {
    CFStringRef v4 = @"Entered DNDWD at %@";
  }
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  id v6 = [@"Please describe what you were doing to trigger Do Not Disturb While Driving. \n\n\n" stringByAppendingString:v5];

  id v7 = [(id)objc_opt_class() _radarURLForDiagnosticsAndDescriptionText:v6];

  return v7;
}

+ (id)_radarURLForDiagnosticsAtTime:(id)a3 didEnterRhodesGeofence:(BOOL)a4
{
  CFStringRef v4 = @"Exited geofence at %@";
  if (a4) {
    CFStringRef v4 = @"Entered geofence at %@";
  }
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, a3);
  id v6 = [(id)objc_opt_class() _radarURLForDiagnosticsAndDescriptionText:v5];

  return v6;
}

+ (id)_radarURLForDiagnosticsAndDescriptionText:(id)a3
{
  id v3 = a3;
  CFStringRef v4 = CRFormattedBuildAndDeviceIdentifier();
  if (v4)
  {
    v5 = v4;
    id v6 = [v4 stringByAppendingString:@": [DNDWD]"];
  }
  else
  {
    id v6 = @"[DNDWD]";
  }
  v14[0] = @"ComponentName";
  v14[1] = @"ComponentVersion";
  v15[0] = @"Do Not Disturb While Driving";
  v15[1] = @"1.0";
  v14[2] = @"ComponentID";
  v14[3] = @"Keywords";
  v15[2] = @"831192";
  v15[3] = @"814490";
  v14[4] = @"Reproducibility";
  v14[5] = @"Title";
  v15[4] = @"I Didn't Try";
  v15[5] = v6;
  v14[6] = @"ExtensionIdentifiers";
  id v7 = [&off_1000C7280 componentsJoinedByString:@","];
  v15[6] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  id v9 = [v8 mutableCopy];

  [v9 setObject:v3 forKeyedSubscript:@"Description"];
  v10 = CRURLEncodedString();
  id v11 = [@"tap-to-radar://new?" stringByAppendingString:v10];
  id v12 = +[NSURL URLWithString:v11];

  return v12;
}

@end