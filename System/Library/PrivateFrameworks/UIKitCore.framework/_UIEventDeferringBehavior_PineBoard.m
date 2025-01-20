@interface _UIEventDeferringBehavior_PineBoard
- (BOOL)shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring;
- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement;
@end

@implementation _UIEventDeferringBehavior_PineBoard

- (BOOL)shouldEvaluateEventDeferringForAnyRemoteViewControllerWindowMovement
{
  return 1;
}

- (BOOL)shouldConsiderKeyWindowChangesForRemoteViewControllerAutomaticEventDeferring
{
  return 1;
}

@end