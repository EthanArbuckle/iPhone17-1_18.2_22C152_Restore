@interface PXTouchingUIGestureRecognizer
- (BOOL)_didBegin;
- (BOOL)_willBegin;
- (CGPoint)_initialPointInView;
- (CGPoint)initialLocationInView:(id)a3;
- (PXTouchingUIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (PXTouchingUIGestureRecognizerDelegate)touchDelegate;
- (double)maximumTouchMovement;
- (double)minimumTouchDuration;
- (unint64_t)_beginRequestID;
- (unint64_t)_touchCount;
- (void)_beginWithRequestID:(unint64_t)a3;
- (void)_decrementTouchesBy:(unint64_t)a3;
- (void)_incrementTouchesBy:(unint64_t)a3;
- (void)_setBeginRequestID:(unint64_t)a3;
- (void)_setDidBegin:(BOOL)a3;
- (void)_setInitialPointInView:(CGPoint)a3;
- (void)_setTouchCount:(unint64_t)a3;
- (void)_setWillBegin:(BOOL)a3;
- (void)reset;
- (void)setEnabled:(BOOL)a3;
- (void)setMaximumTouchMovement:(double)a3;
- (void)setMinimumTouchDuration:(double)a3;
- (void)setState:(int64_t)a3;
- (void)setTouchDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PXTouchingUIGestureRecognizer

- (void)setTouchDelegate:(id)a3
{
}

- (void)setMaximumTouchMovement:(double)a3
{
  self->_maximumTouchMovement = a3;
}

- (double)maximumTouchMovement
{
  return self->_maximumTouchMovement;
}

- (PXTouchingUIGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PXTouchingUIGestureRecognizer;
  result = [(PXTouchingUIGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_maximumTouchMovement = 1.79769313e308;
    result->_minimumTouchDuration = 0.0;
  }
  return result;
}

- (void).cxx_destruct
{
}

- (void)_setInitialPointInView:(CGPoint)a3
{
  self->__initialPointInView = a3;
}

- (CGPoint)_initialPointInView
{
  double x = self->__initialPointInView.x;
  double y = self->__initialPointInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)_didBegin
{
  return self->__didBegin;
}

- (BOOL)_willBegin
{
  return self->__willBegin;
}

- (void)_setBeginRequestID:(unint64_t)a3
{
  self->__beginRequestID = a3;
}

- (unint64_t)_beginRequestID
{
  return self->__beginRequestID;
}

- (unint64_t)_touchCount
{
  return self->__touchCount;
}

- (PXTouchingUIGestureRecognizerDelegate)touchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touchDelegate);
  return (PXTouchingUIGestureRecognizerDelegate *)WeakRetained;
}

- (void)setMinimumTouchDuration:(double)a3
{
  self->_minimumTouchDuration = a3;
}

- (double)minimumTouchDuration
{
  return self->_minimumTouchDuration;
}

- (void)reset
{
}

- (void)setState:(int64_t)a3
{
  if (unint64_t)a3 <= 5 && ((0x3Bu >> a3))
  {
    uint64_t v5 = (6u >> a3) & 1;
    [(PXTouchingUIGestureRecognizer *)self _setWillBegin:v5];
    v6.receiver = self;
    v6.super_class = (Class)PXTouchingUIGestureRecognizer;
    [(PXTouchingUIGestureRecognizer *)&v6 setState:a3];
    [(PXTouchingUIGestureRecognizer *)self _setDidBegin:v5];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXTouchingUIGestureRecognizer;
    [(PXTouchingUIGestureRecognizer *)&v6 setState:a3];
  }
}

- (void)_setDidBegin:(BOOL)a3
{
  if (self->__didBegin != a3)
  {
    BOOL v3 = a3;
    self->__didBegin = a3;
    uint64_t v5 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
    if (v3)
    {
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      id v8 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
      [v8 touchingUIGestureRecognizerDidBeginTouching:self];
    }
    else
    {
      int v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0) {
        return;
      }
      id v8 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
      [v8 touchingUIGestureRecognizerDidEndTouching:self];
    }
  }
}

- (void)_setWillBegin:(BOOL)a3
{
  if (self->__willBegin != a3)
  {
    BOOL v3 = a3;
    self->__willBegin = a3;
    uint64_t v5 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
    if (v3)
    {
      char v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) == 0) {
        return;
      }
      id v8 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
      [v8 touchingUIGestureRecognizerWillBeginTouching:self];
    }
    else
    {
      int v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0) {
        return;
      }
      id v8 = [(PXTouchingUIGestureRecognizer *)self touchDelegate];
      [v8 touchingUIGestureRecognizerWillEndTouching:self];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXTouchingUIGestureRecognizer;
  -[PXTouchingUIGestureRecognizer setEnabled:](&v5, sel_setEnabled_);
  if (!a3) {
    [(PXTouchingUIGestureRecognizer *)self _setTouchCount:0];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PXTouchingUIGestureRecognizer;
  [(PXTouchingUIGestureRecognizer *)&v14 touchesMoved:a3 withEvent:a4];
  objc_super v5 = [(PXTouchingUIGestureRecognizer *)self view];
  [(PXTouchingUIGestureRecognizer *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  [(PXTouchingUIGestureRecognizer *)self _initialPointInView];
  double v12 = sqrt((v9 - v11) * (v9 - v11) + (v7 - v10) * (v7 - v10));
  [(PXTouchingUIGestureRecognizer *)self maximumTouchMovement];
  if (v12 > v13) {
    [(PXTouchingUIGestureRecognizer *)self setState:4];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  [(PXTouchingUIGestureRecognizer *)self setState:4];
  uint64_t v6 = [v5 count];

  [(PXTouchingUIGestureRecognizer *)self _decrementTouchesBy:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(PXTouchingUIGestureRecognizer *)self _decrementTouchesBy:v5];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v5 = [a3 count];
  [(PXTouchingUIGestureRecognizer *)self _incrementTouchesBy:v5];
}

- (void)_beginWithRequestID:(unint64_t)a3
{
  if ([(PXTouchingUIGestureRecognizer *)self _beginRequestID] == a3)
  {
    [(PXTouchingUIGestureRecognizer *)self setState:1];
  }
}

- (void)_setTouchCount:(unint64_t)a3
{
  unint64_t touchCount = self->__touchCount;
  if (touchCount != a3)
  {
    self->__unint64_t touchCount = a3;
    if (a3)
    {
      if (touchCount) {
        return;
      }
      uint64_t v5 = [(PXTouchingUIGestureRecognizer *)self view];
      [(PXTouchingUIGestureRecognizer *)self locationInView:v5];
      double v7 = v6;
      double v9 = v8;

      -[PXTouchingUIGestureRecognizer _setInitialPointInView:](self, "_setInitialPointInView:", v7, v9);
      [(PXTouchingUIGestureRecognizer *)self minimumTouchDuration];
      if (v10 > 0.0)
      {
        unint64_t v11 = [(PXTouchingUIGestureRecognizer *)self _beginRequestID] + 1;
        [(PXTouchingUIGestureRecognizer *)self _setBeginRequestID:v11];
        [(PXTouchingUIGestureRecognizer *)self minimumTouchDuration];
        dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __48__PXTouchingUIGestureRecognizer__setTouchCount___block_invoke;
        v16[3] = &unk_1E5DD08D8;
        v16[4] = self;
        v16[5] = v11;
        dispatch_after(v13, MEMORY[0x1E4F14428], v16);
        return;
      }
      objc_super v14 = self;
      uint64_t v15 = 1;
    }
    else
    {
      [(PXTouchingUIGestureRecognizer *)self _setBeginRequestID:[(PXTouchingUIGestureRecognizer *)self _beginRequestID] + 1];
      objc_super v14 = self;
      uint64_t v15 = 3;
    }
    [(PXTouchingUIGestureRecognizer *)v14 setState:v15];
  }
}

uint64_t __48__PXTouchingUIGestureRecognizer__setTouchCount___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginWithRequestID:*(void *)(a1 + 40)];
}

- (void)_decrementTouchesBy:(unint64_t)a3
{
  if ([(PXTouchingUIGestureRecognizer *)self _touchCount] >= a3) {
    unint64_t v5 = [(PXTouchingUIGestureRecognizer *)self _touchCount] - a3;
  }
  else {
    unint64_t v5 = 0;
  }
  [(PXTouchingUIGestureRecognizer *)self _setTouchCount:v5];
}

- (void)_incrementTouchesBy:(unint64_t)a3
{
  unint64_t v4 = [(PXTouchingUIGestureRecognizer *)self _touchCount] + a3;
  [(PXTouchingUIGestureRecognizer *)self _setTouchCount:v4];
}

- (CGPoint)initialLocationInView:(id)a3
{
  id v4 = a3;
  [(PXTouchingUIGestureRecognizer *)self _initialPointInView];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(PXTouchingUIGestureRecognizer *)self view];
  objc_msgSend(v4, "convertPoint:fromView:", v9, v6, v8);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double y = v15;
  result.double x = v14;
  return result;
}

@end