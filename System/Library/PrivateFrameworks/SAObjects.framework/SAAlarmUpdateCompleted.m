@interface SAAlarmUpdateCompleted
+ (id)updateCompleted;
- (BOOL)requiresResponse;
- (NSArray)alarmIds;
- (NSURL)alarmId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmId:(id)a3;
- (void)setAlarmIds:(id)a3;
@end

@implementation SAAlarmUpdateCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"UpdateCompleted";
}

+ (id)updateCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSURL)alarmId
{
  return (NSURL *)AceObjectURLForProperty(self, @"alarmId");
}

- (void)setAlarmId:(id)a3
{
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
  return 0;
}

@end