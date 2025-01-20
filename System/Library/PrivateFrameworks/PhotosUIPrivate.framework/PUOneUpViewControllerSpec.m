@interface PUOneUpViewControllerSpec
- (BOOL)_isAssetExplorerReviewScreen;
- (BOOL)_shouldForceBlackBackground;
- (BOOL)allowAccessoryVisibility;
- (BOOL)allowProgrammaticNavBackButton;
- (BOOL)allowSuggestions;
- (BOOL)allowTapOnTitle;
- (BOOL)canDisplayLoadingIndicators;
- (BOOL)hideBadgesWhenShowingAccessoryView;
- (BOOL)hideNavigationBarWhenShowingAccessoryView;
- (BOOL)hideScrubberWhenShowingAccessoryView;
- (BOOL)hideStatusBarWhenShowingAccessoryView;
- (BOOL)isChromeVisible;
- (BOOL)isContentLocked;
- (BOOL)isInCompactLayoutStyle;
- (BOOL)isPresentedForPreview;
- (BOOL)isShowingPlayPauseButtonInBars;
- (BOOL)prefersFloatingInfoPanel;
- (BOOL)prefersSquareImageInDetails;
- (BOOL)shouldAutoplayOnAppear;
- (BOOL)shouldCounterrotateReviewScreenBars;
- (BOOL)shouldDisplayAssetExplorerReviewScreenBadges;
- (BOOL)shouldDisplayBadges;
- (BOOL)shouldDisplayBufferingIndicators;
- (BOOL)shouldDisplayEmptyPlaceholder;
- (BOOL)shouldDisplayPeopleRow;
- (BOOL)shouldDisplayPlayButtons;
- (BOOL)shouldDisplayProgressIndicators;
- (BOOL)shouldDisplayReviewScreenBars;
- (BOOL)shouldDisplaySelectionIndicators;
- (BOOL)shouldDisplaySyndicationAttribution;
- (BOOL)shouldLayoutReviewScreenControlBarVertically;
- (BOOL)shouldPinContentToTop;
- (BOOL)shouldPlaceButtonsInNavigationBar;
- (BOOL)shouldPlaceScrubberInScrubberBar;
- (BOOL)shouldShowCropButton;
- (BOOL)shouldShowTitleView;
- (BOOL)shouldUseCompactCommentsTitle;
- (BOOL)shouldUseCompactTitleView;
- (BOOL)shouldUseContentGuideInsets;
- (BOOL)shouldUseSpotlightStyling;
- (BOOL)shouldUseUserTransformTiles;
- (CGSize)assetExplorerReviewScreenProgressIndicatorSize;
- (CGSize)bufferingIndicatorSize;
- (CGSize)peopleRowSize;
- (CGSize)playButtonSize;
- (CGSize)progressIndicatorSize;
- (CGSize)renderIndicatorSize;
- (PUOneUpViewControllerSpec)initWithOptions:(unint64_t)a3;
- (PUOneUpViewControllerSpecChange)currentChange;
- (UIColor)backgroundColorOverride;
- (UIEdgeInsets)progressIndicatorContentInsets;
- (double)maximumAccessoryToolbarHeight;
- (double)maximumToolbarHeight;
- (id)newSpecChange;
- (id)spotlightBackgroundColor;
- (int64_t)tileInitialContentMode;
- (unint64_t)options;
- (void)_setBackgroundColorOverride:(id)a3;
- (void)_setBufferingIndicatorSize:(CGSize)a3;
- (void)_setCanDisplayLoadingIndicators:(BOOL)a3;
- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3;
- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3;
- (void)_setMaximumAccessoryToolbarHeight:(double)a3;
- (void)_setMaximumToolbarHeight:(double)a3;
- (void)_setPeopleRowSize:(CGSize)a3;
- (void)_setPrefersSquareImageInDetails:(BOOL)a3;
- (void)_setProgressIndicatorContentInsets:(UIEdgeInsets)a3;
- (void)_setProgressIndicatorSize:(CGSize)a3;
- (void)_setRenderIndicatorSize:(CGSize)a3;
- (void)_setShouldAutoplayOnAppear:(BOOL)a3;
- (void)_setShouldCounterrotateReviewScreenBars:(BOOL)a3;
- (void)_setShouldDisplayAssetExplorerReviewScreenBadges:(BOOL)a3;
- (void)_setShouldDisplayBadges:(BOOL)a3;
- (void)_setShouldDisplayBufferingIndicators:(BOOL)a3;
- (void)_setShouldDisplayEmptyPlaceholder:(BOOL)a3;
- (void)_setShouldDisplayPeopleRow:(BOOL)a3;
- (void)_setShouldDisplayPlayButtons:(BOOL)a3;
- (void)_setShouldDisplayProgressIndicators:(BOOL)a3;
- (void)_setShouldLayoutReviewScreenControlBarVertically:(BOOL)a3;
- (void)_setShouldPinContentToTop:(BOOL)a3;
- (void)_setShouldPlaceButtonsInNavigationBar:(BOOL)a3;
- (void)_setShouldPlaceScrubberInScrubberBar:(BOOL)a3;
- (void)_setShouldUseCompactCommentsTitle:(BOOL)a3;
- (void)_setShouldUseCompactTitleView:(BOOL)a3;
- (void)_setShouldUseContentGuideInsets:(BOOL)a3;
- (void)_setShouldUseUserTransformTiles:(BOOL)a3;
- (void)_setTileInitialContentMode:(int64_t)a3;
- (void)setChromeVisible:(BOOL)a3;
- (void)setContentLocked:(BOOL)a3;
- (void)setHideBadgesWhenShowingAccessoryView:(BOOL)a3;
- (void)setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3;
- (void)setHideScrubberWhenShowingAccessoryView:(BOOL)a3;
- (void)setHideStatusBarWhenShowingAccessoryView:(BOOL)a3;
- (void)setPrefersFloatingInfoPanel:(BOOL)a3;
- (void)setPrefersSquareImageInDetails:(BOOL)a3;
- (void)setPresentedForPreview:(BOOL)a3;
- (void)setShouldDisplayPeopleRow:(BOOL)a3;
- (void)setShouldDisplaySyndicationAttribution:(BOOL)a3;
- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3;
- (void)setShowingPlayPauseButtonInBars:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation PUOneUpViewControllerSpec

- (void).cxx_destruct
{
}

- (void)setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideBadgesWhenShowingAccessoryView = a3;
}

- (BOOL)hideBadgesWhenShowingAccessoryView
{
  return self->_hideBadgesWhenShowingAccessoryView;
}

- (void)setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideStatusBarWhenShowingAccessoryView = a3;
}

- (BOOL)hideStatusBarWhenShowingAccessoryView
{
  return self->_hideStatusBarWhenShowingAccessoryView;
}

- (void)setPrefersSquareImageInDetails:(BOOL)a3
{
  self->_prefersSquareImageInDetails = a3;
}

- (BOOL)prefersSquareImageInDetails
{
  return self->_prefersSquareImageInDetails;
}

- (BOOL)hideScrubberWhenShowingAccessoryView
{
  return self->_hideScrubberWhenShowingAccessoryView;
}

- (BOOL)hideNavigationBarWhenShowingAccessoryView
{
  return self->_hideNavigationBarWhenShowingAccessoryView;
}

- (void)setPrefersFloatingInfoPanel:(BOOL)a3
{
  self->_prefersFloatingInfoPanel = a3;
}

- (BOOL)prefersFloatingInfoPanel
{
  return self->_prefersFloatingInfoPanel;
}

- (BOOL)shouldDisplaySyndicationAttribution
{
  return self->_shouldDisplaySyndicationAttribution;
}

- (void)_setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  self->_shouldPlaceScrubberInScrubberBar = a3;
}

- (BOOL)shouldPlaceScrubberInScrubberBar
{
  return self->_shouldPlaceScrubberInScrubberBar;
}

- (BOOL)shouldLayoutReviewScreenControlBarVertically
{
  return self->_shouldLayoutReviewScreenControlBarVertically;
}

- (BOOL)shouldPinContentToTop
{
  return self->_shouldPinContentToTop;
}

- (BOOL)shouldCounterrotateReviewScreenBars
{
  return self->_shouldCounterrotateReviewScreenBars;
}

- (int64_t)tileInitialContentMode
{
  return self->_tileInitialContentMode;
}

- (BOOL)shouldUseCompactCommentsTitle
{
  return self->_shouldUseCompactCommentsTitle;
}

- (CGSize)renderIndicatorSize
{
  double width = self->_renderIndicatorSize.width;
  double height = self->_renderIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)bufferingIndicatorSize
{
  double width = self->_bufferingIndicatorSize.width;
  double height = self->_bufferingIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIEdgeInsets)progressIndicatorContentInsets
{
  double top = self->_progressIndicatorContentInsets.top;
  double left = self->_progressIndicatorContentInsets.left;
  double bottom = self->_progressIndicatorContentInsets.bottom;
  double right = self->_progressIndicatorContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)peopleRowSize
{
  double width = self->_peopleRowSize.width;
  double height = self->_peopleRowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)progressIndicatorSize
{
  double width = self->_progressIndicatorSize.width;
  double height = self->_progressIndicatorSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIColor)backgroundColorOverride
{
  return self->_backgroundColorOverride;
}

- (BOOL)shouldDisplayEmptyPlaceholder
{
  return self->_shouldDisplayEmptyPlaceholder;
}

- (BOOL)canDisplayLoadingIndicators
{
  return self->_canDisplayLoadingIndicators;
}

- (BOOL)shouldDisplayBufferingIndicators
{
  return self->_shouldDisplayBufferingIndicators;
}

- (BOOL)shouldAutoplayOnAppear
{
  return self->_shouldAutoplayOnAppear;
}

- (BOOL)shouldDisplayProgressIndicators
{
  return self->_shouldDisplayProgressIndicators;
}

- (BOOL)shouldDisplayPlayButtons
{
  return self->_shouldDisplayPlayButtons;
}

- (BOOL)shouldDisplayAssetExplorerReviewScreenBadges
{
  return self->_shouldDisplayAssetExplorerReviewScreenBadges;
}

- (BOOL)shouldDisplayBadges
{
  return self->_shouldDisplayBadges;
}

- (BOOL)shouldUseUserTransformTiles
{
  return self->_shouldUseUserTransformTiles;
}

- (BOOL)shouldUseContentGuideInsets
{
  return self->_shouldUseContentGuideInsets;
}

- (void)_setMaximumAccessoryToolbarHeight:(double)a3
{
  self->_maximumAccessoryToolbarHeight = a3;
}

- (double)maximumAccessoryToolbarHeight
{
  return self->_maximumAccessoryToolbarHeight;
}

- (void)_setMaximumToolbarHeight:(double)a3
{
  self->_maximumToolbarHeight = a3;
}

- (double)maximumToolbarHeight
{
  return self->_maximumToolbarHeight;
}

- (BOOL)shouldUseCompactTitleView
{
  return self->_shouldUseCompactTitleView;
}

- (BOOL)shouldPlaceButtonsInNavigationBar
{
  return self->_shouldPlaceButtonsInNavigationBar;
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)shouldDisplayPeopleRow
{
  return self->_shouldDisplayPeopleRow;
}

- (BOOL)isShowingPlayPauseButtonInBars
{
  return self->_isShowingPlayPauseButtonInBars;
}

- (BOOL)isPresentedForPreview
{
  return self->_isPresentedForPreview;
}

- (BOOL)isContentLocked
{
  return self->_isContentLocked;
}

- (BOOL)isChromeVisible
{
  return self->_isChromeVisible;
}

- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_hideBadgesWhenShowingAccessoryView != v3)
  {
    self->_hideBadgesWhenShowingAccessoryView = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setHideBadgesWhenShowingAccessoryView:1];
  }
}

- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_hideStatusBarWhenShowingAccessoryView != v3)
  {
    self->_hideStatusBarWhenShowingAccessoryView = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setHideStatusBarWhenShowingAccessoryView:1];
  }
}

- (void)_setPrefersSquareImageInDetails:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_prefersSquareImageInDetails != v3)
  {
    self->_prefersSquareImageInDetails = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setPrefersSquareImageInDetails:1];
  }
}

- (void)setHideScrubberWhenShowingAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_hideScrubberWhenShowingAccessoryView != v3)
  {
    self->_hideScrubberWhenShowingAccessoryView = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setHideScrubberWhenShowingAccessoryView:1];
  }
}

- (void)setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_hideNavigationBarWhenShowingAccessoryView != v3)
  {
    self->_hideNavigationBarWhenShowingAccessoryView = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setHideNavigationBarWhenShowingAccessoryView:1];
  }
}

- (void)setShouldDisplaySyndicationAttribution:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplaySyndicationAttribution != v3)
  {
    self->_shouldDisplaySyndicationAttribution = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplaySyndicationAttribution:1];
  }
}

- (void)setShouldPlaceScrubberInScrubberBar:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldPlaceScrubberInScrubberBar != v3)
  {
    self->_shouldPlaceScrubberInScrubberBar = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldPlaceScrubberInScrubberBarChanged:1];
  }
}

- (void)_setShouldLayoutReviewScreenControlBarVertically:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldLayoutReviewScreenControlBarVertically != v3)
  {
    self->_shouldLayoutReviewScreenControlBarVertically = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldLayoutReviewScreenControlBarVerticallyChanged:1];
  }
}

- (void)_setShouldPinContentToTop:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldPinContentToTop != v3)
  {
    self->_shouldPinContentToTop = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldPinContentToTopChanged:1];
  }
}

- (void)_setShouldCounterrotateReviewScreenBars:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldCounterrotateReviewScreenBars != v3)
  {
    self->_shouldCounterrotateReviewScreenBars = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldCounterrotateReviewScreenBarsChanged:1];
  }
}

- (void)_setTileInitialContentMode:(int64_t)a3
{
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_tileInitialContentMode != a3)
  {
    self->_tileInitialContentMode = a3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setTileInitialContentModeChanged:1];
  }
}

- (void)_setShouldUseCompactCommentsTitle:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldUseCompactCommentsTitle != v3)
  {
    self->_shouldUseCompactCommentsTitle = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldUseCompactCommentsTitleChanged:1];
  }
}

- (void)_setBufferingIndicatorSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_bufferingIndicatorSize.width || height != self->_bufferingIndicatorSize.height)
  {
    self->_bufferingIndicatorSize.double width = width;
    self->_bufferingIndicatorSize.double height = height;
    id v7 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v7 _setBufferingIndicatorSizeChanged:1];
  }
}

- (void)_setRenderIndicatorSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_renderIndicatorSize.width || height != self->_renderIndicatorSize.height)
  {
    self->_renderIndicatorSize.double width = width;
    self->_renderIndicatorSize.double height = height;
    id v7 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v7 _setRenderIndicatorSizeChanged:1];
  }
}

- (void)_setProgressIndicatorContentInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (left != self->_progressIndicatorContentInsets.left
    || top != self->_progressIndicatorContentInsets.top
    || right != self->_progressIndicatorContentInsets.right
    || bottom != self->_progressIndicatorContentInsets.bottom)
  {
    self->_progressIndicatorContentInsets.double top = top;
    self->_progressIndicatorContentInsets.double left = left;
    self->_progressIndicatorContentInsets.double bottom = bottom;
    self->_progressIndicatorContentInsets.double right = right;
    id v11 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v11 _setProgressIndicatorContentInsetsChanged:1];
  }
}

- (void)_setPeopleRowSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_peopleRowSize.width || height != self->_peopleRowSize.height)
  {
    self->_peopleRowSize.double width = width;
    self->_peopleRowSize.double height = height;
    id v7 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v7 _setPeopleRowSizeChanged:1];
  }
}

- (void)_setProgressIndicatorSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (width != self->_progressIndicatorSize.width || height != self->_progressIndicatorSize.height)
  {
    self->_progressIndicatorSize.double width = width;
    self->_progressIndicatorSize.double height = height;
    id v7 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v7 _setProgressIndicatorSizeChanged:1];
  }
}

- (void)_setBackgroundColorOverride:(id)a3
{
  v8 = (UIColor *)a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  id v5 = v8;
  if (self->_backgroundColorOverride != v8)
  {
    char v6 = -[UIColor isEqual:](v8, "isEqual:");
    id v5 = v8;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_backgroundColorOverride, a3);
      id v7 = [(PUOneUpViewControllerSpec *)self currentChange];
      [v7 _setBackgroundColorOverrideChanged:1];

      id v5 = v8;
    }
  }
}

- (void)_setShouldDisplayEmptyPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayEmptyPlaceholder != v3)
  {
    self->_shouldDisplayEmptyPlaceholder = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayEmptyPlaceholderChanged:1];
  }
}

- (void)_setCanDisplayLoadingIndicators:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_canDisplayLoadingIndicators != v3)
  {
    self->_canDisplayLoadingIndicators = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setCanDisplayLoadingIndicatorsChanged:1];
  }
}

- (void)_setShouldDisplayBufferingIndicators:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayBufferingIndicators != v3)
  {
    self->_shouldDisplayBufferingIndicators = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayBufferingIndicatorsChanged:1];
  }
}

- (void)_setShouldDisplayPeopleRow:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayPeopleRow != v3)
  {
    self->_shouldDisplayPeopleRow = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayPeopleRowChanged:1];
  }
}

- (void)_setShouldDisplayProgressIndicators:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayProgressIndicators != v3)
  {
    self->_shouldDisplayProgressIndicators = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayProgressIndicatorsChanged:1];
  }
}

- (void)_setShouldDisplayPlayButtons:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayPlayButtons != v3)
  {
    self->_shouldDisplayPlayButtons = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayPlayButtonsChanged:1];
  }
}

- (void)_setShouldDisplayAssetExplorerReviewScreenBadges:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayAssetExplorerReviewScreenBadges != v3)
  {
    self->_shouldDisplayAssetExplorerReviewScreenBadges = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayAssetExplorerReviewScreenBadgesChanged:1];
  }
}

- (void)_setShouldDisplayBadges:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayBadges != v3)
  {
    self->_shouldDisplayBadges = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayBadgesChanged:1];
  }
}

- (void)_setShouldAutoplayOnAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldAutoplayOnAppear != v3)
  {
    self->_shouldAutoplayOnAppear = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldAutoplayOnAppearChanged:1];
  }
}

- (void)_setShouldUseUserTransformTiles:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldUseUserTransformTiles != v3)
  {
    self->_shouldUseUserTransformTiles = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldUseUserTransformTilesChanged:1];
  }
}

- (void)_setShouldUseContentGuideInsets:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldUseContentGuideInsets != v3)
  {
    self->_shouldUseContentGuideInsets = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldUseContentGuideInsetsChanged:1];
  }
}

- (void)_setShouldUseCompactTitleView:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldUseCompactTitleView != v3)
  {
    self->_shouldUseCompactTitleView = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldUseCompactTitleViewChanged:1];
  }
}

- (void)_setShouldPlaceButtonsInNavigationBar:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldPlaceButtonsInNavigationBar != v3)
  {
    self->_shouldPlaceButtonsInNavigationBar = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldPlaceButtonsInNavigationBarChanged:1];
  }
}

- (CGSize)playButtonSize
{
  +[PUPlayButtonTileViewController playButtonTileSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)updateIfNeeded
{
  v93.receiver = self;
  v93.super_class = (Class)PUOneUpViewControllerSpec;
  [(PUViewControllerSpec *)&v93 updateIfNeeded];
  if (![(PUViewControllerSpec *)self currentLayoutStyle]) {
    return;
  }
  [(PUViewControllerSpec *)self layoutReferenceSize];
  double v4 = v3;
  double v6 = v5;
  int64_t v7 = [(PUViewControllerSpec *)self currentLayoutStyle];
  if (v4 <= v6) {
    int v8 = 0;
  }
  else {
    int v8 = ![(PUOneUpViewControllerSpec *)self isPresentedForPreview];
  }
  CGFloat v9 = *MEMORY[0x1E4F1DAD8];
  CGFloat v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v11 = PURectWithAspectRatioFittingRect(0.75, *MEMORY[0x1E4F1DAD8], v10, v4, v6);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v94.origin.x = v9;
  v94.origin.y = v10;
  v94.size.double width = v4;
  v94.size.double height = v6;
  double MaxY = CGRectGetMaxY(v94);
  v95.origin.x = v11;
  v95.origin.y = v13;
  v95.size.double width = v15;
  v95.size.double height = v17;
  double v19 = round(MaxY - CGRectGetMaxY(v95));
  if (v19 >= 84.0) {
    double v20 = v19;
  }
  else {
    double v20 = 84.0;
  }
  if ((unint64_t)(v7 - 1) >= 3)
  {
    if (v7 == 4) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 0;
    }
    int v8 = 0;
    BOOL v22 = v7 == 4;
  }
  else
  {
    uint64_t v21 = 1;
    BOOL v22 = v8;
  }
  BOOL v90 = v22;
  unsigned int v91 = v8;
  int64_t v82 = v7;
  if ([(PUOneUpViewControllerSpec *)self shouldDisplayReviewScreenBars])
  {
    uint64_t v23 = PUReviewScreenSizeClassForReferenceSize(v4, v6);
    LODWORD(v78) = v23 != 7;
    HIDWORD(v78) = v23 == 7;
  }
  else
  {
    uint64_t v78 = 0;
  }
  BOOL v24 = [(PUOneUpViewControllerSpec *)self isPresentedForPreview];
  BOOL v25 = [(PUOneUpViewControllerSpec *)self isChromeVisible];
  BOOL v26 = [(PUViewControllerSpec *)self isPresentedForSecondScreen];
  BOOL v27 = [(PUOneUpViewControllerSpec *)self _isAssetExplorerReviewScreen];
  BOOL v28 = [(PUOneUpViewControllerSpec *)self isShowingPlayPauseButtonInBars];
  BOOL v29 = [(PUOneUpViewControllerSpec *)self isContentLocked];
  int v30 = v25 && ~v24;
  v31 = +[PUOneUpSettings sharedInstance];
  int v32 = [MEMORY[0x1E4F90300] isOneUpRefreshEnabled];
  unsigned int v92 = v30;
  unsigned int v89 = v30 & (!v24 && !v26);
  if (v26)
  {
    uint64_t v74 = 0;
    unsigned int v76 = !v27;
    unsigned int v77 = 0;
    int v33 = v30;
    v34 = v31;
  }
  else
  {
    unsigned int v35 = [v31 allowUserTransform];
    char v36 = v30 ^ 1;
    unsigned int v77 = v35;
    if ((v32 | v30 ^ 1 | v27))
    {
      LODWORD(v74) = 0;
    }
    else
    {
      LODWORD(v74) = [v31 allowBadges];
      char v36 = 0;
    }
    v34 = v31;
    if ((v36 & 1) != 0 || !v27)
    {
      HIDWORD(v74) = 0;
      unsigned int v76 = !v27;
    }
    else
    {
      unint64_t options = self->_options;
      int v38 = [v31 allowBadges];
      if ((options & 0x80000) != 0) {
        int v39 = 0;
      }
      else {
        int v39 = v38;
      }
      HIDWORD(v74) = v39;
      unsigned int v76 = 0;
    }
    int v33 = v92;
  }
  BOOL v40 = v32 | v26 | v24;
  int v41 = objc_msgSend(v34, "allowPlayButtonInBars", v74);
  int v42 = v40 | v28 & v33;
  if (!v41) {
    int v42 = v40;
  }
  unsigned int v84 = v42 ^ 1;
  BOOL v85 = [(PUOneUpViewControllerSpec *)self shouldDisplayPeopleRow];
  v43 = [(PUViewControllerSpec *)self traitCollection];
  +[PUPeopleTileViewController tileSizeForTraitCollection:v43];
  double v45 = v44;
  double v47 = v46;

  BOOL v48 = !v26;
  [v34 minimumFullCommentTitleViewWidth];
  double v50 = v49;
  uint64_t v51 = v24 & !v29;
  BOOL v88 = v82 == 4;
  double v86 = v47;
  double v87 = v45;
  if ([(PUOneUpViewControllerSpec *)self _shouldForceBlackBackground])
  {
    uint64_t v52 = [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    if (![(PUOneUpViewControllerSpec *)self shouldUseSpotlightStyling])
    {
      v53 = 0;
      goto LABEL_38;
    }
    uint64_t v52 = [(PUOneUpViewControllerSpec *)self spotlightBackgroundColor];
  }
  v53 = (void *)v52;
LABEL_38:
  BOOL v54 = v82 != 4;
  BOOL v83 = v4 < v50;
  +[PUProgressIndicatorTileViewController progressIndicatorTileSizeForSizeClass:v21];
  double v56 = v55;
  double v58 = v57;
  +[PUProgressIndicatorTileViewController progressIndicatorIconInsetsForSizeClass:v21];
  double v80 = v60;
  double v81 = v59;
  double v79 = v61;
  double v63 = v62;
  +[PUBufferingIndicatorTileViewController bufferingIndicatorTileSize];
  double v65 = v64;
  double v67 = v66;
  +[PURenderIndicatorTileViewController renderIndicatorTileSizeForSizeClass:v21];
  double v69 = v68;
  double v71 = v70;
  uint64_t v72 = 2;
  if (!v24) {
    uint64_t v72 = 0;
  }
  if (v26) {
    uint64_t v73 = 1;
  }
  else {
    uint64_t v73 = v72;
  }
  [(PUOneUpViewControllerSpec *)self _setShouldAutoplayOnAppear:v51];
  [(PUOneUpViewControllerSpec *)self _setShouldPlaceButtonsInNavigationBar:v90];
  [(PUOneUpViewControllerSpec *)self _setShouldUseCompactTitleView:v91];
  [(PUOneUpViewControllerSpec *)self _setMaximumToolbarHeight:v20];
  [(PUOneUpViewControllerSpec *)self _setMaximumAccessoryToolbarHeight:44.0];
  [(PUOneUpViewControllerSpec *)self _setShouldUseContentGuideInsets:v89];
  [(PUOneUpViewControllerSpec *)self _setShouldUseUserTransformTiles:v77];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayBadges:v75];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayAssetExplorerReviewScreenBadges:HIDWORD(v75)];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayPlayButtons:v84];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayProgressIndicators:v76];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayPeopleRow:v85];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayBufferingIndicators:1];
  [(PUOneUpViewControllerSpec *)self _setCanDisplayLoadingIndicators:v48];
  [(PUOneUpViewControllerSpec *)self _setShouldDisplayEmptyPlaceholder:v48];
  [(PUOneUpViewControllerSpec *)self _setBackgroundColorOverride:v53];
  -[PUOneUpViewControllerSpec _setProgressIndicatorSize:](self, "_setProgressIndicatorSize:", v56, v58);
  -[PUOneUpViewControllerSpec _setPeopleRowSize:](self, "_setPeopleRowSize:", v87, v86);
  -[PUOneUpViewControllerSpec _setProgressIndicatorContentInsets:](self, "_setProgressIndicatorContentInsets:", v81, v80, v79, v63);
  -[PUOneUpViewControllerSpec _setBufferingIndicatorSize:](self, "_setBufferingIndicatorSize:", v65, v67);
  -[PUOneUpViewControllerSpec _setRenderIndicatorSize:](self, "_setRenderIndicatorSize:", v69, v71);
  [(PUOneUpViewControllerSpec *)self _setShouldUseCompactCommentsTitle:v83];
  [(PUOneUpViewControllerSpec *)self _setTileInitialContentMode:v73];
  [(PUOneUpViewControllerSpec *)self _setShouldCounterrotateReviewScreenBars:v78];
  [(PUOneUpViewControllerSpec *)self _setShouldPinContentToTop:v24];
  [(PUOneUpViewControllerSpec *)self _setShouldLayoutReviewScreenControlBarVertically:HIDWORD(v78)];
  [(PUOneUpViewControllerSpec *)self _setShouldPlaceScrubberInScrubberBar:HIDWORD(v78)];
  [(PUOneUpViewControllerSpec *)self setShouldDisplaySyndicationAttribution:v92];
  [(PUOneUpViewControllerSpec *)self setPrefersFloatingInfoPanel:v88];
  [(PUOneUpViewControllerSpec *)self setHideNavigationBarWhenShowingAccessoryView:v54];
  [(PUOneUpViewControllerSpec *)self setHideScrubberWhenShowingAccessoryView:v54];
  [(PUOneUpViewControllerSpec *)self setPrefersSquareImageInDetails:v54];
  [(PUOneUpViewControllerSpec *)self setHideStatusBarWhenShowingAccessoryView:v54];
  [(PUOneUpViewControllerSpec *)self setHideBadgesWhenShowingAccessoryView:v54];
}

- (void)setShouldDisplayPeopleRow:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_shouldDisplayPeopleRow != v3)
  {
    self->_shouldDisplayPeopleRow = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setShouldDisplayPeopleRowChanged:1];
  }
}

- (void)setContentLocked:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_isContentLocked != v3)
  {
    self->_isContentLocked = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setContentLockingChanged:1];
  }
}

- (void)setShowingPlayPauseButtonInBars:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_isShowingPlayPauseButtonInBars != v3) {
    self->_isShowingPlayPauseButtonInBars = v3;
  }
}

- (void)setPresentedForPreview:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_isPresentedForPreview != v3)
  {
    self->_isPresentedForPreview = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setPresentedForPreviewChanged:1];
  }
}

- (void)setChromeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(PUViewControllerSpec *)self assertInsideChangesBlock];
  if (self->_isChromeVisible != v3)
  {
    self->_isChromeVisible = v3;
    id v5 = [(PUOneUpViewControllerSpec *)self currentChange];
    [v5 _setChromeVisibilityChanged:1];
  }
}

- (BOOL)shouldShowCropButton
{
  if ((PLIsCamera() & 1) != 0 || (int v3 = PLIsMobileSlideShow()) != 0)
  {
    if ([(PUOneUpViewControllerSpec *)self isPresentedForPreview]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PUViewControllerSpec *)self isPresentedForSecondScreen];
    }
  }
  return v3;
}

- (BOOL)isInCompactLayoutStyle
{
  return (unint64_t)([(PUViewControllerSpec *)self currentLayoutStyle] - 1) < 3;
}

- (id)spotlightBackgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] clearColor];
}

- (BOOL)shouldUseSpotlightStyling
{
  return ([(PUOneUpViewControllerSpec *)self options] >> 16) & 1;
}

- (BOOL)_shouldForceBlackBackground
{
  return ([(PUOneUpViewControllerSpec *)self options] >> 9) & 1;
}

- (BOOL)shouldDisplayReviewScreenBars
{
  return ([(PUOneUpViewControllerSpec *)self options] >> 8) & 1;
}

- (CGSize)assetExplorerReviewScreenProgressIndicatorSize
{
  +[PUAssetExplorerReviewScreenProgressIndicatorTileViewController progressIndicatorTileSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)shouldDisplaySelectionIndicators
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (BOOL)shouldShowTitleView
{
  return 1;
}

- (BOOL)allowTapOnTitle
{
  return ![(PUOneUpViewControllerSpec *)self _isAssetExplorerReviewScreen];
}

- (BOOL)allowProgrammaticNavBackButton
{
  return ![(PUOneUpViewControllerSpec *)self _isAssetExplorerReviewScreen];
}

- (BOOL)allowSuggestions
{
  return (self->_options & 0x80) == 0;
}

- (BOOL)allowAccessoryVisibility
{
  return (self->_options & 0x40) == 0;
}

- (BOOL)_isAssetExplorerReviewScreen
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (PUOneUpViewControllerSpecChange)currentChange
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerSpec;
  double v2 = [(PUViewControllerSpec *)&v4 currentChange];
  return (PUOneUpViewControllerSpecChange *)v2;
}

- (id)newSpecChange
{
  return objc_alloc_init(PUOneUpViewControllerSpecChange);
}

- (PUOneUpViewControllerSpec)initWithOptions:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUOneUpViewControllerSpec;
  objc_super v4 = [(PUViewControllerSpec *)&v8 init];
  id v5 = v4;
  if (v4)
  {
    v4->_unint64_t options = a3;
    double v6 = v4;
  }

  return v5;
}

@end