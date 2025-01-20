@interface PUCleanupToolController
- (BOOL)_canReset;
- (BOOL)_enableFeedback;
- (BOOL)_showFeedbackThumbs;
- (BOOL)canBecomeActiveTool;
- (BOOL)isAwaitingMediaView;
- (BOOL)isBusy;
- (BOOL)isIpadLayout;
- (BOOL)isPortrait;
- (BOOL)isZooming;
- (BOOL)modelDeliveryProgressInErrorState;
- (BOOL)needsHDRUI;
- (BOOL)supportsGesturesOfType:(unint64_t)a3;
- (BOOL)wantsTapToToggleOriginalEnabled;
- (BOOL)wantsZoomAndPanEnabled;
- (CGPoint)originalPointFromOverlayViewPoint:(CGPoint)a3;
- (CGPoint)transformedPoint:(CGPoint)a3;
- (CGSize)imageSize;
- (NSArray)feedbackViewContainerConstraints;
- (NSArray)modelDeliveryProgressConstraints;
- (NSNumber)savedMediaViewScrollViewMinimumNumberOfTouches;
- (PEModelDeliveryManager)modelDeliveryManager;
- (PIInpaintMaskContext)maskContext;
- (PISensitiveContentAnalysisRequest)sensitivityRequest;
- (PLImageGeometry)geometry;
- (PLPhotoEditRenderer)renderer;
- (PUCleanupToolController)initWithCoder:(id)a3;
- (PUCleanupToolController)initWithNibName:(id)a3 bundle:(id)a4;
- (PUCleanupToolFaceRectsView)faceRectsView;
- (PUCleanupToolMaskView)maskView;
- (PUPhotoEditToolbarButton)brushModeButton;
- (PXEditCleanupFeedbackActionPerformer)feedbackActionPerformer;
- (PXModelDeliveryProgressObjCViewController)modelDeliveryProgressViewController;
- (UIButton)feedbackThumbsDownButton;
- (UIButton)feedbackThumbsUpButton;
- (UIView)feedbackViewContainer;
- (double)currentRenderViewWidth;
- (double)progressDelay;
- (double)subjectExclusionMaskBrushRadiusForScreenSpaceRadius:(double)a3;
- (float)brushRadiusForTouchType:(int64_t)a3;
- (float)scaledBrushRadiusForTouchType:(int64_t)a3;
- (id)_createSubjectExclusionMask;
- (id)_newOverlayMask;
- (id)brushStrokeExclusionMaskForStrokeStartingAtImageSpacePoint:(CGPoint)a3 withRadius:(double)a4;
- (id)centerToolbarView;
- (id)cleanupActionNames;
- (id)feedbackView;
- (id)internalToolActionsForMenu;
- (id)localizedName;
- (id)selectedToolbarIconGlyphName;
- (id)sourceImageOfSize:(CGSize)a3;
- (id)toolActionsForMenu;
- (id)toolbarIconAccessibilityLabel;
- (id)toolbarIconGlyphName;
- (id)trailingToolbarViews;
- (id)transformedImage:(id)a3 error:(id *)a4;
- (id)transformedImageForBrushStrokeExclusionMask:(id)a3;
- (int64_t)currentLayoutStyle;
- (int64_t)segmentationCount;
- (int64_t)toolControllerTag;
- (unint64_t)cleanupMode;
- (void)_addImageSpaceInpaintingStroke:(id)a3 closeAndFillStroke:(BOOL)a4 needsPixellation:(BOOL)a5 recordStroke:(BOOL)a6 exclusionMask:(id)a7 exclusionMaskHitTestRadius:(double)a8 completion:(id)a9;
- (void)_addOverlayIfNeeded;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_brushModeButtonTapped:(id)a3;
- (void)_createFaceRectsView;
- (void)_createMaskView;
- (void)_createRendererIfNeeded;
- (void)_createVFXMaskOverlays;
- (void)_didRedo:(id)a3;
- (void)_didUndo:(id)a3;
- (void)_displayProcessingWithSelectedMask:(id)a3 unselectedMaskImage:(id)a4 exclusionMasks:(id)a5 point:(CGPoint)a6;
- (void)_displayProcessingWithSelectedMaskImage:(id)a3 unselectedMaskImage:(id)a4 exclusionMasks:(id)a5 point:(CGPoint)a6;
- (void)_handleOperationExceedsSizeLimit;
- (void)_prepareViewsForCleanupIfReady;
- (void)_prepareViewsForCleanupIfReadyAndNotify:(id)a3;
- (void)_removePreparingProgress;
- (void)_reportFeedbackAction:(unint64_t)a3;
- (void)_resetTapped:(id)a3;
- (void)_setAwaitingMediaView:(BOOL)a3;
- (void)_setBusy:(BOOL)a3;
- (void)_setBusy:(BOOL)a3 withDelay:(double)a4;
- (void)_setCleanupMode:(unint64_t)a3;
- (void)_setShowCleanupBrushSizeSlider:(id)a3 show:(BOOL)a4 animate:(BOOL)a5;
- (void)_setupCleanupBrushSizeSlider:(id)a3 label:(id)a4;
- (void)_setupCleanupBrushSizeSliders;
- (void)_setupCleanupControls;
- (void)_setupResetButton;
- (void)_showCleanupBrushSizeSlider:(id)a3 label:(id)a4 show:(BOOL)a5;
- (void)_showPreparingProgress;
- (void)_updateFaceRectsView;
- (void)_updateFeedbackViewVisibility;
- (void)_updateMaskContext;
- (void)_updateMaskViewForBrushMode;
- (void)_updateMaskViewForDefaultMode;
- (void)_updateMaskViewForDefaultModeIfNecessary;
- (void)_updateMaskViewWithUnselectedMaskImage:(id)a3 foregroundMasks:(id)a4 backgroundMasks:(id)a5;
- (void)_updatePreparingProgressConstraints;
- (void)_updateResetButtonState;
- (void)_updateToolConstraints;
- (void)_updateVFXMaskOverlayWithSelectedMask:(id)a3 point:(CGPoint)a4;
- (void)addAttachmentsForTapToRadar:(id)a3;
- (void)addDeclutter;
- (void)addImageSpaceInpaintingStroke:(id)a3 exclusionMask:(id)a4 closeAndFillStroke:(BOOL)a5 needsPixellation:(BOOL)a6 recordStroke:(BOOL)a7 completion:(id)a8;
- (void)addObjectRemovalAtImageSpacePoint:(CGPoint)a3 completion:(id)a4;
- (void)addObjectRemovalAtPoint:(CGPoint)a3;
- (void)addObjectRemovalUsingImageSpaceStroke:(id)a3 exclusionMask:(id)a4 completion:(id)a5;
- (void)addObjectRemovalUsingStroke:(id)a3 exclusionMask:(id)a4;
- (void)addStroke:(id)a3 closeAndFillStroke:(BOOL)a4;
- (void)addUserPromptViewOfType:(unint64_t)a3 animated:(BOOL)a4;
- (void)checkPotentialInpaintOperation:(id)a3 handler:(id)a4;
- (void)compositionControllerDidChangeForAdjustments:(id)a3;
- (void)createAllAvailableMasks:(id)a3;
- (void)deleteUserPromptViewAnimated:(BOOL)a3 completion:(id)a4;
- (void)didBecomeActiveTool;
- (void)didResignActiveTool;
- (void)fadeOutBrushStrokeWithDuration:(double)a3;
- (void)feedbackThumbsButtonAction:(id)a3;
- (void)hidePromptViewIfNeeded;
- (void)leavingEditWithCancel;
- (void)mediaView:(id)a3 didZoom:(double)a4;
- (void)mediaViewDidEndZooming:(id)a3;
- (void)mediaViewDidScroll:(id)a3;
- (void)mediaViewIsReady;
- (void)mediaViewWillBeginZooming:(id)a3;
- (void)modifyInpaintAdjustmentWithBlock:(id)a3 actionStringKey:(id)a4 completion:(id)a5;
- (void)ppt_replayCleanupBrushStrokeWithCompletionBlock:(id)a3;
- (void)prepareForSave:(BOOL)a3;
- (void)previewingOriginalDidStart;
- (void)previewingOriginalDidStop;
- (void)redoInitiated:(id)a3;
- (void)reloadToolbarButtons:(BOOL)a3;
- (void)replayBrushstrokesWithCompletion:(id)a3;
- (void)setBrushModeButton:(id)a3;
- (void)setCleanupMode:(unint64_t)a3;
- (void)setFaceRectsView:(id)a3;
- (void)setFeedbackActionPerformer:(id)a3;
- (void)setFeedbackThumbsDownButton:(id)a3;
- (void)setFeedbackThumbsUpButton:(id)a3;
- (void)setFeedbackViewContainer:(id)a3;
- (void)setFeedbackViewContainerConstraints:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setIsZooming:(BOOL)a3;
- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4;
- (void)setMaskContext:(id)a3;
- (void)setMaskView:(id)a3;
- (void)setModelDeliveryManager:(id)a3;
- (void)setModelDeliveryProgressConstraints:(id)a3;
- (void)setModelDeliveryProgressInErrorState:(BOOL)a3;
- (void)setModelDeliveryProgressViewController:(id)a3;
- (void)setNeedsHDRUI:(BOOL)a3;
- (void)setProgressDelay:(double)a3;
- (void)setRenderer:(id)a3;
- (void)setSavedMediaViewScrollViewMinimumNumberOfTouches:(id)a3;
- (void)setSensitivityRequest:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6;
- (void)sliderDidEndScrolling:(id)a3;
- (void)sliderDidScroll:(id)a3;
- (void)sliderWillBeginScrolling:(id)a3;
- (void)toolControllerWantsToShowOriginal:(BOOL)a3;
- (void)undoInitiated:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBecomeActiveTool;
- (void)willResignActiveTool;
@end

@implementation PUCleanupToolController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackViewContainerConstraints, 0);
  objc_storeStrong((id *)&self->_feedbackThumbsDownButton, 0);
  objc_storeStrong((id *)&self->_feedbackThumbsUpButton, 0);
  objc_storeStrong((id *)&self->_feedbackViewContainer, 0);
  objc_storeStrong((id *)&self->_feedbackActionPerformer, 0);
  objc_storeStrong((id *)&self->_savedMediaViewScrollViewMinimumNumberOfTouches, 0);
  objc_storeStrong((id *)&self->_faceRectsView, 0);
  objc_storeStrong((id *)&self->_modelDeliveryProgressConstraints, 0);
  objc_storeStrong((id *)&self->_modelDeliveryProgressViewController, 0);
  objc_storeStrong((id *)&self->_modelDeliveryManager, 0);
  objc_storeStrong((id *)&self->_brushModeButton, 0);
  objc_storeStrong((id *)&self->_sensitivityRequest, 0);
  objc_storeStrong((id *)&self->_maskContext, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_tasksWaitingOnCleanupReady, 0);
  objc_storeStrong((id *)&self->_retouchVFXOverlay, 0);
  objc_storeStrong((id *)&self->_resetButton, 0);
  objc_storeStrong((id *)&self->_defaultModeBrushSizeLabel, 0);
  objc_storeStrong((id *)&self->_defaultModeBrushSizeSlider, 0);
  objc_storeStrong((id *)&self->_brushModeBrushSizeLabel, 0);
  objc_storeStrong((id *)&self->_brushModeBrushSizeSlider, 0);
  objc_storeStrong((id *)&self->_userPromptViewTimer, 0);
  objc_storeStrong((id *)&self->_userPromptViewConstraints, 0);
  objc_storeStrong((id *)&self->_userPromptView, 0);
  objc_storeStrong((id *)&self->_overlayConstraints, 0);
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_toolConstraints, 0);
}

- (void)setFeedbackViewContainerConstraints:(id)a3
{
}

- (NSArray)feedbackViewContainerConstraints
{
  return self->_feedbackViewContainerConstraints;
}

- (void)setFeedbackThumbsDownButton:(id)a3
{
}

- (UIButton)feedbackThumbsDownButton
{
  return self->_feedbackThumbsDownButton;
}

- (void)setFeedbackThumbsUpButton:(id)a3
{
}

- (UIButton)feedbackThumbsUpButton
{
  return self->_feedbackThumbsUpButton;
}

- (void)setFeedbackViewContainer:(id)a3
{
}

- (UIView)feedbackViewContainer
{
  return self->_feedbackViewContainer;
}

- (void)setFeedbackActionPerformer:(id)a3
{
}

- (void)setSavedMediaViewScrollViewMinimumNumberOfTouches:(id)a3
{
}

- (NSNumber)savedMediaViewScrollViewMinimumNumberOfTouches
{
  return self->_savedMediaViewScrollViewMinimumNumberOfTouches;
}

- (void)setFaceRectsView:(id)a3
{
}

- (PUCleanupToolFaceRectsView)faceRectsView
{
  return self->_faceRectsView;
}

- (void)setModelDeliveryProgressInErrorState:(BOOL)a3
{
  self->_modelDeliveryProgressInErrorState = a3;
}

- (BOOL)modelDeliveryProgressInErrorState
{
  return self->_modelDeliveryProgressInErrorState;
}

- (void)setModelDeliveryProgressConstraints:(id)a3
{
}

- (NSArray)modelDeliveryProgressConstraints
{
  return self->_modelDeliveryProgressConstraints;
}

- (void)setModelDeliveryProgressViewController:(id)a3
{
}

- (PXModelDeliveryProgressObjCViewController)modelDeliveryProgressViewController
{
  return self->_modelDeliveryProgressViewController;
}

- (void)setModelDeliveryManager:(id)a3
{
}

- (PEModelDeliveryManager)modelDeliveryManager
{
  return self->_modelDeliveryManager;
}

- (void)setBrushModeButton:(id)a3
{
}

- (PUPhotoEditToolbarButton)brushModeButton
{
  return self->_brushModeButton;
}

- (void)setIsZooming:(BOOL)a3
{
  self->_isZooming = a3;
}

- (BOOL)isZooming
{
  return self->_isZooming;
}

- (void)setNeedsHDRUI:(BOOL)a3
{
  self->_needsHDRUI = a3;
}

- (BOOL)needsHDRUI
{
  return self->_needsHDRUI;
}

- (void)setSensitivityRequest:(id)a3
{
}

- (PISensitiveContentAnalysisRequest)sensitivityRequest
{
  return self->_sensitivityRequest;
}

- (void)setMaskContext:(id)a3
{
}

- (PIInpaintMaskContext)maskContext
{
  return self->_maskContext;
}

- (void)setRenderer:(id)a3
{
}

- (PLPhotoEditRenderer)renderer
{
  return self->_renderer;
}

- (void)setGeometry:(id)a3
{
}

- (void)setMaskView:(id)a3
{
}

- (PUCleanupToolMaskView)maskView
{
  return self->_maskView;
}

- (void)_setAwaitingMediaView:(BOOL)a3
{
  self->_awaitingMediaView = a3;
}

- (BOOL)isAwaitingMediaView
{
  return self->_awaitingMediaView;
}

- (void)setCleanupMode:(unint64_t)a3
{
  self->_cleanupMode = a3;
}

- (unint64_t)cleanupMode
{
  return self->_cleanupMode;
}

- (void)setProgressDelay:(double)a3
{
  self->_progressDelay = a3;
}

- (double)progressDelay
{
  return self->_progressDelay;
}

- (BOOL)isBusy
{
  return self->_busy;
}

- (void)_createFaceRectsView
{
  if (!self->_faceRectsView)
  {
    if (!self->_retouchVFXOverlay)
    {
      v3 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1AE9F8000, v3, OS_LOG_TYPE_ERROR, "Cleanup: _retouchVFXOverlay not present for _createFaceRectsView", v10, 2u);
      }
    }
    v4 = [PUCleanupToolFaceRectsView alloc];
    v5 = [(PUPhotoEditToolController *)self delegate];
    v6 = [v5 mediaView];
    v7 = [(PUCleanupToolFaceRectsView *)v4 initWithMediaView:v6 isHDR:self->_needsHDRUI delegate:self];
    faceRectsView = self->_faceRectsView;
    self->_faceRectsView = v7;

    [(PUCleanupToolFaceRectsView *)self->_faceRectsView setUserInteractionEnabled:0];
    [(PUCleanupToolFaceRectsView *)self->_faceRectsView setBackgroundColor:0];
    v9 = [(PUCleanupToolController *)self view];
    [v9 insertSubview:self->_faceRectsView aboveSubview:self->_retouchVFXOverlay];

    [(PUCleanupToolFaceRectsView *)self->_faceRectsView setTranslatesAutoresizingMaskIntoConstraints:0];
  }
}

- (void)_updateFaceRectsView
{
  v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 retouchShowsFaceRects];

  if (v4)
  {
    faceRectsView = self->_faceRectsView;
    id v7 = [(PIInpaintMaskContext *)self->_maskContext detectedFaces];
    v6 = [(PUPhotoEditToolController *)self compositionController];
    -[PUCleanupToolFaceRectsView updateDetectedFaces:imageOrientation:](faceRectsView, "updateDetectedFaces:imageOrientation:", v7, [v6 imageOrientation]);
  }
}

- (id)sourceImageOfSize:(CGSize)a3
{
  v3 = [(PUPhotoEditToolController *)self delegate];
  int v4 = [v3 mediaView];

  v5 = [v4 snapshotImage];

  return v5;
}

- (void)fadeOutBrushStrokeWithDuration:(double)a3
{
}

- (double)currentRenderViewWidth
{
  v2 = [(PUPhotoEditToolController *)self delegate];
  v3 = [v2 mediaView];

  int v4 = [v3 _renderView];
  [v4 frame];
  double v6 = v5;

  return v6;
}

- (int64_t)currentLayoutStyle
{
  v2 = [(PUPhotoEditToolController *)self photoEditSpec];
  int64_t v3 = [v2 currentLayoutStyle];

  return v3;
}

- (BOOL)_enableFeedback
{
  v2 = [(PUCleanupToolController *)self feedbackActionPerformer];
  char v3 = [v2 didLoadInjectedActionPerformer];

  return v3;
}

- (BOOL)_showFeedbackThumbs
{
  char v3 = MEMORY[0x1B3E7A510](self, a2);
  int v4 = +[PUPhotoEditProtoSettings sharedInstance];
  char v5 = [v4 feedbackUIFCS];

  return [(PUCleanupToolController *)self _enableFeedback] & ~v5 & v3;
}

- (void)_updateFeedbackViewVisibility
{
  char v3 = [(PUCleanupToolController *)self feedbackView];
  if (v3)
  {
    int v4 = [(PUPhotoEditToolController *)self delegate];
    char v5 = [v4 mediaView];

    [(PUCleanupUserPromptView *)self->_userPromptView alpha];
    BOOL v8 = v6 <= 0.0 && !self->_isZooming;
    [v5 zoomScale];
    double v10 = v9;
    [v5 minimumZoomScale];
    BOOL v12 = vabdd_f64(v10, v11) <= 0.01 && v8;
    v13 = [(PUPhotoEditToolController *)self compositionController];
    v14 = [v13 inpaintAdjustmentController];
    int v15 = [v14 enabled];

    v16 = [(PUCleanupToolController *)self feedbackView];
    LODWORD(v13) = [v16 isHidden];

    if ((v15 & v12) == v13)
    {
      id v17 = v3;
      PLDispatchOnMainQueue();
    }
  }
}

void __56__PUCleanupToolController__updateFeedbackViewVisibility__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PUCleanupToolController__updateFeedbackViewVisibility__block_invoke_2;
  v6[3] = &unk_1E5F2E120;
  id v7 = *(id *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PUCleanupToolController__updateFeedbackViewVisibility__block_invoke_3;
  v3[3] = &unk_1E5F2BA20;
  id v4 = *(id *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  [v2 animateWithDuration:0 delay:v6 options:v3 animations:0.2 completion:0.0];
}

uint64_t __56__PUCleanupToolController__updateFeedbackViewVisibility__block_invoke_2(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __56__PUCleanupToolController__updateFeedbackViewVisibility__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (id)feedbackView
{
  v32[1] = *MEMORY[0x1E4F143B8];
  if (![(PUCleanupToolController *)self _showFeedbackThumbs]) {
    goto LABEL_6;
  }
  char v3 = [(PUCleanupToolController *)self feedbackViewContainer];

  if (v3)
  {
    id v4 = [(PUCleanupToolController *)self feedbackViewContainer];
    goto LABEL_7;
  }
  if ([(PUCleanupToolController *)self _enableFeedback])
  {
    char v5 = (void *)MEMORY[0x1E4FB1830];
    double v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    v32[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    char v8 = [v5 configurationWithPaletteColors:v7];

    double v9 = [MEMORY[0x1E4FB1830] configurationWithScale:2];
    double v10 = [v8 configurationByApplyingConfiguration:v9];

    double v11 = [(PUCleanupToolController *)self feedbackActionPerformer];
    BOOL v12 = [v11 actionIconForFeedbackType:1 hasResponse:0];

    v13 = [(PUCleanupToolController *)self feedbackActionPerformer];
    v14 = [v13 actionIconForFeedbackType:2 hasResponse:0];

    int v15 = (void *)MEMORY[0x1E4FB14D0];
    v16 = [v12 imageWithConfiguration:v10];
    id v17 = [v15 systemButtonWithImage:v16 target:self action:sel_feedbackThumbsButtonAction_];

    v18 = (void *)MEMORY[0x1E4FB14D0];
    v19 = [v14 imageWithConfiguration:v10];
    v20 = [v18 systemButtonWithImage:v19 target:self action:sel_feedbackThumbsButtonAction_];

    id v21 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [v21 addSubview:v17];
    [v21 addSubview:v20];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    v22 = +[PUInterfaceManager currentTheme];
    v23 = [v22 photoEditingFeedbackPlatterColor];
    [v21 setBackgroundColor:v23];

    v24 = [v21 layer];
    LODWORD(v25) = 1039516303;
    [v24 setShadowOpacity:v25];

    v26 = [v21 layer];
    objc_msgSend(v26, "setShadowOffset:", 0.0, 2.0);

    v27 = [v21 layer];
    [v27 setShadowRadius:8.0];

    uint64_t v28 = *MEMORY[0x1E4F39EA8];
    v29 = [v21 layer];
    [v29 setCornerCurve:v28];

    [v21 setAlpha:0.0];
    [(PUCleanupToolController *)self setFeedbackViewContainer:v21];
    [(PUCleanupToolController *)self setFeedbackThumbsUpButton:v17];
    [(PUCleanupToolController *)self setFeedbackThumbsDownButton:v20];
    v30 = [(PUCleanupToolController *)self view];
    [v30 addSubview:v21];

    id v4 = [(PUCleanupToolController *)self feedbackViewContainer];
  }
  else
  {
LABEL_6:
    id v4 = 0;
  }
LABEL_7:
  return v4;
}

- (void)hidePromptViewIfNeeded
{
  if (([(PUCleanupUserPromptView *)self->_userPromptView isHidden] & 1) == 0)
  {
    self->_promptViewWasHidden = 1;
    PLDispatchOnMainQueue();
  }
}

uint64_t __49__PUCleanupToolController_hidePromptViewIfNeeded__block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PUCleanupToolController_hidePromptViewIfNeeded__block_invoke_2;
  v4[3] = &unk_1E5F2ED10;
  uint64_t v5 = *(void *)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__PUCleanupToolController_hidePromptViewIfNeeded__block_invoke_3;
  v3[3] = &unk_1E5F2CEE8;
  void v3[4] = v5;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v4 options:v3 animations:0.2 completion:0.0];
  return [*(id *)(a1 + 32) _updateFeedbackViewVisibility];
}

uint64_t __49__PUCleanupToolController_hidePromptViewIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:0.0];
}

uint64_t __49__PUCleanupToolController_hidePromptViewIfNeeded__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteUserPromptViewAnimated:0 completion:0];
}

- (void)deleteUserPromptViewAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5F2EA60;
  aBlock[4] = self;
  id v7 = v6;
  id v15 = v7;
  char v8 = _Block_copy(aBlock);
  double v9 = v8;
  if (v4)
  {
    [(PUCleanupUserPromptView *)self->_userPromptView setAlpha:1.0];
    double v10 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke_2;
    v13[3] = &unk_1E5F2ED10;
    v13[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke_3;
    v11[3] = &unk_1E5F2D990;
    id v12 = v9;
    [v10 animateWithDuration:0 delay:v13 options:v11 animations:0.2 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v8 + 2))(v8);
  }
}

uint64_t __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1208))
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 1208);
    *(void *)(v3 + 1208) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void **)(v2 + 1200);
  if (v5)
  {
    [v5 removeFromSuperview];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 1200);
    *(void *)(v6 + 1200) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  [*(id *)(v2 + 1216) invalidate];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

uint64_t __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:0.0];
}

uint64_t __67__PUCleanupToolController_deleteUserPromptViewAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addUserPromptViewOfType:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  userPromptView = self->_userPromptView;
  if (!userPromptView || [(PUCleanupUserPromptView *)userPromptView type] != a3)
  {
    [(PUCleanupToolController *)self deleteUserPromptViewAnimated:0 completion:0];
    char v8 = [[PUCleanupUserPromptView alloc] initWithType:a3];
    double v9 = self->_userPromptView;
    self->_userPromptView = v8;

    [(PUCleanupUserPromptView *)self->_userPromptView setLayoutDelegate:self];
    [(PUCleanupUserPromptView *)self->_userPromptView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUCleanupUserPromptView *)self->_userPromptView setUserInteractionEnabled:0];
    double v10 = [(PUCleanupToolController *)self view];
    [v10 addSubview:self->_userPromptView];

    [(PUCleanupUserPromptView *)self->_userPromptView enableAnimation:1];
    double v11 = [(PUCleanupToolController *)self view];
    [v11 setNeedsUpdateConstraints];

    if (a3 - 3 <= 1)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke;
      v17[3] = &unk_1E5F2D570;
      v17[4] = self;
      id v12 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:0 repeats:v17 block:3.0];
      userPromptViewTimer = self->_userPromptViewTimer;
      self->_userPromptViewTimer = v12;

      v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v14 addTimer:self->_userPromptViewTimer forMode:*MEMORY[0x1E4F1C4B0]];
    }
    if (v4)
    {
      [(PUCleanupUserPromptView *)self->_userPromptView setAlpha:0.0];
      v15[4] = self;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_3;
      v16[3] = &unk_1E5F2ED10;
      v16[4] = self;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_4;
      v15[3] = &unk_1E5F2CEE8;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v16 animations:v15 completion:0.2];
    }
    [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
  }
}

uint64_t __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_2;
  v3[3] = &unk_1E5F2ED10;
  void v3[4] = v1;
  return [v1 deleteUserPromptViewAnimated:1 completion:v3];
}

uint64_t __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1200) setAlpha:1.0];
}

uint64_t __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFeedbackViewVisibility];
}

uint64_t __60__PUCleanupToolController_addUserPromptViewOfType_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateFeedbackViewVisibility];
}

- (PLImageGeometry)geometry
{
  geometry = self->_geometry;
  if (!geometry)
  {
    BOOL v4 = [(PUPhotoEditToolController *)self compositionController];
    uint64_t v5 = [v4 imageOrientation];

    id v6 = objc_alloc(MEMORY[0x1E4F8A880]);
    [(PUCleanupToolController *)self imageSize];
    id v7 = (PLImageGeometry *)objc_msgSend(v6, "initWithInputSize:inputOrientation:", v5);
    char v8 = self->_geometry;
    self->_geometry = v7;

    geometry = self->_geometry;
  }
  double v9 = geometry;
  return v9;
}

- (CGSize)imageSize
{
  [(PUCleanupToolController *)self _createRendererIfNeeded];
  uint64_t v3 = [(PUCleanupToolController *)self renderer];
  BOOL v4 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v5 = [v4 composition];
  id v6 = [MEMORY[0x1E4F8A358] pipelineFiltersForCropping];
  id v7 = [v3 getGeometryForComposition:v5 pipelineFilters:v6];

  [v7 size];
  NUPixelSizeToCGSize();
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGPoint)transformedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PUPhotoEditToolController *)self delegate];
  objc_msgSend(v6, "toolController:viewPointFromOriginalPoint:view:", 0, self->_maskView, x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (id)transformedImage:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x1E4F7A790];
  id v7 = a3;
  double v8 = [(PUPhotoEditToolController *)self compositionController];
  double v9 = [v8 composition];
  [(PUCleanupToolController *)self imageSize];
  double v10 = objc_msgSend(v6, "transformedImage:forComposition:imageSize:error:", v7, v9, a4);

  return v10;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5 = a4;
  NSLog(&cfstr_VfxSettingsCha.isa, v5);
  int v6 = [v5 isEqualToString:@"retouchShowVFXControls"];

  if (v6)
  {
    id v7 = +[PUPhotoEditProtoSettings sharedInstance];
    int v8 = [v7 retouchShowVFXControls];

    if (v8)
    {
      retouchVFXOverladouble y = self->_retouchVFXOverlay;
      [(PUVFXRetouchOverlay *)retouchVFXOverlay showControlsInViewController:self];
    }
  }
}

- (void)ppt_replayCleanupBrushStrokeWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__PUCleanupToolController_ppt_replayCleanupBrushStrokeWithCompletionBlock___block_invoke;
  v6[3] = &unk_1E5F2EA60;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PUCleanupToolController *)self _prepareViewsForCleanupIfReadyAndNotify:v6];
}

void __75__PUCleanupToolController_ppt_replayCleanupBrushStrokeWithCompletionBlock___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__PUCleanupToolController_ppt_replayCleanupBrushStrokeWithCompletionBlock___block_invoke_2;
  v4[3] = &unk_1E5F2EA60;
  uint64_t v3 = *(void **)(a1 + 40);
  void v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __75__PUCleanupToolController_ppt_replayCleanupBrushStrokeWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) replayBrushstrokesWithCompletion:*(void *)(a1 + 40)];
}

- (void)addAttachmentsForTapToRadar:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUCleanupToolController *)self maskContext];
  int v6 = [v5 segmentationResult];

  uint64_t v7 = [v6 foregroundInstances];
  v58 = v6;
  uint64_t v8 = [v6 backgroundInstances];
  double v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v10 = [v9 temporaryDirectory];
  double v11 = [MEMORY[0x1E4F29128] UUID];
  double v12 = [v11 UUIDString];
  double v13 = [v10 URLByAppendingPathComponent:v12 isDirectory:1];

  DeviceGradouble y = CGColorSpaceCreateDeviceGray();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__PUCleanupToolController_addAttachmentsForTapToRadar___block_invoke;
  aBlock[3] = &unk_1E5F24C70;
  id v55 = v13;
  id v69 = v55;
  id v59 = v9;
  id v70 = v59;
  v71 = self;
  v72 = DeviceGray;
  id v15 = (void (**)(void *, uint64_t, __CFString *))_Block_copy(aBlock);
  v16 = v15;
  if (v7)
  {
    id v17 = v15[2](v15, v7, @"foreground");
    [v4 addAttachment:v17];
  }
  if (v8)
  {
    v18 = v16[2](v16, v8, @"background");
    [v4 addAttachment:v18];
  }
  v56 = (void *)v8;
  CGColorSpaceRelease(DeviceGray);
  v19 = [MEMORY[0x1E4F8A2C0] globalSettings];
  if ([v19 inpaintDumpsOriginalMasks]) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = [MEMORY[0x1E4F7A4A0] inpaintDumpsInputImages];
  }
  v54 = v16;

  id v21 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v22 = [v21 retouchDumpsCoreImageInputs];

  v57 = (void *)v7;
  if (!v20 || (v22 & 1) == 0)
  {
    v23 = [MEMORY[0x1E4F8A2C0] globalSettings];
    [v23 setInpaintDumpsOriginalMasks:1];

    v24 = +[PUPhotoEditProtoSettings sharedInstance];
    [v24 setRetouchDumpsCoreImageInputs:1];

    id v25 = objc_alloc(MEMORY[0x1E4F7A3B8]);
    v26 = [(PUPhotoEditToolController *)self compositionController];
    v27 = [v26 composition];
    uint64_t v28 = (void *)[v25 initWithComposition:v27];

    id v67 = 0;
    v29 = [v28 submitSynchronous:&v67];
    id v30 = v67;
    if (!v29)
    {
      v31 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v75 = v30;
        _os_log_impl(&dword_1AE9F8000, v31, OS_LOG_TYPE_ERROR, "Cleanup: Could not re-render composition to collect TTR debug images. %@", buf, 0xCu);
      }
    }
    v32 = [MEMORY[0x1E4F8A2C0] globalSettings];
    [v32 setInpaintDumpsOriginalMasks:v20];

    v33 = +[PUPhotoEditProtoSettings sharedInstance];
    [v33 setRetouchDumpsCoreImageInputs:v22];
  }
  v34 = (void *)MEMORY[0x1E4F1CB10];
  v35 = NSTemporaryDirectory();
  uint64_t v36 = [v34 fileURLWithPath:v35];

  v37 = objc_msgSend(NSString, "stringWithFormat:", @"%d", getpid());
  v53 = (void *)v36;
  v38 = [v59 enumeratorAtURL:v36 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:1 errorHandler:0];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v63 objects:v73 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v64 != v41) {
          objc_enumerationMutation(v38);
        }
        v43 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        v44 = [v43 path];
        v45 = [v44 lastPathComponent];

        if ([v45 hasPrefix:v37]
          && [v45 containsString:@"inpaint"])
        {
          [v4 addAttachment:v43];
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v63 objects:v73 count:16];
    }
    while (v40);
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __55__PUCleanupToolController_addAttachmentsForTapToRadar___block_invoke_277;
  v60[3] = &unk_1E5F2A1F8;
  id v61 = v59;
  id v62 = v4;
  id v46 = v4;
  id v47 = v59;
  v48 = (void (**)(void *, void *))_Block_copy(v60);
  v49 = [MEMORY[0x1E4F7A4A0] tempDir];
  v50 = [v49 stringByAppendingPathComponent:@"input.heic"];
  v48[2](v48, v50);

  v51 = [v49 stringByAppendingPathComponent:@"inpaintMask.png"];
  v48[2](v48, v51);

  v52 = [v49 stringByAppendingPathComponent:@"exclusionMask.png"];
  v48[2](v48, v52);
}

id __55__PUCleanupToolController_addAttachmentsForTapToRadar___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 firstIndex];
  uint64_t v8 = [*(id *)(a1 + 32) URLByAppendingPathComponent:v6 isDirectory:1];
  [*(id *)(a1 + 40) createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:0];
  while (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v9 = (void *)MEMORY[0x1E4F8A2E8];
    double v10 = [*(id *)(a1 + 48) maskContext];
    id v20 = 0;
    double v11 = [v9 createMaskForInstance:v7 context:v10 maskIdentifierPrefix:@"identifier" error:&v20];
    id v12 = v20;

    if (v11)
    {
      double v13 = [NSString stringWithFormat:@"%@-%ld.jpg", v6, v7];
      v14 = [v8 URLByAppendingPathComponent:v13];

      id v15 = [v11 buffer];
      uint64_t v16 = [v15 CVPixelBuffer];

      id v17 = [MEMORY[0x1E4F1E018] context];
      v18 = [MEMORY[0x1E4F1E050] imageWithCVPixelBuffer:v16];
      [v17 writeJPEGRepresentationOfImage:v18 toURL:v14 colorSpace:*(void *)(a1 + 56) options:MEMORY[0x1E4F1CC08] error:0];
    }
    uint64_t v7 = [v5 indexGreaterThanIndex:v7];
  }
  return v8;
}

void __55__PUCleanupToolController_addAttachmentsForTapToRadar___block_invoke_277(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:"))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    [v3 addAttachment:v4];
  }
}

- (PXEditCleanupFeedbackActionPerformer)feedbackActionPerformer
{
  feedbackActionPerformer = self->_feedbackActionPerformer;
  if (!feedbackActionPerformer)
  {
    id v4 = (PXEditCleanupFeedbackActionPerformer *)[objc_alloc(MEMORY[0x1E4F901A8]) initWithViewController:self];
    id v5 = self->_feedbackActionPerformer;
    self->_feedbackActionPerformer = v4;

    feedbackActionPerformer = self->_feedbackActionPerformer;
  }
  return feedbackActionPerformer;
}

- (void)feedbackThumbsButtonAction:(id)a3
{
  id v8 = a3;
  id v4 = [(PUCleanupToolController *)self feedbackThumbsUpButton];

  if (v4 == v8)
  {
    uint64_t v7 = 1;
  }
  else
  {
    id v5 = [(PUCleanupToolController *)self feedbackThumbsDownButton];

    id v6 = v8;
    if (v5 != v8) {
      goto LABEL_6;
    }
    uint64_t v7 = 2;
  }
  [(PUCleanupToolController *)self _reportFeedbackAction:v7];
  id v6 = v8;
LABEL_6:
}

- (void)_reportFeedbackAction:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [(PUPhotoEditToolController *)self asset];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(PUPhotoEditToolController *)self asset];

    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F90158]);
      [v7 setIncludeOriginalRender:1];
      id v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F7A468]), "initWithTargetSize:", 1024.0, 1024.0);
      [v7 setScalePolicyForRenders:v8];

      double v9 = [(PUPhotoEditToolController *)self delegate];
      double v10 = [v9 editAssetDiagnostics];

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __49__PUCleanupToolController__reportFeedbackAction___block_invoke;
      v14[3] = &unk_1E5F24C48;
      id v15 = v10;
      uint64_t v16 = self;
      id v17 = v6;
      unint64_t v18 = a3;
      double v11 = v6;
      id v12 = v10;
      [v12 collectDiagnosticsWithOptions:v7 completion:v14];

      goto LABEL_7;
    }
  }
  else
  {
  }
  double v11 = PXAssertGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    double v13 = [(PUPhotoEditToolController *)self asset];
    *(_DWORD *)buf = 138412290;
    id v20 = v13;
    _os_log_error_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "reportAConcern activated when our asset is not a PHAsset (%@)", buf, 0xCu);
  }
LABEL_7:
}

void __49__PUCleanupToolController__reportFeedbackAction___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) diagnosticsPackage];
  uint64_t v3 = *MEMORY[0x1E4F90E98];
  id v15 = v2;
  id v4 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F90E98]];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    id v6 = [v15 objectForKeyedSubscript:v3];
    id v7 = (void *)[v5 initWithContentsOfURL:v6];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = *MEMORY[0x1E4F90EA0];
  double v9 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F90EA0]];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    double v11 = [v15 objectForKeyedSubscript:v8];
    id v12 = (void *)[v10 initWithContentsOfURL:v11];
  }
  else
  {
    id v12 = 0;
  }
  double v13 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F90E90]];
  v14 = [*(id *)(a1 + 40) feedbackActionPerformer];
  [v14 reportFeedbackWithType:*(void *)(a1 + 56) asset:*(void *)(a1 + 48) originalImageData:v7 renderedImageData:v12 summaryString:v13 completionHandler:&__block_literal_global_250];

  [*(id *)(a1 + 32) deleteCollectedFiles];
}

- (void)replayBrushstrokesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPhotoEditToolController *)self compositionController];
  [v5 modifyAdjustmentWithKey:*MEMORY[0x1E4F8A5B0] modificationBlock:&__block_literal_global_244];

  id v6 = [(PUPhotoEditToolController *)self compositionController];
  [v6 removeAdjustmentWithKey:*MEMORY[0x1E4F8A478]];

  id v7 = [(PUPhotoEditToolController *)self compositionController];
  [v7 removeAdjustmentWithKey:@"inpaintMasks"];

  uint64_t v8 = [(PUPhotoEditToolController *)self compositionController];
  id v13 = [v8 brushStrokeHistory];

  id v9 = objc_alloc_init(MEMORY[0x1E4F8A260]);
  id v10 = [(PUPhotoEditToolController *)self compositionController];
  [v10 setBrushStrokeHistory:v9];

  double v11 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v12 = [v11 retouchStrokeDisableObjectStrokes];

  [v13 playbackHistoryToReceiver:self options:v12 completion:v4];
}

void __60__PUCleanupToolController_replayBrushstrokesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEnabled:1];
  [v3 setIntensity:0.0];
  [v3 radius];
  [v3 setRadius:v2 + 0.00000001];
}

- (id)internalToolActionsForMenu
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPhotoEditToolController *)self compositionController];
  id v4 = [v3 brushStrokeHistory];
  uint64_t v5 = [v4 entryCount];

  if (v5)
  {
    id v6 = NSString;
    id v7 = [(PUPhotoEditToolController *)self compositionController];
    uint64_t v8 = [v7 brushStrokeHistory];
    objc_msgSend(v6, "stringWithFormat:", @"Replay %ld Brushstrokes", objc_msgSend(v8, "entryCount"));
    id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = @"Replay Brushstrokes";
  }
  id v10 = (void *)MEMORY[0x1E4FB13F0];
  double v11 = [MEMORY[0x1E4FB1818] systemImageNamed:@"paintbrush.pointed.fill"];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__PUCleanupToolController_internalToolActionsForMenu__block_invoke;
  v15[3] = &unk_1E5F2ADC0;
  v15[4] = self;
  uint64_t v12 = [v10 actionWithTitle:v9 image:v11 identifier:0 handler:v15];

  if (!v5) {
    [v12 setAttributes:1];
  }
  v16[0] = v12;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];

  return v13;
}

uint64_t __53__PUCleanupToolController_internalToolActionsForMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) replayBrushstrokesWithCompletion:&__block_literal_global_241];
}

- (id)toolActionsForMenu
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(PUCleanupToolController *)self _showFeedbackThumbs]
    || ![(PUCleanupToolController *)self _enableFeedback])
  {
    id v7 = 0;
  }
  else
  {
    id v3 = PULocalizedString(@"PHOTOEDIT_CLEANUP_FEEDBACK");
    id v4 = [(PUCleanupToolController *)self feedbackActionPerformer];
    uint64_t v5 = [v4 actionIconForFeedbackType:3 hasResponse:0];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__PUCleanupToolController_toolActionsForMenu__block_invoke;
    v9[3] = &unk_1E5F2ADC0;
    v9[4] = self;
    id v6 = [MEMORY[0x1E4FB13F0] actionWithTitle:v3 image:v5 identifier:0 handler:v9];
    v10[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  }
  return v7;
}

uint64_t __45__PUCleanupToolController_toolActionsForMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reportFeedbackAction:3];
}

- (void)_applicationDidBecomeActive:(id)a3
{
  [(PUCleanupToolController *)self _prepareViewsForCleanupIfReady];
  id v4 = [(PUCleanupToolController *)self view];
  [v4 setNeedsUpdateConstraints];
}

- (void)_applicationWillResignActive:(id)a3
{
  [(PUCleanupOverlayViewController *)self->_overlayController removeBrushView];
  [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay removeFromSuperview];
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  self->_retouchVFXOverladouble y = 0;
}

- (void)_didRedo:(id)a3
{
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  uint64_t v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 composition];
  [(PUVFXRetouchOverlay *)retouchVFXOverlay didRenderComposition:v6];

  [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
}

- (void)_didUndo:(id)a3
{
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  uint64_t v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 composition];
  [(PUVFXRetouchOverlay *)retouchVFXOverlay didRenderComposition:v6];

  [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
}

- (void)redoInitiated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 redoMenuItemTitle];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(PUCleanupToolController *)self cleanupActionNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [v4 redoMenuTitleForUndoActionName:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if ([v5 isEqualToString:v11])
        {
          [(PUCleanupToolController *)self _setBusy:1 withDelay:1.25];
          uint64_t v12 = [(PUPhotoEditToolController *)self delegate];
          [v12 updateProgressIndicatorAnimated:1];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)undoInitiated:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 undoMenuItemTitle];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(PUCleanupToolController *)self cleanupActionNames];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = [v4 undoMenuTitleForUndoActionName:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if ([v5 isEqualToString:v11])
        {
          [(PUCleanupToolController *)self _setBusy:1 withDelay:1.25];
          uint64_t v12 = [(PUPhotoEditToolController *)self delegate];
          [v12 updateProgressIndicatorAnimated:1];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)cleanupActionNames
{
  v7[3] = *MEMORY[0x1E4F143B8];
  double v2 = PULocalizedString(@"PHOTOEDIT_CLEANUP_CLEAN_UP_ACTION_TITLE");
  v7[0] = v2;
  id v3 = PULocalizedString(@"PHOTOEDIT_CLEANUP_RESET_ACTION_TITLE");
  v7[1] = v3;
  id v4 = PULocalizedString(@"PHOTOEDIT_MAKE_KEY_FRAME_ACTION_TITLE");
  v7[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void)_createRendererIfNeeded
{
  id v3 = [(PUCleanupToolController *)self renderer];

  if (v3)
  {
    id v9 = [(PUPhotoEditToolController *)self compositionController];
    id v4 = [(PUCleanupToolController *)self renderer];
    uint64_t v5 = v4;
    id v6 = v9;
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x1E4F8AA60]);
    uint64_t v8 = [(PUPhotoEditToolController *)self editSource];
    id v9 = (id)[v7 initWithEditSource:v8 renderPriority:3];

    [(PUCleanupToolController *)self setRenderer:v9];
    uint64_t v5 = [(PUPhotoEditToolController *)self compositionController];
    id v4 = v9;
    id v6 = v5;
  }
  [v4 setCompositionController:v6];
}

- (void)mediaViewDidScroll:(id)a3
{
  id v4 = a3;
  if (self->_maskView && [(PUPhotoEditToolController *)self isActiveTool] && self->_cleanupMode == 1)
  {
    uint64_t v5 = [v4 _scrollView];
    if ([v5 isZoomBouncing])
    {
      [(PUCleanupToolMaskView *)self->_maskView alpha];
      double v7 = v6;

      if (v7 == 1.0)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __46__PUCleanupToolController_mediaViewDidScroll___block_invoke;
        v12[3] = &unk_1E5F2ED10;
        v12[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
      }
    }
    else
    {
    }
    uint64_t v8 = [v4 _scrollView];
    if ([v8 isZoomBouncing])
    {
      [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay alpha];
      double v10 = v9;

      if (v10 == 1.0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __46__PUCleanupToolController_mediaViewDidScroll___block_invoke_2;
        v11[3] = &unk_1E5F2ED10;
        void v11[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v11];
        [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay setHidden:1];
      }
    }
    else
    {
    }
  }
}

uint64_t __46__PUCleanupToolController_mediaViewDidScroll___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:0.0];
}

uint64_t __46__PUCleanupToolController_mediaViewDidScroll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:0.0];
}

- (void)mediaViewDidEndZooming:(id)a3
{
  id v4 = a3;
  if (self->_maskView && [(PUPhotoEditToolController *)self isActiveTool] && self->_cleanupMode == 1)
  {
    uint64_t v5 = [v4 _scrollView];
    char v6 = [v5 isZoomBouncing];

    if ((v6 & 1) == 0)
    {
      [(PUCleanupToolMaskView *)self->_maskView alpha];
      double v7 = (void *)MEMORY[0x1E4FB1EB0];
      if (v8 == 0.0)
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke;
        v35[3] = &unk_1E5F2ED10;
        v35[4] = self;
        double v9 = 0.0;
        double v10 = v35;
      }
      else
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_2;
        v34[3] = &unk_1E5F2ED10;
        v34[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
        double v7 = (void *)MEMORY[0x1E4FB1EB0];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_3;
        v33[3] = &unk_1E5F2ED10;
        v33[4] = self;
        double v10 = v33;
        double v9 = 0.2;
      }
      [v7 animateWithDuration:0 delay:v10 options:0 animations:0.2 completion:v9];
    }
    double v11 = [v4 _scrollView];
    char v12 = [v11 isZoomBouncing];

    if ((v12 & 1) == 0)
    {
      [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay alpha];
      long long v13 = (void *)MEMORY[0x1E4FB1EB0];
      if (v14 == 0.0)
      {
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        void v32[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_4;
        v32[3] = &unk_1E5F2ED10;
        v32[4] = self;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_5;
        v31[3] = &unk_1E5F2CEE8;
        v31[4] = self;
        double v15 = 0.0;
        long long v16 = v32;
        id v17 = v31;
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_6;
        v30[3] = &unk_1E5F2ED10;
        v30[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v30];
        [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay setHidden:1];
        long long v13 = (void *)MEMORY[0x1E4FB1EB0];
        v24 = self;
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        v27 = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_7;
        uint64_t v28 = &unk_1E5F2ED10;
        v29 = self;
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_8;
        v23 = &unk_1E5F2CEE8;
        long long v16 = &v25;
        id v17 = &v20;
        double v15 = 0.2;
      }
      objc_msgSend(v13, "animateWithDuration:delay:options:animations:completion:", 0, v16, v17, 0.2, v15, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
    }
    self->_isZooming = 0;
    uint64_t v18 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v19 = [v18 cleanupMaskDisplayMode];

    if (v19) {
      [(PUCleanupToolMaskView *)self->_maskView setNeedsDisplay];
    }
    [(PUCleanupToolController *)self _updateFaceRectsView];
    [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
  }
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:1.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:0.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:1.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:1.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setHidden:0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:0.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:1.0];
}

uint64_t __50__PUCleanupToolController_mediaViewDidEndZooming___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setHidden:0];
}

- (void)mediaViewWillBeginZooming:(id)a3
{
  [(PUCleanupToolController *)self hidePromptViewIfNeeded];
  if (self->_maskView && [(PUPhotoEditToolController *)self isActiveTool] && self->_cleanupMode == 1)
  {
    self->_isZooming = 1;
    [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
  }
}

- (void)mediaView:(id)a3 didZoom:(double)a4
{
  id v5 = a3;
  if (self->_maskView)
  {
    double v11 = v5;
    BOOL v6 = [(PUPhotoEditToolController *)self isActiveTool];
    id v5 = v11;
    if (v6 && self->_cleanupMode == 1)
    {
      double v7 = [v11 _scrollView];
      char v8 = [v7 isZoomBouncing];

      id v5 = v11;
      if ((v8 & 1) == 0 && !self->_isZooming)
      {
        double v9 = +[PUPhotoEditProtoSettings sharedInstance];
        uint64_t v10 = [v9 cleanupMaskDisplayMode];

        id v5 = v11;
        if (v10)
        {
          [(PUCleanupToolMaskView *)self->_maskView setNeedsDisplay];
          id v5 = v11;
        }
      }
    }
  }
}

- (void)mediaViewIsReady
{
  if ([(PUPhotoEditToolController *)self isActiveTool])
  {
    if (!self->_mediaViewIsReady)
    {
      self->_mediaViewIsReaddouble y = 1;
      [(PUCleanupToolController *)self _prepareViewsForCleanupIfReady];
    }
    if ([(PUCleanupToolController *)self isBusy])
    {
      if (self->_cleanupViewsHaveBeenPrepared)
      {
        id v3 = (void *)MEMORY[0x1E4F8A2E8];
        id v4 = [(PUCleanupToolController *)self maskContext];
        id v5 = [(PUPhotoEditToolController *)self compositionController];
        BOOL v6 = [v5 composition];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __43__PUCleanupToolController_mediaViewIsReady__block_invoke;
        v8[3] = &unk_1E5F24C00;
        v8[4] = self;
        [v3 updateMaskContext:v4 forComposition:v6 requestID:0 completionQueue:MEMORY[0x1E4F14428] completion:v8];
      }
    }
  }
  else if ([(PUCleanupToolController *)self isBusy])
  {
    [(PUCleanupToolController *)self _setBusy:0];
    id v7 = [(PUPhotoEditToolController *)self delegate];
    [v7 updateProgressIndicatorAnimated:1];
  }
}

void __43__PUCleanupToolController_mediaViewIsReady__block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (!v7)
  {
    double v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v19 = 138543362;
      id v20 = v8;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Cleanup: Failed to update mask context, error: %{public}@", (uint8_t *)&v19, 0xCu);
    }
  }
  [*(id *)(a1 + 32) _setBusy:0];
  uint64_t v10 = [*(id *)(a1 + 32) delegate];
  [v10 updateProgressIndicatorAnimated:1];

  double v11 = *(unsigned char **)(a1 + 32);
  if (v11[1296])
  {
    [v11 addUserPromptViewOfType:3 animated:1];
    double v11 = *(unsigned char **)(a1 + 32);
  }
  [v11 _updateMaskViewForDefaultModeIfNecessary];
  char v12 = *(void **)(a1 + 32);
  if (v12[165] == 2)
  {
    [v12 _updateMaskViewForBrushMode];
    char v12 = *(void **)(a1 + 32);
  }
  long long v13 = (void *)v12[148];
  if (v13) {
    [v13 mediaViewIsReady];
  }
  double v14 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v15 = [v14 cleanupMaskDisplayMode];

  if (!v15)
  {
    long long v16 = [*(id *)(a1 + 32) compositionController];
    id v17 = [v16 composition];

    uint64_t v18 = *(void *)(a1 + 32);
    if ((a3 & 1) != 0 || *(unsigned char *)(v18 + 1296)) {
      [*(id *)(v18 + 1264) didResetComposition:v17];
    }
    else {
      [*(id *)(v18 + 1264) didRenderComposition:v17];
    }
  }
  [*(id *)(a1 + 32) _updateFaceRectsView];
  *(unsigned char *)(*(void *)(a1 + 32) + 1296) = 0;
}

- (void)_showCleanupBrushSizeSlider:(id)a3 label:(id)a4 show:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  double v9 = (void *)MEMORY[0x1E4FB1EB0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PUCleanupToolController__showCleanupBrushSizeSlider_label_show___block_invoke;
  v12[3] = &unk_1E5F2DCD0;
  BOOL v15 = a5;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 animateWithDuration:v12 animations:&__block_literal_global_222_22774 completion:0.2];
}

uint64_t __66__PUCleanupToolController__showCleanupBrushSizeSlider_label_show___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 48);
  [*(id *)(a1 + 32) setAlpha:(double)*(unint64_t *)&a2];
  LOBYTE(v3) = *(unsigned char *)(a1 + 48);
  double v4 = (double)v3;
  id v5 = *(void **)(a1 + 40);
  return [v5 setAlpha:v4];
}

- (void)_brushModeButtonTapped:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PUCleanupToolController.m", 2280, @"Invalid parameter not satisfying: %@", @"[sender isKindOfClass:[UIButton class]]" object file lineNumber description];
  }
  id v7 = [(PUCleanupToolController *)self brushModeButton];
  uint64_t v8 = [v7 isSelected] ^ 1;
  double v9 = [(PUCleanupToolController *)self brushModeButton];
  [v9 setSelected:v8];

  id v17 = +[PUInterfaceManager currentTheme];
  id v10 = [(PUCleanupToolController *)self brushModeButton];
  if ([v10 isSelected]) {
    [v17 photoEditingToolbarButtonSelectedColor];
  }
  else {
  id v11 = [v17 photoEditingToolbarButtonColor];
  }

  char v12 = [(PUCleanupToolController *)self brushModeButton];
  [v12 setTintColor:v11];

  id v13 = [(PUCleanupToolController *)self brushModeButton];
  int v14 = [v13 isSelected];

  if (v14) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 1;
  }
  [(PUCleanupToolController *)self _setCleanupMode:v15];
}

- (void)_resetTapped:(id)a3
{
  [(PUCleanupToolController *)self _setBusy:1];
  double v4 = [(PUPhotoEditToolController *)self delegate];
  [v4 updateProgressIndicatorAnimated:1];

  id v5 = [(PUPhotoEditToolController *)self compositionController];
  id v21 = [v5 composition];

  [(PUPhotoEditToolController *)self willModifyAdjustment];
  BOOL v6 = [(PUPhotoEditToolController *)self compositionController];
  [v6 removeAdjustmentWithKey:*MEMORY[0x1E4F8A478]];

  id v7 = [(PUPhotoEditToolController *)self compositionController];
  [v7 removeAdjustmentWithKey:@"inpaintMasks"];

  uint64_t v8 = PULocalizedString(@"PHOTOEDIT_CLEANUP_RESET_ACTION_TITLE");
  id v9 = [(PUPhotoEditToolController *)self didModifyAdjustmentWithLocalizedName:v8];

  [(PUCleanupToolController *)self _updateResetButtonState];
  [(PUCleanupToolMaskView *)self->_maskView setSampledPoints:0];
  id v10 = objc_alloc_init(MEMORY[0x1E4F8A260]);
  id v11 = [(PUPhotoEditToolController *)self compositionController];
  [v11 setBrushStrokeHistory:v10];

  [(PUCleanupToolController *)self _setCleanupMode:1];
  char v12 = +[PUPhotoEditProtoSettings sharedInstance];
  LODWORD(v11) = [v12 retouchShowsBrushButton];

  if (v11) {
    [(PUPhotoEditToolbarButton *)self->_brushModeButton setSelected:0];
  }
  id v13 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v14 = [v13 cleanupMaskDisplayMode];

  if (!v14)
  {
    retouchVFXOverladouble y = self->_retouchVFXOverlay;
    long long v16 = [(PUPhotoEditToolController *)self compositionController];
    id v17 = [v16 composition];
    [(PUVFXRetouchOverlay *)retouchVFXOverlay didResetComposition:v17];
  }
  [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
  uint64_t v18 = (void *)MEMORY[0x1E4F91110];
  int v19 = [(PUPhotoEditToolController *)self compositionController];
  id v20 = [v19 composition];
  [v18 reportAnalyticsForChangeFrom:v21 to:v20 actionType:2];
}

- (void)_setCleanupMode:(unint64_t)a3
{
  unint64_t cleanupMode = a3;
  if (self->_cleanupMode != a3)
  {
    self->_unint64_t cleanupMode = a3;
    [(PUCleanupToolController *)self _addOverlayIfNeeded];
    [(PUCleanupOverlayViewController *)self->_overlayController setCleanupMode:cleanupMode];
    id v5 = [(PUCleanupToolController *)self view];
    [v5 setNeedsUpdateConstraints];

    unint64_t cleanupMode = self->_cleanupMode;
  }
  switch(cleanupMode)
  {
    case 2uLL:
      [(PUCleanupOverlayViewController *)self->_overlayController mediaViewIsReady];
      [(PUCleanupUserPromptView *)self->_userPromptView setHidden:1];
      [(PUCleanupToolController *)self _showCleanupBrushSizeSlider:self->_defaultModeBrushSizeSlider label:self->_defaultModeBrushSizeLabel show:0];
      brushModeBrushSizeSlider = self->_brushModeBrushSizeSlider;
      uint64_t v7 = 1232;
LABEL_9:
      [(PUCleanupToolController *)self _showCleanupBrushSizeSlider:brushModeBrushSizeSlider label:*(Class *)((char *)&self->super.super.super.super.isa + v7) show:1];
      break;
    case 1uLL:
      [(PUCleanupUserPromptView *)self->_userPromptView setHidden:0];
      [(PUCleanupToolController *)self _showCleanupBrushSizeSlider:self->_brushModeBrushSizeSlider label:self->_brushModeBrushSizeLabel show:0];
      brushModeBrushSizeSlider = self->_defaultModeBrushSizeSlider;
      uint64_t v7 = 1248;
      goto LABEL_9;
    case 0uLL:
      [(PUCleanupUserPromptView *)self->_userPromptView setHidden:0];
      break;
  }
  unint64_t v8 = self->_cleanupMode;
  if (v8 == 2)
  {
    id v9 = [(PUPhotoEditToolController *)self delegate];
    id v10 = v9;
    id v11 = self;
    uint64_t v12 = 0;
LABEL_15:
    [v9 toolControllerDidChangeWantsTapToToggleOriginalEnabled:v11 enabled:v12];

    [(PUCleanupToolController *)self _updateMaskViewForBrushMode];
    return;
  }
  if (v8 != 1)
  {
    if (v8) {
      return;
    }
    id v9 = [(PUPhotoEditToolController *)self delegate];
    id v10 = v9;
    id v11 = self;
    uint64_t v12 = 1;
    goto LABEL_15;
  }
  id v13 = [(PUPhotoEditToolController *)self delegate];
  [v13 toolControllerDidChangeWantsTapToToggleOriginalEnabled:self enabled:0];

  [(PUCleanupToolController *)self _updateMaskViewForDefaultModeIfNecessary];
}

- (void)modifyInpaintAdjustmentWithBlock:(id)a3 actionStringKey:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__PUCleanupToolController_modifyInpaintAdjustmentWithBlock_actionStringKey_completion___block_invoke;
  v12[3] = &unk_1E5F24BD8;
  id v13 = v8;
  id v14 = v9;
  void v12[4] = self;
  id v10 = v8;
  id v11 = v9;
  [(PUCleanupToolController *)self checkPotentialInpaintOperation:a3 handler:v12];
}

void __87__PUCleanupToolController_modifyInpaintAdjustmentWithBlock_actionStringKey_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [*(id *)(a1 + 32) compositionController];
  uint64_t v7 = (void *)[v6 copy];
  id v8 = [v7 composition];
  id v9 = [v7 brushStrokeHistory];
  id v10 = (void *)[v9 copy];

  char v11 = a2 ^ 1;
  if ((a2 & 1) == 0) {
    *(unsigned char *)(*(void *)(a1 + 32) + 1296) = 1;
  }
  uint64_t v12 = [*(id *)(a1 + 32) compositionController];
  uint64_t v13 = *MEMORY[0x1E4F8A478];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __87__PUCleanupToolController_modifyInpaintAdjustmentWithBlock_actionStringKey_completion___block_invoke_2;
  v30[3] = &unk_1E5F24BB0;
  id v14 = v5;
  id v31 = v14;
  char v32 = v11;
  [v12 modifyAdjustmentWithKey:v13 modificationBlock:v30];

  uint64_t v15 = [v6 composition];
  LOBYTE(v13) = [v15 isEqualToComposition:v8];

  if ((v13 & 1) != 0
    || (long long v16 = [[PUCleanupCompositionAction alloc] initWithCompositionController:v6 sourceComposition:v8 previousBrushHistory:v10]) == 0)
  {
    uint64_t v24 = *(void *)(a1 + 48);
    if (v24) {
      (*(void (**)(void))(v24 + 16))();
    }
  }
  else
  {
    id v17 = v16;
    uint64_t v18 = [*(id *)(a1 + 32) delegate];
    int v19 = [v18 photoEditIrisModel];

    if (v19
      && [v19 isVideoEnabled]
      && (uint64_t v20 = [objc_alloc(MEMORY[0x1E4F901B0]) initWithCompositionController:v7 livePhotoModel:v19]) != 0)
    {
      id v21 = (void *)v20;
      id v22 = objc_alloc(MEMORY[0x1E4F8FF18]);
      v33[0] = v17;
      v33[1] = v21;
      v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      v23 = (void *)[v22 initWithActions:v27];

      uint64_t v28 = PULocalizedString(*(void **)(a1 + 40));
      [v23 setLocalizedActionName:v28];

      v29 = [*(id *)(a1 + 32) undoManager];
      [v23 executeWithUndoManager:v29 completionHandler:&__block_literal_global_201];
    }
    else
    {
      uint64_t v25 = PULocalizedString(*(void **)(a1 + 40));
      [(PXEditCompositionAction *)v17 setLocalizedActionName:v25];

      v23 = [*(id *)(a1 + 32) undoManager];
      [(PXAction *)v17 registerWithUndoManager:v23];
      id v21 = 0;
    }

    [*(id *)(a1 + 32) _updateFeedbackViewVisibility];
    uint64_t v26 = *(void *)(a1 + 48);
    if (v26) {
      (*(void (**)(void))(v26 + 16))();
    }
  }
}

void __87__PUCleanupToolController_modifyInpaintAdjustmentWithBlock_actionStringKey_completion___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 composition];
  [v4 takeNewOperationsFromComposition:v5 redactNewOperations:*(unsigned __int8 *)(a1 + 40)];
}

- (void)checkPotentialInpaintOperation:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PUPhotoEditToolController *)self compositionController];
  id v9 = (void *)[v8 copy];

  uint64_t v10 = *MEMORY[0x1E4F8A478];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __66__PUCleanupToolController_checkPotentialInpaintOperation_handler___block_invoke;
  v34[3] = &unk_1E5F24B60;
  id v11 = v6;
  id v35 = v11;
  [v9 modifyAdjustmentWithKey:v10 modificationBlock:v34];
  uint64_t v12 = [v9 composition];
  uint64_t v13 = [(PUPhotoEditToolController *)self compositionController];
  id v14 = [v13 composition];
  char v15 = [v12 isEqualToComposition:v14];

  if ((v15 & 1) == 0)
  {
    long long v16 = +[PUPhotoEditProtoSettings sharedInstance];
    char v17 = [v16 retouchEnablesSensitivityCheck];

    if (v17)
    {
      uint64_t v18 = [(PUCleanupToolController *)self sensitivityRequest];

      if (!v18)
      {
        id v19 = objc_alloc(MEMORY[0x1E4F8A3A0]);
        uint64_t v20 = [v9 composition];
        id v21 = (void *)[v19 initWithComposition:v20];
        [(PUCleanupToolController *)self setSensitivityRequest:v21];

        id v22 = (void *)[objc_alloc(MEMORY[0x1E4F7A5E8]) initWithLevel:1];
        v23 = [(PUCleanupToolController *)self sensitivityRequest];
        [v23 setPriority:v22];

        uint64_t v24 = [(PUCleanupToolController *)self sensitivityRequest];
        [v24 setResponseQueue:MEMORY[0x1E4F14428]];
      }
      uint64_t v25 = [v9 composition];
      uint64_t v26 = [(PUCleanupToolController *)self sensitivityRequest];
      [v26 setComposition:v25];

      BOOL v27 = [(PUCleanupToolController *)self isBusy];
      if (!v27)
      {
        [(PUCleanupToolController *)self _setBusy:1];
        uint64_t v28 = [(PUPhotoEditToolController *)self delegate];
        [v28 updateProgressIndicatorAnimated:1];
      }
      v29 = [(PUCleanupToolController *)self sensitivityRequest];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __66__PUCleanupToolController_checkPotentialInpaintOperation_handler___block_invoke_2;
      v30[3] = &unk_1E5F24B88;
      BOOL v33 = v27;
      void v30[4] = self;
      id v32 = v7;
      id v31 = v9;
      [v29 submit:v30];
    }
    else
    {
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v9);
    }
  }
}

uint64_t __66__PUCleanupToolController_checkPotentialInpaintOperation_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__PUCleanupToolController_checkPotentialInpaintOperation_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _setBusy:0];
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 updateProgressIndicatorAnimated:1];
  }
  id v12 = 0;
  id v5 = [v3 result:&v12];
  id v6 = v12;
  if (v5)
  {
    [v5 sensitivityScore];
    double v8 = v7;
    [*(id *)(*(void *)(a1 + 32) + 1352) initialSensitivityScore];
    [MEMORY[0x1E4F8A3A0] currentSensitivityExceedsThresholds:v8 initialSensitivity:v9];
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Cleanup: Error returned from safety check: %@", buf, 0xCu);
    }

    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v10();
}

- (void)_handleOperationExceedsSizeLimit
{
  [(PUCleanupToolController *)self _setBusy:0];
  id v3 = [(PUPhotoEditToolController *)self delegate];
  [v3 updateProgressIndicatorAnimated:1];

  [(PUCleanupToolController *)self addUserPromptViewOfType:4 animated:1];
  [(PUCleanupToolController *)self fadeOutBrushStrokeWithDuration:0.2];
  [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay undimMasks];
  self->_didPixellate = 0;
}

- (void)previewingOriginalDidStop
{
  [(PUCleanupToolMaskView *)self->_maskView setHidden:0];
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  [(PUVFXRetouchOverlay *)retouchVFXOverlay setHidden:0];
}

- (void)previewingOriginalDidStart
{
  [(PUCleanupToolMaskView *)self->_maskView setHidden:1];
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  [(PUVFXRetouchOverlay *)retouchVFXOverlay setHidden:1];
}

- (void)toolControllerWantsToShowOriginal:(BOOL)a3
{
  id v4 = [(PUPhotoEditToolController *)self delegate];
  [v4 toolControllerWantsToToggleOriginal:self];
}

- (id)transformedImageForBrushStrokeExclusionMask:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F1E050];
    id v5 = [a3 buffer];
    id v6 = objc_msgSend(v4, "imageWithCVPixelBuffer:", objc_msgSend(v5, "CVPixelBuffer"));

    id v11 = 0;
    double v7 = [(PUCleanupToolController *)self transformedImage:v6 error:&v11];
    id v8 = v11;

    if (v7)
    {
      double v9 = [v7 imageByApplyingFilter:@"CIColorInvert"];
    }
    else
    {
      double v7 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v8;
        _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Error applying rendered geometry: %@", buf, 0xCu);
      }
      double v9 = 0;
    }
  }
  else
  {
    double v9 = 0;
  }
  return v9;
}

- (id)brushStrokeExclusionMaskForStrokeStartingAtImageSpacePoint:(CGPoint)a3 withRadius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = [(PUCleanupToolController *)self geometry];

  if (!v8)
  {
    double v9 = PXAssertGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v16 = 138412290;
      char v17 = @"self.geometry";
      _os_log_fault_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  self->_exclusionMaskHitTestRadius = a4;
  uint64_t v10 = [(PUCleanupToolController *)self _createSubjectExclusionMask];
  id v11 = v10;
  if (v10)
  {
    [v10 scale];
    NUScaleInvert();
    NUScaleToDouble();
    double v13 = v12;
    double v14 = x * v12;
    if (a4 <= 0.0)
    {
      if (!objc_msgSend(MEMORY[0x1E4F8A2E8], "mask:containsPoint:", v11, v14, y * v13)) {
        goto LABEL_11;
      }
    }
    else if ((objc_msgSend(MEMORY[0x1E4F8A2E8], "mask:intersectsDiskWithOrigin:radius:", v11) & 1) == 0)
    {
      goto LABEL_11;
    }

    id v11 = 0;
  }
LABEL_11:
  return v11;
}

- (BOOL)isIpadLayout
{
  double v2 = [(PUPhotoEditToolController *)self photoEditSpec];
  BOOL v3 = [v2 currentLayoutStyle] == 4;

  return v3;
}

- (BOOL)isPortrait
{
  return [(PUPhotoEditToolController *)self layoutOrientation] == 1;
}

- (void)_updateVFXMaskOverlayWithSelectedMask:(id)a3 point:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([MEMORY[0x1E4F7A790] isMaskValid:v7])
  {
    id v8 = [(PUPhotoEditToolController *)self compositionController];
    double v9 = [v8 composition];

    uint64_t v10 = [v7 imageByApplyingFilter:@"CIMaskToAlpha"];
    id v14 = 0;
    id v11 = [(PUCleanupToolController *)self transformedImage:v10 error:&v14];
    id v12 = v14;

    if (v12 || !v11)
    {
      [(PUCleanupToolController *)self fadeOutBrushStrokeWithDuration:0.2];
      double v13 = PLPhotoEditGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v12;
        _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_ERROR, "error applying rendered geometry: %@", buf, 0xCu);
      }
    }
    else
    {
      -[PUVFXRetouchOverlay selectPoint:withMask:composition:](self->_retouchVFXOverlay, "selectPoint:withMask:composition:", v11, v9, x, y);
    }
  }
  else
  {
    [(PUCleanupToolController *)self fadeOutBrushStrokeWithDuration:0.2];
  }
}

- (void)_createVFXMaskOverlays
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUPhotoEditToolController *)self toolContainerView];

  if (v3)
  {
    id v4 = &off_1E5F1E000;
    id v5 = +[PUPhotoEditProtoSettings sharedInstance];
    if ([v5 cleanupMaskDisplayMode])
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(PUCleanupToolController *)self maskContext];
    }

    if (self->_retouchVFXOverlay
      || ([(PUCleanupToolController *)self maskContext],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          !v7))
    {
LABEL_25:

      goto LABEL_26;
    }
    id v8 = [PUVFXRetouchOverlay alloc];
    double v9 = [(PUPhotoEditToolController *)self compositionController];
    uint64_t v10 = [v9 composition];
    id v11 = [(PUPhotoEditToolController *)self delegate];
    id v12 = [v11 mediaView];
    double v13 = [v12 _visibleImageRectOverlayView];
    id v14 = [(PUVFXRetouchOverlay *)v8 initWithComposition:v10 maskContext:v6 constrainingView:v13 isHDR:self->_needsHDRUI overlayDelegate:self];
    retouchVFXOverladouble y = self->_retouchVFXOverlay;
    self->_retouchVFXOverladouble y = v14;

    [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay setUserInteractionEnabled:0];
    id v16 = [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay brushView];
    [(PUCleanupOverlayViewController *)self->_overlayController setVfxBrushView:v16];

    uint64_t v17 = [(PUCleanupToolController *)self view];
    uint64_t v18 = [v17 subviews];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      char v22 = 0;
      uint64_t v23 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(v19);
          }
          uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v26 = [(PUCleanupToolController *)self view];
            [v26 insertSubview:self->_retouchVFXOverlay aboveSubview:v25];

            char v22 = 1;
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v21);

      id v4 = &off_1E5F1E000;
      if (v22) {
        goto LABEL_22;
      }
    }
    else
    {
    }
    BOOL v27 = PXAssertGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v32 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_ERROR, "Couldn't find PUCleanupOverlayView in subviews array.", v32, 2u);
    }

    uint64_t v28 = [(PUCleanupToolController *)self view];
    [v28 addSubview:self->_retouchVFXOverlay];

LABEL_22:
    v29 = [v4[449] sharedInstance];
    int v30 = [v29 retouchShowVFXControls];

    if (v30) {
      [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay showControlsInViewController:self];
    }

    goto LABEL_25;
  }
LABEL_26:
  id v31 = [(PUCleanupToolController *)self view];
  [v31 setNeedsUpdateConstraints];
}

- (void)_createMaskView
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_maskView)
  {
    BOOL v3 = [(PUPhotoEditToolController *)self delegate];
    id v4 = [v3 mediaView];

    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v21.width = v6;
      v21.height = v8;
      uint64_t v10 = NSStringFromCGSize(v21);
      int v18 = 138412290;
      id v19 = v10;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "mediaViewSize: %@", (uint8_t *)&v18, 0xCu);
    }
    id v11 = [[PUCleanupToolMaskView alloc] initWithMediaView:v4 isHDR:self->_needsHDRUI];
    maskView = self->_maskView;
    self->_maskView = v11;

    [(PUCleanupToolMaskView *)self->_maskView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v13 = [(PUCleanupToolMaskView *)self->_maskView layer];
    [v13 setMasksToBounds:1];

    id v14 = self->_maskView;
    uint64_t v15 = [(PUCleanupToolMaskView *)v14 layer];
    [v15 setDelegate:v14];

    [(PUCleanupToolMaskView *)self->_maskView setMaskTransformerDelegate:self];
    [(PUCleanupToolMaskView *)self->_maskView setUserInteractionEnabled:0];
    id v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(PUCleanupToolMaskView *)self->_maskView setBackgroundColor:v16];

    uint64_t v17 = [(PUCleanupToolController *)self view];
    [v17 insertSubview:self->_maskView atIndex:0];
  }
}

- (int64_t)segmentationCount
{
  double v2 = [(PUCleanupToolController *)self maskContext];
  BOOL v3 = [v2 segmentationResult];

  id v4 = [v3 instances];
  int64_t v5 = [v4 count];

  return v5;
}

- (void)_updateMaskViewForBrushMode
{
}

- (void)_updateMaskViewForDefaultMode
{
  BOOL v3 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v4 = [v3 cleanupMaskDisplayMode];

  if (v4)
  {
    int64_t v5 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v6 = [v5 cleanupMaskDisplayMode];

    if (v6 == 1)
    {
      id v9 = [(PUCleanupToolController *)self _newOverlayMask];
      [(PUCleanupToolController *)self _updateMaskViewWithUnselectedMaskImage:v9 foregroundMasks:0 backgroundMasks:0];
    }
    else
    {
      double v7 = +[PUPhotoEditProtoSettings sharedInstance];
      uint64_t v8 = [v7 cleanupMaskDisplayMode];

      if (v8 == 2)
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        void v10[2] = __56__PUCleanupToolController__updateMaskViewForDefaultMode__block_invoke;
        v10[3] = &unk_1E5F24B38;
        v10[4] = self;
        [(PUCleanupToolController *)self createAllAvailableMasks:v10];
      }
    }
  }
}

void __56__PUCleanupToolController__updateMaskViewForDefaultMode__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PUCleanupToolController__updateMaskViewForDefaultMode__block_invoke_2;
  block[3] = &unk_1E5F2E908;
  block[4] = *(void *)(a1 + 32);
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __56__PUCleanupToolController__updateMaskViewForDefaultMode__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMaskViewWithUnselectedMaskImage:0 foregroundMasks:*(void *)(a1 + 40) backgroundMasks:*(void *)(a1 + 48)];
}

- (void)_updateMaskViewForDefaultModeIfNecessary
{
  if (self->_cleanupMode == 1) {
    [(PUCleanupToolController *)self _updateMaskViewForDefaultMode];
  }
}

- (void)_displayProcessingWithSelectedMaskImage:(id)a3 unselectedMaskImage:(id)a4 exclusionMasks:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v37 = a4;
  id v11 = a5;
  id v12 = v10;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
  uint64_t v38 = v12;
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      uint64_t v16 = 0;
      uint64_t v17 = v12;
      do
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v11);
        }
        int v18 = (void *)MEMORY[0x1E4F1E050];
        id v19 = [*(id *)(*((void *)&v40 + 1) + 8 * v16) buffer];
        uint64_t v20 = objc_msgSend(v18, "imageWithCVPixelBuffer:", objc_msgSend(v19, "CVPixelBuffer"));

        [v17 extent];
        double v22 = v21;
        [v20 extent];
        CGFloat v24 = v22 / v23;
        [v17 extent];
        double v26 = v25;
        [v20 extent];
        CGAffineTransformMakeScale(&v39, v24, v26 / v27);
        uint64_t v28 = [v20 imageByApplyingTransform:&v39];

        v29 = [MEMORY[0x1E4F1E000] subtract];
        id v12 = [v29 applyWithForeground:v28 background:v17];

        ++v16;
        uint64_t v17 = v12;
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v14);
  }
  int v30 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v31 = [v30 cleanupMaskDisplayMode];

  if (!v31)
  {
    if (v12) {
      -[PUCleanupToolController _updateVFXMaskOverlayWithSelectedMask:point:](self, "_updateVFXMaskOverlayWithSelectedMask:point:", v12, x, y);
    }
    else {
      [(PUCleanupToolController *)self fadeOutBrushStrokeWithDuration:0.2];
    }
  }
  id v32 = [v12 imageByApplyingFilter:@"CIColorInvert"];
  long long v33 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v34 = [v33 cleanupMaskDisplayMode];

  if (v34)
  {
    [(PUCleanupToolMaskView *)self->_maskView setMask:v37];
    [(PUCleanupToolMaskView *)self->_maskView setSelectedMask:v32];
    [(PUCleanupToolMaskView *)self->_maskView setForegroundMasks:0];
    [(PUCleanupToolMaskView *)self->_maskView setBackgroundMasks:0];
    [(PUCleanupToolMaskView *)self->_maskView setNeedsDisplay];
    [(PUCleanupToolController *)self fadeOutBrushStrokeWithDuration:0.2];
  }
  if (v32)
  {
    [(PUCleanupToolController *)self _setBusy:1 withDelay:15.0];
    long long v35 = [(PUPhotoEditToolController *)self delegate];
    [v35 updateProgressIndicatorAnimated:1];
  }
}

- (void)_displayProcessingWithSelectedMask:(id)a3 unselectedMaskImage:(id)a4 exclusionMasks:(id)a5 point:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  id v11 = (void *)MEMORY[0x1E4F1E050];
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [a3 buffer];
  objc_msgSend(v11, "imageWithCVPixelBuffer:", objc_msgSend(v14, "CVPixelBuffer"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  -[PUCleanupToolController _displayProcessingWithSelectedMaskImage:unselectedMaskImage:exclusionMasks:point:](self, "_displayProcessingWithSelectedMaskImage:unselectedMaskImage:exclusionMasks:point:", v15, v13, v12, x, y);
}

- (void)_updateMaskViewWithUnselectedMaskImage:(id)a3 foregroundMasks:(id)a4 backgroundMasks:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v11 = [v10 cleanupMaskDisplayMode];

  if (v11)
  {
    [(PUCleanupToolMaskView *)self->_maskView setMask:v12];
    [(PUCleanupToolMaskView *)self->_maskView setSelectedMask:0];
    [(PUCleanupToolMaskView *)self->_maskView setForegroundMasks:v8];
    [(PUCleanupToolMaskView *)self->_maskView setBackgroundMasks:v9];
    [(PUCleanupToolMaskView *)self->_maskView setNeedsDisplay];
  }
}

- (id)_createSubjectExclusionMask
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__22828;
  uint64_t v14 = __Block_byref_object_dispose__22829;
  id v15 = 0;
  if ([MEMORY[0x1E4F7A4A0] preserveSubjectsWhenInpainting])
  {
    BOOL v3 = (void *)MEMORY[0x1E4F8A2E8];
    uint64_t v4 = [(PUCleanupToolController *)self maskContext];
    id v5 = [(PUPhotoEditToolController *)self compositionController];
    id v6 = [v5 composition];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__PUCleanupToolController__createSubjectExclusionMask__block_invoke;
    v9[3] = &unk_1E5F29F60;
    v9[4] = &v10;
    [v3 createSubjectMaskForContext:v4 composition:v6 completion:v9];
  }
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__PUCleanupToolController__createSubjectExclusionMask__block_invoke(uint64_t a1, void *a2)
{
}

- (id)_newOverlayMask
{
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CGFloat v24 = __Block_byref_object_copy__22828;
  double v25 = __Block_byref_object_dispose__22829;
  id v26 = 0;
  BOOL v3 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v4 = [v3 cleanupMaskDisplayMode];

  if (v4)
  {
    id v5 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v6 = [v5 cleanupMaskDisplayMode];

    if (v6 == 1)
    {
      id v7 = [(PUCleanupToolController *)self maskContext];

      if (v7)
      {
        id v8 = (void *)MEMORY[0x1E4F8A2E8];
        id v9 = [(PUCleanupToolController *)self maskContext];
        uint64_t v10 = [(PUPhotoEditToolController *)self compositionController];
        uint64_t v11 = [v10 composition];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __42__PUCleanupToolController__newOverlayMask__block_invoke;
        v20[3] = &unk_1E5F24B10;
        v20[4] = self;
        v20[5] = &v21;
        [v8 createDeclutterMaskForContext:v9 composition:v11 completion:v20];

LABEL_7:
      }
    }
    else
    {
      uint64_t v12 = +[PUPhotoEditProtoSettings sharedInstance];
      uint64_t v13 = [v12 cleanupMaskDisplayMode];

      if (v13 == 2)
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F8A2E8];
        id v9 = [(PUCleanupToolController *)self maskContext];
        id v15 = [(PUPhotoEditToolController *)self compositionController];
        uint64_t v16 = [v15 composition];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __42__PUCleanupToolController__newOverlayMask__block_invoke_2;
        v19[3] = &unk_1E5F29F60;
        v19[4] = &v21;
        [v14 createAvailableObjectsMaskForContext:v9 composition:v16 completion:v19];

        goto LABEL_7;
      }
    }
  }
  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

void __42__PUCleanupToolController__newOverlayMask__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1E050];
    uint64_t v4 = [a2 buffer];
    uint64_t v5 = objc_msgSend(v3, "imageWithCVPixelBuffer:", objc_msgSend(v4, "CVPixelBuffer"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = [*(id *)(a1 + 32) _createSubjectExclusionMask];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1E050];
      uint64_t v11 = [v8 buffer];
      uint64_t v12 = objc_msgSend(v10, "imageWithCVPixelBuffer:", objc_msgSend(v11, "CVPixelBuffer"));

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) extent];
      double v14 = v13;
      [v12 extent];
      CGFloat v16 = v14 / v15;
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) extent];
      double v18 = v17;
      [v12 extent];
      CGAffineTransformMakeScale(&v28, v16, v18 / v19);
      uint64_t v20 = [v12 imageByApplyingTransform:&v28];

      uint64_t v21 = [MEMORY[0x1E4F1E000] subtract];
      uint64_t v22 = [v21 applyWithForeground:v20 background:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
      uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
      CGFloat v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    uint64_t v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) imageByApplyingFilter:@"CIColorInvert"];
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8);
    double v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;
  }
}

void __42__PUCleanupToolController__newOverlayMask__block_invoke_2(uint64_t a1, void *a2)
{
  if (a2)
  {
    BOOL v3 = (void *)MEMORY[0x1E4F1E050];
    uint64_t v4 = [a2 buffer];
    uint64_t v5 = objc_msgSend(v3, "imageWithCVPixelBuffer:", objc_msgSend(v4, "CVPixelBuffer"));
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) imageByApplyingFilter:@"CIColorInvert"];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (void)createAllAvailableMasks:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, void *, void))a3;
  uint64_t v5 = [(PUCleanupToolController *)self maskContext];
  uint64_t v6 = [v5 segmentationResult];

  double v27 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
  if (v6)
  {
    id v7 = [v6 instances];
    uint64_t v8 = (void *)[v7 copy];

    uint64_t v9 = (void *)MEMORY[0x1E4F8A2E8];
    uint64_t v10 = [(PUPhotoEditToolController *)self compositionController];
    uint64_t v11 = [v10 composition];
    uint64_t v12 = [(PUCleanupToolController *)self maskContext];
    double v13 = [v9 removeOperationsFromInstances:v8 composition:v11 context:v12];

    uint64_t v14 = [v13 firstIndex];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v15 = v14;
      uint64_t v25 = v4;
      id v16 = 0;
      do
      {
        double v17 = v16;
        id v28 = 0;
        double v18 = objc_msgSend(v6, "newMaskForInstance:error:", v15, &v28, v25);
        id v16 = v28;

        double v19 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCVImageBuffer:", objc_msgSend(v18, "CVPixelBuffer"));
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = [v19 imageByApplyingFilter:@"CIColorInvert"];

          uint64_t v22 = [v6 foregroundInstances];
          int v23 = [v22 containsIndex:v15];

          if (v23) {
            CGFloat v24 = v26;
          }
          else {
            CGFloat v24 = v27;
          }
          [v24 addObject:v21];
        }
        uint64_t v15 = [v13 indexGreaterThanIndex:v15];
      }
      while (v15 != 0x7FFFFFFFFFFFFFFFLL);

      uint64_t v4 = v25;
    }
  }
  v4[2](v4, v27, v26, 0);
}

- (void)addObjectRemovalUsingImageSpaceStroke:(id)a3 exclusionMask:(id)a4 completion:(id)a5
{
  id v31 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v11 = [v10 mediaView];
  uint64_t v12 = [v11 _scrollView];
  [v12 contentSize];
  double v14 = v13;

  uint64_t v15 = [(PUCleanupToolController *)self geometry];
  [v15 outputRect];
  double v17 = v16;

  id v18 = v8;
  double exclusionMaskHitTestRadius = self->_exclusionMaskHitTestRadius;
  BOOL v20 = [(PUCleanupToolController *)self isBusy];
  if (!v20)
  {
    [(PUCleanupToolController *)self _setBusy:1];
    uint64_t v21 = [(PUPhotoEditToolController *)self delegate];
    [v21 updateProgressIndicatorAnimated:1];

    [(PUCleanupOverlayViewController *)self->_overlayController setCleanupMode:0];
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F91128]);
  uint64_t v22 = objc_alloc_init(PUCleanupUserSettingBridge);
  int v23 = [(PUCleanupToolController *)self maskContext];
  CGFloat v24 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v25 = [(PUCleanupToolController *)self geometry];
  uint64_t v26 = [(PIInpaintMaskContext *)self->_maskContext detectedFaces];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke;
  v32[3] = &unk_1E5F24AE8;
  BOOL v37 = v20;
  v32[4] = self;
  id v33 = v31;
  double v36 = exclusionMaskHitTestRadius;
  id v34 = v18;
  id v35 = v9;
  id v27 = v9;
  id v28 = v18;
  id v29 = v31;
  [v30 analyzeStrokeMaskIntersections:v29 inpaintMaskContext:v23 compositionController:v24 geometry:v25 imageToScreenSpaceScale:v22 userSettings:v26 faceRects:v14 / v17 completion:v32];
}

void __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5, char a6, char a7, char a8)
{
  id v14 = a2;
  id v15 = a3;
  id v16 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_2;
  block[3] = &unk_1E5F24AC0;
  char v31 = *(unsigned char *)(a1 + 72);
  double v17 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v18 = v17;
  char v32 = a6;
  char v33 = a7;
  uint64_t v30 = *(void *)(a1 + 64);
  id v24 = v18;
  id v25 = v14;
  id v26 = *(id *)(a1 + 48);
  id v27 = v15;
  char v34 = a8;
  id v19 = *(id *)(a1 + 56);
  id v28 = v16;
  id v29 = v19;
  id v20 = v16;
  id v21 = v15;
  id v22 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 96))
  {
    [*(id *)(a1 + 32) _setBusy:0];
    double v2 = [*(id *)(v1 + 32) delegate];
    [v2 updateProgressIndicatorAnimated:1];

    [*(id *)(*(void *)(v1 + 32) + 1184) setCleanupMode:1];
  }
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F8A268]) initWithStroke:*(void *)(v1 + 40) closed:*(unsigned __int8 *)(v1 + 97) skipSegmentationIntersections:0 needsPixellation:*(unsigned __int8 *)(v1 + 98) subjectHitTestRadius:*(double *)(v1 + 88)];
  uint64_t v4 = [*(id *)(v1 + 32) compositionController];
  uint64_t v5 = [v4 brushStrokeHistory];
  [v5 addEntry:v3];

  if (![*(id *)(v1 + 48) count])
  {
    int v8 = *(unsigned __int8 *)(v1 + 97);
    id v9 = PLPhotoEditGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "addObjectRemovalUsingStroke: adding removal of entire filled brush stroke", buf, 2u);
      }

      uint64_t v11 = *(void **)(v1 + 32);
      uint64_t v12 = *(void *)(v1 + 40);
      uint64_t v13 = *(unsigned __int8 *)(v1 + 98);
      uint64_t v14 = *(void *)(v1 + 56);
      double v15 = *(double *)(v1 + 88);
      uint64_t v16 = *(void *)(v1 + 80);
      uint64_t v17 = 1;
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "addObjectRemovalUsingStroke: adding removal of simple brush stroke", buf, 2u);
      }

      uint64_t v11 = *(void **)(v1 + 32);
      uint64_t v12 = *(void *)(v1 + 40);
      uint64_t v13 = *(unsigned __int8 *)(v1 + 98);
      uint64_t v14 = *(void *)(v1 + 56);
      double v15 = *(double *)(v1 + 88);
      uint64_t v16 = *(void *)(v1 + 80);
      uint64_t v17 = 0;
    }
    [v11 _addImageSpaceInpaintingStroke:v12 closeAndFillStroke:v17 needsPixellation:v13 recordStroke:0 exclusionMask:v14 exclusionMaskHitTestRadius:v16 completion:v15];
LABEL_37:
    v48 = +[PUPhotoEditProtoSettings sharedInstance];
    if ([v48 retouchShowsTargetPointBrushPoints])
    {
    }
    else
    {
      v49 = +[PUPhotoEditProtoSettings sharedInstance];
      uint64_t v50 = [v49 cleanupMaskDisplayMode];

      if (!v50) {
        goto LABEL_41;
      }
    }
    v51 = PFMap();
    [*(id *)(*(void *)(v1 + 32) + 1328) setFoundIntersectionMasks:v51];
    [*(id *)(*(void *)(v1 + 32) + 1328) setSampledPoints:*(void *)(v1 + 72)];
    [*(id *)(*(void *)(v1 + 32) + 1328) setNeedsDisplay];

    goto LABEL_41;
  }
  uint64_t v6 = *(void *)(v1 + 32);
  if (*(unsigned char *)(v1 + 98)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = *(unsigned char *)(v6 + 1297) != 0;
  }
  *(unsigned char *)(v6 + 1296) = v7;
  id v18 = (void *)MEMORY[0x1E4F8A2E8];
  uint64_t v19 = *(void *)(v1 + 48);
  [*(id *)(v1 + 32) imageSize];
  int v20 = objc_msgSend(v18, "objectMasksExceedSizeLimit:imageSize:", v19);
  id v21 = *(unsigned char **)(v1 + 32);
  if (v21[1296]) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = v20 == 0;
  }
  if (v22)
  {
    v52 = v3;
    int v23 = [MEMORY[0x1E4F1E050] emptyImage];
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    uint64_t v53 = v1;
    id obj = *(id *)(v1 + 48);
    uint64_t v24 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v64;
      uint64_t v27 = *MEMORY[0x1E4F1E480];
      uint64_t v28 = *MEMORY[0x1E4F1E418];
      do
      {
        uint64_t v29 = 0;
        uint64_t v30 = v23;
        do
        {
          if (*(void *)v64 != v26) {
            objc_enumerationMutation(obj);
          }
          char v31 = (void *)MEMORY[0x1E4F1E050];
          char v32 = [*(id *)(*((void *)&v63 + 1) + 8 * v29) buffer];
          char v33 = objc_msgSend(v31, "imageWithCVImageBuffer:", objc_msgSend(v32, "CVPixelBuffer"));

          v69[0] = v27;
          v69[1] = v28;
          v70[0] = v33;
          v70[1] = v30;
          char v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:2];
          id v35 = [MEMORY[0x1E4F1E040] filterWithName:@"CIMaximumCompositing" withInputParameters:v34];
          int v23 = [v35 outputImage];

          ++v29;
          uint64_t v30 = v23;
        }
        while (v25 != v29);
        uint64_t v25 = [obj countByEnumeratingWithState:&v63 objects:v71 count:16];
      }
      while (v25);
    }

    uint64_t v1 = v53;
    if (*(void *)(v53 + 56))
    {
      uint64_t v68 = *(void *)(v53 + 56);
      double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
    }
    else
    {
      double v36 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (*(unsigned char *)(v53 + 97))
    {
      BOOL v37 = [*(id *)(v53 + 32) maskContext];
      uint64_t v38 = *(void **)(v53 + 64);
      v61[0] = MEMORY[0x1E4F143A8];
      v61[1] = 3221225472;
      v61[2] = __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_3;
      v61[3] = &unk_1E5F24A50;
      id v39 = v37;
      id v62 = v39;
      if ([v38 indexPassingTest:v61] == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v40 = [*(id *)(v53 + 32) _createSubjectExclusionMask];
        long long v41 = (void *)v40;
        if (v40)
        {
          uint64_t v67 = v40;
          uint64_t v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];

          double v36 = (void *)v42;
        }
      }
      else
      {
        long long v41 = v36;
        double v36 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    long long v43 = *(void **)(v53 + 32);
    v44 = (void *)[v43 _newOverlayMask];
    objc_msgSend(v43, "_displayProcessingWithSelectedMaskImage:unselectedMaskImage:exclusionMasks:point:", v23, v44, v36, 0.0, 0.0);

    uint64_t v45 = *(void **)(v53 + 32);
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_4;
    v56[3] = &unk_1E5F24A78;
    char v59 = *(unsigned char *)(v53 + 97);
    char v60 = *(unsigned char *)(v53 + 99);
    v56[4] = v45;
    id v57 = *(id *)(v53 + 48);
    id v58 = v36;
    uint64_t v46 = *(void *)(v53 + 80);
    id v47 = v36;
    [v45 modifyInpaintAdjustmentWithBlock:v56 actionStringKey:@"PHOTOEDIT_CLEANUP_CLEAN_UP_ACTION_TITLE" completion:v46];

    BOOL v3 = v52;
    goto LABEL_37;
  }
  [v21 _handleOperationExceedsSizeLimit];
LABEL_41:
}

uint64_t __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  BOOL v3 = [*(id *)(a1 + 32) segmentationResult];
  uint64_t v4 = [v3 foregroundInstances];
  uint64_t v5 = [v4 containsIndex:a2];

  return v5;
}

void __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  int v4 = *(unsigned __int8 *)(a1 + 57);
  uint64_t v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1296);
  id v6 = a2;
  BOOL v7 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_DEBUG, "addObjectRemovalUsingStroke: adding removal of %ld masks", buf, 0xCu);
  }
  uint64_t v9 = 64;
  if (!v3) {
    uint64_t v9 = 128;
  }
  if (v4) {
    v9 |= 8uLL;
  }
  uint64_t v10 = v9 | v5;

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = 0;
  [v6 appendRemovalOperationWithMasks:v11 exclusionMasks:v12 options:v10 error:&v13];
}

id __90__PUCleanupToolController_addObjectRemovalUsingImageSpaceStroke_exclusionMask_completion___block_invoke_176(uint64_t a1, void *a2)
{
  double v2 = (void *)MEMORY[0x1E4F1E050];
  int v3 = [a2 buffer];
  int v4 = objc_msgSend(v2, "imageWithCVPixelBuffer:", objc_msgSend(v3, "CVPixelBuffer"));
  uint64_t v5 = [v4 imageByApplyingFilter:@"CIColorInvert"];

  return v5;
}

- (void)addObjectRemovalUsingStroke:(id)a3 exclusionMask:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F7A580]);
  [v6 radius];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F7A320] + 16);
  *(_OWORD *)buf = *MEMORY[0x1E4F7A320];
  long long v30 = v8;
  uint64_t v9 = objc_msgSend(v7, "initWithRadius:softness:opacity:clipRect:pressureMode:", buf, 0);
  uint64_t v10 = [MEMORY[0x1E4F28E78] string];
  [v10 appendString:@"addObjectRemovalUsingStroke"];
  if ([v6 pointCount] >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      [v6 pointAtIndex:v11];
      CGFloat v13 = v12;
      [v6 pointAtIndex:v11];
      double v15 = v14;
      uint64_t v16 = NSString;
      v32.double x = v13;
      v32.double y = v14;
      uint64_t v17 = NSStringFromCGPoint(v32);
      id v18 = [v16 stringWithFormat:@"\n\t%@", v17];
      [v10 appendString:v18];

      uint64_t v19 = [(PUPhotoEditToolController *)self delegate];
      int v20 = [(PUCleanupOverlayViewController *)self->_overlayController view];
      objc_msgSend(v19, "toolController:originalPointFromViewPoint:view:", self, v20, v13, v15);
      double v22 = v21;
      double v24 = v23;

      *(float *)&double v25 = v22;
      *(float *)&double v26 = v24;
      objc_msgSend(v9, "appendPoint:", v25, v26, 0.0);
      ++v11;
    }
    while ([v6 pointCount] > v11);
  }
  uint64_t v27 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl(&dword_1AE9F8000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

  [(PUCleanupToolController *)self addObjectRemovalUsingImageSpaceStroke:v9 exclusionMask:v28 completion:0];
}

- (void)addObjectRemovalAtImageSpacePoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->_didPixellate = 0;
  long long v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8A268]), "initWithObjectRemovalAtPoint:", x, y);
  uint64_t v9 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v10 = [v9 brushStrokeHistory];
  [v10 addEntry:v8];

  id v11 = objc_alloc_init(MEMORY[0x1E4F91128]);
  [(PUCleanupToolController *)self brushRadiusForTouchType:0];
  double v13 = v12;
  float v14 = [(PUCleanupToolController *)self maskContext];
  double v15 = [(PUPhotoEditToolController *)self compositionController];
  uint64_t v16 = [(PUCleanupToolController *)self geometry];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PUCleanupToolController_addObjectRemovalAtImageSpacePoint_completion___block_invoke;
  v18[3] = &unk_1E5F24A28;
  double v20 = x;
  double v21 = y;
  v18[4] = self;
  id v19 = v7;
  id v17 = v7;
  objc_msgSend(v11, "hitTestSegmentation:radius:inpaintMaskContext:compositionController:geometry:completion:", v14, v15, v16, v18, x, y, v13);
}

void __72__PUCleanupToolController_addObjectRemovalAtImageSpacePoint_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) _createSubjectExclusionMask];
    uint64_t v5 = (void *)MEMORY[0x1E4F8A2E8];
    id v29 = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    [*(id *)(a1 + 32) imageSize];
    LODWORD(v5) = objc_msgSend(v5, "objectMasksExceedSizeLimit:imageSize:", v6);

    id v7 = *(unsigned char **)(a1 + 32);
    if (v5)
    {
      [v7 _handleOperationExceedsSizeLimit];
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        (*(void (**)(void))(v8 + 16))();
      }
    }
    else
    {
      v7[1296] = v7[1297];
      if (v4)
      {
        id v28 = v4;
        float v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
      }
      else
      {
        float v12 = (void *)MEMORY[0x1E4F1CBF0];
      }
      double v13 = +[PUPhotoEditProtoSettings sharedInstance];
      if ([v13 cleanupMaskDisplayMode]) {
        float v14 = (void *)[*(id *)(a1 + 32) _newOverlayMask];
      }
      else {
        float v14 = 0;
      }

      double v15 = [*(id *)(a1 + 32) delegate];
      uint64_t v16 = *(void *)(a1 + 32);
      id v17 = [*(id *)(v16 + 1184) view];
      objc_msgSend(v15, "toolController:viewPointFromOriginalPoint:view:", v16, v17, *(double *)(a1 + 48), *(double *)(a1 + 56));
      double v19 = v18;
      double v21 = v20;

      objc_msgSend(*(id *)(a1 + 32), "_displayProcessingWithSelectedMask:unselectedMaskImage:exclusionMasks:point:", v3, v14, v12, v19, v21);
      double v22 = *(void **)(a1 + 32);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __72__PUCleanupToolController_addObjectRemovalAtImageSpacePoint_completion___block_invoke_160;
      v25[3] = &unk_1E5F249B0;
      v25[4] = v22;
      id v26 = v3;
      id v27 = v12;
      uint64_t v23 = *(void *)(a1 + 40);
      id v24 = v12;
      [v22 modifyInpaintAdjustmentWithBlock:v25 actionStringKey:@"PHOTOEDIT_CLEANUP_CLEAN_UP_ACTION_TITLE" completion:v23];
    }
  }
  else
  {
    uint64_t v9 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v10;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_DEBUG, "Cleanup: Did not find object at point %@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(void))(v11 + 16))();
    }
  }
}

void __72__PUCleanupToolController_addObjectRemovalAtImageSpacePoint_completion___block_invoke_160(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1[4] + 1296)) {
    uint64_t v3 = 33;
  }
  else {
    uint64_t v3 = 32;
  }
  v9[0] = a1[5];
  int v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a2;
  id v6 = [v4 arrayWithObjects:v9 count:1];
  uint64_t v7 = a1[6];
  uint64_t v8 = 0;
  [v5 appendRemovalOperationWithMasks:v6 exclusionMasks:v7 options:v3 error:&v8];
}

- (void)addObjectRemovalAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v7 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v6, "toolController:originalPointFromViewPoint:view:", self, v7, x, y);
  double v9 = v8;
  double v11 = v10;

  -[PUCleanupToolController addObjectRemovalAtImageSpacePoint:completion:](self, "addObjectRemovalAtImageSpacePoint:completion:", 0, v9, v11);
}

- (void)addStroke:(id)a3 closeAndFillStroke:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = objc_alloc(MEMORY[0x1E4F7A580]);
  [v6 radius];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F7A320] + 16);
  v23[0] = *MEMORY[0x1E4F7A320];
  v23[1] = v8;
  double v9 = objc_msgSend(v7, "initWithRadius:softness:opacity:clipRect:pressureMode:", v23, 0);
  if ([v6 pointCount] >= 1)
  {
    uint64_t v10 = 0;
    do
    {
      [v6 pointAtIndex:v10];
      double v12 = v11;
      [v6 pointAtIndex:v10];
      double v14 = v13;
      double v15 = [(PUPhotoEditToolController *)self delegate];
      uint64_t v16 = [(PUCleanupOverlayViewController *)self->_overlayController view];
      objc_msgSend(v15, "toolController:originalPointFromViewPoint:view:", self, v16, v12, v14);
      double v18 = v17;
      double v20 = v19;

      *(float *)&double v21 = v18;
      *(float *)&double v22 = v20;
      objc_msgSend(v9, "appendPoint:", v21, v22, 0.0);
      ++v10;
    }
    while ([v6 pointCount] > v10);
  }
  [(PUCleanupToolController *)self addImageSpaceInpaintingStroke:v9 exclusionMask:0 closeAndFillStroke:v4 needsPixellation:0 recordStroke:1 completion:0];
}

- (void)_addImageSpaceInpaintingStroke:(id)a3 closeAndFillStroke:(BOOL)a4 needsPixellation:(BOOL)a5 recordStroke:(BOOL)a6 exclusionMask:(id)a7 exclusionMaskHitTestRadius:(double)a8 completion:(id)a9
{
  BOOL v12 = a6;
  BOOL v13 = a5;
  BOOL v14 = a4;
  v47[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v42 = a7;
  id v17 = a9;
  if (v12)
  {
    double v18 = (void *)[objc_alloc(MEMORY[0x1E4F8A268]) initWithStroke:v16 closed:v14 skipSegmentationIntersections:1 needsPixellation:v13 subjectHitTestRadius:a8];
    double v19 = [(PUPhotoEditToolController *)self compositionController];
    double v20 = [v19 brushStrokeHistory];
    [v20 addEntry:v18];
  }
  isUnsafeInitialldouble y = 1;
  double v22 = objc_msgSend(v16, "ciImageTiled:closed:pressureMode:filled:", 0, 1, 2, v14, v17);
  uint64_t v23 = (void *)MEMORY[0x1E4F1E050];
  id v24 = [MEMORY[0x1E4F1E008] blackColor];
  double v25 = [v23 imageWithColor:v24];

  id v26 = [v22 imageByCompositingOverImage:v25];
  [(PUCleanupToolController *)self imageSize];
  id v29 = objc_msgSend(v26, "imageByCroppingToRect:", 0.0, 0.0, v27, v28);

  [(PUCleanupToolController *)self _setBusy:1 withDelay:15.0];
  long long v30 = [(PUPhotoEditToolController *)self delegate];
  [v30 updateProgressIndicatorAnimated:1];

  if (!v13) {
    isUnsafeInitialldouble y = self->_isUnsafeInitially;
  }
  self->_BOOL didPixellate = isUnsafeInitially;
  uint64_t v31 = (void *)MEMORY[0x1E4F8A2E8];
  [(PUCleanupToolController *)self imageSize];
  int v32 = objc_msgSend(v31, "brushStrokeExceedsSizeLimit:imageSize:closeAndFillStroke:", v16, v14);
  BOOL didPixellate = self->_didPixellate;
  if (self->_didPixellate || !v32)
  {
    if (v42)
    {
      v47[0] = v42;
      double v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
      BOOL didPixellate = self->_didPixellate;
    }
    else
    {
      double v36 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (didPixellate) {
      BOOL v37 = 0;
    }
    else {
      BOOL v37 = v29;
    }
    unint64_t cleanupMode = self->_cleanupMode;
    if (cleanupMode == 1) {
      id v39 = [(PUCleanupToolController *)self _newOverlayMask];
    }
    else {
      id v39 = 0;
    }
    -[PUCleanupToolController _displayProcessingWithSelectedMaskImage:unselectedMaskImage:exclusionMasks:point:](self, "_displayProcessingWithSelectedMaskImage:unselectedMaskImage:exclusionMasks:point:", v37, v39, v36, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    if (cleanupMode == 1) {

    }
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __159__PUCleanupToolController__addImageSpaceInpaintingStroke_closeAndFillStroke_needsPixellation_recordStroke_exclusionMask_exclusionMaskHitTestRadius_completion___block_invoke;
    v43[3] = &unk_1E5F24A00;
    v43[4] = self;
    BOOL v46 = v14;
    id v44 = v16;
    id v45 = v36;
    id v40 = v36;
    id v35 = v41;
    [(PUCleanupToolController *)self modifyInpaintAdjustmentWithBlock:v43 actionStringKey:@"PHOTOEDIT_CLEANUP_CLEAN_UP_ACTION_TITLE" completion:v41];

    char v34 = v42;
  }
  else
  {
    [(PUCleanupToolController *)self _handleOperationExceedsSizeLimit];
    id v35 = v41;
    char v34 = v42;
    if (v41) {
      v41[2](v41);
    }
  }
}

uint64_t __159__PUCleanupToolController__addImageSpaceInpaintingStroke_closeAndFillStroke_needsPixellation_recordStroke_exclusionMask_exclusionMaskHitTestRadius_completion___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1296) | 0x10;
  }
  else {
    uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1296);
  }
  return [a2 appendStroke:*(void *)(a1 + 40) exclusionMasks:*(void *)(a1 + 48) options:v2];
}

- (void)addImageSpaceInpaintingStroke:(id)a3 exclusionMask:(id)a4 closeAndFillStroke:(BOOL)a5 needsPixellation:(BOOL)a6 recordStroke:(BOOL)a7 completion:(id)a8
{
  self->_BOOL didPixellate = 0;
  [(PUCleanupToolController *)self _addImageSpaceInpaintingStroke:a3 closeAndFillStroke:a5 needsPixellation:a6 recordStroke:a7 exclusionMask:a4 exclusionMaskHitTestRadius:a8 completion:self->_exclusionMaskHitTestRadius];
}

- (void)addDeclutter
{
  self->_BOOL didPixellate = 0;
  [(PUCleanupToolController *)self hidePromptViewIfNeeded];
  uint64_t v3 = (void *)MEMORY[0x1E4F8A2E8];
  BOOL v4 = [(PUCleanupToolController *)self maskContext];
  id v5 = [(PUPhotoEditToolController *)self compositionController];
  id v6 = [v5 composition];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PUCleanupToolController_addDeclutter__block_invoke;
  v7[3] = &unk_1E5F249D8;
  void v7[4] = self;
  [v3 createDeclutterMaskForContext:v4 composition:v6 completion:v7];
}

void __39__PUCleanupToolController_addDeclutter__block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) _createSubjectExclusionMask];
    id v5 = (void *)v4;
    id v6 = *(void **)(a1 + 32);
    if (v4)
    {
      v13[0] = v4;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      objc_msgSend(v6, "_displayProcessingWithSelectedMask:unselectedMaskImage:exclusionMasks:point:", v3, 0, v7, 0.0, 0.0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_displayProcessingWithSelectedMask:unselectedMaskImage:exclusionMasks:point:", v3, 0, MEMORY[0x1E4F1CBF0], 0.0, 0.0);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1296) = *(unsigned char *)(*(void *)(a1 + 32) + 1297);
    long long v8 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __39__PUCleanupToolController_addDeclutter__block_invoke_2;
    v10[3] = &unk_1E5F249B0;
    v10[4] = v8;
    id v11 = v3;
    id v12 = v5;
    id v9 = v5;
    [v8 modifyInpaintAdjustmentWithBlock:v10 actionStringKey:@"PHOTOEDIT_CLEANUP_CLEAN_UP_ACTION_TITLE" completion:0];
  }
}

void __39__PUCleanupToolController_addDeclutter__block_invoke_2(void *a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1[4] + 1296)) {
    uint64_t v4 = 5;
  }
  else {
    uint64_t v4 = 4;
  }
  v9[0] = a1[5];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  if (a1[6])
  {
    uint64_t v8 = a1[6];
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
    uint64_t v7 = 0;
    [v3 appendRemovalOperationWithMasks:v5 exclusionMasks:v6 options:v4 error:&v7];
  }
  else
  {
    uint64_t v7 = 0;
    [v3 appendRemovalOperationWithMasks:v5 exclusionMasks:MEMORY[0x1E4F1CBF0] options:v4 error:&v7];
  }
}

- (CGPoint)originalPointFromOverlayViewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v7 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v6, "toolController:originalPointFromViewPoint:view:", self, v7, x, y);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (float)scaledBrushRadiusForTouchType:(int64_t)a3
{
  LODWORD(v3) = 1.0;
  if (self->_cleanupMode - 1 <= 1)
  {
    LODWORD(v3) = 5.0;
    if (a3 != 2)
    {
      id v5 = objc_msgSend(MEMORY[0x1E4F91148], "globalSettings", v3);
      [v5 retouchDefaultModeBrushSizeDefault];
      float v7 = v6;

      BOOL v8 = [(PUCleanupToolController *)self isIpadLayout];
      *(float *)&double v3 = v7 * 1.25;
      if (!v8) {
        *(float *)&double v3 = v7;
      }
      defaultModeBrushSizeSlider = self->_defaultModeBrushSizeSlider;
      if (defaultModeBrushSizeSlider)
      {
        [(CEKSlider *)defaultModeBrushSizeSlider value];
        *(float *)&double v3 = v3;
      }
    }
  }
  return *(float *)&v3;
}

- (double)subjectExclusionMaskBrushRadiusForScreenSpaceRadius:(double)a3
{
  id v5 = [(PUPhotoEditToolController *)self delegate];
  double v6 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v5, "toolController:originalPointFromViewPoint:view:", self, v6, 0.0, 0.0);
  double v8 = v7;
  double v10 = v9;

  double v11 = [(PUPhotoEditToolController *)self delegate];
  double v12 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v11, "toolController:originalPointFromViewPoint:view:", self, v12, a3, 0.0);
  double v14 = v13;
  double v16 = v15;

  return ceil(sqrt((v10 - v16) * (v10 - v16) + (v8 - v14) * (v8 - v14)));
}

- (float)brushRadiusForTouchType:(int64_t)a3
{
  unint64_t cleanupMode = self->_cleanupMode;
  if (a3 != 2)
  {
    if (cleanupMode == 2)
    {
      double v6 = &OBJC_IVAR___PUCleanupToolController__brushModeBrushSizeSlider;
    }
    else
    {
      float v5 = 0.0;
      if (cleanupMode != 1) {
        goto LABEL_10;
      }
      double v6 = &OBJC_IVAR___PUCleanupToolController__defaultModeBrushSizeSlider;
    }
    [*(id *)((char *)&self->super.super.super.super.isa + *v6) value];
    float v5 = v7;
    goto LABEL_10;
  }
  if (cleanupMode) {
    float v5 = 5.0;
  }
  else {
    float v5 = 0.0;
  }
LABEL_10:
  double v8 = [(PUPhotoEditToolController *)self delegate];
  double v9 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v8, "toolController:originalPointFromViewPoint:view:", self, v9, 0.0, 0.0);
  double v11 = v10;
  double v13 = v12;

  double v14 = [(PUPhotoEditToolController *)self delegate];
  double v15 = [(PUCleanupOverlayViewController *)self->_overlayController view];
  objc_msgSend(v14, "toolController:originalPointFromViewPoint:view:", self, v15, v5, 0.0);
  double v17 = v16;
  double v19 = v18;

  return ceil(sqrt((v13 - v19) * (v13 - v19) + (v11 - v17) * (v11 - v17)));
}

- (void)reloadToolbarButtons:(BOOL)a3
{
  uint64_t v4 = [(PUPhotoEditToolController *)self delegate];
  char v5 = [v4 isLoopingVideo];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PUPhotoEditToolController *)self delegate];
    [v6 isStandardVideo];
  }
}

- (void)_addOverlayIfNeeded
{
  double v3 = [(PUPhotoEditToolController *)self delegate];
  char v4 = [v3 isLoopingVideo];

  if ((v4 & 1) == 0)
  {
    char v5 = [(PUPhotoEditToolController *)self delegate];
    char v6 = [v5 isStandardVideo];

    if ((v6 & 1) == 0 && !self->_overlayController)
    {
      double v7 = [(PUPhotoEditToolController *)self delegate];
      id v15 = [v7 mediaView];

      double v8 = [[PUCleanupOverlayViewController alloc] initWithMediaView:v15 isHDR:self->_needsHDRUI];
      overlayController = self->_overlayController;
      self->_overlayController = v8;

      [(PUCleanupOverlayViewController *)self->_overlayController setOverlayControllerDelegate:self];
      double v10 = [(PUCleanupOverlayViewController *)self->_overlayController view];
      [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      double v11 = [(PUCleanupOverlayViewController *)self->_overlayController view];
      [v11 setClipsToBounds:1];

      double v12 = [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay brushView];
      [(PUCleanupOverlayViewController *)self->_overlayController setVfxBrushView:v12];

      [(PUCleanupToolController *)self addChildViewController:self->_overlayController];
      [(PUCleanupOverlayViewController *)self->_overlayController didMoveToParentViewController:self];
      double v13 = [(PUCleanupToolController *)self view];
      double v14 = [(PUCleanupOverlayViewController *)self->_overlayController view];
      [v13 insertSubview:v14 atIndex:0];
    }
  }
}

- (void)sliderDidEndScrolling:(id)a3
{
}

- (void)sliderDidScroll:(id)a3
{
  double v9 = (CEKSlider *)a3;
  if (([(CEKSlider *)v9 isHidden] & 1) == 0)
  {
    char v4 = v9;
    if (self->_brushModeBrushSizeSlider == v9)
    {
      char v6 = &OBJC_IVAR___PUCleanupToolController__brushModeBrushSizeLabel;
    }
    else
    {
      if (self->_defaultModeBrushSizeSlider != v9)
      {
        id v5 = 0;
LABEL_8:
        [(CEKSlider *)v4 value];
        double v8 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", llround(v7));
        [v5 setText:v8];

        [(PUCleanupOverlayViewController *)self->_overlayController updateBrushSizeFeedback];
        goto LABEL_9;
      }
      char v6 = &OBJC_IVAR___PUCleanupToolController__defaultModeBrushSizeLabel;
    }
    id v5 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
    char v4 = v9;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)sliderWillBeginScrolling:(id)a3
{
}

- (void)_setBusy:(BOOL)a3
{
  self->_busdouble y = a3;
  if (!a3) {
    self->_progressDeladouble y = 15.0;
  }
}

- (void)_setBusy:(BOOL)a3 withDelay:(double)a4
{
  self->_progressDeladouble y = a4;
  [(PUCleanupToolController *)self _setBusy:a3];
}

- (void)_setShowCleanupBrushSizeSlider:(id)a3 show:(BOOL)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  id v7 = a3;
  if ([v7 isHidden] == v6)
  {
    if (v6) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke;
    aBlock[3] = &unk_1E5F2E0A8;
    id v9 = v7;
    id v19 = v9;
    double v20 = v8;
    double v10 = (void (**)(void))_Block_copy(aBlock);
    double v11 = v10;
    if (v5)
    {
      double v12 = (void *)MEMORY[0x1E4FB1EB0];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke_2;
      v16[3] = &unk_1E5F2EBA0;
      double v17 = v10;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      void v13[2] = __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke_3;
      v13[3] = &unk_1E5F2BA20;
      id v14 = v9;
      char v15 = v6;
      [v12 animateWithDuration:v16 animations:v13 completion:0.25];
    }
    else
    {
      v10[2](v10);
      [v9 setHidden:v6 ^ 1u];
    }
  }
}

uint64_t __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __71__PUCleanupToolController__setShowCleanupBrushSizeSlider_show_animate___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (void)leavingEditWithCancel
{
  id v2 = [(PUCleanupToolController *)self modelDeliveryManager];
  [v2 stopNetworkMonitoring];
}

- (void)prepareForSave:(BOOL)a3
{
  id v3 = [(PUCleanupToolController *)self modelDeliveryManager];
  [v3 stopNetworkMonitoring];
}

- (BOOL)supportsGesturesOfType:(unint64_t)a3
{
  return a3 > 3;
}

- (int64_t)toolControllerTag
{
  return 1004;
}

- (BOOL)wantsZoomAndPanEnabled
{
  return 1;
}

- (id)centerToolbarView
{
  return self->_resetButton;
}

- (BOOL)_canReset
{
  id v2 = [(PUPhotoEditToolController *)self compositionController];
  id v3 = [v2 inpaintAdjustmentController];

  if (v3)
  {
    char v4 = [v3 adjustment];
    BOOL v5 = [v4 objectForKeyedSubscript:@"operations"];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)toolbarIconAccessibilityLabel
{
  return PULocalizedString(@"PHOTOEDIT_CLEANUP_TOOLBAR_BUTTON_AX_LABEL");
}

- (id)selectedToolbarIconGlyphName
{
  return @"eraser.fill";
}

- (id)toolbarIconGlyphName
{
  return @"eraser";
}

- (id)localizedName
{
  return PULocalizedString(@"PHOTOEDIT_CLEANUP_TOOL_BUTTON");
}

- (id)trailingToolbarViews
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 retouchShowsBrushButton];

  if (v4)
  {
    BOOL v5 = [(PUCleanupToolController *)self brushModeButton];
    v8[0] = v5;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (void)didResignActiveTool
{
  v2.receiver = self;
  v2.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v2 didResignActiveTool];
}

- (void)willResignActiveTool
{
  id v3 = [(PUPhotoEditToolController *)self delegate];
  int v4 = [v3 mediaView];

  savedMediaViewScrollViewMinimumNumberOfTouches = self->_savedMediaViewScrollViewMinimumNumberOfTouches;
  if (savedMediaViewScrollViewMinimumNumberOfTouches)
  {
    uint64_t v6 = [(NSNumber *)savedMediaViewScrollViewMinimumNumberOfTouches unsignedIntegerValue];
    id v7 = [v4 _scrollView];
    double v8 = [v7 panGestureRecognizer];
    id v9 = v8;
    uint64_t v10 = v6;
  }
  else
  {
    id v7 = [v4 _scrollView];
    double v8 = [v7 panGestureRecognizer];
    id v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setMinimumNumberOfTouches:v10];

  double v11 = [(PUCleanupToolController *)self feedbackView];
  [v11 setHidden:1];

  v12.receiver = self;
  v12.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v12 willResignActiveTool];
}

- (void)didBecomeActiveTool
{
  v13.receiver = self;
  v13.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v13 didBecomeActiveTool];
  [(PUCleanupToolController *)self _prepareViewsForCleanupIfReady];
  id v3 = [(PUCleanupToolController *)self view];
  [v3 setNeedsUpdateConstraints];

  int v4 = [(PUPhotoEditToolController *)self delegate];
  BOOL v5 = [v4 mediaView];

  if (!self->_savedMediaViewScrollViewMinimumNumberOfTouches)
  {
    uint64_t v6 = NSNumber;
    id v7 = [v5 _scrollView];
    double v8 = [v7 panGestureRecognizer];
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v8, "minimumNumberOfTouches"));
    id v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    savedMediaViewScrollViewMinimumNumberOfTouches = self->_savedMediaViewScrollViewMinimumNumberOfTouches;
    self->_savedMediaViewScrollViewMinimumNumberOfTouches = v9;
  }
  double v11 = [v5 _scrollView];
  objc_super v12 = [v11 panGestureRecognizer];
  [v12 setMinimumNumberOfTouches:2];

  [(PUCleanupToolController *)self _updateFeedbackViewVisibility];
}

- (void)willBecomeActiveTool
{
  v2.receiver = self;
  v2.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v2 willBecomeActiveTool];
}

- (BOOL)canBecomeActiveTool
{
  return 1;
}

- (void)setLayoutOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v12 setLayoutOrientation:a3 withTransitionCoordinator:v6];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PUCleanupToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  void aBlock[4] = self;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  double v8 = v7;
  if (v6)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __74__PUCleanupToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E5F28AC0;
    uint64_t v10 = v7;
    [v6 animateAlongsideTransition:v9 completion:0];
  }
  else
  {
    v7[2](v7);
  }
}

void __74__PUCleanupToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  if (v2[147])
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 1176);
    *(void *)(v3 + 1176) = 0;

    objc_super v2 = *(void **)(a1 + 32);
  }
  id v5 = [v2 view];
  [v5 setNeedsUpdateConstraints];
}

uint64_t __74__PUCleanupToolController_setLayoutOrientation_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateToolConstraints
{
  v139[4] = *MEMORY[0x1E4F143B8];
  if (!self->_toolConstraints)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    toolConstraints = self->_toolConstraints;
    self->_toolConstraints = v3;

    if (self->_defaultModeBrushSizeSlider || self->_brushModeBrushSizeSlider)
    {
      id v5 = [(PUPhotoEditToolController *)self toolContainerView];
      v121 = v5;
      if ([(PUCleanupToolController *)self isPortrait]
        && ![(PUCleanupToolController *)self isIpadLayout])
      {
        defaultModeBrushSizeSlider = self->_defaultModeBrushSizeSlider;
        long long v120 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        v127[0] = *MEMORY[0x1E4F1DAB8];
        long long v113 = v127[0];
        v127[1] = v120;
        long long v128 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        long long v109 = v128;
        [(CEKSlider *)defaultModeBrushSizeSlider setTransform:v127];
        v96 = self->_toolConstraints;
        v105 = [(CEKSlider *)self->_defaultModeBrushSizeSlider heightAnchor];
        v102 = [v105 constraintEqualToConstant:66.0];
        v139[0] = v102;
        v99 = [(CEKSlider *)self->_defaultModeBrushSizeSlider widthAnchor];
        v97 = [v5 widthAnchor];
        id v24 = [v99 constraintEqualToAnchor:v97];
        v139[1] = v24;
        double v25 = [v5 centerXAnchor];
        id v26 = [(CEKSlider *)self->_defaultModeBrushSizeSlider centerXAnchor];
        double v27 = [v25 constraintEqualToAnchor:v26];
        v139[2] = v27;
        double v28 = [v5 bottomAnchor];
        id v29 = [(CEKSlider *)self->_defaultModeBrushSizeSlider bottomAnchor];
        long long v30 = [v28 constraintEqualToAnchor:v29 constant:0.0];
        v139[3] = v30;
        uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v139 count:4];
        [(NSMutableArray *)v96 addObjectsFromArray:v31];

        int v32 = self->_toolConstraints;
        char v33 = [(UILabel *)self->_defaultModeBrushSizeLabel centerXAnchor];
        char v34 = [(CEKSlider *)self->_defaultModeBrushSizeSlider centerXAnchor];
        id v35 = [v33 constraintEqualToAnchor:v34];
        v138[0] = v35;
        double v36 = [(UILabel *)self->_defaultModeBrushSizeLabel bottomAnchor];
        BOOL v37 = [(CEKSlider *)self->_defaultModeBrushSizeSlider topAnchor];
        uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:10.0];
        v138[1] = v38;
        id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
        [(NSMutableArray *)v32 addObjectsFromArray:v39];

        brushModeBrushSizeSlider = self->_brushModeBrushSizeSlider;
        v126[0] = v113;
        v126[1] = v120;
        v126[2] = v109;
        [(CEKSlider *)brushModeBrushSizeSlider setTransform:v126];
        v106 = self->_toolConstraints;
        *(void *)&long long v120 = [(CEKSlider *)self->_brushModeBrushSizeSlider heightAnchor];
        v117 = [(id)v120 constraintEqualToConstant:66.0];
        v137[0] = v117;
        *(void *)&long long v113 = [(CEKSlider *)self->_brushModeBrushSizeSlider widthAnchor];
        *(void *)&long long v109 = [v121 widthAnchor];
        long long v41 = [(id)v113 constraintEqualToAnchor:(void)v109];
        v137[1] = v41;
        id v42 = [v121 centerXAnchor];
        long long v43 = [(CEKSlider *)self->_brushModeBrushSizeSlider centerXAnchor];
        id v44 = [v42 constraintEqualToAnchor:v43];
        v137[2] = v44;
        id v45 = [v121 bottomAnchor];
        BOOL v46 = [(CEKSlider *)self->_brushModeBrushSizeSlider bottomAnchor];
        id v47 = [v45 constraintEqualToAnchor:v46 constant:0.0];
        v137[3] = v47;
        v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:4];
        [(NSMutableArray *)v106 addObjectsFromArray:v48];

        v49 = self->_toolConstraints;
        uint64_t v50 = [(UILabel *)self->_brushModeBrushSizeLabel centerXAnchor];
        v51 = [(CEKSlider *)self->_brushModeBrushSizeSlider centerXAnchor];
        v52 = [v50 constraintEqualToAnchor:v51];
        v136[0] = v52;
        uint64_t v53 = [(UILabel *)self->_brushModeBrushSizeLabel bottomAnchor];
        v54 = [(CEKSlider *)self->_brushModeBrushSizeSlider topAnchor];
        id v55 = [v53 constraintEqualToAnchor:v54 constant:10.0];
        v136[1] = v55;
        v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:2];
        [(NSMutableArray *)v49 addObjectsFromArray:v56];

        id v57 = v121;
      }
      else
      {
        id v6 = objc_alloc_init(MEMORY[0x1E4FB1940]);
        [v5 addLayoutGuide:v6];
        v112 = self->_toolConstraints;
        id v7 = [v6 widthAnchor];
        double v8 = [v7 constraintEqualToConstant:66.0];
        v135[0] = v8;
        id v9 = [v6 heightAnchor];
        uint64_t v10 = [v5 heightAnchor];
        double v11 = [v9 constraintEqualToAnchor:v10];
        v135[1] = v11;
        objc_super v12 = [v5 centerYAnchor];
        v119 = v6;
        objc_super v13 = [v6 centerYAnchor];
        id v14 = [v12 constraintEqualToAnchor:v13];
        v135[2] = v14;
        char v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:3];
        [(NSMutableArray *)v112 addObjectsFromArray:v15];

        if ([(PUPhotoEditToolController *)self layoutOrientation] == 2
          || [(PUCleanupToolController *)self isIpadLayout])
        {
          double v16 = v121;
          double v17 = self->_toolConstraints;
          double v18 = [v121 rightAnchor];
          id v19 = [v119 rightAnchor];
          double v20 = [v18 constraintEqualToAnchor:v19 constant:0.0];
          v134 = v20;
          double v21 = (void *)MEMORY[0x1E4F1C978];
          double v22 = &v134;
        }
        else
        {
          double v16 = v121;
          double v17 = self->_toolConstraints;
          double v18 = [v121 leftAnchor];
          id v19 = [v119 leftAnchor];
          double v20 = [v18 constraintEqualToAnchor:v19];
          v133 = v20;
          double v21 = (void *)MEMORY[0x1E4F1C978];
          double v22 = &v133;
        }
        id v58 = [v21 arrayWithObjects:v22 count:1];
        [(NSMutableArray *)v17 addObjectsFromArray:v58];

        v114 = self->_toolConstraints;
        char v59 = [(UILabel *)self->_defaultModeBrushSizeLabel centerYAnchor];
        char v60 = [(CEKSlider *)self->_defaultModeBrushSizeSlider centerYAnchor];
        id v61 = [v59 constraintEqualToAnchor:v60];
        v132[0] = v61;
        id v62 = [(UILabel *)self->_defaultModeBrushSizeLabel trailingAnchor];
        long long v63 = [v16 trailingAnchor];
        long long v64 = [v62 constraintEqualToAnchor:v63 constant:-56.0];
        v132[1] = v64;
        long long v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v132 count:2];
        [(NSMutableArray *)v114 addObjectsFromArray:v65];

        v100 = self->_toolConstraints;
        v115 = [(CEKSlider *)self->_defaultModeBrushSizeSlider heightAnchor];
        v110 = [v119 widthAnchor];
        v107 = [v115 constraintEqualToAnchor:v110];
        v131[0] = v107;
        v103 = [(CEKSlider *)self->_defaultModeBrushSizeSlider widthAnchor];
        long long v66 = [v119 heightAnchor];
        uint64_t v67 = [v103 constraintEqualToAnchor:v66];
        v131[1] = v67;
        uint64_t v68 = [(CEKSlider *)self->_defaultModeBrushSizeSlider centerXAnchor];
        id v69 = [v119 centerXAnchor];
        id v70 = [v68 constraintEqualToAnchor:v69];
        v131[2] = v70;
        v71 = [(CEKSlider *)self->_defaultModeBrushSizeSlider centerYAnchor];
        uint64_t v72 = [v119 centerYAnchor];
        v73 = [v71 constraintEqualToAnchor:v72];
        v131[3] = v73;
        v74 = [MEMORY[0x1E4F1C978] arrayWithObjects:v131 count:4];
        [(NSMutableArray *)v100 addObjectsFromArray:v74];

        int64_t v75 = [(PUPhotoEditToolController *)self layoutOrientation];
        double v76 = -1.57079633;
        CGFloat v77 = -1.57079633;
        if (v75 != 2)
        {
          BOOL v78 = [(PUCleanupToolController *)self isIpadLayout];
          CGFloat v77 = 1.57079633;
          if (v78) {
            CGFloat v77 = -1.57079633;
          }
        }
        CGAffineTransformMakeRotation(&v125, v77);
        v79 = self->_defaultModeBrushSizeSlider;
        CGAffineTransform v124 = v125;
        [(CEKSlider *)v79 setTransform:&v124];
        v118 = self->_toolConstraints;
        v80 = [(UILabel *)self->_brushModeBrushSizeLabel centerYAnchor];
        v81 = [(CEKSlider *)self->_brushModeBrushSizeSlider centerYAnchor];
        v82 = [v80 constraintEqualToAnchor:v81];
        v130[0] = v82;
        v83 = [(UILabel *)self->_brushModeBrushSizeLabel trailingAnchor];
        v84 = [v121 trailingAnchor];
        v85 = [v83 constraintEqualToAnchor:v84 constant:-56.0];
        v130[1] = v85;
        v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
        [(NSMutableArray *)v118 addObjectsFromArray:v86];

        v98 = self->_toolConstraints;
        v116 = [(CEKSlider *)self->_brushModeBrushSizeSlider heightAnchor];
        v111 = [v119 widthAnchor];
        v108 = [v116 constraintEqualToAnchor:v111];
        v129[0] = v108;
        v104 = [(CEKSlider *)self->_brushModeBrushSizeSlider widthAnchor];
        v101 = [v119 heightAnchor];
        v87 = [v104 constraintEqualToAnchor:v101];
        v129[1] = v87;
        v88 = [(CEKSlider *)self->_brushModeBrushSizeSlider centerXAnchor];
        v89 = [v119 centerXAnchor];
        v90 = [v88 constraintEqualToAnchor:v89];
        v129[2] = v90;
        v91 = [(CEKSlider *)self->_brushModeBrushSizeSlider centerYAnchor];
        v92 = [v119 centerYAnchor];
        v93 = [v91 constraintEqualToAnchor:v92];
        v129[3] = v93;
        v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:4];
        [(NSMutableArray *)v98 addObjectsFromArray:v94];

        if ([(PUPhotoEditToolController *)self layoutOrientation] != 2)
        {
          if ([(PUCleanupToolController *)self isIpadLayout]) {
            double v76 = -1.57079633;
          }
          else {
            double v76 = 1.57079633;
          }
        }
        CGAffineTransformMakeRotation(&v123, v76);
        v95 = self->_brushModeBrushSizeSlider;
        CGAffineTransform v122 = v123;
        [(CEKSlider *)v95 setTransform:&v122];
        id v57 = v121;
        uint64_t v50 = v119;
      }
    }
    [MEMORY[0x1E4F28DC8] activateConstraints:self->_toolConstraints];
  }
}

- (void)updateViewConstraints
{
  objc_super v2 = self;
  v172[4] = *MEMORY[0x1E4F143B8];
  [(PUCleanupToolController *)self _updateToolConstraints];
  uint64_t v3 = [(PUPhotoEditToolController *)v2 delegate];
  int v4 = [v3 mediaView];

  overlayController = v2->_overlayController;
  if (overlayController)
  {
    id v6 = [(PUCleanupOverlayViewController *)overlayController view];

    if (v6)
    {
      id v7 = [(PUCleanupOverlayViewController *)v2->_overlayController view];
      double v8 = [v7 widthAnchor];
      id v9 = [(PUCleanupToolController *)v2 view];
      uint64_t v10 = [v9 widthAnchor];
      double v11 = [v8 constraintEqualToAnchor:v10];
      [v11 setActive:1];

      objc_super v12 = [(PUCleanupOverlayViewController *)v2->_overlayController view];
      objc_super v13 = [v12 heightAnchor];
      id v14 = [(PUCleanupToolController *)v2 view];
      char v15 = [v14 heightAnchor];
      double v16 = [v13 constraintEqualToAnchor:v15];
      [v16 setActive:1];

      double v17 = [(PUCleanupOverlayViewController *)v2->_overlayController view];
      double v18 = [v17 centerXAnchor];
      id v19 = [(PUCleanupToolController *)v2 view];
      double v20 = [v19 centerXAnchor];
      double v21 = [v18 constraintEqualToAnchor:v20];
      [v21 setActive:1];

      double v22 = [(PUCleanupOverlayViewController *)v2->_overlayController view];
      uint64_t v23 = [v22 centerYAnchor];
      id v24 = [(PUCleanupToolController *)v2 view];
      double v25 = [v24 centerYAnchor];
      id v26 = [v23 constraintEqualToAnchor:v25];
      [v26 setActive:1];
    }
  }
  maskView = v2->_maskView;
  if (maskView)
  {
    double v28 = [(PUCleanupToolMaskView *)maskView window];

    if (v28)
    {
      id v29 = +[PUPhotoEditProtoSettings sharedInstance];
      uint64_t v30 = [v29 cleanupMaskDisplayMode];

      if (v30)
      {
        uint64_t v31 = [(PUCleanupToolMaskView *)v2->_maskView topAnchor];
        int v32 = [v4 imageTopAnchor];
        char v33 = [v31 constraintEqualToAnchor:v32];
        [v33 setActive:1];

        char v34 = [(PUCleanupToolMaskView *)v2->_maskView bottomAnchor];
        id v35 = [v4 imageBottomAnchor];
        double v36 = [v34 constraintEqualToAnchor:v35];
        [v36 setActive:1];

        BOOL v37 = [(PUCleanupToolMaskView *)v2->_maskView leftAnchor];
        uint64_t v38 = [v4 imageLeftAnchor];
        id v39 = [v37 constraintEqualToAnchor:v38];
        [v39 setActive:1];

        id v40 = [(PUCleanupToolMaskView *)v2->_maskView rightAnchor];
        long long v41 = [v4 imageRightAnchor];
        id v42 = [v40 constraintEqualToAnchor:v41];
        [v42 setActive:1];
      }
      else
      {
        long long v43 = [(PUPhotoEditToolController *)v2 delegate];
        id v44 = [v43 mediaView];
        id v40 = [v44 _visibleImageRectOverlayView];

        id v45 = [(PUCleanupToolMaskView *)v2->_maskView topAnchor];
        BOOL v46 = [v40 topAnchor];
        id v47 = [v45 constraintEqualToAnchor:v46];
        [v47 setActive:1];

        v48 = [(PUCleanupToolMaskView *)v2->_maskView bottomAnchor];
        v49 = [v40 bottomAnchor];
        uint64_t v50 = [v48 constraintEqualToAnchor:v49];
        [v50 setActive:1];

        v51 = [(PUCleanupToolMaskView *)v2->_maskView leftAnchor];
        v52 = [v40 leftAnchor];
        uint64_t v53 = [v51 constraintEqualToAnchor:v52];
        [v53 setActive:1];

        long long v41 = [(PUCleanupToolMaskView *)v2->_maskView rightAnchor];
        id v42 = [v40 rightAnchor];
        v54 = [v41 constraintEqualToAnchor:v42];
        [v54 setActive:1];
      }
    }
  }
  id v55 = +[PUPhotoEditProtoSettings sharedInstance];
  if ([v55 retouchShowsFaceRects])
  {
    faceRectsView = v2->_faceRectsView;
    if (faceRectsView)
    {
      id v57 = [(PUCleanupToolFaceRectsView *)faceRectsView window];

      if (!v57) {
        goto LABEL_15;
      }
      id v58 = [(PUCleanupToolFaceRectsView *)v2->_faceRectsView topAnchor];
      char v59 = [v4 imageTopAnchor];
      char v60 = [v58 constraintEqualToAnchor:v59];
      [v60 setActive:1];

      id v61 = [(PUCleanupToolFaceRectsView *)v2->_faceRectsView bottomAnchor];
      id v62 = [v4 imageBottomAnchor];
      long long v63 = [v61 constraintEqualToAnchor:v62];
      [v63 setActive:1];

      long long v64 = [(PUCleanupToolFaceRectsView *)v2->_faceRectsView leftAnchor];
      long long v65 = [v4 imageLeftAnchor];
      long long v66 = [v64 constraintEqualToAnchor:v65];
      [v66 setActive:1];

      id v55 = [(PUCleanupToolFaceRectsView *)v2->_faceRectsView rightAnchor];
      uint64_t v67 = [v4 imageRightAnchor];
      uint64_t v68 = [v55 constraintEqualToAnchor:v67];
      [v68 setActive:1];
    }
  }

LABEL_15:
  retouchVFXOverladouble y = v2->_retouchVFXOverlay;
  if (retouchVFXOverlay)
  {
    id v70 = [(PUVFXRetouchOverlay *)retouchVFXOverlay topAnchor];
    v71 = [v4 imageTopAnchor];
    uint64_t v72 = [v70 constraintEqualToAnchor:v71];
    [v72 setActive:1];

    v73 = [(PUVFXRetouchOverlay *)v2->_retouchVFXOverlay bottomAnchor];
    v74 = [v4 imageBottomAnchor];
    int64_t v75 = [v73 constraintEqualToAnchor:v74];
    [v75 setActive:1];

    double v76 = [(PUVFXRetouchOverlay *)v2->_retouchVFXOverlay leftAnchor];
    CGFloat v77 = [v4 imageLeftAnchor];
    BOOL v78 = [v76 constraintEqualToAnchor:v77];
    [v78 setActive:1];

    v79 = [(PUVFXRetouchOverlay *)v2->_retouchVFXOverlay rightAnchor];
    v80 = [v4 imageRightAnchor];
    v81 = [v79 constraintEqualToAnchor:v80];
    [v81 setActive:1];
  }
  unint64_t v82 = 0x1E4F28000uLL;
  if (v2->_userPromptView)
  {
    [MEMORY[0x1E4F28DC8] deactivateConstraints:v2->_userPromptViewConstraints];
    v83 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userPromptViewConstraints = v2->_userPromptViewConstraints;
    v2->_userPromptViewConstraints = v83;

    v152 = v2->_userPromptViewConstraints;
    v166 = [(PUCleanupUserPromptView *)v2->_userPromptView heightAnchor];
    v164 = [v166 constraintGreaterThanOrEqualToConstant:44.0];
    v172[0] = v164;
    v160 = [(PUCleanupUserPromptView *)v2->_userPromptView leadingAnchor];
    v162 = [(PUCleanupToolController *)v2 view];
    v158 = [v162 superview];
    v156 = [v158 leadingAnchor];
    v154 = [v160 constraintEqualToAnchor:v156];
    v172[1] = v154;
    v148 = [(PUCleanupUserPromptView *)v2->_userPromptView trailingAnchor];
    v150 = [(PUCleanupToolController *)v2 view];
    v146 = [v150 superview];
    v144 = [v146 trailingAnchor];
    v85 = [v148 constraintEqualToAnchor:v144];
    v172[2] = v85;
    v86 = [(PUCleanupUserPromptView *)v2->_userPromptView bottomAnchor];
    v87 = [(PUCleanupToolController *)v2 view];
    v88 = [v87 safeAreaLayoutGuide];
    v89 = [v88 bottomAnchor];
    [v86 constraintEqualToAnchor:v89];
    v91 = v90 = v2;
    v172[3] = v91;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:4];
    v93 = v92 = v4;
    [(NSMutableArray *)v152 addObjectsFromArray:v93];

    int v4 = v92;
    unint64_t v82 = 0x1E4F28000uLL;

    objc_super v2 = v90;
    [MEMORY[0x1E4F28DC8] activateConstraints:v90->_userPromptViewConstraints];
  }
  [(PUCleanupToolController *)v2 _updatePreparingProgressConstraints];
  v94 = [(PUCleanupToolController *)v2 feedbackView];
  if (v94)
  {
    v95 = [(PUCleanupToolController *)v2 feedbackViewContainerConstraints];

    if (v95)
    {
      v96 = (void *)MEMORY[0x1E4F28DC8];
      v97 = [(PUCleanupToolController *)v2 feedbackViewContainerConstraints];
      [v96 deactivateConstraints:v97];

      [(PUCleanupToolController *)v2 setFeedbackViewContainerConstraints:0];
    }
    v98 = [MEMORY[0x1E4F1CA48] array];
    v99 = [(PUCleanupToolController *)v2 feedbackThumbsUpButton];
    v100 = [(PUCleanupToolController *)v2 feedbackThumbsDownButton];
    BOOL v101 = [(PUCleanupToolController *)v2 isIpadLayout];
    v167 = v100;
    v168 = v99;
    if (v101 || [(PUPhotoEditToolController *)v2 layoutOrientation] == 2)
    {
      v129 = v4;
      v102 = [v99 topAnchor];
      v163 = [v94 topAnchor];
      v165 = v102;
      v161 = objc_msgSend(v102, "constraintEqualToAnchor:constant:", 16.0);
      v171[0] = v161;
      v103 = [v100 topAnchor];
      v157 = [v99 bottomAnchor];
      v159 = v103;
      v155 = objc_msgSend(v103, "constraintEqualToAnchor:constant:", 16.0);
      v171[1] = v155;
      v104 = [v100 bottomAnchor];
      v151 = [v94 bottomAnchor];
      v153 = v104;
      v149 = objc_msgSend(v104, "constraintEqualToAnchor:constant:", -16.0);
      v171[2] = v149;
      v105 = [v99 leftAnchor];
      v145 = [v94 leftAnchor];
      v147 = v105;
      v143 = objc_msgSend(v105, "constraintEqualToAnchor:constant:", 7.0);
      v171[3] = v143;
      v106 = [v99 rightAnchor];
      v141 = [v94 rightAnchor];
      v142 = v106;
      v140 = objc_msgSend(v106, "constraintEqualToAnchor:constant:", -7.0);
      v171[4] = v140;
      v107 = [v100 leftAnchor];
      v138 = [v94 leftAnchor];
      v139 = v107;
      v137 = objc_msgSend(v107, "constraintEqualToAnchor:constant:", 7.0);
      v171[5] = v137;
      v108 = [v100 rightAnchor];
      v135 = [v94 rightAnchor];
      v136 = v108;
      v134 = objc_msgSend(v108, "constraintEqualToAnchor:constant:", -7.0);
      v171[6] = v134;
      long long v109 = [v94 centerYAnchor];
      v132 = [(PUCleanupToolController *)v2 view];
      v131 = [v132 superview];
      [v131 centerYAnchor];
      v130 = v133 = v109;
      v110 = objc_msgSend(v109, "constraintEqualToAnchor:");
      v171[7] = v110;
      v111 = v98;
      if (v101)
      {
        v112 = [v94 rightAnchor];
        long long v113 = v2;
        v114 = [(PUCleanupToolController *)v2 view];
        v115 = [v114 safeAreaLayoutGuide];
        v116 = [v115 rightAnchor];
        double v117 = -27.0;
      }
      else
      {
        v112 = [v94 leftAnchor];
        long long v113 = v2;
        v114 = [(PUCleanupToolController *)v2 view];
        v115 = [v114 safeAreaLayoutGuide];
        v116 = [v115 leftAnchor];
        double v117 = 18.0;
      }
      v118 = [v112 constraintEqualToAnchor:v116 constant:v117];
      v171[8] = v118;
      v119 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:9];
      [v111 addObjectsFromArray:v119];

      int v4 = v129;
      objc_super v2 = v113;
      unint64_t v82 = 0x1E4F28000;
    }
    else
    {
      long long v120 = [v99 topAnchor];
      v163 = [v94 topAnchor];
      v165 = v120;
      v161 = objc_msgSend(v120, "constraintEqualToAnchor:constant:", 7.0);
      v170[0] = v161;
      v121 = [v99 bottomAnchor];
      v157 = [v94 bottomAnchor];
      v159 = v121;
      v155 = objc_msgSend(v121, "constraintEqualToAnchor:constant:", -7.0);
      v170[1] = v155;
      CGAffineTransform v122 = [v100 topAnchor];
      v151 = [v99 topAnchor];
      v153 = v122;
      v149 = objc_msgSend(v122, "constraintEqualToAnchor:constant:", 0.0);
      v170[2] = v149;
      CGAffineTransform v123 = [v99 leftAnchor];
      v145 = [v94 leftAnchor];
      v147 = v123;
      v143 = objc_msgSend(v123, "constraintEqualToAnchor:constant:", 16.0);
      v170[3] = v143;
      CGAffineTransform v124 = [v99 rightAnchor];
      v141 = [v100 leftAnchor];
      v142 = v124;
      v140 = objc_msgSend(v124, "constraintEqualToAnchor:constant:", -16.0);
      v170[4] = v140;
      CGAffineTransform v125 = [v100 rightAnchor];
      v138 = [v94 rightAnchor];
      v139 = v125;
      v137 = objc_msgSend(v125, "constraintEqualToAnchor:constant:", -16.0);
      v170[5] = v137;
      v126 = [v94 centerXAnchor];
      v135 = [(PUCleanupToolController *)v2 view];
      v134 = [v135 superview];
      [v134 centerXAnchor];
      v133 = v136 = v126;
      v132 = objc_msgSend(v126, "constraintEqualToAnchor:");
      v170[6] = v132;
      v127 = [v94 centerYAnchor];
      v130 = [(PUCleanupToolController *)v2 view];
      v110 = [v130 safeAreaLayoutGuide];
      v112 = [v110 bottomAnchor];
      v131 = v127;
      v114 = [v127 constraintEqualToAnchor:v112 constant:-92.0];
      v170[7] = v114;
      v115 = [MEMORY[0x1E4F1C978] arrayWithObjects:v170 count:8];
      [v98 addObjectsFromArray:v115];
      v111 = v98;
    }

    long long v128 = [v94 layer];
    [v128 setCornerRadius:17.0];

    [*(id *)(v82 + 3528) activateConstraints:v111];
    [(PUCleanupToolController *)v2 setFeedbackViewContainerConstraints:v111];
  }
  v169.receiver = v2;
  v169.super_class = (Class)PUCleanupToolController;
  [(PUCleanupToolController *)&v169 updateViewConstraints];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PUCleanupToolController;
  -[PUPhotoEditToolController viewWillTransitionToSize:withTransitionCoordinator:](&v26, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  userPromptView = self->_userPromptView;
  if (userPromptView)
  {
    char v9 = [(PUCleanupUserPromptView *)userPromptView isHidden] ^ 1;
    uint64_t v10 = self->_userPromptView;
    if (v10)
    {
      uint64_t v11 = [(PUCleanupUserPromptView *)v10 type];
      goto LABEL_6;
    }
  }
  else
  {
    char v9 = 0;
  }
  uint64_t v11 = 1;
LABEL_6:
  [(PUCleanupToolController *)self deleteUserPromptViewAnimated:0 completion:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  aBlock[3] = &unk_1E5F2D968;
  char v25 = v9;
  void aBlock[4] = self;
  void aBlock[5] = v11;
  objc_super v12 = _Block_copy(aBlock);
  objc_super v13 = +[PUPhotoEditProtoSettings sharedInstance];
  uint64_t v14 = [v13 cleanupMaskDisplayMode];

  if (v14)
  {
    maskView = self->_maskView;
    if (maskView) {
      [(PUCleanupToolMaskView *)maskView setAlpha:0.0];
    }
    double v16 = +[PUPhotoEditProtoSettings sharedInstance];
    int v17 = [v16 retouchShowsFaceRects];

    if (v17) {
      [(PUCleanupToolFaceRectsView *)self->_faceRectsView setAlpha:0.0];
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
    v19[3] = &unk_1E5F24988;
    v19[4] = self;
    id v20 = v12;
    [v7 animateAlongsideTransition:0 completion:v19];
    double v18 = v20;
    goto LABEL_14;
  }
  if (self->_retouchVFXOverlay)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    _OWORD v23[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v23[3] = &unk_1E5F2ED10;
    v23[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v23];
    [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay setHidden:1];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v21[3] = &unk_1E5F24988;
    v21[4] = self;
    id v22 = v12;
    [v7 animateAlongsideTransition:0 completion:v21];
    double v18 = v22;
LABEL_14:
  }
}

uint64_t __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 48)) {
    return [*(id *)(result + 32) addUserPromptViewOfType:*(void *)(result + 40) animated:1];
  }
  return result;
}

void __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:0.0];
  objc_super v2 = +[PUPhotoEditProtoSettings sharedInstance];
  int v3 = [v2 retouchShowsFaceRects];

  if (v3)
  {
    int v4 = *(void **)(*(void *)(a1 + 32) + 1400);
    [v4 setAlpha:0.0];
  }
}

uint64_t __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  dispatch_after(v2, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
  v5[3] = &unk_1E5F2ED10;
  uint64_t v6 = *(void *)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
  v4[3] = &unk_1E5F2CEE8;
  void v4[4] = v6;
  return [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 options:v4 animations:0.1 completion:0.5];
}

void __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  dispatch_after(v2, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(void *)(v3 + 1328))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7;
    v5[3] = &unk_1E5F2ED10;
    void v5[4] = v3;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8;
    v4[3] = &unk_1E5F2CEE8;
    void v4[4] = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 options:v4 animations:0.1 completion:0.5];
  }
}

uint64_t __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:1.0];
}

void __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8(uint64_t a1)
{
  dispatch_time_t v2 = +[PUPhotoEditProtoSettings sharedInstance];
  int v3 = [v2 retouchShowsFaceRects];

  if (v3)
  {
    [*(id *)(a1 + 32) _updateFaceRectsView];
    int v4 = *(void **)(*(void *)(a1 + 32) + 1400);
    [v4 setAlpha:1.0];
  }
}

uint64_t __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1264) setAlpha:1.0];
}

void __78__PUCleanupToolController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1264) setHidden:0];
  dispatch_time_t v2 = +[PUPhotoEditProtoSettings sharedInstance];
  int v3 = [v2 retouchShowsFaceRects];

  if (v3)
  {
    [*(id *)(a1 + 32) _updateFaceRectsView];
    int v4 = *(void **)(*(void *)(a1 + 32) + 1400);
    [v4 setAlpha:1.0];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v25 viewDidAppear:a3];
  int v4 = [(PUCleanupToolMaskView *)self->_maskView superview];

  if (!v4) {
    [(PUCleanupToolController *)self _setAwaitingMediaView:1];
  }
  id v5 = [(PUCleanupToolController *)self modelDeliveryManager];
  char v6 = [v5 ready];

  if (v6)
  {
    [(PUCleanupToolController *)self _prepareViewsForCleanupIfReady];
    id v7 = +[PUPhotoEditProtoSettings sharedInstance];
    uint64_t v8 = [v7 cleanupMaskDisplayMode];

    if (v8)
    {
      if (self->_maskView)
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_2_102;
        v17[3] = &unk_1E5F2ED10;
        v17[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v17 options:0 animations:0.1 completion:0.4];
      }
    }
    else
    {
      retouchVFXOverladouble y = self->_retouchVFXOverlay;
      if (retouchVFXOverlay)
      {
        uint64_t v11 = [(PUVFXRetouchOverlay *)retouchVFXOverlay layer];
        [v11 setOpacity:0.0];

        dispatch_time_t v12 = dispatch_time(0, 350000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_101;
        block[3] = &unk_1E5F2ED10;
        block[4] = self;
        dispatch_after(v12, MEMORY[0x1E4F14428], block);
      }
    }
  }
  else
  {
    char v9 = [(PUCleanupToolController *)self modelDeliveryProgressViewController];

    if (v9)
    {
      [(PUCleanupToolController *)self _updatePreparingProgressConstraints];
    }
    else
    {
      objc_initWeak(&location, self);
      id v13 = objc_alloc_init(MEMORY[0x1E4F90360]);
      [(PUCleanupToolController *)self setModelDeliveryProgressViewController:v13];

      uint64_t v14 = [(PUCleanupToolController *)self modelDeliveryManager];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke;
      v22[3] = &unk_1E5F24960;
      objc_copyWeak(&v23, &location);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_98;
      v20[3] = &unk_1E5F2D940;
      objc_copyWeak(&v21, &location);
      [v14 preparePackageWithProgress:v22 updateHandler:v20];

      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_3;
      v19[3] = &unk_1E5F2ED10;
      v19[4] = self;
      dispatch_after(v15, MEMORY[0x1E4F14428], v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
    }
  }
  double v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 addObserver:self selector:sel__willUndo_ name:*MEMORY[0x1E4F28A98] object:0];
  [v16 addObserver:self selector:sel__willRedo_ name:*MEMORY[0x1E4F28A90] object:0];
  [v16 addObserver:self selector:sel__didUndo_ name:*MEMORY[0x1E4F28A80] object:0];
  [v16 addObserver:self selector:sel__didRedo_ name:*MEMORY[0x1E4F28A78] object:0];
  [v16 addObserver:self selector:sel__applicationWillResignActive_ name:*MEMORY[0x1E4FB2738] object:0];
  [v16 addObserver:self selector:sel__applicationDidBecomeActive_ name:*MEMORY[0x1E4FB2628] object:0];
}

void __41__PUCleanupToolController_viewDidAppear___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v6 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = a2;
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "model delivery progress: %d / %f", (uint8_t *)v9, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = [WeakRetained modelDeliveryProgressViewController];
  [v8 reportProgress:a2 stage:a3];
}

void __41__PUCleanupToolController_viewDidAppear___block_invoke_98(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v13 = a2;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "model delivery completion with success: %d / error: %@", buf, 0x12u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_99;
  block[3] = &unk_1E5F2A840;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  char v11 = a2;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v10);
}

void __41__PUCleanupToolController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1AE9F8000, v2, OS_LOG_TYPE_DEFAULT, "model delivery progress UI ready to show", v5, 2u);
  }

  int v3 = [*(id *)(a1 + 32) modelDeliveryManager];
  char v4 = [v3 ready];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _showPreparingProgress];
  }
}

void __41__PUCleanupToolController_viewDidAppear___block_invoke_101(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1264) layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

uint64_t __41__PUCleanupToolController_viewDidAppear___block_invoke_2_102(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:1.0];
}

void __41__PUCleanupToolController_viewDidAppear___block_invoke_99(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 48))
  {
    [WeakRetained _prepareViewsForCleanupIfReady];
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [WeakRetained modelDeliveryProgressViewController];
    char v6 = v5;
    if (v4) {
      [v5 setErrorState:*(void *)(a1 + 32)];
    }
    else {
      [v5 clearErrorState];
    }

    [v3 setModelDeliveryProgressInErrorState:*(void *)(a1 + 32) != 0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PUCleanupToolController_viewDidAppear___block_invoke_2;
    block[3] = &unk_1E5F2ED10;
    void block[4] = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __41__PUCleanupToolController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePreparingProgressConstraints];
}

- (void)_updateMaskContext
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__PUCleanupToolController__updateMaskContext__block_invoke;
  aBlock[3] = &unk_1E5F2ED10;
  void aBlock[4] = self;
  int v3 = (void (**)(void))_Block_copy(aBlock);
  if (self->_maskContext)
  {
    uint64_t v4 = [(PUCleanupToolController *)self view];
    uint64_t v5 = [v4 window];
    if (v5)
    {
      char v6 = (void *)v5;
      BOOL v7 = [(PUPhotoEditToolController *)self isActiveTool];

      if (v7)
      {
        v3[2](v3);
        goto LABEL_11;
      }
    }
    else
    {
    }
    char v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_DEBUG, "Cleanup: maskContext present, but window no longer exists", v12, 2u);
    }
  }
  else if (!self->_maskContextCreationHasBegun)
  {
    self->_maskContextCreationHasBegun = 1;
    uint64_t v8 = (void *)MEMORY[0x1E4F8A2E8];
    id v9 = [(PUPhotoEditToolController *)self compositionController];
    id v10 = [v9 composition];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __45__PUCleanupToolController__updateMaskContext__block_invoke_4;
    v13[3] = &unk_1E5F24938;
    void v13[4] = self;
    __int16 v14 = v3;
    [v8 createMaskContextForComposition:v10 requestID:0 completionQueue:MEMORY[0x1E4F14428] completion:v13];
  }
LABEL_11:
}

uint64_t __45__PUCleanupToolController__updateMaskContext__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _addOverlayIfNeeded];
  [*(id *)(a1 + 32) _createMaskView];
  [*(id *)(a1 + 32) _createVFXMaskOverlays];
  dispatch_time_t v2 = dispatch_time(0, 250000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PUCleanupToolController__updateMaskContext__block_invoke_2;
  block[3] = &unk_1E5F2ED10;
  void block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  int v3 = +[PUPhotoEditProtoSettings sharedInstance];
  int v4 = [v3 retouchShowsFaceRects];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 250000000);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __45__PUCleanupToolController__updateMaskContext__block_invoke_3;
    v18[3] = &unk_1E5F2ED10;
    v18[4] = *(void *)(a1 + 32);
    char v6 = (void *)MEMORY[0x1E4F14428];
    dispatch_after(v5, MEMORY[0x1E4F14428], v18);
  }
  BOOL v7 = [*(id *)(a1 + 32) view];
  [v7 setNeedsUpdateConstraints];

  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[165];
  if (v9 == 2)
  {
LABEL_6:
    [v8 _updateMaskViewForBrushMode];
    goto LABEL_8;
  }
  if (v9 != 1)
  {
    if (v9) {
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  [v8 _updateMaskViewForDefaultModeIfNecessary];
LABEL_8:
  id v10 = +[PUPhotoEditProtoSettings sharedInstance];
  int v11 = [v10 retouchEnablesSensitivityCheck];

  uint64_t v12 = *(void *)(a1 + 32);
  if (v11)
  {
    [*(id *)(v12 + 1352) initialSensitivityScore];
    *(unsigned char *)(*(void *)(a1 + 32) + 1297) = [MEMORY[0x1E4F8A3A0] currentSensitivityExceedsThresholds:v13 initialSensitivity:v13];
  }
  else
  {
    *(unsigned char *)(v12 + 1297) = 0;
  }
  uint64_t result = [*(id *)(a1 + 32) _canReset];
  uint64_t v15 = *(void *)(a1 + 32);
  if ((!result || !*(unsigned char *)(v15 + 1299)) && !*(unsigned char *)(v15 + 1298))
  {
    *(unsigned char *)(v15 + 1299) = 1;
    uint64_t v16 = *(unsigned char **)(a1 + 32);
    if (v16[1297]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 1;
    }
    return [v16 addUserPromptViewOfType:v17 animated:1];
  }
  return result;
}

void __45__PUCleanupToolController__updateMaskContext__block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setMaskContext:a2];
  int v3 = [*(id *)(a1 + 32) view];
  uint64_t v4 = [v3 window];
  if (v4)
  {
    dispatch_time_t v5 = (void *)v4;
    int v6 = [*(id *)(a1 + 32) isActiveTool];

    if (v6)
    {
      BOOL v7 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      v7();
      return;
    }
  }
  else
  {
  }
  uint64_t v8 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEBUG, "Cleanup: in maskContext creation completion block, but window no longer exists", v9, 2u);
  }
}

uint64_t __45__PUCleanupToolController__updateMaskContext__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1184) createBrushView];
}

uint64_t __45__PUCleanupToolController__updateMaskContext__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _createFaceRectsView];
  dispatch_time_t v2 = *(void **)(a1 + 32);
  return [v2 _updateFaceRectsView];
}

- (void)_prepareViewsForCleanupIfReadyAndNotify:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    _PFAssertFailHandler();
  }
  if (!self->_mediaViewIsReady) {
    goto LABEL_10;
  }
  dispatch_time_t v5 = [(PUCleanupToolController *)self modelDeliveryManager];
  if (![v5 ready]) {
    goto LABEL_9;
  }
  int v6 = [(PUPhotoEditToolController *)self delegate];
  uint64_t v7 = [v6 mediaView];
  if (!v7)
  {

LABEL_9:
    goto LABEL_10;
  }
  uint64_t v8 = (void *)v7;
  BOOL v9 = [(PUPhotoEditToolController *)self isActiveTool];

  if (v9)
  {
    if (self->_cleanupViewsHaveBeenPrepared)
    {
      [(PUCleanupToolController *)self _updateMaskContext];
LABEL_44:
      if (v4) {
        v4[2](v4);
      }
      goto LABEL_25;
    }
    [(PUCleanupToolController *)self _removePreparingProgress];
    [(PUCleanupToolController *)self _updateResetButtonState];
    BOOL v21 = self->_cleanupMode - 3 < 0xFFFFFFFFFFFFFFFELL;
    id v22 = [(PUPhotoEditToolController *)self delegate];
    [v22 toolControllerDidChangeWantsTapToToggleOriginalEnabled:self enabled:v21];

    [(PUCleanupToolController *)self _updateMaskContext];
    [(PUCleanupToolController *)self _addOverlayIfNeeded];
    [(PUCleanupToolController *)self _setAwaitingMediaView:0];
    [(PUCleanupToolController *)self _setCleanupMode:1];
    overlayController = self->_overlayController;
    if (overlayController) {
      [(PUCleanupOverlayViewController *)overlayController mediaViewIsReady];
    }
    id v24 = [(PUCleanupToolController *)self view];
    [v24 setNeedsUpdateConstraints];

    maskView = self->_maskView;
    if (!maskView)
    {
LABEL_35:
      double v27 = +[PUPhotoEditProtoSettings sharedInstance];
      [v27 addKeyObserver:self];

      self->_cleanupViewsHaveBeenPrepared = 1;
      tasksWaitingOnCleanupReaddouble y = self->_tasksWaitingOnCleanupReady;
      if (tasksWaitingOnCleanupReady)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v29 = tasksWaitingOnCleanupReady;
        uint64_t v30 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v36 != v32) {
                objc_enumerationMutation(v29);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v35 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v35 + 1) + 8 * i));
            }
            uint64_t v31 = [(NSMutableArray *)v29 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v31);
        }

        char v34 = self->_tasksWaitingOnCleanupReady;
        self->_tasksWaitingOnCleanupReaddouble y = 0;
      }
      goto LABEL_44;
    }
    [(PUCleanupToolMaskView *)maskView setAlpha:0.0];
    unint64_t cleanupMode = self->_cleanupMode;
    switch(cleanupMode)
    {
      case 2uLL:
        goto LABEL_32;
      case 1uLL:
        [(PUCleanupToolController *)self _updateMaskViewForDefaultModeIfNecessary];
        break;
      case 0uLL:
LABEL_32:
        [(PUCleanupToolController *)self _updateMaskViewForBrushMode];
        break;
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __67__PUCleanupToolController__prepareViewsForCleanupIfReadyAndNotify___block_invoke;
    v39[3] = &unk_1E5F2ED10;
    v39[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v39 options:0 animations:0.1 completion:0.4];
    goto LABEL_35;
  }
LABEL_10:
  id v10 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    if (self->_mediaViewIsReady) {
      int v11 = @"YES";
    }
    else {
      int v11 = @"NO";
    }
    uint64_t v12 = [(PUCleanupToolController *)self modelDeliveryManager];
    if ([v12 ready]) {
      double v13 = @"YES";
    }
    else {
      double v13 = @"NO";
    }
    __int16 v14 = [(PUPhotoEditToolController *)self delegate];
    uint64_t v15 = [v14 mediaView];
    *(_DWORD *)buf = 138413058;
    if ([(PUPhotoEditToolController *)self isActiveTool]) {
      uint64_t v16 = @"YES";
    }
    else {
      uint64_t v16 = @"NO";
    }
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v13;
    __int16 v45 = 2112;
    BOOL v46 = v15;
    __int16 v47 = 2112;
    v48 = v16;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEBUG, "_prepareViewsForCleanupIfReady; not ready. _mediaViewIsReady: %@, modelDeliveryManager ready: %@, mediaView: %@, isActiveTool: %@",
      buf,
      0x2Au);
  }
  if (v4)
  {
    uint64_t v17 = self->_tasksWaitingOnCleanupReady;
    if (!v17)
    {
      double v18 = [MEMORY[0x1E4F1CA48] array];
      id v19 = self->_tasksWaitingOnCleanupReady;
      self->_tasksWaitingOnCleanupReaddouble y = v18;

      uint64_t v17 = self->_tasksWaitingOnCleanupReady;
    }
    id v20 = _Block_copy(v4);
    [(NSMutableArray *)v17 addObject:v20];
  }
LABEL_25:
}

uint64_t __67__PUCleanupToolController__prepareViewsForCleanupIfReadyAndNotify___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1328) setAlpha:1.0];
}

- (void)_prepareViewsForCleanupIfReady
{
}

- (BOOL)wantsTapToToggleOriginalEnabled
{
  return 0;
}

- (void)_removePreparingProgress
{
  int v3 = [(PUCleanupToolController *)self modelDeliveryProgressViewController];
  uint64_t v4 = [v3 view];
  [v4 removeFromSuperview];

  [(PUCleanupToolController *)self setModelDeliveryProgressViewController:0];
}

- (void)_updatePreparingProgressConstraints
{
  v48[3] = *MEMORY[0x1E4F143B8];
  int v3 = [(PUCleanupToolController *)self view];
  uint64_t v4 = [v3 window];

  if (v4)
  {
    dispatch_time_t v5 = [(PUCleanupToolController *)self modelDeliveryProgressViewController];
    int v6 = [v5 view];

    if (v6)
    {
      uint64_t v7 = [v6 superview];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        BOOL v9 = [v6 window];

        if (v9)
        {
          if ([(PUCleanupToolController *)self isIpadLayout])
          {
LABEL_6:
            id v10 = [(PUCleanupToolController *)self modelDeliveryProgressConstraints];

            if (v10)
            {
              int v11 = (void *)MEMORY[0x1E4F28DC8];
              uint64_t v12 = [(PUCleanupToolController *)self modelDeliveryProgressConstraints];
              [v11 deactivateConstraints:v12];

              [(PUCleanupToolController *)self setModelDeliveryProgressConstraints:0];
            }
            if ([(PUCleanupToolController *)self isIpadLayout])
            {
              if ([(PUCleanupToolController *)self modelDeliveryProgressInErrorState])
              {
                double v13 = 500.0;
              }
              else
              {
                double v13 = 352.0;
              }
              __int16 v14 = [v6 centerXAnchor];
              BOOL v46 = [(PUCleanupToolController *)self view];
              __int16 v45 = [v46 centerXAnchor];
              id v44 = objc_msgSend(v14, "constraintEqualToAnchor:");
              v48[0] = v44;
              __int16 v43 = [v6 widthAnchor];
              id v42 = [v43 constraintEqualToConstant:v13];
              v48[1] = v42;
              uint64_t v15 = [v6 bottomAnchor];
              uint64_t v16 = [(PUCleanupToolController *)self view];
              uint64_t v17 = [v16 safeAreaLayoutGuide];
              double v18 = [v17 bottomAnchor];
              id v19 = [v15 constraintEqualToAnchor:v18 constant:-11.0];
              v48[2] = v19;
              id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];
            }
            else
            {
              objc_super v26 = [v6 leadingAnchor];
              double v27 = [(PUCleanupToolController *)self view];
              double v28 = [v27 leadingAnchor];
              id v29 = [v26 constraintEqualToAnchor:v28 constant:10.0];

              uint64_t v30 = [v6 trailingAnchor];
              uint64_t v31 = [(PUCleanupToolController *)self view];
              uint64_t v32 = [v31 trailingAnchor];
              char v33 = [v30 constraintEqualToAnchor:v32 constant:-10.0];

              long long v41 = v29;
              LODWORD(v34) = 1132068864;
              [v29 setPriority:v34];
              LODWORD(v35) = 1132068864;
              [v33 setPriority:v35];
              long long v36 = [(PUPhotoEditToolController *)self delegate];
              long long v37 = [v36 toolControllerMainContainerView:self];

              long long v38 = [v6 centerXAnchor];
              __int16 v45 = v37;
              __int16 v43 = [v37 centerXAnchor];
              id v44 = v38;
              id v42 = objc_msgSend(v38, "constraintEqualToAnchor:");
              v47[0] = v42;
              v47[1] = v29;
              BOOL v46 = v33;
              void v47[2] = v33;
              uint64_t v15 = [v6 widthAnchor];
              uint64_t v16 = [v15 constraintLessThanOrEqualToConstant:374.0];
              v47[3] = v16;
              uint64_t v17 = [v6 bottomAnchor];
              double v18 = [(PUCleanupToolController *)self view];
              id v19 = [v18 safeAreaLayoutGuide];
              id v39 = [v19 bottomAnchor];
              id v40 = [v17 constraintEqualToAnchor:v39 constant:-13.0];
              v47[4] = v40;
              id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:5];

              __int16 v14 = v41;
            }

            [MEMORY[0x1E4F28DC8] activateConstraints:v20];
            [(PUCleanupToolController *)self setModelDeliveryProgressConstraints:v20];

            goto LABEL_19;
          }
          BOOL v21 = [(PUPhotoEditToolController *)self delegate];
          id v22 = [v21 toolControllerMainContainerView:self];

          if (v22)
          {
            uint64_t v23 = [v22 superview];
            if (v23)
            {
              id v24 = (void *)v23;
              objc_super v25 = [v22 window];

              if (v25) {
                goto LABEL_6;
              }
            }
            else
            {
            }
          }
        }
      }
    }
LABEL_19:
  }
}

- (void)_showPreparingProgress
{
  int v3 = [(PUCleanupToolController *)self modelDeliveryProgressViewController];
  objc_msgSend(v3, "setIsiPadConfiguration:", -[PUCleanupToolController isIpadLayout](self, "isIpadLayout"));

  uint64_t v4 = [(PUCleanupToolController *)self modelDeliveryProgressViewController];
  id v6 = [v4 view];

  dispatch_time_t v5 = [(PUCleanupToolController *)self view];
  [v5 addSubview:v6];

  [(PUCleanupToolController *)self _updatePreparingProgressConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v3 viewWillAppear:a3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUCleanupToolController;
  [(PUCleanupToolController *)&v12 viewWillDisappear:a3];
  maskView = self->_maskView;
  if (maskView)
  {
    [(PUCleanupToolMaskView *)maskView removeFromSuperview];
    dispatch_time_t v5 = self->_maskView;
    self->_maskView = 0;
  }
  id v6 = +[PUPhotoEditProtoSettings sharedInstance];
  int v7 = [v6 retouchShowsFaceRects];

  if (v7)
  {
    [(PUCleanupToolFaceRectsView *)self->_faceRectsView removeFromSuperview];
    faceRectsView = self->_faceRectsView;
    self->_faceRectsView = 0;
  }
  if (self->_userPromptView) {
    [(PUCleanupToolController *)self deleteUserPromptViewAnimated:0 completion:0];
  }
  BOOL v9 = +[PUPhotoEditProtoSettings sharedInstance];
  [v9 removeKeyObserver:self];

  [(PUVFXRetouchOverlay *)self->_retouchVFXOverlay removeFromSuperview];
  retouchVFXOverladouble y = self->_retouchVFXOverlay;
  self->_retouchVFXOverladouble y = 0;

  int v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:self];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)PUCleanupToolController;
  [(PUCleanupToolController *)&v21 viewDidLoad];
  objc_super v3 = [(PUPhotoEditToolController *)self toolContainerView];
  [v3 setAccessibilityLabel:@"toolContainer"];
  [v3 addSubview:self->_defaultModeBrushSizeSlider];
  [v3 addSubview:self->_defaultModeBrushSizeLabel];
  [v3 addSubview:self->_brushModeBrushSizeSlider];
  [v3 addSubview:self->_brushModeBrushSizeLabel];
  uint64_t v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 retouchShowsBrushButton];

  if (v5 && !self->_brushModeButton)
  {
    id v6 = +[PUInterfaceManager currentTheme];
    objc_initWeak(&location, self);
    int v7 = PULocalizedString(@"PHOTOEDIT_CLEANUP_BRUSH_MODE_ACCESSIBILITY_LABEL");
    uint64_t v8 = [(PUPhotoEditToolController *)self photoEditSpec];
    BOOL v9 = +[PUPhotoEditToolbarButton buttonWithImageNamed:@"paintbrush.pointed" selectedImageNamed:@"paintbrush.pointed.fill" accessibilityLabel:v7 spec:v8];

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __38__PUCleanupToolController_viewDidLoad__block_invoke;
    double v18 = &unk_1E5F28D98;
    objc_copyWeak(&v19, &location);
    [v9 setActionBlock:&v15];
    -[PUCleanupToolController setBrushModeButton:](self, "setBrushModeButton:", v9, v15, v16, v17, v18);
    unint64_t cleanupMode = self->_cleanupMode;
    int v11 = [(PUCleanupToolController *)self brushModeButton];
    [v11 setSelected:cleanupMode == 2];

    objc_super v12 = [(PUCleanupToolController *)self brushModeButton];
    if ([v12 isSelected]) {
      [v6 photoEditingToolbarButtonSelectedColor];
    }
    else {
    double v13 = [v6 photoEditingToolbarButtonColor];
    }

    __int16 v14 = [(PUCleanupToolController *)self brushModeButton];
    [v14 setTintColor:v13];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __38__PUCleanupToolController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _brushModeButtonTapped:v3];
}

- (void)_setupCleanupControls
{
  self->_unint64_t cleanupMode = 0;
  [(PUCleanupToolController *)self _setupCleanupBrushSizeSliders];
}

- (void)_setupResetButton
{
  id v3 = PULocalizedString(@"PHOTOEDIT_CLEANUP_RESET");
  uint64_t v4 = [v3 localizedUppercaseString];

  int v5 = +[PUPhotoEditToolActivationButton buttonWithTitle:v4];
  objc_storeStrong((id *)&self->_resetButton, v5);
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __44__PUCleanupToolController__setupResetButton__block_invoke;
  BOOL v9 = &unk_1E5F28D98;
  objc_copyWeak(&v10, &location);
  [v5 setActionBlock:&v6];
  [(PUCleanupToolController *)self _updateResetButtonState];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __44__PUCleanupToolController__setupResetButton__block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _resetTapped:v3];
}

- (void)_setupCleanupBrushSizeSliders
{
  id v3 = +[PUPhotoEditSupport createEditSlider];
  defaultModeBrushSizeSlider = self->_defaultModeBrushSizeSlider;
  self->_defaultModeBrushSizeSlider = v3;

  int v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  defaultModeBrushSizeLabel = self->_defaultModeBrushSizeLabel;
  self->_defaultModeBrushSizeLabel = v5;

  uint64_t v7 = +[PUPhotoEditSupport createEditSlider];
  brushModeBrushSizeSlider = self->_brushModeBrushSizeSlider;
  self->_brushModeBrushSizeSlider = v7;

  BOOL v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  brushModeBrushSizeLabel = self->_brushModeBrushSizeLabel;
  self->_brushModeBrushSizeLabel = v9;

  [(PUCleanupToolController *)self _setupCleanupBrushSizeSlider:self->_defaultModeBrushSizeSlider label:self->_defaultModeBrushSizeLabel];
  [(PUCleanupToolController *)self _setupCleanupBrushSizeSlider:self->_brushModeBrushSizeSlider label:self->_brushModeBrushSizeLabel];
  int v11 = [MEMORY[0x1E4F91148] globalSettings];
  -[CEKSlider setHidden:](self->_defaultModeBrushSizeSlider, "setHidden:", [v11 retouchShowsDefaultModeSlider] ^ 1);

  objc_super v12 = [MEMORY[0x1E4F91148] globalSettings];
  -[UILabel setHidden:](self->_defaultModeBrushSizeLabel, "setHidden:", [v12 retouchShowsDefaultModeSlider] ^ 1);

  double v13 = +[PUPhotoEditProtoSettings sharedInstance];
  -[CEKSlider setHidden:](self->_brushModeBrushSizeSlider, "setHidden:", [v13 retouchShowsBrushButton] ^ 1);

  id v14 = +[PUPhotoEditProtoSettings sharedInstance];
  -[UILabel setHidden:](self->_brushModeBrushSizeLabel, "setHidden:", [v14 retouchShowsBrushButton] ^ 1);
}

- (void)_setupCleanupBrushSizeSlider:(id)a3 label:(id)a4
{
  id v14 = (CEKSlider *)a3;
  id v6 = a4;
  [(CEKSlider *)v14 setDelegate:self];
  [(CEKSlider *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CEKSlider *)v14 setUseTickMarkLegibilityShadows:1];
  uint64_t v7 = [MEMORY[0x1E4FB1618] clearColor];
  [(CEKSlider *)v14 setBackgroundColor:v7];

  if (self->_brushModeBrushSizeSlider == v14)
  {
    [(CEKSlider *)v14 setAlpha:0.0];
    [v6 setAlpha:0.0];
    [(CEKSlider *)v14 setMinimumValue:3.0];
    [(CEKSlider *)v14 setMaximumValue:200.0];
    [(CEKSlider *)v14 setDefaultValue:40.0];
    int v11 = v14;
    double v10 = 40.0;
  }
  else
  {
    [(CEKSlider *)v14 setMinimumValue:3.0];
    [(CEKSlider *)v14 setMaximumValue:40.0];
    uint64_t v8 = [MEMORY[0x1E4F91148] globalSettings];
    [v8 retouchDefaultModeBrushSizeDefault];
    -[CEKSlider setDefaultValue:](v14, "setDefaultValue:");

    if ([(PUCleanupToolController *)self isIpadLayout])
    {
      [(CEKSlider *)v14 defaultValue];
      [(CEKSlider *)v14 setDefaultValue:v9 * 1.25];
    }
    [(CEKSlider *)v14 defaultValue];
    int v11 = v14;
  }
  [(CEKSlider *)v11 setValue:v10];
  if (objc_opt_respondsToSelector())
  {
    [(CEKSlider *)v14 defaultValue];
    -[CEKSlider setMarkedValue:](v14, "setMarkedValue:");
  }
  [(CEKSlider *)v14 value];
  double v13 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", llround(v12));
  [v6 setText:v13];

  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)_updateResetButtonState
{
  BOOL v3 = [(PUCleanupToolController *)self _canReset];
  [(PUPhotoEditToolActivationButton *)self->_resetButton setHidden:v3 ^ 1];
  resetButton = self->_resetButton;
  [(PUPhotoEditToolActivationButton *)resetButton setSelected:v3];
}

- (void)compositionControllerDidChangeForAdjustments:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PUCleanupToolController;
  [(PUPhotoEditToolController *)&v5 compositionControllerDidChangeForAdjustments:v4];
  if ([v4 containsObject:*MEMORY[0x1E4F8A478]]) {
    [(PUCleanupToolController *)self _updateResetButtonState];
  }
  if (![(PUPhotoEditToolController *)self isActiveTool]
    && [v4 containsObject:*MEMORY[0x1E4F8A480]])
  {
    [(PUCleanupToolController *)self setMaskContext:0];
    self->_maskContextCreationHasBegun = 0;
  }
}

- (void)setupWithAsset:(id)a3 compositionController:(id)a4 editSource:(id)a5 valuesCalculator:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PUCleanupToolController;
  id v10 = a4;
  [(PUPhotoEditToolController *)&v26 setupWithAsset:a3 compositionController:v10 editSource:a5 valuesCalculator:a6];
  self->_mediaViewIsReaddouble y = 0;
  self->_cleanupViewsHaveBeenPrepared = 0;
  int v11 = [v10 composition];

  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F7A520]) initWithComposition:v11];
  [v12 setName:@"PUCleanupToolController-imageProperties"];
  id v25 = 0;
  double v13 = [v12 submitSynchronous:&v25];
  id v14 = v25;
  uint64_t v15 = [v13 properties];
  if ([v15 isHDR]) {
    char v16 = 1;
  }
  else {
    char v16 = [v15 hasGainMap];
  }
  self->_needsHDRUI = v16;
  uint64_t v17 = [(PUPhotoEditToolController *)self compositionController];
  double v18 = [v17 brushStrokeHistory];

  if (v18)
  {
    id v19 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v20 = [(PUPhotoEditToolController *)self compositionController];
      objc_super v21 = [v20 brushStrokeHistory];
      uint64_t v22 = [v21 entryCount];
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = v22;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEBUG, "Loaded brush stroke history with %ld entries", buf, 0xCu);
    }
  }
  else
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F8A260]);
    id v24 = [(PUPhotoEditToolController *)self compositionController];
    [v24 setBrushStrokeHistory:v23];

    id v19 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v19, OS_LOG_TYPE_DEBUG, "Created new brush stroke history", buf, 2u);
    }
  }
}

- (PUCleanupToolController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUCleanupToolController;
  id v4 = [(PUPhotoEditToolController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    commonInit(v4);
  }
  return v5;
}

- (PUCleanupToolController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCleanupToolController;
  BOOL v3 = [(PUCleanupToolController *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    commonInit(v3);
  }
  return v4;
}

@end