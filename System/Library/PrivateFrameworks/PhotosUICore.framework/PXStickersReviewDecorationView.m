@interface PXStickersReviewDecorationView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (PXStickersReviewDecorationView)initWithFrame:(CGRect)a3;
- (float)_scoreForAssetReference:(id)a3;
- (unint64_t)decorationOptions;
- (void)setClippingRect:(CGRect)a3;
- (void)setDecorationOptions:(unint64_t)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXStickersReviewDecorationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_label, 0);
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

- (NSCopying)userData
{
  return self->_userData;
}

- (void)setDecorationOptions:(unint64_t)a3
{
  self->_decorationOptions = a3;
}

- (unint64_t)decorationOptions
{
  return self->_decorationOptions;
}

- (void)setUserData:(id)a3
{
  v6 = (NSCopying *)a3;
  if (self->_userData != v6)
  {
    v14 = v6;
    objc_storeStrong((id *)&self->_userData, a3);
    v7 = v14;
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = [MEMORY[0x1E4F28B00] currentHandler];
        v11 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v11);
        v13 = [(NSCopying *)v7 px_descriptionForAssertionMessage];
        [v10 handleFailureInMethod:a2, self, @"PXStickersReviewDecorationView.m", 72, @"%@ should be nil or an instance inheriting from %@, but it is %@", @"userData", v12, v13 object file lineNumber description];
      }
    }
    [(PXStickersReviewDecorationView *)self _scoreForAssetReference:v7];
    v9 = [NSString stringWithFormat:@" %.2f ", v8];
    [(UILabel *)self->_label setText:v9];

    v6 = v14;
  }
}

- (float)_scoreForAssetReference:(id)a3
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B00] currentHandler];
  v7 = (objc_class *)objc_opt_class();
  float v8 = NSStringFromClass(v7);
  [v6 handleFailureInMethod:a2, self, @"PXStickersReviewDecorationView.m", 57, @"Method %s is a responsibility of subclass %@", "-[PXStickersReviewDecorationView _scoreForAssetReference:]", v8 object file lineNumber description];

  abort();
}

- (PXStickersReviewDecorationView)initWithFrame:(CGRect)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PXStickersReviewDecorationView;
  v3 = -[PXStickersReviewDecorationView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    label = v3->_label;
    v3->_label = v4;

    v6 = [(UILabel *)v3->_label layer];
    [v6 setCornerRadius:4.0];

    v7 = [(UILabel *)v3->_label layer];
    [v7 setMasksToBounds:1];

    [(PXStickersReviewDecorationView *)v3 addSubview:v3->_label];
    float v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)v3->_label setBackgroundColor:v8];

    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(UILabel *)v3->_label leadingAnchor];
    v11 = [(PXStickersReviewDecorationView *)v3 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:10.0];
    v19[0] = v12;
    v13 = [(UILabel *)v3->_label bottomAnchor];
    v14 = [(PXStickersReviewDecorationView *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:-10.0];
    v19[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v9 activateConstraints:v16];
  }
  return v3;
}

@end