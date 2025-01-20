@interface CRLCanvasRepAccessibilityRotationTrackerManipulator
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)doneWithDynamicOperation;
- (BOOL)readyToEndOperation;
- (CRLCanvasLayoutManipulatingTracker)rotationTracker;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (void)setDoneWithDynamicOperation:(BOOL)a3;
- (void)setRotationTracker:(id)a3;
@end

@implementation CRLCanvasRepAccessibilityRotationTrackerManipulator

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return [(CRLCanvasRepAccessibilityRotationTrackerManipulator *)self rotationTracker];
}

- (BOOL)readyToEndOperation
{
  return [(CRLCanvasRepAccessibilityRotationTrackerManipulator *)self doneWithDynamicOperation];
}

- (CRLCanvasLayoutManipulatingTracker)rotationTracker
{
  return self->_rotationTracker;
}

- (void)setRotationTracker:(id)a3
{
}

- (BOOL)doneWithDynamicOperation
{
  return self->_doneWithDynamicOperation;
}

- (void)setDoneWithDynamicOperation:(BOOL)a3
{
  self->_doneWithDynamicOperation = a3;
}

- (void).cxx_destruct
{
}

@end