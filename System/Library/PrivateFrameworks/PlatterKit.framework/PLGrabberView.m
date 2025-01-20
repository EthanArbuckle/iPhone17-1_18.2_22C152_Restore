@interface PLGrabberView
- (CGSize)_defaultContainerSize;
- (CGSize)_intrinsicContentSizeWithContainerSize:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (PLGrabberView)initWithFrame:(CGRect)a3;
- (double)weighting;
- (void)_configureMaterialViewIfNecessary;
- (void)layoutSubviews;
- (void)setWeighting:(double)a3;
@end

@implementation PLGrabberView

- (double)weighting
{
  [(PLGrabberView *)self _configureMaterialViewIfNecessary];
  materialView = self->_materialView;
  [(MTMaterialView *)materialView weighting];
  return result;
}

- (void)setWeighting:(double)a3
{
  [(PLGrabberView *)self weighting];
  if (v5 != a3)
  {
    materialView = self->_materialView;
    [(MTMaterialView *)materialView setWeighting:a3];
  }
}

- (PLGrabberView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    [(PLGrabberView *)self intrinsicContentSize];
    BSRectWithSize();
    double x = v8;
    double y = v9;
    double width = v10;
    double height = v11;
  }
  v15.receiver = self;
  v15.super_class = (Class)PLGrabberView;
  v12 = -[PLGrabberView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12) {
    [(PLGrabberView *)v12 setWeighting:1.0];
  }
  return v13;
}

- (CGSize)intrinsicContentSize
{
  [(PLGrabberView *)self _defaultContainerSize];
  -[PLGrabberView _intrinsicContentSizeWithContainerSize:](self, "_intrinsicContentSizeWithContainerSize:");
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PLGrabberView;
  [(PLGrabberView *)&v4 layoutSubviews];
  [(PLGrabberView *)self _configureMaterialViewIfNecessary];
  materialView = self->_materialView;
  [(PLGrabberView *)self bounds];
  [(MTMaterialView *)materialView _setContinuousCornerRadius:CGRectGetHeight(v5) * 0.5];
}

- (CGSize)_defaultContainerSize
{
  v2 = [(PLGrabberView *)self window];
  double v3 = [v2 windowScene];
  objc_super v4 = [v3 screen];
  CGRect v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F42D90] mainScreen];
  }
  v7 = v6;

  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)_intrinsicContentSizeWithContainerSize:(CGSize)a3
{
  double v3 = round(a3.width * 0.11971831);
  double v4 = 10.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)_configureMaterialViewIfNecessary
{
  if (!self->_materialView)
  {
    double v3 = (void *)MEMORY[0x1E4F743C8];
    double v4 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
    CGRect v5 = [v3 materialViewWithRecipe:19 compatibleWithTraitCollection:v4];
    materialView = self->_materialView;
    self->_materialView = v5;

    [(MTMaterialView *)self->_materialView setRecipeDynamic:0];
    v7 = self->_materialView;
    [(PLGrabberView *)self bounds];
    -[MTMaterialView setFrame:](v7, "setFrame:");
    [(PLGrabberView *)self insertSubview:self->_materialView atIndex:0];
    double v8 = self->_materialView;
    [(MTMaterialView *)v8 setAutoresizingMask:18];
  }
}

- (void).cxx_destruct
{
}

@end