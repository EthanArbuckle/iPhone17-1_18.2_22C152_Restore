@interface SAAlarmCreateCompleted
+ (id)createCompleted;
- (BOOL)requiresResponse;
- (NSURL)alarmId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmId:(id)a3;
@end

@implementation SAAlarmCreateCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"CreateCompleted";
}

+ (id)createCompleted
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

- (BOOL)requiresResponse
{
  return 0;
}

@end