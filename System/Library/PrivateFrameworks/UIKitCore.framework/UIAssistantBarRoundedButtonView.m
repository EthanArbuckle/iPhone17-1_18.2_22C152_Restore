@interface UIAssistantBarRoundedButtonView
- (BOOL)dropShadow;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIAssistantBarRoundedButtonView)initWithFrame:(CGRect)a3;
- (UIAssistantBarRoundedButtonViewButton)button;
- (void)layoutSubviews;
- (void)setDropShadow:(BOOL)a3;
@end

@implementation UIAssistantBarRoundedButtonView

- (UIAssistantBarRoundedButtonView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIAssistantBarRoundedButtonView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[UIButton buttonWithType:0];
    button = v3->_button;
    v3->_button = (UIAssistantBarRoundedButtonViewButton *)v4;

    [(UIView *)v3->_button _setContinuousCornerRadius:6.0];
    [(UIView *)v3->_button setClipsToBounds:1];
    [(UIButton *)v3->_button setContentHorizontalAlignment:5];
    [(UIButton *)v3->_button setContentVerticalAlignment:2];
    -[UIButton setContentEdgeInsets:](v3->_button, "setContentEdgeInsets:", 7.0, 13.0, 7.0, 13.0);
    [(UIView *)v3 addSubview:v3->_button];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(UIAssistantBarRoundedButtonView *)self button];
  objc_msgSend(v6, "sizeThatFits:", width, height);
  double v8 = v7 + 33.0;
  [(UIView *)self bounds];
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)setDropShadow:(BOOL)a3
{
  if (self->_dropShadow != a3)
  {
    BOOL v3 = a3;
    self->_dropShadow = a3;
    [(UIView *)self->_shadowView removeFromSuperview];
    shadowView = self->_shadowView;
    self->_shadowView = 0;

    if (v3)
    {
      v6 = objc_alloc_init(UIView);
      double v7 = self->_shadowView;
      self->_shadowView = v6;

      double v8 = +[UIColor colorWithRed:0.486 green:0.49 blue:0.506 alpha:1.0];
      [(UIView *)self->_shadowView setBackgroundColor:v8];

      [(UIView *)self->_shadowView _setContinuousCornerRadius:6.0];
      [(UIView *)self->_shadowView setClipsToBounds:1];
      double v9 = self->_shadowView;
      double v10 = [(UIAssistantBarRoundedButtonView *)self button];
      [(UIView *)self insertSubview:v9 below:v10];

      [(UIView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)UIAssistantBarRoundedButtonView;
  [(UIView *)&v16 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = [(UIAssistantBarRoundedButtonView *)self button];
  objc_msgSend(v9, "sizeThatFits:", v6, v8);
  double v11 = v10;

  double v12 = v11 + 33.0;
  double v13 = v6 - v12;
  double v14 = round(v4 + (v8 + -39.0) * 0.5);
  v15 = [(UIAssistantBarRoundedButtonView *)self button];
  objc_msgSend(v15, "setFrame:", v13, v14, v12, 39.0);

  if ([(UIAssistantBarRoundedButtonView *)self dropShadow]) {
    -[UIView setFrame:](self->_shadowView, "setFrame:", v13, v14 + 1.0, v12, 39.0);
  }
}

- (BOOL)dropShadow
{
  return self->_dropShadow;
}

- (UIAssistantBarRoundedButtonViewButton)button
{
  return self->_button;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end