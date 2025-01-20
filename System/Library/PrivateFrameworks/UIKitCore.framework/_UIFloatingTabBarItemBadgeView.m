@interface _UIFloatingTabBarItemBadgeView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (UILabel)textLabel;
- (_UIFloatingTabBarItemBadgeView)initWithFrame:(CGRect)a3;
- (id)_currentPlatformMetrics;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation _UIFloatingTabBarItemBadgeView

- (_UIFloatingTabBarItemBadgeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)_UIFloatingTabBarItemBadgeView;
  v7 = -[UIView initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", x, y, width, height);
    textLabel = v7->_textLabel;
    v7->_textLabel = v8;

    [(UILabel *)v7->_textLabel setTextAlignment:1];
    v10 = [(_UIFloatingTabBarItemBadgeView *)v7 _currentPlatformMetrics];
    v11 = [v10 badgeFont];
    [(UILabel *)v7->_textLabel setFont:v11];

    v12 = +[UIColor whiteColor];
    [(UILabel *)v7->_textLabel setTextColor:v12];

    v13 = +[UIColor systemRedColor];
    [(UIView *)v7 setBackgroundColor:v13];

    v14 = [(UIView *)v7 layer];
    [v14 setAllowsEdgeAntialiasing:1];

    [(UIView *)v7 _setOverrideVibrancyTrait:0];
    [(UIView *)v7 _setOverrideUserInterfaceRenderingMode:1];
    [(UIView *)v7 addSubview:v7->_textLabel];
  }
  return v7;
}

- (NSString)text
{
  return [(UILabel *)self->_textLabel text];
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_textLabel setText:a3];
  [(UIView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(_UIFloatingTabBarItemBadgeView *)self _currentPlatformMetrics];
  [v6 badgeInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  -[UILabel sizeThatFits:](self->_textLabel, "sizeThatFits:", width, height);
  double v16 = v10 + v14 + v15;
  double v18 = v8 + v12 + v17;
  [v6 maximumBadgeWidth];
  double v20 = fmax(v18, fmin(v16, v19));

  double v21 = v20;
  double v22 = v18;
  result.double height = v22;
  result.double width = v21;
  return result;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)_UIFloatingTabBarItemBadgeView;
  [(UIView *)&v24 layoutSubviews];
  v3 = [(_UIFloatingTabBarItemBadgeView *)self _currentPlatformMetrics];
  [v3 badgeInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIView *)self bounds];
  double v13 = v7 + v12;
  double v15 = v5 + v14;
  double v17 = v16 - (v7 + v11);
  double v19 = v18 - (v5 + v9);
  double v20 = [(_UIFloatingTabBarItemBadgeView *)self textLabel];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(UIView *)self bounds];
  double Width = CGRectGetWidth(v25);
  [(UIView *)self bounds];
  double v22 = fmin(Width, CGRectGetHeight(v26)) * 0.5;
  v23 = [(UIView *)self layer];
  [v23 setCornerRadius:v22];
}

- (id)_currentPlatformMetrics
{
  v2 = [(UIView *)self traitCollection];
  v3 = _UIFloatingTabBarGetPlatformMetrics([v2 userInterfaceIdiom]);

  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void).cxx_destruct
{
}

@end