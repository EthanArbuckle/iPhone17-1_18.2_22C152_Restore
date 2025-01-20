@interface PXPhotosDetailsAssetsSpec
+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3;
- (BOOL)enableBadges;
- (BOOL)shouldShowTitle;
- (CGSize)gridInterItemSpacing;
- (CGSize)gridItemSize;
- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4;
- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5;
- (PXWidgetSpec)_widgetSpec;
- (UIEdgeInsets)contentGuideInsets;
- (UIEdgeInsets)gridContentInsets;
- (double)defaultCornerRadius;
- (double)editorialInterTileSpacing;
- (double)exploreInteritemSpacing;
- (int64_t)editorialNumberOfColumns;
- (int64_t)gridContentMode;
- (unint64_t)detailsOptions;
- (void)_computeEditorialWithExtendedTraitCollection:(id)a3;
- (void)_computeGridWithExtendedTraitCollection:(id)a3;
- (void)_computeSpecWithExtendedTraitCollection:(id)a3;
@end

@implementation PXPhotosDetailsAssetsSpec

- (void).cxx_destruct
{
}

- (PXWidgetSpec)_widgetSpec
{
  return self->__widgetSpec;
}

- (unint64_t)detailsOptions
{
  return self->_detailsOptions;
}

- (double)exploreInteritemSpacing
{
  return self->_exploreInteritemSpacing;
}

- (int64_t)gridContentMode
{
  return self->_gridContentMode;
}

- (CGSize)gridItemSize
{
  double width = self->_gridItemSize.width;
  double height = self->_gridItemSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)gridContentInsets
{
  double top = self->_gridContentInsets.top;
  double left = self->_gridContentInsets.left;
  double bottom = self->_gridContentInsets.bottom;
  double right = self->_gridContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)gridInterItemSpacing
{
  double width = self->_gridInterItemSpacing.width;
  double height = self->_gridInterItemSpacing.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)enableBadges
{
  return self->_enableBadges;
}

- (double)editorialInterTileSpacing
{
  return self->_editorialInterTileSpacing;
}

- (int64_t)editorialNumberOfColumns
{
  return self->_editorialNumberOfColumns;
}

- (BOOL)shouldShowTitle
{
  return self->_shouldShowTitle;
}

- (UIEdgeInsets)contentGuideInsets
{
  double top = self->_contentGuideInsets.top;
  double left = self->_contentGuideInsets.left;
  double bottom = self->_contentGuideInsets.bottom;
  double right = self->_contentGuideInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (void)_computeGridWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  v5 = [v4 traitCollection];
  [v4 layoutReferenceSize];
  double v7 = v6;
  [(PXPhotosDetailsAssetsSpec *)self contentGuideInsets];
  double v10 = v7 - (v8 + v9);
  int v11 = [(id)objc_opt_class() shouldUsePhoneLayoutWithTraitCollection:v5];
  uint64_t v12 = [v5 userInterfaceIdiom];
  if (v12 == 2)
  {
    CGFloat v22 = *MEMORY[0x1E4FB2848];
    double v21 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    CGFloat v19 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    double v16 = (v10 - v21 - v18 + -200.0) / 5.0;
    double v17 = 50.0;
    int64_t v20 = 1;
LABEL_10:
    CGFloat v15 = v16;
    goto LABEL_11;
  }
  if (!v11)
  {
    if (![(PXFeatureSpec *)self shouldInsetAllPhotoDetailsContent])
    {
      [(PXPhotosDetailsAssetsSpec *)self _widgetSpec];
      [(id)objc_claimAutoreleasedReturnValue() contentGuideInsets];
      PXEdgeInsetsForEdges();
    }
    CGFloat v22 = *(double *)off_1E5DAAF10;
    double v21 = *((double *)off_1E5DAAF10 + 1);
    CGFloat v19 = *((double *)off_1E5DAAF10 + 2);
    double v18 = *((double *)off_1E5DAAF10 + 3);
    double v23 = v10 - (v18 + v21);
    double v24 = (v23 + 12.0) / 144.0;
    unint64_t v25 = vcvtmd_s64_f64(v24);
    double v26 = (double)(uint64_t)floor(v24);
    double v16 = 132.0;
    double v27 = (double)(uint64_t)(v25 - 1);
    double v17 = (v23 - v26 * 132.0) / v27;
    int64_t v20 = 0;
    if (v17 > 20.0)
    {
      double v16 = floor(v23 + v27 * -20.0) / v26;
      double v17 = (v23 + -v26 * v16) / v27;
    }
    goto LABEL_10;
  }
  unint64_t v13 = +[PXLayoutMetricInterpolator photosGridLayoutColumnsForWidth:v10];
  [v4 displayScale];
  double v28 = 0.0;
  double v29 = 0.0;
  +[PXLayoutMetricInterpolator bestItemSizeForAvailableWidth:v13 screenScale:&v29 columns:&v28 bestSpacing:v10 bestInset:v14];
  double v18 = v28;
  double v17 = v29;
  CGFloat v19 = 0.0;
  int64_t v20 = 1;
  double v21 = v28;
  CGFloat v22 = 0.0;
LABEL_11:
  self->_gridInterItemSpacing.double width = v17;
  self->_gridInterItemSpacing.double height = v17;
  self->_gridContentInsets.double top = v22;
  self->_gridContentInsets.double left = v21;
  self->_gridContentInsets.double bottom = v19;
  self->_gridContentInsets.double right = v18;
  self->_gridItemSize.double width = v15;
  self->_gridItemSize.double height = v16;
  self->_gridContentMode = v20;
  self->_enableBadges = v12 != 2;
}

- (void)_computeEditorialWithExtendedTraitCollection:(id)a3
{
  id v11 = a3;
  if ([v11 userInterfaceIdiom] == 1 && objc_msgSend(v11, "layoutOrientation") == 1)
  {
    p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
    self->_editorialNumberOfColumns = 3;
    double v5 = 2.0;
LABEL_9:
    double v7 = v11;
    goto LABEL_10;
  }
  if ([v11 userInterfaceIdiom] != 2)
  {
    p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
    self->_editorialNumberOfColumns = 5;
    double v5 = 3.0;
    goto LABEL_9;
  }
  p_editorialNumberOfColumns = &self->_editorialNumberOfColumns;
  BOOL v6 = [v11 layoutSizeClass] == 1;
  double v7 = v11;
  if (v6)
  {
    int64_t *p_editorialNumberOfColumns = 3;
    double v5 = 2.0;
  }
  else
  {
    int64_t *p_editorialNumberOfColumns = 5;
    double v5 = 3.0;
  }
LABEL_10:
  self->_editorialInterTileSpacing = v5;
  if ([v7 userInterfaceIdiom] == 3) {
    self->_editorialInterTileSpacing = 50.0;
  }
  double v8 = +[PXPhotosDetailsSettings sharedInstance];
  int v9 = [v8 editorialLayoutEdit];

  if (v9)
  {
    double v10 = +[PXPhotosDetailsSettings sharedInstance];
    int64_t *p_editorialNumberOfColumns = [v10 editorialLayoutColumns];
  }
}

- (void)_computeSpecWithExtendedTraitCollection:(id)a3
{
  id v4 = a3;
  [(PXPhotosDetailsAssetsSpec *)self _computeEditorialWithExtendedTraitCollection:v4];
  [(PXPhotosDetailsAssetsSpec *)self _computeGridWithExtendedTraitCollection:v4];
}

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 detailsOptions:(unint64_t)a5
{
  id v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotosDetailsAssetsSpec;
  int v9 = [(PXFeatureSpec *)&v20 initWithExtendedTraitCollection:v8 options:a4];
  double v10 = v9;
  if (v9)
  {
    v9->_detailsOptions = a5;
    id v11 = [[PXWidgetSpec alloc] initWithExtendedTraitCollection:v8 detailsOptions:a5];
    widgetSpec = v10->__widgetSpec;
    v10->__widgetSpec = v11;

    [(PXWidgetSpec *)v10->__widgetSpec contentGuideInsets];
    v10->_contentGuideInsets.double top = v13;
    v10->_contentGuideInsets.double left = v14;
    v10->_contentGuideInsets.double bottom = v15;
    v10->_contentGuideInsets.double right = v16;
    if (![(PXFeatureSpec *)v10 shouldInsetAllPhotoDetailsContent])
    {
      v10->_contentGuideInsets.double right = 0.0;
      v10->_contentGuideInsets.double left = 0.0;
    }
    v10->_shouldShowTitle = (a5 & 8) == 0;
    v10->_defaultCornerRadius = 0.0;
    double v17 = +[PXCuratedLibrarySettings sharedInstance];
    [v17 interitemSpacingForDays];
    v10->_exploreInteritemSpacing = v18;

    if ([v8 userInterfaceIdiom] == 5)
    {
      v10->_defaultCornerRadius = 2.0;
      v10->_shouldShowTitle = 0;
      v10->_exploreInteritemSpacing = 2.0;
    }
    [(PXPhotosDetailsAssetsSpec *)v10 _computeSpecWithExtendedTraitCollection:v8];
  }

  return v10;
}

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 detailsOptions:(unint64_t)a4
{
  return [(PXPhotosDetailsAssetsSpec *)self initWithExtendedTraitCollection:a3 options:0 detailsOptions:a4];
}

- (PXPhotosDetailsAssetsSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXPhotosDetailsAssetsSpec *)self initWithExtendedTraitCollection:a3 options:a4 detailsOptions:0];
}

+ (BOOL)shouldUsePhoneLayoutWithTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 horizontalSizeClass] == 1 || objc_msgSend(v3, "verticalSizeClass") == 1;

  return v4;
}

@end