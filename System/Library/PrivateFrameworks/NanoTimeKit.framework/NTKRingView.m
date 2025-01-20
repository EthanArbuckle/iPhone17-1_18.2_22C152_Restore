@interface NTKRingView
- (BOOL)hidesOverlapShadow;
- (BOOL)shouldUseMonochromeAccentColor;
- (CLKMonochromeFilterProvider)filterProvider;
- (NTKRingView)initWithFrame:(CGRect)a3 radius:(double)a4 ringWidth:(double)a5 overlapWidth:(double)a6;
- (double)fillFraction;
- (double)overlapWidth;
- (double)radius;
- (double)ringWidth;
- (int64_t)filterStyle;
- (void)_drawBackgroundRings;
- (void)_drawRingWithRadius:(double)a3 fillFraction:(double)a4 alpha:(double)a5 hidesOverlapShadow:(BOOL)a6;
- (void)drawRect:(CGRect)a3;
- (void)setFillFraction:(double)a3;
- (void)setFilterProvider:(id)a3;
- (void)setHidesOverlapShadow:(BOOL)a3;
- (void)setShouldUseMonochromeAccentColor:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRingView

- (NTKRingView)initWithFrame:(CGRect)a3 radius:(double)a4 ringWidth:(double)a5 overlapWidth:(double)a6
{
  v13.receiver = self;
  v13.super_class = (Class)NTKRingView;
  v9 = -[CLKUIColoringView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    v9->_radius = a4;
    v9->_ringWidth = a5;
    v9->_overlapWidth = a6;
    v11 = [(NTKRingView *)v9 layer];
    [v11 setNeedsDisplayOnBoundsChange:1];

    [(NTKRingView *)v10 setOpaque:0];
  }
  return v10;
}

- (void)setFillFraction:(double)a3
{
  self->_fillFraction = a3;
  [(NTKRingView *)self setNeedsDisplay];
}

- (int64_t)filterStyle
{
  return 2 * self->_shouldUseMonochromeAccentColor;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  v5 = [(NTKRingView *)self filterProvider];
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[NTKRingView filterStyle](self, "filterStyle"), a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = [(NTKRingView *)self layer];
  v7 = v6;
  if (v9) {
    id v8 = v9;
  }
  else {
    id v8 = 0;
  }
  [v6 setFilters:v8];
}

- (void)updateMonochromeColor
{
  v3 = [(NTKRingView *)self filterProvider];
  objc_msgSend(v3, "filtersForView:style:", self, -[NTKRingView filterStyle](self, "filterStyle"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [(NTKRingView *)self layer];
  v5 = v4;
  if (v7) {
    id v6 = v7;
  }
  else {
    id v6 = 0;
  }
  [v4 setFilters:v6];
}

- (void)drawRect:(CGRect)a3
{
  v4 = [(NTKRingView *)self contentColor];
  [v4 set];

  [(NTKRingView *)self _drawBackgroundRings];
  double radius = self->_radius;
  double fillFraction = self->_fillFraction;
  BOOL hidesOverlapShadow = self->_hidesOverlapShadow;
  [(NTKRingView *)self _drawRingWithRadius:hidesOverlapShadow fillFraction:radius alpha:fillFraction hidesOverlapShadow:1.0];
}

- (void)_drawBackgroundRings
{
}

- (void)_drawRingWithRadius:(double)a3 fillFraction:(double)a4 alpha:(double)a5 hidesOverlapShadow:(BOOL)a6
{
  CLKInterpolateBetweenFloatsClipped();
  double v12 = v11;
  if (a4 >= 0.999999881) {
    goto LABEL_10;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____lock);
  id WeakRetained = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
  v14 = &isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  v15 = &isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v16 = WeakRetained;
  v17 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  id v18 = [v17 device];
  id v19 = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
  if (v18 != v19)
  {

LABEL_6:
    v24 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v25 = [v24 device];
    objc_storeWeak(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice, v25);

    id v26 = objc_loadWeakRetained(&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____cachedDevice);
    v14[368] = [v26 version];

    v27 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
    v28 = [v27 device];
    [v28 screenScale];
    *((double *)v15 + 365) = 1.0 / v29;

    goto LABEL_7;
  }
  v20 = [MEMORY[0x1E4F19A90] sharedRenderingContext];
  v21 = [v20 device];
  uint64_t v22 = [v21 version];
  uint64_t v23 = _drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____previousCLKDeviceVersion;

  v15 = &isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  v14 = &isSystemAppDeprecatedBundleId_itemId___deperecatedSysytemAppsBundleIdsToItemIdsMapping;
  if (v22 != v23) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&_drawRingWithRadius_fillFraction_alpha_hidesOverlapShadow____lock);
  double v30 = *((double *)v15 + 365);
  if (v12 >= 4.71238898 - (self->_ringWidth + v30) / a3) {
    double v12 = 4.71238898 - (self->_ringWidth + v30) / a3;
  }
  a6 = 1;
LABEL_10:
  [(NTKRingView *)self bounds];
  double MidX = CGRectGetMidX(v44);
  [(NTKRingView *)self bounds];
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMidY(v45), a3, -1.57079633, v12);
  id v42 = (id)objc_claimAutoreleasedReturnValue();
  [v42 setLineWidth:self->_ringWidth];
  [v42 setLineCapStyle:1];
  [v42 strokeWithBlendMode:17 alpha:a5];
  if (!a6)
  {
    CLKInterpolateBetweenFloatsClipped();
    double v33 = v32;
    [(NTKRingView *)self bounds];
    double v34 = CGRectGetMidX(v46);
    [(NTKRingView *)self bounds];
    double MidY = CGRectGetMidY(v47);
    double v36 = (self->_ringWidth + self->_overlapWidth) * 0.5;
    double radius = self->_radius;
    float v38 = v33;
    __float2 v39 = __sincosf_stret(v38);
    v40 = [MEMORY[0x1E4FB1618] clearColor];
    [v40 setStroke];

    v41 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v34 + radius * v39.__cosval, MidY + radius * v39.__sinval, v36, v33, v33 + 3.14159265);
    [v41 setLineWidth:self->_overlapWidth];
    [v41 setLineCapStyle:0];
    [v41 strokeWithBlendMode:16 alpha:1.0];
  }
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (double)overlapWidth
{
  return self->_overlapWidth;
}

- (double)radius
{
  return self->_radius;
}

- (double)fillFraction
{
  return self->_fillFraction;
}

- (BOOL)hidesOverlapShadow
{
  return self->_hidesOverlapShadow;
}

- (void)setHidesOverlapShadow:(BOOL)a3
{
  self->_BOOL hidesOverlapShadow = a3;
}

- (BOOL)shouldUseMonochromeAccentColor
{
  return self->_shouldUseMonochromeAccentColor;
}

- (void)setShouldUseMonochromeAccentColor:(BOOL)a3
{
  self->_shouldUseMonochromeAccentColor = a3;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end