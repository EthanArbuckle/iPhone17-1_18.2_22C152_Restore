@interface PXMemoriesSpec
- (BOOL)feedShouldAllowHeaders;
- (BOOL)shouldRemoveHighlightOnScroll;
- (CGPoint)borderOffset;
- (CGPoint)highlightedSectionHeaderOffset;
- (CGSize)favoriteBadgeSize;
- (Class)feedDataSourceManagerClass;
- (Class)feedLayoutMetricsClass;
- (Class)feedTransitionAnimationCoordinatorClass;
- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5;
- (UIColor)borderColor;
- (UIColor)feedBackgroundColor;
- (UIColor)selectionHighlightColor;
- (UIColor)tabTitleTextColor;
- (UIEdgeInsets)favoriteBadgeInset;
- (UIEdgeInsets)feedEntryEdgeInsets;
- (UIEdgeInsets)layoutInsets;
- (UIFont)tabTitleFont;
- (double)_columnWidth;
- (double)_displayScale;
- (double)_feedInteritemSpacingForReferenceSize:(CGSize)a3;
- (double)borderWidth;
- (double)bottomShadowPadding;
- (double)distanceBetweenHeaderBaselineAndImageTop;
- (double)feedAdditionalContentThreshold;
- (double)feedEntryHeaderHeight;
- (double)feedHeroImageAspectRatio;
- (double)feedHeroImagePaddingBottom;
- (double)feedHeroImagePaddingTop;
- (double)feedInteritemSpacing;
- (double)feedSecondaryImagePaddingBottom;
- (double)firstFeedEntryHeaderHeight;
- (double)orbPreviewSize;
- (double)tabTitleBaselineOffset;
- (double)tabTopContentPadding;
- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3;
- (id)feedCategoryLabelTextColor;
- (id)newLayoutGeneratorWithMetrics:(id)a3;
- (int64_t)feedAxis;
- (int64_t)feedHeroPosition;
- (int64_t)feedSectionLayoutAxis;
- (int64_t)idiom;
- (unint64_t)_style;
- (unint64_t)feedMemoriesPerRow;
- (void)_calculateSectionInsetWithExtendedTraitCollection:(id)a3;
@end

@implementation PXMemoriesSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_tabTitleTextColor, 0);
  objc_storeStrong((id *)&self->_tabTitleFont, 0);
  objc_storeStrong((id *)&self->_selectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_feedBackgroundColor, 0);
}

- (double)_columnWidth
{
  return self->__columnWidth;
}

- (double)_displayScale
{
  return self->__displayScale;
}

- (unint64_t)_style
{
  return self->__style;
}

- (double)orbPreviewSize
{
  return self->_orbPreviewSize;
}

- (double)borderWidth
{
  return self->_borderWidth;
}

- (CGPoint)borderOffset
{
  double x = self->_borderOffset.x;
  double y = self->_borderOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (double)tabTopContentPadding
{
  return self->_tabTopContentPadding;
}

- (double)tabTitleBaselineOffset
{
  return self->_tabTitleBaselineOffset;
}

- (UIColor)tabTitleTextColor
{
  return self->_tabTitleTextColor;
}

- (UIFont)tabTitleFont
{
  return self->_tabTitleFont;
}

- (double)feedAdditionalContentThreshold
{
  return self->_feedAdditionalContentThreshold;
}

- (BOOL)shouldRemoveHighlightOnScroll
{
  return self->_shouldRemoveHighlightOnScroll;
}

- (CGPoint)highlightedSectionHeaderOffset
{
  double x = self->_highlightedSectionHeaderOffset.x;
  double y = self->_highlightedSectionHeaderOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIEdgeInsets)favoriteBadgeInset
{
  double top = self->_favoriteBadgeInset.top;
  double left = self->_favoriteBadgeInset.left;
  double bottom = self->_favoriteBadgeInset.bottom;
  double right = self->_favoriteBadgeInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)favoriteBadgeSize
{
  double width = self->_favoriteBadgeSize.width;
  double height = self->_favoriteBadgeSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)feedHeroImageAspectRatio
{
  return self->_feedHeroImageAspectRatio;
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (double)feedInteritemSpacing
{
  return self->_feedInteritemSpacing;
}

- (double)distanceBetweenHeaderBaselineAndImageTop
{
  return self->_distanceBetweenHeaderBaselineAndImageTop;
}

- (double)firstFeedEntryHeaderHeight
{
  return self->_firstFeedEntryHeaderHeight;
}

- (double)feedEntryHeaderHeight
{
  return self->_feedEntryHeaderHeight;
}

- (BOOL)feedShouldAllowHeaders
{
  return self->_feedShouldAllowHeaders;
}

- (UIEdgeInsets)feedEntryEdgeInsets
{
  double top = self->_feedEntryEdgeInsets.top;
  double left = self->_feedEntryEdgeInsets.left;
  double bottom = self->_feedEntryEdgeInsets.bottom;
  double right = self->_feedEntryEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)feedMemoriesPerRow
{
  return self->_feedMemoriesPerRow;
}

- (int64_t)feedAxis
{
  return self->_feedAxis;
}

- (int64_t)feedHeroPosition
{
  return self->_feedHeroPosition;
}

- (UIColor)selectionHighlightColor
{
  return self->_selectionHighlightColor;
}

- (UIColor)feedBackgroundColor
{
  return self->_feedBackgroundColor;
}

- (double)_feedInteritemSpacingForReferenceSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PXMemoriesSpec *)self feedInteritemSpacing];
  double v8 = v7;
  if (self->_idiom != 4) {
    return v8;
  }
  int64_t v9 = [(PXMemoriesSpec *)self feedAxis];
  [(PXFeatureSpec *)self contentGuideInsetsForScrollAxis:v9];
  switch(v9)
  {
    case 1:
      double v15 = width - v11 - v13;
      return v15 * 0.05;
    case 2:
      double v15 = height - v10 - v12;
      return v15 * 0.05;
    case 0:
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"PXMemoriesSpec.m" lineNumber:474 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return v8;
}

- (void)_calculateSectionInsetWithExtendedTraitCollection:(id)a3
{
  id v8 = a3;
  CGFloat v5 = *(double *)off_1E5DAAF10;
  CGFloat v4 = *((double *)off_1E5DAAF10 + 1);
  CGFloat v6 = *((double *)off_1E5DAAF10 + 2);
  CGFloat v7 = *((double *)off_1E5DAAF10 + 3);
  if ([(PXFeatureSpec *)self userInterfaceFeature] != 2)
  {
    if (self->_idiom == 3) {
      PXEdgeInsetsMake();
    }
    [(PXMemoriesSpec *)self feedAxis];
    [v8 layoutReferenceSize];
    PXSizeIsNull();
  }
  self->_feedEntryEdgeInsets.double top = v5;
  self->_feedEntryEdgeInsets.double left = v4;
  self->_feedEntryEdgeInsets.double bottom = v6;
  self->_feedEntryEdgeInsets.double right = v7;
}

- (UIEdgeInsets)layoutInsets
{
  if ([(PXFeatureSpec *)self userInterfaceFeature] != 2)
  {
    if (self->_idiom == 3)
    {
      if ([(PXMemoriesSpec *)self _style] == 2) {
        goto LABEL_4;
      }
    }
    else if ([(PXFeatureSpec *)self sizeClass] == 2 {
           && [(PXFeatureSpec *)self userInterfaceFeature] == 1)
    }
    {
      [(PXMemoriesSpec *)self feedInteritemSpacing];
    }
    PXEdgeInsetsMake();
  }
LABEL_4:
  double v3 = *(double *)off_1E5DAAF10;
  double v4 = *((double *)off_1E5DAAF10 + 1);
  double v5 = *((double *)off_1E5DAAF10 + 2);
  double v6 = *((double *)off_1E5DAAF10 + 3);
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (id)feedCategoryLabelTextColor
{
  return (id)[MEMORY[0x1E4FB1618] colorWithWhite:0.300000012 alpha:1.0];
}

- (double)feedSecondaryImagePaddingBottom
{
  double result = 67.0;
  if (self->_idiom != 3) {
    return 22.0;
  }
  return result;
}

- (double)bottomShadowPadding
{
  return 97.0;
}

- (double)feedHeroImagePaddingBottom
{
  return 22.0;
}

- (double)feedHeroImagePaddingTop
{
  double result = 0.0;
  if (self->_idiom == 3) {
    return 22.0;
  }
  return result;
}

- (int64_t)feedSectionLayoutAxis
{
  if ([(PXFeatureSpec *)self userInterfaceFeature] == 2 || self->_idiom == 3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)newLayoutGeneratorWithMetrics:(id)a3
{
  id v5 = a3;
  int64_t v6 = [(PXFeatureSpec *)self userInterfaceFeature];
  if ([(PXMemoriesSpec *)self _style] == 2)
  {
    [v5 referenceSize];
    double v8 = v7;
    double v10 = v9;
    double v11 = objc_alloc_init(PXGridLayoutMetrics);
    -[PXLayoutMetrics setReferenceSize:](v11, "setReferenceSize:", v8, v10);
    [(PXGridLayoutMetrics *)v11 setAxis:1];
    if ([(PXMemoriesSpec *)self idiom] == 3) {
      PXEdgeInsetsMake();
    }
    if (v6 == 1) {
      +[PXLayoutMetricInterpolator memoriesFeedPortraitEdgeInsetsInterpolator];
    }
    else {
    double v13 = +[PXLayoutMetricInterpolator memoriesDetailsEdgeInsetsInterpolator];
    }
    [(PXFeatureSpec *)self sizeClass];
    v14 = [v5 spec];
    [v14 safeAreaInsets];
    double v16 = v15;
    double v18 = v17;

    [v13 valueForMetric:v8 - v16 - v18];
    PXEdgeInsetsMake();
  }
  if (v6 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"PXMemoriesSpec.m", 335, @"Invalid parameter not satisfying: %@", @"[metrics isKindOfClass:[PXMemoriesFeedWidgetLayoutMetrics class]]" object file lineNumber description];
    }
    double v12 = [[PXMemoriesFeedWidgetLayoutGenerator alloc] initWithMetrics:v5];
  }
  else
  {
    double v12 = [[PXMemoriesFeedEntryLayoutGenerator alloc] initWithMetrics:v5];
    [(PXMemoriesFeedWidgetLayoutGenerator *)v12 setLayoutAxis:[(PXMemoriesSpec *)self feedSectionLayoutAxis]];
  }

  return v12;
}

- (Class)feedTransitionAnimationCoordinatorClass
{
  return (Class)objc_opt_class();
}

- (Class)feedLayoutMetricsClass
{
  if ((unint64_t)[(PXFeatureSpec *)self userInterfaceFeature] > 7) {
    v2 = 0;
  }
  else {
    v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (Class)feedDataSourceManagerClass
{
  [(PXFeatureSpec *)self userInterfaceFeature];
  v2 = objc_opt_class();
  return (Class)v2;
}

- (id)createViewSpecWithDescriptor:(PXViewSpecDescriptor *)a3
{
  unint64_t var1 = a3->var1;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__PXMemoriesSpec_createViewSpecWithDescriptor___block_invoke;
  aBlock[3] = &unk_1E5DD16C8;
  aBlock[4] = self;
  int64_t v6 = _Block_copy(aBlock);
  double v7 = v6;
  int64_t var0 = a3->var0;
  switch(a3->var0)
  {
    case 0x7D0:
      id v11 = objc_alloc_init((Class)off_1E5DA9858);
      [(PXFeatureSpec *)self configureViewSpec:v11];
      double v12 = [(PXMemoriesSpec *)self selectionHighlightColor];
      [v11 setSelectionHighlightColor:v12];
      goto LABEL_14;
    case 0x7D1:
      id v11 = objc_alloc_init((Class)off_1E5DA9858);
      [(PXFeatureSpec *)self configureViewSpec:v11];
      if ((var1 & 2) != 0)
      {
        double v17 = [(PXMemoriesSpec *)self borderColor];
        [v11 setBorderColor:v17];

        [(PXMemoriesSpec *)self borderWidth];
        objc_msgSend(v11, "setBorderWidth:");
        [(PXFeatureSpec *)self collectionTileImageCornerRadius];
        double v13 = v18 + v18;
      }
      else
      {
        [v11 setBorderColor:0];
        double v13 = 0.0;
        [v11 setBorderWidth:0.0];
      }
      [v11 setCornerRadius:v13];
      break;
    case 0x7D2:
      id v11 = objc_alloc_init((Class)off_1E5DA6FD0);
      [(PXFeatureSpec *)self configureViewSpec:v11];
      int64_t idiom = self->_idiom;
      if (idiom != 4)
      {
        if (idiom == 3) {
          PXFontWithTextStyle();
        }
        PXFontWithTextStyleSymbolicTraits();
      }
      v19 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0 weight:*MEMORY[0x1E4FB09E0]];
      [v11 setFont:v19];

      [v11 setCapitalization:0];
      [v11 setNumberOfLines:1];
      objc_msgSend(v11, "setTextAlignment:", -[PXFeatureSpec localizedLeadingTextAlignment](self, "localizedLeadingTextAlignment"));
      [v11 setVerticalAlignment:0];
      objc_msgSend(v11, "setContentInsets:", *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3));
      break;
    case 0x7D3:
    case 0x7D4:
      a3->int64_t var0 = (*((uint64_t (**)(void *, BOOL))v6 + 2))(v6, var0 == 2003) + 1960;
      v26.receiver = self;
      v26.super_class = (Class)PXMemoriesSpec;
      CGSize var2 = a3->var2;
      long long v24 = *(_OWORD *)&a3->var0;
      CGSize v25 = var2;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v26, sel_createViewSpecWithDescriptor_, &v24, v21.receiver, v21.super_class);
      goto LABEL_11;
    case 0x7D5:
      a3->int64_t var0 = 1915;
      v22.receiver = self;
      v22.super_class = (Class)PXMemoriesSpec;
      CGSize v16 = a3->var2;
      long long v24 = *(_OWORD *)&a3->var0;
      CGSize v25 = v16;
      [(PXFeatureSpec *)&v22 createViewSpecWithDescriptor:&v24];
      goto LABEL_13;
    case 0x7D6:
    case 0x7D7:
      a3->int64_t var0 = (*((uint64_t (**)(void *, BOOL))v6 + 2))(v6, var0 == 2006) + 1975;
      v23.receiver = self;
      v23.super_class = (Class)PXMemoriesSpec;
      CGSize v10 = a3->var2;
      long long v24 = *(_OWORD *)&a3->var0;
      CGSize v25 = v10;
      [(PXFeatureSpec *)&v23 createViewSpecWithDescriptor:&v24];
LABEL_13:
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      double v12 = [(PXMemoriesSpec *)self feedBackgroundColor];
      [v11 setBackgroundColor:v12];
LABEL_14:

      break;
    default:
      v21.receiver = self;
      v21.super_class = (Class)PXMemoriesSpec;
      CGSize v15 = a3->var2;
      long long v24 = *(_OWORD *)&a3->var0;
      CGSize v25 = v15;
      -[PXFeatureSpec createViewSpecWithDescriptor:](&v21, sel_createViewSpecWithDescriptor_, &v24, self, PXMemoriesSpec);
LABEL_11:
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      break;
  }

  return v11;
}

uint64_t __47__PXMemoriesSpec_createViewSpecWithDescriptor___block_invoke(uint64_t a1, int a2)
{
  if (!a2) {
    return 3;
  }
  [*(id *)(a1 + 32) feedHeroImageAspectRatio];
  if (v2 == 1.0) {
    return 1;
  }
  else {
    return 2;
  }
}

- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 style:(unint64_t)a5
{
  id v7 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXMemoriesSpec;
  double v8 = [(PXFeatureSpec *)&v10 initWithExtendedTraitCollection:v7 options:a4];
  if (v8)
  {
    v8->_feedShouldAllowHeaders = 1;
    [v7 layoutMargins];
    PXEdgeInsetsMake();
  }

  return 0;
}

- (PXMemoriesSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXMemoriesSpec *)self initWithExtendedTraitCollection:a3 options:a4 style:0];
}

@end