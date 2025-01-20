@interface NTKCircularSmallRingImageComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (double)_imageScaleForTemplate:(id)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)layoutSubviews;
- (void)updateRingWithProgressProvider:(id)a3;
@end

@implementation NTKCircularSmallRingImageComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E4F19648] == a3;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCircularSmallRingImageComplicationView;
  [(NTKCircularSmallRingComplicationView *)&v10 layoutSubviews];
  [(NTKCircularSmallRingImageComplicationView *)self bounds];
  id v3 = [(NTKCircularComplicationView *)self complicationTemplate];
  objc_opt_class();
  CGFloat v4 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [(id)objc_opt_class() _imageScaleForTemplate:v3];
    CGFloat v4 = v5;
  }
  [(CDComplicationImageView *)self->_imageView sizeToFit];
  imageView = self->_imageView;
  CGAffineTransformMakeScale(&v9, v4, v4);
  [(CDComplicationImageView *)imageView setTransform:&v9];
  v7 = self->_imageView;
  [(CDComplicationImageView *)v7 bounds];
  v8 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](v7, "ntk_setBoundsAndPositionFromFrame:");
}

+ (double)_imageScaleForTemplate:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate____lock);
  id WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v5 = WeakRetained;
  v6 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v7 = [v6 device];
  id v8 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
  if (v7 != v8)
  {

LABEL_5:
    v13 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v14 = [v13 device];
    objc_storeWeak(&_imageScaleForTemplate____cachedDevice, v14);

    id v15 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice);
    _imageScaleForTemplate____previousCLKDeviceVersion = [v15 version];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke;
    v20[3] = &unk_1E62C26B8;
    id v21 = v3;
    v16 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v17 = [v16 device];
    ((void (*)(void *, void *))__68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke)(v20, v17);

    goto LABEL_6;
  }
  CGAffineTransform v9 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  objc_super v10 = [v9 device];
  uint64_t v11 = [v10 version];
  uint64_t v12 = _imageScaleForTemplate____previousCLKDeviceVersion;

  if (v11 != v12) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate____lock);
  double v18 = *(double *)&_imageScaleForTemplate___scale;

  return v18;
}

uint64_t __68__NTKCircularSmallRingImageComplicationView__imageScaleForTemplate___block_invoke(uint64_t a1)
{
  float64x2_t v5 = 0uLL;
  [*(id *)(a1 + 32) maxSDKSize:0 deviceSize:&v5 forImageProviderKey:@"imageProvider"];
  float64x2_t v4 = 0uLL;
  uint64_t result = objc_msgSend(MEMORY[0x1E4F196F8], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  float64x2_t v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1]) {
    v3.f64[0] = v3.f64[1];
  }
  _imageScaleForTemplate___scale = *(void *)&v3.f64[0];
  return result;
}

- (void)_updateForTemplateChange
{
  float64x2_t v3 = [(NTKCircularComplicationView *)self complicationTemplate];
  float64x2_t v4 = [v3 imageProvider];
  imageView = self->_imageView;
  v6 = [(CDComplicationImageView *)imageView imageProvider];
  char v7 = [off_1E62BD5F0 existingImageView:imageView supportsImageProvider:v6];

  id v8 = self->_imageView;
  if ((v7 & 1) == 0)
  {
    [(CDComplicationImageView *)v8 removeFromSuperview];
    CGAffineTransform v9 = [off_1E62BD5F0 viewForImageProvider:v4];
    objc_super v10 = self->_imageView;
    self->_imageView = v9;

    if (self->_imageView)
    {
      -[NTKCircularSmallRingImageComplicationView addSubview:](self, "addSubview:");
      id v8 = self->_imageView;
    }
    else
    {
      id v8 = 0;
    }
  }
  [(CDComplicationImageView *)v8 setImageProvider:v4];
  [(NTKCircularComplicationView *)self _updateImageViewColor:self->_imageView];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v11 = [v3 progressProvider];
    progressProvider = self->_progressProvider;
    if (v11 != (NTKRing *)progressProvider)
    {
      [(CLKProgressProvider *)progressProvider stopUpdatesForToken:self->_progressUpdateToken];
      objc_storeStrong((id *)&self->_progressProvider, v11);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v11);
      v13 = self->_progressProvider;
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __69__NTKCircularSmallRingImageComplicationView__updateForTemplateChange__block_invoke;
      id v21 = &unk_1E62C2450;
      objc_copyWeak(&v22, &location);
      objc_copyWeak(&v23, &from);
      v14 = [(CLKProgressProvider *)v13 startUpdatesWithHandler:&v18];
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v14;

      -[NTKCircularSmallRingImageComplicationView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v11, v18, v19, v20, v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v16 = [NTKRing alloc];
    [v3 fillFraction];
    uint64_t v11 = -[NTKRing initWithFillFraction:style:](v16, "initWithFillFraction:style:", [v3 ringStyle], v17);
    [(NTKCircularSmallRingComplicationView *)self updateRingWithRingDescription:v11];
  }

  [(NTKCircularSmallRingImageComplicationView *)self setNeedsLayout];
}

void __69__NTKCircularSmallRingImageComplicationView__updateForTemplateChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateRingWithProgressProvider:v2];
}

- (void)updateRingWithProgressProvider:(id)a3
{
  id v14 = a3;
  float64x2_t v4 = [(NTKCircularComplicationView *)self timeTravelDate];
  float64x2_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  char v7 = v6;

  id v8 = [NTKRing alloc];
  [v14 progressFractionForNow:v7];
  double v10 = v9;
  uint64_t v11 = [(NTKCircularComplicationView *)self complicationTemplate];
  uint64_t v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", [v11 ringStyle], v10);

  [v14 backgroundRingAlpha];
  if (v13 >= 0.0)
  {
    [v14 backgroundRingAlpha];
    -[NTKRing setBackgroundRingAlpha:](v12, "setBackgroundRingAlpha:");
  }
  [(NTKCircularSmallRingComplicationView *)self updateRingWithRingDescription:v12];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCircularSmallRingImageComplicationView;
  float64x2_t v4 = (void (**)(id, CDComplicationImageView *))a3;
  [(NTKCircularSmallRingComplicationView *)&v5 _enumerateForegroundColoringViewsWithBlock:v4];
  v4[2](v4, self->_imageView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end