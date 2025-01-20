@interface SURoundedCornersButton
- (SURoundedCornersButton)initWithFrame:(CGRect)a3;
- (id)_highlightedBackgroundView;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SURoundedCornersButton

- (SURoundedCornersButton)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SURoundedCornersButton;
  v3 = -[SURoundedCornersButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    -[SURoundedCornersButton setBackgroundColor:](v3, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
    [(SURoundedCornersButton *)v3 setRequiresDisplayOnTracking:1];
    -[SURoundedCornersButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SURoundedCornersButton;
  [(SUSubtitledButton *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SURoundedCornersButton *)self bounds];
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  if (!self->_bezierPath)
  {
    CGRect v20 = CGRectInset(*(CGRect *)&v8, 0.5, 0.5);
    self->_bezierPath = (UIBezierPath *)(id)objc_msgSend(MEMORY[0x263F1C478], "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v20.origin.x, v20.origin.y, v20.size.width, v20.size.height + -1.0, 10.0);
  }
  if (!self->_shadowPath)
  {
    v21.origin.double x = v12;
    v21.origin.double y = v13;
    v21.size.double width = v14;
    v21.size.double height = v15;
    CGRectInset(v21, 0.5, 0.5);
    v16 = (void *)MEMORY[0x263F1C478];
    v22.origin.double x = v12;
    v22.origin.double y = v13;
    v22.size.double width = v14;
    v22.size.double height = v15;
    CGRect v23 = CGRectInset(v22, 0.5, 0.5);
    self->_shadowPath = (UIBezierPath *)(id)objc_msgSend(v16, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v23.origin.x, v23.origin.y, v23.size.width, v23.size.height, 10.0);
  }
  if (([(SURoundedCornersButton *)self isHighlighted] & 1) != 0
    || ([(SURoundedCornersButton *)self isSelected] & 1) != 0)
  {
    id v17 = [(SURoundedCornersButton *)self _highlightedBackgroundView];
    objc_msgSend(v17, "setFrame:", v12, v13, v14, v15);
    [(UIBezierPath *)self->_bezierPath clip];
    objc_msgSend(v17, "drawRect:", x, y, width, height);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "whiteColor"), "set");
    [(UIBezierPath *)self->_bezierPath fill];
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.949999988, 1.0), "set");
  [(UIBezierPath *)self->_shadowPath stroke];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C550], "tableSeparatorDarkColor"), "set");
  bezierPath = self->_bezierPath;

  [(UIBezierPath *)bezierPath stroke];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SURoundedCornersButton *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SURoundedCornersButton;
  -[SURoundedCornersButton setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height)
  {

    self->_bezierPath = 0;
    self->_shadowPath = 0;
  }
}

- (id)_highlightedBackgroundView
{
  id result = self->_highlightedBackgroundView;
  if (!result)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F1CA48]) initWithStyle:0 reuseIdentifier:0];
    [v4 setHighlighted:1];
    self->_highlightedBackgroundView = (UIView *)(id)[v4 selectedBackgroundView];

    return self->_highlightedBackgroundView;
  }
  return result;
}

@end