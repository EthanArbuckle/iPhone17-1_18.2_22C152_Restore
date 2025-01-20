@interface PUReviewScreenControlBarButton
- (BOOL)useCompactSize;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)alignmentRectInsets;
- (double)_padding;
- (double)_selectedIndicatorAlpha;
- (void)layoutSubviews;
- (void)setUseCompactSize:(BOOL)a3;
@end

@implementation PUReviewScreenControlBarButton

- (void)setUseCompactSize:(BOOL)a3
{
  self->_useCompactSize = a3;
}

- (BOOL)useCompactSize
{
  return self->_useCompactSize;
}

- (double)_selectedIndicatorAlpha
{
  return 0.0;
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)PUReviewScreenControlBarButton;
  [(PUReviewScreenControlBarButton *)&v29 layoutSubviews];
  [(PUReviewScreenControlBarButton *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(PUReviewScreenControlBarButton *)self _padding];
  double v12 = v11;
  double v26 = v11;
  v13 = [(PUReviewScreenControlBarButton *)self imageView];
  v14 = [(PUReviewScreenControlBarButton *)self titleLabel];
  [v13 frame];
  [(PUReviewScreenControlBarButton *)self intrinsicContentSize];
  double v16 = v15;
  double v18 = v17;
  [v14 intrinsicContentSize];
  double v27 = v19;
  CGFloat v28 = v20;
  double v21 = v12 + v20;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  CGFloat v22 = CGRectGetMidY(v30) - v18 * 0.5 - v21 * 0.5;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  CGFloat v23 = CGRectGetMidX(v31) - v16 * 0.5;
  objc_msgSend(v13, "setFrame:", PURoundRectToPixel(v23, v22, v16, v18));
  v32.origin.x = v23;
  v32.origin.y = v22;
  v32.size.width = v16;
  v32.size.height = v18;
  CGFloat v24 = v26 + CGRectGetMaxY(v32);
  v33.origin.x = v23;
  v33.origin.y = v22;
  v33.size.width = v16;
  v33.size.height = v18;
  CGFloat MidX = CGRectGetMidX(v33);
  objc_msgSend(v14, "setFrame:", PUExtendRectToPixel(MidX - v27 * 0.5, v24, v27, v28));
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v3 = [(PUReviewScreenControlBarButton *)self titleLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  [(PUReviewScreenControlBarButton *)self intrinsicContentSize];
  double v9 = v5 - v8;
  if (v9 >= 0.0) {
    double v10 = v9 * 0.5;
  }
  else {
    double v10 = 0.0;
  }
  [(PUReviewScreenControlBarButton *)self intrinsicContentSize];
  double v12 = (50.0 - v11) * 0.5;
  if (v10 >= v12) {
    double v13 = v10;
  }
  else {
    double v13 = v12;
  }
  [(PUReviewScreenControlBarButton *)self _padding];
  double v15 = v7 + v14;
  double v16 = 0.0;
  double v17 = v13;
  double v18 = v13;
  result.right = v18;
  result.bottom = v15;
  result.left = v17;
  result.top = v16;
  return result;
}

- (double)_padding
{
  BOOL v2 = [(PUReviewScreenControlBarButton *)self useCompactSize];
  double result = 6.0;
  if (v2) {
    return 4.0;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  BOOL v2 = [(PUReviewScreenControlBarButton *)self useCompactSize];
  double v3 = 42.0;
  if (v2) {
    double v3 = 30.0;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

@end