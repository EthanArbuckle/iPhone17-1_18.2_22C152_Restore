@interface _TVLoadingImageView
- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3;
- (_TVLoadingImageView)initWithFrame:(CGRect)a3;
- (void)_fadeInFadeOut;
@end

@implementation _TVLoadingImageView

- (_TVLoadingImageView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TVLoadingImageView;
  v3 = -[_TVLoadingImageView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] whiteColor];
    [(_TVLoadingImageView *)v3 setBackgroundColor:v4];

    [(_TVLoadingImageView *)v3 setAlpha:0.0];
    [(_TVLoadingImageView *)v3 _fadeInFadeOut];
  }
  return v3;
}

- (void)_fadeInFadeOut
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F1CB60];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke;
  v5[3] = &unk_264BA6A38;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_2;
  v3[3] = &unk_264BA7CC0;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:0 delay:v5 options:v3 animations:0.5 completion:0.0];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (UIEdgeInsets)selectionMarginsForSize:(CGSize)a3
{
  double v3 = *MEMORY[0x263F1D1C0];
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

@end