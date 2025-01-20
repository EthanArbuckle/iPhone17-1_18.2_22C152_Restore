@interface SAAlarmDelete
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSArray)alarmIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmIds:(id)a3;
@end

@implementation SAAlarmDelete

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"Delete";
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