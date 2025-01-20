@interface SATimerPauseCompleted
+ (id)pauseCompleted;
- (BOOL)requiresResponse;
- (SATimerObject)timer;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTimer:(id)a3;
@end

@implementation SATimerPauseCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.timer";
}

- (id)encodedClassName
{
  return @"PauseCompleted";
}

+ (id)pauseCompleted
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