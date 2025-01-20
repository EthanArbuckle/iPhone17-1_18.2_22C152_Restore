@interface UIStatusBarSystemNavigationItemView
- (BOOL)_shouldLayoutImageOnRight;
- (BOOL)layoutImageOnTrailingEdge;
- (CGSize)_buttonSize;
- (NSString)title;
- (UIButton)button;
- (double)addContentOverlap:(double)a3;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (double)maxWidth;
- (double)resetContentOverlap;
- (double)updateContentsAndWidth;
- (id)accessibilityHUDRepresentation;
- (id)shortenedTitleWithCompressionLevel:(int)a3;
- (int)currentLabelCompressionLevel;
- (int64_t)labelLineBreakMode;
- (void)setButton:(id)a3;
- (void)setCurrentLabelCompressionLevel:(int)a3;
- (void)setMaxWidth:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation UIStatusBarSystemNavigationItemView

- (BOOL)_shouldLayoutImageOnRight
{
  BOOL v3 = +[UIStatusBar _deviceUserInterfaceLayoutDirection] == 1;
  return v3 ^ [(UIStatusBarSystemNavigationItemView *)self layoutImageOnTrailingEdge];
}

- (UIButton)button
{
  button = self->_button;
  if (!button)
  {
    [(UIView *)self setUserInteractionEnabled:1];
    v4 = +[UIButton buttonWithType:1];
    v5 = self->_button;
    self->_button = v4;

    [(UIControl *)self->_button addTarget:self action:sel_userDidActivateButton_ forControlEvents:0x2000];
    if ([(UIStatusBarSystemNavigationItemView *)self _shouldLayoutImageOnRight]) {
      v6 = @"BreadcrumbArrowRight";
    }
    else {
      v6 = @"BreadcrumbArrowLeft";
    }
    v7 = [(UIStatusBarItemView *)self imageWithShadowNamed:v6];
    v8 = [v7 image];

    v9 = [v8 _imageThatSuppressesAccessibilityHairlineThickening];

    [(UIButton *)self->_button setImage:v9 forState:0];
    v10 = [(UIButton *)self->_button imageView];
    [v10 setClipsToBounds:0];

    [(UIButton *)self->_button setContentHorizontalAlignment:1];
    [(UIView *)self->_button setAutoresizingMask:36];
    v11 = [(UIStatusBarItemView *)self foregroundStyle];
    v12 = [v11 textFontForStyle:2];
    v13 = [(UIButton *)self->_button titleLabel];
    [v13 setFont:v12];

    LODWORD(v11) = [(UIStatusBarSystemNavigationItemView *)self _shouldLayoutImageOnRight];
    v14 = [(UIButton *)self->_button titleLabel];
    v15 = v14;
    if (v11) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = 0;
    }
    [v14 setTextAlignment:v16];

    int64_t v17 = [(UIStatusBarSystemNavigationItemView *)self labelLineBreakMode];
    v18 = [(UIButton *)self->_button titleLabel];
    [v18 setLineBreakMode:v17];

    -[UIView _setTouchInsets:](self->_button, "_setTouchInsets:", -12.5, -12.5, -12.5, -12.5);
    v19 = [(UIStatusBarItemView *)self foregroundStyle];
    v20 = [v19 tintColor];
    [(UIButton *)self->_button setTintColor:v20];

    [(UIView *)self addSubview:self->_button];
    -[UIView _setTouchInsets:](self, "_setTouchInsets:", 0.0, -12.5, 0.0, -12.5);

    button = self->_button;
  }
  return button;
}

- (CGSize)_buttonSize
{
  v2 = [(UIStatusBarSystemNavigationItemView *)self button];
  [v2 bounds];
  objc_msgSend(v2, "sizeThatFits:", v3 + -4.0, v4);
  double v6 = v5;
  double v8 = v7 + 4.0;

  double v9 = v8;
  double v10 = v6;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)updateContentsAndWidth
{
  double v3 = [(UIStatusBarSystemNavigationItemView *)self button];
  [(UIView *)self bounds];
  [(UIStatusBarSystemNavigationItemView *)self _buttonSize];
  double v5 = v4;
  double v7 = v6;
  UIRoundToViewScale(self);
  double v9 = v8;
  [(UIStatusBarSystemNavigationItemView *)self maxWidth];
  if (v10 > 0.0)
  {
    [(UIStatusBarSystemNavigationItemView *)self maxWidth];
    if (v11 < v5) {
      double v5 = v11;
    }
  }
  objc_msgSend(v3, "setFrame:", 0.0, v9, v5, v7);
  v12 = [(UIStatusBarItemView *)self foregroundStyle];
  if ([v12 usesVerticalLayout]) {
    double v5 = v7;
  }

  [(UIStatusBarItemView *)self adjustFrameToNewSize:v5];
  double v14 = v13;

  return v14;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(UIStatusBarSystemNavigationItemView *)self button];
  [v5 setTitle:v4 forState:0];
}

- (NSString)title
{
  v2 = [(UIStatusBarSystemNavigationItemView *)self button];
  double v3 = [v2 titleForState:0];

  return (NSString *)v3;
}

- (double)resetContentOverlap
{
  [(UIStatusBarSystemNavigationItemView *)self setMaxWidth:0.0];
  [(UIStatusBarSystemNavigationItemView *)self updateContentsAndWidth];
  return result;
}

- (double)addContentOverlap:(double)a3
{
  [(UIView *)self bounds];
  [(UIStatusBarSystemNavigationItemView *)self setMaxWidth:v5 - a3];
  [(UIView *)self bounds];
  double v7 = v6;
  do
  {
    uint64_t v8 = [(UIStatusBarSystemNavigationItemView *)self shortenedTitleWithCompressionLevel:[(UIStatusBarSystemNavigationItemView *)self currentLabelCompressionLevel]+ 1];
    if (!v8) {
      break;
    }
    double v9 = (void *)v8;
    [(UIStatusBarSystemNavigationItemView *)self setTitle:v8];
    [(UIStatusBarSystemNavigationItemView *)self _buttonSize];
    double v11 = v10;
    [(UIStatusBarSystemNavigationItemView *)self setCurrentLabelCompressionLevel:[(UIStatusBarSystemNavigationItemView *)self currentLabelCompressionLevel]+ 1];
  }
  while (v7 - v11 < a3);
  [(UIStatusBarSystemNavigationItemView *)self updateContentsAndWidth];
  return result;
}

- (id)accessibilityHUDRepresentation
{
  uint64_t v8 = 0;
  if ([(UIStatusBarSystemNavigationItemView *)self _shouldLayoutImageOnRight]) {
    uint64_t v3 = 106;
  }
  else {
    uint64_t v3 = 105;
  }
  BarButtonItemResolveSystemImage(v3, &v8, 0, 0);
  id v4 = [UIAccessibilityHUDItem alloc];
  double v5 = [(UIStatusBarSystemNavigationItemView *)self title];
  double v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v4, "initWithTitle:image:imageInsets:", v5, v8, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

- (BOOL)layoutImageOnTrailingEdge
{
  return 0;
}

- (int64_t)labelLineBreakMode
{
  return 5;
}

- (id)shortenedTitleWithCompressionLevel:(int)a3
{
  return 0;
}

- (double)extraLeftPadding
{
  [(UIStatusBarItemView *)self standardPadding];
  return 4.0 - v2;
}

- (double)extraRightPadding
{
  [(UIStatusBarItemView *)self standardPadding];
  return 4.0 - v2;
}

- (void)setButton:(id)a3
{
}

- (int)currentLabelCompressionLevel
{
  return self->_currentLabelCompressionLevel;
}

- (void)setCurrentLabelCompressionLevel:(int)a3
{
  self->_currentLabelCompressionLevel = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

- (void).cxx_destruct
{
}

@end