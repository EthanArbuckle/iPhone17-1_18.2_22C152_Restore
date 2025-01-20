@interface STUIStatusBarImageView
- (BOOL)prefersBaselineAlignment;
- (BOOL)useDisabledAppearanceForAccessibilityHUD;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarImageView)initWithFrame:(CGRect)a3;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIImage)accessibilityHUDImage;
- (double)iconScale;
- (int64_t)fontStyle;
- (void)applyStyleAttributes:(id)a3;
- (void)setAccessibilityHUDImage:(id)a3;
- (void)setFontStyle:(int64_t)a3;
- (void)setIconScale:(double)a3;
- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3;
@end

@implementation STUIStatusBarImageView

- (CGSize)intrinsicContentSize
{
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarImageView;
  [(STUIStatusBarImageView *)&v12 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(STUIStatusBarImageView *)self image];
  int v8 = [v7 isFromStatusBarImageProvider];

  if (v8)
  {
    double iconScale = self->_iconScale;
    double v4 = v4 * iconScale;
    double v6 = v6 * iconScale;
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3
{
  self->_useDisabledAppearanceForAccessibilityHUD = a3;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
}

- (STUIStatusBarImageView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarImageView;
  double v3 = -[STUIStatusBarImageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_double iconScale = 1.0;
  [(STUIStatusBarImageView *)v3 _setAnimatesContents:1];
  return v3;
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 imageTintColor];
  [(STUIStatusBarImageView *)self setTintColor:v5];

  [v4 iconScale];
  -[STUIStatusBarImageView setIconScale:](self, "setIconScale:");
  double v6 = (void *)MEMORY[0x1E4FB1830];
  id v9 = [v4 fontForStyle:self->_fontStyle];
  uint64_t v7 = [v4 symbolScale];

  int v8 = [v6 configurationWithFont:v9 scale:v7];
  [(STUIStatusBarImageView *)self setPreferredSymbolConfiguration:v8];
}

- (void)setIconScale:(double)a3
{
  if (self->_iconScale != a3)
  {
    self->_double iconScale = a3;
    [(STUIStatusBarImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void).cxx_destruct
{
}

- (BOOL)prefersBaselineAlignment
{
  v2 = [(STUIStatusBarImageView *)self image];
  char v3 = [v2 _isSymbolImage];

  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  char v3 = [(STUIStatusBarImageView *)self accessibilityHUDImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(STUIStatusBarImageView *)self image];
  }
  double v6 = v5;

  id v7 = objc_alloc(MEMORY[0x1E4FB13E0]);
  int v8 = objc_msgSend(v7, "initWithTitle:image:imageInsets:", 0, v6, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v8 setScaleImage:1];
  objc_msgSend(v8, "setDisabledAppearance:", -[STUIStatusBarImageView useDisabledAppearanceForAccessibilityHUD](self, "useDisabledAppearanceForAccessibilityHUD"));

  return (UIAccessibilityHUDItem *)v8;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (BOOL)useDisabledAppearanceForAccessibilityHUD
{
  return self->_useDisabledAppearanceForAccessibilityHUD;
}

- (UIImage)accessibilityHUDImage
{
  return self->_accessibilityHUDImage;
}

- (void)setAccessibilityHUDImage:(id)a3
{
}

- (double)iconScale
{
  return self->_iconScale;
}

@end