@interface SAAlarmSnooze
+ (id)snooze;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)alarmIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmIds:(id)a3;
@end

@implementation SAAlarmSnooze

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Snooze";
}

+ (id)snooze
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)alarmIds
{
  return (NSArray *)AceObjectURLArrayForProperty(self, @"alarmIds");
}

- (void)setAlarmIds:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

- (BOOL)mutatingCommand
{
  return 1;
}

@end