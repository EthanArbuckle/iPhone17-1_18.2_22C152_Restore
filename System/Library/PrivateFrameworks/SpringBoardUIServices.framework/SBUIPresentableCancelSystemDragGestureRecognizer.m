@interface SBUIPresentableCancelSystemDragGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (SBUIPresentableCancelSystemDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (SBUIPresentableCancelSystemDragGestureRecognizerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation SBUIPresentableCancelSystemDragGestureRecognizer

- (SBUIPresentableCancelSystemDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIPresentableCancelSystemDragGestureRecognizer;
  v4 = [(SBUIPresentableCancelSystemDragGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(SBUIPresentableCancelSystemDragGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(SBUIPresentableCancelSystemDragGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(SBUIPresentableCancelSystemDragGestureRecognizer *)v5 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
  }
  return v5;
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

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ([(SBUIPresentableCancelSystemDragGestureRecognizer *)self state])
  {
    uint64_t v7 = 5;
  }
  else
  {
    v8 = [(SBUIPresentableCancelSystemDragGestureRecognizer *)self delegate];
    int v9 = [v8 gestureRecognizer:self shouldBeginWithTouches:v10 event:v6];

    if (v9) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 5;
    }
  }
  [(SBUIPresentableCancelSystemDragGestureRecognizer *)self setState:v7];
}

- (SBUIPresentableCancelSystemDragGestureRecognizerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPresentableCancelSystemDragGestureRecognizerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end