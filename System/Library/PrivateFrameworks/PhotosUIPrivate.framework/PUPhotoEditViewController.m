@interface PUPhotoEditViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (id)_defaultLivePhotoRenderPipelineFilters;
+ (id)_defaultMediaViewRenderPipelineFilters;
+ (void)preheatEditDependenciesIfNeeded;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSeekTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime;
- ($5A0616AB7869379E861635CACF312FD6)toolControllerImageModulationOptions:(id)a3;
- (BOOL)_actionButtonsGoInTopToolbar;
- (BOOL)_canCompositionControllerBeReverted:(id)a3;
- (BOOL)_canCopyEdits;
- (BOOL)_canCurrentCompositionControllerBeReverted;
- (BOOL)_canPasteEdits;
- (BOOL)_canPresentExtensions;
- (BOOL)_canPresentMarkup;
- (BOOL)_enableSpatialMediaEditing;
- (BOOL)_hasUnsavedChanges;
- (BOOL)_isInEditRevertTransitionSnapshotVisible;
- (BOOL)_isLivePhotoEffect;
- (BOOL)_isLoopingVideo:(BOOL)a3;
- (BOOL)_isPreviewingOriginal;
- (BOOL)_isQuickCrop;
- (BOOL)_isReadyToRender;
- (BOOL)_isSaveProgressAvailable;
- (BOOL)_isWaitingForAssetChange;
- (BOOL)_isWaitingForSaveCompletion;
- (BOOL)_isZoomedIn;
- (BOOL)_markupGetsItsOwnButton;
- (BOOL)_mediaViewFillsView;
- (BOOL)_shouldDisplayRedEyeTool;
- (BOOL)_shouldHideToolsForQuickCrop;
- (BOOL)_shouldRequestAsyncAdjustmentForAsset:(id)a3 compositionController:(id)a4;
- (BOOL)_shouldShowProResBadge;
- (BOOL)_shouldShowRawDecodeBadge;
- (BOOL)_shouldUseCropPlaceholderViewFrame;
- (BOOL)_updatePreviewOriginal:(BOOL)a3 withPresses:(id)a4;
- (BOOL)burningInTrim;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)currentAssetNeedsGainMap;
- (BOOL)currentToolControllerIsScrolling;
- (BOOL)forceDarkUserInterfaceStyleForZoom;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasLoadedRaw;
- (BOOL)hasLoopingVideoAdjustment;
- (BOOL)isCachingVideo;
- (BOOL)isCinematicAudio;
- (BOOL)isFirstSinceBoot;
- (BOOL)isFirstSinceLaunch;
- (BOOL)isFocusingViewForInteraction;
- (BOOL)isHighframeRateVideo;
- (BOOL)isImageZooming;
- (BOOL)isLivePhotoVideoEnabled;
- (BOOL)isLoopingVideo;
- (BOOL)isOriginalStyleable;
- (BOOL)isPenultimateAvailable;
- (BOOL)isPortraitVideo;
- (BOOL)isRevertingToOriginal;
- (BOOL)isRunningAutoCalculators;
- (BOOL)isScrubbingVideo;
- (BOOL)isSpatialMedia;
- (BOOL)isStandardVideo;
- (BOOL)isTransitioningFromDownloadingToRunningAutoCalculators;
- (BOOL)isVideoOn;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)prepareForDismissingForced:(BOOL)a3;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)pu_wantsTabBarVisible;
- (BOOL)pu_wantsToolbarVisible;
- (BOOL)shouldBePreviewingOriginal;
- (BOOL)shouldEnableImageModulation;
- (BOOL)showOriginalCausedSizeChange;
- (BOOL)showsLabelsForToolButtons;
- (BOOL)togglingShowOriginal;
- (BOOL)wasPlayingBeforeBeginningToScrubVideo;
- (CGImage)gainMapImage;
- (CGPoint)toolController:(id)a3 originalPointFromViewPoint:(CGPoint)a4 view:(id)a5;
- (CGPoint)toolController:(id)a3 viewPointFromOriginalPoint:(CGPoint)a4 view:(id)a5;
- (CGRect)_cropPlaceholderViewFrameForImageSize:(CGSize)a3;
- (CGRect)_oneUpTransitionPlaceholderViewFrame;
- (CGRect)_placeholderViewFrameForImageSize:(CGSize)a3;
- (CGRect)lastKnownMediaViewImageFrame;
- (CGRect)previewViewFrame;
- (CGSize)lastKnownPreviewImageSize;
- (CGSize)toolControllerOriginalImageSize:(id)a3;
- (CGSize)toolControllerOriginalOrientedImageSize:(id)a3;
- (NSString)adjustmentIdentifierAndVersion;
- (NSTimer)assetChangeTimeoutTimer;
- (NSTimer)focusViewForInteractionDelayTimer;
- (NUComposition)originalComposition;
- (NUComposition)uneditedComposition;
- (NURenderContext)videoRenderContext;
- (PEEditSessionEventBuilder)editSessionEventBuilder;
- (PELivePortraitBehaviorController)livePortraitBehaviorController;
- (PEMediaDestination)mediaDestination;
- (PEResourceLoader)resourceLoader;
- (PEValuesCalculator)valuesCalculator;
- (PHContentEditingInput)editSourceContentEditingInput;
- (PICompositionController)compositionController;
- (PLEditSource)editSource;
- (PLEditSource)originalImageEditSource;
- (PLPhotoEditRenderer)mainRenderer;
- (PUAVKitMediaTimelineView)videoScrubberView;
- (PUEditActionActivity)copyPresetAction;
- (PUEditActionActivity)pastePresetAction;
- (PUEditActionActivity)radarAction;
- (PUEditableAsset)photo;
- (PUEditableMediaProvider)mediaProvider;
- (PUEnterEditPerformanceEventBuilder)enterEditEventBuilder;
- (PUExitEditPerformanceEventBuilder)exitEditEventBuilder;
- (PUPhotoEditAggregateSession)aggregateSession;
- (PUPhotoEditIrisModel)photoEditIrisModel;
- (PUPhotoEditPendingEditsRequest)initialPendingEditsRequest;
- (PUPhotoEditPerfHUD)perfHUD;
- (PUPhotoEditViewController)initWithPhoto:(id)a3 mediaProvider:(id)a4 mediaDestination:(id)a5;
- (PUPhotoEditViewControllerPresentationDelegate)presentationDelegate;
- (PUPhotoEditViewControllerSessionDelegate)sessionDelegate;
- (PUPhotoEditViewControllerSpec)photoEditSpec;
- (PUPhotoSceneHUD)sceneHUD;
- (PUQuickCropContext)quickCropContext;
- (PURedeyeToolController)redEyeController;
- (PXAVResourceReclamationAssertion)avResourceReclamationAssertion;
- (PXAction)executedSessionAction;
- (PXImageLayerModulator)imageLayerModulator;
- (PXImageLayerModulator)placeholderImageLayerModulator;
- (PXLivePhotoViewModulator)livePhotoViewModulator;
- (PXSystemAVResourceReclamationController)avResourceReclamationController;
- (PXTimeInterval)autoCalcInterval;
- (PXTimeInterval)editSessionTimeInterval;
- (PXTimeInterval)enterEditTimeInterval;
- (PXTimeInterval)exitEditTimeInterval;
- (PXTimeInterval)filterInterval;
- (PXTimeInterval)modelPrepInterval;
- (PXTimeInterval)resourceCheckingInterval;
- (PXTimeInterval)resourceDownloadInterval;
- (PXTimeInterval)resourceLoadingInterval;
- (UIAlertController)cancelConfirmationAlert;
- (UIAlertController)disabledToolRevertAlert;
- (UIAlertController)irisRevertConfirmationAlert;
- (UIAlertController)jpegPreviewForRawConfirmationAlert;
- (UIAlertController)revertConfirmationAlert;
- (UIButton)playPauseButton;
- (UIEdgeInsets)_currentToolPreviewInsets;
- (UIEdgeInsets)_mediaViewEdgeInsets;
- (UIEdgeInsets)_mediaViewEdgeInsetsWithGeometry:(id)a3;
- (UIImage)placeholderImage;
- (UIMenu)askToSaveAsNewClipMenu;
- (UIPencilInteraction)pencilInteraction;
- (UIView)inEditRevertTransitionSnapshot;
- (double)_imageFrameIntersectionWithMainToolbarFraction;
- (double)_imageFrameIntersectionWithSecondaryToolbarFraction;
- (double)px_HDRFocus;
- (double)px_imageModulationIntensity;
- (double)secondaryToolbarShadowAlphaOverride;
- (double)transientBadgeWidthForText:(id)a3;
- (float)gainMapValue;
- (id)_allTools;
- (id)_appearanceSubmenu;
- (id)_composition;
- (id)_constraintsForToolView:(id)a3 wantsFullscreen:(BOOL)a4;
- (id)_copyPasteEditsSubmenu;
- (id)_createMediaView;
- (id)_currentViewContentsForDismissTransition;
- (id)_defaultInitialToolController;
- (id)_defaultRenderPipelineFiltersForCurrentMode;
- (id)_extensionsSubmenu;
- (id)_internalActionsSubmenu;
- (id)_livePhotoGestureRecognizer;
- (id)_moreButtonMenu;
- (id)_newOutputForContentEditingInput:(id)a3 compositionController:(id)a4;
- (id)_newToolButtonForTool:(id)a3;
- (id)_orientedCIImageFromUIImage:(id)a3;
- (id)_preferredStatusBarHideAnimationParameters;
- (id)_saveAsDuplicateSubmenu;
- (id)_toolActionsSubmenu;
- (id)_toolControllerForAdjustmentCategory:(int64_t)a3;
- (id)_toolControllerForInitialToolType:(int64_t)a3;
- (id)_toolControllerForTag:(int64_t)a3;
- (id)_undoRedoSubmenu;
- (id)adjustmentConstants;
- (id)childViewControllerForScreenEdgesDeferringSystemGestures;
- (id)currentTool;
- (id)debugStringDescribingProgressReasons:(unint64_t)a3;
- (id)editAssetDiagnostics;
- (id)fontForButtons;
- (id)imageProperties;
- (id)mainLivePhotoView;
- (id)mediaView;
- (id)oneUpAssetTransition:(id)a3 adjustTransitionInfo:(id)a4;
- (id)photoEditToolbar:(id)a3 accessibilityHUDItemForButton:(id)a4;
- (id)playbackRateOptions;
- (id)pluginActivitiesForEditPluginSession:(id)a3;
- (id)ppt_afterAutoenhanceBlock;
- (id)ppt_afterRenderBlock;
- (id)ppt_didEndPlaybackBlock;
- (id)ppt_editIsReadyNotificationBlock;
- (id)ppt_exitActionCompleteNotificationBlock;
- (id)ppt_renderStatisticsDictionaryForTimeInterval:(double)a3;
- (id)ppt_willBeginPlaybackBlock;
- (id)prepareForPhotoLibraryChange:(id)a3;
- (id)secondaryToolbar;
- (id)sourceItemForTipID:(id)a3;
- (id)toolControllerHitEventForwardView:(id)a3;
- (id)toolControllerLivePhoto:(id)a3;
- (id)toolControllerOriginalCompositionController:(id)a3;
- (id)toolControllerPreviewView:(id)a3;
- (id)toolControllerUneditedCompositionController:(id)a3;
- (id)undoManager;
- (id)viewForZoomingInScrollView:(id)a3;
- (int)_revertToEmptyCompositionWithCompletionHandler:(id)a3;
- (int)_saveRevertedComposition:(id)a3 contentEditingInput:(id)a4 withCompletionHandler:(id)a5;
- (int64_t)_selectionIndicatorType;
- (int64_t)_toolTypeForToolWithTag:(int64_t)a3;
- (int64_t)assetChangeDismissalState;
- (int64_t)currentToolPickerLayoutDirection;
- (int64_t)initialToolType;
- (int64_t)layoutOrientation;
- (int64_t)mediaViewEdgeInsetsUpdateDisableCount;
- (int64_t)originalImageExifOrientation;
- (int64_t)positionForBar:(id)a3;
- (int64_t)preferredUserInterfaceStyle;
- (int64_t)previewRenderType;
- (int64_t)saveCompletionDismissalState;
- (int64_t)workImageVersion;
- (unint64_t)saveBackgroundTaskIdentifier;
- (unint64_t)toolControllerSourceAssetType:(id)a3;
- (void)_addCropToolGainMapWithRequest:(id)a3;
- (void)_cancelInProgressSaveRequest;
- (void)_cancelPendingFocusViewForInteractionWithDelay;
- (void)_captureSnapshotOfBasePhotoWithCompletionHandler:(id)a3;
- (void)_chooseInitialEditingTool;
- (void)_clearBadgeConstraints;
- (void)_clearToolbars;
- (void)_commitEditSessionActionWithAsset:(id)a3 initialCompositionController:(id)a4 savedCompositionController:(id)a5 localizedActionName:(id)a6;
- (void)_commitSaveAsCopyWithAsset:(id)a3;
- (void)_continueLoadingWithAutocalculators;
- (void)_copyEditsSkippingOptions:(BOOL)a3;
- (void)_createPencilInteractionIfNeeded;
- (void)_createVideoScrubberIfNeeded;
- (void)_didEndAutoCalc;
- (void)_didEndEnterEdit;
- (void)_didEndExitActionWithSessionKeys:(id)a3;
- (void)_didEndExitActionWithSessionKeys:(id)a3 initialComposition:(id)a4;
- (void)_didEndResourceLoading;
- (void)_didModifyAdjustmentWithLocalizedName:(id)a3;
- (void)_didStartAutoCalc;
- (void)_didStartEnterEdit;
- (void)_didStartExitAction;
- (void)_didStartResourceLoading;
- (void)_editPluginSession:(id)a3 checkVideoEnabled:(BOOL)a4 loadVideoComplementURLWithHandler:(id)a5;
- (void)_ensureCleanupResourcesWithCompletion:(id)a3;
- (void)_fileRadar;
- (void)_focusViewForInteractionWithDelay;
- (void)_handle1upToggleButton:(id)a3;
- (void)_handleAutoEnhanceButton:(id)a3;
- (void)_handleCancelButton:(id)a3;
- (void)_handleCoarseScrubberValueDecrease:(id)a3;
- (void)_handleCoarseScrubberValueIncrease:(id)a3;
- (void)_handleCoarseSliderValueDecrease:(id)a3;
- (void)_handleCoarseSliderValueIncrease:(id)a3;
- (void)_handleDidLoadAdjustmentsAndBaseImageWithResult:(id)a3;
- (void)_handleDidLoadOriginalWithResult:(id)a3;
- (void)_handleDoneAction:(id)a3;
- (void)_handleDoneButton:(id)a3;
- (void)_handleLivePhotoTouchRecognizer:(id)a3;
- (void)_handleMainActionButton:(id)a3;
- (void)_handleMediaViewReady:(id)a3 statistics:(id)a4;
- (void)_handleRedoButton:(id)a3;
- (void)_handleResourceLoadChange;
- (void)_handleRevertButton:(id)a3;
- (void)_handleSaveAction:(int64_t)a3;
- (void)_handleScrubberValueDecrease:(id)a3;
- (void)_handleScrubberValueIncrease:(id)a3;
- (void)_handleShowOriginalButton:(id)a3;
- (void)_handleSliderValueDecrease:(id)a3;
- (void)_handleSliderValueIncrease:(id)a3;
- (void)_handleSwipeDownGesture:(id)a3;
- (void)_handleTogglePreviewTapGesture:(id)a3;
- (void)_handleToolbarToolButton:(id)a3;
- (void)_handleUndoButton:(id)a3;
- (void)_handleZoomButton:(id)a3;
- (void)_hideEphemeralViews:(BOOL)a3;
- (void)_hideProgressIndicatorImmediately:(BOOL)a3;
- (void)_installGestureRecognizer:(id)a3 type:(unint64_t)a4;
- (void)_installInEditRevertTransitionSnapshot;
- (void)_layoutShadowView:(id)a3 forToolbar:(id)a4;
- (void)_loadOriginalImageIfNeeded;
- (void)_loadPhotoEditResourcesIfNeeded;
- (void)_loadToolsIfNeeded;
- (void)_loadToolsIfNeeded:(BOOL)a3;
- (void)_notifyDelegateSaveFinishedIfReadyWithAsset:(id)a3;
- (void)_pasteEdits;
- (void)_performDiscardAction;
- (void)_performInEditRevertWithToolButton:(id)a3;
- (void)_performRevertAction;
- (void)_ppt_conditionallyExecuteAfterRender;
- (void)_presentExtensions;
- (void)_presentMarkup;
- (void)_presentWarningForIrisRemovesEditsWithCompletion:(id)a3;
- (void)_produceMoreButtonMenuElementsWithCompletion:(id)a3;
- (void)_reloadMoreButtonMenu;
- (void)_reloadToolbarButtonsIfNeeded;
- (void)_removePlaceholderImageViewIfNeeded;
- (void)_requestLivePhotoAssetWithFilters:(id)a3 completion:(id)a4;
- (void)_resetModelAndBaseImagesToWorkImageVersion:(int64_t)a3;
- (void)_resignCurrentTool;
- (void)_restoreSnapshot:(id)a3 withCompletionHandler:(id)a4;
- (void)_sendPasteEditsAnalytics;
- (void)_setAggregateSession:(id)a3;
- (void)_setNeedsUserInterfaceAppearanceUpdateAnimated;
- (void)_setOriginalURL:(id)a3 originalEditSource:(id)a4;
- (void)_setPlaybackEnabled:(BOOL)a3;
- (void)_setTransientStatusBadgeVisible:(BOOL)a3;
- (void)_setupImagePluginSession;
- (void)_setupToolsIfNeeded;
- (void)_setupVideoPluginSession;
- (void)_showCancelAndRevertOptionsAllowResetTool:(BOOL)a3;
- (void)_showJpegPreviewForRawRevertAlert;
- (void)_showProgressIndicator;
- (void)_startMarkupSession;
- (void)_startMonitoringSaveProgressIfNeeded;
- (void)_startShowingOriginalBadge;
- (void)_startTimeoutTimerForAssetChange;
- (void)_startWaitingForAssetChange:(id)a3;
- (void)_startWaitingForSaveRequestID:(int)a3;
- (void)_stopMonitoringSaveProgress;
- (void)_stopWaitingForAssetChangeWithAsset:(id)a3 success:(BOOL)a4;
- (void)_stopWaitingForSaveRequestWithAsset:(id)a3;
- (void)_teardownCleanupResources;
- (void)_timeoutWaitingForAssetChange;
- (void)_toggleShowOriginal;
- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4;
- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)_transitionToNewToolViewController:(id)a3 oldToolViewController:(id)a4 animationBlock:(id)a5 completion:(id)a6 animated:(BOOL)a7;
- (void)_undoManagerDidCloseUndoGroupNotification:(id)a3;
- (void)_undoManagerDidRedo:(id)a3;
- (void)_undoManagerDidUndo:(id)a3;
- (void)_undoManagerWillRedo:(id)a3;
- (void)_undoManagerWillUndo:(id)a3;
- (void)_uninstallInEditRevertTransitionSnapshotAnimated:(BOOL)a3;
- (void)_updateBackgroundColor;
- (void)_updateCancelButtonAnimated:(BOOL)a3;
- (void)_updateForcingDarkUserInterfaceStyleForZoomIfNeeded;
- (void)_updateGainMap;
- (void)_updateKeyCommands;
- (void)_updateLayerModulation;
- (void)_updateLayoutOrientationWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4;
- (void)_updateLivePhotoPlaybackGestureRecognizer;
- (void)_updateMainActionButtonAnimated:(BOOL)a3;
- (void)_updateMediaViewEdgeInsets;
- (void)_updateMediaViewLayoutWithCoordinator:(id)a3 layoutOrientation:(int64_t)a4;
- (void)_updateMediaViewPlaybackStyle;
- (void)_updateModelDependentControlsAnimated:(BOOL)a3;
- (void)_updateMoreButtonAnimated:(BOOL)a3;
- (void)_updateMutedState;
- (void)_updatePenultimateAvailableWithCompletionHandler:(id)a3;
- (void)_updatePhotoEditIrisModel;
- (void)_updatePlaceholderImage;
- (void)_updatePluginSession;
- (void)_updatePluginWorkImageVersion;
- (void)_updatePreviewingOriginal;
- (void)_updateProgressEventBlockingViewConstraints;
- (void)_updateProgressIndicatorInteractionDisabledWithReason:(int64_t)a3 showsIndicator:(BOOL)a4 isSavingWithProgress:(BOOL)a5;
- (void)_updateRenderedPreviewForceRender:(BOOL)a3;
- (void)_updateSaveProgress;
- (void)_updateShowOriginalButtonAnimated:(BOOL)a3;
- (void)_updateSpecDependentUIPieces;
- (void)_updateSubviewsOrdering;
- (void)_updateSwipeDownGestureRecognizer;
- (void)_updateTogglePreviewGestureRecognizer;
- (void)_updateToolbarBackgroundAnimated:(BOOL)a3;
- (void)_updateToolbarButtonPositions;
- (void)_updateToolbarShadowAlpha;
- (void)_updateToolbarShadowStyling:(id)a3 forToolbar:(id)a4;
- (void)_updateToolbarsAnimated:(BOOL)a3;
- (void)_updateToolbarsContentPadding;
- (void)_updateTraitCollectionAndLayoutReferenceSize;
- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3;
- (void)_updateTransientStatusBadgeForPreviewingOriginal;
- (void)_updateUndoRedoButtonsAnimated:(BOOL)a3;
- (void)_updateValuesCalculator;
- (void)_updateVideoScrubber;
- (void)_updateVideoScrubberDisplayAnimate:(BOOL)a3;
- (void)_updateZoomButton;
- (void)_willModifyAdjustment;
- (void)addCropToolGainMapIfNeeded;
- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4;
- (void)applyAutoEnhance:(id)a3 completion:(id)a4;
- (void)asShotCompositionController:(id)a3;
- (void)autoEnhanceAssets:(id)a3;
- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3;
- (void)compositionController:(id)a3 didAddAdjustment:(id)a4;
- (void)compositionController:(id)a3 didRemoveAdjustment:(id)a4;
- (void)compositionController:(id)a3 didUpdateAdjustment:(id)a4;
- (void)compositionController:(id)a3 didUpdateAdjustments:(id)a4;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)configureEnablenessOfControlButton:(id)a3 animated:(BOOL)a4 canVisuallyDisable:(BOOL)a5;
- (void)copyAdjustments:(id)a3;
- (void)copyAdjustmentsSkippingOptions:(id)a3;
- (void)dealloc;
- (void)diagnosticsAlertDismissed;
- (void)didFinishWithAsset:(id)a3 savedChanges:(BOOL)a4;
- (void)didFinishWithChanges:(BOOL)a3;
- (void)dismissLivePhotoRevertConfirmationAlert;
- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5;
- (void)editPluginSession:(id)a3 didEndWithCompletionType:(unint64_t)a4 forPluginIdentifier:(id)a5;
- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadDisplaySizeImageWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadFullSizeImageWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadThumbnailImageWithSize:(CGSize)a4 loadHandler:(id)a5;
- (void)editPluginSession:(id)a3 loadVideoComplementURLWithHandler:(id)a4;
- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4;
- (void)editPluginSessionAvailabilityDidChange:(id)a3;
- (void)editPluginSessionWillBegin:(id)a3;
- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3;
- (void)editValuesCalculatorHasChangedFlashStatus:(id)a3;
- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3;
- (void)editValuesCalculatorHasChangedImageValues:(id)a3;
- (void)fileRadarAndAttachFile:(id)a3;
- (void)flashTransientBadgeWithText:(id)a3;
- (void)fulfillPendingEditsRequest:(id)a3;
- (void)initialCinematographyLoadComplete;
- (void)mediaDestination:(id)a3 didCompleteSaveRequest:(id)a4;
- (void)mediaDestination:(id)a3 willBeginSaveRequest:(id)a4;
- (void)mediaTimelineControlViewDidChangeValue:(id)a3;
- (void)mediaTimelineControlViewDidEndChanging:(id)a3;
- (void)mediaTimelineControlViewWillBeginChanging:(id)a3;
- (void)mediaView:(id)a3 didZoom:(double)a4;
- (void)mediaViewDidEndDecelerating:(id)a3;
- (void)mediaViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)mediaViewDidEndLivePhotoPlayback:(id)a3;
- (void)mediaViewDidEndZooming:(id)a3;
- (void)mediaViewDidFinishPreparingVideo:(id)a3;
- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4;
- (void)mediaViewDidPlayToEnd:(id)a3;
- (void)mediaViewDidScroll:(id)a3;
- (void)mediaViewDidStartPreparingVideo:(id)a3;
- (void)mediaViewDidUpdateLivePhoto:(id)a3;
- (void)mediaViewIsReadyForVideoPlayback:(id)a3;
- (void)mediaViewWillBeginDragging:(id)a3;
- (void)mediaViewWillBeginLivePhotoPlayback:(id)a3;
- (void)mediaViewWillBeginZooming:(id)a3;
- (void)navigateToSegment:(id)a3;
- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6;
- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4;
- (void)oneUpAssetTransitionDidEnd:(id)a3;
- (void)oneUpAssetTransitionWillBegin:(id)a3;
- (void)pencilInteractionDidTap:(id)a3;
- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5;
- (void)photoEditToolbar:(id)a3 showAccessibilityHUDForItem:(id)a4;
- (void)photoLibraryChangesPausedDidChange;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)ppt_applyAutoenhance:(id)a3;
- (void)ppt_cancelEdits;
- (void)ppt_cancelEditsWithCompletion:(id)a3;
- (void)ppt_configureSelectedSliderWithSteps:(int64_t)a3;
- (void)ppt_executeAfterRender:(id)a3;
- (void)ppt_navigateToPortraitLightingEffects:(id)a3;
- (void)ppt_playLivePhotoWithWillBeginPlaybackBlock:(id)a3 didEndPlaybackBlock:(id)a4;
- (void)ppt_replayCleanupBrushStrokeWithCompletionBlock:(id)a3;
- (void)ppt_revert;
- (void)ppt_revertWithCompletion:(id)a3;
- (void)ppt_save;
- (void)ppt_saveWithCompletion:(id)a3;
- (void)ppt_scrollBWSlider:(id)a3;
- (void)ppt_scrollColorSlider:(id)a3;
- (void)ppt_scrollLightSlider:(id)a3;
- (void)ppt_scrollSelectedSliderByDelta;
- (void)ppt_scrollSliderNamed:(id)a3 value:(id)a4 completion:(id)a5;
- (void)ppt_selectAdjustmentsController:(id)a3;
- (void)ppt_selectCleanupController:(id)a3;
- (void)ppt_selectCropController:(id)a3;
- (void)ppt_selectFiltersController:(id)a3;
- (void)ppt_selectLightingEffect:(id)a3 completionBlock:(id)a4;
- (void)ppt_selectNextLightingEffect:(id)a3;
- (void)ppt_selectPerspectiveController:(id)a3;
- (void)ppt_selectPortraitController:(id)a3;
- (void)ppt_selectStyle:(id)a3 completionBlock:(id)a4;
- (void)ppt_selectStyleController:(id)a3;
- (void)ppt_setEditIsReadyNotificationBlock:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)prepareTipPopover:(id)a3 tipID:(id)a4;
- (void)presentDiagnosticAlert:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)removeCropToolGainMap;
- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5;
- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5;
- (void)rotateAssetsClockwise:(id)a3;
- (void)rotateAssetsCounterclockwise:(id)a3;
- (void)setAdjustmentIdentifierAndVersion:(id)a3;
- (void)setAssetChangeDismissalState:(int64_t)a3;
- (void)setAssetChangeTimeoutTimer:(id)a3;
- (void)setAutoCalcInterval:(id)a3;
- (void)setAvResourceReclamationAssertion:(id)a3;
- (void)setBurningInTrim:(BOOL)a3;
- (void)setCancelConfirmationAlert:(id)a3;
- (void)setCompositionController:(id)a3;
- (void)setCopyPresetAction:(id)a3;
- (void)setCurrentToolControllerIsScrolling:(BOOL)a3;
- (void)setDisabledToolRevertAlert:(id)a3;
- (void)setEditSessionEventBuilder:(id)a3;
- (void)setEditSessionTimeInterval:(id)a3;
- (void)setEditSource:(id)a3;
- (void)setEditSourceContentEditingInput:(id)a3;
- (void)setEnterEditEventBuilder:(id)a3;
- (void)setEnterEditTimeInterval:(id)a3;
- (void)setExecutedSessionAction:(id)a3;
- (void)setExitEditEventBuilder:(id)a3;
- (void)setExitEditTimeInterval:(id)a3;
- (void)setFilterInterval:(id)a3;
- (void)setFirstSinceBoot:(BOOL)a3;
- (void)setFirstSinceLaunch:(BOOL)a3;
- (void)setFocusViewForInteractionDelayTimer:(id)a3;
- (void)setFocusingViewForInteraction:(BOOL)a3;
- (void)setForceDarkUserInterfaceStyleForZoom:(BOOL)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setHasLoadedRaw:(BOOL)a3;
- (void)setImageLayerModulator:(id)a3;
- (void)setInEditRevertTransitionSnapshot:(id)a3;
- (void)setInitialPendingEditsRequest:(id)a3;
- (void)setInitialSeekTime:(id *)a3;
- (void)setInitialToolType:(int64_t)a3;
- (void)setIrisRevertConfirmationAlert:(id)a3;
- (void)setIsCachingVideo:(BOOL)a3;
- (void)setIsScrubbingVideo:(BOOL)a3;
- (void)setIsTransitioningFromDownloadingToRunningAutoCalculators:(BOOL)a3;
- (void)setJpegPreviewForRawConfirmationAlert:(id)a3;
- (void)setLastKnownMediaViewImageFrame:(CGRect)a3;
- (void)setLastKnownPreviewImageSize:(CGSize)a3;
- (void)setLayoutOrientation:(int64_t)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setLivePhotoVideoEnabled:(BOOL)a3;
- (void)setLivePhotoViewModulator:(id)a3;
- (void)setLivePortraitBehaviorController:(id)a3;
- (void)setMainRenderer:(id)a3;
- (void)setMediaViewEdgeInsetsUpdateDisableCount:(int64_t)a3;
- (void)setModelPrepInterval:(id)a3;
- (void)setOriginalComposition:(id)a3;
- (void)setOriginalImageEditSource:(id)a3;
- (void)setOriginalImageExifOrientation:(int64_t)a3;
- (void)setOriginalStillImageTime:(id *)a3;
- (void)setPastePresetAction:(id)a3;
- (void)setPencilInteraction:(id)a3;
- (void)setPenultimateAvailable:(BOOL)a3;
- (void)setPerfHUD:(id)a3;
- (void)setPhotoEditIrisModel:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPpt_afterAutoenhanceBlock:(id)a3;
- (void)setPpt_afterRenderBlock:(id)a3;
- (void)setPpt_didEndPlaybackBlock:(id)a3;
- (void)setPpt_editIsReadyNotificationBlock:(id)a3;
- (void)setPpt_exitActionCompleteNotificationBlock:(id)a3;
- (void)setPpt_willBeginPlaybackBlock:(id)a3;
- (void)setPreferredAppearance:(int64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setPreviewRenderType:(int64_t)a3;
- (void)setQuickCropContext:(id)a3;
- (void)setRadarAction:(id)a3;
- (void)setRedEyeController:(id)a3;
- (void)setResourceCheckingInterval:(id)a3;
- (void)setResourceDownloadInterval:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setResourceLoadingInterval:(id)a3;
- (void)setRevertConfirmationAlert:(id)a3;
- (void)setRevertingToOriginal:(BOOL)a3;
- (void)setRunningAutoCalculators:(BOOL)a3;
- (void)setSaveBackgroundTaskIdentifier:(unint64_t)a3;
- (void)setSaveCompletionDismissalState:(int64_t)a3;
- (void)setSceneHUD:(id)a3;
- (void)setSecondaryToolbarShadowAlphaOverride:(double)a3;
- (void)setSessionDelegate:(id)a3;
- (void)setShouldBePreviewingOriginal:(BOOL)a3;
- (void)setShowOriginalCausedSizeChange:(BOOL)a3;
- (void)setTogglingShowOriginal:(BOOL)a3;
- (void)setUneditedComposition:(id)a3;
- (void)setValuesCalculator:(id)a3;
- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3;
- (void)setWorkImageVersion:(int64_t)a3;
- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4;
- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5;
- (void)toggleEditor:(id)a3;
- (void)toggleLivePhotoActive;
- (void)toolController:(id)a3 didChangeIsScrolling:(BOOL)a4;
- (void)toolController:(id)a3 didChangePreferredPreviewViewInsetsAnimated:(BOOL)a4;
- (void)toolController:(id)a3 showVideoScrubber:(BOOL)a4 animated:(BOOL)a5;
- (void)toolController:(id)a3 updateModelDependentControlsAnimated:(BOOL)a4;
- (void)toolControllerDidChangeIsActivelyAdjusting:(id)a3;
- (void)toolControllerDidChangeIsPerformingLiveInteraction:(id)a3;
- (void)toolControllerDidChangeWantsDefaultPreviewView:(id)a3;
- (void)toolControllerDidChangeWantsTapToToggleOriginalEnabled:(id)a3 enabled:(BOOL)a4;
- (void)toolControllerDidFinish:(id)a3;
- (void)toolControllerDidFinishLoadingThumbnails:(id)a3;
- (void)toolControllerDidUpdateToolbar:(id)a3;
- (void)toolControllerWantsGestureRecognizerUpdate:(id)a3;
- (void)toolControllerWantsSecondaryToolbarShadow:(id)a3 alpha:(double)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)trimToolPlayerWrapper:(id)a3 requestAssetWithFilters:(id)a4 completion:(id)a5;
- (void)updateAnalyticsEventBuilderActionType:(id)a3 forAssets:(id)a4;
- (void)updateMainButtonForSaveAsNewClipMenu;
- (void)updateProgressIndicatorAnimated:(BOOL)a3;
- (void)updateViewConstraints;
- (void)validateCommand:(id)a3;
- (void)viewControllerSpec:(id)a3 didChange:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewModel:(id)a3 didChange:(id)a4;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PUPhotoEditViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avResourceReclamationAssertion, 0);
  objc_storeStrong((id *)&self->_avResourceReclamationController, 0);
  objc_storeStrong((id *)&self->_focusViewForInteractionDelayTimer, 0);
  objc_storeStrong((id *)&self->_radarAction, 0);
  objc_storeStrong((id *)&self->_pastePresetAction, 0);
  objc_storeStrong((id *)&self->_copyPresetAction, 0);
  objc_storeStrong(&self->_ppt_exitActionCompleteNotificationBlock, 0);
  objc_storeStrong(&self->_ppt_editIsReadyNotificationBlock, 0);
  objc_storeStrong(&self->_ppt_didEndPlaybackBlock, 0);
  objc_storeStrong(&self->_ppt_willBeginPlaybackBlock, 0);
  objc_storeStrong(&self->_ppt_afterAutoenhanceBlock, 0);
  objc_storeStrong(&self->_ppt_afterRenderBlock, 0);
  objc_storeStrong((id *)&self->_editSessionEventBuilder, 0);
  objc_storeStrong((id *)&self->_exitEditEventBuilder, 0);
  objc_storeStrong((id *)&self->_enterEditEventBuilder, 0);
  objc_storeStrong((id *)&self->_editSessionTimeInterval, 0);
  objc_storeStrong((id *)&self->_exitEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_filterInterval, 0);
  objc_storeStrong((id *)&self->_autoCalcInterval, 0);
  objc_storeStrong((id *)&self->_modelPrepInterval, 0);
  objc_storeStrong((id *)&self->_resourceLoadingInterval, 0);
  objc_storeStrong((id *)&self->_resourceDownloadInterval, 0);
  objc_storeStrong((id *)&self->_resourceCheckingInterval, 0);
  objc_storeStrong((id *)&self->_enterEditTimeInterval, 0);
  objc_storeStrong((id *)&self->_inEditRevertTransitionSnapshot, 0);
  objc_storeStrong((id *)&self->_sceneHUD, 0);
  objc_storeStrong((id *)&self->_perfHUD, 0);
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_destroyWeak((id *)&self->_disabledToolRevertAlert);
  objc_destroyWeak((id *)&self->_irisRevertConfirmationAlert);
  objc_destroyWeak((id *)&self->_jpegPreviewForRawConfirmationAlert);
  objc_destroyWeak((id *)&self->_revertConfirmationAlert);
  objc_destroyWeak((id *)&self->_cancelConfirmationAlert);
  objc_storeStrong((id *)&self->_assetChangeTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_originalImageEditSource, 0);
  objc_storeStrong((id *)&self->_editSourceContentEditingInput, 0);
  objc_storeStrong((id *)&self->_videoRenderContext, 0);
  objc_storeStrong((id *)&self->_playPauseButton, 0);
  objc_storeStrong((id *)&self->_videoScrubberView, 0);
  objc_storeStrong((id *)&self->_editSource, 0);
  objc_storeStrong((id *)&self->_photoEditIrisModel, 0);
  objc_storeStrong((id *)&self->_adjustmentIdentifierAndVersion, 0);
  objc_storeStrong((id *)&self->_originalComposition, 0);
  objc_storeStrong((id *)&self->_uneditedComposition, 0);
  objc_storeStrong((id *)&self->_executedSessionAction, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_livePortraitBehaviorController, 0);
  objc_storeStrong((id *)&self->_aggregateSession, 0);
  objc_storeStrong((id *)&self->_redEyeController, 0);
  objc_storeStrong((id *)&self->_mainRenderer, 0);
  objc_storeStrong((id *)&self->_valuesCalculator, 0);
  objc_storeStrong((id *)&self->_placeholderImageLayerModulator, 0);
  objc_storeStrong((id *)&self->_livePhotoViewModulator, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_destroyWeak((id *)&self->_sessionDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_quickCropContext, 0);
  objc_storeStrong((id *)&self->_initialPendingEditsRequest, 0);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_photoEditSpec, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_diagnosticsFileURL, 0);
  objc_storeStrong((id *)&self->_diagnosticsManager, 0);
  objc_storeStrong((id *)&self->_pasteEditsEventBuilder, 0);
  objc_storeStrong((id *)&self->_smartCopyPasteQueue, 0);
  objc_storeStrong((id *)&self->_playbackRateOptions, 0);
  objc_storeStrong((id *)&self->_toolControllerTagsByKeyCommandNumber, 0);
  objc_storeStrong((id *)&self->_addedKeyCommands, 0);
  objc_storeStrong((id *)&self->_askToSaveAsNewClipMenu, 0);
  objc_storeStrong((id *)&self->_assetsWaitingForLibraryNotification, 0);
  objc_storeStrong((id *)&self->_imageProperties, 0);
  objc_storeStrong((id *)&self->_pptState, 0);
  objc_storeStrong((id *)&self->_audioToolController, 0);
  objc_storeStrong((id *)&self->_photoStylesToolController, 0);
  objc_storeStrong((id *)&self->_portraitToolController, 0);
  objc_storeStrong((id *)&self->_mediaToolController, 0);
  objc_storeStrong((id *)&self->_adjustmentsController, 0);
  objc_storeStrong((id *)&self->_cleanupController, 0);
  objc_storeStrong((id *)&self->_filtersController, 0);
  objc_storeStrong((id *)&self->_cropController, 0);
  objc_storeStrong((id *)&self->_progressEventBlockingView, 0);
  objc_storeStrong((id *)&self->_saveProgressTimer, 0);
  objc_storeStrong(&self->_progressIndicatorInteractionDisablingToken, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_assetTypeBadge, 0);
  objc_storeStrong((id *)&self->_swipeDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_togglePreviewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_transientStatusBadge, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_autoEnhanceController, 0);
  objc_storeStrong((id *)&self->_pluginSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_pluginFullSizeImageSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_pluginFullSizeImageURL, 0);
  objc_storeStrong((id *)&self->_stashedSnapshot, 0);
  objc_storeStrong((id *)&self->_pluginSession, 0);
  objc_storeStrong((id *)&self->_showOriginalButton, 0);
  objc_storeStrong((id *)&self->_zoomButton, 0);
  objc_storeStrong((id *)&self->_redEyeButton, 0);
  objc_storeStrong((id *)&self->_markupButton, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_redoButton, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_secondaryCenterView, 0);
  objc_storeStrong((id *)&self->_secondaryTrailingViews, 0);
  objc_storeStrong((id *)&self->_secondaryLeadingViews, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarShadow, 0);
  objc_storeStrong((id *)&self->_mainToolbarShadow, 0);
  objc_storeStrong((id *)&self->_toolPickerController, 0);
  objc_storeStrong((id *)&self->_edit1upToggleButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_toolTagLabelMap, 0);
  objc_storeStrong((id *)&self->_coreToolButtonViews, 0);
  objc_storeStrong((id *)&self->_coreToolButtons, 0);
  objc_storeStrong((id *)&self->_secondaryToolbar, 0);
  objc_storeStrong((id *)&self->_mainToolbar, 0);
  objc_storeStrong((id *)&self->_imageFrameLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_imageFrameLayoutGuide, 0);
  objc_storeStrong((id *)&self->_actionButtonConstraints, 0);
  objc_storeStrong((id *)&self->_mediaViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressEventBlockingViewConstraints, 0);
  objc_storeStrong((id *)&self->_progressIndicatorViewConstraints, 0);
  objc_storeStrong((id *)&self->_assetTypeBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_transientStatusBadgeConstraints, 0);
  objc_storeStrong((id *)&self->_placeholderImageViewConstraints, 0);
  objc_storeStrong((id *)&self->_currentToolViewConstraints, 0);
  objc_storeStrong((id *)&self->_secondaryToolbarConstraints, 0);
  objc_storeStrong((id *)&self->_mainToolbarConstraints, 0);
  objc_storeStrong((id *)&self->_renderImageClient, 0);
  objc_storeStrong(&self->_videoScrubberTimeObserver, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_currentTool, 0);
  objc_storeStrong((id *)&self->_previousEditingTool, 0);
  objc_storeStrong((id *)&self->_currentEditingTool, 0);
  objc_storeStrong((id *)&self->__allTools, 0);
}

- (void)setShowOriginalCausedSizeChange:(BOOL)a3
{
  self->_showOriginalCausedSizeChange = a3;
}

- (BOOL)showOriginalCausedSizeChange
{
  return self->_showOriginalCausedSizeChange;
}

- (void)setAvResourceReclamationAssertion:(id)a3
{
}

- (PXAVResourceReclamationAssertion)avResourceReclamationAssertion
{
  return self->_avResourceReclamationAssertion;
}

- (PXSystemAVResourceReclamationController)avResourceReclamationController
{
  return self->_avResourceReclamationController;
}

- (void)setSecondaryToolbarShadowAlphaOverride:(double)a3
{
  self->_secondaryToolbarShadowAlphaOverride = a3;
}

- (double)secondaryToolbarShadowAlphaOverride
{
  return self->_secondaryToolbarShadowAlphaOverride;
}

- (void)setCurrentToolControllerIsScrolling:(BOOL)a3
{
  self->_currentToolControllerIsScrolling = a3;
}

- (BOOL)currentToolControllerIsScrolling
{
  return self->_currentToolControllerIsScrolling;
}

- (void)setForceDarkUserInterfaceStyleForZoom:(BOOL)a3
{
  self->_forceDarkUserInterfaceStyleForZoom = a3;
}

- (BOOL)forceDarkUserInterfaceStyleForZoom
{
  return self->_forceDarkUserInterfaceStyleForZoom;
}

- (void)setFocusViewForInteractionDelayTimer:(id)a3
{
}

- (NSTimer)focusViewForInteractionDelayTimer
{
  return self->_focusViewForInteractionDelayTimer;
}

- (void)setSaveBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_saveBackgroundTaskIdentifier = a3;
}

- (unint64_t)saveBackgroundTaskIdentifier
{
  return self->_saveBackgroundTaskIdentifier;
}

- (void)setRadarAction:(id)a3
{
}

- (void)setPastePresetAction:(id)a3
{
}

- (void)setCopyPresetAction:(id)a3
{
}

- (void)setPpt_exitActionCompleteNotificationBlock:(id)a3
{
}

- (id)ppt_exitActionCompleteNotificationBlock
{
  return self->_ppt_exitActionCompleteNotificationBlock;
}

- (void)setPpt_editIsReadyNotificationBlock:(id)a3
{
}

- (id)ppt_editIsReadyNotificationBlock
{
  return self->_ppt_editIsReadyNotificationBlock;
}

- (void)setPpt_didEndPlaybackBlock:(id)a3
{
}

- (id)ppt_didEndPlaybackBlock
{
  return objc_getProperty(self, a2, 2312, 1);
}

- (void)setPpt_willBeginPlaybackBlock:(id)a3
{
}

- (id)ppt_willBeginPlaybackBlock
{
  return objc_getProperty(self, a2, 2304, 1);
}

- (void)setPpt_afterAutoenhanceBlock:(id)a3
{
}

- (id)ppt_afterAutoenhanceBlock
{
  return objc_getProperty(self, a2, 2296, 1);
}

- (void)setPpt_afterRenderBlock:(id)a3
{
}

- (id)ppt_afterRenderBlock
{
  return objc_getProperty(self, a2, 2288, 1);
}

- (void)setEditSessionEventBuilder:(id)a3
{
}

- (PEEditSessionEventBuilder)editSessionEventBuilder
{
  return self->_editSessionEventBuilder;
}

- (void)setExitEditEventBuilder:(id)a3
{
}

- (PUExitEditPerformanceEventBuilder)exitEditEventBuilder
{
  return self->_exitEditEventBuilder;
}

- (void)setEnterEditEventBuilder:(id)a3
{
}

- (PUEnterEditPerformanceEventBuilder)enterEditEventBuilder
{
  return self->_enterEditEventBuilder;
}

- (void)setEditSessionTimeInterval:(id)a3
{
}

- (PXTimeInterval)editSessionTimeInterval
{
  return self->_editSessionTimeInterval;
}

- (void)setExitEditTimeInterval:(id)a3
{
}

- (PXTimeInterval)exitEditTimeInterval
{
  return self->_exitEditTimeInterval;
}

- (void)setFilterInterval:(id)a3
{
}

- (PXTimeInterval)filterInterval
{
  return self->_filterInterval;
}

- (void)setAutoCalcInterval:(id)a3
{
}

- (PXTimeInterval)autoCalcInterval
{
  return self->_autoCalcInterval;
}

- (void)setModelPrepInterval:(id)a3
{
}

- (PXTimeInterval)modelPrepInterval
{
  return self->_modelPrepInterval;
}

- (void)setResourceLoadingInterval:(id)a3
{
}

- (PXTimeInterval)resourceLoadingInterval
{
  return self->_resourceLoadingInterval;
}

- (void)setResourceDownloadInterval:(id)a3
{
}

- (PXTimeInterval)resourceDownloadInterval
{
  return self->_resourceDownloadInterval;
}

- (void)setResourceCheckingInterval:(id)a3
{
}

- (PXTimeInterval)resourceCheckingInterval
{
  return self->_resourceCheckingInterval;
}

- (void)setEnterEditTimeInterval:(id)a3
{
}

- (PXTimeInterval)enterEditTimeInterval
{
  return self->_enterEditTimeInterval;
}

- (void)setFirstSinceLaunch:(BOOL)a3
{
  self->_firstSinceLaunch = a3;
}

- (BOOL)isFirstSinceLaunch
{
  return self->_firstSinceLaunch;
}

- (void)setFirstSinceBoot:(BOOL)a3
{
  self->_firstSinceBoot = a3;
}

- (BOOL)isFirstSinceBoot
{
  return self->_firstSinceBoot;
}

- (void)setInEditRevertTransitionSnapshot:(id)a3
{
}

- (UIView)inEditRevertTransitionSnapshot
{
  return self->_inEditRevertTransitionSnapshot;
}

- (void)setSceneHUD:(id)a3
{
}

- (PUPhotoSceneHUD)sceneHUD
{
  return self->_sceneHUD;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (void)setPerfHUD:(id)a3
{
}

- (PUPhotoEditPerfHUD)perfHUD
{
  return self->_perfHUD;
}

- (void)setPencilInteraction:(id)a3
{
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (void)setMediaViewEdgeInsetsUpdateDisableCount:(int64_t)a3
{
  self->_mediaViewEdgeInsetsUpdateDisableCount = a3;
}

- (int64_t)mediaViewEdgeInsetsUpdateDisableCount
{
  return self->_mediaViewEdgeInsetsUpdateDisableCount;
}

- (void)setBurningInTrim:(BOOL)a3
{
  self->_burningInTrim = a3;
}

- (BOOL)burningInTrim
{
  return self->_burningInTrim;
}

- (void)setLastKnownMediaViewImageFrame:(CGRect)a3
{
  self->_lastKnownMediaViewImageFrame = a3;
}

- (CGRect)lastKnownMediaViewImageFrame
{
  double x = self->_lastKnownMediaViewImageFrame.origin.x;
  double y = self->_lastKnownMediaViewImageFrame.origin.y;
  double width = self->_lastKnownMediaViewImageFrame.size.width;
  double height = self->_lastKnownMediaViewImageFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)lastKnownPreviewImageSize
{
  double width = self->_lastKnownPreviewImageSize.width;
  double height = self->_lastKnownPreviewImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setDisabledToolRevertAlert:(id)a3
{
}

- (UIAlertController)disabledToolRevertAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disabledToolRevertAlert);
  return (UIAlertController *)WeakRetained;
}

- (void)setIrisRevertConfirmationAlert:(id)a3
{
}

- (UIAlertController)irisRevertConfirmationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_irisRevertConfirmationAlert);
  return (UIAlertController *)WeakRetained;
}

- (void)setJpegPreviewForRawConfirmationAlert:(id)a3
{
}

- (UIAlertController)jpegPreviewForRawConfirmationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_jpegPreviewForRawConfirmationAlert);
  return (UIAlertController *)WeakRetained;
}

- (void)setRevertConfirmationAlert:(id)a3
{
}

- (UIAlertController)revertConfirmationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_revertConfirmationAlert);
  return (UIAlertController *)WeakRetained;
}

- (void)setCancelConfirmationAlert:(id)a3
{
}

- (UIAlertController)cancelConfirmationAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancelConfirmationAlert);
  return (UIAlertController *)WeakRetained;
}

- (void)setTogglingShowOriginal:(BOOL)a3
{
  self->_togglingShowOriginal = a3;
}

- (BOOL)togglingShowOriginal
{
  return self->_togglingShowOriginal;
}

- (BOOL)shouldBePreviewingOriginal
{
  return self->_shouldBePreviewingOriginal;
}

- (int64_t)previewRenderType
{
  return self->_previewRenderType;
}

- (void)setAssetChangeTimeoutTimer:(id)a3
{
}

- (NSTimer)assetChangeTimeoutTimer
{
  return self->_assetChangeTimeoutTimer;
}

- (void)setSaveCompletionDismissalState:(int64_t)a3
{
  self->_saveCompletionDismissalState = a3;
}

- (int64_t)saveCompletionDismissalState
{
  return self->_saveCompletionDismissalState;
}

- (void)setAssetChangeDismissalState:(int64_t)a3
{
  self->_assetChangeDismissalState = a3;
}

- (int64_t)assetChangeDismissalState
{
  return self->_assetChangeDismissalState;
}

- (void)setRevertingToOriginal:(BOOL)a3
{
  self->_revertingToOriginal = a3;
}

- (BOOL)isRevertingToOriginal
{
  return self->_revertingToOriginal;
}

- (void)setIsTransitioningFromDownloadingToRunningAutoCalculators:(BOOL)a3
{
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = a3;
}

- (BOOL)isTransitioningFromDownloadingToRunningAutoCalculators
{
  return self->_isTransitioningFromDownloadingToRunningAutoCalculators;
}

- (BOOL)isRunningAutoCalculators
{
  return self->_runningAutoCalculators;
}

- (BOOL)isCachingVideo
{
  return self->_isCachingVideo;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)originalStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2440);
  return self;
}

- (void)setPenultimateAvailable:(BOOL)a3
{
  self->_penultimateAvailable = a3;
}

- (BOOL)isPenultimateAvailable
{
  return self->_penultimateAvailable;
}

- (void)setOriginalImageExifOrientation:(int64_t)a3
{
  self->_originalImageExifOrientation = a3;
}

- (int64_t)originalImageExifOrientation
{
  return self->_originalImageExifOrientation;
}

- (void)setOriginalImageEditSource:(id)a3
{
}

- (PLEditSource)originalImageEditSource
{
  return self->_originalImageEditSource;
}

- (void)setHasLoadedRaw:(BOOL)a3
{
  self->_hasLoadedRaw = a3;
}

- (BOOL)hasLoadedRaw
{
  return self->_hasLoadedRaw;
}

- (void)setEditSourceContentEditingInput:(id)a3
{
}

- (PHContentEditingInput)editSourceContentEditingInput
{
  return self->_editSourceContentEditingInput;
}

- (NURenderContext)videoRenderContext
{
  return self->_videoRenderContext;
}

- (void)setWasPlayingBeforeBeginningToScrubVideo:(BOOL)a3
{
  self->_wasPlayingBeforeBeginningToScrubVideo = a3;
}

- (BOOL)wasPlayingBeforeBeginningToScrubVideo
{
  return self->_wasPlayingBeforeBeginningToScrubVideo;
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

- (void)setEditSource:(id)a3
{
}

- (PLEditSource)editSource
{
  return self->_editSource;
}

- (void)setPhotoEditIrisModel:(id)a3
{
}

- (PUPhotoEditIrisModel)photoEditIrisModel
{
  return self->_photoEditIrisModel;
}

- (void)setAdjustmentIdentifierAndVersion:(id)a3
{
}

- (NSString)adjustmentIdentifierAndVersion
{
  return self->_adjustmentIdentifierAndVersion;
}

- (void)setOriginalComposition:(id)a3
{
}

- (NUComposition)originalComposition
{
  return self->_originalComposition;
}

- (NUComposition)uneditedComposition
{
  return self->_uneditedComposition;
}

- (void)setExecutedSessionAction:(id)a3
{
}

- (PXAction)executedSessionAction
{
  return self->_executedSessionAction;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (void)setWorkImageVersion:(int64_t)a3
{
  self->_workImageVersion = a3;
}

- (int64_t)workImageVersion
{
  return self->_workImageVersion;
}

- (void)setResourceLoader:(id)a3
{
}

- (PEResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setLivePortraitBehaviorController:(id)a3
{
}

- (PELivePortraitBehaviorController)livePortraitBehaviorController
{
  return self->_livePortraitBehaviorController;
}

- (void)_setAggregateSession:(id)a3
{
}

- (PUPhotoEditAggregateSession)aggregateSession
{
  return self->_aggregateSession;
}

- (void)setRedEyeController:(id)a3
{
}

- (PURedeyeToolController)redEyeController
{
  return self->_redEyeController;
}

- (void)setMainRenderer:(id)a3
{
}

- (PLPhotoEditRenderer)mainRenderer
{
  return self->_mainRenderer;
}

- (void)setValuesCalculator:(id)a3
{
}

- (PEValuesCalculator)valuesCalculator
{
  return self->_valuesCalculator;
}

- (void)setInitialSeekTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_initialSeekTime.value = *(_OWORD *)&a3->var0;
  self->_initialSeekTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2416);
  return self;
}

- (PXImageLayerModulator)placeholderImageLayerModulator
{
  return self->_placeholderImageLayerModulator;
}

- (void)setLivePhotoViewModulator:(id)a3
{
}

- (PXLivePhotoViewModulator)livePhotoViewModulator
{
  return self->_livePhotoViewModulator;
}

- (void)setImageLayerModulator:(id)a3
{
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (void)setSessionDelegate:(id)a3
{
}

- (PUPhotoEditViewControllerSessionDelegate)sessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionDelegate);
  return (PUPhotoEditViewControllerSessionDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (PUPhotoEditViewControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (PUPhotoEditViewControllerPresentationDelegate *)WeakRetained;
}

- (void)setQuickCropContext:(id)a3
{
}

- (PUQuickCropContext)quickCropContext
{
  return self->_quickCropContext;
}

- (void)setInitialPendingEditsRequest:(id)a3
{
}

- (PUPhotoEditPendingEditsRequest)initialPendingEditsRequest
{
  return self->_initialPendingEditsRequest;
}

- (void)setInitialToolType:(int64_t)a3
{
  self->_initialToolType = a3;
}

- (int64_t)initialToolType
{
  return self->_initialToolType;
}

- (PEMediaDestination)mediaDestination
{
  return self->_mediaDestination;
}

- (PUEditableMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUEditableAsset)photo
{
  return self->_photo;
}

- (PUPhotoEditViewControllerSpec)photoEditSpec
{
  return self->_photoEditSpec;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (int64_t)layoutOrientation
{
  return self->_layoutOrientation;
}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  v12 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(void))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!v12)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10553, @"Invalid parameter not satisfying: %@", @"assetHandler" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
LABEL_12:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10554, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v7) {
    goto LABEL_12;
  }
LABEL_3:
  id v8 = [(PUPhotoEditViewController *)self photo];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v9 = v8;

    if (v9) {
      v12[2](v12, v9, 1);
    }
  }
  else
  {

    id v9 = 0;
  }
  v7[2](v7);
}

- (id)editAssetDiagnostics
{
  v4 = [(PUPhotoEditViewController *)self photo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PUPhotoEditViewController *)self photo];
    if (v5)
    {
      v6 = (void *)v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v14 = [MEMORY[0x1E4F28B00] currentHandler];
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        v17 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
        [v14 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10539, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photo", v16, v17 object file lineNumber description];
      }
      id v7 = objc_alloc(MEMORY[0x1E4F90150]);
      id v8 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
      id v9 = [(PUPhotoEditViewController *)self compositionController];
      v10 = [(PUPhotoEditViewController *)self originalComposition];
      v11 = (void *)[v7 initWithAsset:v6 contentEditingInput:v8 compositionController:v9 originalComposition:v10];

      v4 = v6;
    }
    else
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v13 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v13);
      [v8 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10539, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photo", v9 object file lineNumber description];
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v47 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self photo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(PUPhotoEditViewController *)self photo];
    if (!v6)
    {
      id v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      [v8 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10482, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photo", v42 object file lineNumber description];

LABEL_23:
      goto LABEL_24;
    }
    id v7 = (void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v46 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
      [v43 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10482, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photo", v45, v46 object file lineNumber description];
    }
    [(PUPhotoEditToolController *)self->_currentEditingTool willFileDiagnostic];
    id v8 = [(PUPhotoEditViewController *)self editAssetDiagnostics];
    [v8 collectDiagnosticsToTTRContainer:v47];
    currentEditingTool = self->_currentEditingTool;
    if (currentEditingTool) {
      [(PUPhotoEditToolController *)currentEditingTool addAttachmentsForTapToRadar:v47];
    }
    if (self->_diagnosticsFileURL)
    {
      objc_msgSend(v47, "addAttachment:");
      diagnosticsFileURL = self->_diagnosticsFileURL;
      self->_diagnosticsFileURL = 0;
    }
    uint64_t v11 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
    if (v11)
    {
      id v12 = (id)v11;
      uint64_t v13 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
      if (!v13)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v14 = (id)v13;
      uint64_t v15 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
      if (!v15)
      {
LABEL_16:

        goto LABEL_17;
      }
      v16 = (void *)v15;
      uint64_t v17 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
      if (!v17)
      {

        goto LABEL_16;
      }
      v18 = (void *)v17;
      v19 = [(PUPhotoEditViewController *)self autoCalcInterval];

      if (v19)
      {
        v20 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
        [v20 duration];
        uint64_t v22 = v21;

        id v12 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        id v14 = objc_alloc_init(MEMORY[0x1E4F28B68]);
        [v12 appendFormat:@"Entry Into Edit Timings"];
        [v12 appendFormat:@"\n\n"];
        objc_msgSend(v12, "appendFormat:", @"Total Time = %.4f\n", v22);
        v23 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoEditViewController isFirstSinceBoot](self, "isFirstSinceBoot"));
        [v12 appendFormat:@"First Since Boot   = %@\n", v23];

        v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoEditViewController isFirstSinceLaunch](self, "isFirstSinceLaunch"));
        [v12 appendFormat:@"First Since Launch = %@\n", v24];

        v25 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
        [v25 duration];
        objc_msgSend(v12, "appendFormat:", @"  Resource Loading Duration = %.4f\n", v26);

        v27 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
        [v27 duration];
        objc_msgSend(v12, "appendFormat:", @"    Checking Duration       = %.4f\n", v28);

        v29 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
        [v29 duration];
        objc_msgSend(v12, "appendFormat:", @"    Download Duration       = %.4f\n", v30);

        v31 = [(PUPhotoEditViewController *)self modelPrepInterval];
        [v31 duration];
        objc_msgSend(v12, "appendFormat:", @"    Model Prep Duration       = %.4f\n", v32);

        v33 = [(PUPhotoEditViewController *)self autoCalcInterval];
        [v33 duration];
        objc_msgSend(v12, "appendFormat:", @"  Auto Calc Duration = %.4f\n", v34);

        [v12 appendFormat:@"\n"];
        v35 = [(PUPhotoEditViewController *)self photo];
        v36 = objc_msgSend(v14, "stringFromByteCount:", objc_msgSend(v35, "originalFilesize"));
        [v12 appendFormat:@"Asset File Size: %@", v36];

        [v12 appendFormat:@"\n\n"];
        [v47 addAttachmentWithText:v12 name:@"Entry Into Edit Timings"];
        goto LABEL_16;
      }
    }
LABEL_18:
    v37 = [(PUPhotoEditViewController *)self compositionController];
    v38 = [v37 inpaintAdjustmentController];
    if (v38)
    {
      v39 = self->_currentEditingTool;
      cleanupController = self->_cleanupController;

      if (v39 != (PUPhotoEditToolController *)cleanupController) {
        [(PUCleanupToolController *)self->_cleanupController addAttachmentsForTapToRadar:v47];
      }
    }
    else
    {
    }
    uint64_t v5 = v7;
    goto LABEL_23;
  }
LABEL_24:
}

- (void)diagnosticsAlertDismissed
{
}

- (void)presentDiagnosticAlert:(id)a3
{
  id v5 = a3;
  if (self->_progressIndicatorInteractionDisablingToken)
  {
    +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:");
    id progressIndicatorInteractionDisablingToken = self->_progressIndicatorInteractionDisablingToken;
    self->_id progressIndicatorInteractionDisablingToken = 0;
  }
  [(PUPhotoEditViewController *)self presentViewController:v5 animated:0 completion:0];
}

- (void)fileRadarAndAttachFile:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsFileURL, a3);
  [(PUPhotoEditViewController *)self _fileRadar];
}

- (void)_fileRadar
{
  id v3 = (id)objc_opt_new();
  [v3 addDiagnosticProvider:self];
  [v3 setComponent:35];
  [v3 setAttachmentsIncludeAnyUserAsset:1];
  [v3 setTitle:@"[iOS][TTR] "];
  [v3 setKeywordIDs:&unk_1F078B330];
  PXFileRadarWithConfiguration();
}

- (void)updateAnalyticsEventBuilderActionType:(id)a3 forAssets:(id)a4
{
}

- (void)_sendPasteEditsAnalytics
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pasteEditsEventBuilder = self->_pasteEditsEventBuilder;
  if (pasteEditsEventBuilder)
  {
    v4 = [(PEEditActionEventBuilder *)pasteEditsEventBuilder buildEvents];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      uint64_t v8 = *MEMORY[0x1E4F911E0];
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          [MEMORY[0x1E4F56658] sendEvent:v8 withPayload:*(void *)(*((void *)&v11 + 1) + 8 * v9++)];
        }
        while (v6 != v9);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    v10 = self->_pasteEditsEventBuilder;
  }
  else
  {
    v10 = 0;
  }
  self->_pasteEditsEventBuilder = 0;
}

- (void)_pasteEdits
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  uint64_t v5 = [v4 presetFromPasteboard];
  [v5 setAnalyticsEventBuilderDelegate:self];
  id v6 = objc_alloc(MEMORY[0x1E4F91138]);
  uint64_t v7 = [(PUPhotoEditViewController *)self photo];
  v32[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  uint64_t v9 = (PEEditActionEventBuilder *)[v6 initWithBaseAction:v5 assets:v8];
  pasteEditsEventBuilder = self->_pasteEditsEventBuilder;
  self->_pasteEditsEventBuilder = v9;

  if (v5)
  {
    long long v11 = [(PUPhotoEditViewController *)self photo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v12 = [(PUPhotoEditViewController *)self photo];
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
          v23 = (objc_class *)objc_opt_class();
          v24 = NSStringFromClass(v23);
          v25 = objc_msgSend(v12, "px_descriptionForAssertionMessage");
          [v22 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10396, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photo", v24, v25 object file lineNumber description];
        }
        long long v13 = [v12 photoLibrary];
        int v14 = [v5 isEligibleForSmartPasteWithPhotoLibrary:v13];

        if (v14)
        {
          smartCopyPasteQueue = self->_smartCopyPasteQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke;
          block[3] = &unk_1E5F2ECC8;
          id v30 = v5;
          v31 = self;
          dispatch_async(smartCopyPasteQueue, block);

LABEL_11:
          goto LABEL_12;
        }
LABEL_10:
        [(PUPhotoEditViewController *)self _willModifyAdjustment];
        objc_initWeak(&location, self);
        v19 = [(PUPhotoEditViewController *)self compositionController];
        v20 = [(PUPhotoEditViewController *)self photo];
        uint64_t v21 = [(PUPhotoEditViewController *)self editSource];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_4;
        v26[3] = &unk_1E5F2E668;
        objc_copyWeak(&v27, &location);
        v26[4] = self;
        [v5 applyToCompositionController:v19 asset:v20 editSource:v21 completion:v26];

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
      uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      [v16 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 10396, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photo", v18 object file lineNumber description];
    }
    long long v12 = 0;
    goto LABEL_10;
  }
LABEL_12:
}

void __40__PUPhotoEditViewController__pasteEdits__block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F911B0]) initWithPasteablePreset:*(void *)(a1 + 32)];
  id v3 = *(void **)(a1 + 40);
  v4 = (void *)v3[219];
  uint64_t v5 = [v3 photo];
  v18[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 registerAction:v2 forAssets:v6];

  uint64_t v7 = [*(id *)(a1 + 40) compositionController];
  uint64_t v8 = (void *)[v7 copy];

  [*(id *)(a1 + 40) _willModifyAdjustment];
  objc_initWeak(&location, *(id *)(a1 + 40));
  uint64_t v9 = [*(id *)(a1 + 40) photo];
  v10 = [*(id *)(a1 + 40) editSource];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_2;
  v13[3] = &unk_1E5F29840;
  objc_copyWeak(&v16, &location);
  id v11 = v8;
  uint64_t v12 = *(void *)(a1 + 40);
  id v14 = v11;
  uint64_t v15 = v12;
  [v2 applyToCompositionController:v11 asset:v9 editSource:v10 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

uint64_t __40__PUPhotoEditViewController__pasteEdits__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
  {
    uint64_t v3 = result;
    id WeakRetained = objc_loadWeakRetained((id *)(result + 40));
    uint64_t v5 = PULocalizedString(@"PHOTOEDIT_PASTE_ADJUST");
    [WeakRetained _didModifyAdjustmentWithLocalizedName:v5];

    id v6 = *(void **)(v3 + 32);
    return [v6 _sendPasteEditsAnalytics];
  }
  return result;
}

void __40__PUPhotoEditViewController__pasteEdits__block_invoke_2(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__PUPhotoEditViewController__pasteEdits__block_invoke_3;
  v5[3] = &unk_1E5F2AEB0;
  v8[1] = a2;
  objc_copyWeak(v8, (id *)(a1 + 48));
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(v8);
}

uint64_t __40__PUPhotoEditViewController__pasteEdits__block_invoke_3(uint64_t result)
{
  if (*(void *)(result + 56) == 1)
  {
    uint64_t v1 = result;
    uint64_t v2 = (id *)(result + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    uint64_t v4 = [WeakRetained compositionController];
    [v4 applyChangesFromCompositionController:*(void *)(v1 + 32)];

    id v5 = objc_loadWeakRetained(v2);
    id v6 = PULocalizedString(@"PHOTOEDIT_PASTE_ADJUST");
    [v5 _didModifyAdjustmentWithLocalizedName:v6];

    uint64_t v7 = *(void **)(v1 + 40);
    return [v7 _sendPasteEditsAnalytics];
  }
  return result;
}

- (BOOL)_canPasteEdits
{
  BOOL v3 = [(PUPhotoEditViewController *)self _enableSpatialMediaEditing];
  uint64_t v4 = [MEMORY[0x1E4F910D8] sharedPresetManager];
  int v5 = [v4 hasPresetOnPasteboard];
  if (v5 && !v3) {
    int v5 = ![(PUPhotoEditViewController *)self isSpatialMedia];
  }

  return v5;
}

- (void)_copyEditsSkippingOptions:(BOOL)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(PUPhotoEditViewController *)self compositionController];
  id v6 = (void *)[v5 copy];

  if (a3
    || ([(PUPhotoEditViewController *)self photo],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = +[PUPhotoEditCopyEditsViewController shouldPresentForCopyingFromCompositionController:v6 asset:v7], v7, !v8))
  {
    [v6 removeAdjustmentWithKey:*MEMORY[0x1E4F8A418]];
    [v6 removeAdjustmentWithKey:*MEMORY[0x1E4F8A4A8]];
    id v11 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    uint64_t v17 = [(PUPhotoEditViewController *)self photo];
    [(PUPhotoEditCopyEditsViewController *)v11 copyPresetFromCompositionController:v6 sourceAsset:v17 smartCopyEnabled:1];
  }
  else
  {
    uint64_t v9 = [PUPhotoEditCopyEditsViewController alloc];
    v10 = [(PUPhotoEditViewController *)self photo];
    id v11 = [(PUPhotoEditCopyEditsViewController *)v9 initWithCompositionController:v6 asset:v10];

    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v11];
    [v12 setModalPresentationStyle:7];
    long long v13 = [v12 popoverPresentationController];
    [v13 setSourceItem:self->_moreButton];
    id v14 = [v13 adaptiveSheetPresentationController];
    uint64_t v15 = [MEMORY[0x1E4FB1C30] mediumDetent];
    v18[0] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [v14 setDetents:v16];

    [(PUPhotoEditViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

- (BOOL)_canCopyEdits
{
  BOOL v3 = [(PUPhotoEditViewController *)self _enableSpatialMediaEditing];
  uint64_t v4 = [(PUPhotoEditViewController *)self compositionController];
  int v5 = (void *)[v4 copy];

  id v6 = +[PUPhotoEditProtoSettings sharedInstance];
  char v7 = [v6 enableSelectiveCopyEdits];

  if ((v7 & 1) == 0)
  {
    [v5 removeAdjustmentWithKey:*MEMORY[0x1E4F8A418]];
    [v5 removeAdjustmentWithKey:*MEMORY[0x1E4F8A4A8]];
  }
  int v8 = [MEMORY[0x1E4F91160] hasValidAdjustmentsInCompositionController:v5];
  if (((v8 ^ 1 | v3) & 1) == 0) {
    int v8 = ![(PUPhotoEditViewController *)self isSpatialMedia];
  }

  return v8;
}

- (PUEditActionActivity)radarAction
{
  radarAction = self->_radarAction;
  if (!radarAction)
  {
    uint64_t v4 = [[PUEditActionActivity alloc] initWithActionName:@"File a Radar" activityType:@"fileRadar" systemImageName:@"ant.circle"];
    int v5 = self->_radarAction;
    self->_radarAction = v4;

    [(PUEditActionActivity *)self->_radarAction setCanPerformActivityActionHandler:&__block_literal_global_1095];
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__PUPhotoEditViewController_radarAction__block_invoke_2;
    v7[3] = &unk_1E5F297F8;
    objc_copyWeak(&v8, &location);
    [(PUEditActionActivity *)self->_radarAction setPerformActivityActionHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    radarAction = self->_radarAction;
  }
  return radarAction;
}

void __40__PUPhotoEditViewController_radarAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fileRadar];
}

uint64_t __40__PUPhotoEditViewController_radarAction__block_invoke()
{
  return 1;
}

- (PUEditActionActivity)pastePresetAction
{
  pastePresetAction = self->_pastePresetAction;
  if (!pastePresetAction)
  {
    uint64_t v4 = [PUEditActionActivity alloc];
    int v5 = PULocalizedString(@"PHOTOEDIT_PASTE_ADJUST");
    id v6 = [(PUEditActionActivity *)v4 initWithActionName:v5 activityType:@"pastePreset" systemImageName:@"slider.horizontal.2.square.badge.arrow.down"];
    char v7 = self->_pastePresetAction;
    self->_pastePresetAction = v6;

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__PUPhotoEditViewController_pastePresetAction__block_invoke;
    v11[3] = &unk_1E5F297D0;
    objc_copyWeak(&v12, &location);
    [(PUEditActionActivity *)self->_pastePresetAction setCanPerformActivityActionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__PUPhotoEditViewController_pastePresetAction__block_invoke_2;
    v9[3] = &unk_1E5F297F8;
    objc_copyWeak(&v10, &location);
    [(PUEditActionActivity *)self->_pastePresetAction setPerformActivityActionHandler:v9];
    [(PUEditActionActivity *)self->_pastePresetAction setDisablesInsteadOfHides:1];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    pastePresetAction = self->_pastePresetAction;
  }
  return pastePresetAction;
}

uint64_t __46__PUPhotoEditViewController_pastePresetAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _canPasteEdits];

  return v2;
}

void __46__PUPhotoEditViewController_pastePresetAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pasteEdits];
}

- (PUEditActionActivity)copyPresetAction
{
  copyPresetAction = self->_copyPresetAction;
  if (!copyPresetAction)
  {
    uint64_t v4 = [PUEditActionActivity alloc];
    int v5 = PULocalizedString(@"PHOTOEDIT_COPY_ADJUST");
    id v6 = [(PUEditActionActivity *)v4 initWithActionName:v5 activityType:@"copyPreset" systemImageName:@"slider.horizontal.2.square.on.square"];
    char v7 = self->_copyPresetAction;
    self->_copyPresetAction = v6;

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__PUPhotoEditViewController_copyPresetAction__block_invoke;
    v11[3] = &unk_1E5F297D0;
    objc_copyWeak(&v12, &location);
    [(PUEditActionActivity *)self->_copyPresetAction setCanPerformActivityActionHandler:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__PUPhotoEditViewController_copyPresetAction__block_invoke_2;
    v9[3] = &unk_1E5F297F8;
    objc_copyWeak(&v10, &location);
    [(PUEditActionActivity *)self->_copyPresetAction setPerformActivityActionHandler:v9];
    [(PUEditActionActivity *)self->_copyPresetAction setDisablesInsteadOfHides:1];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    copyPresetAction = self->_copyPresetAction;
  }
  return copyPresetAction;
}

uint64_t __45__PUPhotoEditViewController_copyPresetAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _canCopyEdits];

  return v2;
}

void __45__PUPhotoEditViewController_copyPresetAction__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _copyEditsSkippingOptions:0];
}

- (id)adjustmentConstants
{
  return (id)[MEMORY[0x1E4F8A748] adjustmentConstants];
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F901C0] cleanUpTipID];
  int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    v15[0] = self->_mainToolbar;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v6 setPassthroughViews:v10];
LABEL_5:

    goto LABEL_6;
  }
  id v11 = [MEMORY[0x1E4F901C0] stylesSetupTipID];
  int v12 = [v7 isEqualToString:v11];

  if (v12)
  {
    [v6 setPermittedArrowDirections:0];
    [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar frame];
    double MaxY = CGRectGetMaxY(v16);
    id v10 = [(PUPhotoEditViewController *)self view];
    [v10 safeAreaInsets];
    objc_msgSend(v6, "setPopoverLayoutMargins:", MaxY - v14, 0.0, 0.0, 0.0);
    goto LABEL_5;
  }
LABEL_6:
}

- (id)sourceItemForTipID:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F901C0] cleanUpTipID];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = PXFind();
LABEL_5:
    id v10 = (void *)v7;
    goto LABEL_7;
  }
  id v8 = [MEMORY[0x1E4F901C0] stylesSetupTipID];
  int v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    uint64_t v7 = [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar centerView];
    goto LABEL_5;
  }
  id v10 = 0;
LABEL_7:

  return v10;
}

BOOL __48__PUPhotoEditViewController_sourceItemForTipID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 tag];
  return v3 == [*(id *)(*(void *)(a1 + 32) + 1584) toolControllerTag];
}

- (void)updateMainButtonForSaveAsNewClipMenu
{
  if (![(PUPhotoEditViewController *)self isStandardVideo]
    || ([(PUPhotoEditViewController *)self photo],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) == 0))
  {
LABEL_8:
    mainActionButton = self->_mainActionButton;
    [(PUPhotoEditNotchButton *)mainActionButton setMenu:0];
    return;
  }
  int v5 = [(PUPhotoEditViewController *)self compositionController];
  int v6 = [v5 trimAdjustmentController];

  uint64_t v7 = [(PUPhotoEditViewController *)self uneditedComposition];
  if (v7)
  {
    id v8 = (void *)v7;
    int v9 = [(PUPhotoEditViewController *)self uneditedComposition];
    id v10 = [v9 objectForKeyedSubscript:@"trim"];

    if (!v6 || v10 && ([v6 isEqual:v10 visualChangesOnly:1] & 1) != 0) {
      goto LABEL_7;
    }
  }
  else
  {
    id v10 = 0;
    if (!v6)
    {
LABEL_7:

      goto LABEL_8;
    }
  }

  int v12 = [(PUPhotoEditViewController *)self askToSaveAsNewClipMenu];
  [(PUPhotoEditNotchButton *)self->_mainActionButton setMenu:v12];

  long long v13 = self->_mainActionButton;
  [(PUPhotoEditNotchButton *)v13 setShowsMenuAsPrimaryAction:1];
}

- (UIMenu)askToSaveAsNewClipMenu
{
  v22[2] = *MEMORY[0x1E4F143B8];
  askToSaveAsNewClipMenu = self->_askToSaveAsNewClipMenu;
  if (!askToSaveAsNewClipMenu)
  {
    objc_initWeak(&location, self);
    uint64_t v15 = (void *)MEMORY[0x1E4FB1970];
    id v4 = (void *)MEMORY[0x1E4FB13F0];
    CGRect v16 = PULocalizedString(@"EDITED_TRIM_SAVE_VIDEO");
    int v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"video.badge.checkmark"];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke;
    v19[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v20, &location);
    int v6 = [v4 actionWithTitle:v16 image:v5 identifier:0 handler:v19];
    v22[0] = v6;
    uint64_t v7 = (void *)MEMORY[0x1E4FB13F0];
    id v8 = PULocalizedString(@"EDITED_TRIM_SAVE_AS_NEW_CLIP");
    int v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"video.badge.plus"];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke_2;
    v17[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v18, &location);
    id v10 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:v17];
    v22[1] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    int v12 = [v15 menuWithTitle:&stru_1F06BE7B8 children:v11];
    long long v13 = self->_askToSaveAsNewClipMenu;
    self->_askToSaveAsNewClipMenu = v12;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    askToSaveAsNewClipMenu = self->_askToSaveAsNewClipMenu;
  }
  return askToSaveAsNewClipMenu;
}

void __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSaveAction:0];
}

void __51__PUPhotoEditViewController_askToSaveAsNewClipMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSaveAction:2];
}

- (void)trimToolPlayerWrapper:(id)a3 requestAssetWithFilters:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([(PUPhotoEditViewController *)self isStandardVideo])
  {
    int v9 = [(NUMediaView *)self->_mediaView composition];
    if (v9)
    {
      id v10 = [(PUPhotoEditMediaToolController *)self->_mediaToolController trimController];
      [v10 scrubberHeight];
      double v12 = v11;

      long long v13 = [(PUPhotoEditViewController *)self view];
      double v14 = [v13 traitCollection];
      [v14 displayScale];
      double v16 = v12 * v15;

      double v17 = 41.0;
      if (v16 >= 41.0) {
        double v17 = v16;
      }
      unint64_t v18 = vcvtpd_s64_f64(v17);
      if ((v18 & 0x8000000000000000) != 0)
      {
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        v25 = objc_msgSend(NSString, "stringWithUTF8String:", "NUPixelSize NUPixelSizeMake(NSInteger, NSInteger)");
        [v24 handleFailureInFunction:v25, @"NUGeometryPrimitives.h", 38, @"Invalid parameter not satisfying: %@", @"(width >= 0) && (height >= 0)" file lineNumber description];
      }
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A458]), "initWithTargetPixelSize:", v18, v18);
      videoRenderContext = self->_videoRenderContext;
      if (!videoRenderContext)
      {
        uint64_t v21 = (NURenderContext *)[objc_alloc(MEMORY[0x1E4F7A600]) initWithPurpose:2];
        uint64_t v22 = self->_videoRenderContext;
        self->_videoRenderContext = v21;

        videoRenderContext = self->_videoRenderContext;
      }
      [(NURenderContext *)videoRenderContext cancelAllRequests];
      v23 = (void *)[objc_alloc(MEMORY[0x1E4F7A708]) initWithComposition:v9];
      [v23 setRenderContext:self->_videoRenderContext];
      [v23 setSampleMode:2];
      [v23 setName:@"PUPhotoEditViewController-trimToolClient"];
      [v23 setPipelineFilters:v7];
      [v23 setScalePolicy:v19];
      [v23 setResponseQueue:MEMORY[0x1E4F14428]];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_2;
      v28[3] = &unk_1E5F29308;
      id v29 = v8;
      [v23 submit:v28];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke;
      block[3] = &unk_1E5F2EBA0;
      id v31 = v8;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v19 = v31;
    }
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_1070;
    v26[3] = &unk_1E5F29780;
    id v27 = v8;
    [(PUPhotoEditViewController *)self _requestLivePhotoAssetWithFilters:v7 completion:v26];
    int v9 = v27;
  }
}

uint64_t __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v8 = 0;
  uint64_t v3 = [a2 result:&v8];
  id v4 = v8;
  if (v3)
  {
    int v5 = [v3 video];
    int v6 = [v3 videoComposition];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
    }
    id v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "Failed to load video: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __86__PUPhotoEditViewController_trimToolPlayerWrapper_requestAssetWithFilters_completion___block_invoke_1070(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v5 = [v3 videoAsset];
  id v4 = [v3 videoComposition];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)editValuesCalculatorDidFinishComputingGeometricValues:(id)a3
{
}

- (void)editValuesCalculatorHasChangedGeometricValues:(id)a3
{
}

- (void)editValuesCalculatorHasChangedFlashStatus:(id)a3
{
  [(PUPhotoEditToolController *)self->_currentEditingTool editValuesCalculatorHasChangedFlashStatus:a3];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
}

- (void)editValuesCalculatorHasChangedImageValues:(id)a3
{
  [(PUPhotoEditToolController *)self->_currentEditingTool editValuesCalculatorHasChangedImageValues:a3];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
}

- (int64_t)positionForBar:(id)a3
{
  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)unadjustedStillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 2440);
  return self;
}

- (void)setLivePhotoVideoEnabled:(BOOL)a3
{
  if ([(PUPhotoEditViewController *)self isLivePhotoVideoEnabled] != a3)
  {
    [(PUPhotoEditViewController *)self toggleLivePhotoActive];
  }
}

- (BOOL)isLivePhotoVideoEnabled
{
  id v3 = [(PUPhotoEditViewController *)self photoEditIrisModel];

  if (!v3) {
    return 0;
  }
  id v4 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  char v5 = [v4 isVideoEnabled];

  return v5;
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(PUPhotoEditViewController *)self adjustmentConstants];
  int v6 = v5;
  if (self->_leavingEdit) {
    goto LABEL_66;
  }
  id v7 = [v5 PILivePhotoKeyFrameAdjustmentKey];
  int v8 = [v4 containsObject:v7];

  if (v8)
  {
    if ([(PUPhotoEditViewController *)self gainMapImage])
    {
      int v9 = [(PUPhotoEditViewController *)self compositionController];
      id v10 = [v9 composition];
      uint64_t v11 = [v10 objectForKeyedSubscript:@"livePhotoKeyFrame"];

      if (v11) {
        [(PUPhotoEditViewController *)self setGainMapImage:0];
      }
    }
    double v12 = [(PUPhotoEditViewController *)self valuesCalculator];
    [v12 invalidate];

    long long v13 = [(PUPhotoEditViewController *)self compositionController];
    double v14 = [(PUPhotoEditViewController *)self compositionController];
    double v15 = [v14 smartToneAdjustmentControllerCreatingIfNecessary:0];

    if (v15)
    {
      double v16 = [v6 PISmartToneAdjustmentKey];
      [v13 modifyAdjustmentWithKey:v16 modificationBlock:&__block_literal_global_1057];
    }
    double v17 = [(PUPhotoEditViewController *)self valuesCalculator];
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_2;
    v70[3] = &unk_1E5F2BAD8;
    BOOL v74 = v15 != 0;
    id v71 = v13;
    id v72 = v6;
    id v73 = v17;
    id v18 = v17;
    id v19 = v13;
    [v18 precomputeImageValuesWithCompletion:v70];
  }
  id v20 = [v6 PICropAdjustmentKey];
  if ([v4 containsObject:v20])
  {
  }
  else
  {
    uint64_t v21 = [v6 PIOrientationAdjustmentKey];
    int v22 = [v4 containsObject:v21];

    if (!v22) {
      goto LABEL_15;
    }
  }
  if (self->_currentEditingTool != &self->_cropController->super
    && [(PUPhotoEditViewController *)self currentAssetNeedsGainMap])
  {
    [(PUPhotoEditViewController *)self _updateGainMap];
  }
LABEL_15:
  v23 = [v6 PIPortraitAdjustmentKey];
  if ([v4 containsObject:v23])
  {
    BOOL v24 = [(PUPhotoEditViewController *)self currentAssetNeedsGainMap];

    if (!v24) {
      goto LABEL_22;
    }
LABEL_20:
    [(PUPhotoEditViewController *)self _updateGainMap];
    goto LABEL_22;
  }
  v25 = [v6 PIDepthAdjustmentKey];
  if (([v4 containsObject:v25] & 1) == 0)
  {

    goto LABEL_22;
  }
  BOOL v26 = [(PUPhotoEditViewController *)self currentAssetNeedsGainMap];

  if (v26) {
    goto LABEL_20;
  }
LABEL_22:
  if ([(PUPhotoEditToolController *)self->_currentEditingTool suppressesEditUpdates]) {
    goto LABEL_45;
  }
  id v27 = [(PUPhotoEditViewController *)self editSource];

  if (!v27) {
    goto LABEL_45;
  }
  uint64_t v28 = [v6 PIAutoLoopAdjustmentKey];
  int v29 = [v4 containsObject:v28];

  if (v29)
  {
    id v30 = [(PUPhotoEditViewController *)self compositionController];
    id v31 = [v30 autoLoopAdjustmentController];

    if ([v31 enabled]) {
      uint64_t v32 = 2;
    }
    else {
      uint64_t v32 = 1;
    }
    v33 = [(NUMediaView *)self->_mediaView _renderer];
    [v33 setDisplayType:v32];
  }
  uint64_t v34 = (void *)MEMORY[0x1E4F8A748];
  v35 = [(PUPhotoEditViewController *)self compositionController];
  v36 = [(PUPhotoEditViewController *)self editSource];
  v37 = objc_msgSend(v34, "validatedCompositionCopyFor:mediaType:", v35, objc_msgSend(v36, "mediaType"));

  v38 = [v6 PICropAdjustmentKey];
  if ([v4 containsObject:v38])
  {

LABEL_32:
    v41 = (void *)[objc_alloc(MEMORY[0x1E4F7A498]) initWithComposition:v37];
    [v41 setName:@"PUPhotoEditViewController-compositionControllerDidChangeForAdjustments-GeometryChangesRequest"];
    id v69 = 0;
    v42 = [v41 submitSynchronous:&v69];
    id v43 = v69;
    v44 = [v42 geometry];

    if (v44)
    {
      [(PUPhotoEditViewController *)self setMediaViewEdgeInsetsUpdateDisableCount:[(PUPhotoEditViewController *)self mediaViewEdgeInsetsUpdateDisableCount]+ 1];
      v45 = [(PUPhotoEditViewController *)self mediaView];
      v46 = [v45 _renderView];
      [v46 setGeometry:v44];

      if (!self->_switchingToolsAnimated)
      {
        [(PUPhotoEditViewController *)self _mediaViewEdgeInsetsWithGeometry:v44];
        -[NUMediaView setEdgeInsets:](self->_mediaView, "setEdgeInsets:");
      }
      [(NUMediaView *)self->_mediaView setComposition:v37];
      [(NUMediaView *)self->_mediaView waitForRender];
      [(PUPhotoEditViewController *)self setMediaViewEdgeInsetsUpdateDisableCount:[(PUPhotoEditViewController *)self mediaViewEdgeInsetsUpdateDisableCount]- 1];
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
      }
      id v47 = (void *)*MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        v63 = v47;
        v64 = [v41 name];
        *(_DWORD *)buf = 138412546;
        v77 = v64;
        __int16 v78 = 2112;
        id v79 = v43;
        _os_log_error_impl(&dword_1AE9F8000, v63, OS_LOG_TYPE_ERROR, "Could not load geometry for request %@: %@", buf, 0x16u);
      }
      [(NUMediaView *)self->_mediaView setComposition:v37];
    }

    goto LABEL_44;
  }
  v39 = [v6 PIOrientationAdjustmentKey];
  int v40 = [v4 containsObject:v39];

  if (v40) {
    goto LABEL_32;
  }
  [(NUMediaView *)self->_mediaView setComposition:v37];
LABEL_44:
  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];

LABEL_45:
  [(PUPhotoEditViewController *)self setShouldBePreviewingOriginal:0];
  if (![(PUPhotoEditToolController *)self->_currentEditingTool isActivelyAdjusting])
  {
    [(PUPhotoEditViewController *)self _updateModelDependentControlsAnimated:0];
    [(PUPhotoEditViewController *)self _updateValuesCalculator];
  }
  v48 = [v6 PIAutoLoopAdjustmentKey];
  int v49 = [v4 containsObject:v48];

  if (v49) {
    [(PUPhotoEditViewController *)self _updateMediaViewPlaybackStyle];
  }
  v50 = [v6 PIMuteAdjustmentKey];
  int v51 = [v4 containsObject:v50];

  if (v51) {
    [(PUPhotoEditViewController *)self _updateMutedState];
  }
  if ([v4 count] == 1)
  {
    v52 = [v4 firstObject];
  }
  else
  {
    v52 = 0;
  }
  int v53 = [v52 isEqualToString:*MEMORY[0x1E4F8A498]];
  int v54 = [v52 isEqualToString:*MEMORY[0x1E4F8A408]];
  if ([(PUPhotoEditViewController *)self isStandardVideo] && !v53 && !v54)
  {
    v55 = [(PUPhotoEditViewController *)self mediaView];
    v56 = [v55 player];
    [v56 pause];
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  v57 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v58 = [v57 countByEnumeratingWithState:&v65 objects:v75 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v66 != v60) {
          objc_enumerationMutation(v57);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * i) compositionControllerDidChangeForAdjustments:v4];
      }
      uint64_t v59 = [v57 countByEnumeratingWithState:&v65 objects:v75 count:16];
    }
    while (v59);
  }

  v62 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  [v62 compositionDidChange];

  [(PUPhotoEditViewController *)self updateMainButtonForSaveAsNewClipMenu];
LABEL_66:
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_3;
    block[3] = &unk_1E5F2E908;
    id v3 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    id v5 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) PISmartToneAdjustmentKey];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_4;
  v4[3] = &unk_1E5F28F00;
  id v5 = *(id *)(a1 + 48);
  [v2 modifyAdjustmentWithKey:v3 modificationBlock:v4];
}

uint64_t __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAdjustmentSmartToneStatistics:a2 withAccuracy:0];
}

void __74__PUPhotoEditViewController_compositionControllerDidChangeForAdjustments___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 statistics];
  id v4 = (id)[v3 mutableCopy];

  [v4 removeObjectForKey:@"lightMap"];
  [v2 setStatistics:v4];
}

- (void)compositionController:(id)a3 didUpdateAdjustments:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PUPhotoEditViewController *)self compositionController];

  if (v7 == v6)
  {
    int v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
    [(PUPhotoEditViewController *)self compositionControllerDidChangeForAdjustments:v8];
  }
}

- (void)compositionController:(id)a3 didUpdateAdjustment:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PUPhotoEditViewController *)self compositionController];

  if (v7 == v6)
  {
    int v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(PUPhotoEditViewController *)self compositionControllerDidChangeForAdjustments:v8];
  }
}

- (void)compositionController:(id)a3 didRemoveAdjustment:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PUPhotoEditViewController *)self compositionController];

  if (v7 == v6)
  {
    int v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(PUPhotoEditViewController *)self compositionControllerDidChangeForAdjustments:v8];
  }
}

- (void)compositionController:(id)a3 didAddAdjustment:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(PUPhotoEditViewController *)self compositionController];

  if (v7 == v6)
  {
    int v8 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
    [(PUPhotoEditViewController *)self compositionControllerDidChangeForAdjustments:v8];
  }
}

- (void)photoEditToolbar:(id)a3 showAccessibilityHUDForItem:(id)a4
{
}

- (id)photoEditToolbar:(id)a3 accessibilityHUDItemForButton:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) accessibilityHUDItemForButton:v5];
        if (v11)
        {
          double v16 = (void *)v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v12 = [v5 titleLabel];
  id v6 = [v12 text];

  long long v13 = [v5 imageView];
  double v14 = [v13 image];

  id v15 = objc_alloc(MEMORY[0x1E4FB13E0]);
  double v16 = objc_msgSend(v15, "initWithTitle:image:imageInsets:scaleImage:", v6, v14, 1, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));

LABEL_11:
  return v16;
}

- (id)ppt_renderStatisticsDictionaryForTimeInterval:(double)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [(_PPTState *)self->_pptState renderStatistics];
  unint64_t v5 = [v4 count];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        double v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        objc_msgSend(v14, "duration", (void)v27);
        double v11 = v11 + v15;
        [v14 prepareDuration];
        double v12 = v12 + v16;
        [v14 completeDuration];
        double v10 = v10 + v17;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
  }
  double v18 = (double)v5;

  v31[0] = @"neutrinoFPS";
  long long v19 = [NSNumber numberWithDouble:(double)v5 / a3];
  v32[0] = v19;
  v32[1] = @"fps";
  v31[1] = @"neutrinoFPSUnits";
  v31[2] = @"neutrinoAveragePrepareDuration";
  long long v20 = [NSNumber numberWithDouble:v12 / v18];
  void v32[2] = v20;
  v32[3] = @"sec";
  v31[3] = @"neutrinoAveragePrepareDurationUnits";
  v31[4] = @"neutrinoAverageRenderDuration";
  long long v21 = [NSNumber numberWithDouble:v11 / v18];
  v32[4] = v21;
  v32[5] = @"sec";
  v31[5] = @"neutrinoAverageRenderDurationUnits";
  v31[6] = @"neutrinoAverageCompleteDuration";
  int v22 = [NSNumber numberWithDouble:v10 / v18];
  v32[6] = v22;
  v32[7] = @"sec";
  v31[7] = @"neutrinoAverageCompleteDurationUnits";
  v31[8] = @"neutrinoNumRenders";
  uint64_t v23 = [NSNumber numberWithDouble:v18];
  v32[8] = v23;
  v32[9] = @"renders";
  v31[9] = @"neutrinoNumRendersUnits";
  v31[10] = @"neutrinoRenderTimeInterval";
  BOOL v24 = [NSNumber numberWithDouble:a3];
  v31[11] = @"neutrinoRenderTimeIntervalUnits";
  v32[10] = v24;
  v32[11] = @"sec";
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];

  return v25;
}

- (void)ppt_playLivePhotoWithWillBeginPlaybackBlock:(id)a3 didEndPlaybackBlock:(id)a4
{
  id v6 = a4;
  [(PUPhotoEditViewController *)self setPpt_willBeginPlaybackBlock:a3];
  [(PUPhotoEditViewController *)self setPpt_didEndPlaybackBlock:v6];

  id v7 = [(PUPhotoEditViewController *)self mainLivePhotoView];
  [v7 startPlaybackWithStyle:1];
}

- (void)ppt_replayCleanupBrushStrokeWithCompletionBlock:(id)a3
{
  cleanupController = self->_cleanupController;
  if (cleanupController) {
    [(PUCleanupToolController *)cleanupController ppt_replayCleanupBrushStrokeWithCompletionBlock:a3];
  }
}

- (void)ppt_selectStyle:(id)a3 completionBlock:(id)a4
{
  id v7 = a4;
  [(PUPhotoStyleToolController *)self->_photoStylesToolController ppt_selectWithStyle:a3];
  id v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    id v6 = v7;
  }
}

- (void)ppt_selectNextLightingEffect:(id)a3
{
  id v7 = (void (**)(void))a3;
  id v4 = [(PUPhotoEditPortraitToolController *)self->_portraitToolController lightingControl];
  unint64_t v5 = [v4 selectedLightingType];
  if (v5 > 6) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1AEFF81A0[v5];
  }
  objc_msgSend(v4, "ppt_selectLightingType:", v6);
  if (v7) {
    v7[2]();
  }
}

- (void)ppt_selectLightingEffect:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  double v18 = (void (**)(void))a4;
  id v7 = [(PUPhotoEditPortraitToolController *)self->_portraitToolController lightingControl];
  uint64_t v8 = [v7 selectedLightingType];
  uint64_t v9 = [MEMORY[0x1E4F57D58] displayNameForLightingType:v8];
  unint64_t v10 = 0;
  while (1)
  {
    double v11 = [v9 lowercaseString];
    double v12 = [v6 lowercaseString];
    char v13 = [v11 isEqualToString:v12];

    if ((v13 & 1) != 0 || v10 > 9) {
      break;
    }
    dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __70__PUPhotoEditViewController_ppt_selectLightingEffect_completionBlock___block_invoke;
    v19[3] = &unk_1E5F2ED10;
    dispatch_semaphore_t v20 = v14;
    double v15 = v14;
    [(PUPhotoEditViewController *)self ppt_selectNextLightingEffect:v19];
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    ++v10;
    uint64_t v16 = [v7 selectedLightingType];
    uint64_t v17 = [MEMORY[0x1E4F57D58] displayNameForLightingType:v16];

    uint64_t v9 = (void *)v17;
  }
  if (v18) {
    v18[2](v18);
  }
}

intptr_t __70__PUPhotoEditViewController_ppt_selectLightingEffect_completionBlock___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)ppt_navigateToPortraitLightingEffects:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__PUPhotoEditViewController_ppt_navigateToPortraitLightingEffects___block_invoke;
  v6[3] = &unk_1E5F2EA60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUPhotoEditViewController *)self ppt_selectPortraitController:v6];
}

uint64_t __67__PUPhotoEditViewController_ppt_navigateToPortraitLightingEffects___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1608) setToolSelection:1 animated:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)ppt_scrollSliderNamed:(id)a3 value:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  adjustmentsController = self->_adjustmentsController;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PUPhotoEditViewController_ppt_scrollSliderNamed_value_completion___block_invoke;
  v14[3] = &unk_1E5F29EA0;
  objc_copyWeak(&v17, &location);
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  [(PUAdjustmentsToolController *)adjustmentsController ppt_selectSliderNamed:v8 completion:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __68__PUPhotoEditViewController_ppt_scrollSliderNamed_value_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained[199], "ppt_visibleScaleValueForSelectedSlider");
  unint64_t v4 = llround(v3);
  objc_msgSend(WeakRetained[199], "ppt_valueIncrementForSelectedSlider");
  uint64_t v6 = (uint64_t)((double)(uint64_t)((int)[*(id *)(a1 + 32) intValue] - v4) / v5);
  if (v6 < 1)
  {
    if (v6 < 0)
    {
      uint64_t v8 = 0;
      do
      {
        id v9 = objc_loadWeakRetained(v2);
        [v9 _handleSliderValueDecrease:0];

        --v8;
      }
      while (v8 > v6);
    }
  }
  else
  {
    do
    {
      id v7 = objc_loadWeakRetained(v2);
      [v7 _handleSliderValueIncrease:0];

      --v6;
    }
    while (v6);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(void))(v10 + 16))();
  }
}

- (void)ppt_scrollSelectedSliderByDelta
{
}

- (void)ppt_configureSelectedSliderWithSteps:(int64_t)a3
{
}

- (void)ppt_scrollBWSlider:(id)a3
{
  pptState = self->_pptState;
  double v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v6 = objc_alloc_init(v5);
  [(_PPTState *)pptState setRenderStatistics:v6];

  [(PUAdjustmentsToolController *)self->_adjustmentsController ppt_selectBWSlider:v7];
}

- (void)ppt_scrollColorSlider:(id)a3
{
  pptState = self->_pptState;
  double v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v6 = objc_alloc_init(v5);
  [(_PPTState *)pptState setRenderStatistics:v6];

  [(PUAdjustmentsToolController *)self->_adjustmentsController ppt_selectColorSlider:v7];
}

- (void)ppt_scrollLightSlider:(id)a3
{
  pptState = self->_pptState;
  double v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v7 = a3;
  id v6 = objc_alloc_init(v5);
  [(_PPTState *)pptState setRenderStatistics:v6];

  [(PUAdjustmentsToolController *)self->_adjustmentsController ppt_selectLightSlider:v7];
}

- (void)ppt_applyAutoenhance:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(PUPhotoEditViewController *)self compositionController];
  if (v4 && [MEMORY[0x1E4F91118] isAutoEnhanceEnabledForCompositionController:v4]) {
    [(PUPhotoEditViewController *)self _handleAutoEnhanceButton:self];
  }
  [(PUPhotoEditViewController *)self setPpt_afterAutoenhanceBlock:v5];
  [(PUPhotoEditViewController *)self _handleAutoEnhanceButton:self];
}

- (void)ppt_selectCleanupController:(id)a3
{
  [(PUPhotoEditToolController *)self->_cleanupController setPpt_didBecomeActiveToolBlock:a3];
  cleanupController = self->_cleanupController;
  [(PUPhotoEditViewController *)self switchToEditingTool:cleanupController animated:1];
}

- (void)ppt_selectStyleController:(id)a3
{
  [(PUPhotoEditToolController *)self->_photoStylesToolController setPpt_didBecomeActiveToolBlock:a3];
  photoStylesToolController = self->_photoStylesToolController;
  [(PUPhotoEditViewController *)self switchToEditingTool:photoStylesToolController animated:1];
}

- (void)ppt_selectPortraitController:(id)a3
{
  [(PUPhotoEditToolController *)self->_portraitToolController setPpt_didBecomeActiveToolBlock:a3];
  portraitToolController = self->_portraitToolController;
  [(PUPhotoEditViewController *)self switchToEditingTool:portraitToolController animated:1];
}

- (void)ppt_selectPerspectiveController:(id)a3
{
  [(PUPhotoEditToolController *)self->_cropController setPpt_didBecomeActiveToolBlock:a3];
  cropController = self->_cropController;
  [(PUPhotoEditViewController *)self switchToEditingTool:cropController animated:1];
}

- (void)ppt_selectCropController:(id)a3
{
  [(PUPhotoEditToolController *)self->_cropController setPpt_didBecomeActiveToolBlock:a3];
  cropController = self->_cropController;
  [(PUPhotoEditViewController *)self switchToEditingTool:cropController animated:1];
}

- (void)ppt_selectAdjustmentsController:(id)a3
{
  [(PUPhotoEditToolController *)self->_adjustmentsController setPpt_didBecomeActiveToolBlock:a3];
  adjustmentsController = self->_adjustmentsController;
  [(PUPhotoEditViewController *)self switchToEditingTool:adjustmentsController animated:1];
}

- (void)ppt_selectFiltersController:(id)a3
{
  id v4 = a3;
  id v5 = self->_pptState;
  [(_PPTState *)v5 enterDispatchGroup];
  filtersController = self->_filtersController;
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke;
  id v12 = &unk_1E5F2EA60;
  id v13 = v5;
  id v14 = v4;
  id v7 = v4;
  uint64_t v8 = v5;
  [(PUPhotoEditToolController *)filtersController setPpt_didBecomeActiveToolBlock:&v9];
  -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:", self->_filtersController, 1, v9, v10, v11, v12);
}

void __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke_2;
  v2[3] = &unk_1E5F2EBA0;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 groupNotifyOnQueue:MEMORY[0x1E4F14428] withBlock:v2];
}

uint64_t __57__PUPhotoEditViewController_ppt_selectFiltersController___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_ppt_conditionallyExecuteAfterRender
{
  if ([(PUPhotoEditViewController *)self _isReadyToRender]
    && [(_PPTState *)self->_pptState hasRendered])
  {
    id v3 = self;
    objc_sync_enter(v3);
    id ppt_afterRenderBlock = v3->_ppt_afterRenderBlock;
    if (ppt_afterRenderBlock)
    {
      id v5 = _Block_copy(ppt_afterRenderBlock);
      id v6 = v3->_ppt_afterRenderBlock;
      v3->_id ppt_afterRenderBlock = 0;
    }
    else
    {
      id v5 = 0;
    }
    objc_sync_exit(v3);

    if (v5)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __65__PUPhotoEditViewController__ppt_conditionallyExecuteAfterRender__block_invoke;
      v7[3] = &unk_1E5F2EA60;
      void v7[4] = v3;
      id v8 = v5;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

uint64_t __65__PUPhotoEditViewController__ppt_conditionallyExecuteAfterRender__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1648) hasRendered];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)ppt_executeAfterRender:(id)a3
{
  [(PUPhotoEditViewController *)self setPpt_afterRenderBlock:a3];
  [(PUPhotoEditViewController *)self _ppt_conditionallyExecuteAfterRender];
}

- (void)ppt_revertWithCompletion:(id)a3
{
  [(PUPhotoEditViewController *)self setPpt_exitActionCompleteNotificationBlock:a3];
  [(PUPhotoEditViewController *)self _performRevertAction];
}

- (void)ppt_saveWithCompletion:(id)a3
{
  [(PUPhotoEditViewController *)self setPpt_exitActionCompleteNotificationBlock:a3];
  [(PUPhotoEditViewController *)self _handleDoneButton:self];
}

- (void)ppt_cancelEditsWithCompletion:(id)a3
{
  [(PUPhotoEditViewController *)self setPpt_exitActionCompleteNotificationBlock:a3];
  [(PUPhotoEditViewController *)self _performDiscardAction];
}

- (void)ppt_revert
{
}

- (void)ppt_save
{
}

- (void)ppt_cancelEdits
{
}

- (void)ppt_setEditIsReadyNotificationBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v9 = v4;
  if (v4
    && ([(PUPhotoEditViewController *)self enterEditTimeInterval],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 state],
        v5,
        id v4 = v9,
        v6 == 2))
  {
    v9[2]();
  }
  else
  {
    id v7 = (void *)[v4 copy];
    id ppt_editIsReadyNotificationBlock = self->_ppt_editIsReadyNotificationBlock;
    self->_id ppt_editIsReadyNotificationBlock = v7;
  }
}

- (void)_didEndAutoCalc
{
  id v2 = [(PUPhotoEditViewController *)self autoCalcInterval];
  [v2 endInterval];

  id v3 = (void *)MEMORY[0x1E4F8A350];
  [v3 requestVisionCleanUp];
}

- (void)_didStartAutoCalc
{
  id v2 = [(PUPhotoEditViewController *)self autoCalcInterval];
  [v2 beginInterval];
}

- (void)_didEndResourceLoading
{
  id v2 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
  [v2 endInterval];
}

- (void)_didStartResourceLoading
{
  id v2 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
  [v2 beginInterval];
}

- (void)_didEndEnterEdit
{
  id v3 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
  uint64_t v4 = [v3 state];

  if (v4 == 1)
  {
    id v5 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
    [v5 endInterval];

    uint64_t v6 = [(PUPhotoEditViewController *)self sceneHUD];
    [v6 update];

    id v7 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
    [v7 duration];
    double v9 = v8;

    uint64_t v10 = [(PUPhotoEditViewController *)self enterEditEventBuilder];
    [v10 setEnterEditDuration:v9];
    double v11 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
    [v11 duration];
    objc_msgSend(v10, "setResourceCheckingDuration:");

    id v12 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
    [v12 duration];
    objc_msgSend(v10, "setResourceDownloadDuration:");

    id v13 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
    [v13 duration];
    objc_msgSend(v10, "setResourceLoadingDuration:");

    id v14 = [(PUPhotoEditViewController *)self autoCalcInterval];
    [v14 duration];
    objc_msgSend(v10, "setAutoCalcDuration:");

    id v15 = [v10 buildEvent];
    [MEMORY[0x1E4F56658] sendEvent:@"com.apple.photos.edit.perf.enteredit" withPayload:v15];
  }
  id v16 = [(PUPhotoEditViewController *)self ppt_editIsReadyNotificationBlock];

  if (v16)
  {
    id v17 = [(PUPhotoEditViewController *)self ppt_editIsReadyNotificationBlock];
    v17[2]();

    [(PUPhotoEditViewController *)self setPpt_editIsReadyNotificationBlock:0];
  }
}

- (void)_didStartEnterEdit
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
  [v3 beginInterval];

  uint64_t v4 = [(PUPhotoEditViewController *)self editSessionTimeInterval];
  [v4 beginInterval];

  id v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoEditViewController isFirstSinceBoot](self, "isFirstSinceBoot"));
    id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PUPhotoEditViewController isFirstSinceLaunch](self, "isFirstSinceLaunch"));
    int v8 = 138412546;
    double v9 = v6;
    __int16 v10 = 2112;
    double v11 = v7;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "FirstSinceBoot=%@, FirstSinceLaunch=%@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)_toolControllerForAdjustmentCategory:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      uint64_t v5 = 1592;
      goto LABEL_14;
    case 4:
      uint64_t v5 = 1576;
      goto LABEL_14;
    case 5:
      uint64_t v5 = 1616;
      goto LABEL_14;
    case 6:
    case 7:
    case 8:
      uint64_t v5 = 1568;
      goto LABEL_14;
    case 9:
      uint64_t v5 = 1608;
      goto LABEL_14;
    case 10:
      self = [(PUPhotoEditViewController *)self _defaultInitialToolController];
      goto LABEL_15;
    case 11:
      uint64_t v5 = 1584;
      goto LABEL_14;
    case 12:
      uint64_t v5 = 1600;
      goto LABEL_14;
    case 13:
      uint64_t v5 = 1632;
LABEL_14:
      self = (PUPhotoEditViewController *)*(id *)((char *)&self->super.super.super.isa + v5);
LABEL_15:
      break;
    default:
      break;
  }
  return self;
}

- (void)fulfillPendingEditsRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self photo];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  uint64_t v7 = [(PUPhotoEditToolController *)self->_currentEditingTool compositionController];
  if (v7
    && (int v8 = (void *)v7,
        BOOL v9 = [(PUPhotoEditToolController *)self->_currentEditingTool canBecomeActiveTool],
        v8,
        v9))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke;
    aBlock[3] = &unk_1E5F2E908;
    aBlock[4] = self;
    id v10 = v4;
    id v20 = v10;
    id v21 = v6;
    double v11 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v12 = [v10 adjustments];
    id v13 = [v12 lastObject];
    uint64_t v14 = [v13 category];

    if (v14 == 10)
    {
      [(PUPhotoEditViewController *)self _presentMarkup];
      [v10 finishedWithSuccess:1 error:0];
    }
    else
    {
      id v16 = [(PUPhotoEditViewController *)self _toolControllerForAdjustmentCategory:v14];
      [(UIViewController *)v16 configureForAdjustmentCategory:v14];
      if (self->_currentTool == v16)
      {
        v11[2](v11);
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_4;
        v17[3] = &unk_1E5F2EBA0;
        double v18 = v11;
        [(PUPhotoEditViewController *)self switchToEditingTool:v16 animated:1 completionHandler:v17];
      }
    }
  }
  else
  {
    id v15 = +[PUPhotoEditPendingEditsRequest errorWithCode:3 debugDescription:@"Editing resources have not loaded"];
    [v4 finishedWithSuccess:0 error:v15];
  }
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v16 = [*(id *)(a1 + 32) compositionController];
  uint64_t v14 = [v16 composition];
  id v2 = dispatch_group_create();
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  char v34 = 1;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__61118;
  v31[4] = __Block_byref_object_dispose__61119;
  id v32 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v3 = [*(id *)(a1 + 40) adjustments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    id obj = v3;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * v6);
        dispatch_group_enter(v2);
        int v8 = [*(id *)(a1 + 32) valuesCalculator];
        uint64_t v9 = *(void *)(a1 + 48);
        uint64_t v10 = *(void *)(a1 + 32);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_2;
        v23[3] = &unk_1E5F29710;
        v25 = v33;
        BOOL v26 = v31;
        BOOL v24 = v2;
        [v7 applyToCompositionController:v16 valuesCalculator:v8 asset:v9 livePortraitBehaviorDelegate:v10 completionHandler:v23];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = obj;
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v4);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_3;
  block[3] = &unk_1E5F29738;
  double v11 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v18 = v16;
  id v19 = v14;
  id v20 = v11;
  id v21 = v33;
  int v22 = v31;
  id v12 = v14;
  id v13 = v16;
  dispatch_group_notify(v2, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_5;
  block[3] = &unk_1E5F2EBA0;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

uint64_t __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  id v7 = v6;
  if ((a2 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    if (v6) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__PUPhotoEditViewController_fulfillPendingEditsRequest___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) undoManager];
  if (v3 && ([v3 isUndoing] & 1) == 0 && (objc_msgSend(v3, "isRedoing") & 1) == 0)
  {
    dispatch_time_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F90148]) initWithCompositionController:*(void *)(a1 + 40) sourceComposition:*(void *)(a1 + 48)];
    [v2 setLocalizedActionName:@"Edit Intent"];
    [v2 registerWithUndoManager:v3];
  }
  [*(id *)(a1 + 56) finishedWithSuccess:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) error:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
}

- (void)_didEndExitActionWithSessionKeys:(id)a3 initialComposition:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PUPhotoEditViewController *)self exitEditTimeInterval];
  uint64_t v9 = [v8 state];

  uint64_t v10 = [(PUPhotoEditViewController *)self exitEditTimeInterval];
  [v10 endInterval];

  double v11 = [(PUPhotoEditViewController *)self ppt_exitActionCompleteNotificationBlock];

  if (v11)
  {
    id v12 = [(PUPhotoEditViewController *)self ppt_exitActionCompleteNotificationBlock];
    v12[2]();

    [(PUPhotoEditViewController *)self setPpt_exitActionCompleteNotificationBlock:0];
  }
  if (v9 == 1)
  {
    id v13 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    uint64_t v14 = [(PUPhotoEditViewController *)self compositionController];
    [v13 setCompositionController:v14];

    id v15 = [(PUPhotoEditViewController *)self exitEditTimeInterval];
    [v15 duration];
    objc_msgSend(v13, "setExitEditDuration:");

    char v16 = PUCheckAndNoteIsFirstExitFromEditSinceLaunch_isFirstUseSinceLaunch;
    PUCheckAndNoteIsFirstExitFromEditSinceLaunch_isFirstUseSinceLaunch = 1;
    [v13 setFirstSinceLaunch:(v16 & 1) == 0];
    id v17 = [v13 buildEvent];
    id v18 = (void *)[v17 mutableCopy];

    if (v6)
    {
      uint64_t v60 = v13;
      v61 = self;
      id v62 = v6;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id obj = v6;
      uint64_t v19 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v65;
        uint64_t v22 = MEMORY[0x1E4F1CC38];
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v65 != v21) {
              objc_enumerationMutation(obj);
            }
            BOOL v24 = [*(id *)(*((void *)&v64 + 1) + 8 * i) substringFromIndex:26];
            v25 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
            BOOL v26 = [v25 invertedSet];

            long long v27 = [v24 componentsSeparatedByCharactersInSet:v26];
            long long v28 = [v27 componentsJoinedByString:@"_"];

            [v18 setObject:v22 forKeyedSubscript:v28];
          }
          uint64_t v20 = [obj countByEnumeratingWithState:&v64 objects:v68 count:16];
        }
        while (v20);
      }

      self = v61;
      long long v29 = [(PUPhotoEditViewController *)v61 aggregateSession];
      long long v30 = [v29 pluginIdentifier];

      id v6 = v62;
      id v13 = v60;
      if (v30)
      {
        id v31 = [(PUPhotoEditViewController *)v61 aggregateSession];
        id v32 = [v31 pluginIdentifier];
        [v18 setObject:v32 forKeyedSubscript:@"pluginIdentifier"];
      }
    }
    v33 = (objc_class *)objc_opt_class();
    char v34 = NSStringFromClass(v33);
    [v18 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F56560]];

    v35 = [(PUPhotoEditViewController *)self photo];
    [v18 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F56558]];

    [MEMORY[0x1E4F56658] sendEvent:*MEMORY[0x1E4F56430] withPayload:v18];
    id v36 = objc_alloc(MEMORY[0x1E4F91140]);
    v37 = [(PUPhotoEditViewController *)self enterEditEventBuilder];
    v38 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    v39 = (void *)[v36 initWithLegacyEnterEditEvent:v37 andExitEvent:v38];
    [(PUPhotoEditViewController *)self setEditSessionEventBuilder:v39];

    int v40 = [(PUPhotoEditViewController *)self editSessionTimeInterval];
    [v40 duration];
    double v42 = v41;
    id v43 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    [v43 setEditSessionDuration:v42];

    v44 = v7;
    if (!v7)
    {
      v44 = [(PUPhotoEditViewController *)self uneditedComposition];
    }
    v45 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    [v45 setInitialComposition:v44];

    if (!v7) {
    v46 = [(PUPhotoEditViewController *)self adjustmentIdentifierAndVersion];
    }
    id v47 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    [v47 setAdjustmentIdentifierAndVersion:v46];

    uint64_t v48 = [(PUPhotoEditViewController *)self _isQuickCrop];
    int v49 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    [v49 setSessionEntryPoint:v48];

    if ([(PUPhotoEditViewController *)self _isQuickCrop])
    {
      v50 = [(PUPhotoEditViewController *)self quickCropContext];
      [v50 selectedAspectRatio];
      double v52 = v51;
      double v54 = v53;
      v55 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
      objc_msgSend(v55, "setQuickCropSelectedAspectRatio:", v52, v54);
    }
    int64_t v56 = [(PUCleanupToolController *)self->_cleanupController segmentationCount];
    v57 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    [v57 setSegmentationCount:v56];

    uint64_t v58 = [(PUPhotoEditViewController *)self editSessionEventBuilder];
    uint64_t v59 = [v58 buildEvent];

    [MEMORY[0x1E4F56658] sendEvent:*MEMORY[0x1E4F911E8] withPayload:v59];
  }
  [MEMORY[0x1E4F7A448] reapAllStoragePools];
}

- (void)_didEndExitActionWithSessionKeys:(id)a3
{
}

- (void)_didStartExitAction
{
  id v3 = [(PUPhotoEditViewController *)self exitEditTimeInterval];
  [v3 beginInterval];

  id v4 = [(PUPhotoEditViewController *)self editSessionTimeInterval];
  [v4 endInterval];

  self->_leavingEdit = 1;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  return ![(PUPhotoEditViewController *)self _hasUnsavedChanges];
}

- (void)_hideEphemeralViews:(BOOL)a3
{
  [(UIImageView *)self->_placeholderImageView setHidden:a3];
  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
}

- (void)oneUpAssetTransitionDidEnd:(id)a3
{
  [(PUPhotoEditViewController *)self _hideEphemeralViews:0];
  id v5 = [(PUPhotoEditViewController *)self px_imageModulationManager];
  id v4 = [(PUPhotoEditViewController *)self imageLayerModulator];
  [v5 checkInImageLayerModulator:v4];
}

- (void)oneUpAssetTransitionWillBegin:(id)a3
{
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  double v11 = [v9 transitionInfo];
  if ([(PUPhotoEditViewController *)self isStandardVideo])
  {
    long long v79 = 0uLL;
    uint64_t v80 = 0;
    if (v11 && ([v11 seekTime], (BYTE12(v79) & 1) != 0))
    {
      long long v77 = v79;
      uint64_t v12 = v80;
    }
    else
    {
      long long v77 = *MEMORY[0x1E4F1FA48];
      uint64_t v12 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    }
    uint64_t v78 = v12;
    long long v75 = v77;
    uint64_t v76 = v12;
    [(PUPhotoEditViewController *)self setInitialSeekTime:&v75];
  }
  id v13 = [(PUPhotoEditViewController *)self photo];
  unsigned int v14 = [v13 mediaSubtypes];

  id v15 = [v11 image];
  [(PUPhotoEditViewController *)self setPlaceholderImage:v15];

  char v16 = [v11 imageLayerModulator];
  -[PUPhotoEditViewController setGainMapImage:](self, "setGainMapImage:", [v16 gainMapImage]);
  [v16 gainMapValue];
  -[PUPhotoEditViewController setGainMapValue:](self, "setGainMapValue:");
  [(PUPhotoEditViewController *)self _updatePlaceholderImage];
  id v17 = [v9 containerView];
  id v18 = [v9 snapshotView];
  uint64_t v19 = [(PUPhotoEditViewController *)self view];
  [v19 layoutIfNeeded];
  [v19 setAlpha:0.0];
  id v61 = v10;
  if ([(PUPhotoEditViewController *)self _isQuickCrop])
  {
    uint64_t v20 = [v11 image];
    [v20 size];
    double v22 = v21;
    double v24 = v23;

    double v25 = v22 / v24;
    [v17 frame];
    double v28 = v27;
    if (v25 >= v26 / v27)
    {
      double v32 = v25 * v27;
      double v31 = (v26 - v25 * v27) * 0.5;
      double v30 = 0.0;
    }
    else
    {
      double v29 = v26 / v25;
      double v30 = (v27 - v26 / v25) * 0.5;
      double v31 = 0.0;
      double v32 = v26;
      double v28 = v29;
    }
  }
  else
  {
    [v18 frame];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v41 = [v9 fromView];
    objc_msgSend(v17, "convertRect:fromView:", v41, v34, v36, v38, v40);
    double v31 = v42;
    double v30 = v43;
    double v32 = v44;
    double v28 = v45;
  }
  int v46 = (v14 >> 20) & 1;
  objc_msgSend(v18, "setFrame:", v31, v30, v32, v28, v61);
  [v17 insertSubview:v18 aboveSubview:self->_mediaView];
  [(PUPhotoEditViewController *)self previewViewFrame];
  objc_msgSend(v17, "convertRect:fromView:", v19);
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  [(PUPhotoEditViewController *)self _hideEphemeralViews:1];
  v55 = +[PUInterfaceManager beginDisablingUserInteractionForReason:7];
  int64_t v56 = (void *)MEMORY[0x1E4FB1EB0];
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke;
  v68[3] = &unk_1E5F2D1C0;
  uint64_t v71 = v48;
  uint64_t v72 = v50;
  uint64_t v73 = v52;
  uint64_t v74 = v54;
  id v69 = v18;
  id v70 = v19;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2;
  v63[3] = &unk_1E5F296E8;
  v63[4] = self;
  id v64 = v69;
  char v67 = v46;
  id v65 = v55;
  id v66 = v62;
  id v57 = v62;
  id v58 = v55;
  id v59 = v69;
  id v60 = v19;
  [v56 animateWithDuration:v68 animations:v63 completion:a5];
}

uint64_t __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  dispatch_time_t v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __99__PUPhotoEditViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _hideEphemeralViews:0];
  [*(id *)(a1 + 40) removeFromSuperview];
  if (*(unsigned char *)(a1 + 64))
  {
    [*(id *)(*(void *)(a1 + 32) + 1432) bounds];
    objc_msgSend(*(id *)(a1 + 40), "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 1432) addSubview:*(void *)(a1 + 40)];
  }
  +[PUInterfaceManager endDisablingUserInteraction:*(void *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (id)oneUpAssetTransition:(id)a3 adjustTransitionInfo:(id)a4
{
  id v5 = a4;
  if ([(PUPhotoEditViewController *)self _isQuickCrop])
  {
    id v6 = [(PUPhotoEditViewController *)self quickCropContext];
    id v7 = [v6 applyCropToAssetTransitionInfo:v5];
  }
  else
  {
    id v7 = v5;
  }

  return v7;
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  id v5 = (void (**)(id, void *))a4;
  id v6 = [(PUPhotoEditViewController *)self view];
  [v6 layoutIfNeeded];

  id v7 = [(PUPhotoEditViewController *)self view];
  [(PUPhotoEditViewController *)self _oneUpTransitionPlaceholderViewFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (![(PUPhotoEditViewController *)self isStandardVideo]) {
    goto LABEL_3;
  }
  char v16 = [(PUPhotoEditViewController *)self mediaView];
  id v17 = [v16 _videoPlayerView];
  id v18 = [v17 snapshotViewAfterScreenUpdates:0];

  objc_msgSend(v18, "setFrame:", v9, v11, v13, v15);
  if (!v18)
  {
LABEL_3:
    uint64_t v19 = [(PUPhotoEditViewController *)self _currentViewContentsForDismissTransition];
    id v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v9, v11, v13, v15);
    [v18 setContentMode:2];
    uint64_t v20 = [v18 layer];
    [v20 setContents:v19];
  }
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  double v27 = __89__PUPhotoEditViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke;
  double v28 = &unk_1E5F296C0;
  id v21 = v18;
  id v29 = v21;
  double v30 = self;
  double v22 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:&v25];
  double v23 = +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:", 0, v7, v21, v22, v25, v26, v27, v28);
  double v24 = [(PUPhotoEditViewController *)self executedSessionAction];
  [v23 setExecutedAction:v24];

  if (v5) {
    v5[2](v5, v23);
  }
}

void __89__PUPhotoEditViewController_oneUpAssetTransition_requestTransitionContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setSnapshotView:v3];
  id v4 = [*(id *)(a1 + 40) photo];
  [v5 setAsset:v4];

  objc_msgSend(v5, "setAllowAutoPlay:", objc_msgSend(*(id *)(a1 + 40), "isLoopingVideo"));
}

- (void)didFinishWithChanges:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(PUPhotoEditViewController *)self _cancelInProgressSaveRequest];
  }
  id v5 = [(PUPhotoEditViewController *)self photo];
  [(PUPhotoEditViewController *)self didFinishWithAsset:v5 savedChanges:v3];

  pptState = self->_pptState;
  [(_PPTState *)pptState setHasRendered:0];
}

- (void)didFinishWithAsset:(id)a3 savedChanges:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = @"NO";
    if (v4) {
      double v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "didFinishWithAsset - saved changes: %@", buf, 0xCu);
  }

  uint64_t v9 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];
  if (v9)
  {
    double v10 = (void *)v9;
    double v11 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];
    double v12 = [(PUPhotoEditViewController *)self presentedViewController];

    if (v11 == v12)
    {
      double v13 = [(PUPhotoEditViewController *)self presentedViewController];
      [v13 dismissViewControllerAnimated:1 completion:0];

      [(PUPhotoEditViewController *)self setCancelConfirmationAlert:0];
    }
  }
  double v14 = [(PUPhotoEditViewController *)self sessionDelegate];
  [v14 photoEditController:self didFinishEditingSessionForAsset:v6 completed:v4];
  BOOL v15 = [(PUPhotoEditViewController *)self isStandardVideo];
  char v16 = [(PUPhotoEditViewController *)self presentationDelegate];
  id v17 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [NSNumber numberWithBool:v15];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2112;
    uint64_t v26 = v18;
    _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "didFinishWithAsset - sessionDelegate: %@, presentationDelegate: %@, isStandardVideo: %@", buf, 0x20u);
  }
  if (v15)
  {
    uint64_t v19 = [v6 modificationDate];
    uint64_t v20 = [v19 dateByAddingTimeInterval:-1.0];

    memset(buf, 0, sizeof(buf));
    id v21 = [(NUMediaView *)self->_mediaView player];
    double v22 = v21;
    if (v21) {
      [v21 currentTime];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }

    if (self->_inProgressSaveIsDeferredRender)
    {
      *(_OWORD *)buf = *MEMORY[0x1E4F1F9F8];
      *(void *)&buf[16] = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    }
    long long v23 = *(_OWORD *)buf;
    uint64_t v24 = *(void *)&buf[16];
    [v16 editController:self didFinishPreparingForTransitionAfterEditingVideo:v6 modificationDate:v20 seekTime:&v23];
  }
  else
  {
    [v16 editController:self didFinishPreparingForTransitionAfterEditingPhoto:v6];
  }
}

- (void)editPluginSession:(id)a3 didEndWithCompletionType:(unint64_t)a4 forPluginIdentifier:(id)a5
{
  id v26 = a3;
  id v8 = a5;
  if (self->_pluginFullSizeImageURL)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    [v9 removeItemAtURL:self->_pluginFullSizeImageURL error:0];

    pluginFullSizeImageURL = self->_pluginFullSizeImageURL;
    self->_pluginFullSizeImageURL = 0;
  }
  [(PUPhotoEditViewController *)self _mediaViewEdgeInsets];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [MEMORY[0x1E4F39CF8] animationDuration];
  double v20 = v19;
  UIAnimationDragCoefficient();
  -[NUMediaView _transitionToInsets:duration:animationCurve:updateRenderContent:](self->_mediaView, "_transitionToInsets:duration:animationCurve:updateRenderContent:", 0, 0, v12, v14, v16, v18, v20 * v21);
  double v22 = [(PUPhotoEditViewController *)self aggregateSession];
  [v22 setPluginIdentifier:v8];

  if (a4 == 3)
  {
    long long v23 = [(PUPhotoEditViewController *)self view];
    uint64_t v24 = [v23 superview];
    uint64_t v25 = [v24 undoManager];

    [v25 removeAllActions];
  }
}

- (void)editPluginSessionWillBegin:(id)a3
{
  id v3 = [(PUPhotoEditViewController *)self aggregateSession];
  [v3 setPluginStarted:1];
}

- (void)editPluginSessionAvailabilityDidChange:(id)a3
{
}

- (void)_updatePenultimateAvailableWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v5 setVersion:16];
  id v6 = [(PUPhotoEditViewController *)self mediaProvider];
  id v7 = [(PUPhotoEditViewController *)self photo];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5F29580;
  void v11[4] = self;
  id v12 = v4;
  double v8 = *MEMORY[0x1E4F1DB30];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  id v10 = v4;
  objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v5, v11, v8, v9);
}

void __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39360]];
  BOOL v5 = [v4 baseVersion] == 1;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5F2C610;
  id v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  BOOL v9 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __78__PUPhotoEditViewController__updatePenultimateAvailableWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setPenultimateAvailable:*(unsigned __int8 *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_setupVideoPluginSession
{
  id v3 = objc_alloc_init(PUVideoEditPluginSession);
  [(PUEditPluginSession *)v3 setDataSource:self];
  [(PUEditPluginSession *)v3 setDelegate:self];
  [(PUVideoEditPluginSession *)v3 setAllowLoopingVideoExtensions:[(PUPhotoEditViewController *)self isLoopingVideo]];
  pluginSession = self->_pluginSession;
  self->_pluginSession = &v3->super;
}

- (void)_setupImagePluginSession
{
  id v3 = objc_alloc_init(PUImageEditPluginSession);
  [(PUEditPluginSession *)v3 setDataSource:self];
  [(PUEditPluginSession *)v3 setDelegate:self];
  id v4 = [(PUPhotoEditViewController *)self photo];
  uint64_t v5 = [v4 canPlayPhotoIris];

  [(PUImageEditPluginSession *)v3 setAllowLivePhotoExtensions:v5];
  if ([(PUPhotoEditViewController *)self _enableSpatialMediaEditing]) {
    BOOL v6 = [(PUPhotoEditViewController *)self isSpatialMedia];
  }
  else {
    BOOL v6 = 0;
  }
  [(PUImageEditPluginSession *)v3 setAllowSpatialPhotoExtensions:v6];
  pluginSession = self->_pluginSession;
  self->_pluginSession = &v3->super;
}

- (void)_updatePluginSession
{
  BOOL v3 = [(PUPhotoEditViewController *)self isStandardVideo]
    || [(PUPhotoEditViewController *)self isLoopingVideo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v3 || (isKindOfClass & 1) != 0)
  {
    if (!v3 && (isKindOfClass & 1) != 0) {
      [(PUPhotoEditViewController *)self _setupImagePluginSession];
    }
  }
  else
  {
    [(PUPhotoEditViewController *)self _setupVideoPluginSession];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    uint64_t v6 = [v5 isVideoEnabled];

    [(PUEditPluginSession *)self->_pluginSession setAllowLivePhotoExtensions:v6];
    if ([(PUPhotoEditViewController *)self _enableSpatialMediaEditing]) {
      BOOL v7 = [(PUPhotoEditViewController *)self isSpatialMedia];
    }
    else {
      BOOL v7 = 0;
    }
    [(PUEditPluginSession *)self->_pluginSession setAllowSpatialPhotoExtensions:v7];
  }
  [(PUPhotoEditViewController *)self editPluginSessionAvailabilityDidChange:self->_pluginSession];
  [(PUPhotoEditViewController *)self _updateMoreButtonAnimated:1];
}

- (void)_updatePluginWorkImageVersion
{
  if (!self->_pluginWorkImageVersionIsValid)
  {
    unint64_t v3 = [(PUEditPluginSession *)self->_pluginSession adjustmentType];
    if (v3 <= 2) {
      self->_pluginWorkImageVersion = qword_1AEFF8188[v3];
    }
    self->_pluginWorkImageVersionIsValid = 1;
  }
}

- (id)pluginActivitiesForEditPluginSession:(id)a3
{
  if (self->_currentEditingTool)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [(PUPhotoEditToolController *)self->_currentEditingTool editActionActivities];
    if ([v5 count]) {
      [v4 addObjectsFromArray:v5];
    }
    uint64_t v6 = +[PUPhotoEditProtoSettings sharedInstance];
    char v7 = [v6 editMenuEnabled];

    if ((v7 & 1) == 0)
    {
      id v8 = [(PUPhotoEditViewController *)self copyPresetAction];
      [v4 addObject:v8];

      BOOL v9 = [(PUPhotoEditViewController *)self pastePresetAction];
      [v4 addObject:v9];

      if (MEMORY[0x1B3E7A510]())
      {
        id v10 = [(PUPhotoEditViewController *)self radarAction];
        [v4 addObject:v10];
      }
    }
    double v11 = (void *)[v4 copy];
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (void)editPluginSession:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  [(PUPhotoEditViewController *)self _updatePluginWorkImageVersion];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E5F290D8;
  aBlock[4] = self;
  id v9 = v8;
  id v21 = v9;
  id v10 = _Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_4;
  v17[3] = &unk_1E5F2EBC8;
  void v17[4] = self;
  id v11 = v7;
  id v18 = v11;
  id v12 = v10;
  id v19 = v12;
  double v13 = (void (**)(void))_Block_copy(v17);
  double v14 = v13;
  if (self->_stashedSnapshot)
  {
    v13[2](v13);
  }
  else
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_7;
    v15[3] = &unk_1E5F29698;
    v15[4] = self;
    double v16 = v13;
    [(PUPhotoEditViewController *)self _captureSnapshotOfBasePhotoWithCompletionHandler:v15];
  }
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  unint64_t v7 = (unint64_t)v5;
  id v8 = (void *)v7;
  if (v7 | v6)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = (void *)v7;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithDomain:code:userInfo:", *MEMORY[0x1E4F39800], -1, 0);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1824);
LABEL_6:
  objc_storeStrong((id *)(v9 + 1824), v10);
  *(unsigned char *)(*(void *)(a1 + 32) + 1561) = 1;
  id v11 = *(id **)(a1 + 32);
  if (v11[125])
  {
    [v11[125] willMoveToParentViewController:0];
    id v12 = [*(id *)(*(void *)(a1 + 32) + 1000) view];
    [v12 removeFromSuperview];

    [*(id *)(*(void *)(a1 + 32) + 1000) removeFromParentViewController];
    uint64_t v13 = *(void *)(a1 + 32);
    double v14 = *(void **)(v13 + 984);
    *(void *)(v13 + 984) = 0;

    uint64_t v15 = *(void *)(a1 + 32);
    double v16 = *(void **)(v15 + 1000);
    *(void *)(v15 + 1000) = 0;

    uint64_t v17 = *(void *)(a1 + 32);
    id v18 = *(void **)(v17 + 1568);
    *(void *)(v17 + 1568) = 0;

    uint64_t v19 = *(void *)(a1 + 32);
    double v20 = *(void **)(v19 + 1576);
    *(void *)(v19 + 1576) = 0;

    uint64_t v21 = *(void *)(a1 + 32);
    double v22 = *(void **)(v21 + 1592);
    *(void *)(v21 + 1592) = 0;

    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void **)(v23 + 1608);
    *(void *)(v23 + 1608) = 0;

    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = *(void **)(v25 + 1632);
    *(void *)(v25 + 1632) = 0;

    uint64_t v27 = *(void *)(a1 + 32);
    double v28 = *(void **)(v27 + 1600);
    *(void *)(v27 + 1600) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 1688) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 1624) = 0;
    uint64_t v29 = *(void *)(a1 + 32);
    double v30 = *(void **)(v29 + 1616);
    *(void *)(v29 + 1616) = 0;

    id v11 = *(id **)(a1 + 32);
  }
  [v11 _resetModelAndBaseImagesToWorkImageVersion:3];
  [*(id *)(a1 + 32) _loadPhotoEditResourcesIfNeeded];
  double v31 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v32 = [v31 UUIDString];
  uint64_t v33 = *(void *)(a1 + 32);
  double v34 = *(void **)(v33 + 1408);
  *(void *)(v33 + 1408) = v32;

  [*(id *)(*(void *)(a1 + 32) + 1288) removeAllActions];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2;
  v38[3] = &unk_1E5F2EA60;
  double v35 = *(void **)(a1 + 32);
  id v36 = *(id *)(a1 + 40);
  id v39 = (id)v6;
  id v40 = v36;
  id v37 = (id)v6;
  [v35 _updatePenultimateAvailableWithCompletionHandler:v38];
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_4(id *a1)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_5;
  aBlock[3] = &unk_1E5F29648;
  id v2 = a1[5];
  aBlock[4] = a1[4];
  id v20 = v2;
  id v21 = a1[6];
  unint64_t v3 = _Block_copy(aBlock);
  id v4 = a1[4];
  uint64_t v5 = v4[172];
  switch(v5)
  {
    case 2:
      uint64_t v6 = [a1[4] editSourceContentEditingInput];
      unint64_t v7 = [a1[4] compositionController];
      id v8 = (void *)[v4 _newOutputForContentEditingInput:v6 compositionController:v7];

      uint64_t v9 = [a1[4] mediaDestination];
      id v10 = [a1[4] photo];
      id v11 = [a1[4] compositionController];
      uint64_t v12 = [a1[4] workImageVersion];
      uint64_t v13 = [a1[4] photoEditIrisModel];
      uint64_t v14 = [v13 editingVisibility];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_6;
      v15[3] = &unk_1E5F29670;
      id v17 = a1[6];
      id v16 = a1[5];
      id v18 = v3;
      [v9 saveInternalEditsForAsset:v10 usingCompositionController:v11 contentEditingOutput:v8 version:v12 livePhotoState:v14 completionHandler:v15];

      break;
    case 1:
      [a1[5] setBaseVersion:2];
      (*((void (**)(void *, uint64_t))v3 + 2))(v3, 3);
      break;
    case 0:
      [a1[5] setBaseVersion:*((unsigned __int8 *)v4 + 1416)];
      (*((void (**)(void *, uint64_t))v3 + 2))(v3, 2);
      break;
  }
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1384), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) mediaDestination];
  id v2 = [*(id *)(a1 + 32) photo];
  [v3 saveEditsForAsset:v2 usingContentEditingOutput:*(void *)(a1 + 40) livePhotoState:0 completionHandler:*(void *)(a1 + 48)];
}

uint64_t __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setBaseVersion:2];
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
}

void __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3;
  v3[3] = &unk_1E5F2EA60;
  id v5 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], v3);
}

uint64_t __96__PUPhotoEditViewController_editPluginSession_commitContentEditingOutput_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_editPluginSession:(id)a3 checkVideoEnabled:(BOOL)a4 loadVideoComplementURLWithHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v6
    || ([(PUPhotoEditViewController *)self photoEditIrisModel],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isVideoEnabled],
        v11,
        (v12 & 1) != 0))
  {
    [(PUPhotoEditViewController *)self _updatePluginWorkImageVersion];
    uint64_t v13 = [(PUPhotoEditViewController *)self photo];
    uint64_t v14 = v13;
    long long v38 = 0uLL;
    uint64_t v39 = 0;
    if (v13) {
      [v13 photoIrisStillDisplayTime];
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4F39348]);
    [v15 setVideoComplementAllowed:1];
    [v15 setDeliveryMode:1];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke;
    aBlock[3] = &unk_1E5F295D0;
    id v16 = v10;
    id v35 = v16;
    long long v36 = v38;
    uint64_t v37 = v39;
    id v17 = _Block_copy(aBlock);
    int64_t pluginWorkImageVersion = self->_pluginWorkImageVersion;
    if (pluginWorkImageVersion == 2)
    {
      switch([(PUPhotoEditViewController *)self workImageVersion])
      {
        case 0:
          double v22 = [MEMORY[0x1E4F28B00] currentHandler];
          [v22 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:8897 description:@"unknown work image version"];

          break;
        case 1:
          uint64_t v23 = v15;
          uint64_t v24 = 1;
          goto LABEL_23;
        case 2:
          if ([(PUPhotoEditViewController *)self isPenultimateAvailable]) {
            uint64_t v24 = 8;
          }
          else {
            uint64_t v24 = 1;
          }
          uint64_t v23 = v15;
          goto LABEL_23;
        case 3:
          uint64_t v23 = v15;
          uint64_t v24 = 0;
LABEL_23:
          [v23 setVersion:v24];
          break;
        default:
          break;
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_2;
      v30[3] = &unk_1E5F29620;
      v30[4] = self;
      long long v32 = v38;
      uint64_t v33 = v39;
      double v31 = v16;
      uint64_t v25 = _Block_copy(v30);

      id v17 = v25;
      goto LABEL_25;
    }
    if (pluginWorkImageVersion == 1)
    {
      id v20 = v15;
      uint64_t v19 = 0;
    }
    else
    {
      if (pluginWorkImageVersion)
      {
LABEL_25:
        id v26 = [(PUPhotoEditViewController *)self mediaProvider];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_4;
        v28[3] = &unk_1E5F2D7A8;
        id v29 = v17;
        id v27 = v17;
        [v26 requestAsynchronousVideoURLForAsset:v14 options:v15 resultHandler:v28];

        goto LABEL_26;
      }
      if ([(PUPhotoEditViewController *)self isPenultimateAvailable]) {
        uint64_t v19 = 8;
      }
      else {
        uint64_t v19 = 1;
      }
      id v20 = v15;
    }
    [v20 setVersion:v19];
    goto LABEL_25;
  }
  id v21 = (void (*)(void *, void, long long *))v10[2];
  long long v38 = *MEMORY[0x1E4F1F9F8];
  uint64_t v39 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v21(v10, 0, &v38);
LABEL_26:
}

uint64_t __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(uint64_t (**)(uint64_t, uint64_t, long long *))(v2 + 16);
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  return v3(v2, a2, &v5);
}

void __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
  id v4 = [v3 privateCacheDirectoryWithSubType:13 createIfNeeded:1 error:0];
  long long v5 = [v4 stringByAppendingPathComponent:@"PluginFullSize.mov"];
  uint64_t v6 = [v2 fileURLWithPath:v5];

  unint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v7 removeItemAtURL:v6 error:0];

  id v8 = [*(id *)(a1 + 32) mainRenderer];
  uint64_t v9 = *MEMORY[0x1E4F156E8];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_3;
  v12[3] = &unk_1E5F295F8;
  id v13 = v6;
  long long v15 = *(_OWORD *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 64);
  id v14 = *(id *)(a1 + 40);
  id v10 = v6;
  id v11 = (id)[v8 exportVideoToURL:v10 preset:v9 livePhotoPairingIdentifier:0 completion:v12];
}

uint64_t __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __100__PUPhotoEditViewController__editPluginSession_checkVideoEnabled_loadVideoComplementURLWithHandler___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 64);
  }
  else
  {
    id v3 = 0;
    long long v9 = *MEMORY[0x1E4F1F9F8];
    uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  }
  uint64_t v10 = v4;
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void (**)(uint64_t, id, long long *))(v5 + 16);
  long long v7 = v9;
  uint64_t v8 = v4;
  v6(v5, v3, &v7);
}

- (void)editPluginSession:(id)a3 loadVideoComplementURLWithHandler:(id)a4
{
}

- (void)editPluginSession:(id)a3 loadVideoURLWithHandler:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUPhotoEditViewController_editPluginSession_loadVideoURLWithHandler___block_invoke;
  aBlock[3] = &unk_1E5F295A8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a3;
  long long v9 = _Block_copy(aBlock);
  [(PUPhotoEditViewController *)self _editPluginSession:v8 checkVideoEnabled:0 loadVideoComplementURLWithHandler:v9];
}

uint64_t __71__PUPhotoEditViewController_editPluginSession_loadVideoURLWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadFullSizeImageWithHandler:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PUPhotoEditViewController *)self _updatePluginWorkImageVersion];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke;
  aBlock[3] = &unk_1E5F29498;
  void aBlock[4] = self;
  id v8 = v7;
  id v34 = v8;
  long long v9 = _Block_copy(aBlock);
  self->_pluginWorkingOffPenultimate = 0;
  uint64_t v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int64_t pluginWorkImageVersion = self->_pluginWorkImageVersion;
    char v12 = [(PUPhotoEditViewController *)self photo];
    *(_DWORD *)buf = 67109378;
    int v36 = pluginWorkImageVersion;
    __int16 v37 = 2112;
    long long v38 = v12;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Loading full size image for plugin; work image version: %d - asset: %@",
      buf,
      0x12u);
  }
  int64_t v13 = self->_pluginWorkImageVersion;
  switch(v13)
  {
    case 2:
      id v17 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "Image was edited during this session, so rendering image for plugin", buf, 2u);
      }

      id v18 = objc_alloc(MEMORY[0x1E4F8AA60]);
      uint64_t v19 = [(PUPhotoEditViewController *)self editSource];
      id v14 = (id)[v18 initWithEditSource:v19];

      id v20 = [(PUPhotoEditViewController *)self compositionController];
      [v14 setCompositionController:v20];

      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_964;
      v23[3] = &unk_1E5F29508;
      id v24 = v9;
      [v14 generateJPEGImageDataWithCompressionQuality:0 livePhotoPairingIdentifier:v23 completionHandler:0.899999976];
      uint64_t v16 = v24;
      goto LABEL_11;
    case 1:
      id v14 = objc_alloc_init(MEMORY[0x1E4F390D8]);
      [v14 setVersion:0];
      [v14 setLoadingMode:0x10000];
      [v14 setDeliveryMode:1];
      [v14 setNetworkAccessAllowed:1];
      id v21 = [(PUPhotoEditViewController *)self mediaProvider];
      double v22 = [(PUPhotoEditViewController *)self photo];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_960;
      v25[3] = &unk_1E5F29580;
      v25[4] = self;
      id v26 = v8;
      objc_msgSend(v21, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v22, 0, v14, v25, *MEMORY[0x1E4F396D8], *(double *)(MEMORY[0x1E4F396D8] + 8));

      uint64_t v16 = v26;
      goto LABEL_11;
    case 0:
      id v14 = objc_alloc_init(MEMORY[0x1E4F39028]);
      [v14 setForceReturnFullLivePhoto:1];
      [v14 setContentMode:0];
      [v14 setForcePrepareCurrentBaseVersionInAddition:1];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_951;
      v32[3] = &unk_1E5F28FA0;
      v32[4] = self;
      [v14 setCanHandleRAW:v32];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2;
      v30[3] = &unk_1E5F294C0;
      id v31 = v6;
      [v14 setCanHandleAdjustmentData:v30];
      [v14 setNetworkAccessAllowed:1];
      long long v15 = [(PUPhotoEditViewController *)self photo];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_3;
      v27[3] = &unk_1E5F29558;
      v27[4] = self;
      id v28 = v9;
      id v29 = v8;
      [v15 requestContentEditingInputWithOptions:v14 completionHandler:v27];

      uint64_t v16 = v31;
LABEL_11:

      break;
  }
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (!*(void *)(*(void *)(a1 + 32) + 1392))
  {
    id v3 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
    uint64_t v4 = [v3 privateCacheDirectoryWithSubType:13 createIfNeeded:1 error:0];
    uint64_t v5 = [v4 stringByAppendingPathComponent:@"PluginFullSize.jpg"];

    uint64_t v6 = PLGetSandboxExtensionToken();
    uint64_t v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    uint64_t v8 = *(void *)(a1 + 32);
    long long v9 = *(void **)(v8 + 1392);
    *(void *)(v8 + 1392) = v7;

    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 1400);
    *(void *)(v10 + 1400) = v6;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  [v12 removeItemAtURL:*(void *)(*(void *)(a1 + 32) + 1392) error:0];

  [v13 writeToURL:*(void *)(*(void *)(a1 + 32) + 1392) options:1073741825 error:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_951(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasLoadedRaw];
}

BOOL __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) adjustmentType] == 1;
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 fullSizeImageURL];
  [v5 fullSizeImageOrientation];
  _UIImageOrientationForEXIFOrientation();
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v7;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "received PHContentEditingInput for plugin full-size request; url: %@ - info: %@",
      buf,
      0x16u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 1416) = [v5 baseVersion] == 1;
  long long v9 = [*(id *)(a1 + 32) photo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [*(id *)(a1 + 32) photo];

    if (v10
      && (([v10 isOriginalRaw] & 1) != 0 || objc_msgSend(v10, "originalResourceChoice") == 1)
      && ([*(id *)(a1 + 32) isPenultimateAvailable] & 1) == 0
      && [v5 baseVersion] != 1)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F390D8]);
      [v11 setLoadingMode:0x10000];
      [v11 setDeliveryMode:1];
      [v11 setVersion:2];
      [v11 setNetworkAccessAllowed:1];
      id v12 = [MEMORY[0x1E4F390D0] defaultManager];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_953;
      v29[3] = &unk_1E5F29530;
      id v30 = v7;
      id v31 = *(id *)(a1 + 40);
      [v12 requestImagePropertiesForAsset:v10 options:v11 resultHandler:v29];

      goto LABEL_20;
    }
  }
  else
  {

    uint64_t v10 = 0;
  }
  uint64_t v13 = [v6 objectForKey:*MEMORY[0x1E4F396C0]];
  id v11 = (id)v13;
  if (v7 && !v13)
  {
    uint64_t v25 = v10;
    id v26 = v6;
    id v14 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v15 = [v14 assetsdClient];
    uint64_t v16 = [v15 resourceClient];

    id v17 = [v7 path];
    id v18 = [*(id *)(a1 + 32) photo];
    uint64_t v19 = [v18 uuid];
    id v27 = 0;
    id v28 = 0;
    int v20 = [v16 sandboxExtensionsForAssetWithUUID:v19 sandboxExtensionTokens:&v28 error:&v27];
    id v21 = v28;
    id v22 = v27;

    uint64_t v23 = [v21 objectForKey:v17];
    id v11 = (id)v23;
    if (!v20 || !v23)
    {
      id v24 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v22;
        _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_ERROR, "Error getting sandbox extension token for resource: %@", buf, 0xCu);
      }
    }
    uint64_t v10 = v25;
    id v6 = v26;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_20:
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_960(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F396C8];
  id v5 = a3;
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F396B8]];
  [v7 integerValue];

  uint64_t v8 = [v5 objectForKey:*MEMORY[0x1E4F396C0]];
  long long v9 = [v5 objectForKey:*MEMORY[0x1E4F39698]];

  uint64_t v10 = PLPhotoEditGetLog();
  id v11 = v10;
  if (v9) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v6 == 0;
  }
  if (v12)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v13 = @"(no error received, but no image URL provided)";
    if (v9) {
      uint64_t v13 = v9;
    }
    *(_DWORD *)buf = 138412290;
    __int16 v34 = v13;
    id v14 = "Error requesting fullsize render image for plugin: %@";
    long long v15 = v11;
    os_log_type_t v16 = OS_LOG_TYPE_ERROR;
    uint32_t v17 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    id v14 = "Received fullsize image for asset";
    long long v15 = v11;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 2;
  }
  _os_log_impl(&dword_1AE9F8000, v15, v16, v14, buf, v17);
LABEL_13:

  if (v6) {
    BOOL v19 = v8 == 0;
  }
  else {
    BOOL v19 = 0;
  }
  if (v19)
  {
    int v20 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v21 = [v20 assetsdClient];
    id v22 = [v21 resourceClient];

    uint64_t v23 = [v6 path];
    id v24 = [*(id *)(a1 + 32) photo];
    uint64_t v25 = [v24 uuid];
    id v31 = 0;
    id v32 = 0;
    int v26 = [v22 sandboxExtensionsForAssetWithUUID:v25 sandboxExtensionTokens:&v32 error:&v31];
    id v27 = v32;
    id v28 = (__CFString *)v31;

    uint64_t v29 = [v27 objectForKey:v23];
    uint64_t v8 = (void *)v29;
    if (!v26 || !v29)
    {
      id v30 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v34 = v28;
        _os_log_impl(&dword_1AE9F8000, v30, OS_LOG_TYPE_ERROR, "Error getting sandbox extension token for resource: %@", buf, 0xCu);
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_964(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    uint64_t v4 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "Renderer returned no image data when full-size render requested by plugin", v5, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_953(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "rendering raw image to a jpeg for plugin full-size request", buf, 2u);
  }

  id v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F396D0]];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F396B8]];

  [v7 integerValue];
  int v8 = PLExifOrientationFromImageOrientation();

  long long v9 = (void *)[objc_alloc(MEMORY[0x1E4F8AA68]) initWithURL:*(void *)(a1 + 32) type:v6 image:0 useEmbeddedPreview:0];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v9];
  id v11 = (void *)[MEMORY[0x1E4F8A748] newIdentityCompositionController];
  uint64_t v12 = *MEMORY[0x1E4F8A4A8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  void v15[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_955;
  v15[3] = &__block_descriptor_36_e43_v16__0__PIOrientationAdjustmentController_8l;
  int v16 = v8;
  [v11 modifyAdjustmentWithKey:v12 modificationBlock:v15];
  [v10 setCompositionController:v11];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2_957;
  v13[3] = &unk_1E5F29508;
  id v14 = *(id *)(a1 + 40);
  [v10 generateJPEGImageDataWithCompressionQuality:0 livePhotoPairingIdentifier:v13 completionHandler:0.899999976];
}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_955(uint64_t a1, void *a2)
{
  return [a2 setOrientation:*(unsigned int *)(a1 + 32)];
}

uint64_t __76__PUPhotoEditViewController_editPluginSession_loadFullSizeImageWithHandler___block_invoke_2_957(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadThumbnailImageWithSize:(CGSize)a4 loadHandler:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  if (width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    BOOL v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:8670 description:@"imageSize is zero"];
  }
  PLPhysicalScreenScale();
  PXSizeScale();
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v15 setNetworkAccessAllowed:1];
  [v15 setDeliveryMode:1];
  [v15 setResizeMode:1];
  int v16 = [(PUPhotoEditViewController *)self mediaProvider];
  uint32_t v17 = [(PUPhotoEditViewController *)self photo];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __86__PUPhotoEditViewController_editPluginSession_loadThumbnailImageWithSize_loadHandler___block_invoke;
  v20[3] = &unk_1E5F2DA80;
  id v21 = v9;
  id v18 = v9;
  objc_msgSend(v16, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v17, 0, v15, v20, v12, v14);
}

void __86__PUPhotoEditViewController_editPluginSession_loadThumbnailImageWithSize_loadHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
  else
  {
    id v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
    id v6 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      int v8 = "-[PUPhotoEditViewController editPluginSession:loadThumbnailImageWithSize:loadHandler:]_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "%s: Error fetching thumbnail image data: %@", (uint8_t *)&v7, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)editPluginSession:(id)a3 loadDisplaySizeImageWithHandler:(id)a4
{
  id v5 = a4;
  [(PUPhotoEditViewController *)self _updatePluginWorkImageVersion];
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  objc_msgSend(v6, "pu_workImageSize");
  double v8 = v7;
  double v10 = v9;
  unint64_t pluginWorkImageVersion = self->_pluginWorkImageVersion;
  if (pluginWorkImageVersion < 2)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    if (self->_pluginWorkImageVersion)
    {
      uint64_t v13 = 0;
    }
    else if ([(PUPhotoEditViewController *)self isPenultimateAvailable])
    {
      uint64_t v13 = 8;
    }
    else
    {
      uint64_t v13 = 1;
    }
    [v12 setVersion:v13];
    [v12 setResizeMode:1];
    [v12 setDeliveryMode:1];
    id v18 = [(PUPhotoEditViewController *)self mediaProvider];
    BOOL v19 = [(PUPhotoEditViewController *)self photo];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke;
    v22[3] = &unk_1E5F2DA80;
    uint32_t v17 = &v23;
    id v23 = v5;
    objc_msgSend(v18, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v19, 0, v12, v22, v8, v10);

    goto LABEL_10;
  }
  if (pluginWorkImageVersion == 2)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F8AA60]);
    id v15 = [(PUPhotoEditViewController *)self editSource];
    id v12 = (id)[v14 initWithEditSource:v15];

    int v16 = [(PUPhotoEditViewController *)self compositionController];
    [v12 setCompositionController:v16];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke_2;
    v20[3] = &unk_1E5F29470;
    uint32_t v17 = &v21;
    id v21 = v5;
    objc_msgSend(v12, "renderImageWithTargetSize:contentMode:name:completion:", 0, @"PUPhotoEditViewController-pluginPreviewAdjusted", v20, v8, v10);
LABEL_10:
  }
}

uint64_t __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__PUPhotoEditViewController_editPluginSession_loadDisplaySizeImageWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadPlaceholderImageWithHandler:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  objc_msgSend(v6, "pu_workImageSize");
  double v8 = v7;
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F8AA60]);
  id v12 = [(PUPhotoEditViewController *)self editSource];
  uint64_t v13 = (void *)[v11 initWithEditSource:v12];

  id v14 = [(PUPhotoEditViewController *)self compositionController];
  [v13 setCompositionController:v14];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PUPhotoEditViewController_editPluginSession_loadPlaceholderImageWithHandler___block_invoke;
  v16[3] = &unk_1E5F29470;
  id v17 = v5;
  id v15 = v5;
  objc_msgSend(v13, "renderImageWithTargetSize:contentMode:name:completion:", 0, @"PUPhotoEditViewController-pluginPreview", v16, v8, v10);
}

void __79__PUPhotoEditViewController_editPluginSession_loadPlaceholderImageWithHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)editPluginSession:(id)a3 loadAdjustmentDataWithHandler:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v6 = [(PUPhotoEditViewController *)self compositionController];
  double v7 = [(PUPhotoEditViewController *)self uneditedComposition];
  if (v6 && ([v6 isEqual:v7 visualChangesOnly:1] & 1) == 0)
  {
    self->_pluginWorkImageVersionIsValid = 1;
    self->_unint64_t pluginWorkImageVersion = 2;
    v5[2](v5, 0);
  }
  else
  {
    self->_pluginWorkImageVersionIsValid = 0;
    id v8 = objc_alloc_init(MEMORY[0x1E4F390D8]);
    [v8 setVersion:16];
    double v9 = [(PUPhotoEditViewController *)self mediaProvider];
    double v10 = [(PUPhotoEditViewController *)self photo];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__PUPhotoEditViewController_editPluginSession_loadAdjustmentDataWithHandler___block_invoke;
    v11[3] = &unk_1E5F2DA80;
    id v12 = v5;
    objc_msgSend(v9, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v8, v11, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
}

void __77__PUPhotoEditViewController_editPluginSession_loadAdjustmentDataWithHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F39360]];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditViewController *)self setCancelConfirmationAlert:0];
  [(PUPhotoEditViewController *)self setRevertConfirmationAlert:0];
  [(PUPhotoEditViewController *)self setJpegPreviewForRawConfirmationAlert:0];
  [(PUPhotoEditViewController *)self setIrisRevertConfirmationAlert:0];
  [v4 setDelegate:0];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v10 = a3;
  id v4 = [v10 presentedViewController];
  id v5 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];
  if (v4 == v5)
  {
    cancelButton = self->_cancelButton;

    if (cancelButton)
    {
      [v10 setSourceView:self->_cancelButton];
      [(PUPhotoEditNotchButton *)self->_cancelButton bounds];
      objc_msgSend(v10, "setSourceRect:");
    }
  }
  else
  {
  }
  double v7 = [v10 presentedViewController];
  id v8 = [(PUPhotoEditViewController *)self revertConfirmationAlert];
  if (v7 == v8)
  {
    mainActionButton = self->_mainActionButton;

    if (mainActionButton)
    {
      [v10 setSourceView:self->_mainActionButton];
      [(PUPhotoEditNotchButton *)self->_mainActionButton bounds];
      objc_msgSend(v10, "setSourceRect:");
    }
  }
  else
  {
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return 0;
}

- (void)_removePlaceholderImageViewIfNeeded
{
  placeholderImageView = self->_placeholderImageView;
  if (placeholderImageView)
  {
    if (!self->_placeholderImageViewTransitioningOut)
    {
      id v4 = placeholderImageView;
      self->_placeholderImageViewTransitioningOut = 1;
      id v5 = (void *)MEMORY[0x1E4FB1EB0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke;
      v10[3] = &unk_1E5F2ED10;
      id v11 = v4;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke_2;
      v7[3] = &unk_1E5F2E1C0;
      id v8 = v11;
      double v9 = self;
      id v6 = v11;
      [v5 animateWithDuration:v10 animations:v7 completion:0.5];
    }
  }
}

uint64_t __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __64__PUPhotoEditViewController__removePlaceholderImageViewIfNeeded__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:*(void *)(*(void *)(a1 + 40) + 1080)];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 1432);
  *(void *)(v2 + 1432) = 0;

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(v4 + 1080);
  *(void *)(v4 + 1080) = 0;

  *(unsigned char *)(*(void *)(a1 + 40) + 1440) = 0;
  id v6 = objc_msgSend(*(id *)(a1 + 40), "px_imageModulationManager");
  double v7 = [*(id *)(a1 + 40) placeholderImageLayerModulator];
  [v6 checkInImageLayerModulator:v7];

  id v8 = [*(id *)(a1 + 40) initialPendingEditsRequest];
  id v21 = v8;
  if (v8)
  {
    [*(id *)(a1 + 40) fulfillPendingEditsRequest:v8];
    id v8 = v21;
  }
  if (*(void *)(*(void *)(a1 + 40) + 1000) == *(void *)(*(void *)(a1 + 40) + 1616))
  {
    double v9 = (void *)MEMORY[0x1E4F901C0];
    id v10 = [MEMORY[0x1E4F901C0] stylesSetupTipID];
    if ([v9 isTipValid:v10])
    {
      id v11 = [*(id *)(a1 + 40) photo];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = PFDeviceSupportsSmartStyles();

        id v8 = v21;
        if (!v12) {
          goto LABEL_12;
        }
        if (PFUserHasSetSmartStyle())
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F901C0];
          id v10 = [MEMORY[0x1E4F901C0] stylesSetupTipID];
          [v13 setTipActionPerformed:v10];
        }
        else
        {
          id v10 = [*(id *)(a1 + 40) photo];
          id v14 = (void *)MEMORY[0x1E4F911C0];
          id v15 = [v10 photoLibrary];
          uint64_t v16 = [v14 photoLibraryIsEligibleForStylesSetupTip:v15];

          id v17 = (void *)MEMORY[0x1E4F901C0];
          id v18 = [MEMORY[0x1E4F901C0] stylesSetupTipID];
          [v17 setTip:v18 isPresentable:v16];
        }
      }
      else
      {
      }
    }

    id v8 = v21;
  }
LABEL_12:
  if (*(void *)(*(void *)(a1 + 40) + 1584))
  {
    BOOL v19 = (void *)MEMORY[0x1E4F901C0];
    int v20 = [MEMORY[0x1E4F901C0] cleanUpTipID];
    [v19 setTip:v20 isPresentable:1];

    id v8 = v21;
  }
}

- (void)_handleMediaViewReady:(id)a3 statistics:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _geometry];

  if (v8)
  {
    double v9 = [v6 _geometry];
    [v9 size];
    NUPixelSizeToCGSize();
    -[PUPhotoEditViewController setLastKnownPreviewImageSize:](self, "setLastKnownPreviewImageSize:");
  }
  int v10 = [(id)*MEMORY[0x1E4FB2608] isRunningTest];
  if (v7 && v10)
  {
    [(_PPTState *)self->_pptState setHasRendered:1];
    [(PUPhotoEditViewController *)self _ppt_conditionallyExecuteAfterRender];
    id v11 = [(_PPTState *)self->_pptState renderStatistics];
    [v11 addObject:v7];
  }
  [(PUPhotoEditViewController *)self _updateVideoScrubber];
  if ([(NUMediaView *)self->_mediaView loopsVideoPlayback]
    && ![(PUPhotoEditToolController *)self->_currentEditingTool handlesVideoPlaying])
  {
    [(NUMediaView *)self->_mediaView _startVideoPlayback];
  }
  objc_initWeak(&location, self);
  dispatch_time_t v12 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PUPhotoEditViewController__handleMediaViewReady_statistics___block_invoke;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v22, &location);
  dispatch_after(v12, MEMORY[0x1E4F14428], block);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v13 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v16++) mediaViewIsReady];
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v17 objects:v24 count:16];
    }
    while (v14);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __62__PUPhotoEditViewController__handleMediaViewReady_statistics___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removePlaceholderImageViewIfNeeded];
}

- (void)mediaViewDidEndLivePhotoPlayback:(id)a3
{
  self->_livePhotoIsPlaying = 0;
  [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  id v5 = (void (**)(void))_Block_copy(self->_ppt_didEndPlaybackBlock);
  if (v5)
  {
    id ppt_didEndPlaybackBlock = self->_ppt_didEndPlaybackBlock;
    self->_id ppt_didEndPlaybackBlock = 0;

    v5[2]();
  }
}

- (void)mediaViewWillBeginLivePhotoPlayback:(id)a3
{
  self->_livePhotoIsPlaying = 1;
  [(PUPhotoEditViewController *)self setShouldBePreviewingOriginal:0];
  [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  id v5 = (void (**)(void))_Block_copy(self->_ppt_willBeginPlaybackBlock);
  if (v5)
  {
    id ppt_willBeginPlaybackBlock = self->_ppt_willBeginPlaybackBlock;
    self->_id ppt_willBeginPlaybackBlock = 0;

    v5[2]();
  }
}

- (void)mediaViewDidFinishPreparingVideo:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditViewController *)self setIsCachingVideo:0];
  [(PUPhotoEditMediaToolController *)self->_mediaToolController videoRenderingChanged];
  id v5 = PLPhotoEditGetLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  id v7 = PLPhotoEditGetLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_END, v6, "CachingVideo", "", v9, 2u);
  }
}

- (void)mediaViewDidStartPreparingVideo:(id)a3
{
  id v4 = a3;
  id v5 = PLPhotoEditGetLog();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v4);

  id v7 = PLPhotoEditGetLog();
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)double v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "CachingVideo", "", v9, 2u);
  }

  if (![(PUPhotoEditToolController *)self->_currentEditingTool isActivelyAdjusting]) {
    [(PUPhotoEditViewController *)self setIsCachingVideo:1];
  }
}

- (void)mediaViewDidPlayToEnd:(id)a3
{
  if (self->_currentTool == &self->_audioToolController->super.super)
  {
    id v4 = [(PUPhotoEditViewController *)self mediaView];
    id v5 = [v4 player];
    long long v8 = *MEMORY[0x1E4F1FA48];
    uint64_t v9 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [v5 seekToTime:&v8 exact:1];

    os_signpost_id_t v6 = [(PUPhotoEditViewController *)self mediaView];
    id v7 = [v6 player];
    [v7 play];
  }
}

- (void)mediaViewIsReadyForVideoPlayback:(id)a3
{
  [(PUPhotoEditViewController *)self _handleMediaViewReady:a3 statistics:0];
  memset(&v10[1], 0, sizeof(CMTime));
  [(PUPhotoEditViewController *)self initialSeekTime];
  if ((unsigned __int128)0 >> 96 && [(PUPhotoEditViewController *)self isStandardVideo])
  {
    id v4 = [(PUPhotoEditViewController *)self compositionController];
    id v5 = [v4 trimAdjustmentController];

    memset(v10, 0, 24);
    if (v5)
    {
      [v5 startTime];
      if (v10[0].flags)
      {
        CMTime lhs = v10[1];
        CMTime v7 = v10[0];
        CMTimeAdd(&v9, &lhs, &v7);
        v10[1] = v9;
      }
    }
    os_signpost_id_t v6 = [(PUPhotoEditMediaToolController *)self->_mediaToolController trimController];
    CMTime v9 = v10[1];
    [v6 setPlayheadTime:&v9 forceSeek:1];

    CMTime v9 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    [(PUPhotoEditViewController *)self setInitialSeekTime:&v9];
  }
}

- (void)mediaViewDidUpdateLivePhoto:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = [(NUMediaView *)self->_mediaView _livePhotoView];
  if ([v4 overridePhoto])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:", objc_msgSend(v4, "overridePhoto"));
  }
  else
  {
    os_signpost_id_t v6 = [v4 livePhoto];
    id v5 = [v6 image];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CMTime v7 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setPlaceholderImage:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(PUPhotoEditMediaToolController *)self->_mediaToolController videoRenderingChanged];
}

- (void)mediaViewDidFinishRendering:(id)a3 withStatistics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUPhotoEditViewController *)self videoScrubberView];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    [(PUPhotoEditViewController *)self lastKnownMediaViewImageFrame];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v6 imageFrame];
    v27.origin.double x = v18;
    v27.origin.double y = v19;
    v27.size.double width = v20;
    v27.size.double height = v21;
    v26.origin.double x = v11;
    v26.origin.double y = v13;
    v26.size.double width = v15;
    v26.size.double height = v17;
    BOOL v22 = CGRectEqualToRect(v26, v27);

    if (!v22)
    {
      id v23 = [(PUPhotoEditViewController *)self view];
      [v23 setNeedsLayout];
    }
  }
  [v6 imageFrame];
  -[PUPhotoEditViewController setLastKnownMediaViewImageFrame:](self, "setLastKnownMediaViewImageFrame:");
  if ([(PUPhotoEditViewController *)self shouldBePreviewingOriginal]
    && [(PUPhotoEditViewController *)self _isPreviewingOriginal]
    && ![(PUPhotoEditViewController *)self showOriginalCausedSizeChange])
  {
    [(PUPhotoEditViewController *)self _startShowingOriginalBadge];
  }
  if ([(PUPhotoEditViewController *)self _isInEditRevertTransitionSnapshotVisible])
  {
    dispatch_time_t v24 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__PUPhotoEditViewController_mediaViewDidFinishRendering_withStatistics___block_invoke;
    block[3] = &unk_1E5F2ED10;
    void block[4] = self;
    dispatch_after(v24, MEMORY[0x1E4F14428], block);
  }
  if (([(NUMediaView *)self->_mediaView loopsVideoPlayback] & 1) != 0
    || [(PUPhotoEditViewController *)self isStandardVideo])
  {
    [(PUPhotoEditMediaToolController *)self->_mediaToolController videoRenderingChanged];
  }
  else
  {
    [(PUPhotoEditViewController *)self _handleMediaViewReady:v6 statistics:v7];
    [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
    [(PUPhotoEditViewController *)self _updateKeyCommands];
  }
}

uint64_t __72__PUPhotoEditViewController_mediaViewDidFinishRendering_withStatistics___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isInEditRevertTransitionSnapshotVisible];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _uninstallInEditRevertTransitionSnapshotAnimated:1];
  }
  return result;
}

- (void)mediaViewDidScroll:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUPhotoEditViewController *)self _updateForcingDarkUserInterfaceStyleForZoomIfNeeded];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) mediaViewDidScroll:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
}

- (void)mediaViewDidEndDecelerating:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) mediaViewDidEndDecelerating:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)mediaViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  self->_isImageZooming = 0;
  [(PUPhotoEditViewController *)self _updateForcingDarkUserInterfaceStyleForZoomIfNeeded];
  uint64_t v7 = [(PUPhotoEditViewController *)self videoScrubberView];
  uint64_t v8 = [v7 superview];

  if (v8)
  {
    uint64_t v9 = [(PUPhotoEditViewController *)self view];
    [v9 setNeedsLayout];
  }
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:1];
  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v10 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) mediaViewDidEndDragging:v6 willDecelerate:v4];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  if (![(PUPhotoEditToolController *)self->_currentEditingTool isPerformingLiveInteraction])
  {
    [(PUPhotoEditViewController *)self _cancelPendingFocusViewForInteractionWithDelay];
    [(PUPhotoEditViewController *)self setFocusingViewForInteraction:0];
  }
}

- (void)mediaViewWillBeginDragging:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isImageZooming = 1;
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:0];
  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) mediaViewWillBeginDragging:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(PUPhotoEditViewController *)self _setTransientStatusBadgeVisible:0];
  [(PUPhotoEditViewController *)self _focusViewForInteractionWithDelay];
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) mediaView:v6 didZoom:a4];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(PUPhotoEditViewController *)self _updateForcingDarkUserInterfaceStyleForZoomIfNeeded];
  [(PUPhotoEditViewController *)self _updateZoomButton];
  [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
}

- (void)mediaViewDidEndZooming:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isImageZooming = 0;
  id v5 = [(PUPhotoEditViewController *)self videoScrubberView];
  id v6 = [v5 superview];

  if (v6)
  {
    uint64_t v7 = [(PUPhotoEditViewController *)self view];
    [v7 setNeedsLayout];
  }
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:1];
  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) mediaViewDidEndZooming:v4];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  [(PUPhotoEditViewController *)self _updateForcingDarkUserInterfaceStyleForZoomIfNeeded];
  if (![(PUPhotoEditToolController *)self->_currentEditingTool isPerformingLiveInteraction])
  {
    [(PUPhotoEditViewController *)self _cancelPendingFocusViewForInteractionWithDelay];
    [(PUPhotoEditViewController *)self setFocusingViewForInteraction:0];
  }
}

- (void)mediaViewWillBeginZooming:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_isImageZooming = 1;
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:0];
  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) mediaViewWillBeginZooming:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(PUPhotoEditViewController *)self _setTransientStatusBadgeVisible:0];
  [(PUPhotoEditViewController *)self _focusViewForInteractionWithDelay];
}

- (void)_addCropToolGainMapWithRequest:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke;
  v3[3] = &unk_1E5F2E470;
  void v3[4] = self;
  [a3 submit:v3];
}

void __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v9 = 0;
  id v3 = [a2 result:&v9];
  id v4 = v9;
  if (v3)
  {
    id v5 = [v3 auxiliaryImage];
    uint64_t v6 = [v5 cgImageRef];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke_2;
    block[3] = &unk_1E5F2E0A8;
    void block[4] = *(void *)(a1 + 32);
    void block[5] = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
    }
    uint64_t v7 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_error_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
  }
}

void __60__PUPhotoEditViewController__addCropToolGainMapWithRequest___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1568) setGainMapImage:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1568), "setGainMapValue:");
  uint64_t v2 = *(CGImage **)(a1 + 40);
  CGImageRelease(v2);
}

- (void)addCropToolGainMapIfNeeded
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoEditViewController *)self currentAssetNeedsGainMap])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F7A380]);
    id v4 = [(PUPhotoEditViewController *)self compositionController];
    id v5 = [v4 composition];
    uint64_t v6 = (void *)[v3 initWithComposition:v5];

    [v6 setAuxiliaryImageType:7];
    uint64_t v7 = [MEMORY[0x1E4F8A360] sourceFilterNoOrientation];
    v9[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v6 setPipelineFilters:v8];

    [v6 setName:@"PUPhotoEditViewController-renderMeteorPlusGainMap-crop"];
    [(PUPhotoEditViewController *)self _addCropToolGainMapWithRequest:v6];
  }
}

- (void)removeCropToolGainMap
{
  [(PUCropToolController *)self->_cropController setGainMapImage:0];
  cropController = self->_cropController;
  [(PUCropToolController *)cropController setGainMapValue:0.0];
}

- (id)imageProperties
{
  return self->_imageProperties;
}

- (BOOL)isImageZooming
{
  return self->_isImageZooming;
}

- (void)dismissLivePhotoRevertConfirmationAlert
{
  id v3 = [(PUPhotoEditViewController *)self irisRevertConfirmationAlert];

  if (v3)
  {
    [(PUPhotoEditViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)showsLabelsForToolButtons
{
  uint64_t v2 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v3 = [v2 currentLayoutStyle];

  if (v3 == 1) {
    return 0;
  }
  id v5 = PULocalizedString(@"PHOTOEDIT_ADJUSTMENTS_TOOL_BUTTON");
  BOOL v4 = [v5 length] != 0;

  return v4;
}

- (id)fontForButtons
{
  uint64_t v3 = +[PUInterfaceManager currentTheme];
  if ([(PUPhotoEditViewController *)self _actionButtonsGoInTopToolbar]) {
    [v3 photoEditingToolbarButtonCompactFont];
  }
  else {
  BOOL v4 = [v3 photoEditingToolbarButtonNormalFont];
  }

  return v4;
}

- (id)currentTool
{
  return self->_currentTool;
}

- (id)secondaryToolbar
{
  return self->_secondaryToolbar;
}

- (id)mediaView
{
  return self->_mediaView;
}

- (void)toolControllerWantsSecondaryToolbarShadow:(id)a3 alpha:(double)a4
{
  -[PUPhotoEditViewController setSecondaryToolbarShadowAlphaOverride:](self, "setSecondaryToolbarShadowAlphaOverride:", a3, a4);
  [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
}

- (void)toolController:(id)a3 didChangeIsScrolling:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(PUPhotoEditViewController *)self currentToolControllerIsScrolling] != a4)
  {
    [(PUPhotoEditViewController *)self setCurrentToolControllerIsScrolling:v4];
    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __65__PUPhotoEditViewController_toolController_didChangeIsScrolling___block_invoke;
    v6[3] = &unk_1E5F2E0A8;
    v6[4] = self;
    *(double *)&void v6[5] = (double)(v4 ^ 1);
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.2];
  }
}

uint64_t __65__PUPhotoEditViewController_toolController_didChangeIsScrolling___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1152) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 1192);
  return [v3 setAlpha:v2];
}

- (id)toolControllerHitEventForwardView:(id)a3
{
  uint64_t v3 = [(PUPhotoEditViewController *)self mediaView];
  BOOL v4 = [v3 _scrollView];

  return v4;
}

- (CGPoint)toolController:(id)a3 viewPointFromOriginalPoint:(CGPoint)a4 view:(id)a5
{
  [(NUMediaView *)self->_mediaView convertPoint:@"/masterSpace", a5, a4.x, a4.y fromSpace toView];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)toolController:(id)a3 originalPointFromViewPoint:(CGPoint)a4 view:(id)a5
{
  [(NUMediaView *)self->_mediaView convertPoint:a5, @"/masterSpace", a4.x, a4.y fromView toSpace];
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (void)toolController:(id)a3 showVideoScrubber:(BOOL)a4 animated:(BOOL)a5
{
  self->_toolControllerWantsScrubber = a4;
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:a5];
}

- (void)toolControllerDidFinish:(id)a3
{
}

- (unint64_t)toolControllerSourceAssetType:(id)a3
{
  unint64_t v4 = [(PUPhotoEditViewController *)self hasLoadedRaw];
  if ([(PUPhotoEditViewController *)self isStandardVideo]) {
    return v4 | 2;
  }
  else {
    return v4;
  }
}

- (CGSize)toolControllerOriginalImageSize:(id)a3
{
  uint64_t v3 = [(PUPhotoEditViewController *)self compositionController];
  [MEMORY[0x1E4F8A748] synchronousInputSizeForCompositionController:v3];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)toolControllerOriginalOrientedImageSize:(id)a3
{
  [(PUPhotoEditViewController *)self toolControllerOriginalImageSize:a3];
  double v4 = [(PUPhotoEditViewController *)self compositionController];
  [v4 imageOrientation];
  PLOrientationTransformImageSize();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (id)toolControllerLivePhoto:(id)a3
{
  double v4 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  int v5 = [v4 isVideoEnabled];

  if (v5)
  {
    double v6 = [(NUMediaView *)self->_mediaView _livePhotoView];
    double v7 = [v6 livePhoto];
  }
  else
  {
    double v7 = 0;
  }
  return v7;
}

- (id)toolControllerPreviewView:(id)a3
{
  return self->_mediaView;
}

- ($5A0616AB7869379E861635CACF312FD6)toolControllerImageModulationOptions:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F902A0];
  double v4 = [(PUPhotoEditViewController *)self photo];
  uint64_t v5 = [v3 optionsForAsset:v4];
  uint64_t v7 = v6;

  int64_t v8 = v5;
  uint64_t v9 = v7;
  result.var1 = *(float *)&v9;
  result.var0 = v8;
  return result;
}

- (id)toolControllerOriginalCompositionController:(id)a3
{
  double v4 = [(PUPhotoEditViewController *)self originalComposition];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F8A358];
    uint64_t v6 = [(PUPhotoEditViewController *)self originalComposition];
    uint64_t v7 = (void *)[v5 newCompositionControllerWithComposition:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)toolControllerUneditedCompositionController:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F8A358];
  double v4 = [(PUPhotoEditViewController *)self uneditedComposition];
  uint64_t v5 = (void *)[v3 newCompositionControllerWithComposition:v4];

  return v5;
}

- (void)toolControllerDidUpdateToolbar:(id)a3
{
  if (self->_currentEditingTool == a3) {
    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
  }
}

- (void)toolControllerWantsGestureRecognizerUpdate:(id)a3
{
  [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  [(PUPhotoEditViewController *)self _updateLivePhotoPlaybackGestureRecognizer];
  [(PUPhotoEditViewController *)self _updateSwipeDownGestureRecognizer];
}

- (void)toolControllerDidChangeWantsTapToToggleOriginalEnabled:(id)a3 enabled:(BOOL)a4
{
}

- (void)toolControllerDidChangeWantsDefaultPreviewView:(id)a3
{
}

- (void)toolController:(id)a3 didChangePreferredPreviewViewInsetsAnimated:(BOOL)a4
{
  if (!self->_switchingToolsAnimated && a4)
  {
    uint64_t v6 = [(PUPhotoEditViewController *)self view];
    [v6 layoutIfNeeded];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __88__PUPhotoEditViewController_toolController_didChangePreferredPreviewViewInsetsAnimated___block_invoke;
    v7[3] = &unk_1E5F2ED10;
    void v7[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:0 animations:v7 completion:&__block_literal_global_927];
  }
}

void __88__PUPhotoEditViewController_toolController_didChangePreferredPreviewViewInsetsAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)toolControllerDidChangeIsPerformingLiveInteraction:(id)a3
{
  if ([a3 isPerformingLiveInteraction])
  {
    [(PUPhotoEditViewController *)self _focusViewForInteractionWithDelay];
  }
  else
  {
    [(PUPhotoEditViewController *)self _cancelPendingFocusViewForInteractionWithDelay];
    [(PUPhotoEditViewController *)self setFocusingViewForInteraction:0];
  }
}

- (void)toolControllerDidChangeIsActivelyAdjusting:(id)a3
{
  [(PUPhotoEditViewController *)self _updateModelDependentControlsAnimated:1];
  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
}

- (void)toolController:(id)a3 updateModelDependentControlsAnimated:(BOOL)a4
{
}

- (void)toolControllerDidFinishLoadingThumbnails:(id)a3
{
}

- (void)mediaTimelineControlViewDidEndChanging:(id)a3
{
  [(PUPhotoEditViewController *)self setIsScrubbingVideo:0];
  if ([(PUPhotoEditViewController *)self wasPlayingBeforeBeginningToScrubVideo])
  {
    double v4 = +[PUPhotoEditProtoSettings sharedInstance];
    int v5 = [v4 pauseAfterMovingPlayhead];

    if (v5)
    {
      uint64_t v6 = [(PUPhotoEditViewController *)self playPauseButton];
      uint64_t v7 = v6;
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v9 = [(PUPhotoEditViewController *)self mediaView];
      double v10 = [v9 player];
      [v10 play];

      uint64_t v6 = [(PUPhotoEditViewController *)self playPauseButton];
      uint64_t v7 = v6;
      uint64_t v8 = 1;
    }
    [v6 setSelected:v8];
  }
  [(PUPhotoEditViewController *)self _cancelPendingFocusViewForInteractionWithDelay];
  [(PUPhotoEditViewController *)self setFocusingViewForInteraction:0];
}

- (void)mediaTimelineControlViewDidChangeValue:(id)a3
{
  id v4 = a3;
  int v5 = [(PUPhotoEditViewController *)self mediaView];
  uint64_t v6 = [v5 player];

  if (!v6)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
LABEL_5:
    int32_t v7 = 600;
    goto LABEL_6;
  }
  [v6 currentTime];
  int32_t v7 = v17;
  if (!v17) {
    goto LABEL_5;
  }
LABEL_6:
  memset(&v15, 0, sizeof(v15));
  [v4 currentValue];
  CMTimeMakeWithSeconds(&v15, v8, v7);
  memset(&v14, 0, sizeof(v14));
  [v4 minValue];
  float v10 = v9;

  CMTimeMakeWithSeconds(&v14, v10, v7);
  if (v15.flags & 1) != 0 && (v14.flags)
  {
    memset(&v13, 0, sizeof(v13));
    CMTime lhs = v15;
    CMTime v11 = v14;
    CMTimeSubtract(&v13, &lhs, &v11);
    CMTime lhs = v13;
    [v6 seekToTime:&lhs exact:0];
  }
}

- (void)mediaTimelineControlViewWillBeginChanging:(id)a3
{
  [(PUPhotoEditViewController *)self setIsScrubbingVideo:1];
  id v4 = [(PUPhotoEditViewController *)self mediaView];
  id v6 = [v4 player];

  [v6 playbackRate];
  [(PUPhotoEditViewController *)self setWasPlayingBeforeBeginningToScrubVideo:v5 == 1.0];
  [v6 pause];
  [(PUPhotoEditViewController *)self _focusViewForInteractionWithDelay];
}

- (void)_updateVideoScrubberDisplayAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(PUPhotoEditViewController *)self videoScrubberView];

  if (!v5) {
    return;
  }
  double v6 = 0.0;
  if (!self->_toolControllerWantsScrubber
    || self->_isAnimatingLayoutOrientation
    || self->_isAnimatingMediaViewInsets
    || self->_isImageZooming)
  {
    char v7 = 0;
    int v8 = 0;
  }
  else
  {
    if (![(PUPhotoEditViewController *)self isFocusingViewForInteraction]
      || [(PUPhotoEditViewController *)self isScrubbingVideo])
    {
      double v9 = 1.0;
      char v7 = 1;
      int v8 = 1;
      goto LABEL_8;
    }
    char v7 = 0;
    int v8 = 1;
  }
  double v9 = 0.0;
LABEL_8:
  float v10 = [(PUPhotoEditViewController *)self videoScrubberView];
  [v10 alpha];
  double v12 = v11;
  BOOL v13 = v9 != v11;

  if (v8)
  {
    if ([(PUPhotoEditViewController *)self isFocusingViewForInteraction]) {
      double v6 = 0.0;
    }
    else {
      double v6 = 1.0;
    }
  }
  CMTime v14 = [(PUPhotoEditViewController *)self playPauseButton];
  [v14 alpha];
  double v16 = v15;

  if (v6 != v16 || v9 != v12)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke;
    aBlock[3] = &unk_1E5F2E120;
    char v24 = v7;
    void aBlock[4] = self;
    uint64_t v17 = (void (**)(void))_Block_copy(aBlock);
    if (v3)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke_2;
      v20[3] = &unk_1E5F29448;
      BOOL v21 = v13;
      void v20[4] = self;
      BOOL v22 = v6 != v16;
      *(double *)&v20[5] = v9;
      *(double *)&v20[6] = v6;
      [MEMORY[0x1E4FB1EB0] _animateWithDuration:4 delay:v20 options:v17 animations:0 start:0.25 completion:0.3];
    }
    else
    {
      if (v9 != v12)
      {
        uint64_t v18 = [(PUPhotoEditViewController *)self videoScrubberView];
        [v18 setAlpha:v9];
      }
      if (v6 != v16)
      {
        CGFloat v19 = [(PUPhotoEditViewController *)self playPauseButton];
        [v19 setAlpha:v6];
      }
      v17[2](v17);
    }
  }
}

void __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(a1 + 32) view];
    [v1 setNeedsLayout];
  }
}

void __64__PUPhotoEditViewController__updateVideoScrubberDisplayAnimate___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    double v2 = *(double *)(a1 + 40);
    BOOL v3 = [*(id *)(a1 + 32) videoScrubberView];
    [v3 setAlpha:v2];
  }
  if (*(unsigned char *)(a1 + 57))
  {
    double v4 = *(double *)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) playPauseButton];
    [v5 setAlpha:v4];
  }
}

- (void)_updateVideoScrubber
{
  uint64_t v3 = [(PUPhotoEditViewController *)self videoScrubberView];
  if (!v3) {
    return;
  }
  double v4 = (void *)v3;
  BOOL v5 = [(PUPhotoEditViewController *)self isScrubbingVideo];

  if (v5) {
    return;
  }
  double v6 = [(PUPhotoEditViewController *)self mediaView];
  memset(&v34, 0, sizeof(v34));
  char v7 = [v6 player];
  int v8 = v7;
  if (v7) {
    [v7 mediaDuration];
  }
  else {
    memset(&v34, 0, sizeof(v34));
  }

  memset(&v33, 0, sizeof(v33));
  CMTimeMake(&v33, 0, v34.timescale);
  memset(&v32, 0, sizeof(v32));
  double v9 = [v6 player];
  float v10 = v9;
  if (v9) {
    [v9 currentTime];
  }
  else {
    memset(&v32, 0, sizeof(v32));
  }

  double v11 = [(PUPhotoEditViewController *)self compositionController];
  double v12 = [v11 trimAdjustmentController];

  if (v12)
  {
    [v12 startTime];
    if (v31)
    {
      [v12 endTime];
      if (v30)
      {
        [v12 startTime];
        CMTime v33 = time;
        [v12 endTime];
        CMTime v34 = time;
        currentEditingTool = self->_currentEditingTool;
        if (currentEditingTool)
        {
          CMTime lhs = v33;
          [(PUPhotoEditToolController *)currentEditingTool displayedTimeForOriginalAssetTime:&lhs];
          CMTime v14 = self->_currentEditingTool;
          CMTime v33 = time;
          if (v14)
          {
            CMTime lhs = v34;
            [(PUPhotoEditToolController *)v14 displayedTimeForOriginalAssetTime:&lhs];
LABEL_17:
            CMTime v34 = time;
            goto LABEL_18;
          }
        }
        else
        {
          memset(&v33, 0, sizeof(v33));
        }
        memset(&time, 0, sizeof(time));
        goto LABEL_17;
      }
    }
  }
LABEL_18:
  if (v33.flags & 1) != 0 && (v34.flags & 1) != 0 && (v32.flags)
  {
    CMTime lhs = v33;
    CMTime v27 = v32;
    CMTimeAdd(&time, &lhs, &v27);
    CMTime v32 = time;
    CMTime time = v33;
    float Seconds = CMTimeGetSeconds(&time);
    double v16 = [(PUPhotoEditViewController *)self videoScrubberView];
    *(float *)&double v17 = Seconds;
    [v16 setMinValue:v17];

    CMTime time = v34;
    float v18 = CMTimeGetSeconds(&time);
    CGFloat v19 = [(PUPhotoEditViewController *)self videoScrubberView];
    *(float *)&double v20 = v18;
    [v19 setMaxValue:v20];

    CMTime time = v32;
    float v21 = CMTimeGetSeconds(&time);
    BOOL v22 = [(PUPhotoEditViewController *)self videoScrubberView];
    *(float *)&double v23 = v21;
    [v22 setCurrentValue:v23];

    char v24 = [v6 player];
    if ([v24 playbackState] == 3)
    {
      CMTime time = v32;
      CMTime lhs = v34;
      BOOL v25 = CMTimeCompare(&time, &lhs) != 0;
    }
    else
    {
      BOOL v25 = 0;
    }

    CGRect v26 = [(PUPhotoEditViewController *)self playPauseButton];
    [v26 setSelected:v25];
  }
}

- (void)_createVideoScrubberIfNeeded
{
  uint64_t v3 = [(PUPhotoEditViewController *)self videoScrubberView];
  if (v3)
  {
  }
  else if ([(PUPhotoEditViewController *)self isStandardVideo])
  {
    double v4 = objc_alloc_init(PUAVKitMediaTimelineView);
    videoScrubberView = self->_videoScrubberView;
    self->_videoScrubberView = v4;

    double v6 = [(PUPhotoEditViewController *)self photo];
    int v7 = [v6 mediaSubtypes];

    double v8 = 4.0;
    if ((*(void *)&v7 & 0x100000) == 0) {
      double v8 = 1.0;
    }
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setWhiteValue:v8];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setOverrideUserInterfaceStyle:2];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setShowsTimeLabels:1];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setPlaying:1];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setAlpha:0.0];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView setDelegate:self];
    double v9 = [(PUPhotoEditViewController *)self view];
    [v9 insertSubview:self->_videoScrubberView aboveSubview:self->_mediaView];

    if (!self->_videoScrubberTimeObserver)
    {
      objc_initWeak(&location, self);
      float v10 = [(NUMediaView *)self->_mediaView player];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke;
      v23[3] = &unk_1E5F29420;
      objc_copyWeak(&v24, &location);
      double v11 = [v10 addPlaybackTimeObserver:v23];
      id videoScrubberTimeObserver = self->_videoScrubberTimeObserver;
      self->_id videoScrubberTimeObserver = v11;

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    BOOL v13 = +[PUPhotoEditSupport createPlayPauseButton];
    playPauseButton = self->_playPauseButton;
    self->_playPauseButton = v13;

    objc_initWeak(&location, self);
    double v15 = self->_playPauseButton;
    double v16 = (void *)MEMORY[0x1E4FB13F0];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke_2;
    v21[3] = &unk_1E5F2E7A8;
    objc_copyWeak(&v22, &location);
    double v17 = [v16 actionWithHandler:v21];
    [(UIButton *)v15 addAction:v17 forControlEvents:64];

    float v18 = (void *)MEMORY[0x1E4FB1618];
    [(PUAVKitMediaTimelineView *)self->_videoScrubberView whiteValue];
    CGFloat v19 = objc_msgSend(v18, "colorWithWhite:alpha:");
    [(UIButton *)self->_playPauseButton setTintColor:v19];

    double v20 = [(PUPhotoEditViewController *)self view];
    [v20 insertSubview:self->_playPauseButton aboveSubview:self->_mediaView];

    [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:1];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

void __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateVideoScrubber];
}

void __57__PUPhotoEditViewController__createVideoScrubberIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained mediaView];
  id v3 = [v2 player];

  if ([v3 playbackState] == 3) {
    [v3 pause];
  }
  else {
    [v3 play];
  }
}

- (void)_teardownCleanupResources
{
  double v2 = [MEMORY[0x1E4F7A448] sharedFactory];
  id v3 = [v2 modelRegistry];

  [v3 unregisterModelForKey:*MEMORY[0x1E4F8A488]];
  [v3 unregisterModelForKey:*MEMORY[0x1E4F8A490]];
}

- (void)_ensureCleanupResourcesWithCompletion:(id)a3
{
  double v4 = (void (**)(void))a3;
  BOOL v5 = [(PUPhotoEditViewController *)self compositionController];
  double v6 = [v5 inpaintAdjustmentController];

  if (v6)
  {
    int v7 = [(PUPhotoEditViewController *)self modelPrepInterval];
    [v7 beginInterval];

    double v8 = PLPhotoEditGetLog();
    double v9 = (char *)os_signpost_id_generate(v8);
    float v10 = v8;
    double v11 = v10;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "PreparingEditModels", " enableTelemetry=YES ", (uint8_t *)buf, 2u);
    }

    double v12 = (void *)[objc_alloc(MEMORY[0x1E4F91158]) initWithPackageType:0];
    objc_initWeak(buf, self);
    if ([v12 isModelAvailable])
    {
      v4[2](v4);
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F90358]);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke;
      void v33[3] = &unk_1E5F2E4E8;
      objc_copyWeak(&v35, buf);
      id v14 = v13;
      id v34 = v14;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_2;
      v30[3] = &unk_1E5F2E4E8;
      objc_copyWeak(&v32, buf);
      id v15 = v14;
      id v31 = v15;
      [v15 createViewsWithCancelBlock:v33 revertBlock:v30];
      double v16 = [v15 view];
      [v15 setModalPresentationStyle:6];
      [v15 setModalPresentationCapturesStatusBarAppearance:1];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_3;
      v27[3] = &unk_1E5F2ECC8;
      id v17 = v16;
      id v28 = v17;
      uint64_t v29 = self;
      [(PUPhotoEditViewController *)self presentViewController:v15 animated:0 completion:v27];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_4;
      v25[3] = &unk_1E5F293D0;
      id v18 = v15;
      id v26 = v18;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_5;
      v20[3] = &unk_1E5F293F8;
      objc_copyWeak(v24, buf);
      float v21 = v11;
      v24[1] = v9;
      id v19 = v18;
      id v22 = v19;
      double v23 = v4;
      [v12 preparePackageWithProgress:v25 updateHandler:v20];

      objc_destroyWeak(v24);
      objc_destroyWeak(&v32);

      objc_destroyWeak(&v35);
    }
    objc_destroyWeak(buf);
  }
  else
  {
    v4[2](v4);
  }
}

void __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _didStartExitAction];
    id v3 = [v5 aggregateSession];
    [v3 finishSessionWithEnd:2];

    double v4 = [v5 exitEditEventBuilder];
    [v4 setSessionEndReason:2];

    [v5 _resignCurrentTool];
    [v5 didFinishWithChanges:0];
    [v5 _didEndExitActionWithSessionKeys:0];
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v5;
  }
}

void __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained _didStartExitAction];
    id v3 = [v5 aggregateSession];
    [v3 finishSessionWithEnd:2];

    double v4 = [v5 exitEditEventBuilder];
    [v4 setSessionEndReason:2];

    [v5 _resignCurrentTool];
    [v5 didFinishWithChanges:0];
    [v5 _didEndExitActionWithSessionKeys:0];
    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = v5;
  }
}

void __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) centerXAnchor];
  id v3 = [*(id *)(a1 + 40) view];
  double v4 = [v3 centerXAnchor];
  id v5 = [v2 constraintEqualToAnchor:v4];
  [v5 setActive:1];

  id v9 = [*(id *)(a1 + 32) centerYAnchor];
  double v6 = [*(id *)(a1 + 40) view];
  int v7 = [v6 centerYAnchor];
  double v8 = [v9 constraintEqualToAnchor:v7];
  [v8 setActive:1];
}

uint64_t __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportProgress:stage:", a2);
}

void __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  int v7 = [WeakRetained modelPrepInterval];
  [v7 endInterval];

  double v8 = *(id *)(a1 + 32);
  id v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PreparingEditModels", " enableTelemetry=YES ", buf, 2u);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_923;
  v12[3] = &unk_1E5F29330;
  id v13 = v5;
  id v14 = *(id *)(a1 + 40);
  char v16 = a2;
  id v15 = *(id *)(a1 + 48);
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __67__PUPhotoEditViewController__ensureCleanupResourcesWithCompletion___block_invoke_923(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    double v2 = *(void **)(a1 + 40);
    return objc_msgSend(v2, "setErrorState:");
  }
  else
  {
    double v4 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 56))
    {
      [v4 dismissViewControllerAnimated:1 completion:0];
      id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
      return v5();
    }
    else
    {
      return [v4 clearErrorState];
    }
  }
}

- (BOOL)_isQuickCrop
{
  double v2 = [(PUPhotoEditViewController *)self quickCropContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)currentToolPickerLayoutDirection
{
  BOOL v3 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v4 = [v3 currentLayoutStyle];

  int64_t v5 = [(PUPhotoEditViewController *)self layoutOrientation];
  int64_t v6 = 1;
  if (v4 != 4) {
    int64_t v6 = 2;
  }
  if (v5 == 2) {
    return v6;
  }
  else {
    return v4 == 4;
  }
}

- (id)_createMediaView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F7A798]);
  uint64_t v4 = [(PUPhotoEditViewController *)self _defaultRenderPipelineFiltersForCurrentMode];
  [v3 setPipelineFilters:v4];

  [v3 setDelegate:self];
  [v3 setMaximumZoomScale:1.0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  int64_t v5 = (NUBufferRenderClient *)[objc_alloc(MEMORY[0x1E4F7A3B0]) initWithName:@"Edit View Controller Display"];
  renderImageClient = self->_renderImageClient;
  self->_renderImageClient = v5;

  int v7 = self->_renderImageClient;
  double v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:0];
  [(NUBufferRenderClient *)v7 setPriority:v8];

  [v3 setClipsToBounds:0];
  double v9 = 0.0;
  if (!self->_isEmbeddedEdit) {
    double v9 = 6.0;
  }
  [v3 setMaximumZoomScale:v9];
  [v3 setCenterContent:0];
  [v3 setAlwaysBounceScrollView:0];
  if (([MEMORY[0x1E4F7A4A0] enableDash5] & 1) != 0
    || [MEMORY[0x1E4F7A4A0] renderMeteorPlusAsHDR])
  {
    [v3 setHdrEnabled:PXUserAllowFullHDR()];
  }
  return v3;
}

- (void)_transitionToNewToolViewController:(id)a3 oldToolViewController:(id)a4 animationBlock:(id)a5 completion:(id)a6 animated:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(void))a6;
  [(NUMediaView *)self->_mediaView setHidden:[(PUPhotoEditToolController *)self->_currentEditingTool shouldHideMediaView]];
  if ([(PUPhotoEditViewController *)self isStandardVideo])
  {
    char v16 = [(PUPhotoEditMediaToolController *)self->_mediaToolController trimController];
    [v16 pause];
  }
  id v17 = [v12 view];
  id v18 = [v13 view];
  if (v12)
  {
    id v19 = [(PUPhotoEditViewController *)self view];
    [(PUPhotoEditViewController *)self addChildViewController:v12];
    [v19 addSubview:v17];
    [v12 didMoveToParentViewController:self];
    [v19 setNeedsUpdateConstraints];
  }
  double v20 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  [v20 setIgnoresUpdates:1];

  BOOL v21 = [(PUPhotoEditViewController *)self _isQuickCrop];
  if (v7)
  {
    if (v13) {
      BOOL v22 = 0;
    }
    else {
      BOOL v22 = v21;
    }
    [v17 setAlpha:0.0];
    [(PUPhotoEditViewController *)self setMediaViewEdgeInsetsUpdateDisableCount:[(PUPhotoEditViewController *)self mediaViewEdgeInsetsUpdateDisableCount]+ 1];
    double v23 = [(PUPhotoEditViewController *)self view];
    [v23 layoutIfNeeded];

    [(PUPhotoEditViewController *)self setMediaViewEdgeInsetsUpdateDisableCount:[(PUPhotoEditViewController *)self mediaViewEdgeInsetsUpdateDisableCount]- 1];
    [MEMORY[0x1E4F39CF8] animationDuration];
    double v25 = v24;
    UIAnimationDragCoefficient();
    double v27 = v25 * v26;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke;
    aBlock[3] = &unk_1E5F293A8;
    id v43 = v14;
    void aBlock[4] = self;
    BOOL v45 = v22;
    double v44 = v27;
    id v41 = v17;
    id v42 = v18;
    id v28 = _Block_copy(aBlock);
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    id v35 = __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke_2;
    uint64_t v36 = &unk_1E5F2AFC8;
    __int16 v37 = self;
    uint64_t v39 = v15;
    id v38 = v13;
    uint64_t v29 = _Block_copy(&v33);
    objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateWithDuration:delay:options:animations:start:completion:", 0, v28, 0, v29, v27, 0.0, v33, v34, v35, v36, v37);
  }
  else
  {
    [(PUPhotoEditViewController *)self _updateBackgroundColor];
    v15[2](v15);
    if (v13)
    {
      [v13 willMoveToParentViewController:0];
      char v30 = [v13 view];
      [v30 removeFromSuperview];

      [v13 removeFromParentViewController];
    }
    [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
    id v31 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    [v31 setIgnoresUpdates:0];
  }
  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:v7];
  [(PUPhotoEditViewController *)self _updateToolbarBackgroundAnimated:v7];
  [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  [(PUPhotoEditViewController *)self _updateLivePhotoPlaybackGestureRecognizer];
  [(PUPhotoEditViewController *)self _updateSwipeDownGestureRecognizer];
  [(PEAutoAdjustmentController *)self->_autoEnhanceController invalidateCachedAdjustments];
  id v32 = [(PUPhotoEditViewController *)self valuesCalculator];
  [v32 precomputeImageValues];

  [(PUEditPluginSession *)self->_pluginSession updateAvailability];
  [(PUPhotoEditViewController *)self setNeedsUpdateOfScreenEdgesDeferringSystemGestures];
}

uint64_t __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) _mediaViewEdgeInsets];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1016), "_transitionToInsets:duration:animationCurve:updateRenderContent:", 0, 1);
  [*(id *)(a1 + 32) _updateSubviewsOrdering];
  [*(id *)(a1 + 32) _updateBackgroundColor];
  [*(id *)(a1 + 40) setAlpha:1.0];
  double v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

void __121__PUPhotoEditViewController__transitionToNewToolViewController_oldToolViewController_animationBlock_completion_animated___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1008) = 0;
  [*(id *)(a1 + 32) _updateSubviewsOrdering];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  double v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 willMoveToParentViewController:0];
    id v3 = [*(id *)(a1 + 40) view];
    [v3 removeFromSuperview];

    [*(id *)(a1 + 40) removeFromParentViewController];
  }
  id v4 = [*(id *)(a1 + 32) photoEditIrisModel];
  [v4 setIgnoresUpdates:0];
}

- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  double v8 = (UIViewController *)a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F2EBA0;
  id v10 = v9;
  id v33 = v10;
  id v11 = _Block_copy(aBlock);
  id v12 = v11;
  currentTool = self->_currentTool;
  if (currentTool == v8)
  {
    (*((void (**)(void *))v11 + 2))(v11);
  }
  else
  {
    id v14 = currentTool;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v16 = v8;
    }
    else {
      char v16 = 0;
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    id v24[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_2;
    v24[3] = &unk_1E5F29380;
    id v17 = v16;
    double v25 = v17;
    float v26 = self;
    double v27 = v8;
    BOOL v31 = a4;
    id v18 = v15;
    id v28 = v18;
    id v30 = v12;
    id v19 = v14;
    uint64_t v29 = v19;
    double v20 = (void (**)(void))_Block_copy(v24);
    BOOL v21 = v20;
    if (v17)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_5;
      v22[3] = &unk_1E5F2EBA0;
      double v23 = v20;
      [(UIViewController *)v17 prepareForToolTransitionWithCompletion:v22];
    }
    else
    {
      v20[2](v20);
    }
  }
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) suppressesEditUpdates])
  {
    if (([*(id *)(*(void *)(a1 + 40) + 1016) loopsVideoPlayback] & 1) != 0
      || ([*(id *)(*(void *)(a1 + 40) + 1016) player],
          double v2 = objc_claimAutoreleasedReturnValue(),
          uint64_t v3 = [v2 playbackState],
          v2,
          v3 == 3))
    {
      [*(id *)(*(void *)(a1 + 40) + 1016) _stopVideoPlayback];
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 992), *(id *)(*(void *)(a1 + 40) + 984));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = *(void **)(a1 + 48);
  }
  else {
    id v4 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 984), v4);
  objc_storeStrong((id *)(*(void *)(a1 + 40) + 1000), *(id *)(a1 + 48));
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(v5 + 1072))
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v6 = *(void *)(a1 + 40);
    BOOL v7 = *(void **)(v6 + 1072);
    *(void *)(v6 + 1072) = 0;

    double v8 = [*(id *)(a1 + 40) view];
    [v8 setNeedsUpdateConstraints];

    uint64_t v5 = *(void *)(a1 + 40);
  }
  *(unsigned char *)(v5 + 1008) = *(unsigned char *)(a1 + 80);
  [*(id *)(a1 + 56) willResignActiveTool];
  id v9 = [*(id *)(a1 + 40) _defaultRenderPipelineFiltersForCurrentMode];
  [*(id *)(a1 + 32) willBecomeActiveTool];
  id v10 = [*(id *)(a1 + 32) filter];
  if (v10)
  {
    uint64_t v11 = [v9 arrayByAddingObject:v10];

    id v9 = (void *)v11;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E5F2E908;
  void aBlock[4] = *(void *)(a1 + 40);
  id v12 = v9;
  id v23 = v12;
  id v24 = *(id *)(a1 + 32);
  id v13 = _Block_copy(aBlock);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_4;
  v16[3] = &unk_1E5F29358;
  char v21 = *(unsigned char *)(a1 + 80);
  void v16[4] = *(void *)(a1 + 40);
  id v17 = v12;
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 72);
  id v14 = v12;
  id v15 = _Block_copy(v16);
  [*(id *)(a1 + 40) _transitionToNewToolViewController:*(void *)(a1 + 48) oldToolViewController:*(void *)(a1 + 64) animationBlock:v13 completion:v15 animated:*(unsigned __int8 *)(a1 + 80)];
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) _setPipelineFilters:*(void *)(a1 + 40) shouldUpdateContent:0];
  if (([*(id *)(a1 + 48) wantsZoomAndPanEnabled] & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 1016) setZoomScaleToFit];
  }
  [*(id *)(a1 + 32) _updateToolbarShadowAlpha];
  double v2 = *(void **)(a1 + 48);
  return [v2 updateForIncomingAnimation];
}

uint64_t __81__PUPhotoEditViewController__transitionToEditingTool_animated_completionHandler___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72)) {
    [*(id *)(*(void *)(a1 + 32) + 1016) setPipelineFilters:*(void *)(a1 + 40)];
  }
  double v2 = [*(id *)(a1 + 32) videoScrubberView];
  uint64_t v3 = [v2 superview];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) view];
    [v4 setNeedsLayout];
  }
  [*(id *)(a1 + 32) _updateVideoScrubber];
  [*(id *)(a1 + 48) didResignActiveTool];
  [*(id *)(a1 + 56) didBecomeActiveTool];
  [*(id *)(a1 + 56) setBackdropViewGroupName:@"PUPhotoEditToolbarGroupName"];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v5();
}

- (void)_transitionToEditingTool:(id)a3 animated:(BOOL)a4
{
}

- (id)_defaultInitialToolController
{
  photoStylesToolController = (PUAdjustmentsToolController *)self->_photoStylesToolController;
  if (photoStylesToolController) {
    id v4 = photoStylesToolController;
  }
  if (self->_portraitToolController)
  {
    uint64_t v5 = [(PUPhotoEditViewController *)self compositionController];
    uint64_t v6 = [v5 depthAdjustmentController];
    int v7 = [v6 enabled];

    if (v7)
    {
      portraitToolController = self->_portraitToolController;
LABEL_10:
      id v9 = portraitToolController;

      photoStylesToolController = v9;
      goto LABEL_13;
    }
  }
  if (self->_mediaToolController
    && ([(PUPhotoEditViewController *)self isStandardVideo]
     || [(PUPhotoEditViewController *)self isHighframeRateVideo]))
  {
    portraitToolController = self->_mediaToolController;
    goto LABEL_10;
  }
  if (!photoStylesToolController) {
    photoStylesToolController = self->_adjustmentsController;
  }
LABEL_13:
  return photoStylesToolController;
}

- (id)_toolControllerForInitialToolType:(int64_t)a3
{
  switch([(PUPhotoEditViewController *)self initialToolType])
  {
    case 0:
    case 9:
      id v4 = [(PUPhotoEditViewController *)self _defaultInitialToolController];
      goto LABEL_16;
    case 1:
      goto LABEL_9;
    case 2:
      uint64_t v5 = self->_adjustmentsController;
      [(PUAdjustmentsToolController *)self->_adjustmentsController setInitialAction:1];
      break;
    case 3:
      uint64_t v5 = self->_filtersController;
      photoStylesToolController = self->_photoStylesToolController;
      if (photoStylesToolController)
      {
        int v7 = photoStylesToolController;

        uint64_t v5 = (PUAdjustmentsToolController *)v7;
      }
      break;
    case 4:
      uint64_t v8 = 1584;
      goto LABEL_11;
    case 5:
      id v9 = self->_photoStylesToolController;
      if (v9) {
        goto LABEL_15;
      }
LABEL_9:
      uint64_t v8 = 1592;
LABEL_11:
      id v9 = *(Class *)((char *)&self->super.super.super.isa + v8);
      goto LABEL_15;
    case 6:
      uint64_t v8 = 1568;
      goto LABEL_11;
    case 7:
      cropController = self->_cropController;
      uint64_t v11 = 1;
      goto LABEL_14;
    case 8:
      cropController = self->_cropController;
      uint64_t v11 = 2;
LABEL_14:
      [(PUCropToolController *)cropController setInitialAction:v11];
      id v9 = self->_cropController;
LABEL_15:
      id v4 = v9;
LABEL_16:
      uint64_t v5 = v4;
      break;
    default:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

- (void)_chooseInitialEditingTool
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_currentTool) {
    return;
  }
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
  uint64_t v3 = [(PUPhotoEditViewController *)self initialPendingEditsRequest];

  if (!v3) {
    goto LABEL_4;
  }
  id v4 = [(PUPhotoEditViewController *)self initialPendingEditsRequest];
  uint64_t v5 = [v4 adjustments];
  uint64_t v6 = [v5 lastObject];
  uint64_t v7 = [v6 category];

  uint64_t v8 = [(PUPhotoEditViewController *)self _toolControllerForAdjustmentCategory:v7];
  if (!v8)
  {
LABEL_4:
    uint64_t v8 = [(PUPhotoEditViewController *)self _toolControllerForInitialToolType:[(PUPhotoEditViewController *)self initialToolType]];
  }
  [(PUPhotoEditViewController *)self switchToEditingTool:v8 animated:v8 == self->_cropController];
  id v9 = [(PUPhotoEditViewController *)self photo];
  if (([v9 mediaSubtypes] & 0x10) != 0)
  {
    portraitToolController = self->_portraitToolController;
    if (portraitToolController)
    {
      uint64_t v11 = [(PUPhotoEditPortraitToolController *)portraitToolController majorVersion];
      unint64_t v12 = [(PUPhotoEditPortraitToolController *)self->_portraitToolController minorVersion];
      unint64_t v13 = [(PUPhotoEditPortraitToolController *)self->_portraitToolController sDOFRenderingVersion];
      id v14 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v18 = 134218496;
        *(void *)&v18[4] = v11;
        *(_WORD *)&v18[12] = 2048;
        *(void *)&v18[14] = v12;
        *(_WORD *)&v18[22] = 2048;
        unint64_t v19 = v13;
        id v15 = "Portrait photo asset version: %lu.%lu / sDOF rendering version: %lu";
        char v16 = v14;
        uint32_t v17 = 32;
LABEL_11:
        _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, v15, v18, v17);
      }
    }
    else
    {
      id v14 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        id v15 = "Unable to read portrait photo asset version.";
        char v16 = v14;
        uint32_t v17 = 2;
        goto LABEL_11;
      }
    }
  }
  if ([(PUPhotoEditViewController *)self initialToolType] == 9) {
    [(PUPhotoEditViewController *)self _handleMarkupButton:0];
  }
}

- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E5F2EBA0;
  id v10 = v9;
  id v40 = v10;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  unint64_t v12 = (PUAdjustmentsToolController *)v8;
  uint64_t v13 = [(PUPhotoEditToolController *)v12 compositionController];
  if (v13
    && (id v14 = (void *)v13,
        BOOL v15 = [(PUPhotoEditToolController *)v12 canBecomeActiveTool],
        v14,
        v15)
    && !self->_switchingToolsAnimated)
  {
    char v16 = v12;
    if (!v12)
    {
      adjustmentsController = self->_adjustmentsController;
      if ((PUAdjustmentsToolController *)self->_currentTool == adjustmentsController)
      {
        char v16 = 0;
      }
      else
      {
        char v16 = [(PUPhotoEditToolController *)adjustmentsController compositionController];

        if (v16) {
          char v16 = self->_adjustmentsController;
        }
      }
    }
    if ([(PUAdjustmentsToolController *)v16 toolControllerTag] == 1006
      && (PUAdjustmentsToolController *)self->_currentTool == v16)
    {
      uint32_t v17 = self->_previousEditingTool;

      char v16 = (PUAdjustmentsToolController *)v17;
    }
    if (v16 == (PUAdjustmentsToolController *)self->_currentTool)
    {
      [(PUAdjustmentsToolController *)v16 reactivate];
      v11[2](v11);
    }
    else
    {
      BOOL v30 = v6;
      if (v16 == (PUAdjustmentsToolController *)self->_cleanupController)
      {
        id v18 = (void *)MEMORY[0x1E4F901C0];
        unint64_t v19 = [MEMORY[0x1E4F901C0] cleanUpTipID];
        [v18 setTipActionPerformed:v19];
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v20 = -[NSArray arrayByAddingObject:](self->_coreToolButtons, "arrayByAddingObject:", self->_redEyeButton, self);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v36 != v23) {
              objc_enumerationMutation(v20);
            }
            objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "setSelected:", -[PUAdjustmentsToolController toolControllerTag](v16, "toolControllerTag") == objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "tag"));
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v22);
      }

      objc_msgSend(v29[154], "setSelectedToolTag:", -[PUAdjustmentsToolController toolControllerTag](v16, "toolControllerTag"));
      if ([v29[123] suppressesEditUpdates])
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        [v29 _updateGainMap];
        id v25 = v29[127];
        float v26 = [v29 _composition];
        [v25 setComposition:v26];

        [v29[127] waitForRender];
        if ([v29[127] loopsVideoPlayback]) {
          [v29[127] _startVideoPlayback];
        }
        [MEMORY[0x1E4F39CF8] commit];
        dispatch_time_t v27 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke_2;
        block[3] = &unk_1E5F29330;
        void block[4] = v29;
        char v16 = v16;
        id v32 = v16;
        BOOL v34 = v30;
        id v33 = v10;
        dispatch_after(v27, MEMORY[0x1E4F14428], block);
      }
      else
      {
        [v29 _transitionToEditingTool:v16 animated:v30 completionHandler:v10];
      }
    }
  }
  else
  {
    v11[2](v11);
    char v16 = v12;
  }
}

uint64_t __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __76__PUPhotoEditViewController_switchToEditingTool_animated_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionToEditingTool:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)switchToEditingTool:(id)a3 animated:(BOOL)a4
{
}

- (id)_defaultRenderPipelineFiltersForCurrentMode
{
  if ([(PUPhotoEditViewController *)self isStandardVideo]
    || [(PUPhotoEditViewController *)self isLoopingVideo])
  {
    uint64_t v3 = [(id)objc_opt_class() _defaultMediaViewRenderPipelineFilters];
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() _defaultLivePhotoRenderPipelineFilters];
  }
  return v3;
}

- (int64_t)_toolTypeForToolWithTag:(int64_t)a3
{
  if ((unint64_t)(a3 - 1002) > 5) {
    return 0;
  }
  else {
    return qword_1AEFF8158[a3 - 1002];
  }
}

- (id)_allTools
{
  [(PUPhotoEditViewController *)self _loadToolsIfNeeded];
  allTools = self->__allTools;
  return allTools;
}

- (void)_setupToolsIfNeeded
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUPhotoEditViewController *)self compositionController];
  id v4 = [(PUPhotoEditViewController *)self valuesCalculator];
  uint64_t v5 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v6 = [(PUPhotoEditViewController *)self editSource];
  uint64_t v7 = (void *)v6;
  if (v3 && v4 && v5 && v6)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v18 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v14 = [v13 compositionController];

          if (!v14)
          {
            BOOL v15 = [(PUPhotoEditViewController *)self photo];
            [v13 setupWithAsset:v15 compositionController:v3 editSource:v7 valuesCalculator:v4];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    char v16 = [(PUAdjustmentsToolController *)self->_adjustmentsController autoAdjustmentController];
    autoEnhanceController = self->_autoEnhanceController;
    self->_autoEnhanceController = v16;

    uint64_t v5 = v18;
  }
}

- (void)_loadToolsIfNeeded:(BOOL)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  if (!self->_didLoadTools || a3)
  {
    allTools = self->__allTools;
    if (allTools)
    {
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      uint64_t v6 = allTools;
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v68;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v68 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void **)(*((void *)&v67 + 1) + 8 * i);
            [v10 willMoveToParentViewController:0];
            uint64_t v11 = [v10 view];
            [v11 removeFromSuperview];

            [v10 removeFromParentViewController];
          }
          uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v67 objects:v73 count:16];
        }
        while (v7);
      }

      unint64_t v12 = self->__allTools;
      self->__allTools = 0;

      cropController = self->_cropController;
      self->_cropController = 0;

      filtersController = self->_filtersController;
      self->_filtersController = 0;

      cleanupController = self->_cleanupController;
      self->_cleanupController = 0;

      adjustmentsController = self->_adjustmentsController;
      self->_adjustmentsController = 0;

      portraitToolController = self->_portraitToolController;
      self->_portraitToolController = 0;

      audioToolController = self->_audioToolController;
      self->_audioToolController = 0;

      mediaToolController = self->_mediaToolController;
      self->_mediaToolController = 0;

      photoStylesToolController = self->_photoStylesToolController;
      self->_photoStylesToolController = 0;
    }
    if ([(PUPhotoEditViewController *)self _enableSpatialMediaEditing]
      || ![(PUPhotoEditViewController *)self isSpatialMedia])
    {
      long long v21 = (PUCropToolController *)[objc_alloc((Class)objc_opt_class()) initWithNibName:0 bundle:0];
      long long v22 = self->_cropController;
      self->_cropController = v21;

      uint64_t v23 = [[PUFilterToolController alloc] initWithNibName:0 bundle:0];
      uint64_t v24 = self->_filtersController;
      self->_filtersController = v23;

      objc_initWeak(&location, self->_filtersController);
      id v25 = [(PUPhotoEditViewController *)self filterInterval];
      float v26 = PLPhotoEditGetLog();
      dispatch_time_t v27 = (void *)os_signpost_id_make_with_pointer(v26, self->_filtersController);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke;
      v62[3] = &unk_1E5F2AEB0;
      id v28 = v25;
      id v63 = v28;
      objc_copyWeak(v65, &location);
      uint64_t v29 = v26;
      id v64 = v29;
      v65[1] = v27;
      [(PUFilterToolController *)self->_filtersController setWillLoadFilterThumbnails:v62];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke_904;
      v58[3] = &unk_1E5F2AEB0;
      id v30 = v28;
      id v59 = v30;
      objc_copyWeak(v61, &location);
      BOOL v31 = v29;
      id v60 = v31;
      v61[1] = v27;
      [(PUFilterToolController *)self->_filtersController setDidFinishLoadingFilterThumbnails:v58];
      id v32 = [(PUPhotoEditViewController *)self photo];
      uint64_t v33 = [v32 mediaType];

      if (v33 != 1
        || [(PUPhotoEditViewController *)self isLoopingVideo]
        || self->_isEmbeddedEdit
        || ![MEMORY[0x1E4F8A2E8] deviceSupportsObjectRemoval])
      {
        long long v35 = self->_cleanupController;
        self->_cleanupController = 0;
      }
      else
      {
        BOOL v34 = [[PUCleanupToolController alloc] initWithNibName:0 bundle:0];
        long long v35 = self->_cleanupController;
        self->_cleanupController = v34;
      }

      long long v36 = [[PUAdjustmentsToolController alloc] initWithNibName:0 bundle:0];
      long long v37 = self->_adjustmentsController;
      self->_adjustmentsController = v36;

      long long v38 = [[PURedeyeToolController alloc] initWithNibName:0 bundle:0];
      [(PUPhotoEditViewController *)self setRedEyeController:v38];
      uint64_t v39 = self->_portraitToolController;
      self->_portraitToolController = 0;

      id v40 = self->_audioToolController;
      self->_audioToolController = 0;

      id v41 = self->_mediaToolController;
      self->_mediaToolController = 0;

      uint64_t v42 = self->_photoStylesToolController;
      self->_photoStylesToolController = 0;

      id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v44 = self->_filtersController;
      v72[0] = self->_adjustmentsController;
      v72[1] = v44;
      v72[2] = self->_cropController;
      v72[3] = v38;
      BOOL v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
      [v43 addObjectsFromArray:v45];

      if (self->_cleanupController) {
        objc_msgSend(v43, "addObject:");
      }
      int v46 = (NSArray *)[v43 copy];
      uint64_t v47 = self->__allTools;
      self->__allTools = v46;

      objc_destroyWeak(v61);
      objc_destroyWeak(v65);

      objc_destroyWeak(&location);
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    uint64_t v48 = self->__allTools;
    uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v54 objects:v71 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v49; ++j)
        {
          if (*(void *)v55 != v50) {
            objc_enumerationMutation(v48);
          }
          uint64_t v52 = *(void **)(*((void *)&v54 + 1) + 8 * j);
          uint64_t v53 = [(PUPhotoEditViewController *)self aggregateSession];
          [v52 setAggregateSession:v53];

          [v52 setDelegate:self];
          objc_msgSend(v52, "setLayoutOrientation:withTransitionCoordinator:", -[PUPhotoEditViewController layoutOrientation](self, "layoutOrientation"), 0);
        }
        uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:&v54 objects:v71 count:16];
      }
      while (v49);
    }

    self->_didLoadTools = 1;
    [(PUPhotoEditViewController *)self _setupToolsIfNeeded];
    [(PUPhotoEditViewController *)self _updateKeyCommands];
  }
}

void __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) beginInterval];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setWillLoadFilterThumbnails:0];

  uint64_t v3 = *(id *)(a1 + 40);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v5, "EnterEditFilterThumbnails", " enableTelemetry=YES ", v6, 2u);
  }
}

void __48__PUPhotoEditViewController__loadToolsIfNeeded___block_invoke_904(uint64_t a1)
{
  [*(id *)(a1 + 32) endInterval];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setDidFinishLoadingFilterThumbnails:0];

  uint64_t v3 = *(id *)(a1 + 40);
  id v4 = v3;
  os_signpost_id_t v5 = *(void *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v4, OS_SIGNPOST_INTERVAL_END, v5, "EnterEditFilterThumbnails", " enableTelemetry=YES ", v6, 2u);
  }
}

- (void)_loadToolsIfNeeded
{
}

- (void)_updateGainMap
{
  if ([(PUPhotoEditViewController *)self currentAssetNeedsGainMap])
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F7A380];
    id v4 = [(PUPhotoEditViewController *)self _composition];
    os_signpost_id_t v5 = (CGImage *)[v3 createGainMapForComposition:v4];

    [(PUPhotoEditViewController *)self setGainMapImage:v5];
    CGImageRelease(v5);
  }
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    [(PUPhotoEditViewController *)self _updateLayerModulation];
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    [(PUPhotoEditViewController *)self _updateLayerModulation];
  }
}

- (id)_newOutputForContentEditingInput:(id)a3 compositionController:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(PUPhotoEditViewController *)self photo];
  BOOL v9 = [(PUPhotoEditViewController *)self _shouldRequestAsyncAdjustmentForAsset:v8 compositionController:v6];

  uint64_t v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(PUPhotoEditViewController *)self photo];
    uint64_t v12 = [v11 mediaType];
    uint64_t v13 = [(PUPhotoEditViewController *)self photo];
    int v18 = 134218496;
    uint64_t v19 = v12;
    __int16 v20 = 2048;
    uint64_t v21 = [v13 mediaSubtypes];
    __int16 v22 = 1024;
    BOOL v23 = v9;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Creating ContentEditingOutput for assetType:%lu subType:%lu async:%d", (uint8_t *)&v18, 0x1Cu);
  }
  id v14 = (void *)MEMORY[0x1E4F911A0];
  BOOL v15 = [(PUPhotoEditViewController *)self photo];
  char v16 = [v14 contentEditingOutputForContentEditingInput:v7 compositionController:v6 asset:v15 async:v9 onlyChangingOriginalChoice:0];

  return v16;
}

- (BOOL)_shouldRequestAsyncAdjustmentForAsset:(id)a3 compositionController:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 mediaType];
  uint64_t v8 = v7;
  if (v7 == 2)
  {
    BOOL v9 = +[PUPhotoEditProtoSettings sharedInstance];
    int v10 = [v9 disableAsynchronousRenderingVideos] ^ 1;
  }
  else
  {
    if (v7 != 1)
    {
      int v10 = 0;
      goto LABEL_7;
    }
    BOOL v9 = +[PUPhotoEditProtoSettings sharedInstance];
    int v10 = [v9 useAsynchronousRenderingPhotos];
  }

LABEL_7:
  int v11 = [MEMORY[0x1E4F8A748] isKeyOnlyAdjustmentForCompositionController:v6 key:*MEMORY[0x1E4F8A4A8]];
  id v12 = v5;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  unsigned int v14 = [v13 mediaSubtypes];
  if (v11) {
    v10 &= v14 >> 20;
  }
  BOOL v15 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67110144;
    v17[1] = v10;
    __int16 v18 = 2048;
    uint64_t v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = [v12 mediaSubtypes];
    __int16 v22 = 1024;
    int v23 = v11;
    __int16 v24 = 1024;
    int v25 = (*(void *)&v14 & 0x100000uLL) >> 20;
    _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "_shouldRequestAsyncAdjustmentForAsset returns %d, assetType:%lu subType:%lu isOrientationOnlyAdjustment:%d isHDR:%d", (uint8_t *)v17, 0x28u);
  }

  return v10;
}

- (void)setIsCachingVideo:(BOOL)a3
{
  if (self->_isCachingVideo != a3)
  {
    self->_isCachingVideo = a3;
    [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  }
}

- (void)setRunningAutoCalculators:(BOOL)a3
{
  if (self->_runningAutoCalculators != a3)
  {
    self->_runningAutoCalculators = a3;
    if (a3) {
      [(PUPhotoEditViewController *)self _didStartAutoCalc];
    }
    else {
      [(PUPhotoEditViewController *)self _didEndAutoCalc];
    }
    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
  }
}

- (BOOL)isVideoOn
{
  uint64_t v3 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 isVideoEnabled];
  }
  else
  {
    id v6 = [(PUPhotoEditViewController *)self photo];
    if ([v6 canPlayPhotoIris])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v7 = [(PUPhotoEditViewController *)self photo];
      if ([v7 canPlayLoopingVideo])
      {
        char v5 = 1;
      }
      else
      {
        uint64_t v8 = [(PUPhotoEditViewController *)self photo];
        char v5 = [v8 playbackStyle] == 4;
      }
    }
  }
  return v5;
}

- (BOOL)_hasUnsavedChanges
{
  uint64_t v3 = [(PUPhotoEditViewController *)self compositionController];
  id v4 = [(PUPhotoEditViewController *)self uneditedComposition];
  if (!v3)
  {
    uint64_t v8 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    if (v8) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }
  char v5 = 1;
  int v6 = [v3 isEqual:v4 visualChangesOnly:1];
  uint64_t v7 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  uint64_t v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
LABEL_4:
      char v5 = [v8 hasUnsavedChanges];
      goto LABEL_7;
    }
LABEL_6:
    char v5 = 0;
  }
LABEL_7:

  return v5;
}

- (void)_requestLivePhotoAssetWithFilters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  int v9 = [v8 isVideoEnabled];

  uint64_t v10 = [(NUMediaView *)self->_mediaView composition];
  int v11 = (void *)v10;
  if (v9 && v10)
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F7A540]) initWithComposition:v10];
    [v12 setName:@"PUPhotoEditViewController-LivePhoto"];
    [v12 setPipelineFilters:v6];
    id v13 = objc_alloc(MEMORY[0x1E4F7A538]);
    unsigned int v14 = (void *)[v13 initWithName:@"PUPhotoEditViewController-LivePhoto" responseQueue:MEMORY[0x1E4F14428]];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    __int16 v18 = __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke_2;
    uint64_t v19 = &unk_1E5F29308;
    id v20 = v7;
    id v15 = v7;
    [v14 setCompletionBlock:&v16];
    objc_msgSend(v14, "submitRequest:", v12, v16, v17, v18, v19);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke;
    block[3] = &unk_1E5F2EBA0;
    id v22 = v7;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
    unsigned int v14 = v22;
  }
}

uint64_t __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__PUPhotoEditViewController__requestLivePhotoAssetWithFilters_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  uint64_t v3 = [a2 result:&v12];
  id v4 = v12;
  if (v3)
  {
    char v5 = [v3 video];
    id v6 = [v3 videoComposition];
    memset(buf, 0, sizeof(buf));
    uint64_t v14 = 0;
    [v3 photoTime];
    id v7 = objc_alloc(MEMORY[0x1E4F39138]);
    long long v10 = *(_OWORD *)buf;
    uint64_t v11 = v14;
    uint64_t v8 = (void *)[v7 initWithImage:0 uiOrientation:0 videoAsset:v5 photoTime:&v10 asset:0 options:1 videoComposition:v6];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
    }
    int v9 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v4;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Failed to load LivePhoto: %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_restoreSnapshot:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __68__PUPhotoEditViewController__restoreSnapshot_withCompletionHandler___block_invoke;
  id v20 = &unk_1E5F290D8;
  uint64_t v21 = self;
  id v8 = v7;
  id v22 = v8;
  int v9 = _Block_copy(&v17);
  long long v10 = objc_msgSend(v6, "adjustmentData", v17, v18, v19, v20, v21);

  if (v10)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v12 = [v11 photoLibraryURL];

    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F39030]) initWithPhotoEditSnapshot:v6 appropriateForURL:v12];
    uint64_t v14 = [(PUPhotoEditViewController *)self mediaDestination];
    uint64_t v15 = [(PUPhotoEditViewController *)self photo];
    uint64_t v16 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    objc_msgSend(v14, "saveEditsForAsset:usingContentEditingOutput:livePhotoState:completionHandler:", v15, v13, objc_msgSend(v16, "editingVisibility"), v9);
  }
  else
  {
    id v12 = [(PUPhotoEditViewController *)self mediaDestination];
    id v13 = [(PUPhotoEditViewController *)self photo];
    [v12 revertEditsForAsset:v13 completionHandler:v9];
  }

  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
}

void __68__PUPhotoEditViewController__restoreSnapshot_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
  [*(id *)(a1 + 32) _resetModelAndBaseImagesToWorkImageVersion:1];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)_captureSnapshotOfBasePhotoWithCompletionHandler:(id)a3
{
  id v13 = (void (**)(id, PUPhotoEditSnapshot *))a3;
  if (!v13)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 6925, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v5 = (void *)MEMORY[0x1E4F8A358];
  uint64_t v6 = [(PUPhotoEditViewController *)self uneditedComposition];
  id v7 = (void *)[v5 newCompositionControllerWithComposition:v6];

  int64_t v8 = [(PUPhotoEditViewController *)self workImageVersion];
  if ([(PUPhotoEditViewController *)self _canCompositionControllerBeReverted:v7])
  {
    BOOL v9 = v8 == 1;
  }
  else
  {
    BOOL v9 = 0;
  }
  if (v9)
  {
    long long v10 = objc_alloc_init(PUPhotoEditSnapshot);
    v13[2](v13, v10);
  }
  else
  {
    long long v10 = [(PUPhotoEditViewController *)self photo];
    uint64_t v11 = [(PUPhotoEditViewController *)self mediaProvider];
    +[PUPhotoEditSnapshot captureSnapshotForAsset:v10 mediaProvider:v11 completion:v13];
  }
}

- (void)_updatePhotoEditIrisModel
{
  id v6 = [(PUPhotoEditViewController *)self photo];
  uint64_t v3 = [(PUPhotoEditViewController *)self compositionController];
  if (v3 && v6 && [v6 isLivePhoto])
  {
    id v4 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    [v4 unregisterChangeObserver:self];

    id v5 = [[PUPhotoEditIrisModel alloc] initWithAsset:v6 compositionController:v3];
    [(PUPhotoEditViewController *)self setPhotoEditIrisModel:v5];
    [(PUViewModel *)v5 registerChangeObserver:self];
    [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  }
  [(PUPhotoEditMediaToolController *)self->_mediaToolController photoEditLivePhotoModelUpdated];
}

- (void)_resetModelAndBaseImagesToWorkImageVersion:(int64_t)a3
{
  [(PUPhotoEditViewController *)self setWorkImageVersion:a3];
  id v4 = (void *)MEMORY[0x1E4F8A358];
  id v5 = (void *)[MEMORY[0x1E4F8A358] newComposition];
  id v13 = (id)[v4 newCompositionControllerWithComposition:v5];

  id v6 = [(PUPhotoEditViewController *)self compositionController];
  objc_msgSend(v13, "setImageOrientation:", objc_msgSend(v6, "imageOrientation"));

  id v7 = [(PUPhotoEditViewController *)self editSource];
  int64_t v8 = [v7 source];
  BOOL v9 = [(PUPhotoEditViewController *)self editSource];
  objc_msgSend(v13, "setSource:mediaType:", v8, objc_msgSend(v9, "mediaType"));

  long long v10 = [(PUPhotoEditViewController *)self compositionController];
  [v10 applyChangesFromCompositionController:v13];

  uint64_t v11 = [(PUPhotoEditViewController *)self compositionController];
  id v12 = [v11 composition];
  [(PUPhotoEditViewController *)self setUneditedComposition:v12];

  [(PUPhotoEditViewController *)self setEditSource:0];
  [(PUPhotoEditViewController *)self setMainRenderer:0];
  [(PUPhotoEditViewController *)self _updateModelDependentControlsAnimated:0];
  [(PUPhotoEditViewController *)self _updateValuesCalculator];
  [(PUPhotoEditViewController *)self _updatePhotoEditIrisModel];
}

- (id)_orientedCIImageFromUIImage:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUPhotoEditViewController *)self photo];
  id v6 = [v5 imageProperties];

  if (v6)
  {
    uint64_t v13 = *MEMORY[0x1E4F1E3C8];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  }
  else
  {
    id v7 = 0;
  }
  int64_t v8 = (void *)MEMORY[0x1E4F1E050];
  id v9 = v4;
  long long v10 = objc_msgSend(v8, "imageWithCGImage:options:", objc_msgSend(v9, "CGImage"), v7);
  [v9 imageOrientation];

  uint64_t v11 = [v10 imageByApplyingOrientation:PLExifOrientationFromImageOrientation()];

  return v11;
}

- (void)setOriginalStillImageTime:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_originalStillImageTime = &self->_originalStillImageTime;
  CMTime time1 = *(CMTime *)a3;
  CMTime time2 = (CMTime)self->_originalStillImageTime;
  if (CMTimeCompare(&time1, &time2))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = self->__allTools;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          CMTime time1 = (CMTime)*a3;
          objc_msgSend(v11, "setOriginalStillImageTime:", &time1, (void)v13);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
      }
      while (v8);
    }

    long long v12 = *(_OWORD *)&a3->var0;
    p_originalStillImageTime->epoch = a3->var3;
    *(_OWORD *)&p_originalStillImageTime->value = v12;
  }
}

- (void)_setOriginalURL:(id)a3 originalEditSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_originalImageEditSource)
  {
    objc_storeStrong((id *)&self->_originalImageEditSource, a4);
    if ([v7 mediaType] != 2) {
      PLGetOrientationAndUntransformedSizeFromImageURL();
    }
    self->_originalImageExifOrientation = PLOrientationIsValid() == 0;
    [(PUPhotoEditViewController *)self _updatePreviewingOriginal];
  }
}

- (void)setUneditedComposition:(id)a3
{
  if (self->_uneditedComposition != a3)
  {
    id v4 = (NUComposition *)[a3 copy];
    uneditedComposition = self->_uneditedComposition;
    self->_uneditedComposition = v4;

    [(PUPhotoEditViewController *)self _updateModelDependentControlsAnimated:0];
  }
}

- (void)setCompositionController:(id)a3
{
  id v5 = (PICompositionController *)a3;
  if (self->_compositionController != v5)
  {
    uint64_t v11 = v5;
    objc_storeStrong((id *)&self->_compositionController, a3);
    id v6 = [(PUPhotoEditViewController *)self editSource];

    if (v6)
    {
      id v7 = [(PUPhotoEditViewController *)self editSource];
      uint64_t v8 = [v7 source];
      uint64_t v9 = [(PUPhotoEditViewController *)self editSource];
      -[PICompositionController setSource:mediaType:](v11, "setSource:mediaType:", v8, [v9 mediaType]);
    }
    [(PUPhotoEditViewController *)self _updateMainActionButtonAnimated:1];
    [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:1];
    [(PICompositionController *)v11 setChangeDelegate:self];
    [(PUPhotoEditViewController *)self _updateModelDependentControlsAnimated:0];
    [(PUPhotoEditViewController *)self _updateValuesCalculator];
    uint64_t v10 = [(PUPhotoEditViewController *)self valuesCalculator];
    [v10 precomputeImageValues];

    [(PUPhotoEditViewController *)self _setupToolsIfNeeded];
    [(PUPhotoEditViewController *)self _updateKeyCommands];
    id v5 = v11;
  }
}

- (void)_updateValuesCalculator
{
  id v7 = [(PUPhotoEditViewController *)self editSource];
  if (v7)
  {
    uint64_t v3 = [(PUPhotoEditViewController *)self compositionController];

    if (v3)
    {
      id v4 = [(PUPhotoEditViewController *)self valuesCalculator];
      if (!v4)
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F911D0]);
        [v4 setDelegate:self];
        id v5 = +[PUPhotoEditProtoSettings sharedInstance];
        [v4 setSettingsDelegate:v5];

        [(PUPhotoEditViewController *)self setValuesCalculator:v4];
      }
      [v4 setEditSource:v7];
      id v6 = [(PUPhotoEditViewController *)self compositionController];
      [v4 setCompositionController:v6];

      [(PUPhotoEditViewController *)self _setupToolsIfNeeded];
      [(PUPhotoEditViewController *)self _updateKeyCommands];
    }
  }
}

- (void)mediaDestination:(id)a3 didCompleteSaveRequest:(id)a4
{
  objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endBackgroundTask:", -[PUPhotoEditViewController saveBackgroundTaskIdentifier](self, "saveBackgroundTaskIdentifier"));
}

- (void)mediaDestination:(id)a3 willBeginSaveRequest:(id)a4
{
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __67__PUPhotoEditViewController_mediaDestination_willBeginSaveRequest___block_invoke;
  v8[3] = &unk_1E5F2ED10;
  id v9 = v5;
  id v7 = v5;
  -[PUPhotoEditViewController setSaveBackgroundTaskIdentifier:](self, "setSaveBackgroundTaskIdentifier:", [v6 beginBackgroundTaskWithName:@"PhotoKit Edits Save" expirationHandler:v8]);
}

uint64_t __67__PUPhotoEditViewController_mediaDestination_willBeginSaveRequest___block_invoke(uint64_t a1)
{
  double v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "Background task expired: canceling save operation!", v4, 2u);
  }

  return [*(id *)(a1 + 32) cancelSaveOperation];
}

- (void)_handleResourceLoadChange
{
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
}

- (void)_handleDidLoadOriginalWithResult:(id)a3
{
  id v6 = a3;
  id v4 = [v6 imageURL];
  if (v4 || ([v6 videoComplementURL], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [v6 editSource];
    [(PUPhotoEditViewController *)self _setOriginalURL:v4 originalEditSource:v5];
  }
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
}

- (BOOL)_isLivePhotoEffect
{
  uint64_t v3 = [(PUPhotoEditViewController *)self photo];
  int v4 = [v3 isLivePhoto];

  if (v4)
  {
    id v5 = [(PUPhotoEditViewController *)self compositionController];
    id v6 = [v5 autoLoopAdjustmentController];
    if ([v6 enabled])
    {
      id v7 = [v6 flavor];
      uint64_t v8 = PIAutoLoopFlavorFromString();

      LOBYTE(v4) = v8 == 2 || (v8 & 0xFFFFFFFFFFFFFFFDLL) == 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)_isLoopingVideo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPhotoEditViewController *)self compositionController];
  id v6 = [(PUPhotoEditViewController *)self photo];
  uint64_t v7 = [v6 mediaType];

  if (v7 == 2 || !v5)
  {
    uint64_t v8 = [(PUPhotoEditViewController *)self photo];
    char v9 = [v8 canPlayLoopingVideo];
  }
  else
  {
    uint64_t v8 = [v5 autoLoopAdjustmentController];
    if (([v8 enabled] & 1) != 0 || !v3)
    {
      uint64_t v10 = [v8 flavor];
      uint64_t v11 = PIAutoLoopFlavorFromString();

      if (v11) {
        BOOL v12 = v11 == 3;
      }
      else {
        BOOL v12 = 1;
      }
      char v9 = !v12;
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (BOOL)hasLoopingVideoAdjustment
{
  return [(PUPhotoEditViewController *)self _isLoopingVideo:0];
}

- (void)initialCinematographyLoadComplete
{
  BOOL v3 = [(PUPhotoEditViewController *)self uneditedComposition];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8A280]);
    id v5 = [(PUPhotoEditViewController *)self uneditedComposition];
    id v6 = (void *)[v4 initWithComposition:v5];

    uint64_t v7 = [v6 adjustmentConstants];
    uint64_t v8 = [v7 PIPortraitVideoAdjustmentKey];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    CMTime v10[2] = __62__PUPhotoEditViewController_initialCinematographyLoadComplete__block_invoke;
    v10[3] = &unk_1E5F292E0;
    void v10[4] = self;
    [v6 modifyAdjustmentWithKey:v8 modificationBlock:v10];

    char v9 = [v6 composition];
    [(PUPhotoEditViewController *)self setUneditedComposition:v9];

    [(PUPhotoEditViewController *)self _updateMainActionButtonAnimated:1];
    [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:1];
  }
}

void __62__PUPhotoEditViewController_initialCinematographyLoadComplete__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 compositionController];
  id v4 = [v6 portraitVideoAdjustmentController];
  id v5 = [v4 adjustment];
  [v3 setFromAdjustment:v5];
}

- (id)playbackRateOptions
{
  id v3 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
  if ([v3 baseVersion])
  {

LABEL_8:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  int64_t v4 = [(PUPhotoEditViewController *)self workImageVersion];

  if (v4 != 1) {
    goto LABEL_8;
  }
  if (!self->_playbackRateOptions)
  {
    id v5 = [(PUPhotoEditViewController *)self editSource];

    if (v5)
    {
      id v6 = (void *)MEMORY[0x1E4F91180];
      uint64_t v7 = [(PUPhotoEditViewController *)self editSource];
      uint64_t v8 = [v6 playbackRateOptionsForEditSource:v7];
      playbackRateOptions = self->_playbackRateOptions;
      self->_playbackRateOptions = v8;
    }
  }
  uint64_t v10 = self->_playbackRateOptions;
LABEL_9:
  return v10;
}

- (BOOL)isCinematicAudio
{
  int IsRenderSupported = _os_feature_enabled_impl();
  if (IsRenderSupported)
  {
    int IsRenderSupported = PICinematicAudioIsRenderSupported();
    if (IsRenderSupported)
    {
      int64_t v4 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];

      if (v4)
      {
        if (!self->_hasCheckedCinematicAudio)
        {
          self->_isAssetCinematicAudio = 0;
          id v5 = [(PUPhotoEditViewController *)self editSource];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v7 = (void *)MEMORY[0x1E4F16330];
            uint64_t v8 = [(PUPhotoEditViewController *)self editSource];
            char v9 = [v8 videoURL];
            uint64_t v10 = [v7 assetWithURL:v9];

            if ([MEMORY[0x1E4F7A718] assetIsCinematicAudio:v10]) {
              self->_isAssetCinematicAudio = 1;
            }
          }
          self->_hasCheckedCinematicAudio = 1;
        }
        LOBYTE(IsRenderSupported) = self->_isAssetCinematicAudio;
      }
      else
      {
        LOBYTE(IsRenderSupported) = 0;
      }
    }
  }
  return IsRenderSupported;
}

- (BOOL)isPortraitVideo
{
  id v3 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];

  if (!v3) {
    return 0;
  }
  if (!self->_hasCheckedPortraitVideo)
  {
    self->_isAssetPortraitVideo = 0;
    if (!self->_isEmbeddedEdit)
    {
      int64_t v4 = [(PUPhotoEditViewController *)self editSource];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v6 = (void *)MEMORY[0x1E4F16330];
        uint64_t v7 = [(PUPhotoEditViewController *)self editSource];
        uint64_t v8 = [v7 videoURL];
        char v9 = [v6 assetWithURL:v8];

        if ([MEMORY[0x1E4F8A278] assetIsCinematicVideo:v9])
        {
          if ([MEMORY[0x1E4F8A278] currentSystemCanRenderAsset:v9]) {
            self->_isAssetPortraitVideo = 1;
          }
        }
      }
    }
    self->_hasCheckedPortraitVideo = 1;
  }
  return self->_isAssetPortraitVideo;
}

- (BOOL)isHighframeRateVideo
{
  id v3 = [(PUPhotoEditViewController *)self editSource];

  if (!v3) {
    return 0;
  }
  int64_t v4 = [(PUPhotoEditViewController *)self playbackRateOptions];
  BOOL v5 = (unint64_t)[v4 count] > 1;

  return v5;
}

- (BOOL)isLoopingVideo
{
  return [(PUPhotoEditViewController *)self _isLoopingVideo:1];
}

- (BOOL)_enableSpatialMediaEditing
{
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v3 enableSpatialMediaEditing])
  {
    int64_t v4 = [(PUPhotoEditViewController *)self photo];
    BOOL v5 = [v4 mediaType] != 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSpatialMedia
{
  id v3 = [(PUPhotoEditViewController *)self photo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v4 = [(PUPhotoEditViewController *)self photo];
  }
  else
  {
    int64_t v4 = 0;
  }

  BOOL v5 = [(PUPhotoEditViewController *)self photo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(PUPhotoEditViewController *)self photo];
  }
  else
  {
    id v6 = 0;
  }

  if ([v4 isSpatialMedia]) {
    char v7 = 1;
  }
  else {
    char v7 = [v6 isSpatialMedia];
  }

  return v7;
}

- (BOOL)isStandardVideo
{
  id v3 = [(PUPhotoEditViewController *)self photo];
  uint64_t v4 = [v3 mediaType];

  BOOL v5 = [(PUPhotoEditViewController *)self photo];
  char v6 = [v5 canPlayLoopingVideo];

  if (v4 == 2) {
    return v6 ^ 1;
  }
  else {
    return 0;
  }
}

- (void)_updateMediaViewPlaybackStyle
{
  BOOL v3 = [(PUPhotoEditViewController *)self isLoopingVideo];
  BOOL v4 = v3 || [(PUPhotoEditViewController *)self isStandardVideo];
  [(NUMediaView *)self->_mediaView setVideoEnabled:v4 animated:v3];
  [(NUMediaView *)self->_mediaView setLoopsVideoPlayback:v3];
  mediaView = self->_mediaView;
  char v6 = [(PUPhotoEditViewController *)self _composition];
  [(NUMediaView *)mediaView setComposition:v6];

  if (v4)
  {
    [(PUPhotoEditViewController *)self _updatePluginSession];
  }
}

- (void)_continueLoadingWithAutocalculators
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  BOOL v4 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "starting auto calculators", (uint8_t *)&buf, 2u);
  }

  BOOL v5 = dispatch_group_create();
  objc_initWeak(&buf, self);
  [(PUPhotoEditViewController *)self setRunningAutoCalculators:1];
  [(PUPhotoEditViewController *)self _updateValuesCalculator];
  dispatch_group_enter(v5);
  char v6 = [(PUPhotoEditViewController *)self valuesCalculator];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke;
  v43[3] = &unk_1E5F2D758;
  objc_copyWeak(&v45, &buf);
  v43[4] = self;
  char v7 = v5;
  double v44 = v7;
  [v6 precomputeImageValuesWithCompletion:v43];

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F7A518]) initWithName:@"PUPhotoEditViewController-raw-property"];
  dispatch_group_enter(v7);
  char v9 = [(PUPhotoEditViewController *)self _composition];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_864;
  v40[3] = &unk_1E5F292B8;
  objc_copyWeak(v42, &buf);
  v42[1] = (id)a2;
  v40[4] = self;
  uint64_t v10 = v7;
  id v41 = v10;
  [v8 submitPropertiesRequestForComposition:v9 completion:v40];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_869;
  block[3] = &unk_1E5F2E530;
  objc_copyWeak(&v39, &buf);
  dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = 1;
  [(PUPhotoEditViewController *)self _handleResourceLoadChange];
  self->_isTransitioningFromDownloadingToRunningAutoCalculators = 0;
  uint64_t v11 = [(PUPhotoEditViewController *)self editSource];
  if ([v11 mediaType] != 3)
  {
    BOOL v12 = [(PUPhotoEditViewController *)self photo];
    int v13 = [v12 isLivePhoto];

    if (!v13) {
      goto LABEL_7;
    }
    uint64_t v11 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    [v11 notifyCannotSupportVideoEdits];
  }

LABEL_7:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v14 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v48 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v34 + 1) + 8 * v17++) basePhotoInvalidated];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v48 count:16];
    }
    while (v15);
  }

  uint64_t v18 = [(PUPhotoEditViewController *)self view];
  [v18 setNeedsLayout];

  [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
  [(PUPhotoEditViewController *)self _updateMutedState];
  [(PUPhotoEditViewController *)self _updateMediaViewPlaybackStyle];
  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  uint64_t v19 = [(PUPhotoEditViewController *)self photo];
  if (![v19 isOriginalRaw]) {
    goto LABEL_21;
  }
  uint64_t v20 = [(PUPhotoEditViewController *)self photo];
  if ([v20 originalResourceChoice] != 3)
  {

LABEL_21:
    goto LABEL_22;
  }
  uint64_t v21 = [(PUPhotoEditViewController *)self photo];
  int v22 = [v21 isAdjusted];

  if (v22)
  {
    if (+[PUPhotoEditSupport currentDeviceShouldAllowRawDecode])
    {
      int v23 = (void *)MEMORY[0x1E4F8CC38];
      __int16 v24 = [(PUPhotoEditViewController *)self imageProperties];
      int v25 = [v24 metadata];
      LODWORD(v23) = [v23 canLoadAssetAsRawForInteractiveEditingWithImageProperties:v25];

      if (v23) {
        [(PUPhotoEditViewController *)self _showJpegPreviewForRawRevertAlert];
      }
    }
  }
LABEL_22:
  if ([(PUPhotoEditViewController *)self currentAssetNeedsGainMap])
  {
    id v26 = objc_alloc(MEMORY[0x1E4F7A380]);
    dispatch_time_t v27 = [(PUPhotoEditViewController *)self compositionController];
    id v28 = [v27 composition];
    uint64_t v29 = (void *)[v26 initWithComposition:v28];

    [v29 setAuxiliaryImageType:7];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2_872;
    v32[3] = &unk_1E5F2B9A8;
    objc_copyWeak(&v33, &buf);
    [v29 submit:v32];
    id v30 = [MEMORY[0x1E4F8A360] sourceFilterNoOrientation];
    uint64_t v47 = v30;
    BOOL v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v29 setPipelineFilters:v31];

    [v29 setName:@"PUPhotoEditViewController-renderMeteorPlusGainMap-crop"];
    [(PUPhotoEditViewController *)self _addCropToolGainMapWithRequest:v29];
    objc_destroyWeak(&v33);
  }
  else
  {
    [(PUPhotoEditViewController *)self setGainMapImage:0];
    [(PUCropToolController *)self->_cropController setGainMapImage:0];
    [(PUPhotoEditViewController *)self setGainMapValue:0.0];
  }
  objc_destroyWeak(&v39);

  objc_destroyWeak(v42);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&buf);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke(uint64_t a1)
{
  double v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "precomputeImageValuesWithCompletion finished", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_852;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  BOOL v3 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_864(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2;
  block[3] = &unk_1E5F2C8E8;
  objc_copyWeak(v11, (id *)(a1 + 48));
  v11[1] = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_869(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _chooseInitialEditingTool];
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2_872(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v11 = 0;
  id v5 = [v3 result:&v11];

  id v6 = v11;
  if (v5)
  {
    char v7 = [v5 auxiliaryImage];
    uint64_t v8 = [v7 cgImageRef];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_3;
    block[3] = &unk_1E5F2E0A8;
    void block[4] = WeakRetained;
    void block[5] = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
    }
    uint64_t v9 = *MEMORY[0x1E4F7A758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v13 = v6;
      _os_log_error_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Could not load gain image: %@", buf, 0xCu);
    }
  }
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setGainMapImage:*(void *)(a1 + 40)];
  double v2 = *(CGImage **)(a1 + 40);
  CGImageRelease(v2);
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_2(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = *(void **)(a1 + 32);
  id v23 = 0;
  uint64_t v4 = [v3 result:&v23];
  id v5 = v23;
  if (v4)
  {
    id v6 = [v4 properties];
    char v7 = [WeakRetained photo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [WeakRetained photo];
      if (!v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v19 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v19);
        [v9 handleFailureInMethod:v18, v22, @"PUPhotoEditViewController.m", 6486, @"%@ should be an instance inheriting from %@, but it is nil", @"strongSelf.photo", v11 object file lineNumber description];
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v20 = *(void *)(a1 + 40);
        uint64_t v21 = *(void *)(a1 + 64);
        id v10 = (objc_class *)objc_opt_class();
        id v11 = NSStringFromClass(v10);
        BOOL v12 = [v8 px_descriptionForAssertionMessage];
        [v9 handleFailureInMethod:v21, v20, @"PUPhotoEditViewController.m", 6486, @"%@ should be an instance inheriting from %@, but it is %@", @"strongSelf.photo", v11, v12 object file lineNumber description];

LABEL_15:
      }
    }
    else
    {
      uint64_t v8 = 0;
    }

    id v13 = [v6 rawProperties];
    if (v13) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = [v8 RAWBadgeAttributes] != 0;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 1496) = v14;

    *(unsigned char *)(*(void *)(a1 + 40) + 1497) = [v8 isProRes];
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = *(void **)(v15 + 1664);
    *(void *)(v15 + 1664) = v6;
    id v17 = v6;

    [*(id *)(*(void *)(a1 + 40) + 1424) setImageProperties:v17];
    goto LABEL_13;
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_ERROR, "NUImagePropertiesClient for raw property returned error %@", buf, 0xCu);
  }
LABEL_13:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __64__PUPhotoEditViewController__continueLoadingWithAutocalculators__block_invoke_852(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained valuesCalculator];
  uint64_t v4 = [v3 portraitValuesWithAccuracy:0];

  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8A448]];
  char v6 = PECanRenderPortrait();
  if (v5) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1688) = v7;
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 1688)) {
      uint64_t v9 = @"Y";
    }
    else {
      uint64_t v9 = @"N";
    }
    int v30 = 138412290;
    BOOL v31 = v9;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "has depth? %@", (uint8_t *)&v30, 0xCu);
  }

  id v10 = [WeakRetained valuesCalculator];
  id v11 = [v10 semanticStyleStatistics];
  uint64_t v12 = [v11 count];

  if (PISemanticStyleIsRenderSupported())
  {
    id v13 = +[PUPhotoEditProtoSettings sharedInstance];
    *(unsigned char *)(*(void *)(a1 + 32) + 1624) = [v13 enableSemanticStyleInEdit];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1624) = 0;
  }
  BOOL v14 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v15 = (void *)[v14 allowDisabledTools];

  uint64_t v16 = *(void *)(a1 + 32);
  if (v15)
  {
    if (!*(unsigned char *)(v16 + 1624) || v12)
    {
      if (v12) {
        int v18 = [WeakRetained _isLivePhotoEffect] ^ 1;
      }
      else {
        LOBYTE(v18) = 0;
      }
    }
    else
    {
      char v17 = [WeakRetained isOriginalStyleable];
      LOBYTE(v18) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 1624) = v17;
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1625) = v18;
  }
  else
  {
    char v19 = 0;
    if (*(unsigned char *)(v16 + 1624) && v12)
    {
      char v19 = [WeakRetained _isLivePhotoEffect] ^ 1;
      uint64_t v16 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v16 + 1624) = v19;
    *(unsigned char *)(*(void *)(a1 + 32) + 1625) = 1;
  }
  [WeakRetained _updateToolbarsAnimated:1];
  [WeakRetained setRunningAutoCalculators:0];
  *(unsigned char *)(*(void *)(a1 + 32) + 1782) = 0;
  [WeakRetained updateProgressIndicatorAnimated:1];
  uint64_t v20 = [WeakRetained editSource];
  uint64_t v21 = [v20 mediaType];
  if (v21 == 3
    || ([WeakRetained editSource],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        [v15 mediaType] == 1))
  {
    uint64_t v22 = [WeakRetained photo];
    uint64_t v23 = [v22 isLivePhotoVisibilityAdjustmentAllowed];

    if (v21 == 3) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v23 = 0;
  }

LABEL_30:
  if (v5 || v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4F91150]);
    id v25 = [WeakRetained photo];
    uint64_t v26 = (void *)[v24 initWithAsset:v25 delegate:WeakRetained hasDepth:v5 != 0 hasLive:v23];
    [WeakRetained setLivePortraitBehaviorController:v26];

    dispatch_time_t v27 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v28 = [v27 changeLightingDisablesLive];
    uint64_t v29 = [WeakRetained livePortraitBehaviorController];
    [v29 setChangingPortraitLightingDisablesLive:v28];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_handleDidLoadAdjustmentsAndBaseImageWithResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 retrievedVersion];
  char v6 = [v4 compositionController];
  char v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(PUPhotoEditViewController *)self compositionController];
  }
  uint64_t v9 = v8;

  id v10 = [v9 composition];
  id v11 = [(PUPhotoEditViewController *)self quickCropContext];
  if (v11)
  {
    uint64_t v12 = [v9 composition];
    [v11 applyCropRectToCompositionController:v9];
    id v13 = [(PUPhotoEditViewController *)self undoManager];
    BOOL v14 = v13;
    if (v13 && ([v13 isUndoing] & 1) == 0 && (objc_msgSend(v14, "isRedoing") & 1) == 0)
    {
      uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F90148]) initWithCompositionController:v9 sourceComposition:v12];
      uint64_t v16 = PULocalizedString(@"PHOTOEDIT_CROP_GENERIC_ACTION_TITLE");
      [v15 setLocalizedActionName:v16];

      [v15 registerWithUndoManager:v14];
    }
  }
  if ([v4 penultimateAvailability]) {
    BOOL v17 = [v4 penultimateAvailability] == 1;
  }
  else {
    BOOL v17 = [(PUPhotoEditViewController *)self isPenultimateAvailable];
  }
  int v18 = [v4 editSource];
  char v19 = v18;
  if (self->_pluginSessionIdentifier)
  {
    objc_msgSend(v18, "setIdentifier:");
    pluginSessionIdentifier = self->_pluginSessionIdentifier;
    self->_pluginSessionIdentifier = 0;
  }
  uint64_t v21 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_DEFAULT, "processing adjustments", (uint8_t *)&buf, 2u);
  }

  [(PUPhotoEditViewController *)self setEditSource:v19];
  uint64_t v22 = [v4 contentEditingInput];
  [(PUPhotoEditViewController *)self setEditSourceContentEditingInput:v22];

  -[PUPhotoEditViewController setHasLoadedRaw:](self, "setHasLoadedRaw:", [v4 assetLoadingAsRaw]);
  [(PUPhotoEditViewController *)self setWorkImageVersion:v5];
  [(PUPhotoEditViewController *)self setPenultimateAvailable:v17];
  [(PUPhotoEditViewController *)self setCompositionController:v9];
  uint64_t v23 = [v4 originalComposition];
  [(PUPhotoEditViewController *)self setOriginalComposition:v23];

  [(PUPhotoEditViewController *)self setUneditedComposition:v10];
  [(PUPhotoEditViewController *)self _updatePhotoEditIrisModel];
  uint64_t v24 = [v4 assetLoadingAsRaw];
  id v25 = [(PUPhotoEditViewController *)self enterEditEventBuilder];
  [v25 setEditingWithRaw:v24];

  uint64_t v26 = [v4 assetLoadingAsRaw];
  dispatch_time_t v27 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
  [v27 setEditingWithRaw:v26];

  if (self->_needToReloadTools)
  {
    coreToolButtons = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    coreToolButtonViews = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    self->_toolbarButtonsValid = 0;
    [(PUPhotoEditViewController *)self _loadToolsIfNeeded:1];
    self->_needToReloadTools = 0;
  }
  if (v4) {
    [v4 videoComplementOriginalStillImageTime];
  }
  else {
    memset(v40, 0, sizeof(v40));
  }
  [(PUPhotoEditViewController *)self setOriginalStillImageTime:v40];
  int v30 = (void *)[objc_alloc(MEMORY[0x1E4F8AA60]) initWithEditSource:v19];
  BOOL v31 = [v19 source];
  objc_msgSend(v9, "setSource:mediaType:", v31, objc_msgSend(v19, "mediaType"));

  [v30 setCompositionController:v9];
  [(PUPhotoEditViewController *)self setMainRenderer:v30];
  uint64_t v32 = [v4 imageURL];
  id v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = [v4 videoComplementURL];
  }
  long long v35 = v34;

  if (v5 == 1 && v35)
  {
    long long v36 = [v4 editSource];
    [(PUPhotoEditViewController *)self _setOriginalURL:v35 originalEditSource:v36];
  }
  objc_initWeak(&buf, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __77__PUPhotoEditViewController__handleDidLoadAdjustmentsAndBaseImageWithResult___block_invoke;
  v37[3] = &unk_1E5F2E530;
  objc_copyWeak(&v38, &buf);
  [(PUPhotoEditViewController *)self _ensureCleanupResourcesWithCompletion:v37];
  objc_destroyWeak(&v38);
  objc_destroyWeak(&buf);
}

void __77__PUPhotoEditViewController__handleDidLoadAdjustmentsAndBaseImageWithResult___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _continueLoadingWithAutocalculators];
}

- (void)resourceLoader:(id)a3 request:(id)a4 downloadProgress:(double)a5
{
  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1, a4);
  progressIndicatorView = self->_progressIndicatorView;
  [(PUProgressIndicatorView *)progressIndicatorView setCurrentProgress:a5];
}

- (void)resourceLoader:(id)a3 request:(id)a4 mediaLoadDidFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(PUPhotoEditViewController *)self _didEndResourceLoading];
  [(PUPhotoEditViewController *)self _didEndEnterEdit];
  [(PUPhotoEditViewController *)self _handleResourceLoadChange];
  [(PUPhotoEditDiagnosticsManager *)self->_diagnosticsManager endMonitoring];
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = 0;

  uint64_t v12 = [(PUPhotoEditViewController *)self initialPendingEditsRequest];
  [v12 finishedWithSuccess:0 error:v10];

  [(PUPhotoEditViewController *)self _uninstallInEditRevertTransitionSnapshotAnimated:0];
  if ([v10 code] != 3072)
  {
    id v13 = [PUEditingErrorPresentationController alloc];
    BOOL v14 = [(PUPhotoEditViewController *)self photo];
    uint64_t v15 = [(PUEditingErrorPresentationController *)v13 initWithError:v10 forAsset:v14];

    objc_initWeak(&location, self);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    char v19 = __78__PUPhotoEditViewController_resourceLoader_request_mediaLoadDidFailWithError___block_invoke;
    uint64_t v20 = &unk_1E5F2E530;
    objc_copyWeak(&v21, &location);
    uint64_t v16 = [(PUErrorPresentationController *)v15 alertControllerWithCompletion:&v17];
    -[PUPhotoEditViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0, v17, v18, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __78__PUPhotoEditViewController_resourceLoader_request_mediaLoadDidFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didFinishWithChanges:0];
}

- (void)resourceLoader:(id)a3 request:(id)a4 didCompleteWithResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(PUPhotoEditViewController *)self photo];
  [(PUPhotoEditDiagnosticsManager *)self->_diagnosticsManager endMonitoring];
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = 0;

  id v13 = (void *)MEMORY[0x1E4F8FFE8];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v24[2] = __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke;
  v24[3] = &unk_1E5F29958;
  void v24[4] = self;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke_2;
  char v19 = &unk_1E5F29290;
  uint64_t v20 = self;
  id v14 = v10;
  id v21 = v14;
  id v15 = v9;
  id v22 = v15;
  objc_copyWeak(&v23, &location);
  [v13 checkIsSupportedAndPresentAlertForAsset:v11 type:0 alertControllerPresenter:v24 completionHandler:&v16];
  [(PUPhotoEditViewController *)self _didEndResourceLoading];
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

uint64_t __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __74__PUPhotoEditViewController_resourceLoader_request_didCompleteWithResult___block_invoke_2(id *a1, int a2)
{
  if (a2)
  {
    id v3 = [a1[5] adjustmentIdentifierAndVersion];
    [a1[4] setAdjustmentIdentifierAndVersion:v3];

    uint64_t v4 = [a1[6] version];
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v6 = a1[5];
    id v7 = WeakRetained;
    if (v4 == 1) {
      [WeakRetained _handleDidLoadOriginalWithResult:v6];
    }
    else {
      [WeakRetained _handleDidLoadAdjustmentsAndBaseImageWithResult:v6];
    }
  }
  else
  {
    id v7 = objc_loadWeakRetained(a1 + 7);
    [v7 didFinishWithChanges:0];
  }
}

- (void)photoEditResourceLoadRequestResourcesAvailabilityChanged:(id)a3 previousAvailability:(int64_t)a4 currentAvailability:(int64_t)a5
{
  id v8 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
  uint64_t v9 = [v8 state];

  if (v9 != 1) {
    return;
  }
  if (a4 != 1 && a5 == 1)
  {
    id v10 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
    [v10 beginInterval];

LABEL_11:
    if (a4 != 2 || a5 == 2) {
      return;
    }
    id v14 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
    [(PUPhotoEditDiagnosticsManager *)v14 endInterval];
    diagnosticsManager = v14;
    goto LABEL_14;
  }
  if (a4 == 1 && a5 != 1)
  {
    id v11 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
    [v11 endInterval];
  }
  if (a4 == 2 || a5 != 2) {
    goto LABEL_11;
  }
  uint64_t v12 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
  [v12 beginInterval];

  [(PUPhotoEditDiagnosticsManager *)self->_diagnosticsManager endMonitoring];
  diagnosticsManager = self->_diagnosticsManager;
  self->_diagnosticsManager = 0;
LABEL_14:
}

- (void)_loadOriginalImageIfNeeded
{
  id v11 = [(PUPhotoEditViewController *)self resourceLoader];
  id v3 = [(PUPhotoEditViewController *)self view];
  uint64_t v4 = [v3 window];
  uint64_t v5 = [v4 screen];

  id v6 = [(PUPhotoEditViewController *)self originalImageEditSource];
  if (v6 || !v11) {
    goto LABEL_6;
  }
  if ([v11 resourcesAvailability] == 1 || objc_msgSend(v11, "resourcesAvailability") == 2)
  {
    id v6 = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (v5)
  {
    objc_msgSend(v5, "pu_workImageSize");
    double v8 = v7;
    double v10 = v9;
    id v6 = objc_alloc_init(MEMORY[0x1E4F91188]);
    [v6 setVersion:1];
    [v6 setRequireLocalResources:1];
    [v6 setDelegate:self];
    objc_msgSend(v6, "setTargetSize:", v8, v10);
    [v11 enqueueRequest:v6];
    [(PUPhotoEditViewController *)self _didStartResourceLoading];
    goto LABEL_6;
  }
LABEL_7:
}

- (void)_loadPhotoEditResourcesIfNeeded
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PUPhotoEditViewController *)self resourceLoader];
  uint64_t v5 = [(PUPhotoEditViewController *)self view];
  id v6 = [v5 window];
  double v7 = [v6 screen];

  double v8 = [(PUPhotoEditViewController *)self editSource];
  if (v8 || [v4 resourcesAvailability] == 1 || objc_msgSend(v4, "resourcesAvailability") == 2)
  {
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
  {
    double v8 = [(PUPhotoEditViewController *)self photo];
    if (v8)
    {
      if (!v4) {
        goto LABEL_8;
      }
    }
    else
    {
      id v34 = [MEMORY[0x1E4F28B00] currentHandler];
      [v34 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:6178 description:@"Cannot have a nil asset"];

      if (!v4) {
        goto LABEL_8;
      }
    }
    double v9 = [v4 asset];

    if (v9 == v8)
    {
LABEL_9:
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaType:", objc_msgSend(v8, "mediaType"));
      uint64_t v16 = objc_msgSend(MEMORY[0x1E4F38EB8], "descriptionForMediaSubtypes:", objc_msgSend(v8, "mediaSubtypes"));
      uint64_t v17 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = [v8 uuid];
        *(_DWORD *)id buf = 138543874;
        long long v37 = v18;
        __int16 v38 = 2114;
        uint64_t v39 = v15;
        __int16 v40 = 2114;
        uint64_t v41 = v16;
        _os_log_impl(&dword_1AE9F8000, v17, OS_LOG_TYPE_DEFAULT, "Asset [%{public}@] of type: %{public}@ and subtype: %{public}@ loaded for editing.", buf, 0x20u);
      }
      long long v35 = (void *)v16;

      char v19 = [(PUPhotoEditViewController *)self compositionController];

      objc_msgSend(v7, "pu_workImageSize");
      double v21 = v20;
      double v23 = v22;
      int64_t v24 = [(PUPhotoEditViewController *)self workImageVersion];
      id v25 = [(PUPhotoEditViewController *)self photo];
      objc_opt_class();
      uint64_t v26 = (void *)v15;
      if (objc_opt_isKindOfClass())
      {
        dispatch_time_t v27 = [(PUPhotoEditViewController *)self photo];
      }
      else
      {
        dispatch_time_t v27 = 0;
      }
      BOOL v28 = v19 == 0;

      [v27 fetchPropertySetsIfNeeded];
      uint64_t v29 = [v27 spatialMediaProperties];
      BOOL v30 = [v29 spatialMediaType] == 2;

      id v31 = objc_alloc_init(MEMORY[0x1E4F91188]);
      [v31 setRequireAdjustments:v28];
      [v31 setRequireLocalResources:1];
      [v31 setVersion:v24];
      [v31 setDelegate:self];
      objc_msgSend(v31, "setTargetSize:", v21, v23);
      [v31 setRequireOriginalsDownloaded:v30];
      if (MEMORY[0x1B3E7A510]([v4 enqueueRequest:v31]))
      {
        uint64_t v32 = +[PUPhotoEditDiagnosticsManager diagnosticsManagerWithActionType:0 delegate:self];
        diagnosticsManager = self->_diagnosticsManager;
        self->_diagnosticsManager = v32;

        [(PUPhotoEditDiagnosticsManager *)self->_diagnosticsManager beginMonitoringForTimeInterval:10.0];
      }
      [(PUPhotoEditViewController *)self _didStartResourceLoading];

      goto LABEL_17;
    }
LABEL_8:
    id v10 = objc_alloc(MEMORY[0x1E4F91190]);
    id v11 = (void *)[v10 initWithAsset:v8 loadingQueue:MEMORY[0x1E4F14428]];

    uint64_t v12 = +[PUPhotoEditProtoSettings sharedInstance];
    objc_msgSend(v11, "setSkipDisplaySizeImage:", objc_msgSend(v12, "skipPHContentEditingInputDisplaySizeImage"));

    id v13 = +[PUPhotoEditProtoSettings sharedInstance];
    objc_msgSend(v11, "setSimulateEditEntryError:", objc_msgSend(v13, "simulateEditEntryError"));

    id v14 = +[PUPhotoEditProtoSettings sharedInstance];
    objc_msgSend(v11, "setSimulateEditEntryError:", objc_msgSend(v14, "simulatedEditingEntryErrorType") != 0);

    [(PUPhotoEditViewController *)self setResourceLoader:v11];
    uint64_t v4 = v11;
    goto LABEL_9;
  }
LABEL_18:
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5 = (UITapGestureRecognizer *)a3;
  id v6 = [(PUPhotoEditViewController *)self _livePhotoGestureRecognizer];
  BOOL v7 = v6 == v5;

  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (togglePreviewTapGestureRecognizer == v5) {
    return [(PUPhotoEditToolPickerController *)self->_toolPickerController selectedToolTag] != 1006
  }
        || v6 == v5;
  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self _livePhotoGestureRecognizer];
  id v6 = (id)v5;
  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (togglePreviewTapGestureRecognizer != v4 && v5 != (void)v4)
  {
    LOBYTE(v34) = 1;
    goto LABEL_16;
  }
  currentEditingTool = self->_currentEditingTool;
  if (!currentEditingTool)
  {
    LOBYTE(v34) = 1;
    goto LABEL_14;
  }
  id v10 = [(PUPhotoEditToolController *)currentEditingTool view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  [(PUPhotoEditToolController *)self->_currentEditingTool preferredPreviewViewInsets];
  [(PUPhotoEditToolController *)self->_currentEditingTool additionalPreviewViewInsets];
  UIEdgeInsetsAdd();
  CGFloat v20 = v12 + v19;
  CGFloat v22 = v14 + v21;
  CGFloat v24 = v16 - (v19 + v23);
  CGFloat v26 = v18 - (v21 + v25);
  dispatch_time_t v27 = [(PUPhotoEditToolController *)self->_currentEditingTool view];
  [v4 locationInView:v27];
  CGFloat v29 = v28;
  CGFloat v31 = v30;

  v39.origin.double x = v20;
  v39.origin.double y = v22;
  v39.size.double width = v24;
  v39.size.double height = v26;
  v38.double x = v29;
  v38.double y = v31;
  int v34 = CGRectContainsPoint(v39, v38);
  uint64_t v32 = (PUAdjustmentsToolController *)self->_currentEditingTool;
  if (v32 == self->_adjustmentsController)
  {
    BOOL v33 = 0;
    if (!v34) {
      goto LABEL_14;
    }
LABEL_12:
    if (!v33) {
      LOBYTE(v34) = [(PUPhotoEditToolController *)v32 gestureRecognizerShouldBegin:v4];
    }
    goto LABEL_14;
  }
  BOOL v33 = v32 != (PUAdjustmentsToolController *)self->_filtersController;
  if (v34) {
    goto LABEL_12;
  }
LABEL_14:
  if (v6 == v4)
  {
    long long v35 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    char v36 = [v35 isVideoEnabled];

    LOBYTE(v34) = v36 & v34;
  }
LABEL_16:
  if (self->_currentEditingTool == &self->_mediaToolController->super
    && [(PUPhotoEditViewController *)self isPortraitVideo])
  {
    LOBYTE(v34) = togglePreviewTapGestureRecognizer != v4;
  }

  return v34;
}

- (void)_updateLivePhotoPlaybackGestureRecognizer
{
  if (![(PUPhotoEditToolController *)self->_currentEditingTool suppressesEditUpdates])
  {
    id v5 = [(PUPhotoEditViewController *)self _livePhotoGestureRecognizer];
    uint64_t v3 = 1;
    [(PUPhotoEditViewController *)self _installGestureRecognizer:v5 type:1];
    [v5 setDelegate:self];
    currentEditingTool = self->_currentEditingTool;
    if (currentEditingTool) {
      uint64_t v3 = [(PUPhotoEditToolController *)currentEditingTool wantsDefaultPreviewView];
    }
    [v5 setEnabled:v3];
  }
}

- (id)_livePhotoGestureRecognizer
{
  mediaView = self->_mediaView;
  if (mediaView)
  {
    uint64_t v3 = [(NUMediaView *)mediaView _livePhotoView];
    id v4 = [v3 playbackGestureRecognizer];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_handleSwipeDownGesture:(id)a3
{
  if (self->_swipeDownGestureRecognizer == a3 && [a3 state] == 3)
  {
    self->_inProgressSaveIsFromSwipe = 1;
    [(PUPhotoEditViewController *)self _handle1upToggleButton:0];
  }
}

- (void)_updateSwipeDownGestureRecognizer
{
  if (self->_swipeDownGestureRecognizer) {
    goto LABEL_5;
  }
  uint64_t v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 swipeToExitEdit];

  if (v4)
  {
    id v5 = (UISwipeGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:self action:sel__handleSwipeDownGesture_];
    swipeDownGestureRecognizer = self->_swipeDownGestureRecognizer;
    self->_swipeDownGestureRecognizer = v5;

    [(UISwipeGestureRecognizer *)self->_swipeDownGestureRecognizer setDelegate:self];
    [(UISwipeGestureRecognizer *)self->_swipeDownGestureRecognizer setDirection:8];
  }
  if (self->_swipeDownGestureRecognizer)
  {
LABEL_5:
    -[PUPhotoEditViewController _installGestureRecognizer:type:](self, "_installGestureRecognizer:type:");
  }
}

- (void)_startShowingOriginalBadge
{
  [(PUPhotoEditViewController *)self _updateTransientStatusBadgeForPreviewingOriginal];
  uint64_t v3 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v3 previewOriginalTimesOut]
    && ([(PUPhotoEditToolController *)self->_currentEditingTool wantsTapToToggleOriginalEnabled]|| self->_showOriginalButtonTapped))
  {
    unint64_t v4 = self->_togglePreviewOriginalOffRequestID + 1;
    self->_togglePreviewOriginalOffRequestID = v4;
    [v3 previewOriginalDuration];
    double v6 = v5;
    BOOL v7 = [(PUPhotoEditViewController *)self photo];
    int v8 = [v7 canPlayLoopingVideo];
    double v9 = 1.0;
    if (v8) {
      double v9 = 2.0;
    }
    double v10 = v6 * v9;

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__PUPhotoEditViewController__startShowingOriginalBadge__block_invoke;
    v12[3] = &unk_1E5F2E0A8;
    void v12[4] = self;
    v12[5] = v4;
    dispatch_after(v11, MEMORY[0x1E4F14428], v12);
  }
  self->_showOriginalButtonTapped = 0;
}

void *__55__PUPhotoEditViewController__startShowingOriginalBadge__block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[184]) {
    return (void *)[result setShouldBePreviewingOriginal:0];
  }
  return result;
}

- (void)_toggleShowOriginal
{
  if ([(PUPhotoEditViewController *)self togglingShowOriginal])
  {
    self->_showOriginalButtonTapped = 0;
  }
  else
  {
    if ([(PUPhotoEditViewController *)self shouldBePreviewingOriginal])
    {
      BOOL v3 = 0;
    }
    else
    {
      unint64_t v4 = [(PUPhotoEditViewController *)self resourceLoader];
      BOOL v3 = [v4 resourcesAvailability] == 3;
    }
    [(PUPhotoEditViewController *)self setShouldBePreviewingOriginal:v3];
    [(PUPhotoEditViewController *)self setTogglingShowOriginal:v3];
  }
}

- (void)_handleTogglePreviewTapGesture:(id)a3
{
  unint64_t v4 = (UITapGestureRecognizer *)a3;
  if (self->_togglePreviewTapGestureRecognizer == v4)
  {
    dispatch_time_t v11 = v4;
    BOOL v5 = [(UITapGestureRecognizer *)v4 state] == 3;
    unint64_t v4 = v11;
    if (v5)
    {
      double v6 = [(PUPhotoEditViewController *)self compositionController];

      unint64_t v4 = v11;
      if (v6)
      {
        BOOL v7 = [(UITapGestureRecognizer *)v11 touches];
        int v8 = [v7 lastObject];

        uint64_t v9 = [v8 type];
        if ([(PUPhotoEditViewController *)self isStandardVideo]
          || (BOOL v10 = [(PUPhotoEditViewController *)self isLoopingVideo], v9 != 2)
          || v10)
        {
          [(PUPhotoEditViewController *)self _toggleShowOriginal];
        }
        else
        {
          [(PUPhotoEditViewController *)self _startMarkupSession];
        }

        unint64_t v4 = v11;
      }
    }
  }
}

- (void)_updateTogglePreviewGestureRecognizer
{
  togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  if (!togglePreviewTapGestureRecognizer)
  {
    unint64_t v4 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTogglePreviewTapGesture_];
    BOOL v5 = self->_togglePreviewTapGestureRecognizer;
    self->_togglePreviewTapGestureRecognizer = v4;

    [(UITapGestureRecognizer *)self->_togglePreviewTapGestureRecognizer setDelegate:self];
    togglePreviewTapGestureRecognizer = self->_togglePreviewTapGestureRecognizer;
  }
  [(PUPhotoEditViewController *)self _installGestureRecognizer:togglePreviewTapGestureRecognizer type:0];
  if (self->_livePhotoIsPlaying)
  {
    uint64_t v6 = 0;
  }
  else
  {
    currentEditingTool = self->_currentEditingTool;
    if (currentEditingTool) {
      uint64_t v6 = [(PUPhotoEditToolController *)currentEditingTool wantsTapToToggleOriginalEnabled];
    }
    else {
      uint64_t v6 = 1;
    }
  }
  int v8 = self->_togglePreviewTapGestureRecognizer;
  [(UITapGestureRecognizer *)v8 setEnabled:v6];
}

- (void)_installGestureRecognizer:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  currentEditingTool = self->_currentEditingTool;
  id v10 = v6;
  if (currentEditingTool
    && (BOOL v8 = [(PUPhotoEditToolController *)currentEditingTool supportsGesturesOfType:a4],
        id v6 = v10,
        !v8))
  {
    uint64_t v9 = [v10 view];
    [v9 removeGestureRecognizer:v10];
  }
  else
  {
    [(NUMediaView *)self->_mediaView addGestureRecognizer:v6];
  }
}

- (void)pencilInteractionDidTap:(id)a3
{
  unint64_t v4 = [(PUPhotoEditViewController *)self presentedViewController];

  if (!v4
    && ![(PUPhotoEditViewController *)self isStandardVideo]
    && ![(PUPhotoEditViewController *)self isLoopingVideo])
  {
    [(PUPhotoEditViewController *)self _startMarkupSession];
  }
}

- (void)_startMarkupSession
{
  BOOL v3 = [(PUPhotoEditViewController *)self compositionController];

  if (v3)
  {
    id v4 = [(PUPhotoEditViewController *)self photo];
    [(PUEditPluginSession *)self->_pluginSession beginMarkupSessionWithAsset:v4 fromViewController:self];
  }
}

- (void)_createPencilInteractionIfNeeded
{
  if (!self->_pencilInteraction)
  {
    id v4 = (UIPencilInteraction *)objc_alloc_init(MEMORY[0x1E4FB1A80]);
    pencilInteraction = self->_pencilInteraction;
    self->_pencilInteraction = v4;

    [(UIPencilInteraction *)self->_pencilInteraction setDelegate:self];
    mediaView = self->_mediaView;
    if (!mediaView)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 5958, @"Invalid parameter not satisfying: %@", @"_mediaView" object file lineNumber description];

      mediaView = self->_mediaView;
    }
    BOOL v7 = self->_pencilInteraction;
    [(NUMediaView *)mediaView addInteraction:v7];
  }
}

- (void)photoLibraryChangesPausedDidChange
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  int v3 = objc_msgSend(v2, "px_areChangesPaused");

  id v4 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "PUPhotoEditViewController observed library changes pause change: %d", (uint8_t *)v5, 8u);
  }
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = (void *)[(NSMutableSet *)self->_assetsWaitingForLibraryNotification copy];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        int v12 = [v4 contentOrThumbnailChangedForAsset:v11];
        double v13 = PLPhotoEditGetLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12)
        {
          if (v14)
          {
            *(_WORD *)double v15 = 0;
            _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController photoLibraryDidChangeOnMainQueue:] - change was for our photo", v15, 2u);
          }

          [(PUPhotoEditViewController *)self _stopWaitingForAssetChangeWithAsset:v11 success:1];
        }
        else
        {
          if (v14)
          {
            *(_WORD *)double v15 = 0;
            _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController photoLibraryDidChangeOnMainQueue:] - not for our photo", v15, 2u);
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  return 0;
}

- (void)_uninstallInEditRevertTransitionSnapshotAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PUPhotoEditViewController *)self _isInEditRevertTransitionSnapshotVisible])
  {
    if (v3)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke;
      v7[3] = &unk_1E5F2ED10;
      void v7[4] = self;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke_2;
      v6[3] = &unk_1E5F2CEE8;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.3];
    }
    else
    {
      BOOL v5 = [(PUPhotoEditViewController *)self inEditRevertTransitionSnapshot];
      [v5 removeFromSuperview];

      [(PUPhotoEditViewController *)self setInEditRevertTransitionSnapshot:0];
    }
  }
}

void __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) inEditRevertTransitionSnapshot];
  [v1 setAlpha:0.0];
}

uint64_t __78__PUPhotoEditViewController__uninstallInEditRevertTransitionSnapshotAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inEditRevertTransitionSnapshot];
  [v2 removeFromSuperview];

  BOOL v3 = *(void **)(a1 + 32);
  return [v3 setInEditRevertTransitionSnapshot:0];
}

- (void)_installInEditRevertTransitionSnapshot
{
  BOOL v3 = [(PUPhotoEditViewController *)self view];
  id v4 = [v3 snapshotViewAfterScreenUpdates:0];
  [(PUPhotoEditViewController *)self setInEditRevertTransitionSnapshot:v4];

  BOOL v5 = [(PUPhotoEditViewController *)self view];
  id v6 = [(PUPhotoEditViewController *)self inEditRevertTransitionSnapshot];
  [v5 addSubview:v6];

  dispatch_time_t v7 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUPhotoEditViewController__installInEditRevertTransitionSnapshot__block_invoke;
  block[3] = &unk_1E5F2ED10;
  void block[4] = self;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

uint64_t __67__PUPhotoEditViewController__installInEditRevertTransitionSnapshot__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _uninstallInEditRevertTransitionSnapshotAnimated:1];
}

- (BOOL)_isInEditRevertTransitionSnapshotVisible
{
  uint64_t v2 = [(PUPhotoEditViewController *)self inEditRevertTransitionSnapshot];
  BOOL v3 = [v2 superview];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_performInEditRevertWithToolButton:(id)a3
{
  BOOL v4 = -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", [a3 tag]);
  int64_t v5 = -[PUPhotoEditViewController _toolTypeForToolWithTag:](self, "_toolTypeForToolWithTag:", [v4 toolControllerTag]);
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  id v6 = [(PUPhotoEditViewController *)self mediaDestination];
  dispatch_time_t v7 = [(PUPhotoEditViewController *)self photo];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __64__PUPhotoEditViewController__performInEditRevertWithToolButton___block_invoke;
  v9[3] = &unk_1E5F29268;
  id v10 = v4;
  int64_t v11 = v5;
  void v9[4] = self;
  id v8 = v4;
  [v6 revertEditsForAsset:v7 completionHandler:v9];
}

void __64__PUPhotoEditViewController__performInEditRevertWithToolButton___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1824), a2);
    *(unsigned char *)(*(void *)(a1 + 32) + 1561) = 1;
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 1000);
    if (v9)
    {
      [v9 willMoveToParentViewController:0];
      id v10 = [*(id *)(*(void *)(a1 + 32) + 1000) view];
      [v10 removeFromSuperview];

      [*(id *)(*(void *)(a1 + 32) + 1000) removeFromParentViewController];
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = *(void **)(v11 + 984);
      *(void *)(v11 + 984) = 0;

      uint64_t v13 = *(void *)(a1 + 32);
      BOOL v14 = *(void **)(v13 + 1000);
      *(void *)(v13 + 1000) = 0;

      uint64_t v15 = *(void *)(a1 + 32);
      long long v16 = *(void **)(v15 + 1568);
      *(void *)(v15 + 1568) = 0;

      uint64_t v17 = *(void *)(a1 + 32);
      long long v18 = *(void **)(v17 + 1576);
      *(void *)(v17 + 1576) = 0;

      uint64_t v19 = *(void *)(a1 + 32);
      CGFloat v20 = *(void **)(v19 + 1592);
      *(void *)(v19 + 1592) = 0;

      uint64_t v21 = *(void *)(a1 + 32);
      CGFloat v22 = *(void **)(v21 + 1608);
      *(void *)(v21 + 1608) = 0;

      uint64_t v23 = *(void *)(a1 + 32);
      CGFloat v24 = *(void **)(v23 + 1600);
      *(void *)(v23 + 1600) = 0;

      *(unsigned char *)(*(void *)(a1 + 32) + 1688) = 0;
      *(unsigned char *)(*(void *)(a1 + 32) + 1624) = 0;
      uint64_t v25 = *(void *)(a1 + 32);
      CGFloat v26 = *(void **)(v25 + 1616);
      *(void *)(v25 + 1616) = 0;

      uint64_t v8 = *(void *)(a1 + 32);
    }
    dispatch_time_t v27 = *(void **)(v8 + 1384);
    *(void *)(v8 + 1384) = 0;

    [*(id *)(a1 + 32) setInitialToolType:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _resetModelAndBaseImagesToWorkImageVersion:0];
    [*(id *)(a1 + 40) setEnabled:1];
    [*(id *)(a1 + 32) _installInEditRevertTransitionSnapshot];
    [*(id *)(a1 + 32) _loadPhotoEditResourcesIfNeeded];
  }
  else
  {
    double v28 = PLUIGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v37 = v7;
      _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "error reverting to original: %@", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) isStandardVideo]) {
      CGFloat v29 = @"VIDEOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE";
    }
    else {
      CGFloat v29 = @"PHOTOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE";
    }
    double v30 = PULocalizedString(v29);
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v31 = [NSString stringWithFormat:@"%@\n\n[Internal Only] %@", v30, v7];

      double v30 = (void *)v31;
    }
    uint64_t v32 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v30 message:0 preferredStyle:1];
    BOOL v33 = (void *)MEMORY[0x1E4FB1410];
    int v34 = PULocalizedString(@"OK");
    long long v35 = [v33 actionWithTitle:v34 style:0 handler:0];

    [v32 addAction:v35];
    [*(id *)(a1 + 32) presentViewController:v32 animated:1 completion:0];
  }
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([a4 videoEnabledDidChange])
  {
    [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
    [(PUPhotoEditViewController *)self _updateSwipeDownGestureRecognizer];
    [(PUPhotoEditViewController *)self _updatePluginSession];
    self->_toolbarButtonsValid = 0;
    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(PUPhotoEditViewController *)self _allTools];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v11++) baseMediaInvalidated];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    -[NUMediaView setVideoEnabled:animated:](self->_mediaView, "setVideoEnabled:animated:", [v6 isVideoEnabled], 1);
    if (![(PUPhotoEditToolController *)self->_currentEditingTool suppressesEditUpdates])
    {
      int v12 = [(PUPhotoEditViewController *)self editSource];

      if (v12)
      {
        mediaView = self->_mediaView;
        BOOL v14 = (void *)MEMORY[0x1E4F8A748];
        uint64_t v15 = [(PUPhotoEditViewController *)self compositionController];
        long long v16 = [(PUPhotoEditViewController *)self editSource];
        uint64_t v17 = objc_msgSend(v14, "validatedCompositionCopyFor:mediaType:", v15, objc_msgSend(v16, "mediaType"));
        [(NUMediaView *)mediaView setComposition:v17];

        [(PUPhotoEditViewController *)self _updateRenderedPreviewForceRender:0];
      }
    }
  }
}

- (void)_presentWarningForIrisRemovesEditsWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 5775, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v6 = (void *)MEMORY[0x1E4FB1418];
  id v7 = PULocalizedString(@"PHOTOEDIT_LIVE_PHOTO_REMOVES_EDITS_MESSAGE");
  uint64_t v8 = [v6 alertControllerWithTitle:0 message:v7 preferredStyle:0];

  uint64_t v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v10 = PULocalizedString(@"CANCEL");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke;
  v22[3] = &unk_1E5F2E898;
  id v11 = v5;
  id v23 = v11;
  int v12 = [v9 actionWithTitle:v10 style:1 handler:v22];
  [v8 addAction:v12];

  uint64_t v13 = (void *)MEMORY[0x1E4FB1410];
  BOOL v14 = PULocalizedString(@"PHOTOEDIT_CONFIRM_REVERT_BUTTON");
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke_2;
  v20[3] = &unk_1E5F2E898;
  id v21 = v11;
  id v15 = v11;
  long long v16 = [v13 actionWithTitle:v14 style:2 handler:v20];
  [v8 addAction:v16];

  uint64_t v17 = [v8 popoverPresentationController];
  [v17 setPermittedArrowDirections:15];
  long long v18 = [(PUPhotoEditMediaToolController *)self->_mediaToolController livePhotoButton];
  [v17 setSourceView:v18];
  [v18 bounds];
  objc_msgSend(v17, "setSourceRect:");
  [v17 setDelegate:self];
  [(PUPhotoEditViewController *)self setIrisRevertConfirmationAlert:v8];
  [(PUPhotoEditViewController *)self presentViewController:v8 animated:1 completion:0];
}

uint64_t __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PUPhotoEditViewController__presentWarningForIrisRemovesEditsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleLivePhotoTouchRecognizer:(id)a3
{
  if ([a3 state] != 2)
  {
    [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  }
}

- (void)_setPlaybackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  id v6 = v5;
  if (v3 && [v5 reenablingLivePhotoShouldRemoveEdits])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__PUPhotoEditViewController__setPlaybackEnabled___block_invoke;
    v7[3] = &unk_1E5F2CEE8;
    void v7[4] = self;
    [(PUPhotoEditViewController *)self _presentWarningForIrisRemovesEditsWithCompletion:v7];
  }
  else
  {
    [v6 setVideoEnabled:v3];
  }
}

uint64_t __49__PUPhotoEditViewController__setPlaybackEnabled___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _performRevertAction];
  }
  return result;
}

- (void)toggleLivePhotoActive
{
  BOOL v3 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  if (([v3 isVideoEnabled] & 1) != 0
    || ![v3 reenablingLivePhotoShouldRemoveEdits])
  {
    id v4 = objc_alloc(MEMORY[0x1E4F901B0]);
    id v5 = [(PUPhotoEditViewController *)self compositionController];
    id v6 = (void *)[v4 initWithCompositionController:v5 livePhotoModel:v3];

    id v7 = [(PUPhotoEditViewController *)self undoManager];
    [v6 executeWithUndoManager:v7 completionHandler:&__block_literal_global_822];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    id v8[2] = __50__PUPhotoEditViewController_toggleLivePhotoActive__block_invoke;
    v8[3] = &unk_1E5F2CEE8;
    void v8[4] = self;
    [(PUPhotoEditViewController *)self _presentWarningForIrisRemovesEditsWithCompletion:v8];
  }
}

uint64_t __50__PUPhotoEditViewController_toggleLivePhotoActive__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _performRevertAction];
  }
  return result;
}

- (void)_updateMutedState
{
  BOOL v3 = [(PUPhotoEditViewController *)self compositionController];
  id v5 = [v3 adjustmentControllerForKey:*MEMORY[0x1E4F8A498]];

  if (v5) {
    uint64_t v4 = [v5 enabled];
  }
  else {
    uint64_t v4 = [(PUPhotoEditViewController *)self hasLoopingVideoAdjustment];
  }
  [(NUMediaView *)self->_mediaView setMuted:v4];
}

- (void)applyAutoEnhance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  autoEnhanceController = self->_autoEnhanceController;
  uint64_t v9 = [(PUPhotoEditViewController *)self valuesCalculator];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  id v11[2] = __57__PUPhotoEditViewController_applyAutoEnhance_completion___block_invoke;
  v11[3] = &unk_1E5F29240;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [(PEAutoAdjustmentController *)autoEnhanceController enableAutoEnhanceOnCompositionController:v6 valuesCalculator:v9 completionHandler:v11];

  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

uint64_t __57__PUPhotoEditViewController_applyAutoEnhance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateProgressIndicatorAnimated:1];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = objc_msgSend(v4, "ppt_afterAutoenhanceBlock");

  if (v5)
  {
    id v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "ppt_afterAutoenhanceBlock");
    id v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    id v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v8, "setPpt_afterAutoenhanceBlock:", 0);

    v7[2](v7);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)_handleAutoEnhanceButton:(id)a3
{
  if (([(PEAutoAdjustmentController *)self->_autoEnhanceController isBusy] & 1) == 0)
  {
    id v8 = [(PUPhotoEditViewController *)self compositionController];
    if (!v8)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:5694 description:@"Need a compositionController to compute AutoEnhance"];
    }
    id v5 = [(PUPhotoEditViewController *)self valuesCalculator];

    if (!v5)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:5695 description:@"Need a valuesCalculator to compute AutoEnhance"];
    }
    if ([MEMORY[0x1E4F91118] isAutoEnhanceEnabledForCompositionController:v8]) {
      [(PEAutoAdjustmentController *)self->_autoEnhanceController disableAutoEnhanceOnCompositionController:v8];
    }
    else {
      [(PUPhotoEditViewController *)self applyAutoEnhance:v8 completion:0];
    }
  }
}

- (void)_presentMarkup
{
  id v3 = [(PUPhotoEditViewController *)self photo];
  [(PUEditPluginSession *)self->_pluginSession beginMarkupSessionWithAsset:v3 fromViewController:self];
}

- (BOOL)_canPresentMarkup
{
  if ([(PUPhotoEditViewController *)self isLoopingVideo]
    || [(PUPhotoEditViewController *)self isStandardVideo])
  {
    return 0;
  }
  pluginSession = self->_pluginSession;
  return [(PUEditPluginSession *)pluginSession markupIsAvailable];
}

- (void)_handleZoomButton:(id)a3
{
  id v13 = [(PUPhotoEditViewController *)self mediaView];
  if ([(PUPhotoEditViewController *)self _isZoomedIn])
  {
    [v13 minimumZoomScale];
    objc_msgSend(v13, "setZoomScale:animated:", 1);
  }
  else
  {
    id v4 = [v13 _renderView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v13, "zoomToRect:animated:", 1, v6, v8, v10, v12);
  }
}

- (void)_updateZoomButton
{
  if (self->_zoomButton)
  {
    BOOL v3 = [(PUPhotoEditViewController *)self _isZoomedIn];
    zoomButton = self->_zoomButton;
    [(PUPhotoEditToolbarButton *)zoomButton setSelected:v3];
  }
}

- (BOOL)_isZoomedIn
{
  uint64_t v2 = [(PUPhotoEditViewController *)self mediaView];
  BOOL v3 = [v2 _scrollView];

  [v3 zoomScale];
  double v5 = v4;
  [v3 minimumZoomScale];
  LOBYTE(v2) = v5 > v6 * 1.05;

  return (char)v2;
}

- (id)_internalActionsSubmenu
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4FB13F0];
  double v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ant.circle"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __52__PUPhotoEditViewController__internalActionsSubmenu__block_invoke;
  BOOL v14 = &unk_1E5F2E7A8;
  objc_copyWeak(&v15, &location);
  double v5 = [v3 actionWithTitle:@"File a Radar" image:v4 identifier:0 handler:&v11];

  v17[0] = v5;
  double v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v11, v12, v13, v14);
  double v7 = [(PUPhotoEditToolController *)self->_currentEditingTool internalToolActionsForMenu];
  if (v7)
  {
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

    double v6 = (void *)v8;
  }
  double v9 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v6];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

void __52__PUPhotoEditViewController__internalActionsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fileRadar];
}

- (id)_toolActionsSubmenu
{
  uint64_t v2 = [(PUPhotoEditToolController *)self->_currentEditingTool toolActionsForMenu];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_extensionsSubmenu
{
  id v24[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  BOOL v3 = [(PUPhotoEditViewController *)self _canPresentExtensions];
  double v4 = (void *)MEMORY[0x1E4FB13F0];
  double v5 = PULocalizedString(@"MARKUP_BUTTON_TITLE");
  double v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pencil.tip.crop.circle"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke;
  v21[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v22, &location);
  double v7 = [v4 actionWithTitle:v5 image:v6 identifier:0 handler:v21];

  if ([(PUPhotoEditViewController *)self _markupGetsItsOwnButton]
    || ![(PUPhotoEditViewController *)self _canPresentMarkup]
    || !v3)
  {
    [v7 setAttributes:4];
  }
  uint64_t v8 = (void *)MEMORY[0x1E4FB13F0];
  double v9 = PULocalizedString(@"PLUGIN_MENU_ITEM_TITLE");
  double v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"app.connected.to.app.below.fill"];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  long long v18 = __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke_2;
  long long v19 = &unk_1E5F2E7A8;
  objc_copyWeak(&v20, &location);
  uint64_t v11 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:&v16];

  if (!v3) {
    objc_msgSend(v11, "setAttributes:", 4, v16, v17, v18, v19);
  }
  uint64_t v12 = (void *)MEMORY[0x1E4FB1970];
  v24[0] = v7;
  v24[1] = v11;
  id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v24, 2, v16, v17, v18, v19);
  BOOL v14 = [v12 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v13];

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  return v14;
}

void __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentMarkup];
}

void __47__PUPhotoEditViewController__extensionsSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentExtensions];
}

- (id)_appearanceSubmenu
{
  v25[3] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v2 = [MEMORY[0x1E4FB1818] systemImageNamed:@"appearance"];
  int64_t v3 = +[PUPhotoEditAppearancePreference preferredAppearance];
  double v4 = (void *)MEMORY[0x1E4FB13F0];
  double v5 = PULocalizedString(@"PHOTOEDIT_APPEARANCE_MENU_ITEM_SYSTEM");
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke;
  v22[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v23, &location);
  double v6 = [v4 actionWithTitle:v5 image:v2 identifier:0 handler:v22];

  [v6 setState:v3 == 0];
  double v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = PULocalizedString(@"PHOTOEDIT_APPEARANCE_MENU_ITEM_DARK");
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_2;
  v20[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v21, &location);
  double v9 = [v7 actionWithTitle:v8 image:v2 identifier:0 handler:v20];

  [v9 setState:v3 == 1];
  double v10 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v11 = PULocalizedString(@"PHOTOEDIT_APPEARANCE_MENU_ITEM_LIGHT");
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_3;
  v18[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v19, &location);
  uint64_t v12 = [v10 actionWithTitle:v11 image:v2 identifier:0 handler:v18];

  [v12 setState:v3 == 2];
  id v13 = (void *)MEMORY[0x1E4FB1970];
  BOOL v14 = PULocalizedString(@"PHOTOEDIT_APPEARANCE_MENU_TITLE");
  v25[0] = v6;
  v25[1] = v9;
  v25[2] = v12;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v16 = [v13 menuWithTitle:v14 image:v2 identifier:0 options:0 children:v15];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v16;
}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPreferredAppearance:0];
}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPreferredAppearance:1];
}

void __47__PUPhotoEditViewController__appearanceSubmenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPreferredAppearance:2];
}

- (id)_copyPasteEditsSubmenu
{
  v23[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  int64_t v3 = (void *)MEMORY[0x1E4FB13F0];
  double v4 = PULocalizedString(@"PHOTOEDIT_COPY_ADJUST");
  double v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"slider.horizontal.2.square.on.square"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke;
  v20[3] = &unk_1E5F2E7A8;
  objc_copyWeak(&v21, &location);
  double v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v20];

  if (![(PUPhotoEditViewController *)self _canCopyEdits]) {
    [v6 setAttributes:1];
  }
  double v7 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v8 = PULocalizedString(@"PHOTOEDIT_PASTE_ADJUST");
  double v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"slider.horizontal.2.square.badge.arrow.down"];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke_2;
  long long v18 = &unk_1E5F2E7A8;
  objc_copyWeak(&v19, &location);
  double v10 = [v7 actionWithTitle:v8 image:v9 identifier:0 handler:&v15];

  if (![(PUPhotoEditViewController *)self _canPasteEdits]) {
    [v10 setAttributes:1];
  }
  uint64_t v11 = (void *)MEMORY[0x1E4FB1970];
  v23[0] = v6;
  v23[1] = v10;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  id v13 = [v11 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v12];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return v13;
}

void __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _copyEditsSkippingOptions:0];
}

void __51__PUPhotoEditViewController__copyPasteEditsSubmenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pasteEdits];
}

- (id)_saveAsDuplicateSubmenu
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  int64_t v3 = (void *)MEMORY[0x1E4FB13F0];
  double v4 = PULocalizedString(@"PHOTOEDIT_SAVE_AS_DUPLICATE_ACTION_TITLE");
  double v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus.square.on.square"];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __52__PUPhotoEditViewController__saveAsDuplicateSubmenu__block_invoke;
  BOOL v14 = &unk_1E5F2E7A8;
  objc_copyWeak(&v15, &location);
  double v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:&v11];

  if (![(PUPhotoEditViewController *)self _hasUnsavedChanges]) {
    [v6 setAttributes:1];
  }
  double v7 = (void *)MEMORY[0x1E4FB1970];
  v17[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v9 = [v7 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v8];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v9;
}

void __52__PUPhotoEditViewController__saveAsDuplicateSubmenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSaveAction:1];
}

- (id)_undoRedoSubmenu
{
  v29[2] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  int64_t v3 = [(PUPhotoEditViewController *)self undoManager];
  double v4 = (void *)MEMORY[0x1E4FB13F0];
  double v5 = [(PUPhotoEditViewController *)self undoManager];
  double v6 = [v5 undoMenuItemTitle];
  double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.backward"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke;
  v26[3] = &unk_1E5F2ADC0;
  id v8 = v3;
  id v27 = v8;
  double v9 = [v4 actionWithTitle:v6 image:v7 identifier:0 handler:v26];

  [v9 setAttributes:8];
  if (([v8 canUndo] & 1) == 0) {
    objc_msgSend(v9, "setAttributes:", objc_msgSend(v9, "attributes") | 1);
  }
  double v10 = (void *)MEMORY[0x1E4FB13F0];
  id v11 = objc_loadWeakRetained(&location);
  uint64_t v12 = [v11 undoManager];
  id v13 = [v12 redoMenuItemTitle];
  BOOL v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.uturn.forward"];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  id v23 = __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke_2;
  CGFloat v24 = &unk_1E5F2ADC0;
  id v15 = v8;
  id v25 = v15;
  uint64_t v16 = [v10 actionWithTitle:v13 image:v14 identifier:0 handler:&v21];

  objc_msgSend(v16, "setAttributes:", 8, v21, v22, v23, v24);
  if (([v15 canRedo] & 1) == 0) {
    objc_msgSend(v16, "setAttributes:", objc_msgSend(v16, "attributes") | 1);
  }
  uint64_t v17 = (void *)MEMORY[0x1E4FB1970];
  v29[0] = v9;
  v29[1] = v16;
  long long v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v19 = [v17 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:1 children:v18];

  objc_destroyWeak(&location);
  return v19;
}

uint64_t __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) undo];
}

uint64_t __45__PUPhotoEditViewController__undoRedoSubmenu__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) redo];
}

- (void)_reloadMoreButtonMenu
{
  id v3 = [(PUPhotoEditViewController *)self _moreButtonMenu];
  [(PUPhotoEditToolbarButton *)self->_moreButton setMenu:v3];
}

- (void)_produceMoreButtonMenuElementsWithCompletion:(id)a3
{
  uint64_t v17 = (void (**)(id, id))a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = [(PUPhotoEditViewController *)self _copyPasteEditsSubmenu];
  [v4 addObject:v5];

  double v6 = [(PUPhotoEditViewController *)self photo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(PUPhotoEditViewController *)self _saveAsDuplicateSubmenu];
    [v4 addObject:v8];
  }
  double v9 = +[PUPhotoEditProtoSettings sharedInstance];
  int v10 = [v9 lightModeEditor];

  if (v10)
  {
    id v11 = [(PUPhotoEditViewController *)self _appearanceSubmenu];
    [v4 addObject:v11];
  }
  uint64_t v12 = [(PUPhotoEditViewController *)self _extensionsSubmenu];
  [v4 addObject:v12];

  id v13 = [(PUPhotoEditViewController *)self _undoRedoSubmenu];
  [v4 addObject:v13];

  uint64_t v14 = [(PUPhotoEditViewController *)self _toolActionsSubmenu];
  id v15 = (void *)v14;
  if (v14) {
    uint64_t v14 = [v4 addObject:v14];
  }
  if (MEMORY[0x1B3E7A510](v14))
  {
    uint64_t v16 = [(PUPhotoEditViewController *)self _internalActionsSubmenu];
    [v4 addObject:v16];
  }
  v17[2](v17, v4);
}

- (id)_moreButtonMenu
{
  v15[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __44__PUPhotoEditViewController__moreButtonMenu__block_invoke;
  uint64_t v12 = &unk_1E5F29218;
  objc_copyWeak(&v13, &location);
  id v3 = [v2 elementWithUncachedProvider:&v9];
  id v4 = (void *)MEMORY[0x1E4FB1970];
  id v5 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"ellipsis.circle", v9, v10, v11, v12);
  v15[0] = v3;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  double v7 = [v4 menuWithTitle:&stru_1F06BE7B8 image:v5 identifier:0 options:0 children:v6];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

void __44__PUPhotoEditViewController__moreButtonMenu__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _produceMoreButtonMenuElementsWithCompletion:v3];
}

- (void)_presentExtensions
{
  id v3 = [(PUPhotoEditViewController *)self photo];
  [(PUEditPluginSession *)self->_pluginSession beginSessionWithAsset:v3 fromViewController:self sourceElement:self->_moreButton includeMarkupInList:[(PUPhotoEditViewController *)self _markupGetsItsOwnButton] ^ 1];
}

- (BOOL)_canPresentExtensions
{
  if (![(PUPhotoEditViewController *)self _enableSpatialMediaEditing]
    && [(PUPhotoEditViewController *)self isSpatialMedia])
  {
    return 0;
  }
  pluginSession = self->_pluginSession;
  return [(PUEditPluginSession *)pluginSession isAvailable];
}

- (void)_notifyDelegateSaveFinishedIfReadyWithAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = @"NO";
    if ([(PUPhotoEditViewController *)self _isWaitingForAssetChange]) {
      double v7 = @"YES";
    }
    else {
      double v7 = @"NO";
    }
    if ([(PUPhotoEditViewController *)self _isWaitingForSaveCompletion]) {
      double v6 = @"YES";
    }
    *(_DWORD *)id buf = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 1024;
    int v17 = [(PUPhotoEditViewController *)self saveCompletionDismissalState];
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "_notifyDelegateSaveFinishedIfReadyWithAsset: isWaitingForAssetChange: %@ isWaitingForSaveCompletion: %@   saveCompletionDismissalState: %d", buf, 0x1Cu);
  }

  if (![(PUPhotoEditViewController *)self _isWaitingForAssetChange]
    && ![(PUPhotoEditViewController *)self _isWaitingForSaveCompletion]
    && [(PUPhotoEditViewController *)self saveCompletionDismissalState] != 3)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    objc_msgSend(v8, "px_unregisterChangeObserver:", self);

    dispatch_time_t v9 = dispatch_time(0, 100000000);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    CMTime v10[2] = __73__PUPhotoEditViewController__notifyDelegateSaveFinishedIfReadyWithAsset___block_invoke;
    v10[3] = &unk_1E5F2ECC8;
    void v10[4] = self;
    id v11 = v4;
    dispatch_after(v9, MEMORY[0x1E4F14428], v10);
  }
}

uint64_t __73__PUPhotoEditViewController__notifyDelegateSaveFinishedIfReadyWithAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFinishWithAsset:*(void *)(a1 + 40) savedChanges:1];
}

- (void)_cancelInProgressSaveRequest
{
  if (self->_inProgressSaveRequestID)
  {
    id v3 = [(PUPhotoEditViewController *)self mediaDestination];
    [v3 cancelRequestWithIdentifier:self->_inProgressSaveRequestID];

    self->_inProgressSaveRequestID = 0;
  }
}

- (BOOL)_isSaveProgressAvailable
{
  if (!self->_inProgressSaveRequestID) {
    return 0;
  }
  uint64_t v2 = self;
  id v3 = [(PUPhotoEditViewController *)self mediaDestination];
  LOBYTE(v2) = [v3 supportsProgressForRequestWithIdentifier:v2->_inProgressSaveRequestID];

  return (char)v2;
}

- (void)_updateSaveProgress
{
  if ([(PUPhotoEditViewController *)self _isSaveProgressAvailable])
  {
    id v3 = [(PUPhotoEditViewController *)self mediaDestination];
    [v3 progressForRequestWithIdentifier:self->_inProgressSaveRequestID];
    double v5 = v4 * 0.95;

    progressIndicatorView = self->_progressIndicatorView;
    [(PUProgressIndicatorView *)progressIndicatorView setCurrentProgress:v5];
  }
}

- (void)_stopMonitoringSaveProgress
{
  saveProgressTimer = self->_saveProgressTimer;
  if (saveProgressTimer)
  {
    dispatch_source_cancel(saveProgressTimer);
    double v4 = self->_saveProgressTimer;
    self->_saveProgressTimer = 0;
  }
}

- (void)_startMonitoringSaveProgressIfNeeded
{
  if (self->_saveProgressTimer)
  {
    uint64_t v2 = PLPhotoEditGetLog();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      return;
    }
    LOWORD(buf[0]) = 0;
    id v3 = "Attempted to begin monitoring photo edit save progress while monitoring is already in progress";
    double v4 = v2;
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
    _os_log_impl(&dword_1AE9F8000, v4, v5, v3, (uint8_t *)buf, 2u);
    goto LABEL_5;
  }
  if ([(PUPhotoEditViewController *)self _isSaveProgressAvailable])
  {
    double v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    saveProgressTimer = self->_saveProgressTimer;
    self->_saveProgressTimer = v7;

    dispatch_time_t v9 = self->_saveProgressTimer;
    if (!v9)
    {
      uint64_t v2 = PLPhotoEditGetLog();
      if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      LOWORD(buf[0]) = 0;
      id v3 = "Unable to create timer to monitor photo edit save progress";
      double v4 = v2;
      os_log_type_t v5 = OS_LOG_TYPE_ERROR;
      goto LABEL_4;
    }
    dispatch_time_t v10 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v9, v10, 0x1DCD6500uLL, 0x5F5E100uLL);
    objc_initWeak(buf, self);
    id v11 = self->_saveProgressTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __65__PUPhotoEditViewController__startMonitoringSaveProgressIfNeeded__block_invoke;
    handler[3] = &unk_1E5F2E530;
    objc_copyWeak(&v13, buf);
    dispatch_source_set_event_handler(v11, handler);
    dispatch_resume((dispatch_object_t)self->_saveProgressTimer);
    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __65__PUPhotoEditViewController__startMonitoringSaveProgressIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateSaveProgress];
}

- (BOOL)_isWaitingForSaveCompletion
{
  return [(PUPhotoEditViewController *)self saveCompletionDismissalState] == 1;
}

- (void)_stopWaitingForSaveRequestWithAsset:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_log_type_t v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _stopWaitingForSaveRequestWithAsset:] - asset: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 3;
  }
  self->_inProgressSaveRequestID = 0;
  [(PUPhotoEditViewController *)self _stopMonitoringSaveProgress];
  [(PUPhotoEditViewController *)self setSaveCompletionDismissalState:v6];
  [(PUPhotoEditViewController *)self _notifyDelegateSaveFinishedIfReadyWithAsset:v4];
}

- (void)_startWaitingForSaveRequestID:(int)a3
{
  os_log_type_t v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _startWaitingForSaveRequestID:]", v6, 2u);
  }

  [(PUPhotoEditViewController *)self setSaveCompletionDismissalState:1];
  self->_inProgressSaveRequestID = a3;
  [(PUPhotoEditViewController *)self _startMonitoringSaveProgressIfNeeded];
}

- (BOOL)_isWaitingForAssetChange
{
  return [(PUPhotoEditViewController *)self assetChangeDismissalState] == 1;
}

- (void)_stopWaitingForAssetChangeWithAsset:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSMutableSet *)self->_assetsWaitingForLibraryNotification removeObject:v6];
  if (![(NSMutableSet *)self->_assetsWaitingForLibraryNotification count])
  {
    int v7 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v4;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _stopWaitingForAssetChangeWithAsset:success:] - success: %d", (uint8_t *)v10, 8u);
    }

    id v8 = [(PUPhotoEditViewController *)self assetChangeTimeoutTimer];
    [v8 invalidate];

    [(PUPhotoEditViewController *)self setAssetChangeTimeoutTimer:0];
    if (v4) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 3;
    }
    [(PUPhotoEditViewController *)self setAssetChangeDismissalState:v9];
    [(PUPhotoEditViewController *)self _notifyDelegateSaveFinishedIfReadyWithAsset:v6];
  }
}

- (void)_timeoutWaitingForAssetChange
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  int v4 = objc_msgSend(v3, "px_areChangesPaused");

  os_log_type_t v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 67109120;
    int v9 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "PUPhotoEditViewController timeout while waiting for an asset change from the library. Are Library Changes Paused: %d", (uint8_t *)&v8, 8u);
  }

  id v6 = [(PUPhotoEditViewController *)self photo];
  [(PUPhotoEditViewController *)self _stopWaitingForAssetChangeWithAsset:v6 success:0];

  int v7 = PXAssertGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    int v8 = 67109120;
    int v9 = v4;
    _os_log_fault_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_FAULT, "Timeout waiting for asset change. Paused: %d", (uint8_t *)&v8, 8u);
  }
}

- (void)_startTimeoutTimerForAssetChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v3 = ([(PUPhotoEditViewController *)self assetChangeDismissalState] & 0xFFFFFFFFFFFFFFFELL) == 2;
  int v4 = PLPhotoEditGetLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "PUPhotoEditViewController not starting timeout timer as we are already in a terminal state for asset change notifications", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = objc_msgSend(v6, "px_areChangesPaused");
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_DEFAULT, "PUPhotoEditViewController starting asset change timeout timer. Are Library Changes Paused: %d", (uint8_t *)&buf, 8u);
    }
    objc_initWeak(&buf, self);
    int v7 = (void *)MEMORY[0x1E4F1CB00];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __61__PUPhotoEditViewController__startTimeoutTimerForAssetChange__block_invoke;
    v9[3] = &unk_1E5F28EB0;
    objc_copyWeak(&v10, &buf);
    int v8 = [v7 scheduledTimerWithTimeInterval:0 repeats:v9 block:30.0];
    [(PUPhotoEditViewController *)self setAssetChangeTimeoutTimer:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&buf);
  }
}

void __61__PUPhotoEditViewController__startTimeoutTimerForAssetChange__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _timeoutWaitingForAssetChange];
}

- (void)_startWaitingForAssetChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    assetsWaitingForLibraryNotification = self->_assetsWaitingForLibraryNotification;
    if (!assetsWaitingForLibraryNotification)
    {
      id v6 = (NSMutableSet *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
      int v7 = self->_assetsWaitingForLibraryNotification;
      self->_assetsWaitingForLibraryNotification = v6;

      assetsWaitingForLibraryNotification = self->_assetsWaitingForLibraryNotification;
    }
    [(NSMutableSet *)assetsWaitingForLibraryNotification addObject:v4];
    int v8 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = [(NSMutableSet *)self->_assetsWaitingForLibraryNotification count];
      int v11 = 138412546;
      id v12 = v4;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _startWaitingForAssetChange] for %@; now waiting on %d assets",
        (uint8_t *)&v11,
        0x12u);
    }

    [(PUPhotoEditViewController *)self setAssetChangeDismissalState:1];
    id v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    objc_msgSend(v10, "px_registerChangeObserver:", self);
  }
}

- (void)_performDiscardAction
{
  BOOL v3 = PLPhotoEditGetLog();
  if ([(PUPhotoEditViewController *)self _isWaitingForSaveCompletion]
    && os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_DEFAULT, "User initiated discard while save is in progress", buf, 2u);
  }
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  BOOL v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ExitEditCancelAction", " enableTelemetry=YES ", buf, 2u);
  }

  [(PUPhotoEditViewController *)self _didStartExitAction];
  stashedSnapshot = self->_stashedSnapshot;
  if (stashedSnapshot)
  {
    int v8 = [(PUPhotoEditSnapshot *)stashedSnapshot adjustmentData];

    if (v8)
    {
      int v9 = self->_stashedSnapshot;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __50__PUPhotoEditViewController__performDiscardAction__block_invoke;
      v12[3] = &unk_1E5F291F0;
      int v14 = self;
      os_signpost_id_t v15 = v4;
      __int16 v13 = v6;
      [(PUPhotoEditViewController *)self _restoreSnapshot:v9 withCompletionHandler:v12];
    }
    else
    {
      [(PUPhotoEditViewController *)self _performRevertAction];
    }
  }
  else
  {
    [(PUPhotoEditViewController *)self didFinishWithChanges:0];
    id v10 = v6;
    int v11 = v10;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v11, OS_SIGNPOST_INTERVAL_END, v4, "ExitEditCancelAction", " enableTelemetry=YES ", buf, 2u);
    }

    [(PUPhotoEditViewController *)self _didEndExitActionWithSessionKeys:0];
  }
}

void __50__PUPhotoEditViewController__performDiscardAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = *(id *)(a1 + 32);
  int v8 = v7;
  os_signpost_id_t v9 = *(void *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v8, OS_SIGNPOST_EVENT, v9, "ExitEditCancelAction", "Restoring with stashed snapshot", buf, 2u);
  }

  if (v6)
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "error restoring snapshot: %@", buf, 0xCu);
    }
  }
  dispatch_time_t v11 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PUPhotoEditViewController__performDiscardAction__block_invoke_755;
  block[3] = &unk_1E5F2D2C8;
  int8x16_t v13 = *(int8x16_t *)(a1 + 32);
  id v12 = (id)v13.i64[0];
  int8x16_t v15 = vextq_s8(v13, v13, 8uLL);
  uint64_t v16 = *(void *)(a1 + 48);
  dispatch_after(v11, MEMORY[0x1E4F14428], block);
}

uint64_t __50__PUPhotoEditViewController__performDiscardAction__block_invoke_755(uint64_t a1)
{
  [*(id *)(a1 + 32) didFinishWithChanges:0];
  uint64_t v2 = *(id *)(a1 + 40);
  BOOL v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ExitEditCancelAction", " enableTelemetry=YES ", v6, 2u);
  }

  return [*(id *)(a1 + 32) _didEndExitActionWithSessionKeys:0];
}

- (void)_performRevertAction
{
  BOOL v3 = PLPhotoEditGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  id v5 = v3;
  id v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ExitEditRevertAction", " enableTelemetry=YES ", buf, 2u);
  }

  [(PUPhotoEditViewController *)self _didStartExitAction];
  [(PUPhotoEditViewController *)self setRevertingToOriginal:1];
  int v7 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
  self->_downloadingForRevert = [v7 baseVersion] != 0;

  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
  int v8 = (void *)MEMORY[0x1E4F8A358];
  os_signpost_id_t v9 = [(PUPhotoEditViewController *)self uneditedComposition];
  id v10 = (void *)[v8 newCompositionControllerWithComposition:v9];

  dispatch_time_t v11 = [(PUPhotoEditViewController *)self compositionController];
  id v12 = [v11 composition];

  if (MEMORY[0x1B3E7A510]())
  {
    int8x16_t v13 = +[PUPhotoEditDiagnosticsManager diagnosticsManagerWithActionType:2 delegate:self];
    diagnosticsManager = self->_diagnosticsManager;
    self->_diagnosticsManager = v13;

    [(PUPhotoEditDiagnosticsManager *)self->_diagnosticsManager beginMonitoringForTimeInterval:10.0];
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke;
  v18[3] = &unk_1E5F291C8;
  void v18[4] = self;
  id v19 = v10;
  id v20 = v12;
  uint64_t v21 = v6;
  os_signpost_id_t v22 = v4;
  int8x16_t v15 = v6;
  id v16 = v12;
  id v17 = v10;
  [(PUPhotoEditViewController *)self asShotCompositionController:v18];
}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke_740;
    aBlock[3] = &unk_1E5F29150;
    objc_copyWeak(v33, location);
    id v28 = *(id *)(a1 + 40);
    id v7 = v5;
    id v29 = v7;
    id v8 = *(id *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 32);
    id v30 = v8;
    uint64_t v31 = v9;
    id v10 = *(id *)(a1 + 56);
    dispatch_time_t v11 = *(void **)(a1 + 64);
    id v32 = v10;
    v33[1] = v11;
    id v12 = _Block_copy(aBlock);
    *(unsigned char *)(*(void *)(a1 + 32) + 1544) = 0;
    [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
    int8x16_t v13 = [v7 composition];
    [*(id *)(a1 + 32) setOriginalComposition:v13];

    int v14 = *(void **)(a1 + 32);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke_754;
    v22[3] = &unk_1E5F291A0;
    id v15 = v7;
    uint64_t v16 = *(void *)(a1 + 32);
    id v23 = v15;
    uint64_t v24 = v16;
    id v25 = v6;
    id v17 = v12;
    id v26 = v17;
    uint64_t v18 = [v14 _revertToEmptyCompositionWithCompletionHandler:v22];
    id v19 = *(void **)(a1 + 32);
    id v20 = [v19 photo];
    [v19 _startWaitingForAssetChange:v20];

    [*(id *)(a1 + 32) _startWaitingForSaveRequestID:v18];
    objc_destroyWeak(v33);
    objc_destroyWeak(location);
  }
  else
  {
    uint64_t v21 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_DEFAULT, "_performRevertAction: contentEditingInput did not come back from requestContentEditingInputWithOptions", (uint8_t *)location, 2u);
    }

    [*(id *)(a1 + 32) setRevertingToOriginal:0];
    [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
  }
}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke_740(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = PXLocalizedString();
  [WeakRetained _commitEditSessionActionWithAsset:v6 initialCompositionController:v8 savedCompositionController:v9 localizedActionName:v10];

  [WeakRetained _startTimeoutTimerForAssetChange];
  [WeakRetained _didEndExitActionWithSessionKeys:0 initialComposition:*(void *)(a1 + 48)];
  [WeakRetained _stopWaitingForSaveRequestWithAsset:v6];

  [*(id *)(*(void *)(a1 + 56) + 1760) endMonitoring];
  uint64_t v11 = *(void *)(a1 + 56);
  id v12 = *(void **)(v11 + 1760);
  *(void *)(v11 + 1760) = 0;

  [WeakRetained setRevertingToOriginal:0];
  [WeakRetained updateProgressIndicatorAnimated:1];
  if (!v6)
  {
    int8x16_t v13 = PLUIGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "error reverting to original: %@", buf, 0xCu);
    }

    int v14 = [WeakRetained photo];
    [WeakRetained _stopWaitingForAssetChangeWithAsset:v14 success:0];

    if ([WeakRetained isStandardVideo]) {
      id v15 = @"VIDEOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE";
    }
    else {
      id v15 = @"PHOTOEDIT_EDIT_REVERT_TO_ORIGINAL_FAILED_TITLE";
    }
    uint64_t v16 = PULocalizedString(v15);
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v17 = [NSString stringWithFormat:@"%@\n\n[Internal Only] %@", v16, v5];

      uint64_t v16 = (void *)v17;
    }
    uint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v16 message:0 preferredStyle:1];
    id v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = PULocalizedString(@"OK");
    uint64_t v21 = [v19 actionWithTitle:v20 style:0 handler:0];

    [v18 addAction:v21];
    [WeakRetained presentViewController:v18 animated:1 completion:0];
  }
  os_signpost_id_t v22 = *(id *)(a1 + 64);
  id v23 = v22;
  os_signpost_id_t v24 = *(void *)(a1 + 80);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ExitEditRevertAction", " enableTelemetry=YES ", buf, 2u);
  }
}

void __49__PUPhotoEditViewController__performRevertAction__block_invoke_754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([MEMORY[0x1E4F8A748] isIdentityCompositionController:*(void *)(a1 + 32)])
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __49__PUPhotoEditViewController__performRevertAction__block_invoke_2;
    v11[3] = &unk_1E5F29178;
    uint64_t v9 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    uint64_t v10 = [v7 _saveRevertedComposition:v8 contentEditingInput:v9 withCompletionHandler:v11];
    if (([*(id *)(a1 + 40) _isSaveProgressAvailable] & 1) == 0)
    {
      [*(id *)(a1 + 40) _startWaitingForSaveRequestID:v10];
      [*(id *)(a1 + 40) updateProgressIndicatorAnimated:1];
    }
  }
}

uint64_t __49__PUPhotoEditViewController__performRevertAction__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)asShotCompositionController:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F39028]);
  [v6 setResultHandlerQueue:MEMORY[0x1E4F14428]];
  [v6 setNetworkAccessAllowed:1];
  id v7 = [(PUPhotoEditViewController *)self photo];
  objc_msgSend(v6, "setOriginalChoice:", objc_msgSend(v7, "originalResourceChoice"));

  [v6 setForceRunAsUnadjustedAsset:1];
  [v6 setForceReturnFullLivePhoto:1];
  [v6 setSkipDisplaySizeImage:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __57__PUPhotoEditViewController_asShotCompositionController___block_invoke;
  v14[3] = &unk_1E5F29100;
  void v14[4] = self;
  [v6 setProgressHandler:v14];
  objc_initWeak(&location, self);
  uint64_t v8 = [(PUPhotoEditViewController *)self photo];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = __57__PUPhotoEditViewController_asShotCompositionController___block_invoke_2;
  v10[3] = &unk_1E5F29128;
  objc_copyWeak(v12, &location);
  id v9 = v5;
  v12[1] = (id)a2;
  void v10[4] = self;
  id v11 = v9;
  [v8 requestContentEditingInputWithOptions:v6 completionHandler:v10];

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

uint64_t __57__PUPhotoEditViewController_asShotCompositionController___block_invoke(uint64_t a1, double a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 1504) setCurrentProgress:a2 * 0.95];
}

void __57__PUPhotoEditViewController_asShotCompositionController___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    if (v3)
    {
      id v5 = objc_loadWeakRetained((id *)(a1 + 48));
      id v21 = 0;
      id v6 = [MEMORY[0x1E4F911A0] editSourceForContentEditingInput:v3 useEmbeddedPreview:0 error:&v21];
      id v7 = v21;
      if (v6)
      {
        id v20 = 0;
        uint64_t v8 = [MEMORY[0x1E4F911A0] compositionControllerForContentEditingInput:v3 asShot:1 source:v6 error:&v20];
        id v9 = v20;
        if (v8)
        {
          id v10 = objc_alloc(MEMORY[0x1E4F8CC48]);
          id v11 = [v3 fullSizeImageURL];
          id v12 = (void *)[v10 initWithMediaURL:v11 timeZoneLookup:0];

          int8x16_t v13 = (void *)MEMORY[0x1E4F911C0];
          int v14 = [v5 compositionController];
          [v3 livePhoto];
          id v19 = v5;
          id v15 = v7;
          uint64_t v17 = v16 = v9;
          uint64_t v18 = [v13 repairedAsShotCompositionController:v8 forCurrentCompositionController:v14 isLivePhoto:v17 != 0 metadata:v12];

          id v9 = v16;
          id v7 = v15;
          id v5 = v19;
        }
        else
        {
          uint64_t v18 = 0;
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

- (int)_revertToEmptyCompositionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoEditViewController *)self uneditedComposition];
  id v6 = (void *)[MEMORY[0x1E4F8A358] newCompositionControllerWithComposition:v5];
  int64_t v7 = [(PUPhotoEditViewController *)self workImageVersion];
  uint64_t v8 = [(PUPhotoEditViewController *)self photo];
  char v9 = [v8 isAdjusted];

  if ((v9 & 1) == 0
    && ([MEMORY[0x1E4F8A748] isIdentityCompositionController:v6]
      ? (BOOL v10 = v7 == 1)
      : (BOOL v10 = 0),
        v10))
  {
    id v15 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _revertToEmptyCompositionWithCompletionHandler:]: resetting in memory", buf, 2u);
    }

    [(PUPhotoEditViewController *)self _resetModelAndBaseImagesToWorkImageVersion:1];
    if (v4)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      void v17[2] = __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke_738;
      v17[3] = &unk_1E5F2EA60;
      void v17[4] = self;
      id v18 = v4;
      dispatch_async(MEMORY[0x1E4F14428], v17);
    }
    int v14 = 0;
  }
  else
  {
    id v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _revertToEmptyCompositionWithCompletionHandler:]: using -[PEMediaDestination revertEditsForAsset:completionHandler:] to revert", buf, 2u);
    }

    id v12 = [(PUPhotoEditViewController *)self mediaDestination];
    int8x16_t v13 = [(PUPhotoEditViewController *)self photo];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke;
    v19[3] = &unk_1E5F290D8;
    void v19[4] = self;
    id v20 = v4;
    int v14 = [v12 revertEditsForAsset:v13 completionHandler:v19];
  }
  return v14;
}

void __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  char v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "-[PEMediaDestination revertEditsForAsset:completionHandler:] complete; saved asset: %@",
      (uint8_t *)&v11,
      0xCu);
  }

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1824), a2);
    [*(id *)(a1 + 32) _resetModelAndBaseImagesToWorkImageVersion:1];
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void __76__PUPhotoEditViewController__revertToEmptyCompositionWithCompletionHandler___block_invoke_738(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) photo];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (int)_saveRevertedComposition:(id)a3 contentEditingInput:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PUPhotoEditViewController *)self _newOutputForContentEditingInput:a4 compositionController:v9];
  int v11 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEFAULT, "-[PUPhotoEditViewController _saveRevertedComposition:contentEditingInput:withCompletionHandler:]: using -[PEMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoEditModel:useRawIfAvailable:completionHandler:] to revert", buf, 2u);
  }

  id v12 = [(PUPhotoEditViewController *)self mediaDestination];
  uint64_t v13 = [(PUPhotoEditViewController *)self photo];
  int v14 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  uint64_t v15 = [v14 editingVisibility];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __96__PUPhotoEditViewController__saveRevertedComposition_contentEditingInput_withCompletionHandler___block_invoke;
  id v21 = &unk_1E5F290D8;
  os_signpost_id_t v22 = self;
  id v23 = v8;
  id v16 = v8;
  LODWORD(v15) = [v12 saveInternalEditsForAsset:v13 usingCompositionController:v9 contentEditingOutput:v10 version:1 livePhotoState:v15 completionHandler:&v18];

  -[PUPhotoEditViewController updateProgressIndicatorAnimated:](self, "updateProgressIndicatorAnimated:", 1, v18, v19, v20, v21, v22);
  return v15;
}

void __96__PUPhotoEditViewController__saveRevertedComposition_contentEditingInput_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v6;
  id v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "-[PEMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoEditModel:useRawIfAvailable:completionHandler:] complete; savedAsset: %@",
      (uint8_t *)&v11,
      0xCu);
  }

  if (v8) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 1824), a2);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
  [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
}

- (void)_handleRevertButton:(id)a3
{
  BOOL v4 = [(PUPhotoEditViewController *)self isStandardVideo];
  id v5 = @"PHOTOEDIT_CONFIRM_REVERT_MESSAGE";
  if (v4) {
    id v5 = @"VIDEOEDIT_CONFIRM_REVERT_MESSAGE";
  }
  id v6 = v5;
  id v7 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
  id v8 = [v7 originalAdjustmentData];

  if (v8
    && ([MEMORY[0x1E4F8A290] locallySupportedFormatVersions],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [v8 formatVersion],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v9 indexOfObject:v10],
        v10,
        v9,
        v11 == 0x7FFFFFFFFFFFFFFFLL))
  {
    id v12 = @"PHOTOEDIT_UNSUPPORTED_REVERT_WARNING";
    if (v4) {
      id v12 = @"VIDEOEDIT_UNSUPPORTED_REVERT_WARNING";
    }
    uint64_t v13 = v12;

    int v14 = @"PHOTOEDIT_IGNORE_REVERT_WARNING";
    id v6 = v13;
  }
  else
  {
    int v14 = @"PHOTOEDIT_CONFIRM_REVERT_BUTTON";
  }
  uint64_t v15 = PULocalizedString(v6);
  id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v15 preferredStyle:0];
  uint64_t v17 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v18 = PULocalizedString(v14);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  id v24[2] = __49__PUPhotoEditViewController__handleRevertButton___block_invoke;
  void v24[3] = &unk_1E5F2BF98;
  void v24[4] = self;
  uint64_t v19 = [v17 actionWithTitle:v18 style:2 handler:v24];
  [v16 addAction:v19];

  id v20 = (void *)MEMORY[0x1E4FB1410];
  id v21 = PULocalizedString(@"CANCEL");
  os_signpost_id_t v22 = [v20 actionWithTitle:v21 style:1 handler:0];
  [v16 addAction:v22];

  id v23 = [v16 popoverPresentationController];
  [v23 setDelegate:self];
  [v23 setPermittedArrowDirections:15];
  [(PUPhotoEditViewController *)self setRevertConfirmationAlert:v16];
  [(PUPhotoEditViewController *)self presentViewController:v16 animated:1 completion:0];
}

uint64_t __49__PUPhotoEditViewController__handleRevertButton___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) aggregateSession];
  [v2 finishSessionWithEnd:1];

  id v3 = [*(id *)(a1 + 32) exitEditEventBuilder];
  [v3 setSessionEndReason:1];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "_allTools", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v8) prepareForSave:*(void *)(*((void *)&v10 + 1) + 8 * v8) == *(void *)(*(void *)(a1 + 32) + 1000)];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return [*(id *)(a1 + 32) _performRevertAction];
}

- (void)_handleDoneAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditNotchButton *)self->_mainActionButton menu];

  if (v5)
  {
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v7 = PULocalizedString(@"EDITED_TRIM_TITLE");
    uint64_t v8 = PULocalizedString(@"EDITED_TRIM_MESSAGE");
    id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    long long v10 = (void *)MEMORY[0x1E4FB1410];
    long long v11 = PULocalizedString(@"EDITED_TRIM_SAVE_VIDEO");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __47__PUPhotoEditViewController__handleDoneAction___block_invoke;
    v22[3] = &unk_1E5F2DCA8;
    objc_copyWeak(&v23, &location);
    long long v12 = [v10 actionWithTitle:v11 style:0 handler:v22];
    [v9 addAction:v12];

    long long v13 = (void *)MEMORY[0x1E4FB1410];
    int v14 = PULocalizedString(@"EDITED_TRIM_SAVE_AS_NEW_CLIP");
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__PUPhotoEditViewController__handleDoneAction___block_invoke_2;
    v20[3] = &unk_1E5F2DCA8;
    objc_copyWeak(&v21, &location);
    uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:v20];
    [v9 addAction:v15];

    id v16 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v17 = PULocalizedString(@"EDITED_TRIM_CANCEL");
    uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:0];
    [v9 addAction:v18];

    uint64_t v19 = [v9 popoverPresentationController];
    [v19 setSourceView:self->_mainActionButton];
    [(PUPhotoEditViewController *)self presentViewController:v9 animated:1 completion:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }
  else
  {
    [(PUPhotoEditViewController *)self _handleDoneButton:v4];
  }
}

void __47__PUPhotoEditViewController__handleDoneAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSaveAction:0];
}

void __47__PUPhotoEditViewController__handleDoneAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSaveAction:1];
}

- (void)_handleDoneButton:(id)a3
{
  if ([(PUPhotoEditViewController *)self isSpatialMedia]
    && ([(PUPhotoEditViewController *)self photo],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 mediaType],
        v4,
        v5 != 2))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4FB1418];
    uint64_t v7 = PELocalizedString();
    uint64_t v8 = PELocalizedString();
    id v9 = [v6 alertControllerWithTitle:v7 message:v8 preferredStyle:1];

    long long v10 = (void *)MEMORY[0x1E4FB1410];
    long long v11 = PELocalizedString();
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__PUPhotoEditViewController__handleDoneButton___block_invoke;
    v20[3] = &unk_1E5F2BF98;
    void v20[4] = self;
    long long v12 = [v10 actionWithTitle:v11 style:0 handler:v20];
    [v9 addAction:v12];

    long long v13 = (void *)MEMORY[0x1E4FB1410];
    int v14 = PELocalizedString();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __47__PUPhotoEditViewController__handleDoneButton___block_invoke_2;
    v19[3] = &unk_1E5F2BF98;
    void v19[4] = self;
    uint64_t v15 = [v13 actionWithTitle:v14 style:0 handler:v19];
    [v9 addAction:v15];

    id v16 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v17 = PULocalizedString(@"CANCEL");
    uint64_t v18 = [v16 actionWithTitle:v17 style:1 handler:&__block_literal_global_706];
    [v9 addAction:v18];

    [(PUPhotoEditViewController *)self presentViewController:v9 animated:1 completion:0];
  }
  else
  {
    [(PUPhotoEditViewController *)self _handleSaveAction:0];
  }
}

uint64_t __47__PUPhotoEditViewController__handleDoneButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSaveAction:0];
}

uint64_t __47__PUPhotoEditViewController__handleDoneButton___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSaveAction:1];
}

- (void)_commitSaveAsCopyWithAsset:(id)a3
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc(MEMORY[0x1E4F8FF38]);
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    uint64_t v7 = (void *)[v4 initWithSourceIdentifier:v6 variant:@"SaveAsCopy" assetCount:1 userConfirmation:4];

    uint64_t v8 = (PXAction *)[objc_alloc(MEMORY[0x1E4F90610]) initWithAsset:v10 record:v7];
    executedSessionAction = self->_executedSessionAction;
    self->_executedSessionAction = v8;
  }
}

- (void)_commitEditSessionActionWithAsset:(id)a3 initialCompositionController:(id)a4 savedCompositionController:(id)a5 localizedActionName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = objc_alloc_init(MEMORY[0x1E4F8FF50]);
    id v15 = objc_alloc_init(MEMORY[0x1E4F28F90]);
    [v14 setProgress:v15];

    [v14 setShowCheckmarkOnCompletion:1];
    [v14 setShouldAutoDisplay:1];
    [v14 setShouldUseProgressText:1];
    id v16 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke;
    v34[3] = &unk_1E5F2ED10;
    id v35 = v16;
    id v29 = v16;
    [v14 setCancellationHandler:v34];
    uint64_t v17 = self;
    id v31 = v11;
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F910D0]) initWithCompositionController:v11 asset:v10];
    id v30 = v12;
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F910D0]) initWithCompositionController:v12 asset:v10];
    id v20 = objc_alloc(MEMORY[0x1E4F901B8]);
    id v21 = [MEMORY[0x1E4F910D8] sharedPresetManager];
    os_signpost_id_t v22 = [v14 progress];
    id v23 = [MEMORY[0x1E4F91280] defaultManager];
    os_signpost_id_t v24 = (PXAction *)[v20 initWithPresetManager:v21 asset:v10 sourcePreset:v18 targetPreset:v19 syncProgress:v22 asyncLoadingStatusManager:v23];

    id v25 = +[PUPhotoEditProtoSettings sharedInstance];
    -[PXAction setAllowSynchronousRendering:](v24, "setAllowSynchronousRendering:", [v25 allowSynchronousBatchRendering]);

    [(PXAction *)v24 setLocalizedActionName:v13];
    executedSessionAction = v17->_executedSessionAction;
    v17->_executedSessionAction = v24;
    uint64_t v27 = v24;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    void v32[2] = __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke_2;
    v32[3] = &unk_1E5F290B0;
    id v33 = v14;
    id v28 = v14;
    [(PXAction *)v27 setCompletionHandler:v32];

    id v12 = v30;
    id v11 = v31;
  }
}

uint64_t __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelCurrentBatchAction];
}

uint64_t __139__PUPhotoEditViewController__commitEditSessionActionWithAsset_initialCompositionController_savedCompositionController_localizedActionName___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideAnimated:0 allowDelay:0];
}

- (void)_handleSaveAction:(int64_t)a3
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(PUPhotoEditViewController *)self _hasUnsavedChanges];
  BOOL v6 = v5;
  if (a3 || !v5 || [(PUPhotoEditViewController *)self workImageVersion] != 1) {
    goto LABEL_8;
  }
  BOOL v7 = [(PUPhotoEditViewController *)self _canCurrentCompositionControllerBeReverted];
  uint64_t v8 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  if (v8)
  {
    id v9 = [(PUPhotoEditViewController *)self photoEditIrisModel];
    int v10 = [v9 isVideoEnabled] ^ 1;
  }
  else
  {
    int v10 = 0;
  }

  if ((v7 | v10))
  {
LABEL_8:
    id v11 = [(PUPhotoEditViewController *)self photo];
    int v12 = [v11 isContentAdjustmentAllowed];

    id v13 = [(PUPhotoEditViewController *)self workImageVersion];
    uint64_t v71 = [(PUPhotoEditViewController *)self compositionController];
    long long v70 = [(PUPhotoEditViewController *)self uneditedComposition];
    long long v69 = (void *)[MEMORY[0x1E4F8A358] newCompositionControllerWithComposition:v70];
    id v14 = +[PUPhotoEditProtoSettings sharedInstance];
    int v15 = [v14 alwaysShowDoneButton];

    if (self->_stashedSnapshot)
    {
      id v16 = [(PUPhotoEditViewController *)self aggregateSession];
      [v16 setPluginSaved:1];
    }
    uint64_t v17 = PLPhotoEditGetLog();
    uint64_t v18 = (char *)os_signpost_id_generate(v17);
    uint64_t v19 = v17;
    id v20 = v19;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v20, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v18, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    [(PUPhotoEditViewController *)self _didStartExitAction];
    if ((v12 & (v15 | v6)) != 1)
    {
      if (self->_stashedSnapshot)
      {
        id v43 = [(PUPhotoEditViewController *)self aggregateSession];
        id v37 = [v43 finishSessionWithEnd:0 newCompositionController:0 oldCompositionController:0];
      }
      else
      {
        id v37 = 0;
      }
      [(PUPhotoEditViewController *)self didFinishWithChanges:0];
      double v44 = v20;
      id v45 = v44;
      if ((unint64_t)(v18 - 1) < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v44))
      {
        *(_WORD *)id buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v45, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v18, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
      }

      [(PUPhotoEditViewController *)self _didEndExitActionWithSessionKeys:v37];
      goto LABEL_56;
    }
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v21 = [(PUPhotoEditViewController *)self _allTools];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v109 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v106;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v106 != v23) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v105 + 1) + 8 * i) prepareForSave:*(UIViewController **)(*((void *)&v105 + 1) + 8 * i) == self->_currentTool];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v109 count:16];
      }
      while (v22);
    }

    id v25 = [v71 smartToneAdjustmentController];
    int v26 = [v25 enabled];

    if (v26)
    {
      uint64_t v27 = *MEMORY[0x1E4F8A598];
      v102[0] = MEMORY[0x1E4F143A8];
      v102[1] = 3221225472;
      v102[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke;
      v102[3] = &unk_1E5F28F28;
      id v103 = v71;
      v104 = self;
      [v103 modifyAdjustmentWithKey:v27 modificationBlock:v102];
    }
    if ([(PUPhotoEditViewController *)self isStandardVideo])
    {
      id v28 = [(PUPhotoEditViewController *)self mediaView];
      id v29 = [v28 player];
      [v29 pause];
    }
    id v30 = [(PUPhotoEditViewController *)self aggregateSession];
    id v31 = [v30 finishSessionWithEnd:0 newCompositionController:v71 oldCompositionController:v69];

    id v32 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    [v32 setSessionEndReason:0];

    if (a3 == 2) {
      uint64_t v33 = 1;
    }
    else {
      uint64_t v33 = 2 * (a3 == 1);
    }
    int v34 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    [v34 setSaveActionType:v33];

    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3;
    aBlock[3] = &unk_1E5F28F78;
    objc_copyWeak(v100, &location);
    id v95 = v69;
    id v35 = v71;
    id v96 = v35;
    v97 = self;
    v100[1] = v13;
    char v36 = v20;
    v98 = v36;
    v100[2] = v18;
    id v37 = v31;
    id v99 = v37;
    uint64_t v38 = _Block_copy(aBlock);
    if (a3 == 2)
    {
      if ([(PUPhotoEditViewController *)self isStandardVideo])
      {
        uint64_t v47 = [(PUPhotoEditViewController *)self mediaView];
        char v48 = [v47 _didReleaseAVObjects];

        if ((v48 & 1) == 0)
        {
          uint64_t v49 = [(PUPhotoEditViewController *)self mediaView];
          [v49 _releaseAVObjects];

          uint64_t v50 = [(PUPhotoEditMediaToolController *)self->_mediaToolController trimController];
          [v50 releaseAVObjects];
        }
      }
      uint64_t v51 = [(PUPhotoEditViewController *)self photo];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        id v63 = [MEMORY[0x1E4F28B00] currentHandler];
        [v63 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:4840 description:@"PUPhotoEditSaveActionBurnInTrimToNewClip: photo must be PHAsset"];
      }
      id v40 = [(PUPhotoEditViewController *)self photo];
      [(PUPhotoEditViewController *)self setBurningInTrim:1];
      [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:1];
      id v66 = [(PUPhotoEditViewController *)self originalComposition];
      if (v66)
      {
        long long v68 = objc_msgSend(MEMORY[0x1E4F8A358], "newCompositionControllerWithComposition:");
        uint64_t v53 = [v35 source];
        objc_msgSend(v68, "setSource:mediaType:", v53, objc_msgSend(v35, "mediaType"));
      }
      else
      {
        long long v68 = 0;
      }
      id v65 = v35;
      id v58 = [(PUPhotoEditMediaToolController *)self->_mediaToolController cinematographyScript];
      id v59 = (void *)MEMORY[0x1E4F911D8];
      uint64_t v60 = MEMORY[0x1E4F14428];
      id v61 = MEMORY[0x1E4F14428];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_679;
      v72[3] = &unk_1E5F29088;
      void v72[4] = self;
      uint64_t v73 = v36;
      uint64_t v76 = v18;
      id v74 = v37;
      id v75 = v38;
      id v62 = (id)[v59 burnInTrimToNewAsset:v40 compositionController:v65 asShotCompositionController:v68 cinematographyScript:v58 queue:v60 completion:v72];
    }
    else if (a3 == 1)
    {
      long long v54 = [(PUPhotoEditViewController *)self photo];
      objc_opt_class();
      char v55 = objc_opt_isKindOfClass();

      if ((v55 & 1) == 0)
      {
        id v64 = [MEMORY[0x1E4F28B00] currentHandler];
        [v64 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:4751 description:@"PUPhotoEditSaveActionSaveAsDuplicate: photo must be PHAsset"];
      }
      long long v56 = [(PUPhotoEditViewController *)self photo];
      *(void *)id buf = 0;
      v89 = buf;
      uint64_t v90 = 0x3032000000;
      v91 = __Block_byref_object_copy__61118;
      v92 = __Block_byref_object_dispose__61119;
      id v93 = 0;
      long long v57 = [v56 photoLibrary];
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_658;
      v85[3] = &unk_1E5F2E0D0;
      v85[4] = self;
      id v86 = v56;
      v87 = buf;
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_661;
      v77[3] = &unk_1E5F29060;
      v77[4] = self;
      uint64_t v78 = v36;
      v84 = v18;
      id v79 = v37;
      v83 = buf;
      id v40 = v86;
      id v80 = v40;
      id v81 = v35;
      id v82 = v38;
      [v57 performChanges:v85 completionHandler:v77];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (a3)
      {
LABEL_55:

        objc_destroyWeak(v100);
        objc_destroyWeak(&location);
LABEL_56:

        return;
      }
      CGRect v39 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
      id v40 = [(PUPhotoEditViewController *)self _newOutputForContentEditingInput:v39 compositionController:v35];

      uint64_t v41 = [(PUPhotoEditViewController *)self photo];
      uint64_t v42 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
      (*((void (**)(void *, void *, id, void *, id, void))v38 + 2))(v38, v41, v35, v42, v40, 0);
    }
    goto LABEL_55;
  }
  int v46 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v46, OS_LOG_TYPE_DEFAULT, "Saving edits via revert to avoid render", buf, 2u);
  }

  [(PUPhotoEditViewController *)self _performRevertAction];
}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F8A598];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2;
  v4[3] = &unk_1E5F28F00;
  id v2 = *(void **)(a1 + 32);
  void v4[4] = *(void *)(a1 + 40);
  return [v2 modifyAdjustmentWithKey:v1 modificationBlock:v4];
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, int a6)
{
  id v10 = a2;
  id v11 = a5;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v14 = WeakRetained;
  if (a6)
  {
    [WeakRetained _commitSaveAsCopyWithAsset:v10];
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = PULocalizedString(@"EDIT_BUTTON_TITLE");
    [v14 _commitEditSessionActionWithAsset:v10 initialCompositionController:v15 savedCompositionController:v16 localizedActionName:v17];
  }
  uint64_t v18 = [v14 mediaView];
  if (([v11 isAsyncAdjustment] & 1) == 0
    && [*(id *)(a1 + 48) isStandardVideo]
    && ([v18 _didReleaseAVObjects] & 1) == 0)
  {
    [v18 _releaseAVObjects];
    uint64_t v19 = [*(id *)(*(void *)(a1 + 48) + 1600) trimController];
    [v19 releaseAVObjects];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v21 = [v14 mediaDestination];
  uint64_t v22 = *(void *)(a1 + 80);
  uint64_t v23 = [*(id *)(a1 + 48) photoEditIrisModel];
  uint64_t v24 = [v23 editingVisibility];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  id v33[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4;
  void v33[3] = &unk_1E5F28F50;
  uint64_t v25 = *(void *)(a1 + 48);
  void v33[4] = v14;
  v33[5] = v25;
  CFAbsoluteTime v37 = Current;
  id v26 = v10;
  id v34 = v26;
  id v27 = *(id *)(a1 + 56);
  uint64_t v28 = *(void *)(a1 + 88);
  id v35 = v27;
  uint64_t v38 = v28;
  id v36 = *(id *)(a1 + 64);
  uint64_t v29 = [v21 saveInternalEditsForAsset:v26 usingCompositionController:v12 contentEditingOutput:v11 version:v22 livePhotoState:v24 completionHandler:v33];

  *(unsigned char *)(*(void *)(a1 + 48) + 1524) = [v11 isAsyncAdjustment];
  [v14 _startWaitingForSaveRequestID:v29];
  [v14 _startWaitingForAssetChange:v26];
  if (MEMORY[0x1B3E7A510]([v14 updateProgressIndicatorAnimated:1]))
  {
    uint64_t v30 = +[PUPhotoEditDiagnosticsManager diagnosticsManagerWithActionType:1 delegate:*(void *)(a1 + 48)];
    uint64_t v31 = *(void *)(a1 + 48);
    id v32 = *(void **)(v31 + 1760);
    *(void *)(v31 + 1760) = v30;

    [*(id *)(*(void *)(a1 + 48) + 1760) beginMonitoringForTimeInterval:10.0];
  }
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_658(uint64_t a1)
{
  id v7 = objc_alloc_init(MEMORY[0x1E4F38F20]);
  if ([*(id *)(a1 + 32) workImageVersion] == 1
    && [*(id *)(a1 + 32) isStandardVideo])
  {
    [v7 setCopyOriginal:1];
  }
  id v2 = [MEMORY[0x1E4F38F28] creationRequestForAssetCopyFromAsset:*(void *)(a1 + 40) options:v7];
  id v3 = [v2 placeholderForCreatedAsset];
  uint64_t v4 = [v3 localIdentifier];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_661(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_662;
  v12[3] = &unk_1E5F29038;
  char v21 = a2;
  BOOL v6 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v7 = v6;
  uint64_t v8 = *(void *)(a1 + 88);
  id v14 = v7;
  uint64_t v20 = v8;
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 80);
  id v15 = v9;
  uint64_t v19 = v10;
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_679(uint64_t a1, void *a2, void *a3)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    [*(id *)(a1 + 32) setBurningInTrim:0];
    [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
    id v15 = PULocalizedString(@"VIDEOEDIT_EDIT_SAVE_FAILED_TITLE");
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v16 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY] %@", v15, v6];

      id v15 = (void *)v16;
    }
    id v17 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v15 message:0 preferredStyle:1];
    id v18 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v19 = PULocalizedString(@"OK");
    uint64_t v20 = [v18 actionWithTitle:v19 style:0 handler:0];
    [v17 addAction:v20];

    [*(id *)(a1 + 32) presentViewController:v17 animated:1 completion:0];
    char v21 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v37 = v6;
      _os_log_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "error burning in trim to new asset: %@", buf, 0xCu);
    }

    uint64_t v22 = *(id *)(a1 + 40);
    uint64_t v23 = v22;
    os_signpost_id_t v24 = *(void *)(a1 + 64);
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    [*(id *)(a1 + 32) _didEndExitActionWithSessionKeys:*(void *)(a1 + 48)];
    goto LABEL_18;
  }
  id v7 = (void *)MEMORY[0x1E4F8A748];
  uint64_t v8 = [v5 compositionController];
  if (([v7 isIdentityCompositionController:v8] & 1) == 0)
  {

    goto LABEL_17;
  }
  id v9 = [v5 compositionController];
  uint64_t v10 = [v9 slomoAdjustmentController];

  if (v10)
  {
LABEL_17:
    uint64_t v25 = *(void **)(a1 + 32);
    id v26 = [v5 asset];
    id v27 = [v5 compositionController];
    uint64_t v28 = [v25 _shouldRequestAsyncAdjustmentForAsset:v26 compositionController:v27];

    uint64_t v29 = (void *)MEMORY[0x1E4F911A0];
    uint64_t v30 = [v5 contentEditingInput];
    uint64_t v31 = [v5 compositionController];
    id v32 = [v5 asset];
    id v15 = [v29 contentEditingOutputForContentEditingInput:v30 compositionController:v31 asset:v32 async:v28 onlyChangingOriginalChoice:0];

    uint64_t v33 = *(void *)(a1 + 56);
    id v17 = [v5 asset];
    id v34 = [v5 compositionController];
    id v35 = [v5 contentEditingInput];
    (*(void (**)(uint64_t, void *, void *, void *, void *, uint64_t))(v33 + 16))(v33, v17, v34, v35, v15, 1);

LABEL_18:
    goto LABEL_19;
  }
  [*(id *)(a1 + 32) setBurningInTrim:0];
  id v11 = *(id *)(a1 + 40);
  id v12 = v11;
  os_signpost_id_t v13 = *(void *)(a1 + 64);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
  }

  id v14 = *(void **)(a1 + 32);
  id v15 = [v5 asset];
  [v14 didFinishWithAsset:v15 savedChanges:1];
LABEL_19:
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_662(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 104))
  {
    id v2 = (void *)MEMORY[0x1E4F38EB8];
    uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    uint64_t v4 = [*(id *)(a1 + 64) photoLibrary];
    id v5 = [v4 librarySpecificFetchOptions];
    id v6 = [v2 fetchAssetsWithLocalIdentifiers:v3 options:v5];
    id v7 = [v6 firstObject];

    if (([*(id *)(a1 + 32) _hasUnsavedChanges] & 1) == 0)
    {
      [*(id *)(a1 + 32) didFinishWithAsset:v7 savedChanges:1];
      goto LABEL_17;
    }
    uint64_t v8 = objc_opt_new();
    [v8 setForceReturnFullLivePhoto:1];
    [v8 setContentMode:0];
    [v8 setSkipDisplaySizeImage:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_664;
    v28[3] = &unk_1E5F28FA0;
    void v28[4] = *(void *)(a1 + 32);
    [v8 setCanHandleRAW:v28];
    [v8 setCanHandleAdjustmentData:&__block_literal_global_669];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_671;
    v21[3] = &unk_1E5F29010;
    void v21[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 96);
    id v22 = v9;
    uint64_t v27 = v10;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 72);
    id v26 = *(id *)(a1 + 80);
    id v7 = v7;
    id v25 = v7;
    [v7 requestContentEditingInputWithOptions:v8 completionHandler:v21];
  }
  else
  {
    if ([*(id *)(a1 + 32) isStandardVideo]) {
      id v11 = @"VIDEOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    else {
      id v11 = @"PHOTOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    PULocalizedString(v11);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v12 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY] %@", v7, *(void *)(a1 + 40)];

      id v7 = (id)v12;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v7 message:0 preferredStyle:1];
    os_signpost_id_t v13 = (void *)MEMORY[0x1E4FB1410];
    id v14 = PULocalizedString(@"OK");
    id v15 = [v13 actionWithTitle:v14 style:0 handler:0];
    [v8 addAction:v15];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
    uint64_t v16 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      *(_DWORD *)id buf = 138412290;
      uint64_t v31 = v17;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_ERROR, "error creating duplicate: %@", buf, 0xCu);
    }

    id v18 = *(id *)(a1 + 48);
    uint64_t v19 = v18;
    os_signpost_id_t v20 = *(void *)(a1 + 96);
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v19, OS_SIGNPOST_INTERVAL_END, v20, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    [*(id *)(a1 + 32) _didEndExitActionWithSessionKeys:*(void *)(a1 + 56)];
  }

LABEL_17:
}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke_664(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasLoadedRaw];
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_3_671(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4_672;
  block[3] = &unk_1E5F28FE8;
  id v13 = v5;
  id v14 = v6;
  id v7 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 80);
  id v16 = v8;
  uint64_t v21 = v9;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 72);
  id v19 = *(id *)(a1 + 64);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4_672(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v15 = (id)[*(id *)(a1 + 48) _newOutputForContentEditingInput:v2 compositionController:*(void *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
  else
  {
    id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F395F8]];
    if ([*(id *)(a1 + 48) isStandardVideo]) {
      uint64_t v4 = @"VIDEOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    else {
      uint64_t v4 = @"PHOTOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    id v5 = PULocalizedString(v4);
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v6 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY] %@", v5, v3];

      id v5 = (void *)v6;
    }
    id v7 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:0 preferredStyle:1];
    id v8 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v9 = PULocalizedString(@"OK");
    id v10 = [v8 actionWithTitle:v9 style:0 handler:0];
    [v7 addAction:v10];

    [*(id *)(a1 + 48) presentViewController:v7 animated:1 completion:0];
    id v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "error saving as duplicate: %@", buf, 0xCu);
    }

    uint64_t v12 = *(id *)(a1 + 56);
    id v13 = v12;
    os_signpost_id_t v14 = *(void *)(a1 + 96);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)id buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
    }

    [*(id *)(a1 + 48) _didEndExitActionWithSessionKeys:*(void *)(a1 + 64)];
  }
}

uint64_t __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2_666(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F911A0] adjustmentDataIsSupported:a2];
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 setBurningInTrim:0];
  [*(id *)(a1 + 32) _startTimeoutTimerForAssetChange];
  [*(id *)(a1 + 32) _stopWaitingForSaveRequestWithAsset:v7];

  [*(id *)(*(void *)(a1 + 40) + 1760) endMonitoring];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(v8 + 1760);
  *(void *)(v8 + 1760) = 0;

  id v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime v11 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 72);
    *(_DWORD *)id buf = 134217984;
    CFAbsoluteTime v26 = v11;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Finished editor save in %lf seconds", buf, 0xCu);
  }

  if (!v7)
  {
    uint64_t v12 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138412290;
      CFAbsoluteTime v26 = *(double *)&v5;
      _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "error saving edits: %@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) _stopWaitingForAssetChangeWithAsset:*(void *)(a1 + 48) success:0];
    [*(id *)(a1 + 32) updateProgressIndicatorAnimated:1];
    id v13 = [v5 domain];
    if ([v13 isEqualToString:*MEMORY[0x1E4F39800]])
    {
      uint64_t v14 = [v5 code];

      if (v14 == 3072)
      {
        [*(id *)(a1 + 32) didFinishWithChanges:0];
        goto LABEL_16;
      }
    }
    else
    {
    }
    if ([*(id *)(a1 + 40) isStandardVideo]) {
      id v15 = @"VIDEOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    else {
      id v15 = @"PHOTOEDIT_EDIT_SAVE_FAILED_TITLE";
    }
    id v16 = PULocalizedString(v15);
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v17 = [NSString stringWithFormat:@"%@\n\n[INTERNAL ONLY] %@", v16, v5];

      id v16 = (void *)v17;
    }
    uint64_t v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v16 message:0 preferredStyle:1];
    id v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = PULocalizedString(@"OK");
    uint64_t v21 = [v19 actionWithTitle:v20 style:0 handler:0];
    [v18 addAction:v21];

    [*(id *)(a1 + 32) presentViewController:v18 animated:1 completion:0];
  }
LABEL_16:
  id v22 = *(id *)(a1 + 56);
  id v23 = v22;
  os_signpost_id_t v24 = *(void *)(a1 + 80);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ExitEditDoneAction", " enableTelemetry=YES ", buf, 2u);
  }

  [*(id *)(a1 + 32) _didEndExitActionWithSessionKeys:*(void *)(a1 + 64)];
}

void __47__PUPhotoEditViewController__handleSaveAction___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 valuesCalculator];
  [v4 updateAdjustmentSmartToneStatistics:v3 withAccuracy:0];
}

- (void)_handleMainActionButton:(id)a3
{
  id v5 = a3;
  int64_t mainButtonAction = self->_mainButtonAction;
  if (mainButtonAction)
  {
    if (mainButtonAction == 2)
    {
      id v8 = v5;
      [(PUPhotoEditViewController *)self _handleRevertButton:v5];
    }
    else
    {
      if (mainButtonAction != 1) {
        goto LABEL_8;
      }
      id v8 = v5;
      [(PUPhotoEditViewController *)self _handleDoneButton:v5];
    }
  }
  else
  {
    id v8 = v5;
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:4587 description:@"Invalid action for button."];
  }
  id v5 = v8;
LABEL_8:
}

- (void)_handleCoarseSliderValueDecrease:(id)a3
{
}

- (void)_handleSliderValueDecrease:(id)a3
{
}

- (void)_handleCoarseSliderValueIncrease:(id)a3
{
}

- (void)_handleSliderValueIncrease:(id)a3
{
}

- (void)_handleCoarseScrubberValueDecrease:(id)a3
{
}

- (void)_handleScrubberValueDecrease:(id)a3
{
}

- (void)_handleCoarseScrubberValueIncrease:(id)a3
{
}

- (void)_handleScrubberValueIncrease:(id)a3
{
}

- (void)_showJpegPreviewForRawRevertAlert
{
  id v3 = PULocalizedString(@"EDITING_JPEG_WITH_UNDERLYING_RAW");
  id v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:v3 preferredStyle:1];
  id v5 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v6 = PULocalizedString(@"EDITING_JPEG_WITH_UNDERLYING_RAW_REVERT");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  id v12[2] = __62__PUPhotoEditViewController__showJpegPreviewForRawRevertAlert__block_invoke;
  v12[3] = &unk_1E5F2BF98;
  void v12[4] = self;
  id v7 = [v5 actionWithTitle:v6 style:0 handler:v12];
  [v4 addAction:v7];

  id v8 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v9 = PULocalizedString(@"EDITING_JPEG_WITH_UNDERLYING_RAW_USEJPEG");
  id v10 = [v8 actionWithTitle:v9 style:0 handler:0];
  [v4 addAction:v10];

  CFAbsoluteTime v11 = [v4 popoverPresentationController];
  [v11 setDelegate:self];
  [(PUPhotoEditViewController *)self setJpegPreviewForRawConfirmationAlert:v4];
  [(PUPhotoEditViewController *)self presentViewController:v4 animated:1 completion:0];
}

uint64_t __62__PUPhotoEditViewController__showJpegPreviewForRawRevertAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performRevertAction];
}

- (void)_resignCurrentTool
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) leavingEditWithCancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_showCancelAndRevertOptionsAllowResetTool:(BOOL)a3
{
  BOOL v3 = a3;
  currentEditingTool = self->_currentEditingTool;
  if (currentEditingTool) {
    char v6 = ![(PUPhotoEditToolController *)currentEditingTool canResetToDefaultValue];
  }
  else {
    char v6 = 1;
  }
  BOOL v7 = [(PUPhotoEditViewController *)self _hasUnsavedChanges];
  if (self->_stashedSnapshot) {
    int v8 = 1;
  }
  else {
    int v8 = v7;
  }
  long long v9 = (void *)MEMORY[0x1E4FB1418];
  long long v10 = PULocalizedString(@"PHOTOEDIT_DISCARD_CHANGES_DESCRIPTION");
  CFAbsoluteTime v11 = [v9 alertControllerWithTitle:v10 message:0 preferredStyle:0];

  if (v3 && (v6 & 1) == 0)
  {
    uint64_t v12 = +[PUPhotoEditProtoSettings sharedInstance];
    char v13 = [v12 showResetToolButton];

    if (v13)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4FB1410];
      id v15 = [(PUPhotoEditToolController *)self->_currentEditingTool localizedResetToolActionTitle];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      id v24[2] = __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke;
      void v24[3] = &unk_1E5F2BF98;
      void v24[4] = self;
      id v16 = [v14 actionWithTitle:v15 style:0 handler:v24];

      [v11 addAction:v16];
      if (!v8) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  if (v8)
  {
LABEL_13:
    uint64_t v17 = PULocalizedString(@"PHOTOEDIT_DISCARD_CHANGES");
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke_2;
    void v23[3] = &unk_1E5F2BF98;
    void v23[4] = self;
    uint64_t v18 = [MEMORY[0x1E4FB1410] actionWithTitle:v17 style:2 handler:v23];
    [v11 addAction:v18];

LABEL_14:
    id v19 = (void *)MEMORY[0x1E4FB1410];
    id v20 = PULocalizedString(@"CANCEL");
    uint64_t v21 = [v19 actionWithTitle:v20 style:1 handler:0];
    [v11 addAction:v21];

    id v22 = [v11 popoverPresentationController];
    [v22 setDelegate:self];
    [(PUPhotoEditViewController *)self setCancelConfirmationAlert:v11];
    [(PUPhotoEditViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) resetToDefaultValueAnimated:1];
}

uint64_t __71__PUPhotoEditViewController__showCancelAndRevertOptionsAllowResetTool___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _isWaitingForSaveCompletion]) {
    uint64_t v2 = 4;
  }
  else {
    uint64_t v2 = 3;
  }
  BOOL v3 = [*(id *)(a1 + 32) aggregateSession];
  [v3 finishSessionWithEnd:v2];

  uint64_t v4 = [*(id *)(a1 + 32) exitEditEventBuilder];
  [v4 setSessionEndReason:v2];

  [*(id *)(a1 + 32) _resignCurrentTool];
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _performDiscardAction];
}

- (void)_handleCancelButton:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [(PUPhotoEditViewController *)self _hasUnsavedChanges];
  uint64_t v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = @"NO";
    if (v4) {
      char v6 = @"YES";
    }
    int v12 = 138412290;
    char v13 = v6;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "User pressed cancel button; hasUnsavedChanges? %@",
      (uint8_t *)&v12,
      0xCu);
  }

  if (v4 || self->_stashedSnapshot)
  {
    [(PUPhotoEditViewController *)self _showCancelAndRevertOptionsAllowResetTool:0];
  }
  else
  {
    [(PUPhotoEditViewController *)self _didStartExitAction];
    BOOL v7 = [(PUPhotoEditViewController *)self aggregateSession];
    [v7 finishSessionWithEnd:2];

    int v8 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    [v8 setSessionEndReason:2];

    [(PUPhotoEditViewController *)self _resignCurrentTool];
    [(PUPhotoEditViewController *)self didFinishWithChanges:0];
    long long v9 = [(PUPhotoEditViewController *)self resourceLoader];
    int v10 = [v9 cancelAllRequests];

    if (v10)
    {
      CFAbsoluteTime v11 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
      [v11 setSessionEndReason:5];
    }
    [(PUPhotoEditViewController *)self _didEndExitActionWithSessionKeys:0];
  }
  [MEMORY[0x1E4F7A448] reapAllStoragePools];
}

- (void)_handle1upToggleButton:(id)a3
{
  if ([(PUPhotoEditViewController *)self _hasUnsavedChanges])
  {
    [(PUPhotoEditViewController *)self _handleSaveAction:0];
  }
  else
  {
    BOOL v4 = [(PUPhotoEditViewController *)self aggregateSession];
    [v4 finishSessionWithEnd:2];

    uint64_t v5 = [(PUPhotoEditViewController *)self exitEditEventBuilder];
    [v5 setSessionEndReason:2];

    [(PUPhotoEditViewController *)self _resignCurrentTool];
    id v6 = [(PUPhotoEditViewController *)self photo];
    [(PUPhotoEditViewController *)self didFinishWithAsset:v6 savedChanges:0];
  }
}

- (void)_handleToolbarToolButton:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:4409 description:@"The sender must be a button"];
  }
  id v6 = v5;
  BOOL v7 = -[PUPhotoEditViewController _toolControllerForTag:](self, "_toolControllerForTag:", [v6 tag]);
  if (!v7)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PUPhotoEditViewController.m" lineNumber:4414 description:@"No tool associated with this button"];
  }
  if ([v7 enabled])
  {
    [(PUPhotoEditViewController *)self switchToEditingTool:v7 animated:1];
  }
  else
  {
    int v8 = (void *)MEMORY[0x1E4FB1418];
    long long v9 = [v7 disabledToolAlertTitle];
    int v10 = [v7 disabledToolAlertMessage];
    CFAbsoluteTime v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    int v12 = (void *)MEMORY[0x1E4FB1410];
    char v13 = PULocalizedString(@"PHOTOEDIT_CONFIRM_REVERT_BUTTON");
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    id v23 = __54__PUPhotoEditViewController__handleToolbarToolButton___block_invoke;
    os_signpost_id_t v24 = &unk_1E5F2BF70;
    id v25 = self;
    id v26 = v6;
    uint64_t v14 = [v12 actionWithTitle:v13 style:2 handler:&v21];
    objc_msgSend(v11, "addAction:", v14, v21, v22, v23, v24, v25);

    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PULocalizedString(@"CANCEL");
    uint64_t v17 = [v15 actionWithTitle:v16 style:1 handler:0];
    [v11 addAction:v17];

    uint64_t v18 = [v11 popoverPresentationController];
    [v18 setDelegate:self];
    [v18 setPermittedArrowDirections:15];
    [(PUPhotoEditViewController *)self setDisabledToolRevertAlert:v11];
    [(PUPhotoEditViewController *)self presentViewController:v11 animated:1 completion:0];
  }
}

uint64_t __54__PUPhotoEditViewController__handleToolbarToolButton___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performInEditRevertWithToolButton:*(void *)(a1 + 40)];
}

- (id)_toolControllerForTag:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 toolControllerTag] == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)validateCommand:(id)a3
{
  id v11 = a3;
  BOOL v4 = PXNumberPropertyFromCommand();
  if ((char *)[v11 action] == sel_navigateToSegment_)
  {
    uint64_t v5 = [v11 title];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      if (v4)
      {
        uint64_t v7 = [(NSDictionary *)self->_toolControllerTagsByKeyCommandNumber objectForKeyedSubscript:v4];
        uint64_t v8 = [v7 integerValue];

        long long v9 = [(PUPhotoEditViewController *)self _toolControllerForTag:v8];
        id v10 = [v9 localizedName];
        [v11 setDiscoverabilityTitle:v10];

LABEL_9:
        goto LABEL_10;
      }
    }
  }
  if ((char *)[v11 action] == sel_toggleEditor_)
  {
    long long v9 = PULocalizedString(@"MENU_ITEM_TITLE_CLOSE_EDITOR");
    [v11 setDiscoverabilityTitle:v9];
    goto LABEL_9;
  }
  if ((char *)[v11 action] == sel_autoEnhanceAssets_) {
    [(PUAdjustmentsToolController *)self->_adjustmentsController validateCommand:v11];
  }
LABEL_10:
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_navigateToSegment_ == a3)
  {
    uint64_t v8 = PXNumberPropertyFromCommand();
    if (v8)
    {
      long long v9 = [(NSDictionary *)self->_toolControllerTagsByKeyCommandNumber objectForKeyedSubscript:v8];
      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    if (sel_autoEnhanceAssets_ == a3)
    {
      unsigned __int8 v7 = [(PUAdjustmentsToolController *)self->_adjustmentsController canPerformAction:a3 withSender:v6];
    }
    else if (sel_copyAdjustments_ == a3)
    {
      unsigned __int8 v7 = [(PUPhotoEditViewController *)self _canCopyEdits];
    }
    else if (sel_pasteAdjustments_ == a3)
    {
      unsigned __int8 v7 = [(PUPhotoEditViewController *)self _canPasteEdits];
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)PUPhotoEditViewController;
      unsigned __int8 v7 = [(PUPhotoEditViewController *)&v12 canPerformAction:a3 withSender:v6];
    }
    BOOL v10 = v7;
  }

  return v10;
}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
}

- (void)copyAdjustments:(id)a3
{
}

- (void)toggleEditor:(id)a3
{
  if (self->_mainButtonAction == 1) {
    [(PUPhotoEditViewController *)self _handleDoneAction:a3];
  }
  else {
    [(PUPhotoEditViewController *)self _handleCancelButton:a3];
  }
}

- (void)navigateToSegment:(id)a3
{
  BOOL v4 = PXNumberPropertyFromCommand();
  if (v4)
  {
    uint64_t v8 = v4;
    uint64_t v5 = [(NSDictionary *)self->_toolControllerTagsByKeyCommandNumber objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 integerValue];

    unsigned __int8 v7 = [(PUPhotoEditViewController *)self _toolControllerForTag:v6];
    if (v7) {
      [(PUPhotoEditViewController *)self switchToEditingTool:v7 animated:1];
    }

    BOOL v4 = v8;
  }
}

- (void)autoEnhanceAssets:(id)a3
{
  [(PUAdjustmentsToolController *)self->_adjustmentsController setInitialAction:1];
  adjustmentsController = self->_adjustmentsController;
  [(PUPhotoEditViewController *)self switchToEditingTool:adjustmentsController animated:1];
}

- (void)rotateAssetsClockwise:(id)a3
{
  [(PUCropToolController *)self->_cropController setInitialAction:2];
  cropController = self->_cropController;
  [(PUPhotoEditViewController *)self switchToEditingTool:cropController animated:1];
}

- (void)rotateAssetsCounterclockwise:(id)a3
{
  [(PUCropToolController *)self->_cropController setInitialAction:1];
  cropController = self->_cropController;
  [(PUPhotoEditViewController *)self switchToEditingTool:cropController animated:1];
}

- (void)setFocusingViewForInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[PUPhotoEditProtoSettings sharedInstance];
  char v6 = [v5 hideUIForInteractionEnabled];

  if (((v6 & 1) != 0 || self->_currentEditingTool == &self->_photoStylesToolController->super)
    && (!v3
     || !UIAccessibilityIsVoiceOverRunning()
     || self->_currentEditingTool == &self->_photoStylesToolController->super)
    && self->_focusingViewForInteraction != v3)
  {
    self->_focusingViewForInteraction = v3;
    unsigned __int8 v7 = +[PUPhotoEditProtoSettings sharedInstance];
    BOOL v8 = [(PUPhotoEditViewController *)self isFocusingViewForInteraction];
    if (v8) {
      [v7 hideUIForInteractionFadeOutDuration];
    }
    else {
      [v7 hideUIForInteractionFadeInDuration];
    }
    double v10 = v9;
    id v11 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v12 = [v11 currentLayoutStyle];

    int64_t v13 = [(PUPhotoEditViewController *)self layoutOrientation];
    LOBYTE(v14) = 0;
    if (!self->_isImageZooming && v12 != 4)
    {
      int v14 = [(PUPhotoEditToolController *)self->_currentEditingTool shouldSlideMainToolbarOutOfScreenWhenFocusingForInteractionIfApplicable];
      if (v14)
      {
        if (v13 != 1) {
          LOBYTE(v14) = [v7 shouldMoveToolbarToRevealStylesDPadInLandscapeOrientation];
        }
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke;
    v15[3] = &unk_1E5F28ED8;
    void v15[4] = self;
    *(double *)&void v15[5] = (double)!v8;
    char v16 = v14;
    BOOL v17 = v13 != 1;
    BOOL v18 = v8;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v15 options:&__block_literal_global_588_61378 animations:v10 completion:0.0];
    [(PUPhotoEditViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

void __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1152) setAlpha:*(double *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    memset(&v26, 0, sizeof(v26));
    int v2 = *(unsigned __int8 *)(a1 + 49);
    [*(id *)(*(void *)(a1 + 32) + 1152) frame];
    if (v2)
    {
      double v5 = v3 * 0.2;
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v25.c = v6;
      *(_OWORD *)&v25.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v7 = 0.0;
    }
    else
    {
      double v7 = v4 * 0.2;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v25.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v25.c = v8;
      *(_OWORD *)&v25.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      double v5 = 0.0;
    }
    CGAffineTransformTranslate(&v26, &v25, v5, v7);
    if (*(unsigned char *)(a1 + 50))
    {
      long long v22 = *(_OWORD *)&v26.a;
      long long v23 = *(_OWORD *)&v26.c;
      long long v9 = *(_OWORD *)&v26.tx;
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v22 = *MEMORY[0x1E4F1DAB8];
      long long v23 = v10;
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    long long v24 = v9;
    id v11 = *(void **)(*(void *)(a1 + 32) + 1152);
    v21[0] = v22;
    v21[1] = v23;
    v21[2] = v9;
    [v11 setTransform:v21];
  }
  [*(id *)(*(void *)(a1 + 32) + 1160) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateToolbarShadowAlpha];
  [*(id *)(a1 + 32) _updateVideoScrubberDisplayAnimate:0];
  if (([*(id *)(a1 + 32) _shouldShowRawDecodeBadge] & 1) != 0
    || [*(id *)(a1 + 32) _shouldShowProResBadge])
  {
    [*(id *)(*(void *)(a1 + 32) + 1488) setAlpha:*(double *)(a1 + 40)];
  }
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 984);
  if (!*(unsigned char *)(a1 + 50))
  {
    uint64_t v14 = 0;
    goto LABEL_16;
  }
  int v13 = [v12 isPerformingLiveInteraction];
  uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 984);
  if (v13)
  {
    uint64_t v14 = 1;
LABEL_16:
    [v12 setFocusingViewForInteraction:v14];
    long long v15 = [*(id *)(*(void *)(a1 + 32) + 984) view];
    char v16 = v15;
    double v17 = 1.0;
    goto LABEL_19;
  }
  [v12 setFocusingViewForInteraction:0];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 984);
  if (v19 == *(void **)(v18 + 1584))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke_2;
    v20[3] = &unk_1E5F2ED10;
    void v20[4] = v18;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    return;
  }
  long long v15 = [v19 view];
  char v16 = v15;
  double v17 = 0.0;
LABEL_19:
  [v15 setAlpha:v17];
}

void __59__PUPhotoEditViewController_setFocusingViewForInteraction___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  [v1 setAlpha:0.0];
}

- (BOOL)isFocusingViewForInteraction
{
  return self->_focusingViewForInteraction;
}

- (void)_cancelPendingFocusViewForInteractionWithDelay
{
  double v3 = [(PUPhotoEditViewController *)self focusViewForInteractionDelayTimer];
  [v3 invalidate];

  [(PUPhotoEditViewController *)self setFocusViewForInteractionDelayTimer:0];
}

- (void)_focusViewForInteractionWithDelay
{
  double v3 = +[PUPhotoEditProtoSettings sharedInstance];
  char v4 = [v3 hideUIForInteractionEnabled];

  if ((v4 & 1) != 0 || self->_currentEditingTool == &self->_photoStylesToolController->super)
  {
    double v5 = [(PUPhotoEditViewController *)self focusViewForInteractionDelayTimer];

    if (!v5)
    {
      if (-[PUPhotoEditToolController shouldObserveGenericFocusingViewForInteractionDelay](self->_currentEditingTool, "shouldObserveGenericFocusingViewForInteractionDelay")&& (+[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance"), v6 = objc_claimAutoreleasedReturnValue(), [v6 hideUIForInteractionFadeOutDelay], double v8 = v7, v6, v8 != 0.0))
      {
        objc_initWeak(&location, self);
        long long v9 = [MEMORY[0x1E4F1C9C8] now];
        long long v10 = [v9 dateByAddingTimeInterval:v8];

        id v11 = objc_alloc(MEMORY[0x1E4F1CB00]);
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        char v16 = __62__PUPhotoEditViewController__focusViewForInteractionWithDelay__block_invoke;
        double v17 = &unk_1E5F28EB0;
        objc_copyWeak(&v18, &location);
        uint64_t v12 = (void *)[v11 initWithFireDate:v10 interval:0 repeats:&v14 block:1.0];
        int v13 = objc_msgSend(MEMORY[0x1E4F1CAC0], "currentRunLoop", v14, v15, v16, v17);
        [v13 addTimer:v12 forMode:*MEMORY[0x1E4F1C4B0]];

        [(PUPhotoEditViewController *)self setFocusViewForInteractionDelayTimer:v12];
        objc_destroyWeak(&v18);

        objc_destroyWeak(&location);
      }
      else
      {
        [(PUPhotoEditViewController *)self setFocusingViewForInteraction:1];
      }
    }
  }
}

void __62__PUPhotoEditViewController__focusViewForInteractionWithDelay__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setFocusViewForInteractionDelayTimer:0];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setFocusingViewForInteraction:1];
}

- (double)transientBadgeWidthForText:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  id v3 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v4 = *MEMORY[0x1E4FB28D0];
  id v5 = a3;
  long long v6 = [v3 preferredFontForTextStyle:v4];
  v12[0] = v6;
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v7, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v9 = v8;

  return v9;
}

- (void)flashTransientBadgeWithText:(id)a3
{
  id v4 = a3;
  [(PUPhotoEditViewController *)self _setTransientStatusBadgeVisible:1];
  [(CEKBadgeTextView *)self->_transientStatusBadge _setText:v4];

  [(CEKBadgeTextView *)self->_transientStatusBadge setAlpha:0.0];
  [(CEKBadgeTextView *)self->_transientStatusBadge invalidateIntrinsicContentSize];
  unint64_t v5 = self->_transientStatusBadgeRequestID + 1;
  self->_transientStatusBadgeRequestID = v5;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke;
  v7[3] = &unk_1E5F2ED10;
  void v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_2;
  v6[3] = &unk_1E5F28E88;
  v6[4] = self;
  void v6[5] = v5;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v7 animations:v6 completion:0.1];
}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1448) setAlpha:1.0];
}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_3;
  v4[3] = &unk_1E5F2E0A8;
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = v1;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_4;
  v3[3] = &unk_1E5F28E88;
  void v3[4] = v5;
  void v3[5] = v1;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v4 options:v3 animations:0.4 completion:0.5];
}

uint64_t __57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(result + 40) == *(void *)(v1 + 1456)) {
    return [*(id *)(v1 + 1448) setAlpha:0.0];
  }
  return result;
}

void *__57__PUPhotoEditViewController_flashTransientBadgeWithText___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  uint64_t result = *(void **)(a1 + 32);
  if (*(void *)(v2 + 8) == result[182]) {
    return (void *)[result _setTransientStatusBadgeVisible:0];
  }
  return result;
}

- (void)_setTransientStatusBadgeVisible:(BOOL)a3
{
  transientStatusBadge = self->_transientStatusBadge;
  if (a3)
  {
    if (transientStatusBadge) {
      return;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F57D38]);
    uint64_t v6 = (CEKBadgeTextView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v7 = self->_transientStatusBadge;
    self->_transientStatusBadge = v6;

    double v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    double v9 = [v8 colorWithAlphaComponent:0.8];
    [(CEKBadgeTextView *)self->_transientStatusBadge _setFillColor:v9];

    long long v10 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v11 = [v10 colorWithAlphaComponent:0.8];
    [(CEKBadgeTextView *)self->_transientStatusBadge _setContentColor:v11];

    [(CEKBadgeTextView *)self->_transientStatusBadge setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v12 = [(PUPhotoEditViewController *)self view];
    [v12 addSubview:self->_transientStatusBadge];

    uint64_t v15 = [(PUPhotoEditViewController *)self view];
    [(NSArray *)v15 setNeedsUpdateConstraints];
    transientStatusBadgeConstraints = v15;
  }
  else
  {
    if (!transientStatusBadge) {
      return;
    }
    [(CEKBadgeTextView *)transientStatusBadge removeFromSuperview];
    uint64_t v14 = self->_transientStatusBadge;
    self->_transientStatusBadge = 0;

    transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
    self->_transientStatusBadgeConstraints = 0;
  }
}

- (void)_updateTransientStatusBadgeForPreviewingOriginal
{
  BOOL v3 = [(PUPhotoEditViewController *)self _isPreviewingOriginal];
  [(PUPhotoEditViewController *)self _setTransientStatusBadgeVisible:v3];
  if (v3)
  {
    int64_t v4 = [(PUPhotoEditViewController *)self previewRenderType];
    if (v4 == 2)
    {
      id v5 = @"PHOTOEDIT_PREVIEWING_CROPPED_ORIGINAL";
    }
    else
    {
      if (v4 != 1) {
        return;
      }
      id v5 = @"PHOTOEDIT_PREVIEWING_ORIGINAL";
    }
    PULocalizedString(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(CEKBadgeTextView *)self->_transientStatusBadge _setText:v6];
  }
}

- (void)_updatePreviewingOriginal
{
  if ([(PUPhotoEditViewController *)self shouldBePreviewingOriginal])
  {
    BOOL v3 = [(PUPhotoEditViewController *)self compositionController];
    [MEMORY[0x1E4F8A748] synchronousInputSizeForCompositionController:v3];
    double v5 = v4;
    double v7 = v6;
    double v8 = [v3 cropAdjustmentController];
    if (v8)
    {
      double v9 = [v3 cropAdjustmentController];
      int v10 = objc_msgSend(v9, "isCropIdentityForImageSize:", v5, v7);
    }
    else
    {
      int v10 = 1;
    }
    if ([(PUPhotoEditViewController *)self workImageVersion] == 1) {
      int v12 = v10;
    }
    else {
      int v12 = 1;
    }
    if (v12) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = 2;
    }
    int v13 = [(PUPhotoEditViewController *)self aggregateSession];
    [v13 setToggledOriginal:1];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v14 = [(PUPhotoEditViewController *)self originalImageEditSource];

  if (v14)
  {
    [(PUPhotoEditViewController *)self setPreviewRenderType:v11];
  }
}

- (BOOL)_isPreviewingOriginal
{
  return (unint64_t)([(PUPhotoEditViewController *)self previewRenderType] - 1) < 2;
}

- (void)setPreviewRenderType:(int64_t)a3
{
  if (self->_previewRenderType != a3)
  {
    self->_previewRenderType = a3;
    if ([(PUPhotoEditViewController *)self _isPreviewingOriginal])
    {
      uint64_t v5 = [(PUPhotoEditViewController *)self originalImageEditSource];
      if (v5
        && (double v6 = (void *)v5,
            int64_t v7 = [(PUPhotoEditViewController *)self workImageVersion],
            v6,
            v7 != 1))
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        id v24[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke;
        void v24[3] = &unk_1E5F28E60;
        void v24[4] = self;
        void v24[5] = a3;
        char v25 = 1;
        [(PUPhotoEditViewController *)self asShotCompositionController:v24];
      }
      else
      {
        double v8 = [(PUPhotoEditViewController *)self photo];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          double v9 = [(PUPhotoEditViewController *)self photo];
        }
        else
        {
          double v9 = 0;
        }

        if (+[PUPhotoEditSupport currentDeviceShouldAllowRawDecode](PUPhotoEditSupport, "currentDeviceShouldAllowRawDecode")&& [v9 shouldUseRAWResourceAsUnadjustedEditBase])
        {
          uint64_t v15 = [MEMORY[0x1E4F8A358] pipelineFiltersForRAWShowingOriginalWithGeometry];
        }
        else
        {
          char v16 = [(PUPhotoEditViewController *)self _defaultRenderPipelineFiltersForCurrentMode];
          double v17 = [MEMORY[0x1E4F8A358] pipelineFiltersForShowingOriginalWithGeometry];
          uint64_t v15 = [v16 arrayByAddingObjectsFromArray:v17];
        }
        if (v15) {
          [(NUMediaView *)self->_mediaView setPipelineFilters:v15];
        }
        [(PUPhotoEditViewController *)self _updateMediaViewEdgeInsets];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_10;
        void v23[3] = &unk_1E5F2ED10;
        void v23[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v23);
      }
    }
    else
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_11;
      aBlock[3] = &unk_1E5F2ED10;
      void aBlock[4] = self;
      int v10 = (void (**)(void))_Block_copy(aBlock);
      if ([(PUPhotoEditViewController *)self showOriginalCausedSizeChange])
      {
        uint64_t v11 = [(PUPhotoEditViewController *)self view];
        int v12 = [v11 snapshotViewAfterScreenUpdates:0];

        [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
        int v13 = [(PUPhotoEditViewController *)self view];
        [v13 addSubview:v12];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_12;
        block[3] = &unk_1E5F2EBC8;
        id v20 = v12;
        uint64_t v21 = v10;
        void block[4] = self;
        id v14 = v12;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        v10[2](v10);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        void v18[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_16;
        v18[3] = &unk_1E5F2ED10;
        void v18[4] = self;
        dispatch_async(MEMORY[0x1E4F14428], v18);
      }
    }
  }
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (*(void *)(a1 + 40) == 2)
    {
      int64_t v7 = [*(id *)(a1 + 32) compositionController];
      uint64_t v8 = [v7 cropAdjustmentController];
      if (v8)
      {
        double v9 = (void *)v8;
        int v10 = [v5 cropAdjustmentController];

        if (!v10)
        {
          uint64_t v11 = *MEMORY[0x1E4F8A418];
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          id v42[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_2;
          v42[3] = &unk_1E5F28E10;
          v42[4] = *(void *)(a1 + 32);
          [v5 modifyAdjustmentWithKey:v11 modificationBlock:v42];
        }
      }
      else
      {
      }
    }
    if (!*(unsigned char *)(a1 + 48)) {
      goto LABEL_15;
    }
    int v12 = [v5 orientationAdjustmentController];

    if (!v12)
    {
      int v13 = [*(id *)(a1 + 32) adjustmentConstants];
      id v14 = [v13 PIOrientationAdjustmentKey];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_3;
      v41[3] = &unk_1E5F28E38;
      v41[4] = *(void *)(a1 + 32);
      [v5 modifyAdjustmentWithKey:v14 modificationBlock:v41];
    }
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v15 = *(void **)(a1 + 32);
      char v16 = v15 + 209;
      [v15 lastKnownPreviewImageSize];
      void *v16 = v17;
      v16[1] = v18;
      [MEMORY[0x1E4F8A748] synchronousInputSizeForCompositionController:v5];
      [*(id *)(a1 + 32) originalImageExifOrientation];
      PLOrientationTransformImageSize();
      double v20 = v19;
      double v22 = v21;
      [*(id *)(a1 + 32) lastKnownPreviewImageSize];
      BOOL v25 = v24 != v22 || v23 != v20;
      objc_msgSend(*(id *)(a1 + 32), "setLastKnownPreviewImageSize:", v20, v22);
    }
    else
    {
LABEL_15:
      BOOL v25 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_4;
    aBlock[3] = &unk_1E5F2ECC8;
    id v26 = v5;
    uint64_t v27 = *(void *)(a1 + 32);
    id v39 = v26;
    uint64_t v40 = v27;
    uint64_t v28 = _Block_copy(aBlock);
    uint64_t v29 = v28;
    if (v25)
    {
      uint64_t v30 = [*(id *)(a1 + 32) view];
      uint64_t v31 = [v30 snapshotViewAfterScreenUpdates:0];

      [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v32 = [*(id *)(a1 + 32) view];
      [v32 addSubview:v31];

      [*(id *)(a1 + 32) setShowOriginalCausedSizeChange:1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_5;
      block[3] = &unk_1E5F2EBC8;
      id v36 = v31;
      id v37 = v29;
      void block[4] = *(void *)(a1 + 32);
      id v33 = v31;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(void *))v28 + 2))(v28);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_9;
      v34[3] = &unk_1E5F2ED10;
      void v34[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x1E4F14428], v34);
    }
  }
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTogglingShowOriginal:0];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_11(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) _defaultRenderPipelineFiltersForCurrentMode];
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[127];
  double v4 = [v2 _composition];
  [v3 setComposition:v4];

  [*(id *)(*(void *)(a1 + 32) + 1016) setPipelineFilters:v8];
  id v5 = *(double **)(a1 + 32);
  id v6 = (_OWORD *)MEMORY[0x1E4F1DB30];
  if (v5[209] != *MEMORY[0x1E4F1DB30] || v5[210] != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    objc_msgSend(v5, "setLastKnownPreviewImageSize:");
    *(_OWORD *)(*(void *)(a1 + 32) + 1672) = *v6;
    id v5 = *(double **)(a1 + 32);
  }
  [v5 _updateTransientStatusBadgeForPreviewingOriginal];
  [*(id *)(a1 + 32) _updateMediaViewEdgeInsets];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_12(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_13;
  v4[3] = &unk_1E5F2ECC8;
  BOOL v3 = (void *)a1[5];
  void v4[4] = a1[4];
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_16(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTogglingShowOriginal:0];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_13(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];

  double v4 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_14;
  v8[3] = &unk_1E5F2ED10;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_15;
  v6[3] = &unk_1E5F2E1C0;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 animateWithDuration:v8 animations:v6 completion:0.2];
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowOriginalCausedSizeChange:0];
  [*(id *)(a1 + 32) setTogglingShowOriginal:0];
  dispatch_time_t v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v6 = [v2 compositionController];
  double v4 = [v6 cropAdjustmentController];
  id v5 = [v4 adjustment];
  [v3 setFromAdjustment:v5];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_3(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_msgSend(v3, "setOrientation:", objc_msgSend(v2, "originalImageExifOrientation"));
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_4(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  id v2 = [MEMORY[0x1E4F8A748] validatedCompositionCopyFor:*(void *)(a1 + 32) mediaType:1];
  [*(id *)(*(void *)(a1 + 40) + 1016) setComposition:v2];
  [MEMORY[0x1E4F39CF8] commit];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_5(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_6;
  v4[3] = &unk_1E5F2ECC8;
  id v3 = (void *)a1[5];
  void v4[4] = a1[4];
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTogglingShowOriginal:0];
}

void __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateMediaViewEdgeInsets];
  dispatch_time_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];

  double v4 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  id v8[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_7;
  v8[3] = &unk_1E5F2ED10;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_8;
  v6[3] = &unk_1E5F2E1C0;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 animateWithDuration:0 delay:v8 options:v6 animations:0.1 completion:0.2];
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__PUPhotoEditViewController_setPreviewRenderType___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) _startShowingOriginalBadge];
  [*(id *)(a1 + 32) setTogglingShowOriginal:0];
  dispatch_time_t v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)setShouldBePreviewingOriginal:(BOOL)a3
{
  if (self->_shouldBePreviewingOriginal != a3)
  {
    BOOL v3 = a3;
    self->_shouldBePreviewingOriginal = a3;
    if (a3)
    {
      [(PUPhotoEditViewController *)self _loadOriginalImageIfNeeded];
      id v5 = [(PUPhotoEditViewController *)self _livePhotoGestureRecognizer];
      objc_msgSend(v5, "pu_cancel");
    }
    [(PUPhotoEditViewController *)self _updatePreviewingOriginal];
    id v6 = [(PUPhotoEditViewController *)self originalImageEditSource];

    if (v6)
    {
      [(PUPhotoEditViewController *)self _updateMainActionButtonAnimated:0];
      [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:0];
    }
    if (v3)
    {
      id v7 = [(PUPhotoEditViewController *)self photo];
      char v8 = [v7 isLivePhoto];

      if ((v8 & 1) == 0)
      {
        id v9 = [(PUPhotoEditViewController *)self mediaView];
        int v10 = [v9 player];
        [v10 pause];
      }
      currentEditingTool = self->_currentEditingTool;
      [(PUPhotoEditToolController *)currentEditingTool previewingOriginalDidStart];
    }
    else
    {
      int v12 = self->_currentEditingTool;
      [(PUPhotoEditToolController *)v12 previewingOriginalDidStop];
    }
  }
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "layoutStyleChanged", a3))
  {
    [(PUPhotoEditViewController *)self _updateSpecDependentUIPieces];
    id v5 = [(PUPhotoEditViewController *)self photoEditSpec];
    [(PUPhotoEditToolPickerController *)self->_toolPickerController setParentSpec:v5];
  }
}

- (void)_updateLayerModulation
{
  if ([(PUPhotoEditViewController *)self shouldEnableImageModulation])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F902A0];
    double v4 = [(PUPhotoEditViewController *)self photo];
    uint64_t v5 = [v3 optionsForAsset:v4];
    uint64_t v7 = v6;

    char v8 = [(PUPhotoEditViewController *)self imageLayerModulator];

    if (!v8)
    {
      id v9 = [(PUPhotoEditViewController *)self px_imageModulationManager];
      int v10 = objc_msgSend(v9, "checkoutImageLayerModulatorWithOptions:", v5, v7);
      [(PUPhotoEditViewController *)self setImageLayerModulator:v10];
    }
    uint64_t v11 = [(PUPhotoEditViewController *)self imageLayerModulator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __51__PUPhotoEditViewController__updateLayerModulation__block_invoke;
    v17[3] = &unk_1E5F2D330;
    void v17[4] = self;
    [v11 performChanges:v17];

    int v12 = [(PUPhotoEditViewController *)self px_imageModulationManager];
    int v13 = [(PUPhotoEditViewController *)self livePhotoViewModulator];
    [v12 checkInLivePhotoViewModulator:v13];

    id v14 = [(PUPhotoEditViewController *)self px_imageModulationManager];
    uint64_t v15 = objc_msgSend(v14, "checkoutLivePhotoViewModulatorWithOptions:", v5, v7);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__PUPhotoEditViewController__updateLayerModulation__block_invoke_2;
    v16[3] = &unk_1E5F28DE8;
    void v16[4] = self;
    [v15 performChanges:v16];
    [(PUPhotoEditViewController *)self setLivePhotoViewModulator:v15];
  }
}

void __51__PUPhotoEditViewController__updateLayerModulation__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1016);
  id v6 = a2;
  double v4 = [v3 _renderView];
  uint64_t v5 = [v4 _containerLayer];
  [v6 setLayer:v5];

  objc_msgSend(v6, "setGainMapImage:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"));
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(v6, "setGainMapValue:");
  [v6 setDisplayingOpaqueContent:0];
}

void __51__PUPhotoEditViewController__updateLayerModulation__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v6 = a2;
  double v4 = [v3 mainLivePhotoView];
  uint64_t v5 = [v4 playerView];
  [v6 setLivePhotoView:v5];

  objc_msgSend(v6, "setGainMapImage:", objc_msgSend(*(id *)(a1 + 32), "gainMapImage"));
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(v6, "setGainMapValue:");
}

- (BOOL)shouldEnableImageModulation
{
  if (![MEMORY[0x1E4F7A4A0] renderMeteorPlusAsHDR]) {
    return 1;
  }
  BOOL v3 = [(PUPhotoEditViewController *)self photo];
  BOOL v4 = ([v3 mediaSubtypes] & 0x200) == 0;

  return v4;
}

- (BOOL)_shouldDisplayRedEyeTool
{
  BOOL v3 = [(PUPhotoEditViewController *)self isLoopingVideo]
    || [(PUPhotoEditViewController *)self isStandardVideo];
  BOOL v4 = [(PUPhotoEditViewController *)self valuesCalculator];

  BOOL v5 = 0;
  if (v4 && !v3)
  {
    uint64_t v6 = [(PUPhotoEditViewController *)self imageProperties];
    if (!v6
      || (uint64_t v7 = (void *)v6,
          char v8 = (void *)MEMORY[0x1E4F911C0],
          [(PUPhotoEditViewController *)self imageProperties],
          id v9 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v8) = [v8 photoWasTakenWithoutFlashWithImageProperties:v9],
          v9,
          v7,
          v8))
    {
      int v10 = [(PUPhotoEditViewController *)self compositionController];
      uint64_t v11 = [v10 redEyeAdjustmentController];
      int v12 = [v11 hasCorrections];

      if (!v12) {
        return 0;
      }
    }
    int v13 = [(PUPhotoEditViewController *)self photo];
    uint64_t v14 = [v13 playbackStyle];

    if (v14 != 5)
    {
      uint64_t v15 = [(PUPhotoEditViewController *)self photo];
      BOOL v5 = [v15 playbackVariation] != 3;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (void)_updateLayoutOrientationWithViewSize:(CGSize)a3 transitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v14 = a4;
  uint64_t v7 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v8 = [v7 currentLayoutStyle];

  id v9 = [(PUPhotoEditViewController *)self traitCollection];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (width > height && v10 == 0 || v8 == 4) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  [(PUPhotoEditViewController *)self setLayoutOrientation:v13 withTransitionCoordinator:v14];
}

- (void)_updateSubviewsOrdering
{
  id v10 = [(PUPhotoEditViewController *)self view];
  [v10 bringSubviewToFront:self->_mediaView];
  [v10 bringSubviewToFront:self->_placeholderImageView];
  if ([(PUPhotoEditToolController *)self->_currentEditingTool shouldHideMediaView])
  {
    BOOL v3 = [(UIViewController *)self->_currentTool view];
    [v10 bringSubviewToFront:v3];
  }
  if (self->_mainToolbarShadow) {
    objc_msgSend(v10, "bringSubviewToFront:");
  }
  if (self->_secondaryToolbarShadow) {
    objc_msgSend(v10, "bringSubviewToFront:");
  }
  if (![(PUPhotoEditToolController *)self->_currentEditingTool shouldHideMediaView])
  {
    BOOL v4 = [(UIViewController *)self->_currentTool view];
    [v10 bringSubviewToFront:v4];
  }
  BOOL v5 = [(PUPhotoEditViewController *)self videoScrubberView];
  [v10 bringSubviewToFront:v5];

  uint64_t v6 = [(PUPhotoEditViewController *)self playPauseButton];
  [v10 bringSubviewToFront:v6];

  [v10 bringSubviewToFront:self->_transientStatusBadge];
  [v10 bringSubviewToFront:self->_assetTypeBadge];
  [v10 bringSubviewToFront:self->_mainToolbar];
  [v10 bringSubviewToFront:self->_secondaryToolbar];
  if ([(PUPhotoEditViewController *)self _isInEditRevertTransitionSnapshotVisible])
  {
    uint64_t v7 = [(PUPhotoEditViewController *)self inEditRevertTransitionSnapshot];
    [v10 bringSubviewToFront:v7];
  }
  [v10 bringSubviewToFront:self->_progressEventBlockingView];
  [v10 bringSubviewToFront:self->_progressIndicatorView];
  uint64_t v8 = [(PUPhotoEditViewController *)self perfHUD];
  [v10 bringSubviewToFront:v8];

  id v9 = [(PUPhotoEditViewController *)self sceneHUD];
  [v10 bringSubviewToFront:v9];
}

- (void)_updatePlaceholderImage
{
  BOOL v3 = [(PUPhotoEditViewController *)self placeholderImage];
  if (v3)
  {
    placeholderImageView = self->_placeholderImageView;
    if (!placeholderImageView)
    {
      BOOL v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v3];
      uint64_t v6 = self->_placeholderImageView;
      self->_placeholderImageView = v5;

      [(UIImageView *)self->_placeholderImageView setContentMode:1];
      [(UIImageView *)self->_placeholderImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIImageView *)self->_placeholderImageView setPreferredImageDynamicRange:2];
      self->_placeholderImageViewTransitioningOut = 0;
      uint64_t v7 = [(PUPhotoEditViewController *)self view];
      [v7 addSubview:self->_placeholderImageView];

      uint64_t v8 = (void *)MEMORY[0x1E4F902A0];
      id v9 = [(PUPhotoEditViewController *)self photo];
      uint64_t v10 = [v8 optionsForAsset:v9];
      uint64_t v12 = v11;

      uint64_t v13 = [(PUPhotoEditViewController *)self px_imageModulationManager];
      id v14 = objc_msgSend(v13, "checkoutImageLayerModulatorWithOptions:", v10, v12);

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke;
      v20[3] = &unk_1E5F2D330;
      void v20[4] = self;
      [v14 performChanges:v20];
      placeholderImageLayerModulator = self->_placeholderImageLayerModulator;
      self->_placeholderImageLayerModulator = (PXImageLayerModulator *)v14;
      id v16 = v14;

      placeholderImageView = self->_placeholderImageView;
    }
    [(PUPhotoEditViewController *)self previewViewFrame];
    -[UIImageView setFrame:](placeholderImageView, "setFrame:");
    [(UIImageView *)self->_placeholderImageView setHidden:0];
    uint64_t v17 = [(PUPhotoEditViewController *)self placeholderImageLayerModulator];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke_2;
    v19[3] = &unk_1E5F2D330;
    void v19[4] = self;
    [v17 performChanges:v19];

    [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
  }
  uint64_t v18 = [(PUPhotoEditMediaToolController *)self->_mediaToolController trimController];
  [v18 setPlaceholderImage:v3];
}

void __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 1432);
  id v4 = a2;
  BOOL v3 = [v2 layer];
  [v4 setLayer:v3];

  [v4 setDisplayingOpaqueContent:0];
}

void __52__PUPhotoEditViewController__updatePlaceholderImage__block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setGainMapImage:", objc_msgSend(v3, "gainMapImage"));
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(v4, "setGainMapValue:");
}

- (void)updateProgressIndicatorAnimated:(BOOL)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoEditViewController *)self _isWaitingForAssetChange])
  {
    char v4 = 0x80;
  }
  else if ([(PUPhotoEditViewController *)self _isWaitingForSaveCompletion])
  {
    char v4 = 0x80;
  }
  else
  {
    char v4 = 0;
  }
  BOOL v5 = [(PUPhotoEditViewController *)self resourceLoader];
  BOOL v6 = [v5 resourcesAvailability] == 1;

  unsigned __int8 v7 = v4 | v6;
  uint64_t v8 = [(PUPhotoEditViewController *)self resourceLoader];
  uint64_t v9 = [v8 resourcesAvailability];

  if (v9 == 2) {
    unsigned __int8 v10 = v7 | 2;
  }
  else {
    unsigned __int8 v10 = v7;
  }
  if ([(PUPhotoEditViewController *)self isRevertingToOriginal]) {
    v10 |= 0x20u;
  }
  uint64_t v11 = v10 & 0xA3;
  if ([(PEAutoAdjustmentController *)self->_autoEnhanceController isBusy]) {
    uint64_t v12 = 8;
  }
  else {
    uint64_t v12 = 0;
  }
  BOOL v13 = [(PUPhotoEditViewController *)self isCachingVideo];
  uint64_t v14 = 64;
  if (!v13) {
    uint64_t v14 = 0;
  }
  uint64_t v15 = v12 | v11 | v14;
  BOOL v16 = [(PUPhotoEditViewController *)self isRunningAutoCalculators];
  uint64_t v17 = 4;
  if (!v16) {
    uint64_t v17 = 0;
  }
  uint64_t v18 = v15 | v17 | (16 * self->_isTransitioningFromDownloadingToRunningAutoCalculators);
  if ([(PUPhotoEditViewController *)self burningInTrim]) {
    uint64_t v19 = 512;
  }
  else {
    uint64_t v19 = 0;
  }
  BOOL v20 = [(PUPhotoEditViewController *)self _isSaveProgressAvailable];
  uint64_t v21 = 1024;
  if (!v20) {
    uint64_t v21 = 0;
  }
  uint64_t v22 = v18 | v19 | v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(PUPhotoEditToolController *)self->_currentEditingTool imageLoadingInProgress])
  {
    unint64_t v23 = v22 | 0x100;
  }
  else
  {
    unint64_t v23 = v22 & 0xFFFFFFFFFFFFFEFFLL;
  }
  BOOL v24 = [(PUCleanupToolController *)self->_cleanupController isBusy];
  BOOL v25 = v24;
  uint64_t v26 = 2048;
  if (!v24) {
    uint64_t v26 = 0;
  }
  if ((v23 & 0x200) != 0)
  {
    uint64_t v27 = 16;
  }
  else if ((v23 & 0x403) != 0)
  {
    uint64_t v27 = 0;
  }
  else if ((v23 & 0x20) != 0)
  {
    uint64_t v27 = 12;
  }
  else if ((v23 & 0x80) != 0)
  {
    uint64_t v27 = 13;
  }
  else
  {
    uint64_t v34 = 17;
    if (!v24) {
      uint64_t v34 = 0;
    }
    if ((v23 & 0x100) != 0) {
      uint64_t v34 = 15;
    }
    if ((v23 & 8) != 0) {
      uint64_t v27 = 14;
    }
    else {
      uint64_t v27 = v34;
    }
  }
  unint64_t v28 = v26 | v23 & 0xFFFFFFFFFFFFF7FFLL;
  uint64_t v29 = v24;
  if ([(PUPhotoEditViewController *)self px_isVisible]) {
    uint64_t v29 = (v23 & 0x7EB) != 0 || (v23 & 0x14) == 4 || v25;
  }
  if (self->_currentProgressReasons == v28)
  {
LABEL_58:
    if (v29) {
      goto LABEL_59;
    }
    goto LABEL_64;
  }
  self->_currentProgressReasons = v28;
  uint64_t v31 = PLPhotoEditGetLog();
  BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!v28)
  {
    if (v32)
    {
      LOWORD(v45) = 0;
      _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "No more reasons for showing progress", (uint8_t *)&v45, 2u);
    }

    goto LABEL_58;
  }
  if (v29)
  {
    if (v32)
    {
      id v33 = [(PUPhotoEditViewController *)self debugStringDescribingProgressReasons:v28];
      int v45 = 138412290;
      int v46 = v33;
      _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "Showing progress for the reasons: %@", (uint8_t *)&v45, 0xCu);
    }
LABEL_59:
    if (!self->_progressIndicatorView)
    {
      [(PUPhotoEditViewController *)self _showProgressIndicator];
      LODWORD(progressIndicatorView) = 1;
      goto LABEL_67;
    }
    goto LABEL_66;
  }
  if (v32)
  {
    id v36 = [(PUPhotoEditViewController *)self debugStringDescribingProgressReasons:v28];
    int v45 = 138412290;
    int v46 = v36;
    _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_DEFAULT, "Not showing progress but operations are ongoing: %@", (uint8_t *)&v45, 0xCu);
  }
LABEL_64:
  progressIndicatorView = self->_progressIndicatorView;
  if (!progressIndicatorView) {
    goto LABEL_67;
  }
  [(PUPhotoEditViewController *)self _hideProgressIndicatorImmediately:0];
LABEL_66:
  LODWORD(progressIndicatorView) = 0;
LABEL_67:
  id v37 = self->_progressIndicatorView;
  if (!v37) {
    goto LABEL_99;
  }
  uint64_t v38 = (~(_WORD)v23 & 0x480) == 0 || (v23 & 0x23) != 0;
  if (((v38 | progressIndicatorView) & 1) == 0)
  {
    uint64_t v38 = [(PUProgressIndicatorView *)v37 isDeterminate];
    id v37 = self->_progressIndicatorView;
  }
  [(PUProgressIndicatorView *)v37 setDeterminate:v38];
  BOOL v39 = [(PUPhotoEditViewController *)self isStandardVideo];
  if (v23)
  {
    uint64_t v42 = @"PHOTOEDIT_PROGRESS_CHECKING_RESOURCE_PHOTO";
LABEL_93:
    id v43 = PULocalizedString(v42);
    goto LABEL_94;
  }
  if ((v23 & 2) != 0)
  {
    uint64_t v42 = @"PHOTOEDIT_PROGRESS_DOWNLOADING_PHOTO";
    goto LABEL_93;
  }
  if ((v23 & 0x2A0) != 0)
  {
    uint64_t v40 = @"PHOTOEDIT_PROGRESS_SAVING_PHOTO";
    uint64_t v41 = @"PHOTOEDIT_PROGRESS_SAVING_VIDEO";
    goto LABEL_90;
  }
  if ((v23 & 8) != 0)
  {
    uint64_t v40 = @"PHOTOEDIT_PROGRESS_AUTOENHANCING_PHOTO";
    uint64_t v41 = @"PHOTOEDIT_PROGRESS_AUTOENHANCING_VIDEO";
    goto LABEL_90;
  }
  if ((v23 & 0x40) != 0)
  {
    uint64_t v42 = @"PHOTOEDIT_PROGRESS_PREPARING_VIDEO";
    goto LABEL_93;
  }
  if ((v23 & 4) != 0)
  {
    uint64_t v40 = @"PHOTOEDIT_PROGRESS_LOADING_PHOTO_ADJUSTMENTS";
    uint64_t v41 = @"PHOTOEDIT_PROGRESS_LOADING_VIDEO_ADJUSTMENTS";
LABEL_90:
    if (v39) {
      uint64_t v42 = v41;
    }
    else {
      uint64_t v42 = v40;
    }
    goto LABEL_93;
  }
  if ((v23 & 0x100) != 0) {
    uint64_t v42 = @"PHOTOEDIT_PROGRESS_CROP_RENDERING";
  }
  else {
    uint64_t v42 = @"PHOTOEDIT_PROGRESS_CLEANUP_RENDERING";
  }
  if ((((v23 & 0x100) >> 8) | v25) == 1) {
    goto LABEL_93;
  }
  id v43 = 0;
LABEL_94:
  double v44 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = 138543362;
    int v46 = v43;
    _os_log_impl(&dword_1AE9F8000, v44, OS_LOG_TYPE_DEFAULT, "Progress indicator message: %{public}@", (uint8_t *)&v45, 0xCu);
  }

  if (v43) {
    [(PUProgressIndicatorView *)self->_progressIndicatorView setLocalizedMessage:v43];
  }

LABEL_99:
  [(PUPhotoEditViewController *)self _updateProgressIndicatorInteractionDisabledWithReason:v27 showsIndicator:v29 isSavingWithProgress:(v23 >> 10) & 1];
}

- (id)debugStringDescribingProgressReasons:(unint64_t)a3
{
  __int16 v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v3)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "checkingForDownload");
    [v4 addObject:v8];

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "downloadingResources");
  [v4 addObject:v9];

  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  unsigned __int8 v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "autocalculators");
  [v4 addObject:v10];

  if ((v3 & 8) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "autoEnhanceCalculations");
  [v4 addObject:v11];

  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "transitioningToAutoCalculators");
  [v4 addObject:v12];

  if ((v3 & 0x20) == 0)
  {
LABEL_7:
    if ((v3 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  BOOL v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "reverting");
  [v4 addObject:v13];

  if ((v3 & 0x40) == 0)
  {
LABEL_8:
    if ((v3 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "cachingVideo");
  [v4 addObject:v14];

  if ((v3 & 0x80) == 0)
  {
LABEL_9:
    if ((v3 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "waitingToDismiss");
  [v4 addObject:v15];

  if ((v3 & 0x100) == 0)
  {
LABEL_10:
    if ((v3 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  BOOL v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "loadingCrop");
  [v4 addObject:v16];

  if ((v3 & 0x200) == 0)
  {
LABEL_11:
    if ((v3 & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "burningTrim");
  [v4 addObject:v17];

  if ((v3 & 0x400) == 0)
  {
LABEL_12:
    if ((v3 & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_27:
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "saving");
  [v4 addObject:v18];

  if ((v3 & 0x800) != 0)
  {
LABEL_13:
    BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "cleaningUp");
    [v4 addObject:v5];
  }
LABEL_14:
  BOOL v6 = [v4 componentsJoinedByString:@", "];

  return v6;
}

- (void)_updateProgressIndicatorInteractionDisabledWithReason:(int64_t)a3 showsIndicator:(BOOL)a4 isSavingWithProgress:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id progressIndicatorInteractionDisablingToken = self->_progressIndicatorInteractionDisablingToken;
  if (a3)
  {
    uint64_t v9 = PLPhotoEditGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (progressIndicatorInteractionDisablingToken)
    {
      if (v10)
      {
        int v22 = 67109120;
        int v23 = a3;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Interaction still disabled for reason: %d", (uint8_t *)&v22, 8u);
      }
    }
    else
    {
      if (v10)
      {
        int v22 = 67109120;
        int v23 = a3;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEFAULT, "Disabling user interaction for photo edit progress indicator for reason: %d", (uint8_t *)&v22, 8u);
      }

      uint64_t v19 = +[PUInterfaceManager beginDisablingUserInteractionForReason:a3 withExpectedTimeout:180.0];
      uint64_t v9 = self->_progressIndicatorInteractionDisablingToken;
      self->_id progressIndicatorInteractionDisablingToken = v19;
    }
  }
  else
  {
    BOOL v11 = a5;
    if (progressIndicatorInteractionDisablingToken)
    {
      uint64_t v12 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Re-enabling user interaction for photo edit progress indicator.", (uint8_t *)&v22, 2u);
      }

      +[PUInterfaceManager endDisablingUserInteraction:self->_progressIndicatorInteractionDisablingToken];
      id v13 = self->_progressIndicatorInteractionDisablingToken;
      self->_id progressIndicatorInteractionDisablingToken = 0;
    }
    if (v5 && v11)
    {
      if (self->_progressEventBlockingView) {
        return;
      }
      id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      uint64_t v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      progressEventBlockingView = self->_progressEventBlockingView;
      self->_progressEventBlockingView = v15;

      [(UIView *)self->_progressEventBlockingView setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v17 = [(PUPhotoEditViewController *)self view];
      [v17 insertSubview:self->_progressEventBlockingView belowSubview:self->_progressIndicatorView];

      [(PUPhotoEditViewController *)self _updateProgressEventBlockingViewConstraints];
      progressEventBlockingViewConstraints = [(PUPhotoEditViewController *)self view];
      [progressEventBlockingViewConstraints setNeedsLayout];
      goto LABEL_20;
    }
  }
  if (!v5)
  {
    BOOL v20 = self->_progressEventBlockingView;
    if (v20)
    {
      [(UIView *)v20 removeFromSuperview];
      uint64_t v21 = self->_progressEventBlockingView;
      self->_progressEventBlockingView = 0;

      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = 0;
LABEL_20:

      [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
    }
  }
}

- (void)_hideProgressIndicatorImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = self->_progressIndicatorView;
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = 0;

  progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
  self->_progressIndicatorViewConstraints = 0;

  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Will hide progress indicator.", buf, 2u);
  }

  if ([(PUProgressIndicatorView *)v5 isShowingProgress])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __63__PUPhotoEditViewController__hideProgressIndicatorImmediately___block_invoke;
    v9[3] = &unk_1E5F2ED10;
    BOOL v10 = v5;
    [(PUProgressIndicatorView *)v10 endShowingProgressImmediately:v3 animated:1 withCompletionHandler:v9];
  }
  [(PUPhotoEditViewController *)self _didEndEnterEdit];
}

uint64_t __63__PUPhotoEditViewController__hideProgressIndicatorImmediately___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_showProgressIndicator
{
  BOOL v3 = [[PUProgressIndicatorView alloc] initWithStyle:5];
  progressIndicatorView = self->_progressIndicatorView;
  self->_progressIndicatorView = v3;

  [(PUProgressIndicatorView *)self->_progressIndicatorView setShowsBackground:1];
  [(PUProgressIndicatorView *)self->_progressIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  BOOL v5 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Will show progress indicator.", v11, 2u);
  }

  [(PUProgressIndicatorView *)self->_progressIndicatorView defaultProgressIndicatorDelay];
  double v7 = v6;
  if (self->_inProgressSaveIsDeferredRender)
  {
    double v7 = v6 * 3.0;
  }
  else if (self->_inProgressSaveIsFromSwipe)
  {
    double v7 = v6 / 3.0;
  }
  else if ([(PUCleanupToolController *)self->_cleanupController isBusy])
  {
    [(PUCleanupToolController *)self->_cleanupController progressDelay];
    double v7 = v8;
  }
  [(PUProgressIndicatorView *)self->_progressIndicatorView beginShowingProgressWithDelay:1 animated:v7];
  uint64_t v9 = [(PUPhotoEditViewController *)self view];
  [v9 addSubview:self->_progressIndicatorView];

  [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
  BOOL v10 = [(PUPhotoEditViewController *)self view];
  [v10 setNeedsUpdateConstraints];
}

- (UIEdgeInsets)_mediaViewEdgeInsetsWithGeometry:(id)a3
{
  id v4 = a3;
  if ([(PUPhotoEditViewController *)self _shouldUseCropPlaceholderViewFrame])
  {
    [(PUPhotoEditViewController *)self lastKnownPreviewImageSize];
    -[PUPhotoEditViewController _cropPlaceholderViewFrameForImageSize:](self, "_cropPlaceholderViewFrameForImageSize:");
    BOOL v5 = [(PUPhotoEditViewController *)self view];
    [v5 bounds];
    PXEdgeInsetsBetweenRects();
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    goto LABEL_31;
  }
  id v14 = [(PUPhotoEditViewController *)self photoEditSpec];
  [v14 layoutReferenceSize];
  double v16 = v15;
  uint64_t v17 = [(PUPhotoEditViewController *)self photoEditSpec];
  [v17 layoutReferenceSize];
  double v19 = v18;

  photoEditSpec = self->_photoEditSpec;
  if (v16 >= v19) {
    [(PUPhotoEditViewControllerSpec *)photoEditSpec previewViewInsetsLandscape];
  }
  else {
    [(PUPhotoEditViewControllerSpec *)photoEditSpec previewViewInsetsPortrait];
  }
  int64_t v21 = [(PUPhotoEditViewController *)self layoutOrientation];
  int v22 = [(PUPhotoEditViewController *)self view];
  +[PUPhotoEditLayoutSupport topToolbarVerticalOffsetForLayoutOrientation:v21 view:v22];

  int v23 = [(PUPhotoEditViewController *)self view];
  [v23 safeAreaInsets];

  [(PUPhotoEditViewController *)self layoutOrientation];
  [(PUPhotoEditViewController *)self _currentToolPreviewInsets];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  if (self->_currentEditingTool == &self->_cropController->super)
  {
    double v31 = v24;
    BOOL v32 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v33 = [v32 currentLayoutStyle];

    double v34 = v30;
    double v35 = v28;
    double v36 = v26;
    if ([(PUPhotoEditViewController *)self layoutOrientation] == 1)
    {
      double v36 = *MEMORY[0x1E4FB2848];
      double v35 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v34 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v31 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    }
    if ([(PUPhotoEditViewController *)self layoutOrientation] != 1 || v33 == 4)
    {
      id v82 = [(PUPhotoEditToolController *)self->_currentEditingTool view];
      [v82 frame];
      double v38 = v36 + v83;

      v84 = [(PUPhotoEditToolController *)self->_currentEditingTool view];
      [v84 frame];
      double v40 = v35 + v85;

      goto LABEL_13;
    }
  }
  else
  {
    UIEdgeInsetsAdd();
    UIEdgeInsetsAdd();
    [(PUPhotoEditToolController *)self->_currentEditingTool additionalPreviewViewInsets];
  }
  UIEdgeInsetsAdd();
  double v38 = v37;
  double v40 = v39;
  double v34 = v41;
  double v31 = v42;
LABEL_13:
  if (![(PUPhotoEditToolController *)self->_currentEditingTool handlesMediaViewInsets])
  {
    id v43 = [(PUPhotoEditViewController *)self mediaView];
    [v43 bounds];
    double v45 = v44;
    double v47 = v46;
    double v87 = v49;
    double v88 = v48;

    [v4 size];
    NUPixelSizeToCGSize();
    if (*MEMORY[0x1E4F1DB30] == v51 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v50)
    {
      [(PUPhotoEditViewController *)self lastKnownPreviewImageSize];
    }
    else
    {
      [v4 size];
      NUPixelSizeToCGSize();
    }
    double v54 = v52;
    double v55 = v53;
    if (v52 < 1.0 || v53 < 1.0)
    {
      long long v56 = [(PUPhotoEditViewController *)self photo];
      double v54 = (double)(unint64_t)[v56 pixelWidth];

      long long v57 = [(PUPhotoEditViewController *)self photo];
      double v55 = (double)(unint64_t)[v57 pixelHeight];
    }
    if (v54 >= 1.0 && v55 >= 1.0)
    {
      double v58 = v34 + v38;
      double rect = v38 + v47;
      CGFloat v59 = v88 - (v31 + v40);
      double v60 = v87 - v58;
      PFSizeWithAspectRatioFittingSize();
      double v61 = v40 + v45;
      CGFloat v62 = v59;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      CGFloat x = v89.origin.x;
      CGFloat y = v89.origin.y;
      double width = v89.size.width;
      CGFloat height = v89.size.height;
      double MinX = CGRectGetMinX(v89);
      v90.origin.CGFloat y = rect;
      v90.origin.CGFloat x = v61;
      v90.size.double width = v62;
      v90.size.CGFloat height = v60;
      BOOL v68 = MinX < CGRectGetMinX(v90);
      double v69 = v61;
      if (!v68)
      {
        v91.origin.CGFloat x = x;
        v91.origin.CGFloat y = y;
        v91.size.double width = width;
        v91.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v91);
        v92.origin.CGFloat x = v61;
        v92.origin.CGFloat y = rect;
        v92.size.double width = v62;
        v92.size.CGFloat height = v60;
        BOOL v71 = MaxX <= CGRectGetMaxX(v92);
        double v69 = x;
        if (!v71)
        {
          v93.origin.CGFloat x = v61;
          v93.origin.CGFloat y = rect;
          v93.size.double width = v62;
          v93.size.CGFloat height = v60;
          double v69 = CGRectGetMaxX(v93) - width;
        }
      }
      v94.origin.CGFloat x = v69;
      v94.origin.CGFloat y = y;
      v94.size.double width = width;
      v94.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v94);
      v95.origin.CGFloat x = v61;
      v95.origin.CGFloat y = rect;
      v95.size.double width = v62;
      v95.size.CGFloat height = v60;
      if (MinY >= CGRectGetMinY(v95))
      {
        v96.origin.CGFloat x = v69;
        v96.origin.CGFloat y = y;
        v96.size.double width = width;
        v96.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v96);
        v97.origin.CGFloat x = v61;
        v97.origin.CGFloat y = rect;
        v97.size.double width = v62;
        v97.size.CGFloat height = v60;
        if (MaxY > CGRectGetMaxY(v97))
        {
          v98.origin.CGFloat x = v61;
          v98.origin.CGFloat y = rect;
          v98.size.double width = v62;
          v98.size.CGFloat height = v60;
          CGRectGetMaxY(v98);
        }
      }
      PXEdgeInsetsBetweenRects();
      double v38 = v74;
      double v40 = v75;
      double v34 = v76;
      double v31 = v77;
    }
  }
  double v7 = floor(v38);
  double v9 = floor(v40);
  double v11 = floor(v34);
  double v13 = floor(v31);
LABEL_31:

  double v78 = v7;
  double v79 = v9;
  double v80 = v11;
  double v81 = v13;
  result.right = v81;
  result.bottom = v80;
  result.left = v79;
  result.top = v78;
  return result;
}

- (UIEdgeInsets)_mediaViewEdgeInsets
{
  BOOL v3 = [(PUPhotoEditViewController *)self mediaView];
  id v4 = [v3 _geometry];
  [(PUPhotoEditViewController *)self _mediaViewEdgeInsetsWithGeometry:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)_currentToolPreviewInsets
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  int64_t v7 = [(PUPhotoEditViewController *)self layoutOrientation];
  double v8 = self->_currentEditingTool;
  double v9 = v8;
  double v10 = v6;
  double v11 = v5;
  double v12 = v4;
  double v13 = v3;
  if (v8)
  {
    [(PUPhotoEditToolController *)v8 preferredPreviewViewInsets];
    double v13 = v14;
    double v12 = v15;
    double v11 = v16;
    double v10 = v17;
  }
  if (v12 == v4 && v13 == v3 && v10 == v6 && v11 == v5)
  {
    int64_t v21 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v22 = [v21 currentLayoutStyle];

    if (v22 == 4)
    {
      double v10 = dbl_1AEFF7C30[v7 == 1];
      double v12 = v10;
    }
    else if (v7 == 1)
    {
      double v11 = 141.0;
    }
    else
    {
      double v10 = 165.0;
      double v12 = 165.0;
    }
  }

  double v23 = v13;
  double v24 = v12;
  double v25 = v11;
  double v26 = v10;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)_updateMediaViewEdgeInsets
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoEditViewController *)self mediaViewEdgeInsetsUpdateDisableCount] <= 0)
  {
    [(NUMediaView *)self->_mediaView edgeInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(PUPhotoEditViewController *)self _mediaViewEdgeInsets];
    -[NUMediaView setEdgeInsets:](self->_mediaView, "setEdgeInsets:");
    [(NUMediaView *)self->_mediaView edgeInsets];
    BOOL v15 = v6 == v14 && v4 == v11;
    BOOL v16 = v15 && v10 == v13;
    if (!v16 || v8 != v12)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      double v18 = [(PUPhotoEditViewController *)self _allTools];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v24;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v24 != v21) {
              objc_enumerationMutation(v18);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * v22++) mediaViewInsetsUpdated];
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v20);
      }
    }
  }
}

- (void)_updateMediaViewLayoutWithCoordinator:(id)a3 layoutOrientation:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__PUPhotoEditViewController__updateMediaViewLayoutWithCoordinator_layoutOrientation___block_invoke;
  v4[3] = &unk_1E5F2B9D0;
  void v4[4] = self;
  [a3 animateAlongsideTransition:v4 completion:0];
}

uint64_t __85__PUPhotoEditViewController__updateMediaViewLayoutWithCoordinator_layoutOrientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMediaViewEdgeInsets];
}

- (void)_updateShowOriginalButtonAnimated:(BOOL)a3
{
  if (!self->_showOriginalButton) {
    return;
  }
  uint64_t v4 = [(PUPhotoEditViewController *)self _hasUnsavedChanges];
  double v5 = [(PUPhotoEditViewController *)self photo];
  if (![v5 isAdjusted])
  {

    goto LABEL_8;
  }
  int64_t v6 = [(PUPhotoEditViewController *)self workImageVersion];

  if (v6 != 1
    || ![(PUPhotoEditViewController *)self _canCurrentCompositionControllerBeReverted])
  {
LABEL_8:
    if ([(PUPhotoEditViewController *)self workImageVersion] != 1) {
      uint64_t v4 = [(PUPhotoEditViewController *)self _isReadyToRender] | v4;
    }
    goto LABEL_10;
  }
  uint64_t v4 = 1;
LABEL_10:
  showOriginalButton = self->_showOriginalButton;
  [(PUPhotoEditToolbarButton *)showOriginalButton setEnabled:v4];
}

- (void)_updateMoreButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUPhotoEditViewController *)self _enableSpatialMediaEditing];
  int64_t v6 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v6 editMenuEnabled])
  {
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = [(PUEditPluginSession *)self->_pluginSession isAvailable];
    if (v7 && !v5) {
      BOOL v7 = [(PUPhotoEditViewController *)self isSpatialMedia] ^ 1;
    }
  }

  [(PUPhotoEditToolbarButton *)self->_moreButton setEnabled:v7];
  if (v7)
  {
    moreButton = self->_moreButton;
    [(PUPhotoEditViewController *)self configureEnablenessOfControlButton:moreButton animated:v3 canVisuallyDisable:1];
  }
}

- (void)_updateUndoRedoButtonsAnimated:(BOOL)a3
{
  id v4 = [(PUPhotoEditViewController *)self undoManager];
  -[PUPhotoEditToolbarButton setEnabled:](self->_undoButton, "setEnabled:", [v4 canUndo]);
  -[PUPhotoEditToolbarButton setEnabled:](self->_redoButton, "setEnabled:", [v4 canRedo]);
}

- (void)_updateCancelButtonAnimated:(BOOL)a3
{
  uint64_t v4 = [(PUPhotoEditViewController *)self isRevertingToOriginal] ^ 1;
  cancelButton = self->_cancelButton;
  [(PUPhotoEditNotchButton *)cancelButton setEnabled:v4];
}

- (void)_updateMainActionButtonAnimated:(BOOL)a3
{
  BOOL v4 = [(PUPhotoEditViewController *)self _hasUnsavedChanges];
  BOOL v5 = +[PUPhotoEditProtoSettings sharedInstance];
  int v6 = [v5 alwaysShowDoneButton];

  int v7 = v6 | v4;
  double v8 = [(PUPhotoEditViewController *)self photo];
  if ([v8 isAdjusted])
  {
    int64_t v9 = [(PUPhotoEditViewController *)self workImageVersion];

    if (v9 == 1
      && [(PUPhotoEditViewController *)self _canCurrentCompositionControllerBeReverted])
    {
      int v10 = 0;
      goto LABEL_9;
    }
  }
  else
  {
  }
  if ([(PUPhotoEditViewController *)self workImageVersion] == 1) {
    int v10 = 1;
  }
  else {
    int v10 = ![(PUPhotoEditViewController *)self _isReadyToRender];
  }
LABEL_9:
  int v11 = v7 | v10;
  uint64_t v12 = 1;
  if (!self->_stashedSnapshot) {
    uint64_t v12 = 2;
  }
  if (v11) {
    int64_t v13 = 1;
  }
  else {
    int64_t v13 = v12;
  }
  if (v13 != self->_mainButtonAction)
  {
    self->_int64_t mainButtonAction = v13;
    if (v13 == 2)
    {
      double v14 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_REVERT_OR_ICON");
      BOOL v15 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_REVERT_ACCESSIBILITY");
      double v17 = [MEMORY[0x1E4FB1618] whiteColor];
      BOOL v16 = [MEMORY[0x1E4FB1618] systemDarkRedColor];
      double v18 = @"arrow.uturn.down";
    }
    else
    {
      double v14 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_DONE_OR_ICON");
      BOOL v15 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_DONE_ACCESSIBILITY");
      BOOL v16 = [MEMORY[0x1E4FB1618] systemYellowColor];
      double v17 = 0;
      double v18 = @"checkmark";
    }
    uint64_t v19 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    BOOL v32 = __61__PUPhotoEditViewController__updateMainActionButtonAnimated___block_invoke;
    uint64_t v33 = &unk_1E5F28DC0;
    double v34 = self;
    id v35 = v14;
    double v36 = v18;
    id v37 = v17;
    id v38 = v15;
    id v39 = v16;
    id v20 = v16;
    id v21 = v15;
    id v22 = v17;
    id v23 = v14;
    [v19 performWithoutAnimation:&v30];
  }
  long long v24 = [(PUPhotoEditViewController *)self resourceLoader];
  uint64_t v25 = [v24 resourcesAvailability];

  if (self->_mainButtonAction == 1)
  {
    if (v25 == 3) {
      char v26 = v7;
    }
    else {
      char v26 = 1;
    }
    if (v26)
    {
      if (v25 != 3) {
        goto LABEL_32;
      }
    }
    else if (!self->_stashedSnapshot)
    {
LABEL_32:
      BOOL v29 = 0;
      goto LABEL_33;
    }
    if ([(PUPhotoEditViewController *)self shouldBePreviewingOriginal])
    {
      double v27 = +[PUPhotoEditProtoSettings sharedInstance];
      char v28 = [v27 previewOriginalTimesOut];

      if ((v28 & 1) == 0) {
        goto LABEL_32;
      }
    }
  }
  else if (v25 != 3)
  {
    goto LABEL_32;
  }
  BOOL v29 = self->_progressEventBlockingView == 0;
LABEL_33:
  [(PUPhotoEditNotchButton *)self->_mainActionButton setEnabled:v29];
  [(PUPhotoEditViewController *)self updateMainButtonForSaveAsNewClipMenu];
}

uint64_t __61__PUPhotoEditViewController__updateMainActionButtonAnimated___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 1200) setTitle:a1[5] fallbackSymbolName:a1[6]];
  [*(id *)(a1[4] + 1200) setTextColor:a1[7]];
  [*(id *)(a1[4] + 1200) setAccessibilityLabel:a1[8]];
  uint64_t v2 = a1[9];
  BOOL v3 = *(void **)(a1[4] + 1200);
  return [v3 setBackgroundColor:v2];
}

- (BOOL)_canCompositionControllerBeReverted:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F8A280];
  id v5 = a3;
  id v6 = [v4 alloc];
  int v7 = [(PUPhotoEditViewController *)self originalComposition];
  double v8 = (void *)[v6 initWithComposition:v7];

  int64_t v9 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];
  int v10 = [v9 fullSizeImageURL];

  if (v10) {
    int v11 = (void *)[objc_alloc(MEMORY[0x1E4F8CC48]) initWithMediaURL:v10 timeZoneLookup:0];
  }
  else {
    int v11 = 0;
  }
  uint64_t v12 = (void *)MEMORY[0x1E4F911C0];
  int64_t v13 = [(PUPhotoEditViewController *)self photo];
  double v14 = objc_msgSend(v12, "repairedAsShotCompositionController:forCurrentCompositionController:isLivePhoto:metadata:", v8, v5, objc_msgSend(v13, "isLivePhoto"), v11);

  BOOL v15 = [v14 composition];
  char v16 = [v5 isEqual:v15 visualChangesOnly:1];

  return v16 ^ 1;
}

- (BOOL)_canCurrentCompositionControllerBeReverted
{
  BOOL v3 = [(PUPhotoEditViewController *)self compositionController];
  BOOL v4 = [(PUPhotoEditViewController *)self _canCompositionControllerBeReverted:v3]|| [(PUPhotoEditViewController *)self workImageVersion] != 1;

  return v4;
}

- (void)_updateModelDependentControlsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PUPhotoEditToolController *)self->_currentEditingTool isActivelyAdjusting])
  {
    [(PUPhotoEditViewController *)self _updateMainActionButtonAnimated:v3];
    [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:v3];
  }
  [(PUPhotoEditViewController *)self _updatePreviewingOriginal];
  [(PUPhotoEditViewController *)self _updateKeyCommands];
  int v5 = [(PUPhotoEditViewController *)self _shouldDisplayRedEyeTool];
  redEyeButton = self->_redEyeButton;
  if (redEyeButton) {
    int v7 = [(PUPhotoEditToolbarButton *)redEyeButton isHidden] ^ 1;
  }
  else {
    int v7 = 0;
  }
  if (v7 != v5)
  {
    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:1];
  }
}

- (void)_updateSpecDependentUIPieces
{
  BOOL v3 = [(PUPhotoEditViewController *)self isFocusingViewForInteraction];
  [(PUPhotoEditViewController *)self setFocusingViewForInteraction:0];
  self->_toolbarButtonsValid = 0;
  [(PUPhotoEditToolbar *)self->_mainToolbar removeFromSuperview];
  [(PUPhotoEditShadowView *)self->_mainToolbarShadow removeFromSuperview];
  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar removeFromSuperview];
  [(PUPhotoEditShadowView *)self->_secondaryToolbarShadow removeFromSuperview];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_mainToolbarConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_secondaryToolbarConstraints];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_actionButtonConstraints];
  [(PUPhotoEditViewController *)self _clearToolbars];
  coreToolButtons = self->_coreToolButtons;
  self->_coreToolButtons = 0;

  coreToolButtonViews = self->_coreToolButtonViews;
  self->_coreToolButtonViews = 0;

  secondaryLeadingViews = self->_secondaryLeadingViews;
  self->_secondaryLeadingViews = 0;

  mainActionButton = self->_mainActionButton;
  self->_mainActionButton = 0;

  cancelButton = self->_cancelButton;
  self->_cancelButton = 0;

  edit1upToggleButton = self->_edit1upToggleButton;
  self->_edit1upToggleButton = 0;

  secondaryTrailingViews = self->_secondaryTrailingViews;
  self->_secondaryTrailingViews = 0;

  secondaryCenterView = self->_secondaryCenterView;
  self->_secondaryCenterView = 0;

  redEyeButton = self->_redEyeButton;
  self->_redEyeButton = 0;

  moreButton = self->_moreButton;
  self->_moreButton = 0;

  markupButton = self->_markupButton;
  self->_markupButton = 0;

  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
  if (self->_currentToolViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    currentToolViewConstraints = self->_currentToolViewConstraints;
    self->_currentToolViewConstraints = 0;

    char v16 = [(PUPhotoEditViewController *)self view];
    [v16 setNeedsUpdateConstraints];
  }
  double v17 = [(PUPhotoEditViewController *)self view];
  [v17 layoutIfNeeded];

  [(PUPhotoEditViewController *)self _clearBadgeConstraints];
  if (v3)
  {
    [(PUPhotoEditViewController *)self setFocusingViewForInteraction:1];
  }
}

- (double)_imageFrameIntersectionWithSecondaryToolbarFraction
{
  BOOL v3 = [(PUPhotoEditViewController *)self mediaView];
  [v3 imageFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v14.origin.CGFloat x = v5;
  v14.origin.CGFloat y = v7;
  v14.size.double width = v9;
  v14.size.CGFloat height = v11;
  if (CGRectIsEmpty(v14)) {
    return 0.0;
  }
  v15.origin.CGFloat x = v5;
  v15.origin.CGFloat y = v7;
  v15.size.double width = v9;
  v15.size.CGFloat height = v11;
  CGRectGetMinY(v15);
  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar frame];
  CGRectGetMaxY(v16);
  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar frame];
  CGRectGetMinY(v17);
  PXFloatProgressBetween();
  PXClamp();
  return result;
}

- (double)_imageFrameIntersectionWithMainToolbarFraction
{
  BOOL v3 = [(PUPhotoEditViewController *)self mediaView];
  [v3 imageFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.CGFloat x = v5;
  v19.origin.CGFloat y = v7;
  v19.size.double width = v9;
  v19.size.CGFloat height = v11;
  if (CGRectIsEmpty(v19)) {
    return 0.0;
  }
  int64_t v13 = [(PUPhotoEditViewController *)self layoutOrientation];
  CGFloat v14 = v5;
  CGFloat v15 = v7;
  CGFloat v16 = v9;
  CGFloat v17 = v11;
  if (v13 == 1)
  {
    CGRectGetMaxY(*(CGRect *)&v14);
    [(PUPhotoEditToolbar *)self->_mainToolbar frame];
    CGRectGetMinY(v20);
    [(PUPhotoEditToolbar *)self->_mainToolbar frame];
    CGRectGetMaxY(v21);
  }
  else
  {
    CGRectGetMaxX(*(CGRect *)&v14);
    [(PUPhotoEditToolbar *)self->_mainToolbar frame];
    CGRectGetMinX(v22);
    [(PUPhotoEditToolbar *)self->_mainToolbar frame];
    CGRectGetMaxX(v23);
  }
  PXFloatProgressBetween();
  PXClamp();
  return result;
}

- (void)_updateToolbarShadowAlpha
{
  if ([(PUPhotoEditToolController *)self->_currentEditingTool shouldHideMediaView])
  {
    [(PUPhotoEditViewController *)self secondaryToolbarShadowAlphaOverride];
LABEL_3:
    double v4 = v3;
    goto LABEL_8;
  }
  CGFloat v5 = [(PUPhotoEditViewController *)self mediaView];
  [v5 imageFrame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  if (![(PUPhotoEditViewController *)self isFocusingViewForInteraction])
  {
    if ([(PUPhotoEditToolController *)self->_currentEditingTool wantsShadowViews])
    {
      v16.origin.CGFloat x = v7;
      v16.origin.CGFloat y = v9;
      v16.size.double width = v11;
      v16.size.CGFloat height = v13;
      if (!CGRectIsEmpty(v16))
      {
        [(PUPhotoEditViewController *)self _imageFrameIntersectionWithMainToolbarFraction];
        -[PUPhotoEditShadowView setAlpha:](self->_mainToolbarShadow, "setAlpha:");
        [(PUPhotoEditViewController *)self _imageFrameIntersectionWithSecondaryToolbarFraction];
        goto LABEL_3;
      }
    }
  }
  double v4 = 0.0;
  [(PUPhotoEditShadowView *)self->_mainToolbarShadow setAlpha:0.0];
LABEL_8:
  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  [(PUPhotoEditShadowView *)secondaryToolbarShadow setAlpha:v4];
}

- (void)_updateToolbarShadowStyling:(id)a3 forToolbar:(id)a4
{
  id v7 = a3;
  uint64_t v5 = [a4 backgroundStyle];
  uint64_t v6 = 0;
  switch(v5)
  {
    case 1:
      goto LABEL_5;
    case 2:
      uint64_t v6 = 0;
      uint64_t v5 = 0;
      goto LABEL_5;
    case 3:
      uint64_t v6 = 0;
      uint64_t v5 = 2;
      goto LABEL_5;
    case 4:
      uint64_t v6 = 1;
      uint64_t v5 = 3;
LABEL_5:
      [v7 setHidden:v6];
      [v7 setTransparentSide:v5];
      break;
    default:
      break;
  }
}

- (void)_updateToolbarBackgroundAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v6 = [v5 currentLayoutStyle];

  int64_t v7 = [(PUPhotoEditViewController *)self layoutOrientation];
  uint64_t v8 = 3;
  if (v7 == 1) {
    uint64_t v8 = 1;
  }
  if (v6 == 4) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = v8;
  }
  [(PUPhotoEditToolbar *)self->_mainToolbar setBackgroundStyle:v9 animated:v3];
  [(PUPhotoEditViewController *)self _updateToolbarShadowStyling:self->_mainToolbarShadow forToolbar:self->_mainToolbar];
  [(PUPhotoEditToolController *)self->_currentEditingTool setUseGradientBackground:0 animated:v3];
  [(PUPhotoEditMediaToolController *)self->_mediaToolController setUseGradientBackground:0 animated:v3];
  [(PUPhotoEditToolController *)self->_portraitToolController setUseGradientBackground:0 animated:v3];
  [(PUPhotoEditToolbar *)self->_secondaryToolbar setBackgroundStyle:2 animated:v3];
  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  secondaryToolbar = self->_secondaryToolbar;
  [(PUPhotoEditViewController *)self _updateToolbarShadowStyling:secondaryToolbarShadow forToolbar:secondaryToolbar];
}

- (void)_updateBackgroundColor
{
  currentEditingTool = self->_currentEditingTool;
  if (!currentEditingTool
    || ([(PUPhotoEditToolController *)currentEditingTool preferredPreviewBackgroundColor], (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v4 = +[PUInterfaceManager currentTheme];
    id v6 = [v4 photoEditingBackgroundColor];
  }
  uint64_t v5 = [(PUPhotoEditViewController *)self view];
  [v5 setBackgroundColor:v6];
}

- (id)_newToolButtonForTool:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 toolControllerTag];
  if (v5 == 1006) {
    int64_t v6 = 0;
  }
  else {
    int64_t v6 = [(PUPhotoEditViewController *)self _selectionIndicatorType];
  }
  BOOL v7 = [(PUPhotoEditViewController *)self showsLabelsForToolButtons];
  BOOL v8 = v5 != 1006 && v7;
  uint64_t v9 = [(PUPhotoEditViewController *)self photoEditSpec];
  double v10 = +[PUPhotoEditToolbarButton buttonForTool:v4 showingLabel:v8 selectionIndicatorType:v6 spec:v9];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __51__PUPhotoEditViewController__newToolButtonForTool___block_invoke;
  v12[3] = &unk_1E5F28D98;
  objc_copyWeak(&v13, &location);
  [v10 setActionBlock:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __51__PUPhotoEditViewController__newToolButtonForTool___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleToolbarToolButton:v3];
}

- (int64_t)_selectionIndicatorType
{
  if ([(PUPhotoEditViewController *)self layoutOrientation] == 1) {
    return 1;
  }
  id v4 = [(PUPhotoEditViewController *)self photoEditSpec];
  if ([v4 currentLayoutStyle] == 4) {
    int64_t v3 = 3;
  }
  else {
    int64_t v3 = 2;
  }

  return v3;
}

- (void)_updateToolbarButtonPositions
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_opt_new();
  uint64_t v5 = [(PUPhotoEditToolController *)self->_currentEditingTool leadingToolbarViews];
  int64_t v6 = (void *)v5;
  BOOL v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    BOOL v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(PUPhotoEditToolController *)self->_currentEditingTool centerToolbarView];
  double v10 = [(PUPhotoEditToolController *)self->_currentEditingTool trailingToolbarViews];
  if ([v10 count]) {
    [v4 addObjectsFromArray:v10];
  }
  BOOL v11 = [(PUPhotoEditViewController *)self currentToolControllerIsScrolling];
  if ([(PUPhotoEditViewController *)self _shouldDisplayRedEyeTool])
  {
    currentEditingTool = (PUCropToolController *)self->_currentEditingTool;
    if (currentEditingTool != self->_cropController
      && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController)
    {
      [v4 insertObject:self->_redEyeButton atIndex:0];
    }
  }
  [v3 addObjectsFromArray:self->_coreToolButtonViews];
  if (self->_currentEditingTool)
  {
    uint64_t v26 = [v8 count];
    if (self->_showOriginalButton)
    {
      v29[0] = self->_showOriginalButton;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      [v13 arrayByAddingObjectsFromArray:v8];
      id v14 = v3;
      BOOL v15 = v11;
      uint64_t v17 = v16 = v9;

      id v8 = (id)v17;
      uint64_t v9 = v16;
      BOOL v11 = v15;
      id v3 = v14;
    }
    if (self->_undoButton)
    {
      redoButton = self->_redoButton;
      if (redoButton)
      {
        if (!v26)
        {
          if (self->_showOriginalButton)
          {
            v28[0] = self->_undoButton;
            v28[1] = redoButton;
            uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
            uint64_t v20 = [v8 arrayByAddingObjectsFromArray:v19];

            id v8 = (id)v19;
          }
          else
          {
            v27[0] = self->_undoButton;
            v27[1] = redoButton;
            uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
          }

          id v8 = (id)v20;
        }
      }
    }
    if (!v11)
    {
      if (self->_markupButton) {
        objc_msgSend(v4, "addObject:");
      }
      if (self->_moreButton) {
        objc_msgSend(v4, "addObject:");
      }
    }
  }
  CGRect v21 = (NSArray *)[v8 copy];
  secondaryLeadingViews = self->_secondaryLeadingViews;
  self->_secondaryLeadingViews = v21;

  CGRect v23 = (NSArray *)[v4 copy];
  secondaryTrailingViews = self->_secondaryTrailingViews;
  self->_secondaryTrailingViews = v23;

  secondaryCenterView = self->_secondaryCenterView;
  self->_secondaryCenterView = v9;

  self->_toolbarButtonsValid = 1;
}

- (void)_reloadToolbarButtonsIfNeeded
{
  id v4 = [(PUPhotoEditViewController *)self undoManager];

  v121 = [(PUPhotoEditViewController *)self undoManager];

  BOOL v5 = [(PUPhotoEditViewController *)self _shouldDisplayRedEyeTool];
  BOOL v6 = [(PUPhotoEditViewController *)self _enableSpatialMediaEditing];
  BOOL v7 = +[PUPhotoEditProtoSettings sharedInstance];
  SEL v119 = a2;
  if ([v7 editMenuEnabled])
  {
    int v8 = 1;
  }
  else if ([(PUEditPluginSession *)self->_pluginSession isAvailable])
  {
    BOOL v9 = [(PUPhotoEditViewController *)self _shouldHideToolsForQuickCrop];
    if (!v9 && !v6) {
      BOOL v9 = [(PUPhotoEditViewController *)self isSpatialMedia];
    }
    int v8 = !v9;
  }
  else
  {
    int v8 = 0;
  }

  BOOL v126 = [(PUPhotoEditViewController *)self _shouldShowRawDecodeBadge];
  if (v4) {
    BOOL v10 = self->_undoButton == 0;
  }
  else {
    BOOL v10 = self->_undoButton != 0;
  }
  if ([(PUPhotoEditViewController *)self _canPresentMarkup]) {
    BOOL v124 = [(PUPhotoEditViewController *)self _markupGetsItsOwnButton];
  }
  else {
    BOOL v124 = 0;
  }
  redEyeButton = self->_redEyeButton;
  v122 = v4;
  if (redEyeButton) {
    int v12 = [(PUPhotoEditToolbarButton *)redEyeButton isHidden] ^ 1;
  }
  else {
    LOBYTE(v12) = 0;
  }
  int v120 = v8;
  if (v8) {
    BOOL v13 = self->_moreButton == 0;
  }
  else {
    BOOL v13 = self->_moreButton != 0;
  }
  [(PXUIAssetBadgeView *)self->_assetTypeBadge alpha];
  BOOL v15 = v14 > 0.0;
  markupButton = self->_markupButton;
  BOOL v125 = [(PUPhotoEditViewController *)self _shouldShowProResBadge];
  objc_initWeak(location, self);
  uint64_t v17 = [(PUPhotoEditViewController *)self photoEditSpec];
  char v18 = v5 ^ v12;
  BOOL v123 = [v17 currentLayoutStyle] == 4 && self->_currentEditingTool != &self->_cropController->super;

  char v19 = !self->_toolbarButtonsValid || v10;
  BOOL v20 = v123;
  if ((((v19 | v18 | v13 | v124 ^ (markupButton != 0) | v126 ^ v15) | v15 ^ v125) & 1) != 0
    || ((v123 ^ (self->_showOriginalButton != 0)) & 1) != 0)
  {
    CGRect v21 = [(PUPhotoEditViewController *)self _allTools];
    if (!self->_coreToolButtons)
    {
      CGRect v22 = [MEMORY[0x1E4F1CA48] array];
      CGRect v23 = [MEMORY[0x1E4F1CA48] array];
      long long v24 = [MEMORY[0x1E4F1CA60] dictionary];
      v142[0] = MEMORY[0x1E4F143A8];
      v142[1] = 3221225472;
      v142[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke;
      v142[3] = &unk_1E5F28D70;
      v142[4] = self;
      id v25 = v22;
      id v143 = v25;
      id v26 = v23;
      id v144 = v26;
      [v21 enumerateObjectsUsingBlock:v142];
      double v27 = (NSArray *)[v25 copy];
      coreToolButtons = self->_coreToolButtons;
      self->_coreToolButtons = v27;

      BOOL v29 = (NSArray *)[v26 copy];
      coreToolButtonViews = self->_coreToolButtonViews;
      self->_coreToolButtonViews = v29;

      uint64_t v31 = (NSDictionary *)[v24 copy];
      toolTagLabelMap = self->_toolTagLabelMap;
      self->_toolTagLabelMap = v31;
    }
    uint64_t v33 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v34 = [v33 currentLayoutStyle];

    toolPickerController = self->_toolPickerController;
    if (!toolPickerController)
    {
      double v36 = [[PUPhotoEditToolPickerController alloc] initWithLayoutDirection:[(PUPhotoEditViewController *)self currentToolPickerLayoutDirection] style:0 blurredBackground:v34 == 4];
      id v37 = self->_toolPickerController;
      self->_toolPickerController = v36;

      toolPickerController = self->_toolPickerController;
    }
    [(PUPhotoEditToolPickerController *)toolPickerController setToolButtons:self->_coreToolButtonViews];
    id v38 = [MEMORY[0x1E4FB1618] systemGray4Color];
    id v39 = [v38 colorWithAlphaComponent:0.6];

    if (v34 == 4) {
      double v40 = v39;
    }
    else {
      double v40 = 0;
    }
    [(PUPhotoEditToolPickerController *)self->_toolPickerController setBackgroundColor:v40];
    double v41 = [(PUPhotoEditViewController *)self photoEditSpec];
    [(PUPhotoEditToolPickerController *)self->_toolPickerController setParentSpec:v41];

    assetTypeBadge = self->_assetTypeBadge;
    if (!v126 && !v125)
    {
      [(PXUIAssetBadgeView *)assetTypeBadge alpha];
      if (v52 > 0.0 && ![(PUPhotoEditViewController *)self isFocusingViewForInteraction])
      {
        v139[0] = MEMORY[0x1E4F143A8];
        v139[1] = 3221225472;
        v139[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_3;
        v139[3] = &unk_1E5F2ED10;
        v139[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v139 animations:0.25];
      }
      goto LABEL_51;
    }
    if (assetTypeBadge)
    {
LABEL_49:
      if (![(PUPhotoEditViewController *)self isFocusingViewForInteraction])
      {
        v140[0] = MEMORY[0x1E4F143A8];
        v140[1] = 3221225472;
        v140[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_2;
        v140[3] = &unk_1E5F2ED10;
        v140[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v140 animations:0.25];
      }
LABEL_51:
      double v55 = self->_redEyeButton;
      if (!v55)
      {
        long long v56 = [(PUPhotoEditViewController *)self redEyeController];
        long long v57 = [(PUPhotoEditViewController *)self _newToolButtonForTool:v56];
        double v58 = self->_redEyeButton;
        self->_redEyeButton = v57;

        [(PUPhotoEditToolbarButton *)self->_redEyeButton setIsTopToolbarButton:1];
        currentTool = self->_currentTool;
        double v60 = [(PUPhotoEditViewController *)self redEyeController];

        if (currentTool == v60) {
          [(PUPhotoEditToolbarButton *)self->_redEyeButton setSelected:1];
        }

        double v55 = self->_redEyeButton;
        BOOL v20 = v123;
      }
      [(PUPhotoEditToolbarButton *)v55 setHidden:!v5];
      showOriginalButton = self->_showOriginalButton;
      if (showOriginalButton) {
        BOOL v62 = 0;
      }
      else {
        BOOL v62 = v20;
      }
      if (v62)
      {
        id v63 = PULocalizedString(@"PHOTOEDIT_SHOW_ORIGINAL_ACCESSIBILITY_LABEL");
        id v64 = [(PUPhotoEditViewController *)self photoEditSpec];
        id v65 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"square.and.line.vertical.and.square.filled" selectedImageNamed:0 accessibilityLabel:v63 spec:v64];
        id v66 = self->_showOriginalButton;
        self->_showOriginalButton = v65;

        v137[0] = MEMORY[0x1E4F143A8];
        v137[1] = 3221225472;
        v137[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_4;
        v137[3] = &unk_1E5F28D98;
        objc_copyWeak(&v138, location);
        [(PUPhotoEditToolbarButton *)self->_showOriginalButton setActionBlock:v137];
        long long v67 = v122;
        objc_destroyWeak(&v138);
      }
      else
      {
        if (showOriginalButton) {
          char v68 = v20;
        }
        else {
          char v68 = 1;
        }
        long long v67 = v122;
        if ((v68 & 1) == 0)
        {
          self->_showOriginalButton = 0;
        }
      }
      undoButton = self->_undoButton;
      if (undoButton || !v67)
      {
        if (undoButton && !v67)
        {
          self->_undoButton = 0;
        }
      }
      else
      {
        long long v70 = PULocalizedString(@"PHOTOEDIT_UNDO_ACCESSIBILITY_LABEL");
        BOOL v71 = [(PUPhotoEditViewController *)self photoEditSpec];
        uint64_t v72 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"arrow.uturn.backward.circle" selectedImageNamed:0 accessibilityLabel:v70 spec:v71];
        uint64_t v73 = self->_undoButton;
        self->_undoButton = v72;

        v135[0] = MEMORY[0x1E4F143A8];
        v135[1] = 3221225472;
        v135[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_5;
        v135[3] = &unk_1E5F28D98;
        objc_copyWeak(&v136, location);
        [(PUPhotoEditToolbarButton *)self->_undoButton setActionBlock:v135];
        objc_destroyWeak(&v136);
      }
      redoButton = self->_redoButton;
      if (redoButton || !v121)
      {
        if (redoButton && !v121)
        {
          self->_redoButton = 0;
        }
      }
      else
      {
        double v75 = PULocalizedString(@"PHOTOEDIT_REDO_ACCESSIBILITY_LABEL");
        double v76 = [(PUPhotoEditViewController *)self photoEditSpec];
        double v77 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"arrow.uturn.forward.circle" selectedImageNamed:0 accessibilityLabel:v75 spec:v76];
        double v78 = self->_redoButton;
        self->_redoButton = v77;

        v133[0] = MEMORY[0x1E4F143A8];
        v133[1] = 3221225472;
        v133[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_6;
        v133[3] = &unk_1E5F28D98;
        objc_copyWeak(&v134, location);
        [(PUPhotoEditToolbarButton *)self->_redoButton setActionBlock:v133];
        objc_destroyWeak(&v134);
      }
      int v79 = v120;
      if (self->_moreButton) {
        int v79 = 0;
      }
      if (v79 == 1)
      {
        double v80 = PULocalizedString(@"MORE_BUTTON_TITLE");
        double v81 = [(PUPhotoEditViewController *)self photoEditSpec];
        id v82 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"ellipsis.circle" selectedImageNamed:0 accessibilityLabel:v80 spec:v81];
        moreButton = self->_moreButton;
        self->_moreButton = v82;

        [(PUPhotoEditToolbarButton *)self->_moreButton setIsTopToolbarButton:1];
        v84 = +[PUPhotoEditProtoSettings sharedInstance];
        LODWORD(v81) = [v84 editMenuEnabled];

        double v85 = self->_moreButton;
        if (v81)
        {
          [(PUPhotoEditToolbarButton *)v85 setShowsMenuAsPrimaryAction:1];
          [(PUPhotoEditViewController *)self _reloadMoreButtonMenu];
        }
        else
        {
          [(PUPhotoEditToolbarButton *)v85 setShowsMenuAsPrimaryAction:0];
          [(PUPhotoEditToolbarButton *)self->_moreButton setMenu:0];
          v131[0] = MEMORY[0x1E4F143A8];
          v131[1] = 3221225472;
          v131[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_7;
          v131[3] = &unk_1E5F28D98;
          objc_copyWeak(&v132, location);
          [(PUPhotoEditToolbarButton *)self->_moreButton setActionBlock:v131];
          objc_destroyWeak(&v132);
        }
      }
      id v86 = self->_markupButton;
      if (v86) {
        BOOL v87 = 0;
      }
      else {
        BOOL v87 = v124;
      }
      if (v87)
      {
        double v88 = PULocalizedString(@"MARKUP_BUTTON_TITLE");
        CGRect v89 = [(PUPhotoEditViewController *)self photoEditSpec];
        CGRect v90 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"pencil.tip.crop.circle" selectedImageNamed:0 accessibilityLabel:v88 spec:v89];
        CGRect v91 = self->_markupButton;
        self->_markupButton = v90;

        [(PUPhotoEditToolbarButton *)self->_markupButton setIsTopToolbarButton:1];
        v129[0] = MEMORY[0x1E4F143A8];
        v129[1] = 3221225472;
        v129[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_8;
        v129[3] = &unk_1E5F28D98;
        objc_copyWeak(&v130, location);
        [(PUPhotoEditToolbarButton *)self->_markupButton setActionBlock:v129];
        objc_destroyWeak(&v130);
      }
      else
      {
        if (v86) {
          char v92 = v124;
        }
        else {
          char v92 = 1;
        }
        if ((v92 & 1) == 0)
        {
          self->_markupButton = 0;
        }
      }
      if (!self->_zoomButton && !self->_isEmbeddedEdit)
      {
        CGRect v93 = PULocalizedString(@"ZOOM_BUTTON_TITLE");
        CGRect v94 = [(PUPhotoEditViewController *)self photoEditSpec];
        CGRect v95 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"arrow.up.left.and.arrow.down.right" selectedImageNamed:@"arrow.down.right.and.arrow.up.left" accessibilityLabel:v93 spec:v94];
        zoomButton = self->_zoomButton;
        self->_zoomButton = v95;

        [(PUPhotoEditToolbarButton *)self->_zoomButton setIsTopToolbarButton:1];
        CGRect v97 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [(PUPhotoEditToolbarButton *)self->_zoomButton setSelectedColor:v97];

        v127[0] = MEMORY[0x1E4F143A8];
        v127[1] = 3221225472;
        v127[2] = __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_9;
        v127[3] = &unk_1E5F28D98;
        objc_copyWeak(&v128, location);
        [(PUPhotoEditToolbarButton *)self->_zoomButton setActionBlock:v127];
        objc_destroyWeak(&v128);
      }
      if (!self->_mainActionButton)
      {
        CGRect v98 = [PUPhotoEditNotchButton alloc];
        id v99 = -[PUPhotoEditNotchButton initWithFrame:](v98, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        mainActionButton = self->_mainActionButton;
        self->_mainActionButton = v99;

        [(PUPhotoEditNotchButton *)self->_mainActionButton addTarget:self action:sel__handleMainActionButton_ forControlEvents:64];
        self->_int64_t mainButtonAction = 0;
        [(PUPhotoEditNotchButton *)self->_mainActionButton setTranslatesAutoresizingMaskIntoConstraints:0];
        if ([(PUPhotoEditViewController *)self isStandardVideo])
        {
          v101 = [(PUPhotoEditViewController *)self photo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            [(PUPhotoEditViewController *)self updateMainButtonForSaveAsNewClipMenu];
          }
        }
        id v103 = [(PUPhotoEditViewController *)self revertConfirmationAlert];

        if (v103)
        {
          v104 = [(PUPhotoEditViewController *)self revertConfirmationAlert];
          long long v105 = [v104 popoverPresentationController];
          [v105 setSourceView:self->_mainActionButton];

          long long v106 = [(PUPhotoEditViewController *)self revertConfirmationAlert];
          long long v107 = [v106 popoverPresentationController];
          [(PUPhotoEditNotchButton *)self->_mainActionButton bounds];
          objc_msgSend(v107, "setSourceRect:");
        }
      }
      p_cancelButton = &self->_cancelButton;
      if (!self->_cancelButton)
      {
        v109 = [PUPhotoEditNotchButton alloc];
        uint64_t v110 = -[PUPhotoEditNotchButton initWithFrame:](v109, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v111 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_CANCEL_OR_ICON");
        [(PUPhotoEditNotchButton *)v110 setTitle:v111 fallbackSymbolName:@"xmark"];

        objc_storeStrong((id *)&self->_cancelButton, v110);
        [(PUPhotoEditNotchButton *)*p_cancelButton addTarget:self action:sel__handleCancelButton_ forControlEvents:64];
        v112 = PULocalizedString(@"PHOTOEDIT_TOOLBAR_CANCEL_ACCESSIBILITY");
        [(PUPhotoEditNotchButton *)*p_cancelButton setAccessibilityLabel:v112];

        [(PUPhotoEditNotchButton *)*p_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
        v113 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];

        if (v113)
        {
          v114 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];
          v115 = [v114 popoverPresentationController];
          [v115 setSourceView:*p_cancelButton];

          v116 = [(PUPhotoEditViewController *)self cancelConfirmationAlert];
          v117 = [v116 popoverPresentationController];
          [(PUPhotoEditNotchButton *)*p_cancelButton bounds];
          objc_msgSend(v117, "setSourceRect:");
        }
      }
      [(PUPhotoEditViewController *)self _updateToolbarButtonPositions];
      [(PUPhotoEditViewController *)self _updateZoomButton];

      goto LABEL_107;
    }
    id v43 = objc_alloc(MEMORY[0x1E4F90840]);
    double v44 = (PXUIAssetBadgeView *)objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E4F28AD8], *(double *)(MEMORY[0x1E4F28AD8] + 8), *(double *)(MEMORY[0x1E4F28AD8] + 16), *(double *)(MEMORY[0x1E4F28AD8] + 24));
    double v45 = self->_assetTypeBadge;
    self->_assetTypeBadge = v44;

    [(PXUIAssetBadgeView *)self->_assetTypeBadge setStyle:3];
    [(PXUIAssetBadgeView *)self->_assetTypeBadge setTranslatesAutoresizingMaskIntoConstraints:0];
    if (!v126)
    {
LABEL_48:
      PXAssetBadgeInfoCreateWithBadges();
      memset(v141, 0, sizeof(v141));
      [(PXUIAssetBadgeView *)self->_assetTypeBadge setBadgeInfo:v141];
      double v53 = [(PUPhotoEditViewController *)self view];
      [v53 addSubview:self->_assetTypeBadge];

      double v54 = [(PUPhotoEditViewController *)self view];
      [v54 setNeedsUpdateConstraints];

      [(PXUIAssetBadgeView *)self->_assetTypeBadge setAlpha:0.0];
      BOOL v20 = v123;
      goto LABEL_49;
    }
    double v46 = [(PUPhotoEditViewController *)self photo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v47 = [(PUPhotoEditViewController *)self photo];
      if (!v47)
      {
        double v48 = [MEMORY[0x1E4F28B00] currentHandler];
        v118 = (objc_class *)objc_opt_class();
        double v50 = NSStringFromClass(v118);
        [v48 handleFailureInMethod:v119, self, @"PUPhotoEditViewController.m", 2825, @"%@ should be an instance inheriting from %@, but it is nil", @"self.photo", v50 object file lineNumber description];
        goto LABEL_109;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        double v48 = [MEMORY[0x1E4F28B00] currentHandler];
        double v49 = (objc_class *)objc_opt_class();
        double v50 = NSStringFromClass(v49);
        double v51 = objc_msgSend(v47, "px_descriptionForAssertionMessage");
        [v48 handleFailureInMethod:v119, self, @"PUPhotoEditViewController.m", 2825, @"%@ should be an instance inheriting from %@, but it is %@", @"self.photo", v50, v51 object file lineNumber description];

LABEL_109:
      }
    }
    else
    {
      double v47 = 0;
    }

    [v47 RAWBadgeAttributes];
    goto LABEL_48;
  }
LABEL_107:
  objc_destroyWeak(location);
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke(id *a1, void *a2)
{
  id v11 = a2;
  if ([v11 toolControllerTag] != 1006)
  {
    id v3 = (id)[a1[4] _newToolButtonForTool:v11];
    int v4 = [a1[4] showsLabelsForToolButtons];
    BOOL v5 = [v3 widthAnchor];
    BOOL v6 = [v5 constraintEqualToConstant:30.0];
    [v6 setActive:1];

    BOOL v7 = [v3 heightAnchor];
    int v8 = v7;
    double v9 = 38.0;
    if (v4) {
      double v9 = 48.0;
    }
    BOOL v10 = [v7 constraintEqualToConstant:v9];
    [v10 setActive:1];

    [a1[5] addObject:v3];
    [a1[6] addObject:v3];
    [v3 setSelected:*((void *)a1[4] + 125) == (void)v11];
    objc_msgSend(v3, "setAvailable:", objc_msgSend(v11, "enabled"));
  }
}

uint64_t __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1488) setAlpha:1.0];
}

uint64_t __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1488) setAlpha:0.0];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleShowOriginalButton:v3];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleUndoButton:v3];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRedoButton:v3];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePluginButton:v3];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleMarkupButton:v3];
}

void __58__PUPhotoEditViewController__reloadToolbarButtonsIfNeeded__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleZoomButton:v3];
}

- (BOOL)_shouldShowProResBadge
{
  BOOL result = self->_shouldShowProResBadge
        && (currentEditingTool = (PUCropToolController *)self->_currentEditingTool,
            currentEditingTool != self->_cropController)
        && self->_currentTool
        && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController;
  return result;
}

- (BOOL)_shouldShowRawDecodeBadge
{
  BOOL result = self->_shouldShowRawDecodeBadge
        && (currentEditingTool = (PUCropToolController *)self->_currentEditingTool,
            currentEditingTool != self->_cropController)
        && self->_currentTool
        && currentEditingTool != (PUCropToolController *)self->_photoStylesToolController;
  return result;
}

- (BOOL)_markupGetsItsOwnButton
{
  id v3 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v4 = [v3 currentLayoutStyle];

  if (v4 == 1 && self->_currentEditingTool == &self->_cropController->super) {
    return 0;
  }
  else {
    return ![(PUPhotoEditViewController *)self _shouldHideToolsForQuickCrop];
  }
}

- (BOOL)_shouldHideToolsForQuickCrop
{
  BOOL v2 = [(PUPhotoEditViewController *)self _isQuickCrop];
  if (v2)
  {
    id v3 = +[PUOneUpSettings sharedInstance];
    char v4 = [v3 quickCropHideOtherToolsInEdit];

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (void)_updateToolbarsContentPadding
{
  id v3 = [(PUPhotoEditViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = *MEMORY[0x1E4FB2848];
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  CGRect v16 = [(PUPhotoEditViewController *)self traitCollection];
  uint64_t v17 = [v16 userInterfaceIdiom];

  int64_t v18 = [(PUPhotoEditViewController *)self layoutOrientation];
  BOOL v19 = v9 > 0.0 && v17 == 1;
  double v20 = v9 + 15.0;
  if (!v19) {
    double v20 = v9;
  }
  if (v18 == 1)
  {
    double v21 = v5;
  }
  else
  {
    double v20 = v14;
    double v21 = v12;
  }
  if (v18 == 2) {
    double v22 = v14;
  }
  else {
    double v22 = v20;
  }
  if (v18 == 2)
  {
    double v23 = v11;
  }
  else
  {
    double v5 = v21;
    double v7 = v13;
    double v23 = v15;
  }
  -[PUPhotoEditToolbar setContentPadding:](self->_mainToolbar, "setContentPadding:", v12, v13, v22, v23);
  secondaryToolbar = self->_secondaryToolbar;
  -[PUPhotoEditToolbar setContentPadding:](secondaryToolbar, "setContentPadding:", v5, v7, v14, v23);
}

- (BOOL)_actionButtonsGoInTopToolbar
{
  int64_t v3 = [(PUPhotoEditViewController *)self layoutOrientation];
  double v4 = [(PUPhotoEditViewController *)self view];
  [v4 bounds];
  BOOL v6 = !+[PUPhotoEditLayoutSupport doneCancelButtonsInNotchAreaForLayoutOrientation:v3 viewWidth:v5];

  return v6;
}

- (void)_updateToolbarsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v174[1] = *MEMORY[0x1E4F143B8];
  double v5 = [(PUPhotoEditViewController *)self photoEditSpec];
  int v6 = [v5 isValid];

  if (!v6 || self->_updatingToolbars) {
    return;
  }
  [(PUPhotoEditViewController *)self _loadToolsIfNeeded];
  self->_updatingToolbars = 1;
  double v7 = [(PUPhotoEditViewController *)self view];
  if (!self->_mainToolbar)
  {
    double v8 = objc_alloc_init(PUPhotoEditToolbar);
    mainToolbar = self->_mainToolbar;
    self->_mainToolbar = v8;

    [(PUPhotoEditToolbar *)self->_mainToolbar setDelegate:self];
    [(PUPhotoEditToolbar *)self->_mainToolbar setupWithLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation]];
    [v7 addSubview:self->_mainToolbar];
    [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
    [v7 setNeedsUpdateConstraints];
    double v10 = [(PUPhotoEditViewController *)self photoEditSpec];
    [v10 toolbarLongSideMargin];
    -[PUPhotoEditToolbar setLongSideMargin:](self->_mainToolbar, "setLongSideMargin:");

    if ([(PUPhotoEditViewController *)self layoutOrientation] == 1)
    {
      double v11 = [(PUPhotoEditViewController *)self traitCollection];
      uint64_t v12 = [v11 userInterfaceIdiom];

      if (!v12) {
        [(PUPhotoEditToolbar *)self->_mainToolbar setUseiPhonePrimaryPortraitHeight:1];
      }
    }
  }
  double v13 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v13 toolbarShadowsEnabled])
  {
    mainToolbarShadow = self->_mainToolbarShadow;

    if (!mainToolbarShadow)
    {
      double v15 = [PUPhotoEditShadowView alloc];
      CGRect v16 = -[PUPhotoEditShadowView initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v17 = self->_mainToolbarShadow;
      self->_mainToolbarShadow = v16;

      [(PUPhotoEditShadowView *)self->_mainToolbarShadow setAlpha:0.0];
      [v7 addSubview:self->_mainToolbarShadow];
    }
  }
  else
  {
  }
  if (self->_secondaryToolbar)
  {
    [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
  }
  else
  {
    int64_t v18 = objc_alloc_init(PUPhotoEditButtonCenteredToolbar);
    secondaryToolbar = self->_secondaryToolbar;
    self->_secondaryToolbar = v18;

    [(PUPhotoEditToolbar *)self->_secondaryToolbar setDelegate:self];
    double v20 = [(PUPhotoEditViewController *)self photoEditSpec];
    [(PUPhotoEditToolbar *)self->_secondaryToolbar setPhotoEditSpec:v20];

    [(PUPhotoEditToolbar *)self->_secondaryToolbar setupWithLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation]];
    [v7 addSubview:self->_secondaryToolbar];
    double v21 = +[PUPhotoEditProtoSettings sharedInstance];
    int v22 = [v21 toolbarShadowsEnabled];

    if (v22)
    {
      double v23 = [PUPhotoEditShadowView alloc];
      long long v24 = -[PUPhotoEditShadowView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      secondaryToolbarShadow = self->_secondaryToolbarShadow;
      self->_secondaryToolbarShadow = v24;

      [(PUPhotoEditShadowView *)self->_secondaryToolbarShadow setAlpha:0.0];
      [v7 addSubview:self->_secondaryToolbarShadow];
    }
    [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
    [v7 setNeedsUpdateConstraints];
    id v26 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v27 = [v26 currentLayoutStyle];

    if (v27 == 4) {
      [(PUPhotoEditToolbar *)self->_secondaryToolbar setUseLargeShortSideHeight:1];
    }
    [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
    [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar setAlpha:0.0];
    [(PUPhotoEditShadowView *)self->_secondaryToolbarShadow setAlpha:0.0];
    if (v3)
    {
      v166[0] = MEMORY[0x1E4F143A8];
      v166[1] = 3221225472;
      v166[2] = __53__PUPhotoEditViewController__updateToolbarsAnimated___block_invoke;
      v166[3] = &unk_1E5F2ED10;
      v166[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v166 animations:0.2];
    }
    else
    {
      [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar setAlpha:1.0];
      [(PUPhotoEditViewController *)self _updateToolbarShadowAlpha];
    }
    [(PUPhotoEditViewController *)self _clearBadgeConstraints];
    if (self->_currentToolViewConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      currentToolViewConstraints = self->_currentToolViewConstraints;
      self->_currentToolViewConstraints = 0;

      BOOL v29 = [(PUPhotoEditViewController *)self view];
      [v29 setNeedsUpdateConstraints];
    }
  }
  uint64_t v30 = [(PUPhotoEditViewController *)self editSource];
  if ([v30 mediaType] != 3)
  {

LABEL_26:
    if (![(PUPhotoEditViewController *)self isStandardVideo]) {
      goto LABEL_30;
    }
    goto LABEL_27;
  }
  uint64_t v31 = [(PUPhotoEditViewController *)self photo];
  char v32 = [v31 isLivePhotoVisibilityAdjustmentAllowed];

  if ((v32 & 1) == 0) {
    goto LABEL_26;
  }
LABEL_27:
  uint64_t v33 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];

  if (v33)
  {
    if (!self->_mediaToolController)
    {
      uint64_t v34 = objc_alloc_init(PUPhotoEditMediaToolController);
      mediaToolController = self->_mediaToolController;
      self->_mediaToolController = v34;

      [(PUPhotoEditMediaToolController *)self->_mediaToolController setBackdropViewGroupName:@"PUPhotoEditToolbarGroupName"];
      [(PUPhotoEditViewController *)self _updateSubviewsOrdering];
      [v7 setNeedsUpdateConstraints];
      double v36 = self->_mediaToolController;
      id v37 = [(PUPhotoEditViewController *)self aggregateSession];
      [(PUPhotoEditToolController *)v36 setAggregateSession:v37];

      [(PUPhotoEditToolController *)self->_mediaToolController setDelegate:self];
      [(PUPhotoEditMediaToolController *)self->_mediaToolController setLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation] withTransitionCoordinator:0];
      coreToolButtons = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      coreToolButtonViews = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      toolTagLabelMap = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      BOOL v149 = 0;
      self->_toolbarButtonsValid = 0;
      int v41 = 1;
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_30:
  double v42 = self->_mediaToolController;
  if (v42)
  {
    BOOL v149 = self->_currentEditingTool == (PUPhotoEditToolController *)v42;
    [(PUPhotoEditMediaToolController *)v42 removeFromParentViewController];
    id v43 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    double v44 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    double v45 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    double v46 = self->_mediaToolController;
    self->_mediaToolController = 0;

    int v41 = 0;
    goto LABEL_33;
  }
LABEL_32:
  int v41 = 0;
  BOOL v149 = 0;
LABEL_33:
  portraitToolController = self->_portraitToolController;
  if (self->_shouldShowPortraitTool)
  {
    if (!portraitToolController)
    {
      double v48 = objc_alloc_init(PUPhotoEditPortraitToolController);
      double v49 = self->_portraitToolController;
      self->_portraitToolController = v48;

      [(PUPhotoEditToolController *)self->_portraitToolController setDelegate:self];
      [(PUPhotoEditPortraitToolController *)self->_portraitToolController setBackdropViewGroupName:@"PUPhotoEditToolbarGroupName"];
      id v50 = (id)[(PUPhotoEditPortraitToolController *)self->_portraitToolController view];
      [(PUPhotoEditPortraitToolController *)self->_portraitToolController setLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation] withTransitionCoordinator:0];
      double v51 = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      double v52 = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      double v53 = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      self->_toolbarButtonsValid = 0;
      int v41 = 1;
    }
  }
  else if (portraitToolController)
  {
    double v54 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    double v55 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    long long v56 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    long long v57 = self->_portraitToolController;
    self->_portraitToolController = 0;
  }
  photoStylesToolController = self->_photoStylesToolController;
  v146 = v7;
  if (self->_shouldShowStylesTool)
  {
    if (!photoStylesToolController)
    {
      CGFloat v59 = objc_alloc_init(_TtC15PhotosUIPrivate26PUPhotoStyleToolController);
      double v60 = self->_photoStylesToolController;
      self->_photoStylesToolController = v59;

      [(PUPhotoEditToolController *)self->_photoStylesToolController setDelegate:self];
      id v61 = (id)[(PUPhotoStyleToolController *)self->_photoStylesToolController view];
      [(PUPhotoStyleToolController *)self->_photoStylesToolController setLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation] withTransitionCoordinator:0];
      BOOL v62 = self->_coreToolButtons;
      self->_coreToolButtons = 0;

      id v63 = self->_coreToolButtonViews;
      self->_coreToolButtonViews = 0;

      id v64 = self->_toolTagLabelMap;
      self->_toolTagLabelMap = 0;

      self->_toolbarButtonsValid = 0;
      int v41 = 1;
    }
  }
  else if (photoStylesToolController)
  {
    id v65 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    id v66 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    long long v67 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    char v68 = self->_photoStylesToolController;
    self->_photoStylesToolController = 0;
  }
  int v148 = v41;
  if ([(PUPhotoEditViewController *)self isCinematicAudio] && !self->_audioToolController)
  {
    uint64_t v73 = objc_alloc_init(_TtC15PhotosUIPrivate21PUAudioToolController);
    audioToolController = self->_audioToolController;
    self->_audioToolController = v73;

    [(PUPhotoEditToolController *)self->_audioToolController setDelegate:self];
    id v75 = (id)[(PUAudioToolController *)self->_audioToolController view];
    [(PUPhotoEditToolController *)self->_audioToolController setLayoutOrientation:[(PUPhotoEditViewController *)self layoutOrientation] withTransitionCoordinator:0];
    double v76 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    double v77 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    double v78 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    self->_toolbarButtonsValid = 0;
    int v148 = 1;
  }
  else if (![(PUPhotoEditViewController *)self isCinematicAudio] && self->_audioToolController)
  {
    double v69 = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    long long v70 = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    BOOL v71 = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    uint64_t v72 = self->_audioToolController;
    self->_audioToolController = 0;
  }
  if (self->_audioToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v174[0] = self->_audioToolController;
    int v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v174 count:1];
    double v80 = [v79 arrayByAddingObjectsFromArray:self->__allTools];
    allTools = self->__allTools;
    self->__allTools = v80;
  }
  if (self->_mediaToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v173 = self->_mediaToolController;
    id v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v173 count:1];
    double v83 = [v82 arrayByAddingObjectsFromArray:self->__allTools];
    v84 = self->__allTools;
    self->__allTools = v83;
  }
  if (self->_portraitToolController && !-[NSArray containsObject:](self->__allTools, "containsObject:"))
  {
    v172 = self->_portraitToolController;
    double v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v172 count:1];
    id v86 = [v85 arrayByAddingObjectsFromArray:self->__allTools];
    BOOL v87 = self->__allTools;
    self->__allTools = v86;
  }
  if (self->_photoStylesToolController)
  {
    p_allTools = &self->__allTools;
    if (!-[NSArray containsObject:](self->__allTools, "containsObject:"))
    {
      CGRect v89 = [MEMORY[0x1E4F1CA48] arrayWithArray:*p_allTools];
      [v89 removeObject:self->_filtersController];
      [v89 insertObject:self->_photoStylesToolController atIndex:0];
      [(PUPhotoEditToolController *)self->_photoStylesToolController setEnabled:self->_shouldEnableStylesTool];
      int v90 = v149;
      if (!self->_shouldEnableStylesTool) {
        int v90 = 1;
      }
      BOOL v149 = v90;
      goto LABEL_67;
    }
    if (self->_photoStylesToolController) {
      goto LABEL_68;
    }
  }
  p_allTools = &self->__allTools;
  if ([(NSArray *)self->__allTools containsObject:self->_filtersController]
    && [(PUPhotoEditViewController *)self isOriginalStyleable])
  {
    CGRect v89 = [MEMORY[0x1E4F1CA48] arrayWithArray:*p_allTools];
    [v89 removeObject:self->_filtersController];
LABEL_67:
    uint64_t v91 = [MEMORY[0x1E4F1C978] arrayWithArray:v89];
    char v92 = *p_allTools;
    *p_allTools = (NSArray *)v91;
  }
LABEL_68:
  [(PUPhotoEditViewController *)self _updateToolbarsContentPadding];
  moreButton = self->_moreButton;
  self->_moreButton = 0;

  markupButton = self->_markupButton;
  self->_markupButton = 0;

  showOriginalButton = self->_showOriginalButton;
  self->_showOriginalButton = 0;

  long long v164 = 0u;
  long long v165 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  CGRect v96 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v97 = [v96 countByEnumeratingWithState:&v162 objects:v171 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v163;
    do
    {
      for (uint64_t i = 0; i != v98; ++i)
      {
        if (*(void *)v163 != v99) {
          objc_enumerationMutation(v96);
        }
        v101 = *(void **)(*((void *)&v162 + 1) + 8 * i);
        v102 = [(PUPhotoEditViewController *)self photoEditSpec];
        [v101 setPhotoEditSpec:v102];

        [v101 reloadToolbarButtons:1];
      }
      uint64_t v98 = [v96 countByEnumeratingWithState:&v162 objects:v171 count:16];
    }
    while (v98);
  }

  [(PUPhotoEditViewController *)self _reloadToolbarButtonsIfNeeded];
  [(PUPhotoEditViewController *)self _updateToolbarButtonPositions];
  if ([(PUPhotoEditViewController *)self isRunningAutoCalculators])
  {
    char v151 = 1;
    BOOL v103 = 1;
  }
  else
  {
    v104 = [(PUPhotoEditViewController *)self editSourceContentEditingInput];

    if (v104)
    {
      BOOL v103 = [(PUPhotoEditViewController *)self _shouldHideToolsForQuickCrop];
      char v151 = 0;
    }
    else
    {
      char v151 = 1;
      BOOL v103 = 1;
    }
  }
  long long v105 = [(PUPhotoEditToolPickerController *)self->_toolPickerController view];
  [v105 setHidden:v103];

  toolPickerController = self->_toolPickerController;
  if (toolPickerController)
  {
    long long v107 = [(PUPhotoEditToolPickerController *)toolPickerController view];
    v170 = v107;
    id v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v170 count:1];
  }
  else
  {
    id v108 = (id)MEMORY[0x1E4F1CBF0];
  }
  v109 = self->_secondaryLeadingViews;
  uint64_t v110 = self->_secondaryTrailingViews;
  v153 = self->_mainActionButton;
  v111 = self->_cancelButton;
  v112 = [(PUPhotoEditViewController *)self photoEditSpec];
  [v112 toolbarLongSideMargin];
  double v114 = v113;

  [(PUPhotoEditToolbar *)self->_secondaryToolbar setTopActionButtonPadding:0.0];
  v147 = v108;
  id v115 = v108;
  if ([(PUPhotoEditViewController *)self _actionButtonsGoInTopToolbar])
  {
    v116 = v111;
    cancelButton = self->_cancelButton;
    v117 = [MEMORY[0x1E4F1C978] arrayWithObjects:&cancelButton count:1];
    uint64_t v118 = [v117 arrayByAddingObjectsFromArray:v109];

    if (self->_zoomButton) {
      char v119 = v151;
    }
    else {
      char v119 = 1;
    }
    if ((v119 & 1) == 0)
    {
      currentEditingTool = (PUCropToolController *)self->_currentEditingTool;
      if (currentEditingTool)
      {
        if (currentEditingTool != self->_cropController)
        {
          uint64_t v124 = -[NSArray arrayByAddingObject:](v110, "arrayByAddingObject:");

          uint64_t v110 = (NSArray *)v124;
        }
      }
    }
    uint64_t v125 = [(NSArray *)v110 arrayByAddingObject:self->_mainActionButton];

    [(PUPhotoEditToolbar *)self->_mainToolbar setLayoutDirection:[(PUPhotoEditViewController *)self currentToolPickerLayoutDirection]];
    [(PUPhotoEditToolPickerController *)self->_toolPickerController setLayoutDirection:[(PUPhotoEditViewController *)self currentToolPickerLayoutDirection]];
    int v120 = [(PUPhotoEditViewController *)self photoEditSpec];
    [v120 toolbarLongSideWideMargin];
    double v114 = v126;
    v152 = (void *)v118;
    v121 = (void *)v125;
    id v115 = v108;
  }
  else
  {
    v152 = v109;
    int v120 = v111;
    v121 = v110;
    if (!v111)
    {
      v127 = 0;
      v122 = v153;
      goto LABEL_97;
    }
    v122 = v153;
    if (!v153)
    {
      v127 = v111;
      goto LABEL_97;
    }
    [(PUPhotoEditNotchButton *)v111 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUPhotoEditNotchButton *)v153 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar addSubview:v111];
    [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar addSubview:v153];
  }
  v122 = 0;
  v127 = 0;
LABEL_97:
  id v128 = self->_mainToolbar;
  if (v128) {
    [(PUPhotoEditToolbar *)v128 setToolButtons:v115 buttonSpacing:1 mainActionButton:v122 secondaryActionButton:v127];
  }
  int64_t v129 = [(PUPhotoEditViewController *)self layoutOrientation];
  id v130 = [(PUPhotoEditViewController *)self view];
  +[PUPhotoEditLayoutSupport topToolbarVerticalOffsetForLayoutOrientation:v129 view:v130];
  -[PUPhotoEditToolbar setTopActionButtonPadding:](self->_secondaryToolbar, "setTopActionButtonPadding:");

  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar setCenterView:self->_secondaryCenterView leadingViews:v152 trailingViews:v121];
  [(PUPhotoEditToolbar *)self->_secondaryToolbar setLongSideMargin:v114];
  [(PUPhotoEditViewController *)self _updateCancelButtonAnimated:v3];
  [(PUPhotoEditViewController *)self _updateMainActionButtonAnimated:v3];
  [(PUPhotoEditViewController *)self _updateUndoRedoButtonsAnimated:v3];
  [(PUPhotoEditViewController *)self _updateMoreButtonAnimated:v3];
  [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:v3];
  [(PUPhotoEditViewController *)self _updateKeyCommands];
  if (v148) {
    [(PUPhotoEditViewController *)self _setupToolsIfNeeded];
  }
  v131 = self->_coreToolButtons;
  id v132 = v131;
  v145 = v121;
  if (self->_redEyeButton)
  {
    uint64_t v133 = -[NSArray arrayByAddingObject:](v131, "arrayByAddingObject:");

    id v132 = (void *)v133;
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  id v134 = v132;
  uint64_t v135 = [v134 countByEnumeratingWithState:&v158 objects:v168 count:16];
  if (v135)
  {
    uint64_t v136 = v135;
    uint64_t v137 = *(void *)v159;
    do
    {
      for (uint64_t j = 0; j != v136; ++j)
      {
        if (*(void *)v159 != v137) {
          objc_enumerationMutation(v134);
        }
        [(PUPhotoEditViewController *)self configureEnablenessOfControlButton:*(void *)(*((void *)&v158 + 1) + 8 * j) animated:v3 canVisuallyDisable:1];
      }
      uint64_t v136 = [v134 countByEnumeratingWithState:&v158 objects:v168 count:16];
    }
    while (v136);
  }

  if (v149) {
    [(PUPhotoEditViewController *)self switchToEditingTool:self->_adjustmentsController animated:0];
  }
  [(PUPhotoEditToolPickerController *)self->_toolPickerController setSelectedToolTag:[(PUPhotoEditToolController *)self->_currentEditingTool toolControllerTag]];
  int64_t currentlyHighlightedToolButtonTag = self->_currentlyHighlightedToolButtonTag;
  if (currentlyHighlightedToolButtonTag != [(PUPhotoEditToolController *)self->_currentEditingTool toolControllerTag])
  {
    v150 = v127;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v140 = self->_coreToolButtons;
    uint64_t v141 = [(NSArray *)v140 countByEnumeratingWithState:&v154 objects:v167 count:16];
    if (v141)
    {
      uint64_t v142 = v141;
      uint64_t v143 = *(void *)v155;
      do
      {
        for (uint64_t k = 0; k != v142; ++k)
        {
          if (*(void *)v155 != v143) {
            objc_enumerationMutation(v140);
          }
          objc_msgSend(*(id *)(*((void *)&v154 + 1) + 8 * k), "setSelected:", -[PUPhotoEditToolController toolControllerTag](self->_currentEditingTool, "toolControllerTag") == objc_msgSend(*(id *)(*((void *)&v154 + 1) + 8 * k), "tag"));
        }
        uint64_t v142 = [(NSArray *)v140 countByEnumeratingWithState:&v154 objects:v167 count:16];
      }
      while (v142);
    }

    self->_int64_t currentlyHighlightedToolButtonTag = [(PUPhotoEditToolController *)self->_currentEditingTool toolControllerTag];
    v127 = v150;
  }
  self->_updatingToolbars = 0;
}

uint64_t __53__PUPhotoEditViewController__updateToolbarsAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1160) setAlpha:1.0];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateToolbarShadowAlpha];
}

- (void)_updateRenderedPreviewForceRender:(BOOL)a3
{
  currentEditingTool = self->_currentEditingTool;
  if (currentEditingTool
    && (![(PUPhotoEditToolController *)currentEditingTool wantsDefaultPreviewView]
     || [(PUPhotoEditToolController *)self->_currentEditingTool shouldHideMediaView]))
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [(UIImageView *)self->_placeholderImageView isHidden];
  }
  mediaView = self->_mediaView;
  [(NUMediaView *)mediaView setHidden:v5];
}

- (BOOL)isOriginalStyleable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUPhotoEditViewController *)self photo];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  uint64_t v5 = [v4 fetchSmartStyleExtendedProperties];

  int v6 = [v5 originallySmartStyleable];
  double v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [(PUPhotoEditViewController *)self photo];
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    uint64_t v10 = [v9 uuid];
    double v11 = (void *)v10;
    uint64_t v12 = @"NO";
    if (v6) {
      uint64_t v12 = @"YES";
    }
    int v14 = 138543618;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEFAULT, "PUPhotoEditViewController - Asset %{public}@: originallySmartStyleable %@", (uint8_t *)&v14, 0x16u);
  }
  return v6;
}

- (BOOL)currentAssetNeedsGainMap
{
  if ([MEMORY[0x1E4F7A4A0] renderMeteorPlusAsHDR])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(PUPhotoEditViewController *)self photo];
    unint64_t v3 = ((unint64_t)[v4 mediaSubtypes] >> 9) & 1;
  }
  return v3;
}

- (id)mainLivePhotoView
{
  return (id)[(NUMediaView *)self->_mediaView _livePhotoView];
}

- (void)configureEnablenessOfControlButton:(id)a3 animated:(BOOL)a4 canVisuallyDisable:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(PUPhotoEditViewController *)self resourceLoader];
  unint64_t v10 = [v9 resourcesAvailability];

  unsigned int v11 = (v10 < 4) & (0xBu >> (v10 & 0xF));
  progressEventBlockingView = self->_progressEventBlockingView;
  if (progressEventBlockingView) {
    unsigned int v11 = 0;
  }
  uint64_t v13 = v11 | !v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v14 = v8;
  }
  else {
    int v14 = 0;
  }
  id v15 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v16 = v8;
  }
  else {
    __int16 v16 = 0;
  }
  id v17 = v16;
  uint64_t v18 = 0;
  if (v10 == 3 && !progressEventBlockingView)
  {
    BOOL v19 = [(PUPhotoEditViewController *)self valuesCalculator];
    uint64_t v18 = [v19 hasImageValues];
  }
  if (v15)
  {
    [v15 setUserInteractionEnabled:v18];
    if (v13 != [v15 isEnabled])
    {
      if (v6) {
        double v20 = 0.25;
      }
      else {
        double v20 = 0.0;
      }
      double v21 = (void *)MEMORY[0x1E4FB1EB0];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __92__PUPhotoEditViewController_configureEnablenessOfControlButton_animated_canVisuallyDisable___block_invoke;
      v22[3] = &unk_1E5F2E120;
      id v23 = v15;
      char v24 = v13;
      [v21 transitionWithView:v23 duration:5242880 options:v22 animations:0 completion:v20];
    }
  }
  else if (v17)
  {
    [v17 setEnabled:v13];
  }
}

uint64_t __92__PUPhotoEditViewController_configureEnablenessOfControlButton_animated_canVisuallyDisable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t layoutOrientation = self->_layoutOrientation;
  if (layoutOrientation != a3)
  {
    self->_int64_t layoutOrientation = a3;
    double v51 = self->_mainToolbar;
    double v49 = self->_mainToolbarShadow;
    double v52 = self->_secondaryToolbar;
    id v50 = self->_secondaryToolbarShadow;
    [(PUPhotoEditViewController *)self _clearToolbars];
    coreToolButtons = self->_coreToolButtons;
    self->_coreToolButtons = 0;

    coreToolButtonViews = self->_coreToolButtonViews;
    self->_coreToolButtonViews = 0;

    toolTagLabelMap = self->_toolTagLabelMap;
    self->_toolTagLabelMap = 0;

    secondaryLeadingViews = self->_secondaryLeadingViews;
    self->_secondaryLeadingViews = 0;

    mainActionButton = self->_mainActionButton;
    self->_mainActionButton = 0;

    cancelButton = self->_cancelButton;
    self->_cancelButton = 0;

    secondaryTrailingViews = self->_secondaryTrailingViews;
    self->_secondaryTrailingViews = 0;

    secondaryCenterView = self->_secondaryCenterView;
    self->_secondaryCenterView = 0;

    undoButton = self->_undoButton;
    self->_undoButton = 0;

    redoButton = self->_redoButton;
    self->_redoButton = 0;

    redEyeButton = self->_redEyeButton;
    self->_redEyeButton = 0;

    moreButton = self->_moreButton;
    self->_moreButton = 0;

    markupButton = self->_markupButton;
    self->_markupButton = 0;

    showOriginalButton = self->_showOriginalButton;
    self->_showOriginalButton = 0;

    self->_toolbarButtonsValid = 0;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    int v22 = [(PUPhotoEditViewController *)self _allTools];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v68 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v67 + 1) + 8 * i) setLayoutOrientation:self->_layoutOrientation withTransitionCoordinator:v6];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v67 objects:v71 count:16];
      }
      while (v24);
    }

    [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
    if (self->_progressEventBlockingViewConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = 0;

      char v28 = [(PUPhotoEditViewController *)self view];
      [v28 setNeedsUpdateConstraints];
    }
    [(PUPhotoEditToolPickerController *)self->_toolPickerController setLayoutDirection:[(PUPhotoEditViewController *)self currentToolPickerLayoutDirection]];
    [(PUPhotoEditViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
    BOOL v29 = v51;
    if (!v6)
    {
      [(PUPhotoEditToolbar *)v51 removeFromSuperview];
      uint64_t v30 = v49;
      [(PUPhotoEditShadowView *)v49 removeFromSuperview];
      uint64_t v31 = v52;
      [(PUPhotoEditButtonCenteredToolbar *)v52 removeFromSuperview];
      char v32 = v50;
      [(PUPhotoEditShadowView *)v50 removeFromSuperview];
      if (self->_currentToolViewConstraints)
      {
        objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
        currentToolViewConstraints = self->_currentToolViewConstraints;
        self->_currentToolViewConstraints = 0;

        uint64_t v34 = [(PUPhotoEditViewController *)self view];
        [v34 setNeedsUpdateConstraints];
      }
      [(PUPhotoEditViewController *)self _clearBadgeConstraints];
      goto LABEL_31;
    }
    if (v51)
    {
      double v48 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:v51 layoutOrientation:layoutOrientation];
      if (v52)
      {
LABEL_14:
        uint64_t v45 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingSecondaryView:v52 layoutOrientation:layoutOrientation];
        goto LABEL_20;
      }
    }
    else
    {
      double v48 = 0;
      if (v52) {
        goto LABEL_14;
      }
    }
    uint64_t v45 = 0;
LABEL_20:
    mainToolbar = self->_mainToolbar;
    if (mainToolbar)
    {
      double v36 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingView:mainToolbar layoutOrientation:self->_layoutOrientation];
    }
    else
    {
      double v36 = 0;
    }
    secondaryToolbar = self->_secondaryToolbar;
    if (secondaryToolbar)
    {
      id v38 = +[PUPhotoEditLayoutSupport layoutConstraintsForHidingSecondaryView:secondaryToolbar layoutOrientation:self->_layoutOrientation];
      if (!v36)
      {
LABEL_26:
        if (v38)
        {
          [v38 setActive:1];
          [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar setAlpha:0.0];
          [(PUPhotoEditShadowView *)self->_secondaryToolbarShadow setAlpha:0.0];
        }
        double v47 = v38;
        if (self->_currentToolViewConstraints)
        {
          objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
          id v39 = self->_currentToolViewConstraints;
          self->_currentToolViewConstraints = 0;

          double v40 = [(PUPhotoEditViewController *)self view];
          [v40 setNeedsUpdateConstraints];
        }
        -[PUPhotoEditViewController _updateVideoScrubberDisplayAnimate:](self, "_updateVideoScrubberDisplayAnimate:", 0, v45);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
        v58[3] = &unk_1E5F28D20;
        void v58[4] = self;
        id v59 = v48;
        double v60 = v51;
        uint64_t v30 = v49;
        id v61 = v49;
        id v62 = v46;
        id v63 = v52;
        id v64 = v50;
        id v65 = v36;
        id v66 = v47;
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
        v53[3] = &unk_1E5F28D48;
        v53[4] = self;
        double v54 = v60;
        BOOL v29 = v51;
        double v55 = v61;
        long long v56 = v63;
        long long v57 = v64;
        id v41 = v47;
        id v42 = v36;
        id v43 = v46;
        id v44 = v48;
        [v6 animateAlongsideTransition:v58 completion:v53];

        char v32 = v50;
        uint64_t v31 = v52;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      id v38 = 0;
      if (!v36) {
        goto LABEL_26;
      }
    }
    objc_msgSend(v36, "setActive:", 1, v45);
    [(PUPhotoEditToolbar *)self->_mainToolbar setAlpha:0.0];
    [(PUPhotoEditShadowView *)self->_mainToolbarShadow setAlpha:0.0];
    goto LABEL_26;
  }
LABEL_32:
}

void __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  *(unsigned char *)(*(void *)(a1 + 32) + 1048) = 1;
  unint64_t v3 = *(void **)(a1 + 40);
  if (v3)
  {
    [v3 setActive:1];
    [*(id *)(a1 + 48) setAlpha:0.0];
    [*(id *)(a1 + 56) setAlpha:0.0];
  }
  id v4 = *(void **)(a1 + 64);
  if (v4)
  {
    [v4 setActive:1];
    [*(id *)(a1 + 72) setAlpha:0.0];
    [*(id *)(a1 + 80) setAlpha:0.0];
  }
  BOOL v5 = *(void **)(a1 + 88);
  if (v5)
  {
    [v5 setActive:0];
    [*(id *)(*(void *)(a1 + 32) + 1152) setAlpha:1.0];
    [*(id *)(a1 + 32) _updateToolbarShadowAlpha];
  }
  id v6 = *(void **)(a1 + 96);
  if (v6)
  {
    [v6 setActive:0];
    [*(id *)(*(void *)(a1 + 32) + 1160) setAlpha:1.0];
    [*(id *)(a1 + 32) _updateToolbarShadowAlpha];
  }
  double v7 = *(void **)(a1 + 32);
  if (v7[135])
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 1080);
    *(void *)(v8 + 1080) = 0;

    unint64_t v10 = [*(id *)(a1 + 32) view];
    [v10 setNeedsUpdateConstraints];

    double v7 = *(void **)(a1 + 32);
  }
  unsigned int v11 = [v7 view];
  [v11 layoutIfNeeded];

  [*(id *)(a1 + 32) _clearBadgeConstraints];
  uint64_t v12 = [*(id *)(a1 + 32) mediaView];
  uint64_t v13 = [*(id *)(a1 + 32) mediaView];
  [v13 minimumZoomScale];
  objc_msgSend(v12, "setZoomScale:animated:", 1);
}

uint64_t __76__PUPhotoEditViewController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1048) = 0;
  [*(id *)(a1 + 40) removeFromSuperview];
  [*(id *)(a1 + 48) removeFromSuperview];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  BOOL v2 = *(void **)(a1 + 32);
  return [v2 _updateVideoScrubberDisplayAnimate:1];
}

- (void)setLayoutOrientation:(int64_t)a3
{
}

- (void)_clearToolbars
{
  [(PUPhotoEditToolbar *)self->_mainToolbar setToolButtons:0 buttonSpacing:1 mainActionButton:0 secondaryActionButton:0];
  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar setCenterView:0 leadingViews:0 trailingViews:0];
  mainToolbar = self->_mainToolbar;
  self->_mainToolbar = 0;

  mainToolbarShadow = self->_mainToolbarShadow;
  self->_mainToolbarShadow = 0;

  secondaryToolbar = self->_secondaryToolbar;
  self->_secondaryToolbar = 0;

  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  self->_secondaryToolbarShadow = 0;

  mainToolbarConstraints = self->_mainToolbarConstraints;
  self->_mainToolbarConstraints = 0;

  secondaryToolbarConstraints = self->_secondaryToolbarConstraints;
  self->_secondaryToolbarConstraints = 0;

  actionButtonConstraints = self->_actionButtonConstraints;
  self->_actionButtonConstraints = 0;
}

- (void)setPlaceholderImage:(id)a3
{
  id v7 = a3;
  id v5 = [(PUPhotoEditViewController *)self placeholderImage];

  id v6 = v7;
  if (v5 != v7)
  {
    objc_storeStrong((id *)&self->_placeholderImage, a3);
    if (v7)
    {
      [v7 size];
      -[PUPhotoEditViewController setLastKnownPreviewImageSize:](self, "setLastKnownPreviewImageSize:");
    }
    [(PUPhotoEditViewController *)self _updatePlaceholderImage];
    id v6 = v7;
  }
}

- (id)_currentViewContentsForDismissTransition
{
  unint64_t v3 = [(NUMediaView *)self->_mediaView _imageLayer];
  id v4 = [v3 contents];

  if (!v4)
  {
    placeholderImageView = self->_placeholderImageView;
    if (placeholderImageView && ([(UIImageView *)placeholderImageView isHidden] & 1) == 0)
    {
      uint64_t v12 = [(UIImageView *)self->_placeholderImageView layer];
      id v7 = [v12 contents];
    }
    else
    {
      id v7 = 0;
    }
    goto LABEL_10;
  }
  id v5 = [(PUPhotoEditViewController *)self editSource];
  if (v5)
  {

LABEL_8:
    mediaView = self->_mediaView;
    unint64_t v10 = [(PUPhotoEditViewController *)self _composition];
    [(NUMediaView *)mediaView setComposition:v10];

    goto LABEL_9;
  }
  uint64_t v8 = [(PUPhotoEditViewController *)self originalImageEditSource];

  if (v8) {
    goto LABEL_8;
  }
LABEL_9:
  [(NUMediaView *)self->_mediaView setPipelineFilters:MEMORY[0x1E4F1CBF0]];
  [(NUMediaView *)self->_mediaView waitForRender];
  id v7 = [v3 contents];
LABEL_10:

  return v7;
}

- (BOOL)_isReadyToRender
{
  unint64_t v3 = [(PUPhotoEditViewController *)self mainRenderer];
  id v4 = [(PUPhotoEditViewController *)self compositionController];
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = !v5;

  return v6;
}

- (void)setLastKnownPreviewImageSize:(CGSize)a3
{
  self->_lastKnownPreviewImageSize = a3;
  [(PUPhotoEditViewController *)self _clearBadgeConstraints];
}

- (void)_clearBadgeConstraints
{
  if (self->_transientStatusBadgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
    self->_transientStatusBadgeConstraints = 0;

    id v4 = [(PUPhotoEditViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
  if (self->_assetTypeBadgeConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    assetTypeBadgeConstraints = self->_assetTypeBadgeConstraints;
    self->_assetTypeBadgeConstraints = 0;

    id v6 = [(PUPhotoEditViewController *)self view];
    [v6 setNeedsUpdateConstraints];
  }
}

- (CGRect)_oneUpTransitionPlaceholderViewFrame
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoEditViewController *)self _isReadyToRender])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F7A498]);
    id v4 = [(PUPhotoEditViewController *)self _composition];
    BOOL v5 = (void *)[v3 initWithComposition:v4];

    id v26 = 0;
    id v6 = [v5 submitSynchronous:&v26];
    id v7 = v26;
    uint64_t v8 = [v6 geometry];

    if (v8)
    {
      [v8 size];
      NUPixelSizeToCGSize();
      -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:");
    }
    else
    {
      if (*MEMORY[0x1E4F7A750] != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_2588);
      }
      double v21 = *MEMORY[0x1E4F7A758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138412290;
        id v28 = v7;
        _os_log_error_impl(&dword_1AE9F8000, v21, OS_LOG_TYPE_ERROR, "Could not load geometry for composition: %@", buf, 0xCu);
      }
      [(PUPhotoEditViewController *)self previewViewFrame];
    }
    double v14 = v9;
    double v16 = v10;
    double v18 = v11;
    double v20 = v12;
  }
  else
  {
    [(PUPhotoEditViewController *)self previewViewFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  double v22 = v14;
  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  result.size.CGFloat height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)_cropPlaceholderViewFrameForImageSize:(CGSize)a3
{
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    double v23 = *MEMORY[0x1E4F1DB28];
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    id v4 = objc_alloc_init(PUCropToolControllerSpec);
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __67__PUPhotoEditViewController__cropPlaceholderViewFrameForImageSize___block_invoke;
    v63[3] = &unk_1E5F2ECC8;
    BOOL v5 = v4;
    id v64 = v5;
    id v65 = self;
    [(PUViewControllerSpec *)v5 performChanges:v63];
    [(PUCropToolControllerSpec *)v5 minimumCropInset];
    double v7 = v6;
    uint64_t v8 = [(PUPhotoEditViewController *)self view];
    [v8 safeAreaInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar frame];
    double Height = CGRectGetHeight(v66);
    double v16 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v17 = [v16 currentLayoutStyle];

    if (v17 == 4)
    {
      [(PUCropToolControllerSpec *)v5 standardSideBarWidth];
      double v19 = v18;
      [(PUCropToolControllerSpec *)v5 cropAspectRatioScrollHeight];
      double v61 = v12 + v20;
      [(PUCropToolControllerSpec *)v5 standardSideBarWidth];
      double v22 = v21;
    }
    else if ([(PUPhotoEditViewController *)self layoutOrientation] == 1)
    {
      double v19 = v7 + v10;
      [(PUPhotoEditToolbar *)self->_mainToolbar frame];
      double v27 = CGRectGetHeight(v67);
      [(PUCropToolControllerSpec *)v5 standardBottomBarHeight];
      double v61 = v27 + v28;
      double v22 = v7 + v14;
    }
    else
    {
      [(PUCropToolControllerSpec *)v5 cropAspectFlipperWidth];
      double v19 = v10 + v29;
      [(PUCropToolControllerSpec *)v5 cropAspectRatioScrollHeight];
      double v61 = v12 + v30;
      [(PUPhotoEditToolbar *)self->_mainToolbar frame];
      double Width = CGRectGetWidth(v68);
      [(PUCropToolControllerSpec *)v5 standardSideBarWidth];
      double v22 = Width + v32;
    }
    double v33 = v7 + Height;
    uint64_t v34 = [(PUPhotoEditViewController *)self view];
    [v34 frame];
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;

    v69.origin.CGFloat x = v36;
    v69.origin.CGFloat y = v38;
    v69.size.double width = v40;
    v69.size.CGFloat height = v42;
    double v43 = CGRectGetWidth(v69) - v19 - v22;
    v70.origin.CGFloat x = v36;
    v70.origin.CGFloat y = v38;
    v70.size.double width = v40;
    v70.size.CGFloat height = v42;
    double v44 = CGRectGetHeight(v70) - v33 - v61;
    v71.origin.CGFloat x = v19;
    v71.origin.CGFloat y = v33;
    v71.size.double width = v43;
    v71.size.CGFloat height = v44;
    double v45 = CGRectGetWidth(v71);
    v72.origin.CGFloat x = v19;
    v72.origin.CGFloat y = v33;
    v72.size.double width = v43;
    v72.size.CGFloat height = v44;
    double v46 = v45 / CGRectGetHeight(v72);
    double v47 = a3.width / a3.height;
    if (v46 <= a3.width / a3.height)
    {
      v78.origin.CGFloat x = v19;
      v78.origin.CGFloat y = v33;
      v78.size.double width = v43;
      v78.size.CGFloat height = v44;
      double v52 = CGRectGetWidth(v78) / v47;
      v79.origin.CGFloat x = v19;
      v79.origin.CGFloat y = v33;
      v79.size.double width = v43;
      v79.size.CGFloat height = v44;
      double MinX = CGRectGetMinX(v79);
      v80.origin.CGFloat x = v19;
      v80.origin.CGFloat y = v33;
      v80.size.double width = v43;
      v80.size.CGFloat height = v44;
      double MinY = CGRectGetMinY(v80);
      v81.origin.CGFloat x = v19;
      v81.origin.CGFloat y = v33;
      v81.size.double width = v43;
      v81.size.CGFloat height = v44;
      double v51 = MinY + (CGRectGetHeight(v81) - v52) * 0.5;
      v82.origin.CGFloat x = v19;
      v82.origin.CGFloat y = v33;
      v82.size.double width = v43;
      v82.size.CGFloat height = v44;
      double v48 = CGRectGetWidth(v82);
    }
    else
    {
      v73.origin.CGFloat x = v19;
      v73.origin.CGFloat y = v33;
      v73.size.double width = v43;
      v73.size.CGFloat height = v44;
      double v48 = v47 * CGRectGetHeight(v73);
      v74.origin.CGFloat x = v19;
      v74.origin.CGFloat y = v33;
      v74.size.double width = v43;
      v74.size.CGFloat height = v44;
      double v49 = CGRectGetMinX(v74);
      v75.origin.CGFloat x = v19;
      v75.origin.CGFloat y = v33;
      v75.size.double width = v43;
      v75.size.CGFloat height = v44;
      double MinX = v49 + (CGRectGetWidth(v75) - v48) * 0.5;
      v76.origin.CGFloat x = v19;
      v76.origin.CGFloat y = v33;
      v76.size.double width = v43;
      v76.size.CGFloat height = v44;
      double v51 = CGRectGetMinY(v76);
      v77.origin.CGFloat x = v19;
      v77.origin.CGFloat y = v33;
      v77.size.double width = v43;
      v77.size.CGFloat height = v44;
      double v52 = CGRectGetHeight(v77);
    }
    double v23 = PURoundRectToPixel(MinX, v51, v48, v52);
    double v24 = v54;
    double v25 = v55;
    double v26 = v56;
  }
  double v57 = v23;
  double v58 = v24;
  double v59 = v25;
  double v60 = v26;
  result.size.CGFloat height = v60;
  result.size.double width = v59;
  result.origin.CGFloat y = v58;
  result.origin.CGFloat x = v57;
  return result;
}

void __67__PUPhotoEditViewController__cropPlaceholderViewFrameForImageSize___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) traitCollection];
  [*(id *)(a1 + 32) setTraitCollection:v2];
}

- (BOOL)_shouldUseCropPlaceholderViewFrame
{
  id v3 = [(PUPhotoEditViewController *)self initialPendingEditsRequest];

  if (v3)
  {
    id v3 = [(PUPhotoEditViewController *)self initialPendingEditsRequest];
    id v4 = [v3 adjustments];
    BOOL v5 = [v4 lastObject];
    uint64_t v6 = [v5 category];

    double v7 = [(PUPhotoEditViewController *)self _toolControllerForAdjustmentCategory:v6];
    LODWORD(v3) = v7 == self->_cropController;
  }
  if ([(PUPhotoEditViewController *)self initialToolType] == 6
    || (([(PUPhotoEditViewController *)self _isQuickCrop] | v3) & 1) != 0)
  {
    currentTool = (PUCropToolController *)self->_currentTool;
    if (!currentTool) {
      return 1;
    }
  }
  else
  {
    currentTool = (PUCropToolController *)self->_currentTool;
  }
  return currentTool == self->_cropController;
}

- (CGRect)_placeholderViewFrameForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(PUViewControllerSpec *)self->_photoEditSpec layoutReferenceSize];
  double v7 = v6;
  [(PUViewControllerSpec *)self->_photoEditSpec layoutReferenceSize];
  if (width == 0.0 || height == 0.0)
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v9 = v8;
    [(PUPhotoEditViewController *)self _mediaViewEdgeInsets];
    NUEdgeInsetsInsetRect();
    double v12 = v11 / width;
    if (v11 / width >= v10 / height) {
      double v12 = v10 / height;
    }
    CGAffineTransformMakeScale(&v24, v12, v12);
    -[NUMediaView _edgeInsetsForContentSize:inFrame:alwaysCenterContent:](self->_mediaView, "_edgeInsetsForContentSize:inFrame:alwaysCenterContent:", 1, height * v24.c + v24.a * width, height * v24.d + v24.b * width, 0.0, 0.0, v7, v9);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = v15 + 0.0;
    double v20 = v14 + 0.0;
    double v22 = v7 - (v16 + v21);
    double v23 = v9 - (v14 + v18);
  }
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGRect)previewViewFrame
{
  [(NUMediaView *)self->_mediaView imageFrame];
  if (self->_isAnimatingLayoutOrientation || (v7 = v3, double v8 = v4, v9 = v5, v10 = v6, CGRectIsEmpty(*(CGRect *)&v3)))
  {
    [(PUPhotoEditViewController *)self lastKnownPreviewImageSize];
    double v12 = v11;
    double v14 = v13;
    if ([(PUPhotoEditViewController *)self _shouldUseCropPlaceholderViewFrame]) {
      -[PUPhotoEditViewController _cropPlaceholderViewFrameForImageSize:](self, "_cropPlaceholderViewFrameForImageSize:", v12, v14);
    }
    else {
      -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:", v12, v14);
    }
    double v7 = v15;
    double v8 = v16;
    double v9 = v17;
    double v10 = v18;
  }
  double v19 = v7;
  double v20 = v8;
  double v21 = v9;
  double v22 = v10;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (void)_didModifyAdjustmentWithLocalizedName:(id)a3
{
  id v3 = [(PUPhotoEditToolController *)self->_currentEditingTool didModifyAdjustmentWithLocalizedName:a3];
}

- (void)_willModifyAdjustment
{
}

- (void)_handleShowOriginalButton:(id)a3
{
  if (![(PUPhotoEditViewController *)self _isPreviewingOriginal]) {
    self->_showOriginalButtonTapped = 1;
  }
  [(PUPhotoEditViewController *)self _toggleShowOriginal];
}

- (void)_handleRedoButton:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        double v10 = [(PUPhotoEditViewController *)self undoManager];
        [v9 redoInitiated:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v11 = [(PUPhotoEditViewController *)self undoManager];
  [v11 redo];
}

- (void)_handleUndoButton:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [(PUPhotoEditViewController *)self _allTools];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        double v10 = [(PUPhotoEditViewController *)self undoManager];
        [v9 undoInitiated:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v11 = [(PUPhotoEditViewController *)self undoManager];
  [v11 undo];
}

- (void)_undoManagerDidRedo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self undoManager];
  uint64_t v6 = [v4 object];

  if (v5 == v6)
  {
    if ([(PUPhotoEditToolbarButton *)self->_moreButton isHeld]) {
      [(PUPhotoEditViewController *)self _reloadMoreButtonMenu];
    }
    [(PUPhotoEditViewController *)self _updateUndoRedoButtonsAnimated:0];
  }
}

- (void)_undoManagerDidUndo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPhotoEditViewController *)self undoManager];
  uint64_t v6 = [v4 object];

  if (v5 == v6)
  {
    if ([(PUPhotoEditToolbarButton *)self->_moreButton isHeld]) {
      [(PUPhotoEditViewController *)self _reloadMoreButtonMenu];
    }
    [(PUPhotoEditViewController *)self _updateUndoRedoButtonsAnimated:0];
  }
}

- (void)_undoManagerWillRedo:(id)a3
{
  id v4 = a3;
  id v8 = [(PUPhotoEditViewController *)self undoManager];
  id v5 = [v4 object];

  if (v8 == v5)
  {
    char v6 = [(PUPhotoEditToolbarButton *)self->_moreButton isHeld];

    if (v6) {
      goto LABEL_5;
    }
    id v5 = [v8 redoMenuItemTitle];
    uint64_t v7 = [v5 uppercaseStringWithLocale:0];
    [(PUPhotoEditViewController *)self flashTransientBadgeWithText:v7];
  }
LABEL_5:
}

- (void)_undoManagerWillUndo:(id)a3
{
  id v4 = a3;
  id v8 = [(PUPhotoEditViewController *)self undoManager];
  id v5 = [v4 object];

  if (v8 == v5)
  {
    char v6 = [(PUPhotoEditToolbarButton *)self->_moreButton isHeld];

    if (v6) {
      goto LABEL_5;
    }
    id v5 = [v8 undoMenuItemTitle];
    uint64_t v7 = [v5 uppercaseStringWithLocale:0];
    [(PUPhotoEditViewController *)self flashTransientBadgeWithText:v7];
  }
LABEL_5:
}

- (void)_undoManagerDidCloseUndoGroupNotification:(id)a3
{
  [(PUPhotoEditViewController *)self _updateUndoRedoButtonsAnimated:0];
  [(PUPhotoEditViewController *)self _updateShowOriginalButtonAnimated:0];
}

- (id)undoManager
{
  undoManager = self->_undoManager;
  if (!undoManager)
  {
    id v4 = (NSUndoManager *)objc_opt_new();
    id v5 = self->_undoManager;
    self->_undoManager = v4;

    undoManager = self->_undoManager;
  }
  return undoManager;
}

- (id)childViewControllerForScreenEdgesDeferringSystemGestures
{
  return self->_currentTool;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_msgSend(v9, "setOverrideUserInterfaceStyle:", -[PUPhotoEditViewController preferredUserInterfaceStyle](self, "preferredUserInterfaceStyle"));
  v10.receiver = self;
  v10.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v10 presentViewController:v9 animated:v5 completion:v8];
}

- (BOOL)_mediaViewFillsView
{
  id v3 = [(PUPhotoEditViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  long long v12 = [(PUPhotoEditViewController *)self mediaView];
  [v12 imageFrame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  v27.origin.CGFloat x = v14;
  v27.origin.CGFloat y = v16;
  v27.size.double width = v18;
  v27.size.double height = v20;
  v29.origin.CGFloat x = v5;
  v29.origin.CGFloat y = v7;
  v29.size.double width = v9;
  v29.size.double height = v11;
  CGRect v28 = CGRectIntersection(v27, v29);
  CGFloat v21 = v5;
  CGFloat v22 = v7;
  CGFloat v23 = v9;
  CGFloat v24 = v11;
  return CGRectEqualToRect(v28, *(CGRect *)&v21);
}

- (void)_updateForcingDarkUserInterfaceStyleForZoomIfNeeded
{
  BOOL v3 = [(PUPhotoEditViewController *)self _mediaViewFillsView];
  if (v3 != [(PUPhotoEditViewController *)self forceDarkUserInterfaceStyleForZoom])
  {
    [(PUPhotoEditViewController *)self setForceDarkUserInterfaceStyleForZoom:v3];
    [(PUPhotoEditViewController *)self setNeedsUserInterfaceAppearanceUpdate];
  }
}

- (int64_t)preferredUserInterfaceStyle
{
  BOOL v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 lightModeEditor];

  if (!v4
    || [(PUPhotoEditViewController *)self forceDarkUserInterfaceStyleForZoom])
  {
    return 2;
  }
  int64_t v6 = +[PUPhotoEditAppearancePreference preferredAppearance];
  if (v6 == 2) {
    return 1;
  }
  else {
    return 2 * (v6 == 1);
  }
}

- (void)_setNeedsUserInterfaceAppearanceUpdateAnimated
{
  BOOL v3 = (void *)MEMORY[0x1E4FB1EB0];
  int v4 = [(PUPhotoEditViewController *)self view];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  _DWORD v5[2] = __75__PUPhotoEditViewController__setNeedsUserInterfaceAppearanceUpdateAnimated__block_invoke;
  v5[3] = &unk_1E5F2ED10;
  void v5[4] = self;
  [v3 transitionWithView:v4 duration:5242880 options:v5 animations:0 completion:0.2];
}

uint64_t __75__PUPhotoEditViewController__setNeedsUserInterfaceAppearanceUpdateAnimated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsUserInterfaceAppearanceUpdate];
}

- (void)setPreferredAppearance:(int64_t)a3
{
  +[PUPhotoEditAppearancePreference setPreferredAppearance:a3];
  [(PUPhotoEditViewController *)self _setNeedsUserInterfaceAppearanceUpdateAnimated];
}

- (double)px_imageModulationIntensity
{
  return 1.0;
}

- (double)px_HDRFocus
{
  id v2 = (void *)MEMORY[0x1E4F902A0];
  BOOL v3 = [(PUPhotoEditViewController *)self photo];
  [v2 HDRValueForAsset:v3];
  double v5 = v4;

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_isAnimatingMediaViewInsets = 1;
  [(PUPhotoEditViewController *)self _updateVideoScrubberDisplayAnimate:1];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E5F2B9D0;
  void aBlock[4] = self;
  double v8 = (void (**)(void *, void))_Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &unk_1E5F2B9D0;
  void v12[4] = self;
  CGFloat v9 = (void (**)(void *, void))_Block_copy(v12);
  if (([v7 animateAlongsideTransition:v8 completion:v9] & 1) == 0)
  {
    double v10 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v11 = 0;
      _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "viewWillTransitionToSize animations were not queued by the transition coordinator, running animations manually. Layout issues may occur.", v11, 2u);
    }

    v8[2](v8, 0);
    v9[2](v9, 0);
  }
  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", width, height);
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", v7, width, height);
}

void __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  objc_msgSend(*(id *)(a1 + 32), "pu_performBarsVisibilityUpdatesWithAnimationSettings:", 0, 0);
  [*(id *)(a1 + 32) _mediaViewEdgeInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (v24)
  {
    CGFloat v11 = *(void **)(*(void *)(a1 + 32) + 1016);
    [v24 transitionDuration];
    double v13 = v12;
    uint64_t v14 = [v24 completionCurve];
    double v15 = v11;
    double v16 = v4;
    double v17 = v6;
    double v18 = v8;
    double v19 = v10;
    double v20 = v13;
  }
  else
  {
    [MEMORY[0x1E4F39CF8] animationDuration];
    double v22 = v21;
    UIAnimationDragCoefficient();
    double v20 = v22 * v23;
    double v15 = *(void **)(*(void *)(a1 + 32) + 1016);
    double v16 = v4;
    double v17 = v6;
    double v18 = v8;
    double v19 = v10;
    uint64_t v14 = 0;
  }
  objc_msgSend(v15, "_transitionToInsets:duration:animationCurve:updateRenderContent:", v14, 1, v16, v17, v18, v19, v20);
}

uint64_t __80__PUPhotoEditViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSpecDependentUIPieces];
  *(unsigned char *)(*(void *)(a1 + 32) + 1049) = 0;
  id v2 = *(void **)(a1 + 32);
  return [v2 _updateVideoScrubberDisplayAnimate:1];
}

- (void)_layoutShadowView:(id)a3 forToolbar:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  double v7 = [(PUPhotoEditViewController *)self view];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  double v12 = [(PUPhotoEditViewController *)self view];
  [v12 safeAreaInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = +[PUPhotoEditProtoSettings sharedInstance];
  [v21 mainToolbarShadowLength];
  double v23 = v22;

  id v24 = +[PUPhotoEditProtoSettings sharedInstance];
  [v24 secondaryToolbarShadowLength];
  double v26 = v25;

  uint64_t v27 = [v6 backgroundStyle];
  switch(v27)
  {
    case 1:
      double v28 = v11 - (v18 + v26);
      double v29 = 0.0;
      double v11 = v18 + v26;
      goto LABEL_7;
    case 2:
      double v11 = v14 + v23;
      goto LABEL_6;
    case 3:
      double v29 = v9 - (v20 + v26);
      double v28 = 0.0;
      double v9 = v20 + v26;
      goto LABEL_7;
    case 4:
      double v9 = v16 + v26;
LABEL_6:
      double v29 = 0.0;
      double v28 = 0.0;
LABEL_7:
      objc_msgSend(v30, "setFrame:", v29, v28, v9, v11);
      break;
    default:
      break;
  }
}

- (void)viewDidLayoutSubviews
{
  v148[4] = *MEMORY[0x1E4F143B8];
  v147.receiver = self;
  v147.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v147 viewDidLayoutSubviews];
  double v3 = [(PUPhotoEditViewController *)self view];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(PUPhotoEditViewController *)self photoEditSpec];
  [v8 layoutReferenceSize];
  double v10 = v9;
  double v12 = v11;

  if (v5 != v10 || v7 != v12)
  {
    -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
    -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0, v5, v7);
  }
  [(PUPhotoEditViewController *)self _updateMediaViewEdgeInsets];
  [(PUPhotoEditViewController *)self previewViewFrame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[UIImageView setFrame:](self->_placeholderImageView, "setFrame:");
  [(PUPhotoEditViewController *)self _updateToolbarBackgroundAnimated:0];
  double v22 = [(PUPhotoEditViewController *)self irisRevertConfirmationAlert];

  if (v22)
  {
    double v23 = [(PUPhotoEditMediaToolController *)self->_mediaToolController livePhotoButton];
    id v24 = [(PUPhotoEditViewController *)self irisRevertConfirmationAlert];
    double v25 = [v24 popoverPresentationController];
    [v25 setSourceView:v23];

    double v26 = [(PUPhotoEditViewController *)self irisRevertConfirmationAlert];
    uint64_t v27 = [v26 popoverPresentationController];
    [v23 bounds];
    objc_msgSend(v27, "setSourceRect:");
  }
  [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar frame];
  double MaxY = CGRectGetMaxY(v149);
  double v29 = [(UIViewController *)self->_currentTool view];
  [v29 frame];
  double v30 = MaxY - CGRectGetMinY(v150);
  uint64_t v31 = [(PUPhotoEditViewController *)self view];
  [v31 safeAreaInsets];
  double v33 = v30 - v32;

  uint64_t v34 = [(PUPhotoEditViewController *)self photoEditSpec];
  uint64_t v35 = [v34 currentLayoutStyle];

  double v36 = 0.0;
  double v144 = v21;
  double v142 = v19;
  if (v35 == 4) {
    goto LABEL_13;
  }
  int64_t v37 = [(PUPhotoEditViewController *)self layoutOrientation];
  if (v37 != 2)
  {
    if (v37 == 1)
    {
      double v38 = v17;
      double v39 = 0.0;
      if (![(PUPhotoEditToolController *)self->_currentEditingTool wantsFullscreen]) {
        goto LABEL_14;
      }
      [(PUPhotoEditToolbar *)self->_mainToolbar frame];
      double v40 = v7 - CGRectGetMinY(v151);
      double v41 = [(PUPhotoEditViewController *)self view];
      [v41 safeAreaInsets];
      double v39 = v40 - v42;
      goto LABEL_37;
    }
LABEL_13:
    double v38 = v17;
    double v39 = 0.0;
    goto LABEL_14;
  }
  double v38 = v17;
  double v39 = 0.0;
  if (![(PUPhotoEditToolController *)self->_currentEditingTool wantsFullscreen]) {
    goto LABEL_14;
  }
  [(PUPhotoEditToolbar *)self->_mainToolbar frame];
  double v123 = v5 - CGRectGetMinX(v156);
  double v41 = [(PUPhotoEditViewController *)self view];
  [v41 safeAreaInsets];
  double v36 = v123 - v124;
LABEL_37:

LABEL_14:
  double v125 = v7;
  -[UIViewController setAdditionalSafeAreaInsets:](self->_currentTool, "setAdditionalSafeAreaInsets:", v33, 0.0, v39, v36);
  v145 = [(PUPhotoEditViewController *)self videoScrubberView];
  int64_t v140 = [(PUPhotoEditViewController *)self layoutOrientation];
  [(PUPhotoEditViewController *)self previewViewFrame];
  v141.origin.CGFloat x = v43;
  v141.origin.CGFloat y = v44;
  v141.size.double width = v45;
  v141.size.double height = v46;
  double v47 = [(PUPhotoEditToolController *)self->_currentEditingTool view];
  [v47 frame];
  CGFloat v138 = v49;
  CGFloat v139 = v48;
  CGFloat v136 = v51;
  CGFloat v137 = v50;

  [(PUPhotoEditViewControllerSpec *)self->_photoEditSpec scrubberViewMargin];
  double v146 = v52;
  double v135 = v53;
  double v55 = v54;
  double v56 = [(PUPhotoEditViewController *)self mediaView];
  [v56 bounds];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  [v56 edgeInsets];
  double v66 = v58 + v65;
  double v68 = v60 + v67;
  double v70 = v62 - (v65 + v69);
  double v72 = v64 - (v67 + v71);
  CGRect v73 = [(PUPhotoEditViewController *)self view];
  objc_msgSend(v73, "convertRect:fromView:", v56, v66, v68, v70, v72);
  double v133 = v75;
  double v134 = v74;

  if (!self->_imageFrameLayoutGuide)
  {
    CGRect v76 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4FB1940]);
    imageFrameLayoutGuide = self->_imageFrameLayoutGuide;
    self->_imageFrameLayoutGuide = v76;

    CGRect v78 = [(PUPhotoEditViewController *)self view];
    [v78 addLayoutGuide:self->_imageFrameLayoutGuide];
  }
  if (self->_imageFrameLayoutGuideConstraints)
  {
    CGRect v79 = [(PUPhotoEditViewController *)self view];
    [v79 removeConstraints:self->_imageFrameLayoutGuideConstraints];

    imageFrameLayoutGuideConstraints = self->_imageFrameLayoutGuideConstraints;
    self->_imageFrameLayoutGuideConstraints = 0;
  }
  v131 = [(UILayoutGuide *)self->_imageFrameLayoutGuide leadingAnchor];
  id v132 = [(PUPhotoEditViewController *)self view];
  id v130 = [v132 leadingAnchor];
  int64_t v129 = [v131 constraintEqualToAnchor:v130 constant:v15];
  v148[0] = v129;
  v127 = [(UILayoutGuide *)self->_imageFrameLayoutGuide trailingAnchor];
  id v128 = [(PUPhotoEditViewController *)self view];
  double v126 = [v128 leadingAnchor];
  uint64_t v143 = [v127 constraintEqualToAnchor:v126 constant:v15 + v142];
  v148[1] = v143;
  CGRect v81 = [(UILayoutGuide *)self->_imageFrameLayoutGuide topAnchor];
  CGRect v82 = [(PUPhotoEditViewController *)self view];
  double v83 = [v82 topAnchor];
  v84 = [v81 constraintEqualToAnchor:v83 constant:v38];
  v148[2] = v84;
  double v85 = [(UILayoutGuide *)self->_imageFrameLayoutGuide bottomAnchor];
  id v86 = [(PUPhotoEditViewController *)self view];
  BOOL v87 = [v86 topAnchor];
  double v88 = [v85 constraintEqualToAnchor:v87 constant:v38 + v144];
  v148[3] = v88;
  CGRect v89 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:4];
  int v90 = self->_imageFrameLayoutGuideConstraints;
  self->_imageFrameLayoutGuideConstraints = v89;

  uint64_t v91 = [(PUPhotoEditViewController *)self view];
  [v91 addConstraints:self->_imageFrameLayoutGuideConstraints];

  if (v140 != 1)
  {
    v152.origin.CGFloat y = v138;
    v152.origin.CGFloat x = v139;
    v152.size.double height = v136;
    v152.size.double width = v137;
    double MaxX = CGRectGetMaxX(v152);
    [(PUPhotoEditToolController *)self->_currentEditingTool toolGradientDistance];
    double v5 = v5 - (v5 - (MaxX - v93) + v5 - (MaxX - v93));
  }
  double v94 = fmin(v5 - (v146 + v55), 477.0);
  CGFloat Width = CGRectGetWidth(v141);
  BOOL v96 = Width > 210.0;
  double v97 = Width - v146 - v55;
  if (v96 && v97 < v94) {
    double v98 = v97;
  }
  else {
    double v98 = v94;
  }
  uint64_t v99 = 2 * v96;
  [v145 intrinsicContentSize];
  double v101 = v100;
  double v102 = v135 + v100;
  if (v140 == 1)
  {
    v153.origin.CGFloat y = v138;
    v153.origin.CGFloat x = v139;
    v153.size.double height = v136;
    v153.size.double width = v137;
    double v103 = CGRectGetMaxY(v153);
    [(PUPhotoEditToolController *)self->_currentEditingTool toolGradientDistance];
    double v105 = v103 - v104;
    double v106 = CGRectGetMaxY(v141);
    if (v105 < v106) {
      double v106 = v105;
    }
  }
  else
  {
    double v107 = CGRectGetMaxY(v141);
    id v108 = [(PUPhotoEditViewController *)self view];
    [v108 safeAreaInsets];
    double v110 = v125 - v109;

    if (v107 >= v110) {
      double v106 = v110;
    }
    else {
      double v106 = v107;
    }
  }
  CGFloat v111 = v106 - v102;
  v112 = [(PUPhotoEditViewController *)self playPauseButton];
  [v112 sizeToFit];

  double v113 = [(PUPhotoEditViewController *)self playPauseButton];
  [v113 frame];
  double v115 = v114;
  double v117 = v116;

  v154.origin.CGFloat x = v134 + (v133 - v98) * 0.5;
  v154.origin.CGFloat y = v111;
  v154.size.double width = v98;
  v154.size.double height = v101;
  double MinX = CGRectGetMinX(v154);
  v155.origin.CGFloat x = v134 + (v133 - v98) * 0.5;
  v155.origin.CGFloat y = v111;
  v155.size.double width = v98;
  v155.size.double height = v101;
  CGFloat v119 = CGRectGetMinY(v155) + -7.0;
  int v120 = [(PUPhotoEditViewController *)self playPauseButton];
  objc_msgSend(v120, "setFrame:", MinX, v119, v115, v117);

  objc_msgSend(v145, "setFrame:", v134 + (v133 - v98) * 0.5 + v146 + v115, v111, v98 + (v146 + v115) * -2.0, v101);
  [v145 setOverrideUserInterfaceStyle:v99];
  mainToolbarShadow = self->_mainToolbarShadow;
  if (mainToolbarShadow) {
    [(PUPhotoEditViewController *)self _layoutShadowView:mainToolbarShadow forToolbar:self->_mainToolbar];
  }
  secondaryToolbarShadow = self->_secondaryToolbarShadow;
  if (secondaryToolbarShadow) {
    [(PUPhotoEditViewController *)self _layoutShadowView:secondaryToolbarShadow forToolbar:self->_secondaryToolbar];
  }
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v3 viewWillLayoutSubviews];
  [(PUPhotoEditViewController *)self _updateToolbarsContentPadding];
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
}

- (id)_constraintsForToolView:(id)a3 wantsFullscreen:(BOOL)a4
{
  BOOL v4 = a4;
  v50[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = self->_mainToolbar;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  double v9 = (void *)v8;
  CGFloat v46 = v7;
  if (v4)
  {
    double v36 = [v6 leftAnchor];
    double v10 = [(PUPhotoEditViewController *)self view];
    double v11 = [v10 leftAnchor];
    double v12 = [v36 constraintEqualToAnchor:v11];
    v50[0] = v12;
    double v13 = [v6 rightAnchor];
    CGFloat v44 = [(PUPhotoEditViewController *)self view];
    [v44 rightAnchor];
    CGFloat v43 = v45 = v13;
    double v42 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v50[1] = v42;
    double v14 = [v6 topAnchor];
    double v40 = [(PUPhotoEditViewController *)self view];
    [v40 topAnchor];
    v39 = double v41 = v14;
    double v38 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v50[2] = v38;
    double v15 = [v6 bottomAnchor];
    double v16 = [(PUPhotoEditViewController *)self view];
    double v17 = [v16 bottomAnchor];
    double v18 = [v15 constraintEqualToAnchor:v17];
    v50[3] = v18;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [v9 addObjectsFromArray:v19];

    double v20 = v9;
    double v21 = v36;
  }
  else
  {
    int64_t v37 = (void *)v8;
    double v22 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v23 = [v22 currentLayoutStyle];

    if (v23 == 4)
    {
      double v21 = [v6 leftAnchor];
      double v10 = [(PUPhotoEditViewController *)self view];
      double v11 = [v10 leftAnchor];
      double v12 = [v21 constraintEqualToAnchor:v11];
      v49[0] = v12;
      id v24 = [v6 rightAnchor];
      CGFloat v44 = [(PUPhotoEditViewController *)self view];
      [v44 rightAnchor];
      CGFloat v43 = v45 = v24;
      double v42 = objc_msgSend(v24, "constraintEqualToAnchor:");
      v49[1] = v42;
      double v25 = [v6 topAnchor];
      double v40 = [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar bottomAnchor];
      double v41 = v25;
      double v39 = objc_msgSend(v25, "constraintEqualToAnchor:");
      v49[2] = v39;
      double v26 = [v6 bottomAnchor];
      double v15 = [(PUPhotoEditViewController *)self view];
      double v16 = [v15 bottomAnchor];
      double v38 = v26;
      double v17 = [v26 constraintEqualToAnchor:v16];
      v49[3] = v17;
      double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
      double v20 = v37;
    }
    else
    {
      int64_t v27 = [(PUPhotoEditViewController *)self layoutOrientation];
      double v20 = v37;
      if (v27 == 2)
      {
        double v21 = [v6 leftAnchor];
        double v10 = [(PUPhotoEditViewController *)self view];
        double v11 = [v10 leftAnchor];
        double v12 = [v21 constraintEqualToAnchor:v11];
        v47[0] = v12;
        double v32 = [v6 rightAnchor];
        CGFloat v44 = [(PUPhotoEditToolbar *)v7 leftAnchor];
        CGFloat v45 = v32;
        CGFloat v43 = objc_msgSend(v32, "constraintEqualToAnchor:");
        v47[1] = v43;
        double v33 = [v6 topAnchor];
        double v41 = [(PUPhotoEditViewController *)self view];
        [v41 topAnchor];
        double v40 = v42 = v33;
        double v39 = objc_msgSend(v33, "constraintEqualToAnchor:");
        v47[2] = v39;
        uint64_t v34 = [v6 bottomAnchor];
        double v15 = [(PUPhotoEditViewController *)self view];
        double v16 = [v15 bottomAnchor];
        double v38 = v34;
        double v17 = [v34 constraintEqualToAnchor:v16];
        v47[3] = v17;
        double v30 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v31 = v47;
      }
      else
      {
        if (v27 != 1) {
          goto LABEL_12;
        }
        double v21 = [v6 leftAnchor];
        double v10 = [(PUPhotoEditViewController *)self view];
        double v11 = [v10 leftAnchor];
        double v12 = [v21 constraintEqualToAnchor:v11];
        v48[0] = v12;
        double v28 = [v6 rightAnchor];
        CGFloat v44 = [(PUPhotoEditViewController *)self view];
        [v44 rightAnchor];
        CGFloat v43 = v45 = v28;
        double v42 = objc_msgSend(v28, "constraintEqualToAnchor:");
        v48[1] = v42;
        double v29 = [v6 topAnchor];
        double v40 = [(PUPhotoEditViewController *)self view];
        [v40 topAnchor];
        v39 = double v41 = v29;
        double v38 = objc_msgSend(v29, "constraintEqualToAnchor:");
        v48[2] = v38;
        double v15 = [v6 bottomAnchor];
        double v16 = [(PUPhotoEditToolbar *)v7 topAnchor];
        double v17 = [v15 constraintEqualToAnchor:v16];
        v48[3] = v17;
        double v30 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v31 = v48;
      }
      double v18 = [v30 arrayWithObjects:v31 count:4];
    }
    [v20 addObjectsFromArray:v18];
  }

  double v7 = v46;
LABEL_12:

  return v20;
}

- (void)updateViewConstraints
{
  v185[3] = *MEMORY[0x1E4F143B8];
  [(PUPhotoEditViewController *)self lastKnownPreviewImageSize];
  -[PUPhotoEditViewController _placeholderViewFrameForImageSize:](self, "_placeholderViewFrameForImageSize:");
  if (self->_placeholderImageView)
  {
    if (!self->_placeholderImageViewConstraints)
    {
      double v7 = v3;
      double v8 = v4;
      double v9 = v5;
      double v10 = v6;
      if (!CGRectIsEmpty(*(CGRect *)&v3))
      {
        double v11 = [MEMORY[0x1E4F1CA48] array];
        double v12 = [(UIImageView *)self->_placeholderImageView leftAnchor];
        double v13 = [(UIImageView *)self->_placeholderImageView superview];
        double v14 = [v13 leftAnchor];
        double v15 = [v12 constraintEqualToAnchor:v14 constant:v7];
        [(NSArray *)v11 addObject:v15];

        double v16 = [(UIImageView *)self->_placeholderImageView widthAnchor];
        double v17 = [v16 constraintEqualToConstant:v9];
        [(NSArray *)v11 addObject:v17];

        double v18 = [(UIImageView *)self->_placeholderImageView topAnchor];
        double v19 = [(UIImageView *)self->_placeholderImageView superview];
        double v20 = [v19 topAnchor];
        double v21 = [v18 constraintEqualToAnchor:v20 constant:v8];
        [(NSArray *)v11 addObject:v21];

        double v22 = [(UIImageView *)self->_placeholderImageView heightAnchor];
        uint64_t v23 = [v22 constraintEqualToConstant:v10];
        [(NSArray *)v11 addObject:v23];

        [MEMORY[0x1E4F28DC8] activateConstraints:v11];
        placeholderImageViewConstraints = self->_placeholderImageViewConstraints;
        self->_placeholderImageViewConstraints = v11;
      }
    }
  }
  mainToolbar = self->_mainToolbar;
  double v26 = &OBJC_IVAR___PUOneUpSettings__autoplayScrubberWidth;
  if (mainToolbar && !self->_mainToolbarConstraints)
  {
    int64_t v27 = _NSDictionaryOfVariableBindings(&cfstr_Maintoolbar.isa, mainToolbar, 0);
    double v28 = [MEMORY[0x1E4F1CA48] array];
    [(PUPhotoEditToolbar *)self->_mainToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    double v29 = [(PUPhotoEditViewController *)self photoEditSpec];
    uint64_t v30 = [v29 currentLayoutStyle];

    if (v30 == 4)
    {
      v172 = [(PUPhotoEditToolbar *)self->_mainToolbar leftAnchor];
      v176 = [(PUPhotoEditViewController *)self view];
      v170 = [v176 leftAnchor];
      v168 = [v172 constraintEqualToAnchor:v170 constant:27.0];
      v185[0] = v168;
      long long v164 = [(PUPhotoEditToolbar *)self->_mainToolbar centerYAnchor];
      v166 = [(PUPhotoEditViewController *)self view];
      long long v162 = [v166 centerYAnchor];
      long long v161 = [v164 constraintEqualToAnchor:v162];
      v185[1] = v161;
      uint64_t v31 = [(PUPhotoEditToolbar *)self->_mainToolbar heightAnchor];
      double v32 = [(PUPhotoEditViewController *)self view];
      double v33 = [v32 heightAnchor];
      uint64_t v34 = [v31 constraintEqualToAnchor:v33];
      v185[2] = v34;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:3];
      double v36 = v35 = v28;
      [(NSArray *)v35 addObjectsFromArray:v36];

      double v28 = v35;
      double v26 = &OBJC_IVAR___PUOneUpSettings__autoplayScrubberWidth;

      int64_t v37 = v172;
    }
    else
    {
      int64_t v38 = [(PUPhotoEditViewController *)self layoutOrientation];
      if (v38 != 2)
      {
        if (v38 == 1)
        {
          [(PUPhotoEditToolbar *)self->_mainToolbar setLayoutDirection:0];
          double v39 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_mainToolbar]|" options:0x10000 metrics:0 views:v27];
          [(NSArray *)v28 addObjectsFromArray:v39];

          double v40 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:[_mainToolbar]-0@highPriority-|" options:0 metrics:&unk_1F078B9A8 views:v27];
          [(NSArray *)v28 addObjectsFromArray:v40];
        }
        goto LABEL_14;
      }
      [(PUPhotoEditToolbar *)self->_mainToolbar setLayoutDirection:1];
      v171 = [(PUPhotoEditToolbar *)self->_mainToolbar rightAnchor];
      v173 = [(PUPhotoEditViewController *)self view];
      v169 = [v173 rightAnchor];
      v167 = [v171 constraintEqualToAnchor:v169];
      v184[0] = v167;
      long long v165 = [(PUPhotoEditToolbar *)self->_mainToolbar topAnchor];
      long long v163 = [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar bottomAnchor];
      [v165 constraintEqualToAnchor:v163];
      double v41 = v177 = v28;
      v184[1] = v41;
      double v42 = [(PUPhotoEditToolbar *)self->_mainToolbar bottomAnchor];
      CGFloat v43 = [(PUPhotoEditViewController *)self view];
      CGFloat v44 = [v43 bottomAnchor];
      CGFloat v45 = [v42 constraintEqualToAnchor:v44];
      v184[2] = v45;
      CGFloat v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:3];
      [(NSArray *)v177 addObjectsFromArray:v46];

      double v26 = &OBJC_IVAR___PUOneUpSettings__autoplayScrubberWidth;
      double v28 = v177;

      int64_t v37 = v171;
    }

LABEL_14:
    [MEMORY[0x1E4F28DC8] activateConstraints:v28];
    mainToolbarConstraints = self->_mainToolbarConstraints;
    self->_mainToolbarConstraints = v28;
  }
  uint64_t v48 = v26[866];
  if (*(Class *)((char *)&self->super.super.super.isa + v48) && !self->_secondaryToolbarConstraints)
  {
    double v49 = [MEMORY[0x1E4F1CA48] array];
    [*(id *)((char *)&self->super.super.super.isa + v48) setTranslatesAutoresizingMaskIntoConstraints:0];
    double v50 = [*(id *)((char *)&self->super.super.super.isa + v48) leadingAnchor];
    double v51 = [(PUPhotoEditViewController *)self view];
    double v52 = [v51 leadingAnchor];
    double v53 = [v50 constraintEqualToAnchor:v52];
    [(NSArray *)v49 addObject:v53];

    double v54 = [*(id *)((char *)&self->super.super.super.isa + v48) trailingAnchor];
    double v55 = [(PUPhotoEditViewController *)self view];
    double v56 = [v55 trailingAnchor];
    double v57 = [v54 constraintEqualToAnchor:v56];
    [(NSArray *)v49 addObject:v57];

    double v58 = [*(id *)((char *)&self->super.super.super.isa + v48) topAnchor];
    double v59 = [(PUPhotoEditViewController *)self view];
    double v60 = [v59 topAnchor];
    double v61 = [v58 constraintEqualToAnchor:v60 constant:0.0];

    LODWORD(v62) = 1144750080;
    [v61 setPriority:v62];
    [v61 setActive:1];
    [MEMORY[0x1E4F28DC8] activateConstraints:v49];
    secondaryToolbarConstraints = self->_secondaryToolbarConstraints;
    self->_secondaryToolbarConstraints = v49;
  }
  if (!self->_actionButtonConstraints)
  {
    BOOL v64 = [(PUPhotoEditViewController *)self _actionButtonsGoInTopToolbar];
    mainActionButton = self->_mainActionButton;
    if (v64)
    {
      if (!mainActionButton || !self->_cancelButton) {
        goto LABEL_27;
      }
      v178 = [(PUPhotoEditNotchButton *)self->_mainActionButton widthAnchor];
      uint64_t v174 = [v178 constraintEqualToConstant:66.0];
      v183[0] = v174;
      double v66 = [(PUPhotoEditNotchButton *)self->_mainActionButton heightAnchor];
      double v67 = [v66 constraintEqualToConstant:26.0];
      v183[1] = v67;
      double v68 = [(PUPhotoEditNotchButton *)self->_cancelButton widthAnchor];
      double v69 = [v68 constraintEqualToConstant:66.0];
      v183[2] = v69;
      double v70 = [(PUPhotoEditNotchButton *)self->_cancelButton heightAnchor];
      double v71 = [v70 constraintEqualToConstant:26.0];
      v183[3] = v71;
      double v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:4];
      actionButtonConstraints = self->_actionButtonConstraints;
      self->_actionButtonConstraints = v72;

      double v74 = (void *)v174;
      double v75 = v178;
    }
    else
    {
      if (!mainActionButton) {
        goto LABEL_27;
      }
      cancelButton = self->_cancelButton;
      if (!cancelButton) {
        goto LABEL_27;
      }
      double v75 = [(PUPhotoEditViewController *)self parentViewController];
      double v74 = [v75 view];
      double v66 = [v74 window];
      CGRect v77 = +[PUPhotoEditLayoutSupport constraintsForNotchAreaButtonsLeading:cancelButton trailing:mainActionButton inWindow:v66];
      double v67 = self->_actionButtonConstraints;
      self->_actionButtonConstraints = v77;
    }

LABEL_27:
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_actionButtonConstraints];
  }
  [(PUPhotoEditViewController *)self previewViewFrame];
  if (v79 > 0.0 && v78 > 0.0)
  {
    CGRect v80 = *(Class *)((char *)&self->super.super.super.isa + v48);
    if (v80) {
      [v80 intrinsicContentSize];
    }
  }
  currentTool = self->_currentTool;
  if (currentTool)
  {
    CGRect v82 = [(UIViewController *)currentTool view];
    double v83 = [v82 superview];

    if (v83)
    {
      v84 = self->_mainToolbar;
      if (v84)
      {
        uint64_t v85 = [(PUPhotoEditToolbar *)v84 layoutOrientation];
        if (v85 == [(PUPhotoEditViewController *)self layoutOrientation]
          && !self->_currentToolViewConstraints)
        {
          id v86 = [(UIViewController *)self->_currentTool view];
          BOOL v87 = [(PUPhotoEditViewController *)self _constraintsForToolView:v86 wantsFullscreen:[(PUPhotoEditToolController *)self->_currentEditingTool wantsFullscreen]];
          [MEMORY[0x1E4F28DC8] activateConstraints:v87];
          currentToolViewConstraints = self->_currentToolViewConstraints;
          self->_currentToolViewConstraints = v87;
        }
      }
    }
  }
  previousEditingTool = self->_previousEditingTool;
  if (previousEditingTool)
  {
    int v90 = [(PUPhotoEditToolController *)previousEditingTool view];
    uint64_t v91 = [v90 superview];

    if (v91)
    {
      char v92 = self->_mainToolbar;
      if (v92)
      {
        uint64_t v93 = [(PUPhotoEditToolbar *)v92 layoutOrientation];
        if (v93 == [(PUPhotoEditViewController *)self layoutOrientation])
        {
          double v94 = [(PUPhotoEditToolController *)self->_previousEditingTool view];
          CGRect v95 = [(PUPhotoEditViewController *)self _constraintsForToolView:v94 wantsFullscreen:[(PUPhotoEditToolController *)self->_previousEditingTool wantsFullscreen]];
          [MEMORY[0x1E4F28DC8] activateConstraints:v95];
        }
      }
    }
  }
  if (self->_progressIndicatorView && !self->_progressIndicatorViewConstraints)
  {
    BOOL v96 = [MEMORY[0x1E4F1CA48] array];
    double v97 = (void *)MEMORY[0x1E4F28DC8];
    progressIndicatorView = self->_progressIndicatorView;
    uint64_t v99 = [(PUPhotoEditViewController *)self view];
    double v100 = [v97 constraintWithItem:progressIndicatorView attribute:9 relatedBy:0 toItem:v99 attribute:9 multiplier:1.0 constant:0.0];
    [(NSArray *)v96 addObject:v100];

    double v101 = (void *)MEMORY[0x1E4F28DC8];
    double v102 = self->_progressIndicatorView;
    double v103 = [(PUPhotoEditViewController *)self view];
    double v104 = [v101 constraintWithItem:v102 attribute:10 relatedBy:0 toItem:v103 attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v96 addObject:v104];

    [MEMORY[0x1E4F28DC8] activateConstraints:v96];
    progressIndicatorViewConstraints = self->_progressIndicatorViewConstraints;
    self->_progressIndicatorViewConstraints = v96;
  }
  [(PUPhotoEditViewController *)self _updateProgressEventBlockingViewConstraints];
  int64_t v106 = [(PUPhotoEditViewController *)self layoutOrientation];
  double v107 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v108 = [v107 userInterfaceIdiom];

  if ((v108 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v106 == 1) {
    double v110 = 18.0;
  }
  else {
    double v110 = 0.0;
  }
  CGFloat v111 = [(NUMediaView *)self->_mediaView _scrollView];
  [*(id *)((char *)&self->super.super.super.isa + v48) intrinsicContentSize];
  double v113 = v112;
  double v114 = [(PUPhotoEditViewController *)self view];
  [v114 safeAreaInsets];
  double v116 = v115;
  double v118 = v117;

  if (self->_transientStatusBadge)
  {
    LOBYTE(imageFrameLayoutGuide) = v111 == 0;
    if (v111)
    {
      if (!self->_transientStatusBadgeConstraints)
      {
        imageFrameLayoutGuide = self->_imageFrameLayoutGuide;
        if (imageFrameLayoutGuide)
        {
          int v120 = [MEMORY[0x1E4F1CA48] array];
          v121 = [(CEKBadgeTextView *)self->_transientStatusBadge topAnchor];
          [(PUPhotoEditViewController *)self view];
          v122 = v179 = v111;
          double v123 = [v122 topAnchor];
          double v124 = [v121 constraintEqualToAnchor:v123 constant:v110 + v116 + 36.0];
          [(NSArray *)v120 addObject:v124];

          double v125 = [(CEKBadgeTextView *)self->_transientStatusBadge centerXAnchor];
          double v126 = [(PUPhotoEditViewController *)self view];
          v127 = [v126 centerXAnchor];
          id v128 = [v125 constraintEqualToAnchor:v127 constant:0.0];
          [(NSArray *)v120 addObject:v128];

          int64_t v129 = [(CEKBadgeTextView *)self->_transientStatusBadge widthAnchor];
          id v130 = [v179 widthAnchor];
          v131 = [v129 constraintLessThanOrEqualToAnchor:v130 multiplier:1.0 constant:-18.0];
          [(NSArray *)v120 addObject:v131];

          CGFloat v111 = v179;
          [MEMORY[0x1E4F28DC8] activateConstraints:v120];
          transientStatusBadgeConstraints = self->_transientStatusBadgeConstraints;
          self->_transientStatusBadgeConstraints = v120;

          LOBYTE(imageFrameLayoutGuide) = 0;
        }
      }
    }
  }
  else
  {
    LOBYTE(imageFrameLayoutGuide) = v111 == 0;
  }
  if (self->_assetTypeBadge)
  {
    if (self->_assetTypeBadgeConstraints) {
      LOBYTE(imageFrameLayoutGuide) = 1;
    }
    if ((imageFrameLayoutGuide & 1) == 0)
    {
      double v133 = v118 + 22.0 + 6.0;
      double v134 = [MEMORY[0x1E4F1CA48] array];
      double v135 = [(PXUIAssetBadgeView *)self->_assetTypeBadge topAnchor];
      [v111 topAnchor];
      v137 = CGFloat v136 = v111;
      CGFloat v138 = [v135 constraintEqualToAnchor:v137 constant:v113 + 6.0];
      [(NSArray *)v134 addObject:v138];

      CGFloat v139 = [(PXUIAssetBadgeView *)self->_assetTypeBadge leftAnchor];
      int64_t v140 = [v136 leftAnchor];
      if (v106 == 1) {
        double v141 = 6.0;
      }
      else {
        double v141 = v133;
      }
      double v142 = [v139 constraintEqualToAnchor:v140 constant:v141];
      [(NSArray *)v134 addObject:v142];

      CGFloat v111 = v136;
      [MEMORY[0x1E4F28DC8] activateConstraints:v134];
      assetTypeBadgeConstraints = self->_assetTypeBadgeConstraints;
      self->_assetTypeBadgeConstraints = v134;
    }
  }
  mediaView = self->_mediaView;
  if (mediaView && !self->_mediaViewConstraints)
  {
    v145 = (void *)MEMORY[0x1E4F28DC8];
    v175 = [(PUPhotoEditViewController *)self view];
    double v146 = [v145 constraintWithItem:mediaView attribute:9 relatedBy:0 toItem:v175 attribute:9 multiplier:1.0 constant:0.0];
    v182[0] = v146;
    v180 = v111;
    objc_super v147 = (void *)MEMORY[0x1E4F28DC8];
    int v148 = self->_mediaView;
    CGRect v149 = [(PUPhotoEditViewController *)self view];
    CGRect v150 = [v147 constraintWithItem:v148 attribute:10 relatedBy:0 toItem:v149 attribute:10 multiplier:1.0 constant:0.0];
    v182[1] = v150;
    CGRect v151 = (void *)MEMORY[0x1E4F28DC8];
    CGRect v152 = self->_mediaView;
    CGRect v153 = [(PUPhotoEditViewController *)self view];
    CGRect v154 = [v151 constraintWithItem:v152 attribute:8 relatedBy:0 toItem:v153 attribute:8 multiplier:1.0 constant:0.0];
    v182[2] = v154;
    CGRect v155 = (void *)MEMORY[0x1E4F28DC8];
    CGRect v156 = self->_mediaView;
    long long v157 = [(PUPhotoEditViewController *)self view];
    long long v158 = [v155 constraintWithItem:v156 attribute:7 relatedBy:0 toItem:v157 attribute:7 multiplier:1.0 constant:0.0];
    v182[3] = v158;
    long long v159 = [MEMORY[0x1E4F1C978] arrayWithObjects:v182 count:4];

    CGFloat v111 = v180;
    [MEMORY[0x1E4F28DC8] activateConstraints:v159];
    mediaViewConstraints = self->_mediaViewConstraints;
    self->_mediaViewConstraints = v159;
  }
  v181.receiver = self;
  v181.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v181 updateViewConstraints];
}

- (void)_updateProgressEventBlockingViewConstraints
{
  void v32[4] = *MEMORY[0x1E4F143B8];
  if (self->_progressEventBlockingView && !self->_progressEventBlockingViewConstraints)
  {
    if ([(PUPhotoEditViewController *)self layoutOrientation] == 1
      && ([(PUPhotoEditViewController *)self photoEditSpec],
          double v3 = objc_claimAutoreleasedReturnValue(),
          uint64_t v4 = [v3 currentLayoutStyle],
          v3,
          v4 != 4))
    {
      progressEventBlockingView = self->_progressEventBlockingView;
      double v18 = self->_mainToolbar;
      double v19 = [(UIView *)progressEventBlockingView leftAnchor];
      double v29 = [(PUPhotoEditViewController *)self view];
      [v29 leftAnchor];
      v27 = uint64_t v30 = v19;
      double v26 = objc_msgSend(v19, "constraintEqualToAnchor:");
      v31[0] = v26;
      double v20 = [(UIView *)self->_progressEventBlockingView topAnchor];
      id v24 = [(PUPhotoEditViewController *)self view];
      [v24 topAnchor];
      uint64_t v23 = v25 = v20;
      double v8 = objc_msgSend(v20, "constraintEqualToAnchor:");
      v31[1] = v8;
      double v9 = [(UIView *)self->_progressEventBlockingView rightAnchor];
      double v10 = [(PUPhotoEditViewController *)self view];
      double v11 = [v10 rightAnchor];
      double v12 = [v9 constraintEqualToAnchor:v11];
      v31[2] = v12;
      double v13 = [(UIView *)self->_progressEventBlockingView bottomAnchor];
      double v28 = v18;
      double v14 = [(PUPhotoEditToolbar *)v18 topAnchor];
      double v16 = [v13 constraintEqualToAnchor:v14];
      v31[3] = v16;
      double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
      progressEventBlockingViewConstraints = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = v21;
    }
    else
    {
      double v5 = [(UIView *)self->_progressEventBlockingView leftAnchor];
      double v29 = [(PUPhotoEditViewController *)self view];
      [v29 leftAnchor];
      v27 = uint64_t v30 = v5;
      double v28 = objc_msgSend(v5, "constraintEqualToAnchor:");
      v32[0] = v28;
      double v6 = [(UIView *)self->_progressEventBlockingView topAnchor];
      double v25 = [(PUPhotoEditButtonCenteredToolbar *)self->_secondaryToolbar bottomAnchor];
      double v26 = v6;
      id v24 = objc_msgSend(v6, "constraintEqualToAnchor:");
      v32[1] = v24;
      double v7 = [(UIView *)self->_progressEventBlockingView rightAnchor];
      double v8 = [(PUPhotoEditViewController *)self view];
      double v9 = [v8 rightAnchor];
      uint64_t v23 = v7;
      double v10 = [v7 constraintEqualToAnchor:v9];
      void v32[2] = v10;
      double v11 = [(UIView *)self->_progressEventBlockingView bottomAnchor];
      double v12 = [(PUPhotoEditViewController *)self view];
      double v13 = [v12 bottomAnchor];
      double v14 = [v11 constraintEqualToAnchor:v13];
      v32[3] = v14;
      double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
      double v16 = self->_progressEventBlockingViewConstraints;
      self->_progressEventBlockingViewConstraints = v15;
    }

    [MEMORY[0x1E4F28DC8] activateConstraints:self->_progressEventBlockingViewConstraints];
  }
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (BOOL)pu_wantsToolbarVisible
{
  return 0;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  return 0;
}

- (id)_preferredStatusBarHideAnimationParameters
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1C78]);
  return v2;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  if ([(PUPhotoEditViewController *)self layoutOrientation] != 1) {
    return 1;
  }
  return [(PUPhotoEditViewController *)self isFocusingViewForInteraction];
}

- (BOOL)prefersStatusBarHidden
{
  return PLPhysicalDeviceIsIPad() ^ 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v4 viewDidDisappear:a3];
  [(PUViewControllerSpec *)self->_photoEditSpec unregisterChangeObserver:self];
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:0];
  PXUnregisterAppIntentsViewAnnotationDelegate();
  [(PUPhotoEditViewController *)self _teardownCleanupResources];
  [MEMORY[0x1E4F901C0] setTipsPresentationDelegate:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v8 viewWillDisappear:a3];
  objc_super v4 = [(PUPhotoEditViewController *)self resourceLoader];
  [v4 cancelAllRequests];

  double v5 = [(PUPhotoEditViewController *)self revertConfirmationAlert];

  if (v5)
  {
    double v6 = [(PUPhotoEditViewController *)self revertConfirmationAlert];
    [v6 dismissViewControllerAnimated:0 completion:0];
  }
  [(NUMediaView *)self->_mediaView _stopVideoPlayback];
  double v7 = [(PUPhotoEditViewController *)self compositionController];
  [v7 setChangeDelegate:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewDidAppear:](&v6, sel_viewDidAppear_);
  [(PUPhotoEditViewController *)self updateProgressIndicatorAnimated:v3];
  double v5 = [(PUPhotoEditViewController *)self view];
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
  [MEMORY[0x1E4F901C0] setTipsPresentationDelegate:self];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v6 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  if (a3) {
    [(PUPhotoEditViewController *)self _loadPhotoEditResourcesIfNeeded];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PUPhotoEditViewController;
  -[PUPhotoEditViewController viewWillAppear:](&v18, sel_viewWillAppear_);
  double v5 = [(PUPhotoEditViewController *)self avResourceReclamationAssertion];

  if (!v5)
  {
    objc_super v6 = [(PUPhotoEditViewController *)self avResourceReclamationController];
    double v7 = (objc_class *)objc_opt_class();
    objc_super v8 = NSStringFromClass(v7);
    double v9 = [v6 takeAssertionPreventingResourceReclamationWithReason:v8];
    [(PUPhotoEditViewController *)self setAvResourceReclamationAssertion:v9];
  }
  [(UIViewController *)self pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:v3];
  [(PUPhotoEditViewController *)self _updateTraitCollectionAndLayoutReferenceSize];
  [(PUViewControllerSpec *)self->_photoEditSpec registerChangeObserver:self];
  double v10 = [(PUPhotoEditViewController *)self view];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  if ([(UIViewController *)self pu_isPresenting])
  {
    [(PUViewControllerSpec *)self->_photoEditSpec layoutReferenceSize];
    double v12 = v15;
    double v14 = v16;
  }
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0, v12, v14);
  [(PUPhotoEditViewController *)self _loadPhotoEditResourcesIfNeeded];
  [(PUPhotoEditViewController *)self _updateToolbarsAnimated:0];
  [(PUPhotoEditViewController *)self _updateTogglePreviewGestureRecognizer];
  [(PUPhotoEditViewController *)self _updateLivePhotoPlaybackGestureRecognizer];
  [(PUPhotoEditViewController *)self _updatePreviewingOriginal];
  [(PUPhotoEditViewController *)self _updateBackgroundColor];
  [(PUPhotoEditViewController *)self _updateToolbarBackgroundAnimated:0];
  [(PUPhotoEditViewController *)self _createPencilInteractionIfNeeded];
  [(PEAutoAdjustmentController *)self->_autoEnhanceController invalidateCachedAdjustments];
  double v17 = [(PUPhotoEditViewController *)self compositionController];
  [v17 setChangeDelegate:self];

  if (self->_mediaToolController)
  {
    if (!self->_currentTool) {
      -[PUPhotoEditViewController switchToEditingTool:animated:](self, "switchToEditingTool:animated:");
    }
  }
}

- (void)viewDidLoad
{
  v60.receiver = self;
  v60.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v60 viewDidLoad];
  [(PUPhotoEditViewController *)self px_enableImageModulation];
  BOOL v3 = [(PUPhotoEditViewController *)self view];
  [v3 setAccessibilityIgnoresInvertColors:1];
  objc_super v4 = [(PUPhotoEditViewController *)self contentScrollView];
  [v4 setContentInsetAdjustmentBehavior:3];

  double v5 = [(PUPhotoEditViewController *)self _createMediaView];
  mediaView = self->_mediaView;
  self->_mediaView = v5;

  [v3 addSubview:self->_mediaView];
  [(PUPhotoEditViewController *)self _createVideoScrubberIfNeeded];
  double v7 = (PEAutoAdjustmentController *)objc_alloc_init(MEMORY[0x1E4F91118]);
  autoEnhanceController = self->_autoEnhanceController;
  self->_autoEnhanceController = v7;

  [(PUPhotoEditViewController *)self _setupImagePluginSession];
  [v3 setNeedsUpdateConstraints];
  [(PUPhotoEditViewController *)self _updateLayerModulation];
  double v9 = +[PUPhotoEditProtoSettings sharedInstance];
  int v10 = [v9 enablePerfDebugHUD];

  if (v10)
  {
    double v11 = objc_alloc_init(PUPhotoEditPerfHUD);
    [(PUPhotoEditViewController *)self setPerfHUD:v11];

    double v12 = [(PUPhotoEditViewController *)self perfHUD];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v13 = [(PUPhotoEditViewController *)self perfHUD];
    [v3 addSubview:v13];

    BOOL v14 = [(PUPhotoEditViewController *)self isFirstSinceBoot];
    double v15 = [(PUPhotoEditViewController *)self perfHUD];
    [v15 setFirstSinceBoot:v14];

    BOOL v16 = [(PUPhotoEditViewController *)self isFirstSinceLaunch];
    double v17 = [(PUPhotoEditViewController *)self perfHUD];
    [v17 setFirstSinceLaunch:v16];

    objc_super v18 = [(PUPhotoEditViewController *)self enterEditTimeInterval];
    double v19 = [(PUPhotoEditViewController *)self perfHUD];
    [v19 setEnterEditTimeInterval:v18];

    double v20 = [(PUPhotoEditViewController *)self resourceCheckingInterval];
    double v21 = [(PUPhotoEditViewController *)self perfHUD];
    [v21 setResourceCheckingInterval:v20];

    double v22 = [(PUPhotoEditViewController *)self resourceDownloadInterval];
    uint64_t v23 = [(PUPhotoEditViewController *)self perfHUD];
    [v23 setResourceDownloadInterval:v22];

    id v24 = [(PUPhotoEditViewController *)self resourceLoadingInterval];
    double v25 = [(PUPhotoEditViewController *)self perfHUD];
    [v25 setResourceLoadingInterval:v24];

    double v26 = [(PUPhotoEditViewController *)self autoCalcInterval];
    int64_t v27 = [(PUPhotoEditViewController *)self perfHUD];
    [v27 setAutoCalcInterval:v26];

    double v28 = [(PUPhotoEditViewController *)self filterInterval];
    double v29 = [(PUPhotoEditViewController *)self perfHUD];
    [v29 setFilterInterval:v28];

    uint64_t v30 = [(PUPhotoEditViewController *)self exitEditTimeInterval];
    uint64_t v31 = [(PUPhotoEditViewController *)self perfHUD];
    [v31 setExitEditTimeInterval:v30];

    double v32 = [(PUPhotoEditViewController *)self perfHUD];
    double v33 = [v32 leadingAnchor];
    uint64_t v34 = [v3 safeAreaLayoutGuide];
    uint64_t v35 = [v34 leadingAnchor];
    double v36 = [v33 constraintEqualToAnchor:v35 constant:4.0];
    [v36 setActive:1];

    int64_t v37 = [(PUPhotoEditViewController *)self perfHUD];
    int64_t v38 = [v37 topAnchor];
    double v39 = [v3 safeAreaLayoutGuide];
    double v40 = [v39 topAnchor];
    double v41 = [v38 constraintEqualToAnchor:v40 constant:50.0];
    [v41 setActive:1];

    double v42 = [(PUPhotoEditViewController *)self photo];
    CGFloat v43 = [v42 pathForOriginalImageFile];
    CGFloat v44 = [v43 lastPathComponent];
    CGFloat v45 = [(PUPhotoEditViewController *)self perfHUD];
    [v45 setDetailText:v44];
LABEL_5:

    goto LABEL_6;
  }
  CGFloat v46 = +[PUPhotoEditProtoSettings sharedInstance];
  int v47 = [v46 enableSemanticDevelopmentHUD];

  if (v47)
  {
    uint64_t v48 = [PUPhotoSceneHUD alloc];
    double v49 = [(PUPhotoEditViewController *)self photo];
    double v50 = [(PUPhotoSceneHUD *)v48 initWithPhoto:v49];
    [(PUPhotoEditViewController *)self setSceneHUD:v50];

    double v51 = [(PUPhotoEditViewController *)self sceneHUD];
    [v51 setTranslatesAutoresizingMaskIntoConstraints:0];

    double v52 = [(PUPhotoEditViewController *)self sceneHUD];
    [v3 addSubview:v52];

    double v53 = [(PUPhotoEditViewController *)self sceneHUD];
    double v54 = [v53 leadingAnchor];
    double v55 = [v3 safeAreaLayoutGuide];
    double v56 = [v55 leadingAnchor];
    double v57 = [v54 constraintEqualToAnchor:v56 constant:4.0];
    [v57 setActive:1];

    double v42 = [(PUPhotoEditViewController *)self sceneHUD];
    CGFloat v43 = [v42 topAnchor];
    CGFloat v44 = [v3 safeAreaLayoutGuide];
    CGFloat v45 = [v44 topAnchor];
    double v58 = [v43 constraintEqualToAnchor:v45 constant:50.0];
    [v58 setActive:1];

    goto LABEL_5;
  }
LABEL_6:
  double v59 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v59 addObserver:self selector:sel__undoManagerDidCloseUndoGroupNotification_ name:*MEMORY[0x1E4F28A68] object:0];
  [v59 addObserver:self selector:sel__undoManagerWillUndo_ name:*MEMORY[0x1E4F28A98] object:0];
  [v59 addObserver:self selector:sel__undoManagerWillRedo_ name:*MEMORY[0x1E4F28A90] object:0];
  [v59 addObserver:self selector:sel__undoManagerDidUndo_ name:*MEMORY[0x1E4F28A80] object:0];
  [v59 addObserver:self selector:sel__undoManagerDidRedo_ name:*MEMORY[0x1E4F28A78] object:0];
}

- (id)_composition
{
  objc_super v4 = [(PUPhotoEditViewController *)self editSource];
  if (v4)
  {
    double v5 = [(PUPhotoEditViewController *)self editSource];
    uint64_t v6 = [v5 mediaType];
    goto LABEL_5;
  }
  uint64_t v7 = [(PUPhotoEditViewController *)self originalImageEditSource];
  if (v7)
  {
    double v5 = (void *)v7;
    objc_super v8 = [(PUPhotoEditViewController *)self originalImageEditSource];
    uint64_t v6 = [v8 mediaType];

LABEL_5:
    if (v6) {
      goto LABEL_6;
    }
  }
  double v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"PUPhotoEditViewController.m", 992, @"could not work out media type, so no composition for you!" object file lineNumber description];

  uint64_t v6 = 0;
LABEL_6:
  double v9 = (void *)MEMORY[0x1E4F8A748];
  int v10 = [(PUPhotoEditViewController *)self compositionController];
  double v11 = [v9 validatedCompositionCopyFor:v10 mediaType:v6];

  return v11;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  [(PUPhotoEditViewController *)self _updateTraitCollectionAndLayoutReferenceSize];
  double v5 = [(PUPhotoEditViewController *)self photoEditSpec];
  [v5 layoutReferenceSize];
  -[PUPhotoEditViewController _updateLayoutOrientationWithViewSize:transitionCoordinator:](self, "_updateLayoutOrientationWithViewSize:transitionCoordinator:", 0);

  [(PUPhotoEditViewController *)self _updateSpecDependentUIPieces];
}

- (void)_updateTraitCollectionAndLayoutReferenceSize
{
  BOOL v3 = [(PUPhotoEditViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([(UIViewController *)self pu_isPresenting])
  {
    [(PUViewControllerSpec *)self->_photoEditSpec layoutReferenceSize];
    double v5 = v8;
    double v7 = v9;
  }
  -[PUPhotoEditViewController _updateTraitCollectionAndLayoutReferenceSize:](self, "_updateTraitCollectionAndLayoutReferenceSize:", v5, v7);
}

- (void)_updateTraitCollectionAndLayoutReferenceSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = [(PUPhotoEditViewController *)self traitCollection];
  photoEditSpec = self->_photoEditSpec;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __74__PUPhotoEditViewController__updateTraitCollectionAndLayoutReferenceSize___block_invoke;
  v9[3] = &unk_1E5F2E580;
  void v9[4] = self;
  id v10 = v6;
  CGFloat v11 = width;
  CGFloat v12 = height;
  id v8 = v6;
  [(PUViewControllerSpec *)photoEditSpec performChanges:v9];
}

uint64_t __74__PUPhotoEditViewController__updateTraitCollectionAndLayoutReferenceSize___block_invoke(double *a1)
{
  [*(id *)(*((void *)a1 + 4) + 1816) setPrefersCompactLayoutForSplitScreen:1];
  [*(id *)(*((void *)a1 + 4) + 1816) setTraitCollection:*((void *)a1 + 5)];
  id v2 = *(void **)(*((void *)a1 + 4) + 1816);
  double v3 = a1[6];
  double v4 = a1[7];
  return objc_msgSend(v2, "setLayoutReferenceSize:", v3, v4);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUPhotoEditViewController *)self _updatePreviewOriginal:0 withPresses:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    [(PUPhotoEditViewController *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUPhotoEditViewController *)self _updatePreviewOriginal:0 withPresses:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    [(PUPhotoEditViewController *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUPhotoEditViewController *)self _updatePreviewOriginal:1 withPresses:v6])
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPhotoEditViewController;
    [(PUPhotoEditViewController *)&v8 pressesBegan:v6 withEvent:v7];
  }
}

- (BOOL)_updatePreviewOriginal:(BOOL)a3 withPresses:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(PUPhotoEditToolController *)self->_currentEditingTool supportsPreviewingOriginal])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v17 = v6;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      char v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          double v13 = [*(id *)(*((void *)&v18 + 1) + 8 * i) key];
          BOOL v14 = [v13 charactersIgnoringModifiers];

          if ([v14 isEqualToString:@"m"])
          {
            [(PUPhotoEditViewController *)self setShouldBePreviewingOriginal:v4];
            char v10 = 1;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
    else
    {
      char v10 = 0;
    }

    BOOL v15 = v10 & 1;
    id v6 = v17;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_updateKeyCommands
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  if ([(PUPhotoEditViewController *)self _enableSpatialMediaEditing]
    || ![(PUPhotoEditViewController *)self isSpatialMedia])
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    uint64_t v62 = 1712;
    double v3 = self->_addedKeyCommands;
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v79 objects:v86 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v80 != v6) {
            objc_enumerationMutation(v3);
          }
          -[PUPhotoEditViewController removeKeyCommand:](self, "removeKeyCommand:", *(void *)(*((void *)&v79 + 1) + 8 * i), v62);
        }
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v79 objects:v86 count:16];
      }
      while (v5);
    }

    BOOL v64 = objc_opt_new();
    uint64_t v8 = [(PUPhotoEditViewController *)self _allTools];
    double v65 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obj = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 1;
      uint64_t v12 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v76 != v12) {
            objc_enumerationMutation(obj);
          }
          BOOL v14 = *(_TtC15PhotosUIPrivate26PUPhotoStyleToolController **)(*((void *)&v75 + 1) + 8 * j);
          if ([(PUPhotoStyleToolController *)v14 toolControllerTag] != 1006)
          {
            BOOL v15 = [NSNumber numberWithInteger:v11];
            BOOL v16 = objc_msgSend(NSNumber, "numberWithInteger:", -[PUPhotoStyleToolController toolControllerTag](v14, "toolControllerTag"));
            [v65 setObject:v16 forKeyedSubscript:v15];

            if (v14 == (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_adjustmentsController)
            {
              id v17 = @"a";
            }
            else if (v14 == (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_filtersController)
            {
              id v17 = @"f";
            }
            else if (v14 == (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_cropController)
            {
              id v17 = @"c";
            }
            else
            {
              if (v14 != (_TtC15PhotosUIPrivate26PUPhotoStyleToolController *)self->_cleanupController)
              {
                if (v14 == self->_photoStylesToolController)
                {
                  id v17 = @"s";
                  goto LABEL_26;
                }
LABEL_27:
                ++v11;

                continue;
              }
              id v17 = @"r";
            }
LABEL_26:
            long long v18 = [MEMORY[0x1E4FB18D0] commandWithTitle:&stru_1F06BE7B8 image:0 action:sel_navigateToSegment_ input:v17 modifierFlags:0 propertyList:v15];
            [v64 addObject:v18];

            goto LABEL_27;
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
      }
      while (v10);
    }

    long long v19 = (NSDictionary *)[v65 copy];
    toolControllerTagsByKeyCommandNumber = self->_toolControllerTagsByKeyCommandNumber;
    self->_toolControllerTagsByKeyCommandNumber = v19;

    BOOL v21 = [(PUPhotoEditToolController *)self->_currentEditingTool wantsScrubberKeyControl];
    double v22 = (void **)MEMORY[0x1E4FB2B78];
    uint64_t v23 = (id *)MEMORY[0x1E4FB2B98];
    id v24 = (id *)MEMORY[0x1E4FB2B90];
    double v25 = (id *)MEMORY[0x1E4FB2AF8];
    if (v21)
    {
      int64_t v26 = [(PUPhotoEditToolController *)self->_currentEditingTool scrubberOrientation];
      if (v26 == 1) {
        int64_t v27 = v22;
      }
      else {
        int64_t v27 = v23;
      }
      double v28 = *v27;
      double v29 = (void *)MEMORY[0x1E4FB18D0];
      if (v26 == 1) {
        uint64_t v30 = v24;
      }
      else {
        uint64_t v30 = v25;
      }
      id v31 = v28;
      double v32 = [v29 keyCommandWithInput:v31 modifierFlags:0 action:sel__handleScrubberValueDecrease_];
      [v64 addObject:v32];

      double v33 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v31 modifierFlags:0x20000 action:sel__handleCoarseScrubberValueDecrease_];

      [v64 addObject:v33];
      uint64_t v34 = (void *)MEMORY[0x1E4FB18D0];
      id v35 = *v30;
      double v36 = [v34 keyCommandWithInput:v35 modifierFlags:0 action:sel__handleScrubberValueIncrease_];
      [v64 addObject:v36];

      uint64_t v23 = (id *)MEMORY[0x1E4FB2B98];
      int64_t v37 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v35 modifierFlags:0x20000 action:sel__handleCoarseScrubberValueIncrease_];

      id v24 = (id *)MEMORY[0x1E4FB2B90];
      [v64 addObject:v37];
    }
    if ([(PUPhotoEditToolController *)self->_currentEditingTool wantsSliderKeyControl])
    {
      int64_t v38 = [(PUPhotoEditToolController *)self->_currentEditingTool scrubberOrientation];
      if (v38 == 1) {
        double v39 = v22;
      }
      else {
        double v39 = v25;
      }
      double v40 = *v39;
      double v41 = (void *)MEMORY[0x1E4FB18D0];
      if (v38 == 1) {
        uint64_t v23 = v24;
      }
      id v42 = v40;
      CGFloat v43 = [v41 keyCommandWithInput:v42 modifierFlags:0x80000 action:sel__handleSliderValueDecrease_];
      [v64 addObject:v43];

      CGFloat v44 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v42 modifierFlags:655360 action:sel__handleCoarseSliderValueDecrease_];

      [v64 addObject:v44];
      CGFloat v45 = (void *)MEMORY[0x1E4FB18D0];
      id v46 = *v23;
      int v47 = [v45 keyCommandWithInput:v46 modifierFlags:0x80000 action:sel__handleSliderValueIncrease_];
      [v64 addObject:v47];

      uint64_t v48 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:v46 modifierFlags:655360 action:sel__handleCoarseSliderValueIncrease_];

      [v64 addObject:v48];
    }
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v49 = v64;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v51; ++k)
        {
          if (*(void *)v72 != v52) {
            objc_enumerationMutation(v49);
          }
          [*(id *)(*((void *)&v71 + 1) + 8 * k) setWantsPriorityOverSystemBehavior:1];
        }
        uint64_t v51 = [v49 countByEnumeratingWithState:&v71 objects:v84 count:16];
      }
      while (v51);
    }

    double v54 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__handleCancelButton_];
    [v49 addObject:v54];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v55 = v49;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v68;
      do
      {
        for (uint64_t m = 0; m != v57; ++m)
        {
          if (*(void *)v68 != v58) {
            objc_enumerationMutation(v55);
          }
          [(PUPhotoEditViewController *)self addKeyCommand:*(void *)(*((void *)&v67 + 1) + 8 * m)];
        }
        uint64_t v57 = [v55 countByEnumeratingWithState:&v67 objects:v83 count:16];
      }
      while (v57);
    }

    objc_super v60 = (objc_class *)[v55 copy];
    double v61 = *(Class *)((char *)&self->super.super.super.isa + v63);
    *(Class *)((char *)&self->super.super.super.isa + v63) = v60;
  }
}

- (void)dealloc
{
  double v3 = [(PUPhotoEditViewController *)self assetChangeTimeoutTimer];
  [v3 invalidate];

  [(PUPhotoEditViewController *)self setAssetChangeTimeoutTimer:0];
  if (self->_progressIndicatorInteractionDisablingToken) {
    +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:");
  }
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  objc_msgSend(v5, "px_unregisterChangeObserver:", self);

  uint64_t v6 = [(PUPhotoEditViewController *)self photoEditIrisModel];
  [v6 unregisterChangeObserver:self];

  saveProgressTimer = self->_saveProgressTimer;
  if (saveProgressTimer)
  {
    dispatch_source_cancel(saveProgressTimer);
    uint64_t v8 = self->_saveProgressTimer;
    self->_saveProgressTimer = 0;
  }
  CGImageRelease(self->_gainMapImage);
  v9.receiver = self;
  v9.super_class = (Class)PUPhotoEditViewController;
  [(PUPhotoEditViewController *)&v9 dealloc];
}

- (PUPhotoEditViewController)initWithPhoto:(id)a3 mediaProvider:(id)a4 mediaDestination:(id)a5
{
  v74[3] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v73.receiver = self;
  v73.super_class = (Class)PUPhotoEditViewController;
  double v13 = [(PUPhotoEditViewController *)&v73 initWithNibName:0 bundle:0];
  if (v13)
  {
    BOOL v14 = (PXSystemAVResourceReclamationController *)objc_alloc_init(MEMORY[0x1E4F8EB70]);
    avResourceReclamationController = v13->_avResourceReclamationController;
    v13->_avResourceReclamationController = v14;

    if (!v10)
    {
      double v65 = [MEMORY[0x1E4F28B00] currentHandler];
      [v65 handleFailureInMethod:a2, v13, @"PUPhotoEditViewController.m", 744, @"Invalid parameter not satisfying: %@", @"photo" object file lineNumber description];
    }
    id v66 = v11;
    BOOL v16 = objc_alloc_init(PUPhotoEditViewControllerSpec);
    photoEditSpec = v13->_photoEditSpec;
    v13->_photoEditSpec = v16;

    objc_storeStrong((id *)&v13->_photo, a3);
    objc_storeStrong((id *)&v13->_mediaProvider, a4);
    objc_storeStrong((id *)&v13->_mediaDestination, a5);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v12 setDelegate:v13];
    }
    v13->_workImageVersion = 0;
    v13->_int64_t layoutOrientation = 1;
    long long v18 = objc_alloc_init(PUPhotoEditAggregateSession);
    aggregateSession = v13->_aggregateSession;
    v13->_aggregateSession = v18;

    if ([(PUPhotoEditViewController *)v13 isStandardVideo])
    {
      [(PUPhotoEditAggregateSession *)v13->_aggregateSession setShouldUseVideoKeys:1];
      [v10 duration];
      -[PUPhotoEditAggregateSession setOriginalDuration:](v13->_aggregateSession, "setOriginalDuration:");
    }
    long long v20 = objc_alloc_init(_PPTState);
    pptState = v13->_pptState;
    v13->_pptState = v20;

    double v22 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    enterEditTimeInterval = v13->_enterEditTimeInterval;
    v13->_enterEditTimeInterval = v22;

    id v24 = PLPhotoEditGetLog();
    double v25 = [(PUPhotoEditViewController *)v13 enterEditTimeInterval];
    os_signpost_id_t v26 = os_signpost_id_make_with_pointer(v24, v25);

    int64_t v27 = [v10 pathForOriginalImageFile];
    double v28 = [v27 lastPathComponent];

    uint64_t v29 = [v10 pixelWidth];
    uint64_t v30 = [v10 pixelHeight];
    id v31 = v13->_enterEditTimeInterval;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __74__PUPhotoEditViewController_initWithPhoto_mediaProvider_mediaDestination___block_invoke;
    v67[3] = &unk_1E5F28CF8;
    long long v68 = v24;
    id v69 = v28;
    os_signpost_id_t v70 = v26;
    uint64_t v71 = v29;
    uint64_t v72 = v30;
    id v32 = v28;
    double v33 = v24;
    id v34 = (id)[(PXTimeInterval *)v31 addStateTransitionHandler:v67];
    id v35 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    resourceLoadingInterval = v13->_resourceLoadingInterval;
    v13->_resourceLoadingInterval = v35;

    int64_t v37 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    resourceCheckingInterval = v13->_resourceCheckingInterval;
    v13->_resourceCheckingInterval = v37;

    double v39 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    resourceDownloadInterval = v13->_resourceDownloadInterval;
    v13->_resourceDownloadInterval = v39;

    double v41 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    modelPrepInterval = v13->_modelPrepInterval;
    v13->_modelPrepInterval = v41;

    CGFloat v43 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    autoCalcInterval = v13->_autoCalcInterval;
    v13->_autoCalcInterval = v43;

    CGFloat v45 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    filterInterval = v13->_filterInterval;
    v13->_filterInterval = v45;

    int v47 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    exitEditTimeInterval = v13->_exitEditTimeInterval;
    v13->_exitEditTimeInterval = v47;

    id v49 = (PXTimeInterval *)objc_alloc_init(MEMORY[0x1E4F90800]);
    editSessionTimeInterval = v13->_editSessionTimeInterval;
    v13->_editSessionTimeInterval = v49;

    uint64_t v51 = objc_alloc_init(PUEnterEditPerformanceEventBuilder);
    enterEditEventBuilder = v13->_enterEditEventBuilder;
    v13->_enterEditEventBuilder = v51;

    [(PUEnterEditPerformanceEventBuilder *)v13->_enterEditEventBuilder setAsset:v10];
    double v53 = objc_alloc_init(PUExitEditPerformanceEventBuilder);
    exitEditEventBuilder = v13->_exitEditEventBuilder;
    v13->_exitEditEventBuilder = v53;

    [(PUExitEditPerformanceEventBuilder *)v13->_exitEditEventBuilder setAsset:v10];
    uint64_t v55 = PXCheckAndNoteUseOfSystemSinceBoot();
    char v56 = PUCheckAndNoteFirstEntryIntoEditSinceLaunch_isFirstUseSinceLaunch;
    PUCheckAndNoteFirstEntryIntoEditSinceLaunch_isFirstUseSinceLaunch = 1;
    uint64_t v57 = [(PUPhotoEditViewController *)v13 enterEditEventBuilder];
    [v57 setFirstSinceBoot:v55];

    uint64_t v58 = [(PUPhotoEditViewController *)v13 enterEditEventBuilder];
    [v58 setFirstSinceLaunch:(v56 & 1) == 0];

    [(PUPhotoEditViewController *)v13 setFirstSinceBoot:v55];
    [(PUPhotoEditViewController *)v13 setFirstSinceLaunch:(v56 & 1) == 0];
    [(PUPhotoEditViewController *)v13 _didStartEnterEdit];
    BOOL v59 = +[PUPhotoEditSupport currentDeviceShouldAllowRawDecode];
    [MEMORY[0x1E4F7A4A0] setImageSourceDisableRAW:!v59];
    [MEMORY[0x1E4F8A288] disableApertureEffects:PECanRenderPortrait() ^ 1];
    objc_opt_class();
    v13->_isEmbeddedEdit = objc_opt_isKindOfClass() & 1;
    dispatch_queue_t v60 = dispatch_queue_create("PUPhotoEditViewController.smartCopyPasteQueue", 0);
    smartCopyPasteQueue = v13->_smartCopyPasteQueue;
    v13->_smartCopyPasteQueue = (OS_dispatch_queue *)v60;

    v74[0] = objc_opt_class();
    v74[1] = objc_opt_class();
    v74[2] = objc_opt_class();
    uint64_t v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
    id v63 = (id)[(PUPhotoEditViewController *)v13 registerForTraitChanges:v62 withAction:sel_traitEnvironment_didChangeTraitCollection_];

    id v11 = v66;
  }

  return v13;
}

void __74__PUPhotoEditViewController_initWithPhoto_mediaProvider_mediaDestination___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([a2 state] == 1)
  {
    uint64_t v5 = *(id *)(a1 + 32);
    uint64_t v6 = v5;
    os_signpost_id_t v7 = *(void *)(a1 + 48);
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v21) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EnterEdit", " enableTelemetry=YES ", (uint8_t *)&v21, 2u);
    }

    uint64_t v8 = *(id *)(a1 + 32);
    objc_super v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 48);
    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v8)) {
      goto LABEL_13;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    int v21 = 138412802;
    uint64_t v22 = v11;
    __int16 v23 = 2048;
    uint64_t v24 = v12;
    __int16 v25 = 2048;
    uint64_t v26 = v13;
    BOOL v14 = "Asset Filename=%@, Size:{%lu, %lu}";
    BOOL v15 = v9;
    os_signpost_type_t v16 = OS_SIGNPOST_EVENT;
    os_signpost_id_t v17 = v10;
    uint32_t v18 = 32;
    goto LABEL_12;
  }
  if (a3 != 1) {
    return;
  }
  long long v19 = *(id *)(a1 + 32);
  objc_super v9 = v19;
  os_signpost_id_t v20 = *(void *)(a1 + 48);
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v21) = 0;
    BOOL v14 = " enableTelemetry=YES ";
    BOOL v15 = v9;
    os_signpost_type_t v16 = OS_SIGNPOST_INTERVAL_END;
    os_signpost_id_t v17 = v20;
    uint32_t v18 = 2;
LABEL_12:
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v15, v16, v17, "EnterEdit", v14, (uint8_t *)&v21, v18);
  }
LABEL_13:
}

+ (id)_defaultMediaViewRenderPipelineFilters
{
  if (_defaultMediaViewRenderPipelineFilters_onceToken != -1) {
    dispatch_once(&_defaultMediaViewRenderPipelineFilters_onceToken, &__block_literal_global_912);
  }
  id v2 = (void *)_defaultMediaViewRenderPipelineFilters_defaultFilters;
  return v2;
}

void __67__PUPhotoEditViewController__defaultMediaViewRenderPipelineFilters__block_invoke()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A360] noMuteFilter];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  id v2 = (void *)_defaultMediaViewRenderPipelineFilters_defaultFilters;
  _defaultMediaViewRenderPipelineFilters_defaultFilters = v1;
}

+ (id)_defaultLivePhotoRenderPipelineFilters
{
  if (_defaultLivePhotoRenderPipelineFilters_onceToken != -1) {
    dispatch_once(&_defaultLivePhotoRenderPipelineFilters_onceToken, &__block_literal_global_910);
  }
  id v2 = (void *)_defaultLivePhotoRenderPipelineFilters_defaultFilters;
  return v2;
}

void __67__PUPhotoEditViewController__defaultLivePhotoRenderPipelineFilters__block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F8A360] noMuteFilter];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F8A360] noTrimFilter];
  v4[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  double v3 = (void *)_defaultLivePhotoRenderPipelineFilters_defaultFilters;
  _defaultLivePhotoRenderPipelineFilters_defaultFilters = v2;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

+ (void)preheatEditDependenciesIfNeeded
{
  if (preheatEditDependenciesIfNeeded_onceToken != -1) {
    dispatch_once(&preheatEditDependenciesIfNeeded_onceToken, &__block_literal_global_61600);
  }
}

void __60__PUPhotoEditViewController_preheatEditDependenciesIfNeeded__block_invoke()
{
  if (PLIsMobileSlideShow())
  {
    id v0 = [MEMORY[0x1E4F905E0] sharedScheduler];
    [v0 scheduleTaskWithQoS:1 block:&__block_literal_global_251];
  }
}

void __60__PUPhotoEditViewController_preheatEditDependenciesIfNeeded__block_invoke_2()
{
  id v0 = PLPhotoEditGetLog();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v0, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EditPrewarm", "", buf, 2u);
  }
  [MEMORY[0x1E4F8A358] preheatEditDependencies];
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AE9F8000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EditPrewarm", "", v1, 2u);
  }
}

@end