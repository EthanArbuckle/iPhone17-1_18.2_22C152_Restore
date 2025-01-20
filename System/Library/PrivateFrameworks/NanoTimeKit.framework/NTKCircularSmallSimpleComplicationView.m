@interface NTKCircularSmallSimpleComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (double)_imageScaleForTemplate:(id)a3 forDevice:(id)a4;
- (CDComplicationImageView)imageView;
- (CLKUIColoringLabel)label;
- (NTKCircularSmallSimpleComplicationView)initWithFrame:(CGRect)a3;
- (double)_baselineOffsetForDynamicSize:(int64_t)a3;
- (double)maxDynamicFontSize;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_updateForTemplateChange;
- (void)_updateImageViewWithImageProvider:(id)a3;
- (void)_updateLabelWithTextProvider:(id)a3;
- (void)layoutSubviews;
- (void)setImageView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMaxDynamicFontSize:(double)a3;
- (void)updateImageViewWithImage:(id)a3;
- (void)updateLabelWithString:(id)a3;
@end

@implementation NTKCircularSmallSimpleComplicationView

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

- (NTKCircularSmallSimpleComplicationView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularSmallSimpleComplicationView;
  result = -[NTKCircularComplicationView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_maxDynamicFontSize = 3.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)NTKCircularSmallSimpleComplicationView;
  [(NTKCircularComplicationView *)&v39 layoutSubviews];
  [(NTKCircularSmallSimpleComplicationView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_label)
  {
    uint64_t v11 = (uint64_t)fmin(self->_maxDynamicFontSize, 3.0);
    [(NTKCircularComplicationView *)self _layoutConstants];
    v12 = 0;
    if (v38 >= 1.79769313e308 || v11 < 1)
    {
      uint64_t v14 = v11;
    }
    else
    {
      v13 = 0;
      do
      {
        v12 = [(NTKCircularComplicationView *)self _fontForDynamicFontSize:v11];

        [(CLKUIColoringLabel *)self->_label widthForMaxWidth:v12 withFont:v38];
        uint64_t v14 = v11 - 1;
        BOOL v16 = v15 > v38 && (unint64_t)v11 > 1;
        v13 = v12;
        --v11;
      }
      while (v16);
    }
    [(CLKUIColoringLabel *)self->_label setFont:v12];
    label = self->_label;
    [(NTKCircularSmallSimpleComplicationView *)self bounds];
    [(CLKUIColoringLabel *)label setMaxWidth:v18];
    [(CLKUIColoringLabel *)self->_label sizeToFit];
    [(CLKUIColoringLabel *)self->_label frame];
    if (v19 > v38) {
      -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
    }
    NTKPositionSimpleTemperatureLabel(self->_label, v4, v6, v8, v10);
    [(CLKUIColoringLabel *)self->_label frame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    [(NTKCircularSmallSimpleComplicationView *)self _baselineOffsetForDynamicSize:v14 + 1];
    double v27 = v26;
    [(CLKUIColoringLabel *)self->_label _lastLineBaseline];
    -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:", v21, v27 - v28, v23, v25);
  }
  if (self->_imageView)
  {
    v29 = [(NTKCircularComplicationView *)self complicationTemplate];
    objc_opt_class();
    CGFloat v30 = 1.0;
    if (objc_opt_isKindOfClass())
    {
      v31 = objc_opt_class();
      v32 = [(NTKCircularComplicationView *)self device];
      [v31 _imageScaleForTemplate:v29 forDevice:v32];
      CGFloat v30 = v33;
    }
    [(CDComplicationImageView *)self->_imageView sizeToFit];
    imageView = self->_imageView;
    CGAffineTransformMakeScale(&v37, v30, v30);
    [(CDComplicationImageView *)imageView setTransform:&v37];
    v35 = self->_imageView;
    [(CDComplicationImageView *)v35 bounds];
    v36 = [(NTKCircularComplicationView *)self device];
    CLKRectCenteredIntegralRectForDevice();
    -[CDComplicationImageView ntk_setBoundsAndPositionFromFrame:](v35, "ntk_setBoundsAndPositionFromFrame:");
  }
}

+ (double)_imageScaleForTemplate:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&_imageScaleForTemplate_forDevice____lock);
  id WeakRetained = objc_loadWeakRetained(&_imageScaleForTemplate_forDevice____cachedDevice);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  double v8 = WeakRetained;
  id v9 = objc_loadWeakRetained(&_imageScaleForTemplate_forDevice____cachedDevice);
  if (v9 != v6)
  {

LABEL_5:
    id v12 = objc_storeWeak(&_imageScaleForTemplate_forDevice____cachedDevice, v6);
    _imageScaleForTemplate_forDevice____previousCLKDeviceVersion = [v6 version];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke;
    v15[3] = &unk_1E62C26B8;
    id v16 = v5;
    __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke((uint64_t)v15);

    goto LABEL_6;
  }
  uint64_t v10 = [v6 version];
  uint64_t v11 = _imageScaleForTemplate_forDevice____previousCLKDeviceVersion;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_imageScaleForTemplate_forDevice____lock);
  double v13 = *(double *)&_imageScaleForTemplate_forDevice___scale;

  return v13;
}

uint64_t __75__NTKCircularSmallSimpleComplicationView__imageScaleForTemplate_forDevice___block_invoke(uint64_t a1)
{
  float64x2_t v5 = 0uLL;
  [*(id *)(a1 + 32) maxSDKSize:0 deviceSize:&v5 forImageProviderKey:@"imageProvider"];
  float64x2_t v4 = 0uLL;
  uint64_t result = objc_msgSend(MEMORY[0x1E4F19700], "_imageSDKSize:deviceSize:forSDKVersion:", 0, &v4, objc_msgSend(*(id *)(a1 + 32), "sdkVersion"));
  float64x2_t v3 = vdivq_f64(v4, v5);
  if (v3.f64[0] >= v3.f64[1]) {
    v3.f64[0] = v3.f64[1];
  }
  _imageScaleForTemplate_forDevice___scale = *(void *)&v3.f64[0];
  return result;
}

- (double)_baselineOffsetForDynamicSize:(int64_t)a3
{
  [(NTKCircularComplicationView *)self _layoutConstants];
  if (a3 == 3) {
    return 0.0;
  }
  if (a3 == 2) {
    return 0.0;
  }
  double result = 0.0;
  if (a3 == 1) {
    return 0.0;
  }
  return result;
}

- (void)updateLabelWithString:(id)a3
{
  id v4 = [MEMORY[0x1E4F19AB0] textProviderWithText:a3 shortText:0];
  [(NTKCircularSmallSimpleComplicationView *)self _updateLabelWithTextProvider:v4];
}

- (void)updateImageViewWithImage:(id)a3
{
  id v4 = [MEMORY[0x1E4F19A68] imageProviderWithOnePieceImage:a3];
  [(NTKCircularSmallSimpleComplicationView *)self _updateImageViewWithImageProvider:v4];
}

- (void)_updateLabelWithTextProvider:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  if (imageView)
  {
    [(CDComplicationImageView *)imageView removeFromSuperview];
    id v6 = self->_imageView;
    self->_imageView = 0;
  }
  label = self->_label;
  if (!label)
  {
    double v8 = (CLKUIColoringLabel *)objc_opt_new();
    id v9 = self->_label;
    self->_label = v8;

    uint64_t v10 = self->_label;
    uint64_t v11 = [(NTKCircularComplicationView *)self timeTravelDate];
    [(CLKUIColoringLabel *)v10 setInTimeTravel:v11 != 0];

    objc_initWeak(&location, self);
    id v12 = self->_label;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke;
    v18[3] = &unk_1E62C0040;
    objc_copyWeak(&v19, &location);
    [(CLKUIColoringLabel *)v12 setNowProvider:v18];
    double v13 = self->_label;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke_2;
    v16[3] = &unk_1E62C0068;
    objc_copyWeak(&v17, &location);
    [(CLKUIColoringLabel *)v13 setNeedsResizeHandler:v16];
    uint64_t v14 = self->_label;
    [(NTKCircularComplicationView *)self _layoutConstants];
    [(CLKUIColoringLabel *)v14 setMaxWidth:v15];
    [(NTKCircularSmallSimpleComplicationView *)self addSubview:self->_label];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    label = self->_label;
  }
  [(CLKUIColoringLabel *)label setTextProvider:v4];
  [(NTKCircularComplicationView *)self _updateLabelViewColor:self->_label];
  [(NTKCircularSmallSimpleComplicationView *)self setNeedsLayout];
}

id __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  float64x2_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  float64x2_t v5 = v4;

  return v5;
}

void __71__NTKCircularSmallSimpleComplicationView__updateLabelWithTextProvider___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)_updateImageViewWithImageProvider:(id)a3
{
  id v4 = a3;
  label = self->_label;
  id v11 = v4;
  if (label)
  {
    [(CLKUIColoringLabel *)label removeFromSuperview];
    id v6 = self->_label;
    self->_label = 0;

    id v4 = v11;
  }
  char v7 = [off_1E62BD5F0 existingImageView:self->_imageView supportsImageProvider:v4];
  imageView = self->_imageView;
  if ((v7 & 1) == 0)
  {
    [(CDComplicationImageView *)imageView removeFromSuperview];
    id v9 = [off_1E62BD5F0 viewForImageProvider:v11];
    uint64_t v10 = self->_imageView;
    self->_imageView = v9;

    if (self->_imageView)
    {
      -[NTKCircularSmallSimpleComplicationView addSubview:](self, "addSubview:");
      imageView = self->_imageView;
    }
    else
    {
      imageView = 0;
    }
  }
  [(CDComplicationImageView *)imageView setImageProvider:v11];
  [(NTKCircularComplicationView *)self _updateImageViewColor:self->_imageView];
  [(NTKCircularSmallSimpleComplicationView *)self setNeedsLayout];
}

- (void)_updateForTemplateChange
{
  id v5 = [(NTKCircularComplicationView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    float64x2_t v3 = [v5 textProvider];
    [(NTKCircularSmallSimpleComplicationView *)self _updateLabelWithTextProvider:v3];

    self->_maxDynamicFontSize = (double)[v5 maxDynamicFontSize];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v4 = [v5 imageProvider];
      [(NTKCircularSmallSimpleComplicationView *)self _updateImageViewWithImageProvider:v4];
    }
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CDComplicationImageView *))((char *)a3 + 16);
  id v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_imageView);
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (double)maxDynamicFontSize
{
  return self->_maxDynamicFontSize;
}

- (void)setMaxDynamicFontSize:(double)a3
{
  self->_maxDynamicFontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end