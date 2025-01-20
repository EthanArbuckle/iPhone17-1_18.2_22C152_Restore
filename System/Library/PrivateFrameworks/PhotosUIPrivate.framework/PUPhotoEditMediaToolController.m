@interface PUPhotoEditMediaToolController
- (BOOL)_isSlomoEnabled;
- (BOOL)_isTrimAllowed;
- (BOOL)_updateAutoFocusToolbarButton;
- (BOOL)_wantsPortraitVideoControls;
- (BOOL)_wantsRateControl;
- (BOOL)_wantsTrimControl;
- (BOOL)apertureToolbarIsDepthActive;
- (BOOL)apertureToolbarShouldRotateLabelsWithOrientation:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResetToDefaultValue;
- (BOOL)hasTrimmedVideo;
- (BOOL)useTranslucentBackground;
- (BOOL)wantsScrubberKeyControl;
- (BOOL)wantsSecondaryToolbarVisible;
- (BOOL)wantsZoomAndPanEnabled;
- (PTCinematographyScript)cinematographyScript;
- (PUPhotoEditMediaToolController)init;
- (PUTrimToolController)trimController;
- (UIButton)livePhotoButton;
- (UIView)primaryView;
- (double)horizontalControlPadding;
- (double)horizontalPrimaryViewPaddingOffset;
- (double)verticalButtonOffset;
- (id)_localizedTitleForCurrentPlaybackVariation;
- (id)_rateToolbarButtonMenuElements;
- (id)accessibilityHUDItemForButton:(id)a3;
- (id)axDescriptionForFocusDecisionAtTime:(id *)a3;
- (id)centerToolbarView;
- (id)leadingToolbarViews;
- (id)livePortraitBehaviorController;
- (id)localizedName;
- (id)makeTrimToolController;
- (id)selectedToolbarIconGlyphName;
- (id)toolbarIconAccessibilityLabel;
- (id)toolbarIconGlyphName;
- (id)trailingToolbarViews;
- (int64_t)layoutType;
- (int64_t)scrubberOrientation;
- (int64_t)toolControllerTag;
- (void)_dismissPortraitVideoDebugControls:(id)a3;
- (void)_handleApertureButton:(id)a3;
- (void)_handleAutoFocusButton:(id)a3;
- (void)_handleLivePhotoButton:(id)a3;
- (void)_handleMuteButton:(id)a3;
- (void)_handlePortraitVideoButton:(id)a3;
- (void)_handlePortraitVideoButtonLongPress:(id)a3;
- (void)_handleStabilizeButton:(id)a3;
- (void)_initializeCinematographyScript;
- (void)_invalidateConstraints;
- (void)_invalidateTrimControlScrubberThumbnails;
- (void)_layoutToolGradient;
- (void)_presentPortraitVideoDebugControls;
- (void)_reportStabilizeProgress:(double)a3;
- (void)_resetDefaultToolMode;
- (void)_setPlaybackRate:(double)a3;
- (void)_setToolMode:(int64_t)a3;
- (void)_showPrimaryViewIfNeeded;
- (void)_updateApertureControlsAnimated:(BOOL)a3;
- (void)_updateApertureSliderLength;
- (void)_updateBackgroundAnimated:(BOOL)a3;
- (void)_updateLivePhotoButton:(id)a3;
- (void)_updateLivePhotoButtonAnimated:(BOOL)a3;
- (void)_updateMuteButtonAnimated:(BOOL)a3;
- (void)_updatePortraitVideoButtonAnimated:(BOOL)a3;
- (void)_updateRateToolbarButton;
- (void)_updateStabilizationInProgress:(BOOL)a3;
- (void)_updateStabilizeButtonAnimated:(BOOL)a3;
- (void)_updateStabilizeProgressViewAnimated:(BOOL)a3;
- (void)_updateToolVisibilityAnimated:(BOOL)a3;
- (void)_updateTrackerDisplay:(BOOL)a3;
- (void)_updateTrimControlAndToolbarButtons;
- (void)addCropToolGainMapIfNeeded;
- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4;
- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4;
- (void)apertureToolbarDidStartSliding:(id)a3;
- (void)apertureToolbarDidStopSliding:(id)a3;
- (void)baseMediaInvalidated;
- (void)cineScriptBecameAvailable:(id)a3;
- (void)cineScriptCouldNotInitializeWithError:(id)a3;
- (void)cinematographyWasEdited;
- (void)cinematographyWasEditedAtTime:(id *)a3;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)configureForAdjustmentCategory:(int64_t)a3;
- (void)decreaseScrubberValue:(BOOL)a3;
- (void)didBecomeActiveTool;
- (void)didResignActiveTool;
- (void)disableCinematicUIForLoadingAsset;
- (void)increaseScrubberValue:(BOOL)a3;
- (void)interactionBegan;
- (void)leavingEditWithCancel;
- (void)loadView;
- (void)mediaView:(id)a3 didZoom:(double)a4;
- (void)mediaViewDidScroll:(id)a3;
- (void)mediaViewInsetsUpdated;
- (void)objectTrackingFinishedWithSuccess:(BOOL)a3;
- (void)objectTrackingStartedAtTime:(id *)a3;
- (void)prepareForSave:(BOOL)a3;
- (void)reactivate;
- (void)reloadToolbarButtons:(BOOL)a3;
- (void)removeCropToolGainMap;
- (void)removeFocusDecisionAtTime:(id *)a3;
- (void)setBackdropViewGroupName:(id)a3;
- (void)setHorizontalControlPadding:(double)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setLayoutType:(int64_t)a3;
- (void)setOriginalStillImageTime:(id *)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPrimaryView:(id)a3;
- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)setUseTranslucentBackground:(BOOL)a3;
- (void)setVerticalButtonOffset:(double)a3;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)togglePlayback:(id)a3;
- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)trimToolController:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4;
- (void)trimToolController:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4;
- (void)trimToolController:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4;
- (void)trimToolControllerDidChange:(id)a3 state:(unint64_t)a4;
- (void)updateCinematicVideoControlsEnableState;
- (void)updateForIncomingAnimation;
- (void)updateToolbarButtonsAnimated:(BOOL)a3;
- (void)updateViewConstraints;
- (void)videoRenderingChanged;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewIsAppearing:(BOOL)a3;
- (void)willBecomeActiveTool;
- (void)willResignActiveTool;
@end

@implementation PUPhotoEditMediaToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryView, 0);
  objc_storeStrong((id *)&self->_apertureGradientView, 0);
  objc_storeStrong((id *)&self->_cinematographyController, 0);
  objc_storeStrong((id *)&self->_apertureContainerLayoutGuide, 0);
  objc_storeStrong((id *)&self->_apertureToolbar, 0);
  objc_storeStrong((id *)&self->_apertureContainer, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_rateButton, 0);
  objc_storeStrong((id *)&self->_autoFocusButton, 0);
  objc_storeStrong((id *)&self->_apertureButtonContainer, 0);
  objc_storeStrong((id *)&self->_apertureButtonContainerDimmingView, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_portraitVideoButtonDimmingView, 0);
  objc_storeStrong((id *)&self->_portraitVideoButton, 0);
  objc_storeStrong((id *)&self->_stabilizeProgressView, 0);
  objc_storeStrong((id *)&self->_stabilizeButton, 0);
  objc_storeStrong((id *)&self->_videoLabelView, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_muteButton, 0);
  objc_storeStrong((id *)&self->_trimController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_trailingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leadingWidthConstraint, 0);
  objc_storeStrong((id *)&self->_viewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_solidBackgroundView, 0);
  objc_storeStrong((id *)&self->_backdropBackgroundView, 0);
}

- (BOOL)useTranslucentBackground
{
  return self->_useTranslucentBackground;
}

- (double)verticalButtonOffset
{
  return self->_verticalButtonOffset;
}

- (double)horizontalPrimaryViewPaddingOffset
{
  return self->_horizontalPrimaryViewPaddingOffset;
}

- (double)horizontalControlPadding
{
  return self->_horizontalControlPadding;
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void)setLayoutType:(int64_t)a3
{
  self->_layoutType = a3;
}

- (int64_t)layoutType
{
  return self->_layoutType;
}

- (BOOL)apertureToolbarIsDepthActive
{
  return [(PXCinematicEditController *)self->_cinematographyController cinematicAdjustmentActive];
}

- (void)apertureToolbar:(id)a3 didUpdateDepthActive:(BOOL)a4
{
  [(PXCinematicEditController *)self->_cinematographyController setCinematicAdjustmentActive:a4];
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
}

- (void)apertureToolbarDidStopSliding:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:0];
  v4 = PULocalizedString(@"PHOTOEDIT_PORTRAIT_APERTURE_ACTION_TITLE");
  [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v4];

  [(PUPhotoEditApertureToolbar *)self->_apertureToolbar apertureValue];
  if (v5 == 0.0 && self->_lastKnownAperture > 0.0)
  {
    self->_suspendUIUpdatesFromComposition = 1;
    v6 = [(PUPhotoEditToolController *)self compositionController];
    v7 = [v6 adjustmentConstants];
    v8 = [v7 PIPortraitVideoAdjustmentKey];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__PUPhotoEditMediaToolController_apertureToolbarDidStopSliding___block_invoke;
    v9[3] = &unk_1E5F292E0;
    v9[4] = self;
    [v6 modifyAdjustmentWithKey:v8 modificationBlock:v9];

    self->_suspendUIUpdatesFromComposition = 0;
  }
}

void __64__PUPhotoEditMediaToolController_apertureToolbarDidStopSliding___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  double v3 = *(double *)(*(void *)(a1 + 32) + 1352);
  id v4 = a2;
  id v5 = [v2 numberWithDouble:v3];
  [v4 setAperture:v5];
}

- (void)apertureToolbarDidStartSliding:(id)a3
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
  [(PUPhotoEditToolController *)self setPerformingLiveInteraction:1];
  [(PUPhotoEditToolController *)self willModifyAdjustment];
  [(PUPhotoEditApertureToolbar *)self->_apertureToolbar apertureValue];
  if (v4 > 0.0)
  {
    [(PUPhotoEditApertureToolbar *)self->_apertureToolbar apertureValue];
    self->_lastKnownAperture = v5;
  }
}

- (BOOL)apertureToolbarShouldRotateLabelsWithOrientation:(id)a3
{
  double v3 = [(PUPhotoEditToolController *)self photoEditSpec];
  BOOL v4 = [v3 currentLayoutStyle] == 4;

  return v4;
}

- (void)apertureToolbar:(id)a3 didChangeValue:(double)a4
{
  -[PXCinematicEditController setCinematicAperture:](self->_cinematographyController, "setCinematicAperture:", a3, a4);
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
}

- (id)livePortraitBehaviorController
{
  v2 = [(PUPhotoEditToolController *)self delegate];
  double v3 = [v2 livePortraitBehaviorController];

  return v3;
}

- (void)addCropToolGainMapIfNeeded
{
  id v2 = [(PUPhotoEditToolController *)self delegate];
  [v2 addCropToolGainMapIfNeeded];
}

- (void)removeCropToolGainMap
{
  id v2 = [(PUPhotoEditToolController *)self delegate];
  [v2 removeCropToolGainMap];
}

- (void)trimToolController:(id)a3 didChangeIsPerformingLiveInteraction:(BOOL)a4
{
}

- (void)trimToolController:(id)a3 didEndInteractivelyEditingElement:(int64_t)a4
{
  [(PUPhotoEditToolController *)self setActivelyAdjusting:0];
  if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]) {
    [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:1];
  }
  if ((unint64_t)(a4 - 1) <= 1)
  {
    v6 = PULocalizedString(@"PHOTOEDIT_TRIM_ACTION_TITLE");
    [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v6];
  }
  id v9 = [(PUTrimToolController *)self->_trimController playerWrapper];
  v7 = +[PUPhotoEditProtoSettings sharedInstance];
  char v8 = [v7 pauseAfterMovingPlayhead];

  if (a4 != 2 && self->_wasPlayingBeforeBeginningToScrubVideo && (v8 & 1) == 0) {
    [v9 play];
  }
}

- (void)trimToolController:(id)a3 didBeginInteractivelyEditingElement:(int64_t)a4
{
  id v6 = [(PUTrimToolController *)self->_trimController playerWrapper];
  self->_wasPlayingBeforeBeginningToScrubVideo = [v6 isPlaying];
  [v6 pause];
  if ((unint64_t)(a4 - 1) > 1)
  {
    [(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls];
  }
  else
  {
    [(PUPhotoEditToolController *)self setActivelyAdjusting:1];
    if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]) {
      [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:0];
    }
    [(PUPhotoEditToolController *)self willModifyAdjustment];
  }
}

- (id)axDescriptionForFocusDecisionAtTime:(id *)a3
{
  cinematographyController = self->_cinematographyController;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  BOOL v4 = [(PXCinematicEditController *)cinematographyController axDescriptionForFocusDecisionAtTime:&v6];
  return v4;
}

- (void)removeFocusDecisionAtTime:(id *)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F90140]);
  cinematographyController = self->_cinematographyController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PUPhotoEditMediaToolController_removeFocusDecisionAtTime___block_invoke;
  v9[3] = &__block_descriptor_56_e35_v16__0__PXCinematicEditController_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  v7 = (void *)[v5 initWithCinematicController:cinematographyController changeBlock:v9];
  char v8 = [(PUPhotoEditMediaToolController *)self undoManager];
  [v7 executeWithUndoManager:v8];
}

uint64_t __60__PUPhotoEditMediaToolController_removeFocusDecisionAtTime___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 removeFocusDecisionAtTime:&v3];
}

- (void)trimToolControllerDidChange:(id)a3 state:(unint64_t)a4
{
  id v5 = a3;
  [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:1];
  uint64_t v6 = [v5 state];

  if (!v6)
  {
    v7 = [(PUPhotoEditToolController *)self delegate];
    int v8 = [v7 isStandardVideo];

    if (v8)
    {
      trimController = self->_trimController;
      if (trimController)
      {
        [(PUTrimToolController *)trimController playheadTime];
      }
      else
      {
        long long v14 = 0uLL;
        uint64_t v15 = 0;
      }
      $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PUPhotoEditToolController *)self valuesCalculator];
      long long v12 = v14;
      uint64_t v13 = v15;
      [v10 setVideoFrameTime:&v12];

      v11 = [(PUPhotoEditToolController *)self valuesCalculator];
      [v11 precomputeImageValues];
    }
  }
}

- (BOOL)hasTrimmedVideo
{
  long long v3 = [(PUTrimToolController *)self->_trimController playerWrapper];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(PUTrimToolController *)self->_trimController playerWrapper];
    int v6 = [v5 showsUntrimmed] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)interactionBegan
{
  id v2 = [(PUTrimToolController *)self->_trimController playerWrapper];
  [v2 pause];
}

- (void)objectTrackingFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PXCinematicEditController *)self->_cinematographyController focusTimelineDelegate];
  [v4 objectTrackingFinishedWithSuccess:v3];
}

- (void)trackedObjectWasUpdatedAtTime:(id *)a3 shouldStop:(BOOL *)a4
{
  int v6 = [(PXCinematicEditController *)self->_cinematographyController focusTimelineDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  [v6 updateObjectTrackingProgressAtTime:&v7 shouldStop:a4];
}

- (void)objectTrackingStartedAtTime:(id *)a3
{
  id v4 = [(PXCinematicEditController *)self->_cinematographyController focusTimelineDelegate];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [v4 objectTrackingStartedAtTime:&v5];
}

- (void)updateCinematicVideoControlsEnableState
{
  if ([(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton])
  {
    BOOL v3 = [(PUPhotoEditToolController *)self delegate];
    [v3 toolControllerDidUpdateToolbar:self];
  }
  int v4 = [(PXCinematicEditController *)self->_cinematographyController cinematicAdjustmentActive];
  int v5 = [(PXCinematicEditController *)self->_cinematographyController isInAutoFocusState];
  int v6 = [(PXCinematicEditController *)self->_cinematographyController canToggleBackToUserFocusState];
  uint64_t v7 = v5 ^ 1u;
  [(PUPhotoEditToolbarButton *)self->_autoFocusButton setSelected:v7];
  autoFocusButton = self->_autoFocusButton;
  [(PUPhotoEditToolbarButton *)autoFocusButton setEnabled:v4 & (v7 | v6)];
}

- (void)cinematographyWasEditedAtTime:(id *)a3
{
  int v5 = [(PUTrimToolController *)self->_trimController playerWrapper];
  [v5 pause];

  id v6 = objc_alloc(MEMORY[0x1E4F90140]);
  cinematographyController = self->_cinematographyController;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PUPhotoEditMediaToolController_cinematographyWasEditedAtTime___block_invoke;
  v10[3] = &__block_descriptor_56_e35_v16__0__PXCinematicEditController_8l;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  int v8 = (void *)[v6 initWithCinematicController:cinematographyController changeBlock:v10];
  id v9 = [(PUPhotoEditMediaToolController *)self undoManager];
  [v8 executeWithUndoManager:v9];

  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
}

uint64_t __64__PUPhotoEditMediaToolController_cinematographyWasEditedAtTime___block_invoke(uint64_t a1, void *a2)
{
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  return [a2 cinematographyWasEditedAtTime:&v3];
}

- (void)cinematographyWasEdited
{
  long long v3 = [(PUTrimToolController *)self->_trimController playerWrapper];
  [v3 pause];

  [(PXCinematicEditController *)self->_cinematographyController cinematographyWasEdited];
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
  if ([(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton])
  {
    id v4 = [(PUPhotoEditToolController *)self delegate];
    [v4 toolControllerDidUpdateToolbar:self];
  }
}

- (void)cineScriptCouldNotInitializeWithError:(id)a3
{
  self->_isLoadingCinematographyScript = 0;
  cinematographyController = self->_cinematographyController;
  self->_cinematographyController = 0;

  [(PUTrimToolController *)self->_trimController enableFocusTimeline:0];
  [(PUTrimToolController *)self->_trimController showFocusTimeline:0];
  [(PUVideoEditOverlayViewController *)self->_overlayController willMoveToParentViewController:0];
  [(PUPhotoEditMediaToolController *)self removeChildViewController:self->_overlayController];
  int v5 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
  [v5 removeFromSuperview];

  overlayController = self->_overlayController;
  self->_overlayController = 0;
}

- (void)cineScriptBecameAvailable:(id)a3
{
  self->_isLoadingCinematographyScript = 0;
  [(PUVideoEditOverlayViewController *)self->_overlayController enableUIForCinematographyScriptLoad:1];
  [(PUTrimToolController *)self->_trimController enableUIForCinematographyScriptLoad:1];
  id v4 = [(PUPhotoEditToolController *)self compositionController];
  id v13 = [v4 portraitVideoAdjustmentController];

  if (v13)
  {
    int v5 = [v13 enabled];
    trimController = self->_trimController;
    if (v5) {
      BOOL v7 = [(PUPhotoEditToolController *)self isActiveTool];
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
    trimController = self->_trimController;
  }
  [(PUTrimToolController *)trimController enableFocusTimeline:v7];
  self->_cinematicButtonsNeedDimmingViews = 0;
  [(UIView *)self->_portraitVideoButtonDimmingView removeFromSuperview];
  portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
  self->_portraitVideoButtonDimmingView = 0;

  [(UIView *)self->_apertureButtonContainerDimmingView removeFromSuperview];
  apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
  self->_apertureButtonContainerDimmingView = 0;

  [(PUVideoEditOverlayViewController *)self->_overlayController scriptDidUpdate];
  [(PXCinematicEditController *)self->_cinematographyController updateFocusDecisions];
  if ([(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton])
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = [(PUPhotoEditToolController *)self delegate];
    [v10 toolControllerDidUpdateToolbar:self];
  }
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
  [(PUPhotoEditMediaToolController *)self _updateApertureControlsAnimated:0];
  apertureToolbar = self->_apertureToolbar;
  [(PXCinematicEditController *)self->_cinematographyController originalAperture];
  -[PUPhotoEditApertureToolbar setOriginalApertureValueClosestTo:](apertureToolbar, "setOriginalApertureValueClosestTo:");
  long long v12 = [(PUPhotoEditToolController *)self delegate];
  [v12 initialCinematographyLoadComplete];
}

- (void)disableCinematicUIForLoadingAsset
{
  self->_isLoadingCinematographyScript = 1;
  [(PUTrimToolController *)self->_trimController enableFocusTimeline:0];
  [(PUTrimToolController *)self->_trimController enableUIForCinematographyScriptLoad:0];
  [(PUVideoEditOverlayViewController *)self->_overlayController setHidden:1];
  [(PUVideoEditOverlayViewController *)self->_overlayController enableUIForCinematographyScriptLoad:0];
  self->_cinematicButtonsNeedDimmingViews = 1;
}

- (void)_initializeCinematographyScript
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v3 = [(PUPhotoEditToolController *)self editSource];

  if (v3)
  {
    id v4 = [(PUPhotoEditToolController *)self editSource];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [(PUPhotoEditToolController *)self editSource];

      if (v5)
      {
        id v6 = (PXCinematicEditController *)objc_alloc_init(MEMORY[0x1E4F90048]);
        cinematographyController = self->_cinematographyController;
        self->_cinematographyController = v6;

        [(PXCinematicEditController *)self->_cinematographyController setDelegate:self];
        [(PXCinematicEditController *)self->_cinematographyController setFocusTimelineDelegate:self->_trimController];
        int v8 = self->_cinematographyController;
        id v9 = [(PUPhotoEditToolController *)self asset];
        [(PXCinematicEditController *)v8 setAsset:v9 editSource:v5];

        if (self->_apertureToolbar)
        {
          [(PXCinematicEditController *)self->_cinematographyController minimumCinematicAperture];
          -[PUPhotoEditApertureToolbar setMinimumApertureValue:](self->_apertureToolbar, "setMinimumApertureValue:");
          [(PXCinematicEditController *)self->_cinematographyController maximumCinematicAperture];
          -[PUPhotoEditApertureToolbar setMaximumApertureValue:](self->_apertureToolbar, "setMaximumApertureValue:");
        }
        goto LABEL_12;
      }
    }
    else
    {
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [(PUPhotoEditToolController *)self editSource];
      int v12 = 138412290;
      id v13 = v11;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Cannot initialize cinematography; edit source is not a PLVideoEditSource: %@",
        (uint8_t *)&v12,
        0xCu);
    }
    int v5 = 0;
  }
  else
  {
    int v5 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_ERROR, "Cannot initialize cinematography; edit source is nil",
        (uint8_t *)&v12,
        2u);
    }
  }
LABEL_12:
}

- (void)_handleAutoFocusButton:(id)a3
{
  id v4 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "Auto focus button pressed", v8, 2u);
  }

  int v5 = [(PUVideoEditOverlayViewController *)self->_overlayController localizedStringForCinematicTrackingBadgeMessage:[(PXCinematicEditController *)self->_cinematographyController isInAutoFocusState]];
  [(PUVideoEditOverlayViewController *)self->_overlayController showTrackingInformationalString:v5];
  [(PUVideoEditOverlayViewController *)self->_overlayController setNeedsUpdateTrackingFrame];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F90160]) initWithCinematicController:self->_cinematographyController];
  [v6 setLocalizedActionName:v5];
  BOOL v7 = [(PUPhotoEditMediaToolController *)self undoManager];
  [v6 executeWithUndoManager:v7 completionHandler:&__block_literal_global_266_56956];

  [(PUPhotoEditMediaToolController *)self cinematographyWasEdited];
  [(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton];
}

- (void)_updateApertureSliderLength
{
  if (self->_apertureToolbar)
  {
    long long v3 = [(PUPhotoEditToolController *)self photoEditSpec];
    char v4 = [v3 shouldDisplayCompactToolbar];

    double v5 = 0.0;
    if ((v4 & 1) == 0)
    {
      id v6 = [(PUPhotoEditToolController *)self photoEditSpec];
      uint64_t v7 = [v6 currentLayoutStyle];

      int64_t v8 = [(PUPhotoEditToolController *)self layoutOrientation];
      BOOL v9 = v7 != 4 && v8 == 1;
      double v5 = 275.0;
      if (!v9) {
        double v5 = 375.0;
      }
    }
    apertureToolbar = self->_apertureToolbar;
    [(PUPhotoEditApertureToolbar *)apertureToolbar setSliderWidth:v5];
  }
}

- (void)_dismissPortraitVideoDebugControls:(id)a3
{
}

- (void)_presentPortraitVideoDebugControls
{
  v17[1] = *MEMORY[0x1E4F143B8];
  long long v3 = [[PUPortraitVideoDebugController alloc] initWithNibName:0 bundle:0];
  char v4 = [(PUPhotoEditToolController *)self compositionController];
  [(PUPortraitVideoDebugController *)v3 setCompositionController:v4];

  double v5 = v3;
  [(PUPortraitVideoDebugController *)v5 loadViewIfNeeded];
  id v6 = [(PUPhotoEditMediaToolController *)self view];
  uint64_t v7 = [v6 traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];

  if (v8 == 1)
  {
    BOOL v9 = (PUPortraitVideoDebugController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v5];

    [(PUPortraitVideoDebugController *)v5 setTitle:@"Cinematic Debug Settings"];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__dismissPortraitVideoDebugControls_];
    v17[0] = v10;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    int v12 = [(PUPortraitVideoDebugController *)v5 navigationItem];
    [v12 setRightBarButtonItems:v11];

    id v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    uint64_t v14 = [(PUPortraitVideoDebugController *)v5 view];
    [v14 setBackgroundColor:v13];

    uint64_t v15 = [(PUPortraitVideoDebugController *)v5 view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:1];
  }
  else
  {
    [(PUPortraitVideoDebugController *)v5 setModalPresentationStyle:7];
    v16 = [(PUPortraitVideoDebugController *)v5 popoverPresentationController];
    [v16 setSourceView:self->_portraitVideoButton];
    [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton bounds];
    objc_msgSend(v16, "setSourceRect:");
    -[PUPortraitVideoDebugController setPreferredContentSize:](v5, "setPreferredContentSize:", 580.0, 340.0);

    BOOL v9 = v5;
  }
  [(PUPhotoEditMediaToolController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_handlePortraitVideoButtonLongPress:(id)a3
{
  if ([a3 state] == 3)
  {
    [(PUPhotoEditMediaToolController *)self _presentPortraitVideoDebugControls];
  }
}

- (void)_handlePortraitVideoButton:(id)a3
{
  char v4 = [(PUTrimToolController *)self->_trimController playerWrapper];
  [v4 pause];

  [(PUPhotoEditToolController *)self willModifyAdjustment];
  int v5 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton isSelected];
  id v6 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v7 = [v6 adjustmentConstants];
  uint64_t v8 = [v7 PIPortraitVideoAdjustmentKey];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PUPhotoEditMediaToolController__handlePortraitVideoButton___block_invoke;
  v11[3] = &__block_descriptor_33_e45_v16__0__PIPortraitVideoAdjustmentController_8l;
  char v12 = v5;
  [v6 modifyAdjustmentWithKey:v8 modificationBlock:v11];

  if (v5) {
    BOOL v9 = @"PHOTOEDIT_CINEMATIC_ENABLE_ACTION";
  }
  else {
    BOOL v9 = @"PHOTOEDIT_CINEMATIC_DISABLE_ACTION";
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = PULocalizedString(v9);
  [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v10];
  [(PUPhotoEditMediaToolController *)self _updatePortraitVideoButtonAnimated:1];
  [(PUPhotoEditMediaToolController *)self _updateApertureControlsAnimated:1];
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
}

uint64_t __61__PUPhotoEditMediaToolController__handlePortraitVideoButton___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_setToolMode:(int64_t)a3
{
  if (self->_toolMode != a3)
  {
    self->_toolMode = a3;
    BOOL v4 = a3 == 1;
    int v5 = [(PUPhotoEditToolController *)self delegate];
    [v5 toolController:self showVideoScrubber:v4 animated:v4];

    [(PUPhotoEditMediaToolController *)self _updateApertureControlsAnimated:1];
    [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
  }
}

- (void)_resetDefaultToolMode
{
}

- (void)_handleApertureButton:(id)a3
{
  [(PUPhotoEditMediaToolController *)self _setToolMode:self->_toolMode != 1];
}

- (void)_updateApertureControlsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    int v5 = [(UIView *)self->_apertureButtonContainer superview];
    [v5 layoutIfNeeded];
  }
  uint64_t v6 = [(PXCinematicEditController *)self->_cinematographyController cinematicAdjustmentActive];
  [(PXCinematicEditController *)self->_cinematographyController cinematicAperture];
  double v8 = v7;
  [(CEKApertureButton *)self->_apertureButton setActive:self->_toolMode == 1];
  [(CEKApertureButton *)self->_apertureButton setApertureValue:v8];
  BOOL v9 = [(PUPhotoEditToolController *)self photoEditSpec];
  unsigned int v10 = [v9 shouldAllowApertureButtonExpansion];

  if (self->_toolMode == 1) {
    int v11 = 0;
  }
  else {
    int v11 = v6;
  }
  if (v8 <= 0.0) {
    int v11 = 0;
  }
  [(CEKApertureButton *)self->_apertureButton setShouldShowApertureValue:v11 & v10 animated:v3];
  char v12 = [(CEKApertureButton *)self->_apertureButton superview];
  [v12 setNeedsLayout];

  id v13 = +[PUPhotoEditProtoSettings sharedInstance];
  char v14 = [v13 apertureSliderHasOffPosition];

  apertureToolbar = self->_apertureToolbar;
  if ((v14 & 1) == 0)
  {
    [(PUPhotoEditApertureToolbar *)apertureToolbar setEnabled:v6];
    if (!v6) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  [(PUPhotoEditApertureToolbar *)apertureToolbar setDepthIsOn:v6];
  if (v6) {
LABEL_12:
  }
    [(PUPhotoEditApertureToolbar *)self->_apertureToolbar setApertureValueClosestTo:v8];
LABEL_13:
  BOOL v16 = self->_toolMode == 1;
  double v17 = 66.0;
  if (self->_toolMode != 1) {
    double v17 = 0.0;
  }
  [(PUPhotoEditToolController *)self setToolGradientDistance:v17];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke;
  aBlock[3] = &unk_1E5F2E120;
  aBlock[4] = self;
  BOOL v23 = v16;
  v18 = (void (**)(void))_Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke_2;
  v20[3] = &unk_1E5F2BA20;
  v20[4] = self;
  BOOL v21 = v16;
  v19 = (void (**)(void *, uint64_t))_Block_copy(v20);
  if (v3)
  {
    [(UIView *)self->_apertureContainer setHidden:0];
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v18 options:v19 animations:0.25 completion:0.0];
  }
  else
  {
    v18[2](v18);
    v19[2](v19, 1);
  }
}

uint64_t __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1320) superview];
  [v2 layoutIfNeeded];

  double v3 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1368) setAlpha:v3];
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 _updateTrackerDisplay:1];
}

uint64_t __66__PUPhotoEditMediaToolController__updateApertureControlsAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1368) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_updateTrackerDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = +[PUPhotoEditProtoSettings sharedInstance];
  int v6 = [v5 hideTrackersDuringPlayback];

  if (v6) {
    BOOL v7 = [(PUTrimToolController *)self->_trimController state] == 1;
  }
  else {
    BOOL v7 = 0;
  }
  int v8 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton isSelected];
  int64_t toolMode = self->_toolMode;
  int64_t v10 = [(PUTrimToolController *)self->_trimController currentlyInteractingElement];
  overlayController = self->_overlayController;
  BOOL v12 = [(PUPhotoEditToolController *)self isActiveTool];
  BOOL isLoadingCinematographyScript = 1;
  if (v12 && !v7)
  {
    BOOL v14 = !v8 || toolMode == 1;
    if (!v14 && (unint64_t)(v10 - 1) >= 2) {
      BOOL isLoadingCinematographyScript = self->_isLoadingCinematographyScript;
    }
  }
  [(PUVideoEditOverlayViewController *)overlayController setHidden:isLoadingCinematographyScript animated:v3];
}

- (void)_updatePortraitVideoButtonAnimated:(BOOL)a3
{
  if (self->_portraitVideoButton && self->_cinematographyController)
  {
    BOOL v4 = a3;
    int v5 = [(PUPhotoEditToolController *)self compositionController];
    id v12 = [v5 portraitVideoAdjustmentController];

    if (v12) {
      uint64_t v6 = [v12 enabled];
    }
    else {
      uint64_t v6 = 0;
    }
    [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton setSelected:v6];
    BOOL v7 = (void *)MEMORY[0x1E4F90858];
    if ([(PUPhotoEditToolActivationButton *)self->_portraitVideoButton isSelected]) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 1;
    }
    BOOL v9 = [v7 configurationWithCursorEffect:v8];
    [(PXUIButton *)self->_portraitVideoButton setPx_configuration:v9];

    trimController = self->_trimController;
    if (v6) {
      BOOL v11 = [(PUPhotoEditToolController *)self isActiveTool];
    }
    else {
      BOOL v11 = 0;
    }
    [(PUTrimToolController *)trimController enableFocusTimeline:v11];
    [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:v4];
  }
}

- (BOOL)_wantsPortraitVideoControls
{
  id v2 = [(PUPhotoEditToolController *)self delegate];
  char v3 = [v2 isPortraitVideo];

  return v3;
}

- (PTCinematographyScript)cinematographyScript
{
  return (PTCinematographyScript *)[(PXCinematicEditController *)self->_cinematographyController cinematographyScript];
}

- (id)_rateToolbarButtonMenuElements
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v3 = [(PUPhotoEditToolController *)self delegate];
  BOOL v4 = [v3 playbackRateOptions];

  BOOL v21 = [(PUPhotoEditToolController *)self compositionController];
  int v5 = [v21 slomoAdjustmentController];
  v20 = v5;
  if (v5)
  {
    objc_msgSend(v5, "rate", v5);
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v12, "playbackRate", v20);
        float v14 = v13;
        uint64_t v15 = [v12 localizedTitle];
        objc_initWeak(&location, self);
        BOOL v16 = (void *)MEMORY[0x1E4FB13F0];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __64__PUPhotoEditMediaToolController__rateToolbarButtonMenuElements__block_invoke;
        v23[3] = &unk_1E5F28BD0;
        objc_copyWeak(&v24, &location);
        float v25 = v14;
        double v17 = [v16 actionWithTitle:v15 image:0 identifier:0 handler:v23];
        v18 = [v12 localizedSubtitle];
        [v17 setSubtitle:v18];

        [v17 setState:v7 == v14];
        [v8 addObject:v17];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  return v8;
}

void __64__PUPhotoEditMediaToolController__rateToolbarButtonMenuElements__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setPlaybackRate:*(float *)(a1 + 40)];
}

- (void)_updateRateToolbarButton
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUPhotoEditMediaToolController *)self _wantsRateControl];
  rateButton = self->_rateButton;
  if (v3)
  {
    if (!rateButton)
    {
      int v5 = [(PUPhotoEditToolController *)self photoEditSpec];
      double v6 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"gauge.with.dots.needle.33percent" selectedImageNamed:@"gauge.with.dots.needle.33percent" accessibilityLabel:&stru_1F06BE7B8 spec:v5];
      double v7 = self->_rateButton;
      self->_rateButton = v6;

      [(PUPhotoEditToolbarButton *)self->_rateButton setShowsMenuAsPrimaryAction:1];
    }
  }
  else if (rateButton)
  {
    self->_rateButton = 0;
  }
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __58__PUPhotoEditMediaToolController__updateRateToolbarButton__block_invoke;
  double v17 = &unk_1E5F29218;
  objc_copyWeak(&v18, &location);
  uint64_t v9 = [v8 elementWithUncachedProvider:&v14];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1970];
  BOOL v11 = PULocalizedString(@"PHOTOEDIT_SLOMO_RATE_MENU_TITLE");
  v20[0] = v9;
  id v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 1, v14, v15, v16, v17);
  float v13 = [v10 menuWithTitle:v11 image:0 identifier:0 options:1 children:v12];
  [(PUPhotoEditToolbarButton *)self->_rateButton setMenu:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __58__PUPhotoEditMediaToolController__updateRateToolbarButton__block_invoke(uint64_t a1, void (**a2)(void, void))
{
  BOOL v3 = (id *)(a1 + 32);
  BOOL v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _rateToolbarButtonMenuElements];
  double v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  a2[2](v4, v7);
}

- (void)_setPlaybackRate:(double)a3
{
  uint64_t v5 = [(PUPhotoEditToolController *)self compositionController];
  double v6 = [v5 slomoAdjustmentController];
  uint64_t v7 = v6;
  if (v6) {
    [v6 rate];
  }
  else {
    double v8 = 1.0;
  }
  if (v8 != a3)
  {
    [(PUPhotoEditToolController *)self willModifyAdjustment];
    if (a3 != 1.0
      || ([(PUPhotoEditToolController *)self asset],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 mediaSubtypes],
          v9,
          (v10 & 0x20000) != 0))
    {
      uint64_t v11 = *MEMORY[0x1E4F8A580];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__PUPhotoEditMediaToolController__setPlaybackRate___block_invoke;
      v13[3] = &unk_1E5F28BA8;
      *(double *)&v13[5] = a3;
      v13[4] = self;
      [v5 modifyAdjustmentWithKey:v11 modificationBlock:v13];
    }
    else
    {
      [v5 removeAdjustmentWithKey:*MEMORY[0x1E4F8A580]];
    }
    id v12 = PULocalizedString(@"PhotoEditPlaybackRateChangeActionName");
    [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v12];
    [(PUPhotoEditMediaToolController *)self _updateRateToolbarButton];
  }
}

void __51__PUPhotoEditMediaToolController__setPlaybackRate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setRate:*(double *)(a1 + 40)];
  if (v3)
  {
    [v3 startTime];
    if ((v18 & 0x100000000) != 0)
    {
      [v3 endTime];
      if (v16) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    uint64_t v19 = 0;
  }
  BOOL v4 = (void *)MEMORY[0x1E4F16330];
  uint64_t v5 = [*(id *)(a1 + 32) editSource];
  double v6 = [v5 videoURL];
  uint64_t v7 = [v4 assetWithURL:v6];

  double v8 = [MEMORY[0x1E4F8CE18] defaultSlowMotionAdjustmentsForAsset:v7];
  uint64_t v9 = v8;
  memset(&v15, 0, sizeof(v15));
  if (v8) {
    [v8 slowMotionTimeRange];
  }
  long long v13 = *(_OWORD *)&v15.start.value;
  CMTimeEpoch epoch = v15.start.epoch;
  [v3 setStartTime:&v13];
  CMTimeRange range = v15;
  CMTimeRangeGetEnd(&v12, &range);
  CMTime v10 = v12;
  [v3 setEndTime:&v10];

LABEL_9:
}

- (BOOL)_wantsRateControl
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    BOOL v4 = [(PUPhotoEditToolController *)self delegate];
    char v5 = [v4 isHighframeRateVideo];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isSlomoEnabled
{
  int v3 = [(PUPhotoEditToolController *)self delegate];
  char v4 = [v3 isHighframeRateVideo];

  if (_os_feature_enabled_impl())
  {
    char v5 = [(PUPhotoEditToolController *)self compositionController];
    double v6 = [v5 slomoAdjustmentController];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 rate];
      char v4 = v8 < 1.0;
    }
    else
    {
      char v4 = 0;
    }
  }
  return v4;
}

- (void)_updateStabilizationInProgress:(BOOL)a3
{
  self->_stabilizationInProgress = a3;
  [(PUPhotoEditMediaToolController *)self _updateStabilizeButtonAnimated:1];
  [(PUPhotoEditMediaToolController *)self _updateStabilizeProgressViewAnimated:1];
}

- (void)_reportStabilizeProgress:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__PUPhotoEditMediaToolController__reportStabilizeProgress___block_invoke;
  v3[3] = &unk_1E5F2E0A8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __59__PUPhotoEditMediaToolController__reportStabilizeProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1272) setProgress:*(double *)(a1 + 40)];
}

- (void)_updateStabilizeProgressViewAnimated:(BOOL)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  stabilizeProgressView = self->_stabilizeProgressView;
  if (self->_stabilizationInProgress)
  {
    if (stabilizeProgressView) {
      return;
    }
    char v5 = (PLRoundProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5E8]), "initWithFrame:style:", 3, 0.0, 0.0, 20.0, 20.0);
    double v6 = self->_stabilizeProgressView;
    self->_stabilizeProgressView = v5;

    [(PLRoundProgressView *)self->_stabilizeProgressView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC8];
    double v8 = [(PLRoundProgressView *)self->_stabilizeProgressView widthAnchor];
    uint64_t v9 = [v8 constraintEqualToConstant:20.0];
    v14[0] = v9;
    CMTime v10 = [(PLRoundProgressView *)self->_stabilizeProgressView heightAnchor];
    uint64_t v11 = [v10 constraintEqualToConstant:20.0];
    v14[1] = v11;
    CMTime v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [v7 activateConstraints:v12];
  }
  else
  {
    if (!stabilizeProgressView) {
      return;
    }
    self->_stabilizeProgressView = 0;
  }
  long long v13 = [(PUPhotoEditToolController *)self delegate];
  [v13 toolControllerDidUpdateToolbar:self];
}

- (void)_handleStabilizeButton:(id)a3
{
  id v4 = a3;
  char v5 = [(PUPhotoEditToolController *)self compositionController];
  double v6 = [v5 adjustmentConstants];
  uint64_t v7 = [v5 videoStabilizeAdjustmentController];

  if (v7)
  {
    double v8 = [v6 PIVideoStabilizeAdjustmentKey];
    [v5 modifyAdjustmentWithKey:v8 modificationBlock:&__block_literal_global_218];
  }
  else if (!self->_stabilizationInProgress)
  {
    [(PUPhotoEditMediaToolController *)self _updateStabilizationInProgress:1];
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x1E4F8A3D0]);
    CMTime v10 = [v5 composition];
    uint64_t v11 = (void *)[v9 initWithComposition:v10];

    CMTime v12 = +[PUPhotoEditProtoSettings sharedInstance];
    [v12 videoStabilizeMaxCropFraction];
    objc_msgSend(v11, "setAllowedCropFraction:");

    [v11 setName:@"PU-PIVideoStabilizeRequest"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_2;
    v19[3] = &unk_1E5F28C60;
    objc_copyWeak(&v20, &location);
    [v11 setProgressHandler:v19];
    [v11 allowedCropFraction];
    uint64_t v14 = v13;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_3;
    v15[3] = &unk_1E5F292B8;
    id v16 = v5;
    id v17 = v6;
    v18[1] = v14;
    objc_copyWeak(v18, &location);
    [v11 submit:v15];
    objc_destroyWeak(v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_2(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportStabilizeProgress:a2];
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_4;
  block[3] = &unk_1E5F2C8E8;
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  v9[1] = a1[7];
  id v4 = v3;
  objc_copyWeak(v9, a1 + 6);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(v9);
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v11 = 0;
  id v3 = [v2 result:&v11];
  id v4 = v11;
  if (v3)
  {
    char v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) PIVideoStabilizeAdjustmentKey];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_5;
    v8[3] = &unk_1E5F28B80;
    id v9 = v3;
    uint64_t v10 = *(void *)(a1 + 64);
    [v5 modifyAdjustmentWithKey:v6 modificationBlock:v8];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _updateStabilizationInProgress:0];
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) keyframes];
  [v3 setKeyframes:v4];

  char v5 = *(void **)(a1 + 32);
  if (v5)
  {
    [v5 stabCropRect];
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  [v3 setStabCropRect:v6];
  [v3 setEnabled:1];
  [v3 setCropFraction:*(double *)(a1 + 40)];
  objc_msgSend(v3, "setAnalysisType:", objc_msgSend(*(id *)(a1 + 32), "analysisType"));
}

void __57__PUPhotoEditMediaToolController__handleStabilizeButton___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setEnabled:", objc_msgSend(v2, "enabled") ^ 1);
}

- (void)_updateStabilizeButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v6 = [v5 isStandardVideo];

  if (self->_stabilizeButton)
  {
    long long v7 = [(PUPhotoEditToolController *)self delegate];
    [v7 configureEnablenessOfControlButton:self->_stabilizeButton animated:v3 canVisuallyDisable:1];

    stabilizeButton = self->_stabilizeButton;
  }
  else
  {
    stabilizeButton = 0;
  }
  [(UIButton *)stabilizeButton setHidden:v6 ^ 1];
  [(UIButton *)self->_stabilizeButton setEnabled:v6];
  id v16 = [(PUPhotoEditToolController *)self compositionController];
  id v9 = [v16 videoStabilizeAdjustmentController];
  uint64_t v10 = v9;
  if (v9) {
    int v11 = [v9 enabled];
  }
  else {
    int v11 = 0;
  }
  CMTime v12 = +[PUInterfaceManager currentTheme];
  long long v13 = self->_stabilizeButton;
  if (v11)
  {
    [(UIButton *)v13 setSelected:1];
    uint64_t v14 = self->_stabilizeButton;
    [v12 photoEditingToolbarMainButtonColor];
  }
  else
  {
    [(UIButton *)v13 setSelected:0];
    uint64_t v14 = self->_stabilizeButton;
    [v12 photoEditingToolbarSecondaryButtonColor];
  CMTimeRange v15 = };
  [(UIButton *)v14 setTintColor:v15];
}

- (void)_handleMuteButton:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F90138];
  char v5 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v6 = [(PUPhotoEditToolController *)self delegate];
  objc_msgSend(v4, "muteToggleActionWithCompositionController:isLoopingVideo:", v5, objc_msgSend(v6, "isLoopingVideo"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  long long v7 = [(PUPhotoEditMediaToolController *)self undoManager];
  [v8 executeWithUndoManager:v7 completionHandler:&__block_literal_global_57062];
}

- (void)_updateMuteButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(PUPhotoEditToolController *)self asset];
  if ([v5 isLivePhoto])
  {
    int v6 = 1;
  }
  else
  {
    long long v7 = [(PUPhotoEditToolController *)self delegate];
    if ([v7 isLoopingVideo])
    {
      int v6 = 1;
    }
    else
    {
      id v8 = [(PUPhotoEditToolController *)self delegate];
      int v6 = [v8 isStandardVideo];
    }
  }

  id v26 = [(PUPhotoEditToolController *)self compositionController];
  id v9 = [v26 autoLoopAdjustmentController];
  uint64_t v10 = [v9 flavor];
  int v11 = [(PUPhotoEditToolController *)self delegate];
  if ([v11 isLoopingVideo]) {
    BOOL v12 = PIAutoLoopFlavorFromString() != 2;
  }
  else {
    BOOL v12 = 1;
  }

  if (v6)
  {
    long long v13 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v14 = [v13 isVideoOn] & v12;
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (self->_muteButton)
  {
    CMTimeRange v15 = [(PUPhotoEditToolController *)self delegate];
    [v15 configureEnablenessOfControlButton:self->_muteButton animated:v3 canVisuallyDisable:1];

    muteButton = self->_muteButton;
  }
  else
  {
    muteButton = 0;
  }
  [(PUPhotoEditToolbarButton *)muteButton setHidden:v6 ^ 1u];
  [(PUPhotoEditToolbarButton *)self->_muteButton setEnabled:v14];
  id v17 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v18 = [v17 adjustmentControllerForKey:*MEMORY[0x1E4F8A498]];

  if (v18)
  {
    uint64_t v19 = [v18 enabled];
  }
  else
  {
    id v20 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v19 = [v20 hasLoopingVideoAdjustment];
  }
  BOOL v21 = +[PUInterfaceManager currentTheme];
  v22 = v21;
  if (v19)
  {
    BOOL v23 = [v21 photoEditingIrisDisabledColor];
    id v24 = @"PHOTOEDIT_MUTE_BUTTON_AX_VALUE_ON";
  }
  else
  {
    BOOL v23 = [v21 photoEditingIrisEnabledColor];
    id v24 = @"PHOTOEDIT_MUTE_BUTTON_AX_VALUE_OFF";
  }
  [(PUPhotoEditToolbarButton *)self->_muteButton setTintColor:v23];
  [(PUPhotoEditToolbarButton *)self->_muteButton setSelected:v19];
  float v25 = PULocalizedString(v24);
  [(PUPhotoEditToolbarButton *)self->_muteButton setAccessibilityValue:v25];
}

- (id)_localizedTitleForCurrentPlaybackVariation
{
  id v2 = [(PUPhotoEditToolController *)self compositionController];
  BOOL v3 = [v2 autoLoopAdjustmentController];
  id v4 = [v3 flavor];

  unint64_t v5 = PIAutoLoopFlavorFromString();
  if (v5 > 3) {
    int v6 = 0;
  }
  else {
    int v6 = off_1E5F28C30[v5];
  }
  long long v7 = PULocalizedString(v6);

  return v7;
}

- (void)_handleLivePhotoButton:(id)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke;
  aBlock[3] = &unk_1E5F2CEE8;
  aBlock[4] = self;
  id v4 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  unint64_t v5 = [(PUPhotoEditToolController *)self delegate];
  char v6 = [v5 isVideoOn];

  if (v6)
  {
    v4[2](v4, 1);
  }
  else
  {
    long long v7 = [(PUPhotoEditMediaToolController *)self livePortraitBehaviorController];
    id v8 = [(PUPhotoEditToolController *)self compositionController];
    id v9 = [v7 confirmationWarningStringForAction:4 compositionController:v8];

    if (v9)
    {
      uint64_t v19 = [v9 objectAtIndexedSubscript:0];
      uint64_t v10 = [v9 objectAtIndexedSubscript:1];
      int v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v19 message:v10 preferredStyle:1];
      BOOL v12 = (void *)MEMORY[0x1E4FB1410];
      long long v13 = PULocalizedString(@"OK");
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_2;
      v22[3] = &unk_1E5F2E898;
      uint64_t v14 = v4;
      BOOL v23 = v14;
      CMTimeRange v15 = [v12 actionWithTitle:v13 style:0 handler:v22];
      [v11 addAction:v15];

      id v16 = (void *)MEMORY[0x1E4FB1410];
      id v17 = PULocalizedString(@"CANCEL");
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_3;
      v20[3] = &unk_1E5F2E898;
      BOOL v21 = v14;
      uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:v20];
      [v11 addAction:v18];

      [(PUPhotoEditMediaToolController *)self presentViewController:v11 animated:1 completion:0];
    }
    else
    {
      v4[2](v4, 1);
    }
  }
}

void __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = [*(id *)(a1 + 32) delegate];
    [v3 toggleLivePhotoActive];

    id v4 = [*(id *)(a1 + 32) delegate];
    int v5 = [v4 isVideoOn];

    if (v5)
    {
      id v7 = [*(id *)(a1 + 32) livePortraitBehaviorController];
      char v6 = [*(id *)(a1 + 32) compositionController];
      [v7 applySideEffectsForAction:4 compositionController:v6];
    }
  }
}

uint64_t __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __57__PUPhotoEditMediaToolController__handleLivePhotoButton___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateLivePhotoButton:(id)a3
{
}

- (void)_updateLivePhotoButtonAnimated:(BOOL)a3
{
  if (self->_livePhotoButton)
  {
    BOOL v4 = a3;
    int v5 = [(PUPhotoEditToolController *)self delegate];
    [v5 configureEnablenessOfControlButton:self->_livePhotoButton animated:v4 canVisuallyDisable:0];
  }
  char v6 = [(PUPhotoEditToolController *)self asset];
  int v7 = [v6 isLivePhotoVisibilityAdjustmentAllowed];

  [(PUPhotoEditToolActivationButton *)self->_livePhotoButton setHidden:v7 ^ 1u];
  id v8 = [(PUPhotoEditToolController *)self delegate];
  -[PUPhotoEditToolActivationButton setSelected:](self->_livePhotoButton, "setSelected:", [v8 isVideoOn]);

  id v9 = (void *)MEMORY[0x1E4F90858];
  if ([(PUPhotoEditToolActivationButton *)self->_livePhotoButton isSelected]) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = 1;
  }
  id v11 = [v9 configurationWithCursorEffect:v10];
  [(PXUIButton *)self->_livePhotoButton setPx_configuration:v11];
}

- (void)togglePlayback:(id)a3
{
  id v3 = [(PUTrimToolController *)self->_trimController playerWrapper];
  if ([v3 isPlaying]) {
    [v3 pause];
  }
  else {
    [v3 play];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_togglePlayback_ == a3)
  {
    int v5 = [(PUTrimToolController *)self->_trimController playerWrapper];
    char v6 = [v5 isReadyToPlay];

    return v6;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPhotoEditMediaToolController;
    return -[PUPhotoEditMediaToolController canPerformAction:withSender:](&v7, sel_canPerformAction_withSender_);
  }
}

- (void)updateToolbarButtonsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUPhotoEditMediaToolController;
  -[PUPhotoEditToolController updateToolbarButtonsAnimated:](&v5, sel_updateToolbarButtonsAnimated_);
  [(PUPhotoEditMediaToolController *)self _updateLivePhotoButtonAnimated:v3];
  [(PUPhotoEditMediaToolController *)self _updateMuteButtonAnimated:v3];
  [(PUPhotoEditMediaToolController *)self _updateStabilizeButtonAnimated:v3];
  [(PUPhotoEditMediaToolController *)self _updatePortraitVideoButtonAnimated:v3];
  [(PUPhotoEditMediaToolController *)self _updateApertureControlsAnimated:v3];
}

- (void)reloadToolbarButtons:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(PUPhotoEditToolController *)self editSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    char v6 = [(PUPhotoEditToolController *)self editSource];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      return;
    }
  }
  if (v3)
  {
    livePhotoButton = self->_livePhotoButton;
    self->_livePhotoButton = 0;

    muteButton = self->_muteButton;
    self->_muteButton = 0;

    stabilizeButton = self->_stabilizeButton;
    self->_stabilizeButton = 0;

    portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
    self->_portraitVideoButtonDimmingView = 0;

    portraitVideoButton = self->_portraitVideoButton;
    self->_portraitVideoButton = 0;
  }
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
  [(PUPhotoEditMediaToolController *)self updateToolbarButtonsAnimated:0];
}

- (void)videoRenderingChanged
{
  [(PUTrimToolController *)self->_trimController livePhotoRenderDidChange:self->_trimControllerScrubberNeedsVisualUpdate];
  self->_trimControllerScrubberNeedsVisualUpdate = 0;
  overlayController = self->_overlayController;
  [(PUVideoEditOverlayViewController *)overlayController renderDidChange:0];
}

- (void)_invalidateTrimControlScrubberThumbnails
{
  self->_trimControllerScrubberNeedsVisualUpdate = 1;
}

- (PUTrimToolController)trimController
{
  return self->_trimController;
}

- (id)makeTrimToolController
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUPhotoEditToolController *)self delegate];
  if ([v3 isLoopingVideo])
  {
  }
  else
  {
    BOOL v4 = [(PUPhotoEditToolController *)self delegate];
    int v5 = [v4 isStandardVideo];

    if (!v5)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F90830]);
      uint64_t v14 = [(PUPhotoEditToolController *)self delegate];
      id v16 = [v14 mainLivePhotoView];
      id v9 = (void *)[v15 initWithLivePhotoView:v16];

      goto LABEL_9;
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F90838]);
  objc_super v7 = [(PUPhotoEditToolController *)self delegate];
  id v8 = [v7 mediaView];
  id v9 = (void *)[v6 initWithNUMediaView:v8];

  uint64_t v10 = [(PUPhotoEditToolController *)self delegate];
  LODWORD(v8) = [v10 isLoopingVideo];

  if (v8)
  {
    id v11 = [MEMORY[0x1E4F8A360] autoloopStabilizedVideoFilter];
    v26[0] = v11;
    BOOL v12 = (void **)v26;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F8A360] stripAllTimeAdjustmentsFilter];
    float v25 = v11;
    BOOL v12 = &v25;
  }
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  [v9 setFullVideoPipelineFilters:v13];

  uint64_t v14 = [(PUPhotoEditToolController *)self delegate];
  [v9 setPlayerItemSource:v14];
LABEL_9:

  id v17 = [PUTrimToolController alloc];
  uint64_t v18 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v19 = [v18 isStandardVideo];
  BOOL v20 = [(PUPhotoEditMediaToolController *)self _isSlomoEnabled];
  BOOL v21 = [(PUPhotoEditToolController *)self delegate];
  v22 = -[PUTrimToolController initWithPlayerWrapper:playButtonEnabled:slomoEnabled:portraitVideoEnabled:](v17, "initWithPlayerWrapper:playButtonEnabled:slomoEnabled:portraitVideoEnabled:", v9, v19, v20, [v21 isPortraitVideo]);

  cinematographyController = self->_cinematographyController;
  if (cinematographyController)
  {
    [(PXCinematicEditController *)cinematographyController setFocusTimelineDelegate:v22];
    [(PXCinematicEditController *)self->_cinematographyController cinematographyWasEdited];
  }
  [(PUTrimToolController *)v22 setDelegate:self];

  return v22;
}

- (BOOL)_updateAutoFocusToolbarButton
{
  BOOL v3 = +[PUInterfaceManager currentTheme];
  if (![(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]
    || (cinematographyController = self->_cinematographyController) == 0)
  {
    autoFocusButton = self->_autoFocusButton;
    if (autoFocusButton)
    {
      self->_autoFocusButton = 0;

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (![(PXCinematicEditController *)cinematographyController isInAutoFocusState]
    || ([(PXCinematicEditController *)self->_cinematographyController canToggleBackToUserFocusState] & 1) != 0)
  {
    if (!self->_autoFocusButton)
    {
      int v5 = PULocalizedString(@"PHOTOEDIT_CINEMATIC_AUTO_FOCUS_AX_LABEL");
      id v6 = [(PUPhotoEditToolController *)self photoEditSpec];
      objc_super v7 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"dot.viewfinder" selectedImageNamed:@"dot.circle.viewfinder" accessibilityLabel:v5 spec:v6];
      id v8 = self->_autoFocusButton;
      self->_autoFocusButton = v7;

      [(PUPhotoEditToolbarButton *)self->_autoFocusButton setSelectedGlyphHasHighlightColor:1];
      objc_initWeak(&location, self);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __63__PUPhotoEditMediaToolController__updateAutoFocusToolbarButton__block_invoke;
      id v16 = &unk_1E5F28D98;
      objc_copyWeak(&v17, &location);
      [(PUPhotoEditToolbarButton *)self->_autoFocusButton setActionBlock:&v13];
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
LABEL_9:
      BOOL v10 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v10 = 0;
    goto LABEL_11;
  }
  BOOL v10 = 0;
LABEL_11:
  if ([(PUPhotoEditToolbarButton *)self->_autoFocusButton isSelected]) {
    [v3 photoEditingToolbarButtonSelectedColor];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  }
  [(PUPhotoEditToolbarButton *)self->_autoFocusButton setTintColor:v11];

  return v10;
}

void __63__PUPhotoEditMediaToolController__updateAutoFocusToolbarButton__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleAutoFocusButton:v3];
}

- (void)_updateTrimControlAndToolbarButtons
{
  v190[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPhotoEditToolController *)self delegate];
  int v155 = [v3 isStandardVideo];

  if ([(PUPhotoEditMediaToolController *)self _wantsTrimControl])
  {
    if (!self->_trimController)
    {
      BOOL v4 = [(PUPhotoEditMediaToolController *)self makeTrimToolController];
      trimController = self->_trimController;
      self->_trimController = v4;

      id v6 = [(PUTrimToolController *)self->_trimController view];
      [v6 setAlpha:0.0];

      objc_super v7 = [(PUTrimToolController *)self->_trimController view];
      [(PUPhotoEditMediaToolController *)self setPrimaryView:v7];

      [(PUPhotoEditMediaToolController *)self addChildViewController:self->_trimController];
      [(PUTrimToolController *)self->_trimController didMoveToParentViewController:self];
    }
    [(PUTrimToolController *)self->_trimController setDisabled:[(PUPhotoEditMediaToolController *)self _isTrimAllowed] ^ 1];
    if (!self->_trimControllerVisible && self->_viewHasAppeared)
    {
      self->_trimControllerVisible = 1;
      v187[0] = MEMORY[0x1E4F143A8];
      v187[1] = 3221225472;
      v187[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke;
      v187[3] = &unk_1E5F2ED10;
      v187[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v187 completion:0];
    }
  }
  else if (self->_trimControllerVisible)
  {
    self->_trimControllerVisible = 0;
    v186[0] = MEMORY[0x1E4F143A8];
    v186[1] = 3221225472;
    v186[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_2;
    v186[3] = &unk_1E5F2ED10;
    v186[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:4 animations:v186 completion:0];
  }
  id v8 = self->_trimController;
  id v9 = [(PUPhotoEditToolController *)self delegate];
  BOOL v10 = [v9 toolControllerPlaceholderImage:self];
  [(PUTrimToolController *)v8 setPlaceholderImage:v10];

  v158 = [(PUPhotoEditToolController *)self compositionController];
  id v11 = [v158 trimAdjustmentController];
  v154 = v11;
  BOOL v12 = (void *)MEMORY[0x1E4F8A5A0];
  if (v11)
  {
    [v11 startTime];
    if ((v184 & 0x100000000) != 0) {
      goto LABEL_15;
    }
    [v154 endTime];
    if ((v181 & 0x100000000) != 0) {
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v183 = 0;
    uint64_t v184 = 0;
    uint64_t v185 = 0;
    uint64_t v181 = 0;
    uint64_t v182 = 0;
    uint64_t v180 = 0;
  }
  [v158 removeAdjustmentWithKey:*v12];
LABEL_15:
  [(PUTrimToolController *)self->_trimController setCompositionController:v158];
  uint64_t v13 = self->_trimController;
  uint64_t v14 = [(PUPhotoEditToolController *)self editSource];
  [(PUTrimToolController *)v13 setEditSource:v14];

  id v15 = self->_trimController;
  long long location = *(_OWORD *)&self->_originalStillImageTime.value;
  int64_t epoch = self->_originalStillImageTime.epoch;
  [(PUTrimToolController *)v15 setUnadjustedStillImageTime:&location];
  v157 = (void *)[v158 copy];
  [v157 removeAdjustmentWithKey:*v12];
  [v157 removeAdjustmentWithKey:*MEMORY[0x1E4F8A480]];
  id v16 = [v157 trimAdjustmentController];
  v156 = v16;
  if (v16)
  {
    [v16 startTime];
    id v16 = v156;
  }
  else
  {
    long long v176 = 0uLL;
    uint64_t v177 = 0;
  }
  BOOL v17 = v16 == 0;
  uint64_t v18 = self->_trimController;
  long long v174 = v176;
  uint64_t v175 = v177;
  [(PUTrimToolController *)v18 setOriginalStartTime:&v174];
  if (v17)
  {
    long long v172 = 0uLL;
    uint64_t v173 = 0;
  }
  else
  {
    [v156 endTime];
  }
  uint64_t v19 = self->_trimController;
  long long v170 = v172;
  uint64_t v171 = v173;
  [(PUTrimToolController *)v19 setOriginalEndTime:&v170];
  BOOL v20 = [(PUPhotoEditToolController *)self asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v21 = +[PUPhotoEditProtoSettings sharedInstance];
    int v22 = [v21 showSuggestedKeyFrame];

    if (!v22) {
      goto LABEL_29;
    }
    BOOL v20 = [(PUPhotoEditToolController *)self asset];
    [v20 fetchPropertySetsIfNeeded];
    long long location = 0uLL;
    int64_t epoch = 0;
    BOOL v23 = [v20 mediaAnalysisProperties];
    id v24 = v23;
    if (v23)
    {
      [v23 bestKeyFrameTime];
    }
    else
    {
      long long location = 0uLL;
      int64_t epoch = 0;
    }

    if (BYTE12(location))
    {
      long long v168 = location;
      int64_t v169 = epoch;
      [(PUTrimToolController *)self->_trimController setSuggestedKeyFrameTime:&v168];
    }
  }

LABEL_29:
  float v25 = [(PUPhotoEditToolController *)self delegate];
  v152 = [v25 fontForButtons];

  v153 = +[PUInterfaceManager currentTheme];
  objc_initWeak((id *)&location, self);
  id v26 = [(PUPhotoEditToolController *)self editSource];
  if ([v26 mediaType] == 3) {
    int v27 = 1;
  }
  else {
    int v27 = v155;
  }

  muteButton = self->_muteButton;
  if (v27)
  {
    if (!muteButton)
    {
      long long v29 = PULocalizedString(@"PHOTOEDIT_MUTE_BUTTON_AX_LABEL");
      long long v30 = [(PUPhotoEditToolController *)self photoEditSpec];
      v31 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"speaker.wave.2.fill" selectedImageNamed:@"speaker.slash.fill" accessibilityLabel:v29 spec:v30];
      uint64_t v32 = self->_muteButton;
      self->_muteButton = v31;

      v166[0] = MEMORY[0x1E4F143A8];
      v166[1] = 3221225472;
      v166[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_3;
      v166[3] = &unk_1E5F28D98;
      objc_copyWeak(&v167, (id *)&location);
      [(PUPhotoEditToolbarButton *)self->_muteButton setActionBlock:v166];
      objc_destroyWeak(&v167);
    }
  }
  else if (muteButton)
  {
    self->_muteButton = 0;
  }
  if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]
    && self->_cinematographyController)
  {
    if (!self->_portraitVideoButton)
    {
      v33 = PULocalizedString(@"PHOTOEDIT_CINEMATIC_SWITCH");
      v34 = [v33 localizedUppercaseString];
      v35 = +[PUPhotoEditToolActivationButton buttonWithTitle:v34];
      portraitVideoButton = self->_portraitVideoButton;
      self->_portraitVideoButton = v35;

      [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v37) = 1144586240;
      [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton setContentCompressionResistancePriority:0 forAxis:v37];
      objc_initWeak(&from, self);
      v163[0] = MEMORY[0x1E4F143A8];
      v163[1] = 3221225472;
      v163[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_4;
      v163[3] = &unk_1E5F28B10;
      objc_copyWeak(&v164, &from);
      [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton setActionBlock:v163];
      if (MEMORY[0x1B3E7A510]([(PUPhotoEditToolActivationButton *)self->_portraitVideoButton addTarget:self action:sel__handlePortraitVideoButton_ forControlEvents:64]))
      {
        v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handlePortraitVideoButtonLongPress_];
        [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton addGestureRecognizer:v38];
      }
      if (self->_cinematicButtonsNeedDimmingViews)
      {
        portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
        self->_portraitVideoButtonDimmingView = 0;

        v40 = (UIView *)objc_opt_new();
        v41 = self->_portraitVideoButtonDimmingView;
        self->_portraitVideoButtonDimmingView = v40;

        v42 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        v43 = [v42 colorWithAlphaComponent:0.6];
        [(UIView *)self->_portraitVideoButtonDimmingView setBackgroundColor:v43];

        [(UIView *)self->_portraitVideoButtonDimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
        [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton addSubview:self->_portraitVideoButtonDimmingView];
        v136 = (void *)MEMORY[0x1E4F28DC8];
        v145 = [(UIView *)self->_portraitVideoButtonDimmingView leadingAnchor];
        v148 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton leadingAnchor];
        v142 = [v145 constraintEqualToAnchor:v148];
        v190[0] = v142;
        v139 = [(UIView *)self->_portraitVideoButtonDimmingView trailingAnchor];
        v44 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton trailingAnchor];
        v45 = [v139 constraintEqualToAnchor:v44];
        v190[1] = v45;
        v46 = [(UIView *)self->_portraitVideoButtonDimmingView topAnchor];
        v47 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton topAnchor];
        v48 = [v46 constraintEqualToAnchor:v47];
        v190[2] = v48;
        v49 = [(UIView *)self->_portraitVideoButtonDimmingView bottomAnchor];
        v50 = [(PUPhotoEditToolActivationButton *)self->_portraitVideoButton bottomAnchor];
        v51 = [v49 constraintEqualToAnchor:v50];
        v190[3] = v51;
        v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v190 count:4];
        [v136 activateConstraints:v52];
      }
      objc_destroyWeak(&v164);
      objc_destroyWeak(&from);
    }
    if (self->_apertureButton)
    {
      int v53 = 1;
      goto LABEL_56;
    }
    v58 = objc_alloc_init(PUPhotoEditApertureButton);
    objc_storeStrong((id *)&self->_apertureButton, v58);
    v59 = [(PUPhotoEditMediaToolController *)self view];
    BOOL v60 = [v59 effectiveUserInterfaceLayoutDirection] != 1;

    [(PUPhotoEditApertureButton *)v58 setExpansionDirection:v60];
    -[PUPhotoEditApertureButton setTappableEdgeInsets:](v58, "setTappableEdgeInsets:", 11.0, 11.0, 11.0, 11.0);
    [(PUPhotoEditApertureButton *)v58 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUPhotoEditApertureButton *)v58 addTarget:self action:sel__handleApertureButton_ forControlEvents:64];
    v61 = [[PUPhotoEditApertureButtonContainer alloc] initWithApertureButton:v58];
    apertureButtonContainer = self->_apertureButtonContainer;
    self->_apertureButtonContainer = &v61->super;

    if (self->_cinematicButtonsNeedDimmingViews)
    {
      apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
      self->_apertureButtonContainerDimmingView = 0;

      v64 = (UIView *)objc_opt_new();
      v65 = self->_apertureButtonContainerDimmingView;
      self->_apertureButtonContainerDimmingView = v64;

      v66 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      v67 = [v66 colorWithAlphaComponent:0.6];
      [(UIView *)self->_apertureButtonContainerDimmingView setBackgroundColor:v67];

      [(UIView *)self->_apertureButtonContainerDimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_apertureButtonContainer addSubview:self->_apertureButtonContainerDimmingView];
      v137 = (void *)MEMORY[0x1E4F28DC8];
      v151 = [(UIView *)self->_apertureButtonContainerDimmingView leadingAnchor];
      v149 = [(UIView *)self->_apertureButtonContainer leadingAnchor];
      v146 = [v151 constraintEqualToAnchor:v149];
      v189[0] = v146;
      v143 = [(UIView *)self->_apertureButtonContainerDimmingView trailingAnchor];
      v140 = [(UIView *)self->_apertureButtonContainer trailingAnchor];
      v68 = [v143 constraintEqualToAnchor:v140];
      v189[1] = v68;
      v69 = [(UIView *)self->_apertureButtonContainerDimmingView topAnchor];
      v70 = [(UIView *)self->_apertureButtonContainer topAnchor];
      v71 = [v69 constraintEqualToAnchor:v70];
      v189[2] = v71;
      v72 = [(UIView *)self->_apertureButtonContainerDimmingView bottomAnchor];
      v73 = [(UIView *)self->_apertureButtonContainer bottomAnchor];
      v74 = [v72 constraintEqualToAnchor:v73];
      v189[3] = v74;
      v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:v189 count:4];
      [v137 activateConstraints:v75];
    }
    int v53 = 1;
  }
  else
  {
    if (self->_portraitVideoButton)
    {
      v54 = self->_portraitVideoButtonDimmingView;
      self->_portraitVideoButtonDimmingView = 0;

      v55 = self->_portraitVideoButton;
      self->_portraitVideoButton = 0;
    }
    if (!self->_apertureButton)
    {
      int v53 = 0;
      goto LABEL_56;
    }
    v56 = self->_apertureButtonContainerDimmingView;
    self->_apertureButtonContainerDimmingView = 0;

    apertureButton = self->_apertureButton;
    self->_apertureButton = 0;

    int v53 = 0;
    v58 = (PUPhotoEditApertureButton *)self->_apertureButtonContainer;
    self->_apertureButtonContainer = 0;
  }

LABEL_56:
  [(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton];
  overlayController = self->_overlayController;
  if (v53)
  {
    if (!overlayController)
    {
      v77 = [(PUPhotoEditToolController *)self delegate];
      v78 = [v77 mediaView];

      uint64_t v79 = [(PXCinematicEditController *)self->_cinematographyController cinematographyScript];
      v80 = (void *)v79;
      if (v78 && v79)
      {
        v81 = [[PUVideoEditOverlayViewController alloc] initWithMediaView:v78 cineController:self->_cinematographyController];
        v82 = self->_overlayController;
        self->_overlayController = v81;

        [(PUVideoEditOverlayViewController *)self->_overlayController setOverlayControllerDelegate:self];
        v83 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
        [v83 setTranslatesAutoresizingMaskIntoConstraints:0];

        [(PUPhotoEditMediaToolController *)self addChildViewController:self->_overlayController];
        [(PUVideoEditOverlayViewController *)self->_overlayController didMoveToParentViewController:self];
        v84 = [(PUPhotoEditMediaToolController *)self view];
        v85 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
        [v84 insertSubview:v85 atIndex:0];
      }
    }
    if (!self->_apertureToolbar)
    {
      v86 = objc_alloc_init(PUPhotoEditApertureToolbar);
      apertureToolbar = self->_apertureToolbar;
      self->_apertureToolbar = v86;

      [(PUPhotoEditApertureToolbar *)self->_apertureToolbar setDelegate:self];
      [(PUPhotoEditApertureToolbar *)self->_apertureToolbar setLayoutOrientation:[(PUPhotoEditToolController *)self layoutOrientation]];
      cinematographyController = self->_cinematographyController;
      if (cinematographyController)
      {
        [(PXCinematicEditController *)cinematographyController minimumCinematicAperture];
        -[PUPhotoEditApertureToolbar setMinimumApertureValue:](self->_apertureToolbar, "setMinimumApertureValue:");
        [(PXCinematicEditController *)self->_cinematographyController maximumCinematicAperture];
        -[PUPhotoEditApertureToolbar setMaximumApertureValue:](self->_apertureToolbar, "setMaximumApertureValue:");
      }
      [(PUPhotoEditApertureToolbar *)self->_apertureToolbar willMoveToParentViewController:self];
      apertureContainer = self->_apertureContainer;
      v90 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      [(UIView *)apertureContainer addSubview:v90];

      [(UIView *)self->_apertureContainer setHidden:1];
      v132 = [(PUPhotoEditMediaToolController *)self view];
      v147 = [(UIView *)self->_apertureContainer widthAnchor];
      v150 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      v144 = [v150 widthAnchor];
      v141 = [v147 constraintEqualToAnchor:v144];
      v188[0] = v141;
      v135 = [(UIView *)self->_apertureContainer centerXAnchor];
      v138 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      v134 = [v138 centerXAnchor];
      v133 = [v135 constraintEqualToAnchor:v134];
      v188[1] = v133;
      v91 = [(UIView *)self->_apertureContainer heightAnchor];
      v92 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      v93 = [v92 heightAnchor];
      v94 = [v91 constraintEqualToAnchor:v93];
      v188[2] = v94;
      v95 = [(UIView *)self->_apertureContainer bottomAnchor];
      v96 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      v97 = [v96 bottomAnchor];
      v98 = [v95 constraintEqualToAnchor:v97];
      v188[3] = v98;
      uint64_t v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:v188 count:4];
      [v132 addConstraints:v99];

      v100 = [(PUPhotoEditToolController *)self photoEditSpec];
      LOBYTE(v99) = [v100 currentLayoutStyle] == 4;

      if ((v99 & 1) == 0)
      {
        id v101 = objc_alloc(MEMORY[0x1E4F57D48]);
        v102 = (CEKEdgeGradientView *)objc_msgSend(v101, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        apertureGradientView = self->_apertureGradientView;
        self->_apertureGradientView = v102;

        [(CEKEdgeGradientView *)self->_apertureGradientView setEdgeGradientStyleMask];
        [(UIView *)self->_apertureContainer setMaskView:self->_apertureGradientView];
      }
      [(PUPhotoEditMediaToolController *)self _updateApertureSliderLength];
    }
  }
  else
  {
    if (overlayController)
    {
      [(PUVideoEditOverlayViewController *)overlayController willMoveToParentViewController:0];
      [(PUPhotoEditMediaToolController *)self removeChildViewController:self->_overlayController];
      v104 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
      [v104 removeFromSuperview];

      v105 = self->_overlayController;
      self->_overlayController = 0;
    }
    v106 = self->_apertureToolbar;
    if (v106)
    {
      [(PUPhotoEditApertureToolbar *)v106 removeFromParentViewController];
      v107 = [(PUPhotoEditApertureToolbar *)self->_apertureToolbar view];
      [v107 removeFromSuperview];

      v108 = self->_apertureToolbar;
      self->_apertureToolbar = 0;

      v109 = self->_apertureGradientView;
      self->_apertureGradientView = 0;
    }
  }
  [(PUPhotoEditMediaToolController *)self _updateRateToolbarButton];
  [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
  v110 = +[PUPhotoEditProtoSettings sharedInstance];
  int v111 = [v110 enableVideoStabilizion];

  if ((v111 & v155) != 0 && !self->_stabilizeButton)
  {
    v112 = (UIButton *)objc_alloc_init(MEMORY[0x1E4FB14D0]);
    stabilizeButton = self->_stabilizeButton;
    self->_stabilizeButton = v112;

    [(UIButton *)self->_stabilizeButton addTarget:self action:sel__handleStabilizeButton_ forControlEvents:64];
    [(UIButton *)self->_stabilizeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v114 = [MEMORY[0x1E4FB1830] configurationWithFont:v152];
    v115 = [MEMORY[0x1E4FB1818] systemImageNamed:@"s.square"];
    v116 = [v115 imageWithSymbolConfiguration:v114];

    v117 = [MEMORY[0x1E4FB1818] systemImageNamed:@"s.square.fill"];
    v118 = [v117 imageWithSymbolConfiguration:v114];

    [(UIButton *)self->_stabilizeButton setImage:v116 forState:0];
    [(UIButton *)self->_stabilizeButton setImage:v118 forState:4];
  }
  v119 = [(PUPhotoEditToolController *)self asset];
  int v120 = [v119 isLivePhotoVisibilityAdjustmentAllowed];

  livePhotoButton = self->_livePhotoButton;
  if (v120)
  {
    if (livePhotoButton) {
      goto LABEL_81;
    }
    v122 = [(PUPhotoEditMediaToolController *)self _localizedTitleForCurrentPlaybackVariation];
    v123 = [v122 localizedUppercaseString];
    v124 = +[PUPhotoEditToolActivationButton buttonWithTitle:v123];
    v125 = self->_livePhotoButton;
    self->_livePhotoButton = v124;

    [(PUPhotoEditToolActivationButton *)self->_livePhotoButton setSelectedGlyphName:@"livephoto"];
    [(PUPhotoEditToolActivationButton *)self->_livePhotoButton setUnselectedGlyphName:@"livephoto.slash"];
    objc_initWeak(&from, self);
    v161[0] = MEMORY[0x1E4F143A8];
    v161[1] = 3221225472;
    v161[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_5;
    v161[3] = &unk_1E5F28B10;
    objc_copyWeak(&v162, &from);
    [(PUPhotoEditToolActivationButton *)self->_livePhotoButton setActionBlock:v161];
    v159[0] = MEMORY[0x1E4F143A8];
    v159[1] = 3221225472;
    v159[2] = __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_6;
    v159[3] = &unk_1E5F28B38;
    objc_copyWeak(&v160, &from);
    [(PUPhotoEditToolActivationButton *)self->_livePhotoButton setIsSelectedBlock:v159];
    objc_destroyWeak(&v160);
    objc_destroyWeak(&v162);
    objc_destroyWeak(&from);
  }
  else
  {
    if (!livePhotoButton) {
      goto LABEL_81;
    }
    self->_livePhotoButton = 0;

    v122 = [(PUPhotoEditToolController *)self delegate];
    [v122 dismissLivePhotoRevertConfirmationAlert];
  }

LABEL_81:
  videoLabelView = self->_videoLabelView;
  if (v155)
  {
    if (!videoLabelView)
    {
      v127 = PULocalizedString(@"PHOTOEDIT_VIDEO_TOP_LABEL");
      videoLabelView = [v127 localizedUppercaseString];

      v128 = [v153 photoEditingTopToolbarToolLabelButtonColor];
      v129 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v130 = self->_videoLabelView;
      self->_videoLabelView = v129;

      [(UILabel *)self->_videoLabelView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UILabel *)self->_videoLabelView setText:videoLabelView];
      [(UILabel *)self->_videoLabelView setTextColor:v128];
      v131 = [v153 topToolbarToolLabelFont];
      [(UILabel *)self->_videoLabelView setFont:v131];

LABEL_86:
    }
  }
  else if (videoLabelView)
  {
    self->_videoLabelView = 0;
    goto LABEL_86;
  }
  objc_destroyWeak((id *)&location);
}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1232) view];
  [v1 setAlpha:1.0];
}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1232) view];
  [v1 setAlpha:0.0];
}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleMuteButton:v3];
}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePortraitVideoButton:v3];
}

void __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleLivePhotoButton:v3];
}

uint64_t __69__PUPhotoEditMediaToolController__updateTrimControlAndToolbarButtons__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  uint64_t v3 = [v2 isVideoOn];

  return v3;
}

- (BOOL)_wantsTrimControl
{
  uint64_t v3 = [(PUPhotoEditToolController *)self delegate];
  char v4 = [v3 isStandardVideo];

  if (v4)
  {
    char v5 = 1;
    goto LABEL_8;
  }
  id v6 = [(PUPhotoEditToolController *)self asset];
  if ([v6 isLivePhoto])
  {
    objc_super v7 = [(PUPhotoEditToolController *)self editSource];
    uint64_t v8 = [v7 mediaType];

    if (v8 == 3)
    {
      id v9 = [(PUPhotoEditToolController *)self delegate];
      char v10 = [v9 hasLoopingVideoAdjustment];

      id v11 = +[PUPhotoEditProtoSettings sharedInstance];
      char v12 = [v11 loopBounceTrimAllowed];

      char v5 = v10 ^ 1 | v12;
      goto LABEL_8;
    }
  }
  else
  {
  }
  char v5 = 0;
LABEL_8:
  if (self->_toolMode == 1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)_isTrimAllowed
{
  uint64_t v3 = +[PUPhotoEditProtoSettings sharedInstance];
  char v4 = [(PUPhotoEditToolController *)self delegate];
  int v5 = [v4 isLoopingVideo];

  if (v5) {
    int v6 = [v3 loopBounceTrimAllowed];
  }
  else {
    int v6 = 1;
  }
  objc_super v7 = [(PUPhotoEditToolController *)self delegate];
  char v8 = [v7 isStandardVideo];

  if ((v8 & 1) != 0 || v6)
  {
    char v10 = [(PUPhotoEditToolController *)self delegate];
    char v9 = [v10 isVideoOn];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)_updateBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL useTranslucentBackground = self->_useTranslucentBackground;
  BOOL v6 = [(UIView *)self->_solidBackgroundView isHidden];
  if (useTranslucentBackground)
  {
    if (v6) {
      return;
    }
    [(_UIBackdropView *)self->_backdropBackgroundView setHidden:0];
    solidBackgroundView = self->_solidBackgroundView;
    if (v3)
    {
      [(UIView *)solidBackgroundView setAlpha:1.0];
      char v8 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v27 = MEMORY[0x1E4F143A8];
      uint64_t v28 = 3221225472;
      long long v29 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke;
      long long v30 = &unk_1E5F2ED10;
      v31 = self;
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_2;
      float v25 = &unk_1E5F2CEE8;
      id v26 = self;
      char v9 = &v27;
      char v10 = &v22;
LABEL_8:
      objc_msgSend(v8, "animateWithDuration:animations:completion:", v9, v10, 0.2, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25,
        v26,
        v27,
        v28,
        v29,
        v30,
        v31);
      return;
    }
    [(UIView *)solidBackgroundView setHidden:1];
  }
  else
  {
    if (!v6) {
      return;
    }
    [(UIView *)self->_solidBackgroundView setHidden:0];
    if (v3)
    {
      [(UIView *)self->_solidBackgroundView setAlpha:0.0];
      char v8 = (void *)MEMORY[0x1E4FB1EB0];
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_3;
      BOOL v20 = &unk_1E5F2ED10;
      BOOL v21 = self;
      uint64_t v12 = MEMORY[0x1E4F143A8];
      uint64_t v13 = 3221225472;
      uint64_t v14 = __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_4;
      id v15 = &unk_1E5F2CEE8;
      id v16 = self;
      char v9 = &v17;
      char v10 = &v12;
      goto LABEL_8;
    }
    [(_UIBackdropView *)self->_backdropBackgroundView setHidden:1];
    id v11 = self->_solidBackgroundView;
    [(UIView *)v11 setAlpha:1.0];
  }
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) setAlpha:0.0];
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1184) setHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1457)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1176);
  BOOL v4 = *(unsigned __int8 *)(v2 + 1457) == 0;
  return [v3 setHidden:v4];
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) setAlpha:1.0];
}

uint64_t __60__PUPhotoEditMediaToolController__updateBackgroundAnimated___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1184) setHidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1457)];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 1176);
  BOOL v4 = *(unsigned __int8 *)(v2 + 1457) == 0;
  return [v3 setHidden:v4];
}

- (int64_t)toolControllerTag
{
  return 1001;
}

- (id)trailingToolbarViews
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls];
  if (self->_muteButton) {
    BOOL v5 = !v4;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_stabilizeProgressView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_stabilizeButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_rateButton) {
    objc_msgSend(v3, "addObject:");
  }
  if ([v3 count])
  {
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)centerToolbarView
{
  livePhotoButton = self->_livePhotoButton;
  if (!livePhotoButton)
  {
    livePhotoButton = self->_portraitVideoButton;
    if (!livePhotoButton) {
      livePhotoButton = self->_videoLabelView;
    }
  }
  return livePhotoButton;
}

- (id)leadingToolbarViews
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  BOOL v4 = [(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls];
  if (self->_muteButton && !v4) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_autoFocusButton) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_apertureButtonContainer) {
    objc_msgSend(v3, "addObject:");
  }
  if ([v3 count])
  {
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)wantsSecondaryToolbarVisible
{
  return 1;
}

- (void)setPrimaryView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_primaryView = &self->_primaryView;
  primaryView = self->_primaryView;
  if (primaryView != v5)
  {
    id v11 = v5;
    char v8 = [(PUPhotoEditMediaToolController *)self view];
    BOOL v9 = [(UIView *)primaryView isDescendantOfView:v8];

    if (v9) {
      [(UIView *)*p_primaryView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_primaryView, a3);
    char v10 = [(PUPhotoEditMediaToolController *)self view];
    [v10 addSubview:*p_primaryView];

    [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
    BOOL v5 = v11;
  }
}

- (void)setVerticalButtonOffset:(double)a3
{
  if (self->_verticalButtonOffset != a3)
  {
    self->_verticalButtonOffset = a3;
    [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
  }
}

- (void)setHorizontalControlPadding:(double)a3
{
  if (self->_horizontalControlPadding != a3)
  {
    self->_horizontalControlPadding = a3;
    [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
  }
}

- (void)setUseGradientBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_useTranslucentBackground != a3)
  {
    self->_BOOL useTranslucentBackground = a3;
    [(PUPhotoEditMediaToolController *)self _updateBackgroundAnimated:a4];
  }
}

- (void)setUseTranslucentBackground:(BOOL)a3
{
}

- (void)setBackdropViewGroupName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUPhotoEditToolController *)self backdropViewGroupName];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditMediaToolController;
    [(PUPhotoEditToolController *)&v8 setBackdropViewGroupName:v4];
    objc_super v7 = [(PUPhotoEditToolController *)self backdropViewGroupName];
    [(_UIBackdropView *)self->_backdropBackgroundView setGroupName:v7];
  }
}

- (void)mediaViewInsetsUpdated
{
  [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
  [(PUPhotoEditMediaToolController *)self updateViewConstraints];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  [(PUPhotoEditMediaToolController *)self _updateAutoFocusToolbarButton];
  [(PUPhotoEditMediaToolController *)self _updateRateToolbarButton];
}

- (id)accessibilityHUDItemForButton:(id)a3
{
  id v4 = a3;
  if (![v4 isEqual:self->_livePhotoButton]) {
    goto LABEL_5;
  }
  if (![v4 state])
  {
    BOOL v5 = PULocalizedString(@"PHOTOEDIT_LIVE_SWITCH_OFF");
    char v6 = @"PULivePhotoOff";
    goto LABEL_11;
  }
  if ([v4 state] != 4)
  {
LABEL_5:
    objc_super v7 = 0;
    objc_super v8 = 0;
LABEL_6:
    v14.receiver = self;
    v14.super_class = (Class)PUPhotoEditMediaToolController;
    uint64_t v9 = [(PUPhotoEditToolController *)&v14 accessibilityHUDItemForButton:v4];
    goto LABEL_7;
  }
  BOOL v5 = [(PUPhotoEditMediaToolController *)self _localizedTitleForCurrentPlaybackVariation];
  char v6 = @"PULivePhotoOn";
LABEL_11:
  objc_super v7 = [v5 localizedUppercaseString];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", v6);
  objc_super v8 = [v12 imageWithRenderingMode:2];

  if (!v7 || !v8) {
    goto LABEL_6;
  }
  id v13 = objc_alloc(MEMORY[0x1E4FB13E0]);
  uint64_t v9 = objc_msgSend(v13, "initWithTitle:image:imageInsets:scaleImage:", v7, v8, 1, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
LABEL_7:
  char v10 = (void *)v9;

  return v10;
}

- (void)mediaViewDidScroll:(id)a3
{
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  -[PUVideoEditOverlayViewController renderDidChange:](self->_overlayController, "renderDidChange:", 1, a4);
  id v5 = [(PUPhotoEditMediaToolController *)self trimController];
  [v5 mediaViewDidZoom];
}

- (void)decreaseScrubberValue:(BOOL)a3
{
  trimController = self->_trimController;
  if (a3) {
    uint64_t v4 = -6;
  }
  else {
    uint64_t v4 = -1;
  }
  [(PUTrimToolController *)trimController stepByCount:v4];
}

- (void)increaseScrubberValue:(BOOL)a3
{
  trimController = self->_trimController;
  if (a3) {
    uint64_t v4 = 6;
  }
  else {
    uint64_t v4 = 1;
  }
  [(PUTrimToolController *)trimController stepByCount:v4];
}

- (void)configureForAdjustmentCategory:(int64_t)a3
{
  if (a3 == 12
    && [(PUPhotoEditMediaToolController *)self _wantsRateControl]
    && ([(PUPhotoEditToolbarButton *)self->_rateButton isHeld] & 1) == 0)
  {
    id v4 = [(PUPhotoEditToolbarButton *)self->_rateButton contextMenuInteraction];
    objc_msgSend(v4, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
}

- (int64_t)scrubberOrientation
{
  return 1;
}

- (BOOL)wantsScrubberKeyControl
{
  return 1;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v20 = a3;
  id v4 = [(PUPhotoEditToolController *)self compositionController];
  id v5 = [v4 adjustmentConstants];

  char v6 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v7 = [v5 nonVisualAdjustmentTypes];
  objc_super v8 = [v6 setWithArray:v7];
  char v9 = [v20 isSubsetOfSet:v8];

  if ((v9 & 1) == 0) {
    [(PUPhotoEditMediaToolController *)self _invalidateTrimControlScrubberThumbnails];
  }
  char v10 = [v5 PIPortraitVideoAdjustmentKey];
  int v11 = [v20 containsObject:v10];

  if (v11)
  {
    uint64_t v12 = [(PUTrimToolController *)self->_trimController playerWrapper];
    [v12 pause];

    [(PUPhotoEditMediaToolController *)self updateCinematicVideoControlsEnableState];
  }
  id v13 = [v5 PITrimAdjustmentKey];
  int v14 = [v20 containsObject:v13];

  if (v14) {
    [(PUVideoEditOverlayViewController *)self->_overlayController frameTimeDidChange];
  }
  id v15 = [v5 PISlomoAdjustmentKey];
  int v16 = [v20 containsObject:v15];

  if (v16)
  {
    int v17 = [(PUTrimToolController *)self->_trimController isSlomoEnabled];
    int v18 = [(PUPhotoEditMediaToolController *)self _isSlomoEnabled];
    [(PUTrimToolController *)self->_trimController setSlomoEnabled:[(PUPhotoEditMediaToolController *)self _isSlomoEnabled]];
    if (v17 != v18)
    {
      [(PUPhotoEditMediaToolController *)self _updateRateToolbarButton];
      [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
    }
    if ([(PUPhotoEditToolbarButton *)self->_rateButton isHeld]) {
      [(PUPhotoEditMediaToolController *)self _updateRateToolbarButton];
    }
  }
  [(PUPhotoEditMediaToolController *)self _updateMuteButtonAnimated:1];
  [(PUPhotoEditMediaToolController *)self _updateStabilizeButtonAnimated:1];
  [(PUPhotoEditMediaToolController *)self _updatePortraitVideoButtonAnimated:1];
  [(PUPhotoEditMediaToolController *)self _updateApertureControlsAnimated:1];
  uint64_t v19 = [(PUPhotoEditMediaToolController *)self trimController];
  [v19 compositionControllerDidChangeForAdjustments:v20];
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v7 setupWithAsset:a3 compositionController:a4 editSource:a5 valuesCalculator:a6];
  if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]) {
    [(PUPhotoEditMediaToolController *)self _initializeCinematographyScript];
  }
}

- (void)_showPrimaryViewIfNeeded
{
  if (self->_constraints)
  {
    BOOL v3 = [(PUPhotoEditMediaToolController *)self primaryView];
    [v3 alpha];
    double v5 = v4;

    if (v5 < 1.0)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      _OWORD v6[2] = __58__PUPhotoEditMediaToolController__showPrimaryViewIfNeeded__block_invoke;
      v6[3] = &unk_1E5F2ED10;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.2];
    }
  }
}

void __58__PUPhotoEditMediaToolController__showPrimaryViewIfNeeded__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) primaryView];
  [v1 setAlpha:1.0];
}

- (void)leavingEditWithCancel
{
}

- (void)prepareForSave:(BOOL)a3
{
}

- (void)didResignActiveTool
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v4 didResignActiveTool];
  BOOL v3 = [(PUPhotoEditMediaToolController *)self primaryView];
  [v3 setAlpha:0.0];
}

- (void)willResignActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 willResignActiveTool];
  self->_isActiveTool = 0;
  if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]) {
    [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:0];
  }
  [(PUTrimToolController *)self->_trimController willHideTrimTool];
}

- (void)reactivate
{
  if (self->_apertureButton) {
    [(PUPhotoEditMediaToolController *)self _handleApertureButton:0];
  }
}

- (void)didBecomeActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 didBecomeActiveTool];
  self->_isActiveTool = 1;
  [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
  [(PUPhotoEditMediaToolController *)self updateViewConstraints];
  [(PUPhotoEditMediaToolController *)self _showPrimaryViewIfNeeded];
}

- (void)willBecomeActiveTool
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 willBecomeActiveTool];
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
  [(PUPhotoEditMediaToolController *)self _resetDefaultToolMode];
  if ([(PUPhotoEditMediaToolController *)self _wantsPortraitVideoControls]) {
    [(PUPhotoEditMediaToolController *)self _updateTrackerDisplay:0];
  }
  [(PUTrimToolController *)self->_trimController willShowTrimTool];
}

- (void)setPlaceholderImage:(id)a3
{
  trimController = self->_trimController;
  id v5 = a3;
  [(PUTrimToolController *)trimController setPlaceholderImage:v5];
  [(PUTrimToolController *)self->_trimController livePhotoRenderDidChange:self->_trimControllerScrubberNeedsVisualUpdate];
  self->_trimControllerScrubberNeedsVisualUpdate = 0;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v6 setPlaceholderImage:v5];
}

- (void)baseMediaInvalidated
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 baseMediaInvalidated];
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
}

- (void)updateForIncomingAnimation
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 updateForIncomingAnimation];
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
}

- (void)setOriginalStillImageTime:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotoEditMediaToolController;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  [(PUPhotoEditToolController *)&v7 setOriginalStillImageTime:&v6];
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_originalStillImageTime.value = *(_OWORD *)&a3->var0;
  self->_originalStillImageTime.int64_t epoch = var3;
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
}

- (BOOL)canResetToDefaultValue
{
  return 0;
}

- (id)toolbarIconAccessibilityLabel
{
  objc_super v3 = PULocalizedString(@"PHOTOEDIT_MEDIA_TOOLBAR_LIVE_PHOTO_BUTTON_AX_LABEL");
  objc_super v4 = [(PUPhotoEditToolController *)self delegate];
  int v5 = [v4 isStandardVideo];

  if (v5)
  {
    uint64_t v6 = PULocalizedString(@"PHOTOEDIT_MEDIA_TOOLBAR_VIDEO_BUTTON_AX_LABEL");

    objc_super v3 = (void *)v6;
  }
  return v3;
}

- (id)selectedToolbarIconGlyphName
{
  objc_super v3 = [(PUPhotoEditToolController *)self delegate];
  char v4 = [v3 isPortraitVideo];

  if (v4) {
    return @"cinematic.video.fill";
  }
  uint64_t v6 = [(PUPhotoEditToolController *)self delegate];
  int v7 = [v6 isStandardVideo];

  if (v7) {
    return @"video.fill";
  }
  else {
    return @"livephoto";
  }
}

- (id)toolbarIconGlyphName
{
  objc_super v3 = [(PUPhotoEditToolController *)self delegate];
  char v4 = [v3 isPortraitVideo];

  if (v4) {
    return @"cinematic.video";
  }
  uint64_t v6 = [(PUPhotoEditToolController *)self delegate];
  int v7 = [v6 isStandardVideo];

  if (v7) {
    return @"video";
  }
  else {
    return @"livephoto";
  }
}

- (id)localizedName
{
  objc_super v3 = PULocalizedString(@"PHOTOEDIT_LIVEPHOTO_TOOL_BUTTON");
  char v4 = [(PUPhotoEditToolController *)self delegate];
  int v5 = [v4 isStandardVideo];

  if (v5)
  {
    uint64_t v6 = PULocalizedString(@"PHOTOEDIT_VIDEO_TOOL_BUTTON");

    objc_super v3 = (void *)v6;
  }
  return v3;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v27 setLayoutOrientation:a3 withTransitionCoordinator:v6];
  livePhotoButton = self->_livePhotoButton;
  self->_livePhotoButton = 0;

  muteButton = self->_muteButton;
  self->_muteButton = 0;

  videoLabelView = self->_videoLabelView;
  self->_videoLabelView = 0;

  stabilizeButton = self->_stabilizeButton;
  self->_stabilizeButton = 0;

  stabilizeProgressView = self->_stabilizeProgressView;
  self->_stabilizeProgressView = 0;

  portraitVideoButtonDimmingView = self->_portraitVideoButtonDimmingView;
  self->_portraitVideoButtonDimmingView = 0;

  portraitVideoButton = self->_portraitVideoButton;
  self->_portraitVideoButton = 0;

  apertureButtonContainerDimmingView = self->_apertureButtonContainerDimmingView;
  self->_apertureButtonContainerDimmingView = 0;

  apertureButton = self->_apertureButton;
  self->_apertureButton = 0;

  apertureButtonContainer = self->_apertureButtonContainer;
  self->_apertureButtonContainer = 0;

  autoFocusButton = self->_autoFocusButton;
  self->_autoFocusButton = 0;

  rateButton = self->_rateButton;
  self->_rateButton = 0;

  uint64_t v19 = self->_overlayController;
  if (![(PUVideoEditOverlayViewController *)v19 isHidden])
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
    v24[3] = &unk_1E5F28AE8;
    float v25 = v19;
    id v26 = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
    v22[3] = &unk_1E5F2B9D0;
    uint64_t v23 = v25;
    [v6 animateAlongsideTransition:v24 completion:v22];
  }
  id v20 = [(PUPhotoEditMediaToolController *)self trimController];
  [v20 setLayoutOrientation:a3];

  BOOL v21 = [(PUPhotoEditToolController *)self asset];

  if (v21) {
    [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
  }
  [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
}

uint64_t __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1 animated:0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _updateApertureSliderLength];
}

uint64_t __81__PUPhotoEditMediaToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) renderDidChange:1];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 setHidden:0 animated:1];
}

- (void)_updateToolVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self->_toolMode == 1;
  [(PUPhotoEditToolController *)self setToolGradientDistance:66.0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke;
  aBlock[3] = &unk_1E5F2E120;
  aBlock[4] = self;
  BOOL v11 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke_2;
  v8[3] = &unk_1E5F2BA20;
  void v8[4] = self;
  BOOL v9 = v5;
  int v7 = (void (**)(void *, uint64_t))_Block_copy(v8);
  if (v3)
  {
    [(UIView *)self->_apertureContainer setHidden:0];
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v6 options:v7 animations:0.25 completion:0.0];
  }
  else
  {
    v6[2](v6);
    v7[2](v7, 1);
  }
}

uint64_t __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1368) setAlpha:v1];
}

uint64_t __64__PUPhotoEditMediaToolController__updateToolVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1368) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (void)_invalidateConstraints
{
  BOOL v3 = [(PUPhotoEditMediaToolController *)self view];
  [v3 setNeedsUpdateConstraints];

  if ([(NSMutableArray *)self->_constraints count])
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_constraints];
    constraints = self->_constraints;
    [(NSMutableArray *)constraints removeAllObjects];
  }
}

- (void)updateViewConstraints
{
  v194[4] = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_constraints count])
  {
    BOOL v3 = [(PUPhotoEditMediaToolController *)self view];
    char v4 = [v3 window];

    if (v4)
    {
      BOOL v5 = [(PUPhotoEditMediaToolController *)self view];
      id v6 = self->_containerView;
      int v7 = [(PUPhotoEditMediaToolController *)self primaryView];
      [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(PUPhotoEditMediaToolController *)self horizontalControlPadding];
      double v9 = v8;
      char v10 = [v5 leadingAnchor];
      BOOL v11 = [(UIView *)v6 leadingAnchor];
      uint64_t v12 = [v10 constraintEqualToAnchor:v11];
      [v12 setActive:1];

      id v13 = [v5 trailingAnchor];
      int v14 = [(UIView *)v6 trailingAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14];
      [v15 setActive:1];

      v186 = v5;
      int v16 = [v5 bottomAnchor];
      int v17 = [(UIView *)v6 bottomAnchor];
      int v18 = [v16 constraintEqualToAnchor:v17];
      [v18 setActive:1];

      uint64_t v19 = [(_UIBackdropView *)self->_backdropBackgroundView leadingAnchor];
      id v20 = [(UIView *)v6 leadingAnchor];
      BOOL v21 = [v19 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      uint64_t v22 = [(_UIBackdropView *)self->_backdropBackgroundView trailingAnchor];
      uint64_t v23 = [(UIView *)v6 trailingAnchor];
      id v24 = [v22 constraintEqualToAnchor:v23];
      [v24 setActive:1];

      float v25 = [(_UIBackdropView *)self->_backdropBackgroundView topAnchor];
      id v26 = [(UIView *)v6 topAnchor];
      objc_super v27 = [v25 constraintEqualToAnchor:v26];
      [v27 setActive:1];

      uint64_t v28 = [(_UIBackdropView *)self->_backdropBackgroundView bottomAnchor];
      long long v29 = [(UIView *)v6 bottomAnchor];
      long long v30 = [v28 constraintEqualToAnchor:v29];
      [v30 setActive:1];

      v31 = [(UIView *)self->_solidBackgroundView leadingAnchor];
      uint64_t v32 = [(UIView *)v6 leadingAnchor];
      v33 = [v31 constraintEqualToAnchor:v32];
      [v33 setActive:1];

      v34 = [(UIView *)self->_solidBackgroundView trailingAnchor];
      v35 = [(UIView *)v6 trailingAnchor];
      v36 = [v34 constraintEqualToAnchor:v35];
      [v36 setActive:1];

      double v37 = [(UIView *)self->_solidBackgroundView topAnchor];
      v38 = [(UIView *)v6 topAnchor];
      v39 = [v37 constraintEqualToAnchor:v38];
      [v39 setActive:1];

      v40 = [(UIView *)self->_solidBackgroundView bottomAnchor];
      v41 = [(UIView *)v6 bottomAnchor];
      v42 = [v40 constraintEqualToAnchor:v41];
      [v42 setActive:1];

      if (!v7)
      {
        constraints = self->_constraints;
        v61 = [(UIView *)v6 heightAnchor];
        v62 = [v61 constraintEqualToConstant:0.0];
        [(NSMutableArray *)constraints addObject:v62];

LABEL_32:
        [MEMORY[0x1E4F28DC8] activateConstraints:self->_constraints];

        goto LABEL_33;
      }
      int64_t v43 = [(PUPhotoEditToolController *)self layoutOrientation];
      v44 = [(PUPhotoEditToolController *)self photoEditSpec];
      uint64_t v45 = [v44 currentLayoutStyle];

      double v46 = 8.0;
      if (v43 == 1) {
        double v46 = 21.0;
      }
      uint64_t v178 = v45;
      if (v45 == 4) {
        double v47 = 27.0;
      }
      else {
        double v47 = v46;
      }
      v48 = objc_msgSend(v7, "widthAnchor", v46);
      v49 = [v48 constraintEqualToConstant:477.0];

      LODWORD(v50) = 1144750080;
      [v49 setPriority:v50];
      uint64_t v183 = v49;
      [(NSMutableArray *)self->_constraints addObject:v49];
      v51 = [(PUPhotoEditMediaToolController *)self view];
      v52 = [v51 window];

      uint64_t v185 = v7;
      int64_t v180 = v43;
      if (v52)
      {
        if (v43 != 1)
        {
          v71 = [(PUPhotoEditToolController *)self delegate];
          v72 = [v71 mediaView];

          [v72 bounds];
          double v74 = v73;
          double v76 = v75;
          double v78 = v77;
          double v80 = v79;
          [v72 edgeInsets];
          double v82 = v74 + v81;
          double v84 = v76 + v83;
          double v86 = v78 - (v81 + v85);
          double v88 = v80 - (v83 + v87);
          v89 = [(PUPhotoEditMediaToolController *)self view];
          objc_msgSend(v89, "convertRect:fromView:", v72, v82, v84, v86, v88);
          CGFloat v91 = v90;
          CGFloat v93 = v92;
          CGFloat v95 = v94;
          CGFloat v97 = v96;

          v195.origin.x = v91;
          v195.origin.y = v93;
          v195.size.width = v95;
          v195.size.height = v97;
          double MidX = CGRectGetMidX(v195);
          uint64_t v99 = self->_constraints;
          v100 = [v7 centerXAnchor];
          id v101 = [(PUPhotoEditMediaToolController *)self view];
          v102 = [v101 leadingAnchor];
          v103 = [v100 constraintEqualToAnchor:v102 constant:MidX];
          [(NSMutableArray *)v99 addObject:v103];

          int v7 = v185;
LABEL_16:

          goto LABEL_17;
        }
        int v53 = self->_constraints;
        v54 = [v7 centerXAnchor];
        v55 = [(PUPhotoEditMediaToolController *)self view];
        v56 = [v55 window];
        v57 = [v56 safeAreaLayoutGuide];
        v58 = [v57 centerXAnchor];
        v59 = [v54 constraintEqualToAnchor:v58];
        [(NSMutableArray *)v53 addObject:v59];

        int v7 = v185;
      }
      else if (v43 != 1)
      {
LABEL_17:
        v104 = self->_constraints;
        uint64_t v184 = v6;
        v105 = [(UIView *)v6 safeAreaLayoutGuide];
        v106 = [v105 bottomAnchor];
        v107 = [v7 bottomAnchor];
        v108 = [v106 constraintEqualToAnchor:v107 constant:v47];
        [(NSMutableArray *)v104 addObject:v108];

        overlayController = self->_overlayController;
        if (overlayController)
        {
          id v162 = self->_constraints;
          long long v176 = [(PUVideoEditOverlayViewController *)overlayController view];
          long long v172 = [v176 widthAnchor];
          long long v174 = [(PUPhotoEditMediaToolController *)self view];
          long long v170 = [v174 widthAnchor];
          long long v168 = [v172 constraintEqualToAnchor:v170];
          v194[0] = v168;
          v166 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
          id v164 = [v166 heightAnchor];
          v165 = [(PUPhotoEditMediaToolController *)self view];
          v163 = [v165 heightAnchor];
          v161 = [v164 constraintEqualToAnchor:v163];
          v194[1] = v161;
          id v160 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
          v159 = [v160 centerXAnchor];
          v110 = [(PUPhotoEditMediaToolController *)self view];
          int v111 = [v110 centerXAnchor];
          v112 = [v159 constraintEqualToAnchor:v111];
          v194[2] = v112;
          v113 = [(PUVideoEditOverlayViewController *)self->_overlayController view];
          v114 = [v113 centerYAnchor];
          v115 = [(PUPhotoEditMediaToolController *)self view];
          v116 = [v115 centerYAnchor];
          v117 = [v114 constraintEqualToAnchor:v116];
          v194[3] = v117;
          v118 = [MEMORY[0x1E4F1C978] arrayWithObjects:v194 count:4];
          [(NSMutableArray *)v162 addObjectsFromArray:v118];
        }
        if (v180 == 1)
        {
          apertureContainer = self->_apertureContainer;
          long long v120 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          v190[0] = *MEMORY[0x1E4F1DAB8];
          v190[1] = v120;
          v190[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          [(UIView *)apertureContainer setTransform:v190];
          v179 = self->_constraints;
          uint64_t v181 = [v186 widthAnchor];
          v121 = [(UIView *)self->_apertureContainer widthAnchor];
          v122 = [v181 constraintEqualToAnchor:v121];
          v193[0] = v122;
          v123 = [v186 centerXAnchor];
          v124 = [(UIView *)self->_apertureContainer centerXAnchor];
          v125 = [v123 constraintEqualToAnchor:v124];
          v193[1] = v125;
          v126 = [v186 bottomAnchor];
          v127 = [(UIView *)self->_apertureContainer bottomAnchor];
          v128 = [v126 constraintEqualToAnchor:v127];
          v193[2] = v128;
          v129 = [MEMORY[0x1E4F1C978] arrayWithObjects:v193 count:3];
          [(NSMutableArray *)v179 addObjectsFromArray:v129];
        }
        else
        {
          v130 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
          apertureContainerLayoutGuide = self->_apertureContainerLayoutGuide;
          self->_apertureContainerLayoutGuide = v130;

          v132 = [(PUPhotoEditMediaToolController *)self view];
          [v132 addLayoutGuide:self->_apertureContainerLayoutGuide];

          v133 = self->_constraints;
          v134 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide heightAnchor];
          v135 = [v186 heightAnchor];
          v136 = [v134 constraintEqualToAnchor:v135];
          v192[0] = v136;
          v137 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide centerYAnchor];
          v138 = [v186 centerYAnchor];
          v139 = [v137 constraintEqualToAnchor:v138];
          v192[1] = v139;
          v140 = [MEMORY[0x1E4F1C978] arrayWithObjects:v192 count:2];
          [(NSMutableArray *)v133 addObjectsFromArray:v140];

          int64_t v141 = [(PUPhotoEditToolController *)self layoutOrientation];
          v142 = self->_constraints;
          v143 = self->_apertureContainerLayoutGuide;
          if (v141 == 2 || v178 == 4)
          {
            v144 = [(UILayoutGuide *)v143 rightAnchor];
            uint64_t v145 = [v186 rightAnchor];
          }
          else
          {
            v144 = [(UILayoutGuide *)v143 leftAnchor];
            uint64_t v145 = [v186 leftAnchor];
          }
          v146 = (void *)v145;
          v147 = [v144 constraintEqualToAnchor:v145];
          [(NSMutableArray *)v142 addObject:v147];

          int64_t v169 = self->_constraints;
          uint64_t v182 = [(UIView *)self->_apertureContainer centerXAnchor];
          uint64_t v177 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide centerXAnchor];
          uint64_t v175 = [v182 constraintEqualToAnchor:v177];
          v191[0] = v175;
          uint64_t v173 = [(UIView *)self->_apertureContainer centerYAnchor];
          uint64_t v171 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide centerYAnchor];
          id v167 = [v173 constraintEqualToAnchor:v171];
          v191[1] = v167;
          v148 = [(UIView *)self->_apertureContainer widthAnchor];
          v149 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide heightAnchor];
          v150 = [v148 constraintEqualToAnchor:v149];
          v191[2] = v150;
          v151 = [(UIView *)self->_apertureContainer heightAnchor];
          v152 = [(UILayoutGuide *)self->_apertureContainerLayoutGuide widthAnchor];
          v153 = [v151 constraintEqualToAnchor:v152];
          v191[3] = v153;
          v154 = [MEMORY[0x1E4F1C978] arrayWithObjects:v191 count:4];
          [(NSMutableArray *)v169 addObjectsFromArray:v154];

          int64_t v155 = [(PUPhotoEditToolController *)self layoutOrientation];
          BOOL v156 = v178 == 4 || v155 == 2;
          double v157 = 1.57079633;
          if (v156) {
            double v157 = -1.57079633;
          }
          CGAffineTransformMakeRotation(&v189, v157);
          v158 = self->_apertureContainer;
          CGAffineTransform v188 = v189;
          [(UIView *)v158 setTransform:&v188];
        }

        int v7 = v185;
        id v6 = v184;
        goto LABEL_32;
      }
      [(PUPhotoEditMediaToolController *)self horizontalPrimaryViewPaddingOffset];
      double v64 = v9 + v63;
      v65 = [v7 leadingAnchor];
      v66 = [(UIView *)v6 leadingAnchor];
      v72 = [v65 constraintGreaterThanOrEqualToAnchor:v66 constant:v64];

      LODWORD(v67) = *(_DWORD *)"";
      [v72 setPriority:v67];
      [(NSMutableArray *)self->_constraints addObject:v72];
      v68 = [v7 trailingAnchor];
      v69 = [(UIView *)v6 trailingAnchor];
      v100 = [v68 constraintLessThanOrEqualToAnchor:v69 constant:-v64];

      LODWORD(v70) = *(_DWORD *)"";
      [v100 setPriority:v70];
      [(NSMutableArray *)self->_constraints addObject:v100];
      goto LABEL_16;
    }
  }
LABEL_33:
  v187.receiver = self;
  v187.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditMediaToolController *)&v187 updateViewConstraints];
}

- (UIButton)livePhotoButton
{
  return (UIButton *)self->_livePhotoButton;
}

- (void)_layoutToolGradient
{
  if (self->_apertureGradientView)
  {
    BOOL v3 = [(PUPhotoEditMediaToolController *)self view];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    [(UIView *)self->_apertureContainer bounds];
    -[CEKEdgeGradientView setFrame:](self->_apertureGradientView, "setFrame:");
    int64_t v8 = [(PUPhotoEditToolController *)self layoutOrientation];
    if (v5 >= v7) {
      double v9 = v7;
    }
    else {
      double v9 = v5;
    }
    double v10 = v9 * 0.03;
    double v11 = v9 * 0.07;
    double v12 = 44.0;
    if (v8 == 1) {
      double v12 = 0.0;
    }
    -[CEKEdgeGradientView setGradientDimensions:](self->_apertureGradientView, "setGradientDimensions:", v10, v11, v11, v10 + v12);
    apertureGradientView = self->_apertureGradientView;
    -[CEKEdgeGradientView setContentInsets:](apertureGradientView, "setContentInsets:", 50.0, 0.0, 0.0, 0.0);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v3 viewDidLayoutSubviews];
  [(PUPhotoEditMediaToolController *)self _layoutToolGradient];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditToolController *)&v4 viewDidAppear:a3];
  self->_viewHasAppeared = 1;
  [(PUPhotoEditMediaToolController *)self _updateTrimControlAndToolbarButtons];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditMediaToolController;
  [(PUPhotoEditMediaToolController *)&v4 viewIsAppearing:a3];
  if (self->_isActiveTool)
  {
    [(PUPhotoEditMediaToolController *)self _invalidateConstraints];
    [(PUPhotoEditMediaToolController *)self updateViewConstraints];
    [(PUPhotoEditMediaToolController *)self _showPrimaryViewIfNeeded];
  }
}

- (void)loadView
{
  objc_super v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  containerView = self->_containerView;
  self->_containerView = v3;

  double v9 = objc_alloc_init(PUPhotoEditToolControllerView);
  [(PUPhotoEditToolControllerView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [MEMORY[0x1E4FB1618] clearColor];
  [(PUPhotoEditToolControllerView *)v9 setBackgroundColor:v5];

  [(PUPhotoEditMediaToolController *)self setView:v9];
  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v6) = 1132068864;
  [(UIView *)self->_containerView setContentHuggingPriority:0 forAxis:v6];
  [(PUPhotoEditToolControllerView *)v9 addSubview:self->_containerView];
  [(PUPhotoEditToolControllerView *)v9 insertSubview:self->_backdropBackgroundView belowSubview:self->_containerView];
  [(PUPhotoEditToolControllerView *)v9 insertSubview:self->_solidBackgroundView belowSubview:self->_containerView];
  double v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  apertureContainer = self->_apertureContainer;
  self->_apertureContainer = v7;

  [(UIView *)self->_apertureContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PUPhotoEditToolControllerView *)v9 addSubview:self->_apertureContainer];
  [(_UIBackdropView *)self->_backdropBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_solidBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (PUPhotoEditMediaToolController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditMediaToolController;
  uint64_t v2 = [(PUPhotoEditToolController *)&v14 initWithNibName:0 bundle:0];
  if (v2)
  {
    objc_super v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    constraints = v2->_constraints;
    v2->_constraints = v3;

    v2->_horizontalControlPadding = 5.0;
    v2->_verticalButtonOffset = 0.0;
    v2->_horizontalPrimaryViewPaddingOffset = 0.0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1FE0]) initWithPrivateStyle:2030];
    backdropBackgroundView = v2->_backdropBackgroundView;
    v2->_backdropBackgroundView = (_UIBackdropView *)v5;

    double v7 = [(_UIBackdropView *)v2->_backdropBackgroundView groupName];
    [(PUPhotoEditMediaToolController *)v2 setBackdropViewGroupName:v7];

    [(_UIBackdropView *)v2->_backdropBackgroundView setHidden:1];
    int64_t v8 = [(_UIBackdropView *)v2->_backdropBackgroundView layer];
    [v8 setAllowsGroupOpacity:0];

    double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    solidBackgroundView = v2->_solidBackgroundView;
    v2->_solidBackgroundView = v9;

    [(UIView *)v2->_solidBackgroundView setAlpha:0.0];
    double v11 = +[PUInterfaceManager currentTheme];
    double v12 = [v11 photoEditingBackgroundColor];
    [(UIView *)v2->_solidBackgroundView setBackgroundColor:v12];

    v2->_trimControllerScrubberNeedsVisualUpdate = 1;
    [(PUPhotoEditToolController *)v2 setHasMediaScrubber:1];
  }
  return v2;
}

@end