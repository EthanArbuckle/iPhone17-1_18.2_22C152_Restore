@interface CRDNDGeofenceAlert
+ (id)actions;
+ (id)alertForEnteringGeofence:(BOOL)a3;
- (id)message;
- (id)title;
@end

@implementation CRDNDGeofenceAlert

+ (id)alertForEnteringGeofence:(BOOL)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)title
{
  return 0;
}

- (id)message
{
  return 0;
}

+ (id)actions
{
  return &__NSArray0__struct;
}

@end