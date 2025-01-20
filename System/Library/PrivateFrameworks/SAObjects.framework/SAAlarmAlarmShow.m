@interface SAAlarmAlarmShow
+ (id)alarmShow;
- (NSArray)alarmIds;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmIds:(id)a3;
@end

@implementation SAAlarmAlarmShow

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"AlarmShow";
}

+ (id)alarmShow
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

@end