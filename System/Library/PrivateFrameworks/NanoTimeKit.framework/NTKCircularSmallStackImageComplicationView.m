@interface NTKCircularSmallStackImageComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (double)_imageScaleForTemplate:(id)a3;
- (NTKCircularSmallStackImageComplicationView)initWithFrame:(CGRect)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)_updateLabelsForFontChange;
- (void)layoutSubviews;
@end

@implementation NTKCircularSmallStackImageComplicationView

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

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return a3 == 4 || *MEMORY[0x1E4F19648] == a3;
}

- (NTKCircularSmallStackImageComplicationView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)NTKCircularSmallStackImageComplicationView;
  id v3 = -[NTKCircularComplicationView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(NTKCircularComplicationView *)v3 _fontForDynamicFontSize:1];
    uint64_t v6 = [(NTKCircularComplicationView *)v4 _newLabelSubviewWithFont:v5];
    label = v4->_label;
    v4->_label = (CLKUIColoringLabel *)v6;

    v8 = v4->_label;
    [(NTKCircularComplicationView *)v4 _layoutConstants];
    [(CLKUIColoringLabel *)v8 setMaxWidth:v10];
  }
  return v4;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTKCircularSmallStackImageComplicationView;
  [(NTKCircularComplicationView *)&v21 layoutSubviews];
  [(NTKCircularSmallStackImageComplicationView *)self bounds];
  memset(v20, 0, 152);
  id v3 = [(NTKCircularComplicationView *)self device];
  if ([(NTKCircularComplicationView *)self usesMediumLayout]) {
    _LayoutConstantsMedium(v3, (uint64_t)v20);
  }
  else {
    _LayoutConstantsSmall(v3, (uint64_t)v20);
  }

  [(CDComplicationImageView *)self->_imageView sizeToFit];
  [(CLKUIColoringLabel *)self->_label sizeToFit];
  v4 = [(NTKCircularComplicationView *)self complicationTemplate];
  objc_opt_class();
  CGFloat v5 = 1.0;
  if (objc_opt_isKindOfClass())
  {
    [(id)objc_opt_class() _imageScaleForTemplate:v4];
    CGFloat v5 = v6;
  }
  [(CDComplicationImageView *)self->_imageView bounds];
  imageView = self->_imageView;
  v8 = [(NTKCircularComplicationView *)self device];
  CLKRectIntegralForDevice();
  -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](imageView, "ntk_setBoundsAndPositionFromFrame:");

  v9 = self->_imageView;
  CGAffineTransformMakeScale(&v19, v5, v5);
  [(CDComplicationImageView *)v9 setTransform:&v19];
  [(CLKUIColoringLabel *)self->_label frame];
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(CLKUIColoringLabel *)self->_label _lastLineBaseline];
  double v10 = [(NTKCircularComplicationView *)self device];
  CLKRectCenteredXInRectForDevice();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v12, v14, v16, v18);
}

+ (double)_imageScaleForTemplate:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate____lock_355);
  id WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_356);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  CGFloat v5 = WeakRetained;
  double v6 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v7 = [v6 device];
  id v8 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_356);
  if (v7 != v8)
  {

LABEL_5:
    double v13 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    double v14 = [v13 device];
    objc_storeWeak(&_imageScaleForTemplate____cachedDevice_356, v14);

    id v15 = objc_loadWeakRetained(&_imageScaleForTemplate____cachedDevice_356);
    _imageScaleForTemplate____previousCLKDeviceVersion_357 = [v15 version];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke;
    v20[3] = &unk_1E62C26B8;
    id v21 = v3;
    double v16 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    double v17 = [v16 device];
    ((void (*)(void *, void *))__69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke)(v20, v17);

    goto LABEL_6;
  }
  v9 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  double v10 = [v9 device];
  uint64_t v11 = [v10 version];
  uint64_t v12 = _imageScaleForTemplate____previousCLKDeviceVersion_357;

  if (v11 != v12) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate____lock_355);
  double v18 = *(double *)&_imageScaleForTemplate___scale_354;

  return v18;
}

uint64_t __69__NTKCircularSmallStackImageComplicationView__imageScaleForTemplate___block_invoke(uint64_t a1)
{
  float64x2_t v5 = 0uLL;
  [*(id *)(a1 + 32) maxSDKSize:0 deviceSize:&v5 forImageProviderKey:@"line1ImageProvider"];
  float64x2_t v4 = 0uLL;
  uint64_t result = objc_msgSend(MEMORY[0x1E4F19710], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  float64x2_t v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1]) {
    v3.f64[0] = v3.f64[1];
  }
  _imageScaleForTemplate___scale_354 = *(void *)&v3.f64[0];
  return result;
}

- (void)_updateForTemplateChange
{
  float64x2_t v3 = [(NTKCircularComplicationView *)self complicationTemplate];
  label = self->_label;
  id v13 = v3;
  float64x2_t v5 = [v3 line2TextProvider];
  [(CLKUIColoringLabel *)label setTextProvider:v5];

  if ([(NTKCircularComplicationView *)self usesMediumLayout]) {
    [(NTKCircularSmallStackImageComplicationView *)self _updateLabelsForFontChange];
  }
  double v6 = [v13 line1ImageProvider];
  imageView = self->_imageView;
  id v8 = [(CDComplicationImageView *)imageView imageProvider];
  char v9 = [off_1E62BD5F0 existingImageView:imageView supportsImageProvider:v8];

  double v10 = self->_imageView;
  if ((v9 & 1) == 0)
  {
    [(CDComplicationImageView *)v10 removeFromSuperview];
    uint64_t v11 = [off_1E62BD5F0 viewForImageProvider:v6];
    uint64_t v12 = self->_imageView;
    self->_imageView = v11;

    if (self->_imageView)
    {
      -[NTKCircularSmallStackImageComplicationView addSubview:](self, "addSubview:");
      double v10 = self->_imageView;
    }
    else
    {
      double v10 = 0;
    }
  }
  [(CDComplicationImageView *)v10 setImageProvider:v6];
  [(NTKCircularComplicationView *)self _updateImageViewColor:self->_imageView];
  [(NTKCircularSmallStackImageComplicationView *)self setNeedsLayout];
}

- (void)_updateLabelsForFontChange
{
  if ([(NTKCircularComplicationView *)self usesMediumLayout])
  {
    float64x2_t v3 = [(CLKUIColoringLabel *)self->_label text];
    float64x2_t v4 = [(NTKCircularComplicationView *)self _mediumStackFontForText:v3];
  }
  else
  {
    float64x2_t v4 = [(NTKCircularComplicationView *)self _fontForDynamicFontSize:1];
  }
  [(CLKUIColoringLabel *)self->_label setFont:v4];
  label = self->_label;
  [(NTKCircularComplicationView *)self _layoutConstants];
  [(CLKUIColoringLabel *)label setMaxWidth:v6];
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  float64x2_t v4 = (void (**)(id, CDComplicationImageView *))((char *)a3 + 16);
  float64x2_t v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_imageView);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end