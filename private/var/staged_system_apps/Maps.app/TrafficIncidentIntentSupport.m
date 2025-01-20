@interface TrafficIncidentIntentSupport
+ (id)localizedTitleForIncidentType:(int64_t)a3;
+ (int)incidentTypeForINTrafficIncidentType:(int64_t)a3;
+ (int64_t)INTrafficIncidentTypeForincidentType:(int)a3;
@end

@implementation TrafficIncidentIntentSupport

+ (int)incidentTypeForINTrafficIncidentType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return 0;
  }
  else {
    return dword_100F71C58[a3 - 1];
  }
}

+ (int64_t)INTrafficIncidentTypeForincidentType:(int)a3
{
  if (a3 > 6)
  {
    if (a3 != 7)
    {
      if (a3 == 16) {
        return 3;
      }
      return 0;
    }
    return 5;
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 6) {
        return 2;
      }
      return 0;
    }
    return 1;
  }
}

+ (id)localizedTitleForIncidentType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Crash [Report Incident]";
      break;
    case 2:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Hazard [Report Incident]";
      break;
    case 3:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Speed Check [Nav Tray, Report Incident]";
      break;
    case 4:
    case 5:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Roadwork [Report Incident]";
      break;
    default:
      v3 = +[NSBundle mainBundle];
      v4 = v3;
      CFStringRef v5 = @"Incident [Report Incident]";
      break;
  }
  v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

  return v6;
}

@end