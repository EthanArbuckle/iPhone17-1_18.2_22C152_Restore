@interface PUWallpaperPosterEditorController
+ (id)availableStylesForItem:(id)a3 posterConfiguration:(id)a4;
+ (id)posterConfigurationFromPosterDescriptor:(id)a3;
+ (int64_t)posterConfigurationTypeForPosterType:(int64_t)a3;
- (AVPlayerItem)observedPlayerItem;
- (BOOL)_attemptedSettlingEffect;
- (BOOL)_canEnableDepthEffect;
- (BOOL)_createHintLabelIfNeeded;
- (BOOL)_currentStyleIsHighKey;
- (BOOL)_currentStyleShowsBackground;
- (BOOL)_currentStyleSupportsColorPicker;
- (BOOL)_currentStyleSupportsHighAndLowKeyModes;
- (BOOL)_currentStyleSupportsToggleBackground;
- (BOOL)_isDepthEffectPossible;
- (BOOL)_isDepthEnabled;
- (BOOL)_isManualShuffle;
- (BOOL)_isParallaxAllowed;
- (BOOL)_isShuffle;
- (BOOL)_isShuffleModeWithGlobalDepth;
- (BOOL)_isSmartShuffle;
- (BOOL)_isUserAlbumShuffle;
- (BOOL)_shouldEnableParallax;
- (BOOL)_tryLoadAssetUUID:(id)a3 fromWallpaperURL:(id)a4;
- (BOOL)editorShouldBeginFinalization:(id)a3;
- (BOOL)fadeInInitialLoad;
- (BOOL)isAnySmartAlbumAvailable;
- (BOOL)isCancellingMediaLoading;
- (BOOL)isInitialSave;
- (BOOL)isLoading;
- (BOOL)isPausingParallax;
- (BOOL)isPerformingInitialLoad;
- (BOOL)isPreviewingSettlingEffect;
- (BOOL)isUserTransformDisabled;
- (BOOL)loadingSettlingEffect;
- (BOOL)settlingEffectToggleInProgress;
- (BOOL)shouldLoadSettlingEffectSynchronously;
- (BOOL)wantsLowLuminanceContent;
- (NSArray)visibleLayerStackViewModels;
- (NSAttributedString)pinchToZoomHintTitle;
- (NSLayoutConstraint)hintLabelBottomConstraint;
- (NSString)animateScrollToStyleKindEndingKind;
- (NSString)animateScrollToStyleKindStartingKind;
- (NSTimer)settlingEffectPreviewDelayTimer;
- (OS_dispatch_group)segmentationLoadingGroup;
- (OS_dispatch_queue)queue;
- (PFPosterConfiguration)oldPosterConfiguration;
- (PFPosterConfiguration)posterConfiguration;
- (PFPosterEditConfiguration)currentEditConfiguration;
- (PFPosterMedia)currentPosterMedia;
- (PHPhotoLibrary)photoLibrary;
- (PHPickerViewController)photoPickerViewController;
- (PIParallaxCompoundLayerStackRequest)layerStackRequest;
- (PIParallaxLayerStackRequest)settlingEffectRequest;
- (PISegmentationLoading)segmentationLoading;
- (PUParallaxLayerStackViewModel)currentLayerStackViewModel;
- (PUPosterEditingEnvironment)environment;
- (PUPosterEditor)editor;
- (PUProgressIndicatorView)progressIndicator;
- (PUUserTransformView)userTransformView;
- (PUWallpaperConfigurationUpdater)configurationUpdater;
- (PUWallpaperPosterEditModel)editModel;
- (PUWallpaperPosterEditViewModel)editViewModel;
- (PUWallpaperPosterEditorController)initWithWallpaperEditor:(id)a3 photoLibrary:(id)a4;
- (PUWallpaperPosterMigrator)migrator;
- (PUWallpaperPosterParallaxView)parallaxSimulationView;
- (PUWallpaperShuffleResourceManager)shuffleResourceManager;
- (PXNumberAnimator)animateScrollToStyleKindAnimator;
- (UIActivityIndicatorView)loadingIndicator;
- (UILabel)hintLabel;
- (UITapGestureRecognizer)tapToShuffleGestureRecognizer;
- (UIView)backgroundView;
- (UIView)contentOverlayContainerView;
- (UIView)floatingView;
- (UIView)foregroundView;
- (UIView)styleDividerView;
- (UIViewController)presentedPosterConfigurationViewController;
- (UIViewController)tipContainerViewController;
- (UIViewPropertyAnimator)settlingEffectPreviewAnimator;
- (_PUWallpaperSmartAlbumPreviewReloadRequest)smartAlbumPreviewReloadRequest;
- (double)_hintLabelBottomAnchorDistance;
- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5;
- (id)_actionsMenu;
- (id)_colorPickerAction;
- (id)_fetchMePerson;
- (id)_initialLayerStyleForSegmentationItem:(id)a3;
- (id)_perspectiveZoomAction;
- (id)_photoPickerAction;
- (id)_sanitizeCompoundLayerStack:(id)a3 forSegmentationItem:(id)a4;
- (id)_shuffleFrequencyMenu;
- (id)_toggleHighKeyLowKeyAction;
- (id)_toggleSettlingEffectAction;
- (id)animateScrollToStyleKindCompletion;
- (id)centerSuggestionMedia;
- (id)hintLabelFont;
- (id)hintLabelTextColor;
- (id)initialLookIdentifierForEditor:(id)a3;
- (id)leadingMenuElementsForEditor:(id)a3;
- (id)looksForEditor:(id)a3;
- (id)mediaLoadedCompletionHandler;
- (id)presentationControllerForTipID:(id)a3;
- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3;
- (id)sourceItemForTipID:(id)a3;
- (id)trailingMenuElementsForEditor:(id)a3;
- (int64_t)_shuffleType;
- (int64_t)shuffleAssetIndex;
- (unint64_t)_defaultHint;
- (unint64_t)finalizationState;
- (unint64_t)hint;
- (unint64_t)signpost;
- (void)_animateScrollToStyleKind:(id)a3 completion:(id)a4;
- (void)_animateScrollToStyleKindAnimatorUpdated;
- (void)_applyPosterEditConfigurationForShuffleAsset;
- (void)_beginListeningForExtensionHostResignationNotification;
- (void)_beginLoadingShuffleResources;
- (void)_createShuffleResourceManager;
- (void)_didDismissLoadingErrorAlert;
- (void)_didFinishCreatingEditViewModel:(id)a3 forAsset:(id)a4 error:(id)a5;
- (void)_didLoadMediaFromPhotoPickerWithAssetUUID:(id)a3 succeeded:(BOOL)a4 error:(id)a5;
- (void)_didLoadMediaFromShuffleConfigurationViewController:(id)a3 succeeded:(BOOL)a4;
- (void)_disableSettlingEffect;
- (void)_dismissPosterConfigurationViewController;
- (void)_dismissPosterConfigurationViewControllerAndCancelEditor;
- (void)_dismissPosterConfigurationViewControllerWithCompletion:(id)a3;
- (void)_displayDefaultHint;
- (void)_displayNextHint;
- (void)_enableSettlingEffect;
- (void)_extensionWillResignNotification:(id)a3;
- (void)_fadeInViews;
- (void)_handlePhotoPickerResults:(id)a3;
- (void)_handlePosterSaved:(BOOL)a3 error:(id)a4;
- (void)_handleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 forAsset:(id)a6 error:(id)a7;
- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3;
- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3 layerStack:(id)a4;
- (void)_handleShuffleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 editConfiguration:(id)a5 forPosterMedia:(id)a6 error:(id)a7;
- (void)_handleTapToShuffle:(id)a3;
- (void)_handleUpdatedConfiguration:(id)a3 segmentationItem:(id)a4 compoundLayerStack:(id)a5 error:(id)a6;
- (void)_hideHintAnimated:(BOOL)a3 completion:(id)a4;
- (void)_hideLoadingIndicator;
- (void)_hideProgressIndicator;
- (void)_loadAssetFromPosterConfiguration;
- (void)_loadAssetUUID:(id)a3 fromWallpaperURL:(id)a4;
- (void)_loadAssetWithUUID:(id)a3;
- (void)_loadContentForCurrentPosterMedia;
- (void)_loadEditViewModelAndUpdateLooks:(BOOL)a3;
- (void)_loadEditViewModelWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 completion:(id)a6;
- (void)_loadPosterDescriptor;
- (void)_loadSettlingEffectLayerStackForSegmentationItem:(id)a3 completion:(id)a4;
- (void)_loadSourcePosterConfiguration;
- (void)_observeCurrentPlayerItem;
- (void)_pickAssets;
- (void)_playerItemDidFinish:(id)a3;
- (void)_presentLoadingError:(id)a3;
- (void)_presentLoadingError:(id)a3 forAsset:(id)a4;
- (void)_presentLoadingErrorAlertController:(id)a3;
- (void)_presentManualShuffleAssetEditor;
- (void)_presentPhotoPicker;
- (void)_presentPosterConfigurationViewController:(id)a3;
- (void)_presentSettlingEffectDebugView:(id)a3;
- (void)_presentShuffleConfigurationEditor;
- (void)_presentSmartAlbumShuffleEditor;
- (void)_presentStyleColorPicker;
- (void)_presentUserAlbumShuffleEditor;
- (void)_rejectSuggestionsForCurrentAsset;
- (void)_reloadAssetUUID:(id)a3 fromWallpaperURL:(id)a4;
- (void)_reloadSmartAlbumPreviewAssetsWithCompletionHandler:(id)a3;
- (void)_removeViewsFromLayerStackViewModel:(id)a3;
- (void)_renderAfterStyleChange;
- (void)_renderInitialLayerStack:(id)a3 style:(id)a4 completion:(id)a5;
- (void)_savePosterEditConfigurationForCurrentPosterMedia;
- (void)_saveWithCompletionHandler:(id)a3;
- (void)_sendSettlingEffectGatingAnalyticsWithSegmentationItem:(id)a3;
- (void)_setCurrentStyleIsHighKey:(BOOL)a3;
- (void)_setupUserTransformView;
- (void)_showHintAnimated:(BOOL)a3 completion:(id)a4;
- (void)_showLoadingIndicator;
- (void)_showPhotoInLibrary;
- (void)_showProgressIndicator:(id)a3 determinate:(BOOL)a4;
- (void)_showSettlingEffectUnavailableTip;
- (void)_showTrySettlingEffectTip;
- (void)_startSettlingEffectPreview;
- (void)_startSettlingEffectPreviewAfterDelay;
- (void)_startSimulatingParallax;
- (void)_stopListeningForExtensionHostResignationNotification;
- (void)_stopObservingPlayerItem;
- (void)_stopSettlingEffectPreview;
- (void)_stopSettlingEffectPreview:(id)a3;
- (void)_stopSimulatingParallax;
- (void)_tapToRadar;
- (void)_tapToRadarWithComponent:(int64_t)a3;
- (void)_toggleDepth;
- (void)_toggleHeadroom;
- (void)_togglePerspectiveZoom;
- (void)_toggleSettlingEffectEnabled;
- (void)_toggleStyleBackground;
- (void)_transferSubviewsFrom:(id)a3 to:(id)a4;
- (void)_updateContainerFrame;
- (void)_updateContentOverlayContainerView;
- (void)_updateCurrentLayerStackViewModel;
- (void)_updateCurrentStyle;
- (void)_updateCurrentStyleColor:(id)a3;
- (void)_updateDeviceOrientation;
- (void)_updateEditToolbar;
- (void)_updateEditViewModelPropertiesFromPosterConfiguration;
- (void)_updateHintLabelAnimated:(BOOL)a3;
- (void)_updateHintLabelConstraints;
- (void)_updateLayerStackOrderingForViewModel:(id)a3;
- (void)_updateParallaxEnabled;
- (void)_updateParallaxIsPaused;
- (void)_updatePosterConfigurationForCallServices:(id)a3;
- (void)_updateProgressIndicator:(double)a3;
- (void)_updateSettlingEffectEnabled;
- (void)_updateShuffleSuggestionFeaturedStateIfNeededForConfiguration:(id)a3;
- (void)_updateShuffleView;
- (void)_updateSmartAlbumAvailability;
- (void)_updateStyleDividerView;
- (void)_updateUserTransformIsDisabled;
- (void)_updateUserTransformView;
- (void)_updateViewForLayerID:(id)a3 usingViewManager:(id)a4 containerView:(id)a5;
- (void)_updateVisibleLayerStackViewModels;
- (void)_updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:(id)a3;
- (void)_wallpaperFeedbackRadar;
- (void)cancelPendingHint;
- (void)dealloc;
- (void)displayNextHintAfterDelay;
- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5;
- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)editor:(id)a3 finalizeWithCompletion:(id)a4;
- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5;
- (void)editorDidInvalidate:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)prepareTipPopover:(id)a3 tipID:(id)a4;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setAnimateScrollToStyleKindAnimator:(id)a3;
- (void)setAnimateScrollToStyleKindCompletion:(id)a3;
- (void)setAnimateScrollToStyleKindEndingKind:(id)a3;
- (void)setAnimateScrollToStyleKindStartingKind:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConfigurationUpdater:(id)a3;
- (void)setContentOverlayContainerView:(id)a3;
- (void)setCurrentLayerStackViewModel:(id)a3;
- (void)setCurrentPosterMedia:(id)a3;
- (void)setEditModel:(id)a3;
- (void)setEditViewModel:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setFadeInInitialLoad:(BOOL)a3;
- (void)setFinalizationState:(unint64_t)a3;
- (void)setFloatingView:(id)a3;
- (void)setForegroundView:(id)a3;
- (void)setHint:(unint64_t)a3;
- (void)setHintLabel:(id)a3;
- (void)setHintLabelBottomConstraint:(id)a3;
- (void)setIsAnySmartAlbumAvailable:(BOOL)a3;
- (void)setIsCancellingMediaLoading:(BOOL)a3;
- (void)setIsInitialSave:(BOOL)a3;
- (void)setIsLoading:(BOOL)a3;
- (void)setIsPausingParallax:(BOOL)a3;
- (void)setIsUserTransformDisabled:(BOOL)a3;
- (void)setLayerStackRequest:(id)a3;
- (void)setLoadingIndicator:(id)a3;
- (void)setLoadingSettlingEffect:(BOOL)a3;
- (void)setMediaLoadedCompletionHandler:(id)a3;
- (void)setMigrator:(id)a3;
- (void)setObservedPlayerItem:(id)a3;
- (void)setOldPosterConfiguration:(id)a3;
- (void)setParallaxSimulationView:(id)a3;
- (void)setPerformingInitialLoad:(BOOL)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setPhotoPickerViewController:(id)a3;
- (void)setPinchToZoomHintTitle:(id)a3;
- (void)setPosterConfiguration:(id)a3;
- (void)setPresentedPosterConfigurationViewController:(id)a3;
- (void)setPreviewingSettlingEffect:(BOOL)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSegmentationLoading:(id)a3;
- (void)setSegmentationLoadingGroup:(id)a3;
- (void)setSettlingEffectPreviewAnimator:(id)a3;
- (void)setSettlingEffectPreviewDelayTimer:(id)a3;
- (void)setSettlingEffectRequest:(id)a3;
- (void)setSettlingEffectToggleInProgress:(BOOL)a3;
- (void)setShouldLoadSettlingEffectSynchronously:(BOOL)a3;
- (void)setShuffleAssetIndex:(int64_t)a3;
- (void)setShuffleResourceManager:(id)a3;
- (void)setSmartAlbumPreviewReloadRequest:(id)a3;
- (void)setTapToShuffleGestureRecognizer:(id)a3;
- (void)setTipContainerViewController:(id)a3;
- (void)setUserTransformView:(id)a3;
- (void)setVisibleLayerStackViewModels:(id)a3;
- (void)tipPopoverDidDismissWithTipID:(id)a3;
- (void)transitionBetweenStyleWithKind:(id)a3 andKind:(id)a4 progress:(double)a5;
- (void)userTransformView:(id)a3 didChangeIsUserInteracting:(BOOL)a4;
- (void)userTransformView:(id)a3 didChangeUserAffineTransform:(CGAffineTransform *)a4 isUserInteracting:(BOOL)a5;
- (void)wallpaperPosterShuffleGridViewController:(id)a3 didFinishWithChange:(id)a4 selectedPosterMedia:(id)a5;
- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4;
- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3;
- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3;
@end

@implementation PUWallpaperPosterEditorController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipContainerViewController, 0);
  objc_storeStrong((id *)&self->_settlingEffectPreviewDelayTimer, 0);
  objc_storeStrong((id *)&self->_settlingEffectPreviewAnimator, 0);
  objc_storeStrong((id *)&self->_observedPlayerItem, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindAnimator, 0);
  objc_storeStrong(&self->_animateScrollToStyleKindCompletion, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindEndingKind, 0);
  objc_storeStrong((id *)&self->_animateScrollToStyleKindStartingKind, 0);
  objc_storeStrong((id *)&self->_presentedPosterConfigurationViewController, 0);
  objc_storeStrong(&self->_mediaLoadedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_photoPickerViewController, 0);
  objc_storeStrong((id *)&self->_smartAlbumPreviewReloadRequest, 0);
  objc_storeStrong((id *)&self->_tapToShuffleGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hintLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_hintLabel, 0);
  objc_storeStrong((id *)&self->_contentOverlayContainerView, 0);
  objc_storeStrong((id *)&self->_parallaxSimulationView, 0);
  objc_storeStrong((id *)&self->_userTransformView, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_visibleLayerStackViewModels, 0);
  objc_storeStrong((id *)&self->_currentLayerStackViewModel, 0);
  objc_storeStrong((id *)&self->_styleDividerView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_configurationUpdater, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_shuffleResourceManager, 0);
  objc_storeStrong((id *)&self->_oldPosterConfiguration, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_settlingEffectRequest, 0);
  objc_storeStrong((id *)&self->_segmentationLoadingGroup, 0);
  objc_storeStrong((id *)&self->_segmentationLoading, 0);
  objc_storeStrong((id *)&self->_layerStackRequest, 0);
  objc_storeStrong((id *)&self->_editModel, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentPosterMedia, 0);
  objc_storeStrong((id *)&self->_editViewModel, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pinchToZoomHintTitle, 0);
}

- (void)setShouldLoadSettlingEffectSynchronously:(BOOL)a3
{
  self->_shouldLoadSettlingEffectSynchronously = a3;
}

- (BOOL)shouldLoadSettlingEffectSynchronously
{
  return self->_shouldLoadSettlingEffectSynchronously;
}

- (void)setTipContainerViewController:(id)a3
{
}

- (UIViewController)tipContainerViewController
{
  return self->_tipContainerViewController;
}

- (void)setSettlingEffectToggleInProgress:(BOOL)a3
{
  self->_settlingEffectToggleInProgress = a3;
}

- (BOOL)settlingEffectToggleInProgress
{
  return self->_settlingEffectToggleInProgress;
}

- (BOOL)loadingSettlingEffect
{
  return self->_loadingSettlingEffect;
}

- (void)setSettlingEffectPreviewDelayTimer:(id)a3
{
}

- (NSTimer)settlingEffectPreviewDelayTimer
{
  return self->_settlingEffectPreviewDelayTimer;
}

- (void)setSettlingEffectPreviewAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)settlingEffectPreviewAnimator
{
  return self->_settlingEffectPreviewAnimator;
}

- (void)setPreviewingSettlingEffect:(BOOL)a3
{
  self->_previewingSettlingEffect = a3;
}

- (BOOL)isPreviewingSettlingEffect
{
  return self->_previewingSettlingEffect;
}

- (void)setObservedPlayerItem:(id)a3
{
}

- (AVPlayerItem)observedPlayerItem
{
  return self->_observedPlayerItem;
}

- (void)setAnimateScrollToStyleKindAnimator:(id)a3
{
}

- (PXNumberAnimator)animateScrollToStyleKindAnimator
{
  return self->_animateScrollToStyleKindAnimator;
}

- (void)setAnimateScrollToStyleKindCompletion:(id)a3
{
}

- (id)animateScrollToStyleKindCompletion
{
  return self->_animateScrollToStyleKindCompletion;
}

- (void)setAnimateScrollToStyleKindEndingKind:(id)a3
{
}

- (NSString)animateScrollToStyleKindEndingKind
{
  return self->_animateScrollToStyleKindEndingKind;
}

- (void)setAnimateScrollToStyleKindStartingKind:(id)a3
{
}

- (NSString)animateScrollToStyleKindStartingKind
{
  return self->_animateScrollToStyleKindStartingKind;
}

- (void)setFinalizationState:(unint64_t)a3
{
  self->_finalizationState = a3;
}

- (unint64_t)finalizationState
{
  return self->_finalizationState;
}

- (void)setPresentedPosterConfigurationViewController:(id)a3
{
}

- (UIViewController)presentedPosterConfigurationViewController
{
  return self->_presentedPosterConfigurationViewController;
}

- (void)setMediaLoadedCompletionHandler:(id)a3
{
}

- (id)mediaLoadedCompletionHandler
{
  return self->_mediaLoadedCompletionHandler;
}

- (void)setPhotoPickerViewController:(id)a3
{
}

- (PHPickerViewController)photoPickerViewController
{
  return self->_photoPickerViewController;
}

- (void)setSmartAlbumPreviewReloadRequest:(id)a3
{
}

- (_PUWallpaperSmartAlbumPreviewReloadRequest)smartAlbumPreviewReloadRequest
{
  return self->_smartAlbumPreviewReloadRequest;
}

- (void)setIsInitialSave:(BOOL)a3
{
  self->_isInitialSave = a3;
}

- (BOOL)isInitialSave
{
  return self->_isInitialSave;
}

- (void)setIsAnySmartAlbumAvailable:(BOOL)a3
{
  self->_isAnySmartAlbumAvailable = a3;
}

- (BOOL)isAnySmartAlbumAvailable
{
  return self->_isAnySmartAlbumAvailable;
}

- (BOOL)isUserTransformDisabled
{
  return self->_isUserTransformDisabled;
}

- (BOOL)isPausingParallax
{
  return self->_isPausingParallax;
}

- (void)setTapToShuffleGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapToShuffleGestureRecognizer
{
  return self->_tapToShuffleGestureRecognizer;
}

- (unint64_t)hint
{
  return self->_hint;
}

- (void)setHintLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)hintLabelBottomConstraint
{
  return self->_hintLabelBottomConstraint;
}

- (void)setHintLabel:(id)a3
{
}

- (UILabel)hintLabel
{
  return self->_hintLabel;
}

- (void)setContentOverlayContainerView:(id)a3
{
}

- (UIView)contentOverlayContainerView
{
  return self->_contentOverlayContainerView;
}

- (void)setParallaxSimulationView:(id)a3
{
}

- (PUWallpaperPosterParallaxView)parallaxSimulationView
{
  return self->_parallaxSimulationView;
}

- (void)setUserTransformView:(id)a3
{
}

- (PUUserTransformView)userTransformView
{
  return self->_userTransformView;
}

- (void)setFadeInInitialLoad:(BOOL)a3
{
  self->_fadeInInitialLoad = a3;
}

- (BOOL)fadeInInitialLoad
{
  return self->_fadeInInitialLoad;
}

- (void)setPerformingInitialLoad:(BOOL)a3
{
  self->_performingInitialLoad = a3;
}

- (BOOL)isPerformingInitialLoad
{
  return self->_performingInitialLoad;
}

- (void)setLoadingIndicator:(id)a3
{
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (PUProgressIndicatorView)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setIsLoading:(BOOL)a3
{
  self->_isLoading = a3;
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (NSArray)visibleLayerStackViewModels
{
  return self->_visibleLayerStackViewModels;
}

- (PUParallaxLayerStackViewModel)currentLayerStackViewModel
{
  return self->_currentLayerStackViewModel;
}

- (UIView)styleDividerView
{
  return self->_styleDividerView;
}

- (UIView)floatingView
{
  return self->_floatingView;
}

- (UIView)foregroundView
{
  return self->_foregroundView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (PUPosterEditor)editor
{
  return self->_editor;
}

- (PUPosterEditingEnvironment)environment
{
  return self->_environment;
}

- (int64_t)shuffleAssetIndex
{
  return self->_shuffleAssetIndex;
}

- (void)setConfigurationUpdater:(id)a3
{
}

- (PUWallpaperConfigurationUpdater)configurationUpdater
{
  return self->_configurationUpdater;
}

- (void)setMigrator:(id)a3
{
}

- (PUWallpaperPosterMigrator)migrator
{
  return self->_migrator;
}

- (void)setShuffleResourceManager:(id)a3
{
}

- (PUWallpaperShuffleResourceManager)shuffleResourceManager
{
  return self->_shuffleResourceManager;
}

- (BOOL)isCancellingMediaLoading
{
  return self->_isCancellingMediaLoading;
}

- (void)setOldPosterConfiguration:(id)a3
{
}

- (PFPosterConfiguration)oldPosterConfiguration
{
  return self->_oldPosterConfiguration;
}

- (PFPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (void)setSettlingEffectRequest:(id)a3
{
}

- (PIParallaxLayerStackRequest)settlingEffectRequest
{
  return self->_settlingEffectRequest;
}

- (void)setSegmentationLoadingGroup:(id)a3
{
}

- (OS_dispatch_group)segmentationLoadingGroup
{
  return self->_segmentationLoadingGroup;
}

- (void)setSegmentationLoading:(id)a3
{
}

- (PISegmentationLoading)segmentationLoading
{
  return (PISegmentationLoading *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLayerStackRequest:(id)a3
{
}

- (PIParallaxCompoundLayerStackRequest)layerStackRequest
{
  return self->_layerStackRequest;
}

- (void)setEditModel:(id)a3
{
}

- (PUWallpaperPosterEditModel)editModel
{
  return self->_editModel;
}

- (unint64_t)signpost
{
  return self->_signpost;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PFPosterMedia)currentPosterMedia
{
  return self->_currentPosterMedia;
}

- (PUWallpaperPosterEditViewModel)editViewModel
{
  return self->_editViewModel;
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPinchToZoomHintTitle:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  v5 = [v4 presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v5 transitionCoordinator];
    if ([v6 initiallyInteractive])
    {
      objc_initWeak(&location, self);
      uint64_t v7 = MEMORY[0x1E4F143A8];
      uint64_t v8 = 3221225472;
      v9 = __71__PUWallpaperPosterEditorController_presentationControllerWillDismiss___block_invoke;
      v10 = &unk_1E5F2C068;
      objc_copyWeak(&v11, &location);
      [v6 notifyWhenInteractionChangesUsingBlock:&v7];
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PUWallpaperPosterEditorController *)self _handlePhotoPickerResults:0];
    }
    [(PUWallpaperPosterEditorController *)self _stopListeningForExtensionHostResignationNotification];
  }
}

void __71__PUWallpaperPosterEditorController_presentationControllerWillDismiss___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handlePhotoPickerResults:0];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [(PUWallpaperPosterEditorController *)self observedPlayerItem];
  v14 = (void *)v13;
  if ((void *)BackgroundViewObservationContext == a6)
  {
    [(PUWallpaperPosterEditorController *)self _updateContainerFrame];
  }
  else if ((void *)PlayerItemObservationContext == a6)
  {
    if ((id)v13 == v11)
    {
      uint64_t v15 = [v11 status];
      if (v15 == 1)
      {
        v18 = [MEMORY[0x1E4F8A2C0] globalSettings];
        int v19 = [v18 disableMADForSettlingEffect];

        if (v19)
        {
          if (v11) {
            [v11 duration];
          }
          else {
            memset(&time, 0, sizeof(time));
          }
          CMTimeMultiplyByFloat64(&v23, &time, 0.5);
          CMTime v21 = v23;
          [v11 setForwardPlaybackEndTime:&v21];
        }
      }
      else if (v15 == 2)
      {
        v16 = PLWallpaperGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = [v11 error];
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Settling effect preview video failed to load: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)PUWallpaperPosterEditorController;
    [(PUWallpaperPosterEditorController *)&v20 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updatePosterConfigurationForCallServices:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 userInfo];
  v6 = (void *)[v5 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v9 = v8;

  id v10 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  id v11 = [v10 assetUUID];

  id v12 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v13 = [v12 segmentationItem];
  v14 = [v13 regions];

  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F8A388] dictionaryFromRegions:v14];
    [v9 setObject:v15 forKeyedSubscript:@"regions"];
  }
  else
  {
    [v9 setObject:0 forKeyedSubscript:@"regions"];
  }
  v16 = [(PUWallpaperPosterEditorController *)self _fetchMePerson];
  if (v16)
  {
    id v33 = v4;
    v17 = (void *)MEMORY[0x1E4F38EB8];
    v39[0] = v11;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    int v19 = [(PUWallpaperPosterEditorController *)self photoLibrary];
    objc_super v20 = [v19 librarySpecificFetchOptions];
    CMTime v21 = [v17 fetchAssetsWithLocalIdentifiers:v18 options:v20];
    v22 = [v21 firstObject];

    if (v22)
    {
      CMTime v23 = (void *)MEMORY[0x1E4F90428];
      v38 = v22;
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      v25 = [v23 facesForPerson:v16 inAssets:v24];

      uint64_t v26 = [v25 count];
      BOOL v27 = v26 != 0;
      v28 = PLWallpaperGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        if (v26) {
          v29 = @"YES";
        }
        else {
          v29 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        v35 = v29;
        __int16 v36 = 2048;
        uint64_t v37 = [v25 count];
        _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_INFO, "Setting representsDeviceOwner to %@: found %lu faces", buf, 0x16u);
      }
    }
    else
    {
      v25 = PLWallpaperGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v11;
        _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_ERROR, "Could not find asset for %@, not setting representsDeviceOwner flag", buf, 0xCu);
      }
      BOOL v27 = 0;
    }
    id v4 = v33;
  }
  else
  {
    BOOL v27 = 0;
  }
  v30 = [NSNumber numberWithBool:v27];
  [v9 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F8D138]];

  if (v11)
  {
    v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[__CFString hash](v11, "hash"));
    [v9 setObject:v31 forKeyedSubscript:@"hashedAssetIdentifier"];
  }
  else
  {
    [v9 setObject:0 forKeyedSubscript:@"hashedAssetIdentifier"];
  }
  [v9 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F8D130]];
  v32 = (void *)[v9 copy];
  [v4 setUserInfo:v32];
}

- (id)_fetchMePerson
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v22 = 0;
  v3 = [v2 suggestedMePersonIdentifierWithError:&v22];
  id v4 = v22;

  if (!v3)
  {
    uint64_t v7 = PLWallpaperGetLog();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    id v8 = "No suggestedMePerson: %@";
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    goto LABEL_9;
  }
  v5 = [MEMORY[0x1E4F90428] personWithLocalIdentifier:v3];
  v6 = PLWallpaperGetLog();
  uint64_t v7 = v6;
  if (!v5)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 138412290;
    v24 = v3;
    id v8 = "No PHPerson found for suggestedPersonIdentifier: %@";
    v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_9:
    _os_log_impl(&dword_1AE9F8000, v9, v10, v8, buf, 0xCu);
LABEL_10:

    id v11 = [MEMORY[0x1E4F90428] fetchMeContact];
    uint64_t v7 = v11;
    if (v11)
    {
      id v12 = (void *)MEMORY[0x1E4F90428];
      uint64_t v13 = [v11 identifier];
      v5 = [v12 personWithPersonUri:v13];

      v14 = PLWallpaperGetLog();
      uint64_t v15 = v14;
      if (v5)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v7;
          __int16 v25 = 2112;
          uint64_t v26 = v5;
          _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_INFO, "Found person for Me contact: contact %@, person %@", buf, 0x16u);
        }
        goto LABEL_20;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        v16 = "No PHPerson found for Me contact: %@";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_ERROR;
        uint32_t v19 = 12;
        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v15 = PLWallpaperGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v16 = "No Me contact found";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 2;
LABEL_18:
        _os_log_impl(&dword_1AE9F8000, v17, v18, v16, buf, v19);
      }
    }
    v5 = 0;
LABEL_20:

    goto LABEL_21;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v3;
    __int16 v25 = 2112;
    uint64_t v26 = v5;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "Found suggestedMePerson: identifier %@, person %@", buf, 0x16u);
  }
LABEL_21:

  id v20 = v5;
  return v20;
}

- (void)_saveWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(PUWallpaperPosterEditorController *)self setFinalizationState:1];
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5F2A108;
  objc_copyWeak(&v77, location);
  id v58 = v4;
  id v76 = v58;
  v59 = _Block_copy(aBlock);
  v5 = [(PUWallpaperPosterEditorController *)self environment];
  v6 = objc_msgSend(v5, "pu_targetAssetDirectory");

  if (v6)
  {
    uint64_t v7 = PLWallpaperGetLog();
    os_signpost_id_t v8 = [(PUWallpaperPosterEditorController *)self signpost];
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PUWallpaperPosterEditorController.Saving", "", (uint8_t *)&buf, 2u);
    }

    v9 = PULocalizedString(@"PHOTOS_WALLPAPER_SAVING_PROGRESS_INDICATOR_TITLE");
    [(PUWallpaperPosterEditorController *)self _showProgressIndicator:v9 determinate:[(PUWallpaperPosterEditorController *)self _isShuffle]];

    os_log_type_t v10 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v11 = (void *)[v10 copy];

    LODWORD(v10) = [(PUWallpaperPosterEditorController *)self wantsLowLuminanceContent];
    int v12 = [MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration];
    uint64_t v13 = 5;
    if (!v10) {
      uint64_t v13 = 1;
    }
    if (v12) {
      uint64_t v14 = v13 | 0x22;
    }
    else {
      uint64_t v14 = v13;
    }
    uint64_t v15 = [(PUWallpaperPosterEditorController *)self environment];
    int v16 = objc_msgSend(v15, "px_isCallServices");

    uint64_t v17 = v14 | 2;
    if (!v16) {
      uint64_t v17 = v14;
    }
    uint64_t v57 = v17;
    if ((v17 & 4) != 0) {
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") | 4);
    }
    os_log_type_t v18 = [(PUWallpaperPosterEditorController *)self editor];
    int v19 = objc_msgSend(v18, "pu_isDepthEffectDisallowed");

    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CMTime v21 = objc_msgSend(NSNumber, "numberWithBool:", -[PUWallpaperPosterEditorController isAnySmartAlbumAvailable](self, "isAnySmartAlbumAvailable"));
    [v20 setObject:v21 forKeyedSubscript:@"smart_shuffle_available"];

    id v22 = objc_msgSend(NSNumber, "numberWithBool:", -[PUWallpaperPosterEditorController isInitialSave](self, "isInitialSave"));
    [v20 setObject:v22 forKeyedSubscript:@"is_initial_save"];

    if ([(PUWallpaperPosterEditorController *)self _isShuffle])
    {
      CMTime v23 = [(PUWallpaperPosterEditorController *)self editModel];
      [v23 performChanges:&__block_literal_global_811];

      [(PUWallpaperPosterEditorController *)self _savePosterEditConfigurationForCurrentPosterMedia];
      v24 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
      id v25 = objc_alloc_init(MEMORY[0x1E4F8CD08]);
      uint64_t v26 = [v24 style];
      uint64_t v27 = [v26 bakedStyle];
      [v25 setStyle:v27];

      uint64_t v28 = v19 ^ 1u;
      [v25 setIsDepthAvailable:v28];
      if ([(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth])
      {
        uint64_t v29 = [v24 depthEnabledForAllMedia];
        [v25 setIsDepthEnabled:v29 & v28];
        [v25 setIsLandscapeDepthEnabled:v29];
      }
      objc_msgSend(v25, "setNormalizedVisibleFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
      [v11 setEditConfiguration:v25];
      v30 = [(PUWallpaperPosterEditorController *)self environment];
      uint64_t v31 = objc_msgSend(v30, "px_significantEventsCounter");

      v32 = [v11 media];
      int64_t v33 = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v31, [v32 count]);

      unint64_t v34 = [(PUWallpaperPosterEditorController *)self shuffleAssetIndex];
      v35 = [v11 media];
      int64_t v36 = v34 % [v35 count];

      if (v36 < v33)
      {
        uint64_t v37 = [v11 media];
        [v37 count];
      }
      v38 = [v11 media];
      v39 = PXArrayRotate();
      [v11 setMedia:v39];

      v40 = [v11 layoutConfiguration];

      if (!v40)
      {
        v41 = [(PUWallpaperPosterEditorController *)self editViewModel];
        v42 = [v41 layoutConfiguration];
        [v11 setLayoutConfiguration:v42];
      }
      v43 = [v11 analyticsPayload];
      [v20 addEntriesFromDictionary:v43];

      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.wallpaper.editorSaved" withPayload:v20];
      v44 = [v11 media];
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2_816;
      v73[3] = &unk_1E5F28C60;
      objc_copyWeak(&v74, location);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_4;
      v68[3] = &unk_1E5F26B98;
      id v69 = v11;
      id v45 = v6;
      id v70 = v45;
      v71 = self;
      id v72 = v59;
      [v24 exportResourcesForFinalPosterMedia:v44 options:v57 assetDirectory:v45 progressHandler:v73 completion:v68];

      objc_destroyWeak(&v74);
    }
    else
    {
      v46 = [(PUWallpaperPosterEditorController *)self editViewModel];
      v24 = [v46 posterEditConfigurationRepresentation];
      objc_msgSend(v24, "setIsDepthAvailable:", objc_msgSend(v24, "isDepthAvailable") & (v19 ^ 1));
      [v11 setEditConfiguration:v24];
      v47 = [v46 layoutConfiguration];
      [v11 setLayoutConfiguration:v47];

      v48 = [v11 analyticsPayload];
      [v20 addEntriesFromDictionary:v48];

      [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.wallpaper.editorSaved" withPayload:v20];
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") & 0xFFFFFFFFFFFFFFFDLL);
      objc_msgSend(v11, "setOptions:", objc_msgSend(v11, "options") & 0xFFFFFFFFFFFFFFFELL);
      if ([v46 settlingEffectEnabled]) {
        v49 = (void *)(v57 | 0x40);
      }
      else {
        v49 = (void *)v57;
      }
      if ([v46 settlingEffectEnabled]) {
        v50 = @"PHOTOS_WALLPAPER_SWITCHER_TITLE_LIVE_PHOTO";
      }
      else {
        v50 = @"PHOTOS_WALLPAPER_SWITCHER_TITLE_PHOTOS";
      }
      v51 = [(PUWallpaperPosterEditorController *)self environment];
      v52 = objc_msgSend(v51, "pu_targetConfiguration");
      objc_msgSend(v52, "setPu_displayNameLocalizationKey:", v50);

      v53 = [(PUWallpaperPosterEditorController *)self environment];
      char v54 = objc_msgSend(v53, "px_isCallServices");

      objc_initWeak(&buf, self);
      v55 = [(PUWallpaperPosterEditorController *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_824;
      block[3] = &unk_1E5F26BC0;
      id v61 = v46;
      id v64 = v59;
      char v66 = v54;
      id v56 = v46;
      objc_copyWeak(v65, &buf);
      id v62 = v11;
      id v63 = v6;
      v65[1] = v49;
      dispatch_async(v55, block);

      objc_destroyWeak(v65);
      objc_destroyWeak(&buf);
    }
  }
  else
  {
    (*((void (**)(void *, void, void))v59 + 2))(v59, 0, 0);
  }

  objc_destroyWeak(&v77);
  objc_destroyWeak(location);
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5F26B70;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  char v12 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v11);
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2_816(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E5F2B980;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    id v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v18 = v3;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "Failed to export shuffle assets: %{public}@", buf, 0xCu);
    }

    uint64_t v5 = *(void *)(a1 + 56);
    id v6 = [v3 allValues];
    id v7 = [v6 firstObject];
    (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v7);
  }
  else
  {
    os_signpost_id_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    id v16 = 0;
    int v10 = [v8 saveToURL:v9 error:&v16];
    id v6 = v16;
    id v11 = PLWallpaperGetLog();
    char v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [*(id *)(a1 + 40) path];
        *(_DWORD *)id buf = 138543362;
        id v18 = v13;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_INFO, "Successfully saved shuffle poster config to directory: %{public}@'", buf, 0xCu);
      }
      [*(id *)(a1 + 48) _updateShuffleSuggestionFeaturedStateIfNeededForConfiguration:*(void *)(a1 + 32)];
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = [*(id *)(a1 + 40) path];
        *(_DWORD *)id buf = 138543618;
        id v18 = v15;
        __int16 v19 = 2114;
        id v20 = v6;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Failed to save shuffle poster configuration to directory: '%{public}@', error: %{public}@", buf, 0x16u);
      }
      uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    }
    v14();
  }
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_824(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) segmentationItem];

  if (v2)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      [WeakRetained _updatePosterConfigurationForCallServices:*(void *)(a1 + 40)];
    }
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v23 = 0;
    [v4 saveToURL:v5 error:&v23];
    id v6 = v23;
    id v7 = *(void **)(a1 + 48);
    os_signpost_id_t v8 = [*(id *)(a1 + 40) media];
    uint64_t v9 = [v8 firstObject];
    int v10 = [v9 subpath];
    id v11 = [v7 URLByAppendingPathComponent:v10];

    char v12 = (void *)MEMORY[0x1E4F8A390];
    uint64_t v13 = [*(id *)(a1 + 32) segmentationItem];
    uint64_t v14 = *(void *)(a1 + 72);
    uint64_t v15 = [*(id *)(a1 + 40) editConfiguration];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_825;
    v20[3] = &unk_1E5F2A470;
    id v21 = v11;
    id v22 = *(id *)(a1 + 56);
    id v16 = v11;
    id v17 = (id)[v12 saveSegmentationItem:v13 layerStackOptions:v14 configuration:v15 style:0 layout:0 toWallpaperURL:v16 completion:v20];
  }
  else
  {
    id v18 = PLWallpaperGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)id buf = 138412290;
      uint64_t v25 = v19;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "failed to save wallpaper: view model has nil segmentation item %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_825(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) path];
      int v7 = 138543618;
      os_signpost_id_t v8 = v5;
      __int16 v9 = 2114;
      id v10 = v3;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "failed to save wallpaper to file: '%{public}@', error: %{public}@", (uint8_t *)&v7, 0x16u);
    }
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateProgressIndicator:*(double *)(a1 + 40)];
}

uint64_t __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_809(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:1 forReason:@"shuffleSave"];
}

void __64__PUWallpaperPosterEditorController__saveWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _hideProgressIndicator];
    id v4 = PLWallpaperGetLog();
    uint64_t v5 = [v3 signpost];
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)int v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_END, v6, "PUWallpaperPosterEditorController.Saving", "", v7, 2u);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handlePosterSaved:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  [(PUWallpaperPosterEditorController *)self setFinalizationState:v7];
  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    os_signpost_id_t v8 = [(PUWallpaperPosterEditorController *)self editModel];
    [v8 performChanges:&__block_literal_global_778];
  }
  if (v4)
  {
    __int16 v9 = [(PUWallpaperPosterEditorController *)self editor];
    objc_msgSend(v9, "pu_requestDismissalWithAction:", 1);
  }
  else
  {
    if ([(PUWallpaperPosterEditorController *)self _isShuffle]) {
      [(PUWallpaperPosterEditorController *)self _createShuffleResourceManager];
    }
    BOOL v10 = [(PUWallpaperPosterEditorController *)self _isShuffle];
    uint64_t v11 = &stru_1F06BE7B8;
    if (v10) {
      uint64_t v11 = @"SHUFFLE_";
    }
    v30 = v11;
    char v12 = [NSString stringWithFormat:@"PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_TITLE", v30];
    uint64_t v29 = PULocalizedString(v12);

    id v13 = v6;
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    uint64_t v15 = v13;
    do
    {
      id v16 = v15;
      BOOL v17 = +[PUErrorPresentationController isNetworkRelatedError:v15];
      id v18 = [v15 userInfo];
      uint64_t v15 = [v18 objectForKeyedSubscript:v14];
    }
    while (!v17 && v15);
    if (v17) {
      uint64_t v19 = @"PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_MESSAGE_CONNECTION";
    }
    else {
      uint64_t v19 = @"PHOTOS_WALLPAPER_EDITOR_SAVING_%@FAILED_MESSAGE";
    }
    id v20 = objc_msgSend(NSString, "stringWithFormat:", v19, v30);
    id v21 = PULocalizedString(v20);

    if (MEMORY[0x1B3E7A510]())
    {
      uint64_t v22 = [v21 stringByAppendingFormat:@"\n\nError (Internal):\n%@", v13];

      id v21 = (void *)v22;
    }
    id v23 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v29 message:v21 preferredStyle:1];
    v24 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v25 = PXLocalizedString();
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_2;
    v32[3] = &unk_1E5F2BF98;
    v32[4] = self;
    uint64_t v26 = [v24 actionWithTitle:v25 style:1 handler:v32];
    [v23 addAction:v26];

    if (MEMORY[0x1B3E7A510]())
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_3;
      v31[3] = &unk_1E5F2BF98;
      v31[4] = self;
      uint64_t v27 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Tap to Radar (Internal)" style:0 handler:v31];
      [v23 addAction:v27];
    }
    uint64_t v28 = [(PUWallpaperPosterEditorController *)self editor];
    [v28 presentViewController:v23 animated:1 completion:0];
  }
}

void __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editor];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

uint64_t __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tapToRadar];
}

uint64_t __62__PUWallpaperPosterEditorController__handlePosterSaved_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:0 forReason:@"shuffleSave"];
}

- (BOOL)wantsLowLuminanceContent
{
  if (PFPosterWantsLowLuminanceContent())
  {
    id v3 = [(PUWallpaperPosterEditorController *)self environment];
    int v4 = objc_msgSend(v3, "px_isCallServices") ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)solidColorHomeScreenColorPickerConfigurationForEditor:(id)a3
{
  int v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v5 = [v4 segmentationItem];
  id v6 = [v5 colorAnalysis];

  uint64_t v7 = [(PUWallpaperPosterEditorController *)self editViewModel];
  os_signpost_id_t v8 = [v7 currentLayerStackViewModel];
  __int16 v9 = [v8 style];

  BOOL v10 = [v9 defaultDominantColorWithAnalysis:v6];
  uint64_t v11 = objc_msgSend(v10, "pu_UIColor");
  id v12 = objc_alloc_init((Class)getPREditorColorPickerConfigurationClass());
  [v12 setSelectedColor:v11];

  return v12;
}

- (double)editor:(id)a3 luminanceForLook:(id)a4 inRect:(CGRect)a5
{
  id v6 = a4;
  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    double v7 = *MEMORY[0x1E4F8CFC8];
  }
  else
  {
    os_signpost_id_t v8 = [v6 identifier];
    __int16 v9 = [(PUWallpaperPosterEditorController *)self editViewModel];
    [v9 currentClockAreaLuminanceForStyleKind:v8];
    double v7 = v10;
  }
  return v7;
}

- (id)trailingMenuElementsForEditor:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [(PUWallpaperPosterEditorController *)self _colorPickerAction];
  uint64_t v6 = [(PUWallpaperPosterEditorController *)self _toggleHighKeyLowKeyAction];
  double v7 = (void *)v6;
  os_signpost_id_t v8 = v5;
  if (v5 || (os_signpost_id_t v8 = (void *)v6) != 0) {
    [v4 addObject:v8];
  }
  __int16 v9 = [(PUWallpaperPosterEditorController *)self _actionsMenu];
  if (v9) {
    [v4 addObject:v9];
  }

  return v4;
}

- (id)leadingMenuElementsForEditor:(id)a3
{
  id v4 = a3;
  if ([(PUWallpaperPosterEditorController *)self _attemptedSettlingEffect]) {
    BOOL v5 = [(PUWallpaperPosterEditorController *)self loadingSettlingEffect];
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v7 = [(PUWallpaperPosterEditorController *)self _photoPickerAction];
  if (v7) {
    [v6 addObject:v7];
  }
  uint64_t v8 = [(PUWallpaperPosterEditorController *)self _toggleSettlingEffectAction];
  __int16 v9 = (void *)v8;
  if (v5)
  {
    double v10 = objc_msgSend(v4, "pu_placeholderAction");
    [v6 addObject:v10];
  }
  else if (v8)
  {
    [v6 addObject:v8];
  }

  return v6;
}

- (void)editor:(id)a3 didTransitionToLook:(id)a4 progress:(double)a5
{
  id v8 = a4;
  __int16 v9 = objc_msgSend(a3, "pu_currentLook");
  id v11 = [v9 identifier];

  double v10 = [v8 identifier];

  [(PUWallpaperPosterEditorController *)self transitionBetweenStyleWithKind:v11 andKind:v10 progress:a5];
}

- (id)initialLookIdentifierForEditor:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUWallpaperPosterEditorController *)self editViewModel];
  id v6 = v5;
  if (v5)
  {
    double v7 = [v5 currentStyles];
    if ([v7 count] && !objc_msgSend(v6, "settlingEffectEnabled"))
    {
      __int16 v9 = [(PUWallpaperPosterEditorController *)self currentEditConfiguration];
      double v10 = [v6 currentLayerStackViewModel];
      id v11 = [v10 style];
      id v12 = [v11 kind];
      id v13 = v12;
      if (v12)
      {
        id v14 = v12;
      }
      else
      {
        uint64_t v15 = [v9 style];
        id v14 = [v15 kind];
      }
      if (!v14)
      {
        id v16 = PLWallpaperGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Cannot determine current style from either edit configuration or layer stack, using Original as fallback", buf, 2u);
        }

        id v14 = (id)*MEMORY[0x1E4F8D020];
      }
      BOOL v17 = [v6 currentStyleKinds];
      if ([v17 count] && objc_msgSend(v17, "indexOfObject:", v14) == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v18 = PLWallpaperGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id buf = 138412290;
          id v31 = v14;
          _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_ERROR, "Initial look styleKind %@ not found in availableStyles", buf, 0xCu);
        }

        id v19 = (id)*MEMORY[0x1E4F8D020];
        id v14 = v19;
      }
      id v20 = [(PUWallpaperPosterEditorController *)self looksForEditor:v4];
      id v21 = v14;
      uint64_t v29 = v21;
      if (PXExists())
      {
        id v8 = v21;
      }
      else
      {
        uint64_t v22 = [v20 firstObject];
        uint64_t v23 = [v22 identifier];
        v24 = (void *)v23;
        uint64_t v25 = (void *)*MEMORY[0x1E4F8D020];
        if (v23) {
          uint64_t v25 = (void *)v23;
        }
        id v8 = v25;

        uint64_t v26 = PLWallpaperGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = PXMap();
          *(_DWORD *)id buf = 138543874;
          id v31 = v8;
          __int16 v32 = 2114;
          int64_t v33 = v27;
          __int16 v34 = 2114;
          id v35 = v8;
          _os_log_impl(&dword_1AE9F8000, v26, OS_LOG_TYPE_ERROR, "Initial look %{public}@ is not present in looks array: %{public}@. Falling back to %{public}@.", buf, 0x20u);
        }
      }
    }
    else
    {
      id v8 = (id)*MEMORY[0x1E4F8D020];
    }
  }
  else
  {
    id v8 = (id)*MEMORY[0x1E4F8D020];
  }

  return v8;
}

uint64_t __68__PUWallpaperPosterEditorController_initialLookIdentifierForEditor___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __68__PUWallpaperPosterEditorController_initialLookIdentifierForEditor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (id)looksForEditor:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v4 = [v3 currentStyles];
  if (![v4 count] || objc_msgSend(v3, "settlingEffectEnabled"))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F8CCA8]);
    id v6 = (void *)[v5 initWithKind:*MEMORY[0x1E4F8D020] parameters:MEMORY[0x1E4F1CC08] colorSuggestions:MEMORY[0x1E4F1CBF0]];
    double v7 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v6];
    v11[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    uint64_t v4 = (void *)v8;
  }
  __int16 v9 = PXMap();

  return v9;
}

_PUPosterEditingLook *__52__PUWallpaperPosterEditorController_looksForEditor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 kind];
  id v5 = [v3 clockFont];
  id v6 = [v3 clockColor];
  double v7 = [MEMORY[0x1E4F8CC78] whiteColor];
  char v8 = [v6 isEqualToParallaxColor:v7];

  if ([*(id *)(a1 + 32) _isShuffle] & 1) != 0 || (v8)
  {
    char v13 = PIParallaxStylePrefersVibrantClockForKind();
    id PRPosterColorClass = getPRPosterColorClass();
    if (v13) {
      [PRPosterColorClass vibrantMaterialColor];
    }
    else {
    id v12 = [PRPosterColorClass vibrantMonochromeColor];
    }
  }
  else
  {
    __int16 v9 = [v3 clockColor];
    double v10 = objc_msgSend(v9, "pu_UIColor");
    [v3 clockVibrancy];
    id v11 = objc_msgSend(v10, "colorWithAlphaComponent:");

    id v12 = (void *)[objc_alloc((Class)getPRPosterColorClass()) initWithColor:v11 preferredStyle:2];
  }
  uint64_t v15 = PUPosterLookLocalizedDisplayNameForLayerStyleKind(v4);
  id v16 = [[_PUPosterEditingLook alloc] initWithIdentifier:v4 displayName:v15 pu_timeAppearance:2 pu_timeFontIdentifier:v5 pu_timeFontColor:v12];

  return v16;
}

- (void)_transferSubviewsFrom:(id)a3 to:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(a3, "subviews", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addSubview:*(void *)(*((void *)&v11 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setFloatingView:(id)a3
{
  uint64_t v9 = (UIView *)a3;
  uint64_t v4 = self->_floatingView;
  floatingView = v9;
  if (v4 != v9)
  {
    id v6 = v4;
    char v7 = [(UIView *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    [(PUWallpaperPosterEditorController *)self _transferSubviewsFrom:self->_floatingView to:v9];
    uint64_t v8 = v9;
    floatingView = self->_floatingView;
    self->_floatingView = v8;
  }

LABEL_5:
}

- (void)setForegroundView:(id)a3
{
  uint64_t v9 = (UIView *)a3;
  uint64_t v4 = self->_foregroundView;
  foregroundView = v9;
  if (v4 != v9)
  {
    id v6 = v4;
    char v7 = [(UIView *)v4 isEqual:v9];

    if (v7) {
      goto LABEL_5;
    }
    [(PUWallpaperPosterEditorController *)self _transferSubviewsFrom:self->_foregroundView to:v9];
    uint64_t v8 = v9;
    foregroundView = self->_foregroundView;
    self->_foregroundView = v8;
  }

LABEL_5:
}

- (void)setBackgroundView:(id)a3
{
  char v7 = (UIView *)a3;
  id v5 = self->_backgroundView;
  if (v5 == v7)
  {
  }
  else
  {
    char v6 = [(UIView *)v5 isEqual:v7];

    if ((v6 & 1) == 0)
    {
      [(PUWallpaperPosterEditorController *)self _transferSubviewsFrom:self->_backgroundView to:v7];
      [(UIView *)self->_backgroundView removeObserver:self forKeyPath:@"layer.bounds" context:&BackgroundViewObservationContext];
      objc_storeStrong((id *)&self->_backgroundView, a3);
      [(UIView *)self->_backgroundView addObserver:self forKeyPath:@"layer.bounds" options:0 context:&BackgroundViewObservationContext];
    }
  }
}

- (void)editor:(id)a3 populateViews:(id)a4 forLook:(id)a5
{
  id v6 = a4;
  char v7 = [(PUWallpaperPosterEditorController *)self backgroundView];

  uint64_t v8 = [v6 backgroundView];
  [(PUWallpaperPosterEditorController *)self setBackgroundView:v8];

  uint64_t v9 = [v6 foregroundView];
  [(PUWallpaperPosterEditorController *)self setForegroundView:v9];

  uint64_t v10 = [v6 floatingView];

  [(PUWallpaperPosterEditorController *)self setFloatingView:v10];
  [(PUWallpaperPosterEditorController *)self _updateContainerFrame];
  if (![(PUWallpaperPosterEditorController *)self isPreviewingSettlingEffect] || !v7)
  {
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
    [(PUWallpaperPosterEditorController *)self _updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:v11];
  }
}

- (void)setEnvironment:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_environment, a3);
  if (self->_environment)
  {
    [(PUWallpaperPosterEditorController *)self _updateDeviceOrientation];
    [(PUWallpaperPosterEditorController *)self _updateHintLabelConstraints];
    if (objc_msgSend(v6, "px_isCallServices"))
    {
      id v5 = [MEMORY[0x1E4F8CCC0] standardAlphabeticTextParameters];
      [MEMORY[0x1E4F8CCC0] setSystemParameters:v5];
    }
  }
}

- (void)editor:(id)a3 finalizeWithCompletion:(id)a4
{
}

- (BOOL)editorShouldBeginFinalization:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self finalizationState];
  if (!v5)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke;
    v7[3] = &unk_1E5F2D940;
    objc_copyWeak(&v8, &location);
    [(PUWallpaperPosterEditorController *)self _saveWithCompletionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5 == 2;
}

void __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke_2;
  block[3] = &unk_1E5F2A840;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  char v10 = a2;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __67__PUWallpaperPosterEditorController_editorShouldBeginFinalization___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handlePosterSaved:*(unsigned __int8 *)(a1 + 48) error:*(void *)(a1 + 32)];
}

- (void)editor:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v6 = a4;
  char v7 = PLWallpaperGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_INFO, "editor update", v8, 2u);
  }

  [(PUWallpaperPosterEditorController *)self setEnvironment:v6];
}

- (void)editorDidInvalidate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = PLWallpaperGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_INFO, "editor invalidate", buf, 2u);
  }

  id v5 = PLWallpaperGetLog();
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  char v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "editorDidInvalidate", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v9 = mach_absolute_time();
  [(PUWallpaperPosterEditorController *)self cancelPendingHint];
  [MEMORY[0x1E4F90908] removeAllPresentationDelegates];
  [(PUWallpaperPosterEditorController *)self _stopObservingPlayerItem];
  char v10 = [(PUWallpaperPosterEditorController *)self editViewModel];
  [v10 shutdownWithTimeout:10.0];

  uint64_t v11 = [(PUWallpaperPosterEditorController *)self segmentationLoading];
  [v11 cancel];

  long long v12 = [(PUWallpaperPosterEditorController *)self layerStackRequest];
  long long v13 = [v12 renderContext];
  [v13 cancelAllRequests];

  long long v14 = [(PUWallpaperPosterEditorController *)self settlingEffectRequest];
  uint64_t v15 = [v14 renderContext];
  [v15 cancelAllRequests];

  uint64_t v16 = [(PUWallpaperPosterEditorController *)self segmentationLoadingGroup];
  dispatch_time_t v17 = dispatch_time(0, 10000000000);
  intptr_t v18 = dispatch_group_wait(v16, v17);

  if (v18)
  {
    id v19 = PLWallpaperGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_FAULT, "Timed out waiting for segmentation loading", buf, 2u);
    }
  }
  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    id v20 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    [v20 stopPreloadingResourcesWithTimeout:10.0];

    [(PUWallpaperPosterEditorController *)self setShuffleResourceManager:0];
  }
  BOOL v21 = [(PUWallpaperPosterEditorController *)self _isShuffle];
  BOOL v22 = [(PUWallpaperPosterEditorController *)self isLoading];
  BOOL v23 = [(PUWallpaperPosterEditorController *)self finalizationState] == 1;
  v24 = [(PUWallpaperPosterEditorController *)self editModel];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __57__PUWallpaperPosterEditorController_editorDidInvalidate___block_invoke;
  v31[3] = &__block_descriptor_35_e45_v16__0___PUWallpaperPosterMutableEditModel__8l;
  BOOL v32 = v21;
  BOOL v33 = v23;
  BOOL v34 = v22;
  [v24 performChanges:v31];

  [(PUWallpaperPosterEditorController *)self setPosterConfiguration:0];
  [(PUWallpaperPosterEditorController *)self setEnvironment:0];
  [(PUWallpaperPosterEditorController *)self setPhotoPickerViewController:0];
  [(PUWallpaperPosterEditorController *)self setEditModel:0];
  uint64_t v25 = [(PUWallpaperPosterEditorController *)self editor];
  [v25 dismissViewControllerAnimated:0 completion:0];

  [MEMORY[0x1E4F8A378] freeResources];
  uint64_t v26 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  uint64_t v29 = v8;
  v30 = v29;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v30, OS_SIGNPOST_INTERVAL_END, v6, "editorDidInvalidate", "", buf, 2u);
  }

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 136315394;
    uint64_t v37 = "editorDidInvalidate";
    __int16 v38 = 2048;
    double v39 = (float)((float)((float)((float)(v26 - v9) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
}

void __57__PUWallpaperPosterEditorController_editorDidInvalidate___block_invoke(unsigned char *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1[32] && a1[33])
  {
    [v3 setIdleTimerDisabled:0 forReason:@"shuffleSave"];
    id v3 = v4;
  }
  if (a1[34])
  {
    [v4 setIdleTimerDisabled:0 forReason:@"loading"];
    id v3 = v4;
  }
}

- (void)editor:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PLWallpaperGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v21 = 0;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "editor initialize", v21, 2u);
  }

  [MEMORY[0x1E4F90908] startObservingTips];
  [MEMORY[0x1E4F8A378] ensureResources];
  char v10 = [[PUWallpaperPosterEditModel alloc] initWithEditor:v7];
  [(PUWallpaperPosterEditorController *)self setEditModel:v10];

  id v11 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  long long v12 = objc_msgSend(v11, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  long long v13 = [v7 contentOverlayView];
  [v13 addSubview:v12];

  [(PUWallpaperPosterEditorController *)self setContentOverlayContainerView:v12];
  long long v14 = [(PUWallpaperPosterEditorController *)self styleDividerView];
  [v12 addSubview:v14];

  [(PUWallpaperPosterEditorController *)self _setupUserTransformView];
  [(PUWallpaperPosterEditorController *)self setEnvironment:v8];
  uint64_t v15 = objc_msgSend(v8, "pu_posterDescriptor");

  if (v15)
  {
    [(PUWallpaperPosterEditorController *)self setIsInitialSave:1];
    [(PUWallpaperPosterEditorController *)self _loadPosterDescriptor];
  }
  else
  {
    uint64_t v16 = objc_msgSend(v8, "pu_sourcePosterConfiguration");

    if (v16)
    {
      dispatch_time_t v17 = objc_msgSend(v8, "pu_sourcePosterConfiguration");
      if ([v17 options])
      {
        char v19 = objc_msgSend(v8, "px_isCallServices");

        if ((v19 & 1) == 0)
        {
          [(PUWallpaperPosterEditorController *)self setFadeInInitialLoad:1];
          [(PUWallpaperPosterEditorController *)self setHint:1];
          [(PUWallpaperPosterEditorController *)self setIsInitialSave:1];
        }
      }
      else
      {
      }
      [(PUWallpaperPosterEditorController *)self _loadSourcePosterConfiguration];
    }
    else
    {
      intptr_t v18 = [(PUWallpaperPosterEditorController *)self editViewModel];

      if (!v18)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:3627 description:@"asset not found"];

        abort();
      }
      [(PUWallpaperPosterEditorController *)self _loadEditViewModelAndUpdateLooks:1];
    }
  }
}

- (void)transitionBetweenStyleWithKind:(id)a3 andKind:(id)a4 progress:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = [v8 isEqualToString:v9];
  if (v10) {
    id v11 = v9;
  }
  else {
    id v11 = v8;
  }
  if (v10)
  {
    a5 = 0.0;
    id v12 = (id)*MEMORY[0x1E4F8D030];
  }
  else
  {
    id v12 = v9;
  }

  long long v13 = [(PUWallpaperPosterEditorController *)self editViewModel];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__PUWallpaperPosterEditorController_transitionBetweenStyleWithKind_andKind_progress___block_invoke;
  v14[3] = &__block_descriptor_56_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8lu32l8u48l8;
  v14[4] = v11;
  *(double *)&v14[5] = a5;
  v14[6] = v12;
  [v13 performChanges:v14];
}

uint64_t __85__PUWallpaperPosterEditorController_transitionBetweenStyleWithKind_andKind_progress___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 scrollToPosition:&v3];
}

- (void)_wallpaperFeedbackRadar
{
  v20[1] = *MEMORY[0x1E4F143B8];
  [(PUWallpaperPosterEditorController *)self _showProgressIndicator:@"Preparing Attachments…" determinate:0];
  long long v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v4 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v5 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  os_signpost_id_t v6 = [v5 assetUUID];

  id v7 = (void *)MEMORY[0x1E4F38EB8];
  v20[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
  id v9 = [v4 librarySpecificFetchOptions];
  int v10 = [v7 fetchAssetsWithUUIDs:v8 options:v9];
  id v11 = [v10 firstObject];

  if ([v11 isLivePhoto]) {
    uint64_t v12 = 34;
  }
  else {
    uint64_t v12 = 9;
  }
  long long v13 = [v3 currentLayerStackViewModel];
  long long v14 = [v13 compoundLayerStack];

  uint64_t v15 = [v3 currentLayerStackViewModel];
  uint64_t v16 = [v15 segmentationItem];

  dispatch_time_t v17 = +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:v11 suggestion:0 compoundLayerStack:v14 segmentationItem:v16 posterDescriptor:0 posterConfiguration:0 component:v12 completionHandler:0];
  [v17 setWantsSystemDiagnostics:0];
  [v17 setWantsPhotosDiagnostics:0];
  if ([v11 isLivePhoto]) {
    intptr_t v18 = @"[Maglev] Wallpaper Feedback: This Live Photo wallpaper is not good";
  }
  else {
    intptr_t v18 = @"[Maglev] Wallpaper Feedback: This wallpaper is not good";
  }
  [v17 setTitle:v18];
  [v17 setDescription:@"Please describe why you like or dislike this wallpaper:"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__PUWallpaperPosterEditorController__wallpaperFeedbackRadar__block_invoke;
  v19[3] = &unk_1E5F2E3B8;
  v19[4] = self;
  [v17 setCompletionHandler:v19];
  PXFileRadarWithConfiguration();
}

uint64_t __60__PUWallpaperPosterEditorController__wallpaperFeedbackRadar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideProgressIndicator];
}

- (void)_tapToRadarWithComponent:(int64_t)a3
{
  v42[1] = *MEMORY[0x1E4F143B8];
  [(PUWallpaperPosterEditorController *)self _showProgressIndicator:@"Preparing Attachments…" determinate:0];
  uint64_t v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
  id v5 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  os_signpost_id_t v6 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  uint64_t v7 = [v6 assetUUID];

  id v8 = (void *)MEMORY[0x1E4F38EB8];
  uint64_t v37 = (void *)v7;
  v42[0] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
  uint64_t v10 = [v5 librarySpecificFetchOptions];
  id v11 = [v8 fetchAssetsWithUUIDs:v9 options:v10];
  uint64_t v12 = [v11 firstObject];

  long long v13 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  objc_opt_class();
  LOBYTE(v10) = objc_opt_isKindOfClass();

  __int16 v38 = v5;
  if (v10)
  {
    long long v14 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
    uint64_t v15 = [v14 suggestionUUID];
    uint64_t v16 = [v5 librarySpecificFetchOptions];
    [v16 setFetchLimit:1];
    dispatch_time_t v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"uuid", v15];
    [v16 setPredicate:v17];

    intptr_t v18 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v16];
    id v35 = [v18 firstObject];
  }
  else
  {
    long long v14 = [v5 librarySpecificFetchOptions];
    [v14 setFetchLimit:1];
    char v19 = (void *)MEMORY[0x1E4F28BA0];
    id v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"type", 6);
    v41 = v20;
    BOOL v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    BOOL v22 = [v19 andPredicateWithSubpredicates:v21];
    [v14 setPredicate:v22];

    BOOL v23 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"subtype" ascending:1];
    uint64_t v40 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    [v14 setSortDescriptors:v24];

    uint64_t v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsContainingAsset:v12 withType:8 options:v14];
    id v35 = [v15 firstObject];
  }

  uint64_t v25 = [v4 currentLayerStackViewModel];
  uint64_t v26 = [v25 compoundLayerStack];

  uint64_t v27 = [v4 currentLayerStackViewModel];
  uint64_t v28 = [v27 segmentationItem];

  uint64_t v29 = [(PUWallpaperPosterEditorController *)self environment];
  v30 = objc_msgSend(v29, "pu_posterDescriptor");
  id v31 = [(PUWallpaperPosterEditorController *)self environment];
  objc_msgSend(v31, "pu_sourcePosterConfiguration");
  v32 = BOOL v34 = v4;
  BOOL v33 = +[PUWallpaperRadarAttachmentProvider radarConfigurationForAsset:v12 suggestion:v35 compoundLayerStack:v26 segmentationItem:v28 posterDescriptor:v30 posterConfiguration:v32 component:a3 completionHandler:0];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  void v39[2] = __62__PUWallpaperPosterEditorController__tapToRadarWithComponent___block_invoke;
  v39[3] = &unk_1E5F2E3B8;
  v39[4] = self;
  [v33 setCompletionHandler:v39];
  PXFileRadarWithConfiguration();
}

uint64_t __62__PUWallpaperPosterEditorController__tapToRadarWithComponent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _hideProgressIndicator];
}

- (void)_tapToRadar
{
}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  id v4 = [(PUWallpaperPosterEditorController *)self tipContainerViewController];
  long long v3 = [v4 view];
  [v3 removeFromSuperview];
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_signpost_id_t v6 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  uint64_t v7 = [(PUWallpaperPosterEditorController *)self tipContainerViewController];
  id v8 = [v7 view];

  [v6 bounds];
  objc_msgSend(v8, "setFrame:");
  [v6 addSubview:v8];
  [v5 setSourceView:v8];
  id v9 = [(PUWallpaperPosterEditorController *)self editor];
  uint64_t v10 = objc_msgSend(v9, "pu_viewForMenuElementIdentifier:", @"PUPosterEditorActionIdentifierSettlingEffect");

  if (v10)
  {
    v12[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [v5 setPassthroughViews:v11];

    [v10 frame];
    objc_msgSend(v5, "setSourceRect:");
  }
}

- (id)sourceItemForTipID:(id)a3
{
  long long v3 = [(PUWallpaperPosterEditorController *)self tipContainerViewController];
  id v4 = [v3 view];

  return v4;
}

- (id)presentationControllerForTipID:(id)a3
{
  tipContainerViewController = self->_tipContainerViewController;
  if (!tipContainerViewController)
  {
    id v5 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4FB1EC0]);
    os_signpost_id_t v6 = self->_tipContainerViewController;
    self->_tipContainerViewController = v5;

    uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
    id v8 = [(UIViewController *)self->_tipContainerViewController view];
    [v8 setBackgroundColor:v7];

    id v9 = [(UIViewController *)self->_tipContainerViewController view];
    [v9 setAutoresizingMask:45];

    tipContainerViewController = self->_tipContainerViewController;
  }
  return tipContainerViewController;
}

- (void)_presentSettlingEffectDebugView:(id)a3
{
  id v4 = a3;
  if (MEMORY[0x1B3E7A510]())
  {
    id v5 = [(PUWallpaperPosterEditorController *)self environment];
    char v6 = objc_msgSend(v5, "px_isCallServices");

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
      if (v7)
      {
        id v8 = [[PUWallpaperSettlingEffectDebugView alloc] initWithSegmentationItem:v4];
        objc_initWeak(&location, self);
        uint64_t v9 = MEMORY[0x1E4F143A8];
        uint64_t v10 = 3221225472;
        id v11 = __69__PUWallpaperPosterEditorController__presentSettlingEffectDebugView___block_invoke;
        uint64_t v12 = &unk_1E5F2E530;
        objc_copyWeak(&v13, &location);
        [(PUWallpaperSettlingEffectDebugView *)v8 setOnFileRadar:&v9];
        objc_msgSend(v7, "addSubview:", v8, v9, v10, v11, v12);
        [v7 bounds];
        CGRect v16 = CGRectInset(v15, 40.0, 200.0);
        -[PUWallpaperSettlingEffectDebugView setFrame:](v8, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __69__PUWallpaperPosterEditorController__presentSettlingEffectDebugView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tapToRadarWithComponent:10];
}

- (void)setLoadingSettlingEffect:(BOOL)a3
{
  if (self->_loadingSettlingEffect != a3)
  {
    self->_loadingSettlingEffect = a3;
    [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
  }
}

- (void)_animateScrollToStyleKindAnimatorUpdated
{
  long long v3 = [(PUWallpaperPosterEditorController *)self animateScrollToStyleKindStartingKind];
  id v4 = [(PUWallpaperPosterEditorController *)self animateScrollToStyleKindAnimator];
  [v4 presentationValue];
  double v6 = v5;

  uint64_t v7 = [(PUWallpaperPosterEditorController *)self animateScrollToStyleKindEndingKind];
  id v8 = [(PUWallpaperPosterEditorController *)self editViewModel];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__PUWallpaperPosterEditorController__animateScrollToStyleKindAnimatorUpdated__block_invoke;
  v10[3] = &__block_descriptor_56_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8lu32l8u48l8;
  v10[4] = v3;
  *(double *)&v10[5] = v6;
  v10[6] = v7;
  [v8 performChanges:v10];

  if (v6 == 1.0)
  {
    uint64_t v9 = [(PUWallpaperPosterEditorController *)self animateScrollToStyleKindCompletion];
    v9[2]();
  }
}

uint64_t __77__PUWallpaperPosterEditorController__animateScrollToStyleKindAnimatorUpdated__block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 scrollToPosition:&v3];
}

- (void)_animateScrollToStyleKind:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  uint64_t v9 = [v8 style];
  uint64_t v10 = [v9 kind];
  [(PUWallpaperPosterEditorController *)self setAnimateScrollToStyleKindStartingKind:v10];

  [(PUWallpaperPosterEditorController *)self setAnimateScrollToStyleKindEndingKind:v7];
  [(PUWallpaperPosterEditorController *)self setAnimateScrollToStyleKindCompletion:v6];

  id v11 = [(PUWallpaperPosterEditorController *)self animateScrollToStyleKindAnimator];
  if (!v11)
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F912A8]) initWithValue:0.0];
    [v12 registerChangeObserver:self context:"AnimateScrollToStyleKindAnimatorObservationContext"];
    [v12 setLabel:@"AnimateScrollToStyleKindAnimator"];
    [v12 setHighFrameRateReason:2228225];
    [(PUWallpaperPosterEditorController *)self setAnimateScrollToStyleKindAnimator:v12];
    id v11 = v12;
  }
  id v13 = v11;
  [v11 performChangesWithoutAnimation:&__block_literal_global_728];
  [v13 performChangesWithDuration:4 curve:&__block_literal_global_730 changes:0.3];
}

uint64_t __74__PUWallpaperPosterEditorController__animateScrollToStyleKind_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

uint64_t __74__PUWallpaperPosterEditorController__animateScrollToStyleKind_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

- (void)_enableSettlingEffect
{
  long long v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v4 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  objc_initWeak(&location, self);
  if (([v3 settlingEffectEnabled] & 1) == 0)
  {
    double v5 = [(PUWallpaperPosterEditorController *)self editViewModel];
    id v6 = [v5 originalLayerStackViewModel];
    char v7 = [v6 canEnableSettlingEffect];

    if (v7)
    {
      if (![(PUWallpaperPosterEditorController *)self settlingEffectToggleInProgress])
      {
        [(PUWallpaperPosterEditorController *)self setSettlingEffectToggleInProgress:1];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke;
        aBlock[3] = &unk_1E5F2E4E8;
        id v8 = v3;
        id v20 = v8;
        objc_copyWeak(&v21, &location);
        uint64_t v9 = (void (**)(void))_Block_copy(aBlock);
        uint64_t v10 = [v4 style];
        id v11 = [v10 kind];

        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        CGRect v16 = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_6;
        dispatch_time_t v17 = &unk_1E5F26688;
        id v12 = v11;
        id v18 = v12;
        [v8 performChanges:&v14];
        uint64_t v13 = *MEMORY[0x1E4F8D020];
        if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E4F8D020], v14, v15, v16, v17)) {
          v9[2](v9);
        }
        else {
          [(PUWallpaperPosterEditorController *)self _animateScrollToStyleKind:v13 completion:v9];
        }

        objc_destroyWeak(&v21);
      }
    }
    else
    {
      [(PUWallpaperPosterEditorController *)self _showSettlingEffectUnavailableTip];
    }
  }
  objc_destroyWeak(&location);
}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) performChanges:&__block_literal_global_720];
  v2 = (void *)MEMORY[0x1E4F90908];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_3;
  v3[3] = &unk_1E5F2E4E8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  [v2 dismissTip:v3];

  objc_destroyWeak(&v5);
}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 setSettlingEffectStateRestorationLayerStyleKind:*(void *)(a1 + 32)];
}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained editor];
  objc_msgSend(v4, "pu_updateLooks");

  id v5 = objc_loadWeakRetained(v2);
  [v5 _startSettlingEffectPreview];

  dispatch_time_t v6 = dispatch_time(0, 10000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_4;
  v7[3] = &unk_1E5F2E4E8;
  id v8 = *(id *)(a1 + 32);
  objc_copyWeak(&v9, v2);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v9);
}

void __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_4(id *a1)
{
  id v1 = a1;
  [a1[4] performChanges:&__block_literal_global_722];
  v1 += 5;
  id WeakRetained = objc_loadWeakRetained(v1);
  [WeakRetained _updateUserTransformView];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setSettlingEffectToggleInProgress:0];
}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 reframeToSettlingEffectBoundsIfNeeded];
}

uint64_t __58__PUWallpaperPosterEditorController__enableSettlingEffect__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setSettlingEffectEnabled:1];
}

- (void)_disableSettlingEffect
{
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  objc_initWeak(&location, self);
  if (([v3 settlingEffectEnabled] & 1) != 0
    && ![(PUWallpaperPosterEditorController *)self settlingEffectToggleInProgress])
  {
    [(PUWallpaperPosterEditorController *)self setSettlingEffectToggleInProgress:1];
    [v3 performChanges:&__block_literal_global_718];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    id v4[2] = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_2;
    v4[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v6, &location);
    id v5 = v3;
    [(PUWallpaperPosterEditorController *)self _stopSettlingEffectPreview:v4];

    objc_destroyWeak(&v6);
  }
  objc_destroyWeak(&location);
}

void __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_3;
  id v11 = &unk_1E5F2E4E8;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v3 = (void (**)(void))_Block_copy(&v8);
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_updateUserTransformView", v8, v9, v10, v11);

  id v5 = [*(id *)(a1 + 32) settlingEffectStateRestorationLayerStyleKind];
  id v6 = v5;
  if (v5 && ([v5 isEqualToString:*MEMORY[0x1E4F8D020]] & 1) == 0)
  {
    id v7 = objc_loadWeakRetained(v2);
    [v7 _animateScrollToStyleKind:v6 completion:v3];
  }
  else
  {
    v3[2](v3);
  }

  objc_destroyWeak(&v13);
}

void __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained editor];
  objc_msgSend(v4, "pu_updateLooks");

  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_4;
  v8[3] = &unk_1E5F26A78;
  void v8[4] = &v9;
  [v5 performChanges:v8];
  if (*((unsigned char *)v10 + 24))
  {
    id v6 = objc_loadWeakRetained(v2);
    [v6 _updateUserTransformView];
  }
  id v7 = objc_loadWeakRetained(v2);
  [v7 setSettlingEffectToggleInProgress:0];

  _Block_object_dispose(&v9, 8);
}

uint64_t __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 applySettlingEffectVisibleFrameRestoration];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__PUWallpaperPosterEditorController__disableSettlingEffect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSettlingEffectEnabled:0];
}

- (void)_showTrySettlingEffectTip
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  if (![(PUWallpaperPosterEditorController *)self loadingSettlingEffect]
    && ([v3 settlingEffectEnabled] & 1) == 0)
  {
    id v4 = [v3 originalLayerStackViewModel];
    if ([v4 canEnableSettlingEffect])
    {
      id v5 = [v3 segmentationItem];
      char v6 = [v5 settlingEffectHasInterestingMotion];

      if (v6)
      {
        [MEMORY[0x1E4F90908] presentTrySettlingEffectTip:self];
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  id v7 = PLWallpaperGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    if ([(PUWallpaperPosterEditorController *)self loadingSettlingEffect]) {
      uint64_t v8 = @"YES";
    }
    else {
      uint64_t v8 = @"NO";
    }
    if ([v3 settlingEffectEnabled]) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    uint64_t v10 = [v3 originalLayerStackViewModel];
    if ([v10 canEnableSettlingEffect]) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    char v12 = [v3 segmentationItem];
    int v14 = 138413058;
    if ([v12 settlingEffectHasInterestingMotion]) {
      id v13 = @"YES";
    }
    else {
      id v13 = @"NO";
    }
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    dispatch_time_t v17 = v9;
    __int16 v18 = 2112;
    char v19 = v11;
    __int16 v20 = 2112;
    id v21 = v13;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Cannot show try settling effect tip; loading: %@ settling enabled: %@ can enable settling: %@ interesting motion: %@",
      (uint8_t *)&v14,
      0x2Au);
  }
LABEL_22:
}

- (void)_showSettlingEffectUnavailableTip
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  if ([(PUWallpaperPosterEditorController *)self loadingSettlingEffect]
    || ([v3 settlingEffectEnabled] & 1) != 0
    || ([v3 originalLayerStackViewModel],
        id v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 canEnableSettlingEffect],
        v4,
        v5))
  {
    char v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if ([(PUWallpaperPosterEditorController *)self loadingSettlingEffect]) {
        id v7 = @"YES";
      }
      else {
        id v7 = @"NO";
      }
      if ([v3 settlingEffectEnabled]) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      uint64_t v9 = [v3 originalLayerStackViewModel];
      int v11 = 138412802;
      if ([v9 canEnableSettlingEffect]) {
        uint64_t v10 = @"YES";
      }
      else {
        uint64_t v10 = @"NO";
      }
      char v12 = v7;
      __int16 v13 = 2112;
      int v14 = v8;
      __int16 v15 = 2112;
      __int16 v16 = v10;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Cannot show settling effect unavailable tip; loading: %@ settling enabled: %@ can enable settling: %@",
        (uint8_t *)&v11,
        0x20u);
    }
  }
  else
  {
    [MEMORY[0x1E4F90908] presentFailedSettlingEffectTip:self];
  }
}

- (void)_toggleSettlingEffectEnabled
{
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  int v4 = [v3 settlingEffectEnabled];

  if (v4)
  {
    [(PUWallpaperPosterEditorController *)self _disableSettlingEffect];
  }
  else
  {
    [(PUWallpaperPosterEditorController *)self _enableSettlingEffect];
  }
}

- (BOOL)_attemptedSettlingEffect
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([(PUWallpaperPosterEditorController *)self _isShuffle]
    || ([(PUWallpaperPosterEditorController *)self environment],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_msgSend(v3, "px_isCallServices"),
        v3,
        (v4 & 1) != 0)
    || !PFPosterEnableSettlingEffect()
    || ![MEMORY[0x1E4F8A390] currentDeviceSupportsSettlingEffect])
  {
    LOBYTE(v13) = 0;
  }
  else
  {
    int v5 = [(PUWallpaperPosterEditorController *)self photoLibrary];
    if (v5)
    {
      char v6 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
      id v7 = [v6 assetUUID];

      if (v7)
      {
        uint64_t v8 = [v5 librarySpecificFetchOptions];
        [v8 setIncludeGuestAssets:1];
        uint64_t v9 = (void *)MEMORY[0x1E4F38EB8];
        v15[0] = v7;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
        int v11 = [v9 fetchAssetsWithUUIDs:v10 options:v8];
        char v12 = [v11 firstObject];

        unint64_t v13 = ((unint64_t)[v12 mediaSubtypes] >> 3) & 1;
      }
      else
      {
        LOBYTE(v13) = 0;
      }
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  return v13;
}

- (void)_stopObservingPlayerItem
{
  id v4 = [(PUWallpaperPosterEditorController *)self observedPlayerItem];
  if (v4)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F16020] object:v4];

    [v4 removeObserver:self forKeyPath:@"status" context:&PlayerItemObservationContext];
    [(PUWallpaperPosterEditorController *)self setObservedPlayerItem:0];
  }
}

- (void)_observeCurrentPlayerItem
{
  id v11 = [(PUWallpaperPosterEditorController *)self observedPlayerItem];
  id v3 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  id v4 = [v3 viewManager];
  int v5 = [v4 videoLayerView];
  char v6 = [v5 player];
  id v7 = [v6 currentItem];

  if (v11 != v7)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F16020];
    if (v11)
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*v8 object:v11];

      [v11 removeObserver:self forKeyPath:@"status" context:&PlayerItemObservationContext];
    }
    if (v7)
    {
      uint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__playerItemDidFinish_ name:*v8 object:v7];

      [v7 addObserver:self forKeyPath:@"status" options:0 context:&PlayerItemObservationContext];
    }
    [(PUWallpaperPosterEditorController *)self setObservedPlayerItem:v7];
  }
}

- (void)_playerItemDidFinish:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__PUWallpaperPosterEditorController__playerItemDidFinish___block_invoke;
  block[3] = &unk_1E5F2ED10;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __58__PUWallpaperPosterEditorController__playerItemDidFinish___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSettlingEffectPreview];
}

- (void)_updateSettlingEffectEnabled
{
  id v2 = [(PUWallpaperPosterEditorController *)self editViewModel];
  if (UIAccessibilityIsReduceMotionEnabled() && [v2 settlingEffectEnabled]) {
    [v2 performChanges:&__block_literal_global_710];
  }
}

uint64_t __65__PUWallpaperPosterEditorController__updateSettlingEffectEnabled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSettlingEffectEnabled:0];
}

- (void)_stopSettlingEffectPreview:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  char v6 = [v5 viewManager];
  id v7 = [v5 currentLayerStack];
  uint64_t v8 = [v7 foregroundLayer];
  uint64_t v9 = [v6 viewForLayer:v8];

  uint64_t v10 = [v6 videoLayerView];
  id v11 = [v10 player];
  if ([(PUWallpaperPosterEditorController *)self isPreviewingSettlingEffect])
  {
    [(PUWallpaperPosterEditorController *)self setPreviewingSettlingEffect:0];
    char v12 = [(PUWallpaperPosterEditorController *)self settlingEffectPreviewDelayTimer];
    [v12 invalidate];

    [v11 pause];
    unint64_t v13 = [(PUWallpaperPosterEditorController *)self settlingEffectPreviewAnimator];
    [v13 stopAnimation:1];

    id v14 = objc_alloc(MEMORY[0x1E4FB1ED8]);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke;
    v25[3] = &unk_1E5F2ECC8;
    id v26 = v9;
    id v15 = v10;
    id v27 = v15;
    __int16 v16 = (void *)[v14 initWithDuration:0 curve:v25 animations:0.5];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    char v19 = __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke_2;
    __int16 v20 = &unk_1E5F26A50;
    id v21 = v11;
    id v22 = v15;
    BOOL v23 = self;
    v24 = v4;
    [v16 addCompletion:&v17];
    objc_msgSend(v16, "startAnimation", v17, v18, v19, v20);
    [(PUWallpaperPosterEditorController *)self setSettlingEffectPreviewAnimator:v16];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

uint64_t __64__PUWallpaperPosterEditorController__stopSettlingEffectPreview___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v2 seekToTime:&v4];
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) _startSettlingEffectPreviewAfterDelay];
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_stopSettlingEffectPreview
{
}

- (void)_startSettlingEffectPreview
{
  id v3 = [(PUWallpaperPosterEditorController *)self backgroundView];
  if (v3)
  {
    long long v4 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    uint64_t v5 = [v4 viewManager];
    char v6 = [v4 currentLayerStack];
    if (![v6 settlingEffectEnabled])
    {
LABEL_10:

      goto LABEL_11;
    }
    id v7 = [v6 foregroundLayer];
    uint64_t v8 = [v5 viewForLayer:v7];

    uint64_t v9 = [v5 videoLayerView];
    if (v9)
    {
      if ([(PUWallpaperPosterEditorController *)self isPreviewingSettlingEffect])
      {
LABEL_9:

        goto LABEL_10;
      }
      [(PUWallpaperPosterEditorController *)self setPreviewingSettlingEffect:1];
      uint64_t v10 = [(PUWallpaperPosterEditorController *)self settlingEffectPreviewDelayTimer];
      [v10 invalidate];

      [v9 setAlpha:0.0];
      [v3 addSubview:v9];
      id v11 = [(PUWallpaperPosterEditorController *)self settlingEffectPreviewAnimator];
      [v11 stopAnimation:1];

      id v12 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __64__PUWallpaperPosterEditorController__startSettlingEffectPreview__block_invoke;
      v19[3] = &unk_1E5F2ECC8;
      __int16 v20 = v8;
      id v13 = v9;
      id v21 = v13;
      id v14 = (void *)[v12 initWithDuration:0 curve:v19 animations:0.5];
      [v14 startAnimation];
      [(PUWallpaperPosterEditorController *)self setSettlingEffectPreviewAnimator:v14];
      [(PUWallpaperPosterEditorController *)self _observeCurrentPlayerItem];
      id v15 = [v13 player];
      long long v17 = *MEMORY[0x1E4F1FA48];
      uint64_t v18 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [v15 seekToTime:&v17];
      [v15 play];

      __int16 v16 = v20;
    }
    else
    {
      __int16 v16 = PLWallpaperGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "Failed to preview settling effect because the video layer view is nil.", (uint8_t *)&v17, 2u);
      }
    }

    goto LABEL_9;
  }
LABEL_11:
}

uint64_t __64__PUWallpaperPosterEditorController__startSettlingEffectPreview__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

- (void)_startSettlingEffectPreviewAfterDelay
{
  id v3 = [(PUWallpaperPosterEditorController *)self settlingEffectPreviewDelayTimer];
  char v4 = [v3 isValid];

  if ((v4 & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__startSettlingEffectPreview selector:0 userInfo:0 repeats:0.2];
    [(PUWallpaperPosterEditorController *)self setSettlingEffectPreviewDelayTimer:v5];
  }
}

- (void)_toggleStyleBackground
{
  id v3 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  char v4 = [v3 style];

  if ([v4 hasBackgroundParameter])
  {
    int v5 = [v4 showsBackground];
    char v6 = (void *)MEMORY[0x1E4F8A340];
    id v7 = [v4 bakedStyle];
    uint64_t v8 = [v6 styleWithBakedStyle:v7];

    [v8 setShowsBackground:v5 ^ 1u];
    uint64_t v9 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __59__PUWallpaperPosterEditorController__toggleStyleBackground__block_invoke;
    v11[3] = &unk_1E5F2E420;
    id v12 = v8;
    id v10 = v8;
    [v9 performChanges:v11];

    [(PUWallpaperPosterEditorController *)self _renderAfterStyleChange];
  }
}

uint64_t __59__PUWallpaperPosterEditorController__toggleStyleBackground__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (BOOL)_currentStyleShowsBackground
{
  id v2 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  id v3 = [v2 style];

  if ([v3 hasBackgroundParameter]) {
    char v4 = [v3 showsBackground];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)_currentStyleSupportsToggleBackground
{
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v4 = [v3 segmentationItem];
  char v5 = [(id)v4 supportsBackgroundlessStyles];

  char v6 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  id v7 = [v6 style];
  LOBYTE(v4) = [v7 hasBackgroundParameter];

  return v5 & v4;
}

- (void)_showPhotoInLibrary
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v2 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  id v3 = [v2 assetUUID];

  uint64_t v4 = [NSString stringWithFormat:@"photos://contentmode?id=photos&assetuuid=%@&oneUp=1", v3];
  char v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  char v6 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v7 = *MEMORY[0x1E4F62688];
  v17[0] = *MEMORY[0x1E4F626A0];
  v17[1] = v7;
  v18[0] = MEMORY[0x1E4F1CC38];
  v18[1] = MEMORY[0x1E4F1CC38];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v12 = 0;
  char v9 = [v6 openSensitiveURL:v5 withOptions:v8 error:&v12];
  id v10 = v12;

  if ((v9 & 1) == 0)
  {
    id v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Failed to navigate to URL: %@ with error: %@", buf, 0x16u);
    }
  }
}

- (id)_actionsMenu
{
  objc_initWeak(location, self);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(PUWallpaperPosterEditorController *)self _currentStyleSupportsToggleBackground])
  {
    uint64_t v4 = (void *)MEMORY[0x1E4FB13F0];
    char v5 = PULocalizedString(@"PHOTOS_WALLPAPER_EDITOR_STYLE_BACKGROUND_MENU_TITLE");
    char v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"person.and.background.dotted"];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke;
    v79[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v80, location);
    uint64_t v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v79];

    objc_msgSend(v7, "setState:", -[PUWallpaperPosterEditorController _currentStyleShowsBackground](self, "_currentStyleShowsBackground") ^ 1);
    [v3 addObject:v7];

    objc_destroyWeak(&v80);
  }
  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    uint64_t v8 = [(PUWallpaperPosterEditorController *)self _shuffleFrequencyMenu];
    [v3 addObject:v8];
  }
  if ([(PUWallpaperPosterEditorController *)self _isDepthEffectPossible])
  {
    char v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = PULocalizedString(@"PHOTOS_WALLPAPER_DEPTH_MENU_ITEM_TITLE");
    id v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"square.2.stack.3d"];
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_2;
    v77[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v78, location);
    id v12 = [v9 actionWithTitle:v10 image:v11 identifier:0 handler:v77];

    if ([(PUWallpaperPosterEditorController *)self _canEnableDepthEffect])
    {
      objc_msgSend(v12, "setState:", -[PUWallpaperPosterEditorController _isDepthEnabled](self, "_isDepthEnabled"));
    }
    else
    {
      [v12 setState:0];
      [v12 setAttributes:1];
    }
    [v3 addObject:v12];

    objc_destroyWeak(&v78);
  }
  id v61 = [(PUWallpaperPosterEditorController *)self editViewModel];
  if (PFPosterEnableHeadroom()
    && [v61 canApplyHeadroom]
    && (![(PUWallpaperPosterEditorController *)self _isShuffle]
     || [(PUWallpaperPosterEditorController *)self _isManualShuffle]))
  {
    id v13 = [(PUWallpaperPosterEditorController *)self environment];
    if (objc_msgSend(v13, "px_isCallServices")) {
      id v14 = @"PHOTOS_WALLPAPER_EXTEND_POSTER_MENU_ITEM_TITLE";
    }
    else {
      id v14 = @"PHOTOS_WALLPAPER_EXTEND_WALLPAPER_MENU_ITEM_TITLE";
    }
    __int16 v15 = PULocalizedString(v14);

    id v16 = (void *)MEMORY[0x1E4FB13F0];
    long long v17 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.expand.vertical"];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_3;
    v75[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v76, location);
    uint64_t v18 = [v16 actionWithTitle:v15 image:v17 identifier:0 handler:v75];

    objc_msgSend(v18, "setState:", objc_msgSend(v61, "isUsingHeadroom"));
    if (([v61 isUsingHeadroom] & 1) == 0
      && ([v61 headroomLayoutUsesHeadroomArea] & 1) == 0)
    {
      [v18 setAttributes:1];
    }
    [v3 addObject:v18];

    objc_destroyWeak(&v76);
  }
  if ([(PUWallpaperPosterEditorController *)self _isParallaxAllowed])
  {
    char v19 = [(PUWallpaperPosterEditorController *)self _perspectiveZoomAction];
    [v3 addObject:v19];
  }
  __int16 v20 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v21 = [v20 shuffleConfiguration];

  if (v21)
  {
    if (![v21 shuffleType])
    {
      id v22 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];

      if (v22)
      {
        BOOL v23 = (void *)MEMORY[0x1E4FB13F0];
        v24 = PULocalizedString(@"PHOTOS_WALLPAPER_DONT_FEATURE_PHOTO_MENU_ITEM_TITLE");
        uint64_t v25 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark.circle"];
        v73[0] = MEMORY[0x1E4F143A8];
        v73[1] = 3221225472;
        v73[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_4;
        v73[3] = &unk_1E5F2E7A8;
        objc_copyWeak(&v74, location);
        id v26 = [v23 actionWithTitle:v24 image:v25 identifier:0 handler:v73];

        [v26 setAttributes:2];
        [v3 addObject:v26];

        objc_destroyWeak(&v74);
      }
    }
  }
  id v27 = [(PUWallpaperPosterEditorController *)self environment];
  uint64_t v28 = objc_msgSend(v27, "pu_sourcePosterConfiguration");

  if (v28)
  {
    int v29 = [v28 options] & 1;
    unint64_t v30 = ((unint64_t)[v28 options] >> 5) & 1;
  }
  else
  {
    int v29 = 0;
    LODWORD(v30) = 0;
  }
  int v31 = [MEMORY[0x1E4F8FF98] isAppInstalled:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_5;
  aBlock[3] = &unk_1E5F2E690;
  void aBlock[4] = self;
  BOOL v32 = _Block_copy(aBlock);
  BOOL v33 = v32;
  if (((v29 | v30 | v31 ^ 1) & 1) == 0 && (*((unsigned int (**)(void *))v32 + 2))(v32))
  {
    BOOL v34 = (void *)MEMORY[0x1E4FB13F0];
    id v35 = PULocalizedString(@"PHOTOS_WALLPAPER_SHOW_PHOTO_IN_LIBRARY_MENU_ITEM_TITLE");
    uint64_t v36 = [MEMORY[0x1E4FB1818] systemImageNamed:@"photo.on.rectangle"];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_6;
    v70[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v71, location);
    uint64_t v37 = [v34 actionWithTitle:v35 image:v36 identifier:0 handler:v70];

    [v3 addObject:v37];
    objc_destroyWeak(&v71);
  }
  unint64_t v38 = 0x1E4FB1000;
  if (MEMORY[0x1B3E7A510]())
  {
    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v40 = (void *)MEMORY[0x1E4FB13F0];
    v41 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.fill"];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_7;
    v68[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v69, location);
    v42 = [v40 actionWithTitle:@"Wallpaper Feedback" image:v41 identifier:0 handler:v68];
    [v39 addObject:v42];

    v43 = (void *)MEMORY[0x1E4FB13F0];
    v44 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.fill"];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_8;
    v66[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v67, location);
    id v45 = [v43 actionWithTitle:@"Tap to Radar" image:v44 identifier:0 handler:v66];
    [v39 addObject:v45];

    if (PFPosterEnableSettlingEffect())
    {
      v46 = [(PUWallpaperPosterEditorController *)self environment];
      char v47 = objc_msgSend(v46, "px_isCallServices");

      if ((v47 & 1) == 0)
      {
        v48 = (void *)MEMORY[0x1E4FB13F0];
        v49 = [MEMORY[0x1E4FB1818] systemImageNamed:@"livephoto"];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_9;
        v63[3] = &unk_1E5F2D440;
        id v64 = v61;
        objc_copyWeak(&v65, location);
        v50 = [v48 actionWithTitle:@"Settling Effect Debug" image:v49 identifier:0 handler:v63];
        [v39 addObject:v50];

        objc_destroyWeak(&v65);
      }
    }
    if (PXPreferencesGetBool())
    {
      v51 = (void *)MEMORY[0x1E4FB13F0];
      v52 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gear"];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_10;
      v62[3] = &unk_1E5F2ADC0;
      v62[4] = self;
      v53 = [v51 actionWithTitle:@"Show Internal Settings" image:v52 identifier:0 handler:v62];
      [v39 addObject:v53];
    }
    char v54 = (void *)MEMORY[0x1E4FB1970];
    v55 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gear"];
    id v56 = [v54 menuWithTitle:@"Internal" image:v55 identifier:0 options:0 children:v39];

    [v3 addObject:v56];
    objc_destroyWeak(&v67);
    objc_destroyWeak(&v69);

    unint64_t v38 = 0x1E4FB1000uLL;
  }
  if ([v3 count])
  {
    uint64_t v57 = *(void **)(v38 + 2416);
    id v58 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
    v59 = [v57 menuWithTitle:&stru_1F06BE7B8 image:v58 identifier:@"PUPosterEditorActionIdentifierMenu" options:0 children:v3];
  }
  else
  {
    v59 = 0;
  }

  objc_destroyWeak(location);
  return v59;
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleStyleBackground];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleDepth];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleHeadroom];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _rejectSuggestionsForCurrentAsset];
}

BOOL __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_5(uint64_t a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentPosterMedia];
  id v3 = [v2 assetUUID];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) photoLibrary];
    char v5 = [v4 librarySpecificFetchOptions];

    [v5 setIncludeGuestAssets:1];
    char v6 = (void *)MEMORY[0x1E4F38EB8];
    v11[0] = v3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    uint64_t v8 = [v6 fetchAssetsWithLocalIdentifiers:v7 options:v5];
    BOOL v9 = [v8 count] != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showPhotoInLibrary];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _wallpaperFeedbackRadar];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tapToRadar];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_9(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) originalLayerStackViewModel];
  id v4 = [v2 segmentationItem];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentSettlingEffectDebugView:v4];
}

void __49__PUWallpaperPosterEditorController__actionsMenu__block_invoke_10(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = [PUPosterSettingsController alloc];
  id v3 = +[PUPosterSettings sharedInstance];
  id v4 = [(PUPosterSettingsController *)v2 initWithRootSettings:v3];

  [(PUPosterSettingsController *)v4 setModalPresentationStyle:2];
  char v5 = [MEMORY[0x1E4FB1C30] mediumDetent];
  v13[0] = v5;
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  uint64_t v7 = [(PUPosterSettingsController *)v4 sheetPresentationController];
  [v7 setDetents:v6];

  uint64_t v8 = *MEMORY[0x1E4FB2F00];
  BOOL v9 = [(PUPosterSettingsController *)v4 sheetPresentationController];
  [v9 setLargestUndimmedDetentIdentifier:v8];

  id v10 = [(PUPosterSettingsController *)v4 sheetPresentationController];
  [v10 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];

  id v11 = [(PUPosterSettingsController *)v4 sheetPresentationController];
  [v11 setPrefersEdgeAttachedInCompactHeight:1];

  id v12 = [*(id *)(a1 + 32) editor];
  [v12 presentViewController:v4 animated:1 completion:0];
}

- (id)_toggleHighKeyLowKeyAction
{
  if ([(PUWallpaperPosterEditorController *)self _currentStyleSupportsHighAndLowKeyModes])
  {
    BOOL v3 = [(PUWallpaperPosterEditorController *)self _currentStyleIsHighKey];
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 33.5, 33.5);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke;
    v16[3] = &__block_descriptor_57_e40_v16__0__UIGraphicsImageRendererContext_8l;
    int64x2_t v17 = vdupq_n_s64(0x4040C00000000000uLL);
    uint64_t v18 = 0x403B800000000000;
    BOOL v19 = v3;
    char v5 = [v4 imageWithActions:v16];
    char v6 = @"PHOTOS_WALLPAPER_EDITOR_HIGH_KEY_MENU_TITLE";
    if (v3) {
      char v6 = @"PHOTOS_WALLPAPER_EDITOR_LOW_KEY_MENU_TITLE";
    }
    uint64_t v7 = v6;
    objc_initWeak(&location, self);
    uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
    BOOL v9 = PULocalizedString(v7);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke_2;
    v12[3] = &unk_1E5F2E7D0;
    objc_copyWeak(&v13, &location);
    BOOL v14 = v3;
    id v10 = [v8 actionWithTitle:v9 image:v5 identifier:0 handler:v12];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

void __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (CGContext *)[a2 CGContext];
  double v4 = *(double *)(a1 + 32) * 0.5;
  double v5 = *(double *)(a1 + 40) * 0.5;
  CGContextBeginPath(v3);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v4, v5, *(double *)(a1 + 32) * 0.5, 0.0, 6.28318531);
  id v9 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v3, (CGPathRef)[v9 CGPath]);
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v6 CGColor]);

  CGContextFillPath(v3);
  CGContextClosePath(v3);
  CGContextBeginPath(v3);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", *(unsigned __int8 *)(a1 + 56), v4, v5, *(double *)(a1 + 48) * 0.5, 1.57079633, 4.71238898);
  id v7 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v3, (CGPathRef)[v7 CGPath]);
  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  CGContextSetFillColorWithColor(v3, (CGColorRef)[v8 CGColor]);

  CGContextFillPath(v3);
  CGContextClosePath(v3);
}

void __63__PUWallpaperPosterEditorController__toggleHighKeyLowKeyAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setCurrentStyleIsHighKey:*(unsigned char *)(a1 + 40) == 0];
}

- (id)_colorPickerAction
{
  if ([(PUWallpaperPosterEditorController *)self _currentStyleSupportsColorPicker])
  {
    BOOL v3 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    double v4 = [v3 style];

    if (objc_opt_respondsToSelector())
    {
      double v5 = [v4 color];
      uint64_t v6 = [v5 CGColor];

      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", 35.0, 35.0);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke;
      v19[3] = &__block_descriptor_56_e40_v16__0__UIGraphicsImageRendererContext_8l;
      void v19[4] = v6;
      long long v20 = xmmword_1AEFF7BC0;
      id v8 = [v7 imageWithActions:v19];
      id v9 = [v4 kind];
      id v10 = @"PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_MENU_TITLE";
      if (([v9 isEqualToString:*MEMORY[0x1E4F8CFF8]] & 1) == 0
        && ![v9 isEqualToString:*MEMORY[0x1E4F8CFF0]])
      {
        id v10 = @"PHOTOS_WALLPAPER_EDITOR_BACKGROUND_COLOR_MENU_TITLE";
      }
      id v11 = v10;
      objc_initWeak(&location, self);
      id v12 = (void *)MEMORY[0x1E4FB13F0];
      id v13 = PULocalizedString(v11);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke_2;
      v16[3] = &unk_1E5F2E7A8;
      objc_copyWeak(&v17, &location);
      BOOL v14 = [v12 actionWithTitle:v13 image:v8 identifier:@"PUPosterEditorActionIdentifierColorPicker" handler:v16];

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }
  return v14;
}

void __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (CGContext *)[a2 CGContext];
  CGContextSetFillColorWithColor(v3, *(CGColorRef *)(a1 + 32));
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 40));
  id v4 = [MEMORY[0x1E4FB1618] whiteColor];
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)[v4 CGColor]);

  v6.origin.x = *(CGFloat *)(a1 + 40);
  v6.size.width = *(CGFloat *)(a1 + 48);
  v6.origin.y = v6.origin.x;
  v6.size.height = v6.size.width;
  CGContextAddEllipseInRect(v3, v6);
  CGContextDrawPath(v3, kCGPathFillStroke);
}

void __55__PUWallpaperPosterEditorController__colorPickerAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentStyleColorPicker];
}

- (id)_toggleSettlingEffectAction
{
  if ([(PUWallpaperPosterEditorController *)self _attemptedSettlingEffect])
  {
    BOOL v3 = PULocalizedString(@"PHOTOS_WALLPAPER_EDITOR_TOGGLE_LIVE_PHOTO_BUTTON_TITLE");
    if ([(PUWallpaperPosterEditorController *)self loadingSettlingEffect])
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FB1818]);
    }
    else
    {
      CGRect v6 = [(PUWallpaperPosterEditorController *)self editViewModel];
      int v7 = [v6 settlingEffectEnabled];

      if (v7) {
        id v8 = @"livephoto.play";
      }
      else {
        id v8 = @"livephoto.slash";
      }
      id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v8];
    }
    id v9 = v4;
    objc_initWeak(&location, self);
    id v10 = (void *)MEMORY[0x1E4FB13F0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __64__PUWallpaperPosterEditorController__toggleSettlingEffectAction__block_invoke;
    v12[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v13, &location);
    double v5 = [v10 actionWithTitle:v3 image:v9 identifier:@"PUPosterEditorActionIdentifierSettlingEffect" handler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

void __64__PUWallpaperPosterEditorController__toggleSettlingEffectAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSettlingEffectEnabled];
}

- (id)_photoPickerAction
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v4 = [v3 configurationType];
  if (v4 == 1)
  {
    id v12 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v13 = [v12 shuffleConfiguration];
    uint64_t v5 = [v13 shuffleType];

    if (v5 == 2)
    {
      LOBYTE(v5) = 0;
      CGRect v6 = @"rectangle.stack.fill";
    }
    else if (v5 == 1)
    {
      LOBYTE(v5) = 0;
      CGRect v6 = @"rectangle.grid.3x2.fill";
    }
    else if (v5)
    {
      CGRect v6 = 0;
      LOBYTE(v5) = 1;
    }
    else
    {
      CGRect v6 = @"sparkles.rectangle.stack.fill";
    }
  }
  else
  {
    LOBYTE(v5) = v4 != 0;
    if (v4) {
      CGRect v6 = 0;
    }
    else {
      CGRect v6 = @"photo.on.rectangle";
    }
  }
  int v7 = 0;
  if (([v3 options] & 0x13) == 0 && (v5 & 1) == 0)
  {
    id v8 = PULocalizedString(@"PHOTOS_WALLPAPER_EDITOR_PICK_A_PHOTO_BUTTON_TITLE");
    objc_initWeak(&location, self);
    id v9 = (void *)MEMORY[0x1E4FB13F0];
    id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v6];
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __55__PUWallpaperPosterEditorController__photoPickerAction__block_invoke;
    id v17 = &unk_1E5F2E7A8;
    objc_copyWeak(&v18, &location);
    int v7 = [v9 actionWithTitle:v8 image:v10 identifier:@"PUPosterEditorActionIdentifierPhotoPicker" handler:&v14];

    objc_msgSend(v7, "setAccessibilityLabel:", v8, v14, v15, v16, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __55__PUWallpaperPosterEditorController__photoPickerAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pickAssets];
}

- (void)_updateEditToolbar
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  char v4 = [v3 isUserPanningOrZooming];

  if ((v4 & 1) == 0)
  {
    id v5 = [(PUWallpaperPosterEditorController *)self editor];
    [v5 updateActions];
  }
}

- (void)_updateCurrentStyleColor:(id)a3
{
  id v4 = a3;
  id v5 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  CGRect v6 = [v5 style];

  int v7 = [v6 kind];
  id v8 = objc_msgSend(MEMORY[0x1E4F8CC78], "pu_parallaxColorWithUIColor:", v4);

  if ([v7 isEqualToString:*MEMORY[0x1E4F8CFE8]])
  {
    id v9 = (void *)MEMORY[0x1E4F8A340];
    id v10 = [v6 bakedStyle];
    id v11 = [v9 styleWithBakedStyle:v10];

    [v11 setColor:v8];
    id v12 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke;
    v30[3] = &unk_1E5F2E420;
    int v31 = v11;
    id v13 = v11;
    [v12 performChanges:v30];

    uint64_t v14 = v31;
  }
  else if (([v7 isEqualToString:*MEMORY[0x1E4F8CFF8]] & 1) != 0 {
         || ([v7 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) != 0
  }
         || ([v7 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) != 0
         || ([v7 isEqualToString:*MEMORY[0x1E4F8D008]] & 1) != 0
         || [v7 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F8A340];
    id v16 = [v6 bakedStyle];
    id v17 = [v15 styleWithBakedStyle:v16];

    [v17 setColor:v8];
    id v18 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_2;
    v28[3] = &unk_1E5F2E420;
    int v29 = v17;
    id v13 = v17;
    [v18 performChanges:v28];

    uint64_t v14 = v29;
  }
  else
  {
    if (![v7 isEqualToString:*MEMORY[0x1E4F8CFF0]]) {
      goto LABEL_10;
    }
    id v13 = [MEMORY[0x1E4F8A340] colorPaletteWithStyleKind:v7];
    uint64_t v14 = objc_msgSend(v13, "suggestionAtIndex:", objc_msgSend(v13, "indexOfColor:", v8));
    BOOL v19 = (void *)MEMORY[0x1E4F8A340];
    long long v20 = [v6 bakedStyle];
    id v21 = [v19 styleWithBakedStyle:v20];

    id v22 = [v14 primaryColor];
    [v21 setPrimaryColor:v22];

    BOOL v23 = [v14 secondaryColor];
    [v21 setSecondaryColor:v23];

    v24 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_3;
    v26[3] = &unk_1E5F2E420;
    id v27 = v21;
    id v25 = v21;
    [v24 performChanges:v26];
  }
LABEL_10:
  [(PUWallpaperPosterEditorController *)self _renderAfterStyleChange];
}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

uint64_t __62__PUWallpaperPosterEditorController__updateCurrentStyleColor___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (void)_presentStyleColorPicker
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v2 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  v60 = [v2 style];

  id v62 = [v60 kind];
  id v63 = objc_alloc_init((Class)getPREditorColorPickerConfigurationClass());
  BOOL v3 = NSString;
  id v4 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  id v5 = [v4 assetUUID];
  CGRect v6 = [v3 stringWithFormat:@"%@-%@", v5, v62];
  int v7 = v63;
  [v63 setIdentifier:v6];

  uint64_t v8 = *MEMORY[0x1E4F8CFE8];
  if (([v62 isEqualToString:*MEMORY[0x1E4F8CFE8]] & 1) != 0
    || ([v62 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) != 0
    || ([v62 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) != 0
    || [v62 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
    id v9 = [v60 color];
    id v10 = @"PHOTOS_WALLPAPER_EDITOR_BACKGROUND_COLOR_PICKER_PROMPT";
LABEL_6:
    uint64_t v11 = 1;
    goto LABEL_7;
  }
  if ([v62 isEqualToString:*MEMORY[0x1E4F8CFF8]])
  {
    uint64_t v50 = [v60 color];
  }
  else
  {
    if (![v62 isEqualToString:*MEMORY[0x1E4F8CFF0]])
    {
      if (![v62 isEqualToString:*MEMORY[0x1E4F8D008]]) {
        goto LABEL_42;
      }
      id v9 = [v60 color];
      id v10 = @"PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_PICKER_PROMPT";
      goto LABEL_6;
    }
    uint64_t v50 = [v60 primaryColor];
  }
  id v9 = (void *)v50;
  uint64_t v11 = 0;
  id v10 = @"PHOTOS_WALLPAPER_EDITOR_STYLE_COLOR_PICKER_PROMPT";
LABEL_7:
  [v63 setShowsSlider:v11];
  id v12 = PULocalizedString(v10);
  [v63 setPrompt:v12];

  id v13 = objc_msgSend(v9, "pu_UIColor");
  [v63 setSelectedColor:v13];

  v59 = [MEMORY[0x1E4F8A340] colorPaletteWithStyleKind:v62];
  uint64_t v14 = [v59 primaryColors];
  uint64_t v15 = v14;
  if ((unint64_t)[v14 count] >= 0xD)
  {
    uint64_t v15 = objc_msgSend(v14, "subarrayWithRange:", 0, 12);
  }
  id v58 = v15;
  if (![v63 showsSlider])
  {
    int v29 = PXMap();
    unint64_t v30 = (void *)[objc_alloc((Class)getPREditorColorPaletteClass()) initWithColors:v29 localizedName:0 showsColorWell:0];
    int v31 = v63;
    [v63 setColorPalette:v30];

    goto LABEL_37;
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v62 isEqualToString:v8])
  {
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    obuint64_t j = v15;
    uint64_t v17 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v77;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v77 != v18) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(void **)(*((void *)&v76 + 1) + 8 * i);
          objc_msgSend(v21, "pu_toneVariation");
          double v23 = v22;
          [v21 hue];
          uint64_t v25 = v24;
          [v9 hue];
          if (PXFloatEqualToFloatWithTolerance())
          {
            objc_msgSend(v9, "pu_toneVariation");
            double v23 = v26;
          }
          id v27 = objc_alloc((Class)getPREditorColorPickerCustomColorClass());
          v75[0] = v19;
          v75[1] = 3221225472;
          v75[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke;
          v75[3] = &__block_descriptor_40_e17___UIColor_16__0d8l;
          void v75[4] = v25;
          uint64_t v28 = (void *)[v27 initWithDefaultInitialVariation:v75 colorProvider:v23];
          [v16 addObject:v28];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v76 objects:v81 count:16];
      }
      while (v17);
    }
  }
  else
  {
    if (([v62 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) == 0
      && ([v62 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) == 0
      && ![v62 isEqualToString:*MEMORY[0x1E4F8D010]])
    {
      if ([v62 isEqualToString:*MEMORY[0x1E4F8D008]])
      {
        [v9 hue];
        uint64_t v52 = v51;
        [v9 chroma];
        uint64_t v54 = v53;
        objc_msgSend(v9, "pu_lumaVariation");
        double v56 = v55;
        id v57 = objc_alloc((Class)getPREditorColorPickerCustomColorClass());
        v69[0] = MEMORY[0x1E4F143A8];
        v69[1] = 3221225472;
        v69[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_3;
        v69[3] = &__block_descriptor_48_e17___UIColor_16__0d8l;
        v69[4] = v52;
        v69[5] = v54;
        id obja = (id)[v57 initWithDefaultInitialVariation:v69 colorProvider:v56];
        [v16 addObject:obja];
      }
      goto LABEL_36;
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    obuint64_t j = v15;
    uint64_t v32 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v72;
      uint64_t v34 = MEMORY[0x1E4F143A8];
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v72 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v36 = *(void **)(*((void *)&v71 + 1) + 8 * j);
          objc_msgSend(v36, "pu_lumaVariation");
          double v38 = v37;
          [v36 hue];
          uint64_t v40 = v39;
          [v36 chroma];
          uint64_t v42 = v41;
          [v9 hue];
          if (PXFloatEqualToFloatWithTolerance())
          {
            [v9 chroma];
            if (PXFloatEqualToFloatWithTolerance())
            {
              objc_msgSend(v9, "pu_lumaVariation");
              double v38 = v43;
            }
          }
          id v44 = objc_alloc((Class)getPREditorColorPickerCustomColorClass());
          v70[0] = v34;
          v70[1] = 3221225472;
          v70[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_2;
          v70[3] = &__block_descriptor_48_e17___UIColor_16__0d8l;
          void v70[4] = v40;
          v70[5] = v42;
          id v45 = (void *)[v44 initWithDefaultInitialVariation:v70 colorProvider:v38];
          [v16 addObject:v45];
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v71 objects:v80 count:16];
      }
      while (v32);
    }
  }

LABEL_36:
  v46 = (void *)[objc_alloc((Class)getPREditorColorPaletteClass()) initWithPickerColors:v16 localizedName:0];
  [v63 setColorPalette:v46];

  int v31 = v63;
LABEL_37:
  [v31 setColorWellDisplayMode:0];
  if (([v62 isEqualToString:*MEMORY[0x1E4F8D000]] & 1) != 0
    || ([v62 isEqualToString:*MEMORY[0x1E4F8D018]] & 1) != 0
    || [v62 isEqualToString:*MEMORY[0x1E4F8D010]])
  {
    [v63 setColorWellDisplayMode:2];
  }
  char v47 = [(PUWallpaperPosterEditorController *)self editor];
  v48 = objc_msgSend(v47, "pu_viewForMenuElementIdentifier:", @"PUPosterEditorActionIdentifierColorPicker");

  [v63 setColorPickerSourceItem:v48];
  objc_initWeak(&location, self);
  v49 = [(PUWallpaperPosterEditorController *)self editor];
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_5;
  v66[3] = &unk_1E5F269E8;
  objc_copyWeak(&v67, &location);
  [v49 presentColorPickerWithConfiguration:v63 changeHandler:v66];

  objc_destroyWeak(&v67);
  objc_destroyWeak(&location);

  int v7 = v63;
LABEL_42:
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke(uint64_t a1, double a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F8CC78], "pu_parallaxColorWithHue:toneVariation:", *(double *)(a1 + 32), a2);
  BOOL v3 = objc_msgSend(v2, "pu_UIColor");

  return v3;
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_2(uint64_t a1, double a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F8CC78], "pu_parallaxColorWithHue:chroma:lumaVariation:", *(double *)(a1 + 32), *(double *)(a1 + 40), a2);
  BOOL v3 = objc_msgSend(v2, "pu_UIColor");

  return v3;
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_3(uint64_t a1, double a2)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F8CC78], "pu_parallaxColorWithHue:chroma:lumaVariation:", *(double *)(a1 + 32), *(double *)(a1 + 40), a2);
  BOOL v3 = objc_msgSend(v2, "pu_UIColor");

  return v3;
}

void __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_5(uint64_t a1, void *a2)
{
  id v8 = a2;
  getPRPosterColorClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v8 color];
  }
  else
  {
    id v3 = v8;
  }
  id v4 = v3;
  id v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _updateCurrentStyleColor:v4];

  id v7 = objc_loadWeakRetained(v5);
  [v7 _updateEditToolbar];
}

id __61__PUWallpaperPosterEditorController__presentStyleColorPicker__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc((Class)getPRPosterColorClass());
  id v4 = objc_msgSend(v2, "pu_UIColor");

  id v5 = (void *)[v3 initWithColor:v4 preferredStyle:1];
  return v5;
}

- (BOOL)_currentStyleSupportsColorPicker
{
  id v2 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  id v3 = [v2 style];
  char v4 = [v3 hasColorParameter];

  return v4;
}

- (void)_setCurrentStyleIsHighKey:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  CGRect v6 = [v5 style];

  if ([v6 hasTonalityMode])
  {
    id v7 = (void *)MEMORY[0x1E4F8A340];
    id v8 = [v6 bakedStyle];
    id v9 = [v7 styleWithBakedStyle:v8];

    if (v3) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 1;
    }
    [v9 setTonality:v10];
    uint64_t v11 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __63__PUWallpaperPosterEditorController__setCurrentStyleIsHighKey___block_invoke;
    v13[3] = &unk_1E5F2E420;
    id v14 = v9;
    id v12 = v9;
    [v11 performChanges:v13];

    [(PUWallpaperPosterEditorController *)self _renderAfterStyleChange];
  }
}

uint64_t __63__PUWallpaperPosterEditorController__setCurrentStyleIsHighKey___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (BOOL)_currentStyleIsHighKey
{
  id v2 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  BOOL v3 = [v2 style];

  if ([v3 hasTonalityMode]) {
    BOOL v4 = [v3 tonality] == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_currentStyleSupportsHighAndLowKeyModes
{
  id v2 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  BOOL v3 = [v2 style];
  char v4 = [v3 hasTonalityMode];

  return v4;
}

- (void)_renderAfterStyleChange
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  id v5 = [v3 currentLayerStackViewModelUpdater];

  char v4 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  [v5 renderOnscreenModelAfterStyleChange:v4];
}

- (void)_stopSimulatingParallax
{
  id v3 = [(PUWallpaperPosterEditorController *)self parallaxSimulationView];
  if (v3)
  {
    [(PUWallpaperPosterEditorController *)self setParallaxSimulationView:0];
    [v3 stopParallax];
    [v3 removeFromSuperview];
  }
}

- (void)_startSimulatingParallax
{
  id v3 = [(PUWallpaperPosterEditorController *)self parallaxSimulationView];

  if (!v3)
  {
    char v4 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
    objc_initWeak(&location, self);
    id v5 = [PUWallpaperPosterParallaxView alloc];
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke;
    uint64_t v19 = &unk_1E5F26960;
    objc_copyWeak(&v20, &location);
    id v14 = -[PUWallpaperPosterParallaxView initWithFrame:parallaxHandler:](v5, "initWithFrame:parallaxHandler:", &v16, v7, v9, v11, v13);
    -[PUWallpaperPosterParallaxView setAutoresizingMask:](v14, "setAutoresizingMask:", 18, v16, v17, v18, v19);
    [v4 addSubview:v14];
    [(PUWallpaperPosterParallaxView *)v14 setUserInteractionEnabled:0];
    uint64_t v15 = [MEMORY[0x1E4FB1618] clearColor];
    [(PUWallpaperPosterParallaxView *)v14 setBackgroundColor:v15];

    [(PUWallpaperPosterEditorController *)self setParallaxSimulationView:v14];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = [WeakRetained currentLayerStackViewModel];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke_2;
  v7[3] = &__block_descriptor_48_e48_v16__0___PUParallaxLayerStackMutableViewModel__8l;
  *(double *)&void v7[4] = a2;
  *(double *)&v7[5] = a3;
  [v6 performChanges:v7];
}

uint64_t __61__PUWallpaperPosterEditorController__startSimulatingParallax__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setParallaxVector:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)setIsPausingParallax:(BOOL)a3
{
  if (self->_isPausingParallax != a3)
  {
    self->_isPausingParallax = a3;
    [(PUWallpaperPosterEditorController *)self _updateParallaxEnabled];
  }
}

- (void)_updateParallaxIsPaused
{
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  -[PUWallpaperPosterEditorController setIsPausingParallax:](self, "setIsPausingParallax:", [v3 isUserPanningOrZooming]);
}

- (void)_toggleHeadroom
{
  id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  char v4 = [v3 isUsingHeadroom];

  id v5 = [(PUWallpaperPosterEditorController *)self editViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PUWallpaperPosterEditorController__toggleHeadroom__block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  char v7 = v4;
  [v5 performChanges:v6];

  [(PUWallpaperPosterEditorController *)self _updateUserTransformView];
}

uint64_t __52__PUWallpaperPosterEditorController__toggleHeadroom__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHeadroomEnabled:*(unsigned char *)(a1 + 32) == 0];
}

- (BOOL)_canEnableDepthEffect
{
  id v3 = [(PUWallpaperPosterEditorController *)self editor];
  char v4 = objc_msgSend(v3, "pu_isDepthEffectDisallowed");

  if (v4) {
    return 0;
  }
  if ([(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth]) {
    return 1;
  }
  double v6 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  char v7 = [v6 canEnableDepthEffect];

  return v7;
}

- (BOOL)_isDepthEffectPossible
{
  id v3 = [MEMORY[0x1E4F8A2C0] globalSettings];
  char v4 = [v3 forceEnableSegmentation];

  if ((v4 & 1) == 0)
  {
    int v5 = PFPosterDeviceSupportsSegmentation();
    if (!v5) {
      return v5;
    }
    double v6 = [MEMORY[0x1E4F8A2C0] globalSettings];
    char v7 = [v6 disableSegmentation];

    if (v7)
    {
LABEL_8:
      LOBYTE(v5) = 0;
      return v5;
    }
  }
  if (![(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth])
  {
    double v8 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    char v9 = [v8 settlingEffectEnabled];

    if ((v9 & 1) == 0)
    {
      double v10 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
      char v11 = [v10 hasMatte];

      LOBYTE(v5) = v11;
      return v5;
    }
    goto LABEL_8;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)_toggleDepth
{
  if ([(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth])
  {
    uint64_t v3 = [(PUWallpaperPosterEditorController *)self _isDepthEnabled] ^ 1;
    char v4 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    [v4 setDepthEnabledForAllMedia:v3];

    [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
  }
  else
  {
    int v5 = [(PUWallpaperPosterEditorController *)self editViewModel];
    LOBYTE(v3) = [v5 depthEnabled] ^ 1;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke;
  v6[3] = &unk_1E5F2E120;
  void v6[4] = self;
  char v7 = v3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.2];
}

void __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) editViewModel];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke_2;
  v3[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  char v4 = *(unsigned char *)(a1 + 40);
  [v2 performChanges:v3];
}

uint64_t __49__PUWallpaperPosterEditorController__toggleDepth__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setDepthEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)_isDepthEnabled
{
  if ([(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth])
  {
    uint64_t v3 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    char v4 = [v3 depthEnabledForAllMedia];
  }
  else
  {
    uint64_t v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
    char v4 = [v3 depthEnabled];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)_updateParallaxEnabled
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self _shouldEnableParallax];
  char v4 = [(PUWallpaperPosterEditorController *)self editor];
  [v4 setPerspectiveZoomEnabled:v3];

  BOOL v5 = [(PUWallpaperPosterEditorController *)self editor];
  char v6 = objc_msgSend(v5, "pu_canApplyParallaxToViews");

  if ((v6 & 1) == 0)
  {
    char v7 = [(PUWallpaperPosterEditorController *)self parallaxSimulationView];
    double v8 = v7;
    if (v3) {
      [v7 startParallax];
    }
    else {
      [v7 stopParallax];
    }
  }
  char v9 = [(PUWallpaperPosterEditorController *)self editViewModel];
  char v10 = [v9 isUserPanningOrZooming];

  if ((v10 & 1) == 0)
  {
    [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
  }
}

- (BOOL)_shouldEnableParallax
{
  if (![(PUWallpaperPosterEditorController *)self _isParallaxAllowed]) {
    return 0;
  }
  if ([(PUWallpaperPosterEditorController *)self isPausingParallax]) {
    return 0;
  }
  BOOL v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  char v4 = [v3 parallaxDisabled];

  if (v4) {
    return 0;
  }
  char v6 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  char v7 = [v6 canApplyParallax];

  return v7;
}

- (void)_togglePerspectiveZoom
{
  id v2 = [(PUWallpaperPosterEditorController *)self editViewModel];
  [v2 performChanges:&__block_literal_global_568];
}

void __59__PUWallpaperPosterEditorController__togglePerspectiveZoom__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setParallaxDisabled:", objc_msgSend(v2, "parallaxDisabled") ^ 1);
}

- (id)_perspectiveZoomAction
{
  objc_initWeak(&location, self);
  BOOL v3 = PULocalizedString(@"PHOTOS_WALLPAPER_PERSPECTIVE_ZOOM_MENU_ITEM_TITLE");
  char v4 = (void *)MEMORY[0x1E4FB13F0];
  BOOL v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"perspective"];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __59__PUWallpaperPosterEditorController__perspectiveZoomAction__block_invoke;
  uint64_t v16 = &unk_1E5F2E7A8;
  objc_copyWeak(&v17, &location);
  char v6 = [v4 actionWithTitle:v3 image:v5 identifier:0 handler:&v13];

  char v7 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  int v8 = [v7 hasEnoughRoomForParallax];

  if (v8)
  {
    char v9 = [(PUWallpaperPosterEditorController *)self editViewModel];
    uint64_t v10 = [v9 parallaxDisabled] ^ 1;

    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 1;
  }
  [v6 setState:v10];
  [v6 setAttributes:v11];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
  return v6;
}

void __59__PUWallpaperPosterEditorController__perspectiveZoomAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _togglePerspectiveZoom];
}

- (BOOL)_isParallaxAllowed
{
  return 0;
}

- (void)userTransformView:(id)a3 didChangeIsUserInteracting:(BOOL)a4
{
  BOOL v5 = [(PUWallpaperPosterEditorController *)self editViewModel];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__PUWallpaperPosterEditorController_userTransformView_didChangeIsUserInteracting___block_invoke;
  v6[3] = &__block_descriptor_33_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  BOOL v7 = a4;
  [v5 performChanges:v6];
}

uint64_t __82__PUWallpaperPosterEditorController_userTransformView_didChangeIsUserInteracting___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsUserPanningOrZooming:*(unsigned __int8 *)(a1 + 32)];
}

- (void)userTransformView:(id)a3 didChangeUserAffineTransform:(CGAffineTransform *)a4 isUserInteracting:(BOOL)a5
{
  if (a5)
  {
    id v6 = a3;
    [v6 visibleRect];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [v6 untransformedContentFrame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = v8 - v16;
    double v24 = 0.0;
    double v25 = 0.0;
    if (v20 != 0.0)
    {
      double v23 = v23 / v20;
      double v25 = v12 / v20;
    }
    double v26 = v10 - v18;
    if (v22 != 0.0)
    {
      double v26 = v26 / v22;
      double v24 = v14 / v22;
    }
    double v43 = v24;
    id v27 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
    [v27 contentRect];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    [v27 imageSize];
    double v38 = v29 + v23 * v33;
    double v39 = 0.0;
    double v40 = 0.0;
    if (v36 != 0.0)
    {
      double v38 = v38 / v36;
      double v40 = v25 * v33 / v36;
    }
    double v41 = v31 + v26 * v35;
    if (v37 != 0.0)
    {
      double v41 = v41 / v37;
      double v39 = v43 * v35 / v37;
    }
    uint64_t v42 = [(PUWallpaperPosterEditorController *)self editViewModel];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __102__PUWallpaperPosterEditorController_userTransformView_didChangeUserAffineTransform_isUserInteracting___block_invoke;
    v44[3] = &__block_descriptor_64_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
    *(double *)&v44[4] = v38;
    *(double *)&v44[5] = v41;
    *(double *)&v44[6] = v40;
    *(double *)&v44[7] = v39;
    [v42 performChanges:v44];
  }
}

void __102__PUWallpaperPosterEditorController_userTransformView_didChangeUserAffineTransform_isUserInteracting___block_invoke(double *a1, void *a2)
{
  double v2 = a1[4];
  double v3 = a1[5];
  double v4 = a1[6];
  double v5 = a1[7];
  id v6 = a2;
  objc_msgSend(v6, "setNormalizedVisibleFrame:", v2, v3, v4, v5);
  [v6 userDidAdjustVisibleFrame];
}

- (void)setIsUserTransformDisabled:(BOOL)a3
{
  if (self->_isUserTransformDisabled != a3)
  {
    self->_isUserTransformDisabled = a3;
    BOOL v3 = !a3;
    id v4 = [(PUWallpaperPosterEditorController *)self userTransformView];
    [v4 setUserInteractionEnabled:v3];
  }
}

- (void)_updateUserTransformIsDisabled
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v4 = [v3 configurationType];

  if (v4 == 1)
  {
    double v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v6 = [v5 shuffleConfiguration];

    BOOL v7 = [v6 shuffleType] != 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  [(PUWallpaperPosterEditorController *)self setIsUserTransformDisabled:v7];
}

- (void)_updateUserTransformView
{
  uint64_t v4 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];
  if (v4)
  {
    double v5 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
    [v5 bounds];
    double v43 = v6;
    double v44 = v7;
    double v45 = v8;
    double v10 = v9;
    [v4 contentRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [v4 visibleFrame];
    double v20 = v19;
    double v42 = v21;
    double v23 = v22;
    double v25 = v24;
    v48.origin.x = v12;
    v48.origin.y = v14;
    v48.size.width = v16;
    v48.size.height = v18;
    if (CGRectIsEmpty(v48))
    {
      double v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:2345 description:@"Layout rect must be valid"];
    }
    double v26 = v12 - v20;
    double v27 = 0.0;
    double v28 = 0.0;
    if (v23 != 0.0)
    {
      double v26 = v26 / v23;
      double v28 = v16 / v23;
    }
    double v29 = v14 - v42;
    if (v25 != 0.0)
    {
      double v29 = v29 / v25;
      double v27 = v18 / v25;
    }
    double v30 = v43 + v26 * v44;
    double v31 = v45 + v29 * v10;
    double v32 = v44 * v28;
    double v33 = v10 * v27;
    double v34 = [(PUWallpaperPosterEditorController *)self userTransformView];
    objc_msgSend(v34, "setContentPixelSize:", v16, v18);
    double v35 = 0.0;
    if ((v16 != -1.79769313e308 || v18 != -1.79769313e308)
      && (v16 != *MEMORY[0x1E4F1DB30] || v18 != *(double *)(MEMORY[0x1E4F1DB30] + 8)))
    {
      double v35 = v16 / v18;
    }
    PURectWithAspectRatioFillingRect(v35, v43, v45, v44, v10);
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    objc_msgSend(v34, "setUntransformedContentFrame:", 0.0, 0.0);
    PUAffineTransformToMatchRect((uint64_t)v47, 0.0, 0.0, v38, v40, v30, v31, v32, v33);
    v46[0] = v47[0];
    v46[1] = v47[1];
    v46[2] = v47[2];
    [v34 setUserAffineTransform:v46];
    [v34 setRequireTwoTouchesForPan:1];
  }
}

- (void)_setupUserTransformView
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self userTransformView];

  if (v3)
  {
    uint64_t v4 = [(PUWallpaperPosterEditorController *)self userTransformView];
    [v4 removeFromSuperview];

    [(PUWallpaperPosterEditorController *)self setUserTransformView:0];
  }
  id v10 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  [v10 bounds];
  PXRectWithOriginAndSize();
  double v9 = -[PUUserTransformView initWithFrame:]([PUUserTransformView alloc], "initWithFrame:", v5, v6, v7, v8);
  [(PUUserTransformView *)v9 setDelegate:self];
  [(PUUserTransformView *)v9 setAutoresizingMask:18];
  [v10 addSubview:v9];
  [(PUWallpaperPosterEditorController *)self setUserTransformView:v9];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  id v10 = v9;
  if (a5 == "EditModelObservationContext")
  {
    if (v6)
    {
      double v12 = [(PUWallpaperPosterEditorController *)self editViewModel];
      id v11 = [v12 currentLayerStackViewModel];

      if ([v11 showsDebugHUD]) {
        [(PUWallpaperPosterEditorController *)self _updateLayerStackViewModelProperties:v11];
      }
      goto LABEL_75;
    }
    goto LABEL_76;
  }
  if (a5 == "LayerStackViewModelObservationContext")
  {
    id v13 = v9;
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_15:
        char v14 = [v13 currentLayerStackPropertiesChange];
        char v15 = [v13 stylePropertiesChange];
        if ((v6 & 2) != 0)
        {
          [(PUWallpaperPosterEditorController *)self _updateLayerStackViewModelProperties:v13];
          [(PUWallpaperPosterEditorController *)self _updateContentOverlayContainerView];
          [(PUWallpaperPosterEditorController *)self _updateUserTransformView];
          [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
        }
        if (v14 & 0x15 | *(void *)&v6 & 0x81000)
        {
          [(PUWallpaperPosterEditorController *)self _updateLayerStackViewModelProperties:v13];
          id v16 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];

          if (v16 == v13) {
            [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
          }
        }
        if (v15 & 0xB | (unint64_t)(v6 & 0x100) | v14 & 8)
        {
          id v17 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];

          if (v17 == v13) {
            [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
          }
        }
        if ((v15 & 0xE) != 0)
        {
          id v18 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];

          if (v18 == v13) {
            [(PUWallpaperPosterEditorController *)self _updateCurrentStyle];
          }
        }
        if ((v14 & 8) != 0)
        {
          id v19 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];

          if (v19 == v13) {
            [(PUWallpaperPosterEditorController *)self _displayNextHint];
          }
        }
        if ((v14 & 2) != 0)
        {
          id v20 = [(PUWallpaperPosterEditorController *)self currentLayerStackViewModel];

          if (v20 == v13)
          {
            double v24 = [v13 currentLayerStack];
            double v25 = [v24 settlingEffectLayer];

            if (v25)
            {
              double v26 = [v13 currentLayerStack];
              int v27 = [v26 settlingEffectEnabled];

              if (v27) {
                [(PUWallpaperPosterEditorController *)self _startSettlingEffectPreviewAfterDelay];
              }
            }
          }
        }

        goto LABEL_76;
      }
      double v39 = [MEMORY[0x1E4F28B00] currentHandler];
      double v42 = (objc_class *)objc_opt_class();
      double v41 = NSStringFromClass(v42);
      double v43 = objc_msgSend(v13, "px_descriptionForAssertionMessage");
      [v39 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 2183, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v41, v43 object file lineNumber description];
    }
    else
    {
      double v39 = [MEMORY[0x1E4F28B00] currentHandler];
      CGFloat v40 = (objc_class *)objc_opt_class();
      double v41 = NSStringFromClass(v40);
      [v39 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 2183, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v41 object file lineNumber description];
    }

    goto LABEL_15;
  }
  if (a5 == "EditViewModelObservationContext")
  {
    if (v6)
    {
      [(PUWallpaperPosterEditorController *)self _updateCurrentLayerStackViewModel];
      [(PUWallpaperPosterEditorController *)self _updateCurrentStyle];
    }
    if ((v6 & 2) == 0)
    {
LABEL_48:
      if ((v6 & 4) != 0) {
        [(PUWallpaperPosterEditorController *)self _updateVisibleLayerStackViewModels];
      }
      if ((v6 & 0x200) != 0)
      {
        double v32 = [(PUWallpaperPosterEditorController *)self editViewModel];
        char v33 = [v32 stylesChange];

        if ((v33 & 2) != 0)
        {
          double v34 = [(PUWallpaperPosterEditorController *)self editor];
          objc_msgSend(v34, "pu_updateLooks");
          goto LABEL_57;
        }
        if (v33) {
          [(PUWallpaperPosterEditorController *)self _updateCurrentStyle];
        }
        if ((v33 & 4) != 0)
        {
          double v34 = [(PUWallpaperPosterEditorController *)self editor];
          objc_msgSend(v34, "pu_updateLuminanceValuesForLooks");
LABEL_57:
        }
      }
      if ((v6 & 0x20) != 0)
      {
        [(PUWallpaperPosterEditorController *)self _updateParallaxEnabled];
        if ((v6 & 0x100) == 0)
        {
LABEL_60:
          if ((v6 & 0x10000) == 0) {
            goto LABEL_61;
          }
          goto LABEL_65;
        }
      }
      else if ((v6 & 0x100) == 0)
      {
        goto LABEL_60;
      }
      [(PUWallpaperPosterEditorController *)self _updateStyleDividerView];
      if ((v6 & 0x10000) == 0)
      {
LABEL_61:
        if ((v6 & 0x1000) == 0) {
          goto LABEL_76;
        }
        goto LABEL_66;
      }
LABEL_65:
      [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
      [(PUWallpaperPosterEditorController *)self _showTrySettlingEffectTip];
      if ((v6 & 0x1000) == 0) {
        goto LABEL_76;
      }
LABEL_66:
      id v11 = [(PUWallpaperPosterEditorController *)self editViewModel];
      int v35 = [v11 isUsingHeadroom];
      unint64_t v36 = [(PUWallpaperPosterEditorController *)self hint];
      if (v35)
      {
        if (v36 == 4) {
          [(PUWallpaperPosterEditorController *)self _showHintAnimated:1 completion:0];
        }
        else {
          [(PUWallpaperPosterEditorController *)self setHint:4];
        }
      }
      else if (v36 == 4)
      {
        double v37 = [(PUWallpaperPosterEditorController *)self editViewModel];
        char v38 = [v37 isUserPanningOrZooming];

        if (v38) {
          [(PUWallpaperPosterEditorController *)self _hideHintAnimated:1 completion:0];
        }
        else {
          [(PUWallpaperPosterEditorController *)self _displayNextHint];
        }
      }
      [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
      goto LABEL_75;
    }
    [(PUWallpaperPosterEditorController *)self _updateParallaxIsPaused];
    double v21 = [(PUWallpaperPosterEditorController *)self editViewModel];
    char v22 = [v21 isUserPanningOrZooming];

    unint64_t v23 = [(PUWallpaperPosterEditorController *)self hint];
    if (v22)
    {
      if (v23 == 3) {
        [(PUWallpaperPosterEditorController *)self _hideHintAnimated:1 completion:0];
      }
      goto LABEL_48;
    }
    if (v23 == 4)
    {
      [(PUWallpaperPosterEditorController *)self cancelPendingHint];
      objc_initWeak(&location, self);
      dispatch_time_t v28 = dispatch_time(0, 2000000000);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke;
      v51[3] = &unk_1E5F2E530;
      double v29 = &v52;
      objc_copyWeak(&v52, &location);
      double v30 = MEMORY[0x1E4F14428];
      double v31 = v51;
    }
    else
    {
      if ([(PUWallpaperPosterEditorController *)self hint] != 3)
      {
        [(PUWallpaperPosterEditorController *)self _displayNextHint];
        goto LABEL_47;
      }
      objc_initWeak(&location, self);
      dispatch_time_t v28 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke_2;
      block[3] = &unk_1E5F2E530;
      double v29 = &v50;
      objc_copyWeak(&v50, &location);
      double v30 = MEMORY[0x1E4F14428];
      double v31 = block;
    }
    dispatch_after(v28, v30, v31);
    objc_destroyWeak(v29);
    objc_destroyWeak(&location);
LABEL_47:
    [(PUWallpaperPosterEditorController *)self _updateParallaxEnabled];
    [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
    goto LABEL_48;
  }
  if (a5 == "AnimateScrollToStyleKindAnimatorObservationContext" && (v6 & 2) != 0)
  {
    id v11 = v9;
    if (v11)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_8;
      }
      double v44 = [MEMORY[0x1E4F28B00] currentHandler];
      char v47 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v47);
      CGRect v48 = objc_msgSend(v11, "px_descriptionForAssertionMessage");
      [v44 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 2310, @"%@ should be an instance inheriting from %@, but it is %@", @"observable", v46, v48 object file lineNumber description];
    }
    else
    {
      double v44 = [MEMORY[0x1E4F28B00] currentHandler];
      double v45 = (objc_class *)objc_opt_class();
      v46 = NSStringFromClass(v45);
      [v44 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 2310, @"%@ should be an instance inheriting from %@, but it is nil", @"observable", v46 object file lineNumber description];
    }

LABEL_8:
    if (([v11 isBeingMutated] & 1) == 0) {
      [(PUWallpaperPosterEditorController *)self _animateScrollToStyleKindAnimatorUpdated];
    }
LABEL_75:
  }
LABEL_76:
}

void __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained hint];

  if (v3 == 4)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _displayNextHint];
  }
}

void __66__PUWallpaperPosterEditorController_observable_didChange_context___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained hint] == 3)
  {
    id v1 = [WeakRetained editViewModel];
    char v2 = [v1 isUserPanningOrZooming];

    if ((v2 & 1) == 0) {
      [WeakRetained _showHintAnimated:1 completion:0];
    }
  }
}

- (void)cancelPendingHint
{
}

- (void)displayNextHintAfterDelay
{
}

- (void)_displayNextHint
{
  [(PUWallpaperPosterEditorController *)self cancelPendingHint];
  unint64_t v3 = [(PUWallpaperPosterEditorController *)self hint];
  id v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
  char v5 = [v4 settlingEffectEnabled];

  if (v5)
  {
    unint64_t v3 = 0;
  }
  else if (v3 < 2)
  {
    unint64_t v3 = [(PUWallpaperPosterEditorController *)self _defaultHint];
  }
  else if (v3 - 3 >= 2)
  {
    if (v3 == 2)
    {
      if ([(PUWallpaperPosterEditorController *)self isUserTransformDisabled]) {
        unint64_t v3 = 2;
      }
      else {
        unint64_t v3 = 3;
      }
    }
  }
  else if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    [(PUWallpaperPosterEditorController *)self displayNextHintAfterDelay];
    unint64_t v3 = 2;
  }
  else
  {
    unint64_t v3 = 3;
  }
  [(PUWallpaperPosterEditorController *)self setHint:v3];
}

- (void)_displayDefaultHint
{
  [(PUWallpaperPosterEditorController *)self cancelPendingHint];
  unint64_t v3 = [(PUWallpaperPosterEditorController *)self _defaultHint];
  if ((![(PUWallpaperPosterEditorController *)self hint]
     || [(PUWallpaperPosterEditorController *)self hint] == 1)
    && v3 == 3)
  {
    if ([(PUWallpaperPosterEditorController *)self hint] == 1) {
      [(PUWallpaperPosterEditorController *)self setHint:0];
    }
  }
  else
  {
    [(PUWallpaperPosterEditorController *)self setHint:v3];
    if ([(PUWallpaperPosterEditorController *)self hint] != 2) {
      return;
    }
  }
  [(PUWallpaperPosterEditorController *)self displayNextHintAfterDelay];
}

- (unint64_t)_defaultHint
{
  if ([(PUWallpaperPosterEditorController *)self _isShuffle]) {
    return 2;
  }
  if ([(PUWallpaperPosterEditorController *)self isUserTransformDisabled]) {
    return 0;
  }
  return 3;
}

- (void)_showHintAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(PUWallpaperPosterEditorController *)self hint]
    && [(PUWallpaperPosterEditorController *)self _createHintLabelIfNeeded])
  {
    double v8 = [(PUWallpaperPosterEditorController *)self hintLabel];
    if (!v8)
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:2074 description:@"expected hintLabel"];
    }
    double v9 = 0.0;
    [v8 setAlpha:0.0];
    switch([(PUWallpaperPosterEditorController *)self hint])
    {
      case 0uLL:
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:2090 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1uLL:
        id v10 = @"PHOTOS_WALLPAPER_LOADING_PROGRESS_INDICATOR_TITLE";
        goto LABEL_8;
      case 2uLL:
        id v10 = @"PHOTOS_WALLPAPER_EDITOR_TAP_TO_SHUFFLE";
LABEL_8:
        id v11 = PULocalizedString(v10);
        [v8 setText:v11];
        goto LABEL_14;
      case 3uLL:
        id v11 = [(PUWallpaperPosterEditorController *)self pinchToZoomHintTitle];
        [v8 setAttributedText:v11];
        goto LABEL_14;
      case 4uLL:
        id v11 = [(PUWallpaperPosterEditorController *)self environment];
        if (objc_msgSend(v11, "px_isCallServices")) {
          double v12 = @"PHOTOS_WALLPAPER_EDITOR_POSTER_EXTENDED";
        }
        else {
          double v12 = @"PHOTOS_WALLPAPER_EDITOR_WALLPAPER_EXTENDED";
        }
        id v13 = PULocalizedString(v12);
        [v8 setText:v13];

LABEL_14:
        break;
      default:
        break;
    }
    if (v4) {
      double v9 = 0.3;
    }
    char v14 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke;
    v20[3] = &unk_1E5F2ED10;
    id v21 = v8;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke_2;
    void v18[3] = &unk_1E5F2D990;
    id v19 = v7;
    id v15 = v8;
    [v14 animateWithDuration:4 delay:v20 options:v18 animations:v9 completion:0.0];
  }
}

uint64_t __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __66__PUWallpaperPosterEditorController__showHintAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_hideHintAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  int v6 = (void (**)(void))a4;
  id v7 = [(PUWallpaperPosterEditorController *)self hintLabel];

  if (v7)
  {
    if (v4) {
      double v8 = 0.3;
    }
    else {
      double v8 = 0.0;
    }
    double v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke;
    v12[3] = &unk_1E5F2ED10;
    void v12[4] = self;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E5F2D990;
    id v11 = v6;
    [v9 animateWithDuration:v12 animations:v10 completion:v8];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) hintLabel];
  [v1 setAlpha:0.0];
}

uint64_t __66__PUWallpaperPosterEditorController__hideHintAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)hintLabelTextColor
{
  return (id)[MEMORY[0x1E4FB1618] whiteColor];
}

- (id)hintLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D0] weight:*MEMORY[0x1E4FB09E0]];
}

- (double)_hintLabelBottomAnchorDistance
{
  char v2 = [(PUWallpaperPosterEditorController *)self editor];
  objc_msgSend(v2, "pu_editingChromeDodgingInsets");
  double v4 = v3 + 40.0;

  return v4;
}

- (void)_updateHintLabelConstraints
{
  double v3 = [(PUWallpaperPosterEditorController *)self hintLabelBottomConstraint];

  if (v3)
  {
    [(PUWallpaperPosterEditorController *)self _hintLabelBottomAnchorDistance];
    double v5 = v4;
    id v6 = [(PUWallpaperPosterEditorController *)self hintLabelBottomConstraint];
    [v6 setConstant:v5];
  }
}

- (BOOL)_createHintLabelIfNeeded
{
  v22[3] = *MEMORY[0x1E4F143B8];
  double v3 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  if (v3)
  {
    double v4 = [(PUWallpaperPosterEditorController *)self hintLabel];

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
      id v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v7 = [(PUWallpaperPosterEditorController *)self hintLabelFont];
      [v6 setFont:v7];

      [v6 setTextAlignment:1];
      [v6 setNumberOfLines:0];
      double v8 = [(PUWallpaperPosterEditorController *)self hintLabelTextColor];
      [v6 setTextColor:v8];

      [v3 addSubview:v6];
      double v9 = [v3 bottomAnchor];
      id v10 = [v6 bottomAnchor];
      [(PUWallpaperPosterEditorController *)self _hintLabelBottomAnchorDistance];
      id v11 = objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10);
      [(PUWallpaperPosterEditorController *)self setHintLabelBottomConstraint:v11];

      id v20 = (void *)MEMORY[0x1E4F28DC8];
      id v21 = [v6 widthAnchor];
      double v12 = [v3 widthAnchor];
      id v13 = [v21 constraintEqualToAnchor:v12];
      v22[0] = v13;
      char v14 = [v6 centerXAnchor];
      id v15 = [v3 centerXAnchor];
      id v16 = [v14 constraintEqualToAnchor:v15];
      v22[1] = v16;
      id v17 = [(PUWallpaperPosterEditorController *)self hintLabelBottomConstraint];
      v22[2] = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:3];
      [v20 activateConstraints:v18];

      [v6 setAlpha:0.0];
      [(PUWallpaperPosterEditorController *)self setHintLabel:v6];
    }
  }

  return v3 != 0;
}

- (NSAttributedString)pinchToZoomHintTitle
{
  v17[1] = *MEMORY[0x1E4F143B8];
  pinchToZoomHintTitle = self->_pinchToZoomHintTitle;
  if (!pinchToZoomHintTitle)
  {
    double v4 = PULocalizedString(@"PHOTOS_WALLPAPER_EDITOR_PINCH_TO_CROP");
    id v5 = (NSAttributedString *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v4];
    id v6 = (void *)MEMORY[0x1E4FB1830];
    id v7 = [(PUWallpaperPosterEditorController *)self hintLabelFont];
    double v8 = [v6 configurationWithFont:v7];

    double v9 = (void *)MEMORY[0x1E4FB1830];
    id v10 = [(PUWallpaperPosterEditorController *)self hintLabelTextColor];
    v17[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    double v12 = [v9 configurationWithPaletteColors:v11];
    id v13 = [v8 configurationByApplyingConfiguration:v12];

    char v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"crop" withConfiguration:v13];
    [(NSAttributedString *)v5 px_replaceOccurrencesOfString:@"(_SYMBOL_PLACEHOLDER_)" withTextAttachmentWithImage:v14];
    id v15 = self->_pinchToZoomHintTitle;
    self->_pinchToZoomHintTitle = v5;

    pinchToZoomHintTitle = self->_pinchToZoomHintTitle;
  }
  return pinchToZoomHintTitle;
}

- (void)_updateHintLabelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PUWallpaperPosterEditorController__updateHintLabelAnimated___block_invoke;
  v5[3] = &unk_1E5F2D918;
  objc_copyWeak(&v6, &location);
  BOOL v7 = v3;
  [(PUWallpaperPosterEditorController *)self _hideHintAnimated:v3 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__PUWallpaperPosterEditorController__updateHintLabelAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showHintAnimated:*(unsigned __int8 *)(a1 + 40) completion:0];
}

- (void)setHint:(unint64_t)a3
{
  unint64_t hint = self->_hint;
  if (hint != a3)
  {
    self->_unint64_t hint = a3;
    BOOL v5 = a3 - 3 < 0xFFFFFFFFFFFFFFFELL || hint != 0;
    [(PUWallpaperPosterEditorController *)self _updateHintLabelAnimated:v5];
  }
}

- (void)_updateShuffleSuggestionFeaturedStateIfNeededForConfiguration:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 shuffleConfiguration];
  id v6 = v5;
  if (v5 && ![v5 shuffleType])
  {
    double v37 = self;
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    double v8 = [v4 media];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v41 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v14 = [v13 suggestionUUID];

            if (v14)
            {
              id v15 = [v13 suggestionUUID];
              [v7 addObject:v15];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v48 count:16];
      }
      while (v10);
    }
    id v16 = [(PUWallpaperPosterEditorController *)v37 photoLibrary];
    id v17 = [v16 librarySpecificFetchOptions];

    id v18 = (void *)MEMORY[0x1E4F28BA0];
    id v19 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", @"state", 4);
    v47[0] = v19;
    id v20 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v7];
    v47[1] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    char v22 = [v18 andPredicateWithSubpredicates:v21];
    [v17 setPredicate:v22];

    unint64_t v23 = [MEMORY[0x1E4F39310] fetchSuggestionsWithOptions:v17];
    uint64_t v24 = [v23 count];
    if (v24 != [v8 count])
    {
      double v25 = PLWallpaperGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        int v26 = [v8 count];
        int v27 = [v23 count];
        *(_DWORD *)id buf = 67109376;
        *(_DWORD *)v46 = v26;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v27;
        _os_log_impl(&dword_1AE9F8000, v25, OS_LOG_TYPE_ERROR, "Shuffle suggestion count mismatch. Expected %d, found %d in library", buf, 0xEu);
      }
    }
    dispatch_time_t v28 = [(PUWallpaperPosterEditorController *)v37 photoLibrary];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    void v39[2] = __99__PUWallpaperPosterEditorController__updateShuffleSuggestionFeaturedStateIfNeededForConfiguration___block_invoke;
    v39[3] = &unk_1E5F2ED10;
    id v29 = v23;
    id v40 = v29;
    id v38 = 0;
    int v30 = [v28 performChangesAndWait:v39 error:&v38];
    id v31 = v38;

    double v32 = PLWallpaperGetLog();
    char v33 = v32;
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id buf = 138412290;
        *(void *)v46 = v7;
        double v34 = "Updated featured state for shuffle wallpaper suggestions %@";
        int v35 = v33;
        os_log_type_t v36 = OS_LOG_TYPE_INFO;
LABEL_22:
        _os_log_impl(&dword_1AE9F8000, v35, v36, v34, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      *(void *)v46 = v31;
      double v34 = "Failed updating featured state for shuffle wallpaper suggestions. Error: %@";
      int v35 = v33;
      os_log_type_t v36 = OS_LOG_TYPE_ERROR;
      goto LABEL_22;
    }
  }
}

void __99__PUWallpaperPosterEditorController__updateShuffleSuggestionFeaturedStateIfNeededForConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = objc_msgSend(MEMORY[0x1E4F39318], "changeRequestForSuggestion:", *(void *)(*((void *)&v7 + 1) + 8 * v5), (void)v7);
        [v6 setFeaturedState:1];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_savePosterEditConfigurationForCurrentPosterMedia
{
  id v5 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  uint64_t v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
  uint64_t v4 = [v3 posterEditConfigurationRepresentation];
  [v5 setEditConfiguration:v4];
}

- (void)_applyPosterEditConfigurationForShuffleAsset
{
  uint64_t v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v8 = [v3 editConfiguration];

  uint64_t v4 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  id v5 = [v4 editConfiguration];

  if (v5)
  {
    id v6 = v5;

    id v8 = v6;
LABEL_4:
    long long v7 = [(PUWallpaperPosterEditorController *)self editViewModel];
    [v7 applyChangesFromPosterEditConfiguration:v8];

    goto LABEL_5;
  }
  if (v8) {
    goto LABEL_4;
  }
  id v8 = 0;
LABEL_5:
}

- (void)_handleTapToShuffle:(id)a3
{
  if (![(PUWallpaperPosterEditorController *)self isLoading])
  {
    int64_t v4 = [(PUWallpaperPosterEditorController *)self shuffleAssetIndex] + 1;
    [(PUWallpaperPosterEditorController *)self setShuffleAssetIndex:v4];
  }
}

- (void)_updateShuffleView
{
  id v6 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  uint64_t v3 = [(PUWallpaperPosterEditorController *)self environment];
  uint64_t v4 = objc_msgSend(v3, "pu_posterType");

  if (v4 == 2)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTapToShuffle_];
    [v6 addGestureRecognizer:v5];
    [(PUWallpaperPosterEditorController *)self setTapToShuffleGestureRecognizer:v5];
  }
  else
  {
    id v5 = [(PUWallpaperPosterEditorController *)self tapToShuffleGestureRecognizer];
    [v6 removeGestureRecognizer:v5];
  }
}

- (void)setShuffleAssetIndex:(int64_t)a3
{
  if (self->_shuffleAssetIndex != a3)
  {
    self->_shuffleAssetIndex = a3;
    if ([(PUWallpaperPosterEditorController *)self hint] == 2)
    {
      [(PUWallpaperPosterEditorController *)self cancelPendingHint];
      objc_initWeak(&location, self);
      uint64_t v4 = MEMORY[0x1E4F143A8];
      uint64_t v5 = 3221225472;
      id v6 = __58__PUWallpaperPosterEditorController_setShuffleAssetIndex___block_invoke;
      long long v7 = &unk_1E5F2E530;
      objc_copyWeak(&v8, &location);
      [(PUWallpaperPosterEditorController *)self _hideHintAnimated:1 completion:&v4];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
    [(PUWallpaperPosterEditorController *)self _savePosterEditConfigurationForCurrentPosterMedia];
    [(PUWallpaperPosterEditorController *)self _loadAssetFromPosterConfiguration];
  }
}

void __58__PUWallpaperPosterEditorController_setShuffleAssetIndex___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showHintAnimated:1 completion:0];
}

- (BOOL)_isShuffleModeWithGlobalDepth
{
  BOOL v3 = [(PUWallpaperPosterEditorController *)self _isShuffle];
  if (v3)
  {
    uint64_t v4 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    uint64_t v5 = [v4 shuffleConfiguration];
    uint64_t v6 = [v5 shuffleType];

    LOBYTE(v3) = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 0;
  }
  return v3;
}

- (BOOL)_isManualShuffle
{
  if (![(PUWallpaperPosterEditorController *)self _isShuffle]) {
    return 0;
  }
  BOOL v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v4 = [v3 shuffleConfiguration];
  BOOL v5 = [v4 shuffleType] == 1;

  return v5;
}

- (BOOL)_isUserAlbumShuffle
{
  if (![(PUWallpaperPosterEditorController *)self _isShuffle]) {
    return 0;
  }
  BOOL v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v4 = [v3 shuffleConfiguration];
  BOOL v5 = [v4 shuffleType] == 2;

  return v5;
}

- (BOOL)_isSmartShuffle
{
  if (![(PUWallpaperPosterEditorController *)self _isShuffle]) {
    return 0;
  }
  BOOL v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v4 = [v3 shuffleConfiguration];
  BOOL v5 = [v4 shuffleType] == 0;

  return v5;
}

- (int64_t)_shuffleType
{
  uint64_t v4 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  BOOL v5 = [v4 shuffleConfiguration];
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:1834 description:@"Expected shuffle configuration"];
  }
  int64_t v6 = [v5 shuffleType];

  return v6;
}

- (BOOL)_isShuffle
{
  uint64_t v2 = [(PUWallpaperPosterEditorController *)self environment];
  BOOL v3 = objc_msgSend(v2, "pu_posterType") == 2;

  return v3;
}

- (void)wallpaperPosterShuffleGridViewController:(id)a3 didFinishWithChange:(id)a4 selectedPosterMedia:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewController];
  if ([v7 hasChanges])
  {
    long long v9 = [v7 differenceByTransformingChangesWithBlock:&__block_literal_global_489];
    long long v10 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    uint64_t v11 = [v10 media];
    uint64_t v12 = [v11 arrayByApplyingDifference:v9];

    id v13 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    [v13 setMedia:v12];

    char v14 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    [v14 startPreloadingResourcesForPosterMedia:v12];

    [(PUWallpaperPosterEditorController *)self _loadAssetFromPosterConfiguration];
  }
  if (v8)
  {
    id v15 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v16 = [v15 media];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke_2;
    void v18[3] = &unk_1E5F26918;
    id v19 = v8;
    uint64_t v17 = [v16 indexOfObjectPassingTest:v18];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
      [(PUWallpaperPosterEditorController *)self setShuffleAssetIndex:v17];
    }
  }
}

uint64_t __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 assetUUID];
  uint64_t v4 = [*(id *)(a1 + 32) assetUUID];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

id __118__PUWallpaperPosterEditorController_wallpaperPosterShuffleGridViewController_didFinishWithChange_selectedPosterMedia___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F38EB8];
  id v3 = a2;
  uint64_t v4 = [v3 object];
  uint64_t v5 = [v4 assetUUID];
  int64_t v6 = [v2 uuidFromLocalIdentifier:v5];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F8CD18]) initWithAssetUUID:v6];
  id v8 = (void *)MEMORY[0x1E4F28F18];
  uint64_t v9 = [v3 changeType];
  uint64_t v10 = [v3 index];
  uint64_t v11 = [v3 associatedIndex];

  uint64_t v12 = [v8 changeWithObject:v7 type:v9 index:v10 associatedIndex:v11];

  return v12;
}

- (void)_didLoadMediaFromShuffleConfigurationViewController:(id)a3 succeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(PUWallpaperPosterEditorController *)self setMediaLoadedCompletionHandler:0];
  if ([(PUWallpaperPosterEditorController *)self isCancellingMediaLoading])
  {
    int64_t v6 = [(PUWallpaperPosterEditorController *)self oldPosterConfiguration];
    [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v6];

    [(PUWallpaperPosterEditorController *)self setIsCancellingMediaLoading:0];
  }
  else if (v4)
  {
    [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewController];
  }
  else
  {
    [v7 didFailFinishingWithPosterConfiguration];
  }
}

- (void)wallpaperShuffleConfigurationViewControllerDidCancelManuallySelectingPhotos:(id)a3
{
  BOOL v4 = [(PUWallpaperPosterEditorController *)self mediaLoadedCompletionHandler];

  if (v4)
  {
    [(PUWallpaperPosterEditorController *)self setIsCancellingMediaLoading:1];
  }
}

- (void)wallpaperShuffleConfigurationViewController:(id)a3 didFinishWithPosterConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(PUWallpaperPosterEditorController *)self editViewModel];

  if (v8)
  {
    [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewController];
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __114__PUWallpaperPosterEditorController_wallpaperShuffleConfigurationViewController_didFinishWithPosterConfiguration___block_invoke;
    v13[3] = &unk_1E5F268D0;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    [(PUWallpaperPosterEditorController *)self setMediaLoadedCompletionHandler:v13];

    objc_destroyWeak(&v15);
  }
  uint64_t v9 = [v7 media];
  if ([v9 count]) {
    goto LABEL_7;
  }
  uint64_t v10 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  uint64_t v11 = [v10 media];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    [(PUWallpaperPosterEditorController *)self posterConfiguration];
    uint64_t v9 = v7;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
  }
  [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v7];
  objc_destroyWeak(&location);
}

void __114__PUWallpaperPosterEditorController_wallpaperShuffleConfigurationViewController_didFinishWithPosterConfiguration___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didLoadMediaFromShuffleConfigurationViewController:*(void *)(a1 + 32) succeeded:a2];
}

- (void)wallpaperShuffleConfigurationViewControllerDidDismiss:(id)a3
{
  BOOL v4 = [(PUWallpaperPosterEditorController *)self editViewModel];

  if (!v4)
  {
    [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewControllerAndCancelEditor];
  }
}

- (void)_reloadSmartAlbumPreviewAssetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [_PUWallpaperSmartAlbumPreviewReloadRequest alloc];
  id v6 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v7 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v8 = [v7 shuffleConfiguration];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __89__PUWallpaperPosterEditorController__reloadSmartAlbumPreviewAssetsWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5F268A8;
  objc_copyWeak(&v13, &location);
  id v9 = v4;
  id v12 = v9;
  uint64_t v10 = [(_PUWallpaperSmartAlbumPreviewReloadRequest *)v5 initWithPhotoLibrary:v6 shuffleConfiguration:v8 completion:v11];
  [(PUWallpaperPosterEditorController *)self setSmartAlbumPreviewReloadRequest:v10];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __89__PUWallpaperPosterEditorController__reloadSmartAlbumPreviewAssetsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setSmartAlbumPreviewReloadRequest:0];

  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }
}

- (void)_rejectSuggestionsForCurrentAsset
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  uint64_t v4 = [v3 assetUUID];
  id v5 = PLWallpaperGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138412290;
    id v26 = v3;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_INFO, "User rejected poster media %@", buf, 0xCu);
  }

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke;
  aBlock[3] = &unk_1E5F2D758;
  objc_copyWeak(&v22, &location);
  id v6 = v3;
  id v20 = v6;
  id v7 = v4;
  id v21 = v7;
  id v8 = (void (**)(void))_Block_copy(aBlock);
  id v9 = (void *)MEMORY[0x1E4F38EB8];
  id v24 = v7;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  uint64_t v11 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v12 = [v11 librarySpecificFetchOptions];
  id v13 = [v9 fetchAssetsWithUUIDs:v10 options:v12];
  id v14 = [v13 firstObject];

  if (v14)
  {
    id v15 = (void *)MEMORY[0x1E4F8E858];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_484;
    v17[3] = &unk_1E5F2DB20;
    id v18 = v8;
    [v15 rejectWallpaperSuggestionsUsingAsset:v14 completionHandler:v17];
  }
  else
  {
    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138543362;
      id v26 = v7;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Could not fetch PHAsset with rejected UUID %{public}@, choosing replacement anyway.", buf, 0xCu);
    }

    v8[2](v8);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_2;
  v3[3] = &unk_1E5F2A950;
  void v3[4] = WeakRetained;
  id v4 = a1[4];
  id v5 = a1[5];
  [WeakRetained _reloadSmartAlbumPreviewAssetsWithCompletionHandler:v3];
}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_484(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLWallpaperGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to reject asset suggestion for smart album shuffle, choosing replacement anyway. Error was: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 posterConfiguration];
  id v6 = [v5 media];
  int v7 = (void *)[v6 mutableCopy];

  [v7 removeObject:*(void *)(a1 + 40)];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = PXMap();
  uint64_t v10 = [v8 setWithArray:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  id v12 = PXMap();

  id v13 = [v11 setWithArray:v12];

  id v14 = PXSetSubtract();
  id v15 = (void *)[v14 mutableCopy];

  [v15 removeObject:*(void *)(a1 + 48)];
  if ([v15 count])
  {
    id v16 = [v15 anyObject];
    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F8CD18]) initWithAssetUUID:v16];
    id v18 = PLWallpaperGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v21 = 138543362;
      id v22 = v17;
      _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_INFO, "Replacing user-rejected asset with new poster media %{public}@", (uint8_t *)&v21, 0xCu);
    }

    [v7 addObject:v17];
  }
  else
  {
    id v16 = PLWallpaperGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Could not find any new asset to replace user-rejected asset!", (uint8_t *)&v21, 2u);
    }
  }

  id v19 = (void *)[v7 copy];
  id v20 = [*(id *)(a1 + 32) posterConfiguration];
  [v20 setMedia:v19];

  [*(id *)(a1 + 32) _loadAssetFromPosterConfiguration];
}

uint64_t __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

uint64_t __70__PUWallpaperPosterEditorController__rejectSuggestionsForCurrentAsset__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 assetUUID];
}

- (id)_shuffleFrequencyMenu
{
  v34[4] = *MEMORY[0x1E4F143B8];
  v33[0] = &unk_1F078BE10;
  id v3 = PULocalizedString(@"PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_TAP");
  v34[0] = v3;
  v33[1] = &unk_1F078BE28;
  id v4 = PULocalizedString(@"PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_LOCK");
  v34[1] = v4;
  v33[2] = &unk_1F078BE40;
  id v5 = PULocalizedString(@"PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_HOURLY");
  v34[2] = v5;
  v33[3] = &unk_1F078BE58;
  id v6 = PULocalizedString(@"PHOTOS_WALLPAPER_SHUFFLE_FREQUENCY_DAILY");
  v34[3] = v6;
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:4];

  int v7 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v8 = [v7 shuffleConfiguration];
  uint64_t v9 = [v8 shuffleFrequency];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_initWeak(&location, self);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v11 = [&unk_1F078AE20 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(&unk_1F078AE20);
        }
        id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v15 = (void *)[v14 integerValue];
        id v16 = [v24 objectForKeyedSubscript:v14];
        uint64_t v17 = (void *)MEMORY[0x1E4FB13F0];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __58__PUWallpaperPosterEditorController__shuffleFrequencyMenu__block_invoke;
        v25[3] = &unk_1E5F2E7F8;
        objc_copyWeak(v26, &location);
        v26[1] = v15;
        id v18 = [v17 actionWithTitle:v16 image:0 identifier:0 handler:v25];
        id v19 = v18;
        if (v15 == (void *)v9) {
          [v18 setState:1];
        }
        [v10 addObject:v19];

        objc_destroyWeak(v26);
      }
      uint64_t v11 = [&unk_1F078AE20 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v11);
  }
  id v20 = [MEMORY[0x1E4FB1818] systemImageNamed:@"clock.arrow.circlepath"];
  int v21 = PULocalizedString(@"PHOTOS_WALLPAPER_SHUFFLE_CONFIGURATION_FREQUENCY_TITLE");
  id v22 = [MEMORY[0x1E4FB1970] menuWithTitle:v21 image:v20 identifier:0 options:33 children:v10];

  objc_destroyWeak(&location);
  return v22;
}

void __58__PUWallpaperPosterEditorController__shuffleFrequencyMenu__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained posterConfiguration];
  id v3 = [v2 shuffleConfiguration];
  [v3 setShuffleFrequency:v1];
}

- (void)_presentManualShuffleAssetEditor
{
  id v3 = [PUWallpaperPosterShuffleGridViewController alloc];
  id v4 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
  id v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v6 = [v5 media];
  id v8 = [(PUWallpaperPosterShuffleGridViewController *)v3 initWithResourceManager:v4 posterMedia:v6];

  [(PUWallpaperPosterShuffleGridViewController *)v8 setDelegate:self];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [v7 setToolbarHidden:0];
  [(PUWallpaperPosterEditorController *)self _presentPosterConfigurationViewController:v7];
}

- (void)_updateSmartAlbumAvailability
{
  objc_initWeak(&location, self);
  id v3 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v4 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke;
  block[3] = &unk_1E5F2E4E8;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, &location);
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F908F0] isAnySmartAlbumAvailableInPhotoLibrary:*(void *)(a1 + 32)];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke_2;
  v3[3] = &unk_1E5F2D918;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  char v5 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

void __66__PUWallpaperPosterEditorController__updateSmartAlbumAvailability__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsAnySmartAlbumAvailable:v1];
}

- (void)_presentSmartAlbumShuffleEditor
{
  if ([(PUWallpaperPosterEditorController *)self isAnySmartAlbumAvailable])
  {
    id v14 = [(PUWallpaperPosterEditorController *)self centerSuggestionMedia];
    id v3 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
    id v4 = [(PUWallpaperPosterEditorController *)self photoLibrary];
    char v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v6 = [(PUWallpaperShuffleConfigurationViewController *)v3 initWithPhotoLibrary:v4 style:1 posterConfiguration:v5 centerMedia:v14];

    [(PUWallpaperShuffleConfigurationViewController *)v6 setDelegate:self];
    [(PUWallpaperPosterEditorController *)self _presentPosterConfigurationViewController:v6];
  }
  else
  {
    id v7 = PULocalizedString(@"PHOTOS_WALLPAPER_SMART_ALBUM_SHUFFLE_CONFIGURATION_UNAVAILABLE_TITLE");
    id v8 = PULocalizedString(@"PHOTOS_WALLPAPER_SMART_ALBUM_SHUFFLE_CONFIGURATION_UNAVAILABLE_DESCRIPTION");
    uint64_t v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    id v10 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v11 = PXLocalizedString();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __68__PUWallpaperPosterEditorController__presentSmartAlbumShuffleEditor__block_invoke;
    v15[3] = &unk_1E5F2BF98;
    v15[4] = self;
    uint64_t v12 = [v10 actionWithTitle:v11 style:1 handler:v15];
    [v9 addAction:v12];

    id v13 = [(PUWallpaperPosterEditorController *)self editor];
    [v13 presentViewController:v9 animated:1 completion:0];
  }
}

void __68__PUWallpaperPosterEditorController__presentSmartAlbumShuffleEditor__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) editor];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentUserAlbumShuffleEditor
{
  id v3 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
  id v4 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  char v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v6 = [(PUWallpaperShuffleConfigurationViewController *)v3 initWithPhotoLibrary:v4 style:2 posterConfiguration:v5 centerMedia:0];

  [(PUWallpaperShuffleConfigurationViewController *)v6 setDelegate:self];
  [(PUWallpaperPosterEditorController *)self _presentPosterConfigurationViewController:v6];
}

- (void)_presentShuffleConfigurationEditor
{
  id v4 = [(PUWallpaperPosterEditorController *)self posterConfiguration];

  if (v4)
  {
    char v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    id v19 = [v5 shuffleConfiguration];

    id v6 = v19;
    if (!v19)
    {
      id v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 1602, @"Invalid parameter not satisfying: %@", @"shuffleConfiguration" object file lineNumber description];

      id v6 = 0;
    }
    uint64_t v7 = [v6 shuffleType];
    if (v7)
    {
      if (v7 == 2)
      {
        [(PUWallpaperPosterEditorController *)self _presentUserAlbumShuffleEditor];
      }
      else if (v7 == 1)
      {
        [(PUWallpaperPosterEditorController *)self _presentManualShuffleAssetEditor];
      }
    }
    else
    {
      [(PUWallpaperPosterEditorController *)self _presentSmartAlbumShuffleEditor];
    }
  }
  else
  {
    id v8 = [(PUWallpaperPosterEditorController *)self environment];
    uint64_t v9 = objc_msgSend(v8, "pu_posterDescriptor");
    id v10 = [v9 shuffleConfiguration];

    if (v10)
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = [(PUWallpaperPosterEditorController *)self environment];
      id v13 = objc_msgSend(v12, "pu_posterDescriptor");
      id v19 = [v11 posterConfigurationFromPosterDescriptor:v13];
    }
    else
    {
      id v19 = 0;
    }
    id v14 = [(PUWallpaperPosterEditorController *)self centerSuggestionMedia];
    id v15 = [_TtC15PhotosUIPrivate45PUWallpaperShuffleConfigurationViewController alloc];
    id v16 = [(PUWallpaperPosterEditorController *)self photoLibrary];
    uint64_t v17 = [(PUWallpaperShuffleConfigurationViewController *)v15 initWithPhotoLibrary:v16 style:0 posterConfiguration:v19 centerMedia:v14];

    [(PUWallpaperShuffleConfigurationViewController *)v17 setDelegate:self];
    [(PUWallpaperPosterEditorController *)self _presentPosterConfigurationViewController:v17];
  }
}

- (id)centerSuggestionMedia
{
  char v2 = [(PUWallpaperPosterEditorController *)self environment];
  id v3 = objc_msgSend(v2, "pu_posterDescriptor");

  if (v3)
  {
    id v4 = [v3 media];
    id v5 = (id)[v4 count];

    if (v5)
    {
      id v6 = [v3 media];
      uint64_t v7 = [v6 firstObject];

      if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        id v5 = v7;
      }
      else {
        id v5 = 0;
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
}

- (void)_didLoadMediaFromPhotoPickerWithAssetUUID:(id)a3 succeeded:(BOOL)a4 error:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(PUWallpaperPosterEditorController *)self setMediaLoadedCompletionHandler:0];
  if ([(PUWallpaperPosterEditorController *)self isCancellingMediaLoading])
  {
    id v8 = [(PUWallpaperPosterEditorController *)self oldPosterConfiguration];
    [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v8];
  }
  if (a4 || [(PUWallpaperPosterEditorController *)self isCancellingMediaLoading]) {
    [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewController];
  }
  [(PUWallpaperPosterEditorController *)self setIsCancellingMediaLoading:0];
  if (v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F38EB8] localIdentifierWithUUID:v7];
    id v10 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];
    v15[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v10 _stopActivityIndicatorsForAssetsWithIdentifiers:v11];

    if (!a4)
    {
      uint64_t v12 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];
      id v14 = v9;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      [v12 deselectAssetsWithIdentifiers:v13];
    }
  }
}

- (void)_extensionWillResignNotification:(id)a3
{
  id v4 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];

  if (v4)
  {
    id v5 = PLWallpaperGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Host extension will resign notification while photos picker is shown. Forwarding to Photos picker.", v7, 2u);
    }

    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"_UIViewServiceHostWillResignActiveNotification" object:self];
  }
}

- (void)_stopListeningForExtensionHostResignationNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:0 object:0];
}

- (void)_beginListeningForExtensionHostResignationNotification
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__extensionWillResignNotification_ name:*MEMORY[0x1E4F28288] object:0];
}

- (void)_handlePhotoPickerResults:(id)a3
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 firstObject];
  id v6 = [v5 assetIdentifier];
  id v7 = [(PUWallpaperPosterEditorController *)self mediaLoadedCompletionHandler];

  id v8 = [v5 itemProvider];
  uint64_t v9 = [v8 registeredTypeIdentifiers];
  id v10 = PXPhotosFileProviderTypeIdentifierLiveWallpaperPrivate();
  -[PUWallpaperPosterEditorController setShouldLoadSettlingEffectSynchronously:](self, "setShouldLoadSettlingEffectSynchronously:", [v9 containsObject:v10]);

  if ([(PUWallpaperPosterEditorController *)self shouldLoadSettlingEffectSynchronously])
  {
    uint64_t v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "Picker result came from Live Photo tab", (uint8_t *)buf, 2u);
    }
  }
  if (v6)
  {
    if (!v7)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F38EB8];
      v48[0] = v6;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
      id v14 = [(PUWallpaperPosterEditorController *)self photoLibrary];
      id v15 = [v14 librarySpecificFetchOptions];
      id v16 = [v12 fetchAssetsWithLocalIdentifiers:v13 options:v15];
      uint64_t v17 = [v16 firstObject];

      if (v17)
      {
        id v18 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];
        char v47 = v6;
        id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
        [v18 _startActivityIndicatorsForAssetsWithIdentifiers:v19];

        objc_initWeak(buf, self);
        uint64_t v40 = MEMORY[0x1E4F143A8];
        uint64_t v41 = 3221225472;
        long long v42 = __63__PUWallpaperPosterEditorController__handlePhotoPickerResults___block_invoke;
        long long v43 = &unk_1E5F26860;
        objc_copyWeak(&v44, buf);
        [(PUWallpaperPosterEditorController *)self setMediaLoadedCompletionHandler:&v40];
        id v20 = [v17 uuid];
        int v21 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
        id v22 = [v21 assetUUID];
        int v23 = [v20 isEqualToString:v22];

        if (v23)
        {
          id v24 = [(PUWallpaperPosterEditorController *)self editViewModel];
          BOOL v25 = v24 == 0;

          if (v25) {
            [(PUWallpaperPosterEditorController *)self _loadContentForCurrentPosterMedia];
          }
          else {
            [(PUWallpaperPosterEditorController *)self _didLoadMediaFromPhotoPickerWithAssetUUID:v20 succeeded:1 error:0];
          }
        }
        else
        {
          long long v28 = [(PUWallpaperPosterEditorController *)self environment];
          uint64_t v29 = objc_msgSend(v28, "pu_posterType");

          long long v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CCF8]), "initWithConfigurationType:", objc_msgSend((id)objc_opt_class(), "posterConfigurationTypeForPosterType:", v29));
          id v31 = (void *)[objc_alloc(MEMORY[0x1E4F8CD18]) initWithAssetUUID:v20];
          v46 = v31;
          double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
          [v30 setMedia:v32];

          char v33 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
          double v34 = [(PUWallpaperPosterEditorController *)self environment];
          int v35 = objc_msgSend(v34, "px_isCallServices");
          if (v33) {
            int v36 = v35;
          }
          else {
            int v36 = 0;
          }

          if (v36)
          {
            objc_msgSend(v30, "setOptions:", objc_msgSend(v33, "options"));
            double v37 = [v33 userInfo];
            id v38 = (void *)[v37 copy];
            [v30 setUserInfo:v38];
          }
          [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v30];
        }
        objc_destroyWeak(location);
        objc_destroyWeak(buf);
      }
    }
  }
  else
  {
    id v26 = [(PUWallpaperPosterEditorController *)self editViewModel];
    BOOL v27 = v26 == 0;

    if (v27)
    {
      [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewControllerAndCancelEditor];
    }
    else if (v7)
    {
      [(PUWallpaperPosterEditorController *)self setIsCancellingMediaLoading:1];
    }
    else
    {
      [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewController];
    }
  }
}

void __63__PUWallpaperPosterEditorController__handlePhotoPickerResults___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _didLoadMediaFromPhotoPickerWithAssetUUID:v8 succeeded:a2 error:v7];
}

- (void)_presentPhotoPicker
{
  id v3 = objc_alloc(MEMORY[0x1E4F39930]);
  id v4 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v28 = (id)[v3 initWithPhotoLibrary:v4];

  id v5 = [MEMORY[0x1E4F39938] imagesFilter];
  [v28 setFilter:v5];

  [v28 setDisabledCapabilities:18];
  id v6 = [(PUWallpaperPosterEditorController *)self environment];
  LODWORD(v4) = objc_msgSend(v6, "px_isCallServices");

  if (v4) {
    uint64_t v7 = 268;
  }
  else {
    uint64_t v7 = 260;
  }
  [v28 _setDisabledPrivateCapabilities:v7];
  id v8 = [(PUWallpaperPosterEditorController *)self environment];
  uint64_t v9 = objc_msgSend(v8, "pu_posterDescriptor");

  id v10 = [(PUWallpaperPosterEditorController *)self environment];
  int v11 = objc_msgSend(v10, "px_isCallServices");

  uint64_t v12 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v13 = v12;
  if (v11)
  {
    id v14 = [v12 userInfo];
    id v15 = [v14 objectForKeyedSubscript:@"preferPhotosSuggestionsForDeviceOwner"];
    int v16 = [v15 BOOLValue];

    uint64_t v17 = (void *)MEMORY[0x1E4F399C0];
    if (v16)
    {
      uint64_t v18 = [MEMORY[0x1E4F399C0] deviceOwnerSuggestionGroup];
      goto LABEL_17;
    }
  }
  else
  {
    if (v12)
    {
    }
    else if ([v9 descriptorType] == 103)
    {
      uint64_t v18 = [MEMORY[0x1E4F399C0] portraitWallpaperSuggestionGroup];
      goto LABEL_17;
    }
    id v19 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
    if (!v19 && [v9 descriptorType] == 104
      || ([(PUWallpaperPosterEditorController *)self editViewModel],
          id v20 = objc_claimAutoreleasedReturnValue(),
          int v21 = [v20 settlingEffectEnabled],
          v20,
          v19,
          v21))
    {
      uint64_t v18 = [MEMORY[0x1E4F399C0] livePhotoWallpaperSuggestionGroup];
      goto LABEL_17;
    }
    uint64_t v17 = (void *)MEMORY[0x1E4F399C0];
  }
  uint64_t v18 = [v17 wallpaperSuggestionGroup];
LABEL_17:
  id v22 = (void *)v18;
  objc_msgSend(v28, "set_suggestionGroup:", v18);

  int v23 = [(PUWallpaperPosterEditorController *)self posterConfiguration];

  if (!v23) {
    [v28 _setAlwaysShowLoadingPlaceholder:1];
  }
  id v24 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];

  if (!v24)
  {
    BOOL v25 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v28];
    [v25 setDelegate:self];
    id v26 = [v25 presentationController];
    [v26 setDelegate:self];

    [(PUWallpaperPosterEditorController *)self setPhotoPickerViewController:v25];
  }
  BOOL v27 = [(PUWallpaperPosterEditorController *)self photoPickerViewController];
  [(PUWallpaperPosterEditorController *)self _presentPosterConfigurationViewController:v27];

  [(PUWallpaperPosterEditorController *)self _beginListeningForExtensionHostResignationNotification];
}

- (void)_updateProgressIndicator:(double)a3
{
  id v5 = [(PUWallpaperPosterEditorController *)self progressIndicator];
  [v5 currentProgress];
  double v7 = v6;

  if (v7 < a3)
  {
    id v8 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v8 setCurrentProgress:a3];
  }
}

- (void)_hideProgressIndicator
{
  id v3 = [(PUWallpaperPosterEditorController *)self progressIndicator];
  [(PUWallpaperPosterEditorController *)self setProgressIndicator:0];
  if ([v3 isShowingProgress])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    id v4[2] = __59__PUWallpaperPosterEditorController__hideProgressIndicator__block_invoke;
    v4[3] = &unk_1E5F2ED10;
    id v5 = v3;
    [v5 endShowingProgressImmediately:1 animated:1 withCompletionHandler:v4];
  }
}

uint64_t __59__PUWallpaperPosterEditorController__hideProgressIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_showProgressIndicator:(id)a3 determinate:(BOOL)a4
{
  BOOL v4 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  id v8 = [(PUWallpaperPosterEditorController *)self progressIndicator];

  if (!v8)
  {
    uint64_t v9 = [[PUProgressIndicatorView alloc] initWithStyle:0];
    [(PUWallpaperPosterEditorController *)self setProgressIndicator:v9];

    id v10 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v10 setLocalizedMessage:v6];

    int v11 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v11 setDeterminate:v4];

    uint64_t v12 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v12 setShowsBackground:1];

    id v13 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v14 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v14 beginShowingProgressImmediately:1 animated:1];

    id v15 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    [v7 addSubview:v15];

    BOOL v25 = (void *)MEMORY[0x1E4F28DC8];
    id v26 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    int v16 = [v26 centerXAnchor];
    uint64_t v17 = [v7 centerXAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    v27[0] = v18;
    id v19 = [(PUWallpaperPosterEditorController *)self progressIndicator];
    id v20 = [v19 centerYAnchor];
    int v21 = [v7 centerYAnchor];
    id v22 = [v20 constraintEqualToAnchor:v21];
    v27[1] = v22;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    v24 = id v23 = v6;
    [v25 activateConstraints:v24];

    id v6 = v23;
  }
}

- (void)_hideLoadingIndicator
{
  if ([(PUWallpaperPosterEditorController *)self isLoading])
  {
    [(PUWallpaperPosterEditorController *)self setIsLoading:0];
    id v3 = [(PUWallpaperPosterEditorController *)self loadingIndicator];
    BOOL v4 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

    if (v4) {
      double v5 = 0.0;
    }
    else {
      double v5 = 0.3;
    }
    id v6 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke;
    v15[3] = &unk_1E5F2ED10;
    id v16 = v3;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_2;
    v13[3] = &unk_1E5F2CEE8;
    id v14 = v16;
    id v7 = v16;
    [v6 animateWithDuration:v15 animations:v13 completion:v5];
    if ([(PUWallpaperPosterEditorController *)self hint] == 1) {
      [(PUWallpaperPosterEditorController *)self _displayNextHint];
    }
    id v8 = [(PUWallpaperPosterEditorController *)self editModel];
    [v8 performChanges:&__block_literal_global_415];

    uint64_t v9 = PLWallpaperGetLog();
    unint64_t v10 = [(PUWallpaperPosterEditorController *)self signpost];
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v11 = v10;
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_END, v11, "PUWallpaperPosterEditorController.Loading", "", v12, 2u);
      }
    }
  }
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopAnimating];
}

uint64_t __58__PUWallpaperPosterEditorController__hideLoadingIndicator__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:0 forReason:@"loading"];
}

- (void)_showLoadingIndicator
{
  id v26[2] = *MEMORY[0x1E4F143B8];
  if (![(PUWallpaperPosterEditorController *)self isLoading])
  {
    [(PUWallpaperPosterEditorController *)self setIsLoading:1];
    id v3 = [(PUWallpaperPosterEditorController *)self loadingIndicator];
    BOOL v4 = PLWallpaperGetLog();
    unint64_t v5 = [(PUWallpaperPosterEditorController *)self signpost];
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PUWallpaperPosterEditorController.Loading", "", buf, 2u);
      }
    }

    id v7 = [(PUWallpaperPosterEditorController *)self editModel];
    [v7 performChanges:&__block_literal_global_407];

    if (!v3)
    {
      id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
      [(PUWallpaperPosterEditorController *)self setLoadingIndicator:v3];
      [v3 setOverrideUserInterfaceStyle:2];
      [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v8 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
      [v8 addSubview:v3];
      uint64_t v9 = [(PUWallpaperPosterEditorController *)self hintLabel];

      if (!v9) {
        [(PUWallpaperPosterEditorController *)self setHint:1];
      }
      int v21 = (void *)MEMORY[0x1E4F28DC8];
      id v22 = [v3 centerXAnchor];
      unint64_t v10 = [v8 centerXAnchor];
      os_signpost_id_t v11 = [v22 constraintEqualToAnchor:v10];
      v26[0] = v11;
      uint64_t v12 = [v3 bottomAnchor];
      id v13 = [(PUWallpaperPosterEditorController *)self hintLabel];
      id v14 = [v13 topAnchor];
      id v15 = [v12 constraintEqualToAnchor:v14 constant:-8.0];
      v26[1] = v15;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      v17 = id v16 = v8;
      [v21 activateConstraints:v17];
    }
    [v3 startAnimating];
    if ([(PUWallpaperPosterEditorController *)self isPerformingInitialLoad]) {
      double v18 = 0.0;
    }
    else {
      double v18 = 0.3;
    }
    [v3 setAlpha:0.0];
    id v19 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke_2;
    v23[3] = &unk_1E5F2ED10;
    id v24 = v3;
    id v20 = v3;
    [v19 animateWithDuration:v23 animations:v18];
  }
}

uint64_t __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __58__PUWallpaperPosterEditorController__showLoadingIndicator__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIdleTimerDisabled:1 forReason:@"loading"];
}

- (void)_didDismissLoadingErrorAlert
{
  id v3 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

  if (!v3)
  {
    id v4 = [(PUWallpaperPosterEditorController *)self editor];
    objc_msgSend(v4, "pu_requestDismissalWithAction:", 0);
  }
}

- (void)_presentLoadingErrorAlertController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

  if (v5)
  {
    id v6 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];
    objc_msgSend(v6, "px_presentOverTopmostPresentedViewController:animated:completion:", v4, 1, 0);
  }
  else
  {
    id v6 = [(PUWallpaperPosterEditorController *)self editor];
    [v6 presentViewController:v4 animated:1 completion:0];
  }
}

- (void)_dismissPosterConfigurationViewControllerAndCancelEditor
{
  id v3 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

  if (!v3)
  {
    id v4 = PXAssertGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "Expected presentedPosterConfigurationViewController", v6, 2u);
    }
  }
  [(PUWallpaperPosterEditorController *)self setPresentedPosterConfigurationViewController:0];
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self editor];
  objc_msgSend(v5, "pu_requestDismissalWithAction:", 0);
}

- (void)_dismissPosterConfigurationViewControllerWithCompletion:(id)a3
{
  id v6 = (void (**)(void))a3;
  id v4 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

  if (v4)
  {
    [(PUWallpaperPosterEditorController *)self setPresentedPosterConfigurationViewController:0];
    unint64_t v5 = [(PUWallpaperPosterEditorController *)self editor];
    [v5 dismissViewControllerAnimated:1 completion:v6];
  }
  else if (v6)
  {
    v6[2]();
  }
}

- (void)_dismissPosterConfigurationViewController
{
}

- (void)_presentPosterConfigurationViewController:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self presentedPosterConfigurationViewController];

  if (v5)
  {
    id v6 = PXAssertGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id buf = 0;
      _os_log_error_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "should dismiss posterConfiguration ViewController before presenting another one", buf, 2u);
    }
  }
  id v7 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  [(PUWallpaperPosterEditorController *)self setOldPosterConfiguration:v7];

  [(PUWallpaperPosterEditorController *)self setPresentedPosterConfigurationViewController:v4];
  id v8 = [(PUWallpaperPosterEditorController *)self posterConfiguration];

  if (v8)
  {
    uint64_t v9 = [(PUWallpaperPosterEditorController *)self editor];
    [v9 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    unint64_t v10 = (void *)MEMORY[0x1E4FB1EC0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __79__PUWallpaperPosterEditorController__presentPosterConfigurationViewController___block_invoke;
    v11[3] = &unk_1E5F2ECC8;
    void v11[4] = self;
    id v12 = v4;
    [v10 _performWithoutDeferringTransitions:v11];
  }
}

void __79__PUWallpaperPosterEditorController__presentPosterConfigurationViewController___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) editor];
  [v2 presentViewController:*(void *)(a1 + 40) animated:0 completion:0];
}

- (void)_pickAssets
{
  id v3 = [(PUWallpaperPosterEditorController *)self environment];
  uint64_t v4 = objc_msgSend(v3, "pu_posterType");

  if (v4 == 2)
  {
    [(PUWallpaperPosterEditorController *)self _presentShuffleConfigurationEditor];
  }
  else if (v4 == 1)
  {
    [(PUWallpaperPosterEditorController *)self _presentPhotoPicker];
  }
}

- (id)_initialLayerStyleForSegmentationItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self environment];
  id v6 = objc_msgSend(v5, "pu_posterDescriptor");
  id v7 = [v6 styleCategory];

  if (v7) {
    [v4 suggestedStyleForCategory:v7];
  }
  else {
  id v8 = [v4 originalStyle];
  }

  return v8;
}

- (void)_presentLoadingError:(id)a3
{
  id v4 = a3;
  unint64_t v5 = PULocalizedString(@"PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_TITLE");
  id v6 = [v4 domain];
  if (![v6 isEqualToString:*MEMORY[0x1E4F289A0]])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v4 code];

  if (v7 != -1009)
  {
LABEL_5:
    id v8 = @"PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_MESSAGE";
    goto LABEL_6;
  }
  id v8 = @"PHOTOS_WALLPAPER_EDITOR_ASSET_LOADING_FAILED_MESSAGE_CONNECTION";
LABEL_6:
  uint64_t v9 = PULocalizedString(v8);
  unint64_t v10 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v9 preferredStyle:1];
  os_signpost_id_t v11 = (void *)MEMORY[0x1E4FB1410];
  id v12 = PXLocalizedString();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PUWallpaperPosterEditorController__presentLoadingError___block_invoke;
  v14[3] = &unk_1E5F2BF98;
  v14[4] = self;
  id v13 = [v11 actionWithTitle:v12 style:1 handler:v14];
  [v10 addAction:v13];

  [(PUWallpaperPosterEditorController *)self _presentLoadingErrorAlertController:v10];
}

uint64_t __58__PUWallpaperPosterEditorController__presentLoadingError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismissLoadingErrorAlert];
}

- (void)_presentLoadingError:(id)a3 forAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PUWallpaperPosterErrorDomain" code:-1 userInfo:0];
  }
  uint64_t v9 = v8;
  unint64_t v10 = [[PUEditingErrorPresentationController alloc] initWithError:v8 forAsset:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __67__PUWallpaperPosterEditorController__presentLoadingError_forAsset___block_invoke;
  v12[3] = &unk_1E5F2ED10;
  void v12[4] = self;
  os_signpost_id_t v11 = [(PUErrorPresentationController *)v10 alertControllerWithCompletion:v12];
  [(PUWallpaperPosterEditorController *)self _presentLoadingErrorAlertController:v11];
}

uint64_t __67__PUWallpaperPosterEditorController__presentLoadingError_forAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismissLoadingErrorAlert];
}

- (void)_fadeInViews
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke;
  aBlock[3] = &unk_1E5F2D8C0;
  void aBlock[4] = self;
  id v2 = (void (**)(double))_Block_copy(aBlock);
  v2[2](0.0);
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke_2;
  v5[3] = &unk_1E5F2EBA0;
  id v6 = v2;
  id v4 = v2;
  [v3 animateWithDuration:v5 animations:0.3];
}

void __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke(uint64_t a1, double a2)
{
  id v4 = [*(id *)(a1 + 32) backgroundView];
  [v4 setAlpha:a2];

  unint64_t v5 = [*(id *)(a1 + 32) foregroundView];
  [v5 setAlpha:a2];

  id v6 = [*(id *)(a1 + 32) floatingView];
  [v6 setAlpha:a2];
}

uint64_t __49__PUWallpaperPosterEditorController__fadeInViews__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(1.0);
}

- (void)_didFinishCreatingEditViewModel:(id)a3 forAsset:(id)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = a4;
  id v9 = a5;
  unint64_t v10 = [(PUWallpaperPosterEditorController *)self environment];

  if (!v10) {
    goto LABEL_17;
  }
  [(PUWallpaperPosterEditorController *)self setEditViewModel:v17];
  if (!v17)
  {
    if ([(PUWallpaperPosterEditorController *)self isCancellingMediaLoading])
    {
      if (!v9) {
        goto LABEL_12;
      }
      os_signpost_id_t v11 = [v9 domain];
      if ([v11 isEqualToString:*MEMORY[0x1E4F281F8]])
      {
        uint64_t v12 = [v9 code];

        if (v12 == 3072) {
          goto LABEL_12;
        }
      }
      else
      {
      }
    }
    if (v8) {
      [(PUWallpaperPosterEditorController *)self _presentLoadingError:v9 forAsset:v8];
    }
    else {
      [(PUWallpaperPosterEditorController *)self _presentLoadingError:v9];
    }
  }
LABEL_12:
  [(PUWallpaperPosterEditorController *)self _hideLoadingIndicator];
  if ([(PUWallpaperPosterEditorController *)self fadeInInitialLoad]
    && [(PUWallpaperPosterEditorController *)self isPerformingInitialLoad])
  {
    [(PUWallpaperPosterEditorController *)self _fadeInViews];
  }
  [(PUWallpaperPosterEditorController *)self setPerformingInitialLoad:0];
  id v13 = [(PUWallpaperPosterEditorController *)self mediaLoadedCompletionHandler];

  if (v13)
  {
    id v14 = [(PUWallpaperPosterEditorController *)self mediaLoadedCompletionHandler];
    id v15 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
    id v16 = [v15 assetUUID];
    ((void (**)(void, BOOL, void *, id))v14)[2](v14, v17 != 0, v16, v9);
  }
LABEL_17:
}

- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3 layerStack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUWallpaperPosterEditorController *)self editViewModel];
  if (v6 && v8)
  {

    if (v7)
    {
      id v9 = [(PUWallpaperPosterEditorController *)self editViewModel];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __96__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem_layerStack___block_invoke;
      v10[3] = &unk_1E5F26818;
      id v11 = v6;
      id v12 = v7;
      [v9 performChanges:v10];
    }
  }
  else
  {
  }
}

uint64_t __96__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem_layerStack___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateSettlingEffectWithSegmentationItem:*(void *)(a1 + 32) layerStack:*(void *)(a1 + 40)];
}

- (void)_loadSettlingEffectLayerStackForSegmentationItem:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x1E4F8A320];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithSegmentationItem:v8];

  [v9 setResponseQueue:MEMORY[0x1E4F14428]];
  unint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:1];
  [v9 setPriority:v10];

  [v9 setLayerStackMode:7];
  [v9 setSettlingEffectEnabled:0];
  id v11 = [(PUWallpaperPosterEditorController *)self segmentationLoadingGroup];
  dispatch_group_enter(v11);
  [MEMORY[0x1E4F7A648] begin];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke;
  void v18[3] = &unk_1E5F29308;
  id v19 = v6;
  id v12 = v6;
  [v9 submit:v18];
  [(PUWallpaperPosterEditorController *)self setSettlingEffectRequest:v9];
  id v13 = (void *)MEMORY[0x1E4F7A648];
  id v14 = [(PUWallpaperPosterEditorController *)self queue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke_382;
  v16[3] = &unk_1E5F2ED10;
  id v17 = v11;
  id v15 = v11;
  [v13 commitAndNotifyOnQueue:v14 withBlock:v16];
}

void __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  id v3 = [a2 result:&v10];
  id v4 = v10;
  unint64_t v5 = PLWallpaperGetLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v3 statistics];
      *(_DWORD *)id buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Settling effect layer stack render stats: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v3 layerStack];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Settling effect layer stack render failed: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __97__PUWallpaperPosterEditorController__loadSettlingEffectLayerStackForSegmentationItem_completion___block_invoke_382(uint64_t a1)
{
}

- (void)_sendSettlingEffectGatingAnalyticsWithSegmentationItem:(id)a3
{
  int v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v10 = 0u;
  id v3 = (void *)MEMORY[0x1E4F8A378];
  id v4 = [a3 scores];
  [v3 settlingEffectGatingStatisticsFromScores:v4];

  long long v6 = v10;
  long long v7 = v11;
  long long v8 = v12;
  LODWORD(v9) = v13;
  unint64_t v5 = PFPosterSettlingEffectGatingStatisticsAnalyticsPayload();
  objc_msgSend(MEMORY[0x1E4F56658], "sendEvent:withPayload:", *MEMORY[0x1E4F8D240], v5, v6, v7, v8, v9);
}

- (void)_handleSettlingEffectLoadedWithSegmentationItem:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(PUWallpaperPosterEditorController *)self editViewModel];

  if (v5)
  {
    if ([v4 isSettlingEffectAvailable])
    {
      objc_initWeak(location, self);
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      long long v10 = __85__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem___block_invoke;
      long long v11 = &unk_1E5F267F0;
      objc_copyWeak(&v13, location);
      id v12 = v4;
      [(PUWallpaperPosterEditorController *)self _loadSettlingEffectLayerStackForSegmentationItem:v12 completion:&v8];

      objc_destroyWeak(&v13);
      objc_destroyWeak(location);
    }
    if (objc_msgSend(v4, "settlingEffectFailedAnyGating", v8, v9, v10, v11))
    {
      long long v6 = PLWallpaperGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        long long v7 = [v4 settlingEffectGatingDiagnostics];
        LODWORD(location[0]) = 138412290;
        *(id *)((char *)location + 4) = v7;
        _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "Settling effect diagnostics: %@", (uint8_t *)location, 0xCu);
      }
      [(PUWallpaperPosterEditorController *)self _presentSettlingEffectDebugView:v4];
    }
  }
}

void __85__PUWallpaperPosterEditorController__handleSettlingEffectLoadedWithSegmentationItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _handleSettlingEffectLoadedWithSegmentationItem:*(void *)(a1 + 32) layerStack:v5];
  }
  else
  {
    uint64_t v8 = PLWallpaperGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Settling effect layer stack render error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_renderInitialLayerStack:(id)a3 style:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (objc_class *)MEMORY[0x1E4F8A318];
  id v11 = a3;
  id v12 = (void *)[[v10 alloc] initWithSegmentationItem:v11];
  [v12 setResponseQueue:MEMORY[0x1E4F14428]];
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [v12 setPriority:v13];

  uint64_t v14 = [v11 isSettlingEffectAvailable];
  [v12 setSettlingEffectEnabled:v14];
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration]) {
    uint64_t v15 = 136;
  }
  else {
    uint64_t v15 = 8;
  }
  if ([v12 isSettlingEffectEnabled]) {
    uint64_t v16 = v15 | 0x40;
  }
  else {
    uint64_t v16 = v15;
  }
  [v12 setLayerStackOptions:v16];
  if (v8)
  {
    id v17 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v8];
    [v12 setStyle:v17];

    double v18 = [v8 kind];
    char v19 = [v18 isEqualToString:*MEMORY[0x1E4F8D020]];

    if ((v19 & 1) == 0) {
      [v12 setSettlingEffectEnabled:0];
    }
  }
  id v20 = [(PUWallpaperPosterEditorController *)self segmentationLoadingGroup];
  dispatch_group_enter(v20);
  [MEMORY[0x1E4F7A648] begin];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke;
  void v27[3] = &unk_1E5F29308;
  id v28 = v9;
  id v21 = v9;
  [v12 submit:v27];
  [(PUWallpaperPosterEditorController *)self setLayerStackRequest:v12];
  id v22 = (void *)MEMORY[0x1E4F7A648];
  id v23 = [(PUWallpaperPosterEditorController *)self queue];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke_378;
  v25[3] = &unk_1E5F2ED10;
  id v26 = v20;
  id v24 = v20;
  [v22 commitAndNotifyOnQueue:v23 withBlock:v25];
}

void __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = 0;
  id v3 = [a2 result:&v10];
  id v4 = v10;
  id v5 = PLWallpaperGetLog();
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v7 = [v3 statistics];
      *(_DWORD *)id buf = 138543362;
      id v12 = v7;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "Initial layer stack render stats: %{public}@", buf, 0xCu);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v3 compoundLayerStack];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v12 = v4;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Initial layer stack render failed: %{public}@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __79__PUWallpaperPosterEditorController__renderInitialLayerStack_style_completion___block_invoke_378(uint64_t a1)
{
}

- (void)_loadEditViewModelWithSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v12)
  {
    id v12 = [(PUWallpaperPosterEditorController *)self _initialLayerStyleForSegmentationItem:v10];
  }
  uint64_t v14 = [(PUWallpaperPosterEditorController *)self _sanitizeCompoundLayerStack:v11 forSegmentationItem:v10];

  uint64_t v15 = objc_opt_class();
  uint64_t v16 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v17 = [v15 availableStylesForItem:v10 posterConfiguration:v16];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__PUWallpaperPosterEditorController__loadEditViewModelWithSegmentationItem_compoundLayerStack_style_completion___block_invoke;
  aBlock[3] = &unk_1E5F267C8;
  id v18 = v10;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  BOOL v27 = self;
  id v28 = v17;
  id v29 = v13;
  id v20 = v13;
  id v21 = v17;
  id v22 = _Block_copy(aBlock);
  id v23 = v22;
  if (v14) {
    (*((void (**)(void *, void *, void))v22 + 2))(v22, v14, 0);
  }
  else {
    [(PUWallpaperPosterEditorController *)self _renderInitialLayerStack:v18 style:v19 completion:v22];
  }
}

void __112__PUWallpaperPosterEditorController__loadEditViewModelWithSegmentationItem_compoundLayerStack_style_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    id v3 = [PUParallaxLayerStackViewModel alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) environment];
    long long v7 = -[PUParallaxLayerStackViewModel initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:](v3, "initWithSegmentationItem:initialStyle:compoundLayerStack:deviceOrientation:", v4, v5, v9, objc_msgSend(v6, "pu_deviceOrientation"));

    uint64_t v8 = [[PUWallpaperPosterEditViewModel alloc] initWithInitialLayerStackViewModel:v7 availableStyles:*(void *)(a1 + 56)];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)_handleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 style:(id)a5 forAsset:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(PUWallpaperPosterEditorController *)self environment];

  if (v17)
  {
    if (v12)
    {
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __101__PUWallpaperPosterEditorController__handleSegmentationItem_compoundLayerStack_style_forAsset_error___block_invoke;
      void v18[3] = &unk_1E5F267A0;
      objc_copyWeak(&v20, &location);
      id v19 = v15;
      [(PUWallpaperPosterEditorController *)self _loadEditViewModelWithSegmentationItem:v12 compoundLayerStack:v13 style:v14 completion:v18];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    else
    {
      [(PUWallpaperPosterEditorController *)self _didFinishCreatingEditViewModel:0 forAsset:v15 error:v16];
    }
  }
}

void __101__PUWallpaperPosterEditorController__handleSegmentationItem_compoundLayerStack_style_forAsset_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _didFinishCreatingEditViewModel:v7 forAsset:*(void *)(a1 + 32) error:v6];
}

- (id)_sanitizeCompoundLayerStack:(id)a3 forSegmentationItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    if (![v6 isSettlingEffectAvailable]
      || ([v7 settlingEffectNormalizedBounds], CGRectIsEmpty(v15)))
    {
      uint64_t v8 = [v5 compoundLayerStackByUpdatingSettlingEffectEnabled:0];

      id v5 = (id)v8;
    }
    id v9 = [v7 originalLayout];
    if ([v9 supportsBothOrientations])
    {
      uint64_t v10 = [v5 portraitLayerStack];
      if (v10)
      {
        id v11 = (void *)v10;
        id v12 = [v5 landscapeLayerStack];

        if (v12) {
          goto LABEL_13;
        }
      }
      else
      {
      }
      id v9 = v5;
      id v5 = 0;
    }
  }
LABEL_13:

  return v5;
}

- (void)_handleShuffleSegmentationItem:(id)a3 compoundLayerStack:(id)a4 editConfiguration:(id)a5 forPosterMedia:(id)a6 error:(id)a7
{
  id v24 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(PUWallpaperPosterEditorController *)self environment];

  if (v16)
  {
    id v17 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];

    if (v17 == v14)
    {
      if (v13)
      {
        id v18 = (void *)[v13 copy];
        id v19 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
        [v19 setEditConfiguration:v18];
      }
      id v20 = [v13 style];
      if (!v20)
      {
        id v21 = [(PUWallpaperPosterEditorController *)self editViewModel];
        id v22 = [v21 currentLayerStackViewModel];
        id v23 = [v22 style];
        id v20 = [v23 bakedStyle];
      }
      [(PUWallpaperPosterEditorController *)self _handleSegmentationItem:v24 compoundLayerStack:v12 style:v20 forAsset:0 error:v15];
      if (!v24) {
        [(PUWallpaperPosterEditorController *)self setCurrentPosterMedia:0];
      }
    }
  }
}

- (void)_loadAssetWithUUID:(id)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(PUWallpaperPosterEditorController *)self shouldLoadSettlingEffectSynchronously];
  id v6 = PLWallpaperGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = @"asynchronous";
    if (v5) {
      id v7 = @"synchronous";
    }
    *(_DWORD *)id buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_INFO, "Segmenting asset, %@ settling effect: %{public}@", buf, 0x16u);
  }

  objc_initWeak(&location, self);
  uint64_t v8 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v9 = [v8 librarySpecificFetchOptions];

  [v9 setIncludeGuestAssets:1];
  uint64_t v10 = (void *)MEMORY[0x1E4F38EB8];
  v41[0] = v4;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  id v12 = [v10 fetchAssetsWithUUIDs:v11 options:v9];
  id v13 = [v12 firstObject];

  if (v13)
  {
    id v14 = [(PUWallpaperPosterEditorController *)self segmentationLoadingGroup];
    dispatch_group_enter(v14);
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v13];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F8A390]) initWithParallaxAsset:v15];
    if ([(PUPosterEditingEnvironment *)self->_environment px_isCallServices])
    {
      [(PUPosterEditingEnvironment *)self->_environment px_titleBoundsForLayout:0];
      id v17 = objc_msgSend(MEMORY[0x1E4F8CE48], "genericCallServicesConfigurationWithTitleBounds:");
      [v16 setLayoutConfiguration:v17];

      [v16 setDisableSettlingEffect:1];
      [v16 setRole:1];
      [v16 setDisableCache:1];
    }
    *(void *)id buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    char v40 = 0;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v37[3] = 0;
    [(PUWallpaperPosterEditorController *)self setSegmentationLoading:v16];
    uint64_t v18 = MEMORY[0x1E4F14428];
    id v19 = MEMORY[0x1E4F14428];
    [v16 setLoadingHandlerQueue:v18];

    if (!v5)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke;
      v32[3] = &unk_1E5F26750;
      double v34 = buf;
      objc_copyWeak(&v36, &location);
      id v33 = v13;
      int v35 = v37;
      [v16 setLoadingHandler:v32];

      objc_destroyWeak(&v36);
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_368;
    v25[3] = &unk_1E5F26778;
    BOOL v31 = v5;
    v30[1] = (id)a2;
    id v28 = buf;
    void v25[4] = self;
    objc_copyWeak(v30, &location);
    id v26 = v13;
    id v29 = v37;
    id v20 = v14;
    BOOL v27 = v20;
    [v16 loadSegmentationItemWithCompletion:v25];

    objc_destroyWeak(v30);
    _Block_object_dispose(v37, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v21 = PLWallpaperGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch asset: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_369;
    block[3] = &unk_1E5F2E530;
    objc_copyWeak(&v24, &location);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v24);
  }

  objc_destroyWeak(&location);
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke(void *a1, void *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ((~a3 & 0x84) == 0 && *(unsigned char *)(*(void *)(a1[5] + 8) + 24) == 0)
  {
    BOOL v5 = (id *)(a1 + 7);
    id v6 = a2;
    id WeakRetained = objc_loadWeakRetained(v5);
    [WeakRetained _handleSegmentationItem:v6 compoundLayerStack:0 style:0 forAsset:a1[4] error:0];

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v8 = [v6 settlingEffectStatus];

    *(void *)(*(void *)(a1[6] + 8) + 24) = v8;
    id v9 = PLWallpaperGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24);
      int v13 = 134217984;
      uint64_t v14 = v10;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Partial item setting effect status: %ld", (uint8_t *)&v13, 0xCu);
    }

    BOOL v11 = (*(void *)(*(void *)(a1[6] + 8) + 24) & 0xFFFFFFFFFFFFFFFDLL) == 0;
    id v12 = objc_loadWeakRetained(v5);
    [v12 setLoadingSettlingEffect:v11];
  }
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_368(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_2;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  dispatch_async(MEMORY[0x1E4F14428], block);
  if ([*(id *)(a1 + 32) _attemptedSettlingEffect]) {
    [*(id *)(a1 + 32) _sendSettlingEffectGatingAnalyticsWithSegmentationItem:v5];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _handleSegmentationItem:v5 compoundLayerStack:0 style:0 forAsset:*(void *)(a1 + 40) error:0];
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (v8 != [v5 settlingEffectStatus])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _handleSettlingEffectLoadedWithSegmentationItem:v5];
    goto LABEL_7;
  }
LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  [v9 setSegmentationLoading:0];

  objc_destroyWeak(&v11);
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_369(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSegmentationItem:0 compoundLayerStack:0 style:0 forAsset:0 error:0];
}

void __56__PUWallpaperPosterEditorController__loadAssetWithUUID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLoadingSettlingEffect:0];
}

- (void)_reloadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = (void *)MEMORY[0x1E4F38EB8];
  v31[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  uint64_t v10 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  id v11 = [v10 librarySpecificFetchOptions];
  id v12 = [v8 fetchAssetsWithUUIDs:v9 options:v11];
  int v13 = [v12 firstObject];

  if (v13)
  {
    uint64_t v14 = [(PUWallpaperPosterEditorController *)self segmentationLoadingGroup];
    dispatch_group_enter(v14);
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F39358]) initWithPhotoAsset:v13];
    id v16 = (void *)MEMORY[0x1E4F8A390];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke;
    v23[3] = &unk_1E5F26728;
    id v17 = v14;
    id v24 = v17;
    objc_copyWeak(&v27, &location);
    id v25 = v6;
    id v26 = self;
    uint64_t v18 = [v16 reloadSegmentationItemFromWallpaperURL:v7 asset:v15 completion:v23];
    [(PUWallpaperPosterEditorController *)self setSegmentationLoading:v18];

    objc_destroyWeak(&v27);
  }
  else
  {
    id v19 = PLWallpaperGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138543362;
      id v30 = v6;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_ERROR, "Failed to fetch cold-start asset: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_360;
    block[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v22, &location);
    id v21 = 0;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v22);
  }

  objc_destroyWeak(&location);
}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setSegmentationLoading:0];

  uint64_t v8 = PLWallpaperGetLog();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138543362;
      uint64_t v22 = v10;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_INFO, "Successfully reloaded cold-start segmentation item: %{public}@", buf, 0xCu);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_357;
    block[3] = &unk_1E5F2E4E8;
    id v11 = &v20;
    objc_copyWeak(&v20, (id *)(a1 + 56));
    id v12 = &v19;
    id v19 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138543618;
      uint64_t v22 = v13;
      __int16 v23 = 2114;
      id v24 = v6;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Failed to reload cold-start segmentation item: %{public}@, error: %{public}@", buf, 0x16u);
    }

    uint64_t v14 = [*(id *)(a1 + 48) queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_358;
    v15[3] = &unk_1E5F2E4E8;
    id v11 = &v17;
    objc_copyWeak(&v17, (id *)(a1 + 56));
    id v12 = &v16;
    id v16 = *(id *)(a1 + 40);
    dispatch_async(v14, v15);
  }
  objc_destroyWeak(v11);
}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_360(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSegmentationItem:0 compoundLayerStack:0 style:0 forAsset:0 error:*(void *)(a1 + 32)];
}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_357(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleSegmentationItem:*(void *)(a1 + 32) compoundLayerStack:0 style:0 forAsset:0 error:0];
}

void __71__PUWallpaperPosterEditorController__reloadAssetUUID_fromWallpaperURL___block_invoke_358(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _loadAssetWithUUID:*(void *)(a1 + 32)];
}

- (BOOL)_tryLoadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v21 = 0;
  uint64_t v8 = [MEMORY[0x1E4F8A390] loadCompoundLayerStackFromWallpaperURL:v7 options:66 error:&v21];
  id v9 = v21;
  if (v8)
  {
    uint64_t v10 = [(PUWallpaperPosterEditorController *)self currentEditConfiguration];
    id v11 = [v10 style];

    if (!v11)
    {
      id v20 = 0;
      id v11 = [MEMORY[0x1E4F8A390] loadStyleFromWallpaperURL:v7 error:&v20];
      id v12 = v20;
      if (!v11)
      {
        uint64_t v13 = PLWallpaperGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id buf = 138543618;
          id v23 = v6;
          __int16 v24 = 2114;
          id v25 = v12;
          _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "Failed to load style for asset: %{public}@, error: %{public}@", buf, 0x16u);
        }
      }
    }
    id v19 = v9;
    uint64_t v14 = [MEMORY[0x1E4F8A390] loadSegmentationItemFromWallpaperURL:v7 error:&v19];
    id v15 = v19;

    BOOL v16 = v14 != 0;
    if (v14)
    {
      [(PUWallpaperPosterEditorController *)self _handleSegmentationItem:v14 compoundLayerStack:v8 style:v11 forAsset:0 error:v15];
    }
    else
    {
      id v17 = PLWallpaperGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138543618;
        id v23 = v6;
        __int16 v24 = 2114;
        id v25 = v15;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_ERROR, "Failed to load segmentation item for asset: %{public}@, error: %{public}@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v11 = PLWallpaperGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      id v25 = v9;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_INFO, "Failed to load layer stack for asset: %{public}@, error: %{public}@", buf, 0x16u);
    }
    BOOL v16 = 0;
    id v15 = v9;
  }

  return v16;
}

- (void)_loadAssetUUID:(id)a3 fromWallpaperURL:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PLWallpaperGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    id v20 = v7;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_INFO, "Attempt to load wallpaper for editing from poster url: %{public}@", buf, 0xCu);
  }

  if (![(PUWallpaperPosterEditorController *)self _tryLoadAssetUUID:v6 fromWallpaperURL:v7])
  {
    id v9 = [(PUWallpaperPosterEditorController *)self environment];
    char v10 = objc_msgSend(v9, "px_isCallServices");

    if (v10) {
      goto LABEL_6;
    }
    uint64_t v11 = PUWallpaperCacheDirectoryURL();
    id v12 = [v7 lastPathComponent];
    uint64_t v13 = [(id)v11 URLByAppendingPathComponent:v12];

    LOBYTE(v11) = [(PUWallpaperPosterEditorController *)self _tryLoadAssetUUID:v6 fromWallpaperURL:v13];
    if ((v11 & 1) == 0)
    {
LABEL_6:
      [(PUWallpaperPosterEditorController *)self _showLoadingIndicator];
      objc_initWeak((id *)buf, self);
      uint64_t v14 = [(PUWallpaperPosterEditorController *)self queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __69__PUWallpaperPosterEditorController__loadAssetUUID_fromWallpaperURL___block_invoke;
      block[3] = &unk_1E5F2D758;
      objc_copyWeak(&v18, (id *)buf);
      id v16 = v6;
      id v17 = v7;
      dispatch_async(v14, block);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __69__PUWallpaperPosterEditorController__loadAssetUUID_fromWallpaperURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _reloadAssetUUID:*(void *)(a1 + 32) fromWallpaperURL:*(void *)(a1 + 40)];
}

- (void)_loadContentForCurrentPosterMedia
{
  id v3 = [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  id v4 = [(PUWallpaperPosterEditorController *)self environment];
  id v5 = objc_msgSend(v4, "pu_sourceAssetDirectory");

  id v6 = [v3 assetUUID];
  [(PUWallpaperPosterEditorController *)self setLoadingSettlingEffect:0];
  if (v3)
  {
    if ([(PUWallpaperPosterEditorController *)self _isShuffle])
    {
      objc_initWeak(&location, self);
      id from = 0;
      p_id from = &from;
      uint64_t v32 = 0x2020000000;
      char v33 = 0;
      id v7 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      id v26[2] = __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke;
      void v26[3] = &unk_1E5F26700;
      objc_copyWeak(&v29, &location);
      id v27 = v3;
      id v28 = &from;
      [v7 requestResourceForPosterMedia:v27 completion:v26];

      if (!*((unsigned char *)p_from + 24)
        && ![(PUWallpaperPosterEditorController *)self isPerformingInitialLoad])
      {
        [(PUWallpaperPosterEditorController *)self _showLoadingIndicator];
      }
      int64_t v8 = [(PUWallpaperPosterEditorController *)self shuffleAssetIndex];
      id v9 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
      char v10 = [v9 media];
      unint64_t v11 = [v10 count];

      id v12 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
      uint64_t v13 = [v12 media];
      uint64_t v14 = [v13 objectAtIndexedSubscript:(v8 + 1) % v11];

      id v15 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
      [v15 preloadResourceForPosterMedia:v14];

      objc_destroyWeak(&v29);
      _Block_object_dispose(&from, 8);
      p_id location = &location;
      goto LABEL_14;
    }
    if (!v5) {
      goto LABEL_12;
    }
    id v17 = [v3 subpath];
    id v18 = [v5 URLByAppendingPathComponent:v17];

    id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v20 = [v18 path];
    int v21 = [v19 fileExistsAtPath:v20];

    if (v21) {
      [(PUWallpaperPosterEditorController *)self _loadAssetUUID:v6 fromWallpaperURL:v18];
    }

    if (v21 != 1)
    {
LABEL_12:
      if (v6)
      {
        [(PUWallpaperPosterEditorController *)self _showLoadingIndicator];
        objc_initWeak(&from, self);
        uint64_t v22 = [(PUWallpaperPosterEditorController *)self queue];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke_2;
        v23[3] = &unk_1E5F2E4E8;
        objc_copyWeak(&v25, &from);
        id v24 = v6;
        dispatch_async(v22, v23);

        objc_destroyWeak(&v25);
        p_id location = &from;
LABEL_14:
        objc_destroyWeak(p_location);
      }
    }
  }
  else
  {
    [(PUWallpaperPosterEditorController *)self setEditViewModel:0];
  }
}

void __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = (id *)(a1 + 48);
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _handleShuffleSegmentationItem:v13 compoundLayerStack:v12 editConfiguration:v11 forPosterMedia:*(void *)(a1 + 32) error:v10];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

void __70__PUWallpaperPosterEditorController__loadContentForCurrentPosterMedia__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _loadAssetWithUUID:*(void *)(a1 + 32)];
}

- (void)setIsCancellingMediaLoading:(BOOL)a3
{
  if (self->_isCancellingMediaLoading != a3)
  {
    self->_isCancellingMediaLoading = a3;
    if (a3)
    {
      id v4 = [(PUWallpaperPosterEditorController *)self segmentationLoading];
      [v4 cancel];

      id v5 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
      [v5 stopPreloadingResources];
    }
  }
}

- (void)setCurrentPosterMedia:(id)a3
{
  id v10 = (PFPosterMedia *)a3;
  p_currentPosterMedia = &self->_currentPosterMedia;
  id v6 = self->_currentPosterMedia;
  if (v6 == v10)
  {
  }
  else
  {
    char v7 = [(PFPosterMedia *)v10 isEqual:v6];

    int64_t v8 = v10;
    if (v7) {
      goto LABEL_9;
    }
    id v9 = *p_currentPosterMedia;
    objc_storeStrong((id *)&self->_currentPosterMedia, a3);
    if (!v9 || !*p_currentPosterMedia) {
      [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
    }
    [(PUWallpaperPosterEditorController *)self _loadContentForCurrentPosterMedia];
  }
  int64_t v8 = v10;
LABEL_9:
}

- (void)_handleUpdatedConfiguration:(id)a3 segmentationItem:(id)a4 compoundLayerStack:(id)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v14 = a4;
  id v12 = a3;
  [(PUWallpaperPosterEditorController *)self _hideLoadingIndicator];
  id v13 = (void *)[v12 copy];

  [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v13];
  [(PUWallpaperPosterEditorController *)self _handleSegmentationItem:v14 compoundLayerStack:v11 style:0 forAsset:0 error:v10];
}

- (void)_loadSourcePosterConfiguration
{
  id v4 = [(PUWallpaperPosterEditorController *)self environment];
  id v5 = objc_msgSend(v4, "pu_sourcePosterConfiguration");

  if (([v5 options] & 8) != 0)
  {
    [(PUWallpaperPosterEditorController *)self _showLoadingIndicator];
    id v11 = [PUWallpaperConfigurationUpdater alloc];
    id v12 = [(PUWallpaperPosterEditorController *)self photoLibrary];
    id v13 = [(PUWallpaperPosterEditorController *)self environment];
    id v14 = objc_msgSend(v13, "pu_sourcePosterConfiguration");
    id v15 = [(PUWallpaperPosterEditorController *)self environment];
    id v16 = objc_msgSend(v15, "pu_targetAssetDirectory");
    id v17 = [(PUWallpaperPosterEditorController *)self environment];
    id v18 = objc_msgSend(v17, "pu_overrideConfiguration");
    id v10 = [(PUWallpaperConfigurationUpdater *)v11 initWithPhotoLibrary:v12 sourceConfiguration:v14 targetAssetDirectory:v16 overrideConfiguration:v18];

    objc_initWeak(&location, self);
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __67__PUWallpaperPosterEditorController__loadSourcePosterConfiguration__block_invoke;
    id v24 = &unk_1E5F266D8;
    objc_copyWeak(&v25, &location);
    [(PUWallpaperConfigurationUpdater *)v10 attemptUpdateWithCompletionBlock:&v21];
    -[PUWallpaperPosterEditorController setConfigurationUpdater:](self, "setConfigurationUpdater:", v10, v21, v22, v23, v24);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    if (!v5)
    {
      id v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:712 description:@"Missing source poster configuration"];
    }
    if ([(PUWallpaperPosterEditorController *)self _isShuffle])
    {
      id v6 = [v5 shuffleConfiguration];

      if (!v6)
      {
        id v20 = [MEMORY[0x1E4F28B00] currentHandler];
        [v20 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:714 description:@"Missing source poster shuffle configuration"];
      }
      char v7 = [v5 media];
      int64_t v8 = [(PUWallpaperPosterEditorController *)self environment];
      uint64_t v9 = objc_msgSend(v8, "px_significantEventsCounter");

      self->_shuffleAssetIndex = +[PUPosterUtilities mediaIndexWithSeed:mediaCount:](PUPosterUtilities, "mediaIndexWithSeed:mediaCount:", v9, [v7 count]);
    }
    id v10 = (PUWallpaperConfigurationUpdater *)[v5 copy];
    [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v10];
  }
}

void __67__PUWallpaperPosterEditorController__loadSourcePosterConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v9 = (id *)(a1 + 32);
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained(v9);
  [WeakRetained _handleUpdatedConfiguration:v13 segmentationItem:v11 compoundLayerStack:v12 error:v10];
}

- (void)_loadPosterDescriptor
{
  id v4 = [(PUWallpaperPosterEditorController *)self environment];
  objc_msgSend(v4, "pu_posterDescriptor");
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = v12;
  if (!v12)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PUWallpaperPosterEditorController.m", 637, @"Invalid parameter not satisfying: %@", @"posterDescriptor" object file lineNumber description];

    id v5 = 0;
  }
  if (([v5 isBlankTemplate] & 1) != 0 || objc_msgSend(v12, "descriptorType") == 2)
  {
    [(PUWallpaperPosterEditorController *)self _pickAssets];
  }
  else
  {
    id v6 = [(id)objc_opt_class() posterConfigurationFromPosterDescriptor:v12];
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:644 description:@"Missing poster configuration"];
    }
    if ([(PUWallpaperPosterEditorController *)self _isShuffle])
    {
      char v7 = [v6 shuffleConfiguration];

      if (!v7)
      {
        id v11 = [MEMORY[0x1E4F28B00] currentHandler];
        [v11 handleFailureInMethod:a2 object:self file:@"PUWallpaperPosterEditorController.m" lineNumber:646 description:@"Missing poster shuffle configuration"];
      }
    }
    int64_t v8 = [v12 media];
    [v6 setMedia:v8];

    [(PUWallpaperPosterEditorController *)self setPosterConfiguration:v6];
  }
}

- (void)_beginLoadingShuffleResources
{
  [(PUWallpaperPosterEditorController *)self _createShuffleResourceManager];
  id v5 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v3 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
  id v4 = [v5 media];
  [v3 startPreloadingResourcesForPosterMedia:v4];

  if (![(PUWallpaperPosterEditorController *)self isAnySmartAlbumAvailable]) {
    [(PUWallpaperPosterEditorController *)self _updateSmartAlbumAvailability];
  }
}

- (void)_createShuffleResourceManager
{
  id v3 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
  [v3 stopPreloadingResources];

  id v29 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
  id v4 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v5 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
  id v6 = [v5 style];

  if (v6)
  {
    char v7 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    uint64_t v8 = [v7 style];
  }
  else
  {
    uint64_t v9 = [v4 editConfiguration];
    char v7 = [v9 style];

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  id v28 = (void *)v8;

  id v10 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v11 = [v10 editConfiguration];
  uint64_t v12 = [v11 style];

  id v27 = (void *)v12;
  if (v12)
  {
    id v13 = [MEMORY[0x1E4F8A340] styleWithBakedStyle:v12];
  }
  else
  {
    id v13 = 0;
  }
  int64_t v14 = [(PUWallpaperPosterEditorController *)self _shuffleType];
  id v15 = [PUWallpaperShuffleResourceManager alloc];
  [v4 media];
  v17 = id v16 = v4;
  id v18 = [(PUWallpaperPosterEditorController *)self environment];
  id v19 = objc_msgSend(v18, "pu_sourceAssetDirectory");
  id v20 = [(PUWallpaperPosterEditorController *)self photoLibrary];
  uint64_t v21 = v28;
  uint64_t v22 = [(PUWallpaperShuffleResourceManager *)v15 initWithPosterMedia:v17 style:v28 assetDirectory:v19 persistedStyle:v13 photoLibrary:v20 shuffleType:v14];
  [(PUWallpaperPosterEditorController *)self setShuffleResourceManager:v22];

  if (v14 != 1)
  {
    if (v29)
    {
      uint64_t v23 = [v29 depthEnabledForAllMedia];
    }
    else
    {
      id v24 = [v16 editConfiguration];

      if (v24)
      {
        id v25 = [v16 editConfiguration];
        uint64_t v23 = [v25 isDepthEnabled];
      }
      else
      {
        uint64_t v23 = 1;
      }
    }
    uint64_t v26 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    [v26 setDepthEnabledForAllMedia:v23];

    uint64_t v21 = v28;
  }
}

- (void)_loadAssetFromPosterConfiguration
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  if (([v3 options] & 2) != 0)
  {
    id v6 = [PUWallpaperPosterMigrator alloc];
    char v7 = [(PUWallpaperPosterEditorController *)self environment];
    uint64_t v8 = objc_msgSend(v7, "pu_sourceAssetDirectory");
    uint64_t v9 = [(PUWallpaperPosterEditorController *)self environment];
    id v4 = -[PUWallpaperPosterMigrator initWithAssetDirectory:configurationType:](v6, "initWithAssetDirectory:configurationType:", v8, objc_msgSend(v9, "pu_legacyConfigurationType"));

    [(PUWallpaperPosterEditorController *)self _showLoadingIndicator];
    objc_initWeak(location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke;
    v13[3] = &unk_1E5F266B0;
    objc_copyWeak(&v14, location);
    [v4 attemptMigrationWithCompletionBlock:v13];
    [(PUWallpaperPosterEditorController *)self setMigrator:v4];
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
LABEL_9:

    goto LABEL_10;
  }
  if (([v3 options] & 8) != 0)
  {
    id v4 = PLWallpaperGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v3;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_INFO, "Ignore current configuration as it's marked as needing update: %@", (uint8_t *)location, 0xCu);
    }
    goto LABEL_9;
  }
  if (v3)
  {
    id v4 = [v3 media];
    if ([v4 count])
    {
      id v5 = [v4 objectAtIndexedSubscript:[(PUWallpaperPosterEditorController *)self shuffleAssetIndex]% (unint64_t)[v4 count]];
      [(PUWallpaperPosterEditorController *)self setCurrentPosterMedia:v5];
    }
    else
    {
      id v10 = [(PUWallpaperPosterEditorController *)self environment];
      int v11 = objc_msgSend(v10, "px_isCallServices");

      if (v11)
      {
        [(PUWallpaperPosterEditorController *)self _pickAssets];
      }
      else
      {
        uint64_t v12 = PLWallpaperGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v3;
          _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Current poster configuration has no media: %@", (uint8_t *)location, 0xCu);
        }

        [(PUWallpaperPosterEditorController *)self setCurrentPosterMedia:0];
      }
    }
    goto LABEL_9;
  }
LABEL_10:
}

void __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  void v13[2] = __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke_2;
  v13[3] = &unk_1E5F2D3F0;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v17);
}

void __70__PUWallpaperPosterEditorController__loadAssetFromPosterConfiguration__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _handleSegmentationItem:*(void *)(a1 + 32) compoundLayerStack:*(void *)(a1 + 40) style:0 forAsset:0 error:*(void *)(a1 + 48)];
}

- (PFPosterEditConfiguration)currentEditConfiguration
{
  if ([(PUWallpaperPosterEditorController *)self _isShuffle]) {
    [(PUWallpaperPosterEditorController *)self currentPosterMedia];
  }
  else {
  id v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  }
  id v4 = [v3 editConfiguration];

  return (PFPosterEditConfiguration *)v4;
}

- (void)setPosterConfiguration:(id)a3
{
  id v8 = (PFPosterConfiguration *)a3;
  id v5 = self->_posterConfiguration;
  if (v5 == v8)
  {

LABEL_8:
    id v7 = v8;
    goto LABEL_9;
  }
  char v6 = [(PFPosterConfiguration *)v8 isEqual:v5];

  id v7 = v8;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    id v7 = v8;
    if (v8)
    {
      if ([(PUWallpaperPosterEditorController *)self _isShuffle]) {
        [(PUWallpaperPosterEditorController *)self _beginLoadingShuffleResources];
      }
      [(PUWallpaperPosterEditorController *)self _updateUserTransformIsDisabled];
      [(PUWallpaperPosterEditorController *)self _loadAssetFromPosterConfiguration];
      [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)_updateContentOverlayContainerView
{
  id v3 = [(PUWallpaperPosterEditorController *)self contentOverlayContainerView];
  id v4 = [(PUWallpaperPosterEditorController *)self editor];
  id v5 = [v4 contentOverlayView];

  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(PUWallpaperPosterEditorController *)self environment];
  id v15 = (CGAffineTransform *)objc_msgSend(v14, "pu_deviceOrientation");

  double v16 = v7;
  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  if ((unint64_t)&v15[-1].ty + 5 <= 1)
  {
    PXRectTransposed();
    double v16 = v20;
    double v17 = v21;
    double v18 = v22;
    double v19 = v23;
  }
  PXRectGetCenter();
  objc_msgSend(v3, "setCenter:");
  objc_msgSend(v3, "setBounds:", v16, v17, v18, v19);
  PUPosterAdditionalTransformForDeviceOrientation(v15, (uint64_t)v25);
  v24[0] = v25[0];
  v24[1] = v25[1];
  v24[2] = v25[2];
  [v3 setTransform:v24];
}

- (void)_updateStyleDividerView
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double Height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v7 = [(PUWallpaperPosterEditorController *)self editViewModel];
  double v8 = [(PUWallpaperPosterEditorController *)self styleDividerView];
  if (v7)
  {
    double v22 = v5;
    [v7 scrollPosition];
    double v9 = 0.0;
    if ([v8 effectiveUserInterfaceLayoutDirection] == 1) {
      double v9 = 1.0 - 0.0;
    }
    double v10 = [v8 superview];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.width = v16;
    v23.size.height = v18;
    if (!CGRectIsEmpty(v23) && v9 > 0.0 && v9 < 1.0)
    {
      v24.origin.x = v12;
      v24.origin.y = v14;
      v24.size.width = v16;
      v24.size.height = v18;
      double v22 = 6.0;
      double v20 = (0.5 - v9) * 6.0 + CGRectGetWidth(v24) * (1.0 - v9);
      v25.origin.x = v12;
      v25.origin.y = v14;
      v25.size.width = v16;
      v25.size.height = v18;
      double MidY = CGRectGetMidY(v25);
      v26.origin.x = v12;
      v26.origin.y = v14;
      v26.size.width = v16;
      v26.size.height = v18;
      double Height = CGRectGetHeight(v26);
      double v3 = v20 + -3.0;
      double v4 = MidY + Height * -0.5;
    }
    double v5 = v22;
  }
  objc_msgSend(v8, "setFrame:", v3, v4, v5, Height, *(void *)&v22);
}

- (void)_updateLayerStackOrderingForViewModel:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 viewManager];
  double v6 = [(PUWallpaperPosterEditorController *)self backgroundView];
  [(PUWallpaperPosterEditorController *)self _updateViewForLayerID:*MEMORY[0x1E4F8CF90] usingViewManager:v5 containerView:v6];
  if ([v4 hasMatte])
  {
    if ([v4 clockAppearsAboveForeground]) {
      [(PUWallpaperPosterEditorController *)self foregroundView];
    }
    else {
    double v7 = [(PUWallpaperPosterEditorController *)self floatingView];
    }
    [(PUWallpaperPosterEditorController *)self _updateViewForLayerID:*MEMORY[0x1E4F8CFA0] usingViewManager:v5 containerView:v7];
  }
  if ([v4 showsDebugHUD])
  {
    double v8 = [(PUWallpaperPosterEditorController *)self floatingView];
    double v9 = [v5 debugInfoView];
    [v8 addSubview:v9];

    double v10 = [(PUWallpaperPosterEditorController *)self editViewModel];
    double v11 = [v10 currentLayerStackViewModel];
    CGFloat v12 = [v11 viewManager];
    double v13 = [v12 debugInfoView];

    CGFloat v18 = @"Idle Timer Disabled";
    CGFloat v14 = [(PUWallpaperPosterEditorController *)self editModel];
    int v15 = [v14 idleTimerDisabled];
    CGFloat v16 = @"NO";
    if (v15) {
      CGFloat v16 = @"YES";
    }
    v19[0] = v16;
    double v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    [v13 displayAdditionalDebugInfo:v17];
  }
}

- (void)_updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v9 unregisterChangeObserver:self context:"LayerStackViewModelObservationContext"];
        [(PUWallpaperPosterEditorController *)self _removeViewsFromLayerStackViewModel:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }
  double v10 = [(PUWallpaperPosterEditorController *)self editViewModel];
  double v11 = [v10 visibleLayerStackViewModels];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        CGFloat v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        [(PUWallpaperPosterEditorController *)self _updateLayerStackOrderingForViewModel:v16];
        [v16 registerChangeObserver:self context:"LayerStackViewModelObservationContext"];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (void)_updateViewForLayerID:(id)a3 usingViewManager:(id)a4 containerView:(id)a5
{
  id v7 = a5;
  double v8 = [a4 viewForLayerID:a3];
  double v9 = v8;
  if (v8)
  {
    id v10 = [v8 superview];

    if (v10 != v7)
    {
      double v11 = (void *)MEMORY[0x1E4FB1EB0];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __90__PUWallpaperPosterEditorController__updateViewForLayerID_usingViewManager_containerView___block_invoke;
      v12[3] = &unk_1E5F2ECC8;
      id v13 = v7;
      id v14 = v9;
      [v11 performWithoutAnimation:v12];
    }
  }
}

uint64_t __90__PUWallpaperPosterEditorController__updateViewForLayerID_usingViewManager_containerView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
}

- (void)_removeViewsFromLayerStackViewModel:(id)a3
{
  double v3 = [a3 viewManager];
  id v4 = [v3 createdLayerViews];
  uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PUWallpaperPosterEditorController__removeViewsFromLayerStackViewModel___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

void __73__PUWallpaperPosterEditorController__removeViewsFromLayerStackViewModel___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "removeFromSuperview", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)_updateDeviceOrientation
{
  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    uint64_t v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    id v4[2] = __61__PUWallpaperPosterEditorController__updateDeviceOrientation__block_invoke;
    v4[3] = &unk_1E5F26688;
    void v4[4] = self;
    [v3 performChanges:v4];
  }
  [(PUWallpaperPosterEditorController *)self _updateContentOverlayContainerView];
}

void __61__PUWallpaperPosterEditorController__updateDeviceOrientation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 environment];
  objc_msgSend(v3, "setDeviceOrientation:", objc_msgSend(v4, "pu_deviceOrientation"));
}

- (void)_updateContainerFrame
{
  id v3 = [(PUWallpaperPosterEditorController *)self backgroundView];
  [v3 bounds];
  PXRectWithOriginAndSize();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  if ([MEMORY[0x1E4F8CE48] deviceSupportsLandscapeConfiguration])
  {
    v18.origin.x = v5;
    v18.origin.y = v7;
    v18.size.width = v9;
    v18.size.height = v11;
    CGRectGetWidth(v18);
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGRectGetHeight(v19);
    PXRectWithOriginAndSize();
    CGFloat v5 = v12;
    CGFloat v7 = v13;
    CGFloat v9 = v14;
    CGFloat v11 = v15;
  }
  CGFloat v16 = [(PUWallpaperPosterEditorController *)self editViewModel];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __58__PUWallpaperPosterEditorController__updateContainerFrame__block_invoke;
  v17[3] = &__block_descriptor_64_e49_v16__0___PUWallpaperPosterMutableEditViewModel__8l;
  *(CGFloat *)&void v17[4] = v5;
  *(CGFloat *)&v17[5] = v7;
  *(CGFloat *)&v17[6] = v9;
  *(CGFloat *)&v17[7] = v11;
  [v16 performChanges:v17];
}

uint64_t __58__PUWallpaperPosterEditorController__updateContainerFrame__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setContainerFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)setVisibleLayerStackViewModels:(id)a3
{
  double v10 = (NSArray *)a3;
  double v4 = self->_visibleLayerStackViewModels;
  CGFloat v5 = v10;
  if (v4 != v10)
  {
    double v6 = v4;
    char v7 = [(NSArray *)v4 isEqual:v10];

    if (v7) {
      goto LABEL_5;
    }
    CGFloat v5 = self->_visibleLayerStackViewModels;
    double v8 = (NSArray *)[(NSArray *)v10 copy];
    visibleLayerStackViewModels = self->_visibleLayerStackViewModels;
    self->_visibleLayerStackViewModels = v8;

    [(PUWallpaperPosterEditorController *)self _updateVisibleLayerStackViewsWithPreviouslyVisibleStackViewModels:v5];
  }

LABEL_5:
}

- (void)setCurrentLayerStackViewModel:(id)a3
{
  CGFloat v11 = (PUParallaxLayerStackViewModel *)a3;
  CGFloat v5 = self->_currentLayerStackViewModel;
  if (v5 == v11)
  {

    goto LABEL_8;
  }
  double v6 = v5;
  char v7 = [(PUParallaxLayerStackViewModel *)v5 isEqual:v11];

  double v8 = v11;
  if ((v7 & 1) == 0)
  {
    if (self->_currentLayerStackViewModel) {
      [(PUWallpaperPosterEditorController *)self _stopSimulatingParallax];
    }
    objc_storeStrong((id *)&self->_currentLayerStackViewModel, a3);
    [(PUWallpaperPosterEditorController *)self _updateParallaxEnabled];
    [(PUWallpaperPosterEditorController *)self _updateSettlingEffectEnabled];
    [(PUWallpaperPosterEditorController *)self _updateEditToolbar];
    CGFloat v9 = [(PUWallpaperPosterEditorController *)self editor];
    char v10 = objc_msgSend(v9, "pu_canApplyParallaxToViews");

    double v8 = v11;
    if ((v10 & 1) == 0)
    {
      [(PUWallpaperPosterEditorController *)self _startSimulatingParallax];
LABEL_8:
      double v8 = v11;
    }
  }
}

- (void)_updateVisibleLayerStackViewModels
{
  id v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
  id v3 = [v4 visibleLayerStackViewModels];
  [(PUWallpaperPosterEditorController *)self setVisibleLayerStackViewModels:v3];
}

- (void)_updateCurrentLayerStackViewModel
{
  id v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
  id v3 = [v4 currentLayerStackViewModel];
  [(PUWallpaperPosterEditorController *)self setCurrentLayerStackViewModel:v3];
}

- (void)_updateCurrentStyle
{
  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    id v3 = [(PUWallpaperPosterEditorController *)self editViewModel];
    id v4 = [v3 currentLayerStackViewModel];
    id v8 = [v4 style];

    CGFloat v5 = [v8 bakedStyle];
    double v6 = [(PUWallpaperPosterEditorController *)self currentEditConfiguration];
    [v6 setStyle:v5];

    char v7 = [(PUWallpaperPosterEditorController *)self shuffleResourceManager];
    [v7 setStyle:v8];
  }
}

- (void)_updateEditViewModelPropertiesFromPosterConfiguration
{
  id v3 = [(PUWallpaperPosterEditorController *)self posterConfiguration];
  id v5 = [v3 editConfiguration];

  if ([(PUWallpaperPosterEditorController *)self _isShuffle])
  {
    [(PUWallpaperPosterEditorController *)self _applyPosterEditConfigurationForShuffleAsset];
    if (![(PUWallpaperPosterEditorController *)self _isShuffleModeWithGlobalDepth]) {
      goto LABEL_7;
    }
    id v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
    [v4 performChanges:&__block_literal_global_307];
  }
  else
  {
    if (!v5) {
      goto LABEL_7;
    }
    id v4 = [(PUWallpaperPosterEditorController *)self editViewModel];
    [v4 applyChangesFromPosterEditConfiguration:v5];
  }

LABEL_7:
}

uint64_t __90__PUWallpaperPosterEditorController__updateEditViewModelPropertiesFromPosterConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAppliesDepthToAllOrientations:1];
}

- (void)_loadEditViewModelAndUpdateLooks:(BOOL)a3
{
  [(PUWallpaperPosterEditorController *)self _stopSettlingEffectPreview];
  [(PUWallpaperPosterEditorController *)self _updateContainerFrame];
  [(PUWallpaperPosterEditorController *)self _updateDeviceOrientation];
  [(PUWallpaperPosterEditorController *)self _updateCurrentLayerStackViewModel];
  [(PUWallpaperPosterEditorController *)self _updateVisibleLayerStackViewModels];
  [(PUWallpaperPosterEditorController *)self _updateEditViewModelPropertiesFromPosterConfiguration];
  [(PUWallpaperPosterEditorController *)self _updateUserTransformView];
  [(PUWallpaperPosterEditorController *)self _updateShuffleView];
  [(PUWallpaperPosterEditorController *)self _displayDefaultHint];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__PUWallpaperPosterEditorController__loadEditViewModelAndUpdateLooks___block_invoke;
  v5[3] = &unk_1E5F2D918;
  BOOL v7 = a3;
  objc_copyWeak(&v6, &location);
  [(PUWallpaperPosterEditorController *)self _dismissPosterConfigurationViewControllerWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __70__PUWallpaperPosterEditorController__loadEditViewModelAndUpdateLooks___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v1 = [WeakRetained editor];
    objc_msgSend(v1, "pu_updateLooks");
  }
}

- (void)setEditViewModel:(id)a3
{
  CGFloat v11 = (PUWallpaperPosterEditViewModel *)a3;
  id v5 = self->_editViewModel;
  if (v5 == v11)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(PUWallpaperPosterEditViewModel *)v5 isEqual:v11];

    id v8 = v11;
    if (v7) {
      goto LABEL_9;
    }
    CGFloat v9 = self->_editViewModel;
    [(PUWallpaperPosterEditViewModel *)v9 unregisterChangeObserver:self context:"EditViewModelObservationContext"];
    objc_storeStrong((id *)&self->_editViewModel, a3);
    [(PUWallpaperPosterEditViewModel *)self->_editViewModel registerChangeObserver:self context:"EditViewModelObservationContext"];

    if (v9) {
      uint64_t v10 = [(PUWallpaperPosterEditorController *)self _isShuffle] ^ 1;
    }
    else {
      uint64_t v10 = 1;
    }
    [(PUWallpaperPosterEditorController *)self _loadEditViewModelAndUpdateLooks:v10];
  }
  id v8 = v11;
LABEL_9:
}

- (void)dealloc
{
  id v3 = [(PUWallpaperPosterEditorController *)self backgroundView];
  [v3 removeObserver:self forKeyPath:@"layer.bounds" context:&BackgroundViewObservationContext];

  id v4 = [(PUWallpaperPosterEditorController *)self editModel];
  [v4 unregisterChangeObserver:self context:"EditModelObservationContext"];

  [(PUWallpaperPosterEditorController *)self _stopObservingPlayerItem];
  v5.receiver = self;
  v5.super_class = (Class)PUWallpaperPosterEditorController;
  [(PUWallpaperPosterEditorController *)&v5 dealloc];
}

- (PUWallpaperPosterEditorController)initWithWallpaperEditor:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)PUWallpaperPosterEditorController;
  CGFloat v9 = [(PUWallpaperPosterEditorController *)&v24 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_editor, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
    CGFloat v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.photos.poster-editor-loading", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    double v14 = PLWallpaperGetLog();
    v10->_signpost = os_signpost_id_make_with_pointer(v14, v10);

    dispatch_group_t v15 = dispatch_group_create();
    segmentationLoadingGroup = v10->_segmentationLoadingGroup;
    v10->_segmentationLoadingGroup = (OS_dispatch_group *)v15;

    v10->_performingInitialLoad = 1;
    long long v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    styleDividerView = v10->_styleDividerView;
    v10->_styleDividerView = v17;

    CGRect v19 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v10->_styleDividerView setBackgroundColor:v19];

    [(PUWallpaperPosterEditModel *)v10->_editModel registerChangeObserver:v10 context:"EditModelObservationContext"];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke;
    block[3] = &unk_1E5F2ED10;
    id v23 = v8;
    if (initWithWallpaperEditor_photoLibrary__onceToken != -1) {
      dispatch_once(&initWithWallpaperEditor_photoLibrary__onceToken, block);
    }
    long long v20 = [MEMORY[0x1E4F905E0] sharedScheduler];
    [v20 scheduleDeferredTaskWithQoS:1 block:&__block_literal_global_39833];
  }
  return v10;
}

uint64_t __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F56658];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  [v2 setupWithConfigurationFilename:@"CPAnalyticsConfig-PhotosPosterProvider" inBundle:v3];

  [MEMORY[0x1E4F56658] setupSystemPropertyProvidersForLibrary:*(void *)(a1 + 32)];
  [MEMORY[0x1E4F56658] startAppTracking];
  [MEMORY[0x1E4F56658] startViewTracking];
  id v4 = (void *)MEMORY[0x1E4FB1438];
  return objc_msgSend(v4, "pu_prepareCPAnalytics");
}

uint64_t __74__PUWallpaperPosterEditorController_initWithWallpaperEditor_photoLibrary___block_invoke_2()
{
  return [MEMORY[0x1E4F56658] activateEventQueue];
}

+ (id)availableStylesForItem:(id)a3 posterConfiguration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  CGFloat v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      dispatch_queue_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, a1, @"PUWallpaperPosterEditorController.m", 1234, @"Invalid parameter not satisfying: %@", @"posterConfiguration" object file lineNumber description];
    }
    if ([v9 posterType] == 2) {
      [v7 defaultStyles];
    }
    else {
    uint64_t v10 = [v7 availableStyles];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (int64_t)posterConfigurationTypeForPosterType:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  if (!a3)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v3;
    dispatch_queue_t v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
    [v12 handleFailureInMethod:a2 object:a1 file:@"PUWallpaperPosterEditorController.m" lineNumber:692 description:@"Unexpected poster descriptor type"];

    abort();
  }
  return 0;
}

+ (id)posterConfigurationFromPosterDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8CCF8]), "initWithConfigurationType:", objc_msgSend((id)objc_opt_class(), "posterConfigurationTypeForPosterType:", objc_msgSend(v3, "posterType")));
  if ([v3 descriptorType] == 2)
  {
    uint64_t v5 = [v3 shuffleConfiguration];
    if (!v5)
    {
      uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F8CD38]) initWithShuffleType:0];
      [v5 setShuffleFrequency:*MEMORY[0x1E4F8D140]];
      objc_msgSend(v5, "setShuffleSmartAlbums:", objc_msgSend(MEMORY[0x1E4F908F0], "supportedTypes"));
    }
    [v4 setShuffleConfiguration:v5];
  }
  return v4;
}

@end