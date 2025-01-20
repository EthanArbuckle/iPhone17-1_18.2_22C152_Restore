@interface UITextFieldBackgroundView
- (UIColor)fillColor;
- (UITextFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4;
- (void)setActive:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setFillColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setProgress:(float)a3;
@end

@implementation UITextFieldBackgroundView

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  self->_enabled = a3;
}

- (UITextFieldBackgroundView)initWithFrame:(CGRect)a3 active:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITextFieldBackgroundView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_active = a4;
    v5->_progress = 0.0;
    v5->_enabled = 1;
    [(UITextFieldBackgroundView *)v5 _updateImages];
    [(UIView *)v6 setUserInteractionEnabled:0];
    [(UIView *)v6 setNeedsLayout];
  }
  return v6;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextFieldBackgroundView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIView *)self layoutSubviews];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)UITextFieldBackgroundView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v9 != width || v11 != height) {
    [(UIView *)self layoutSubviews];
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(UITextFieldBackgroundView *)self _updateImages];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setProgress:(float)a3
{
  if (self->_progress != a3)
  {
    self->_progress = a3;
    if (self->_active)
    {
      [(UITextFieldBackgroundView *)self _updateImages];
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (void)setFillColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_fillColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(UITextFieldBackgroundView *)self _updateImages];
    [(UIView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
}

@end