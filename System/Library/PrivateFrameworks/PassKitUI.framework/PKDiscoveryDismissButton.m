@interface PKDiscoveryDismissButton
+ (id)_tintColorForUserInterfaceStyle:(int64_t)a3;
+ (id)buttonWithStyle:(int64_t)a3 primaryAction:(id)a4;
+ (int64_t)_blurEffectStyleForUserInterfaceStyle:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)_backingEffect;
- (id)_tintColor;
- (int64_t)style;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateStyleWithStyle:(int64_t)a3;
- (void)updateStyleWithStyle:(int64_t)a3 animated:(BOOL)a4;
@end

@implementation PKDiscoveryDismissButton

+ (id)buttonWithStyle:(int64_t)a3 primaryAction:(id)a4
{
  v5 = (void *)MEMORY[0x1E4FB14D8];
  id v6 = a4;
  v7 = [v5 tintedButtonConfiguration];
  v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark"];
  [v7 setImage:v8];

  [v7 setCornerStyle:4];
  v9 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:2 scale:15.0];
  [v7 setPreferredSymbolConfigurationForImage:v9];

  v10 = +[PKDiscoveryDismissButton buttonWithConfiguration:v7 primaryAction:v6];

  [v10 updateStyleWithStyle:a3 animated:0];

  return v10;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 28.0;
  double v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateStyleWithStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_style != a3)
  {
    if (a4)
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __58__PKDiscoveryDismissButton_updateStyleWithStyle_animated___block_invoke;
      v4[3] = &unk_1E59CB460;
      v4[4] = self;
      v4[5] = a3;
      objc_msgSend(MEMORY[0x1E4FB1EB0], "pkui_animateUsingOptions:animations:completion:", 4, v4, 0);
    }
    else
    {
      -[PKDiscoveryDismissButton _updateStyleWithStyle:](self, "_updateStyleWithStyle:");
    }
  }
}

uint64_t __58__PKDiscoveryDismissButton_updateStyleWithStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStyleWithStyle:*(void *)(a1 + 40)];
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKDiscoveryDismissButton;
  [(PKDiscoveryDismissButton *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKDiscoveryDismissButton *)self _updateStyleWithStyle:self->_style];
}

- (void)_updateStyleWithStyle:(int64_t)a3
{
  self->_style = a3;
  id v7 = [(PKDiscoveryDismissButton *)self configuration];
  double v4 = [(PKDiscoveryDismissButton *)self _tintColor];
  [v7 setBaseForegroundColor:v4];

  v5 = [v7 background];
  id v6 = [(PKDiscoveryDismissButton *)self _backingEffect];
  [v5 setVisualEffect:v6];

  [(PKDiscoveryDismissButton *)self setConfiguration:v7];
  [(PKDiscoveryDismissButton *)self setNeedsUpdateConfiguration];
}

- (id)_tintColor
{
  int64_t style = self->_style;
  switch(style)
  {
    case 2:
      uint64_t v5 = 1;
LABEL_7:
      v2 = +[PKDiscoveryDismissButton _tintColorForUserInterfaceStyle:v5];
      break;
    case 1:
      uint64_t v5 = 2;
      goto LABEL_7;
    case 0:
      double v4 = [(PKDiscoveryDismissButton *)self traitCollection];
      v2 = +[PKDiscoveryDismissButton _tintColorForUserInterfaceStyle:](PKDiscoveryDismissButton, "_tintColorForUserInterfaceStyle:", [v4 userInterfaceStyle]);

      break;
  }

  return v2;
}

- (id)_backingEffect
{
  int64_t style = self->_style;
  if (style == 2)
  {
    uint64_t v5 = 1;
LABEL_7:
    int64_t v4 = +[PKDiscoveryDismissButton _blurEffectStyleForUserInterfaceStyle:v5];
    goto LABEL_9;
  }
  if (style == 1)
  {
    uint64_t v5 = 2;
    goto LABEL_7;
  }
  if (style)
  {
    int64_t v4 = 0;
  }
  else
  {
    objc_super v3 = [(PKDiscoveryDismissButton *)self traitCollection];
    int64_t v4 = +[PKDiscoveryDismissButton _blurEffectStyleForUserInterfaceStyle:](PKDiscoveryDismissButton, "_blurEffectStyleForUserInterfaceStyle:", [v3 userInterfaceStyle]);
  }
LABEL_9:
  id v6 = (void *)MEMORY[0x1E4FB14C8];

  return (id)[v6 effectWithStyle:v4];
}

+ (id)_tintColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      a1 = [MEMORY[0x1E4FB1618] darkGrayColor];
    }
  }
  else
  {
    a1 = [MEMORY[0x1E4FB1618] lightGrayColor];
  }

  return a1;
}

+ (int64_t)_blurEffectStyleForUserInterfaceStyle:(int64_t)a3
{
  if (a3 == 2) {
    return 13;
  }
  else {
    return 18;
  }
}

- (int64_t)style
{
  return self->_style;
}

@end