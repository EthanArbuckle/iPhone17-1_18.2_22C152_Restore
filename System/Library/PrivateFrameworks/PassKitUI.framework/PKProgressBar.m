@interface PKProgressBar
- (BOOL)roundEndCap;
- (PKProgressBar)initWithFrame:(CGRect)a3;
- (UIColor)gradientEndColor;
- (UIColor)gradientStartColor;
- (double)cornerRadius;
- (double)progress;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateLayerColors;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setGradientEndColor:(id)a3;
- (void)setGradientStartColor:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRoundEndCap:(BOOL)a3;
@end

@implementation PKProgressBar

- (PKProgressBar)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKProgressBar;
  v3 = -[PKProgressBar initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemFillColor];
    [(PKProgressBar *)v3 setBackgroundColor:v4];

    v3->_cornerRadius = 5.0;
    v5 = [(PKProgressBar *)v3 layer];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    [v5 setCornerRadius:v3->_cornerRadius];
    [v5 setMasksToBounds:1];
    uint64_t v6 = [MEMORY[0x1E4F39BD0] layer];
    fillLayer = v3->_fillLayer;
    v3->_fillLayer = (CAGradientLayer *)v6;

    -[CAGradientLayer setStartPoint:](v3->_fillLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_fillLayer, "setEndPoint:", 1.0, 0.5);
    [v5 addSublayer:v3->_fillLayer];
  }
  return v3;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PKProgressBar;
  [(PKProgressBar *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(PKProgressBar *)self _updateLayerColors];
}

- (void)layoutSubviews
{
  [(PKProgressBar *)self bounds];
  CGFloat x = v12.origin.x;
  CGFloat y = v12.origin.y;
  CGFloat width = v12.size.width;
  CGFloat height = v12.size.height;
  double v7 = CGRectGetHeight(v12);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  CGRectGetWidth(v13);
  PKFloatRoundToPixel();
  double v9 = v8;
  if ([(PKProgressBar *)self _shouldReverseLayoutDirection])
  {
    *(_OWORD *)&v10.b = 0uLL;
    v10.a = 1.0;
    *(_OWORD *)&v10.d = xmmword_1A0443EA0;
    v10.tCGFloat y = height;
    CGAffineTransformRotate(&v11, &v10, 3.14159265);
    CGAffineTransform v10 = v11;
    [(PKProgressBar *)self setTransform:&v10];
  }
  -[CAGradientLayer setFrame:](self->_fillLayer, "setFrame:", 0.0, 0.0, v9, v7);
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    id v4 = [(PKProgressBar *)self layer];
    [v4 setCornerRadius:self->_cornerRadius];
  }
}

- (void)setGradientStartColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v4 = (UIColor *)[v6 copy];
    originalStartColor = self->_originalStartColor;
    self->_originalStartColor = v4;

    [(PKProgressBar *)self _updateLayerColors];
  }
}

- (UIColor)gradientStartColor
{
  return self->_originalStartColor;
}

- (void)setGradientEndColor:(id)a3
{
  id v6 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    id v4 = (UIColor *)[v6 copy];
    originalEndColor = self->_originalEndColor;
    self->_originalEndColor = v4;

    [(PKProgressBar *)self _updateLayerColors];
  }
}

- (UIColor)gradientEndColor
{
  return self->_originalEndColor;
}

- (void)setProgress:(double)a3
{
  double v3 = fmax(fmin(a3, 1.0), 0.0);
  if (self->_progress != v3)
  {
    self->_progress = v3;
    [(PKProgressBar *)self setNeedsLayout];
  }
}

- (void)_updateLayerColors
{
  double v3 = [(PKProgressBar *)self traitCollection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__PKProgressBar__updateLayerColors__block_invoke;
  v4[3] = &unk_1E59CA7D0;
  v4[4] = self;
  PKUIPerformWithEffectiveTraitCollection(v3, v4);
}

void __35__PKProgressBar__updateLayerColors__block_invoke(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  CGColorRef v3 = CGColorRetain((CGColorRef)[v2 CGColor]);

  id v4 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "pkui_extendedLinearColor");
  v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "pkui_extendedLinearColor");
  id v6 = *(void **)(*(void *)(a1 + 32) + 408);
  id v7 = v4;
  uint64_t v8 = [v7 CGColor];
  if (v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = (uint64_t)v3;
  }
  v14[0] = v9;
  id v10 = v5;
  uint64_t v11 = [v10 CGColor];
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = (uint64_t)v3;
  }
  v14[1] = v12;
  CGRect v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v6 setColors:v13];

  CFRelease(v3);
}

- (double)progress
{
  return self->_progress;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)roundEndCap
{
  return self->_roundEndCap;
}

- (void)setRoundEndCap:(BOOL)a3
{
  self->_roundEndCap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalEndColor, 0);
  objc_storeStrong((id *)&self->_originalStartColor, 0);

  objc_storeStrong((id *)&self->_fillLayer, 0);
}

@end