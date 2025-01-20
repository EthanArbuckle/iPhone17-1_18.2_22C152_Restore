@interface SBCoverSheetBlurView
+ (Class)layerClass;
- (SBCoverSheetBlurView)initWithFrame:(CGRect)a3 scaleAdjustment:(id)a4 alphaAdjustment:(id)a5;
- (UIColor)dimmingColor;
- (double)blurRadius;
- (double)weighting;
- (id)_averageWallpaperColor;
- (uint64_t)alphaAdjustment;
- (uint64_t)reduceTransparencyView;
- (uint64_t)scaleAdjustment;
- (uint64_t)setVariantToTrack:(uint64_t)result;
- (uint64_t)variantToTrack;
- (void)_configureForCurrentReduceTransparencySetting;
- (void)_createFilters;
- (void)_createReduceTransparencyView;
- (void)_removeFilters;
- (void)_removeReduceTransparencyView;
- (void)_updateForBlurRadius:(double)a3 weighting:(double)a4 forPresentationValue:(BOOL)a5;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAlphaAdjustment:(void *)a1;
- (void)setBlurRadius:(double)a3;
- (void)setDimmingColor:(id)a3;
- (void)setReduceTransparencyView:(uint64_t)a1;
- (void)setScaleAdjustment:(void *)a1;
- (void)setWeighting:(double)a3;
- (void)setWeighting:(double)a3 forPresentationValue:(BOOL)a4;
- (void)wallpaperDidChangeForVariant:(int64_t)a3;
@end

@implementation SBCoverSheetBlurView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SBCoverSheetBlurView)initWithFrame:(CGRect)a3 scaleAdjustment:(id)a4 alphaAdjustment:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBCoverSheetBlurView;
  v13 = -[SBCoverSheetBlurView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v15 = v13;
  if (v13)
  {
    objc_setProperty_nonatomic_copy(v13, v14, v11, 432);
    objc_setProperty_nonatomic_copy(v15, v16, v12, 440);
    [(SBCoverSheetBlurView *)v15 setBlurRadius:20.0];
    v15->_variantToTrack = 1;
    [(SBCoverSheetBlurView *)v15 setDimmingColor:0];
    [(SBCoverSheetBlurView *)v15 _configureForCurrentReduceTransparencySetting];
    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v15 selector:sel__reduceTransparencyEnabledStateDidChange_ name:*MEMORY[0x1E4F43480] object:0];

    v18 = +[SBWallpaperController sharedInstance];
    [v18 addObserver:v15 forVariant:v15->_variantToTrack];
  }
  return v15;
}

- (void)setScaleAdjustment:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 432);
  }
}

- (void)setAlphaAdjustment:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 440);
  }
}

- (uint64_t)setVariantToTrack:(uint64_t)result
{
  if (result) {
    *(void *)(result + 456) = a2;
  }
  return result;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];

  v4 = +[SBWallpaperController sharedInstance];
  [v4 removeObserver:self forVariant:self->_variantToTrack];

  v5.receiver = self;
  v5.super_class = (Class)SBCoverSheetBlurView;
  [(SBCoverSheetBlurView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  if (self) {
    reduceTransparencyView = self->_reduceTransparencyView;
  }
  else {
    reduceTransparencyView = 0;
  }
  v4 = reduceTransparencyView;
  [(SBCoverSheetBlurView *)self bounds];
  -[UIView setFrame:](v4, "setFrame:");
}

- (uint64_t)reduceTransparencyView
{
  if (result) {
    return *(void *)(result + 448);
  }
  return result;
}

- (void)setBlurRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_blurRadius = a3;
    double weighting = self->_weighting;
    [(SBCoverSheetBlurView *)self _updateForBlurRadius:0 weighting:a3 forPresentationValue:weighting];
  }
}

- (void)setDimmingColor:(id)a3
{
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dimmingColor, a3);
    [(SBCoverSheetBlurView *)self _updateForBlurRadius:0 weighting:self->_blurRadius forPresentationValue:self->_weighting];
  }
}

- (void)setWeighting:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_double weighting = a3;
    double blurRadius = self->_blurRadius;
    [(SBCoverSheetBlurView *)self _updateForBlurRadius:0 weighting:blurRadius forPresentationValue:a3];
  }
}

- (void)setWeighting:(double)a3 forPresentationValue:(BOOL)a4
{
  if (a4) {
    [(SBCoverSheetBlurView *)self _updateForBlurRadius:1 weighting:self->_blurRadius forPresentationValue:a3];
  }
  else {
    [(SBCoverSheetBlurView *)self setWeighting:a3];
  }
}

- (void)_updateForBlurRadius:(double)a3 weighting:(double)a4 forPresentationValue:(BOOL)a5
{
  BOOL v5 = a5;
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    if (self)
    {
      reduceTransparencyView = self->_reduceTransparencyView;
      if (v5)
      {
LABEL_4:
        v10 = NSNumber;
        id v11 = reduceTransparencyView;
        uint64_t v12 = [v10 numberWithDouble:a4];
        v13 = v11;
        id v33 = (id)v12;
LABEL_12:
        [(SBCoverSheetBlurView *)v13 _setPresentationValue:v12 forKey:@"opacity"];
        goto LABEL_17;
      }
    }
    else
    {
      reduceTransparencyView = 0;
      if (v5) {
        goto LABEL_4;
      }
    }
    v32 = reduceTransparencyView;
    id v33 = [(UIView *)v32 layer];

    id v11 = [NSNumber numberWithDouble:a4];
    [v33 setValue:v11 forKey:@"opacity"];
    goto LABEL_17;
  }
  scaleAdjustment = (double (**)(double))self->_scaleAdjustment;
  double v15 = 1.0;
  if (scaleAdjustment) {
    double v15 = scaleAdjustment[2](a4);
  }
  alphaAdjustment = (double (**)(double))self->_alphaAdjustment;
  double v17 = 1.0;
  if (alphaAdjustment) {
    double v17 = alphaAdjustment[2](a4);
  }
  double v18 = a4 * 0.4 + 1.0;
  double v19 = a3 * a4;
  objc_super v20 = [(UIColor *)self->_dimmingColor colorWithAlphaComponent:a4];
  if (v5)
  {
    v21 = [NSNumber numberWithDouble:v18];
    [(SBCoverSheetBlurView *)self _setPresentationValue:v21 forKey:@"filters.colorSaturate.inputAmount"];

    v22 = [NSNumber numberWithDouble:v19];
    [(SBCoverSheetBlurView *)self _setPresentationValue:v22 forKey:@"filters.gaussianBlur.inputRadius"];

    v23 = [NSNumber numberWithDouble:v15];
    [(SBCoverSheetBlurView *)self _setPresentationValue:v23 forKey:@"scale"];

    id v33 = v20;
    -[SBCoverSheetBlurView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", [v33 CGColor], @"backgroundColor");
    if (!self->_alphaAdjustment) {
      goto LABEL_18;
    }
    id v11 = [NSNumber numberWithDouble:v17];
    v13 = self;
    uint64_t v12 = (uint64_t)v11;
    goto LABEL_12;
  }
  v24 = [(SBCoverSheetBlurView *)self layer];
  v25 = [NSNumber numberWithDouble:v18];
  [v24 setValue:v25 forKeyPath:@"filters.colorSaturate.inputAmount"];

  v26 = [(SBCoverSheetBlurView *)self layer];
  v27 = [NSNumber numberWithDouble:v19];
  [v26 setValue:v27 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  v28 = [(SBCoverSheetBlurView *)self layer];
  v29 = [NSNumber numberWithDouble:v15];
  [v28 setValue:v29 forKeyPath:@"scale"];

  v30 = [(SBCoverSheetBlurView *)self layer];
  id v33 = v20;
  objc_msgSend(v30, "setValue:forKey:", objc_msgSend(v33, "CGColor"), @"backgroundColor");

  if (!self->_alphaAdjustment) {
    goto LABEL_18;
  }
  id v11 = [(SBCoverSheetBlurView *)self layer];
  v31 = [NSNumber numberWithDouble:v17];
  [(SBCoverSheetBlurView *)v11 setValue:v31 forKeyPath:@"opacity"];

LABEL_17:
LABEL_18:
}

- (void)_configureForCurrentReduceTransparencySetting
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    [(SBCoverSheetBlurView *)self _createReduceTransparencyView];
    [(SBCoverSheetBlurView *)self _removeFilters];
  }
  else
  {
    [(SBCoverSheetBlurView *)self _removeReduceTransparencyView];
    [(SBCoverSheetBlurView *)self _createFilters];
  }
}

- (void)_createFilters
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
  [v3 setName:@"gaussianBlur"];
  [v3 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputNormalizeEdges"];
  v4 = NSNumber;
  [(SBCoverSheetBlurView *)self blurRadius];
  BOOL v5 = objc_msgSend(v4, "numberWithDouble:");
  [v3 setValue:v5 forKeyPath:@"inputRadius"];

  v6 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
  [v6 setValue:&unk_1F3348C38 forKey:@"inputAmount"];
  v7 = [(SBCoverSheetBlurView *)self backdropLayer];
  [v7 setIgnoresScreenClip:1];

  v8 = [(SBCoverSheetBlurView *)self layer];
  v10[0] = v3;
  v10[1] = v6;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v8 setFilters:v9];
}

- (void)_removeFilters
{
  v3 = [(SBCoverSheetBlurView *)self layer];
  [v3 setFilters:0];

  id v4 = [(SBCoverSheetBlurView *)self layer];
  [v4 setValue:&unk_1F3348C48 forKeyPath:@"scale"];
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (self) {
    reduceTransparencyView = self->_reduceTransparencyView;
  }
  else {
    reduceTransparencyView = 0;
  }
  BOOL v5 = reduceTransparencyView;
  id v6 = [(SBCoverSheetBlurView *)self _averageWallpaperColor];
  [(UIView *)v5 setBackgroundColor:v6];
}

- (void)_createReduceTransparencyView
{
  if (!self || !self->_reduceTransparencyView)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    v3 = [(SBCoverSheetBlurView *)self _averageWallpaperColor];
    [v4 setBackgroundColor:v3];

    -[SBCoverSheetBlurView setReduceTransparencyView:]((uint64_t)self, v4);
    [(SBCoverSheetBlurView *)self insertSubview:v4 atIndex:0];
  }
}

- (void)setReduceTransparencyView:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 448), a2);
  }
}

- (void)_removeReduceTransparencyView
{
  v2 = self;
  if (self) {
    self = (SBCoverSheetBlurView *)self->_reduceTransparencyView;
  }
  [(SBCoverSheetBlurView *)self removeFromSuperview];
  -[SBCoverSheetBlurView setReduceTransparencyView:]((uint64_t)v2, 0);
}

- (id)_averageWallpaperColor
{
  v3 = +[SBWallpaperController sharedInstance];
  id v4 = [v3 averageColorForVariant:self->_variantToTrack];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F428B8] whiteColor];
  }
  v7 = v6;

  return v7;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (double)weighting
{
  return self->_weighting;
}

- (UIColor)dimmingColor
{
  return self->_dimmingColor;
}

- (uint64_t)scaleAdjustment
{
  if (result) {
    return *(void *)(result + 432);
  }
  return result;
}

- (uint64_t)alphaAdjustment
{
  if (result) {
    return *(void *)(result + 440);
  }
  return result;
}

- (uint64_t)variantToTrack
{
  if (result) {
    return *(void *)(result + 456);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reduceTransparencyView, 0);
  objc_storeStrong(&self->_alphaAdjustment, 0);
  objc_storeStrong(&self->_scaleAdjustment, 0);
  objc_storeStrong((id *)&self->_dimmingColor, 0);
}

@end