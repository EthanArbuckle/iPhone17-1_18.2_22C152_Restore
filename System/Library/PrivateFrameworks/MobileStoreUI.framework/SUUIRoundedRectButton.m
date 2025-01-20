@interface SUUIRoundedRectButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIRoundedRectButton)initWithFrame:(CGRect)a3;
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

@implementation SUUIRoundedRectButton

- (SUUIRoundedRectButton)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)SUUIRoundedRectButton;
  v3 = -[SUUIRoundedRectButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIRoundedRectButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    v5 = [(SUUIRoundedRectButton *)v4 titleLabel];
    [v5 setAdjustsFontSizeToFitWidth:1];

    v6 = [(SUUIRoundedRectButton *)v4 titleLabel];
    [v6 setMinimumScaleFactor:0.933333333];

    v7 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    borderView = v4->_borderView;
    v4->_borderView = v7;

    [(UIView *)v4->_borderView setAutoresizingMask:18];
    v9 = v4->_borderView;
    [(SUUIRoundedRectButton *)v4 bounds];
    -[UIView setFrame:](v9, "setFrame:");
    [(UIView *)v4->_borderView setUserInteractionEnabled:0];
    [(SUUIRoundedRectButton *)v4 addSubview:v4->_borderView];
    v10 = [(UIView *)v4->_borderView layer];
    id v11 = [(SUUIRoundedRectButton *)v4 tintColor];
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    v12 = [MEMORY[0x263F82B60] mainScreen];
    [v12 scale];
    [v10 setBorderWidth:1.0 / v13];

    [v10 setCornerRadius:7.0];
    [(SUUIRoundedRectButton *)v4 _reloadColors];
    [(SUUIRoundedRectButton *)v4 _reloadFonts];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v4 selector:sel__reloadFonts name:*MEMORY[0x263F83428] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83428] object:0];

  v4.receiver = self;
  v4.super_class = (Class)SUUIRoundedRectButton;
  [(SUUIRoundedRectButton *)&v4 dealloc];
}

- (void)setSubtitleWithLabel:(id)a3
{
  v5 = (UILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    [(SUUIRoundedRectButton *)self titleEdgeInsets];
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
      [(SUUIRoundedRectButton *)self insertSubview:*p_subtitleLabel belowSubview:self->_borderView];
      [(SUUIRoundedRectButton *)self _reloadColors];
      double v8 = v8 + -14.0;
    }
    v15.receiver = self;
    v15.super_class = (Class)SUUIRoundedRectButton;
    -[SUUIRoundedRectButton setTitleEdgeInsets:](&v15, sel_setTitleEdgeInsets_, v8, v10, v12, v14);
  }
}

- (void)layoutSubviews
{
  if (self->_subtitleLabel)
  {
    [(SUUIRoundedRectButton *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    double v8 = v7;
    CGFloat v10 = v9;
    [(UILabel *)self->_subtitleLabel frame];
    double v12 = v11;
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, CGRectGetMaxY(v14) - v12 + -5.0, v8, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUIRoundedRectButton;
  [(SUUIRoundedRectButton *)&v13 layoutSubviews];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton setEnabled:](&v6, sel_setEnabled_);
  double v5 = 0.33;
  if (v3) {
    double v5 = 1.0;
  }
  [(SUUIRoundedRectButton *)self setAlpha:v5];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SUUIRoundedRectButton *)self isHighlighted] != a3)
  {
    double v5 = [(UIView *)self->_borderView layer];
    [v5 removeAnimationForKey:@"borderWidth"];
    objc_super v6 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
    [v5 setCompositingFilter:v6];

    double v7 = [(SUUIRoundedRectButton *)self _basicAnimationWithKeyPath:@"backgroundColor"];
    [v7 setDuration:0.12];
    if (v3)
    {
      id v8 = [MEMORY[0x263F825C8] clearColor];
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "CGColor"));

      [(SUUIRoundedRectButton *)self tintColor];
    }
    else
    {
      id v9 = [(SUUIRoundedRectButton *)self tintColor];
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v9, "CGColor"));

      [MEMORY[0x263F825C8] clearColor];
    }
    id v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", objc_msgSend(v10, "CGColor"));

    [v7 setDelegate:self];
    [v5 addAnimation:v7 forKey:@"borderWidth"];
  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIRoundedRectButton;
  [(SUUIRoundedRectButton *)&v11 setHighlighted:v3];
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_subtitleLabel) {
    a3.top = a3.top + -14.0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton setTitleEdgeInsets:](&v3, sel_setTitleEdgeInsets_, a3.top, a3.left, a3.bottom, a3.right);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, 45.0);
  double v4 = 45.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  [(SUUIRoundedRectButton *)self _reloadColors];
  v3.receiver = self;
  v3.super_class = (Class)SUUIRoundedRectButton;
  [(SUUIRoundedRectButton *)&v3 tintColorDidChange];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  int v5 = [(SUUIRoundedRectButton *)self isHighlighted];
  id v7 = [(UIView *)self->_borderView layer];
  if (v5)
  {
    objc_super v6 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15DC0]];
    [v7 setCompositingFilter:v6];
  }
  else
  {
    [v7 setCompositingFilter:0];
  }
}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  objc_super v3 = [MEMORY[0x263F15760] animationWithKeyPath:a3];
  [v3 setFillMode:*MEMORY[0x263F15AB0]];
  [v3 setRemovedOnCompletion:0];
  UIAnimationDragCoefficient();
  *(float *)&double v5 = 1.0 / v4;
  [v3 setSpeed:v5];
  return v3;
}

- (void)_reloadColors
{
  objc_super v3 = [(SUUIRoundedRectButton *)self tintColor];
  float v4 = [(UIView *)self->_borderView layer];
  id v5 = v3;
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  [(UILabel *)self->_subtitleLabel setTextColor:v5];
  [(SUUIRoundedRectButton *)self setTitleColor:v5 forState:0];
}

- (void)_reloadFonts
{
  id v5 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835F0] addingSymbolicTraits:2 options:0];
  objc_super v3 = [(SUUIRoundedRectButton *)self titleLabel];
  float v4 = [MEMORY[0x263F81708] fontWithDescriptor:v5 size:0.0];
  [v3 setFont:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end