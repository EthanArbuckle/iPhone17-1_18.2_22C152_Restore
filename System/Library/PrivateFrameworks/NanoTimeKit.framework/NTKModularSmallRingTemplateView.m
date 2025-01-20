@interface NTKModularSmallRingTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
+ (id)supportedTemplateClasses;
- (CLKUIColoringImageView)stateRing;
- (CLKUIColoringLabel)label;
- (NTKModularSmallRingTemplateView)initWithFrame:(CGRect)a3;
- (void)_configureContentSubviews;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_layoutContentView;
- (void)_refreshRingImage;
- (void)_refreshRingImageWithRing:(id)a3;
- (void)_update;
- (void)_updateRingWithRingDescription:(id)a3;
- (void)setIsXL:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setStateRing:(id)a3;
- (void)updateRingWithProgressProvider:(id)a3;
@end

@implementation NTKModularSmallRingTemplateView

- (NTKModularSmallRingTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallRingTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NTKModularSmallRingTemplateView *)v3 _configureContentSubviews];
    v4->_level = INFINITY;
  }
  return v4;
}

- (void)_configureContentSubviews
{
  v3 = [(CLKUIColoringLabel *)self->_label textProvider];
  [(CLKUIColoringImageView *)self->_stateRing removeFromSuperview];
  [(CLKUIColoringLabel *)self->_label removeFromSuperview];
  double v24 = 0.0;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(NTKModuleView *)self device];
  _LayoutConstants_6(v4, [(NTKComplicationModuleView *)self isXL], (uint64_t)&v22);

  id v5 = objc_alloc((Class)off_1E62BDB50);
  objc_super v6 = (CLKUIColoringImageView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), *((double *)&v22 + 1), *(double *)&v23);
  stateRing = self->_stateRing;
  self->_stateRing = v6;

  v8 = [(NTKModuleView *)self contentView];
  [v8 addSubview:self->_stateRing];

  v9 = [MEMORY[0x1E4F19A50] systemFontOfSize:*(double *)&v22];
  v10 = (CLKUIColoringLabel *)objc_alloc_init((Class)off_1E62BDB58);
  label = self->_label;
  self->_label = v10;

  [(CLKUIColoringLabel *)self->_label setFont:v9];
  [(CLKUIColoringLabel *)self->_label setTextProvider:v3];
  [(CLKUIColoringLabel *)self->_label setMaxWidth:v24];
  v12 = self->_label;
  v13 = [(NTKModularTemplateView *)self timeTravelDate];
  [(CLKUIColoringLabel *)v12 setInTimeTravel:v13 != 0];

  objc_initWeak(&location, self);
  v14 = self->_label;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke;
  v19[3] = &unk_1E62C0040;
  objc_copyWeak(&v20, &location);
  [(CLKUIColoringLabel *)v14 setNowProvider:v19];
  v15 = self->_label;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke_2;
  v17[3] = &unk_1E62C0068;
  objc_copyWeak(&v18, &location);
  [(CLKUIColoringLabel *)v15 setNeedsResizeHandler:v17];
  v16 = [(NTKModuleView *)self contentView];
  [v16 addSubview:self->_label];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

id __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke(uint64_t a1)
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
  id v5 = v4;

  return v5;
}

void __60__NTKModularSmallRingTemplateView__configureContentSubviews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained contentView];
  [v1 setNeedsLayout];
}

- (void)setIsXL:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallRingTemplateView;
  [(NTKComplicationModuleView *)&v4 setIsXL:a3];
  [(NTKModularSmallRingTemplateView *)self _configureContentSubviews];
  [(NTKModuleView *)self _updateColors];
  [(NTKModularSmallRingTemplateView *)self _refreshRingImage];
  [(NTKModularSmallRingTemplateView *)self _layoutContentView];
}

- (void)_update
{
  v3 = [(NTKModularTemplateView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(CDComplicationImageView *)self->_imageView setHidden:1];
    [(CLKUIColoringLabel *)self->_label setHidden:0];
    label = self->_label;
    id v5 = [v3 textProvider];
    [(CLKUIColoringLabel *)label setTextProvider:v5];
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(CLKUIColoringLabel *)self->_label setHidden:1];
    id v5 = [v3 imageProvider];
    char v6 = [off_1E62BD5F0 existingImageView:self->_imageView supportsImageProvider:v5];
    imageView = self->_imageView;
    if ((v6 & 1) == 0)
    {
      [(CDComplicationImageView *)imageView removeFromSuperview];
      v8 = [off_1E62BD5F0 viewForImageProvider:v5];
      v9 = self->_imageView;
      self->_imageView = v8;

      v10 = self->_imageView;
      if (v10)
      {
        v11 = [(NTKModuleView *)self foregroundColor];
        [(CDComplicationImageView *)v10 setColor:v11];

        v12 = [(NTKModuleView *)self contentView];
        [v12 addSubview:self->_imageView];

        imageView = self->_imageView;
      }
      else
      {
        imageView = 0;
      }
    }
    [(CDComplicationImageView *)imageView setHidden:0];
    [(CDComplicationImageView *)self->_imageView setImageProvider:v5];
    goto LABEL_13;
  }
LABEL_14:
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v13 = [v3 progressProvider];
    progressProvider = self->_progressProvider;
    if (v13 != (NTKRing *)progressProvider)
    {
      [(CLKProgressProvider *)progressProvider stopUpdatesForToken:self->_progressUpdateToken];
      objc_storeStrong((id *)&self->_progressProvider, v13);
      v15 = [(NTKRing *)v13 tintColor];

      if (v15)
      {
        v16 = [(NTKRing *)v13 tintColor];
        [(CLKUIColoringImageView *)self->_stateRing setOverrideColor:v16];
      }
      objc_initWeak(&location, self);
      objc_initWeak(&from, v13);
      v17 = self->_progressProvider;
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __42__NTKModularSmallRingTemplateView__update__block_invoke;
      v26 = &unk_1E62C2450;
      objc_copyWeak(&v27, &location);
      objc_copyWeak(&v28, &from);
      id v18 = [(CLKProgressProvider *)v17 startUpdatesWithHandler:&v23];
      progressUpdateToken = self->_progressUpdateToken;
      self->_progressUpdateToken = v18;

      -[NTKModularSmallRingTemplateView updateRingWithProgressProvider:](self, "updateRingWithProgressProvider:", v13, v23, v24, v25, v26);
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    id v20 = [NTKRing alloc];
    [v3 fillFraction];
    v13 = -[NTKRing initWithFillFraction:style:](v20, "initWithFillFraction:style:", [v3 ringStyle], v21);
    [(NTKModularSmallRingTemplateView *)self _updateRingWithRingDescription:v13];
  }

  long long v22 = [(NTKModuleView *)self contentView];
  [v22 setNeedsLayout];
}

void __42__NTKModularSmallRingTemplateView__update__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateRingWithProgressProvider:v2];
}

- (void)updateRingWithProgressProvider:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(NTKModularTemplateView *)self timeTravelDate];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F19A20] complicationDate];
  }
  v7 = v6;

  v8 = [NTKRing alloc];
  [v14 progressFractionForNow:v7];
  double v10 = v9;
  v11 = [(NTKModularTemplateView *)self complicationTemplate];
  v12 = -[NTKRing initWithFillFraction:style:](v8, "initWithFillFraction:style:", [v11 ringStyle], v10);

  [v14 backgroundRingAlpha];
  if (v13 >= 0.0)
  {
    [v14 backgroundRingAlpha];
    -[NTKRing setBackgroundRingAlpha:](v12, "setBackgroundRingAlpha:");
  }
  [(NTKModularSmallRingTemplateView *)self _updateRingWithRingDescription:v12];
}

- (void)_updateRingWithRingDescription:(id)a3
{
  id v8 = a3;
  [v8 fillFraction];
  if ((CLKFloatEqualsFloat() & 1) == 0)
  {
    [v8 fillFraction];
    *(float *)&double v4 = v4;
    self->_level = *(float *)&v4;
    id v5 = [(NTKModuleView *)self device];
    _LayoutConstants_6(v5, [(NTKComplicationModuleView *)self isXL], (uint64_t)v11);
    [v8 setRadius:v12 * 0.5];

    id v6 = [(NTKModuleView *)self device];
    _LayoutConstants_6(v6, [(NTKComplicationModuleView *)self isXL], (uint64_t)v9);
    [v8 setStrokeWidth:v10];

    v7 = [v8 ringImage];
    [(CLKUIColoringImageView *)self->_stateRing setImage:v7];
  }
}

- (void)_layoutContentView
{
  v3 = [(NTKModuleView *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[CLKUIColoringImageView sizeThatFits:](self->_stateRing, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v12 = [(NTKModuleView *)self device];
  CLKRectCenteredIntegralRectForDevice();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  -[CLKUIColoringImageView setFrame:](self->_stateRing, "setFrame:", v14, v16, v18, v20);
  if (([(CLKUIColoringLabel *)self->_label isHidden] & 1) == 0)
  {
    [(CLKUIColoringLabel *)self->_label sizeToFit];
    [(CLKUIColoringLabel *)self->_label frame];
    float v21 = [(NTKModuleView *)self device];
    _LayoutConstants_6(v21, [(NTKComplicationModuleView *)self isXL], (uint64_t)v26);

    label = self->_label;
    uint64_t v23 = [(NTKModuleView *)self device];
    CLKRectCenteredIntegralRectForDevice();
    -[CLKUIColoringLabel setFrame:](label, "setFrame:");
  }
  if (([(CDComplicationImageView *)self->_imageView isHidden] & 1) == 0)
  {
    uint64_t v24 = [(CDComplicationImageView *)self->_imageView sizeToFit];
    imageView = self->_imageView;
    MEMORY[0x1C1874A70](v24, v5, v7, v9, v11);
    -[CDComplicationImageView setCenter:](imageView, "setCenter:");
  }
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  double v4 = (void (**)(id, CLKUIColoringImageView *))((char *)a3 + 16);
  double v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, self->_stateRing);
  (*v4)(v6, (CLKUIColoringImageView *)self->_imageView);
}

- (void)_refreshRingImage
{
  id v14 = [(NTKModularTemplateView *)self complicationTemplate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v3 = [(NTKModularTemplateView *)self timeTravelDate];
    double v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F19A20] complicationDate];
    }
    id v6 = v5;

    double v7 = [NTKRing alloc];
    [(CLKProgressProvider *)self->_progressProvider progressFractionForNow:v6];
    double v9 = v8;
    double v10 = [(NTKModularTemplateView *)self complicationTemplate];
    double v11 = -[NTKRing initWithFillFraction:style:](v7, "initWithFillFraction:style:", [v10 ringStyle], v9);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v12 = [NTKRing alloc];
      [v14 fillFraction];
      double v11 = -[NTKRing initWithFillFraction:style:](v12, "initWithFillFraction:style:", [v14 ringStyle], v13);
    }
    else
    {
      double v11 = 0;
    }
  }
  [(NTKModularSmallRingTemplateView *)self _refreshRingImageWithRing:v11];
}

- (void)_refreshRingImageWithRing:(id)a3
{
  id v4 = a3;
  [v4 fillFraction];
  *(float *)&double v5 = v5;
  self->_level = *(float *)&v5;
  id v6 = [(NTKModuleView *)self device];
  _LayoutConstants_6(v6, [(NTKComplicationModuleView *)self isXL], (uint64_t)v11);
  [v4 setRadius:v12 * 0.5];

  double v7 = [(NTKModuleView *)self device];
  _LayoutConstants_6(v7, [(NTKComplicationModuleView *)self isXL], (uint64_t)v9);
  [v4 setStrokeWidth:v10];

  id v8 = [v4 ringImage];

  [(CLKUIColoringImageView *)self->_stateRing setImage:v8];
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
  if (supportedTemplateClasses_onceToken != -1) {
    dispatch_once(&supportedTemplateClasses_onceToken, &__block_literal_global_29);
  }
  id v2 = (void *)supportedTemplateClasses__supportedClasses;

  return v2;
}

void __59__NTKModularSmallRingTemplateView_supportedTemplateClasses__block_invoke()
{
  v2[6] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:6];
  v1 = (void *)supportedTemplateClasses__supportedClasses;
  supportedTemplateClasses__supportedClasses = v0;
}

- (CLKUIColoringImageView)stateRing
{
  return self->_stateRing;
}

- (void)setStateRing:(id)a3
{
}

- (CLKUIColoringLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_stateRing, 0);
  objc_storeStrong((id *)&self->_progressUpdateToken, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end