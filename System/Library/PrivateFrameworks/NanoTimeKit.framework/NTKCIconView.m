@interface NTKCIconView
+ (double)size;
- (CGSize)intrinsicContentSize;
- (NTKCIconView)initWithFrame:(CGRect)a3;
- (NTKCIconView)initWithImage:(id)a3;
- (void)_resizeCornerRadius;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation NTKCIconView

+ (double)size
{
  if (size_onceToken != -1) {
    dispatch_once(&size_onceToken, &__block_literal_global_44);
  }
  return *(double *)&size_size;
}

uint64_t __20__NTKCIconView_size__block_invoke()
{
  uint64_t result = NTKCScreenStyle();
  double v1 = 26.6666667;
  if (result != 1) {
    double v1 = 24.0;
  }
  size_size = *(void *)&v1;
  return result;
}

- (NTKCIconView)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(id)objc_opt_class() size];
  v9.receiver = self;
  v9.super_class = (Class)NTKCIconView;
  v7 = -[NTKCIconView initWithFrame:](&v9, sel_initWithFrame_, x, y, v6, v6);
  [(NTKCIconView *)v7 setClipsToBounds:1];
  return v7;
}

- (NTKCIconView)initWithImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCIconView;
  v3 = [(NTKCIconView *)&v5 initWithImage:a3];
  [(NTKCIconView *)v3 setClipsToBounds:1];
  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(id)objc_opt_class() size];
  double v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCIconView;
  -[NTKCIconView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NTKCIconView *)self _resizeCornerRadius];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCIconView;
  -[NTKCIconView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(NTKCIconView *)self _resizeCornerRadius];
}

- (void)_resizeCornerRadius
{
  [(NTKCIconView *)self bounds];
  CGRectGetWidth(v7);
  UIFloorToViewScale();
  double v4 = v3;
  id v5 = [(NTKCIconView *)self layer];
  [v5 setCornerRadius:v4];
}

@end