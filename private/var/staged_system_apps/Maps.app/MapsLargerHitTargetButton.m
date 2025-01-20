@interface MapsLargerHitTargetButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIEdgeInsets)touchInsets;
- (void)_debugVisualizeTouchInsets;
- (void)layoutSubviews;
- (void)setTouchInsets:(UIEdgeInsets)a3;
@end

@implementation MapsLargerHitTargetButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MapsLargerHitTargetButton *)self bounds];
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double v10 = v9 + left;
  double v12 = v11 + top;
  double v14 = v13 - (left + self->_touchInsets.right);
  double v16 = v15 - (top + self->_touchInsets.bottom);
  CGFloat v17 = x;
  CGFloat v18 = y;

  return CGRectContainsPoint(*(CGRect *)&v10, *(CGPoint *)&v17);
}

- (void)_debugVisualizeTouchInsets
{
  if (!self->_debugInsetsView)
  {
    id v3 = objc_alloc((Class)UIView);
    [(MapsLargerHitTargetButton *)self bounds];
    v4 = [v3 initWithFrame:];
    debugInsetsView = self->_debugInsetsView;
    self->_debugInsetsView = v4;

    [(UIView *)self->_debugInsetsView setAutoresizingMask:0];
    [(UIView *)self->_debugInsetsView setUserInteractionEnabled:0];
    v6 = +[UIColor redColor];
    id v7 = [v6 colorWithAlphaComponent:0.600000024];
    id v8 = [v7 CGColor];
    double v9 = [(UIView *)self->_debugInsetsView layer];
    [v9 setBorderColor:v8];

    double v10 = [(UIView *)self->_debugInsetsView layer];
    [v10 setBorderWidth:1.0];

    [(MapsLargerHitTargetButton *)self addSubview:self->_debugInsetsView];
    id v11 = objc_alloc((Class)UIView);
    [(MapsLargerHitTargetButton *)self bounds];
    double v12 = [v11 initWithFrame:];
    debugFrameView = self->_debugFrameView;
    self->_debugFrameView = v12;

    [(UIView *)self->_debugFrameView setAutoresizingMask:0];
    [(UIView *)self->_debugFrameView setUserInteractionEnabled:0];
    double v14 = +[UIColor redColor];
    double v15 = [v14 colorWithAlphaComponent:0.400000006];
    [(UIView *)self->_debugFrameView setBackgroundColor:v15];

    double v16 = self->_debugFrameView;
    [(MapsLargerHitTargetButton *)self addSubview:v16];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MapsLargerHitTargetButton;
  [(MapsLargerHitTargetButton *)&v7 layoutSubviews];
  if (self->_debugInsetsView)
  {
    [(MapsLargerHitTargetButton *)self bounds];
    -[UIView setFrame:](self->_debugInsetsView, "setFrame:", v3 + self->_touchInsets.left, v4 + self->_touchInsets.top, v5 - (self->_touchInsets.left + self->_touchInsets.right), v6 - (self->_touchInsets.top + self->_touchInsets.bottom));
    [(MapsLargerHitTargetButton *)self bounds];
    -[UIView setFrame:](self->_debugFrameView, "setFrame:");
  }
}

- (UIEdgeInsets)touchInsets
{
  double top = self->_touchInsets.top;
  double left = self->_touchInsets.left;
  double bottom = self->_touchInsets.bottom;
  double right = self->_touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->_touchInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugFrameView, 0);

  objc_storeStrong((id *)&self->_debugInsetsView, 0);
}

@end