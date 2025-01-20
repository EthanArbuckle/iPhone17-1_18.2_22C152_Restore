@interface TSAccessibilityKnobManipulator
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (id)tracker;
- (void)dealloc;
- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7;
@end

@implementation TSAccessibilityKnobManipulator

- (void)dealloc
{
  self->_tracker = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityKnobManipulator;
  [(TSAccessibilityKnobManipulator *)&v3 dealloc];
}

- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  self->_tracker = a5;
  id v13 = [a7 tmCoordinator];
  [v13 registerTrackerManipulator:self];
  [v13 takeControlWithTrackerManipulator:self];
  [a5 setCurrentPosition:x, y];
  id v14 = [a7 dynamicOperationController];
  [v14 beginOperation];
  [v14 startTransformingReps:[NSSet setWithObject:a6]];
  [v14 handleTrackerManipulator:self];

  self->_tracker = 0;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (id)tracker
{
  return self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

@end