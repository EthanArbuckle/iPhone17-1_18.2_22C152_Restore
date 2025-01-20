@interface _UIStatusBarImageView
- (BOOL)prefersBaselineAlignment;
- (BOOL)useDisabledAppearanceForAccessibilityHUD;
- (CGSize)intrinsicContentSize;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIImage)accessibilityHUDImage;
- (_UIStatusBarImageView)initWithFrame:(CGRect)a3;
- (double)iconScale;
- (int64_t)fontStyle;
- (void)applyStyleAttributes:(id)a3;
- (void)setAccessibilityHUDImage:(id)a3;
- (void)setFontStyle:(int64_t)a3;
- (void)setIconScale:(double)a3;
- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3;
@end

@implementation _UIStatusBarImageView

- (_UIStatusBarImageView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarImageView;
  v3 = -[UIImageView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_iconScale = 1.0;
  [(UIImageView *)v3 _setAnimatesContents:1];
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v12.receiver = self;
  v12.super_class = (Class)_UIStatusBarImageView;
  [(UIView *)&v12 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(UIImageView *)self image];
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

- (BOOL)prefersBaselineAlignment
{
  v2 = [(UIImageView *)self image];
  char v3 = [v2 _isSymbolImage];

  return v3;
}

- (void)setIconScale:(double)a3
{
  if (self->_iconScale != a3)
  {
    self->_double iconScale = a3;
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [v4 imageTintColor];
  [(UIView *)self setTintColor:v5];

  [v4 iconScale];
  -[_UIStatusBarImageView setIconScale:](self, "setIconScale:");
  id v8 = [v4 fontForStyle:self->_fontStyle];
  uint64_t v6 = [v4 symbolScale];

  v7 = +[UIImageSymbolConfiguration configurationWithFont:v8 scale:v6];
  [(UIImageView *)self setPreferredSymbolConfiguration:v7];
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  char v3 = [(_UIStatusBarImageView *)self accessibilityHUDImage];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIImageView *)self image];
  }
  uint64_t v6 = v5;

  v7 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v6, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v7 setScaleImage:1];
  [(UIAccessibilityHUDItem *)v7 setDisabledAppearance:[(_UIStatusBarImageView *)self useDisabledAppearanceForAccessibilityHUD]];

  return v7;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
}

- (BOOL)useDisabledAppearanceForAccessibilityHUD
{
  return self->_useDisabledAppearanceForAccessibilityHUD;
}

- (void)setUseDisabledAppearanceForAccessibilityHUD:(BOOL)a3
{
  self->_useDisabledAppearanceForAccessibilityHUD = a3;
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

- (void).cxx_destruct
{
}

@end