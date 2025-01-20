@interface PXTitleLegibilityDimmingView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (NSString)gradientImageName;
- (PXTitleLegibilityDimmingView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setGradientImageName:(id)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXTitleLegibilityDimmingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientImageName, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_backdropLayer, 0);
  objc_storeStrong((id *)&self->_filterLayer, 0);
}

- (NSString)gradientImageName
{
  return self->_gradientImageName;
}

- (NSCopying)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUserData:(id)a3
{
  id v4 = [a3 gradientImageName];
  [(PXTitleLegibilityDimmingView *)self setGradientImageName:v4];
}

- (void)setGradientImageName:(id)a3
{
  v9 = (NSString *)a3;
  v5 = self->_gradientImageName;
  v6 = v9;
  if (v5 != v9)
  {
    v7 = v5;
    BOOL v8 = [(NSString *)v5 isEqualToString:v9];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_gradientImageName, a3);
    objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", v9);
    v6 = (NSString *) objc_claimAutoreleasedReturnValue();
    [(CALayer *)self->_filterLayer setContents:[(NSString *)v6 CGImage]];
  }

LABEL_5:
}

- (void)layoutSubviews
{
  [(PXTitleLegibilityDimmingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[CABackdropLayer setFrame:](self->_backdropLayer, "setFrame:");
  -[CALayer setFrame:](self->_filterLayer, "setFrame:", v4, v6, v8, v10);
  v11.receiver = self;
  v11.super_class = (Class)PXTitleLegibilityDimmingView;
  [(PXTitleLegibilityDimmingView *)&v11 layoutSubviews];
}

- (PXTitleLegibilityDimmingView)initWithFrame:(CGRect)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PXTitleLegibilityDimmingView;
  double v3 = -[PXTitleLegibilityDimmingView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(PXTitleLegibilityDimmingView *)v3 setBackgroundColor:v4];

    [(PXTitleLegibilityDimmingView *)v3 setUserInteractionEnabled:0];
    double v5 = [(PXTitleLegibilityDimmingView *)v3 layer];
    [v5 setAllowsGroupOpacity:0];

    double v6 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E4F39B40]);
    backdropLayer = v3->_backdropLayer;
    v3->_backdropLayer = v6;
    double v8 = v6;

    double v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A350]];
    v20[0] = xmmword_1AB359B80;
    v20[1] = xmmword_1AB359B90;
    v20[2] = xmmword_1AB359BA0;
    v20[3] = xmmword_1AB359BB0;
    v20[4] = xmmword_1AB359BC0;
    double v10 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:v20];
    [v9 setValue:v10 forKey:*MEMORY[0x1E4F3A168]];
    objc_super v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    v24[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [(CALayer *)v11 setFilters:v12];

    filterLayer = v3->_filterLayer;
    v3->_filterLayer = v11;
    v14 = v11;

    v15 = [MEMORY[0x1E4F1CA98] null];
    v22[0] = @"onOrderIn";
    v22[1] = @"onOrderOut";
    v23[0] = v15;
    v23[1] = v15;
    v22[2] = @"sublayers";
    v22[3] = @"contents";
    v23[2] = v15;
    v23[3] = v15;
    v22[4] = @"bounds";
    v22[5] = @"position";
    v23[4] = v15;
    v23[5] = v15;
    v22[6] = @"hidden";
    v23[6] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
    [(CABackdropLayer *)v8 setActions:v16];
    [(CALayer *)v14 setActions:v16];
    v17 = [(PXTitleLegibilityDimmingView *)v3 layer];
    [v17 addSublayer:v8];

    v18 = [(PXTitleLegibilityDimmingView *)v3 layer];
    [v18 addSublayer:v14];
  }
  return v3;
}

@end