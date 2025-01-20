@interface NTKUtilitySmallImageTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (CDComplicationImageView)imageView;
- (NTKUtilitySmallImageTemplateView)initWithFrame:(CGRect)a3;
- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3;
- (void)_enumerateColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_setNeedsLayoutContent;
- (void)_updateForTemplateChange;
- (void)setImageView:(id)a3;
@end

@implementation NTKUtilitySmallImageTemplateView

- (NTKUtilitySmallImageTemplateView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKUtilitySmallImageTemplateView;
  result = -[NTKUtilityCircularComplicationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_needsLayoutContent = 1;
  }
  return result;
}

- (void)_layoutContentView
{
  if (self->_needsLayoutContent)
  {
    v3 = [(NTKUtilityCircularComplicationView *)self contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", v5, v7);
    v8 = [(NTKUtilityComplicationView *)self device];
    CLKRectCenteredIntegralRectForDevice();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v10, v12, v14, v16);
    self->_needsLayoutContent = 0;
  }
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updateForTemplateChange
{
  v12.receiver = self;
  v12.super_class = (Class)NTKUtilitySmallImageTemplateView;
  [(NTKUtilityComplicationView *)&v12 _updateForTemplateChange];
  id v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  double v4 = [v3 imageProvider];
  char v5 = [off_1E62BD5F0 existingImageView:self->_imageView supportsImageProvider:v4];
  imageView = self->_imageView;
  if ((v5 & 1) == 0)
  {
    [(CDComplicationImageView *)self->_imageView removeFromSuperview];
    double v7 = [off_1E62BD5F0 viewForImageProvider:v4];
    v8 = self->_imageView;
    self->_imageView = v7;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      double v9 = [(NTKUtilityCircularComplicationView *)self contentView];
      [v9 addSubview:self->_imageView];

      imageView = self->_imageView;
    }
  }
  [(NTKUtilityComplicationView *)self _updateImageViewColor:imageView];
  double v10 = self->_imageView;
  double v11 = [v3 imageProvider];
  [(CDComplicationImageView *)v10 setImageProvider:v11];

  [(NTKUtilitySmallImageTemplateView *)self _setNeedsLayoutContent];
}

- (void)_setNeedsLayoutContent
{
  self->_needsLayoutContent = 1;
  id v3 = [(NTKUtilityCircularComplicationView *)self contentView];
  [v3 setNeedsLayout];

  id v4 = [(NTKUtilityComplicationView *)self displayObserver];
  [v4 complicationDisplayNeedsResize:self];
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4[2](v4, self->_imageView);
  }
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end