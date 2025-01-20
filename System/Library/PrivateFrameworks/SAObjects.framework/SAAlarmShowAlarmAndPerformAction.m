@interface SAAlarmShowAlarmAndPerformAction
+ (id)showAlarmAndPerformAction;
- (SAAlarmAlarmAction)alarmAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmAction:(id)a3;
@end

@implementation SAAlarmShowAlarmAndPerformAction

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"ShowAlarmAndPerformAction";
}

+ (id)showAlarmAndPerformAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAAlarmAlarmAction)alarmAction
{
  return (SAAlarmAlarmAction *)AceObjectAceObjectForProperty(self, @"alarmAction");
}

- (void)setAlarmAction:(id)a3
{
}

@end