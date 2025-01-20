@interface PXContentSyndicationReviewDecorationView
- (CGRect)clippingRect;
- (PXAssetReference)userData;
- (PXContentSyndicationReviewDecorationView)initWithFrame:(CGRect)a3;
- (unint64_t)decorationOptions;
- (void)_positionSubviews;
- (void)_setEligibility:(int64_t)a3;
- (void)_updateAssetInformation;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setDecorationOptions:(unint64_t)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXContentSyndicationReviewDecorationView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

- (PXAssetReference)userData
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
  v5 = (PXAssetReference *)a3;
  if (self->_userData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_userData, a3);
    [(PXContentSyndicationReviewDecorationView *)self _updateAssetInformation];
    v5 = v6;
  }
}

- (void)_updateAssetInformation
{
  v3 = [(PXContentSyndicationReviewDecorationView *)self userData];
  uint64_t v4 = PXContentSyndicationReviewDecorationEligibilityForAssetReference(v3);

  [(PXContentSyndicationReviewDecorationView *)self _setEligibility:v4];
}

- (void)_setEligibility:(int64_t)a3
{
  if (self->_eligibility != a3)
  {
    self->_eligibilitdouble y = a3;
    PXContentSyndicationReviewDecorationImageForSyndicationEligibility(a3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(UIImageView *)self->_imageView setImage:v4];
  }
}

- (void)_positionSubviews
{
  uint64_t v3 = [(PXContentSyndicationReviewDecorationView *)self effectiveUserInterfaceLayoutDirection];
  [(PXContentSyndicationReviewDecorationView *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.2;
  double v8 = v6 * 0.05;
  double v9 = v4 - v6 * 0.05 - v6 * 0.2;
  if (v3) {
    double v9 = v8;
  }
  double v10 = v7;
  CGRect v13 = CGRectIntegral(*(CGRect *)&v9);
  imageView = self->_imageView;
  -[UIImageView setFrame:](imageView, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
}

- (void)layoutSubviews
{
  [(PXContentSyndicationReviewDecorationView *)self _positionSubviews];
  v3.receiver = self;
  v3.super_class = (Class)PXContentSyndicationReviewDecorationView;
  [(PXContentSyndicationReviewDecorationView *)&v3 layoutSubviews];
}

- (PXContentSyndicationReviewDecorationView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PXContentSyndicationReviewDecorationView;
  objc_super v3 = -[PXContentSyndicationReviewDecorationView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    [(PXContentSyndicationReviewDecorationView *)v3 addSubview:v3->_imageView];
  }
  return v3;
}

@end