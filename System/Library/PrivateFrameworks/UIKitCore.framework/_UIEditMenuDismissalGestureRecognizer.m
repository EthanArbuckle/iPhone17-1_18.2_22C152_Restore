@interface _UIEditMenuDismissalGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
+ (BOOL)canHandleEventForPassthrough:(id)a3;
- (BOOL)_affectedByGesture:(id)a3;
- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (_UIEditMenuDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UIEditMenuDismissalGestureRecognizerDelegate)interactionDelegate;
- (void)_scrollingChangedWithEvent:(id)a3;
- (void)_transformChangedWithEvent:(id)a3;
- (void)setInteractionDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIEditMenuDismissalGestureRecognizer

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (_UIEditMenuDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(UIGestureRecognizer *)v5 _setAcceptsFailureRequiments:0];
    *((unsigned char *)&v5->super._gestureFlags + 8) &= ~8u;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesMoved:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:2];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesEnded:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:3];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
  [(UIGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:4];
}

- (BOOL)_shouldReceiveTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(_UIEditMenuDismissalGestureRecognizer *)self interactionDelegate];
  if (v8)
  {
    v9 = [(UIGestureRecognizer *)self view];
    [v6 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    v14 = [(_UIEditMenuDismissalGestureRecognizer *)self interactionDelegate];
    char v15 = objc_msgSend(v14, "dismissalGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v7, v11, v13);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() canHandleEventForPassthrough:v4])
  {
    objc_super v5 = [(_UIEditMenuDismissalGestureRecognizer *)self interactionDelegate];
    if (v5)
    {
      if ([v4 type] == 10)
      {
        id v6 = v4;
        id v7 = [(UIGestureRecognizer *)self view];
        [v6 locationInView:v7];
        double v9 = v8;
        double v11 = v10;

        unsigned __int8 v12 = objc_msgSend(v5, "dismissalGestureRecognizer:shouldInteractAtLocation:withEvent:", self, v6, v9, v11);
      }
      else
      {
        unsigned __int8 v12 = 1;
      }
    }
    else
    {
      unsigned __int8 v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIEditMenuDismissalGestureRecognizer;
    unsigned __int8 v12 = [(UIGestureRecognizer *)&v14 shouldReceiveEvent:v4];
  }

  return v12;
}

- (void)_scrollingChangedWithEvent:(id)a3
{
  id v5 = a3;
  if ([v5 phase] == 2)
  {
    uint64_t v4 = 1;
  }
  else if ([v5 phase] == 5)
  {
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateEnded) {
      goto LABEL_10;
    }
    uint64_t v4 = 4;
  }
  else if ([v5 phase] == 3)
  {
    uint64_t v4 = 2;
  }
  else
  {
    uint64_t v4 = 3;
  }
  [(UIGestureRecognizer *)self setState:v4];
LABEL_10:
}

- (void)_transformChangedWithEvent:(id)a3
{
  unint64_t v4 = [a3 phase] - 1;
  if (v4 <= 3)
  {
    uint64_t v5 = qword_186B9D6C0[v4];
    [(UIGestureRecognizer *)self setState:v5];
  }
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

+ (BOOL)canHandleEventForPassthrough:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 type] || objc_msgSend(v3, "type") == 10 || objc_msgSend(v3, "type") == 14;

  return v4;
}

- (_UIEditMenuDismissalGestureRecognizerDelegate)interactionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionDelegate);
  return (_UIEditMenuDismissalGestureRecognizerDelegate *)WeakRetained;
}

- (void)setInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end