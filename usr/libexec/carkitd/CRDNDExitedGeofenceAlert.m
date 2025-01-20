@interface CRDNDExitedGeofenceAlert
+ (id)actions;
- (id)message;
- (id)title;
@end

@implementation CRDNDExitedGeofenceAlert

- (id)title
{
  return @"[Internal] Geofence exited";
}

- (id)message
{
  return @"Exited geofence";
}

+ (id)actions
{
  v2 = +[CARDNDDiagnosticsService TTRURLforEvent:3];
  v3 = +[CRBulletin CARActionWithURL:v2 title:@"[Internal] File Radar"];
  v6 = v3;
  v4 = +[NSArray arrayWithObjects:&v6 count:1];

  return v4;
}

@end