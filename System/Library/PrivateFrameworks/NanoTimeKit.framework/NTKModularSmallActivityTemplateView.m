@interface NTKModularSmallActivityTemplateView
+ (BOOL)handlesComplicationTemplate:(id)a3;
+ (BOOL)supportsComplicationFamily:(int64_t)a3;
- (NTKModularSmallActivityTemplateView)initWithFrame:(CGRect)a3;
- (void)_configureContentSubviews;
- (void)_layoutContentView;
- (void)_setLayoutEmptyRings;
- (void)_update;
- (void)applyColorScheme:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setIsXL:(BOOL)a3;
@end

@implementation NTKModularSmallActivityTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 isCompatibleWithFamily:0]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 isCompatibleWithFamily:7];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (NTKModularSmallActivityTemplateView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKModularSmallActivityTemplateView;
  id v3 = -[NTKModuleView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3) {
    [(NTKModularSmallActivityTemplateView *)v3 _configureContentSubviews];
  }
  return v4;
}

- (void)setForegroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKModularSmallActivityTemplateView;
  id v4 = a3;
  [(NTKModuleView *)&v5 setForegroundColor:v4];
  -[NTKRingsAndDotsView setForegroundColor:](self->_ringsView, "setForegroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)_configureContentSubviews
{
  id v3 = [(NTKModuleView *)self device];
  BOOL v4 = [(NTKComplicationModuleView *)self isXL];
  id v5 = v3;
  if (v4)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsExtraLarge___lock_0);
    id WeakRetained = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_0);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      id v8 = objc_loadWeakRetained(&_LayoutConstantsExtraLarge___cachedDevice_0);
      if (v8 == v5)
      {
        uint64_t v12 = [v5 version];
        uint64_t v13 = _LayoutConstantsExtraLarge___previousCLKDeviceVersion_0;

        if (v12 == v13)
        {
LABEL_10:
          v16 = &_LayoutConstantsExtraLarge___constants_3;
          v17 = &_LayoutConstantsExtraLarge___constants_2;
          v18 = &_LayoutConstantsExtraLarge___constants_1;
          v19 = &_LayoutConstantsExtraLarge___constants_0;
          v20 = (os_unfair_lock_s *)&_LayoutConstantsExtraLarge___lock_0;
          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    id v14 = objc_storeWeak(&_LayoutConstantsExtraLarge___cachedDevice_0, v5);
    _LayoutConstantsExtraLarge___previousCLKDeviceVersion_0 = [v5 version];

    ___LayoutConstantsExtraLarge_block_invoke_0(v15, (uint64_t)v5);
    goto LABEL_10;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_LayoutConstantsSmall___lock);
  id v9 = objc_loadWeakRetained(&_LayoutConstantsSmall___cachedDevice);
  if (!v9) {
    goto LABEL_12;
  }
  v10 = v9;
  id v11 = objc_loadWeakRetained(&_LayoutConstantsSmall___cachedDevice);
  if (v11 != v5)
  {

LABEL_12:
    id v23 = objc_storeWeak(&_LayoutConstantsSmall___cachedDevice, v5);
    _LayoutConstantsSmall___previousCLKDeviceVersion = [v5 version];

    ___LayoutConstantsSmall_block_invoke(v24, (uint64_t)v5);
    goto LABEL_13;
  }
  uint64_t v21 = [v5 version];
  uint64_t v22 = _LayoutConstantsSmall___previousCLKDeviceVersion;

  if (v21 != v22) {
    goto LABEL_12;
  }
LABEL_13:
  v16 = &_LayoutConstantsSmall___constants_3;
  v17 = &_LayoutConstantsSmall___constants_2;
  v18 = &_LayoutConstantsSmall___constants_1;
  v19 = &_LayoutConstantsSmall___constants_0;
  v20 = (os_unfair_lock_s *)&_LayoutConstantsSmall___lock;
LABEL_14:
  os_unfair_lock_unlock(v20);
  double v25 = *(double *)v19;
  double v26 = *(double *)v18;
  double v27 = *(double *)v17;
  double v28 = *(double *)v16;

  ringsView = self->_ringsView;
  if (ringsView) {
    [(NTKRingsAndDotsView *)ringsView removeFromSuperview];
  }
  v30 = +[NTKRingsAndDotsView emptyFillFractions];
  v31 = (NSMutableArray *)[v30 mutableCopy];
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v31;

  v33 = [NTKRingsAndDotsView alloc];
  v34 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v33, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v27, v25, v26, v28);
  v35 = self->_ringsView;
  self->_ringsView = v34;

  [(NTKRingsAndDotsView *)self->_ringsView setRingsFillFractions:self->_ringsFillFractions];
  id v36 = [(NTKModuleView *)self contentView];
  [v36 addSubview:self->_ringsView];
}

- (void)setIsXL:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKModularSmallActivityTemplateView;
  [(NTKComplicationModuleView *)&v4 setIsXL:a3];
  [(NTKModularSmallActivityTemplateView *)self _configureContentSubviews];
  [(NTKModularSmallActivityTemplateView *)self _layoutContentView];
  [(NTKModuleView *)self _updateColors];
}

- (void)_layoutContentView
{
  ringsView = self->_ringsView;
  id v3 = [(NTKModuleView *)self contentView];
  MEMORY[0x1C1874A70]([v3 bounds]);
  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:");
}

- (void)_update
{
  v20.receiver = self;
  v20.super_class = (Class)NTKModularSmallActivityTemplateView;
  [(NTKModularTemplateView *)&v20 _update];
  id v3 = [(NTKModularTemplateView *)self complicationTemplate];
  if (![v3 dotsAreHidden])
  {
    objc_super v4 = NSNumber;
    [v3 movePercentComplete];
    if (v5 < 0.00000011920929) {
      double v5 = 0.00000011920929;
    }
    objc_super v6 = [v4 numberWithDouble:v5];
    v7 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:0];
    int v8 = [v6 isEqualToNumber:v7];

    if ((v8 & 1) == 0) {
      [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:0 withObject:v6];
    }
    id v9 = NSNumber;
    [v3 exercisePercentComplete];
    if (v10 < 0.00000011920929) {
      double v10 = 0.00000011920929;
    }
    id v11 = [v9 numberWithDouble:v10];
    uint64_t v12 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:1];
    char v13 = [v11 isEqualToNumber:v12];

    if (v13)
    {
      int v14 = v8 ^ 1;
    }
    else
    {
      int v14 = 1;
      [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:1 withObject:v11];
    }
    uint64_t v15 = NSNumber;
    [v3 standPercentComplete];
    if (v16 < 0.00000011920929) {
      double v16 = 0.00000011920929;
    }
    v17 = [v15 numberWithDouble:v16];
    v18 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:2];
    char v19 = [v17 isEqualToNumber:v18];

    if (v19)
    {
      if (!v14) {
        goto LABEL_19;
      }
    }
    else
    {
      [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:2 withObject:v17];
    }
    [(NTKRingsAndDotsView *)self->_ringsView setRingsFillFractions:self->_ringsFillFractions];
LABEL_19:

    goto LABEL_20;
  }
  [(NTKModularSmallActivityTemplateView *)self _setLayoutEmptyRings];
LABEL_20:
}

- (void)_setLayoutEmptyRings
{
  id v3 = +[NTKRingsAndDotsView emptyFillFractions];
  objc_super v4 = (NSMutableArray *)[v3 mutableCopy];
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v4;

  ringsView = self->_ringsView;
  v7 = self->_ringsFillFractions;
  [(NTKRingsAndDotsView *)ringsView setRingsFillFractions:v7];
}

- (void)applyColorScheme:(id)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NTKModularSmallActivityTemplateView;
  id v4 = a3;
  [(NTKModuleView *)&v11 applyColorScheme:v4];
  int v5 = objc_msgSend(v4, "containsOverrideFaceColor", v11.receiver, v11.super_class);

  if (v5)
  {
    ringsView = self->_ringsView;
    v7 = NTKMoveNonGradientTextColor();
    v12[0] = v7;
    int v8 = NTKExerciseNonGradientTextColor();
    v12[1] = v8;
    id v9 = NTKStandNonGradientTextColor();
    v12[2] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
    [(NTKRingsAndDotsView *)ringsView setRingColors:v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end