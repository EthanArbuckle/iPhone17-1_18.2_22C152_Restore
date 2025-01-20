@interface PXZoomableInlineHeadersLayoutSpec
- (PXZoomableInlineHeadersLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (UIEdgeInsets)headerFloatMarginsForSafeAreaInsets:(UIEdgeInsets)a3;
- (double)headerOffsetY;
- (unint64_t)style;
@end

@implementation PXZoomableInlineHeadersLayoutSpec

- (double)headerOffsetY
{
  return self->_headerOffsetY;
}

- (UIEdgeInsets)headerFloatMarginsForSafeAreaInsets:(UIEdgeInsets)a3
{
  v3 = &OBJC_IVAR___PXZoomableInlineHeadersLayoutSpec__headerFloatMargins;
  if (a3.top > 44.0) {
    v3 = &OBJC_IVAR___PXZoomableInlineHeadersLayoutSpec__headerFloatMarginsWithTallSafeAreaInsets;
  }
  v4 = (double *)((char *)self + *v3);
  double v5 = v4[2];
  double v6 = v4[3];
  double v7 = *v4;
  double v8 = v4[1];
  result.right = v6;
  result.bottom = v5;
  result.left = v8;
  result.top = v7;
  return result;
}

- (PXZoomableInlineHeadersLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableInlineHeadersLayoutSpec;
  double v7 = [(PXFeatureSpec *)&v9 initWithExtendedTraitCollection:v6 options:a4];
  if (v7)
  {
    [v6 layoutSizeClass];
    v7->_style = (unint64_t)([v6 contentSizeCategory] - 8) < 5;
    [(PXFeatureSpec *)v7 safeAreaInsets];
    [v6 layoutReferenceSize];
    [v6 userInterfaceIdiom];
    PXEdgeInsetsMake();
  }

  return 0;
}

- (unint64_t)style
{
  return self->_style;
}

@end