@interface SATimerShowAndPerformTimerAction
+ (id)showAndPerformTimerAction;
- (BOOL)requiresResponse;
- (SATimerTimerAction)timerAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimerAction:(id)a3;
@end

@implementation SATimerShowAndPerformTimerAction

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"ShowAndPerformTimerAction";
}

+ (id)showAndPerformTimerAction
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SATimerTimerAction)timerAction
{
  return (SATimerTimerAction *)AceObjectAceObjectForProperty(self, @"timerAction");
}

- (void)setTimerAction:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end