@interface PXStoryConcreteViewLayoutSpec
- (BOOL)browseGridAllowsDragGesture;
- (BOOL)bufferingIndicatorWantsBackground;
- (BOOL)canShowCloseButton;
- (BOOL)canShowManagePhotosAction;
- (BOOL)canShowMuteToggleButton;
- (BOOL)insideCollectionDetailsView;
- (BOOL)onlyShowReplayEndButtonAtTopOfTitle;
- (BOOL)shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView;
- (BOOL)shouldHorizontallyCenterPlayButton;
- (BOOL)shouldUseAssetCollectionForTitleAndSubtitle;
- (BOOL)shouldUseUnifiedButtonLayout;
- (BOOL)shouldVerticallyCenterPlayButton;
- (BOOL)styleSwitcherCanShowEditButtons;
- (BOOL)wantsEdgeTapToChangeCurrentSegment;
- (BOOL)wantsSwipeDownGestureToDismiss;
- (CGPoint)shareButtonExtraOffset;
- (CGSize)chromeButtonPadding;
- (CGSize)chromeButtonSize;
- (CGSize)infoPanelButtonOffset;
- (CGSize)playbackEndButtonPadding;
- (CGSize)playbackEndButtonSize;
- (CGSize)relatedNavigationButtonSize;
- (CGSize)relatedTitleSize;
- (CGSize)rightEdgeHighlightImageSize;
- (CGSize)scrubberRegularAssetSize;
- (CGSize)upNextCountDownSize;
- (NSAttributedString)relatedAttributedTitle;
- (NSDictionary)chromeSubtitleAttributes;
- (NSDictionary)chromeTitleAttributes;
- (NSDictionary)playbackEndSubtitleAttributes;
- (NSDictionary)playbackEndTitleAttributes;
- (NSDictionary)styleSwitcherDetailsLabelAttributesA;
- (NSDictionary)styleSwitcherDetailsLabelAttributesAAccessory;
- (NSDictionary)styleSwitcherDetailsLabelAttributesB;
- (NSDictionary)styleSwitcherDetailsLabelAttributesC;
- (NSDictionary)upNextCountDownAttributes;
- (NSNumberFormatter)upNextCountDownFormatter;
- (NSString)actionMenuButtonImageName;
- (NSString)chromeSongSymbolName;
- (NSString)chromeTitleLocalizedSongFormat;
- (NSString)closeButtonImageName;
- (NSString)replayButtonImageName;
- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration;
- (PXExtendedImageConfiguration)rightEdgeHighlightImageConfiguration;
- (PXExtendedImageConfiguration)upNextCountDownDecorationImageConfiguration;
- (PXStoryChromeButtonSpec)chromeButtonSpec;
- (PXStoryChromeButtonSpec)playbackEndButtonSpec;
- (PXStoryChromeButtonSpec)relatedNavigationChromeButtonSpec;
- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4;
- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5 customGeneralChromeTitleConfiguration:(id)a6;
- (PXStoryPlayButtonSpec)playButtonSpec;
- (PXStoryRelatedLayoutMetrics)relatedLayoutMetrics;
- (PXStoryViewChromeTitleSpec)browseChromeTitleSpec;
- (PXStoryViewChromeTitleSpec)generalChromeTitleSpec;
- (PXStoryViewChromeTitleSpec)playbackEndChromeTitleSpec;
- (UIColor)browseGridBackgroundColor;
- (UIColor)playerBackgroundColor;
- (UIEdgeInsets)browseGridLayoutMargins;
- (UIEdgeInsets)infoPanelMargins;
- (UIEdgeInsets)infoPanelPadding;
- (UIEdgeInsets)scrubberFadeAreaInsets;
- (UIEdgeInsets)tapNavigationAreaInsets;
- (UIImage)styleSwitcherColorGradeNameGlyphImage;
- (UIImageConfiguration)chromeTitleMusicSystemImageConfiguration;
- (double)_calculatePredictedBrowseChromeTextHeight;
- (double)_predictedChromeTextBoxHeightWithAttributes:(id)a3 numberOfLines:(int64_t)a4;
- (double)bottomLegibilityGradientCornerRadius;
- (double)bottomLegibilityGradientHeight;
- (double)bufferingIndicatorCornerRadius;
- (double)canShowRelatedNavigationButton;
- (double)distanceFromBottomChromeTextToGrid;
- (double)distanceFromLateralEdgesToTopButtonCenter;
- (double)distanceFromTopEdgeToTopButtonCenter;
- (double)edgeHighlightAlpha;
- (double)infoPanelAnimationDistance;
- (double)infoPanelAssetAspectRatio;
- (double)infoPanelAssetToMetadataLabel;
- (double)infoPanelAssetToSymbolCenter;
- (double)infoPanelButtonHeight;
- (double)infoPanelDistanceBetweenAssetAndTitleLabel;
- (double)infoPanelFooterLabelBaselineFromBottom;
- (double)infoPanelHeight;
- (double)infoPanelMetadataToMetadataBaselines;
- (double)infoPanelTitleLabelBaselineFromTop;
- (double)infoPanelTitleToMetadataBaselines;
- (double)interChromeButtonSpacing;
- (double)interPlaybackEndButtonSpacing;
- (double)interTopLeadingChromeButtonSpacing;
- (double)interTopTrailingChromeButtonSpacing;
- (double)largeFormSheetSize;
- (double)maximumWidthForRelatedTitleAndSubtitle;
- (double)minimumWidthRequiredForChromeText;
- (double)playbackEndButtonSystemImagePointSize;
- (double)playbackEndButtonSystemImageWeight;
- (double)predictedBrowseChromeTextHeight;
- (double)relatedNavigationButtonFadeDuration;
- (double)relatedNavigationButtonSystemImagePointSize;
- (double)scrubberAssetCornerRadius;
- (double)scrubberCurrentAssetPadding;
- (double)scrubberHorizontalLayoutMargin;
- (double)scrubberRegularAssetPadding;
- (double)solidLegibilityGradientCornerRadius;
- (double)spacingBetweenPlaybackEndButtonAndTitles;
- (double)spacingBetweenPlaybackEndTitleAndSubtitle;
- (double)spacingBetweenRelatedNavigationButtonAndRelated;
- (double)spacingBetweenRelatedTitleAndMainRelated;
- (double)spacingBetweenRelatedTitleAndUpNextCountDown;
- (double)styleSwitcherDetailsTitleAccessoryPadding;
- (double)styleSwitcherDistanceBetweenAlbumArtAndLabels;
- (double)styleSwitcherDistanceBetweenEditButtons;
- (double)tapNavigationAreaWidth;
- (double)topLegibilityGradientCornerRadius;
- (double)topLegibilityGradientHeight;
- (double)upNextCountDownAppearDelay;
- (double)upNextCountDownFadeOutDuration;
- (double)upNextCountDownInitialVisibleValue;
- (double)upNextCountDownVerticalOffset;
- (id)chromeSongAttributedStringWithString:(id)a3;
- (id)chromeSongStringWithTitle:(id)a3 artist:(id)a4;
- (int64_t)defaultChromeButtonBackgroundStyle;
- (int64_t)muteToggleButtonPlacement;
- (int64_t)nonblurredChromeButtonBackgroundStyle;
- (int64_t)playButtonPlacement;
- (int64_t)preferredUserInterfaceStyleForBrowseGridInlineAddButton;
- (int64_t)styleSwitcherButtonPlacement;
- (int64_t)styleSwitcherChromeArrangement;
- (int64_t)upNextAnimationStyle;
- (int64_t)upNextCountdownPlacement;
- (unint64_t)fullsizePlayerDefaultChromeItems;
- (unint64_t)upNextTargetMemoryCount;
- (unsigned)rightEdgeHighlightImageVersion;
@end

@implementation PXStoryConcreteViewLayoutSpec

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chromeTitleLocalizedSongFormat, 0);
  objc_storeStrong((id *)&self->_chromeTitleMusicSystemImageConfiguration, 0);
  objc_storeStrong((id *)&self->_styleSwitcherColorGradeNameGlyphImage, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesC, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesB, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesAAccessory, 0);
  objc_storeStrong((id *)&self->_styleSwitcherDetailsLabelAttributesA, 0);
  objc_storeStrong((id *)&self->_upNextCountDownDecorationImageConfiguration, 0);
  objc_storeStrong((id *)&self->_upNextCountDownAttributes, 0);
  objc_storeStrong((id *)&self->_upNextCountDownFormatter, 0);
  objc_storeStrong((id *)&self->_relatedNavigationChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_relatedAttributedTitle, 0);
  objc_storeStrong((id *)&self->_relatedLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_legibilityGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_rightEdgeHighlightImageConfiguration, 0);
  objc_storeStrong((id *)&self->_generalChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_browseChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_playbackEndChromeTitleSpec, 0);
  objc_storeStrong((id *)&self->_playbackEndSubtitleAttributes, 0);
  objc_storeStrong((id *)&self->_playbackEndTitleAttributes, 0);
  objc_storeStrong((id *)&self->_chromeSubtitleAttributes, 0);
  objc_storeStrong((id *)&self->_chromeTitleAttributes, 0);
  objc_storeStrong((id *)&self->_playbackEndButtonSpec, 0);
  objc_storeStrong((id *)&self->_actionMenuButtonImageName, 0);
  objc_storeStrong((id *)&self->_closeButtonImageName, 0);
  objc_storeStrong((id *)&self->_replayButtonImageName, 0);
  objc_storeStrong((id *)&self->_playButtonSpec, 0);
  objc_storeStrong((id *)&self->_chromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_browseGridBackgroundColor, 0);
  objc_storeStrong((id *)&self->_playerBackgroundColor, 0);
}

- (NSString)chromeTitleLocalizedSongFormat
{
  return self->_chromeTitleLocalizedSongFormat;
}

- (UIImageConfiguration)chromeTitleMusicSystemImageConfiguration
{
  return self->_chromeTitleMusicSystemImageConfiguration;
}

- (double)largeFormSheetSize
{
  return self->_largeFormSheetSize;
}

- (double)infoPanelMetadataToMetadataBaselines
{
  return self->_infoPanelMetadataToMetadataBaselines;
}

- (double)infoPanelTitleToMetadataBaselines
{
  return self->_infoPanelTitleToMetadataBaselines;
}

- (double)infoPanelTitleLabelBaselineFromTop
{
  return self->_infoPanelTitleLabelBaselineFromTop;
}

- (double)infoPanelFooterLabelBaselineFromBottom
{
  return self->_infoPanelFooterLabelBaselineFromBottom;
}

- (double)infoPanelAssetToMetadataLabel
{
  return self->_infoPanelAssetToMetadataLabel;
}

- (double)infoPanelAssetToSymbolCenter
{
  return self->_infoPanelAssetToSymbolCenter;
}

- (double)infoPanelDistanceBetweenAssetAndTitleLabel
{
  return self->_infoPanelDistanceBetweenAssetAndTitleLabel;
}

- (double)infoPanelButtonHeight
{
  return self->_infoPanelButtonHeight;
}

- (CGSize)infoPanelButtonOffset
{
  double width = self->_infoPanelButtonOffset.width;
  double height = self->_infoPanelButtonOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)infoPanelAssetAspectRatio
{
  return self->_infoPanelAssetAspectRatio;
}

- (double)infoPanelAnimationDistance
{
  return self->_infoPanelAnimationDistance;
}

- (double)infoPanelHeight
{
  return self->_infoPanelHeight;
}

- (UIEdgeInsets)infoPanelPadding
{
  double top = self->_infoPanelPadding.top;
  double left = self->_infoPanelPadding.left;
  double bottom = self->_infoPanelPadding.bottom;
  double right = self->_infoPanelPadding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)infoPanelMargins
{
  double top = self->_infoPanelMargins.top;
  double left = self->_infoPanelMargins.left;
  double bottom = self->_infoPanelMargins.bottom;
  double right = self->_infoPanelMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)predictedBrowseChromeTextHeight
{
  return self->_predictedBrowseChromeTextHeight;
}

- (BOOL)insideCollectionDetailsView
{
  return self->_insideCollectionDetailsView;
}

- (BOOL)bufferingIndicatorWantsBackground
{
  return self->_bufferingIndicatorWantsBackground;
}

- (double)bufferingIndicatorCornerRadius
{
  return self->_bufferingIndicatorCornerRadius;
}

- (UIImage)styleSwitcherColorGradeNameGlyphImage
{
  return self->_styleSwitcherColorGradeNameGlyphImage;
}

- (BOOL)styleSwitcherCanShowEditButtons
{
  return self->_styleSwitcherCanShowEditButtons;
}

- (double)styleSwitcherDistanceBetweenEditButtons
{
  return self->_styleSwitcherDistanceBetweenEditButtons;
}

- (double)styleSwitcherDistanceBetweenAlbumArtAndLabels
{
  return self->_styleSwitcherDistanceBetweenAlbumArtAndLabels;
}

- (double)styleSwitcherDetailsTitleAccessoryPadding
{
  return self->_styleSwitcherDetailsTitleAccessoryPadding;
}

- (int64_t)styleSwitcherChromeArrangement
{
  return self->_styleSwitcherChromeArrangement;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesC
{
  return self->_styleSwitcherDetailsLabelAttributesC;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesB
{
  return self->_styleSwitcherDetailsLabelAttributesB;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesAAccessory
{
  return self->_styleSwitcherDetailsLabelAttributesAAccessory;
}

- (NSDictionary)styleSwitcherDetailsLabelAttributesA
{
  return self->_styleSwitcherDetailsLabelAttributesA;
}

- (int64_t)upNextCountdownPlacement
{
  return self->_upNextCountdownPlacement;
}

- (int64_t)upNextAnimationStyle
{
  return self->_upNextAnimationStyle;
}

- (unint64_t)upNextTargetMemoryCount
{
  return self->_upNextTargetMemoryCount;
}

- (double)upNextCountDownInitialVisibleValue
{
  return self->_upNextCountDownInitialVisibleValue;
}

- (double)upNextCountDownAppearDelay
{
  return self->_upNextCountDownAppearDelay;
}

- (double)upNextCountDownFadeOutDuration
{
  return self->_upNextCountDownFadeOutDuration;
}

- (double)upNextCountDownVerticalOffset
{
  return self->_upNextCountDownVerticalOffset;
}

- (double)spacingBetweenRelatedTitleAndUpNextCountDown
{
  return self->_spacingBetweenRelatedTitleAndUpNextCountDown;
}

- (PXExtendedImageConfiguration)upNextCountDownDecorationImageConfiguration
{
  return self->_upNextCountDownDecorationImageConfiguration;
}

- (NSDictionary)upNextCountDownAttributes
{
  return self->_upNextCountDownAttributes;
}

- (NSNumberFormatter)upNextCountDownFormatter
{
  return self->_upNextCountDownFormatter;
}

- (CGSize)upNextCountDownSize
{
  double width = self->_upNextCountDownSize.width;
  double height = self->_upNextCountDownSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)relatedNavigationButtonSize
{
  double width = self->_relatedNavigationButtonSize.width;
  double height = self->_relatedNavigationButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)relatedNavigationButtonSystemImagePointSize
{
  return self->_relatedNavigationButtonSystemImagePointSize;
}

- (double)relatedNavigationButtonFadeDuration
{
  return self->_relatedNavigationButtonFadeDuration;
}

- (double)canShowRelatedNavigationButton
{
  return self->_canShowRelatedNavigationButton;
}

- (PXStoryChromeButtonSpec)relatedNavigationChromeButtonSpec
{
  return self->_relatedNavigationChromeButtonSpec;
}

- (double)spacingBetweenRelatedNavigationButtonAndRelated
{
  return self->_spacingBetweenRelatedNavigationButtonAndRelated;
}

- (double)maximumWidthForRelatedTitleAndSubtitle
{
  return self->_maximumWidthForRelatedTitleAndSubtitle;
}

- (double)spacingBetweenPlaybackEndTitleAndSubtitle
{
  return self->_spacingBetweenPlaybackEndTitleAndSubtitle;
}

- (double)spacingBetweenRelatedTitleAndMainRelated
{
  return self->_spacingBetweenRelatedTitleAndMainRelated;
}

- (NSAttributedString)relatedAttributedTitle
{
  return self->_relatedAttributedTitle;
}

- (CGSize)relatedTitleSize
{
  double width = self->_relatedTitleSize.width;
  double height = self->_relatedTitleSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView
{
  return self->_shouldHideChromeItemsWhenRelatedOverlayIsScrolledIntoView;
}

- (PXStoryRelatedLayoutMetrics)relatedLayoutMetrics
{
  return self->_relatedLayoutMetrics;
}

- (UIEdgeInsets)scrubberFadeAreaInsets
{
  double top = self->_scrubberFadeAreaInsets.top;
  double left = self->_scrubberFadeAreaInsets.left;
  double bottom = self->_scrubberFadeAreaInsets.bottom;
  double right = self->_scrubberFadeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)scrubberHorizontalLayoutMargin
{
  return self->_scrubberHorizontalLayoutMargin;
}

- (CGSize)scrubberRegularAssetSize
{
  double width = self->_scrubberRegularAssetSize.width;
  double height = self->_scrubberRegularAssetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)scrubberCurrentAssetPadding
{
  return self->_scrubberCurrentAssetPadding;
}

- (double)scrubberRegularAssetPadding
{
  return self->_scrubberRegularAssetPadding;
}

- (double)scrubberAssetCornerRadius
{
  return self->_scrubberAssetCornerRadius;
}

- (double)distanceFromLateralEdgesToTopButtonCenter
{
  return self->_distanceFromLateralEdgesToTopButtonCenter;
}

- (double)distanceFromTopEdgeToTopButtonCenter
{
  return self->_distanceFromTopEdgeToTopButtonCenter;
}

- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration
{
  return self->_legibilityGradientImageConfiguration;
}

- (double)bottomLegibilityGradientCornerRadius
{
  return self->_bottomLegibilityGradientCornerRadius;
}

- (double)topLegibilityGradientCornerRadius
{
  return self->_topLegibilityGradientCornerRadius;
}

- (double)solidLegibilityGradientCornerRadius
{
  return self->_solidLegibilityGradientCornerRadius;
}

- (double)bottomLegibilityGradientHeight
{
  return self->_bottomLegibilityGradientHeight;
}

- (double)topLegibilityGradientHeight
{
  return self->_topLegibilityGradientHeight;
}

- (double)edgeHighlightAlpha
{
  return self->_edgeHighlightAlpha;
}

- (unsigned)rightEdgeHighlightImageVersion
{
  return self->_rightEdgeHighlightImageVersion;
}

- (CGSize)rightEdgeHighlightImageSize
{
  double width = self->_rightEdgeHighlightImageSize.width;
  double height = self->_rightEdgeHighlightImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXExtendedImageConfiguration)rightEdgeHighlightImageConfiguration
{
  return self->_rightEdgeHighlightImageConfiguration;
}

- (BOOL)browseGridAllowsDragGesture
{
  return self->_browseGridAllowsDragGesture;
}

- (int64_t)preferredUserInterfaceStyleForBrowseGridInlineAddButton
{
  return self->_preferredUserInterfaceStyleForBrowseGridInlineAddButton;
}

- (UIEdgeInsets)browseGridLayoutMargins
{
  double top = self->_browseGridLayoutMargins.top;
  double left = self->_browseGridLayoutMargins.left;
  double bottom = self->_browseGridLayoutMargins.bottom;
  double right = self->_browseGridLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)minimumWidthRequiredForChromeText
{
  return self->_minimumWidthRequiredForChromeText;
}

- (double)distanceFromBottomChromeTextToGrid
{
  return self->_distanceFromBottomChromeTextToGrid;
}

- (PXStoryViewChromeTitleSpec)generalChromeTitleSpec
{
  return self->_generalChromeTitleSpec;
}

- (PXStoryViewChromeTitleSpec)browseChromeTitleSpec
{
  return self->_browseChromeTitleSpec;
}

- (PXStoryViewChromeTitleSpec)playbackEndChromeTitleSpec
{
  return self->_playbackEndChromeTitleSpec;
}

- (BOOL)shouldUseAssetCollectionForTitleAndSubtitle
{
  return self->_shouldUseAssetCollectionForTitleAndSubtitle;
}

- (NSDictionary)playbackEndSubtitleAttributes
{
  return self->_playbackEndSubtitleAttributes;
}

- (NSDictionary)playbackEndTitleAttributes
{
  return self->_playbackEndTitleAttributes;
}

- (NSDictionary)chromeSubtitleAttributes
{
  return self->_chromeSubtitleAttributes;
}

- (NSDictionary)chromeTitleAttributes
{
  return self->_chromeTitleAttributes;
}

- (int64_t)playButtonPlacement
{
  return self->_playButtonPlacement;
}

- (int64_t)muteToggleButtonPlacement
{
  return self->_muteToggleButtonPlacement;
}

- (int64_t)styleSwitcherButtonPlacement
{
  return self->_styleSwitcherButtonPlacement;
}

- (double)spacingBetweenPlaybackEndButtonAndTitles
{
  return self->_spacingBetweenPlaybackEndButtonAndTitles;
}

- (PXStoryChromeButtonSpec)playbackEndButtonSpec
{
  return self->_playbackEndButtonSpec;
}

- (CGSize)playbackEndButtonPadding
{
  double width = self->_playbackEndButtonPadding.width;
  double height = self->_playbackEndButtonPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)onlyShowReplayEndButtonAtTopOfTitle
{
  return self->_onlyShowReplayEndButtonAtTopOfTitle;
}

- (double)interPlaybackEndButtonSpacing
{
  return self->_interPlaybackEndButtonSpacing;
}

- (double)playbackEndButtonSystemImageWeight
{
  return self->_playbackEndButtonSystemImageWeight;
}

- (double)playbackEndButtonSystemImagePointSize
{
  return self->_playbackEndButtonSystemImagePointSize;
}

- (CGSize)playbackEndButtonSize
{
  double width = self->_playbackEndButtonSize.width;
  double height = self->_playbackEndButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)actionMenuButtonImageName
{
  return self->_actionMenuButtonImageName;
}

- (NSString)closeButtonImageName
{
  return self->_closeButtonImageName;
}

- (NSString)replayButtonImageName
{
  return self->_replayButtonImageName;
}

- (PXStoryPlayButtonSpec)playButtonSpec
{
  return self->_playButtonSpec;
}

- (PXStoryChromeButtonSpec)chromeButtonSpec
{
  return self->_chromeButtonSpec;
}

- (BOOL)shouldVerticallyCenterPlayButton
{
  return self->_shouldVerticallyCenterPlayButton;
}

- (BOOL)shouldHorizontallyCenterPlayButton
{
  return self->_shouldHorizontallyCenterPlayButton;
}

- (CGSize)chromeButtonPadding
{
  double width = self->_chromeButtonPadding.width;
  double height = self->_chromeButtonPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)shareButtonExtraOffset
{
  double x = self->_shareButtonExtraOffset.x;
  double y = self->_shareButtonExtraOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)interTopLeadingChromeButtonSpacing
{
  return self->_interTopLeadingChromeButtonSpacing;
}

- (double)interTopTrailingChromeButtonSpacing
{
  return self->_interTopTrailingChromeButtonSpacing;
}

- (double)interChromeButtonSpacing
{
  return self->_interChromeButtonSpacing;
}

- (int64_t)nonblurredChromeButtonBackgroundStyle
{
  return self->_nonblurredChromeButtonBackgroundStyle;
}

- (int64_t)defaultChromeButtonBackgroundStyle
{
  return self->_defaultChromeButtonBackgroundStyle;
}

- (CGSize)chromeButtonSize
{
  double width = self->_chromeButtonSize.width;
  double height = self->_chromeButtonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)tapNavigationAreaWidth
{
  return self->_tapNavigationAreaWidth;
}

- (UIEdgeInsets)tapNavigationAreaInsets
{
  double top = self->_tapNavigationAreaInsets.top;
  double left = self->_tapNavigationAreaInsets.left;
  double bottom = self->_tapNavigationAreaInsets.bottom;
  double right = self->_tapNavigationAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)fullsizePlayerDefaultChromeItems
{
  return self->_fullsizePlayerDefaultChromeItems;
}

- (BOOL)wantsSwipeDownGestureToDismiss
{
  return self->_wantsSwipeDownGestureToDismiss;
}

- (BOOL)wantsEdgeTapToChangeCurrentSegment
{
  return self->_wantsEdgeTapToChangeCurrentSegment;
}

- (BOOL)canShowManagePhotosAction
{
  return self->_canShowManagePhotosAction;
}

- (BOOL)canShowMuteToggleButton
{
  return self->_canShowMuteToggleButton;
}

- (BOOL)canShowCloseButton
{
  return self->_canShowCloseButton;
}

- (BOOL)shouldUseUnifiedButtonLayout
{
  return self->_shouldUseUnifiedButtonLayout;
}

- (UIColor)browseGridBackgroundColor
{
  return self->_browseGridBackgroundColor;
}

- (UIColor)playerBackgroundColor
{
  return self->_playerBackgroundColor;
}

- (double)_predictedChromeTextBoxHeightWithAttributes:(id)a3 numberOfLines:(int64_t)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithString:@"L" attributes:v6];

  objc_msgSend(v7, "px_sizeWithProposedWidth:maximumLines:drawingOptions:", a4, 1, INFINITY);
  double v9 = v8;

  return v9;
}

- (NSString)chromeSongSymbolName
{
  return (NSString *)@"music";
}

- (double)_calculatePredictedBrowseChromeTextHeight
{
  v3 = [(PXStoryConcreteViewLayoutSpec *)self browseChromeTitleSpec];
  v4 = [(PXStoryConcreteViewLayoutSpec *)self chromeTitleAttributes];
  -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](self, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v4, [v3 numberOfTitleLines]);
  double v6 = v5;

  v7 = [(PXStoryConcreteViewLayoutSpec *)self chromeSubtitleAttributes];
  -[PXStoryConcreteViewLayoutSpec _predictedChromeTextBoxHeightWithAttributes:numberOfLines:](self, "_predictedChromeTextBoxHeightWithAttributes:numberOfLines:", v7, [v3 numberOfSubtitleLines]);
  double v9 = v8;

  double v10 = v6 + v9;
  v11 = [(PXStoryConcreteViewLayoutSpec *)self chromeButtonSpec];
  [v11 defaultImageSize];
  double v13 = v12;

  [(PXStoryConcreteViewLayoutSpec *)self distanceFromTopEdgeToTopButtonCenter];
  *(float *)&double v14 = fmax(v14 - v13 * 0.5, v14 - v13 * 0.5 + v13 * 0.5 - v10 * 0.5);
  double v15 = ceil(v10 + roundf(*(float *)&v14));

  return v15;
}

- (id)chromeSongAttributedStringWithString:(id)a3
{
  id v4 = a3;
  double v5 = [(PXStoryConcreteViewLayoutSpec *)self chromeSongSymbolName];
  double v6 = (void *)MEMORY[0x1E4FB1818];
  v7 = [(PXStoryConcreteViewLayoutSpec *)self chromeTitleMusicSystemImageConfiguration];
  double v8 = [v6 _systemImageNamed:v5 withConfiguration:v7];

  double v9 = [(PXStoryConcreteViewLayoutSpec *)self chromeSubtitleAttributes];
  id v10 = objc_alloc_init(MEMORY[0x1E4FB0870]);
  v11 = [v8 imageWithRenderingMode:2];
  [v10 setImage:v11];

  double v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v10];
  double v13 = (void *)[v12 mutableCopy];

  objc_msgSend(v13, "addAttributes:range:", v9, 0, objc_msgSend(v13, "length"));
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:v9];
  [v13 appendAttributedString:v14];

  double v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v4 attributes:v9];
  [v13 appendAttributedString:v15];

  return v13;
}

- (id)chromeSongStringWithTitle:(id)a3 artist:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PXStoryConcreteViewLayoutSpec *)self chromeTitleLocalizedSongFormat];
  double v9 = PXStringWithValidatedFormat();

  return v9;
}

- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return [(PXStoryConcreteViewLayoutSpec *)self initWithExtendedTraitCollection:a3 options:a4 storyConfigurationOptions:0 customGeneralChromeTitleConfiguration:0];
}

- (PXStoryConcreteViewLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5 customGeneralChromeTitleConfiguration:(id)a6
{
  char v138 = a5;
  v150[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = (PXStoryViewChromeTitleConfiguration *)a6;
  v139.receiver = self;
  v139.super_class = (Class)PXStoryConcreteViewLayoutSpec;
  v11 = [(PXFeatureSpec *)&v139 initWithExtendedTraitCollection:v9 options:a4];

  if (v11)
  {
    v135 = v10;
    double v12 = +[PXStorySettings sharedInstance];
    uint64_t v13 = [v9 userInterfaceIdiom];
    uint64_t v14 = [(PXFeatureSpec *)v11 layoutOrientation];
    uint64_t v128 = [v9 layoutSizeClass];
    int v126 = [v9 insideCollectionDetailsView];
    uint64_t v15 = [v9 contentSizeCategory];
    [v9 storyChromeLayoutSpec];
    [(id)objc_claimAutoreleasedReturnValue() minimumMargins];
    double v17 = v16;
    BOOL v133 = v13 == 3;
    v11->_shouldUseUnifiedButtonLayout = v13 == 3;
    if ((unint64_t)(v13 - 1) < 2)
    {
      char v18 = 1;
    }
    else
    {
      if ((unint64_t)(v13 - 3) < 2)
      {
        v11->_canShowManagePhotosAction = [v12 allowCustomUserAssets];
        v11->_canShowCloseButton = 0;
        if (v13 == 3)
        {
          v11->_fullsizePlayerDefaultChromeItems |= 0xC00020uLL;
          goto LABEL_13;
        }
LABEL_10:
        int v19 = [v12 preferTopChromeItemsInAppNavigationBar];
        unint64_t fullsizePlayerDefaultChromeItems = v11->_fullsizePlayerDefaultChromeItems;
        if (!v19) {
          fullsizePlayerDefaultChromeItems |= 0x42uLL;
        }
        v11->_unint64_t fullsizePlayerDefaultChromeItems = fullsizePlayerDefaultChromeItems | 4;
LABEL_13:
        v137 = v9;
        v134 = v12;
        if ([v12 wantsGridLayout]) {
          v11->_fullsizePlayerDefaultChromeItems |= 0x80uLL;
        }
        p_chromeButtonSize = (int64x2_t *)&v11->_chromeButtonSize;
        if (v13 == 3)
        {
          int64x2_t *p_chromeButtonSize = vdupq_n_s64(0x4050000000000000uLL);
          uint64_t v22 = 4;
          v11->_defaultChromeButtonBackgroundStyle = 4;
          double v23 = 24.0;
        }
        else
        {
          int64x2_t *p_chromeButtonSize = vdupq_n_s64(0x4046000000000000uLL);
          if ((unint64_t)(v15 - 8) <= 4) {
            PXSizeScale();
          }
          if (v13 == 5)
          {
            v11->_defaultChromeButtonBackgroundStyle = 0;
            v11->_nonblurredChromeButtonBackgroundStyle = 0;
            v11->_interChromeButtonSpacing = 16.0;
            v11->_interTopTrailingChromeButtonSpacing = 16.0;
            v11->_interTopLeadingChromeButtonSpacing = v11->_interChromeButtonSpacing;
            v11->_shareButtonExtraOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
            goto LABEL_23;
          }
          uint64_t v22 = 0;
          v11->_defaultChromeButtonBackgroundStyle = 1;
          double v23 = 20.0;
        }
        v11->_nonblurredChromeButtonBackgroundStyle = v22;
        v11->_interChromeButtonSpacing = v23;
        v11->_interTopTrailingChromeButtonSpacing = 0.0;
        v11->_interTopLeadingChromeButtonSpacing = 0.0;
        v11->_shareButtonExtraOffset = (CGPoint)xmmword_1AB31A690;
LABEL_23:
        unsigned __int16 v132 = v14 != 1;
        BOOL v24 = v14 == 1;
        if (v13 == 4) {
          BOOL v24 = 0;
        }
        v11->_shouldHorizontallyCenterPlayButton = v24 | ((v138 & 0x80) >> 7);
        v11->_shouldVerticallyCenterPlayButton = v138 < 0;
        v25 = [[PXStoryChromeButtonSpec alloc] initWithExtendedTraitCollection:v9];
        chromeButtonSpec = v11->_chromeButtonSpec;
        v11->_chromeButtonSpec = v25;

        v27 = [[PXStoryPlayButtonSpec alloc] initWithChromeButtonSpec:v11->_chromeButtonSpec];
        playButtonSpec = v11->_playButtonSpec;
        v11->_playButtonSpec = v27;

        p_double width = (_OWORD *)&v11->_chromeButtonPadding.width;
        uint64_t v136 = v14;
        v127 = &v11->_chromeButtonPadding.width;
        if (v13 == 3)
        {
          *p_double width = xmmword_1AB359F50;
          replayButtonImageName = v11->_replayButtonImageName;
          v11->_replayButtonImageName = (NSString *)@"arrow.counterclockwise";
        }
        else
        {
          v29.i64[0] = 5;
          v30.i64[0] = v13;
          __asm
          {
            FMOV            V2.2D, #26.0
            FMOV            V3.2D, #24.0
          }
          int8x16_t v38 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v30, v29).i64[0], 0), (int8x16_t)_Q3, (int8x16_t)_Q2);
          _Q2.i64[0] = 4;
          int8x16_t v39 = (int8x16_t)vdupq_lane_s64(vceqq_s64(v30, _Q2).i64[0], 0);
          _Q2.i64[0] = v14;
          _Q3.i64[0] = 1;
          int8x16_t v40 = vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(_Q2, _Q3).i64[0], 0), (int8x16_t)vdupq_n_s64(0x4044000000000000uLL), v38);
          __asm { FMOV            V2.2D, #20.0 }
          *p_double width = vbslq_s8(v39, _Q2, v40);
          uint64_t v42 = [v9 layoutDirection];
          v43 = v11->_replayButtonImageName;
          v44 = @"backward.end.fill";
          if (v42 == 2) {
            v44 = @"forward.end.fill";
          }
          v11->_replayButtonImageName = &v44->isa;

          if (v13 == 5)
          {
            actionMenuButtonImageName = v11->_actionMenuButtonImageName;
            v11->_actionMenuButtonImageName = (NSString *)@"ellipsis";

            closeButtonImageName = v11->_closeButtonImageName;
            v11->_closeButtonImageName = (NSString *)@"chevron.backward";

            v11->_styleSwitcherButtonPlacement = 2;
            v11->_muteToggleButtonPlacement = 3;
            if (v138 < 0) {
              uint64_t v47 = 1;
            }
            else {
              uint64_t v47 = 4;
            }
            goto LABEL_46;
          }
        }
        v48 = v11->_actionMenuButtonImageName;
        v11->_actionMenuButtonImageName = (NSString *)@"ellipsis.circle";

        v49 = v11->_closeButtonImageName;
        v11->_closeButtonImageName = (NSString *)@"xmark";

        v11->_styleSwitcherButtonPlacement = 4;
        v11->_muteToggleButtonPlacement = 2;
        if (v138 < 0)
        {
          v11->_playButtonPlacement = 1;
          if (v13 != 4) {
            goto LABEL_47;
          }
LABEL_39:
          v11->_playbackEndButtonSystemImageWeight = *(double *)MEMORY[0x1E4FB09E0];
          v11->_playbackEndButtonSystemImagePointSize = 27.0;
          v11->_playbackEndButtonSize = (CGSize)vdupq_n_s64(0x4046000000000000uLL);
          v11->_interPlaybackEndButtonSpacing = 0.0;
          v11->_onlyShowReplayEndButtonAtTopOfTitle = 1;
          v11->_playbackEndButtonPadding = (CGSize)xmmword_1AB359F60;
          double v50 = 50.0;
          goto LABEL_53;
        }
        if (v13 == 4)
        {
          v11->_playButtonPlacement = 5;
          goto LABEL_39;
        }
        _ZF = v14 == 1 && v128 == 1;
        uint64_t v47 = 5;
        if (_ZF) {
          uint64_t v47 = 1;
        }
LABEL_46:
        v11->_playButtonPlacement = v47;
LABEL_47:
        v11->_playbackEndButtonSize = (CGSize)vdupq_n_s64(0x4044000000000000uLL);
        v11->_playbackEndButtonSystemImageWeight = (double)*(uint64_t *)off_1E5DAAFE0;
        v11->_playbackEndButtonSystemImagePointSize = *(double *)off_1E5DAAFD8;
        v11->_interPlaybackEndButtonSpacing = 12.0;
        v11->_onlyShowReplayEndButtonAtTopOfTitle = 0;
        if (v14 == 1) {
          double v52 = 40.0;
        }
        else {
          double v52 = 55.0;
        }
        double v50 = 31.0;
        if (v14 == 1) {
          double v50 = 40.0;
        }
        v11->_playbackEndButtonPadding.double width = v52;
        v11->_playbackEndButtonPadding.double height = v50;
LABEL_53:
        if (v50 < v17) {
          double v50 = v17;
        }
        v11->_playbackEndButtonPadding.double height = v50;
        objc_storeStrong((id *)&v11->_playbackEndButtonSpec, v11->_chromeButtonSpec);
        v53 = (double *)MEMORY[0x1E4FB09B8];
        if (v13 != 3)
        {
          if (v13 == 5) {
            PXFontWithTextStyleAndWeight();
          }
          PXFontWithTextStyleSymbolicTraits();
        }
        uint64_t v149 = *MEMORY[0x1E4FB0950];
        uint64_t v54 = v149;
        uint64_t v145 = *MEMORY[0x1E4FB0A10];
        uint64_t v55 = v145;
        v56 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24700]];
        v148[0] = v56;
        uint64_t v146 = *MEMORY[0x1E4FB09F0];
        uint64_t v57 = v146;
        v58 = [NSNumber numberWithDouble:*v53];
        uint64_t v147 = *MEMORY[0x1E4FB0998];
        uint64_t v59 = v147;
        uint64_t v60 = *MEMORY[0x1E4FB0928];
        v148[1] = v58;
        v148[2] = v60;
        v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v148 forKeys:&v145 count:3];
        v150[0] = v61;
        v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v150 forKeys:&v149 count:1];

        v62 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v131];
        v63 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v62 size:82.0];
        uint64_t v143 = v54;
        v141[0] = v55;
        v64 = [NSNumber numberWithDouble:*MEMORY[0x1E4F24720]];
        v142[0] = v64;
        v141[1] = v57;
        v65 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09E0]];
        v141[2] = v59;
        v142[1] = v65;
        v142[2] = v60;
        v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v142 forKeys:v141 count:3];
        v144 = v66;
        v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v144 forKeys:&v143 count:1];

        v68 = (void *)[objc_alloc(MEMORY[0x1E4FB08E8]) initWithFontAttributes:v67];
        v69 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v68 size:23.0];

        v70 = objc_alloc_init(PXStoryViewChromeTitleConfiguration);
        v71 = [PXStoryConcreteViewChromeTitleSpec alloc];
        if (v136 == 1) {
          uint64_t v72 = 2;
        }
        else {
          uint64_t v72 = 1;
        }
        if (v135) {
          v73 = v135;
        }
        else {
          v73 = v70;
        }
        uint64_t v74 = [(PXStoryConcreteViewChromeTitleSpec *)v71 initWithNumberOfTitleLines:2 numberOfSubtitleLines:v72 configuration:v73];
        generalChromeTitleSpec = v11->_generalChromeTitleSpec;
        v11->_generalChromeTitleSpec = (PXStoryViewChromeTitleSpec *)v74;

        uint64_t v76 = __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v63, v11->_generalChromeTitleSpec, 1.0);
        chromeTitleAttributes = v11->_chromeTitleAttributes;
        v11->_chromeTitleAttributes = (NSDictionary *)v76;

        uint64_t v78 = __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(v69, v11->_generalChromeTitleSpec, 1.0);
        chromeSubtitleAttributes = v11->_chromeSubtitleAttributes;
        v11->_chromeSubtitleAttributes = (NSDictionary *)v78;

        v11->_shouldUseAssetCollectionForTitleAndSubtitle = v133;
        v80 = [[PXStoryConcreteViewChromeTitleSpec alloc] initWithNumberOfTitleLines:1 numberOfSubtitleLines:1 configuration:v70];
        browseChromeTitleSpec = v11->_browseChromeTitleSpec;
        v11->_browseChromeTitleSpec = (PXStoryViewChromeTitleSpec *)v80;

        v11->_distanceFromBottomChromeTextToGrid = 12.0;
        v11->_minimumWidthRequiredForChromeText = 100.0;
        long long v129 = *(_OWORD *)off_1E5DAAF10;
        long long v130 = *((_OWORD *)off_1E5DAAF10 + 1);
        *(_OWORD *)&v11->_browseGridLayoutMargins.double top = *(_OWORD *)off_1E5DAAF10;
        *(_OWORD *)&v11->_browseGridLayoutMargins.double bottom = v130;
        v11->_preferredUserInterfaceStyleForBrowseGridInlineAddButton = 2;
        v11->_browseGridAllowsDragGesture = 1;
        if (v136 == 1)
        {
          uint64_t v82 = PXLocalizedStringFromTable(@"InteractiveMemoryChromePortraitSongTitleFormat", @"PhotosUICore");
          chromeTitleLocalizedSongFormat = v11->_chromeTitleLocalizedSongFormat;
          v11->_chromeTitleLocalizedSongFormat = (NSString *)v82;
          v84 = @"PXStoryEdgeHighlightGradientPortrait";
          uint64_t v85 = 0x4085480000000000;
          uint64_t v86 = 0x40A3080000000000;
        }
        else
        {
          uint64_t v87 = PXLocalizedStringFromTable(@"InteractiveMemoryChromeLandscapeSongTitleFormat", @"PhotosUICore");
          chromeTitleLocalizedSongFormat = v11->_chromeTitleLocalizedSongFormat;
          v11->_chromeTitleLocalizedSongFormat = (NSString *)v87;
          v84 = @"PXStoryEdgeHighlightGradientLandscape";
          uint64_t v85 = 0x4088900000000000;
          uint64_t v86 = 0x4091940000000000;
        }

        uint64_t v88 = [MEMORY[0x1E4FB1830] configurationWithFont:v69 scale:1];
        chromeTitleMusicSystemImageConfiguration = v11->_chromeTitleMusicSystemImageConfiguration;
        v11->_chromeTitleMusicSystemImageConfiguration = (UIImageConfiguration *)v88;

        uint64_t v90 = [objc_alloc((Class)off_1E5DA6358) initWithImageName:v84];
        rightEdgeHighlightImageConfiguration = v11->_rightEdgeHighlightImageConfiguration;
        v11->_rightEdgeHighlightImageConfiguration = (PXExtendedImageConfiguration *)v90;

        *(void *)&v11->_rightEdgeHighlightImageSize.double width = v85;
        *(void *)&v11->_rightEdgeHighlightImageSize.double height = v86;
        v11->_rightEdgeHighlightImageVersion = v132;
        v11->_edgeHighlightAlpha = 0.5;
        if ([v134 overrideLegibilityGradientHeights])
        {
          [v134 topLegibilityGradientHeight];
          v11->_topLegibilityGradientHeight = v92;
          [v134 bottomLegibilityGradientHeight];
          int v94 = 536;
          v95 = &v11->_chromeButtonSize;
        }
        else
        {
          v95 = &v11->_chromeButtonSize;
          int v94 = 528;
          v11->_topLegibilityGradientHeight = 0.0;
          v11->_bottomLegibilityGradientHeight = 696.0;
          int v96 = [v134 preferTopChromeItemsInAppNavigationBar];
          v93 = 0;
          if (!v96) {
            goto LABEL_73;
          }
        }
        *(Class *)((char *)&v11->super.super.isa + v94) = v93;
LABEL_73:
        v11->_bottomLegibilityGradientCornerRadius = 0.0;
        v11->_topLegibilityGradientCornerRadius = 0.0;
        v11->_solidLegibilityGradientCornerRadius = 0.0;
        uint64_t v97 = [objc_alloc((Class)off_1E5DA6358) initWithImageName:@"PXHeaderGradient"];
        legibilityGradientImageConfiguration = v11->_legibilityGradientImageConfiguration;
        v11->_legibilityGradientImageConfiguration = (PXExtendedImageConfiguration *)v97;

        [v137 peripheryInsets];
        if (v126)
        {
          BOOL v102 = v100 <= 40.0;
          if (v100 > 40.0) {
            double v100 = v100 + -5.0;
          }
          double v103 = v101 + -5.0;
          if (v102) {
            double v103 = v101;
          }
          if (v99 > 40.0) {
            double v99 = v99 + -9.0;
          }
          double v104 = 45.0;
          if (v136 != 1) {
            double v104 = 30.0;
          }
          double v105 = 57.0;
          if (v136 == 1) {
            double v105 = 56.0;
          }
          double v106 = 28.0;
          if (v136 == 1) {
            double v106 = 2.0;
          }
          double v107 = 16.0;
          if (v136 == 1) {
            double v107 = 1.0;
          }
          if (v128 != 1) {
            double v104 = v105;
          }
          v11->_distanceFromTopEdgeToTopButtonCenter = v104 + v99;
          if (v128 == 1) {
            double v108 = v106;
          }
          else {
            double v108 = v107;
          }
          double v109 = v108 + *v127;
          if (v100 < v103) {
            double v100 = v103;
          }
          double v110 = v100 + v109;
        }
        else
        {
          double v111 = 36.0;
          if (v136 == 1) {
            double v111 = 66.0;
          }
          if (v128 != 1) {
            double v111 = 45.0;
          }
          v11->_distanceFromTopEdgeToTopButtonCenter = v111;
          double v112 = *v127;
          if (v136 == 1) {
            double v110 = v112 + -15.0;
          }
          else {
            double v110 = v112 * 1.5;
          }
        }
        v11->_distanceFromLateralEdgesToTopButtonCenter = v110;
        [v134 tapNavigationAreaFraction];
        double v114 = v113;
        *(_OWORD *)&v11->_tapNavigationAreaInsets.double top = v129;
        *(_OWORD *)&v11->_tapNavigationAreaInsets.double bottom = v130;
        v11->_tapNavigationAreaInsets.double top = v11->_distanceFromTopEdgeToTopButtonCenter + v95->height * 0.5 + 20.0;
        v11->_tapNavigationAreaInsets.double bottom = v11->_chromeButtonPadding.height
                                             + v11->_chromeButtonPadding.height
                                             + 20.0;
        [v137 layoutReferenceSize];
        v11->_tapNavigationAreaWidth = v114 * v115;
        v116 = [v134 scrubberLayoutSettings];
        [v116 assetCornerRadius];
        v11->_scrubberAssetCornerRadius = v117;
        [v116 defaultAssetPadding];
        v11->_scrubberRegularAssetPadding = v118;
        [v116 currentAssetPadding];
        v11->_scrubberCurrentAssetPadding = v119;
        [v116 scrubberHeightPortrait];
        CGFloat v121 = v120;
        [v116 defaultAssetWidthPortrait];
        v11->_scrubberRegularAssetSize.double width = v122;
        v11->_scrubberRegularAssetSize.double height = v121;
        v11->_scrubberHorizontalLayoutMargin = 80.0;
        if ([v134 showMusicAndColorGradeEditor]) {
          [v134 showStyleSwitcher];
        }
        if (v11->_shouldHorizontallyCenterPlayButton)
        {
          *(_OWORD *)&v11->_scrubberFadeAreaInsets.double top = v129;
          *(_OWORD *)&v11->_scrubberFadeAreaInsets.double bottom = v130;
          id v123 = objc_alloc(MEMORY[0x1E4F28B18]);
          PXLocalizedStringFromTable(@"InteractiveMemoryUpNextTitle", @"PhotosUICore");
          objc_claimAutoreleasedReturnValue();
          uint64_t v140 = *MEMORY[0x1E4FB06F8];
          PXFontWithTextStyleSymbolicTraits();
        }
        PXEdgeInsetsMake();
      }
      if (v13 != 5) {
        goto LABEL_10;
      }
      char v18 = 0;
    }
    v11->_canShowCloseButton = 1;
    v11->_canShowMuteToggleButton = 1;
    v11->_canShowManagePhotosAction = 1;
    v11->_wantsEdgeTapToChangeCurrentSegment = v18;
    v11->_wantsSwipeDownGestureToDismiss = v18;
    goto LABEL_10;
  }
  v124 = (PXStoryConcreteViewLayoutSpec *)0;

  return v124;
}

id __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke(void *a1, void *a2, double a3)
{
  v16[3] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4FB0850];
  id v6 = a2;
  id v7 = a1;
  double v8 = [v5 defaultParagraphStyle];
  id v9 = (void *)[v8 mutableCopy];

  uint64_t v10 = [v6 textAlignment];
  [v9 setAlignment:v10];
  [v9 setLineBreakMode:0];
  [v9 setLineHeightMultiple:a3];
  v15[0] = *MEMORY[0x1E4FB0700];
  v11 = [MEMORY[0x1E4FB1618] whiteColor];
  v16[0] = v11;
  v15[1] = *MEMORY[0x1E4FB0738];
  double v12 = (void *)[v9 copy];
  v15[2] = *MEMORY[0x1E4FB06F8];
  v16[1] = v12;
  v16[2] = v7;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v13;
}

id __137__PXStoryConcreteViewLayoutSpec_initWithExtendedTraitCollection_options_storyConfigurationOptions_customGeneralChromeTitleConfiguration___block_invoke_2(void *a1, void *a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB0850];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 defaultParagraphStyle];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setAlignment:0];
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v14[0] = v4;
  uint64_t v9 = *MEMORY[0x1E4FB0738];
  v13[0] = v8;
  v13[1] = v9;
  uint64_t v10 = (void *)[v7 copy];
  v13[2] = *MEMORY[0x1E4FB06F8];
  v14[1] = v10;
  v14[2] = v5;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  return v11;
}

@end