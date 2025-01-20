@interface SAAlarmCreate
+ (id)create;
- (BOOL)requiresResponse;
- (SAAlarmObject)alarmToCreate;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmToCreate:(id)a3;
@end

@implementation SAAlarmCreate

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Create";
}

+ (id)create
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAlarmObject)alarmToCreate
{
  return (SAAlarmObject *)AceObjectAceObjectForProperty(self, @"alarmToCreate");
}

- (void)setAlarmToCreate:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end