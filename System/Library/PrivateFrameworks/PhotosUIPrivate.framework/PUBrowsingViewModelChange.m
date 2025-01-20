@interface PUBrowsingViewModelChange
- (BOOL)assetsDataSourceDidChange;
- (BOOL)browsingSpeedRegimeDidChange;
- (BOOL)chromeVisibilityDidChange;
- (BOOL)contentPrivacyStateDidChange;
- (BOOL)currentAssetDidChange;
- (BOOL)currentAssetTransitionProgressDidChange;
- (BOOL)hasChanges;
- (BOOL)imageAnalysisInteractionDidChange;
- (BOOL)isAnimatingAnyTransitionDidChange;
- (BOOL)isAnimatingPresentationSizeDidChange;
- (BOOL)isAttemptingToPlayVideoOverlayDidChange;
- (BOOL)isFillScreenModeEnabledDidChange;
- (BOOL)isInSelectionModeDidChange;
- (BOOL)isInteractingWithVideoScrubberDidChange;
- (BOOL)isPresentedForPreviewDidChange;
- (BOOL)isScrollingDidChange;
- (BOOL)isScrubbingActivationDidChange;
- (BOOL)isScrubbingDidChange;
- (BOOL)isVideoContentAllowedDidChange;
- (BOOL)livePhotoShouldPlayDidChange;
- (BOOL)navigationBarTitleDidChange;
- (BOOL)presentingOverOneUpDidChange;
- (BOOL)resizeTaskDescriptorViewModelDidChange;
- (BOOL)reviewScreenBarsModelDidChange;
- (BOOL)reviewScreenSelectionDidChange;
- (BOOL)secondScreenSizeDidChange;
- (BOOL)systemAuthenticationTypeDidChange;
- (BOOL)transitionDriverIdentifierDidChange;
- (BOOL)videoOverlayPlayStateDidChange;
- (BOOL)videoPlayerDidChange;
- (BOOL)wantsContentUnavailableUnlockButtonVisibleDidChange;
- (NSDictionary)assetViewModelChangesByAssetReference;
- (NSMapTable)_mutableSharedViewModelChangesByAssetUUID;
- (NSMapTable)assetSharedViewModelChangesByAssetUUID;
- (NSMutableDictionary)_mutableViewModelChangesByAssetReference;
- (PUBrowsingVideoPlayerChange)videoPlayerChange;
- (void)_setAnimatingAnyTransitionDidChange:(BOOL)a3;
- (void)_setAssetsDataSourceDidChange:(BOOL)a3;
- (void)_setBrowsingSpeedRegimeDidChange:(BOOL)a3;
- (void)_setChromeVisibilityDidChange:(BOOL)a3;
- (void)_setContentPrivacyStateDidChange:(BOOL)a3;
- (void)_setCurrentAssetDidChange:(BOOL)a3;
- (void)_setCurrentAssetTransitionProgressDidChange:(BOOL)a3;
- (void)_setIsAttemptingToPlayVideoOverlayDidChange:(BOOL)a3;
- (void)_setIsInSelectionModeDidChange:(BOOL)a3;
- (void)_setIsScrollingDidChange:(BOOL)a3;
- (void)_setIsScrubbingActivationDidChange:(BOOL)a3;
- (void)_setIsScrubbingDidChange:(BOOL)a3;
- (void)_setNavigationBarTitleDidChange:(BOOL)a3;
- (void)_setPresentingOverOneUpDidChange:(BOOL)a3;
- (void)_setResizeTaskDescriptorViewModelDidChange:(BOOL)a3;
- (void)_setReviewScreenBarsModelDidChange:(BOOL)a3;
- (void)_setReviewScreenSelectionDidChange:(BOOL)a3;
- (void)_setSecondScreenSizeDidChange:(BOOL)a3;
- (void)_setSystemAuthenticationTypeDidChange:(BOOL)a3;
- (void)_setTransitionDriverIdentifierDidChange:(BOOL)a3;
- (void)_setVideoOverlayPlayStateDidChange:(BOOL)a3;
- (void)_setWantsContentUnavailableUnlockButtonVisibleDidChange:(BOOL)a3;
- (void)setImageAnalysisInteractionDidChange:(BOOL)a3;
- (void)setIsAnimatingPresentationSizeDidChange:(BOOL)a3;
- (void)setIsFillScreenModeEnabledDidChange:(BOOL)a3;
- (void)setIsInteractingWithVideoScrubberDidChange:(BOOL)a3;
- (void)setIsPresentedForPreviewDidChange:(BOOL)a3;
- (void)setIsVideoContentAllowedDidChange:(BOOL)a3;
- (void)setLivePhotoShouldPlayDidChange:(BOOL)a3;
- (void)setVideoPlayerChange:(id)a3;
- (void)setVideoPlayerDidChange:(BOOL)a3;
@end

@implementation PUBrowsingViewModelChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerChange, 0);
  objc_storeStrong((id *)&self->_mutableSharedViewModelChangesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_mutableViewModelChangesByAssetReference, 0);
}

- (void)setVideoPlayerChange:(id)a3
{
}

- (PUBrowsingVideoPlayerChange)videoPlayerChange
{
  return self->_videoPlayerChange;
}

- (void)setIsAnimatingPresentationSizeDidChange:(BOOL)a3
{
  self->_isAnimatingPresentationSizeDidChange = a3;
}

- (BOOL)isAnimatingPresentationSizeDidChange
{
  return self->_isAnimatingPresentationSizeDidChange;
}

- (void)setIsInteractingWithVideoScrubberDidChange:(BOOL)a3
{
  self->_isInteractingWithVideoScrubberDidChange = a3;
}

- (BOOL)isInteractingWithVideoScrubberDidChange
{
  return self->_isInteractingWithVideoScrubberDidChange;
}

- (void)setImageAnalysisInteractionDidChange:(BOOL)a3
{
  self->_imageAnalysisInteractionDidChange = a3;
}

- (BOOL)imageAnalysisInteractionDidChange
{
  return self->_imageAnalysisInteractionDidChange;
}

- (void)setVideoPlayerDidChange:(BOOL)a3
{
  self->_videoPlayerDidChange = a3;
}

- (BOOL)videoPlayerDidChange
{
  return self->_videoPlayerDidChange;
}

- (void)setIsFillScreenModeEnabledDidChange:(BOOL)a3
{
  self->_isFillScreenModeEnabledDidChange = a3;
}

- (BOOL)isFillScreenModeEnabledDidChange
{
  return self->_isFillScreenModeEnabledDidChange;
}

- (void)setIsPresentedForPreviewDidChange:(BOOL)a3
{
  self->_isPresentedForPreviewDidChange = a3;
}

- (BOOL)isPresentedForPreviewDidChange
{
  return self->_isPresentedForPreviewDidChange;
}

- (void)_setIsInSelectionModeDidChange:(BOOL)a3
{
  self->_isInSelectionModeDidChange = a3;
}

- (BOOL)isInSelectionModeDidChange
{
  return self->_isInSelectionModeDidChange;
}

- (void)_setWantsContentUnavailableUnlockButtonVisibleDidChange:(BOOL)a3
{
  self->_wantsContentUnavailableUnlockButtonVisibleDidChange = a3;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisibleDidChange
{
  return self->_wantsContentUnavailableUnlockButtonVisibleDidChange;
}

- (void)_setSystemAuthenticationTypeDidChange:(BOOL)a3
{
  self->_systemAuthenticationTypeDidChange = a3;
}

- (BOOL)systemAuthenticationTypeDidChange
{
  return self->_systemAuthenticationTypeDidChange;
}

- (void)_setContentPrivacyStateDidChange:(BOOL)a3
{
  self->_contentPrivacyStateDidChange = a3;
}

- (BOOL)contentPrivacyStateDidChange
{
  return self->_contentPrivacyStateDidChange;
}

- (void)_setResizeTaskDescriptorViewModelDidChange:(BOOL)a3
{
  self->_resizeTaskDescriptorViewModelDidChange = a3;
}

- (BOOL)resizeTaskDescriptorViewModelDidChange
{
  return self->_resizeTaskDescriptorViewModelDidChange;
}

- (void)_setNavigationBarTitleDidChange:(BOOL)a3
{
  self->_navigationBarTitleDidChange = a3;
}

- (BOOL)navigationBarTitleDidChange
{
  return self->_navigationBarTitleDidChange;
}

- (void)_setReviewScreenSelectionDidChange:(BOOL)a3
{
  self->_reviewScreenSelectionDidChange = a3;
}

- (BOOL)reviewScreenSelectionDidChange
{
  return self->_reviewScreenSelectionDidChange;
}

- (void)setIsVideoContentAllowedDidChange:(BOOL)a3
{
  self->_isVideoContentAllowedDidChange = a3;
}

- (BOOL)isVideoContentAllowedDidChange
{
  return self->_isVideoContentAllowedDidChange;
}

- (void)_setIsScrubbingActivationDidChange:(BOOL)a3
{
  self->_isScrubbingActivationDidChange = a3;
}

- (BOOL)isScrubbingActivationDidChange
{
  return self->_isScrubbingActivationDidChange;
}

- (void)_setIsAttemptingToPlayVideoOverlayDidChange:(BOOL)a3
{
  self->_isAttemptingToPlayVideoOverlayDidChange = a3;
}

- (BOOL)isAttemptingToPlayVideoOverlayDidChange
{
  return self->_isAttemptingToPlayVideoOverlayDidChange;
}

- (void)_setVideoOverlayPlayStateDidChange:(BOOL)a3
{
  self->_videoOverlayPlayStateDidChange = a3;
}

- (BOOL)videoOverlayPlayStateDidChange
{
  return self->_videoOverlayPlayStateDidChange;
}

- (void)_setReviewScreenBarsModelDidChange:(BOOL)a3
{
  self->_reviewScreenBarsModelDidChange = a3;
}

- (BOOL)reviewScreenBarsModelDidChange
{
  return self->_reviewScreenBarsModelDidChange;
}

- (void)_setPresentingOverOneUpDidChange:(BOOL)a3
{
  self->_presentingOverOneUpDidChange = a3;
}

- (BOOL)presentingOverOneUpDidChange
{
  return self->_presentingOverOneUpDidChange;
}

- (void)_setChromeVisibilityDidChange:(BOOL)a3
{
  self->_chromeVisibilityDidChange = a3;
}

- (BOOL)chromeVisibilityDidChange
{
  return self->_chromeVisibilityDidChange;
}

- (void)_setSecondScreenSizeDidChange:(BOOL)a3
{
  self->_secondScreenSizeDidChange = a3;
}

- (BOOL)secondScreenSizeDidChange
{
  return self->_secondScreenSizeDidChange;
}

- (void)_setAnimatingAnyTransitionDidChange:(BOOL)a3
{
  self->_isAnimatingAnyTransitionDidChange = a3;
}

- (BOOL)isAnimatingAnyTransitionDidChange
{
  return self->_isAnimatingAnyTransitionDidChange;
}

- (void)setLivePhotoShouldPlayDidChange:(BOOL)a3
{
  self->_livePhotoShouldPlayDidChange = a3;
}

- (BOOL)livePhotoShouldPlayDidChange
{
  return self->_livePhotoShouldPlayDidChange;
}

- (void)_setIsScrollingDidChange:(BOOL)a3
{
  self->_isScrollingDidChange = a3;
}

- (BOOL)isScrollingDidChange
{
  return self->_isScrollingDidChange;
}

- (void)_setIsScrubbingDidChange:(BOOL)a3
{
  self->_isScrubbingDidChange = a3;
}

- (BOOL)isScrubbingDidChange
{
  return self->_isScrubbingDidChange;
}

- (void)_setBrowsingSpeedRegimeDidChange:(BOOL)a3
{
  self->_browsingSpeedRegimeDidChange = a3;
}

- (BOOL)browsingSpeedRegimeDidChange
{
  return self->_browsingSpeedRegimeDidChange;
}

- (void)_setTransitionDriverIdentifierDidChange:(BOOL)a3
{
  self->_transitionDriverIdentifierDidChange = a3;
}

- (BOOL)transitionDriverIdentifierDidChange
{
  return self->_transitionDriverIdentifierDidChange;
}

- (void)_setCurrentAssetTransitionProgressDidChange:(BOOL)a3
{
  self->_currentAssetTransitionProgressDidChange = a3;
}

- (BOOL)currentAssetTransitionProgressDidChange
{
  return self->_currentAssetTransitionProgressDidChange;
}

- (void)_setCurrentAssetDidChange:(BOOL)a3
{
  self->_currentAssetDidChange = a3;
}

- (BOOL)currentAssetDidChange
{
  return self->_currentAssetDidChange;
}

- (void)_setAssetsDataSourceDidChange:(BOOL)a3
{
  self->_assetsDataSourceDidChange = a3;
}

- (BOOL)assetsDataSourceDidChange
{
  return self->_assetsDataSourceDidChange;
}

- (BOOL)hasChanges
{
  v8.receiver = self;
  v8.super_class = (Class)PUBrowsingViewModelChange;
  if ([(PUViewModelChange *)&v8 hasChanges]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self assetsDataSourceDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self currentAssetDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self currentAssetTransitionProgressDidChange])
  {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self browsingSpeedRegimeDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self transitionDriverIdentifierDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self isScrubbingDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self isScrollingDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self livePhotoShouldPlayDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self chromeVisibilityDidChange]) {
    return 1;
  }
  if ([(PUBrowsingViewModelChange *)self presentingOverOneUpDidChange]) {
    return 1;
  }
  v3 = [(PUBrowsingViewModelChange *)self assetViewModelChangesByAssetReference];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 1;
  }
  v5 = [(PUBrowsingViewModelChange *)self assetSharedViewModelChangesByAssetUUID];
  uint64_t v6 = [v5 count];

  return v6
      || [(PUBrowsingViewModelChange *)self videoOverlayPlayStateDidChange]
      || [(PUBrowsingViewModelChange *)self isAttemptingToPlayVideoOverlayDidChange]|| [(PUBrowsingViewModelChange *)self isScrubbingActivationDidChange]|| [(PUBrowsingViewModelChange *)self isVideoContentAllowedDidChange]|| [(PUBrowsingViewModelChange *)self reviewScreenSelectionDidChange]|| [(PUBrowsingViewModelChange *)self navigationBarTitleDidChange]|| [(PUBrowsingViewModelChange *)self resizeTaskDescriptorViewModelDidChange]|| [(PUBrowsingViewModelChange *)self contentPrivacyStateDidChange]|| [(PUBrowsingViewModelChange *)self systemAuthenticationTypeDidChange]|| [(PUBrowsingViewModelChange *)self wantsContentUnavailableUnlockButtonVisibleDidChange]|| [(PUBrowsingViewModelChange *)self isInSelectionModeDidChange]|| [(PUBrowsingViewModelChange *)self isPresentedForPreviewDidChange]|| [(PUBrowsingViewModelChange *)self isFillScreenModeEnabledDidChange]|| [(PUBrowsingViewModelChange *)self videoPlayerDidChange]|| [(PUBrowsingViewModelChange *)self imageAnalysisInteractionDidChange]
      || [(PUBrowsingViewModelChange *)self isInteractingWithVideoScrubberDidChange]|| [(PUBrowsingViewModelChange *)self isAnimatingPresentationSizeDidChange];
}

- (NSMapTable)assetSharedViewModelChangesByAssetUUID
{
  return self->_mutableSharedViewModelChangesByAssetUUID;
}

- (NSMapTable)_mutableSharedViewModelChangesByAssetUUID
{
  mutableSharedViewModelChangesByAssetUUID = self->_mutableSharedViewModelChangesByAssetUUID;
  if (!mutableSharedViewModelChangesByAssetUUID)
  {
    uint64_t v4 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v5 = self->_mutableSharedViewModelChangesByAssetUUID;
    self->_mutableSharedViewModelChangesByAssetUUID = v4;

    mutableSharedViewModelChangesByAssetUUID = self->_mutableSharedViewModelChangesByAssetUUID;
  }
  return mutableSharedViewModelChangesByAssetUUID;
}

- (NSDictionary)assetViewModelChangesByAssetReference
{
  return (NSDictionary *)self->_mutableViewModelChangesByAssetReference;
}

- (NSMutableDictionary)_mutableViewModelChangesByAssetReference
{
  mutableViewModelChangesByAssetReference = self->_mutableViewModelChangesByAssetReference;
  if (!mutableViewModelChangesByAssetReference)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = self->_mutableViewModelChangesByAssetReference;
    self->_mutableViewModelChangesByAssetReference = v4;

    mutableViewModelChangesByAssetReference = self->_mutableViewModelChangesByAssetReference;
  }
  return mutableViewModelChangesByAssetReference;
}

@end