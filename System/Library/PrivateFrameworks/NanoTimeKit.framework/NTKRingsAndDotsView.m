@interface NTKRingsAndDotsView
+ (id)emptyFillFractions;
- (BOOL)hidesOverlapShadow;
- (BOOL)shouldUseMonochromeAccentColor;
- (BOOL)usesLegibility;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)ringColors;
- (NSArray)ringViews;
- (NSMutableArray)ringsFillFractions;
- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3;
- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3 diameter:(double)a4 ringWidth:(double)a5 ringGapWidth:(double)a6 overlapStrokeWidth:(double)a7;
- (UIColor)foregroundColor;
- (UIColor)overrideColor;
- (UIColor)secondaryForegroundColor;
- (double)appearanceAnimationProgress;
- (double)diameter;
- (double)radiusForRingAtIndex:(int64_t)a3;
- (double)ringGapWidth;
- (double)ringWidth;
- (void)_setDiameter:(double)a3;
- (void)layoutSubviews;
- (void)setAppearanceAnimationProgress:(double)a3;
- (void)setDiameter:(double)a3;
- (void)setFilterProvider:(id)a3;
- (void)setForegroundColor:(id)a3;
- (void)setHidesOverlapShadow:(BOOL)a3;
- (void)setOverrideColor:(id)a3;
- (void)setRingColors:(id)a3;
- (void)setRingGapWidth:(double)a3;
- (void)setRingViews:(id)a3;
- (void)setRingWidth:(double)a3;
- (void)setRingsFillFractions:(id)a3;
- (void)setSecondaryForegroundColor:(id)a3;
- (void)setShouldUseMonochromeAccentColor:(BOOL)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation NTKRingsAndDotsView

- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3
{
  return -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](self, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), 26.0, 2.0, 2.5, 2.5);
}

- (NTKRingsAndDotsView)initWithFrame:(CGRect)a3 diameter:(double)a4 ringWidth:(double)a5 ringGapWidth:(double)a6 overlapStrokeWidth:(double)a7
{
  v19.receiver = self;
  v19.super_class = (Class)NTKRingsAndDotsView;
  v10 = -[NTKRingsAndDotsView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v11 = v10;
  if (v10)
  {
    v12 = [(NTKRingsAndDotsView *)v10 layer];
    [v12 setNeedsDisplayOnBoundsChange:1];

    [(NTKRingsAndDotsView *)v11 setOpaque:0];
    [(NTKRingsAndDotsView *)v11 setRingWidth:a5];
    [(NTKRingsAndDotsView *)v11 setRingGapWidth:a6];
    [(NTKRingsAndDotsView *)v11 _setDiameter:a4];
    v13 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    for (uint64_t i = 0; i != 3; ++i)
    {
      [(NTKRingsAndDotsView *)v11 radiusForRingAtIndex:i];
      v15 = [NTKRingView alloc];
      [(NTKRingsAndDotsView *)v11 bounds];
      v16 = -[NTKRingView initWithFrame:radius:ringWidth:overlapWidth:](v15, "initWithFrame:radius:ringWidth:overlapWidth:");
      [(NTKRingsAndDotsView *)v11 addSubview:v16];
      [(NSArray *)v13 addObject:v16];
    }
    ringViews = v11->_ringViews;
    v11->_ringViews = v13;

    [(NTKRingsAndDotsView *)v11 sizeToFit];
  }
  return v11;
}

+ (id)emptyFillFractions
{
  return &unk_1F16E9C70;
}

- (UIColor)overrideColor
{
  return 0;
}

- (BOOL)usesLegibility
{
  return 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double diameter = self->_diameter;
  double v4 = diameter;
  result.height = v4;
  result.width = diameter;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)NTKRingsAndDotsView;
  [(NTKRingsAndDotsView *)&v5 layoutSubviews];
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__NTKRingsAndDotsView_layoutSubviews__block_invoke;
  v4[3] = &unk_1E62C4638;
  v4[4] = self;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v4];
}

void __37__NTKRingsAndDotsView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 bounds];
  objc_msgSend(v3, "setFrame:");
}

- (void)setRingsFillFractions:(id)a3
{
  id v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__NTKRingsAndDotsView_setRingsFillFractions___block_invoke;
  v7[3] = &unk_1E62C4638;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v7];
}

void __45__NTKRingsAndDotsView_setRingsFillFractions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v7 = [v4 objectAtIndexedSubscript:a3];
  [v7 floatValue];
  [v5 setFillFraction:v6];
}

- (void)setHidesOverlapShadow:(BOOL)a3
{
  self->_hidesOverlapShadow = a3;
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NTKRingsAndDotsView_setHidesOverlapShadow___block_invoke;
  v4[3] = &__block_descriptor_33_e28_v32__0__NTKRingView_8Q16_B24l;
  BOOL v5 = a3;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v4];
}

uint64_t __45__NTKRingsAndDotsView_setHidesOverlapShadow___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHidesOverlapShadow:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setForegroundColor:(id)a3
{
  id v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__NTKRingsAndDotsView_setForegroundColor___block_invoke;
  v7[3] = &unk_1E62C4638;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v7];
}

uint64_t __42__NTKRingsAndDotsView_setForegroundColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setColor:*(void *)(a1 + 32)];
}

- (void)setRingColors:(id)a3
{
  BOOL v5 = (NSArray *)a3;
  if (self->_ringColors != v5)
  {
    objc_storeStrong((id *)&self->_ringColors, a3);
    ringViews = self->_ringViews;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__NTKRingsAndDotsView_setRingColors___block_invoke;
    v7[3] = &unk_1E62C4638;
    id v8 = v5;
    [(NSArray *)ringViews enumerateObjectsUsingBlock:v7];
  }
}

void __37__NTKRingsAndDotsView_setRingColors___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v5 setColor:v6];
}

- (void)setShouldUseMonochromeAccentColor:(BOOL)a3
{
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NTKRingsAndDotsView_setShouldUseMonochromeAccentColor___block_invoke;
  v4[3] = &__block_descriptor_33_e28_v32__0__NTKRingView_8Q16_B24l;
  BOOL v5 = a3;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v4];
}

uint64_t __57__NTKRingsAndDotsView_setShouldUseMonochromeAccentColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShouldUseMonochromeAccentColor:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setFilterProvider:(id)a3
{
  id v4 = a3;
  ringViews = self->_ringViews;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__NTKRingsAndDotsView_setFilterProvider___block_invoke;
  v7[3] = &unk_1E62C4638;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v7];
}

uint64_t __41__NTKRingsAndDotsView_setFilterProvider___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFilterProvider:*(void *)(a1 + 32)];
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  ringViews = self->_ringViews;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__NTKRingsAndDotsView_transitionToMonochromeWithFraction___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v32__0__NTKRingView_8Q16_B24l;
  *(double *)&void v4[4] = a3;
  [(NSArray *)ringViews enumerateObjectsUsingBlock:v4];
}

uint64_t __58__NTKRingsAndDotsView_transitionToMonochromeWithFraction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 transitionToMonochromeWithFraction:*(double *)(a1 + 32)];
}

- (void)updateMonochromeColor
{
}

uint64_t __44__NTKRingsAndDotsView_updateMonochromeColor__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateMonochromeColor];
}

- (void)_setDiameter:(double)a3
{
  self->_double diameter = a3;
}

- (double)radiusForRingAtIndex:(int64_t)a3
{
  return fmax(self->_diameter * 0.5- self->_ringGapWidth * (double)a3- self->_ringWidth * (double)a3- self->_ringWidth * 0.5, 0.0);
}

- (void)setOverrideColor:(id)a3
{
}

- (NSArray)ringColors
{
  return self->_ringColors;
}

- (NSMutableArray)ringsFillFractions
{
  return self->_ringsFillFractions;
}

- (BOOL)hidesOverlapShadow
{
  return self->_hidesOverlapShadow;
}

- (BOOL)shouldUseMonochromeAccentColor
{
  return self->_shouldUseMonochromeAccentColor;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (UIColor)secondaryForegroundColor
{
  return self->_secondaryForegroundColor;
}

- (void)setSecondaryForegroundColor:(id)a3
{
}

- (double)diameter
{
  return self->_diameter;
}

- (void)setDiameter:(double)a3
{
  self->_double diameter = a3;
}

- (double)ringWidth
{
  return self->_ringWidth;
}

- (void)setRingWidth:(double)a3
{
  self->_ringWidth = a3;
}

- (double)ringGapWidth
{
  return self->_ringGapWidth;
}

- (void)setRingGapWidth:(double)a3
{
  self->_ringGapWidth = a3;
}

- (double)appearanceAnimationProgress
{
  return self->_appearanceAnimationProgress;
}

- (void)setAppearanceAnimationProgress:(double)a3
{
  self->_appearanceAnimationProgress = a3;
}

- (NSArray)ringViews
{
  return self->_ringViews;
}

- (void)setRingViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringViews, 0);
  objc_storeStrong((id *)&self->_secondaryForegroundColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);
  objc_storeStrong((id *)&self->_ringColors, 0);

  objc_storeStrong((id *)&self->_overrideColor, 0);
}

@end