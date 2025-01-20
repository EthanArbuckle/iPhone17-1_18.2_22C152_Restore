@interface PXPhotosLayoutSpec
- (BOOL)allowsEmptyTitles;
- (BOOL)contentUnavailablePlaceholderDisablesVerticalBounce;
- (BOOL)isTV;
- (BOOL)wantsSectionsBlur;
- (BOOL)wantsShowAllButtonsInSectionFooters;
- (BOOL)wantsToggleSidebarButton;
- (NSDirectionalEdgeInsets)contentUnavailablePlaceholderDirectionalLayoutMargins;
- (NSString)visualEffectViewGroupName;
- (PXAssetsSectionLayoutSpec)assetsSpec;
- (PXExtendedImageConfiguration)backgroundGradientImageConfiguration;
- (PXExtendedImageConfiguration)behindContentBackgroundGradientImageConfiguration;
- (PXPhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForLeadingChrome:(BOOL)a7;
- (PXPhotosSectionHeaderLayoutSpec)sectionHeaderSpec;
- (UIColor)contentBackgroundColor;
- (UIColor)headerTitleOverBackgroundColor;
- (UIColor)headerTitleOverContentColor;
- (UIColor)placeholderFontColor;
- (UIFont)headerSubtitleFont;
- (UIFont)headerTitleFont;
- (UIFont)placeholderFont;
- (double)aspectFitContentVerticalPadding;
- (double)backgroundGradientCornerRadius;
- (double)contentBackgroundOpacity;
- (double)endButtonSpacing;
- (double)headerTitleBottomSpacing;
- (double)headerTitleButtonAlignmentSpacing;
- (double)headerTitleLeadingSpacing;
- (double)headerTitleTopSpacing;
- (double)interButtonSpacing;
- (double)interPageSpacing;
- (double)interSectionSpacing;
- (double)scrollSnapMaximumAccelerationFactor;
- (double)scrollSnapMaximumDecelerationFactor;
- (double)squareContentVerticalPadding;
- (double)topChromeHeight;
- (double)topTrailingChromeWidth;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)scrollSnapBehavior;
- (int64_t)searchActionLocation;
- (void)configureScrollSnapController:(id)a3;
@end

@implementation PXPhotosLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderFontColor, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_behindContentBackgroundGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_backgroundGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_headerTitleOverContentColor, 0);
  objc_storeStrong((id *)&self->_headerTitleOverBackgroundColor, 0);
  objc_storeStrong((id *)&self->_headerSubtitleFont, 0);
  objc_storeStrong((id *)&self->_headerTitleFont, 0);
  objc_storeStrong((id *)&self->_assetsSpec, 0);
}

- (double)scrollSnapMaximumAccelerationFactor
{
  return self->_scrollSnapMaximumAccelerationFactor;
}

- (double)scrollSnapMaximumDecelerationFactor
{
  return self->_scrollSnapMaximumDecelerationFactor;
}

- (int64_t)scrollSnapBehavior
{
  return self->_scrollSnapBehavior;
}

- (UIColor)placeholderFontColor
{
  return self->_placeholderFontColor;
}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (BOOL)contentUnavailablePlaceholderDisablesVerticalBounce
{
  return self->_contentUnavailablePlaceholderDisablesVerticalBounce;
}

- (NSDirectionalEdgeInsets)contentUnavailablePlaceholderDirectionalLayoutMargins
{
  double top = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.top;
  double leading = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.leading;
  double bottom = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.bottom;
  double trailing = self->_contentUnavailablePlaceholderDirectionalLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (int64_t)preferredUserInterfaceStyle
{
  return self->_preferredUserInterfaceStyle;
}

- (double)interPageSpacing
{
  return self->_interPageSpacing;
}

- (BOOL)allowsEmptyTitles
{
  return self->_allowsEmptyTitles;
}

- (BOOL)isTV
{
  return self->_isTV;
}

- (BOOL)wantsSectionsBlur
{
  return self->_wantsSectionsBlur;
}

- (BOOL)wantsShowAllButtonsInSectionFooters
{
  return self->_wantsShowAllButtonsInSectionFooters;
}

- (double)endButtonSpacing
{
  return self->_endButtonSpacing;
}

- (double)interButtonSpacing
{
  return self->_interButtonSpacing;
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (double)contentBackgroundOpacity
{
  return self->_contentBackgroundOpacity;
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (PXExtendedImageConfiguration)behindContentBackgroundGradientImageConfiguration
{
  return self->_behindContentBackgroundGradientImageConfiguration;
}

- (PXExtendedImageConfiguration)backgroundGradientImageConfiguration
{
  return self->_backgroundGradientImageConfiguration;
}

- (double)backgroundGradientCornerRadius
{
  return self->_backgroundGradientCornerRadius;
}

- (double)squareContentVerticalPadding
{
  return self->_squareContentVerticalPadding;
}

- (double)aspectFitContentVerticalPadding
{
  return self->_aspectFitContentVerticalPadding;
}

- (double)topChromeHeight
{
  return self->_topChromeHeight;
}

- (double)topTrailingChromeWidth
{
  return self->_topTrailingChromeWidth;
}

- (BOOL)wantsToggleSidebarButton
{
  return self->_wantsToggleSidebarButton;
}

- (UIColor)headerTitleOverContentColor
{
  return self->_headerTitleOverContentColor;
}

- (UIColor)headerTitleOverBackgroundColor
{
  return self->_headerTitleOverBackgroundColor;
}

- (UIFont)headerSubtitleFont
{
  return self->_headerSubtitleFont;
}

- (UIFont)headerTitleFont
{
  return self->_headerTitleFont;
}

- (double)headerTitleBottomSpacing
{
  return self->_headerTitleBottomSpacing;
}

- (double)headerTitleTopSpacing
{
  return self->_headerTitleTopSpacing;
}

- (double)headerTitleButtonAlignmentSpacing
{
  return self->_headerTitleButtonAlignmentSpacing;
}

- (double)headerTitleLeadingSpacing
{
  return self->_headerTitleLeadingSpacing;
}

- (int64_t)searchActionLocation
{
  return self->_searchActionLocation;
}

- (PXAssetsSectionLayoutSpec)assetsSpec
{
  return self->_assetsSpec;
}

- (void)configureScrollSnapController:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setSnapBehavior:", -[PXPhotosLayoutSpec scrollSnapBehavior](self, "scrollSnapBehavior"));
  [(PXPhotosLayoutSpec *)self scrollSnapMaximumDecelerationFactor];
  objc_msgSend(v4, "setMaximumDecelerationFactor:");
  [(PXPhotosLayoutSpec *)self scrollSnapMaximumAccelerationFactor];
  objc_msgSend(v4, "setMaximumAccelerationFactor:");
}

- (NSString)visualEffectViewGroupName
{
  return (NSString *)@"PhotosGridVisualEffectViewBackdropGroup";
}

- (PXPhotosSectionHeaderLayoutSpec)sectionHeaderSpec
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXPhotosLayoutSpec.m" lineNumber:184 description:@"Section header spec accessed on invalid parent spec (not configured for section headers)"];

  abort();
}

- (PXPhotosLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 gridStyle:(int64_t)a5 wantsToggleSidebarButton:(BOOL)a6 shouldMakeSpaceForLeadingChrome:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  v78.receiver = self;
  v78.super_class = (Class)PXPhotosLayoutSpec;
  v13 = [(PXFeatureSpec *)&v78 initWithExtendedTraitCollection:v12 options:a4];
  if (!v13) {
    goto LABEL_69;
  }
  BOOL v76 = v7;
  v14 = +[PXPhotosGridSettings sharedInstance];
  v15 = v14;
  if (a5 == 2) {
    char v16 = [v14 enableBlurInContiguousCollections];
  }
  else {
    char v16 = 0;
  }
  v13->_BOOL wantsSectionsBlur = v16;
  v13->_preferredUserInterfaceStyle = 0;
  v17 = 0;
  if (([(PXFeatureSpec *)v13 options] & 2) == 0) {
    v17 = -[PXZoomablePhotosLayoutSpec initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:]([PXZoomablePhotosLayoutSpec alloc], "initWithExtendedTraitCollection:options:availableThumbnailSizes:gridStyle:itemAspectRatio:userDefaults:forceSaliency:preferredUserInterfaceStyle:additionalAspectFitEdgeMargins:overrideDefaultNumberOfColumns:", v12, a4, 0, a5, 0, 0, 1.0, *(double *)off_1E5DAAF10, *((double *)off_1E5DAAF10 + 1), *((double *)off_1E5DAAF10 + 2), *((double *)off_1E5DAAF10 + 3), v13->_preferredUserInterfaceStyle, 0);
  }
  v18 = [PXAssetsSectionLayoutSpec alloc];
  BOOL wantsSectionsBlur = v13->_wantsSectionsBlur;
  [(PXZoomablePhotosLayoutSpec *)v17 itemCornerRadius];
  v77 = v17;
  uint64_t v20 = -[PXAssetsSectionLayoutSpec initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:](v18, "initWithExtendedTraitCollection:options:variant:allowsBlur:itemCornerRadius:zoomableSpec:", v12, a4, 0, wantsSectionsBlur, v17);
  assetsSpec = v13->_assetsSpec;
  v13->_assetsSpec = (PXAssetsSectionLayoutSpec *)v20;

  BOOL v22 = [v12 userInterfaceIdiom] == 3;
  v13->_isTV = v22;
  v13->_allowsEmptyTitles = v22;
  v23 = [v12 headerCustomizationModel];
  v24 = v23;
  if (v23 && [v23 shouldUseTextStyles])
  {
    uint64_t v25 = [v24 titleTextStyle];
    uint64_t v26 = [v24 subtitleTextStyle];
  }
  else
  {
    if (v13->_isTV) {
      uint64_t v25 = 5;
    }
    else {
      uint64_t v25 = 3;
    }
    if (v13->_isTV) {
      uint64_t v26 = 9;
    }
    else {
      uint64_t v26 = 6;
    }
  }
  if ([v12 userInterfaceIdiom] == 1) {
    uint64_t v27 = [v15 searchActionLocationOnPhone];
  }
  else {
    uint64_t v27 = 1;
  }
  v13->_searchActionLocation = v27;
  [v12 layoutMargins];
  v13->_headerTitleLeadingSpacing = v28;
  double v29 = 20.0;
  if (!v13->_isTV) {
    double v29 = 10.0;
  }
  v13->_headerTitleButtonAlignmentSpacing = v29;
  [v15 headerTitleTopSpacing];
  v13->_headerTitleTopSpacing = v30;
  [v15 headerTitleBottomSpacing];
  v13->_headerTitleBottomSpacing = v31;
  uint64_t v32 = MEMORY[0x1AD10AAF0](v25, 32770, 0);
  headerTitleFont = v13->_headerTitleFont;
  v13->_headerTitleFont = (UIFont *)v32;

  uint64_t v34 = MEMORY[0x1AD10AAF0](v26, 32770, 0);
  headerSubtitleFont = v13->_headerSubtitleFont;
  v13->_headerSubtitleFont = (UIFont *)v34;

  uint64_t v36 = [(PXFeatureSpec *)v13 userInterfaceIdiom];
  double v37 = 44.0;
  if (v36 == 5) {
    double v37 = 92.0;
  }
  v13->_topChromeHeight = v37;
  uint64_t v38 = [v12 traitCollection];
  v39 = (void *)v38;
  if (v13->_isTV || !v38)
  {
    if ([v12 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    v40 = [MEMORY[0x1E4FB1618] blackColor];
    }
    headerTitleOverBackgroundColor = v13->_headerTitleOverBackgroundColor;
    v13->_headerTitleOverBackgroundColor = v40;
  }
  else
  {
    v40 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v41 = [(UIColor *)v40 resolvedColorWithTraitCollection:v39];
    headerTitleOverBackgroundColor = v13->_headerTitleOverBackgroundColor;
    v13->_headerTitleOverBackgroundColor = (UIColor *)v41;
  }

  uint64_t v43 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  headerTitleOverContentColor = v13->_headerTitleOverContentColor;
  v13->_headerTitleOverContentColor = (UIColor *)v43;

  v13->_wantsToggleSidebarButton = a6;
  double v45 = 60.0;
  double v46 = 0.0;
  if (!v76) {
    double v45 = 0.0;
  }
  v13->_topTrailingChromeWidth = v45;
  uint64_t v47 = [v39 horizontalSizeClass];
  double v48 = 10.0;
  if (v47 != 1)
  {
    int v49 = PLHasHomeButton();
    double v48 = 10.0;
    if (!v49) {
      double v48 = 0.0;
    }
  }
  v13->_aspectFitContentVerticalPadding = v48;
  double v50 = 168.0;
  if (!v13->_isTV) {
    double v50 = 0.0;
  }
  v13->_squareContentVerticalPadding = v50;
  double v51 = 30.0;
  if (a5 != 2) {
    double v51 = 10.0;
  }
  v13->_interSectionSpacing = v51;
  uint64_t v52 = [v12 layoutSizeClass];
  double v53 = 12.0;
  if (v52 == 1) {
    double v53 = 8.0;
  }
  v13->_interButtonSpacing = v53;
  v13->_interPageSpacing = 10.0;
  if (v36 != 5)
  {
    if ([(PXFeatureSpec *)v13 userInterfaceFeature] == 7) {
      goto LABEL_48;
    }
    [(PXFeatureSpec *)v13 curatedLibraryEdgeToEdgeContentDefaultPadding];
    double v55 = v54;
    [v12 layoutMargins];
    if (v55 - v56 >= 0.0) {
      double v57 = v55 - v56;
    }
    else {
      double v57 = 0.0;
    }
    [v12 displayScale];
    double v46 = v58 * v57;
  }
  v13->_endButtonSpacing = v46;
LABEL_48:
  v13->_backgroundGradientCornerRadius = 0.0;
  int v59 = [v15 enableTitleLegibilityDimmingFilter];
  v60 = @"PXHeaderGradient";
  if (v59) {
    v60 = @"PXHeaderGradient2";
  }
  v61 = v60;
  uint64_t v62 = [objc_alloc((Class)off_1E5DA6358) initWithImageName:v61];

  backgroundGradientImageConfiguration = v13->_backgroundGradientImageConfiguration;
  v13->_backgroundGradientImageConfiguration = (PXExtendedImageConfiguration *)v62;

  uint64_t v64 = [objc_alloc((Class)off_1E5DA6358) initWithImageName:@"PXHeaderGradientBehindContent"];
  behindContentBackgroundGradientImageConfiguration = v13->_behindContentBackgroundGradientImageConfiguration;
  v13->_behindContentBackgroundGradientImageConfiguration = (PXExtendedImageConfiguration *)v64;

  uint64_t v66 = 0;
  if (a5 == 2)
  {
    int v67 = [v15 enableScrollSnapInContiguousCollections];
    uint64_t v66 = 3;
    if (!v67) {
      uint64_t v66 = 0;
    }
  }
  v13->_scrollSnapBehavior = v66;
  [v15 scrollSnapMaximumDecelerationFactor];
  v13->_scrollSnapMaximumDecelerationFactor = v68;
  [v15 scrollSnapMaximumAccelerationFactor];
  v13->_scrollSnapMaximumAccelerationFactor = v69;
  v13->_wantsShowAllButtonsInSectionFooters = [v15 enableShowMoreButtonsInEditorialLens];
  uint64_t v70 = [v12 preferredBackgroundStyle];
  if (v70 == 2)
  {
    uint64_t v71 = [MEMORY[0x1E4FB1618] blackColor];
  }
  else if (v70 == 1)
  {
    uint64_t v71 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    if (v70) {
      goto LABEL_60;
    }
    uint64_t v71 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  contentBackgroundColor = v13->_contentBackgroundColor;
  v13->_contentBackgroundColor = (UIColor *)v71;

LABEL_60:
  double v73 = 0.0;
  if (!v13->_isTV && [(PXFeatureSpec *)v13 userInterfaceStyle] != 2)
  {
    v74 = +[PXLemonadeSettings sharedInstance];
    if ([v74 forceDarkDetailsView]) {
      double v73 = 0.0;
    }
    else {
      double v73 = 1.0;
    }
  }
  v13->_contentBackgroundOpacity = v73;
  if (a5 == 4)
  {
    [(PXFeatureSpec *)v13 layoutReferenceSize];
    PXSizeIsEmpty();
  }

LABEL_69:
  return v13;
}

@end