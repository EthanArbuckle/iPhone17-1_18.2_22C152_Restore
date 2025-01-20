@interface PXStoryConcreteLayoutSpec
- (BOOL)canScaleWhenPressed;
- (BOOL)styleSwitcherShowsRestartButton;
- (BOOL)styleSwitcherShowsTitle;
- (BOOL)styleSwitcherWantsChromeButtonsTitleCenterAligned;
- (BOOL)thumbnailChromeShowsActionMenuButton;
- (BOOL)thumbnailChromeShowsFavoriteButton;
- (BOOL)thumbnailChromeShowsPlayButton;
- (BOOL)thumbnailMenuIncludesFavoriteAction;
- (BOOL)thumbnailMenuIncludesFeatureLessAction;
- (CGSize)bufferingIndicatorSize;
- (CGSize)scrubberCurrentAssetSize;
- (CGSize)thumbnailChromeDetailsViewButtonPadding;
- (CGSize)thumbnailChromePadding;
- (CGSize)thumbnailPlayButtonPadding;
- (NSDictionary)styleSwitcherTitleAttributes;
- (NSShadow)thumbnailShadow;
- (PXExploreLayoutMetrics)browserGridLayoutMetrics;
- (PXStoryChromeButtonSpec)styleSwitcherChromeButtonSpec;
- (PXStoryChromeButtonSpec)thumbnailChromeButtonSpec;
- (PXStoryChromeButtonSpec)thumbnailChromePlayButtonSpec;
- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5;
- (PXStoryDetailsViewButtonSpec)thumbnailChromeDetailsViewButtonSpec;
- (UIColor)backgroundColor;
- (UIEdgeInsets)styleSwitcherChromeInset;
- (UIEdgeInsets)styleSwitcherPageControlInset;
- (UIEdgeInsets)styleSwitcherViewportInset;
- (double)bottomTitleContentOffset;
- (double)browserGridCellCornersRadius;
- (double)distanceBetweenBufferingIndicatorCenterAndBottom;
- (double)distanceBetweenChapterTitleBaselineAndBottomWithChrome;
- (double)distanceBetweenChapterTitleBaselineAndBottomWithoutChrome;
- (double)interpageSpacing;
- (double)scrubberVerticalPadding;
- (double)styleSwitcherChromeButtonHorizontalMargin;
- (double)styleSwitcherPageControlHeight;
- (double)styleSwitcherViewportSpacing;
- (double)thumbnailChromeButtonSpacing;
- (double)thumbnailCornerRadius;
- (int64_t)browserGridScrollDecelerationRate;
- (int64_t)scrollDecelerationRate;
- (int64_t)styleSwitcherLayoutDirection;
@end

@implementation PXStoryConcreteLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSwitcherTitleAttributes, 0);
  objc_storeStrong((id *)&self->_styleSwitcherChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeDetailsViewButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromePlayButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailShadow, 0);
  objc_storeStrong((id *)&self->_browserGridLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (double)distanceBetweenChapterTitleBaselineAndBottomWithChrome
{
  return self->_distanceBetweenChapterTitleBaselineAndBottomWithChrome;
}

- (double)distanceBetweenChapterTitleBaselineAndBottomWithoutChrome
{
  return self->_distanceBetweenChapterTitleBaselineAndBottomWithoutChrome;
}

- (double)distanceBetweenBufferingIndicatorCenterAndBottom
{
  return self->_distanceBetweenBufferingIndicatorCenterAndBottom;
}

- (CGSize)bufferingIndicatorSize
{
  double width = self->_bufferingIndicatorSize.width;
  double height = self->_bufferingIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scrubberVerticalPadding
{
  return self->_scrubberVerticalPadding;
}

- (CGSize)scrubberCurrentAssetSize
{
  double width = self->_scrubberCurrentAssetSize.width;
  double height = self->_scrubberCurrentAssetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)styleSwitcherLayoutDirection
{
  return self->_styleSwitcherLayoutDirection;
}

- (UIEdgeInsets)styleSwitcherPageControlInset
{
  double top = self->_styleSwitcherPageControlInset.top;
  double left = self->_styleSwitcherPageControlInset.left;
  double bottom = self->_styleSwitcherPageControlInset.bottom;
  double right = self->_styleSwitcherPageControlInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)styleSwitcherPageControlHeight
{
  return self->_styleSwitcherPageControlHeight;
}

- (BOOL)styleSwitcherShowsTitle
{
  return self->_styleSwitcherShowsTitle;
}

- (NSDictionary)styleSwitcherTitleAttributes
{
  return self->_styleSwitcherTitleAttributes;
}

- (double)styleSwitcherViewportSpacing
{
  return self->_styleSwitcherViewportSpacing;
}

- (UIEdgeInsets)styleSwitcherViewportInset
{
  double top = self->_styleSwitcherViewportInset.top;
  double left = self->_styleSwitcherViewportInset.left;
  double bottom = self->_styleSwitcherViewportInset.bottom;
  double right = self->_styleSwitcherViewportInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)styleSwitcherChromeInset
{
  double top = self->_styleSwitcherChromeInset.top;
  double left = self->_styleSwitcherChromeInset.left;
  double bottom = self->_styleSwitcherChromeInset.bottom;
  double right = self->_styleSwitcherChromeInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (PXStoryChromeButtonSpec)styleSwitcherChromeButtonSpec
{
  return self->_styleSwitcherChromeButtonSpec;
}

- (double)styleSwitcherChromeButtonHorizontalMargin
{
  return self->_styleSwitcherChromeButtonHorizontalMargin;
}

- (BOOL)styleSwitcherWantsChromeButtonsTitleCenterAligned
{
  return self->_styleSwitcherWantsChromeButtonsTitleCenterAligned;
}

- (BOOL)styleSwitcherShowsRestartButton
{
  return self->_styleSwitcherShowsRestartButton;
}

- (BOOL)canScaleWhenPressed
{
  return self->_canScaleWhenPressed;
}

- (BOOL)thumbnailMenuIncludesFeatureLessAction
{
  return self->_thumbnailMenuIncludesFeatureLessAction;
}

- (BOOL)thumbnailMenuIncludesFavoriteAction
{
  return self->_thumbnailMenuIncludesFavoriteAction;
}

- (BOOL)thumbnailChromeShowsFavoriteButton
{
  return self->_thumbnailChromeShowsFavoriteButton;
}

- (BOOL)thumbnailChromeShowsActionMenuButton
{
  return self->_thumbnailChromeShowsActionMenuButton;
}

- (CGSize)thumbnailChromeDetailsViewButtonPadding
{
  double width = self->_thumbnailChromeDetailsViewButtonPadding.width;
  double height = self->_thumbnailChromeDetailsViewButtonPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXStoryDetailsViewButtonSpec)thumbnailChromeDetailsViewButtonSpec
{
  return self->_thumbnailChromeDetailsViewButtonSpec;
}

- (CGSize)thumbnailPlayButtonPadding
{
  double width = self->_thumbnailPlayButtonPadding.width;
  double height = self->_thumbnailPlayButtonPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)thumbnailChromeShowsPlayButton
{
  return self->_thumbnailChromeShowsPlayButton;
}

- (PXStoryChromeButtonSpec)thumbnailChromePlayButtonSpec
{
  return self->_thumbnailChromePlayButtonSpec;
}

- (PXStoryChromeButtonSpec)thumbnailChromeButtonSpec
{
  return self->_thumbnailChromeButtonSpec;
}

- (double)thumbnailChromeButtonSpacing
{
  return self->_thumbnailChromeButtonSpacing;
}

- (CGSize)thumbnailChromePadding
{
  double width = self->_thumbnailChromePadding.width;
  double height = self->_thumbnailChromePadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSShadow)thumbnailShadow
{
  return self->_thumbnailShadow;
}

- (double)thumbnailCornerRadius
{
  return self->_thumbnailCornerRadius;
}

- (double)browserGridCellCornersRadius
{
  return self->_browserGridCellCornersRadius;
}

- (PXExploreLayoutMetrics)browserGridLayoutMetrics
{
  return self->_browserGridLayoutMetrics;
}

- (int64_t)browserGridScrollDecelerationRate
{
  return self->_browserGridScrollDecelerationRate;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXStoryConcreteLayoutSpec *)self initWithExtendedTraitCollection:a3 options:a4 storyConfigurationOptions:0];
}

- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5
{
  __int16 v5 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v52.receiver = self;
  v52.super_class = (Class)PXStoryConcreteLayoutSpec;
  id v9 = [(PXFeatureSpec *)&v52 initWithExtendedTraitCollection:v8 options:a4];
  if (v9)
  {
    [v8 layoutOrientation];
    uint64_t v10 = [v8 layoutOrientation];
    [v8 contentSizeCategory];
    [v8 userInterfaceIdiom];
    uint64_t v11 = [v8 userInterfaceIdiom];
    uint64_t v12 = [v8 layoutSizeClass];
    [v8 userInterfaceIdiom];
    v50 = [v8 storyChromeLayoutSpec];
    [v50 minimumMargins];
    v51 = +[PXStorySettings sharedInstance];
    if ((v5 & 0x2081) == 0)
    {
      *((void *)v9 + 32) = 0x4034000000000000;
      *((void *)v9 + 33) = 1;
      *((void *)v9 + 34) = 0;
      v13 = [[PXExploreLayoutMetrics alloc] initWithExtendedTraitCollection:v8];
      v14 = (void *)*((void *)v9 + 35);
      *((void *)v9 + 35) = v13;

      [*((id *)v9 + 35) setInteritemSpacing:10.0];
      [*((id *)v9 + 35) setAllowHeaders:0];
      [*((id *)v9 + 35) setBuildingBlockAspectRatio:0.666666667];
      [v8 safeAreaInsets];
      objc_msgSend(*((id *)v9 + 35), "setSafeAreaInsets:");
      *((void *)v9 + 36) = 0x4024000000000000;
      *((unsigned char *)v9 + 237) = 1;
      v15 = [[PXStoryChromeButtonSpec alloc] initWithExtendedTraitCollection:v8];
      v16 = (void *)*((void *)v9 + 40);
      *((void *)v9 + 40) = v15;

      v17 = [(PXStoryChromeButtonSpec *)[PXStoryDetailsViewButtonSpec alloc] initWithExtendedTraitCollection:v8];
      v18 = (void *)*((void *)v9 + 42);
      *((void *)v9 + 42) = v17;

      *((_OWORD *)v9 + 29) = xmmword_1AB359B00;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = v8;
        *((unsigned char *)v9 + 232) = [v19 isFullscreen];
        if ([v19 isFullscreen])
        {
          *((unsigned char *)v9 + 237) = 0;
          v20 = [(PXStoryChromeButtonSpec *)[PXStoryMemoryFeedPlayButtonSpec alloc] initWithExtendedTraitCollection:v19];
          v21 = (void *)*((void *)v9 + 41);
          *((void *)v9 + 41) = v20;

          *((_OWORD *)v9 + 28) = xmmword_1AB30E780;
          [v19 bottomTitleContentOffset];
          double v23 = v22 + *((double *)v9 + 57) * 2.0;
          [*((id *)v9 + 40) defaultImageSize];
          *((double *)v9 + 53) = v23 + v24;
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v25 = v8;
        [v25 viewportCornerRadius];
        *((void *)v9 + 37) = v26;
        uint64_t v27 = [v25 viewportShadow];

        v28 = (void *)*((void *)v9 + 38);
        *((void *)v9 + 38) = v27;
      }
      else
      {
        *((void *)v9 + 37) = 0x402E000000000000;
      }
      BOOL v29 = v11 != 4;
      __asm { FMOV            V0.2D, #12.0 }
      *((_OWORD *)v9 + 27) = _Q0;
      *((void *)v9 + 39) = 0x4028000000000000;
      __asm { FMOV            V1.2D, #-10.0 }
      *((float64x2_t *)v9 + 27) = vaddq_f64(*((float64x2_t *)v9 + 27), _Q1);
      *((double *)v9 + 39) = *((double *)v9 + 39) + -21.0;
      if (_ZF) {
        char v36 = 0;
      }
      else {
        char v36 = 1;
      }
      if (_ZF) {
        BOOL v29 = 0;
      }
      *((unsigned char *)v9 + 233) = v29;
      *((unsigned char *)v9 + 234) = [v51 wantsFullscreenFeedExperience] ^ 1;
      *((unsigned char *)v9 + 236) = v36;
      BOOL v37 = v11 == 4 || *((unsigned char *)v9 + 234) == 0;
      *((unsigned char *)v9 + 235) = v37;
      v38 = [[PXStoryChromeButtonSpec alloc] initWithExtendedTraitCollection:v8];
      v39 = (void *)*((void *)v9 + 44);
      *((void *)v9 + 44) = v38;

      PXFontWithTextStyleAndWeight();
    }
    if (v12 == 1) {
      double v40 = dbl_1AB359B10[v10 == 1];
    }
    else {
      double v40 = 0.14;
    }
    [v8 layoutReferenceSize];
    double v42 = round(v40 * v41);
    *((double *)v9 + 51) = v42;
    if ((v5 & 0x81) == 0) {
      double v42 = *((double *)v9 + 49) + *((double *)v9 + 61) + 20.0;
    }
    *((double *)v9 + 52) = v42;
    if ((v5 & 0x10) != 0
      && ([v8 traitCollection], v43 = objc_claimAutoreleasedReturnValue(), v43, v43))
    {
      v44 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      v45 = [v8 traitCollection];
      uint64_t v46 = [v44 resolvedColorWithTraitCollection:v45];
      v47 = (void *)*((void *)v9 + 31);
      *((void *)v9 + 31) = v46;
    }
    else
    {
      if ((v5 & 0x4000) != 0) {
        objc_msgSend(MEMORY[0x1E4FB1618], "px_placeholderBackgroundColor");
      }
      else {
      uint64_t v48 = [MEMORY[0x1E4FB1618] blackColor];
      }
      v44 = (void *)*((void *)v9 + 31);
      *((void *)v9 + 31) = v48;
    }
  }
  return (PXStoryConcreteLayoutSpec *)v9;
}

@end