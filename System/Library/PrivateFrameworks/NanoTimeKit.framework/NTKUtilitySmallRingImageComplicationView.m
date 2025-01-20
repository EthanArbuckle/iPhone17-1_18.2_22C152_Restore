@interface NTKUtilitySmallRingImageComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (id)ringColor;
- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3;
- (void)_enumerateColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)_updateWithImageProvider:(id)a3;
- (void)layoutSubviews;
- (void)updateRingWithProgressProvider:(id)a3;
@end

@implementation NTKUtilitySmallRingImageComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  [(NTKUtilitySmallRingComplicationView *)&v13 layoutSubviews];
  id v3 = [(NTKUtilityCircularComplicationView *)self contentView];
  [v3 bounds];

  [(CDComplicationImageView *)self->_imageView sizeToFit];
  [(CDComplicationImageView *)self->_imageView frame];
  v4 = [(NTKUtilityComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CDComplicationImageView setFrame:](self->_imageView, "setFrame:", v6, v8, v10, v12);
}

- (void)_updateWithImageProvider:(id)a3
{
  id v10 = a3;
  char v4 = objc_msgSend(off_1E62BD5F0, "existingImageView:supportsImageProvider:", self->_imageView);
  imageView = self->_imageView;
  if ((v4 & 1) == 0)
  {
    [(CDComplicationImageView *)self->_imageView removeFromSuperview];
    double v6 = [off_1E62BD5F0 viewForImageProvider:v10];
    double v7 = self->_imageView;
    self->_imageView = v6;

    imageView = self->_imageView;
    if (imageView)
    {
      -[NTKUtilityComplicationView _updateImageViewAlpha:](self, "_updateImageViewAlpha:");
      double v8 = [(NTKUtilityCircularComplicationView *)self contentView];
      [v8 addSubview:self->_imageView];

      imageView = self->_imageView;
    }
  }
  [(NTKUtilityComplicationView *)self _updateImageViewColor:imageView];
  [(CDComplicationImageView *)self->_imageView setImageProvider:v10];
  [(NTKUtilitySmallRingImageComplicationView *)self setNeedsLayout];
  double v9 = [(NTKUtilityComplicationView *)self displayObserver];
  [v9 complicationDisplayNeedsResize:self];
}

- (void)_updateForTemplateChange
{
  v20.receiver = self;
  v20.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  [(NTKUtilityComplicationView *)&v20 _updateForTemplateChange];
  id v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  char v4 = [v3 imageProvider];
  [(NTKUtilitySmallRingImageComplicationView *)self _updateWithImageProvider:v4];

  [(NTKUtilityComplicationView *)self _updateImageViewAlpha:self->_imageView];
  [(NTKUtilityComplicationView *)self _updateImageViewColor:self->_imageView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [v3 progressProvider];
    progressProvider = self->_progressProvider;
    if (v5 != (NTKRing *)progressProvider)
    {
      [(CLKProgressProvider *)progressProvider stopUpdatesForToken:self->_progressUpdateToken];
      objc_storeStrong((id *)&self->_progressProvider, v5);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      double v7 = self->_progressProvider;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      v14 = __68__NTKUtilitySmallRingImageComplicationView__updateForTemplateChange__block_invoke;
      v15 = &unk_1E62C2450;
      objc_copyWeak(&v16, &location);
      objc_copyWeak(&v17, &from);
      double v8 = [(CLKProgressProvider *)v7 startUpdatesWithHandler:&v12];
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v8;

      -[NTKUtilitySmallRingImageComplicationView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v5, v12, v13, v14, v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v10 = [NTKRing alloc];
    [v3 fillFraction];
    double v5 = -[NTKRing initWithFillFraction:style:](v10, "initWithFillFraction:style:", [v3 ringStyle], v11);
    [(NTKUtilitySmallRingComplicationView *)self updateRingWithRingDescription:v5];
  }
}

void __68__NTKUtilitySmallRingImageComplicationView__updateForTemplateChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateRingWithProgressProvider:v2];
}

- (void)updateRingWithProgressProvider:(id)a3
{
  id v17 = a3;
  char v4 = [(NTKUtilityComplicationView *)self timeTravelDate];
  double v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  double v7 = v6;

  double v8 = [NTKRing alloc];
  [v17 progressFractionForNow:v7];
  double v10 = v9;
  float v11 = [(NTKUtilityComplicationView *)self complicationTemplate];
  uint64_t v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", [v11 ringStyle], v10);

  [v17 backgroundRingAlpha];
  if (v13 >= 0.0)
  {
    [v17 backgroundRingAlpha];
    double v15 = v14;
    id v16 = [(NTKUtilityComplicationView *)self device];
    _LayoutConstants_49(v16, v18);
    [(NTKUtilitySmallRingComplicationView *)self updateRingWithRingDescription:v12 backgroundRingAlpha:v15 / v19];
  }
  else
  {
    [(NTKUtilitySmallRingComplicationView *)self updateRingWithRingDescription:v12];
  }
}

- (void)_enumerateColoringViewsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKUtilitySmallRingImageComplicationView;
  char v4 = (void (**)(id, CDComplicationImageView *))a3;
  [(NTKUtilitySmallRingComplicationView *)&v5 _enumerateColoringViewsWithBlock:v4];
  v4[2](v4, self->_imageView);
}

- (void)_enumerateColoringStackedImagesViewsWithBlock:(id)a3
{
  char v4 = (void (**)(id, CDComplicationImageView *))a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4[2](v4, self->_imageView);
  }
}

- (id)ringColor
{
  id v2 = [(NTKUtilityComplicationView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 progressProvider];
    char v4 = [v3 tintColor];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end