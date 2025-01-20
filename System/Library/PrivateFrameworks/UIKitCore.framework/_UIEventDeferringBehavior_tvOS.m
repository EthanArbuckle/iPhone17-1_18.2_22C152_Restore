@interface _UIEventDeferringBehavior_tvOS
- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement;
@end

@implementation _UIEventDeferringBehavior_tvOS

- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement
{
  return 1;
}

@end