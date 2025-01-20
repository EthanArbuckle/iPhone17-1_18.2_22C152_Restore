@interface TSAccessibilityKeyboardResizingManipulator
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (TSDResizeKnobTracker)_tracker;
- (id)tracker;
- (void)_setTracker:(id)a3;
- (void)dealloc;
- (void)resizeRep:(id)a3 byMovingResizingKnob:(id)a4 toUnscaledPosition:(CGPoint)a5 usingResizeKnobTracker:(id)a6 interactiveCanvasController:(id)a7;
@end

@implementation TSAccessibilityKeyboardResizingManipulator

- (void)dealloc
{
  [(TSAccessibilityKeyboardResizingManipulator *)self _setTracker:0];
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityKeyboardResizingManipulator;
  [(TSAccessibilityKeyboardResizingManipulator *)&v3 dealloc];
}

- (void)resizeRep:(id)a3 byMovingResizingKnob:(id)a4 toUnscaledPosition:(CGPoint)a5 usingResizeKnobTracker:(id)a6 interactiveCanvasController:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  -[TSAccessibilityKeyboardResizingManipulator _setTracker:](self, "_setTracker:", a6, a4);
  id v13 = [a7 tmCoordinator];
  [v13 registerTrackerManipulator:self];
  [v13 takeControlWithTrackerManipulator:self];
  [a6 setCurrentPosition:x, y];
  id v14 = [a7 dynamicOperationController];
  [v14 beginOperation];
  [v14 startTransformingReps:[NSSet setWithObject:a3]];
  [v14 handleTrackerManipulator:self];

  [(TSAccessibilityKeyboardResizingManipulator *)self _setTracker:0];
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

- (TSDResizeKnobTracker)_tracker
{
  return self->_tracker;
}

- (void)_setTracker:(id)a3
{
}

@end