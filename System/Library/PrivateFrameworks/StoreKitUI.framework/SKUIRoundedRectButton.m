@interface SKUIRoundedRectButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (SKUIRoundedRectButton)initWithFrame:(CGRect)a3;
- (id)_basicAnimationWithKeyPath:(id)a3;
- (void)_reloadColors;
- (void)_reloadFonts;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSubtitleWithLabel:(id)a3;
- (void)setTitleEdgeInsets:(UIEdgeInsets)a3;
- (void)tintColorDidChange;
@end

@implementation SKUIRoundedRectButton

- (SKUIRoundedRectButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIRoundedRectButton initWithFrame:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIRoundedRectButton;
  v8 = -[SKUIRoundedRectButton initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[SKUIRoundedRectButton setTitleEdgeInsets:](v8, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    v10 = [(SKUIRoundedRectButton *)v9 titleLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = [(SKUIRoundedRectButton *)v9 titleLabel];
    [v11 setMinimumScaleFactor:0.933333333];

    v12 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    borderView = v9->_borderView;
    v9->_borderView = v12;

    [(UIView *)v9->_borderView setAutoresizingMask:18];
    v14 = v9->_borderView;
    [(SKUIRoundedRectButton *)v9 bounds];
    -[UIView setFrame:](v14, "setFrame:");
    [(UIView *)v9->_borderView setUserInteractionEnabled:0];
    [(SKUIRoundedRectButton *)v9 addSubview:v9->_borderView];
    v15 = [(UIView *)v9->_borderView layer];
    id v16 = [(SKUIRoundedRectButton *)v9 tintColor];
    objc_msgSend(v15, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    v17 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v17 scale];
    [v15 setBorderWidth:1.0 / v18];

    [v15 setCornerRadius:7.0];
    [(SKUIRoundedRectButton *)v9 _reloadColors];
    [(SKUIRoundedRectButton *)v9 _reloadFonts];
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v19 addObserver:v9 selector:sel__reloadFonts name:*MEMORY[0x1E4FB27A8] object:0];
  }
  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SKUIRoundedRectButton;
  [(SKUIRoundedRectButton *)&v4 dealloc];
}

- (void)setSubtitleWithLabel:(id)a3
{
  v5 = (UILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    [(SKUIRoundedRectButton *)self titleEdgeInsets];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    if ([(UILabel *)*p_subtitleLabel isDescendantOfView:self])
    {
      [(UILabel *)*p_subtitleLabel removeFromSuperview];
      double v8 = v8 + 14.0;
    }
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      [(SKUIRoundedRectButton *)self insertSubview:*p_subtitleLabel belowSubview:self->_borderView];
      [(SKUIRoundedRectButton *)self _reloadColors];
      double v8 = v8 + -14.0;
    }
    v15.receiver = self;
    v15.super_class = (Class)SKUIRoundedRectButton;
    -[SKUIRoundedRectButton setTitleEdgeInsets:](&v15, sel_setTitleEdgeInsets_, v8, v10, v12, v14);
  }
}

- (void)layoutSubviews
{
  if (self->_subtitleLabel)
  {
    [(SKUIRoundedRectButton *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    [(UILabel *)self->_subtitleLabel frame];
    double v12 = v11;
    v14.origin.double x = v4;
    v14.origin.double y = v6;
    v14.size.double width = v8;
    v14.size.double height = v10;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, CGRectGetMaxY(v14) - v12 + -5.0, v8, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIRoundedRectButton;
  [(SKUIRoundedRectButton *)&v13 layoutSubviews];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton setEnabled:](&v6, sel_setEnabled_);
  double v5 = 0.33;
  if (v3) {
    double v5 = 1.0;
  }
  [(SKUIRoundedRectButton *)self setAlpha:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SKUIRoundedRectButton *)self isHighlighted] != a3)
  {
    double v5 = [(UIView *)self->_borderView layer];
    [v5 removeAnimationForKey:@"borderWidth"];
    objc_super v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    [v5 setCompositingFilter:v6];

    double v7 = [(SKUIRoundedRectButton *)self _basicAnimationWithKeyPath:@"backgroundColor"];
    [v7 setDuration:0.12];
    if (v3)
    {
      id v8 = [MEMORY[0x1E4FB1618] clearColor];
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "CGColor"));

      [(SKUIRoundedRectButton *)self tintColor];
    }
    else
    {
      id v9 = [(SKUIRoundedRectButton *)self tintColor];
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v9, "CGColor"));

      [MEMORY[0x1E4FB1618] clearColor];
    }
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", objc_msgSend(v10, "CGColor"));

    [v7 setDelegate:self];
    [v5 addAnimation:v7 forKey:@"borderWidth"];
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIRoundedRectButton;
  [(SKUIRoundedRectButton *)&v11 setHighlighted:v3];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_subtitleLabel) {
    a3.top = a3.top + -14.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton setTitleEdgeInsets:](&v3, sel_setTitleEdgeInsets_, a3.top, a3.left, a3.bottom, a3.right);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIRoundedRectButton;
  -[SKUIRoundedRectButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, 45.0);
  double v4 = 45.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)tintColorDidChange
{
  [(SKUIRoundedRectButton *)self _reloadColors];
  v3.receiver = self;
  v3.super_class = (Class)SKUIRoundedRectButton;
  [(SKUIRoundedRectButton *)&v3 tintColorDidChange];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  int v5 = [(SKUIRoundedRectButton *)self isHighlighted];
  id v7 = [(UIView *)self->_borderView layer];
  if (v5)
  {
    objc_super v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A370]];
    [v7 setCompositingFilter:v6];
  }
  else
  {
    [v7 setCompositingFilter:0];
  }
}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  objc_super v3 = [MEMORY[0x1E4F39B48] animationWithKeyPath:a3];
  [v3 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v3 setRemovedOnCompletion:0];
  UIAnimationDragCoefficient();
  *(float *)&double v5 = 1.0 / v4;
  [v3 setSpeed:v5];

  return v3;
}

- (void)_reloadColors
{
  objc_super v3 = [(SKUIRoundedRectButton *)self tintColor];
  float v4 = [(UIView *)self->_borderView layer];
  id v5 = v3;
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  [(UILabel *)self->_subtitleLabel setTextColor:v5];
  [(SKUIRoundedRectButton *)self setTitleColor:v5 forState:0];
}

- (void)_reloadFonts
{
  id v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2950] addingSymbolicTraits:2 options:0];
  objc_super v3 = [(SKUIRoundedRectButton *)self titleLabel];
  float v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];
  [v3 setFont:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_borderView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIRoundedRectButton initWithFrame:]";
}

@end