@interface _PGButton
- (BOOL)isHovered;
- (CGRect)hitRect;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (PGButtonView)buttonView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setButtonView:(id)a3;
- (void)setHovered:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)tintColorDidChange;
@end

@implementation _PGButton

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_PGButton;
  -[_PGButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4);
  v7 = (_PGButton *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    [(_PGButton *)self hitRect];
    v11.CGFloat x = x;
    v11.CGFloat y = y;
    if (CGRectContainsPoint(v12, v11)) {
      v7 = self;
    }
    else {
      v7 = 0;
    }
  }

  return v7;
}

- (CGRect)hitRect
{
  [(_PGButton *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(_PGButton *)self isEnabled])
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v11 = 58.0 - CGRectGetWidth(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v12 = 58.0 - CGRectGetHeight(v20);
    if (v11 <= 0.0) {
      double v13 = -0.0;
    }
    else {
      double v13 = v11 * -0.5;
    }
    if (v12 <= 0.0) {
      double v14 = -0.0;
    }
    else {
      double v14 = v12 * -0.5;
    }
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRect v22 = CGRectInset(v21, v13, v14);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_PGButton;
  [(_PGButton *)&v3 tintColorDidChange];
  [(UIButton *)self PG_updateVibrancyEffectForTintColor];
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_PGButton;
  [(_PGButton *)&v5 setTitle:a3 forState:a4];
  [(UIButton *)self PG_updateVibrancyEffectForTintColor];
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_PGButton;
  [(_PGButton *)&v5 setImage:a3 forState:a4];
  [(UIButton *)self PG_updateVibrancyEffectForTintColor];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)_PGButton;
  -[_PGButton imageRectForContentRect:](&v26, sel_imageRectForContentRect_);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(_PGButton *)self buttonView];
  double v17 = [v16 delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v17, "buttonView:imageRectForContentRect:proposedRect:", v16, x, y, width, height, v9, v11, v13, v15);
    double v9 = v18;
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
  }

  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)_PGButton;
  -[_PGButton titleRectForContentRect:](&v26, sel_titleRectForContentRect_);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(_PGButton *)self buttonView];
  double v17 = [v16 delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_msgSend(v17, "buttonView:titleRectForContentRect:proposedRect:", v16, x, y, width, height, v9, v11, v13, v15);
    double v9 = v18;
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
  }

  double v22 = v9;
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (BOOL)isHovered
{
  return self->_hovered;
}

- (void)setHovered:(BOOL)a3
{
  self->_hovered = a3;
}

- (PGButtonView)buttonView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buttonView);

  return (PGButtonView *)WeakRetained;
}

- (void)setButtonView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end