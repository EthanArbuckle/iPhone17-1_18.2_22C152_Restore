@interface NTKCircularWellnessUtilityComplicationView
+ (BOOL)handlesComplicationTemplate:(id)a3;
- (NTKCircularWellnessUtilityComplicationView)initWithFrame:(CGRect)a3;
- (id)_ringColor;
- (void)_applyForegroundAlpha;
- (void)_layoutContentView;
- (void)_setLayoutEmptyRings;
- (void)_updateForTemplateChange;
- (void)_updateRingColors;
- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4;
- (void)setForegroundColor:(id)a3;
@end

@implementation NTKCircularWellnessUtilityComplicationView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 isCompatibleWithFamily:2];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (NTKCircularWellnessUtilityComplicationView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  id v3 = -[NTKUtilityCircularComplicationView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    v5 = [(NTKUtilityComplicationView *)v3 device];
    _LayoutConstants_49(v5, v16);
    double v6 = v17;

    v7 = +[NTKRingsAndDotsView emptyFillFractions];
    uint64_t v8 = [v7 mutableCopy];
    ringsFillFractions = v4->_ringsFillFractions;
    v4->_ringsFillFractions = (NSMutableArray *)v8;

    v10 = [NTKRingsAndDotsView alloc];
    uint64_t v11 = -[NTKRingsAndDotsView initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:](v10, "initWithFrame:diameter:ringWidth:ringGapWidth:overlapStrokeWidth:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), v6, 2.0, 1.0, 0.75);
    ringsView = v4->_ringsView;
    v4->_ringsView = (NTKRingsAndDotsView *)v11;

    [(NTKRingsAndDotsView *)v4->_ringsView setRingsFillFractions:v4->_ringsFillFractions];
    [(NTKCircularWellnessUtilityComplicationView *)v4 _updateRingColors];
    v13 = [(NTKUtilityCircularComplicationView *)v4 contentView];
    [v13 addSubview:v4->_ringsView];
  }
  return v4;
}

- (void)applyFaceColorPalette:(id)a3 units:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v5 applyFaceColorPalette:a3 units:a4];
  [(NTKCircularWellnessUtilityComplicationView *)self _updateRingColors];
}

- (void)setForegroundColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v4 setForegroundColor:a3];
  [(NTKCircularWellnessUtilityComplicationView *)self _updateRingColors];
}

- (void)_updateRingColors
{
  v11[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(NTKUtilityComplicationView *)self colorScheme];
  int v4 = [v3 containsOverrideFaceColor];

  ringsView = self->_ringsView;
  if (v4)
  {
    double v6 = NTKMoveNonGradientTextColor();
    v11[0] = v6;
    v7 = NTKExerciseNonGradientTextColor();
    v11[1] = v7;
    uint64_t v8 = NTKStandNonGradientTextColor();
    v11[2] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
    [(NTKRingsAndDotsView *)ringsView setRingColors:v9];
  }
  else
  {
    id v10 = [(NTKCircularWellnessUtilityComplicationView *)self _ringColor];
    -[NTKRingsAndDotsView setForegroundColor:](ringsView, "setForegroundColor:");
  }
}

- (void)_layoutContentView
{
  id v3 = [(NTKUtilityCircularComplicationView *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  ringsView = self->_ringsView;
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  double v13 = CGRectGetHeight(v16) * 0.5;
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  double v14 = CGRectGetWidth(v17) * 0.5;

  -[NTKRingsAndDotsView setCenter:](ringsView, "setCenter:", v13, v14);
}

- (void)_applyForegroundAlpha
{
  v3.receiver = self;
  v3.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v3 _applyForegroundAlpha];
  [(NTKCircularWellnessUtilityComplicationView *)self _updateRingColors];
}

- (id)_ringColor
{
  objc_super v3 = [(NTKUtilityComplicationView *)self _computedForegroundColor];
  [(NTKUtilityComplicationView *)self foregroundAlpha];
  double v4 = objc_msgSend(v3, "colorWithAlphaComponent:");

  return v4;
}

- (void)_updateForTemplateChange
{
  v20.receiver = self;
  v20.super_class = (Class)NTKCircularWellnessUtilityComplicationView;
  [(NTKUtilityComplicationView *)&v20 _updateForTemplateChange];
  objc_super v3 = [(NTKUtilityComplicationView *)self complicationTemplate];
  if (![v3 dotsAreHidden])
  {
    double v4 = NSNumber;
    [v3 movePercentComplete];
    if (v5 < 0.00000011920929) {
      double v5 = 0.00000011920929;
    }
    double v6 = [v4 numberWithDouble:v5];
    CGFloat v7 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:0];
    int v8 = [v6 isEqualToNumber:v7];

    if ((v8 & 1) == 0) {
      [(NSMutableArray *)self->_ringsFillFractions replaceObjectAtIndex:0 withObject:v6];
    }
    CGFloat v9 = NSNumber;
    [v3 exercisePercentComplete];
    if (v10 < 0.00000011920929) {
      double v10 = 0.00000011920929;
    }
    CGFloat v11 = [v9 numberWithDouble:v10];
    v12 = [(NSMutableArray *)self->_ringsFillFractions objectAtIndexedSubscript:1];
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
    objc_super v15 = NSNumber;
    [v3 standPercentComplete];
    if (v16 < 0.00000011920929) {
      double v16 = 0.00000011920929;
    }
    CGRect v17 = [v15 numberWithDouble:v16];
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
  [(NTKCircularWellnessUtilityComplicationView *)self _setLayoutEmptyRings];
LABEL_20:
}

- (void)_setLayoutEmptyRings
{
  objc_super v3 = +[NTKRingsAndDotsView emptyFillFractions];
  double v4 = (NSMutableArray *)[v3 mutableCopy];
  ringsFillFractions = self->_ringsFillFractions;
  self->_ringsFillFractions = v4;

  ringsView = self->_ringsView;
  CGFloat v7 = self->_ringsFillFractions;

  [(NTKRingsAndDotsView *)ringsView setRingsFillFractions:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringsFillFractions, 0);

  objc_storeStrong((id *)&self->_ringsView, 0);
}

@end