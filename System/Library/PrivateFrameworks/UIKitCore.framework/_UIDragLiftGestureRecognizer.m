@interface _UIDragLiftGestureRecognizer
- (BOOL)_isForPointer;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (void)setIsForPointer:(BOOL)a3;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIDragLiftGestureRecognizer

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(UIGestureRecognizer *)self view];
    v6 = [v4 view];
    if (v5 == v6) {
      char v7 = 0;
    }
    else {
      char v7 = [v5 isDescendantOfView:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UIDragLiftGestureRecognizer;
  [(UILongPressGestureRecognizer *)&v14 touchesMoved:a3 withEvent:a4];
  if ([(UIGestureRecognizer *)self _hasUnmetFailureRequirements])
  {
    [(UILongPressGestureRecognizer *)self startPoint];
    double v6 = v5;
    double v8 = v7;
    [(UILongPressGestureRecognizer *)self centroid];
    double v11 = sqrt((v9 - v6) * (v9 - v6) + (v10 - v8) * (v10 - v8));
    [(UILongPressGestureRecognizer *)self allowableMovement];
    if (v11 > v12)
    {
      if ([(UIGestureRecognizer *)self state] < UIGestureRecognizerStateBegan)
      {
        [(UIGestureRecognizer *)self setState:5];
      }
      else
      {
        [(UIGestureRecognizer *)self setState:4];
        v13 = [(UIGestureRecognizer *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v13 _gestureRecognizerFailed:self];
        }
      }
    }
  }
}

- (BOOL)_isForPointer
{
  return 0;
}

- (void)setIsForPointer:(BOOL)a3
{
  self->_isForPointer = a3;
}

@end