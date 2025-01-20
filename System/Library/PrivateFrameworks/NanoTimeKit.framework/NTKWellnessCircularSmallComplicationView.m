@interface NTKWellnessCircularSmallComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (NTKWellnessCircularSmallComplicationView)initWithFrame:(CGRect)a3;
- (double)_overlapStrokeWidth;
- (double)_ringDiameter;
- (double)_ringGapWidth;
- (double)_ringStrokeWidth;
- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3;
- (void)_setLayoutEmptyRings;
- (void)_updateColors;
- (void)_updateForTemplateChange;
- (void)layoutSubviews;
- (void)setForegroundColor:(id)a3;
- (void)setSecondaryForegroundColor:(id)a3;
- (void)setUsesMultiColor:(BOOL)a3;
@end

@implementation NTKWellnessCircularSmallComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCompatibleWithFamily:4];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NTKWellnessCircularSmallComplicationView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  id v3 = -[NTKCircularComplicationView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    char v4 = +[NTKRingsAndDotsView emptyFillFractions];
    uint64_t v5 = [v4 mutableCopy];
    ringsFillFractions = v3->_ringsFillFractions;
    v3->_ringsFillFractions = (NSMutableArray *)v5;

    v7 = [NTKRingsAndDotsView alloc];
    [(NTKWellnessCircularSmallComplicationView *)v3 _ringDiameter];
    double v9 = v8;
    [(NTKWellnessCircularSmallComplicationView *)v3 _ringStrokeWidth];
    double v11 = v10;
    [(NTKWellnessCircularSmallComplicationView *)v3 _ringGapWidth];
    double v13 = v12;
    [(NTKWellnessCircularSmallComplicationView *)v3 _overlapStrokeWidth];
    uint64_t v15 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v7, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v9, v11, v13, v14);
    ringsView = v3->_ringsView;
    v3->_ringsView = (NTKRingsAndDotsView *)v15;

    [(NTKRingsAndDotsView *)v3->_ringsView setRingsFillFractions:v3->_ringsFillFractions];
    [(NTKRingsAndDotsView *)v3->_ringsView setUserInteractionEnabled:0];
    [(NTKWellnessCircularSmallComplicationView *)v3 addSubview:v3->_ringsView];
    [(NTKCircularComplicationView *)v3 setWantsPlatter:0];
  }
  return v3;
}

- (double)_ringDiameter
{
  if ([(NTKCircularComplicationView *)self usesMediumLayout])
  {
    [(NTKCircularComplicationView *)self _layoutConstants];
    return v6;
  }
  else
  {
    char v4 = [(NTKCircularComplicationView *)self device];
    double v5 = NTKCircularSmallComplicationDiameter();

    return v5;
  }
}

- (double)_ringStrokeWidth
{
  os_unfair_lock_lock((os_unfair_lock_t)&_ringStrokeWidth___lock);
  id WeakRetained = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    id v5 = [(NTKCircularComplicationView *)self device];
    id v6 = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
    if (v5 == v6)
    {
      v7 = [(NTKCircularComplicationView *)self device];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _ringStrokeWidth___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  double v10 = [(NTKCircularComplicationView *)self device];
  objc_storeWeak(&_ringStrokeWidth___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_ringStrokeWidth___cachedDevice);
  _ringStrokeWidth___previousCLKDeviceVersion = [v11 version];

  double v12 = [(NTKCircularComplicationView *)self device];
  __60__NTKWellnessCircularSmallComplicationView__ringStrokeWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_ringStrokeWidth___lock);
  if ([(NTKCircularComplicationView *)self usesMediumLayout])
  {
    double v13 = (double *)&_ringStrokeWidth__mediumWidth;
  }
  else
  {
    [(NTKCircularComplicationView *)self _layoutConstants];
    double v13 = (double *)&v15;
  }
  return *v13;
}

void __60__NTKWellnessCircularSmallComplicationView__ringStrokeWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  [v3 scaledValue:0 withOverride:4.0 forSizeClass:3.0];
  _ringStrokeWidth__mediumWidth = v2;
}

- (double)_ringGapWidth
{
  os_unfair_lock_lock((os_unfair_lock_t)&_ringGapWidth___lock);
  id WeakRetained = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    id v5 = [(NTKCircularComplicationView *)self device];
    id v6 = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
    if (v5 == v6)
    {
      v7 = [(NTKCircularComplicationView *)self device];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _ringGapWidth___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  double v10 = [(NTKCircularComplicationView *)self device];
  objc_storeWeak(&_ringGapWidth___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_ringGapWidth___cachedDevice);
  _ringGapWidth___previousCLKDeviceVersion = [v11 version];

  double v12 = [(NTKCircularComplicationView *)self device];
  __57__NTKWellnessCircularSmallComplicationView__ringGapWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_ringGapWidth___lock);
  BOOL v13 = [(NTKCircularComplicationView *)self usesMediumLayout];
  double result = *(double *)&_ringGapWidth__mediumWidth;
  if (!v13) {
    return 2.0;
  }
  return result;
}

void __57__NTKWellnessCircularSmallComplicationView__ringGapWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_1F16E3F78;
  v5[1] = &unk_1F16E3F90;
  v6[0] = &unk_1F16E7FC0;
  v6[1] = &unk_1F16E7FD0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:2.0];
  _ringGapWidth__mediumWidth = v4;
}

- (double)_overlapStrokeWidth
{
  os_unfair_lock_lock((os_unfair_lock_t)&_overlapStrokeWidth___lock);
  id WeakRetained = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v5 = [(NTKCircularComplicationView *)self device];
    id v6 = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
    if (v5 == v6)
    {
      v7 = [(NTKCircularComplicationView *)self device];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _overlapStrokeWidth___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  double v10 = [(NTKCircularComplicationView *)self device];
  objc_storeWeak(&_overlapStrokeWidth___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_overlapStrokeWidth___cachedDevice);
  _overlapStrokeWidth___previousCLKDeviceVersion = [v11 version];

  double v12 = [(NTKCircularComplicationView *)self device];
  __63__NTKWellnessCircularSmallComplicationView__overlapStrokeWidth__block_invoke((uint64_t)v12, (uint64_t)v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_overlapStrokeWidth___lock);
  BOOL v13 = [(NTKCircularComplicationView *)self usesMediumLayout];
  double result = *(double *)&_overlapStrokeWidth__mediumWidth;
  if (!v13) {
    return 1.75;
  }
  return result;
}

void __63__NTKWellnessCircularSmallComplicationView__overlapStrokeWidth__block_invoke(uint64_t a1, uint64_t a2)
{
  v6[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F19A40] metricsWithDevice:a2 identitySizeClass:2];
  v5[0] = &unk_1F16E3F78;
  v5[1] = &unk_1F16E3F90;
  v6[0] = &unk_1F16E7FD0;
  v6[1] = &unk_1F16E7FE0;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];
  [v2 scaledValue:v3 withOverrides:3.5];
  *(double *)&_overlapStrokeWidth__mediumWidth = v4 * 0.5;
}

- (void)setForegroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v4 setForegroundColor:a3];
  [(NTKWellnessCircularSmallComplicationView *)self _updateColors];
}

- (void)setUsesMultiColor:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v4 setUsesMultiColor:a3];
  [(NTKWellnessCircularSmallComplicationView *)self _updateColors];
}

- (void)setSecondaryForegroundColor:(id)a3
{
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v9 layoutSubviews];
  [(NTKWellnessCircularSmallComplicationView *)self bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  ringsView = self->_ringsView;
  CGFloat v8 = CGRectGetHeight(v10) * 0.5;
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:", v8, CGRectGetWidth(v11) * 0.5);
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
}

- (void)_updateForTemplateChange
{
  v20.receiver = self;
  v20.super_class = (Class)NTKWellnessCircularSmallComplicationView;
  [(NTKCircularComplicationView *)&v20 _updateForTemplateChange];
  id v3 = [(NTKCircularComplicationView *)self complicationTemplate];
  if (![v3 dotsAreHidden])
  {
    objc_super v4 = NSNumber;
    [v3 movePercentComplete];
    if (v5 < 0.00000011920929) {
      double v5 = 0.00000011920929;
    }
    id v6 = [v4 numberWithDouble:v5];
    v7 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:0];
    int v8 = [v6 isEqualToNumber:v7];

    if ((v8 & 1) == 0) {
      [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:0 withObject:v6];
    }
    objc_super v9 = NSNumber;
    [v3 exercisePercentComplete];
    if (v10 < 0.00000011920929) {
      double v10 = 0.00000011920929;
    }
    CGRect v11 = [v9 numberWithDouble:v10];
    double v12 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:1];
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
    objc_super v18 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:2];
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
  [(NTKWellnessCircularSmallComplicationView *)self _setLayoutEmptyRings];
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

- (void)_updateColors
{
  v10[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NTKCircularComplicationView *)self usesMultiColor];
  ringsView = self->_ringsView;
  if (v3)
  {
    double v5 = NTKMoveNonGradientTextColor();
    v10[0] = v5;
    id v6 = NTKStandNonGradientTextColor();
    v10[1] = v6;
    v7 = NTKExerciseNonGradientTextColor();
    v10[2] = v7;
    int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
    [(NTKRingsAndDotsView *)ringsView setRingColors:v8];
  }
  else
  {
    id v9 = [(NTKCircularComplicationView *)self _computedForegroundColor];
    -[NTKRingsAndDotsView setForegroundColor:](ringsView, "setForegroundColor:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end