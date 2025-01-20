@interface SAAlarmShowAndPerformAlarmAction
+ (id)showAndPerformAlarmAction;
- (BOOL)requiresResponse;
- (SAAlarmAlarmAction)alarmAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlarmAction:(id)a3;
@end

@implementation SAAlarmShowAndPerformAlarmAction

- (id)groupIdentifier
{
  return @"com.apple.ace.alarm";
}

- (id)encodedClassName
{
  return @"ShowAndPerformAlarmAction";
}

+ (id)showAndPerformAlarmAction
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

- (BOOL)requiresResponse
{
  return 0;
}

@end