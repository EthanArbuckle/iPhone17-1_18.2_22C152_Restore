@interface NTKCircularComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (id)_alarmImageProviderMedium:(BOOL)a3;
+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4;
+ (id)_stopwatchImageProviderMedium:(BOOL)a3;
+ (id)_timerImageProviderMedium:(BOOL)a3;
+ (id)mediumViewForComplicationType:(unint64_t)a3;
+ (id)viewForComplicationType:(unint64_t)a3;
+ (int64_t)layoutOverride;
- ($F26A0301DDFB9D033C0383030B5B2CF7)_layoutConstants;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)useRoundedFontDesign;
- (BOOL)usesMediumLayout;
- (BOOL)usesMultiColor;
- (BOOL)wantsPlatter;
- (CDComplicationDisplayObserver)displayObserver;
- (CLKComplicationTemplate)complicationTemplate;
- (CLKDevice)device;
- (NSDate)timeTravelDate;
- (NTKCircularComplicationView)initWithFrame:(CGRect)a3;
- (UIColor)foregroundColor;
- (UIColor)platterColor;
- (id)_computedForegroundColor;
- (id)_computedPlatterColor;
- (id)_fontForDynamicFontSize:(int64_t)a3;
- (id)_mediumStackFontForText:(id)a3;
- (id)_newLabelSubviewWithFont:(id)a3;
- (int64_t)_variableFontSizeForText:(id)a3;
- (unint64_t)textLayoutStyle;
- (void)_computeForegroundColor;
- (void)_computePlatterColor;
- (void)_updateColorChange;
- (void)_updateForegroundColor;
- (void)_updateImageViewColor:(id)a3;
- (void)_updateLabelViewColor:(id)a3;
- (void)_updatePlatterColor;
- (void)layoutSubviews;
- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4;
- (void)setDisplayObserver:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPlatterColor:(id)a3;
- (void)setTextLayoutStyle:(unint64_t)a3;
- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4;
- (void)setUseRoundedFontDesign:(BOOL)a3;
- (void)setUsesMediumLayout:(BOOL)a3;
- (void)setUsesMultiColor:(BOOL)a3;
- (void)setWantsPlatter:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NTKCircularComplicationView

+ (id)viewForComplicationType:(unint64_t)a3
{
  id v3 = objc_alloc_init((Class)_ViewClassForComplicationType(a3));
  return v3;
}

+ (id)mediumViewForComplicationType:(unint64_t)a3
{
  if (a3 == 7) {
    objc_opt_class();
  }
  else {
    _ViewClassForComplicationType(a3);
  }
  id v3 = objc_alloc_init((Class)(id)objc_claimAutoreleasedReturnValue());
  [v3 setUsesMediumLayout:1];
  return v3;
}

+ (int64_t)layoutOverride
{
  return 4;
}

- (NTKCircularComplicationView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCircularComplicationView;
  id v3 = -[NTKCircularComplicationView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[CLKRenderingContext sharedRenderingContext];
    uint64_t v5 = [v4 device];
    device = v3->_device;
    v3->_device = (CLKDevice *)v5;

    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v7;

    [(UIView *)v3->_highlightView setAlpha:0.0];
    [(UIView *)v3->_highlightView setUserInteractionEnabled:0];
    [(NTKCircularComplicationView *)v3 addSubview:v3->_highlightView];
    [(NTKCircularComplicationView *)v3 setWantsPlatter:1];
    [(NTKCircularComplicationView *)v3 _computeForegroundColor];
    [(NTKCircularComplicationView *)v3 _computePlatterColor];
  }
  return v3;
}

- (void)layoutSubviews
{
  [(NTKCircularComplicationView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  platter = self->_platter;
  if (platter)
  {
    -[UIView setFrame:](platter, "setFrame:", v3, v4, v5, v6);
    v12 = [(UIView *)self->_platter layer];
    double v13 = v9 * 0.5;
    [v12 setCornerRadius:v9 * 0.5];

    [(NTKCircularComplicationView *)self sendSubviewToBack:self->_platter];
  }
  else
  {
    double v13 = v5 * 0.5;
  }
  -[UIView setFrame:](self->_highlightView, "setFrame:", v7, v8, v9, v10);
  v14 = [(UIView *)self->_highlightView layer];
  [v14 setCornerRadius:v13];

  highlightView = self->_highlightView;
  [(NTKCircularComplicationView *)self bringSubviewToFront:highlightView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularComplicationView;
  [(NTKCircularComplicationView *)&v4 traitCollectionDidChange:a3];
  [(NTKCircularComplicationView *)self setNeedsLayout];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(NTKCircularComplicationView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(NTKCircularComplicationView *)self _layoutConstants];
  v21.origin.CGFloat x = v8 + v17;
  v21.origin.CGFloat y = v10 + v16;
  v21.size.width = v12 - (v17 + v19);
  v21.size.height = v14 - (v16 + v18);
  v20.CGFloat x = x;
  v20.CGFloat y = y;
  return CGRectContainsPoint(v21, v20);
}

- (void)setWantsPlatter:(BOOL)a3
{
  self->_wantsPlatter = a3;
  platter = self->_platter;
  if (a3)
  {
    if (!platter)
    {
      double v6 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      double v7 = self->_platter;
      self->_platter = v6;

      [(UIView *)self->_platter setBackgroundColor:self->_platterColor];
      [(UIView *)self->_platter setUserInteractionEnabled:0];
      [(NTKCircularComplicationView *)self addSubview:self->_platter];
      double v8 = self->_platter;
      [(NTKCircularComplicationView *)self sendSubviewToBack:v8];
    }
  }
  else
  {
    [(UIView *)platter removeFromSuperview];
    double v5 = self->_platter;
    self->_platter = 0;
  }
}

- (void)_computeForegroundColor
{
}

- (id)_computedForegroundColor
{
  return self->_computedForegroundColor;
}

- (void)_computePlatterColor
{
}

- (id)_computedPlatterColor
{
  return self->_computedPlatterColor;
}

- (void)_updateForegroundColor
{
  highlightView = self->_highlightView;
  objc_super v4 = [(UIColor *)self->_computedForegroundColor colorWithAlphaComponent:0.4];
  [(UIView *)highlightView setBackgroundColor:v4];

  [(NTKCircularComplicationView *)self _updateColorChange];
}

- (void)_updatePlatterColor
{
}

- (void)setForegroundColor:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_foregroundColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    [(NTKCircularComplicationView *)self _computeForegroundColor];
    [(NTKCircularComplicationView *)self _updateForegroundColor];
  }
}

- (void)setUsesMultiColor:(BOOL)a3
{
  self->_usesMultiColor = a3;
  [(NTKCircularComplicationView *)self _updateColorChange];
}

- (void)setPlatterColor:(id)a3
{
  objc_storeStrong((id *)&self->_platterColor, a3);
  [(NTKCircularComplicationView *)self _computePlatterColor];
  [(NTKCircularComplicationView *)self _updatePlatterColor];
}

- (void)setUseRoundedFontDesign:(BOOL)a3
{
  if (self->_useRoundedFontDesign != a3)
  {
    self->_useRoundedFontDesign = a3;
    [(NTKCircularComplicationView *)self _updateLabelsForFontChange];
  }
}

- (void)setUsesMediumLayout:(BOOL)a3
{
  if (self->_usesMediumLayout != a3)
  {
    self->_usesMediumLayout = a3;
    [(NTKCircularComplicationView *)self _updateLabelsForFontChange];
    [(NTKCircularComplicationView *)self setNeedsLayout];
  }
}

- (void)_updateColorChange
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__NTKCircularComplicationView__updateColorChange__block_invoke;
  v3[3] = &unk_1E62C5068;
  v3[4] = self;
  [(NTKCircularComplicationView *)self _enumerateForegroundColoringViewsWithBlock:v3];
  [(NTKCircularComplicationView *)self _updateForTemplateChange];
}

void __49__NTKCircularComplicationView__updateColorChange__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  int v3 = [*(id *)(a1 + 32) usesMultiColor];
  if ((v3 & 1) == 0)
  {
    objc_super v4 = [*(id *)(a1 + 32) _computedForegroundColor];
    [v6 setColor:v4];
  }
  if (objc_opt_respondsToSelector())
  {
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.0;
    }
    [v6 transitionToMonochromeWithFraction:v5];
  }
}

- (void)_updateImageViewColor:(id)a3
{
  id v14 = a3;
  objc_super v4 = [v14 imageProvider];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v14;
      BOOL v6 = [(NTKCircularComplicationView *)self usesMultiColor];
      double v7 = 0.0;
      if (v6) {
        double v7 = 1.0;
      }
      [v5 setMulticolorAlpha:v7];
    }
    if ([(NTKCircularComplicationView *)self usesMultiColor])
    {
      double v8 = [(NTKCircularComplicationView *)self complicationTemplate];
      double v9 = [v8 tintColor];

      double v10 = [v4 foregroundAccentImage];

      if (v10)
      {
LABEL_13:

        goto LABEL_14;
      }
      double v11 = [v4 tintColor];

      if (v11)
      {
        uint64_t v12 = [v4 tintColor];
LABEL_10:
        double v13 = (void *)v12;
        [v14 setColor:v12];

        goto LABEL_13;
      }
      if (!v9)
      {
        uint64_t v12 = [(NTKCircularComplicationView *)self _computedForegroundColor];
        goto LABEL_10;
      }
    }
    else
    {
      double v9 = [(NTKCircularComplicationView *)self _computedForegroundColor];
    }
    [v14 setColor:v9];
    goto LABEL_13;
  }
LABEL_14:
}

- (void)_updateLabelViewColor:(id)a3
{
  id v11 = a3;
  if (![(NTKCircularComplicationView *)self usesMultiColor])
  {
    id v5 = [(NTKCircularComplicationView *)self _computedForegroundColor];
    [v11 setTextColor:v5];
    goto LABEL_9;
  }
  objc_super v4 = [(NTKCircularComplicationView *)self complicationTemplate];
  id v5 = [v4 tintColor];

  BOOL v6 = [v11 textProvider];
  double v7 = [v6 tintColor];

  if (v7)
  {
    double v8 = v11;
    double v9 = v7;
  }
  else
  {
    if (!v5)
    {
      double v10 = [(NTKCircularComplicationView *)self _computedForegroundColor];
      [v11 setTextColor:v10];

      goto LABEL_8;
    }
    double v8 = v11;
    double v9 = v5;
  }
  [v8 setTextColor:v9];
LABEL_8:

LABEL_9:
}

- (void)setHighlighted:(BOOL)a3
{
  double v3 = 0.2;
  double v4 = 0.0;
  if (a3) {
    double v3 = 0.0;
  }
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __46__NTKCircularComplicationView_setHighlighted___block_invoke;
  v5[3] = &unk_1E62C2950;
  if (a3) {
    double v4 = 1.0;
  }
  v5[4] = self;
  *(double *)&v5[5] = v4;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v3];
}

uint64_t __46__NTKCircularComplicationView_setHighlighted___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:*(double *)(a1 + 40)];
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  return 0;
}

- (void)setComplicationTemplate:(id)a3 reason:(int64_t)a4
{
  BOOL v6 = (CLKComplicationTemplate *)a3;
  if (self->_complicationTemplate != v6)
  {
    double v7 = v6;
    objc_storeStrong((id *)&self->_complicationTemplate, a3);
    if ([(CLKComplicationTemplate *)v7 isCompatibleWithFamily:*MEMORY[0x1E4F19648]])[(NTKCircularComplicationView *)self setUsesMediumLayout:1]; {
    [(NTKCircularComplicationView *)self _updateForTemplateChange];
    }
    BOOL v6 = v7;
  }
}

- (void)setTimeTravelDate:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  double v7 = v6;
  timeTravelDate = self->_timeTravelDate;
  if (v6)
  {
    if ([v6 isEqual:timeTravelDate]) {
      goto LABEL_14;
    }
    double v9 = self->_timeTravelDate;
    BOOL v11 = [(CLKComplicationTemplate *)self->_complicationTemplate timeTravelUpdateFrequency] == 2
       || v9 == 0;
  }
  else
  {
    if (!timeTravelDate || (objc_msgSend(0, "isEqual:") & 1) != 0) {
      goto LABEL_14;
    }
    BOOL v11 = 1;
  }
  objc_storeStrong((id *)&self->_timeTravelDate, a3);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__NTKCircularComplicationView_setTimeTravelDate_animated___block_invoke;
  v12[3] = &unk_1E62C5068;
  v12[4] = self;
  [(NTKCircularComplicationView *)self _enumerateForegroundColoringViewsWithBlock:v12];
  if (v11) {
    [(NTKCircularComplicationView *)self _updateForTemplateChange];
  }
LABEL_14:
}

void __58__NTKCircularComplicationView_setTimeTravelDate_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setInTimeTravel:*(void *)(*(void *)(a1 + 32) + 424) != 0];
  }
}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)off_1E62BDB58);
  [v5 setFont:v4];
  id v6 = [(NTKCircularComplicationView *)self timeTravelDate];
  [v5 setInTimeTravel:v6 != 0];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke;
  v10[3] = &unk_1E62C0040;
  objc_copyWeak(&v11, &location);
  [v5 setNowProvider:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke_2;
  v8[3] = &unk_1E62C0068;
  objc_copyWeak(&v9, &location);
  [v5 setNeedsResizeHandler:v8];
  [(NTKCircularComplicationView *)self addSubview:v5];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v5;
}

id __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained timeTravelDate];
  id v3 = v2;
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

void __56__NTKCircularComplicationView__newLabelSubviewWithFont___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (int64_t)_variableFontSizeForText:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = NTKClockFaceLocalizedString(@"WEATHER_DEGREE_SYMBOL", @"°");
  uint64_t v6 = [v3 rangeOfString:v5];

  unint64_t v7 = v4 - (v6 != 0x7FFFFFFFFFFFFFFFLL);
  if (v7 >= 3)
  {
    if (v7 == 3) {
      int64_t v8 = 2;
    }
    else {
      int64_t v8 = v7 < 6;
    }
  }
  else
  {
    int64_t v8 = 3;
  }

  return v8;
}

- (id)_mediumStackFontForText:(id)a3
{
  uint64_t v4 = [(NTKCircularComplicationView *)self _variableFontSizeForText:a3];
  os_unfair_lock_lock((os_unfair_lock_t)&_mediumStackFontForText____lock);
  id WeakRetained = objc_loadWeakRetained(&_mediumStackFontForText____cachedDevice);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    device = self->_device;
    int64_t v8 = (CLKDevice *)objc_loadWeakRetained(&_mediumStackFontForText____cachedDevice);
    if (device == v8)
    {
      uint64_t v9 = [(CLKDevice *)self->_device version];
      uint64_t v10 = _mediumStackFontForText____previousCLKDeviceVersion;

      if (v9 == v10) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v11 = self->_device;
  id v12 = objc_storeWeak(&_mediumStackFontForText____cachedDevice, v11);
  _mediumStackFontForText____previousCLKDeviceVersion = [(CLKDevice *)v11 version];

  __55__NTKCircularComplicationView__mediumStackFontForText___block_invoke(v13, (uint64_t)self->_device);
LABEL_6:
  if (v4 >= 2) {
    uint64_t v4 = 2;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_mediumStackFontForText____lock);
  id v14 = (void *)_mediumStackFontForText____fonts;
  v15 = [NSNumber numberWithInteger:v4];
  double v16 = [v14 objectForKey:v15];

  return v16;
}

void __55__NTKCircularComplicationView__mediumStackFontForText___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v2 scaledValue:3 withOverride:11.5 forSizeClass:13.0];
  [v2 scaledValue:10.5];
  [v2 scaledValue:3 withOverride:9.5 forSizeClass:10.0];
  v8[0] = &unk_1F16E3F30;
  id v3 = _MakeFont(0);
  v9[0] = v3;
  v8[1] = &unk_1F16E3F48;
  uint64_t v4 = _MakeFont(0);
  v9[1] = v4;
  v8[2] = &unk_1F16E3F60;
  id v5 = _MakeFont(0);
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  unint64_t v7 = (void *)_mediumStackFontForText____fonts;
  _mediumStackFontForText____fonts = v6;
}

- ($F26A0301DDFB9D033C0383030B5B2CF7)_layoutConstants
{
  id v6 = [(NTKCircularComplicationView *)self device];
  if ([(NTKCircularComplicationView *)self usesMediumLayout]) {
    _LayoutConstantsMedium(v6, (uint64_t)retstr);
  }
  else {
    _LayoutConstantsSmall(v6, (uint64_t)retstr);
  }

  return result;
}

- (id)_fontForDynamicFontSize:(int64_t)a3
{
  if (self->_usesMediumLayout)
  {
    uint64_t v4 = self->_device;
    os_unfair_lock_lock((os_unfair_lock_t)&_MediumFontForDynamicSize___lock);
    id WeakRetained = objc_loadWeakRetained(&_MediumFontForDynamicSize___cachedDevice);
    if (WeakRetained)
    {
      id v6 = WeakRetained;
      unint64_t v7 = (CLKDevice *)objc_loadWeakRetained(&_MediumFontForDynamicSize___cachedDevice);
      if (v7 == v4)
      {
        uint64_t v12 = [(CLKDevice *)v4 version];
        uint64_t v13 = _MediumFontForDynamicSize___previousCLKDeviceVersion;

        if (v12 == v13)
        {
LABEL_11:
          os_unfair_lock_unlock((os_unfair_lock_t)&_MediumFontForDynamicSize___lock);
          double v16 = (void *)_MediumFontForDynamicSize__standardFonts;
          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    id v14 = objc_storeWeak(&_MediumFontForDynamicSize___cachedDevice, v4);
    _MediumFontForDynamicSize___previousCLKDeviceVersion = [(CLKDevice *)v4 version];

    ___MediumFontForDynamicSize_block_invoke(v15, v4);
    goto LABEL_11;
  }
  BOOL useRoundedFontDesign = self->_useRoundedFontDesign;
  uint64_t v4 = self->_device;
  if (useRoundedFontDesign)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_RoundedFontForDynamicSize___lock);
    id v9 = objc_loadWeakRetained(&_RoundedFontForDynamicSize___cachedDevice);
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = (CLKDevice *)objc_loadWeakRetained(&_RoundedFontForDynamicSize___cachedDevice);
      if (v11 == v4)
      {
        uint64_t v20 = [(CLKDevice *)v4 version];
        uint64_t v21 = _RoundedFontForDynamicSize___previousCLKDeviceVersion;

        if (v20 == v21)
        {
LABEL_17:
          os_unfair_lock_unlock((os_unfair_lock_t)&_RoundedFontForDynamicSize___lock);
          double v16 = (void *)_RoundedFontForDynamicSize__roundedFonts;
          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    id v22 = objc_storeWeak(&_RoundedFontForDynamicSize___cachedDevice, v4);
    _RoundedFontForDynamicSize___previousCLKDeviceVersion = [(CLKDevice *)v4 version];

    ___RoundedFontForDynamicSize_block_invoke(v23, v4);
    goto LABEL_17;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_StandardFontForDynamicSize___lock);
  id v17 = objc_loadWeakRetained(&_StandardFontForDynamicSize___cachedDevice);
  if (!v17) {
    goto LABEL_19;
  }
  double v18 = v17;
  double v19 = (CLKDevice *)objc_loadWeakRetained(&_StandardFontForDynamicSize___cachedDevice);
  if (v19 != v4)
  {

LABEL_19:
    id v26 = objc_storeWeak(&_StandardFontForDynamicSize___cachedDevice, v4);
    _StandardFontForDynamicSize___previousCLKDeviceVersion = [(CLKDevice *)v4 version];

    ___StandardFontForDynamicSize_block_invoke(v27, v4);
    goto LABEL_20;
  }
  uint64_t v24 = [(CLKDevice *)v4 version];
  uint64_t v25 = _StandardFontForDynamicSize___previousCLKDeviceVersion;

  if (v24 != v25) {
    goto LABEL_19;
  }
LABEL_20:
  os_unfair_lock_unlock((os_unfair_lock_t)&_StandardFontForDynamicSize___lock);
  double v16 = (void *)_StandardFontForDynamicSize__standardFonts;
LABEL_21:
  v28 = [NSNumber numberWithInteger:a3];
  v29 = [v16 objectForKey:v28];

  return v29;
}

+ (id)_imageProviderForImageSymbolName:(id)a3 imageAssetNamePrefix:(id)a4
{
  id v4 = a3;
  CLKUIImageNamed();
}

+ (id)_timerImageProviderMedium:(BOOL)a3
{
  if (a3) {
    NTKImageNamed(@"victoryNTKTimer");
  }
  NTKImageNamed(@"colorAnalogTimer");
}

+ (id)_alarmImageProviderMedium:(BOOL)a3
{
  if (a3) {
    id v3 = @"victoryNTKAlarm";
  }
  else {
    id v3 = @"colorAnalogAlarm";
  }
  id v4 = +[NTKCircularComplicationView _imageProviderForImageSymbolName:@"alarm" imageAssetNamePrefix:v3];
  return v4;
}

+ (id)_stopwatchImageProviderMedium:(BOOL)a3
{
  if (a3) {
    id v3 = @"victoryNTKStopwatch";
  }
  else {
    id v3 = @"colorAnalogStopwatch";
  }
  id v4 = +[NTKCircularComplicationView _imageProviderForImageSymbolName:@"stopwatch" imageAssetNamePrefix:v3];
  return v4;
}

- (CDComplicationDisplayObserver)displayObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->displayObserver);
  return (CDComplicationDisplayObserver *)WeakRetained;
}

- (void)setDisplayObserver:(id)a3
{
}

- (unint64_t)textLayoutStyle
{
  return self->textLayoutStyle;
}

- (void)setTextLayoutStyle:(unint64_t)a3
{
  self->textLayoutStyle = a3;
}

- (CLKDevice)device
{
  return self->_device;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)platterColor
{
  return self->_platterColor;
}

- (BOOL)useRoundedFontDesign
{
  return self->_useRoundedFontDesign;
}

- (BOOL)usesMediumLayout
{
  return self->_usesMediumLayout;
}

- (BOOL)wantsPlatter
{
  return self->_wantsPlatter;
}

- (BOOL)usesMultiColor
{
  return self->_usesMultiColor;
}

- (NSDate)timeTravelDate
{
  return (NSDate *)objc_getProperty(self, a2, 424, 1);
}

- (CLKComplicationTemplate)complicationTemplate
{
  return self->_complicationTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationTemplate, 0);
  objc_storeStrong((id *)&self->_platterColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->displayObserver);
  objc_storeStrong((id *)&self->_computedPlatterColor, 0);
  objc_storeStrong((id *)&self->_computedForegroundColor, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_platter, 0);
}

@end