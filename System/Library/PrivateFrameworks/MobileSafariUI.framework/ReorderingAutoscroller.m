@interface ReorderingAutoscroller
- (CGRect)scrollableRect;
- (ReorderingAutoscroller)init;
- (ReorderingAutoscrollerDelegate)delegate;
- (UIEdgeInsets)autoscrollInsets;
- (double)maximumSpeed;
- (void)_autoscroll:(id)a3;
- (void)_setVelocity:(CGPoint)a3;
- (void)beginInteraction;
- (void)dealloc;
- (void)endInteraction;
- (void)setAutoscrollInsets:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setMaximumSpeed:(double)a3;
- (void)setScrollableRect:(CGRect)a3;
- (void)updateInteractionAtPoint:(CGPoint)a3;
@end

@implementation ReorderingAutoscroller

- (ReorderingAutoscroller)init
{
  v6.receiver = self;
  v6.super_class = (Class)ReorderingAutoscroller;
  v2 = [(ReorderingAutoscroller *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_maximumSpeed = 1.5;
    *(_OWORD *)&v2->_autoscrollInsets.top = defaultAutoscrollInsets;
    *(_OWORD *)&v2->_autoscrollInsets.bottom = *(_OWORD *)&qword_1E123E1A8;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(CADisplayLink *)self->_displayLink invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ReorderingAutoscroller;
  [(ReorderingAutoscroller *)&v3 dealloc];
}

- (void)beginInteraction
{
  self->_offsetError = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)updateInteractionAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double maximumSpeed = self->_maximumSpeed;
  double width = self->_scrollableRect.size.width;
  double height = self->_scrollableRect.size.height;
  double v9 = maximumSpeed * width;
  v10 = (double *)MEMORY[0x1E4F1DAD8];
  if (self->_autoscrollInsets.left > 0.0)
  {
    CGFloat v11 = self->_scrollableRect.origin.x;
    CGFloat v12 = self->_scrollableRect.origin.y;
    CGFloat v13 = self->_scrollableRect.size.height;
    if (x - CGRectGetMinX(*(CGRect *)(&width - 2)) < self->_autoscrollInsets.left)
    {
      CGFloat MinX = CGRectGetMinX(self->_scrollableRect);
      double left = self->_autoscrollInsets.left;
      double v16 = x - MinX - left;
LABEL_7:
      double v17 = v9 * v16 / left;
      goto LABEL_8;
    }
  }
  double v17 = *v10;
  if (self->_autoscrollInsets.right > 0.0 && CGRectGetMaxX(self->_scrollableRect) - x < self->_autoscrollInsets.right)
  {
    CGFloat MaxX = CGRectGetMaxX(self->_scrollableRect);
    double left = self->_autoscrollInsets.right;
    double v16 = x - MaxX + left;
    goto LABEL_7;
  }
LABEL_8:
  double v19 = maximumSpeed * height;
  if (self->_autoscrollInsets.top > 0.0 && y - CGRectGetMinY(self->_scrollableRect) < self->_autoscrollInsets.top)
  {
    CGFloat MinY = CGRectGetMinY(self->_scrollableRect);
    double top = self->_autoscrollInsets.top;
    double v22 = y - MinY - top;
LABEL_14:
    double v23 = v19 * v22 / top;
    goto LABEL_15;
  }
  double v23 = v10[1];
  if (self->_autoscrollInsets.bottom > 0.0 && CGRectGetMaxY(self->_scrollableRect) - y < self->_autoscrollInsets.bottom)
  {
    CGFloat MaxY = CGRectGetMaxY(self->_scrollableRect);
    double top = self->_autoscrollInsets.bottom;
    double v22 = y - MaxY + top;
    goto LABEL_14;
  }
LABEL_15:
  -[ReorderingAutoscroller _setVelocity:](self, "_setVelocity:", v17, v23);
}

- (void)endInteraction
{
}

- (void)_setVelocity:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  displayLink = self->_displayLink;
  if (fabs(a3.x) >= 0.01 || fabs(a3.y) >= 0.01)
  {
    if (!displayLink)
    {
      v8 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__autoscroll_];
      double v9 = self->_displayLink;
      self->_displayLink = v8;

      CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
      [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1638402];
      v10 = self->_displayLink;
      CGFloat v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v10 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];
    }
    self->_velocity.CGFloat x = x;
    self->_velocity.CGFloat y = y;
  }
  else
  {
    [(CADisplayLink *)displayLink invalidate];
    v7 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (void)_autoscroll:(id)a3
{
  [a3 duration];
  CGFloat v5 = self->_offsetError.x + self->_velocity.x * v4;
  CGFloat v6 = self->_offsetError.y + self->_velocity.y * v4;
  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 scale];
  double v9 = v8;

  double v11 = 0.0;
  __CGFloat y = 0.0;
  self->_offsetError.CGFloat x = modf(v5 * v9, &__y) / v9;
  self->_offsetError.CGFloat y = modf(v6 * v9, &v11) / v9;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reorderingAutoscroller:handleScroll:", self, __y / v9, v11 / v9);
}

- (ReorderingAutoscrollerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ReorderingAutoscrollerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGRect)scrollableRect
{
  double x = self->_scrollableRect.origin.x;
  double y = self->_scrollableRect.origin.y;
  double width = self->_scrollableRect.size.width;
  double height = self->_scrollableRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setScrollableRect:(CGRect)a3
{
  self->_scrollableRect = a3;
}

- (UIEdgeInsets)autoscrollInsets
{
  double top = self->_autoscrollInsets.top;
  double left = self->_autoscrollInsets.left;
  double bottom = self->_autoscrollInsets.bottom;
  double right = self->_autoscrollInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAutoscrollInsets:(UIEdgeInsets)a3
{
  self->_autoscrollInsets = a3;
}

- (double)maximumSpeed
{
  return self->_maximumSpeed;
}

- (void)setMaximumSpeed:(double)a3
{
  self->_double maximumSpeed = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end