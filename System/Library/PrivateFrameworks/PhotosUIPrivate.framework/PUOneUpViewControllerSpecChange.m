@interface PUOneUpViewControllerSpecChange
- (BOOL)backgroundColorOverrideChanged;
- (BOOL)bufferingIndicatorSizeChanged;
- (BOOL)canDisplayLoadingIndicatorsChanged;
- (BOOL)changed;
- (BOOL)chromeVisibilityChanged;
- (BOOL)contentLockingChanged;
- (BOOL)hideBadgesWhenShowingAccessoryView;
- (BOOL)hideNavigationBarWhenShowingAccessoryView;
- (BOOL)hideScrubberWhenShowingAccessoryView;
- (BOOL)hideStatusBarWhenShowingAccessoryView;
- (BOOL)maximumAccessoryToolbarHeightChanged;
- (BOOL)maximumToolbarHeightChanged;
- (BOOL)peopleRowSizeChanged;
- (BOOL)prefersSquareImageInDetails;
- (BOOL)presentedForPreviewChanged;
- (BOOL)progressIndicatorContentInsetsChanged;
- (BOOL)progressIndicatorSizeChanged;
- (BOOL)renderIndicatorSizeChanged;
- (BOOL)shouldAutoplayOnAppearChanged;
- (BOOL)shouldCounterrotateReviewScreenBarsChanged;
- (BOOL)shouldDisplayAssetExplorerReviewScreenBadgesChanged;
- (BOOL)shouldDisplayBadgesChanged;
- (BOOL)shouldDisplayBufferingIndicatorsChanged;
- (BOOL)shouldDisplayEmptyPlaceholderChanged;
- (BOOL)shouldDisplayPeopleRowChanged;
- (BOOL)shouldDisplayPlayButtonsChanged;
- (BOOL)shouldDisplayProgressIndicatorsChanged;
- (BOOL)shouldDisplaySyndicationAttribution;
- (BOOL)shouldLayoutReviewScreenControlBarVerticallyChanged;
- (BOOL)shouldPinContentToTopChanged;
- (BOOL)shouldPlaceButtonsInNavigationBarChanged;
- (BOOL)shouldPlaceScrubberInScrubberBarChanged;
- (BOOL)shouldUseCompactCommentsTitleChanged;
- (BOOL)shouldUseCompactTitleViewChanged;
- (BOOL)shouldUseContentGuideInsetsChanged;
- (BOOL)shouldUseUserTransformTilesChanged;
- (BOOL)tileInitialContentModeChanged;
- (void)_setBackgroundColorOverrideChanged:(BOOL)a3;
- (void)_setBufferingIndicatorSizeChanged:(BOOL)a3;
- (void)_setCanDisplayLoadingIndicatorsChanged:(BOOL)a3;
- (void)_setChromeVisibilityChanged:(BOOL)a3;
- (void)_setContentLockingChanged:(BOOL)a3;
- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3;
- (void)_setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3;
- (void)_setHideScrubberWhenShowingAccessoryView:(BOOL)a3;
- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3;
- (void)_setMaximumAccessoryToolbarHeightChanged:(BOOL)a3;
- (void)_setMaximumToolbarHeightChanged:(BOOL)a3;
- (void)_setPeopleRowSizeChanged:(BOOL)a3;
- (void)_setPrefersSquareImageInDetails:(BOOL)a3;
- (void)_setPresentedForPreviewChanged:(BOOL)a3;
- (void)_setProgressIndicatorContentInsetsChanged:(BOOL)a3;
- (void)_setProgressIndicatorSizeChanged:(BOOL)a3;
- (void)_setRenderIndicatorSizeChanged:(BOOL)a3;
- (void)_setShouldAutoplayOnAppearChanged:(BOOL)a3;
- (void)_setShouldCounterrotateReviewScreenBarsChanged:(BOOL)a3;
- (void)_setShouldDisplayAssetExplorerReviewScreenBadgesChanged:(BOOL)a3;
- (void)_setShouldDisplayBadgesChanged:(BOOL)a3;
- (void)_setShouldDisplayBufferingIndicatorsChanged:(BOOL)a3;
- (void)_setShouldDisplayEmptyPlaceholderChanged:(BOOL)a3;
- (void)_setShouldDisplayPeopleRowChanged:(BOOL)a3;
- (void)_setShouldDisplayPlayButtonsChanged:(BOOL)a3;
- (void)_setShouldDisplayProgressIndicatorsChanged:(BOOL)a3;
- (void)_setShouldDisplaySyndicationAttribution:(BOOL)a3;
- (void)_setShouldLayoutReviewScreenControlBarVerticallyChanged:(BOOL)a3;
- (void)_setShouldPinContentToTopChanged:(BOOL)a3;
- (void)_setShouldPlaceButtonsInNavigationBarChanged:(BOOL)a3;
- (void)_setShouldPlaceScrubberInScrubberBarChanged:(BOOL)a3;
- (void)_setShouldUseCompactCommentsTitleChanged:(BOOL)a3;
- (void)_setShouldUseCompactTitleViewChanged:(BOOL)a3;
- (void)_setShouldUseContentGuideInsetsChanged:(BOOL)a3;
- (void)_setShouldUseUserTransformTilesChanged:(BOOL)a3;
- (void)_setTileInitialContentModeChanged:(BOOL)a3;
@end

@implementation PUOneUpViewControllerSpecChange

- (void)_setShouldDisplaySyndicationAttribution:(BOOL)a3
{
  self->_hideBadgesWhenShowingAccessoryView = a3;
}

- (BOOL)shouldDisplaySyndicationAttribution
{
  return self->_hideBadgesWhenShowingAccessoryView;
}

- (void)_setPeopleRowSizeChanged:(BOOL)a3
{
  self->_hideStatusBarWhenShowingAccessoryView = a3;
}

- (BOOL)peopleRowSizeChanged
{
  return self->_hideStatusBarWhenShowingAccessoryView;
}

- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  self->_prefersSquareImageInDetails = a3;
}

- (BOOL)hideBadgesWhenShowingAccessoryView
{
  return self->_prefersSquareImageInDetails;
}

- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideScrubberWhenShowingAccessoryView = a3;
}

- (BOOL)hideStatusBarWhenShowingAccessoryView
{
  return self->_hideScrubberWhenShowingAccessoryView;
}

- (void)_setPrefersSquareImageInDetails:(BOOL)a3
{
  self->_hideNavigationBarWhenShowingAccessoryView = a3;
}

- (BOOL)prefersSquareImageInDetails
{
  return self->_hideNavigationBarWhenShowingAccessoryView;
}

- (void)_setHideScrubberWhenShowingAccessoryView:(BOOL)a3
{
  self->_shouldPlaceScrubberInScrubberBarChanged = a3;
}

- (BOOL)hideScrubberWhenShowingAccessoryView
{
  return self->_shouldPlaceScrubberInScrubberBarChanged;
}

- (void)_setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_shouldLayoutReviewScreenControlBarVerticallyChanged = a3;
}

- (BOOL)hideNavigationBarWhenShowingAccessoryView
{
  return self->_shouldLayoutReviewScreenControlBarVerticallyChanged;
}

- (void)_setShouldPlaceScrubberInScrubberBarChanged:(BOOL)a3
{
  self->_shouldPinContentToTopChanged = a3;
}

- (BOOL)shouldPlaceScrubberInScrubberBarChanged
{
  return self->_shouldPinContentToTopChanged;
}

- (void)_setShouldLayoutReviewScreenControlBarVerticallyChanged:(BOOL)a3
{
  self->_shouldCounterrotateReviewScreenBarsChanged = a3;
}

- (BOOL)shouldLayoutReviewScreenControlBarVerticallyChanged
{
  return self->_shouldCounterrotateReviewScreenBarsChanged;
}

- (void)_setShouldPinContentToTopChanged:(BOOL)a3
{
  self->_tileInitialContentModeChanged = a3;
}

- (BOOL)shouldPinContentToTopChanged
{
  return self->_tileInitialContentModeChanged;
}

- (void)_setShouldCounterrotateReviewScreenBarsChanged:(BOOL)a3
{
  self->_shouldUseCompactCommentsTitleChanged = a3;
}

- (BOOL)shouldCounterrotateReviewScreenBarsChanged
{
  return self->_shouldUseCompactCommentsTitleChanged;
}

- (void)_setTileInitialContentModeChanged:(BOOL)a3
{
  self->_renderIndicatorSizeChanged = a3;
}

- (BOOL)tileInitialContentModeChanged
{
  return self->_renderIndicatorSizeChanged;
}

- (void)_setShouldUseCompactCommentsTitleChanged:(BOOL)a3
{
  self->_bufferingIndicatorSizeChanged = a3;
}

- (BOOL)shouldUseCompactCommentsTitleChanged
{
  return self->_bufferingIndicatorSizeChanged;
}

- (void)_setRenderIndicatorSizeChanged:(BOOL)a3
{
  self->_progressIndicatorContentInsetsChanged = a3;
}

- (BOOL)renderIndicatorSizeChanged
{
  return self->_progressIndicatorContentInsetsChanged;
}

- (void)_setBufferingIndicatorSizeChanged:(BOOL)a3
{
  self->_progressIndicatorSizeChanged = a3;
}

- (BOOL)bufferingIndicatorSizeChanged
{
  return self->_progressIndicatorSizeChanged;
}

- (void)_setProgressIndicatorContentInsetsChanged:(BOOL)a3
{
  self->_backgroundColorOverrideChanged = a3;
}

- (BOOL)progressIndicatorContentInsetsChanged
{
  return self->_backgroundColorOverrideChanged;
}

- (void)_setProgressIndicatorSizeChanged:(BOOL)a3
{
  self->_canDisplayLoadingIndicatorsChanged = a3;
}

- (BOOL)progressIndicatorSizeChanged
{
  return self->_canDisplayLoadingIndicatorsChanged;
}

- (void)_setBackgroundColorOverrideChanged:(BOOL)a3
{
  self->_shouldDisplayBufferingIndicatorsChanged = a3;
}

- (BOOL)backgroundColorOverrideChanged
{
  return self->_shouldDisplayBufferingIndicatorsChanged;
}

- (void)_setCanDisplayLoadingIndicatorsChanged:(BOOL)a3
{
  self->_shouldDisplayEmptyPlaceholderChanged = a3;
}

- (BOOL)canDisplayLoadingIndicatorsChanged
{
  return self->_shouldDisplayEmptyPlaceholderChanged;
}

- (void)_setShouldDisplayBufferingIndicatorsChanged:(BOOL)a3
{
  self->_shouldAutoplayOnAppearChanged = a3;
}

- (BOOL)shouldDisplayBufferingIndicatorsChanged
{
  return self->_shouldAutoplayOnAppearChanged;
}

- (void)_setShouldDisplayEmptyPlaceholderChanged:(BOOL)a3
{
  self->_shouldDisplayPeopleRowChanged = a3;
}

- (BOOL)shouldDisplayEmptyPlaceholderChanged
{
  return self->_shouldDisplayPeopleRowChanged;
}

- (void)_setShouldAutoplayOnAppearChanged:(BOOL)a3
{
  self->_shouldDisplayProgressIndicatorsChanged = a3;
}

- (BOOL)shouldAutoplayOnAppearChanged
{
  return self->_shouldDisplayProgressIndicatorsChanged;
}

- (void)_setShouldDisplayPeopleRowChanged:(BOOL)a3
{
  self->_shouldDisplayPlayButtonsChanged = a3;
}

- (BOOL)shouldDisplayPeopleRowChanged
{
  return self->_shouldDisplayPlayButtonsChanged;
}

- (void)_setShouldDisplayProgressIndicatorsChanged:(BOOL)a3
{
  self->_shouldDisplayAssetExplorerReviewScreenBadgesChanged = a3;
}

- (BOOL)shouldDisplayProgressIndicatorsChanged
{
  return self->_shouldDisplayAssetExplorerReviewScreenBadgesChanged;
}

- (void)_setShouldDisplayPlayButtonsChanged:(BOOL)a3
{
  self->_shouldDisplayBadgesChanged = a3;
}

- (BOOL)shouldDisplayPlayButtonsChanged
{
  return self->_shouldDisplayBadgesChanged;
}

- (void)_setShouldDisplayAssetExplorerReviewScreenBadgesChanged:(BOOL)a3
{
  self->_shouldUseUserTransformTilesChanged = a3;
}

- (BOOL)shouldDisplayAssetExplorerReviewScreenBadgesChanged
{
  return self->_shouldUseUserTransformTilesChanged;
}

- (void)_setShouldDisplayBadgesChanged:(BOOL)a3
{
  self->_shouldUseContentGuideInsetsChanged = a3;
}

- (BOOL)shouldDisplayBadgesChanged
{
  return self->_shouldUseContentGuideInsetsChanged;
}

- (void)_setShouldUseUserTransformTilesChanged:(BOOL)a3
{
  self->_maximumAccessoryToolbarHeightChanged = a3;
}

- (BOOL)shouldUseUserTransformTilesChanged
{
  return self->_maximumAccessoryToolbarHeightChanged;
}

- (void)_setShouldUseContentGuideInsetsChanged:(BOOL)a3
{
  self->_maximumToolbarHeightChanged = a3;
}

- (BOOL)shouldUseContentGuideInsetsChanged
{
  return self->_maximumToolbarHeightChanged;
}

- (void)_setMaximumAccessoryToolbarHeightChanged:(BOOL)a3
{
  self->_shouldUseCompactTitleViewChanged = a3;
}

- (BOOL)maximumAccessoryToolbarHeightChanged
{
  return self->_shouldUseCompactTitleViewChanged;
}

- (void)_setMaximumToolbarHeightChanged:(BOOL)a3
{
  self->_shouldPlaceButtonsInNavigationBarChanged = a3;
}

- (BOOL)maximumToolbarHeightChanged
{
  return self->_shouldPlaceButtonsInNavigationBarChanged;
}

- (void)_setShouldUseCompactTitleViewChanged:(BOOL)a3
{
  self->_presentedForPreviewChanged = a3;
}

- (BOOL)shouldUseCompactTitleViewChanged
{
  return self->_presentedForPreviewChanged;
}

- (void)_setShouldPlaceButtonsInNavigationBarChanged:(BOOL)a3
{
  self->_contentLockingChanged = a3;
}

- (BOOL)shouldPlaceButtonsInNavigationBarChanged
{
  return self->_contentLockingChanged;
}

- (void)_setPresentedForPreviewChanged:(BOOL)a3
{
  self->_chromeVisibilityChanged = a3;
}

- (BOOL)presentedForPreviewChanged
{
  return self->_chromeVisibilityChanged;
}

- (void)_setContentLockingChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2) = a3;
}

- (BOOL)contentLockingChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2);
}

- (void)_setChromeVisibilityChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1) = a3;
}

- (BOOL)chromeVisibilityChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1);
}

- (BOOL)changed
{
  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerSpecChange;
  return [(PUViewControllerSpecChange *)&v4 changed]
      || [(PUOneUpViewControllerSpecChange *)self chromeVisibilityChanged]
      || [(PUOneUpViewControllerSpecChange *)self contentLockingChanged]
      || -[PUOneUpViewControllerSpecChange shouldPlaceButtonsInNavigationBarChanged](self, "shouldPlaceButtonsInNavigationBarChanged")|| -[PUOneUpViewControllerSpecChange shouldUseCompactTitleViewChanged](self, "shouldUseCompactTitleViewChanged")|| -[PUOneUpViewControllerSpecChange shouldUseContentGuideInsetsChanged](self, "shouldUseContentGuideInsetsChanged")|| -[PUOneUpViewControllerSpecChange shouldUseUserTransformTilesChanged](self, "shouldUseUserTransformTilesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayBadgesChanged](self, "shouldDisplayBadgesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayAssetExplorerReviewScreenBadgesChanged](self, "shouldDisplayAssetExplorerReviewScreenBadgesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayPlayButtonsChanged](self, "shouldDisplayPlayButtonsChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayProgressIndicatorsChanged](self, "shouldDisplayProgressIndicatorsChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayBufferingIndicatorsChanged](self,
           "shouldDisplayBufferingIndicatorsChanged")
      || [(PUOneUpViewControllerSpecChange *)self canDisplayLoadingIndicatorsChanged]|| [(PUOneUpViewControllerSpecChange *)self backgroundColorOverrideChanged]|| [(PUOneUpViewControllerSpecChange *)self progressIndicatorSizeChanged]|| [(PUOneUpViewControllerSpecChange *)self peopleRowSizeChanged]|| [(PUOneUpViewControllerSpecChange *)self progressIndicatorContentInsetsChanged]|| [(PUOneUpViewControllerSpecChange *)self bufferingIndicatorSizeChanged]|| [(PUOneUpViewControllerSpecChange *)self shouldUseCompactCommentsTitleChanged]|| [(PUOneUpViewControllerSpecChange *)self maximumToolbarHeightChanged]|| [(PUOneUpViewControllerSpecChange *)self shouldCounterrotateReviewScreenBarsChanged]|| [(PUOneUpViewControllerSpecChange *)self maximumAccessoryToolbarHeightChanged]
      || [(PUOneUpViewControllerSpecChange *)self shouldLayoutReviewScreenControlBarVerticallyChanged]|| [(PUOneUpViewControllerSpecChange *)self shouldPlaceScrubberInScrubberBarChanged]|| [(PUOneUpViewControllerSpecChange *)self shouldDisplaySyndicationAttribution];
}

@end