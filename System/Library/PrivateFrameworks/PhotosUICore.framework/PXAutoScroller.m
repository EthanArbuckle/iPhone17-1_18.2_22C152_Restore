@interface PXAutoScroller
- (BOOL)_isRepeating;
- (BOOL)autoscrollWithOffset:(CGPoint)a3;
- (CGPoint)_autoscrollDirection;
- (CGRect)visibleRectForScrollView:(id)a3;
- (PXAnonymousScrollView)scrollView;
- (PXAutoScroller)init;
- (PXAutoScroller)initWithTargetScrollView:(id)a3;
- (PXAutoScrollerDelegate)delegate;
- (double)_lastUpdateTimestamp;
- (double)_margin;
- (double)_maximumSpeed;
- (void)_setAutoscrollDirection:(CGPoint)a3;
- (void)_setLastUpdateTimestamp:(double)a3;
- (void)_setRepeating:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)startRepeating;
- (void)stop;
- (void)stopRepeating;
- (void)updateWithTimestamp:(double)a3;
- (void)updateWithUserInteractionLocation:(CGPoint)a3 inCoordinateSpace:(id)a4;
@end

@implementation PXAutoScroller

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.didAutoscrollWithTimestamp = objc_opt_respondsToSelector() & 1;
  }
}

- (PXAutoScroller)initWithTargetScrollView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXAutoScroller;
  v6 = [(PXAutoScroller *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scrollView, a3);
    *(_OWORD *)&v7->__margin = xmmword_1AB359DE0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)_setLastUpdateTimestamp:(double)a3
{
  self->__lastUpdateTimestamp = a3;
}

- (double)_lastUpdateTimestamp
{
  return self->__lastUpdateTimestamp;
}

- (BOOL)_isRepeating
{
  return self->__repeating;
}

- (CGPoint)_autoscrollDirection
{
  double x = self->__autoscrollDirection.x;
  double y = self->__autoscrollDirection.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)_maximumSpeed
{
  return self->__maximumSpeed;
}

- (double)_margin
{
  return self->__margin;
}

- (PXAutoScrollerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXAutoScrollerDelegate *)WeakRetained;
}

- (PXAnonymousScrollView)scrollView
{
  return self->_scrollView;
}

- (void)_setRepeating:(BOOL)a3
{
  if (self->__repeating != a3)
  {
    self->__repeating = a3;
    if (a3)
    {
      [(PXAutoScroller *)self _setLastUpdateTimestamp:0.0];
      [(PXAutoScroller *)self startRepeating];
    }
    else
    {
      [(PXAutoScroller *)self stopRepeating];
    }
  }
}

- (void)_setAutoscrollDirection:(CGPoint)a3
{
  if (a3.x != self->__autoscrollDirection.x || a3.y != self->__autoscrollDirection.y)
  {
    self->__autoscrollDirection = a3;
    BOOL v4 = a3.y != *(double *)(MEMORY[0x1E4F1DAD8] + 8) || a3.x != *MEMORY[0x1E4F1DAD8];
    [(PXAutoScroller *)self _setRepeating:v4];
  }
}

- (BOOL)autoscrollWithOffset:(CGPoint)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3.x, a3.y);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXAutoScroller.m", 104, @"Method %s is a responsibility of subclass %@", "-[PXAutoScroller autoscrollWithOffset:]", v7 object file lineNumber description];

  abort();
}

- (void)stopRepeating
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAutoScroller.m", 100, @"Method %s is a responsibility of subclass %@", "-[PXAutoScroller stopRepeating]", v6 object file lineNumber description];

  abort();
}

- (void)startRepeating
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXAutoScroller.m", 96, @"Method %s is a responsibility of subclass %@", "-[PXAutoScroller startRepeating]", v6 object file lineNumber description];

  abort();
}

- (CGRect)visibleRectForScrollView:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXAutoScroller.m", 92, @"Method %s is a responsibility of subclass %@", "-[PXAutoScroller visibleRectForScrollView:]", v8 object file lineNumber description];

  abort();
}

- (void)updateWithTimestamp:(double)a3
{
  if ([(PXAutoScroller *)self _isRepeating])
  {
    [(PXAutoScroller *)self _lastUpdateTimestamp];
    double v6 = v5;
    [(PXAutoScroller *)self _setLastUpdateTimestamp:a3];
    if (v6 > 0.0)
    {
      double v7 = a3 - v6;
      if (a3 - v6 < 0.0) {
        double v7 = 0.0;
      }
      double v24 = fmin(v7, 0.25);
      [(PXAutoScroller *)self _autoscrollDirection];
      float64_t v22 = v9;
      float64_t v23 = v8;
      [(PXAutoScroller *)self _margin];
      uint64_t v21 = v10;
      [(PXAutoScroller *)self _maximumSpeed];
      v11.f64[0] = v23;
      v11.f64[1] = v22;
      float64x2_t v12 = vdivq_f64(v11, (float64x2_t)vdupq_lane_s64(v21, 0));
      __asm { FMOV            V2.2D, #-1.0 }
      float64x2_t v18 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, v12), (int8x16_t)_Q2, (int8x16_t)v12);
      __asm { FMOV            V2.2D, #1.0 }
      if ([(PXAutoScroller *)self autoscrollWithOffset:vmulq_n_f64(vmulq_n_f64(vminnmq_f64(v18, _Q2), v20), v24)]&& self->_delegateRespondsTo.didAutoscrollWithTimestamp)
      {
        v25 = [(PXAutoScroller *)self delegate];
        [v25 autoScroller:self didAutoscrollWithTimestamp:a3];
      }
    }
  }
}

- (void)stop
{
}

- (void)updateWithUserInteractionLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  id v5 = a4;
  double v6 = [(PXAutoScroller *)self scrollView];
  [(PXAutoScroller *)self visibleRectForScrollView:v6];
  [(PXAutoScroller *)self _margin];
  v6;
  PXPointConvertFromCoordinateSpaceToCoordinateSpace();
}

- (PXAutoScroller)init
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXAutoScroller.m", 29, @"%s is not available as initializer", "-[PXAutoScroller init]");

  abort();
}

@end