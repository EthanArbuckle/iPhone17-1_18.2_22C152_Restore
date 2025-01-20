@interface SBShelfBackgroundView
- (CGRect)extendedBlurRect;
- (SBShelfBackgroundView)initWithFrame:(CGRect)a3;
- (double)weighting;
- (void)layoutSubviews;
- (void)setExtendedBlurRect:(CGRect)a3;
- (void)setWeighting:(double)a3;
@end

@implementation SBShelfBackgroundView

- (SBShelfBackgroundView)initWithFrame:(CGRect)a3
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBShelfBackgroundView;
  v3 = -[SBShelfBackgroundView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F743C8];
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v4 materialViewWithRecipeNamed:@"shelfBackground" inBundle:v5 options:0 initialWeighting:0 scaleAdjustment:1.0];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (MTMaterialView *)v6;

    [(MTMaterialView *)v3->_backgroundView setZoomEnabled:0];
    [(MTMaterialView *)v3->_backgroundView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:1];
    [(SBShelfBackgroundView *)v3 addSubview:v3->_backgroundView];
    id v8 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    backgroundMaskView = v3->_backgroundMaskView;
    v3->_backgroundMaskView = (UIView *)v13;

    [(MTMaterialView *)v3->_backgroundView setMaskView:v3->_backgroundMaskView];
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v9, v10, v11, v12);
    backgroundMaskInnerRectangleView = v3->_backgroundMaskInnerRectangleView;
    v3->_backgroundMaskInnerRectangleView = (UIView *)v15;

    v17 = v3->_backgroundMaskInnerRectangleView;
    v18 = [MEMORY[0x1E4F428B8] blackColor];
    [(UIView *)v17 setBackgroundColor:v18];

    [(UIView *)v3->_backgroundMaskView addSubview:v3->_backgroundMaskInnerRectangleView];
    v19 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A260]];
    [v19 setName:@"luminanceCurveMap"];
    [v19 setValue:&unk_1F33489D8 forKey:*MEMORY[0x1E4F3A218]];
    uint64_t v20 = *MEMORY[0x1E4F3A100];
    [v19 setValue:&unk_1F3348F78 forKey:*MEMORY[0x1E4F3A100]];
    v21 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A048]];
    [v21 setName:@"colorSaturate"];
    [v21 setValue:&unk_1F3348F88 forKey:v20];
    v22 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
    [v22 setName:@"gaussianBlur"];
    [v22 setValue:@"low" forKey:*MEMORY[0x1E4F3A1A8]];
    [v22 setValue:@"low" forKey:*MEMORY[0x1E4F3A1D0]];
    [v22 setValue:&unk_1F3348F98 forKey:*MEMORY[0x1E4F3A1D8]];
    v23 = [(UIView *)v3->_backgroundMaskInnerRectangleView layer];
    v27[0] = v19;
    v27[1] = v21;
    v27[2] = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
    [v23 setFilters:v24];
  }
  return v3;
}

- (double)weighting
{
  [(MTMaterialView *)self->_backgroundView weighting];
  return result;
}

- (void)setWeighting:(double)a3
{
}

- (void)setExtendedBlurRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_extendedBlurRect = &self->_extendedBlurRect;
  if (!CGRectEqualToRect(a3, self->_extendedBlurRect))
  {
    p_extendedBlurRect->origin.CGFloat x = x;
    p_extendedBlurRect->origin.CGFloat y = y;
    p_extendedBlurRect->size.CGFloat width = width;
    p_extendedBlurRect->size.CGFloat height = height;
    [(SBShelfBackgroundView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SBShelfBackgroundView;
  [(SBShelfBackgroundView *)&v6 layoutSubviews];
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:", self->_extendedBlurRect.origin.x, self->_extendedBlurRect.origin.y, self->_extendedBlurRect.size.width, self->_extendedBlurRect.size.height);
  backgroundMaskView = self->_backgroundMaskView;
  [(MTMaterialView *)self->_backgroundView bounds];
  -[UIView setFrame:](backgroundMaskView, "setFrame:");
  [(SBShelfBackgroundView *)self bounds];
  v7.origin.CGFloat x = v4 - self->_extendedBlurRect.origin.x;
  v7.origin.CGFloat y = v5 - self->_extendedBlurRect.origin.y;
  CGRect v8 = CGRectInset(v7, -22.0, -22.0);
  CGRect v9 = CGRectOffset(v8, 0.0, 44.0);
  -[UIView setFrame:](self->_backgroundMaskInnerRectangleView, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (CGRect)extendedBlurRect
{
  double x = self->_extendedBlurRect.origin.x;
  double y = self->_extendedBlurRect.origin.y;
  double width = self->_extendedBlurRect.size.width;
  double height = self->_extendedBlurRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaskInnerRectangleView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end