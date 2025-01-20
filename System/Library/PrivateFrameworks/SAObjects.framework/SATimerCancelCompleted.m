@interface SATimerCancelCompleted
+ (id)cancelCompleted;
- (BOOL)requiresResponse;
- (SATimerObject)timer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimer:(id)a3;
@end

@implementation SATimerCancelCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"CancelCompleted";
}

+ (id)cancelCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SATimerObject)timer
{
  return (SATimerObject *)AceObjectAceObjectForProperty(self, @"timer");
}

- (void)setTimer:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end