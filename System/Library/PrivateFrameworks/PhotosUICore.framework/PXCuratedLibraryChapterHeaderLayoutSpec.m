@interface PXCuratedLibraryChapterHeaderLayoutSpec
- (BOOL)shouldAbbreviateMonth;
- (BOOL)shouldAlwaysShowFloatingVersion;
- (BOOL)shouldFloat;
- (BOOL)wantsChevron;
- (CGSize)contentInset;
- (PXCuratedLibraryChapterHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXExtendedImageConfiguration)chevronImageConfiguration;
- (UIColor)floatingTitleDeemphasizedColor;
- (UIColor)floatingTitleEmphasizedColor;
- (UIColor)titleDeemphasizedColor;
- (UIColor)titleEmphasizedColor;
- (UIFont)titleFont;
- (double)floatingAppearanceCrossfadeDistance;
- (double)floatingAppearanceCrossfadeDuration;
- (double)floatingAppearanceCrossfadeStartDistance;
- (double)floatingDistanceFromSafeAreaTop;
- (double)floatingFadeOutDistance;
- (double)spacingBetweenTitleAndChevron;
- (double)spacingBetweenTitleBottomAndNextCardTop;
- (double)spacingBetweenTitleTopAndPreviousCardBottom;
- (double)titleHeight;
@end

@implementation PXCuratedLibraryChapterHeaderLayoutSpec

- (double)titleHeight
{
  return self->_titleHeight;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PXCuratedLibraryChapterHeaderLayoutSpec;
  v7 = [(PXFeatureSpec *)&v56 initWithExtendedTraitCollection:v6 options:a4];
  if (!v7) {
    goto LABEL_48;
  }
  v8 = +[PXCuratedLibrarySettings sharedInstance];
  if ([(PXFeatureSpec *)v7 sizeClass] == 1)
  {
    uint64_t v9 = [(PXFeatureSpec *)v7 layoutOrientation];
    uint64_t v10 = [v6 curatedLibraryLayoutStyle];
    BOOL v11 = v10 != 1;
    uint64_t v12 = 2;
    if (v10 == 1) {
      uint64_t v12 = 3;
    }
    BOOL v55 = v9 == 2;
    if (v9 == 2) {
      uint64_t v13 = 4;
    }
    else {
      uint64_t v13 = v12;
    }
  }
  else
  {
    uint64_t v14 = [v6 curatedLibraryLayoutStyle];
    BOOL v55 = 0;
    BOOL v11 = v14 != 1;
    if (v14 == 1) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }
  }
  if ((unint64_t)([(PXFeatureSpec *)v7 contentSizeCategory] - 8) >= 5) {
    uint64_t v15 = 5;
  }
  else {
    uint64_t v15 = 7;
  }
  uint64_t v16 = MEMORY[0x1AD10AAF0](v13, 32770, v15);
  titleFont = v7->_titleFont;
  v7->_titleFont = (UIFont *)v16;

  uint64_t v57 = *MEMORY[0x1E4FB06F8];
  v58[0] = v7->_titleFont;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:&v57 count:1];
  objc_msgSend(@"Hg", "boundingRectWithSize:options:attributes:context:", 0, v18, 0, 1.79769313e308, 1.79769313e308);
  v7->_double titleHeight = CGRectGetHeight(v59);

  uint64_t v19 = [MEMORY[0x1E4FB1618] whiteColor];
  floatingTitleEmphasizedColor = v7->_floatingTitleEmphasizedColor;
  v7->_floatingTitleEmphasizedColor = (UIColor *)v19;

  if (v11)
  {
    v21 = (void *)MEMORY[0x1E4FB1618];
    [v8 monthsFloatingHeadersSubtitleAlpha];
    v23 = [v21 colorWithWhite:1.0 alpha:v22];
  }
  else
  {
    v23 = v7->_floatingTitleEmphasizedColor;
  }
  objc_storeStrong((id *)&v7->_floatingTitleDeemphasizedColor, v23);
  if (v11) {

  }
  if ([v6 userInterfaceStyle] == 2)
  {
    objc_storeStrong((id *)&v7->_titleEmphasizedColor, v7->_floatingTitleEmphasizedColor);
    if (v11) {
      p_floatingTitleDeemphasizedColor = (id *)&v7->_floatingTitleDeemphasizedColor;
    }
    else {
      p_floatingTitleDeemphasizedColor = (id *)&v7->_titleEmphasizedColor;
    }
    v25 = (UIColor *)*p_floatingTitleDeemphasizedColor;
    titleDeemphasizedColor = v7->_titleDeemphasizedColor;
    v7->_titleDeemphasizedColor = v25;
  }
  else
  {
    uint64_t v27 = [MEMORY[0x1E4FB1618] blackColor];
    titleEmphasizedColor = v7->_titleEmphasizedColor;
    v7->_titleEmphasizedColor = (UIColor *)v27;

    if (v11)
    {
      titleDeemphasizedColor = [MEMORY[0x1E4FB1618] colorWithWhite:0.55 alpha:1.0];
    }
    else
    {
      titleDeemphasizedColor = v7->_titleEmphasizedColor;
    }
    objc_storeStrong((id *)&v7->_titleDeemphasizedColor, titleDeemphasizedColor);
    if (!v11) {
      goto LABEL_29;
    }
  }

LABEL_29:
  v29 = (void *)MEMORY[0x1E4FB1830];
  [(UIFont *)v7->_titleFont pointSize];
  v30 = objc_msgSend(v29, "configurationWithPointSize:weight:scale:", 7, 1);
  id v31 = objc_alloc((Class)off_1E5DA6358);
  v32 = PXLocalizedStringFromTable(@"PXLeadingChevronAXLabel", @"PhotosUICore");
  v33 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  uint64_t v34 = [v31 initWithImageName:@"chevron.forward" isSystemImage:1 accessibilityLabel:v32 tintColor:v33 imageConfiguration:v30 inBundle:0];
  chevronImageConfiguration = v7->_chevronImageConfiguration;
  v7->_chevronImageConfiguration = (PXExtendedImageConfiguration *)v34;

  v7->_wantsChevron = v11;
  if (v55)
  {
    v7->_contentInset.width = 14.0;
    v7->_contentInset.height = v7->_contentInset.height + -2.0;
    v7->_spacingBetweenTitleAndChevron = 2.0;
    v7->_spacingBetweenTitleTopAndPreviousCardBottom = 20.0;
    double v36 = 0.0;
  }
  else
  {
    double v37 = 0.0;
    if (v11) {
      double v37 = 2.0;
    }
    v7->_contentInset.width = v37;
    v7->_spacingBetweenTitleAndChevron = 8.0;
    v7->_spacingBetweenTitleTopAndPreviousCardBottom = 32.0;
    double v36 = 10.0;
    if (v11) {
      double v36 = 14.0;
    }
  }
  v7->_spacingBetweenTitleBottomAndNextCardTop = v36;
  v7->_shouldFloat = objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, -[PXFeatureSpec sizeClass](v7, "sizeClass", 360), -[PXFeatureSpec layoutOrientation](v7, "layoutOrientation"), objc_msgSend(v6, "curatedLibraryLayoutStyle")) ^ 1;
  v7->_shouldAlwaysShowFloatingVersion = 0;
  if ([v6 userInterfaceIdiom] == 5)
  {
    double v38 = 24.0;
    double v39 = 20.0;
    if (!v11) {
      double v39 = 24.0;
    }
    v7->_spacingBetweenTitleTopAndPreviousCardBottom = v39;
    if (v11) {
      double v38 = 2.0;
    }
    v7->_spacingBetweenTitleBottomAndNextCardTop = v38;
    v7->_shouldFloat = v11;
    v7->_shouldAlwaysShowFloatingVersion = 1;
  }
  if (v55 || !v11) {
    char v40 = [v8 allowsCustomDateTitles];
  }
  else {
    char v40 = 0;
  }
  v7->_shouldAbbreviateMonth = v40;
  [v8 monthsFloatingHeadersDistanceFromSafeAreaTop];
  v7->_floatingDistanceFromSafeAreaTop = v41;
  double titleHeight = v7->_titleHeight;
  [v8 monthsFloatingHeadersAppearanceCrossfadeStartDistance];
  v7->_floatingAppearanceCrossfadeStartDistance = titleHeight * v43;
  double v44 = v7->_titleHeight;
  [v8 monthsFloatingHeadersAppearanceCrossfadeDistance];
  v7->_floatingAppearanceCrossfadeDistance = v44 * v45;
  [v8 floatingHeadersAppearanceCrossfadeDuration];
  v7->_floatingAppearanceCrossfadeDuration = v46;
  double v47 = v7->_titleHeight;
  [v8 monthsFloatingHeadersFadeoutDistance];
  v7->_floatingFadeOutDistance = v47 * v48;
  if ((a4 & 0x800) == 0 && v7->_shouldFloat)
  {
    v49 = [[PXMonthsAssetsSectionHeaderLayoutSpec alloc] initWithExtendedTraitCollection:v6 options:a4];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v49 contentPadding];
    double v51 = v50;
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v49 titlePadding];
    *(double *)((char *)&v7->super.super.isa + v54) = v51 + v52;
  }
LABEL_48:

  return v7;
}

- (double)spacingBetweenTitleBottomAndNextCardTop
{
  return self->_spacingBetweenTitleBottomAndNextCardTop;
}

- (BOOL)shouldFloat
{
  return self->_shouldFloat;
}

- (double)floatingDistanceFromSafeAreaTop
{
  return self->_floatingDistanceFromSafeAreaTop;
}

- (double)spacingBetweenTitleTopAndPreviousCardBottom
{
  return self->_spacingBetweenTitleTopAndPreviousCardBottom;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageConfiguration, 0);
  objc_storeStrong((id *)&self->_floatingTitleDeemphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleDeemphasizedColor, 0);
  objc_storeStrong((id *)&self->_floatingTitleEmphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

- (BOOL)shouldAlwaysShowFloatingVersion
{
  return self->_shouldAlwaysShowFloatingVersion;
}

- (double)floatingFadeOutDistance
{
  return self->_floatingFadeOutDistance;
}

- (double)floatingAppearanceCrossfadeDuration
{
  return self->_floatingAppearanceCrossfadeDuration;
}

- (double)floatingAppearanceCrossfadeDistance
{
  return self->_floatingAppearanceCrossfadeDistance;
}

- (double)floatingAppearanceCrossfadeStartDistance
{
  return self->_floatingAppearanceCrossfadeStartDistance;
}

- (BOOL)shouldAbbreviateMonth
{
  return self->_shouldAbbreviateMonth;
}

- (double)spacingBetweenTitleAndChevron
{
  return self->_spacingBetweenTitleAndChevron;
}

- (BOOL)wantsChevron
{
  return self->_wantsChevron;
}

- (PXExtendedImageConfiguration)chevronImageConfiguration
{
  return self->_chevronImageConfiguration;
}

- (UIColor)floatingTitleDeemphasizedColor
{
  return self->_floatingTitleDeemphasizedColor;
}

- (UIColor)titleDeemphasizedColor
{
  return self->_titleDeemphasizedColor;
}

- (UIColor)floatingTitleEmphasizedColor
{
  return self->_floatingTitleEmphasizedColor;
}

- (UIColor)titleEmphasizedColor
{
  return self->_titleEmphasizedColor;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (CGSize)contentInset
{
  double width = self->_contentInset.width;
  double height = self->_contentInset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

@end