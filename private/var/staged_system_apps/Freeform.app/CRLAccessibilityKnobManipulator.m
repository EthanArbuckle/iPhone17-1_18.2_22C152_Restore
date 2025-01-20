@interface CRLAccessibilityKnobManipulator
- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3;
- (BOOL)readyToEndOperation;
- (CRLCanvasLayoutManipulatingTracker)tracker;
- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7;
@end

@implementation CRLAccessibilityKnobManipulator

- (void)performMoveOfKnob:(id)a3 toUnscaledPosition:(CGPoint)a4 withTracker:(id)a5 rep:(id)a6 andICC:(id)a7
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  objc_storeStrong(&self->_tracker, a5);
  v17 = [v16 crlaxTarget];
  v18 = [v17 tmCoordinator];

  [v18 registerTrackerManipulator:self];
  [v18 takeControlWithTrackerManipulator:self];
  uint64_t v19 = objc_opt_class();
  v20 = sub_1002469D0(v19, v14);
  [v20 setCurrentPosition:x, y];

  v21 = [v16 crlaxTarget];
  v22 = [v21 dynamicOperationController];

  [v22 beginOperation];
  id v23 = objc_alloc((Class)NSMutableSet);
  v24 = +[NSSet setWithObject:v15];
  id v25 = [v23 initWithSet:v24];

  v26 = [v15 crlaxTarget];
  v27 = [v26 additionalRepsToResize];
  [v25 unionSet:v27];

  [v22 startTransformingReps:v25];
  v28 = [v14 crlaxTarget];
  [v28 beginMovingKnob];

  char v33 = 0;
  id v29 = v14;
  v30 = (objc_class *)objc_opt_class();
  uint64_t v31 = __CRLAccessibilityCastAsClass(v30, (uint64_t)v29, 1, &v33);
  if (v33) {
    abort();
  }
  v32 = (void *)v31;

  [v13 crlaxPosition];
  [v32 moveKnobToCanvasPosition:];

  [v22 handleTrackerManipulator:self];
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return 1;
}

- (void).cxx_destruct
{
}

@end