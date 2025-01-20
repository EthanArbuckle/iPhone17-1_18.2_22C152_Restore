@interface SUSplitView
- (BOOL)isVertical;
- (SUSplitView)initWithFrame:(CGRect)a3;
- (UIView)firstView;
- (UIView)secondView;
- (double)_minimumPaneSizeForLayout;
- (double)minimumPaneSize;
- (double)splitPosition;
- (int64_t)layoutType;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setFirstView:(id)a3;
- (void)setLayoutType:(int64_t)a3;
- (void)setMinimumPaneSize:(double)a3;
- (void)setSecondView:(id)a3;
- (void)setSplitPosition:(double)a3;
- (void)setVertical:(BOOL)a3;
@end

@implementation SUSplitView

- (SUSplitView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUSplitView;
  result = -[SUSplitView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_minimumPaneSize = 30.0;
    result->_layoutType = 2;
    result->_vertical = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SUSplitView;
  [(SUSplitView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  [(SUSplitView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(SUSplitView *)self _minimumPaneSizeForLayout];
  double splitPosition = self->_splitPosition;
  if (self->_layoutType == 1)
  {
    double v9 = 0.0;
    double v10 = fmax(splitPosition, 0.0);
    if (v10 > 1.0) {
      double v10 = 1.0;
    }
    if (self->_vertical)
    {
      double v11 = floor(v6 * v10);
      if (v11 >= v7) {
        double v12 = v11;
      }
      else {
        double v12 = v7;
      }
      double v6 = v6 - v12;
      double v13 = v12;
      double v14 = v4;
    }
    else
    {
      double v9 = floor(v4 * v10);
      double v4 = v4 - v9;
      double v12 = 0.0;
      double v13 = v6;
      double v14 = v9;
    }
  }
  else
  {
    double v15 = fmax(floor(splitPosition), 0.0);
    if (v15 >= v7) {
      double v7 = v15;
    }
    double v16 = v4 - v7;
    if (self->_vertical) {
      double v13 = v7;
    }
    else {
      double v13 = v6;
    }
    if (self->_vertical)
    {
      double v6 = v6 - v7;
      double v9 = 0.0;
    }
    else
    {
      double v9 = v7;
    }
    if (self->_vertical) {
      double v12 = v7;
    }
    else {
      double v12 = 0.0;
    }
    if (self->_vertical)
    {
      double v16 = v4;
      double v14 = v4;
    }
    else
    {
      double v14 = v7;
    }
    double v4 = v16;
  }
  -[UIView setFrame:](self->_firstView, "setFrame:", 0.0, 0.0, v14, v13);
  -[UIView setFrame:](self->_secondView, "setFrame:", v9, v12, v4, v6);
  Mutable = CGPathCreateMutable();
  CGFloat v18 = *MEMORY[0x263F00148];
  CGFloat v19 = *(double *)(MEMORY[0x263F00148] + 8);
  v22.origin.x = *(CGFloat *)MEMORY[0x263F00148];
  v22.origin.y = v19;
  v22.size.width = v14;
  v22.size.height = v13;
  CGPathAddRect(Mutable, 0, v22);
  [(CALayer *)[(UIView *)self->_firstView layer] setShadowPath:Mutable];
  CGPathRelease(Mutable);
  v20 = CGPathCreateMutable();
  v23.origin.x = v18;
  v23.origin.y = v19;
  v23.size.width = v4;
  v23.size.height = v6;
  CGPathAddRect(v20, 0, v23);
  [(CALayer *)[(UIView *)self->_secondView layer] setShadowPath:v20];

  CGPathRelease(v20);
}

- (void)setFirstView:(id)a3
{
  firstView = self->_firstView;
  if (firstView != a3)
  {
    if (firstView)
    {
      [(UIView *)firstView removeFromSuperview];
      double v6 = self->_firstView;
    }
    else
    {
      double v6 = 0;
    }

    double v7 = (UIView *)a3;
    self->_firstView = v7;
    if (v7) {
      [(SUSplitView *)self addSubview:v7];
    }
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (void)setLayoutType:(int64_t)a3
{
  if (self->_layoutType != a3)
  {
    self->_layoutType = a3;
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (void)setMinimumPaneSize:(double)a3
{
  if (self->_minimumPaneSize != a3)
  {
    self->_minimumPaneSize = a3;
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (void)setSecondView:(id)a3
{
  secondView = self->_secondView;
  if (secondView != a3)
  {
    if (secondView)
    {
      [(UIView *)secondView removeFromSuperview];
      double v6 = self->_secondView;
    }
    else
    {
      double v6 = 0;
    }

    double v7 = (UIView *)a3;
    self->_secondView = v7;
    if (v7) {
      [(SUSplitView *)self addSubview:v7];
    }
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (void)setSplitPosition:(double)a3
{
  if (self->_splitPosition != a3)
  {
    self->_double splitPosition = a3;
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (void)setVertical:(BOOL)a3
{
  if (self->_vertical != a3)
  {
    self->_vertical = a3;
    [(SUSplitView *)self setNeedsLayout];
  }
}

- (double)_minimumPaneSizeForLayout
{
  double minimumPaneSize = self->_minimumPaneSize;
  if (minimumPaneSize > 0.00000011920929 && minimumPaneSize < 1.0)
  {
    [(SUSplitView *)self bounds];
    if (self->_vertical) {
      double v7 = v6;
    }
    else {
      double v7 = v5;
    }
    return minimumPaneSize * v7;
  }
  return minimumPaneSize;
}

- (UIView)firstView
{
  return self->_firstView;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (double)minimumPaneSize
{
  return self->_minimumPaneSize;
}

- (UIView)secondView
{
  return self->_secondView;
}

- (double)splitPosition
{
  return self->_splitPosition;
}

- (BOOL)isVertical
{
  return self->_vertical;
}

@end