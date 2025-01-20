@interface OBAnimationView
- (BOOL)flipForRTL;
- (CALayer)packageLayer;
- (CAPackage)package;
- (CGRect)preferredFrame;
- (CGSize)intrinsicContentSize;
- (OBAnimationAppearanceChangeDelegate)appearanceChangeDelegate;
- (OBAnimationView)initWithFrame:(CGRect)a3;
- (double)defaultScale;
- (double)scale;
- (void)_setPackage:(id)a3;
- (void)layoutSubviews;
- (void)setAppearanceChangeDelegate:(id)a3;
- (void)setFlipForRTL:(BOOL)a3;
- (void)setPackage:(id)a3;
- (void)setPackage:(id)a3 sizingTransformScale:(double)a4;
- (void)setPackageLayer:(id)a3;
- (void)setPreferredFrame:(CGRect)a3;
- (void)setScale:(double)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBAnimationView

- (OBAnimationView)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)OBAnimationView;
  result = -[OBAnimationView initWithFrame:](&v8, sel_initWithFrame_);
  if (result)
  {
    result->_preferredFrame.origin.CGFloat x = x;
    result->_preferredFrame.origin.CGFloat y = y;
    result->_preferredFrame.size.CGFloat width = width;
    result->_preferredFrame.size.CGFloat height = height;
  }
  return result;
}

- (double)defaultScale
{
  [(OBAnimationView *)self preferredFrame];
  double v4 = v3;
  v5 = [(OBAnimationView *)self package];
  v6 = [v5 rootLayer];
  [v6 size];
  double v8 = v4 / v7;

  return v8;
}

- (void)setPackage:(id)a3 sizingTransformScale:(double)a4
{
  double v7 = (CAPackage *)a3;
  [(OBAnimationView *)self setScale:a4];
  if (self->_package != v7)
  {
    objc_storeStrong((id *)&self->_package, a3);
    [(OBAnimationView *)self _setPackage:v7];
  }
}

- (void)_setPackage:(id)a3
{
  id v4 = a3;
  v5 = [(OBAnimationView *)self packageLayer];
  [v5 removeFromSuperlayer];

  v6 = [v4 rootLayer];
  [(OBAnimationView *)self setPackageLayer:v6];

  uint64_t v7 = [v4 isGeometryFlipped];
  double v8 = [(OBAnimationView *)self packageLayer];
  [v8 setGeometryFlipped:v7];

  uint64_t v9 = *MEMORY[0x1E4F3A3D8];
  v10 = [(OBAnimationView *)self packageLayer];
  [v10 setContentsGravity:v9];

  v11 = [(OBAnimationView *)self packageLayer];
  [v11 setMasksToBounds:0];

  uint64_t v12 = *MEMORY[0x1E4F39F98];
  v13 = [(OBAnimationView *)self packageLayer];
  [v13 setFillMode:v12];

  v14 = [(OBAnimationView *)self layer];
  [v14 setShouldRasterize:0];

  v15 = [(OBAnimationView *)self layer];
  v16 = [(OBAnimationView *)self packageLayer];
  [v15 addSublayer:v16];

  [(OBAnimationView *)self invalidateIntrinsicContentSize];
  [(OBAnimationView *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  double v3 = [(OBAnimationView *)self layer];
  [v3 setMasksToBounds:0];

  id v4 = [(OBAnimationView *)self packageLayer];
  v5 = [(OBAnimationView *)self superview];
  [v5 center];
  objc_msgSend(v4, "setPosition:");

  [(OBAnimationView *)self scale];
  double v7 = v6;
  [(OBAnimationView *)self scale];
  if (v8 == 0.0)
  {
    [(OBAnimationView *)self bounds];
    double v10 = v9;
    v11 = [(OBAnimationView *)self packageLayer];
    [v11 bounds];
    double v7 = v10 / v12;
  }
  v13 = [(OBAnimationView *)self packageLayer];
  v14 = [(OBAnimationView *)self packageLayer];
  v15 = v14;
  if (v14) {
    [v14 contentsTransform];
  }
  else {
    memset(&v16, 0, sizeof(v16));
  }
  CGAffineTransformScale(&v17, &v16, v7, v7);
  [v13 setAffineTransform:&v17];
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(OBAnimationView *)self packageLayer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(OBAnimationView *)self scale];
  if (v8 == 0.0)
  {
    [(OBAnimationView *)self preferredFrame];
    double v10 = v9;
    v11 = [(OBAnimationView *)self packageLayer];
    [v11 bounds];
    double v13 = v10 / v12;
  }
  else
  {
    double v13 = v8;
  }
  v14 = [(OBAnimationView *)self packageLayer];
  v15 = v14;
  if (v14) {
    [v14 contentsTransform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  CGAffineTransformScale(&v21, &v20, v13, v13);
  double v16 = v7 * v21.c + v21.a * v5;

  [(OBAnimationView *)self preferredFrame];
  double v18 = v17;
  double v19 = v16;
  result.CGFloat height = v18;
  result.CGFloat width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v9 = a3;
  if (!v9
    || (uint64_t v4 = [v9 userInterfaceStyle],
        [(OBAnimationView *)self traitCollection],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 userInterfaceStyle],
        v5,
        double v7 = v9,
        v4 != v6))
  {
    double v8 = [(OBAnimationView *)self appearanceChangeDelegate];
    [v8 updateAnimationForAppearanceChange];

    double v7 = v9;
  }
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (OBAnimationAppearanceChangeDelegate)appearanceChangeDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearanceChangeDelegate);
  return (OBAnimationAppearanceChangeDelegate *)WeakRetained;
}

- (void)setAppearanceChangeDelegate:(id)a3
{
}

- (BOOL)flipForRTL
{
  return self->_flipForRTL;
}

- (void)setFlipForRTL:(BOOL)a3
{
  self->_flipForRTL = a3;
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
}

- (CAPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
}

- (CGRect)preferredFrame
{
  double x = self->_preferredFrame.origin.x;
  double y = self->_preferredFrame.origin.y;
  double width = self->_preferredFrame.size.width;
  double height = self->_preferredFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreferredFrame:(CGRect)a3
{
  self->_preferredFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_destroyWeak((id *)&self->_appearanceChangeDelegate);
}

@end