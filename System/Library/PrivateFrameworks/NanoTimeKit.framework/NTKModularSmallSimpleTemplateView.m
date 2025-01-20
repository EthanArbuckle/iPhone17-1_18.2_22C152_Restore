@interface NTKModularSmallSimpleTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (id)supportedTemplateClasses;
- (NTKModularSmallSimpleTemplateView)initWithFrame:(CGRect)a3;
- (double)_maxTextWidthForDynamicFontSize:(int64_t)a3;
- (void)_configureWithImageTemplate:(id)a3;
- (void)_configureWithTextTemplate:(id)a3;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_update;
@end

@implementation NTKModularSmallSimpleTemplateView

- (NTKModularSmallSimpleTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallSimpleTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NTKModularSmallSimpleTemplateView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)_update
{
  id v4 = [(NTKModularTemplateView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [(NTKModularSmallSimpleTemplateView *)self _configureWithTextTemplate:v4];
  }
  else {
    [(NTKModularSmallSimpleTemplateView *)self _configureWithImageTemplate:v4];
  }
  v3 = [(NTKModuleView *)self contentView];
  [v3 setNeedsLayout];
}

- (void)_layoutContentView
{
  v3 = [(NTKModuleView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (self->_label)
  {
    int64_t maxDynamicFontSize = self->_maxDynamicFontSize;
    [(NTKModularSmallSimpleTemplateView *)self _maxTextWidthForDynamicFontSize:maxDynamicFontSize];
    double v14 = v13;
    v15 = 0;
    if (v13 < 1.79769313e308 && (maxDynamicFontSize & 0x8000000000000000) == 0)
    {
      v16 = 0;
      while (1)
      {
        [(NTKModularSmallSimpleTemplateView *)self _maxTextWidthForDynamicFontSize:maxDynamicFontSize];
        double v14 = v17;
        BOOL v18 = [(NTKComplicationModuleView *)self isXL];
        id v19 = [(NTKModuleView *)self device];
        if (v18)
        {
          os_unfair_lock_lock((os_unfair_lock_t)&_FontForExtraLargeDynamicSize___lock);
          id WeakRetained = objc_loadWeakRetained(&_FontForExtraLargeDynamicSize___cachedDevice);
          if (!WeakRetained) {
            goto LABEL_13;
          }
          v21 = WeakRetained;
          id v22 = objc_loadWeakRetained(&_FontForExtraLargeDynamicSize___cachedDevice);
          if (v22 != v19)
          {

            goto LABEL_13;
          }
          uint64_t v26 = [v19 version];
          uint64_t v27 = _FontForExtraLargeDynamicSize___previousCLKDeviceVersion;

          if (v26 != v27)
          {
LABEL_13:
            id v28 = objc_storeWeak(&_FontForExtraLargeDynamicSize___cachedDevice, v19);
            _FontForExtraLargeDynamicSize___previousCLKDeviceVersion = [v19 version];

            ___FontForExtraLargeDynamicSize_block_invoke(v29, v19);
          }
          os_unfair_lock_unlock((os_unfair_lock_t)&_FontForExtraLargeDynamicSize___lock);
          v30 = (void *)_FontForExtraLargeDynamicSize_fonts;
          goto LABEL_18;
        }
        os_unfair_lock_lock((os_unfair_lock_t)&_FontForModularSmallDynamicSize___lock);
        id v23 = objc_loadWeakRetained(&_FontForModularSmallDynamicSize___cachedDevice);
        if (!v23) {
          goto LABEL_16;
        }
        v24 = v23;
        id v25 = objc_loadWeakRetained(&_FontForModularSmallDynamicSize___cachedDevice);
        if (v25 != v19) {
          break;
        }
        uint64_t v31 = [v19 version];
        uint64_t v32 = _FontForModularSmallDynamicSize___previousCLKDeviceVersion;

        if (v31 != v32) {
          goto LABEL_16;
        }
LABEL_17:
        os_unfair_lock_unlock((os_unfair_lock_t)&_FontForModularSmallDynamicSize___lock);
        v30 = (void *)_FontForModularSmallDynamicSize_fonts;
LABEL_18:
        v35 = [NSNumber numberWithInteger:maxDynamicFontSize];
        v15 = [v30 objectForKeyedSubscript:v35];

        [(CLKUIColoringLabel *)self->_label widthForMaxWidth:v15 withFont:v14];
        if (v36 > v14)
        {
          v16 = v15;
          if (maxDynamicFontSize-- > 0) {
            continue;
          }
        }
        goto LABEL_21;
      }

LABEL_16:
      id v33 = objc_storeWeak(&_FontForModularSmallDynamicSize___cachedDevice, v19);
      _FontForModularSmallDynamicSize___previousCLKDeviceVersion = [v19 version];

      ___FontForModularSmallDynamicSize_block_invoke(v34, v19);
      goto LABEL_17;
    }
LABEL_21:
    [(CLKUIColoringLabel *)self->_label setFont:v15];
    [(CLKUIColoringLabel *)self->_label sizeToFit];
    [(CLKUIColoringLabel *)self->_label frame];
    if (v38 > v14) {
      -[CLKUIColoringLabel setFrame:](self->_label, "setFrame:");
    }
    NTKPositionSimpleTemperatureLabel(self->_label, v5, v7, v9, v11);
  }
  imageView = self->_imageView;
  if (imageView)
  {
    -[CDComplicationImageView sizeThatFits:](imageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    v40 = [(NTKModuleView *)self device];
    CLKRectCenteredIntegralRectForDevice();
    double v42 = v41;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;

    v49 = self->_imageView;
    -[CDComplicationImageView setFrame:](v49, "setFrame:", v42, v44, v46, v48);
  }
}

- (void)_configureWithTextTemplate:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  if (imageView)
  {
    [(CDComplicationImageView *)imageView removeFromSuperview];
    double v6 = self->_imageView;
    self->_imageView = 0;
  }
  if (!self->_label)
  {
    double v7 = (CLKUIColoringLabel *)objc_opt_new();
    label = self->_label;
    self->_label = v7;

    double v9 = self->_label;
    double v10 = [(NTKModuleView *)self foregroundColor];
    [(CLKUIColoringLabel *)v9 setTextColor:v10];

    double v11 = self->_label;
    v12 = [(NTKModularTemplateView *)self timeTravelDate];
    [(CLKUIColoringLabel *)v11 setInTimeTravel:v12 != 0];

    objc_initWeak(&location, self);
    double v13 = self->_label;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke;
    v24[3] = &unk_1E62C0040;
    objc_copyWeak(&v25, &location);
    [(CLKUIColoringLabel *)v13 setNowProvider:v24];
    double v14 = self->_label;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke_2;
    v22[3] = &unk_1E62C0068;
    objc_copyWeak(&v23, &location);
    [(CLKUIColoringLabel *)v14 setNeedsResizeHandler:v22];
    v15 = [(NTKModuleView *)self contentView];
    [v15 addSubview:self->_label];

    v16 = self->_label;
    double v17 = [(NTKModuleView *)self device];
    _LayoutConstants_24(v17, [(NTKComplicationModuleView *)self isXL], &v20);
    [(CLKUIColoringLabel *)v16 setMaxWidth:v21];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  self->_int64_t maxDynamicFontSize = [v4 maxDynamicFontSize];
  BOOL v18 = self->_label;
  id v19 = [v4 textProvider];
  [(CLKUIColoringLabel *)v18 setTextProvider:v19];
}

id __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  double v5 = v4;

  return v5;
}

void __64__NTKModularSmallSimpleTemplateView__configureWithTextTemplate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (void)_configureWithImageTemplate:(id)a3
{
  id v14 = a3;
  label = self->_label;
  if (label)
  {
    [(CLKUIColoringLabel *)label removeFromSuperview];
    double v5 = self->_label;
    self->_label = 0;
  }
  double v6 = [v14 imageProvider];
  char v7 = [off_1E62BD5F0 existingImageView:self->_imageView supportsImageProvider:v6];
  imageView = self->_imageView;
  if ((v7 & 1) == 0)
  {
    [(CDComplicationImageView *)imageView removeFromSuperview];
    double v9 = [off_1E62BD5F0 viewForImageProvider:v6];
    double v10 = self->_imageView;
    self->_imageView = v9;

    double v11 = self->_imageView;
    if (v11)
    {
      v12 = [(NTKModuleView *)self foregroundColor];
      [(CDComplicationImageView *)v11 setColor:v12];

      double v13 = [(NTKModuleView *)self contentView];
      [v13 addSubview:self->_imageView];

      imageView = self->_imageView;
    }
    else
    {
      imageView = 0;
    }
  }
  [(CDComplicationImageView *)imageView setImageProvider:v6];
}

- (double)_maxTextWidthForDynamicFontSize:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v4 = [(NTKModuleView *)self device];
      _LayoutConstants_24(v4, [(NTKComplicationModuleView *)self isXL], &v14);
      double v5 = v15;
      goto LABEL_8;
    case 1:
      id v4 = [(NTKModuleView *)self device];
      _LayoutConstants_24(v4, [(NTKComplicationModuleView *)self isXL], &v12);
      double v5 = v13;
      goto LABEL_8;
    case 2:
      id v4 = [(NTKModuleView *)self device];
      _LayoutConstants_24(v4, [(NTKComplicationModuleView *)self isXL], &v10);
      double v5 = v11;
      goto LABEL_8;
    case 3:
      id v4 = [(NTKModuleView *)self device];
      _LayoutConstants_24(v4, [(NTKComplicationModuleView *)self isXL], &v9);
      double v5 = *((double *)&v9 + 1);
      goto LABEL_8;
    case 4:
      id v4 = [(NTKModuleView *)self device];
      _LayoutConstants_24(v4, [(NTKComplicationModuleView *)self isXL], v8);
      double v5 = v8[0];
LABEL_8:

      break;
    default:
      double v5 = 0.0;
      break;
  }
  [(NTKModularSmallSimpleTemplateView *)self frame];
  return fmin(v5, v6);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  id v4 = (void (**)(id, CDComplicationImageView *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_imageView);
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [a1 supportedTemplateClasses];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

+ (id)supportedTemplateClasses
{
  if (supportedTemplateClasses_onceToken_0 != -1) {
    dispatch_once(&supportedTemplateClasses_onceToken_0, &__block_literal_global_100);
  }
  v2 = (void *)supportedTemplateClasses__supportedClasses_0;
  return v2;
}

void __61__NTKModularSmallSimpleTemplateView_supportedTemplateClasses__block_invoke()
{
  v2[4] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:4];
  v1 = (void *)supportedTemplateClasses__supportedClasses_0;
  supportedTemplateClasses__supportedClasses_0 = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end