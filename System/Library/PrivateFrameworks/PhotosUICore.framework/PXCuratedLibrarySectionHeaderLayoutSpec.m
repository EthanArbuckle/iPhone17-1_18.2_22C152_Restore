@interface PXCuratedLibrarySectionHeaderLayoutSpec
- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius;
- (BOOL)canShowAspectFitButtons;
- (BOOL)canShowCancelButton;
- (BOOL)canShowEllipsisButton;
- (BOOL)canShowSelectButton;
- (BOOL)canShowZoomButtons;
- (BOOL)ellipsisButtonSpecialTreatment;
- (BOOL)gradientRespectsSafeArea;
- (BOOL)isFloating;
- (BOOL)requiresTitleRenderedAsView;
- (BOOL)shouldAccommodateLeadingButtonsLayout;
- (BOOL)shouldAvoidOverlapWithSecondaryToolbar;
- (BOOL)shouldButtonsFadeOutWhenReachingTop;
- (BOOL)shouldOmitYear;
- (BOOL)shouldTextFadeOutWhenReachingTop;
- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4;
- (BOOL)swapTitleWithSubtitle;
- (BOOL)wantsInlineHeader;
- (BOOL)wantsSubtitle;
- (BOOL)wantsTitle;
- (NSDateFormatter)subtitleDateFormatter;
- (NSDateFormatter)titleDateFormatter;
- (PXCuratedLibrarySectionHeaderLayoutSpec)firstCardVariantSpec;
- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5;
- (PXCuratedLibrarySectionHeaderLayoutSpec)smallVariantSpec;
- (PXCuratedLibraryStyleGuide)styleGuide;
- (PXExtendedImageConfiguration)headerGradientImageConfiguration;
- (PXTitleSubtitleLabelSpec)debugInterestingTitleSubtitleLabelSpec;
- (PXTitleSubtitleLabelSpec)debugNonInterestingTitleSubtitleLabelSpec;
- (PXTitleSubtitleLabelSpec)titleSubtitleLabelSpec;
- (UIColor)titleSubtitleColorOverBackground;
- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3;
- (UIEdgeInsets)contentPadding;
- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding;
- (UIEdgeInsets)padding;
- (UIEdgeInsets)titlePadding;
- (double)buttonHeight;
- (double)buttonHorizontalPadding;
- (double)buttonSpacing;
- (double)buttonsFadeOutMinimumAlpha;
- (double)fadeOutDistance;
- (double)fadeOutDistanceFromSafeAreaTop;
- (double)gradientAlpha;
- (double)gradientHeight;
- (double)maximumTitleSubtitleHeight;
- (double)minimumSpacingBetweenTopSafeAreaAndContentTop;
- (double)minimumSpacingBetweenTopSafeAreaAndTitleTop;
- (double)textFadeOutMinimumAlpha;
- (int64_t)variant;
- (unint64_t)inlineHeaderStyle;
- (void)setButtonHeight:(double)a3;
- (void)setButtonHorizontalPadding:(double)a3;
- (void)setButtonSpacing:(double)a3;
- (void)setButtonsFadeOutMinimumAlpha:(double)a3;
- (void)setCanShowAspectFitButtons:(BOOL)a3;
- (void)setCanShowCancelButton:(BOOL)a3;
- (void)setCanShowEllipsisButton:(BOOL)a3;
- (void)setCanShowSelectButton:(BOOL)a3;
- (void)setCanShowZoomButtons:(BOOL)a3;
- (void)setContentPadding:(UIEdgeInsets)a3;
- (void)setCornerRadius:(id)a3;
- (void)setDebugInterestingTitleSubtitleLabelSpec:(id)a3;
- (void)setDebugNonInterestingTitleSubtitleLabelSpec:(id)a3;
- (void)setEllipsisButtonSpecialTreatment:(BOOL)a3;
- (void)setFadeOutDistance:(double)a3;
- (void)setFadeOutDistanceFromSafeAreaTop:(double)a3;
- (void)setFirstCardVariantSpec:(id)a3;
- (void)setGradientAlpha:(double)a3;
- (void)setGradientHeight:(double)a3;
- (void)setGradientRespectsSafeArea:(BOOL)a3;
- (void)setInlineHeaderStyle:(unint64_t)a3;
- (void)setIsFloating:(BOOL)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setRequiresTitleRenderedAsView:(BOOL)a3;
- (void)setShouldAccommodateLeadingButtonsLayout:(BOOL)a3;
- (void)setShouldAvoidOverlapWithSecondaryToolbar:(BOOL)a3;
- (void)setShouldButtonsFadeOutWhenReachingTop:(BOOL)a3;
- (void)setShouldOmitYear:(BOOL)a3;
- (void)setShouldTextFadeOutWhenReachingTop:(BOOL)a3;
- (void)setSmallVariantSpec:(id)a3;
- (void)setSubtitleDateFormatter:(id)a3;
- (void)setSwapTitleWithSubtitle:(BOOL)a3;
- (void)setTextFadeOutMinimumAlpha:(double)a3;
- (void)setTitleDateFormatter:(id)a3;
- (void)setTitlePadding:(UIEdgeInsets)a3;
- (void)setTitleSubtitleLabelSpec:(id)a3;
- (void)setVariant:(int64_t)a3;
- (void)setWantsInlineHeader:(BOOL)a3;
- (void)setWantsSubtitle:(BOOL)a3;
- (void)setWantsTitle:(BOOL)a3;
@end

@implementation PXCuratedLibrarySectionHeaderLayoutSpec

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTitleSubtitleLabelSpec:(id)a3
{
}

- (void)setWantsTitle:(BOOL)a3
{
  self->_wantsTitle = a3;
}

- (void)setWantsSubtitle:(BOOL)a3
{
  self->_wantsSubtitle = a3;
}

- (void)setGradientAlpha:(double)a3
{
  self->_gradientAlpha = a3;
}

- (void)setEllipsisButtonSpecialTreatment:(BOOL)a3
{
  self->_ellipsisButtonSpecialTreatment = a3;
}

- (void)setContentPadding:(UIEdgeInsets)a3
{
  self->_contentPadding = a3;
}

- (PXTitleSubtitleLabelSpec)debugNonInterestingTitleSubtitleLabelSpec
{
  return self->_debugNonInterestingTitleSubtitleLabelSpec;
}

- (PXTitleSubtitleLabelSpec)debugInterestingTitleSubtitleLabelSpec
{
  return self->_debugInterestingTitleSubtitleLabelSpec;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setGradientRespectsSafeArea:(BOOL)a3
{
  self->_gradientRespectsSafeArea = a3;
}

- (void)setDebugNonInterestingTitleSubtitleLabelSpec:(id)a3
{
}

- (void)setDebugInterestingTitleSubtitleLabelSpec:(id)a3
{
}

- (void)setCornerRadius:(id)a3
{
  self->_cornerRadius.var0.var0.topLeft = v3;
  self->_cornerRadius.var0.var0.topRight = v4;
  self->_cornerRadius.var0.var0.bottomLeft = v5;
  self->_cornerRadius.var0.var0.bottomRight = v6;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PXCuratedLibrarySectionHeaderLayoutSpec;
  v9 = [(PXFeatureSpec *)&v25 initWithExtendedTraitCollection:v8 options:a4];
  v10 = v9;
  if (v9)
  {
    v9->_variant = a5;
    uint64_t v11 = [v8 contentSizeCategory];
    double v12 = 34.0;
    if ((unint64_t)(v11 - 8) >= 5) {
      double v12 = 28.0;
    }
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v10 setButtonHeight:v12];
    uint64_t v13 = [v8 layoutSizeClass];
    if (v13 == 1) {
      double v14 = 8.0;
    }
    else {
      double v14 = 12.0;
    }
    if (v13 == 1) {
      double v15 = 12.0;
    }
    else {
      double v15 = 16.0;
    }
    if (v13 == 1) {
      double v16 = 8.0;
    }
    else {
      double v16 = 11.0;
    }
    if (v13 == 1) {
      double v17 = 9.0;
    }
    else {
      double v17 = 12.0;
    }
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v10 setButtonSpacing:v14];
    [(PXCuratedLibrarySectionHeaderLayoutSpec *)v10 setButtonHorizontalPadding:v15];
    v10->_minimumSpacingBetweenTopSafeAreaAndContentTop = v16;
    v10->_minimumSpacingBetweenTopSafeAreaAndTitleTop = v17;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitlePadding:](v10, "setTitlePadding:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    v18 = [[PXCuratedLibraryStyleGuide alloc] initWithExtendedTraitCollection:v8];
    styleGuide = v10->_styleGuide;
    v10->_styleGuide = v18;

    uint64_t v20 = [objc_alloc((Class)off_1E5DA6358) initWithImageName:@"PXHeaderGradient"];
    headerGradientImageConfiguration = v10->_headerGradientImageConfiguration;
    v10->_headerGradientImageConfiguration = (PXExtendedImageConfiguration *)v20;

    v10->_canShowCancelButton = 1;
    v10->_canShowSelectButton = 1;
    v10->_canShowEllipsisButton = 1;
    uint64_t v22 = [MEMORY[0x1E4FB1618] blackColor];
    titleSubtitleColorOverBackground = v10->_titleSubtitleColorOverBackground;
    v10->_titleSubtitleColorOverBackground = (UIColor *)v22;
  }
  return v10;
}

- (void)setTitlePadding:(UIEdgeInsets)a3
{
  self->_titlePadding = a3;
}

- (void)setButtonSpacing:(double)a3
{
  self->_buttonSpacing = a3;
}

- (void)setButtonHorizontalPadding:(double)a3
{
  self->_buttonHorizontalPadding = a3;
}

- (void)setButtonHeight:(double)a3
{
  self->_buttonHeight = a3;
}

- (void)setTextFadeOutMinimumAlpha:(double)a3
{
  self->_textFadeOutMinimumAlpha = a3;
}

- (void)setShouldTextFadeOutWhenReachingTop:(BOOL)a3
{
  self->_shouldTextFadeOutWhenReachingTop = a3;
}

- (void)setFadeOutDistanceFromSafeAreaTop:(double)a3
{
  self->_fadeOutDistanceFromSafeAreaTop = a3;
}

- (void)setFadeOutDistance:(double)a3
{
  self->_fadeOutDistance = a3;
}

- (UIEdgeInsets)curatedLibraryEdgeToEdgeContentDefaultPadding
{
  v7.receiver = self;
  v7.super_class = (Class)PXCuratedLibrarySectionHeaderLayoutSpec;
  [(PXFeatureSpec *)&v7 curatedLibraryEdgeToEdgeContentDefaultPadding];
  -[PXCuratedLibrarySectionHeaderLayoutSpec adjustedContentPadding:](self, "adjustedContentPadding:");
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)setTitleDateFormatter:(id)a3
{
}

- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  CGFloat bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  if ([(PXCuratedLibrarySectionHeaderLayoutSpec *)self ellipsisButtonSpecialTreatment]
    && [(PXCuratedLibrarySectionHeaderLayoutSpec *)self isFloating]
    && [(PXFeatureSpec *)self sizeClass] == 1
    && [(PXFeatureSpec *)self layoutOrientation] == 2)
  {
    [(PXFeatureSpec *)self safeAreaInsets];
    double top = top + v8;
  }
  double v9 = top;
  double v10 = left;
  double v11 = bottom;
  double v12 = right;
  result.CGFloat right = v12;
  result.CGFloat bottom = v11;
  result.CGFloat left = v10;
  result.double top = v9;
  return result;
}

- (BOOL)ellipsisButtonSpecialTreatment
{
  return self->_ellipsisButtonSpecialTreatment;
}

- (void)setSwapTitleWithSubtitle:(BOOL)a3
{
  self->_swapTitleWithSubtitle = a3;
}

- (void)setShouldOmitYear:(BOOL)a3
{
  self->_shouldOmitYear = a3;
}

- (void)setShouldButtonsFadeOutWhenReachingTop:(BOOL)a3
{
  self->_shouldButtonsFadeOutWhenReachingTop = a3;
}

- (void)setCanShowEllipsisButton:(BOOL)a3
{
  self->_canShowEllipsisButton = a3;
}

- (double)fadeOutDistance
{
  return self->_fadeOutDistance;
}

- (PXTitleSubtitleLabelSpec)titleSubtitleLabelSpec
{
  return self->_titleSubtitleLabelSpec;
}

- (void)setGradientHeight:(double)a3
{
  self->_gradientHeight = a3;
}

- (void)setFirstCardVariantSpec:(id)a3
{
}

- (double)maximumTitleSubtitleHeight
{
  v2 = [(PXCuratedLibrarySectionHeaderLayoutSpec *)self titleSubtitleLabelSpec];
  [v2 maximumTitleSubtitleHeight];
  double v4 = v3;

  return v4;
}

- (void)setSubtitleDateFormatter:(id)a3
{
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void)setCanShowZoomButtons:(BOOL)a3
{
  self->_canShowZoomButtons = a3;
}

- (void)setCanShowAspectFitButtons:(BOOL)a3
{
  self->_canShowAspectFitButtons = a3;
}

- (void)setShouldAvoidOverlapWithSecondaryToolbar:(BOOL)a3
{
  self->_shouldAvoidOverlapWithSecondaryToolbar = a3;
}

- (void)setShouldAccommodateLeadingButtonsLayout:(BOOL)a3
{
  self->_shouldAccommodateLeadingButtonsLayout = a3;
}

- (void)setWantsInlineHeader:(BOOL)a3
{
  self->_wantsInlineHeader = a3;
}

- (void)setRequiresTitleRenderedAsView:(BOOL)a3
{
  self->_requiresTitleRenderedAsView = a3;
}

- (void)setInlineHeaderStyle:(unint64_t)a3
{
  self->_inlineHeaderStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstCardVariantSpec, 0);
  objc_storeStrong((id *)&self->_smallVariantSpec, 0);
  objc_storeStrong((id *)&self->_styleGuide, 0);
  objc_storeStrong((id *)&self->_headerGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_subtitleDateFormatter, 0);
  objc_storeStrong((id *)&self->_titleDateFormatter, 0);
  objc_storeStrong((id *)&self->_debugNonInterestingTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_debugInterestingTitleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_titleSubtitleColorOverBackground, 0);
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)firstCardVariantSpec
{
  return self->_firstCardVariantSpec;
}

- (void)setSmallVariantSpec:(id)a3
{
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)smallVariantSpec
{
  return self->_smallVariantSpec;
}

- (PXCuratedLibraryStyleGuide)styleGuide
{
  return self->_styleGuide;
}

- (double)minimumSpacingBetweenTopSafeAreaAndTitleTop
{
  return self->_minimumSpacingBetweenTopSafeAreaAndTitleTop;
}

- (double)minimumSpacingBetweenTopSafeAreaAndContentTop
{
  return self->_minimumSpacingBetweenTopSafeAreaAndContentTop;
}

- (BOOL)gradientRespectsSafeArea
{
  return self->_gradientRespectsSafeArea;
}

- (double)gradientHeight
{
  return self->_gradientHeight;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (BOOL)shouldAccommodateLeadingButtonsLayout
{
  return self->_shouldAccommodateLeadingButtonsLayout;
}

- (PXExtendedImageConfiguration)headerGradientImageConfiguration
{
  return self->_headerGradientImageConfiguration;
}

- (void)setButtonsFadeOutMinimumAlpha:(double)a3
{
  self->_buttonsFadeOutMinimumAlpha = a3;
}

- (double)buttonsFadeOutMinimumAlpha
{
  return self->_buttonsFadeOutMinimumAlpha;
}

- (double)textFadeOutMinimumAlpha
{
  return self->_textFadeOutMinimumAlpha;
}

- (double)fadeOutDistanceFromSafeAreaTop
{
  return self->_fadeOutDistanceFromSafeAreaTop;
}

- (BOOL)shouldButtonsFadeOutWhenReachingTop
{
  return self->_shouldButtonsFadeOutWhenReachingTop;
}

- (BOOL)shouldTextFadeOutWhenReachingTop
{
  return self->_shouldTextFadeOutWhenReachingTop;
}

- (NSDateFormatter)subtitleDateFormatter
{
  return self->_subtitleDateFormatter;
}

- (NSDateFormatter)titleDateFormatter
{
  return self->_titleDateFormatter;
}

- (BOOL)swapTitleWithSubtitle
{
  return self->_swapTitleWithSubtitle;
}

- (unint64_t)inlineHeaderStyle
{
  return self->_inlineHeaderStyle;
}

- (BOOL)requiresTitleRenderedAsView
{
  return self->_requiresTitleRenderedAsView;
}

- (BOOL)wantsInlineHeader
{
  return self->_wantsInlineHeader;
}

- (BOOL)shouldAvoidOverlapWithSecondaryToolbar
{
  return self->_shouldAvoidOverlapWithSecondaryToolbar;
}

- (UIEdgeInsets)titlePadding
{
  double top = self->_titlePadding.top;
  double left = self->_titlePadding.left;
  double bottom = self->_titlePadding.bottom;
  double right = self->_titlePadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)contentPadding
{
  double top = self->_contentPadding.top;
  double left = self->_contentPadding.left;
  double bottom = self->_contentPadding.bottom;
  double right = self->_contentPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIColor)titleSubtitleColorOverBackground
{
  return self->_titleSubtitleColorOverBackground;
}

- (BOOL)shouldOmitYear
{
  return self->_shouldOmitYear;
}

- (BOOL)wantsSubtitle
{
  return self->_wantsSubtitle;
}

- (BOOL)wantsTitle
{
  return self->_wantsTitle;
}

- (BOOL)canShowAspectFitButtons
{
  return self->_canShowAspectFitButtons;
}

- (BOOL)canShowZoomButtons
{
  return self->_canShowZoomButtons;
}

- (void)setCanShowCancelButton:(BOOL)a3
{
  self->_canShowCancelButton = a3;
}

- (BOOL)canShowCancelButton
{
  return self->_canShowCancelButton;
}

- (void)setCanShowSelectButton:(BOOL)a3
{
  self->_canShowSelectButton = a3;
}

- (BOOL)canShowSelectButton
{
  return self->_canShowSelectButton;
}

- (BOOL)canShowEllipsisButton
{
  return self->_canShowEllipsisButton;
}

- (double)buttonHorizontalPadding
{
  return self->_buttonHorizontalPadding;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (double)buttonHeight
{
  return self->_buttonHeight;
}

- (void)setVariant:(int64_t)a3
{
  self->_variant = a3;
}

- (int64_t)variant
{
  return self->_variant;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)cornerRadius
{
  *(void *)&result.var0.var1[2] = a2;
  *(void *)&result.var0.var0.var0 = self;
  return result;
}

- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4
{
  return a3;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXCuratedLibrarySectionHeaderLayoutSpec *)self initWithExtendedTraitCollection:a3 options:a4 variant:0];
}

@end