@interface SBFMouseButtonDownGestureRecognizer
- (BOOL)_isMouseButtonClickEvent:(__IOHIDEvent *)a3;
- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SBFMouseButtonDownGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFMouseButtonDownGestureRecognizer;
  id v6 = a4;
  [(SBFMouseButtonDownGestureRecognizer *)&v8 touchesBegan:a3 withEvent:v6];
  uint64_t v7 = objc_msgSend(v6, "_hidEvent", v8.receiver, v8.super_class);

  if ([(SBFMouseButtonDownGestureRecognizer *)self _isMouseButtonClickEvent:v7]) {
    [(SBFMouseButtonDownGestureRecognizer *)self _succesfullyRecognizeFromEvent:v7];
  }
  else {
    [(SBFMouseButtonDownGestureRecognizer *)self setState:5];
  }
}

- (void)_succesfullyRecognizeFromEvent:(__IOHIDEvent *)a3
{
  v4 = +[SBWakeLogger sharedInstance];
  [v4 wakeMayBegin:6 withTimestamp:IOHIDEventGetTimeStamp()];

  if (![(SBFMouseButtonDownGestureRecognizer *)self state])
  {
    [(SBFMouseButtonDownGestureRecognizer *)self setState:3];
  }
}

- (BOOL)_isMouseButtonClickEvent:(__IOHIDEvent *)a3
{
  return BKSHIDEventMatchingPredicate() != 0;
}

BOOL __64__SBFMouseButtonDownGestureRecognizer__isMouseButtonClickEvent___block_invoke()
{
  return IOHIDEventGetType() == 2;
}

@end