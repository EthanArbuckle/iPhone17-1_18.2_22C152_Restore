@interface FMFUserNotificationCategories
+ (int)categoryType:(int)a3 messageDict:(id)a4;
+ (int)convertToCategory:(id)a3;
@end

@implementation FMFUserNotificationCategories

+ (int)convertToCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PUSH_INVITE_ACCEPT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GEOFENCE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GEOFENCE_TRIGGER"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GEOFENCE_RECEIVE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GEOFENCE_CONFIRMATION"])
  {
    int v4 = 5;
  }
  else if (([v3 isEqualToString:@"OFFER_LOCATION"] & 1) != 0 {
         || ([v3 isEqualToString:@"PUSH_OFFER_LOCATION"] & 1) != 0)
  }
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"INVITE_RESPONSE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"NOTIFY_FOUND"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (int)categoryType:(int)a3 messageDict:(id)a4
{
  if (a3 != 8) {
    return 0;
  }
  int v4 = [a4 objectForKeyedSubscript:@"deviceIdentifier"];
  if (v4) {
    int v5 = 1;
  }
  else {
    int v5 = 2;
  }

  return v5;
}

@end