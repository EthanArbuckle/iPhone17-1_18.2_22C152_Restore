@interface SATimerShowTimerAndPerformAction
+ (id)showTimerAndPerformAction;
- (SATimerTimerAction)timerAction;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimerAction:(id)a3;
@end

@implementation SATimerShowTimerAndPerformAction

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"ShowTimerAndPerformAction";
}

+ (id)showTimerAndPerformAction
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

@end