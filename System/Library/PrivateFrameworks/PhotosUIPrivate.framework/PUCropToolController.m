@interface PUCropToolController
- (BOOL)_hasConstraintsForKey:(id)a3;
- (BOOL)_hasCropSuggestion;
- (BOOL)_hasPerspectiveSuggestion;
- (BOOL)_needsRecomposeCropRect;
- (BOOL)canBecomeActiveTool;
- (BOOL)canResetToDefaultValue;
- (BOOL)contentViewsHidden;
- (BOOL)editValuesCalculatorDidFinishComputingGeometricValues;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gridVisible;
- (BOOL)handlesMediaViewInsets;
- (BOOL)handlesVideoPlaying;
- (BOOL)hasAppliedCropSuggestion;
- (BOOL)hasAppliedPerspectiveSuggestion;
- (BOOL)hasAutoAppliedCropSuggestion;
- (BOOL)hasAutoAppliedPerspectiveSuggestion;
- (BOOL)hasRequestedCropSuggestion;
- (BOOL)hasRequestedPerspectiveSuggestion;
- (BOOL)ignoreTrackingUpdates;
- (BOOL)imageLoadingInProgress;
- (BOOL)initialImageLoaded;
- (BOOL)isActiveTool;
- (BOOL)isHDREnabled;
- (BOOL)isModelChangeLocal;
- (BOOL)isScrubbingVideo;
- (BOOL)isTrackingAdjustmentControl;
- (BOOL)loadingStateFromModel;
- (BOOL)modelLoadingSuspended;
- (BOOL)needsImageLoad;
- (BOOL)needsMediaLoad;
- (BOOL)needsModelLoad;
- (BOOL)setLockedCropAspectIfNeededIgnoringCurrentLock:(BOOL)a3;
- (BOOL)supportsGesturesOfType:(unint64_t)a3;
- (BOOL)supportsPreviewingOriginal;
- (BOOL)suppressesEditUpdates;
- (BOOL)toolBadgeDoesHide;
- (BOOL)wantsDefaultPreviewView;
- (BOOL)wantsPreviewViewHidden;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsSliderKeyControl;
- (BOOL)wasLoadingStateFromModelWhenTrackingBegan;
- (BOOL)wasPlayingBeforeBeginningToScrubVideo;
- (CEKBadgeTextView)badgeView;
- (CGImage)gainMapImage;
- (CGPoint)_pointForHandle:(unint64_t)a3;
- (CGPoint)_pointForHandle:(unint64_t)a3 onCropRect:(CGRect)a4;
- (CGRect)_addHeight:(double)a3 toRect:(CGRect)a4 anchorTop:(BOOL)a5;
- (CGRect)_addWidth:(double)a3 toRect:(CGRect)a4 anchorLeft:(BOOL)a5;
- (CGRect)_cropCanvasFrame;
- (CGRect)_cropRectFromPanningHandle:(unint64_t)a3 byAmount:(CGVector)a4;
- (CGRect)_defaultImageCropRect;
- (CGRect)_defaultViewCropRect;
- (CGRect)_suggestedCropRectForImageRect:(CGRect)a3;
- (CGRect)cropViewFrameForLastModelLoad;
- (CGRect)initialHandlePanCropRect;
- (CGRect)inputExtent;
- (CGRect)suggestedCrop;
- (CGRect)viewCropRect;
- (CGSize)minimumViewCropRectSizeForHandleGesture;
- (CGSize)screenSize;
- (CGVector)_applyAspectOfCropRect:(CGRect)a3 toHandleMovement:(CGVector)a4;
- (CGVector)_correctInputVector:(CGVector)a3 forHandle:(unint64_t)a4 onCropRect:(CGRect)a5 lockDirection:(BOOL)a6;
- (CGVector)_deltaMaskForHandle:(unint64_t)a3;
- (NSArray)toolKeyCommands;
- (NSDictionary)cropHandleViewsByHandle;
- (NSMutableArray)imageLoadingQueueCompletionBlocks;
- (NSMutableDictionary)animationTargetsByKeyPath;
- (NSMutableDictionary)animationsByKeyPath;
- (NSMutableDictionary)initialLocationsInHandlesByHandle;
- (NSTimer)badgeShowingExpirationTimer;
- (NUComposition)lastKnownComposition;
- (NUCropModel)cropModel;
- (OS_dispatch_queue)imageLoadingQueue;
- (PLImageGeometry)geometry;
- (PLPhotoEditRenderer)renderer;
- (PUAVKitMediaTimelineView)videoScrubberView;
- (PUAdjustmentsViewController)adjustmentsViewController;
- (PUCropAspect)cropAspect;
- (PUCropAspectFlipperView)cropAspectFlipperView;
- (PUCropAspectViewController)cropAspectViewController;
- (PUCropHandleView)selectedCropHandleView;
- (PUCropOverlayView)cropOverlayView;
- (PUCropPerspectiveAdjustmentsDataSource)dataSource;
- (PUCropPerspectiveView)cropView;
- (PUCropToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUPhotoEditToolActivationButton)autoButton;
- (PUPhotoEditToolbarButton)aspectButton;
- (PUPhotoEditToolbarButton)flipButton;
- (PUPhotoEditToolbarButton)rotateButton;
- (UIButton)aspectRatioLockButton;
- (UIButton)playPauseButton;
- (UIEdgeInsets)previewViewInsets;
- (UIImage)image;
- (UILongPressGestureRecognizer)accessibilityLongPressGestureRecognizer;
- (UIView)adjustmentPickerView;
- (UIView)containerView;
- (UIView)cropCanvasView;
- (UIView)rotateSnapshotView;
- (double)_defaultPitchAngle;
- (double)_defaultStraightenAngle;
- (double)_defaultYawAngle;
- (double)pitchAngle;
- (double)screenScale;
- (double)straightenAngle;
- (double)suggestedPitchAngle;
- (double)suggestedStraightenAngle;
- (double)suggestedYawAngle;
- (double)yawAngle;
- (float)gainMapValue;
- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6;
- (id)_animationForKeyPath:(id)a3;
- (id)_animationTargetForKeyPath:(id)a3;
- (id)adjustmentsRenderer:(id)a3;
- (id)bestAspectRatioForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (id)filter;
- (id)leadingToolbarViews;
- (id)localizedName;
- (id)localizedResetToolActionTitle;
- (id)selectedToolbarIconGlyphName;
- (id)toolActionsForMenu;
- (id)toolbarIconAccessibilityLabel;
- (id)toolbarIconGlyphName;
- (id)trailingToolbarViews;
- (id)videoScrubberObservedPlayer;
- (id)videoScrubberTimeObserver;
- (int64_t)_defaultOrientation;
- (int64_t)autoButtonMode;
- (int64_t)initialAction;
- (int64_t)toolControllerTag;
- (unint64_t)contentViewsHiddenAnimationCount;
- (unint64_t)rotatingAnimationCount;
- (void)_accessibilityLongPressChanged:(id)a3;
- (void)_applyCropAndPerspectiveSuggestion;
- (void)_applyCropRect:(CGRect)a3 straightenAngle:(double)a4 pitchAngle:(double)a5 yawAngle:(double)a6 isAutoCrop:(BOOL)a7;
- (void)_aspectButtonTapped:(id)a3;
- (void)_aspectLockButtonTapped;
- (void)_autoApplyCropAndPerspectiveSuggestionIfNeeded;
- (void)_autoRecomposeCropRect;
- (void)_beginObservingVideoPlayer;
- (void)_cancelAnimationForKeyPath:(id)a3;
- (void)_cancelDelayedRecomposeCropRect;
- (void)_closeAspectRatioPicker;
- (void)_createRendererIfNeeded;
- (void)_cropToggleTapped:(id)a3;
- (void)_flipButtonTapped:(id)a3;
- (void)_gridButtonTapped:(id)a3;
- (void)_handleCropHandlePan:(id)a3;
- (void)_handleDidCreateEditedImage:(id)a3 inputExtent:(CGRect)a4;
- (void)_handleTouchingGesture:(id)a3;
- (void)_hideGrid;
- (void)_hideGridDelayed;
- (void)_hideMaskedContent;
- (void)_hideMaskedContentDelayed;
- (void)_installRenderedImageAndDisplayIfNeeded;
- (void)_invalidateConstraintsForKey:(id)a3;
- (void)_layoutAdjustmentTools;
- (void)_loadCropSuggestionIfNeeded;
- (void)_loadImageIfNeededWithCompletion:(id)a3;
- (void)_loadMediaIfNeeded;
- (void)_loadPerspectiveSuggestionIfNeeded;
- (void)_loadStateFromModelAnimated:(BOOL)a3;
- (void)_performGeometryChange:(id)a3 animated:(BOOL)a4;
- (void)_performInitialAction;
- (void)_performLocalCropModelChanges:(id)a3;
- (void)_performLocalModelChanges:(id)a3;
- (void)_playPauseButtonTapped;
- (void)_preferredContentSizeCategoryChanged;
- (void)_recomposeCropRectAnimated:(BOOL)a3;
- (void)_recomposeCropRectDelayed;
- (void)_removeSnapshotView:(id)a3;
- (void)_resetAllValuesAnimated:(BOOL)a3;
- (void)_resetAllValuesAnimated:(BOOL)a3 skipLayerTransformUpdate:(BOOL)a4;
- (void)_rotateButtonTapped:(id)a3;
- (void)_rotateByApplyingOrientation:(int64_t)a3;
- (void)_setAnimation:(id)a3 forKeyPath:(id)a4;
- (void)_setAnimationTarget:(id)a3 forKeyPath:(id)a4;
- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setCropAspect:(id)a3 animated:(BOOL)a4;
- (void)_setPitchAngle:(double)a3 animated:(BOOL)a4;
- (void)_setStraightenAngle:(double)a3 animated:(BOOL)a4;
- (void)_setViewCropRect:(CGRect)a3 animated:(BOOL)a4;
- (void)_setYawAngle:(double)a3 animated:(BOOL)a4;
- (void)_setupCropModelFromCompositionController:(id)a3;
- (void)_showGridAndCancelDelayedHide;
- (void)_showMaskedContentAndCancelDelayedHide;
- (void)_toggleCropAndPerspective;
- (void)_updateAspectRatioControls;
- (void)_updateBadgeTextWithInfo:(id)a3;
- (void)_updateCropActionButtons;
- (void)_updateCropCanvasConstraintsIfNeeded;
- (void)_updateCropToggleButton;
- (void)_updateCropToggleButtonMode;
- (void)_updateCropToggleConstraintsIfNeeded;
- (void)_updateCropViewsForInteraction;
- (void)_updatePreviewViewInsets;
- (void)_updateVideoScrubber;
- (void)_userChangedAspectRatioLocked:(BOOL)a3;
- (void)adjustmentsDataChanged:(id)a3;
- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3;
- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3;
- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3;
- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3;
- (void)adjustmentsViewControllerToolDidEndScrubbing:(id)a3;
- (void)adjustmentsViewControllerToolWillBeginScrubbing:(id)a3;
- (void)baseMediaInvalidated;
- (void)basePhotoInvalidated;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)configureForAdjustmentCategory:(int64_t)a3;
- (void)createVideoScrubber;
- (void)cropAspectController:(id)a3 cropAspectSelected:(id)a4;
- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4;
- (void)cropTransformedImageView:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4;
- (void)cropTransformedImageViewDidEndTracking:(id)a3;
- (void)cropTransformedImageViewDidTrack:(id)a3;
- (void)cropTransformedImageViewWillBeginTracking:(id)a3;
- (void)dealloc;
- (void)decreaseSliderValue:(BOOL)a3;
- (void)didBecomeActiveTool;
- (void)didResignActiveTool;
- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3;
- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3;
- (void)handleResigningCropTool;
- (void)increaseSliderValue:(BOOL)a3;
- (void)mediaTimelineControlViewDidChangeValue:(id)a3;
- (void)mediaTimelineControlViewDidEndChanging:(id)a3;
- (void)mediaTimelineControlViewWillBeginChanging:(id)a3;
- (void)prepareForSave:(BOOL)a3;
- (void)prepareForToolTransitionWithCompletion:(id)a3;
- (void)reactivate;
- (void)resetToolLabelHidingTimer;
- (void)rotateAssetsClockwise:(id)a3;
- (void)rotateAssetsCounterclockwise:(id)a3;
- (void)setAccessibilityLongPressGestureRecognizer:(id)a3;
- (void)setActiveTool:(BOOL)a3;
- (void)setAdjustmentPickerView:(id)a3;
- (void)setAdjustmentsViewController:(id)a3;
- (void)setAnimationTargetsByKeyPath:(id)a3;
- (void)setAnimationsByKeyPath:(id)a3;
- (void)setAspectButton:(id)a3;
- (void)setAspectRatioLockButton:(id)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setAutoButton:(id)a3;
- (void)setAutoButtonMode:(int64_t)a3;
- (void)setBadgeShowingExpirationTimer:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setContentViewsHidden:(BOOL)a3;
- (void)setContentViewsHiddenAnimationCount:(unint64_t)a3;
- (void)setCropAspect:(id)a3;
- (void)setCropAspectFlipperView:(id)a3;
- (void)setCropAspectViewController:(id)a3;
- (void)setCropCanvasView:(id)a3;
- (void)setCropHandleViewsByHandle:(id)a3;
- (void)setCropModel:(id)a3;
- (void)setCropOverlayView:(id)a3;
- (void)setCropView:(id)a3;
- (void)setCropViewFrameForLastModelLoad:(CGRect)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditValuesCalculatorDidFinishComputingGeometricValues:(BOOL)a3;
- (void)setFlipButton:(id)a3;
- (void)setFocusingViewForInteraction:(BOOL)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setGeometry:(id)a3;
- (void)setGridVisible:(BOOL)a3;
- (void)setHasAppliedCropSuggestion:(BOOL)a3;
- (void)setHasAppliedPerspectiveSuggestion:(BOOL)a3;
- (void)setHasAutoAppliedCropSuggestion:(BOOL)a3;
- (void)setHasAutoAppliedPerspectiveSuggestion:(BOOL)a3;
- (void)setHasRequestedCropSuggestion:(BOOL)a3;
- (void)setHasRequestedPerspectiveSuggestion:(BOOL)a3;
- (void)setIgnoreTrackingUpdates:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageLoadingInProgress:(BOOL)a3;
- (void)setImageLoadingQueue:(id)a3;
- (void)setImageLoadingQueueCompletionBlocks:(id)a3;
- (void)setInitialAction:(int64_t)a3;
- (void)setInitialHandlePanCropRect:(CGRect)a3;
- (void)setInitialImageLoaded:(BOOL)a3;
- (void)setInitialLocationsInHandlesByHandle:(id)a3;
- (void)setInputExtent:(CGRect)a3;
- (void)setIsScrubbingVideo:(BOOL)a3;
- (void)setLastKnownComposition:(id)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setLoadingStateFromModel:(BOOL)a3;
- (void)setMinimumViewCropRectSizeForHandleGesture:(CGSize)a3;
- (void)setModelChangeLocal:(BOOL)a3;
- (void)setModelLoadingSuspended:(BOOL)a3;
- (void)setNeedsImageLoad:(BOOL)a3;
- (void)setNeedsMediaLoad:(BOOL)a3;
- (void)setNeedsModelLoad:(BOOL)a3;
- (void)setPitchAngle:(double)a3;
- (void)setPreviewViewInsets:(UIEdgeInsets)a3;
- (void)setRenderer:(id)a3;
- (void)setRotateButton:(id)a3;
- (void)setRotateSnapshotView:(id)a3;
- (void)setRotatingAnimationCount:(unint64_t)a3;
- (void)setScreenScale:(double)a3;
- (void)setScreenSize:(CGSize)a3;
- (void)setSelectedCropHandleView:(id)a3;
- (void)setStraightenAngle:(double)a3;
- (void)setSuggestedCrop:(CGRect)a3;
- (void)setSuggestedPitchAngle:(double)a3;
- (void)setSuggestedStraightenAngle:(double)a3;
- (void)setSuggestedYawAngle:(double)a3;
- (void)setToolBadgeDoesHide:(BOOL)a3;
- (void)setTrackingAdjustmentControl:(BOOL)a3;
- (void)setVideoScrubberObservedPlayer:(id)a3;
- (void)setVideoScrubberTimeObserver:(id)a3;
- (void)setViewCropRect:(CGRect)a3;
- (void)setWantsPreviewViewHidden:(BOOL)a3;
- (void)setWasLoadingStateFromModelWhenTrackingBegan:(BOOL)a3;
- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3;
- (void)setYawAngle:(double)a3;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)showBadgeView:(BOOL)a3 animated:(BOOL)a4;
- (void)showToolLabel;
- (void)showVideoScrubber:(BOOL)a3;
- (void)updateAspectRatioLockButton;
- (void)updateCropAspectRatioOrientation:(int64_t)a3;
- (void)updateViewConstraints;
- (void)updateViewOrdering;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActiveTool;
- (void)willResignActiveTool;
@end

@implementation PUCropToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolKeyCommands, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_accessibilityLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueueCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
  objc_storeStrong(&self->_videoScrubberObservedPlayer, 0);
  objc_storeStrong(&self->_videoScrubberTimeObserver, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_videoScrubberView, 0);
  objc_storeStrong((id *)&self->_cropAspect, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_lastKnownComposition, 0);
  objc_storeStrong((id *)&self->_badgeShowingExpirationTimer, 0);
  objc_storeStrong((id *)&self->_animationTargetsByKeyPath, 0);
  objc_storeStrong((id *)&self->_animationsByKeyPath, 0);
  objc_storeStrong((id *)&self->_initialLocationsInHandlesByHandle, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_aspectRatioLockButton, 0);
  objc_storeStrong((id *)&self->_cropAspectFlipperView, 0);
  objc_storeStrong((id *)&self->_cropAspectViewController, 0);
  objc_storeStrong((id *)&self->_rotateSnapshotView, 0);
  objc_storeStrong((id *)&self->_selectedCropHandleView, 0);
  objc_storeStrong((id *)&self->_cropHandleViewsByHandle, 0);
  objc_storeStrong((id *)&self->_cropOverlayView, 0);
  objc_storeStrong((id *)&self->_cropCanvasView, 0);
  objc_storeStrong((id *)&self->_cropView, 0);
  objc_storeStrong((id *)&self->_aspectButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_rotateButton, 0);
  objc_storeStrong((id *)&self->_autoButton, 0);
  objc_storeStrong((id *)&self->_adjustmentPickerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_adjustmentsViewController, 0);
}

- (NSArray)toolKeyCommands
{
  return self->_toolKeyCommands;
}

- (void)setBadgeView:(id)a3
{
}

- (CEKBadgeTextView)badgeView
{
  return self->_badgeView;
}

- (void)setAccessibilityLongPressGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)accessibilityLongPressGestureRecognizer
{
  return self->_accessibilityLongPressGestureRecognizer;
}

- (void)setImageLoadingQueueCompletionBlocks:(id)a3
{
}

- (NSMutableArray)imageLoadingQueueCompletionBlocks
{
  return self->_imageLoadingQueueCompletionBlocks;
}

- (void)setImageLoadingQueue:(id)a3
{
}

- (OS_dispatch_queue)imageLoadingQueue
{
  return self->_imageLoadingQueue;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (CGSize)screenSize
{
  double width = self->_screenSize.width;
  double height = self->_screenSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3
{
  self->_wasPlayingBeforeBeginningToScrubVideo = a3;
}

- (BOOL)wasPlayingBeforeBeginningToScrubVideo
{
  return self->_wasPlayingBeforeBeginningToScrubVideo;
}

- (void)setVideoScrubberObservedPlayer:(id)a3
{
}

- (id)videoScrubberObservedPlayer
{
  return self->_videoScrubberObservedPlayer;
}

- (void)setVideoScrubberTimeObserver:(id)a3
{
}

- (id)videoScrubberTimeObserver
{
  return self->_videoScrubberTimeObserver;
}

- (void)setIsScrubbingVideo:(BOOL)a3
{
  self->_isScrubbingVideo = a3;
}

- (BOOL)isScrubbingVideo
{
  return self->_isScrubbingVideo;
}

- (UIButton)playPauseButton
{
  return self->_playPauseButton;
}

- (PUAVKitMediaTimelineView)videoScrubberView
{
  return self->_videoScrubberView;
}

- (void)setHasRequestedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasRequestedPerspectiveSuggestion = a3;
}

- (BOOL)hasRequestedPerspectiveSuggestion
{
  return self->_hasRequestedPerspectiveSuggestion;
}

- (BOOL)hasAppliedPerspectiveSuggestion
{
  return self->_hasAppliedPerspectiveSuggestion;
}

- (void)setHasAutoAppliedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasAutoAppliedPerspectiveSuggestion = a3;
}

- (BOOL)hasAutoAppliedPerspectiveSuggestion
{
  return self->_hasAutoAppliedPerspectiveSuggestion;
}

- (void)setSuggestedYawAngle:(double)a3
{
  self->_suggestedYawAngle = a3;
}

- (double)suggestedYawAngle
{
  return self->_suggestedYawAngle;
}

- (void)setSuggestedPitchAngle:(double)a3
{
  self->_suggestedPitchAngle = a3;
}

- (double)suggestedPitchAngle
{
  return self->_suggestedPitchAngle;
}

- (void)setEditValuesCalculatorDidFinishComputingGeometricValues:(BOOL)a3
{
  self->_editValuesCalculatorDidFinishComputingGeometricValues = a3;
}

- (BOOL)editValuesCalculatorDidFinishComputingGeometricValues
{
  return self->_editValuesCalculatorDidFinishComputingGeometricValues;
}

- (void)setHasRequestedCropSuggestion:(BOOL)a3
{
  self->_hasRequestedCropSuggestion = a3;
}

- (BOOL)hasRequestedCropSuggestion
{
  return self->_hasRequestedCropSuggestion;
}

- (BOOL)hasAppliedCropSuggestion
{
  return self->_hasAppliedCropSuggestion;
}

- (void)setHasAutoAppliedCropSuggestion:(BOOL)a3
{
  self->_hasAutoAppliedCropSuggestion = a3;
}

- (BOOL)hasAutoAppliedCropSuggestion
{
  return self->_hasAutoAppliedCropSuggestion;
}

- (void)setSuggestedStraightenAngle:(double)a3
{
  self->_suggestedStraightenAngle = a3;
}

- (double)suggestedStraightenAngle
{
  return self->_suggestedStraightenAngle;
}

- (void)setSuggestedCrop:(CGRect)a3
{
  self->_suggestedCrop = a3;
}

- (CGRect)suggestedCrop
{
  double x = self->_suggestedCrop.origin.x;
  double y = self->_suggestedCrop.origin.y;
  double width = self->_suggestedCrop.size.width;
  double height = self->_suggestedCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)gridVisible
{
  return self->_gridVisible;
}

- (PUCropAspect)cropAspect
{
  return self->_cropAspect;
}

- (double)yawAngle
{
  return self->_yawAngle;
}

- (double)pitchAngle
{
  return self->_pitchAngle;
}

- (double)straightenAngle
{
  return self->_straightenAngle;
}

- (CGRect)viewCropRect
{
  double x = self->_viewCropRect.origin.x;
  double y = self->_viewCropRect.origin.y;
  double width = self->_viewCropRect.size.width;
  double height = self->_viewCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputExtent:(CGRect)a3
{
  self->_inputExtent = a3;
}

- (CGRect)inputExtent
{
  double x = self->_inputExtent.origin.x;
  double y = self->_inputExtent.origin.y;
  double width = self->_inputExtent.size.width;
  double height = self->_inputExtent.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImage:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setCropModel:(id)a3
{
}

- (NUCropModel)cropModel
{
  return self->_cropModel;
}

- (void)setGeometry:(id)a3
{
}

- (PLImageGeometry)geometry
{
  return self->_geometry;
}

- (void)setRenderer:(id)a3
{
}

- (PLPhotoEditRenderer)renderer
{
  return self->_renderer;
}

- (void)setLastKnownComposition:(id)a3
{
}

- (NUComposition)lastKnownComposition
{
  return self->_lastKnownComposition;
}

- (void)setModelChangeLocal:(BOOL)a3
{
  self->_modelChangeLocal = a3;
}

- (BOOL)isModelChangeLocal
{
  return self->_modelChangeLocal;
}

- (void)setCropViewFrameForLastModelLoad:(CGRect)a3
{
  self->_cropViewFrameForLastModelLoad = a3;
}

- (CGRect)cropViewFrameForLastModelLoad
{
  double x = self->_cropViewFrameForLastModelLoad.origin.x;
  double y = self->_cropViewFrameForLastModelLoad.origin.y;
  double width = self->_cropViewFrameForLastModelLoad.size.width;
  double height = self->_cropViewFrameForLastModelLoad.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setNeedsModelLoad:(BOOL)a3
{
  self->_needsModelLoad = a3;
}

- (BOOL)needsModelLoad
{
  return self->_needsModelLoad;
}

- (void)setActiveTool:(BOOL)a3
{
  self->_activeTool = a3;
}

- (BOOL)isActiveTool
{
  return self->_activeTool;
}

- (void)setNeedsMediaLoad:(BOOL)a3
{
  self->_needsMediaLoad = a3;
}

- (BOOL)needsMediaLoad
{
  return self->_needsMediaLoad;
}

- (void)setInitialImageLoaded:(BOOL)a3
{
  self->_initialImageLoaded = a3;
}

- (BOOL)initialImageLoaded
{
  return self->_initialImageLoaded;
}

- (void)setNeedsImageLoad:(BOOL)a3
{
  self->_needsImageLoad = a3;
}

- (BOOL)needsImageLoad
{
  return self->_needsImageLoad;
}

- (void)setWasLoadingStateFromModelWhenTrackingBegan:(BOOL)a3
{
  self->_wasLoadingStateFromModelWhenTrackingBegan = a3;
}

- (BOOL)wasLoadingStateFromModelWhenTrackingBegan
{
  return self->_wasLoadingStateFromModelWhenTrackingBegan;
}

- (void)setLoadingStateFromModel:(BOOL)a3
{
  self->_loadingStateFromModel = a3;
}

- (BOOL)loadingStateFromModel
{
  return self->_loadingStateFromModel;
}

- (void)setModelLoadingSuspended:(BOOL)a3
{
  self->_modelLoadingSuspended = a3;
}

- (BOOL)modelLoadingSuspended
{
  return self->_modelLoadingSuspended;
}

- (void)setToolBadgeDoesHide:(BOOL)a3
{
  self->_toolBadgeDoesHide = a3;
}

- (BOOL)toolBadgeDoesHide
{
  return self->_toolBadgeDoesHide;
}

- (void)setBadgeShowingExpirationTimer:(id)a3
{
}

- (NSTimer)badgeShowingExpirationTimer
{
  return self->_badgeShowingExpirationTimer;
}

- (void)setTrackingAdjustmentControl:(BOOL)a3
{
  self->_trackingAdjustmentControl = a3;
}

- (BOOL)isTrackingAdjustmentControl
{
  return self->_trackingAdjustmentControl;
}

- (void)setContentViewsHiddenAnimationCount:(unint64_t)a3
{
  self->_contentViewsHiddenAnimationCount = a3;
}

- (unint64_t)contentViewsHiddenAnimationCount
{
  return self->_contentViewsHiddenAnimationCount;
}

- (void)setRotatingAnimationCount:(unint64_t)a3
{
  self->_rotatingAnimationCount = a3;
}

- (unint64_t)rotatingAnimationCount
{
  return self->_rotatingAnimationCount;
}

- (void)setAnimationTargetsByKeyPath:(id)a3
{
}

- (void)setAnimationsByKeyPath:(id)a3
{
}

- (void)setIgnoreTrackingUpdates:(BOOL)a3
{
  self->_ignoreTrackingUpdates = a3;
}

- (BOOL)ignoreTrackingUpdates
{
  return self->_ignoreTrackingUpdates;
}

- (void)setWantsPreviewViewHidden:(BOOL)a3
{
  self->_wantsPreviewViewHidden = a3;
}

- (BOOL)wantsPreviewViewHidden
{
  return self->_wantsPreviewViewHidden;
}

- (void)setPreviewViewInsets:(UIEdgeInsets)a3
{
  self->_previewViewInsets = a3;
}

- (UIEdgeInsets)previewViewInsets
{
  double top = self->_previewViewInsets.top;
  double left = self->_previewViewInsets.left;
  double bottom = self->_previewViewInsets.bottom;
  double right = self->_previewViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)contentViewsHidden
{
  return self->_contentViewsHidden;
}

- (void)setInitialHandlePanCropRect:(CGRect)a3
{
  self->_initialHandlePanCropRect = a3;
}

- (CGRect)initialHandlePanCropRect
{
  double x = self->_initialHandlePanCropRect.origin.x;
  double y = self->_initialHandlePanCropRect.origin.y;
  double width = self->_initialHandlePanCropRect.size.width;
  double height = self->_initialHandlePanCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInitialLocationsInHandlesByHandle:(id)a3
{
}

- (void)setDataSource:(id)a3
{
}

- (PUCropPerspectiveAdjustmentsDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setAspectRatioLockButton:(id)a3
{
}

- (UIButton)aspectRatioLockButton
{
  return self->_aspectRatioLockButton;
}

- (void)setMinimumViewCropRectSizeForHandleGesture:(CGSize)a3
{
  self->_minimumViewCropRectSizeForHandleGesture = a3;
}

- (CGSize)minimumViewCropRectSizeForHandleGesture
{
  double width = self->_minimumViewCropRectSizeForHandleGesture.width;
  double height = self->_minimumViewCropRectSizeForHandleGesture.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCropAspectFlipperView:(id)a3
{
}

- (PUCropAspectFlipperView)cropAspectFlipperView
{
  return self->_cropAspectFlipperView;
}

- (void)setCropAspectViewController:(id)a3
{
}

- (PUCropAspectViewController)cropAspectViewController
{
  return self->_cropAspectViewController;
}

- (void)setRotateSnapshotView:(id)a3
{
}

- (UIView)rotateSnapshotView
{
  return self->_rotateSnapshotView;
}

- (void)setSelectedCropHandleView:(id)a3
{
}

- (PUCropHandleView)selectedCropHandleView
{
  return self->_selectedCropHandleView;
}

- (void)setCropHandleViewsByHandle:(id)a3
{
}

- (void)setCropOverlayView:(id)a3
{
}

- (void)setCropCanvasView:(id)a3
{
}

- (void)setCropView:(id)a3
{
}

- (void)setAspectButton:(id)a3
{
}

- (PUPhotoEditToolbarButton)aspectButton
{
  return self->_aspectButton;
}

- (void)setFlipButton:(id)a3
{
}

- (PUPhotoEditToolbarButton)flipButton
{
  return self->_flipButton;
}

- (void)setRotateButton:(id)a3
{
}

- (PUPhotoEditToolbarButton)rotateButton
{
  return self->_rotateButton;
}

- (int64_t)autoButtonMode
{
  return self->_autoButtonMode;
}

- (void)setAutoButton:(id)a3
{
}

- (PUPhotoEditToolActivationButton)autoButton
{
  return self->_autoButton;
}

- (void)setAdjustmentPickerView:(id)a3
{
}

- (UIView)adjustmentPickerView
{
  return self->_adjustmentPickerView;
}

- (void)setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setAdjustmentsViewController:(id)a3
{
}

- (PUAdjustmentsViewController)adjustmentsViewController
{
  return self->_adjustmentsViewController;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (void)setInitialAction:(int64_t)a3
{
  self->_initialAction = a3;
}

- (int64_t)initialAction
{
  return self->_initialAction;
}

- (void)setImageLoadingInProgress:(BOOL)a3
{
  self->_imageLoadingInProgress = a3;
}

- (BOOL)imageLoadingInProgress
{
  return self->_imageLoadingInProgress;
}

- (BOOL)isHDREnabled
{
  if (([MEMORY[0x1E4F7A4A0] enableDash5] & 1) != 0
    || (int v2 = [MEMORY[0x1E4F7A4A0] renderMeteorPlusAsHDR]) != 0)
  {
    LOBYTE(v2) = PXUserAllowFullHDR();
  }
  return v2;
}

- (void)_accessibilityLongPressChanged:(id)a3
{
  id v21 = a3;
  v4 = [(PUCropToolController *)self view];
  v5 = [(PUCropToolController *)self view];
  [v21 locationInView:v5];
  v6 = objc_msgSend(v4, "hitTest:withEvent:", 0);

  v7 = [(PUCropToolController *)self rotateButton];
  LODWORD(v5) = [v6 isEqual:v7];

  if (v5)
  {
    uint64_t v8 = [(PUCropToolController *)self rotateButton];
LABEL_7:
    v13 = (void *)v8;
    goto LABEL_8;
  }
  v9 = [(PUCropToolController *)self aspectButton];
  int v10 = [v6 isEqual:v9];

  if (v10)
  {
    uint64_t v8 = [(PUCropToolController *)self aspectButton];
    goto LABEL_7;
  }
  v11 = [(PUCropToolController *)self autoButton];
  int v12 = [v6 isEqual:v11];

  if (v12)
  {
    uint64_t v8 = [(PUCropToolController *)self autoButton];
    goto LABEL_7;
  }
  v13 = 0;
LABEL_8:
  uint64_t v14 = [v21 state];
  if ((unint64_t)(v14 - 1) < 2)
  {
    if (v13)
    {
      id v15 = objc_alloc(MEMORY[0x1E4FB13E0]);
      v16 = [v13 titleLabel];
      v17 = [v16 text];
      v18 = [v13 imageView];
      v19 = [v18 image];
      v20 = objc_msgSend(v15, "initWithTitle:image:imageInsets:scaleImage:", v17, v19, 1, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

      if (v20) {
        [(PUCropToolController *)self _showAccessibilityHUDItem:v20];
      }
      else {
        [(PUCropToolController *)self _dismissAccessibilityHUD];
      }

      goto LABEL_19;
    }
    goto LABEL_15;
  }
  if (v14 != 3)
  {
LABEL_15:
    [(PUCropToolController *)self _dismissAccessibilityHUD];
    goto LABEL_19;
  }
  if (v13)
  {
    [(PUCropToolController *)self _dismissAccessibilityHUD];
    objc_msgSend(v13, "pu_sendActionForControlEventsWithHighlightTimeout:", 64);
  }
LABEL_19:
}

- (void)_preferredContentSizeCategoryChanged
{
  id v4 = [(PUCropToolController *)self accessibilityLongPressGestureRecognizer];
  int v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  v3 = [v2 preferredContentSizeCategory];
  [v4 setEnabled:UIContentSizeCategoryIsAccessibilityCategory(v3)];
}

- (id)adjustmentsRenderer:(id)a3
{
  id v4 = [(PUPhotoEditToolController *)self delegate];
  v5 = [v4 toolControllerMainRenderer:self];

  return v5;
}

- (void)adjustmentsDataChanged:(id)a3
{
}

- (void)cropAspectFlipperView:(id)a3 cropOrientationSelected:(int64_t)a4
{
  v6 = [(PUCropToolController *)self cropAspect];

  if (v6)
  {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    v7 = [(PUCropToolController *)self cropAspect];
    uint64_t v8 = [v7 inverseAspect];
    [(PUCropToolController *)self _setCropAspect:v8 animated:1];

    v9 = PULocalizedString(@"PHOTOEDIT_CROP_ORIENTATION_ACTION_TITLE");
    [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v9];
  }
  [(PUCropToolController *)self updateCropAspectRatioOrientation:a4];
}

- (void)cropAspectController:(id)a3 cropAspectSelected:(id)a4
{
  id v7 = a4;
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  [(PUCropToolController *)self _setCropAspect:v7 animated:1];
  v5 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_ACTION_TITLE");
  [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v5];

  if (v7) {
    uint64_t v6 = [v7 isFreeformCrop] ^ 1;
  }
  else {
    uint64_t v6 = 0;
  }
  [(PUCropToolController *)self _userChangedAspectRatioLocked:v6];
  [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
}

- (int64_t)toolControllerTag
{
  return 1005;
}

- (void)_cropToggleTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropToolController.m", 3285, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  [(PUCropToolController *)self _toggleCropAndPerspective];
}

- (void)_aspectButtonTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PUCropToolController.m", 3243, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  id v7 = [(PUPhotoEditToolController *)self delegate];
  [v7 toolControllerOriginalOrientedImageSize:self];
  double v9 = v8;
  double v11 = v10;

  [(PUCropToolController *)self viewCropRect];
  if (self->_cropAspectViewController)
  {
    [(PUCropToolController *)self _closeAspectRatioPicker];
  }
  else
  {
    double v14 = v12;
    double v15 = v13;
    v16 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v17 = [v16 currentLayoutStyle];

    int64_t v18 = [(PUPhotoEditToolController *)self layoutOrientation];
    BOOL v19 = v17 != 4 && v18 != 1;
    v20 = [PUCropAspectViewController alloc];
    id v21 = [(PUCropToolController *)self cropAspect];
    v22 = [(PUPhotoEditToolController *)self toolControllerSpec];
    v23 = -[PUCropAspectViewController initWithLayoutOrientation:originalSize:currentSize:currentCropAspect:spec:](v20, "initWithLayoutOrientation:originalSize:currentSize:currentCropAspect:spec:", v19, v21, v22, v9, v11, v14, v15);
    cropAspectViewController = self->_cropAspectViewController;
    self->_cropAspectViewController = v23;

    [(PUCropAspectViewController *)self->_cropAspectViewController setDelegate:self];
    [(PUCropToolController *)self addChildViewController:self->_cropAspectViewController];
    v25 = [(PUCropToolController *)self view];
    v26 = [(PUCropAspectViewController *)self->_cropAspectViewController view];
    [v25 addSubview:v26];

    if (v17 == 4)
    {
      BOOL v27 = 0;
    }
    else
    {
      BOOL v27 = v18 != 1;
      v28 = [(PUCropToolController *)self adjustmentPickerView];
      [v28 setHidden:1];

      v29 = [(PUCropToolController *)self badgeView];
      [v29 setHidden:1];
    }
    v30 = [[PUCropAspectFlipperView alloc] initWithLayoutOrientation:v27];
    cropAspectFlipperView = self->_cropAspectFlipperView;
    self->_cropAspectFlipperView = v30;

    [(PUCropAspectFlipperView *)self->_cropAspectFlipperView setDelegate:self];
    if (v17 == 4)
    {
      v33 = self->_cropAspectFlipperView;
      v34 = [(PUCropToolController *)self cropAspectViewController];
      [v34 setScrollExtraLeftView:v33];
    }
    else
    {
      v32 = [(PUCropToolController *)self view];
      [v32 addSubview:self->_cropAspectFlipperView];
    }
  }
  [(PUCropAspectFlipperView *)self->_cropAspectFlipperView setAspectRatioOrientation:[(PUCropAspectViewController *)self->_cropAspectViewController aspectOrientation]];
  [(PUCropToolController *)self _updateCropToggleButton];
  [(PUCropToolController *)self _updateCropActionButtons];
}

- (void)_closeAspectRatioPicker
{
  cropAspectViewController = self->_cropAspectViewController;
  if (cropAspectViewController)
  {
    [(PUCropAspectViewController *)cropAspectViewController removeFromParentViewController];
    id v4 = [(PUCropAspectViewController *)self->_cropAspectViewController view];
    [v4 removeFromSuperview];

    id v5 = self->_cropAspectViewController;
    self->_cropAspectViewController = 0;

    [(PUCropToolController *)self _invalidateConstraintsForKey:@"PUCropToggleConstraints"];
    uint64_t v6 = [(PUCropToolController *)self adjustmentPickerView];
    [v6 setHidden:0];

    id v7 = [(PUCropToolController *)self badgeView];
    [v7 setHidden:0];

    [(PUCropAspectFlipperView *)self->_cropAspectFlipperView removeFromSuperview];
    cropAspectFlipperView = self->_cropAspectFlipperView;
    self->_cropAspectFlipperView = 0;
  }
}

- (void)_gridButtonTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropToolController.m", 3220, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  [(PUCropToolController *)self setGridVisible:[(PUCropToolController *)self gridVisible] ^ 1];
  id v8 = [(PUCropToolController *)self cropOverlayView];
  objc_msgSend(v8, "setCropGridVisible:animated:", -[PUCropToolController gridVisible](self, "gridVisible"), 1);
}

- (void)_flipButtonTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropToolController.m", 3210, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  [(PUCropToolController *)self _performGeometryChange:&__block_literal_global_335 animated:1];
  [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
}

uint64_t __42__PUCropToolController__flipButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  return [a2 flipHorizontally];
}

- (void)_rotateButtonTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropToolController.m", 3205, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  [(PUCropToolController *)self _rotateByApplyingOrientation:8];
}

- (void)_rotateByApplyingOrientation:(int64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PUCropToolController__rotateByApplyingOrientation___block_invoke;
  v4[3] = &__block_descriptor_40_e25_v16__0__PLImageGeometry_8l;
  v4[4] = a3;
  [(PUCropToolController *)self _performGeometryChange:v4 animated:1];
  [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
  [(PUCropToolController *)self _updateAspectRatioControls];
}

uint64_t __53__PUCropToolController__rotateByApplyingOrientation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 applyOrientation:*(void *)(a1 + 32)];
}

- (void)rotateAssetsClockwise:(id)a3
{
}

- (void)rotateAssetsCounterclockwise:(id)a3
{
}

- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3
{
}

- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3
{
  [(PUCropToolController *)self _loadCropSuggestionIfNeeded];
  [(PUCropToolController *)self _loadPerspectiveSuggestionIfNeeded];
  [(PUCropToolController *)self _updateCropToggleButtonMode];
  [(PUCropToolController *)self _updateCropToggleButton];
}

- (id)toolActionsForMenu
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PUCropToolController *)self cropAspect];
  id v4 = v3;
  id v5 = @"lock.fill";
  uint64_t v6 = @"PHOTOEDIT_CROP_MENU_LOCK_ASPECT_RATIO";
  if (v3 && ![v3 isFreeformCrop])
  {
    uint64_t v6 = @"PHOTOEDIT_CROP_MENU_UNLOCK_ASPECT_RATIO";
    id v5 = @"lock.open.fill";
  }
  id v7 = PULocalizedString(v6);
  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:v5];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__PUCropToolController_toolActionsForMenu__block_invoke;
  v12[3] = &unk_1E5F2ADC0;
  v12[4] = self;
  double v9 = [MEMORY[0x1E4FB13F0] actionWithTitle:v7 image:v8 identifier:0 handler:v12];
  v13[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];

  return v10;
}

uint64_t __42__PUCropToolController_toolActionsForMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _aspectLockButtonTapped];
}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (id)trailingToolbarViews
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v2 = [(PUCropToolController *)self aspectButton];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)leadingToolbarViews
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PUCropToolController *)self flipButton];
  v7[0] = v3;
  id v4 = [(PUCropToolController *)self rotateButton];
  v7[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];

  return v5;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (void)didResignActiveTool
{
  [(PUCropToolController *)self setModelLoadingSuspended:0];
  [(PUCropToolController *)self setContentViewsHidden:0];
  id v3 = [(PUCropToolController *)self cropView];
  [v3 setAutoloopComposition:0];
}

- (void)handleResigningCropTool
{
  if ([(PUCropToolController *)self _needsRecomposeCropRect])
  {
    id v3 = [(PUCropToolController *)self cropView];
    [(PUCropToolController *)self viewCropRect];
    objc_msgSend(v3, "setImageCropRectFromViewCropRect:animated:", 0);

    [(NUCropModel *)self->_cropModel cropRect];
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
    if (CGRectIsEmpty(v23))
    {
      id v8 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "Crop model rect is empty in [PUCropToolController handleResigningCropTool]", buf, 2u);
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __47__PUCropToolController_handleResigningCropTool__block_invoke;
      v22[3] = &__block_descriptor_64_e36_v16__0__PICropAdjustmentController_8l;
      *(CGFloat *)&v22[4] = x;
      *(CGFloat *)&v22[5] = y;
      *(CGFloat *)&v22[6] = width;
      *(CGFloat *)&v22[7] = height;
      [(PUCropToolController *)self _performLocalCropModelChanges:v22];
    }
  }
  double v9 = [(PUPhotoEditToolController *)self compositionController];
  double v10 = [v9 cropAdjustmentController];

  [v10 cropRect];
  if (v12 < 1.0 || v11 < 1.0)
  {
    double v14 = [(PUPhotoEditToolController *)self compositionController];
    double v15 = [MEMORY[0x1E4F8A748] adjustmentConstants];
    v16 = [v15 PICropAdjustmentKey];
    [v14 removeAdjustmentWithKey:v16];
  }
  else if ([v10 enabled])
  {
    uint64_t v17 = [(PUPhotoEditToolController *)self compositionController];
    int64_t v18 = [MEMORY[0x1E4F8A748] adjustmentConstants];
    BOOL v19 = [v18 PICropAdjustmentKey];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__PUCropToolController_handleResigningCropTool__block_invoke_319;
    v20[3] = &unk_1E5F28E10;
    v20[4] = self;
    [v17 modifyAdjustmentWithKey:v19 modificationBlock:v20];
  }
}

uint64_t __47__PUCropToolController_handleResigningCropTool__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "setCropRect:", a1[4], a1[5], a1[6], a1[7]);
}

void __47__PUCropToolController_handleResigningCropTool__block_invoke_319(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 cropRect];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1440), "integralCropRect:");
  objc_msgSend(v3, "setCropRect:");
}

- (void)prepareForSave:(BOOL)a3
{
  if (a3) {
    [(PUCropToolController *)self handleResigningCropTool];
  }
}

- (void)willResignActiveTool
{
  [(PUCropToolController *)self setModelLoadingSuspended:1];
  [(PUCropToolController *)self setActiveTool:0];
  [(PUCropToolController *)self _updatePreviewViewInsets];
  [(PUCropToolController *)self _closeAspectRatioPicker];
  id v3 = [(PUPhotoEditToolController *)self compositionController];
  id v4 = [v3 composition];
  id v5 = (void *)[v4 copy];
  [(PUCropToolController *)self setLastKnownComposition:v5];

  [(PUCropToolController *)self setContentViewsHidden:1];
  uint64_t v6 = [(PUCropToolController *)self rotateSnapshotView];
  [v6 removeFromSuperview];

  [(PUCropToolController *)self setRotateSnapshotView:0];
  [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
  [(PUCropToolController *)self handleResigningCropTool];
  id v7 = [(PUCropToolController *)self cropView];
  id v8 = [v7 videoMediaView];
  double v9 = [v8 player];

  [v9 pause];
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  if (v9)
  {
    [v9 currentTime];
    if (BYTE12(v17))
    {
      double v10 = [(PUPhotoEditToolController *)self delegate];
      double v11 = [v10 mediaView];
      double v12 = [v11 player];
      long long v15 = v17;
      uint64_t v16 = v18;
      [v12 seekToTime:&v15 exact:1 forceSeek:1];
    }
  }
  double v13 = [(PUCropToolController *)self cropView];
  [v13 tearDownMediaViewAndLayers];

  double v14 = [(PUCropToolController *)self badgeView];
  [v14 setAlpha:0.0];
}

- (void)didBecomeActiveTool
{
  [(PUCropToolController *)self setActiveTool:1];
  if ([(PUCropToolController *)self needsMediaLoad]) {
    [(PUCropToolController *)self _loadMediaIfNeeded];
  }
  else {
    [(PUCropToolController *)self _installRenderedImageAndDisplayIfNeeded];
  }
  v3.receiver = self;
  v3.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v3 didBecomeActiveTool];
}

- (void)_installRenderedImageAndDisplayIfNeeded
{
  objc_super v3 = [(PUCropToolController *)self image];
  if (v3)
  {
    if (![(PUCropToolController *)self isActiveTool]
      || [(PUCropToolController *)self needsMediaLoad])
    {
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v6 = [(PUCropToolController *)self cropOverlayView];
    [v6 setMaskedContentVisible:0];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PUCropToolController__installRenderedImageAndDisplayIfNeeded__block_invoke;
    void v7[3] = &unk_1E5F2D898;
    objc_copyWeak(&v8, &location);
    [(PUCropToolController *)self _setContentViewsHidden:0 animated:1 completion:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  id v4 = [(PUPhotoEditToolController *)self delegate];
  if (![v4 isStandardVideo] || !-[PUCropToolController isActiveTool](self, "isActiveTool"))
  {

    goto LABEL_10;
  }
  BOOL v5 = [(PUCropToolController *)self needsMediaLoad];

  if (!v5) {
    goto LABEL_8;
  }
LABEL_10:
}

void __63__PUCropToolController__installRenderedImageAndDisplayIfNeeded__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWantsPreviewViewHidden:1];
  int v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 toolControllerDidChangeWantsDefaultPreviewView:v3];

  [WeakRetained _updateCropToggleButton];
  [WeakRetained _performInitialAction];
}

- (void)_performInitialAction
{
  if ([(PUCropToolController *)self initialAction] == 1)
  {
    [(PUCropToolController *)self rotateAssetsCounterclockwise:0];
  }
  else if ([(PUCropToolController *)self initialAction] == 2)
  {
    [(PUCropToolController *)self rotateAssetsClockwise:0];
  }
  [(PUCropToolController *)self setInitialAction:0];
}

- (void)reactivate
{
  if (self->_aspectButton) {
    -[PUCropToolController _aspectButtonTapped:](self, "_aspectButtonTapped:");
  }
}

- (void)willBecomeActiveTool
{
  v13.receiver = self;
  v13.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v13 willBecomeActiveTool];
  [(PUCropToolController *)self setNeedsModelLoad:1];
  id v3 = [(PUCropToolController *)self lastKnownComposition];
  if (v3)
  {
    id v4 = [(PUPhotoEditToolController *)self compositionController];
    BOOL v5 = [(PUCropToolController *)self lastKnownComposition];
    int v6 = [v4 isEqual:v5 visualChangesOnly:1] ^ 1;
  }
  else
  {
    int v6 = 0;
  }

  id v7 = [(PUPhotoEditToolController *)self compositionController];
  id v8 = [v7 adjustmentControllerForKey:*MEMORY[0x1E4F8A498]];

  if (v8)
  {
    uint64_t v9 = [v8 enabled];
  }
  else
  {
    double v10 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v9 = [v10 hasLoopingVideoAdjustment];
  }
  double v11 = [(PUCropToolController *)self cropView];
  [v11 setMuted:v9];

  if (v6) {
    [(PUCropToolController *)self setNeedsImageLoad:1];
  }
  [(PUCropToolController *)self setNeedsMediaLoad:1];
  [(PUCropToolController *)self _loadImageIfNeededWithCompletion:0];
  double v12 = [(PUPhotoEditToolController *)self valuesCalculator];
  [v12 precomputeGeometricValues];

  [(PUCropToolController *)self setWantsPreviewViewHidden:0];
  [(PUCropToolController *)self setContentViewsHidden:1];
}

- (BOOL)canBecomeActiveTool
{
  return 1;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(PUPhotoEditToolController *)self layoutOrientation];
  v28.receiver = self;
  v28.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v28 setLayoutOrientation:a3 withTransitionCoordinator:v6];
  if (v7 != a3)
  {
    if ([(PUCropToolController *)self isViewLoaded])
    {
      id v8 = [(PUCropToolController *)self view];
    }
    else
    {
      id v8 = 0;
    }
    uint64_t v9 = [(PUCropToolController *)self rotateButton];
    uint64_t v10 = [(PUCropToolController *)self aspectButton];
    if (v8 && [(PUCropToolController *)self isActiveTool] && v9 | v10)
    {
      [(PUCropToolController *)self setRotateButton:0];
      [(PUCropToolController *)self setAspectButton:0];
      [(PUCropToolController *)self _invalidateConstraintsForKey:@"PUCropActionButtonConstraints"];
      [(PUCropToolController *)self _updateCropActionButtons];
      if (v6)
      {
        [v8 layoutIfNeeded];
        double v11 = [(PUCropToolController *)self rotateButton];
        [v11 setAlpha:0.0];

        double v12 = [(PUCropToolController *)self aspectButton];
        [v12 setAlpha:0.0];

        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
        v24[3] = &unk_1E5F24870;
        id v25 = (id)v9;
        id v26 = (id)v10;
        BOOL v27 = self;
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
        v21[3] = &unk_1E5F28AE8;
        id v22 = v25;
        id v23 = v26;
        [v6 animateAlongsideTransition:v24 completion:v21];
      }
      else
      {
        [(id)v9 removeFromSuperview];
        [(id)v10 removeFromSuperview];
      }
    }
    objc_super v13 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v14 = [v13 currentLayoutStyle];

    long long v15 = [(PUCropToolController *)self cropAspectViewController];

    uint64_t v16 = [(PUCropToolController *)self adjustmentPickerView];
    long long v17 = v16;
    if (!v15 || v14 == 4)
    {
      [v16 setHidden:0];

      uint64_t v18 = [(PUCropToolController *)self badgeView];
      BOOL v19 = v18;
      uint64_t v20 = 0;
    }
    else
    {
      [v16 setHidden:1];

      uint64_t v18 = [(PUCropToolController *)self badgeView];
      BOOL v19 = v18;
      uint64_t v20 = 1;
    }
    [v18 setHidden:v20];

    [(PUCropToolController *)self _invalidateConstraintsForKey:@"PUCropCanvasConstraints"];
    [(PUCropToolController *)self _invalidateConstraintsForKey:@"PUCropTiltControlConstraints"];
    [(PUCropToolController *)self _invalidateConstraintsForKey:@"PUCropToggleConstraints"];
    [(PUCropToolController *)self setNeedsModelLoad:1];
    [v8 setNeedsUpdateConstraints];
  }
}

void __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(id *a1)
{
  [a1[4] setAlpha:0.0];
  [a1[5] setAlpha:0.0];
  int v2 = [a1[6] rotateButton];
  [v2 setAlpha:1.0];

  id v3 = [a1[6] aspectButton];
  [v3 setAlpha:1.0];
}

uint64_t __71__PUCropToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  int v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  if (self->_contentViewsHidden != v6)
  {
    self->_contentViewsHidden = v6;
    [(PUCropToolController *)self setContentViewsHiddenAnimationCount:[(PUCropToolController *)self contentViewsHiddenAnimationCount] + 1];
    double v9 = (double)!v6;
    double v10 = 0.0;
    if (v5) {
      double v11 = 0.3;
    }
    else {
      double v11 = 0.0;
    }
    double v12 = [(PUCropToolController *)self cropAspect];
    objc_super v13 = v12;
    if (v12)
    {
      if ([v12 isFreeformCrop]) {
        double v10 = 0.0;
      }
      else {
        double v10 = (double)!v6;
      }
    }
    uint64_t v14 = [(PUCropToolController *)self cropOverlayView];
    [v14 setAlpha:v9];

    long long v15 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke;
    v18[3] = &unk_1E5F2A1D0;
    v18[4] = self;
    *(double *)&v18[5] = v9;
    *(double *)&v18[6] = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke_2;
    v16[3] = &unk_1E5F2E930;
    v16[4] = self;
    id v17 = v8;
    [v15 animateWithDuration:6 delay:v18 options:v16 animations:v11 completion:0.0];
  }
}

void __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) cropView];
  [v2 setAlpha:*(double *)(a1 + 40)];

  [*(id *)(*(void *)(a1 + 32) + 1240) setAlpha:*(double *)(a1 + 40)];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "cropHandleViewsByHandle", 0);
  id v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v8++) setAlpha:*(double *)(a1 + 40)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  double v9 = +[PUPhotoEditProtoSettings sharedInstance];
  int v10 = [v9 maintainCropAspectLockState];

  if (v10)
  {
    double v11 = *(double *)(a1 + 48);
    double v12 = [*(id *)(a1 + 32) aspectRatioLockButton];
    [v12 setAlpha:v11];
  }
  double v13 = *(double *)(a1 + 40);
  uint64_t v14 = [*(id *)(a1 + 32) videoScrubberView];
  [v14 setAlpha:v13];

  double v15 = *(double *)(a1 + 40);
  uint64_t v16 = [*(id *)(a1 + 32) playPauseButton];
  [v16 setAlpha:v15];
}

uint64_t __67__PUCropToolController__setContentViewsHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setContentViewsHiddenAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "contentViewsHiddenAnimationCount") - 1);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_setContentViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setContentViewsHidden:(BOOL)a3
{
}

- (void)decreaseSliderValue:(BOOL)a3
{
}

- (void)increaseSliderValue:(BOOL)a3
{
}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  if (self->_aspectButton)
  {
    cropAspectViewController = self->_cropAspectViewController;
    BOOL v4 = a3 != 7;
    BOOL v5 = cropAspectViewController == 0;
    if (cropAspectViewController) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = a3 == 6;
    }
    if (v5) {
      BOOL v4 = 1;
    }
    if (v6 || !v4) {
      -[PUCropToolController _aspectButtonTapped:](self, "_aspectButtonTapped:");
    }
  }
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUCropToolController *)self adjustmentsViewController];
  id v21 = v5;
  if (v3)
  {
    if ([(PUCropToolController *)self isTrackingAdjustmentControl])
    {
      [v21 hideUnselectedAdjustments:1];
      BOOL v6 = [v21 view];
      uint64_t v7 = v6;
      double v8 = 1.0;
    }
    else
    {
      BOOL v6 = [v21 view];
      uint64_t v7 = v6;
      double v8 = 0.0;
    }
    [v6 setAlpha:v8];

    double v13 = [(PUCropToolController *)self playPauseButton];
    uint64_t v14 = v13;
    double v15 = 0.0;
  }
  else
  {
    [v5 hideUnselectedAdjustments:0];
    double v9 = [v21 view];
    [v9 setAlpha:1.0];

    int v10 = [(PUCropToolController *)self videoScrubberView];
    [v10 alpha];
    double v12 = v11;

    if (v12 <= 0.0) {
      goto LABEL_9;
    }
    double v13 = [(PUCropToolController *)self playPauseButton];
    uint64_t v14 = v13;
    double v15 = 1.0;
  }
  [v13 setAlpha:v15];

LABEL_9:
  uint64_t v16 = [(PUCropToolController *)self cropAspect];
  long long v17 = v16;
  if (v16) {
    int v18 = [v16 isFreeformCrop];
  }
  else {
    int v18 = 1;
  }
  double v19 = (double)((v3 | v18) ^ 1u);
  long long v20 = [(PUCropToolController *)self aspectRatioLockButton];
  [v20 setAlpha:v19];
}

- (BOOL)wantsSliderKeyControl
{
  return 1;
}

- (BOOL)supportsPreviewingOriginal
{
  return 0;
}

- (BOOL)handlesMediaViewInsets
{
  return 1;
}

- (BOOL)handlesVideoPlaying
{
  return 1;
}

- (BOOL)suppressesEditUpdates
{
  return 1;
}

- (BOOL)wantsDefaultPreviewView
{
  return ![(PUCropToolController *)self wantsPreviewViewHidden];
}

- (id)localizedResetToolActionTitle
{
  return PULocalizedString(@"PHOTOEDIT_RESET_CROP");
}

- (BOOL)canResetToDefaultValue
{
  BOOL v3 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v4 = [v3 cropAdjustmentController];

  if (v4)
  {
    BOOL v5 = [(PUCropToolController *)self cropModel];
    [v5 masterImageSize];
    if (objc_msgSend(v4, "isCropIdentityForImageSize:")) {
      char v6 = 0;
    }
    else {
      char v6 = [v4 enabled];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(@"PHOTOEDIT_CROP_AND_ROTATE_TOOLBAR_BUTTON_AX_LABEL");
}

- (id)selectedToolbarIconGlyphName
{
  return @"crop.rotate";
}

- (id)toolbarIconGlyphName
{
  return @"crop.rotate";
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_CROP_TOOL_BUTTON");
}

- (void)prepareForToolTransitionWithCompletion:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(PUPhotoEditToolController *)self delegate];
  int v5 = [v4 isStandardVideo];

  if (v5) {
    [(PUCropToolController *)self basePhotoInvalidated];
  }
  [(PUCropToolController *)self _loadImageIfNeededWithCompletion:v6];
}

- (void)cropTransformedImageView:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4
{
}

- (void)cropTransformedImageViewDidEndTracking:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  BOOL v4 = [(PUCropToolController *)self cropOverlayView];
  [(PUCropToolController *)self viewCropRect];
  objc_msgSend(v4, "setCropRect:");

  int v5 = [(PUCropToolController *)self cropView];
  [(NUCropModel *)self->_cropModel cropRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(PUCropToolController *)self viewCropRect];
  objc_msgSend(v5, "setModelCropRect:viewCropRect:", v7, v9, v11, v13, v14, v15, v16, v17);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __63__PUCropToolController_cropTransformedImageViewDidEndTracking___block_invoke;
  v19[3] = &unk_1E5F28E10;
  v19[4] = self;
  [(PUCropToolController *)self _performLocalCropModelChanges:v19];
  if ([(PUCropToolController *)self wasLoadingStateFromModelWhenTrackingBegan])
  {
    [(PUCropToolController *)self setWasLoadingStateFromModelWhenTrackingBegan:0];
  }
  else
  {
    int v18 = PULocalizedString(@"PHOTOEDIT_CROP_GENERIC_ACTION_TITLE");
    [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v18];
  }
  [(PUCropToolController *)self _updateCropViewsForInteraction];
  [(PUCropToolController *)self resetToolLabelHidingTimer];
}

void __63__PUCropToolController_cropTransformedImageViewDidEndTracking___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 1440);
  id v3 = a2;
  [v2 cropRect];
  objc_msgSend(v3, "setCropRect:");
}

- (void)cropTransformedImageViewDidTrack:(id)a3
{
  int v5 = [(PUPhotoEditToolController *)self compositionController];

  if (!v5)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PUCropToolController.m" lineNumber:2701 description:@"Need a composition to perform this operation"];
  }
  if (![(PUCropToolController *)self ignoreTrackingUpdates])
  {
    if ([(PUCropToolController *)self isActiveTool])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __57__PUCropToolController_cropTransformedImageViewDidTrack___block_invoke;
      void v7[3] = &unk_1E5F28E10;
      void v7[4] = self;
      [(PUCropToolController *)self _performLocalCropModelChanges:v7];
      [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
      [(PUCropToolController *)self setHasAppliedPerspectiveSuggestion:0];
    }
  }
}

void __57__PUCropToolController_cropTransformedImageViewDidTrack___block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 1440);
  id v3 = a2;
  [v2 cropRect];
  objc_msgSend(v3, "setCropRect:");
}

- (void)cropTransformedImageViewWillBeginTracking:(id)a3
{
  [(PUCropToolController *)self viewCropRect];
  double v8 = v7;
  if (v5 > 1.0 && v6 > 1.0)
  {
    double v10 = v4;
    double v11 = v5;
    double v12 = v6;
    if ([(PUCropToolController *)self _needsRecomposeCropRect])
    {
      double v13 = [(PUCropToolController *)self cropView];
      objc_msgSend(v13, "setImageCropRectFromViewCropRect:animated:", 1, v8, v10, v11, v12);

      double v14 = [(PUCropToolController *)self cropView];
      [(NUCropModel *)self->_cropModel cropRect];
      objc_msgSend(v14, "setModelCropRect:viewCropRect:");
    }
  }
  if ([(PUCropToolController *)self loadingStateFromModel]) {
    [(PUCropToolController *)self setWasLoadingStateFromModelWhenTrackingBegan:1];
  }
  else {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
  }
  [(PUCropToolController *)self _updateCropViewsForInteraction];
  [(PUCropToolController *)self _showGridAndCancelDelayedHide];
  [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
  [(PUCropToolController *)self showVideoScrubber:0];
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)mediaTimelineControlViewDidEndChanging:(id)a3
{
  [(PUCropToolController *)self setIsScrubbingVideo:0];
  if ([(PUCropToolController *)self wasPlayingBeforeBeginningToScrubVideo])
  {
    double v4 = +[PUPhotoEditProtoSettings sharedInstance];
    int v5 = [v4 pauseAfterMovingPlayhead];

    if (v5)
    {
      double v6 = [(PUCropToolController *)self playPauseButton];
      double v7 = v6;
      uint64_t v8 = 0;
    }
    else
    {
      double v9 = [(PUCropToolController *)self cropView];
      double v10 = [v9 videoMediaView];
      double v11 = [v10 player];
      [v11 play];

      double v6 = [(PUCropToolController *)self playPauseButton];
      double v7 = v6;
      uint64_t v8 = 1;
    }
    [v6 setSelected:v8];
  }
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
}

- (void)mediaTimelineControlViewDidChangeValue:(id)a3
{
  id v4 = a3;
  int v5 = [(PUCropToolController *)self cropView];
  double v6 = [v5 videoMediaView];
  double v7 = [v6 player];

  if (!v7)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
LABEL_5:
    int32_t v8 = 600;
    goto LABEL_6;
  }
  [v7 currentTime];
  int32_t v8 = v18;
  if (!v18) {
    goto LABEL_5;
  }
LABEL_6:
  memset(&v16, 0, sizeof(v16));
  [v4 currentValue];
  CMTimeMakeWithSeconds(&v16, v9, v8);
  memset(&v15, 0, sizeof(v15));
  [v4 minValue];
  float v11 = v10;

  CMTimeMakeWithSeconds(&v15, v11, v8);
  if (v16.flags & 1) != 0 && (v15.flags)
  {
    memset(&v14, 0, sizeof(v14));
    CMTime lhs = v16;
    CMTime v12 = v15;
    CMTimeSubtract(&v14, &lhs, &v12);
    CMTime lhs = v14;
    [v7 seekToTime:&lhs exact:0];
  }
}

- (void)mediaTimelineControlViewWillBeginChanging:(id)a3
{
  [(PUCropToolController *)self setIsScrubbingVideo:1];
  id v4 = [(PUCropToolController *)self cropView];
  int v5 = [v4 videoMediaView];
  id v7 = [v5 player];

  [v7 playbackRate];
  [(PUCropToolController *)self setWasPlayingBeforeBeginningToScrubVideo:v6 == 1.0];
  [v7 pause];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
}

- (void)showBadgeView:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __47__PUCropToolController_showBadgeView_animated___block_invoke;
    v13[3] = &unk_1E5F2E120;
    v13[4] = self;
    BOOL v14 = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v13 options:&__block_literal_global_298 animations:0.25 completion:0.0];
  }
  else
  {
    double v6 = [(PUCropToolController *)self badgeView];
    [v6 setAlpha:(double)v4];

    double v7 = (double)!v4;
    int32_t v8 = [(PUCropToolController *)self videoScrubberView];
    [v8 setAlpha:v7];

    id v12 = [(PUCropToolController *)self videoScrubberView];
    [v12 alpha];
    double v10 = v9;
    float v11 = [(PUCropToolController *)self playPauseButton];
    [v11 setAlpha:v10];
  }
}

void __47__PUCropToolController_showBadgeView_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  BOOL v4 = [*(id *)(a1 + 32) badgeView];
  [v4 setAlpha:v3];

  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = [*(id *)(a1 + 32) videoScrubberView];
  [v6 setAlpha:v5];

  id v10 = [*(id *)(a1 + 32) videoScrubberView];
  [v10 alpha];
  double v8 = v7;
  double v9 = [*(id *)(a1 + 32) playPauseButton];
  [v9 setAlpha:v8];
}

- (void)_updateVideoScrubber
{
  uint64_t v3 = [(PUCropToolController *)self videoScrubberView];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(PUCropToolController *)self isScrubbingVideo];

    if (!v5)
    {
      double v6 = [(PUCropToolController *)self cropView];
      double v7 = [v6 videoMediaView];
      double v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v10 = [(PUPhotoEditToolController *)self delegate];
        id v9 = [v10 mediaView];
      }
      memset(&v36, 0, sizeof(v36));
      float v11 = [v9 player];
      id v12 = v11;
      if (v11) {
        [v11 mediaDuration];
      }
      else {
        memset(&v36, 0, sizeof(v36));
      }

      memset(&v35, 0, sizeof(v35));
      CMTimeMake(&v35, 0, v36.timescale);
      memset(&v34, 0, sizeof(v34));
      double v13 = [v9 player];
      BOOL v14 = v13;
      if (v13) {
        [v13 currentTime];
      }
      else {
        memset(&v34, 0, sizeof(v34));
      }

      CMTime v15 = [(PUPhotoEditToolController *)self compositionController];
      CMTime v16 = [v15 trimAdjustmentController];

      if (v16)
      {
        [v16 startTime];
        if (v33)
        {
          [v16 endTime];
          if (v32)
          {
            [v16 startTime];
            CMTime v35 = time;
            [v16 endTime];
            CMTime v36 = time;
            CMTime lhs = v35;
            [(PUPhotoEditToolController *)self displayedTimeForOriginalAssetTime:&lhs];
            CMTime v35 = time;
            CMTime lhs = v36;
            [(PUPhotoEditToolController *)self displayedTimeForOriginalAssetTime:&lhs];
            CMTime v36 = time;
          }
        }
      }
      if (v35.flags & 1) != 0 && (v36.flags & 1) != 0 && (v34.flags)
      {
        CMTime lhs = v35;
        CMTime v29 = v34;
        CMTimeAdd(&time, &lhs, &v29);
        CMTime v34 = time;
        CMTime time = v35;
        float Seconds = CMTimeGetSeconds(&time);
        uint64_t v18 = [(PUCropToolController *)self videoScrubberView];
        *(float *)&double v19 = Seconds;
        [v18 setMinValue:v19];

        CMTime time = v36;
        float v20 = CMTimeGetSeconds(&time);
        id v21 = [(PUCropToolController *)self videoScrubberView];
        *(float *)&double v22 = v20;
        [v21 setMaxValue:v22];

        CMTime time = v34;
        float v23 = CMTimeGetSeconds(&time);
        v24 = [(PUCropToolController *)self videoScrubberView];
        *(float *)&double v25 = v23;
        [v24 setCurrentValue:v25];

        id v26 = [v9 player];
        if ([v26 playbackState] == 3)
        {
          CMTime time = v34;
          CMTime lhs = v36;
          BOOL v27 = CMTimeCompare(&time, &lhs) != 0;
        }
        else
        {
          BOOL v27 = 0;
        }

        objc_super v28 = [(PUCropToolController *)self playPauseButton];
        [v28 setSelected:v27];
      }
    }
  }
}

- (void)_beginObservingVideoPlayer
{
  uint64_t v3 = [(PUCropToolController *)self cropView];
  BOOL v4 = [v3 videoMediaView];
  BOOL v5 = [v4 player];

  uint64_t v6 = [(PUCropToolController *)self videoScrubberTimeObserver];
  if (!v6
    || (double v7 = (void *)v6,
        [(PUCropToolController *)self videoScrubberObservedPlayer],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v5 != v8))
  {
    id v9 = [(PUCropToolController *)self videoScrubberTimeObserver];

    if (v9)
    {
      id v10 = [(PUCropToolController *)self videoScrubberObservedPlayer];
      float v11 = [(PUCropToolController *)self videoScrubberTimeObserver];
      [v10 removeObserver:v11];
    }
    objc_initWeak(&location, self);
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    CMTime v15 = __50__PUCropToolController__beginObservingVideoPlayer__block_invoke;
    CMTime v16 = &unk_1E5F29420;
    objc_copyWeak(&v17, &location);
    id v12 = [v5 addPlaybackTimeObserver:&v13];
    -[PUCropToolController setVideoScrubberTimeObserver:](self, "setVideoScrubberTimeObserver:", v12, v13, v14, v15, v16);

    [(PUCropToolController *)self setVideoScrubberObservedPlayer:v5];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

void __50__PUCropToolController__beginObservingVideoPlayer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVideoScrubber];
}

- (void)_playPauseButtonTapped
{
  [(PUCropToolController *)self _beginObservingVideoPlayer];
  uint64_t v3 = [(PUCropToolController *)self cropView];
  BOOL v4 = [v3 videoMediaView];
  id v5 = [v4 player];

  if ([v5 playbackState] == 3) {
    [v5 pause];
  }
  else {
    [v5 play];
  }
}

- (void)createVideoScrubber
{
  uint64_t v3 = [(PUPhotoEditToolController *)self delegate];
  int v4 = [v3 isStandardVideo];

  if (v4)
  {
    id v5 = [(PUCropToolController *)self videoScrubberView];

    if (!v5)
    {
      uint64_t v6 = objc_alloc_init(PUAVKitMediaTimelineView);
      videoScrubberView = self->_videoScrubberView;
      self->_videoScrubberView = v6;

      double v8 = [(PUPhotoEditToolController *)self asset];
      int v9 = [v8 mediaSubtypes];

      double v10 = 4.0;
      if ((*(void *)&v9 & 0x100000) == 0) {
        double v10 = 1.0;
      }
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setWhiteValue:v10];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setDelegate:self];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setOverrideUserInterfaceStyle:2];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setShowsTimeLabels:1];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setPlaying:1];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView setAlpha:0.0];
      float v11 = [(PUCropToolController *)self view];
      [v11 addSubview:self->_videoScrubberView];

      id v12 = +[PUPhotoEditSupport createPlayPauseButton];
      playPauseButton = self->_playPauseButton;
      self->_playPauseButton = v12;

      objc_initWeak(&location, self);
      uint64_t v14 = self->_playPauseButton;
      CMTime v15 = (void *)MEMORY[0x1E4FB13F0];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v22 = __43__PUCropToolController_createVideoScrubber__block_invoke;
      float v23 = &unk_1E5F2E7A8;
      objc_copyWeak(&v24, &location);
      CMTime v16 = [v15 actionWithHandler:&v20];
      -[UIButton addAction:forControlEvents:](v14, "addAction:forControlEvents:", v16, 64, v20, v21, v22, v23);

      id v17 = (void *)MEMORY[0x1E4FB1618];
      [(PUAVKitMediaTimelineView *)self->_videoScrubberView whiteValue];
      uint64_t v18 = objc_msgSend(v17, "colorWithWhite:alpha:");
      [(UIButton *)self->_playPauseButton setTintColor:v18];

      double v19 = [(PUCropToolController *)self view];
      [v19 addSubview:self->_playPauseButton];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    [(PUCropToolController *)self _updateVideoScrubber];
  }
}

void __43__PUCropToolController_createVideoScrubber__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playPauseButtonTapped];
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  if (a3)
  {
    [(PUCropToolController *)self viewCropRect];
    id v6 = [(PUCropToolController *)self bestAspectRatioForWidth:(unint64_t)v4 height:(unint64_t)v5];
    [(PUCropToolController *)self _setCropAspect:v6 animated:0];
  }
  else
  {
    [(PUCropToolController *)self _setCropAspect:0 animated:0];
  }
}

- (id)bestAspectRatioForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  double v5 = [[PUCropAspect alloc] initWithWidth:(double)a3 height:(double)a4];
  id v6 = [(PUCropAspectViewController *)self->_cropAspectViewController matchingCropAspectTo:v5 ignoreFreeform:1];
  double v7 = v6;
  if (!v6) {
    id v6 = v5;
  }
  id v8 = v6;

  return v8;
}

- (void)_userChangedAspectRatioLocked:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PUCropToolController *)self aspectRatioLockButton];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(PUCropToolController *)self view];
  CMTime v15 = [(PUCropToolController *)self aspectRatioLockButton];
  CMTime v16 = [v15 superview];
  objc_msgSend(v14, "convertRect:fromView:", v16, v7, v9, v11, v13);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  if (v3) {
    double v25 = @"PHOTOEDIT_CROP_ASPECT_RATIO_LOCKED";
  }
  else {
    double v25 = @"PHOTOEDIT_CROP_ASPECT_RATIO_UNLOCKED";
  }
  id v26 = PULocalizedString(v25);
  BOOL v27 = [(PUPhotoEditToolController *)self delegate];
  [v27 transientBadgeWidthForText:v26];
  double v29 = v28;

  v45.origin.CGFloat x = v18;
  v45.origin.CGFloat y = v20;
  v45.size.CGFloat width = v22;
  v45.size.CGFloat height = v24;
  double MinX = CGRectGetMinX(v45);
  v31 = [(PUCropToolController *)self view];
  [v31 bounds];
  double v32 = (v29 + CGRectGetWidth(v46)) * 0.5;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke;
  aBlock[3] = &unk_1E5F2ECC8;
  aBlock[4] = self;
  id v33 = v26;
  id v44 = v33;
  CMTime v34 = (void (**)(void))_Block_copy(aBlock);
  CMTime v35 = v34;
  if (MinX >= v32 || !v3)
  {
    v34[2](v34);
  }
  else
  {
    v37 = (void *)MEMORY[0x1E4FB1EB0];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_2;
    v42[3] = &unk_1E5F2ED10;
    v42[4] = self;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_3;
    v40[3] = &unk_1E5F2E930;
    v40[4] = self;
    v41 = v34;
    [v37 animateWithDuration:v42 animations:v40 completion:0.2];
  }
  v38 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v39 = [NSNumber numberWithBool:v3];
  [v38 setObject:v39 forKey:@"PUPhotoEditCropAspectRatioLocked2"];
}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 flashTransientBadgeWithText:*(void *)(a1 + 40)];
}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) aspectRatioLockButton];
  [v1 setAlpha:0.0];
}

uint64_t __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_4;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v3 options:&__block_literal_global_291 animations:0.2 completion:1.5];
}

void __54__PUCropToolController__userChangedAspectRatioLocked___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) aspectRatioLockButton];
  [v1 setAlpha:1.0];
}

- (void)_aspectLockButtonTapped
{
  BOOL v3 = [(PUCropToolController *)self cropAspect];
  id v6 = v3;
  if (v3) {
    uint64_t v4 = [v3 isFreeformCrop];
  }
  else {
    uint64_t v4 = 1;
  }
  [(PUCropToolController *)self _userChangedAspectRatioLocked:v4];
  [(PUCropToolController *)self setAspectRatioLocked:v4];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1840]) initWithStyle:1];
  [v5 impactOccurred];
}

- (void)updateAspectRatioLockButton
{
  BOOL v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 maintainCropAspectLockState];

  if (v4)
  {
    double v5 = [(PUCropToolController *)self cropAspect];
    id v21 = v5;
    if (v5) {
      double v6 = (double)([v5 isFreeformCrop] ^ 1);
    }
    else {
      double v6 = 0.0;
    }
    double v7 = (void *)MEMORY[0x1E4FB1818];
    double v8 = [MEMORY[0x1E4FB1830] configurationWithPointSize:17.0];
    double v9 = [v7 systemImageNamed:@"lock.fill" withConfiguration:v8];

    double v10 = [(PUCropToolController *)self aspectRatioLockButton];
    [v10 setImage:v9 forState:0];

    double v11 = [(PUCropToolController *)self aspectRatioLockButton];
    double v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.95];
    [v11 setTintColor:v12];

    double v13 = [(PUCropToolController *)self aspectRatioLockButton];
    uint64_t v14 = [v13 layer];
    LODWORD(v15) = 1063675494;
    [v14 setShadowOpacity:v15];

    CMTime v16 = [(PUCropToolController *)self aspectRatioLockButton];
    double v17 = [v16 layer];
    objc_msgSend(v17, "setShadowOffset:", 2.0, 2.0);

    CGFloat v18 = [(PUCropToolController *)self aspectRatioLockButton];
    double v19 = [v18 layer];
    [v19 setShadowRadius:6.0];

    CGFloat v20 = [(PUCropToolController *)self aspectRatioLockButton];
    [v20 setAlpha:v6];
  }
}

- (void)updateCropAspectRatioOrientation:(int64_t)a3
{
  double v5 = [(PUCropToolController *)self cropAspect];

  if (v5)
  {
    double v6 = [(PUCropToolController *)self cropAspect];
    [v6 width];
    double v8 = v7;
    double v9 = [(PUCropToolController *)self cropAspect];
    [v9 height];
    double v11 = v10;
    double v12 = [(PUCropToolController *)self cropAspectViewController];
    objc_msgSend(v12, "setCurrentCropSize:", v8, v11);
  }
  double v13 = [(PUCropToolController *)self cropAspectViewController];
  [v13 setAspectOrientation:a3];

  uint64_t v14 = [(PUCropToolController *)self cropAspect];
  double v15 = [(PUCropToolController *)self cropAspectViewController];
  [v15 setCurrentCropAspect:v14];

  cropAspectFlipperView = self->_cropAspectFlipperView;
  [(PUCropAspectFlipperView *)cropAspectFlipperView setAspectRatioOrientation:a3];
}

- (void)_recomposeCropRectAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
  PURoundRectToPixel(v5, v6, v7, v8);
  -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v3);
  double v9 = [(PUCropToolController *)self cropView];
  [(NUCropModel *)self->_cropModel cropRect];
  objc_msgSend(v9, "setModelCropRect:viewCropRect:");

  [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
}

- (CGRect)_suggestedCropRectForImageRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(PUCropToolController *)self _cropCanvasFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  uint64_t v14 = [(PUCropToolController *)self geometry];
  int v15 = [v14 isSizeInverted];
  if (v15) {
    double v16 = height;
  }
  else {
    double v16 = width;
  }
  if (v15) {
    double height = width;
  }

  double v17 = PURectWithSizeThatFitsInRect(v16, height, v7, v9, v11, v13);
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_cropCanvasFrame
{
  id v2 = [(PUCropToolController *)self cropCanvasView];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGPoint)_pointForHandle:(unint64_t)a3 onCropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (a3 <= 5 && ((1 << a3) & 0x31) != 0)
  {
    CGFloat v9 = a4.origin.y;
  }
  else
  {
    if (a3 <= 7 && ((0xC8u >> a3) & 1) != 0) {
      double MaxY = CGRectGetMaxY(a4);
    }
    else {
      double MaxY = CGRectGetMidY(a4);
    }
    CGFloat v9 = MaxY;
  }
  if (a3 > 6 || ((0x52u >> a3) & 1) == 0)
  {
    if (a3 <= 7 && ((0xA4u >> a3) & 1) != 0)
    {
      v15.origin.CGFloat x = x;
      v15.origin.CGFloat y = y;
      v15.size.CGFloat width = width;
      v15.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v15);
    }
    else
    {
      v16.origin.CGFloat x = x;
      v16.origin.CGFloat y = y;
      v16.size.CGFloat width = width;
      v16.size.CGFloat height = height;
      double MaxX = CGRectGetMidX(v16);
    }
    CGFloat x = MaxX;
  }
  double v12 = x;
  double v13 = v9;
  result.CGFloat y = v13;
  result.CGFloat x = v12;
  return result;
}

- (CGPoint)_pointForHandle:(unint64_t)a3
{
  [(PUCropToolController *)self viewCropRect];
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a3);
  result.CGFloat y = v6;
  result.CGFloat x = v5;
  return result;
}

- (CGVector)_deltaMaskForHandle:(unint64_t)a3
{
  unint64_t v3 = a3 - 1;
  if (a3 - 1 > 6)
  {
    double v5 = 1.0;
    double v4 = 0.0;
  }
  else
  {
    double v4 = dbl_1AEFF7E50[v3];
    double v5 = dbl_1AEFF7E88[v3];
  }
  result.dCGFloat y = v5;
  result.dCGFloat x = v4;
  return result;
}

- (CGVector)_correctInputVector:(CGVector)a3 forHandle:(unint64_t)a4 onCropRect:(CGRect)a5 lockDirection:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v42 = v13;
  double v43 = v14;
  [(PUCropToolController *)self _cropCanvasFrame];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat rect = v19;
  CGFloat v21 = v20;
  CGFloat v22 = [(PUPhotoEditToolController *)self toolControllerSpec];
  [v22 minimumCropSize];
  double v24 = v23;
  double v45 = v25;

  if (a4 <= 6 && ((0x52u >> a4) & 1) != 0)
  {
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v48) - v24;
  }
  else
  {
    v49.origin.CGFloat x = v16;
    v49.origin.CGFloat y = v18;
    v49.size.CGFloat width = rect;
    v49.size.CGFloat height = v21;
    double MaxX = CGRectGetMaxX(v49);
  }
  double v41 = MaxX;
  if (a4 <= 7 && ((0xA4u >> a4) & 1) != 0)
  {
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double MinX = v24 + CGRectGetMinX(v50);
  }
  else
  {
    v51.origin.CGFloat x = v16;
    v51.origin.CGFloat y = v18;
    v51.size.CGFloat width = rect;
    v51.size.CGFloat height = v21;
    double MinX = CGRectGetMinX(v51);
  }
  double v40 = MinX;
  if (a4 <= 5 && ((1 << a4) & 0x31) != 0)
  {
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    v52.size.CGFloat width = width;
    v52.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v52) - v45;
  }
  else
  {
    v53.origin.CGFloat x = v16;
    v53.origin.CGFloat y = v18;
    v53.size.CGFloat width = rect;
    v53.size.CGFloat height = v21;
    double MaxY = CGRectGetMaxY(v53);
  }
  if (a4 <= 7 && ((0xC8u >> a4) & 1) != 0)
  {
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    double MinY = v45 + CGRectGetMinY(v54);
  }
  else
  {
    v55.origin.CGFloat x = v16;
    v55.origin.CGFloat y = v18;
    v55.size.CGFloat width = rect;
    v55.size.CGFloat height = v21;
    double MinY = CGRectGetMinY(v55);
  }
  dCGFloat x = a3.dx;
  dCGFloat y = a3.dy;
  if (v6)
  {
    double v32 = 1.0;
    double v33 = 1.0;
    double v34 = 1.0;
    if (a3.dx != 0.0)
    {
      double v33 = (v41 - v42) / a3.dx;
      double v34 = (v40 - v42) / a3.dx;
    }
    double v35 = 1.0;
    if (a3.dy != 0.0)
    {
      double v32 = (MaxY - v43) / a3.dy;
      double v35 = (MinY - v43) / a3.dy;
    }
    double v36 = fmax(v33, v34);
    double v37 = fmax(v32, v35);
    if (v36 < 1.0 || v37 < 1.0)
    {
      double v38 = fmin(v36, v37);
      dCGFloat x = a3.dx * v38;
      dCGFloat y = a3.dy * v38;
    }
  }
  else
  {
    dCGFloat x = fmax(v40, fmin(v41, a3.dx + v42)) - v42;
    dCGFloat y = fmax(MinY, fmin(MaxY, a3.dy + v43)) - v43;
  }
  double v39 = dx;
  result.dCGFloat y = dy;
  result.dCGFloat x = v39;
  return result;
}

- (CGRect)_addHeight:(double)a3 toRect:(CGRect)a4 anchorTop:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a4.size.height;
  double y = a4.origin.y;
  double MidX = CGRectGetMidX(a4);
  double v11 = height + a3;
  double v12 = [(PUCropToolController *)self cropAspect];
  [v12 widthForHeight:v11];
  double v14 = v13;

  double v15 = 0.0;
  if (!v5) {
    double v15 = a3;
  }
  double v16 = y - v15;
  double v17 = MidX + v14 * -0.5;
  double v18 = v14;
  double v19 = v11;
  result.size.double height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v16;
  result.origin.CGFloat x = v17;
  return result;
}

- (CGRect)_addWidth:(double)a3 toRect:(CGRect)a4 anchorLeft:(BOOL)a5
{
  BOOL v5 = a5;
  double width = a4.size.width;
  double x = a4.origin.x;
  double MidY = CGRectGetMidY(a4);
  double v11 = width + a3;
  double v12 = [(PUCropToolController *)self cropAspect];
  [v12 heightForWidth:v11];
  double v14 = v13;

  double v15 = 0.0;
  if (!v5) {
    double v15 = a3;
  }
  double v16 = x - v15;
  double v17 = MidY + v14 * -0.5;
  double v18 = v11;
  double v19 = v14;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_cropRectFromPanningHandle:(unint64_t)a3 byAmount:(CGVector)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  [(PUCropToolController *)self initialHandlePanCropRect];
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  if (a3 - 1 > 6) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = qword_1AEFF7E18[a3 - 1];
  }
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", a3, v6, v7, v8, v9);
  double v16 = v15;
  double v18 = v17;
  -[PUCropToolController _pointForHandle:onCropRect:](self, "_pointForHandle:onCropRect:", v14, v10, v11, v12, v13);
  double v20 = v19;
  double v22 = v21;
  double v23 = [(PUCropToolController *)self cropAspect];
  [(PUCropToolController *)self _deltaMaskForHandle:a3];
  double v25 = v12;
  double v26 = v13;
  double v28 = a4.dx * v27;
  double v29 = a4.dy * v24;
  if (v23)
  {
    double v93 = v25;
    double v94 = v26;
    double v91 = v10;
    [v23 ratio];
    if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4)
    {
      float v31 = v30 * v30 + 1.0;
      double v32 = 1.0 / sqrtf(v31);
      double v33 = v30 * v32;
      if (a3 - 5 < 2) {
        double v32 = -v32;
      }
      -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 1, v33 * (v29 * v32 + v28 * v33), v32 * (v29 * v32 + v28 * v33), v10, v11, v93, v94);
      double v35 = v34 + v16;
      double v37 = v36 + v18;
      double x = fmin(v20, v35);
      double v39 = v22;
      double y = fmin(v22, v37);
      double width = vabdd_f64(v20, v35);
      double height = vabdd_f64(v39, v37);
    }
    else
    {
      double width = v93;
      double height = v94;
      double y = v11;
      double x = v10;
      if (a3 <= 3)
      {
        -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 1, v28, v29, v10, v11, v93, v94);
        double v54 = v53;
        double v56 = v55;
        unint64_t v57 = a3 & 0xFFFFFFFFFFFFFFFBLL;
        [(PUCropToolController *)self _cropCanvasFrame];
        v58 = [(PUPhotoEditToolController *)self toolControllerSpec];
        [v58 minimumCropSize];
        uint64_t v60 = v59;
        uint64_t v62 = v61;

        if (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || ((0xC8u >> a3))
        {
          double v71 = -v56;
          if (v57) {
            double v71 = v56;
          }
          -[PUCropToolController _addHeight:toRect:anchorTop:](self, "_addHeight:toRect:anchorTop:", v57 != 0, v71, v91, v11, v93, v94);
        }
        else
        {
          double v63 = -v54;
          if (((0x52u >> a3) & 1) == 0) {
            double v63 = v54;
          }
          -[PUCropToolController _addWidth:toRect:anchorLeft:](self, "_addWidth:toRect:anchorLeft:", ((0x52u >> a3) & 1) == 0, v63, v91, v11, v93, v94);
        }
        objc_msgSend(v23, "constrainRect:boundingRect:boundingAngle:minSize:", 0, v60, v62);
        double x = v72;
        double y = v73;
        double width = v74;
        double height = v75;
        double v10 = v91;
      }
    }
    [(PUCropToolController *)self minimumViewCropRectSizeForHandleGesture];
    if (width < v76)
    {
      double v77 = v93;
      double v78 = v94;
      goto LABEL_48;
    }
    [(PUCropToolController *)self minimumViewCropRectSizeForHandleGesture];
    double v77 = v93;
    double v78 = v94;
    if (height < v79) {
      goto LABEL_48;
    }
  }
  else
  {
    -[PUCropToolController _correctInputVector:forHandle:onCropRect:lockDirection:](self, "_correctInputVector:forHandle:onCropRect:lockDirection:", a3, 0, v28, a4.dy * v24, v10, v11, v25, v26);
    double v44 = v43 + v16;
    double v46 = v45 + v18;
    [(PUCropToolController *)self minimumViewCropRectSizeForHandleGesture];
    double x = fmin(v20, v44);
    double width = vabdd_f64(v20, v44);
    double height = vabdd_f64(v22, v46);
    if (width < v47)
    {
      double v49 = v47 - width;
      if (((a3 < 7) & (0x52u >> a3)) == 0) {
        double v49 = 0.0;
      }
      double x = x - v49;
      double width = v47;
    }
    double y = fmin(v22, v46);
    if (height < v48)
    {
      BOOL v50 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 0 || a3 == 5;
      double v51 = v48 - height;
      if (!v50) {
        double v51 = 0.0;
      }
      double y = y - v51;
      double height = v48;
    }
    if (a3 <= 3)
    {
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      if ((unint64_t)(v14 - 1) > 6) {
        CGRect v52 = &unk_1F078ACB8;
      }
      else {
        CGRect v52 = (void *)qword_1E5F24698[v14 - 1];
      }
      id v64 = v52;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v95 objects:v101 count:16];
      if (v65)
      {
        uint64_t v66 = v65;
        uint64_t v67 = *(void *)v96;
        do
        {
          for (uint64_t i = 0; i != v66; ++i)
          {
            if (*(void *)v96 != v67) {
              objc_enumerationMutation(v64);
            }
            -[PUCropToolController _pointForHandle:](self, "_pointForHandle:", [*(id *)(*((void *)&v95 + 1) + 8 * i) unsignedIntegerValue]);
            v104.size.double width = vabdd_f64(v69, v44);
            v104.size.double height = vabdd_f64(v70, v46);
            v104.origin.double x = fmin(v69, v44);
            v104.origin.double y = fmin(v70, v46);
            v107.origin.double x = x;
            v107.origin.double y = y;
            v107.size.double width = width;
            v107.size.double height = height;
            CGRect v105 = CGRectUnion(v104, v107);
            double x = v105.origin.x;
            double y = v105.origin.y;
            double width = v105.size.width;
            double height = v105.size.height;
          }
          uint64_t v66 = [v64 countByEnumeratingWithState:&v95 objects:v101 count:16];
        }
        while (v66);
      }
    }
  }
  v80 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
  {
    v103.double width = width;
    v103.double height = height;
    v81 = NSStringFromCGSize(v103);
    *(_DWORD *)buf = 138412290;
    v100 = v81;
    _os_log_impl(&dword_1AE9F8000, v80, OS_LOG_TYPE_DEBUG, "_cropRectFromPanningHandle: panning rect size: %@", buf, 0xCu);
  }
  v82 = [(PUCropToolController *)self cropView];
  objc_msgSend(v82, "validateViewCropRectAgainstModelCropRect:", x, y, width, height);
  double v10 = v83;
  double v11 = v84;
  double v77 = v85;
  double v78 = v86;

LABEL_48:
  double v87 = v10;
  double v88 = v11;
  double v89 = v77;
  double v90 = v78;
  result.size.double height = v90;
  result.size.double width = v89;
  result.origin.double y = v88;
  result.origin.double x = v87;
  return result;
}

- (void)resetToolLabelHidingTimer
{
  unint64_t v3 = [(PUCropToolController *)self badgeShowingExpirationTimer];

  if (v3)
  {
    double v4 = [(PUCropToolController *)self badgeShowingExpirationTimer];
    [v4 invalidate];

    [(PUCropToolController *)self setBadgeShowingExpirationTimer:0];
  }
  objc_initWeak(&location, self);
  BOOL v5 = (void *)MEMORY[0x1E4F1CB00];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  double v9 = __49__PUCropToolController_resetToolLabelHidingTimer__block_invoke;
  double v10 = &unk_1E5F28EB0;
  objc_copyWeak(&v11, &location);
  double v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:&v7 block:1.5];
  -[PUCropToolController setBadgeShowingExpirationTimer:](self, "setBadgeShowingExpirationTimer:", v6, v7, v8, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__PUCropToolController_resetToolLabelHidingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    if ([WeakRetained toolBadgeDoesHide]) {
      [v2 showBadgeView:0 animated:1];
    }
    else {
      [v2 showVideoScrubber:1];
    }
    id WeakRetained = v2;
  }
}

- (void)showVideoScrubber:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PUCropToolController_showVideoScrubber___block_invoke;
  v3[3] = &unk_1E5F2E120;
  v3[4] = self;
  BOOL v4 = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v3 animations:0.25];
}

void __42__PUCropToolController_showVideoScrubber___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  BOOL v4 = [*(id *)(a1 + 32) videoScrubberView];
  [v4 setAlpha:v3];

  LOBYTE(v5) = *(unsigned char *)(a1 + 40);
  double v6 = (double)v5;
  id v7 = [*(id *)(a1 + 32) playPauseButton];
  [v7 setAlpha:v6];
}

- (void)showToolLabel
{
}

- (NSMutableDictionary)initialLocationsInHandlesByHandle
{
  initialLocationsInHandlesByHandle = self->_initialLocationsInHandlesByHandle;
  if (!initialLocationsInHandlesByHandle)
  {
    BOOL v4 = (void *)MEMORY[0x1E4F1CA60];
    unint64_t v5 = +[PUCropHandleView allHandles];
    objc_msgSend(v4, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    double v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_initialLocationsInHandlesByHandle;
    self->_initialLocationsInHandlesByHandle = v6;

    initialLocationsInHandlesByHandle = self->_initialLocationsInHandlesByHandle;
  }
  uint64_t v8 = initialLocationsInHandlesByHandle;
  return v8;
}

- (CGVector)_applyAspectOfCropRect:(CGRect)a3 toHandleMovement:(CGVector)a4
{
  float v4 = a3.size.height * a3.size.height + a3.size.width * a3.size.width;
  double v5 = 1.0 / sqrtf(v4);
  CGFloat v6 = a3.size.width * v5;
  CGFloat v7 = a3.size.height * v5;
  CGFloat v8 = a4.dy * (a3.size.height * v5) + a4.dx * v6;
  double v9 = v6 * v8;
  double v10 = v7 * v8;
  result.ddouble y = v10;
  result.ddouble x = v9;
  return result;
}

- (void)_handleCropHandlePan:(id)a3
{
  id v21 = a3;
  uint64_t v4 = [v21 state];
  double v5 = [(PUCropToolController *)self initialLocationsInHandlesByHandle];
  CGFloat v6 = [v21 view];
  if ((unint64_t)(v4 - 3) <= 1) {
    [(PUCropToolController *)self resetToolLabelHidingTimer];
  }
  CGFloat v7 = [(PUCropToolController *)self selectedCropHandleView];

  if (v6 == v7)
  {
    uint64_t v8 = [v6 handle];
    double v9 = [NSNumber numberWithUnsignedInteger:v8];
    double v10 = [(PUCropToolController *)self view];
    [v21 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    if (v4 == 2)
    {
      double v16 = [v5 objectForKeyedSubscript:v9];
      [v16 CGPointValue];
      double v18 = v17;
      double v20 = v19;

      -[PUCropToolController _cropRectFromPanningHandle:byAmount:](self, "_cropRectFromPanningHandle:byAmount:", v8, v12 - v18, v14 - v20);
      -[PUCropToolController setViewCropRect:](self, "setViewCropRect:");
    }
    else if (v4 == 1)
    {
      [(PUCropToolController *)self viewCropRect];
      -[PUCropToolController setInitialHandlePanCropRect:](self, "setInitialHandlePanCropRect:");
      double v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, v14);
      [v5 setObject:v15 forKeyedSubscript:v9];

      [(PUCropToolController *)self showVideoScrubber:0];
    }
    [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
    [(PUCropToolController *)self setHasAppliedPerspectiveSuggestion:0];
    [(PUCropToolController *)self _updateCropToggleButton];
  }
}

- (void)_handleTouchingGesture:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ([v4 state] == 3)
  {
    if (v5 != 1) {
      goto LABEL_11;
    }
LABEL_5:
    CGFloat v7 = [v4 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v9 = [v4 view];
      [(PUCropToolController *)self setSelectedCropHandleView:v9];
      double v10 = [(PUCropToolController *)self cropModel];
      [v10 cropRect];
      double v12 = v11;
      double v14 = v13;

      [(PUCropToolController *)self viewCropRect];
      double v16 = 2.0 / v12 * v15;
      [(PUCropToolController *)self viewCropRect];
      -[PUCropToolController setMinimumViewCropRectSizeForHandleGesture:](self, "setMinimumViewCropRectSizeForHandleGesture:", v16, 2.0 / v14 * v17);
      double v18 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        [(PUCropToolController *)self minimumViewCropRectSizeForHandleGesture];
        double v19 = NSStringFromCGSize(v27);
        int v24 = 138412290;
        double v25 = v19;
        _os_log_impl(&dword_1AE9F8000, v18, OS_LOG_TYPE_DEBUG, "minimumViewCropRectSizeForHandleGesture : %@", (uint8_t *)&v24, 0xCu);
      }
    }
    [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
    double v20 = self;
    uint64_t v21 = 1;
    goto LABEL_14;
  }
  uint64_t v6 = [v4 state];
  if (v5 == 1) {
    goto LABEL_5;
  }
  if (v6 == 4)
  {
LABEL_11:
    double v22 = [v4 view];
    double v23 = [(PUCropToolController *)self selectedCropHandleView];

    if (v22 == v23) {
      [(PUCropToolController *)self setSelectedCropHandleView:0];
    }
    [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
    double v20 = self;
    uint64_t v21 = 0;
LABEL_14:
    [(PUPhotoEditToolController *)v20 setPerformingLiveInteraction:v21];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
  }
}

- (void)_cancelDelayedRecomposeCropRect
{
}

- (void)_recomposeCropRectDelayed
{
  [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  [v3 cropRecomposeDelay];
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__autoRecomposeCropRect, 0);
}

- (void)_autoRecomposeCropRect
{
  if ([(PUCropToolController *)self _needsRecomposeCropRect])
  {
    [(PUCropToolController *)self viewCropRect];
    if (v3 >= 1.0)
    {
      [(PUCropToolController *)self viewCropRect];
      if (v4 >= 1.0)
      {
        uint64_t v5 = [(PUCropToolController *)self cropView];
        [(PUCropToolController *)self viewCropRect];
        objc_msgSend(v5, "setImageCropRectFromViewCropRect:animated:", 1);

        [(PUPhotoEditToolController *)self willModifyAdjustment];
        [(PUCropToolController *)self _recomposeCropRectAnimated:1];
        uint64_t v6 = PULocalizedString(@"PHOTOEDIT_CROP_GENERIC_ACTION_TITLE");
        [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v6];

        CGFloat v7 = [(PUCropToolController *)self cropView];
        [v7 updateLayerTransformsAnimated:1];

        [(PUCropToolController *)self _updateCropToggleButton];
      }
    }
  }
}

- (BOOL)_needsRecomposeCropRect
{
  [(PUCropToolController *)self viewCropRect];
  double v4 = v3;
  double v6 = v5;
  [(PUCropToolController *)self _cropCanvasFrame];
  double v8 = v7;
  double v10 = v9;
  UIRectGetCenter();
  double v12 = v11;
  double v14 = v13;
  UIRectGetCenter();
  double v17 = vabdd_f64(v12, v16);
  BOOL v18 = v4 < v8;
  if (v6 >= v10) {
    BOOL v18 = 0;
  }
  BOOL v19 = v17 < 2.22044605e-16;
  double v20 = vabdd_f64(v14, v15);
  if (!v19) {
    BOOL v18 = 1;
  }
  return v20 >= 2.22044605e-16 || v18;
}

- (void)_showMaskedContentAndCancelDelayedHide
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideMaskedContent object:0];
  id v3 = [(PUCropToolController *)self cropOverlayView];
  [v3 setMaskedContentVisible:1 animated:1];
}

- (void)_hideMaskedContentDelayed
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideMaskedContent object:0];
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  [v3 cropRecomposeDelay];
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideMaskedContent, 0);
}

- (void)_hideMaskedContent
{
  id v2 = [(PUCropToolController *)self cropOverlayView];
  [v2 setMaskedContentVisible:0 animated:1];
}

- (void)_showGridAndCancelDelayedHide
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideGrid object:0];
  id v3 = [(PUCropToolController *)self cropOverlayView];
  [v3 setCropGridVisible:1 animated:1];
}

- (void)_hideGridDelayed
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__hideGrid object:0];
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  [v3 cropRecomposeDelay];
  -[PUCropToolController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideGrid, 0);
}

- (void)_hideGrid
{
  if (![(PUCropToolController *)self gridVisible])
  {
    id v3 = [(PUCropToolController *)self cropOverlayView];
    [v3 setCropGridVisible:0 animated:1];
  }
}

- (void)updateViewOrdering
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(PUCropToolController *)self cropHandleViewsByHandle];
  double v4 = [v3 allValues];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * v8);
        double v10 = [(PUCropToolController *)self view];
        [v10 bringSubviewToFront:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  double v11 = [(PUCropToolController *)self view];
  double v12 = [(PUCropToolController *)self badgeView];
  [v11 bringSubviewToFront:v12];
}

- (void)_updateAspectRatioControls
{
  [(PUCropToolController *)self viewCropRect];
  if (v3 != v4) {
    [(PUCropToolController *)self updateCropAspectRatioOrientation:v3 < v4];
  }
  id v6 = [(PUCropToolController *)self cropAspect];
  uint64_t v5 = [(PUCropToolController *)self cropAspectViewController];
  [v5 setCurrentCropAspect:v6];
}

- (void)_updateCropViewsForInteraction
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUCropToolController *)self isTrackingAdjustmentControl];
  double v4 = [(PUCropToolController *)self cropOverlayView];
  [v4 setStraightenGridVisible:v3 animated:1];

  uint64_t v5 = [(PUCropToolController *)self cropView];
  if ([v5 isTracking])
  {
  }
  else
  {
    id v6 = [(PUCropToolController *)self selectedCropHandleView];

    if (!v6) {
      goto LABEL_5;
    }
  }
  [(PUCropToolController *)self _showGridAndCancelDelayedHide];
  [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
LABEL_5:
  uint64_t v7 = [(PUCropToolController *)self cropView];
  if ([v7 isTracking])
  {
LABEL_8:

LABEL_9:
    [(PUCropToolController *)self _showMaskedContentAndCancelDelayedHide];
    goto LABEL_10;
  }
  uint64_t v8 = [(PUCropToolController *)self selectedCropHandleView];
  if (v8)
  {

    goto LABEL_8;
  }
  BOOL v26 = [(PUCropToolController *)self isTrackingAdjustmentControl];

  if (v26) {
    goto LABEL_9;
  }
  BOOL v27 = [(PUCropToolController *)self canResetToDefaultValue];
  if ([(PUCropToolController *)self rotatingAnimationCount])
  {
    [(PUCropToolController *)self _hideGrid];
    [(PUCropToolController *)self _hideMaskedContent];
  }
  else
  {
    if (!v27)
    {
      double v28 = [(PUCropToolController *)self animationsByKeyPath];
      uint64_t v29 = [v28 count];

      if (v29) {
        goto LABEL_36;
      }
    }
    if ([(PUCropToolController *)self hasAppliedCropSuggestion]
      && ([(PUCropToolController *)self animationsByKeyPath],
          double v30 = objc_claimAutoreleasedReturnValue(),
          uint64_t v31 = [v30 count],
          v30,
          v31))
    {
LABEL_36:
      [(PUCropToolController *)self _showGridAndCancelDelayedHide];
      [(PUCropToolController *)self _showMaskedContentAndCancelDelayedHide];
      [(PUCropToolController *)self _cancelDelayedRecomposeCropRect];
    }
    else
    {
      if (v27 || [(PUCropToolController *)self hasAppliedCropSuggestion])
      {
        [(PUCropToolController *)self _hideGridDelayed];
        [(PUCropToolController *)self _hideMaskedContentDelayed];
      }
      else
      {
        [(PUCropToolController *)self _hideGrid];
        [(PUCropToolController *)self _hideMaskedContent];
      }
      [(PUCropToolController *)self _recomposeCropRectDelayed];
    }
  }
LABEL_10:
  uint64_t v9 = [(PUCropToolController *)self cropView];
  if ([v9 isTracking])
  {
    double v10 = [(PUCropToolController *)self cropView];
    int v11 = [v10 isDecelerating];

    if (!v11)
    {
      int v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v12 = ![(PUCropToolController *)self isTrackingAdjustmentControl];
LABEL_15:
  if ([(PUCropToolController *)self isTrackingAdjustmentControl])
  {
    BOOL v13 = 0;
  }
  else
  {
    long long v14 = [(PUCropToolController *)self selectedCropHandleView];
    BOOL v13 = v14 == 0;
  }
  long long v15 = [(PUCropToolController *)self cropView];
  [v15 setUserInteractionEnabled:v13];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v16 = [(PUCropToolController *)self cropHandleViewsByHandle];
  double v17 = [v16 allValues];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        double v22 = *(void **)(*((void *)&v32 + 1) + 8 * v21);
        double v23 = [(PUCropToolController *)self selectedCropHandleView];
        if (v22 == v23)
        {
          BOOL v25 = 1;
        }
        else
        {
          int v24 = [(PUCropToolController *)self selectedCropHandleView];
          BOOL v25 = v24 == 0;
        }
        [v22 setUserInteractionEnabled:v25 & v12];
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v19);
  }

  [(PUCropToolController *)self updateViewOrdering];
}

- (void)_updateCropToggleButton
{
  if ([(PUCropToolController *)self _hasCropSuggestion]) {
    BOOL v3 = [(PUCropToolController *)self hasAppliedCropSuggestion];
  }
  else {
    BOOL v3 = 0;
  }
  if ([(PUCropToolController *)self _hasPerspectiveSuggestion]) {
    BOOL v4 = [(PUCropToolController *)self hasAppliedPerspectiveSuggestion];
  }
  else {
    BOOL v4 = 0;
  }
  if ([(PUCropToolController *)self _hasCropSuggestion]) {
    int v5 = ![(PUCropToolController *)self hasAppliedCropSuggestion];
  }
  else {
    int v5 = 0;
  }
  if ([(PUCropToolController *)self _hasPerspectiveSuggestion]) {
    int v6 = ![(PUCropToolController *)self hasAppliedPerspectiveSuggestion];
  }
  else {
    int v6 = 0;
  }
  if ([(PUCropToolController *)self canResetToDefaultValue])
  {
    if ((v5 | v6)) {
      int v7 = 1;
    }
    else {
      int v7 = ![(PUCropToolController *)self _hasCropSuggestion];
    }
  }
  else
  {
    int v7 = 0;
  }
  int64_t v8 = [(PUCropToolController *)self autoButtonMode];
  uint64_t v9 = [(PUCropToolController *)self autoButton];
  double v10 = v9;
  BOOL v11 = v8 == 3;
  uint64_t v12 = v8 == 3;
  if (v11)
  {
    [v9 setSelected:1];

    if (v7)
    {
      uint64_t v12 = [(PUCropToolController *)self editValuesCalculatorDidFinishComputingGeometricValues] ^ 1;
      [(PUCropToolController *)self autoButtonMode];
LABEL_26:
      long long v14 = [(PUCropToolController *)self autoButton];
      long long v15 = v14;
      uint64_t v16 = 1;
      goto LABEL_28;
    }
  }
  else
  {
    [v9 setSelected:v3 | v4];
  }
  if ([(PUCropToolController *)self autoButtonMode] == 3) {
    char v13 = v7;
  }
  else {
    char v13 = 1;
  }
  if (v13) {
    goto LABEL_26;
  }
  long long v14 = [(PUCropToolController *)self autoButton];
  long long v15 = v14;
  uint64_t v16 = 0;
LABEL_28:
  [v14 setEnabled:v16];

  double v17 = [(PUCropToolController *)self autoButton];
  [v17 setHidden:v12];

  uint64_t v18 = (void *)MEMORY[0x1E4F90858];
  id v22 = [(PUCropToolController *)self autoButton];
  if ([v22 isSelected]) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 1;
  }
  uint64_t v20 = [v18 configurationWithCursorEffect:v19];
  uint64_t v21 = [(PUCropToolController *)self autoButton];
  objc_msgSend(v21, "setPx_configuration:", v20);
}

- (void)_updateCropToggleButtonMode
{
  if ([(PUCropToolController *)self _hasCropSuggestion])
  {
    uint64_t v3 = 1;
  }
  else if ([(PUCropToolController *)self _hasPerspectiveSuggestion])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = 3;
  }
  [(PUCropToolController *)self setAutoButtonMode:v3];
}

- (void)setAutoButtonMode:(int64_t)a3
{
  if (self->_autoButtonMode != a3)
  {
    self->_int64_t autoButtonMode = a3;
    if (a3 == 3) {
      BOOL v4 = @"PHOTOEDIT_CROP_AUTO_RESET";
    }
    else {
      BOOL v4 = @"PHOTOEDIT_CROP_AUTO_CROP";
    }
    int v5 = PULocalizedString(v4);
    int v6 = [v5 localizedUppercaseString];
    int v7 = [(PUCropToolController *)self autoButton];
    [v7 setTitle:v6];

    int64_t autoButtonMode = self->_autoButtonMode;
    uint64_t v9 = [(PUCropToolController *)self autoButton];
    id v16 = v9;
    if (autoButtonMode == 3)
    {
      double v10 = [v9 unselectedConfiguration];

      BOOL v11 = [MEMORY[0x1E4FB1498] clearConfiguration];
      [v10 setBackground:v11];

      uint64_t v12 = [MEMORY[0x1E4FB1618] clearColor];
      char v13 = [v10 background];
      [v13 setBackgroundColor:v12];

      [v10 setTitleTextAttributesTransformer:&__block_literal_global_21602];
      [v10 setImage:0];
      long long v14 = [(PUCropToolController *)self autoButton];
      [v14 setOverrideButtonConfiguration:v10];

      long long v15 = v10;
    }
    else
    {
      [v9 setOverrideButtonConfiguration:0];
      long long v15 = v16;
    }
  }
}

id __42__PUCropToolController_setAutoButtonMode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)[a2 mutableCopy];
  uint64_t v3 = +[PUInterfaceManager currentTheme];
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1618], "px_dynamicHighlightColor");
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

  int v5 = [v3 topToolbarToolButtonFont];
  [v2 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  return v2;
}

- (void)_updateCropActionButtons
{
  uint64_t v3 = +[PUInterfaceManager currentTheme];
  objc_initWeak(&location, self);
  if (!self->_rotateButton)
  {
    BOOL v4 = PULocalizedString(@"PHOTOEDIT_CROP_ROTATE_ACCESSIBILITY_LABEL");
    int v5 = [(PUPhotoEditToolController *)self photoEditSpec];
    int v6 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"rotate.left" selectedImageNamed:@"rotate.left.fill" accessibilityLabel:v4 spec:v5];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke;
    v32[3] = &unk_1E5F28D98;
    objc_copyWeak(&v33, &location);
    [v6 setActionBlock:v32];
    [(PUCropToolController *)self setRotateButton:v6];
    objc_destroyWeak(&v33);
  }
  if (!self->_flipButton)
  {
    int v7 = PULocalizedString(@"PHOTOEDIT_CROP_FLIP_ACCESSIBILITY_LABEL");
    int64_t v8 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v9 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"arrow.left.and.right.righttriangle.left.righttriangle.right" selectedImageNamed:@"arrow.left.and.right.righttriangle.left.righttriangle.right.fill" accessibilityLabel:v7 spec:v8];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke_2;
    v30[3] = &unk_1E5F28D98;
    objc_copyWeak(&v31, &location);
    [v9 setActionBlock:v30];
    [(PUCropToolController *)self setFlipButton:v9];
    objc_destroyWeak(&v31);
  }
  if (!self->_aspectButton)
  {
    double v10 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_ACCESSIBILITY_LABEL");
    BOOL v11 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v12 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"aspectratio" selectedImageNamed:@"aspectratio.fill" accessibilityLabel:v10 spec:v11];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __48__PUCropToolController__updateCropActionButtons__block_invoke_3;
    v28[3] = &unk_1E5F28D98;
    objc_copyWeak(&v29, &location);
    [v12 setActionBlock:v28];
    [(PUCropToolController *)self setAspectButton:v12];
    objc_destroyWeak(&v29);
  }
  if (!self->_autoButton)
  {
    char v13 = +[PUPhotoEditToolActivationButton buttonWithTitle:&stru_1F06BE7B8];
    objc_storeStrong((id *)&self->_autoButton, v13);
    [v13 setUnselectedGlyphName:@"viewfinder"];
    [v13 setSelectedGlyphName:@"viewfinder"];
    objc_initWeak(&from, self);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    int v24 = __48__PUCropToolController__updateCropActionButtons__block_invoke_4;
    BOOL v25 = &unk_1E5F28D98;
    objc_copyWeak(&v26, &from);
    [v13 setActionBlock:&v22];
    -[PUCropToolController setAutoButtonMode:](self, "setAutoButtonMode:", 1, v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);
  }
  [(PUCropToolController *)self _updateCropToggleButtonMode];
  cropAspectViewController = self->_cropAspectViewController;
  long long v15 = [(PUCropToolController *)self aspectButton];
  [v15 setSelected:cropAspectViewController != 0];

  id v16 = [(PUCropToolController *)self cropAspect];
  uint64_t v17 = [v16 allowOrientationChange];
  uint64_t v18 = [(PUCropToolController *)self cropAspectFlipperView];
  [v18 setEnabled:v17];

  uint64_t v19 = [(PUCropToolController *)self aspectButton];
  if ([v19 isSelected]) {
    [v3 photoEditingToolbarButtonSelectedColor];
  }
  else {
  uint64_t v20 = [v3 photoEditingToolbarButtonColor];
  }

  uint64_t v21 = [(PUCropToolController *)self aspectButton];
  [v21 setTintColor:v20];

  objc_destroyWeak(&location);
}

void __48__PUCropToolController__updateCropActionButtons__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _rotateButtonTapped:v3];
}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _flipButtonTapped:v3];
}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _aspectButtonTapped:v3];
}

void __48__PUCropToolController__updateCropActionButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _cropToggleTapped:v3];
}

- (UIView)cropCanvasView
{
  cropCanvasView = self->_cropCanvasView;
  if (cropCanvasView)
  {
    id v3 = cropCanvasView;
  }
  else
  {
    int v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5 setUserInteractionEnabled:0];
    int v6 = self->_cropCanvasView;
    self->_cropCanvasView = v5;
    int v7 = v5;

    id v3 = self->_cropCanvasView;
  }
  return v3;
}

- (NSDictionary)cropHandleViewsByHandle
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  cropHandleViewsByHandle = self->_cropHandleViewsByHandle;
  if (cropHandleViewsByHandle)
  {
    id v3 = cropHandleViewsByHandle;
  }
  else
  {
    int v5 = +[PUCropHandleView allHandles];
    int v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v12 = -[PUCropHandleView initForHandle:]([PUCropHandleView alloc], "initForHandle:", [v11 unsignedIntegerValue]);
          [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
          [v6 setObject:v12 forKeyedSubscript:v11];
          char v13 = objc_alloc_init(PUTouchingGestureRecognizer);
          [(PUTouchingGestureRecognizer *)v13 addTarget:self action:sel__handleTouchingGesture_];
          [(PUTouchingGestureRecognizer *)v13 setDelegate:self];
          [v12 addGestureRecognizer:v13];
          id v14 = objc_alloc_init(MEMORY[0x1E4FB1A58]);
          [v14 addTarget:self action:sel__handleCropHandlePan_];
          [v12 addGestureRecognizer:v14];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    long long v15 = (NSDictionary *)[v6 copy];
    id v16 = self->_cropHandleViewsByHandle;
    self->_cropHandleViewsByHandle = v15;

    id v3 = self->_cropHandleViewsByHandle;
  }
  return v3;
}

- (PUCropOverlayView)cropOverlayView
{
  cropOverlayView = self->_cropOverlayView;
  if (cropOverlayView)
  {
    id v3 = cropOverlayView;
  }
  else
  {
    int v5 = objc_alloc_init(PUCropOverlayView);
    [(PUCropOverlayView *)v5 setUserInteractionEnabled:0];
    int v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    self->_gridVisible = [v6 BOOLForKey:@"PUCropGridVisible"];

    [(PUCropOverlayView *)v5 setCropGridVisible:self->_gridVisible animated:0];
    uint64_t v7 = self->_cropOverlayView;
    self->_cropOverlayView = v5;
    uint64_t v8 = v5;

    id v3 = self->_cropOverlayView;
  }
  return v3;
}

- (PUCropPerspectiveView)cropView
{
  cropView = self->_cropView;
  if (cropView)
  {
    id v3 = cropView;
  }
  else
  {
    int v5 = objc_alloc_init(PUCropPerspectiveView);
    [(PUCropPerspectiveView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUCropTransformedImageView *)v5 setDelegate:self];
    int v6 = self->_cropView;
    self->_cropView = v5;
    uint64_t v7 = v5;

    id v3 = self->_cropView;
  }
  return v3;
}

- (void)setHasAppliedPerspectiveSuggestion:(BOOL)a3
{
  self->_hasAppliedPerspectiveSuggestion = a3;
  [(PUCropToolController *)self _updateCropToggleButton];
}

- (BOOL)_hasPerspectiveSuggestion
{
  [(PUCropToolController *)self suggestedPitchAngle];
  if (v3 != 0.0) {
    return 1;
  }
  [(PUCropToolController *)self suggestedYawAngle];
  return v5 != 0.0;
}

- (void)_loadPerspectiveSuggestionIfNeeded
{
  if (![(PUCropToolController *)self hasAutoAppliedPerspectiveSuggestion]
    && ![(PUCropToolController *)self hasRequestedPerspectiveSuggestion])
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __58__PUCropToolController__loadPerspectiveSuggestionIfNeeded__block_invoke;
    v3[3] = &unk_1E5F2ED10;
    v3[4] = self;
    [(PUCropToolController *)self _loadImageIfNeededWithCompletion:v3];
  }
}

void __58__PUCropToolController__loadPerspectiveSuggestionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasRequestedPerspectiveSuggestion:1];
  id v2 = [*(id *)(a1 + 32) valuesCalculator];
  id v12 = [v2 autoPerspectiveValuesWithAccuracy:0];

  if ([v12 count])
  {
    double v3 = [v12 objectForKeyedSubscript:@"pitch"];
    [v3 doubleValue];
    double v5 = v4;

    int v6 = [v12 objectForKeyedSubscript:@"yaw"];
    [v6 doubleValue];
    double v8 = v7;

    uint64_t v9 = [v12 objectForKeyedSubscript:@"angle"];
    [v9 doubleValue];
    double v11 = v10;

    if (fabs(v5) > 0.000001 || fabs(v8) > 0.000001 || fabs(v11) > 0.000001)
    {
      [*(id *)(a1 + 32) setSuggestedStraightenAngle:v11 * 3.14159265 / 180.0];
      [*(id *)(a1 + 32) setSuggestedPitchAngle:v5 * 3.14159265 / 180.0];
      [*(id *)(a1 + 32) setSuggestedYawAngle:v8 * 3.14159265 / 180.0];
    }
  }
}

- (void)setHasAppliedCropSuggestion:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasAppliedCropSuggestion = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__PUCropToolController_setHasAppliedCropSuggestion___block_invoke;
  void v7[3] = &__block_descriptor_33_e36_v16__0__PICropAdjustmentController_8l;
  BOOL v8 = a3;
  [(PUCropToolController *)self _performLocalCropModelChanges:v7];
  double v5 = [(PUPhotoEditToolController *)self aggregateSession];
  int v6 = v5;
  if (v3) {
    [v5 notifyDidApplyAutoCrop];
  }
  else {
    [v5 notifyDidAdjustCrop];
  }

  [(PUCropToolController *)self _updateCropToggleButton];
}

uint64_t __52__PUCropToolController_setHasAppliedCropSuggestion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsAuto:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_toggleCropAndPerspective
{
  BOOL v3 = [(PUCropToolController *)self _hasCropSuggestion];
  BOOL v4 = [(PUCropToolController *)self _hasPerspectiveSuggestion];
  if (v4)
  {
    BOOL v5 = [(PUCropToolController *)self hasAppliedPerspectiveSuggestion];
    int v6 = ![(PUCropToolController *)self hasAppliedPerspectiveSuggestion];
  }
  else
  {
    BOOL v5 = 0;
    int v6 = 0;
  }
  if ([(PUCropToolController *)self canResetToDefaultValue]) {
    int v7 = v6 | !v4;
  }
  else {
    int v7 = 0;
  }
  if (v3)
  {
    BOOL v8 = [(PUCropToolController *)self hasAppliedCropSuggestion];
    int v9 = ![(PUCropToolController *)self hasAppliedCropSuggestion];
  }
  else
  {
    BOOL v8 = 0;
    int v9 = 0;
  }
  BOOL v10 = [(PUCropToolController *)self canResetToDefaultValue];
  int v11 = v9 | !v3;
  if (!v10) {
    int v11 = 0;
  }
  if (v8 || v5 || !v3 && !v4 && v11 | v7)
  {
    [(PUCropToolController *)self _resetAllValuesAnimated:1];
  }
  else if ((v9 | v6) == 1)
  {
    [(PUCropToolController *)self _applyCropAndPerspectiveSuggestion];
  }
}

- (BOOL)_hasCropSuggestion
{
  [(PUCropToolController *)self suggestedCrop];
  return !CGRectIsEmpty(v3);
}

- (void)_applyCropAndPerspectiveSuggestion
{
  [(PUCropToolController *)self suggestedCrop];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PUCropToolController *)self suggestedStraightenAngle];
  double v12 = v11;
  [(PUCropToolController *)self suggestedPitchAngle];
  double v14 = v13;
  [(PUCropToolController *)self suggestedYawAngle];
  -[PUCropToolController _applyCropRect:straightenAngle:pitchAngle:yawAngle:isAutoCrop:](self, "_applyCropRect:straightenAngle:pitchAngle:yawAngle:isAutoCrop:", 1, v4, v6, v8, v10, v12, v14, v15);
}

- (void)_applyCropRect:(CGRect)a3 straightenAngle:(double)a4 pitchAngle:(double)a5 yawAngle:(double)a6 isAutoCrop:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v37 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v38 = *MEMORY[0x1E4F1DB28];
    double v35 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v36 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  }
  else
  {
    -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:", x, y, width, height);
    double v37 = v17;
    double v38 = v16;
    double v35 = v19;
    double v36 = v18;
  }
  self->_straightenAngle = a4;
  self->_yawAngle = a6;
  self->_pitchAngle = a5;
  v41.origin.double x = x;
  v41.origin.double y = y;
  v41.size.double width = width;
  v41.size.double height = height;
  if (!CGRectIsEmpty(v41)) {
    -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", x, y, width, height);
  }
  [(NUCropModel *)self->_cropModel cropRect];
  CGFloat v20 = v42.origin.x;
  CGFloat v21 = v42.origin.y;
  CGFloat v22 = v42.size.width;
  CGFloat v23 = v42.size.height;
  double v24 = CGRectGetWidth(v42);
  v43.origin.double x = v20;
  v43.origin.double y = v21;
  v43.size.double width = v22;
  v43.size.double height = v23;
  double v25 = v24 * CGRectGetHeight(v43);
  [(NUCropModel *)self->_cropModel setRollAngle:a4 constrainCropRectWithTargetArea:v25];
  [(NUCropModel *)self->_cropModel setYawAngle:a6 constrainCropRectWithTargetArea:v25];
  [(NUCropModel *)self->_cropModel setPitchAngle:a5 constrainCropRectWithTargetArea:v25];
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  id v26 = [(PUCropToolController *)self cropView];
  [v26 setStraightenAngle:a4];

  BOOL v27 = [(PUCropToolController *)self cropView];
  [v27 setYawAngle:a6];

  double v28 = [(PUCropToolController *)self cropView];
  [v28 setPitchAngle:a5];

  v44.origin.double x = v38;
  v44.origin.double y = v37;
  v44.size.double width = v36;
  v44.size.double height = v35;
  if (!CGRectIsEmpty(v44))
  {
    -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", 1, v38, v37, v36, v35);
    id v29 = [(PUCropToolController *)self cropView];
    [(NUCropModel *)self->_cropModel cropRect];
    objc_msgSend(v29, "setModelCropRect:viewCropRect:");
  }
  double v30 = [(PUCropToolController *)self cropView];
  [v30 updateLayerTransformsAnimated:1];

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __86__PUCropToolController__applyCropRect_straightenAngle_pitchAngle_yawAngle_isAutoCrop___block_invoke;
  v39[3] = &unk_1E5F24808;
  *(double *)&v39[5] = a4;
  *(double *)&v39[6] = a5;
  *(double *)&v39[7] = a6;
  v39[4] = self;
  BOOL v40 = v7;
  [(PUCropToolController *)self _performLocalCropModelChanges:v39];
  id v31 = PULocalizedString(@"PHOTOEDIT_CROP_GENERIC_ACTION_TITLE");
  [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v31];

  if (v7)
  {
    long long v32 = [(PUPhotoEditToolController *)self aggregateSession];
    [v32 notifyDidApplyAutoCrop];

    if (a5 != 0.0 || a6 != 0.0)
    {
      id v33 = [(PUPhotoEditToolController *)self aggregateSession];
      [v33 notifyDidApplyPerspectiveAutoCrop];
    }
  }
  self->_hasAppliedPerspectiveSuggestion = v7;
  self->_hasAppliedCropSuggestion = v7;
  [(PUCropToolController *)self _updateCropToggleButton];
  [(PUCropToolController *)self _updatePreviewViewInsets];
  long long v34 = [(PUCropToolController *)self adjustmentsViewController];
  [v34 resetControls];
}

void __86__PUCropToolController__applyCropRect_straightenAngle_pitchAngle_yawAngle_isAutoCrop___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  [v4 setAngleRadians:v3];
  [v4 setPitchRadians:*(double *)(a1 + 48)];
  [v4 setYawRadians:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 1440) cropRect];
  objc_msgSend(v4, "setCropRect:");
  [v4 setIsAuto:*(unsigned __int8 *)(a1 + 64)];
  [v4 setEnabled:1];
}

- (void)_autoApplyCropAndPerspectiveSuggestionIfNeeded
{
  if ((![(PUCropToolController *)self hasAutoAppliedCropSuggestion]
     || ![(PUCropToolController *)self hasAppliedPerspectiveSuggestion])
    && ([(PUCropToolController *)self _hasCropSuggestion]
     || [(PUCropToolController *)self _hasPerspectiveSuggestion]))
  {
    [(PUCropToolController *)self _applyCropAndPerspectiveSuggestion];
    [(PUCropToolController *)self setHasAutoAppliedCropSuggestion:1];
    [(PUCropToolController *)self setHasAutoAppliedPerspectiveSuggestion:1];
  }
}

- (void)_loadCropSuggestionIfNeeded
{
  if (![(PUCropToolController *)self hasAutoAppliedCropSuggestion]
    && ![(PUCropToolController *)self hasRequestedCropSuggestion])
  {
    double v3 = +[PUPhotoEditProtoSettings sharedInstance];
    int v4 = [v3 autoCropEnabled];

    if (v4)
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      void v5[2] = __51__PUCropToolController__loadCropSuggestionIfNeeded__block_invoke;
      v5[3] = &unk_1E5F2ED10;
      v5[4] = self;
      [(PUCropToolController *)self _loadImageIfNeededWithCompletion:v5];
    }
  }
}

void __51__PUCropToolController__loadCropSuggestionIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHasRequestedCropSuggestion:1];
  id v2 = [*(id *)(a1 + 32) valuesCalculator];
  id v18 = [v2 autoCropValuesWithAccuracy:0];

  if ([v18 count])
  {
    double v3 = [v18 objectForKeyedSubscript:@"angle"];
    [v3 doubleValue];
    double v5 = v4;

    double v6 = [v18 objectForKeyedSubscript:@"xOrigin"];
    [v6 doubleValue];
    double v8 = v7;

    double v9 = [v18 objectForKeyedSubscript:@"yOrigin"];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = [v18 objectForKeyedSubscript:@"width"];
    [v12 doubleValue];
    double v14 = v13;

    double v15 = [v18 objectForKeyedSubscript:@"height"];
    [v15 doubleValue];
    double v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "setSuggestedCrop:", v8, v11, v14, v17);
    [*(id *)(a1 + 32) setSuggestedStraightenAngle:v5 * 3.14159265 / 180.0];
  }
}

- (void)basePhotoInvalidated
{
  [(PUCropToolController *)self setNeedsImageLoad:1];
  if ([(PUCropToolController *)self isActiveTool])
  {
    [(PUCropToolController *)self _loadImageIfNeededWithCompletion:0];
  }
}

- (void)baseMediaInvalidated
{
  [(PUCropToolController *)self setNeedsMediaLoad:1];
  if ([(PUCropToolController *)self isActiveTool])
  {
    [(PUCropToolController *)self _loadMediaIfNeeded];
  }
}

- (void)_resetAllValuesAnimated:(BOOL)a3 skipLayerTransformUpdate:(BOOL)a4
{
  BOOL v5 = a3;
  int64_t v7 = [(PUCropToolController *)self _defaultOrientation];
  double v8 = [(PUCropToolController *)self geometry];
  uint64_t v9 = [v8 appliedOrientation];

  [(PUCropToolController *)self _defaultStraightenAngle];
  double v11 = v10;
  [(PUCropToolController *)self straightenAngle];
  double v56 = v12;
  [(PUCropToolController *)self _defaultPitchAngle];
  double v14 = v13;
  [(PUCropToolController *)self pitchAngle];
  double v16 = v15;
  [(PUCropToolController *)self _defaultYawAngle];
  double v18 = v17;
  [(PUCropToolController *)self yawAngle];
  BOOL v20 = v18 == v19;
  [(PUCropToolController *)self _defaultImageCropRect];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  [(NUCropModel *)self->_cropModel cropRect];
  v59.origin.double x = v29;
  v59.origin.double y = v30;
  v59.size.double width = v31;
  v59.size.double height = v32;
  v58.origin.double x = v22;
  v58.origin.double y = v24;
  double v33 = v18;
  v58.size.double width = v26;
  v58.size.double height = v28;
  BOOL v34 = !CGRectEqualToRect(v58, v59);
  if (v7 == v9) {
    BOOL v34 = 1;
  }
  if (v11 != v56) {
    BOOL v34 = 1;
  }
  if (v14 != v16) {
    BOOL v34 = 1;
  }
  if (v34) {
    BOOL v35 = v7 == v9;
  }
  else {
    BOOL v35 = v20;
  }
  uint64_t v36 = v35 & v5;
  double v37 = [(PUCropToolController *)self cropView];
  [v37 _resetCropRect];

  self->_straightenAngle = v11;
  self->_pitchAngle = v14;
  self->_yawAngle = v18;
  [(PUCropToolController *)self _defaultViewCropRect];
  -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v36);
  double v38 = [(PUCropToolController *)self cropView];
  [(NUCropModel *)self->_cropModel cropRect];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  [(PUCropToolController *)self viewCropRect];
  objc_msgSend(v38, "setModelCropRect:viewCropRect:", v40, v42, v44, v46, v47, v48, v49, v50);

  if (!a4)
  {
    double v51 = [(PUCropToolController *)self cropView];
    [v51 updateLayerTransformsAnimated:v36];
  }
  [(PUCropToolController *)self setHasAppliedCropSuggestion:0];
  [(PUCropToolController *)self setHasAppliedPerspectiveSuggestion:0];
  [(PUCropToolController *)self _updateCropViewsForInteraction];
  CGRect v52 = [(PUCropToolController *)self cropModel];
  [v52 makeCurrentAspectRatioFreeForm];

  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __73__PUCropToolController__resetAllValuesAnimated_skipLayerTransformUpdate___block_invoke;
  v57[3] = &unk_1E5F247E0;
  v57[4] = self;
  *(double *)&v57[5] = v14;
  *(double *)&v57[6] = v33;
  *(double *)&v57[7] = v11;
  [(PUCropToolController *)self _performLocalCropModelChanges:v57];
  if (![(PUCropToolController *)self setLockedCropAspectIfNeededIgnoringCurrentLock:1])
  {
    [(PUCropToolController *)self setCropAspect:0];
    double v53 = [(PUCropToolController *)self cropAspectViewController];
    [v53 setCurrentCropAspect:0];
  }
  double v54 = [(PUCropToolController *)self adjustmentsViewController];
  [v54 resetControls];

  double v55 = [(PUPhotoEditToolController *)self aggregateSession];
  [v55 notifyDidResetCrop];

  [(PUCropToolController *)self _updateCropToggleButton];
}

void __73__PUCropToolController__resetAllValuesAnimated_skipLayerTransformUpdate___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(*(void *)(a1 + 32) + 1440);
  id v4 = a2;
  [v3 cropRect];
  objc_msgSend(v4, "setCropRect:");
  [v4 setPitchRadians:*(double *)(a1 + 40)];
  [v4 setYawRadians:*(double *)(a1 + 48)];
  [v4 setAngleRadians:*(double *)(a1 + 56)];
}

- (void)_resetAllValuesAnimated:(BOOL)a3
{
}

- (CGRect)_defaultViewCropRect
{
  [(PUCropToolController *)self _defaultImageCropRect];
  -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_defaultImageCropRect
{
  id v2 = [(PUCropToolController *)self cropModel];
  [v2 masterImageRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (int64_t)_defaultOrientation
{
  return 1;
}

- (double)_defaultYawAngle
{
  return 0.0;
}

- (double)_defaultPitchAngle
{
  return 0.0;
}

- (double)_defaultStraightenAngle
{
  return 0.0;
}

- (BOOL)setLockedCropAspectIfNeededIgnoringCurrentLock:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = +[PUPhotoEditProtoSettings sharedInstance];
  int v6 = [v5 maintainCropAspectLockState];

  if (v6)
  {
    double v7 = [(PUPhotoEditToolController *)self compositionController];
    double v8 = [v7 cropAdjustmentController];

    [v8 cropRect];
    double v10 = v9;
    double v12 = v11;
    double v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v14 = [v13 BOOLForKey:@"PUPhotoEditCropAspectRatioLocked2"];

    [(NUCropModel *)self->_cropModel masterImageRect];
    if (v10 == v15)
    {
      [(NUCropModel *)self->_cropModel masterImageRect];
      BOOL v17 = v12 == v16;
    }
    else
    {
      BOOL v17 = 0;
    }
    BOOL v19 = [v8 constraintWidth] < 1 || objc_msgSend(v8, "constraintHeight") < 1;
    int v18 = v14 & v17 & (v19 || v3);
    if (v18 == 1)
    {
      BOOL v20 = [(PUPhotoEditToolController *)self delegate];
      [v20 toolControllerOriginalOrientedImageSize:self];
      double v22 = v21;
      double v24 = v23;

      double v25 = +[PUCropAspect originalAspectForWidth:(unint64_t)v22 height:(unint64_t)v24];
      [(PUCropToolController *)self _setCropAspect:v25 animated:0];
    }
  }
  else
  {
    LOBYTE(v18) = 0;
  }
  return v18;
}

- (void)_loadStateFromModelAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke;
  v3[3] = &unk_1E5F2D968;
  v3[4] = self;
  void v3[5] = a2;
  BOOL v4 = a3;
  [(PUCropToolController *)self _loadImageIfNeededWithCompletion:v3];
}

void __52__PUCropToolController__loadStateFromModelAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) geometry];

  if (v2)
  {
    [*(id *)(a1 + 32) setNeedsModelLoad:0];
    [*(id *)(a1 + 32) setLoadingStateFromModel:1];
    BOOL v3 = [*(id *)(a1 + 32) compositionController];
    if (!v3)
    {
      double v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"PUCropToolController.m" lineNumber:1376 description:@"Need a compositionController to perform this operation"];
    }
    *(void *)buf = 0;
    double v47 = buf;
    uint64_t v48 = 0x3032000000;
    double v49 = __Block_byref_object_copy__21679;
    double v50 = __Block_byref_object_dispose__21680;
    id v51 = 0;
    uint64_t v40 = 0;
    double v41 = &v40;
    uint64_t v42 = 0x3032000000;
    double v43 = __Block_byref_object_copy__21679;
    double v44 = __Block_byref_object_dispose__21680;
    id v45 = 0;
    BOOL v4 = *(void **)(a1 + 32);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_189;
    v39[3] = &unk_1E5F2B800;
    v39[4] = v4;
    v39[5] = buf;
    v39[6] = &v40;
    [v4 _performLocalModelChanges:v39];
    [*((id *)v47 + 5) cropRect];
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
    IsEmptdouble y = CGRectIsEmpty(v52);
    double v10 = *(void **)(*(void *)(a1 + 32) + 1440);
    if (IsEmpty)
    {
      [v10 masterImageRect];
      double x = v11;
      double y = v12;
      double width = v13;
      double height = v14;
    }
    else
    {
      objc_msgSend(v10, "setCropRect:", x, y, width, height);
    }
    double v15 = [*(id *)(a1 + 32) geometry];
    [v15 inputOrientation];
    PLOrientationInverse();
    [(id)v41[5] orientation];
    uint64_t v16 = PLOrientationConcat();
    BOOL v17 = *(void **)(a1 + 32);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_2;
    v38[3] = &__block_descriptor_40_e25_v16__0__PLImageGeometry_8l;
    v38[4] = v16;
    [v17 _performGeometryChange:v38 animated:*(unsigned __int8 *)(a1 + 48)];
    [*(id *)(a1 + 32) inputExtent];
    CGFloat v19 = -v18;
    CGFloat v21 = -v20;
    v53.origin.double x = x;
    v53.origin.double y = y;
    v53.size.double width = width;
    v53.size.double height = height;
    CGRect v54 = CGRectOffset(v53, v19, v21);
    objc_msgSend(*(id *)(a1 + 32), "_suggestedCropRectForImageRect:", v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [*((id *)v47 + 5) angleRadians];
    objc_msgSend(*(id *)(a1 + 32), "setStraightenAngle:");
    [*((id *)v47 + 5) pitchRadians];
    objc_msgSend(*(id *)(a1 + 32), "setPitchAngle:");
    [*((id *)v47 + 5) yawRadians];
    objc_msgSend(*(id *)(a1 + 32), "setYawAngle:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1440), "setCropRect:", x, y, width, height);
    objc_msgSend(*(id *)(a1 + 32), "setViewCropRect:", v23, v25, v27, v29);
    CGFloat v30 = [*(id *)(a1 + 32) cropView];
    [*(id *)(*(void *)(a1 + 32) + 1440) cropRect];
    objc_msgSend(v30, "setModelCropRect:viewCropRect:");

    CGFloat v31 = [*(id *)(a1 + 32) cropView];
    [v31 updateLayerTransformsAnimated:*(unsigned __int8 *)(a1 + 48)];

    [*(id *)(a1 + 32) setLockedCropAspectIfNeededIgnoringCurrentLock:0];
    uint64_t v32 = [*((id *)v47 + 5) constraintWidth];
    uint64_t v33 = [*((id *)v47 + 5) constraintHeight];
    BOOL v34 = 0;
    if (v32 >= 1 && v33 >= 1)
    {
      BOOL v34 = [*(id *)(a1 + 32) bestAspectRatioForWidth:(unint64_t)(double)v32 height:(unint64_t)(double)v33];
      if (v34)
      {
        [*(id *)(a1 + 32) setCropAspect:v34];
        [*(id *)(a1 + 32) _updateAspectRatioControls];
      }
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1193) = [*((id *)v47 + 5) isAuto];
    *(unsigned char *)(*(void *)(a1 + 32) + 1197) = *(unsigned char *)(*(void *)(a1 + 32) + 1193);
    BOOL v35 = [*(id *)(a1 + 32) cropView];
    [v35 frame];
    objc_msgSend(*(id *)(a1 + 32), "setCropViewFrameForLastModelLoad:");

    uint64_t v36 = [*(id *)(a1 + 32) view];
    [v36 setNeedsUpdateConstraints];

    [*(id *)(a1 + 32) _updatePreviewViewInsets];
    [*(id *)(a1 + 32) _updateCropToggleButton];
    [*(id *)(a1 + 32) setLoadingStateFromModel:0];

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    BOOL v3 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "nil geometry in [PUCropToolController _loadStateFromModelAnimated], delaying model load", buf, 2u);
    }
  }
}

void __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_189(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compositionController];
  uint64_t v3 = [v2 cropAdjustmentControllerCreatingIfNecessary:1];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v9 = [*(id *)(a1 + 32) compositionController];
  uint64_t v6 = [v9 orientationAdjustmentControllerCreatingIfNecessary:1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  double v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

uint64_t __52__PUCropToolController__loadStateFromModelAnimated___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setUserOrientation:*(void *)(a1 + 32)];
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v10 compositionControllerDidChangeForAdjustments:v4];
  [(PUCropPerspectiveAdjustmentsDataSource *)self->_dataSource compositionControllerDidChange];
  if (![(PUCropToolController *)self isModelChangeLocal]
    && [(PUCropToolController *)self isActiveTool])
  {
    [(PUCropToolController *)self _loadStateFromModelAnimated:1];
  }
  if (([v4 containsObject:*MEMORY[0x1E4F8A418]] & 1) == 0
    && ([v4 containsObject:*MEMORY[0x1E4F8A4A8]] & 1) == 0)
  {
    [(PUCropToolController *)self basePhotoInvalidated];
    [(PUCropToolController *)self baseMediaInvalidated];
  }
  double v5 = [(PUPhotoEditToolController *)self delegate];
  int v6 = [v5 isStandardVideo];

  if (v6)
  {
    [(PUCropToolController *)self _beginObservingVideoPlayer];
    uint64_t v7 = [(PUCropToolController *)self cropView];
    double v8 = [v7 videoMediaView];
    id v9 = [v8 player];
    [v9 pause];

    [(PUCropToolController *)self _updateVideoScrubber];
  }
}

- (void)_updatePreviewViewInsets
{
  uint64_t v3 = [(PUCropToolController *)self view];
  [v3 bounds];
  CGFloat v52 = v5;
  id v53 = v4;
  CGFloat v7 = v6;
  CGFloat v51 = v8;

  [(PUCropToolController *)self viewCropRect];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  BOOL v17 = [(PUCropToolController *)self view];
  double v18 = [(PUCropToolController *)self cropView];
  objc_msgSend(v17, "convertRect:fromView:", v18, v10, v12, v14, v16);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;

  v56.origin.double x = v20;
  v56.origin.double y = v22;
  v56.size.double width = v24;
  v56.size.double height = v26;
  if (!CGRectIsEmpty(v56)
    || (([(PUCropToolController *)self previewViewInsets],
         v30 == *(double *)(MEMORY[0x1E4FB2848] + 8))
      ? (BOOL v31 = v27 == *MEMORY[0x1E4FB2848])
      : (BOOL v31 = 0),
        v31 ? (BOOL v32 = v29 == *(double *)(MEMORY[0x1E4FB2848] + 24)) : (BOOL v32 = 0),
        v32 ? (BOOL v33 = v28 == *(double *)(MEMORY[0x1E4FB2848] + 16)) : (BOOL v33 = 0),
        v33))
  {
    v57.origin.double x = v20;
    v57.origin.double y = v22;
    v57.size.double width = v24;
    v57.size.double height = v26;
    if (CGRectIsEmpty(v57))
    {
      BOOL v34 = [(PUPhotoEditToolController *)self toolControllerSpec];
      [v34 standardBottomBarHeight];
      double v36 = v35;

      double v37 = 0.0;
      double v38 = 0.0;
      double v39 = 0.0;
    }
    else
    {
      v58.origin.double x = v20;
      v58.origin.double y = v22;
      v58.size.double width = v24;
      v58.size.double height = v26;
      double MinY = CGRectGetMinY(v58);
      *(void *)&v59.origin.double x = v53;
      v59.origin.double y = v7;
      v59.size.double width = v52;
      v59.size.double height = v51;
      double v50 = MinY - CGRectGetMinY(v59);
      *(void *)&v60.origin.double x = v53;
      v60.origin.double y = v7;
      v60.size.double width = v52;
      v60.size.double height = v51;
      double MaxY = CGRectGetMaxY(v60);
      v61.origin.double x = v20;
      v61.origin.double y = v22;
      v61.size.double width = v24;
      v61.size.double height = v26;
      double v48 = MaxY - CGRectGetMaxY(v61);
      v62.origin.double x = v20;
      v62.origin.double y = v22;
      v62.size.double width = v24;
      v62.size.double height = v26;
      double MinX = CGRectGetMinX(v62);
      *(void *)&v63.origin.double x = v53;
      v63.origin.double y = v7;
      v63.size.double width = v52;
      v63.size.double height = v51;
      double v40 = MinX - CGRectGetMinX(v63);
      *(void *)&v64.origin.double x = v53;
      v64.origin.double y = v7;
      v64.size.double width = v52;
      double v36 = v48;
      double v39 = v50;
      v64.size.double height = v51;
      double v38 = v40;
      double MaxX = CGRectGetMaxX(v64);
      v65.origin.double x = v20;
      v65.origin.double y = v22;
      v65.size.double width = v24;
      v65.size.double height = v26;
      double v37 = MaxX - CGRectGetMaxX(v65);
    }
    [(PUCropToolController *)self previewViewInsets];
    if (v38 != v45 || v39 != v42 || v37 != v44 || v36 != v43)
    {
      -[PUCropToolController setPreviewViewInsets:](self, "setPreviewViewInsets:", v39, v38, v36, v37);
      id v54 = [(PUPhotoEditToolController *)self delegate];
      [v54 toolController:self didChangePreferredPreviewViewInsetsAnimated:0];
    }
  }
}

- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6
{
  double v10 = (void (**)(void, double))a5;
  double v11 = (void (**)(id, uint64_t))a6;
  if (a3 == a4)
  {
    v10[2](v10, a4);
    if (v11) {
      v11[2](v11, 1);
    }
    double v12 = 0;
  }
  else
  {
    double v12 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", a3, 0.0, a4, 300.0, 1.0, 0.01);
    double v13 = [(PUCropToolController *)self view];
    [v13 setUserInteractionEnabled:0];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke;
    v19[3] = &unk_1E5F25130;
    CGFloat v20 = v10;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke_2;
    v15[3] = &unk_1E5F24798;
    double v16 = v20;
    double v18 = a4;
    BOOL v17 = v11;
    v15[4] = self;
    [v12 runWithValueApplier:v19 completion:v15];
  }
  return v12;
}

uint64_t __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a3);
}

void __80__PUCropToolController__animateValueFromValue_toValue_interpolation_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56));
  }
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  }
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setUserInteractionEnabled:1];
}

- (NSMutableDictionary)animationTargetsByKeyPath
{
  animationTargetsByKeyPath = self->_animationTargetsByKeyPath;
  if (!animationTargetsByKeyPath)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_animationTargetsByKeyPath;
    self->_animationTargetsByKeyPath = v4;

    animationTargetsByKeyPath = self->_animationTargetsByKeyPath;
  }
  double v6 = animationTargetsByKeyPath;
  return v6;
}

- (NSMutableDictionary)animationsByKeyPath
{
  animationsByKeyPath = self->_animationsByKeyPath;
  if (!animationsByKeyPath)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = self->_animationsByKeyPath;
    self->_animationsByKeyPath = v4;

    animationsByKeyPath = self->_animationsByKeyPath;
  }
  double v6 = animationsByKeyPath;
  return v6;
}

- (void)setGridVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_gridVisible = a3;
  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v4 setBool:v3 forKey:@"PUCropGridVisible"];
}

- (void)_setAnimationTarget:(id)a3 forKeyPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  CGFloat v7 = [(PUCropToolController *)self animationTargetsByKeyPath];
  double v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)_animationTargetForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCropToolController *)self animationTargetsByKeyPath];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_setAnimation:(id)a3 forKeyPath:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  CGFloat v7 = [(PUCropToolController *)self animationsByKeyPath];
  double v8 = v7;
  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
}

- (id)_animationForKeyPath:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCropToolController *)self animationsByKeyPath];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)_cancelAnimationForKeyPath:(id)a3
{
  id v5 = a3;
  id v4 = [(PUCropToolController *)self _animationForKeyPath:v5];
  [v4 stop];

  [(PUCropToolController *)self _setAnimation:0 forKeyPath:v5];
}

- (void)_setYawAngle:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(a3, self->_yawAngle) >= *MEMORY[0x1E4F7A778])
  {
    self->_yawAngle = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __46__PUCropToolController__setYawAngle_animated___block_invoke;
    void v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&void v7[4] = a3;
    [(PUCropToolController *)self _performLocalCropModelChanges:v7];
    id v6 = [(PUCropToolController *)self cropView];
    [v6 setYawAngle:a3];

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController updateControls];
    [(PUCropToolController *)self _updatePreviewViewInsets];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
  }
}

uint64_t __46__PUCropToolController__setYawAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setYawRadians:*(double *)(a1 + 32)];
}

- (void)_setPitchAngle:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(a3, self->_pitchAngle) >= *MEMORY[0x1E4F7A778])
  {
    self->_pitchAngle = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__PUCropToolController__setPitchAngle_animated___block_invoke;
    void v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&void v7[4] = a3;
    [(PUCropToolController *)self _performLocalCropModelChanges:v7];
    id v6 = [(PUCropToolController *)self cropView];
    [v6 setPitchAngle:a3];

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController updateControls];
    [(PUCropToolController *)self _updatePreviewViewInsets];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
  }
}

uint64_t __48__PUCropToolController__setPitchAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPitchRadians:*(double *)(a1 + 32)];
}

- (void)_setStraightenAngle:(double)a3 animated:(BOOL)a4
{
  if (vabdd_f64(a3, self->_straightenAngle) >= *MEMORY[0x1E4F7A778])
  {
    self->_straightenAngle = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PUCropToolController__setStraightenAngle_animated___block_invoke;
    void v7[3] = &__block_descriptor_40_e36_v16__0__PICropAdjustmentController_8l;
    *(double *)&void v7[4] = a3;
    [(PUCropToolController *)self _performLocalCropModelChanges:v7];
    id v6 = [(PUCropToolController *)self cropView];
    [v6 setStraightenAngle:a3];

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController updateControls];
    [(PUCropToolController *)self _updatePreviewViewInsets];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
  }
}

uint64_t __53__PUCropToolController__setStraightenAngle_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAngleRadians:*(double *)(a1 + 32)];
}

- (void)_setViewCropRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_viewCropRect = &self->_viewCropRect;
  if ((PURectIsApproximatelyEqualToRect() & 1) == 0)
  {
    [(PUCropToolController *)self _cancelAnimationForKeyPath:@"_imageCropRect"];
    double v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    [(PUCropToolController *)self _setAnimationTarget:v11 forKeyPath:@"_imageCropRect"];

    CGSize size = p_viewCropRect->size;
    CGPoint origin = p_viewCropRect->origin;
    CGSize v24 = size;
    p_viewCropRect->origin.double x = x;
    p_viewCropRect->origin.double y = y;
    p_viewCropRect->size.double width = width;
    p_viewCropRect->size.double height = height;
    if (self->_cropModel)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke;
      v22[3] = &unk_1E5F28E10;
      v22[4] = self;
      [(PUCropToolController *)self _performLocalCropModelChanges:v22];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    CGPoint v16 = origin;
    v15[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke_2;
    v15[3] = &unk_1E5F24750;
    CGSize v17 = v24;
    double v18 = x;
    double v19 = y;
    double v20 = width;
    double v21 = height;
    v15[4] = self;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PUCropToolController__setViewCropRect_animated___block_invoke_3;
    v14[3] = &unk_1E5F2CEE8;
    v14[4] = self;
    double v13 = [(PUCropToolController *)self _animateValueFromValue:v15 toValue:v14 interpolation:(double)!v4 completion:1.0];
    [(PUCropToolController *)self _setAnimation:v13 forKeyPath:@"_imageCropRect"];
    [(PUCropToolController *)self _updatePreviewViewInsets];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
  }
}

void __50__PUCropToolController__setViewCropRect_animated___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 1440);
  id v3 = a2;
  [v2 cropRect];
  objc_msgSend(v3, "setCropRect:");
}

uint64_t __50__PUCropToolController__setViewCropRect_animated___block_invoke_2(uint64_t a1, double a2)
{
  double v3 = *(double *)(a1 + 72) * a2 + (1.0 - a2) * *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 80) * a2 + (1.0 - a2) * *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 88) * a2 + (1.0 - a2) * *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 96) * a2 + (1.0 - a2) * *(double *)(a1 + 64);
  [*(id *)(a1 + 32) setIgnoreTrackingUpdates:1];
  CGFloat v7 = [*(id *)(a1 + 32) cropOverlayView];
  objc_msgSend(v7, "setCropRect:", v3, v4, v5, v6);

  double v8 = *(void **)(a1 + 32);
  return [v8 setIgnoreTrackingUpdates:0];
}

uint64_t __50__PUCropToolController__setViewCropRect_animated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setAnimation:0 forKeyPath:@"_imageCropRect"];
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateCropViewsForInteraction];
}

- (void)_setCropAspect:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([v7 isEqual:self->_cropAspect] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cropAspect, a3);
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    double v41 = __48__PUCropToolController__setCropAspect_animated___block_invoke;
    double v42 = &unk_1E5F28E10;
    id v7 = v7;
    id v43 = v7;
    [(PUCropToolController *)self _performLocalCropModelChanges:&v39];
    if (v7 && [(PUCropToolController *)self isActiveTool])
    {
      [(NUCropModel *)self->_cropModel cropRect];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      [(NUCropModel *)self->_cropModel masterImageRect];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      CGSize v24 = [(PUCropToolController *)self geometry];
      int v25 = [v24 isSizeInverted];

      if (v25)
      {
        uint64_t v26 = [v7 inverseAspect];

        id v7 = (id)v26;
      }
      [(PUCropToolController *)self straightenAngle];
      objc_msgSend(v7, "constrainRect:boundingRect:boundingAngle:minSize:", v9, v11, v13, v15, v17, v19, v21, v23, v27, *MEMORY[0x1E4F1DB30], *(void *)(MEMORY[0x1E4F1DB30] + 8), v39, v40, v41, v42);
      -[PUCropToolController _suggestedCropRectForImageRect:](self, "_suggestedCropRectForImageRect:");
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v36 = [(PUCropToolController *)self cropView];
      objc_msgSend(v36, "setImageCropRectFromViewCropRect:animated:", v4, v29, v31, v33, v35);

      -[PUCropToolController _setViewCropRect:animated:](self, "_setViewCropRect:animated:", v4, v29, v31, v33, v35);
      double v37 = [(PUCropToolController *)self cropView];
      [(NUCropModel *)self->_cropModel cropRect];
      objc_msgSend(v37, "setModelCropRect:viewCropRect:");

      double v38 = [(PUCropToolController *)self cropView];
      [v38 updateLayerTransformsAnimated:v4];
    }
    [(PUCropToolController *)self _updateAspectRatioControls];
    [(PUCropToolController *)self _updateCropActionButtons];
    [(PUCropToolController *)self _updateCropViewsForInteraction];
    [(PUCropToolController *)self aspectRatioLockChanged];
  }
}

void __48__PUCropToolController__setCropAspect_animated___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v8 = a2;
  [v3 width];
  *(float *)&double v4 = v4;
  unint64_t v5 = vcvtas_u32_f32(*(float *)&v4);
  [*(id *)(a1 + 32) height];
  *(float *)&double v6 = v6;
  unint64_t v7 = vcvtas_u32_f32(*(float *)&v6);
  [v8 setConstraintWidth:v5];
  [v8 setConstraintHeight:v7];
}

- (void)_removeSnapshotView:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCropToolController *)self rotateSnapshotView];

  if (v5 == v4) {
    [(PUCropToolController *)self setRotateSnapshotView:0];
  }
  double v6 = [(PUPhotoEditToolController *)self delegate];
  int v7 = [v6 isLoopingVideo];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__PUCropToolController__removeSnapshotView___block_invoke;
    v11[3] = &unk_1E5F2ED10;
    id v12 = v4;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PUCropToolController__removeSnapshotView___block_invoke_2;
    v9[3] = &unk_1E5F2CEE8;
    id v10 = v12;
    [v8 animateWithDuration:v11 animations:v9 completion:0.5];
  }
  else
  {
    [v4 removeFromSuperview];
  }
}

uint64_t __44__PUCropToolController__removeSnapshotView___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __44__PUCropToolController__removeSnapshotView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_performGeometryChange:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (void (**)(id, void *))a3;
  int v7 = [(PUCropToolController *)self geometry];
  uint64_t v8 = [v7 appliedOrientation];
  v6[2](v6, v7);

  uint64_t v9 = [v7 appliedOrientation];
  id v10 = [(PUCropToolController *)self cropView];
  [v10 setOrientation:v9];

  double v11 = [(PUCropToolController *)self dataSource];
  [v11 setOrientation:v9];

  if (v8 != v9)
  {
    [(PUAdjustmentsViewController *)self->_adjustmentsViewController resetControls];
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke;
    v62[3] = &unk_1E5F2ECC8;
    v62[4] = self;
    id v12 = v7;
    id v63 = v12;
    [(PUCropToolController *)self _performLocalModelChanges:v62];
    memset(&v61, 0, sizeof(v61));
    if (v12) {
      [v12 transformFromOrientation:v8];
    }
    else {
      memset(&v61, 0, 32);
    }
    *(_OWORD *)&v61.tdouble x = 0uLL;
    [(PUCropToolController *)self _cropCanvasFrame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    [(PUCropToolController *)self viewCropRect];
    double x = v64.origin.x;
    double y = v64.origin.y;
    double width = v64.size.width;
    double height = v64.size.height;
    CGAffineTransform v60 = v61;
    CGRect v65 = CGRectApplyAffineTransform(v64, &v60);
    double v25 = PURectWithSizeThatFitsInRect(v65.size.width, v65.size.height, v14, v16, v18, v20);
    double v29 = PURoundRectToPixel(v25, v26, v27, v28);
    if (v4)
    {
      double v33 = v29;
      uint64_t v34 = v30;
      uint64_t v35 = v31;
      uint64_t v36 = v32;
      double v37 = [(PUCropToolController *)self rotateSnapshotView];
      if (!v37)
      {
        double v38 = [(PUCropToolController *)self cropView];
        double v37 = objc_msgSend(v38, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, x, y, width, height, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

        [(PUCropToolController *)self setRotateSnapshotView:v37];
        uint64_t v39 = [(PUCropToolController *)self view];
        [v39 addSubview:v37];

        objc_msgSend(v37, "setFrame:", x, y, width, height);
      }
      [(PUCropToolController *)self setRotatingAnimationCount:[(PUCropToolController *)self rotatingAnimationCount] + 1];
      [(PUCropToolController *)self setContentViewsHidden:1];
      uint64_t v40 = (void *)MEMORY[0x1E4FB1EB0];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = v50;
      v53[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_3;
      v53[3] = &unk_1E5F24728;
      id v41 = v37;
      CGAffineTransform v55 = v61;
      id v54 = v41;
      double v56 = v33;
      uint64_t v57 = v34;
      uint64_t v58 = v35;
      uint64_t v59 = v36;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = v50;
      v51[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_4;
      v51[3] = &unk_1E5F2E1C0;
      v51[4] = self;
      id v52 = v41;
      id v42 = v41;
      [v40 _animateUsingDefaultTimingWithOptions:0 animations:v53 completion:v51];
    }
    id v43 = [(PUCropToolController *)self cropAspect];
    uint64_t v44 = PLOrientationBetweenOrientations();
    uint64_t v45 = v44;
    if (v43 && (unint64_t)(v44 - 5) <= 3)
    {
      double v46 = [v43 inverseAspect];
      [(PUCropToolController *)self setCropAspect:v46];

      [(PUCropToolController *)self _recomposeCropRectAnimated:0];
      uint64_t v47 = v45 - 2;
    }
    else
    {
      [(PUCropToolController *)self _recomposeCropRectAnimated:0];
      uint64_t v47 = v45 - 2;
      if ((unint64_t)(v45 - 2) > 6)
      {
        double v48 = @"PHOTOEDIT_CROP_GENERIC_ACTION_TITLE";
        goto LABEL_15;
      }
    }
    double v48 = off_1E5F248D0[v47];
LABEL_15:
    double v49 = PULocalizedString(v48);
    [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v49];
  }
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compositionController];
  double v3 = [MEMORY[0x1E4F8A748] adjustmentConstants];
  BOOL v4 = [v3 PIOrientationAdjustmentKey];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_2;
  v6[3] = &unk_1E5F2E5F8;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 modifyAdjustmentWithKey:v4 modificationBlock:v6];
}

uint64_t __56__PUCropToolController__performGeometryChange_animated___block_invoke_3(uint64_t a1)
{
  memset(&v8, 0, sizeof(v8));
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 transform];
    double v3 = *(void **)(a1 + 32);
  }
  else
  {
    double v3 = 0;
    memset(&t1, 0, sizeof(t1));
  }
  long long v4 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v6.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tdouble x = *(_OWORD *)(a1 + 72);
  CGAffineTransformConcat(&v8, &t1, &v6);
  CGAffineTransform v6 = v8;
  [v3 setTransform:&v6];
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRotatingAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "rotatingAnimationCount") - 1);
  if (![*(id *)(a1 + 32) rotatingAnimationCount])
  {
    [*(id *)(a1 + 32) _updateCropViewsForInteraction];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v2 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __56__PUCropToolController__performGeometryChange_animated___block_invoke_5;
    v4[3] = &unk_1E5F27D48;
    objc_copyWeak(&v6, &location);
    id v5 = *(id *)(a1 + 40);
    [v2 _setContentViewsHidden:0 animated:1 completion:v4];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  double v3 = [*(id *)(a1 + 32) cropView];
  [v3 setNeedsLayerTransformsUpdateAnimated:0];
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_5(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = [WeakRetained contentViewsHiddenAnimationCount];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    [v5 _removeSnapshotView:*(void *)(a1 + 32)];
  }
}

void __56__PUCropToolController__performGeometryChange_animated___block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 compositionController];
  [v5 imageOrientation];
  [*(id *)(a1 + 40) userOrientation];
  [v4 setOrientation:PLOrientationConcat()];
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    id v5 = [(PUCropToolController *)self cropView];
    [(PUCropToolController *)self gainMapValue];
    objc_msgSend(v5, "setGainMapValue:");
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    id v6 = [(PUCropToolController *)self cropView];
    [v6 setGainMapImage:self->_gainMapImage];
  }
}

- (void)setCropAspect:(id)a3
{
}

- (void)setYawAngle:(double)a3
{
}

- (void)setPitchAngle:(double)a3
{
}

- (void)setStraightenAngle:(double)a3
{
}

- (void)setViewCropRect:(CGRect)a3
{
}

- (void)_handleDidCreateEditedImage:(id)a3 inputExtent:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v20 = a3;
  uint64_t v9 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v10 = [v9 imageOrientation];

  double v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A880]), "initWithInputSize:inputOrientation:", v10, width, height);
  [(PUCropToolController *)self setGeometry:v11];
  id v12 = [(PUCropToolController *)self cropView];
  if (width <= 0.0 || height <= 0.0)
  {
    if (!v20) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  double v13 = (NUCropModel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F7A418]), "initWithMasterImageSize:", width, height);
  cropModel = self->_cropModel;
  self->_cropModel = v13;

  double v15 = self->_cropModel;
  [(NUCropModel *)v15 masterImageSize];
  uint64_t v17 = (uint64_t)v16;
  [(NUCropModel *)self->_cropModel masterImageSize];
  -[NUCropModel setAspectRatio:](v15, "setAspectRatio:", v17, (uint64_t)v18);
  double v19 = [(PUPhotoEditToolController *)self compositionController];
  [(PUCropToolController *)self _setupCropModelFromCompositionController:v19];

  [v12 _setCropModel:self->_cropModel];
  if (v20)
  {
    [v12 setImage:v20];
LABEL_6:
    [(PUCropToolController *)self setImage:v20];
    goto LABEL_8;
  }
  objc_msgSend(v12, "setImageSize:", width, height);
LABEL_8:
  -[PUCropToolController setInputExtent:](self, "setInputExtent:", x, y, width, height);
  [(PUCropToolController *)self _installRenderedImageAndDisplayIfNeeded];
}

- (void)_setupCropModelFromCompositionController:(id)a3
{
  id v4 = [a3 cropAdjustmentController];
  id v5 = v4;
  if (v4)
  {
    double v15 = v4;
    int v6 = [v4 enabled];
    id v5 = v15;
    if (v6)
    {
      cropModel = self->_cropModel;
      [v15 yawRadians];
      -[NUCropModel setYawRadians:](cropModel, "setYawRadians:");
      CGAffineTransform v8 = self->_cropModel;
      [v15 pitchRadians];
      -[NUCropModel setPitchRadians:](v8, "setPitchRadians:");
      uint64_t v9 = self->_cropModel;
      [v15 angleRadians];
      -[NUCropModel setRollRadians:](v9, "setRollRadians:");
      uint64_t v10 = self->_cropModel;
      [v15 cropRect];
      -[NUCropModel setCropRect:](v10, "setCropRect:");
      double v11 = self->_cropModel;
      [v15 cropRect];
      uint64_t v13 = (uint64_t)v12;
      [v15 cropRect];
      -[NUCropModel setAspectRatio:](v11, "setAspectRatio:", v13, (uint64_t)v14);
      id v5 = v15;
    }
  }
}

- (void)_loadMediaIfNeeded
{
  if ([(PUCropToolController *)self needsMediaLoad])
  {
    [(PUCropToolController *)self setNeedsMediaLoad:0];
    double v3 = [(PUPhotoEditToolController *)self delegate];
    id v4 = [(PUCropToolController *)self cropView];
    id v5 = [(PUPhotoEditToolController *)self compositionController];
    int v6 = [v5 composition];

    if ([v3 isStandardVideo])
    {
      long long v12 = 0uLL;
      uint64_t v13 = 0;
      id v7 = [v3 mediaView];
      CGAffineTransform v8 = [v7 player];
      uint64_t v9 = v8;
      if (v8)
      {
        [v8 currentTime];
      }
      else
      {
        long long v12 = 0uLL;
        uint64_t v13 = 0;
      }

      long long v10 = v12;
      uint64_t v11 = v13;
      [v4 setVideoComposition:v6 withSeekTime:&v10];
    }
    else if ([v3 isLoopingVideo])
    {
      [v4 setAutoloopComposition:v6];
    }
    [(PUCropToolController *)self _installRenderedImageAndDisplayIfNeeded];
  }
}

- (void)_loadImageIfNeededWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (![(PUCropToolController *)self needsImageLoad])
  {
    if (v4) {
      v4[2](v4);
    }
    goto LABEL_11;
  }
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v5 = [(PUCropToolController *)self imageLoadingQueue];

    if (!v5)
    {
      int v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v7 = (OS_dispatch_queue *)dispatch_queue_create("PUCropToolController image loading", v6);
      imageLoadingQueue = self->_imageLoadingQueue;
      self->_imageLoadingQueue = v7;

      uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      imageLoadingQueueCompletionBlocks = self->_imageLoadingQueueCompletionBlocks;
      self->_imageLoadingQueueCompletionBlocks = v9;
    }
    if (v4)
    {
      uint64_t v11 = [(PUCropToolController *)self imageLoadingQueueCompletionBlocks];
      long long v12 = _Block_copy(v4);
      [v11 addObject:v12];
    }
    if (![(PUCropToolController *)self imageLoadingInProgress])
    {
      [(PUCropToolController *)self setImageLoadingInProgress:1];
      uint64_t v13 = [(PUPhotoEditToolController *)self delegate];
      [v13 updateProgressIndicatorAnimated:1];

      double v14 = [(PUCropToolController *)self imageLoadingQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke;
      block[3] = &unk_1E5F2ED10;
      block[4] = self;
      dispatch_async(v14, block);
    }
LABEL_11:

    return;
  }
  uint64_t v15 = _PFAssertFailHandler();
  __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke(v15);
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  double v3 = [*(id *)(a1 + 32) cropView];
  id v4 = [v3 _screen];

  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  [v4 scale];
  double v10 = v9;
  if (v6 >= v8) {
    double v8 = v6;
  }
  uint64_t v11 = [*v2 delegate];
  char v12 = [v11 isStandardVideo];

  if (v12)
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_2;
    v49[3] = &unk_1E5F2ED10;
    v49[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v49);
  }
  else
  {
    v63[0] = 0;
    v63[1] = v63;
    v63[2] = 0x3032000000;
    v63[3] = __Block_byref_object_copy__21679;
    v63[4] = __Block_byref_object_dispose__21680;
    id v64 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = (CGRect *)&v57;
    uint64_t v59 = 0x4010000000;
    CGAffineTransform v60 = "";
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v61 = *MEMORY[0x1E4F1DB28];
    long long v62 = v13;
    [*(id *)(a1 + 32) _createRendererIfNeeded];
    double v14 = [*(id *)(a1 + 32) renderer];

    if (v14)
    {
      if ([*(id *)(a1 + 32) isHDREnabled])
      {
        [MEMORY[0x1E4F7A798] maximumEDRHeadroomForScreen:v4];
        double v16 = v15;
        uint64_t v17 = [*(id *)(a1 + 32) renderer];
        [v17 setDisplayMaximumEDRHeadroom:v16];

        [MEMORY[0x1E4F7A798] currentEDRHeadroomForScreen:v4];
        double v19 = v18;
        id v20 = [*(id *)(a1 + 32) renderer];
        [v20 setDisplayCurrentEDRHeadroom:v19];
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v22 = v21;
      double v23 = PLPhotoEditGetLog();
      os_signpost_id_t v24 = os_signpost_id_generate(v23);

      double v25 = PLPhotoEditGetLog();
      CGFloat v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "EditCropToolRender", "", buf, 2u);
      }

      dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
      CGFloat v28 = [*(id *)(a1 + 32) renderer];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_159;
      v53[3] = &unk_1E5F24700;
      CGAffineTransform v55 = v63;
      double v56 = &v57;
      double v29 = v27;
      id v54 = v29;
      *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
      *(void *)&uint8_t buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      objc_msgSend(v28, "renderImageWithTargetSize:contentMode:renderMode:renderTime:name:completion:", 0, 1, buf, @"PUCropTool-loadImage", v53, v10 * v8, v10 * v8);

      dispatch_time_t v30 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v29, v30))
      {
        uint64_t v31 = PLPhotoEditGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_ERROR, "Rendering semaphore timed out in [PUCropToolController _loadImageIfNeeded]", buf, 2u);
        }
      }
      if (CGRectIsEmpty(v58[1]))
      {
        uint64_t v32 = [*(id *)(a1 + 32) renderer];
        double v33 = [*(id *)(a1 + 32) compositionController];
        uint64_t v34 = [v33 composition];
        uint64_t v35 = [MEMORY[0x1E4F8A358] pipelineFiltersForCropping];
        uint64_t v36 = [v32 getGeometryForComposition:v34 pipelineFilters:v35];

        if (v36)
        {
          [v36 extent];
        }
        else
        {
          long long v51 = 0u;
          long long v52 = 0u;
        }
        NUPixelRectToCGRect();
        p_double x = (void *)&v58->origin.x;
        v58[1].origin.double x = v38;
        p_x[5] = v39;
        p_x[6] = v40;
        p_x[7] = v41;
      }
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v43 = v42;
      uint64_t v44 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        double height = v58[1].size.height;
        uint64_t width = (uint64_t)v58[1].size.width;
        *(_DWORD *)buf = 134218496;
        *(void *)&uint8_t buf[4] = (uint64_t)((v43 - v22) * 1000.0);
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = width;
        *(_WORD *)&buf[22] = 2048;
        uint64_t v66 = (uint64_t)height;
        _os_log_impl(&dword_1AE9F8000, v44, OS_LOG_TYPE_DEFAULT, "Crop rendering took %ldms for size %ld x %ld", buf, 0x20u);
      }

      uint64_t v47 = PLPhotoEditGetLog();
      double v48 = v47;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v48, OS_SIGNPOST_INTERVAL_END, v24, "EditCropToolRender", "", buf, 2u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_163;
    block[3] = &unk_1E5F2B800;
    block[4] = *(void *)(a1 + 32);
    void block[5] = v63;
    block[6] = &v57;
    dispatch_async(MEMORY[0x1E4F14428], block);
    _Block_object_dispose(&v57, 8);
    _Block_object_dispose(v63, 8);
  }
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_159(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  if (v13)
  {
    double v14 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138412290;
      id v20 = v13;
      _os_log_impl(&dword_1AE9F8000, v14, OS_LOG_TYPE_ERROR, "Error rendering image in [PUCropToolController _loadImageIfNeeded]; this is likely fatal : %@",
        (uint8_t *)&v19,
        0xCu);
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    double v18 = *(double **)(*(void *)(a1 + 48) + 8);
    v18[4] = a4;
    v18[5] = a5;
    v18[6] = a6;
    void v18[7] = a7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_163(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) imageLoadingQueueCompletionBlocks];
  double v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) imageLoadingQueueCompletionBlocks];
  [v4 removeAllObjects];

  [*(id *)(a1 + 32) setImageLoadingInProgress:0];
  [*(id *)(a1 + 32) setNeedsImageLoad:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) == 0];
  [*(id *)(a1 + 32) setInitialImageLoaded:1];
  if (!CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32))) {
    objc_msgSend(*(id *)(a1 + 32), "_handleDidCreateEditedImage:inputExtent:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  double v10 = objc_msgSend(*(id *)(a1 + 32), "delegate", (void)v11);
  [v10 updateProgressIndicatorAnimated:1];

  [*(id *)(a1 + 32) updateAspectRatioLockButton];
}

void __57__PUCropToolController__loadImageIfNeededWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) imageLoadingQueueCompletionBlocks];
  double v3 = (void *)[v2 copy];

  id v4 = [*(id *)(a1 + 32) imageLoadingQueueCompletionBlocks];
  [v4 removeAllObjects];

  [*(id *)(a1 + 32) setImageLoadingInProgress:0];
  [*(id *)(a1 + 32) setInitialImageLoaded:1];
  [*(id *)(a1 + 32) _createRendererIfNeeded];
  id v5 = [*(id *)(a1 + 32) renderer];

  if (v5)
  {
    [*(id *)(a1 + 32) setNeedsImageLoad:0];
    uint64_t v6 = [*(id *)(a1 + 32) renderer];
    uint64_t v7 = [*(id *)(a1 + 32) compositionController];
    uint64_t v8 = [v7 composition];
    uint64_t v9 = [MEMORY[0x1E4F8A358] pipelineFiltersForCropping];
    double v10 = [v6 getGeometryForComposition:v8 pipelineFilters:v9];

    [v10 size];
    NUPixelSizeToCGSize();
    objc_msgSend(*(id *)(a1 + 32), "_handleDidCreateEditedImage:inputExtent:", 0, 0.0, 0.0, v11, v12);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = v3;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v19 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  double v18 = objc_msgSend(*(id *)(a1 + 32), "delegate", (void)v19);
  [v18 updateProgressIndicatorAnimated:1];

  [*(id *)(a1 + 32) updateAspectRatioLockButton];
}

- (void)_createRendererIfNeeded
{
  double v3 = [(PUCropToolController *)self renderer];

  if (v3)
  {
    id v9 = [(PUPhotoEditToolController *)self compositionController];
    id v4 = [(PUCropToolController *)self renderer];
    id v5 = v4;
    id v6 = v9;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F8AA60]);
    uint64_t v8 = [(PUPhotoEditToolController *)self editSource];
    id v9 = (id)[v7 initWithEditSource:v8 renderPriority:3];

    [(PUCropToolController *)self setRenderer:v9];
    id v5 = [(PUPhotoEditToolController *)self compositionController];
    id v4 = v9;
    id v6 = v5;
  }
  [v4 setCompositionController:v6];
}

- (void)_performLocalCropModelChanges:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PUCropToolController__performLocalCropModelChanges___block_invoke;
  v6[3] = &unk_1E5F2EA60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUCropToolController *)self _performLocalModelChanges:v6];
}

void __54__PUCropToolController__performLocalCropModelChanges___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) compositionController];
  double v3 = [MEMORY[0x1E4F8A748] adjustmentConstants];
  id v4 = [v3 PICropAdjustmentKey];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PUCropToolController__performLocalCropModelChanges___block_invoke_2;
  v6[3] = &unk_1E5F246D8;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v2 modifyAdjustmentWithKey:v4 modificationBlock:v6];
}

void __54__PUCropToolController__performLocalCropModelChanges___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(void (**)(uint64_t, id))(v3 + 16);
  id v6 = a2;
  v4(v3, v6);
  id v5 = [*(id *)(a1 + 32) cropModel];
  [v5 masterImageSize];
  LODWORD(v3) = objc_msgSend(v6, "isCropIdentityForImageSize:");

  [v6 setEnabled:v3 ^ 1];
}

- (void)_performLocalModelChanges:(id)a3
{
  id v9 = (void (**)(void))a3;
  if (!v9)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PUCropToolController.m", 700, @"Invalid parameter not satisfying: %@", @"changes != nil" object file lineNumber description];
  }
  id v5 = [(PUPhotoEditToolController *)self compositionController];

  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PUCropToolController.m" lineNumber:701 description:@"Need a composition to perform this operation"];
  }
  BOOL v6 = [(PUCropToolController *)self isModelChangeLocal];
  [(PUCropToolController *)self setModelChangeLocal:1];
  v9[2]();
  [(PUCropToolController *)self setModelChangeLocal:v6];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoEditToolController *)self delegate];

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)PUCropToolController;
    [(PUPhotoEditToolController *)&v6 setDelegate:v4];
  }
}

- (id)filter
{
  return 0;
}

- (void)_updateCropToggleConstraintsIfNeeded
{
  uint64_t v3 = [(PUCropToolController *)self cropAspectViewController];
  id v67 = [v3 view];

  id v4 = [(PUCropToolController *)self cropAspectFlipperView];
  if (![(PUCropToolController *)self _hasConstraintsForKey:@"PUCropToggleConstraints"])
  {
    id v5 = objc_opt_new();
    objc_super v6 = [(PUPhotoEditToolController *)self photoEditSpec];
    uint64_t v7 = [v6 currentLayoutStyle];

    int64_t v8 = [(PUPhotoEditToolController *)self layoutOrientation];
    if (v8 == 2)
    {
      if (!v67)
      {
LABEL_12:
        uint64_t v66 = [(PUCropToolController *)self view];
        objc_msgSend(v66, "pu_addConstraints:forKey:", v5, @"PUCropToggleConstraints");

        goto LABEL_13;
      }
      double v29 = [v67 rightAnchor];
      dispatch_time_t v30 = [(PUCropToolController *)self view];
      uint64_t v31 = [v30 rightAnchor];
      uint64_t v32 = [v29 constraintEqualToAnchor:v31];
      [v5 addObject:v32];

      if (v7 != 4)
      {
        uint64_t v44 = [v67 topAnchor];
        uint64_t v45 = [(PUCropToolController *)self view];
        double v46 = [v45 topAnchor];
        [(PUCropToolController *)self additionalSafeAreaInsets];
        uint64_t v47 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46);
        [v5 addObject:v47];

        double v48 = [v67 bottomAnchor];
        double v49 = [(PUCropToolController *)self view];
        uint64_t v50 = [v49 bottomAnchor];
        long long v51 = [v48 constraintEqualToAnchor:v50];
        [v5 addObject:v51];

        long long v52 = [v4 leftAnchor];
        id v53 = [(PUCropToolController *)self view];
        id v54 = [v53 safeAreaLayoutGuide];
        CGAffineTransform v55 = [v54 leftAnchor];
        double v56 = [v52 constraintEqualToAnchor:v55];
        [v5 addObject:v56];

        uint64_t v57 = [(PUCropToolController *)self view];
        uint64_t v58 = [(PUCropToolController *)self view];
        uint64_t v59 = [v58 window];
        objc_msgSend(v57, "convertPoint:toView:", v59, 0.0, 0.0);
        double v61 = v60;

        long long v62 = [v4 centerYAnchor];
        id v63 = [(PUCropToolController *)self view];
        id v64 = [v63 centerYAnchor];
        CGRect v65 = [v62 constraintEqualToAnchor:v64 constant:v61 * -0.5];
        [v5 addObject:v65];

        [v4 setLayoutOrientation:1];
        uint64_t v41 = [(PUCropToolController *)self cropAspectViewController];
        double v42 = v41;
        uint64_t v43 = 1;
        goto LABEL_11;
      }
      double v33 = [v67 bottomAnchor];
      uint64_t v34 = [(PUCropToolController *)self view];
      uint64_t v35 = [v34 bottomAnchor];
      uint64_t v36 = [v33 constraintEqualToAnchor:v35 constant:-27.0];
      [v5 addObject:v36];

      double v37 = [v67 heightAnchor];
      CGFloat v38 = [v37 constraintEqualToConstant:38.0];
      [v5 addObject:v38];

      CGFloat v26 = [v67 leftAnchor];
      dispatch_semaphore_t v27 = [(PUCropToolController *)self view];
      uint64_t v28 = [v27 leftAnchor];
    }
    else
    {
      if (v8 != 1 || !v67) {
        goto LABEL_12;
      }
      id v9 = [v67 leftAnchor];
      double v10 = [(PUCropToolController *)self view];
      double v11 = [v10 leftAnchor];
      double v12 = [v9 constraintEqualToAnchor:v11];
      [v5 addObject:v12];

      id v13 = [v67 rightAnchor];
      uint64_t v14 = [(PUCropToolController *)self view];
      uint64_t v15 = [v14 rightAnchor];
      uint64_t v16 = [v13 constraintEqualToAnchor:v15];
      [v5 addObject:v16];

      uint64_t v17 = [v67 bottomAnchor];
      double v18 = [(PUCropToolController *)self view];
      long long v19 = [v18 bottomAnchor];
      long long v20 = [v17 constraintEqualToAnchor:v19 constant:-10.0];
      [v5 addObject:v20];

      long long v21 = [v67 heightAnchor];
      long long v22 = [v21 constraintEqualToConstant:38.0];
      [v5 addObject:v22];

      double v23 = [v4 bottomAnchor];
      uint64_t v24 = [v67 topAnchor];
      double v25 = [v23 constraintEqualToAnchor:v24 constant:-17.0];
      [v5 addObject:v25];

      CGFloat v26 = [v4 centerXAnchor];
      dispatch_semaphore_t v27 = [(PUCropToolController *)self view];
      uint64_t v28 = [v27 centerXAnchor];
    }
    uint64_t v39 = (void *)v28;
    uint64_t v40 = [v26 constraintEqualToAnchor:v28];
    [v5 addObject:v40];

    [v4 setLayoutOrientation:0];
    uint64_t v41 = [(PUCropToolController *)self cropAspectViewController];
    double v42 = v41;
    uint64_t v43 = 0;
LABEL_11:
    [v41 setLayoutOrientation:v43];

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_updateCropCanvasConstraintsIfNeeded
{
  if ([(PUCropToolController *)self _hasConstraintsForKey:@"PUCropCanvasConstraints"]) {
    return;
  }
  uint64_t v3 = [(PUPhotoEditToolController *)self toolControllerSpec];
  [v3 minimumCropInset];
  double v5 = v4;

  int64_t v6 = [(PUPhotoEditToolController *)self layoutOrientation];
  uint64_t v7 = [(PUPhotoEditToolController *)self toolControllerSpec];
  int64_t v8 = v7;
  if (v6 == 1)
  {
    [v7 standardBottomBarHeight];
    double v10 = v9;
    double v11 = v5;
    double v12 = v5;
LABEL_7:

    goto LABEL_8;
  }
  [v7 standardSideBarWidth];
  double v11 = v13;

  uint64_t v14 = [(PUPhotoEditToolController *)self toolControllerSpec];
  [v14 cropAspectRatioScrollHeight];
  double v10 = v15;

  uint64_t v16 = [(PUPhotoEditToolController *)self photoEditSpec];
  uint64_t v17 = [v16 currentLayoutStyle];

  if (v17 != 4)
  {
    int64_t v8 = [(PUPhotoEditToolController *)self toolControllerSpec];
    [v8 cropAspectFlipperWidth];
    double v12 = v18;
    goto LABEL_7;
  }
  double v12 = v11;
LABEL_8:
  id v35 = [(PUCropToolController *)self cropCanvasView];
  long long v19 = [(PUCropToolController *)self view];
  long long v20 = [v19 safeAreaLayoutGuide];

  long long v21 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = [v20 leftAnchor];
  double v23 = [v35 leftAnchor];
  uint64_t v24 = [v22 constraintEqualToAnchor:v23 constant:-v12];
  [v21 addObject:v24];

  double v25 = [v20 rightAnchor];
  CGFloat v26 = [v35 rightAnchor];
  dispatch_semaphore_t v27 = [v25 constraintEqualToAnchor:v26 constant:v11];
  [v21 addObject:v27];

  uint64_t v28 = [v20 topAnchor];
  double v29 = [v35 topAnchor];
  dispatch_time_t v30 = [v28 constraintEqualToAnchor:v29 constant:-v5];
  [v21 addObject:v30];

  uint64_t v31 = [v20 bottomAnchor];
  uint64_t v32 = [v35 bottomAnchor];
  double v33 = [v31 constraintEqualToAnchor:v32 constant:v10];
  [v21 addObject:v33];

  uint64_t v34 = [(PUCropToolController *)self view];
  objc_msgSend(v34, "pu_addConstraints:forKey:", v21, @"PUCropCanvasConstraints");
}

- (BOOL)_hasConstraintsForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(PUCropToolController *)self view];
  char v6 = objc_msgSend(v5, "pu_hasConstraintForKey:", v4);

  return v6;
}

- (void)_invalidateConstraintsForKey:(id)a3
{
  id v5 = a3;
  if ([(PUCropToolController *)self isViewLoaded])
  {
    id v4 = [(PUCropToolController *)self view];
    objc_msgSend(v4, "pu_removeAllConstraintsForKey:", v5);
  }
}

- (void)_updateBadgeTextWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCropToolController *)self badgeView];
  char v6 = [v4 localizedName];

  uint64_t v7 = [v6 localizedUppercaseString];
  [v5 _setText:v7];

  int64_t v8 = [(PUCropToolController *)self badgeView];
  [v8 sizeToFit];

  [(PUCropToolController *)self _layoutAdjustmentTools];
}

- (void)adjustmentsViewControllerSliderDidEndScrubbing:(id)a3
{
  [(PUCropToolController *)self resetToolLabelHidingTimer];
  [(PUCropToolController *)self setTrackingAdjustmentControl:0];
  [(PUCropToolController *)self _updateCropViewsForInteraction];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
}

- (void)adjustmentsViewControllerSliderWillEndScrubbing:(id)a3
{
}

- (void)adjustmentsViewControllerSliderWillBeginScrubbing:(id)a3
{
  [(PUCropToolController *)self showVideoScrubber:0];
  [(PUCropToolController *)self setTrackingAdjustmentControl:1];
  [(PUCropToolController *)self _updateCropViewsForInteraction];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
}

- (void)adjustmentsViewControllerToolDidEndScrubbing:(id)a3
{
  if ([(PUCropToolController *)self toolBadgeDoesHide])
  {
    [(PUCropToolController *)self resetToolLabelHidingTimer];
  }
}

- (void)adjustmentsViewControllerToolWillBeginScrubbing:(id)a3
{
  if ([(PUCropToolController *)self toolBadgeDoesHide])
  {
    [(PUCropToolController *)self showToolLabel];
  }
}

- (void)adjustmentsViewControllerDidUpdateSelectedControl:(id)a3
{
  id v4 = [a3 selectedAdjustmentInfo];
  [(PUCropToolController *)self _updateBadgeTextWithInfo:v4];

  if ([(PUCropToolController *)self toolBadgeDoesHide])
  {
    [(PUCropToolController *)self resetToolLabelHidingTimer];
  }
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v10 setupWithAsset:a3 compositionController:a4 editSource:a5 valuesCalculator:a6];
  uint64_t v7 = [(PUCropToolController *)self dataSource];
  int64_t v8 = [(PUPhotoEditToolController *)self compositionController];
  double v9 = [(PUPhotoEditToolController *)self valuesCalculator];
  [v7 setupWithCompositionController:v8 valuesCalculator:v9];
}

- (void)updateViewConstraints
{
  [(PUCropToolController *)self _updateCropCanvasConstraintsIfNeeded];
  [(PUCropToolController *)self _updateCropToggleConstraintsIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PUCropToolController;
  [(PUCropToolController *)&v3 updateViewConstraints];
}

- (void)viewDidLayoutSubviews
{
  v116.receiver = self;
  v116.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v116 viewDidLayoutSubviews];
  objc_super v3 = [(PUPhotoEditToolController *)self delegate];
  id v4 = [v3 toolControllerMainContainerView:self];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(PUCropToolController *)self view];
  }
  uint64_t v7 = v6;

  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [(PUCropToolController *)self cropOverlayView];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  uint64_t v17 = [(PUCropToolController *)self view];
  [v7 bounds];
  UIRectGetCenter();
  objc_msgSend(v17, "convertPoint:fromView:", v7);
  double v19 = v18;
  double v21 = v20;

  long long v22 = [(PUCropToolController *)self cropOverlayView];
  objc_msgSend(v22, "setCenter:", v19, v21);

  [(PUCropToolController *)self _cropCanvasFrame];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  uint64_t v31 = [(PUCropToolController *)self cropView];
  objc_msgSend(v31, "setCanvasFrame:", v24, v26, v28, v30);

  if ([(PUCropToolController *)self modelLoadingSuspended]) {
    goto LABEL_9;
  }
  uint64_t v32 = [(PUPhotoEditToolController *)self compositionController];
  if (!v32) {
    goto LABEL_9;
  }
  double v33 = (void *)v32;
  if (![(PUCropToolController *)self needsModelLoad])
  {
    uint64_t v34 = [(PUCropToolController *)self cropView];
    [v34 frame];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    [(PUCropToolController *)self cropViewFrameForLastModelLoad];
    v131.origin.double x = v43;
    v131.origin.double y = v44;
    v131.size.uint64_t width = v45;
    v131.size.double height = v46;
    v117.origin.double x = v36;
    v117.origin.double y = v38;
    v117.size.uint64_t width = v40;
    v117.size.double height = v42;
    BOOL v47 = CGRectEqualToRect(v117, v131);

    if (!v47) {
      goto LABEL_10;
    }
LABEL_9:
    double v48 = [(PUCropToolController *)self cropView];
    [v48 setNeedsLayout];

    goto LABEL_11;
  }

LABEL_10:
  [(PUCropToolController *)self _loadStateFromModelAnimated:0];
LABEL_11:
  [(PUCropToolController *)self _layoutAdjustmentTools];
  double v49 = [(PUPhotoEditToolController *)self photoEditSpec];
  [v49 scrubberViewMargin];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;

  double v56 = [(PUCropToolController *)self cropOverlayView];
  uint64_t v57 = [v56 cropWindowView];

  uint64_t v58 = [(PUCropToolController *)self view];
  [v57 frame];
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  id v67 = [v57 superview];
  objc_msgSend(v58, "convertRect:fromView:", v67, v60, v62, v64, v66);
  double v69 = v68;
  CGFloat v71 = v70;
  double v73 = v72;
  CGFloat Height = v74;

  v118.origin.double x = v69;
  v118.origin.double y = v71;
  v118.size.uint64_t width = v73;
  v118.size.double height = Height;
  if (CGRectGetWidth(v118) >= 210.0)
  {
    uint64_t v80 = 2;
  }
  else if ([(PUPhotoEditToolController *)self layoutOrientation] == 1)
  {
    v119.origin.double x = v69;
    v119.origin.double y = v71;
    v119.size.uint64_t width = v73;
    v119.size.double height = Height;
    CGFloat MinY = CGRectGetMinY(v119);
    [v7 frame];
    double v76 = v55;
    double v77 = v53;
    double v78 = v51;
    CGFloat Width = CGRectGetWidth(v120);
    v121.origin.double x = v69;
    v121.origin.double y = v71;
    v121.size.uint64_t width = v73;
    v121.size.double height = Height;
    CGFloat Height = CGRectGetHeight(v121);
    uint64_t v80 = 0;
    double v69 = 0.0;
    double v73 = Width;
    double v51 = v78;
    double v53 = v77;
    double v55 = v76;
    CGFloat v71 = MinY;
  }
  else
  {
    v81 = [(PUCropToolController *)self view];
    [v81 frame];
    double v82 = CGRectGetWidth(v122);
    double v83 = [(PUPhotoEditToolController *)self toolContainerView];
    [v83 frame];
    double v84 = v82 - CGRectGetWidth(v123);

    v124.origin.double x = v69;
    v124.origin.double y = v71;
    v124.size.uint64_t width = v73;
    v124.size.double height = Height;
    CGFloat MidX = CGRectGetMidX(v124);
    double v86 = v84 - MidX + v84 - MidX;
    v125.origin.double x = v69;
    v125.origin.double y = v71;
    v125.size.uint64_t width = v73;
    v125.size.double height = Height;
    uint64_t v80 = 0;
    double v87 = v86 - CGRectGetWidth(v125);
    double v88 = v87 * 0.5;
    BOOL v89 = v87 == 0.0;
    if (v87 == 0.0) {
      double v87 = -0.0;
    }
    double v73 = v73 + v87;
    double v90 = 0.0;
    if (!v89) {
      double v90 = v88;
    }
    double v69 = v69 - v90;
  }
  double v115 = v51;
  v126.origin.double x = v69;
  v126.origin.double y = v71;
  v126.size.uint64_t width = v73;
  v126.size.double height = Height;
  CGFloat v91 = fmin(CGRectGetWidth(v126) - v51 - v55, 477.0);
  v92 = [(PUCropToolController *)self videoScrubberView];
  [v92 intrinsicContentSize];
  double v94 = v93;

  v127.origin.double x = v69;
  v127.origin.double y = v71;
  v127.size.uint64_t width = v73;
  v127.size.double height = Height;
  CGFloat v95 = CGRectGetMidX(v127) + v91 * -0.5;
  v128.origin.double x = v69;
  v128.origin.double y = v71;
  v128.size.uint64_t width = v73;
  v128.size.double height = Height;
  CGFloat v96 = CGRectGetMaxY(v128) - v94 - v53;
  long long v97 = [(PUCropToolController *)self playPauseButton];
  [v97 sizeToFit];

  long long v98 = [(PUCropToolController *)self playPauseButton];
  [v98 frame];
  double v100 = v99;
  double v102 = v101;

  v129.origin.double x = v95;
  v129.origin.double y = v96;
  v129.size.uint64_t width = v91;
  v129.size.double height = v94;
  double MinX = CGRectGetMinX(v129);
  v130.origin.double x = v95;
  v130.origin.double y = v96;
  v130.size.uint64_t width = v91;
  v130.size.double height = v94;
  CGFloat v104 = CGRectGetMinY(v130) + -7.0;
  CGRect v105 = [(PUCropToolController *)self playPauseButton];
  objc_msgSend(v105, "setFrame:", MinX, v104, v100, v102);

  v106 = [(PUCropToolController *)self videoScrubberView];
  objc_msgSend(v106, "setFrame:", v95 + v115 + v100, v96, v91 + (v115 + v100) * -2.0, v94);

  CGRect v107 = [(PUCropToolController *)self videoScrubberView];
  [v107 setOverrideUserInterfaceStyle:v80];

  v108 = [(PUCropToolController *)self videoScrubberView];

  if (v108)
  {
    v109 = [(PUCropToolController *)self view];
    v110 = [(PUCropToolController *)self videoScrubberView];
    [v109 bringSubviewToFront:v110];
  }
  v111 = [(PUCropToolController *)self playPauseButton];

  if (v111)
  {
    v112 = [(PUCropToolController *)self view];
    v113 = [(PUCropToolController *)self playPauseButton];
    [v112 bringSubviewToFront:v113];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v10 viewDidAppear:a3];
  [(PUCropToolController *)self resetToolLabelHidingTimer];
  id v4 = [(PUCropToolController *)self cropView];
  id v5 = [(PUPhotoEditToolController *)self delegate];
  objc_msgSend(v4, "setShouldEnableImageModulation:", objc_msgSend(v5, "toolControllerShouldEnableImageModulation:", self));

  id v6 = [(PUCropToolController *)self cropView];
  uint64_t v7 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v8 = [v7 toolControllerImageModulationOptions:self];
  objc_msgSend(v6, "setImageModulationOptions:", v8, v9);
}

- (void)_layoutAdjustmentTools
{
  int64_t v3 = [(PUPhotoEditToolController *)self layoutOrientation];
  id v4 = [(PUPhotoEditToolController *)self photoEditSpec];
  uint64_t v5 = [v4 currentLayoutStyle];

  id v6 = [(PUCropToolController *)self view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  if (v12 >= v14) {
    double v15 = v12;
  }
  else {
    double v15 = v14;
  }
  [(PUPhotoEditToolController *)self setToolGradientDistance:v15];
  if (v5 == 4)
  {
    uint64_t v16 = [(PUPhotoEditToolController *)self toolContainerView];
    [v16 bounds];
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:1];
    uint64_t v17 = [(PUPhotoEditToolController *)self toolContainerView];
    [v17 frame];
    double MinX = CGRectGetMinX(v61);

    double v19 = [(PUPhotoEditToolController *)self toolContainerView];
    [v19 center];
    double v21 = v20;

    long long v22 = [(PUCropToolController *)self badgeView];
    [v22 bounds];
    double v24 = MinX + v23 * -0.5 + -6.0;

    id v58 = [(PUCropToolController *)self badgeView];
    objc_msgSend(v58, "setCenter:", v24, v21);
  }
  else
  {
    if (v3 == 1)
    {
      [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:0];
      adjustmentPickerView = self->_adjustmentPickerView;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v59[0] = *MEMORY[0x1E4F1DAB8];
      v59[1] = v26;
      v59[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [(UIView *)adjustmentPickerView setTransform:v59];
      double v27 = [(PUPhotoEditToolController *)self toolContainerView];
      [v27 frame];
      -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

      double v28 = [(PUPhotoEditToolController *)self toolContainerView];
      [v28 bounds];
      UIRectGetCenter();
      -[UIView setCenter:](self->_adjustmentPickerView, "setCenter:");

      double v29 = [(PUPhotoEditToolController *)self toolContainerView];
      [v29 frame];
      double MinY = CGRectGetMinY(v62);

      UIRectGetCenter();
      double v32 = v31;
      double v33 = [(PUCropToolController *)self badgeView];
      [v33 bounds];
      double v35 = MinY + v34 * -0.5 + -6.0;

      CGFloat v36 = [(PUCropToolController *)self badgeView];
      objc_msgSend(v36, "setCenter:", v32, v35);

      return;
    }
    double v37 = [(PUPhotoEditToolController *)self toolContainerView];
    [v37 bounds];
    -[UIView setFrame:](self->_adjustmentPickerView, "setFrame:");

    [(PUAdjustmentsViewController *)self->_adjustmentsViewController setLayoutDirection:1];
    CGFloat v38 = [(PUPhotoEditToolController *)self delegate];
    double v39 = [v38 toolControllerMainContainerView:self];
    CGFloat v40 = v39;
    if (v39)
    {
      id v41 = v39;
    }
    else
    {
      id v41 = [(PUCropToolController *)self view];
    }
    id v58 = v41;

    [v58 bounds];
    UIRectGetCenter();
    double v43 = v42;
    CGFloat v44 = [(PUCropToolController *)self view];
    [v44 safeAreaInsets];
    CGFloat v46 = v8 + v45;
    CGFloat v48 = v10 + v47;
    CGFloat v50 = v12 - (v45 + v49);
    CGFloat v52 = v14 - (v47 + v51);

    v63.origin.double x = v46;
    v63.origin.double y = v48;
    v63.size.uint64_t width = v50;
    v63.size.double height = v52;
    double MaxY = CGRectGetMaxY(v63);
    double v54 = [(PUCropToolController *)self badgeView];
    [v54 bounds];
    double v56 = MaxY + v55 * -0.5;

    uint64_t v57 = [(PUCropToolController *)self badgeView];
    objc_msgSend(v57, "setCenter:", v43, v56);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v8 viewWillAppear:a3];
  [(PUCropToolController *)self setNeedsModelLoad:1];
  id v4 = [(PUPhotoEditToolController *)self delegate];
  int v5 = [v4 isStandardVideo];

  if (v5)
  {
    [(PUCropToolController *)self createVideoScrubber];
    id v6 = [(PUCropToolController *)self videoScrubberView];
    [v6 setAlpha:0.0];

    double v7 = [(PUCropToolController *)self playPauseButton];
    [v7 setAlpha:0.0];
  }
  [(PUCropToolController *)self setToolBadgeDoesHide:1];
  [(PUCropToolController *)self _updateCropActionButtons];
}

- (void)viewDidLoad
{
  v137[2] = *MEMORY[0x1E4F143B8];
  v133.receiver = self;
  v133.super_class = (Class)PUCropToolController;
  [(PUCropToolController *)&v133 viewDidLoad];
  v114 = +[PUInterfaceManager currentTheme];
  int64_t v3 = objc_alloc_init(PUCropToolControllerSpec);
  [(PUPhotoEditToolController *)self setToolControllerSpec:v3];

  id v4 = [(PUCropToolController *)self cropView];
  uint64_t v5 = [(PUCropToolController *)self cropOverlayView];
  id v6 = [(PUPhotoEditToolController *)self toolContainerView];
  double v7 = [(PUCropToolController *)self cropHandleViewsByHandle];
  objc_super v8 = [v7 allValues];

  double v9 = [(PUPhotoEditToolController *)self toolControllerSpec];
  [v9 minimumCropHandleViewSize];
  double v11 = v10;
  double v13 = v12;

  double v115 = _NSDictionaryOfVariableBindings(&cfstr_CropviewContai.isa, v4, v6, 0);
  v136[0] = @"handleWidth";
  double v14 = [NSNumber numberWithDouble:v11];
  v136[1] = @"handleHeight";
  v137[0] = v14;
  double v15 = [NSNumber numberWithDouble:v13];
  v137[1] = v15;
  CGRect v123 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v137 forKeys:v136 count:2];

  uint64_t v16 = [(PUCropToolController *)self view];
  uint64_t v17 = [(PUCropToolController *)self cropCanvasView];
  [v16 addSubview:v17];

  double v18 = [(PUCropToolController *)self view];
  v113 = v4;
  [v18 addSubview:v4];

  double v19 = [(PUCropToolController *)self view];
  objc_super v116 = (void *)v5;
  [v19 addSubview:v5];

  [(PUCropToolController *)self addChildViewController:self->_adjustmentsViewController];
  double v20 = [(PUAdjustmentsViewController *)self->_adjustmentsViewController view];
  adjustmentPickerView = self->_adjustmentPickerView;
  self->_adjustmentPickerView = v20;

  v112 = v6;
  [v6 addSubview:self->_adjustmentPickerView];
  [(PUCropToolController *)self _updateCropActionButtons];
  id v22 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  CGRect v124 = self;
  double v23 = [(PUCropToolController *)self view];
  CGRect v122 = v22;
  [v23 addSubview:v22];

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  id v24 = v8;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v129 objects:v135 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v130;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v130 != v27) {
          objc_enumerationMutation(v24);
        }
        double v29 = *(void **)(*((void *)&v129 + 1) + 8 * i);
        int v30 = [v29 isLateral];
        double v31 = [(PUCropToolController *)v124 view];
        double v32 = v31;
        if (v30) {
          [v31 insertSubview:v29 belowSubview:v22];
        }
        else {
          [v31 insertSubview:v29 aboveSubview:v22];
        }

        double v33 = _NSDictionaryOfVariableBindings(&cfstr_Handleview.isa, v29, 0);
        if (([v29 isRight] & 1) != 0 || objc_msgSend(v29, "isLeft"))
        {
          double v34 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:[handleView(handleWidth)]" options:0x10000 metrics:v123 views:v33];
          [v29 addConstraints:v34];
        }
        if (([v29 isTop] & 1) != 0 || objc_msgSend(v29, "isBottom"))
        {
          double v35 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[handleView(handleHeight)]" options:0 metrics:v123 views:v33];
          [v29 addConstraints:v35];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v129 objects:v135 count:16];
    }
    while (v26);
  }

  [v22 removeFromSuperview];
  CGFloat v36 = [(PUCropToolController *)v124 view];
  double v37 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[cropView]|" options:0x10000 metrics:v123 views:v115];
  [v36 addConstraints:v37];

  CGFloat v38 = [(PUCropToolController *)v124 view];
  double v39 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[cropView]|" options:0 metrics:v123 views:v115];
  [v38 addConstraints:v39];

  CGRect v121 = [MEMORY[0x1E4F1CA48] array];
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  id obj = v24;
  uint64_t v40 = [obj countByEnumeratingWithState:&v125 objects:v134 count:16];
  id v41 = (void *)v5;
  if (v40)
  {
    uint64_t v42 = v40;
    uint64_t v120 = *(void *)v126;
    do
    {
      uint64_t v43 = 0;
      uint64_t v117 = v42;
      do
      {
        if (*(void *)v126 != v120) {
          objc_enumerationMutation(obj);
        }
        CGFloat v44 = *(void **)(*((void *)&v125 + 1) + 8 * v43);
        double v45 = [v44 layoutReferenceItem];
        CGFloat v46 = [v41 layoutReferenceItem];
        if ([v44 isCorner])
        {
          if ([v44 isTop]) {
            uint64_t v47 = 3;
          }
          else {
            uint64_t v47 = 4;
          }
          if ([v44 isLeft]) {
            uint64_t v48 = 1;
          }
          else {
            uint64_t v48 = 2;
          }
          double v49 = [MEMORY[0x1E4F28DC8] constraintWithItem:v45 attribute:v47 relatedBy:0 toItem:v46 attribute:v47 multiplier:1.0 constant:0.0];
          [v121 addObject:v49];

          CGFloat v50 = [MEMORY[0x1E4F28DC8] constraintWithItem:v45 attribute:v48 relatedBy:0 toItem:v46 attribute:v48 multiplier:1.0 constant:0.0];
          [v121 addObject:v50];
        }
        if ([v44 isLateral])
        {
          double v51 = [v44 adjacentHandles];
          CGFloat v52 = [v44 layoutReferenceItem];
          double v53 = [(PUCropToolController *)v124 cropHandleViewsByHandle];
          double v54 = [v51 objectAtIndexedSubscript:0];
          double v55 = [v53 objectForKeyedSubscript:v54];
          id firstValue = [v55 layoutReferenceItem];

          double v56 = [(PUCropToolController *)v124 cropHandleViewsByHandle];
          uint64_t v57 = [v51 objectAtIndexedSubscript:1];
          id v58 = [v56 objectForKeyedSubscript:v57];
          double v59 = [v58 layoutReferenceItem];

          if (([v44 isTop] & 1) != 0 || objc_msgSend(v44, "isBottom"))
          {
            uint64_t v60 = 0x10000;
            CGRect v61 = @"H";
          }
          else
          {
            uint64_t v60 = 0;
            CGRect v61 = @"V";
          }
          if ([v44 isTop])
          {
            uint64_t v62 = 3;
          }
          else if ([v44 isLeft])
          {
            uint64_t v62 = 1;
          }
          else if ([v44 isRight])
          {
            uint64_t v62 = 2;
          }
          else
          {
            uint64_t v62 = 4;
          }
          CGRect v63 = _NSDictionaryOfVariableBindings(&cfstr_Adjacent1Handl.isa, firstValue, v52, v59, 0);
          double v64 = [NSString stringWithFormat:@"%@:[adjacent1][handleItem][adjacent2]", v61];
          double v65 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v64 options:v60 metrics:0 views:v63];
          [v121 addObjectsFromArray:v65];

          double v66 = [MEMORY[0x1E4F28DC8] constraintWithItem:v52 attribute:v62 relatedBy:0 toItem:v46 attribute:v62 multiplier:1.0 constant:0.0];
          [v121 addObject:v66];

          id v41 = v116;
          uint64_t v42 = v117;
        }

        ++v43;
      }
      while (v42 != v43);
      uint64_t v42 = [obj countByEnumeratingWithState:&v125 objects:v134 count:16];
    }
    while (v42);
  }

  [MEMORY[0x1E4F28DC8] activateConstraints:v121];
  id v67 = [(PUCropToolController *)v124 aspectRatioLockButton];
  if (v67) {
    goto LABEL_48;
  }
  double v68 = +[PUPhotoEditProtoSettings sharedInstance];
  int v69 = [v68 maintainCropAspectLockState];

  if (v69)
  {
    double v70 = [MEMORY[0x1E4F90850] buttonWithType:1];
    [(PUCropToolController *)v124 setAspectRatioLockButton:v70];

    CGFloat v71 = [(PUCropToolController *)v124 aspectRatioLockButton];
    [v71 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v72 = [(PUCropToolController *)v124 aspectRatioLockButton];
    [v72 addTarget:v124 action:sel__aspectLockButtonTapped forControlEvents:64];

    double v73 = [(PUCropToolController *)v124 view];
    double v74 = [(PUCropToolController *)v124 aspectRatioLockButton];
    [v73 addSubview:v74];

    double v75 = [(PUCropToolController *)v124 aspectRatioLockButton];
    double v76 = [v75 topAnchor];
    double v77 = [v41 layoutReferenceItem];
    double v78 = [v77 topAnchor];
    double v79 = [v76 constraintEqualToAnchor:v78 constant:20.0];
    [v79 setActive:1];

    uint64_t v80 = [(PUCropToolController *)v124 aspectRatioLockButton];
    v81 = [v80 rightAnchor];
    double v82 = [v41 layoutReferenceItem];
    double v83 = [v82 rightAnchor];
    double v84 = [v81 constraintEqualToAnchor:v83 constant:-20.0];
    [v84 setActive:1];

    id v67 = [(PUCropToolController *)v124 aspectRatioLockButton];
    [v67 setEnabled:1];
LABEL_48:
  }
  [(PUCropToolController *)v124 updateAspectRatioLockButton];
  double v85 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v124 action:sel__accessibilityLongPressChanged_];
  [v85 setMinimumPressDuration:0.15];
  double v86 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v87 = [v86 preferredContentSizeCategory];
  [v85 setEnabled:UIContentSizeCategoryIsAccessibilityCategory(v87)];

  double v88 = [(PUCropToolController *)v124 view];
  [v88 addGestureRecognizer:v85];

  [(PUCropToolController *)v124 setAccessibilityLongPressGestureRecognizer:v85];
  BOOL v89 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v89 addObserver:v124 selector:sel__preferredContentSizeCategoryChanged name:*MEMORY[0x1E4FB27A8] object:0];

  double v90 = [(PUCropToolController *)v124 view];
  CGFloat v91 = [(PUPhotoEditToolController *)v124 toolContainerView];
  [v90 bringSubviewToFront:v91];

  id v92 = objc_alloc(MEMORY[0x1E4F57D38]);
  double v93 = objc_msgSend(v92, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(PUCropToolController *)v124 setBadgeView:v93];

  double v94 = [(PUCropToolController *)v124 badgeView];
  [v94 setUserInteractionEnabled:0];

  CGFloat v95 = [v114 photoEditingBadgeViewFillColor];
  CGFloat v96 = [(PUCropToolController *)v124 badgeView];
  [v96 _setFillColor:v95];

  long long v97 = [v114 photoEditingBadgeViewContentColor];
  long long v98 = [(PUCropToolController *)v124 badgeView];
  [v98 _setContentColor:v97];

  double v99 = [(PUCropToolController *)v124 badgeView];
  [v99 _setFillCornerRadius:4.0];

  double v100 = [(PUCropToolController *)v124 badgeView];
  [v100 setAlpha:0.0];

  [MEMORY[0x1E4F57D38] _defaultTextInsets];
  double v102 = v101 + 3.0;
  double v104 = v103 + 3.0;
  double v106 = v105 + 1.0;
  double v108 = v107 + 1.0;
  v109 = [(PUCropToolController *)v124 badgeView];
  objc_msgSend(v109, "_setTextInsets:", v108, v102, v106, v104);

  v110 = [(PUCropToolController *)v124 view];
  v111 = [(PUCropToolController *)v124 badgeView];
  [v110 addSubview:v111];

  [(PUCropToolController *)v124 px_enableImageModulation];
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  int64_t v3 = [(PUCropToolController *)self cropView];
  [v3 tearDownMediaViewAndLayers];

  v4.receiver = self;
  v4.super_class = (Class)PUCropToolController;
  [(PUPhotoEditToolController *)&v4 dealloc];
}

- (PUCropToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PUCropToolController;
  objc_super v4 = [(PUPhotoEditToolController *)&v14 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    containerView = v4->_containerView;
    v4->_containerView = (UIView *)v6;

    objc_super v8 = objc_alloc_init(PUCropPerspectiveAdjustmentsDataSource);
    dataSource = v4->_dataSource;
    v4->_dataSource = v8;

    [(PUCropPerspectiveAdjustmentsDataSource *)v4->_dataSource setDelegate:v4];
    double v10 = objc_alloc_init(PUAdjustmentsViewController);
    adjustmentsViewController = v4->_adjustmentsViewController;
    v4->_adjustmentsViewController = v10;

    [(PUAdjustmentsViewController *)v4->_adjustmentsViewController setDelegate:v4];
    [(PUAdjustmentsViewController *)v4->_adjustmentsViewController setDataSource:v4->_dataSource];
    [(PUAdjustmentsViewController *)v4->_adjustmentsViewController setShouldDisplayMappedValues:0];
    double v12 = objc_alloc_init(PUCropToolControllerSpec);
    [(PUPhotoEditToolController *)v4 setToolControllerSpec:v12];

    v4->_needsMediaLoad = 1;
    v4->_needsImageLoad = 1;
    v4->_needsModelLoad = 1;
    [(PUPhotoEditToolController *)v4 setHasMediaScrubber:1];
  }
  return v4;
}

@end