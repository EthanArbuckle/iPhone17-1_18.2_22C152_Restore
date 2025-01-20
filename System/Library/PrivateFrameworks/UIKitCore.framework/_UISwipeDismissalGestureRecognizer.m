@interface _UISwipeDismissalGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
- (CGPoint)originalTouchPoint;
- (_UISwipeDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)allowableMovement;
- (void)reset;
- (void)setAllowableMovement:(double)a3;
- (void)setOriginalTouchPoint:(CGPoint)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UISwipeDismissalGestureRecognizer

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (_UISwipeDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UISwipeDismissalGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(_UISwipeDismissalGestureRecognizer *)v4 setAllowableMovement:10.0];
    [(UIGestureRecognizer *)v5 setDelaysTouchesBegan:1];
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:1];
  }
  return v5;
}

- (void)setAllowableMovement:(double)a3
{
  self->_allowableMovement = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = [a3 anyObject];
  v5 = [(UIGestureRecognizer *)self view];
  [v7 locationInView:v5];
  -[_UISwipeDismissalGestureRecognizer setOriginalTouchPoint:](self, "setOriginalTouchPoint:");

  v6 = [(UIGestureRecognizer *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v6 gestureRecognizerShouldDismissForTouchDown:self])
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v18 = [a3 anyObject];
  v5 = [(UIGestureRecognizer *)self view];
  [v18 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  [(_UISwipeDismissalGestureRecognizer *)self originalTouchPoint];
  double v11 = v10;
  [(_UISwipeDismissalGestureRecognizer *)self originalTouchPoint];
  double v13 = v7 - v12;
  if (v13 >= 0.0) {
    double v14 = v13;
  }
  else {
    double v14 = -v13;
  }
  [(_UISwipeDismissalGestureRecognizer *)self allowableMovement];
  if (v14 > v15
    || (v9 - v11 >= 0.0 ? (double v16 = v9 - v11) : (double v16 = -(v9 - v11)),
        [(_UISwipeDismissalGestureRecognizer *)self allowableMovement],
        v16 > v17))
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = [(UIGestureRecognizer *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v6 gestureRecognizerShouldDismissForTouchUp:self] & 1) != 0)
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)reset
{
  -[_UISwipeDismissalGestureRecognizer setOriginalTouchPoint:](self, "setOriginalTouchPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  v3.receiver = self;
  v3.super_class = (Class)_UISwipeDismissalGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
}

- (double)allowableMovement
{
  return self->_allowableMovement;
}

- (CGPoint)originalTouchPoint
{
  double x = self->_originalTouchPoint.x;
  double y = self->_originalTouchPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalTouchPoint:(CGPoint)a3
{
  self->_originalTouchPoint = a3;
}

@end