@interface _UISwipeActionPanGestureRecognizer
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (_UISwipeActionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation _UISwipeActionPanGestureRecognizer

- (_UISwipeActionPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UISwipeActionPanGestureRecognizer;
  v4 = [(UIPanGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIPanGestureRecognizer *)v4 setAllowedScrollTypesMask:3];
    [(UIPanGestureRecognizer *)v5 _setiOSMacUseNonacceleratedDelta:1];
  }
  return v5;
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 _containsHIDPointerEvent])
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UISwipeActionPanGestureRecognizer;
    BOOL v8 = [(UIGestureRecognizer *)&v10 _shouldReceiveTouch:v6 withEvent:v7];
  }

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    BOOL v8 = -[UIPanGestureRecognizer _activeTouches]((id *)&self->super.super.super.isa);
    uint64_t v9 = [v8 count];

    if (v9) {
      [(UIGestureRecognizer *)self setState:5];
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)_UISwipeActionPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v10 touchesBegan:v6 withEvent:v7];
}

@end