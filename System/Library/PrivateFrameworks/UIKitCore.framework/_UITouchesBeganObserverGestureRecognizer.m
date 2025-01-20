@interface _UITouchesBeganObserverGestureRecognizer
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (void)initWithTarget:(uint64_t)a3 action:(uint64_t)a4 name:;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UITouchesBeganObserverGestureRecognizer

- (void)initWithTarget:(uint64_t)a3 action:(uint64_t)a4 name:
{
  if (!a1) {
    return 0;
  }
  v8.receiver = a1;
  v8.super_class = (Class)_UITouchesBeganObserverGestureRecognizer;
  id v5 = objc_msgSendSuper2(&v8, sel_initWithTarget_action_, a2, a3);
  v6 = v5;
  if (v5)
  {
    [v5 setName:a4];
    [v6 setAllowedTouchTypes:&unk_1ED3EFD40];
    [v6 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [v6 setCancelsTouchesInView:0];
    [v6 setDelaysTouchesBegan:0];
    [v6 setDelaysTouchesEnded:0];
    [v6 _setAcceptsFailureRequiments:0];
  }
  return v6;
}

- (BOOL)_affectedByGesture:(id)a3
{
  return 0;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return [a3 type] == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

@end