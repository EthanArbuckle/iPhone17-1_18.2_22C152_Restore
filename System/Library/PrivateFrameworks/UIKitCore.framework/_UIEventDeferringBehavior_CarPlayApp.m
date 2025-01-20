@interface _UIEventDeferringBehavior_CarPlayApp
- (BOOL)shouldAllowFallbackWindowForEnvironment:(id)a3;
@end

@implementation _UIEventDeferringBehavior_CarPlayApp

- (BOOL)shouldAllowFallbackWindowForEnvironment:(id)a3
{
  return _UIEventDeferringBehaviorCarPlayShouldAllowFallbackWindowForEnvironment(self, a3);
}

@end