@interface SAReminderUserActivityPayload
+ (id)userActivityPayload;
- (SAUserActivity)userActivity;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUserActivity:(id)a3;
@end

@implementation SAReminderUserActivityPayload

- (id)groupIdentifier
{
  return @"com.apple.ace.reminder";
}

- (id)encodedClassName
{
  return @"UserActivityPayload";
}

+ (id)userActivityPayload
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUserActivity)userActivity
{
  return (SAUserActivity *)AceObjectAceObjectForProperty(self, @"userActivity");
}

- (void)setUserActivity:(id)a3
{
}

@end