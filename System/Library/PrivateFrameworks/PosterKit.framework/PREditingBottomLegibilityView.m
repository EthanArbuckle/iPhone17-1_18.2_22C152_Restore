@interface PREditingBottomLegibilityView
+ (Class)layerClass;
- (BOOL)shouldOverscan;
- (CAGradientLayer)gradientLayer;
- (CGRect)_compactGradientFrameInBounds:(CGRect)a3;
- (CGRect)_expandedGradientFrameInBounds:(CGRect)a3;
- (PREditingBottomLegibilityView)initWithFrame:(CGRect)a3;
- (UIColor)gradientColor;
- (double)heightFactor;
- (int64_t)_requiredGradientMultiplierForBounds:(CGRect)a3;
- (int64_t)gradientHeightMultiplier;
- (void)_updateGradientColors;
- (void)_updateGradientHeightMultiplierIfNeededForBounds:(CGRect)a3;
- (void)layoutSubviews;
- (void)setGradientColor:(id)a3;
- (void)setGradientHeightMultiplier:(int64_t)a3;
- (void)setHeightFactor:(double)a3;
- (void)setShouldOverscan:(BOOL)a3;
@end

@implementation PREditingBottomLegibilityView

+ (Class)layerClass
{
  return (Class)self;
}

- (PREditingBottomLegibilityView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PREditingBottomLegibilityView;
  v3 = -[PREditingBottomLegibilityView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F39BD0] layer];
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = (CAGradientLayer *)v4;

    [(CAGradientLayer *)v3->_gradientLayer setAllowsHitTesting:0];
    v6 = [(PREditingBottomLegibilityView *)v3 layer];
    [v6 addSublayer:v3->_gradientLayer];

    v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(PREditingBottomLegibilityView *)v3 setGradientColor:v7];

    v3->_shouldOverscan = 1;
    v3->_gradientHeightMultiplier = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PREditingBottomLegibilityView;
  [(PREditingBottomLegibilityView *)&v11 layoutSubviews];
  [(PREditingBottomLegibilityView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  if (self->_shouldOverscan)
  {
    -[PREditingBottomLegibilityView _updateGradientHeightMultiplierIfNeededForBounds:](self, "_updateGradientHeightMultiplierIfNeededForBounds:", v3, v4, v5, v6);
    -[PREditingBottomLegibilityView _expandedGradientFrameInBounds:](self, "_expandedGradientFrameInBounds:", v7, v8, v9, v10);
  }
  else
  {
    -[PREditingBottomLegibilityView _compactGradientFrameInBounds:](self, "_compactGradientFrameInBounds:", v3, v4, v5, v6);
  }
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void)setGradientColor:(id)a3
{
  id v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientColor, a3);
    [(PREditingBottomLegibilityView *)self _updateGradientColors];
  }
}

- (void)setGradientHeightMultiplier:(int64_t)a3
{
  if (self->_gradientHeightMultiplier != a3)
  {
    self->_gradientHeightMultiplier = a3;
    [(PREditingBottomLegibilityView *)self _updateGradientColors];
  }
}

- (void)setHeightFactor:(double)a3
{
  if (self->_heightFactor != a3)
  {
    self->_heightFactor = a3;
    [(PREditingBottomLegibilityView *)self setNeedsLayout];
  }
}

- (void)setShouldOverscan:(BOOL)a3
{
  if (self->_shouldOverscan != a3)
  {
    self->_shouldOverscan = a3;
    [(PREditingBottomLegibilityView *)self setNeedsLayout];
  }
}

- (CGRect)_compactGradientFrameInBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v13 = a3;
  CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  slice.size = v7;
  v7.CGFloat width = y;
  CGFloat v8 = CGRectGetHeight(a3) * self->_heightFactor;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGRectDivide(v15, &slice, &v13, v8, CGRectMaxYEdge);
  double v9 = slice.origin.x;
  double v10 = slice.origin.y;
  double v11 = slice.size.width;
  double v12 = slice.size.height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)_expandedGradientFrameInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  double v9 = CGRectGetHeight(v13);
  double v10 = v9 * self->_heightFactor;
  -[PREditingBottomLegibilityView _compactGradientFrameInBounds:](self, "_compactGradientFrameInBounds:", x, y, width, height);
  double v11 = sqrt(v9 * v9 + v8 * v8);
  *(float *)&double v11 = sqrt(v11 * 0.5 * (v11 * 0.5) - (v9 * 0.5 - v10) * (v9 * 0.5 - v10));
  *(float *)&double v11 = ceilf(*(float *)&v11);
  CGRect result = CGRectInset(v14, ((float)(*(float *)&v11 + *(float *)&v11) - v8) * -0.5, 0.0);
  double v12 = v10 * (double)self->_gradientHeightMultiplier;
  result.size.double height = v12;
  return result;
}

- (int64_t)_requiredGradientMultiplierForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  CGFloat v9 = CGRectGetHeight(v12);
  CGFloat v10 = v9 * self->_heightFactor;
  *(float *)&CGFloat v9 = sqrt(v9 * v9 + v8 * v8) * 0.5 - (v9 * 0.5 - v10);
  return vcvtpd_s64_f64(ceilf(*(float *)&v9) / v10);
}

- (void)_updateGradientHeightMultiplierIfNeededForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGRect v34 = a3;
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (*MEMORY[0x1E4F1DAD8] != a3.origin.x || v8 != y)
  {
    v31 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", *MEMORY[0x1E4F1DAD8], v8);
    [v31 handleFailureInMethod:a2 object:self file:@"PREditingBottomLegibilityView.m" lineNumber:180 description:@"we don't support not being full-screen!"];
  }
  BSSizeSwap();
  BSRectWithSize();
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  *(double *)v33 = v10;
  *(double *)&v33[1] = v12;
  *(double *)&v33[2] = v14;
  *(double *)&v33[3] = v16;
  v36.origin.CGFloat x = x;
  v36.origin.double y = y;
  v36.size.double width = width;
  v36.size.double height = height;
  double v32 = x;
  double v18 = CGRectGetHeight(v36);
  v37.origin.CGFloat x = v11;
  v37.origin.double y = v13;
  v37.size.double width = v15;
  v37.size.double height = v17;
  double v19 = CGRectGetHeight(v37);
  if (v18 <= v19) {
    v20 = (CGRect *)v33;
  }
  else {
    v20 = &v34;
  }
  p_previouslyConsideredBounds = &self->_previouslyConsideredBounds;
  if (v18 <= v19) {
    double v23 = v13;
  }
  else {
    double v23 = y;
  }
  if (v18 <= v19) {
    double v24 = v15;
  }
  else {
    double v24 = width;
  }
  if (v18 <= v19) {
    double v25 = v17;
  }
  else {
    double v25 = height;
  }
  v38.origin.CGFloat x = p_previouslyConsideredBounds->origin.x;
  v38.origin.double y = self->_previouslyConsideredBounds.origin.y;
  v38.size.double width = self->_previouslyConsideredBounds.size.width;
  v38.size.double height = self->_previouslyConsideredBounds.size.height;
  CGFloat v22 = v20->origin.x;
  if (!CGRectEqualToRect(*(CGRect *)(&v23 - 1), v38))
  {
    CGSize size = v20->size;
    p_previouslyConsideredBounds->origin = v20->origin;
    self->_previouslyConsideredBounds.CGSize size = size;
    int64_t v27 = -[PREditingBottomLegibilityView _requiredGradientMultiplierForBounds:](self, "_requiredGradientMultiplierForBounds:", v32, y, width, height);
    int64_t v28 = -[PREditingBottomLegibilityView _requiredGradientMultiplierForBounds:](self, "_requiredGradientMultiplierForBounds:", v11, v13, v15, v17);
    if (v27 <= v28) {
      int64_t v29 = v28;
    }
    else {
      int64_t v29 = v27;
    }
    [(PREditingBottomLegibilityView *)self setGradientHeightMultiplier:v29];
  }
}

- (void)_updateGradientColors
{
  v14[3] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4FB1618] clearColor];
  double v4 = -[UIColor colorWithAlphaComponent:](self->_gradientColor, "colorWithAlphaComponent:", 0.07, v3);
  v14[1] = v4;
  double v5 = 0.1;
  double v6 = [(UIColor *)self->_gradientColor colorWithAlphaComponent:0.1];
  v14[2] = v6;
  CGSize v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  if (self->_gradientHeightMultiplier < 2)
  {
    CGFloat v9 = v7;
  }
  else
  {
    CGFloat v9 = (void *)[v7 mutableCopy];
    if (self->_gradientHeightMultiplier >= 2)
    {
      int64_t v10 = 1;
      do
      {
        double v11 = v5 + 0.01;
        double v12 = [(UIColor *)self->_gradientColor colorWithAlphaComponent:v11];
        [v9 addObject:v12];

        double v5 = v11 + 0.01;
        double v13 = [(UIColor *)self->_gradientColor colorWithAlphaComponent:v5];
        [v9 addObject:v13];

        ++v10;
      }
      while (v10 < self->_gradientHeightMultiplier);
    }
  }
  __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke(v8, self->_gradientLayer, v9);
}

void __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_11);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setColors:v5];
}

uint64_t __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke_2(int a1, id a2)
{
  id v2 = a2;
  return [v2 CGColor];
}

- (double)heightFactor
{
  return self->_heightFactor;
}

- (BOOL)shouldOverscan
{
  return self->_shouldOverscan;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (int64_t)gradientHeightMultiplier
{
  return self->_gradientHeightMultiplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end