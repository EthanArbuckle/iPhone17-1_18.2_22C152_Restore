@interface SBPIPInteractionController
- (BOOL)_hasInFlightLayoutAnimations;
- (BOOL)_hasValidInteractionTargetView;
- (BOOL)_isGestureRecognizerRecognizing:(id)a3;
- (BOOL)_isGesturing;
- (BOOL)_isInteractive;
- (BOOL)_isPanning;
- (BOOL)_isPinching;
- (BOOL)_isPositionCloserToStashedLeftRegion:(CGPoint)a3 closestPointOut:(CGPoint *)a4;
- (BOOL)_isPreferredContentSizeDirty;
- (BOOL)_isRotating;
- (BOOL)_isSizeAffectedByLayoutReasons:(unint64_t)a3;
- (BOOL)_isSystemGestureRecognizer:(id)a3;
- (BOOL)_regionIsStashedOne:(id)a3;
- (BOOL)_setEdgeInsets:(UIEdgeInsets)a3 forScene:(id)a4;
- (BOOL)_setStashedPadding:(UIEdgeInsets)a3 forScene:(id)a4;
- (BOOL)_updateGeometryContextUsingTargetViewBounds:(CGRect)a3 orientation:(int64_t)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gestureRecognizerShouldFailForMovementPastHysteresis:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isStashed;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (CGAffineTransform)_stashTabCompensationTransformForStashProgress:(SEL)a3 reason:(double)a4;
- (CGAffineTransform)_transformFromDisplayArrangeSpaceToWindowScene:(SEL)a3;
- (CGAffineTransform)_transformToDisplayArrangementSpaceFromWindowScene:(SEL)a3;
- (CGPoint)_closestToDefaultCornersPosition;
- (CGPoint)_convertPointToInteractionTargetView:(CGPoint)a3 fromSystemGestureRecognizer:(id)a4;
- (CGPoint)_currentPosition;
- (CGPoint)_currentPositionForLayoutReason:(unint64_t)a3;
- (CGPoint)_interactionTargetViewPresentationPosition;
- (CGPoint)_roundPosition:(CGPoint)a3 forSize:(CGSize)a4;
- (CGPoint)edgeResizeAnchorPoint;
- (CGRect)initialFrame;
- (CGRect)nonoperationalFrame;
- (CGSize)_currentSizeForLayoutReason:(unint64_t)a3;
- (CGSize)_lastSteadySize;
- (CGSize)preferredContentSize;
- (NSString)debugName;
- (NSString)description;
- (SBPIPContentViewLayoutSettings)layoutSettings;
- (SBPIPInteractionController)initWithInteractionTargetView:(id)a3 preferredContentSize:(CGSize)a4 interactionSettings:(id)a5 dataSource:(id)a6 delegate:(id)a7;
- (SBPIPInteractionControllerDataSource)dataSource;
- (SBPIPPositionGeometryContext)regionComposer:(SEL)a3 transformGeometryContext:(id)a4 toWindowScene:(SBPIPPositionGeometryContext *)a5;
- (SBPIPPositionInteractionStateContext)_currentPositionInteractionStateContext;
- (UIEdgeInsets)_cachedEdgeInsetsForScene:(id)a3;
- (UIEdgeInsets)_cachedStashedPaddingForScene:(id)a3;
- (UIEdgeInsets)_inFlightHitTestPadding;
- (UIEdgeInsets)_minimumStashedPadding:(UIEdgeInsets)a3;
- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3;
- (UIView)targetOverlayView;
- (UIView)targetView;
- (double)_currentRotation;
- (double)_currentScale;
- (double)_proratedScaleForNormalizedScale:(double)a3;
- (double)_stashProgressForPosition:(CGPoint)a3;
- (double)currentNormalizedScale;
- (double)preferredNormalizedScale;
- (double)preferredScale;
- (double)stashProgress;
- (id)_rotationHyperregion;
- (id)_scaleHyperregion;
- (id)positionHyperregion;
- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (id)targetWindowSceneForRegionComposer:(id)a3;
- (unint64_t)__traitsForGesturesReasons:(unint64_t)a3;
- (unint64_t)_canonicalPositionForPoint:(CGPoint)a3;
- (unint64_t)canonicalPosition;
- (void)__handleGesturesEndedState:(id)a3;
- (void)__moveToAnchorPoint:(CGPoint)a3 reason:(id)a4;
- (void)_adjustContentViewAnchorPointForGestureRecognizer:(id)a3;
- (void)_applyPreferredScale;
- (void)_cancelAllGestures;
- (void)_enumerateComposers:(id)a3 usingBlock:(id)a4;
- (void)_enumeratePositionRegionComposersUsingBlock:(id)a3;
- (void)_handleGestureBeganState:(id)a3;
- (void)_handleGestureEndedState:(id)a3;
- (void)_noteStashProgress:(double)a3 withReason:(unint64_t)a4;
- (void)_performInitialLayoutIfNeeded;
- (void)_removeGestureRecognizers;
- (void)_removePointerInteraction;
- (void)_resetAnchorPoint;
- (void)_setDefaults;
- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5;
- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5 layoutCompletion:(id)a6 interactionCompletion:(id)a7;
- (void)_setPreferredScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5;
- (void)_setupDefaultInteractorsAndHyperRegions;
- (void)_setupForInitialFrame;
- (void)_setupGestureRecognizers;
- (void)_setupPointerInteraction;
- (void)_setupStateCapture;
- (void)_sizeChangeBeganWithBehavior:(int)a3;
- (void)_sizeChangeEnded;
- (void)_updateGeometryContextBoundsUsingMainDisplayWindowScene;
- (void)_updateHyperregionVisualizationIfNecessary;
- (void)_updateInteractorsAndCommit:(BOOL)a3;
- (void)_updatePIPSizeGeometryContext;
- (void)_updatePositionRegionComposers;
- (void)_updatePreferredContentSize;
- (void)_updateResolvedPositionHyperRegionsMapWithGeometry:(SBPIPPositionGeometryContext *)a3 interactionState:(SBPIPPositionInteractionStateContext *)a4;
- (void)_updateSettingsDrivenParameters;
- (void)_updateTargetWindowSceneIfNeeded;
- (void)_updateTargetWindowSceneIfNeededUpdatingInteractors:(BOOL)a3;
- (void)addPositionRegionComposer:(id)a3;
- (void)dealloc;
- (void)finishTransitionToWindowScene:(id)a3;
- (void)handleEdgeResizeGesture:(id)a3;
- (void)handleExternalPanGesture:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)handlePinchGesture:(id)a3;
- (void)handleRotationGesture:(id)a3;
- (void)layoutInteractedTraits:(unint64_t)a3 withReason:(unint64_t)a4 source:(id)a5;
- (void)layoutWithFrame:(CGRect)a3 reason:(id)a4 source:(id)a5 usingDisplayArrangementSpace:(BOOL)a6;
- (void)pointerWillExitRegion;
- (void)positionRegionComposerDidInvalidate:(id)a3;
- (void)positionRegionComposerNeedsUpdate:(id)a3 behavior:(int)a4;
- (void)prepareForTransitionToWindowScene:(id)a3;
- (void)recalculateScale:(double *)a3 baselineScale:(double *)a4 forTranslationInView:(CGPoint)a5;
- (void)reloadHyperregionComposerData;
- (void)reloadInsets;
- (void)setContainerSize:(CGSize)a3 withOrientation:(int64_t)a4 scene:(id)a5;
- (void)setContentLayoutSettings:(id)a3 animationBehavior:(int)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setPlatformMetrics:(id)a3 contentSize:(CGSize)a4 animationBehavior:(int)a5;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPreferredNormalizedScale:(double)a3;
- (void)setPreferredNormalizedScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5;
- (void)setStashed:(BOOL)a3;
- (void)setTargetOverlayView:(id)a3;
- (void)toggleUserPreferredScale;
@end

@implementation SBPIPInteractionController

- (SBPIPInteractionController)initWithInteractionTargetView:(id)a3 preferredContentSize:(CGSize)a4 interactionSettings:(id)a5 dataSource:(id)a6 delegate:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (width <= 0.0)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    [v76 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 196, @"Invalid parameter not satisfying: %@", @"preferredContentSize.width > 0" object file lineNumber description];
  }
  if (height <= 0.0)
  {
    v77 = [MEMORY[0x1E4F28B00] currentHandler];
    [v77 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 197, @"Invalid parameter not satisfying: %@", @"preferredContentSize.height > 0" object file lineNumber description];

    if (v14)
    {
LABEL_5:
      if (v15) {
        goto LABEL_6;
      }
      goto LABEL_20;
    }
  }
  else if (v14)
  {
    goto LABEL_5;
  }
  v78 = [MEMORY[0x1E4F28B00] currentHandler];
  [v78 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 198, @"Invalid parameter not satisfying: %@", @"interactionTargetView" object file lineNumber description];

  if (v15)
  {
LABEL_6:
    if (v16) {
      goto LABEL_7;
    }
LABEL_21:
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    [v80 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 200, @"Invalid parameter not satisfying: %@", @"dataSource" object file lineNumber description];

    if (v17) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_20:
  v79 = [MEMORY[0x1E4F28B00] currentHandler];
  [v79 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 199, @"Invalid parameter not satisfying: %@", @"interactionSettings" object file lineNumber description];

  if (!v16) {
    goto LABEL_21;
  }
LABEL_7:
  if (v17) {
    goto LABEL_8;
  }
LABEL_22:
  v81 = [MEMORY[0x1E4F28B00] currentHandler];
  [v81 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 201, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

LABEL_8:
  v82.receiver = self;
  v82.super_class = (Class)SBPIPInteractionController;
  v18 = [(SBPIPInteractionController *)&v82 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_delegate, v17);
    objc_storeWeak((id *)&v19->_dataSource, v16);
    objc_storeWeak((id *)&v19->_interactionTargetView, v14);
    uint64_t v20 = [v14 _sbWindowScene];
    targetWindowScene = v19->_targetWindowScene;
    v19->_targetWindowScene = (SBWindowScene *)v20;

    uint64_t v22 = [v16 layoutSettings];
    layoutSettings = v19->_layoutSettings;
    v19->_layoutSettings = (SBPIPContentViewLayoutSettings *)v22;

    if ([(SBWindowScene *)v19->_targetWindowScene isMainDisplayWindowScene])
    {
      v24 = [v14 superview];
      [v24 bounds];
      BSRectWithSize();
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      v33 = [v14 _sbWindowScene];
      -[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](v19, "_updateGeometryContextUsingTargetViewBounds:orientation:", [v33 interfaceOrientation], v26, v28, v30, v32);
    }
    else
    {
      [(SBPIPInteractionController *)v19 _updateGeometryContextBoundsUsingMainDisplayWindowScene];
    }
    v34 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    pointerHitTestBlocker = v19->_pointerHitTestBlocker;
    v19->_pointerHitTestBlocker = v34;

    v36 = v19->_pointerHitTestBlocker;
    v37 = [MEMORY[0x1E4F428B8] clearColor];
    [(UIView *)v36 setBackgroundColor:v37];

    v38 = [(UIView *)v19->_pointerHitTestBlocker layer];
    [v38 setHitTestsAsOpaque:1];

    v39 = [(UIView *)v19->_pointerHitTestBlocker layer];
    [v39 setAllowsHitTesting:1];

    [v14 addSubview:v19->_pointerHitTestBlocker];
    [v14 sendSubviewToBack:v19->_pointerHitTestBlocker];
    -[SBPIPContentViewLayoutSettings defaultContentViewSizeForAspectRatio:](v19->_layoutSettings, "defaultContentViewSizeForAspectRatio:", width, height);
    v19->_preferredContentSize.double width = v40;
    v19->_preferredContentSize.double height = v41;
    v19->_toBeAppliedPreferredContentSize = v19->_preferredContentSize;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPadding];
    CGFloat v43 = v42;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPadding];
    CGFloat v45 = v44;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPadding];
    CGFloat v47 = v46;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPadding];
    v19->_geometryContext.minimumPadding.top = v43;
    v19->_geometryContext.minimumPadding.left = v45;
    v19->_geometryContext.minimumPadding.bottom = v47;
    v19->_geometryContext.minimumPadding.right = v48;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPaddingWhileStashed];
    CGFloat v50 = v49;
    [(SBPIPContentViewLayoutSettings *)v19->_layoutSettings contentViewPaddingWhileStashed];
    v19->_geometryContext.stashedMinimumPadding.top = v50;
    v19->_geometryContext.stashedMinimumPadding.left = 0.0;
    v19->_geometryContext.stashedMinimumPadding.bottom = v51;
    v52 = (long long *)MEMORY[0x1E4F1DAB8];
    v19->_geometryContext.stashedMinimumPadding.right = 0.0;
    long long v53 = *v52;
    long long v54 = v52[1];
    long long v55 = v52[2];
    *(_OWORD *)&v19->_stashTabCompensationTransform.c = v54;
    *(_OWORD *)&v19->_stashTabCompensationTransform.tx = v55;
    *(_OWORD *)&v19->_rotationTransform.a = v53;
    *(_OWORD *)&v19->_rotationTransform.c = v54;
    *(_OWORD *)&v19->_rotationTransform.tx = v55;
    __asm { FMOV            V1.2D, #0.5 }
    v19->_anchorPoint = _Q1;
    *(_OWORD *)&v19->_stashTabCompensationTransform.a = v53;
    uint64_t v61 = [v16 debugName];
    debugName = v19->_debugName;
    v19->_debugName = (NSString *)v61;

    uint64_t v63 = [v16 systemGestureManagerForInteractionControllerResizing:v19];
    systemGestureManagerForResizing = v19->_systemGestureManagerForResizing;
    v19->_systemGestureManagerForResizing = (SBSystemGestureManager *)v63;

    objc_storeStrong((id *)&v19->_interactionSettings, a5);
    [(PTSettings *)v19->_interactionSettings addKeyPathObserver:v19];
    uint64_t v65 = [MEMORY[0x1E4F1CA48] array];
    positionRegionComposers = v19->_positionRegionComposers;
    v19->_positionRegionComposers = (NSMutableArray *)v65;

    [(SBPIPInteractionController *)v19 _setupDefaultInteractorsAndHyperRegions];
    [(SBPIPInteractionController *)v19 _updateInteractorsAndCommit:1];
    [(SBPIPInteractionController *)v19 _setDefaults];
    [(SBPIPInteractionController *)v19 _setupForInitialFrame];
    [(SBPIPInteractionController *)v19 _setupStateCapture];
    v67 = @"-";
    v68 = (__CFString *)v19->_debugName;
    if (!v68)
    {
      v67 = &stru_1F3084718;
      v68 = &stru_1F3084718;
    }
    uint64_t v69 = [NSString stringWithFormat:@"%p%@%@", v19, v67, v68];
    shortDescription = v19->_shortDescription;
    v19->_shortDescription = (NSString *)v69;

    v71 = SBLogPIP();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = v19->_shortDescription;
      v73 = NSStringFromCGRect(v19->_nonoperationalFrame);
      uint64_t v74 = [(SBPIPInteractionController *)v19 canonicalPosition];
      *(_DWORD *)buf = 138543874;
      v84 = v72;
      __int16 v85 = 2114;
      v86 = v73;
      __int16 v87 = 2048;
      uint64_t v88 = v74;
      _os_log_impl(&dword_1D85BA000, v71, OS_LOG_TYPE_DEFAULT, "[%{public}@] PIP Interaction controller was initialized. _nonoperationalFrame[%{public}@] canonicalPosition[%lu]", buf, 0x20u);
    }
  }

  return v19;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = SBLogPIP();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    *(_DWORD *)buf = 138543362;
    v13 = shortDescription;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] PIP Interaction controller was deallocated.", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v6 = [WeakRetained window];

  v7 = self->_systemGestureManagerForResizing;
  v8 = v7;
  if (v7)
  {
    [(SBSystemGestureManager *)v7 removeGestureRecognizer:self->_panWhileResizingGestureRecognizer];
    [(SBSystemGestureManager *)v8 removeGestureRecognizer:self->_pinchGestureRecognizer];
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v10 = v8;
  }
  else
  {
    [(SBSystemGestureManager *)v6 removeGestureRecognizer:self->_pinchGestureRecognizer];
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    v10 = v6;
  }
  [(SBSystemGestureManager *)v10 removeGestureRecognizer:rotationGestureRecognizer];
  [(SBSystemGestureManager *)v6 removeGestureRecognizer:self->_panGestureRecognizer];
  [(SBSystemGestureManager *)v6 removeGestureRecognizer:self->_edgeResizeGestureRecognizer];
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  [(UIViewFloatAnimatableProperty *)self->_layoutProgressProperty invalidate];

  v11.receiver = self;
  v11.super_class = (Class)SBPIPInteractionController;
  [(SBPIPInteractionController *)&v11 dealloc];
}

- (BOOL)_hasValidInteractionTargetView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  v3 = [WeakRetained superview];

  v4 = [WeakRetained superview];
  [v4 bounds];
  BOOL v7 = v6 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v5 != *MEMORY[0x1E4F1DB30];

  if (WeakRetained) {
    BOOL v8 = v3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8 && v7;
  if (!v9)
  {
    v10 = SBLogPIP();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12[0] = 67109632;
      v12[1] = WeakRetained != 0;
      __int16 v13 = 1024;
      BOOL v14 = v3 != 0;
      __int16 v15 = 1024;
      BOOL v16 = v7;
      _os_log_error_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_ERROR, "Interaction target view is not valid for reason: interactionTargetView is != nil? %{BOOL}u — interactionContainerView is != nil? %{BOOL}u — container size is CGSizeZero? %{BOOL}u", (uint8_t *)v12, 0x14u);
    }
  }
  return v9;
}

- (void)_setupStateCapture
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  objc_initWeak(&location, self);
  v3 = [NSString stringWithFormat:@"PictureInPicture - SBPIPInteractionController - %p(%@)", self, self->_debugName];
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v7, &location);
  BSLogAddStateCaptureBlockWithTitle();
  double v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v5;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __48__SBPIPInteractionController__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained description];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  v69[31] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (__CFString *)objc_loadWeakRetained((id *)&self->_interactionTargetView);
  id v58 = (id)NSString;
  v67.receiver = self;
  v67.super_class = (Class)SBPIPInteractionController;
  v66 = [(SBPIPInteractionController *)&v67 description];
  debugName = (__CFString *)self->_debugName;
  if (!debugName) {
    debugName = &stru_1F3084718;
  }
  v68[0] = @"Debug Name";
  v68[1] = @"Enabled";
  if (self->_enabled) {
    double v5 = @"YES";
  }
  else {
    double v5 = @"NO";
  }
  v69[0] = debugName;
  v69[1] = v5;
  v68[2] = @"Frame";
  uint64_t v65 = WeakRetained;
  if (WeakRetained)
  {
    [(__CFString *)WeakRetained frame];
    NSStringFromCGRect(v74);
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v7 = WeakRetained;
  }
  else
  {
    double v6 = @"null";
    id v7 = @"nil";
  }
  double v42 = v6;
  v69[2] = v6;
  v68[3] = @"Anchor Point";
  v64 = NSStringFromPoint(self->_anchorPoint);
  v69[3] = v64;
  v68[4] = @"Container Bounds";
  uint64_t v63 = NSStringFromCGRect(self->_geometryContext.containerBounds);
  v69[4] = v63;
  v68[5] = @"Orientation";
  v62 = SBFStringForBSInterfaceOrientation();
  v69[5] = v62;
  v68[6] = @"Current Position";
  [(SBPIPInteractionController *)self _currentPositionForLayoutReason:1024];
  uint64_t v61 = NSStringFromPoint(v71);
  v69[6] = v61;
  v68[7] = @"Current Rotation";
  BOOL v8 = NSNumber;
  [(SBPIPInteractionController *)self _currentRotation];
  v60 = objc_msgSend(v8, "numberWithDouble:");
  v69[7] = v60;
  v68[8] = @"Current Scale";
  BOOL v9 = NSNumber;
  [(SBPIPInteractionController *)self _currentScale];
  v57 = objc_msgSend(v9, "numberWithDouble:");
  v69[8] = v57;
  v68[9] = @"Current Normalized Scale";
  v10 = NSNumber;
  [(SBPIPInteractionController *)self currentNormalizedScale];
  v56 = objc_msgSend(v10, "numberWithDouble:");
  v69[9] = v56;
  v68[10] = @"Preferred Normalized Scale";
  objc_super v11 = NSNumber;
  [(SBPIPInteractionController *)self preferredNormalizedScale];
  long long v55 = objc_msgSend(v11, "numberWithDouble:");
  v69[10] = v55;
  v68[11] = @"Current Size";
  [(SBPIPInteractionController *)self _currentSizeForLayoutReason:1024];
  long long v54 = NSStringFromSize(v72);
  v69[11] = v54;
  v68[12] = @"Edge Insets";
  long long v53 = NSStringFromUIEdgeInsets(self->_geometryContext.edgeInsets);
  v69[12] = v53;
  v68[13] = @"Initial Frame";
  v52 = NSStringFromCGRect(self->_nonoperationalFrame);
  v69[13] = v52;
  v69[14] = v7;
  v68[14] = @"Interaction Target View";
  v68[15] = @"Is Changing Size";
  uint64_t v12 = [NSNumber numberWithBool:self->_isChangingSize];
  if (self->_systemGestureManagerForResizing) {
    __int16 v13 = @"YES";
  }
  else {
    __int16 v13 = @"NO";
  }
  CGFloat v51 = (void *)v12;
  v69[15] = v12;
  v69[16] = v13;
  v68[16] = @"Use System Gestures For Resizing";
  v68[17] = @"Last Steady Size";
  [(SBPIPInteractionController *)self _lastSteadySize];
  CGFloat v50 = NSStringFromSize(v73);
  v69[17] = v50;
  v68[18] = @"In Flight Animations Count";
  double v49 = [NSNumber numberWithUnsignedInteger:self->_inFlightAnimatedLayouts];
  CGFloat v48 = [v49 stringValue];
  v69[18] = v48;
  v68[19] = @"Pan Gesture Recognizer";
  panGestureRecognizer = self->_panGestureRecognizer;
  CGFloat v47 = panGestureRecognizer;
  if (panGestureRecognizer)
  {
    __int16 v15 = [(UIPanGestureRecognizer *)panGestureRecognizer debugDescription];
  }
  else
  {
    __int16 v15 = @"nil";
  }
  CGFloat v41 = v15;
  v69[19] = v15;
  v68[20] = @"Two touches Pan Gesture Recognizer";
  panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
  double v46 = panWhileResizingGestureRecognizer;
  if (panWhileResizingGestureRecognizer)
  {
    uint64_t v17 = [(UIPanGestureRecognizer *)panWhileResizingGestureRecognizer debugDescription];
  }
  else
  {
    uint64_t v17 = @"nil";
  }
  CGFloat v40 = v17;
  v69[20] = v17;
  v68[21] = @"Pinch Gesture Recognizer";
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  CGFloat v45 = pinchGestureRecognizer;
  if (pinchGestureRecognizer)
  {
    v19 = [(SBPIPPinchGestureRecognizer *)pinchGestureRecognizer debugDescription];
  }
  else
  {
    v19 = @"nil";
  }
  v39 = v19;
  v69[21] = v19;
  v68[22] = @"Position Interactor";
  positionInteractor = self->_positionInteractor;
  double v44 = positionInteractor;
  if (positionInteractor)
  {
    v21 = [(_UIHyperInteractor *)positionInteractor debugDescription];
  }
  else
  {
    v21 = @"nil";
  }
  v38 = v21;
  v69[22] = v21;
  v68[23] = @"Preferred Content Size";
  CGFloat v43 = NSStringFromSize(self->_preferredContentSize);
  v69[23] = v43;
  v68[24] = @"Rotation Gesture Recognizer";
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  if (rotationGestureRecognizer)
  {
    v23 = [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer debugDescription];
  }
  else
  {
    v23 = @"nil";
  }
  v37 = v23;
  v69[24] = v23;
  v68[25] = @"Rotation Interactor";
  rotationInteractor = self->_rotationInteractor;
  if (rotationInteractor)
  {
    double v25 = [(_UIHyperInteractor *)self->_rotationInteractor debugDescription];
  }
  else
  {
    double v25 = @"nil";
  }
  v69[25] = v25;
  v68[26] = @"Scale Interactor";
  scaleInteractor = self->_scaleInteractor;
  if (scaleInteractor)
  {
    double v27 = [(_UIHyperInteractor *)self->_scaleInteractor debugDescription];
  }
  else
  {
    double v27 = @"nil";
  }
  v69[26] = v27;
  v68[27] = @"Stash progress";
  double v28 = NSNumber;
  [(SBPIPInteractionController *)self stashProgress];
  double v29 = objc_msgSend(v28, "numberWithDouble:");
  v69[27] = v29;
  v68[28] = @"Should stash";
  uint64_t v30 = BSSettingFlagDescription();
  double v31 = (void *)v30;
  if (self->_didLastSettleInStashedState) {
    double v32 = @"YES";
  }
  else {
    double v32 = @"NO";
  }
  v69[28] = v30;
  v69[29] = v32;
  v68[29] = @"Did last settle in stashed state";
  v68[30] = @"To Be Applied Preferred Content Size";
  v33 = NSStringFromSize(self->_toBeAppliedPreferredContentSize);
  v69[30] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:v68 count:31];
  v35 = [v34 description];
  id v59 = [v58 stringWithFormat:@"%@\n%@", v66, v35];

  if (scaleInteractor) {
  if (rotationInteractor)
  }

  if (rotationGestureRecognizer) {
  if (v44)
  }

  if (v45) {
  if (v46)
  }

  if (v47) {
  if (v65)
  }

  return (NSString *)v59;
}

- (void)_setupForInitialFrame
{
  if ([(SBPIPInteractionController *)self _hasValidInteractionTargetView])
  {
    [(SBPIPInteractionController *)self _updateInteractorsAndCommit:1];
    [(SBPIPInteractionController *)self _currentSizeForLayoutReason:0];
    double v4 = v3;
    double v6 = v5;
    [(SBPIPInteractionController *)self _currentPositionForLayoutReason:0];
    self->_nonoperationalFrame.origin.x = v7 - v4 * 0.5;
    self->_nonoperationalFrame.origin.y = v8 - v6 * 0.5;
    self->_nonoperationalFrame.size.double width = v4;
    self->_nonoperationalFrame.size.double height = v6;
  }
  else
  {
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_nonoperationalFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_nonoperationalFrame.size = v9;
  }
}

- (void)_setupGestureRecognizers
{
  if ([(SBPIPInteractionController *)self _hasValidInteractionTargetView])
  {
    double v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_handlePanGesture_];
    panGestureRecognizer = self->_panGestureRecognizer;
    self->_panGestureRecognizer = v3;

    double v5 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_handleEdgeResizeGesture_];
    edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
    self->_edgeResizeGestureRecognizer = v5;

    double v7 = [[SBPIPPinchGestureRecognizer alloc] initWithTarget:self action:sel_handlePinchGesture_];
    pinchGestureRecognizer = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = v7;

    CGSize v9 = [[SBPIPRotationGestureRecognizer alloc] initWithTarget:self action:sel_handleRotationGesture_];
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    self->_rotationGestureRecognizer = v9;

    [(UIPanGestureRecognizer *)self->_panGestureRecognizer setAllowedScrollTypesMask:3];
    objc_super v11 = self->_panGestureRecognizer;
    uint64_t v12 = NSString;
    __int16 v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    __int16 v15 = [v12 stringWithFormat:@"%@-Pan", v14];
    [(UIPanGestureRecognizer *)v11 setName:v15];

    BOOL v16 = self->_edgeResizeGestureRecognizer;
    uint64_t v17 = NSString;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    uint64_t v20 = [v17 stringWithFormat:@"%@-EdgeResize", v19];
    [(UIPanGestureRecognizer *)v16 setName:v20];

    v21 = self->_pinchGestureRecognizer;
    uint64_t v22 = NSString;
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    double v25 = [v22 stringWithFormat:@"%@-Pinch", v24];
    [(SBPIPPinchGestureRecognizer *)v21 setName:v25];

    double v26 = self->_rotationGestureRecognizer;
    double v27 = NSString;
    double v28 = (objc_class *)objc_opt_class();
    double v29 = NSStringFromClass(v28);
    uint64_t v30 = [v27 stringWithFormat:@"%@-Rotation", v29];
    [(SBPIPRotationGestureRecognizer *)v26 setName:v30];

    [(UIPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:self];
    [(UIPanGestureRecognizer *)self->_edgeResizeGestureRecognizer setDelegate:self];
    [(SBPIPPinchGestureRecognizer *)self->_pinchGestureRecognizer setDelegate:self];
    [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer setDelegate:self];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    id v40 = [WeakRetained window];

    double v32 = self->_systemGestureManagerForResizing;
    if (v32)
    {
      v33 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel_handlePanGesture_];
      panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
      self->_panWhileResizingGestureRecognizer = v33;

      v35 = self->_panWhileResizingGestureRecognizer;
      v36 = NSString;
      v37 = (objc_class *)objc_opt_class();
      v38 = NSStringFromClass(v37);
      v39 = [v36 stringWithFormat:@"%@-SystemTwoTouchesPan", v38];
      [(UIPanGestureRecognizer *)v35 setName:v39];

      [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setAllowedTouchTypes:&unk_1F3347DC0];
      [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setMinimumNumberOfTouches:2];
      [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setMaximumNumberOfTouches:2];
      [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setDelegate:self];
      [(SBPIPPinchGestureRecognizer *)self->_pinchGestureRecognizer setFailsPastHysteresis:1];
      [(SBPIPPinchGestureRecognizer *)self->_pinchGestureRecognizer setMaximumNumberOfTouches:2];
      [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer setFailsPastHysteresis:1];
      [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer setMaximumNumberOfTouches:2];
      [(SBPIPPinchGestureRecognizer *)self->_pinchGestureRecognizer setAllowedTouchTypes:&unk_1F3347DD8];
      [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer setAllowedTouchTypes:&unk_1F3347DF0];
      [(SBSystemGestureManager *)v32 addGestureRecognizer:self->_panWhileResizingGestureRecognizer withType:121];
      [(SBSystemGestureManager *)v32 addGestureRecognizer:self->_pinchGestureRecognizer withType:122];
      [(SBSystemGestureManager *)v32 addGestureRecognizer:self->_rotationGestureRecognizer withType:123];
    }
    else
    {
      [v40 addGestureRecognizer:self->_pinchGestureRecognizer];
      [v40 addGestureRecognizer:self->_rotationGestureRecognizer];
    }
    [v40 addGestureRecognizer:self->_panGestureRecognizer];
    [v40 addGestureRecognizer:self->_edgeResizeGestureRecognizer];
    [(SBPIPInteractionController *)self _updateSettingsDrivenParameters];
  }
}

- (void)_removeGestureRecognizers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  __int16 v13 = [WeakRetained window];

  double v4 = self->_systemGestureManagerForResizing;
  double v5 = v4;
  if (v4)
  {
    [(SBSystemGestureManager *)v4 removeGestureRecognizer:self->_panWhileResizingGestureRecognizer];
    [(SBSystemGestureManager *)v5 removeGestureRecognizer:self->_pinchGestureRecognizer];
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    double v7 = v5;
  }
  else
  {
    [(SBSystemGestureManager *)v13 removeGestureRecognizer:self->_pinchGestureRecognizer];
    rotationGestureRecognizer = self->_rotationGestureRecognizer;
    double v7 = v13;
  }
  [(SBSystemGestureManager *)v7 removeGestureRecognizer:rotationGestureRecognizer];
  [(SBSystemGestureManager *)v13 removeGestureRecognizer:self->_panGestureRecognizer];
  [(SBSystemGestureManager *)v13 removeGestureRecognizer:self->_edgeResizeGestureRecognizer];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = 0;

  edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
  self->_edgeResizeGestureRecognizer = 0;

  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  self->_pinchGestureRecognizer = 0;

  objc_super v11 = self->_rotationGestureRecognizer;
  self->_rotationGestureRecognizer = 0;

  panWhileResizingGestureRecognizer = self->_panWhileResizingGestureRecognizer;
  self->_panWhileResizingGestureRecognizer = 0;
}

- (void)_setupPointerInteraction
{
  if ([(SBPIPInteractionController *)self _hasValidInteractionTargetView])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    double v4 = [WeakRetained systemPointerInteractionManagerForInteractionController:self];
    systemPointerInteractionManager = self->_systemPointerInteractionManager;
    self->_systemPointerInteractionManager = v4;

    double v6 = self->_systemPointerInteractionManager;
    id v7 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    [(SBSystemPointerInteractionManager *)v6 registerView:v7 delegate:self];
  }
}

- (void)_removePointerInteraction
{
  systemPointerInteractionManager = self->_systemPointerInteractionManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  [(SBSystemPointerInteractionManager *)systemPointerInteractionManager unregisterView:WeakRetained];

  double v5 = self->_systemPointerInteractionManager;
  self->_systemPointerInteractionManager = 0;
}

- (void)_setupDefaultInteractorsAndHyperRegions
{
  double v3 = (_UIHyperInteractor *)[objc_alloc(MEMORY[0x1E4F43190]) initWithDimensions:2];
  positionInteractor = self->_positionInteractor;
  self->_positionInteractor = v3;

  double v5 = (_UIHyperInteractor *)[objc_alloc(MEMORY[0x1E4F43190]) initWithDimensions:1];
  scaleInteractor = self->_scaleInteractor;
  self->_scaleInteractor = v5;

  id v7 = (_UIHyperInteractor *)[objc_alloc(MEMORY[0x1E4F43190]) initWithDimensions:1];
  rotationInteractor = self->_rotationInteractor;
  self->_rotationInteractor = v7;

  id v11 = (id)[objc_alloc(MEMORY[0x1E4F43188]) initWithDimensions:2];
  CGSize v9 = (void *)[objc_alloc(MEMORY[0x1E4F43188]) initWithDimensions:1];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F43188]) initWithDimensions:1];
  [(_UIHyperInteractor *)self->_positionInteractor _setExtender:v11];
  [(_UIHyperInteractor *)self->_scaleInteractor _setExtender:v10];
  [(_UIHyperInteractor *)self->_rotationInteractor _setExtender:v9];
  [(_UIHyperInteractor *)self->_rotationInteractor _setMinimumSpeed:0.0];
  [(_UIHyperInteractor *)self->_scaleInteractor _setMinimumSpeed:0.0];
  [(SBPIPInteractionController *)self _updateSettingsDrivenParameters];
  [(SBPIPInteractionController *)self _updatePositionRegionComposers];
}

- (void)_updateSettingsDrivenParameters
{
  double v3 = [(_UIHyperInteractor *)self->_positionInteractor _extender];
  [(SBPIPInteractionSettings *)self->_interactionSettings positionExtenderMaximumDistance];
  objc_msgSend(v3, "_setMaximumDistance:");

  double v4 = [(_UIHyperInteractor *)self->_rotationInteractor _extender];
  [(SBPIPInteractionSettings *)self->_interactionSettings rotationExtenderMaximumDistance];
  objc_msgSend(v4, "_setMaximumDistance:");

  layoutSettings = self->_layoutSettings;
  [(SBPIPInteractionSettings *)self->_interactionSettings maximumSizeSpanForPreferredSizeTuning];
  -[SBPIPContentViewLayoutSettings setMaximumSizeSpanForPreferredSizeTuning:](layoutSettings, "setMaximumSizeSpanForPreferredSizeTuning:");
  double v6 = self->_layoutSettings;
  [(SBPIPInteractionSettings *)self->_interactionSettings minimumSizeSpanBetweenPreferredSizes];
  -[SBPIPContentViewLayoutSettings setMinimumSizeSpanBetweenPreferredSizes:](v6, "setMinimumSizeSpanBetweenPreferredSizes:");
  [(UIPanGestureRecognizer *)self->_panGestureRecognizer setEnabled:[(SBPIPInteractionSettings *)self->_interactionSettings panGestureEnabled]];
  [(UIPanGestureRecognizer *)self->_edgeResizeGestureRecognizer setEnabled:[(SBPIPInteractionSettings *)self->_interactionSettings edgeResizeGestureEnabled]];
  edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
  double v8 = [(SBPIPInteractionSettings *)self->_interactionSettings edgeResizeSettings];
  [v8 hysteresis];
  -[UIPanGestureRecognizer _setHysteresis:](edgeResizeGestureRecognizer, "_setHysteresis:");

  [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setEnabled:[(SBPIPInteractionSettings *)self->_interactionSettings panGestureEnabled]];
  [(SBPIPPinchGestureRecognizer *)self->_pinchGestureRecognizer setEnabled:[(SBPIPInteractionSettings *)self->_interactionSettings pinchGestureEnabled]];
  positionInteractor = self->_positionInteractor;
  [(SBPIPInteractionSettings *)self->_interactionSettings positionDecelerationRate];
  -[_UIHyperInteractor _setDecelerationRate:](positionInteractor, "_setDecelerationRate:");
  rotationGestureRecognizer = self->_rotationGestureRecognizer;
  [(SBPIPInteractionSettings *)self->_interactionSettings rotationPreRecognitionWeight];
  -[UIRotationGestureRecognizer _setPreRecognitionWeight:](rotationGestureRecognizer, "_setPreRecognitionWeight:");
  [(SBPIPRotationGestureRecognizer *)self->_rotationGestureRecognizer setEnabled:[(SBPIPInteractionSettings *)self->_interactionSettings rotationGestureEnabled]];
  rotationInteractor = self->_rotationInteractor;
  [(SBPIPInteractionSettings *)self->_interactionSettings rotationRubberBandCoefficient];
  -[_UIHyperInteractor _setRubberBandCoefficient:](rotationInteractor, "_setRubberBandCoefficient:");
  scaleInteractor = self->_scaleInteractor;
  [(SBPIPInteractionSettings *)self->_interactionSettings scaleDecelerationRate];
  -[_UIHyperInteractor _setDecelerationRate:](scaleInteractor, "_setDecelerationRate:");
}

- (void)_performInitialLayoutIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  [WeakRetained bounds];
  UISizeRoundToScale();
  v8.size.double width = v4;
  v8.size.double height = v5;
  v9.size.double width = self->_nonoperationalFrame.size.width;
  v9.size.double height = self->_nonoperationalFrame.size.height;
  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  BOOL v6 = CGRectEqualToRect(v8, v9);

  if (!v6)
  {
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:7 withReason:1 behavior:0];
  }
}

- (void)_setDefaults
{
  if ([(SBPIPInteractionController *)self _hasValidInteractionTargetView])
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0x3FF0000000000000;
    [(SBPIPInteractionController *)self _closestToDefaultCornersPosition];
    uint64_t v10 = v3;
    uint64_t v11 = v4;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&self->_pinchGestureBaselineScale = _Q0;
    self->_edgeResizeGestureBaselineHeightScale = 1.0;
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_scaleInteractor, "_copyUnconstrainedPoint:", &v13, v10, v11);
    [(_UIHyperInteractor *)self->_rotationInteractor _copyUnconstrainedPoint:&v12];
    [(_UIHyperInteractor *)self->_positionInteractor _copyUnconstrainedPoint:&v10];
  }
}

- (CGPoint)_closestToDefaultCornersPosition
{
  uint64_t v3 = [(SBPIPContentViewLayoutSettings *)self->_layoutSettings currentContentViewPosition];
  pendingTransition = self->_pendingTransition;
  if (pendingTransition) {
    uint64_t v3 = [(_SBPIPInteractionControllerTransitionInfo *)pendingTransition layoutCorner];
  }
  double v47 = 0.0;
  double v48 = 0.0;
  uint64_t v42 = 0;
  CGFloat v43 = &v42;
  uint64_t v44 = 0x3010000000;
  CGFloat v45 = &unk_1D90ED3C6;
  long long v46 = *MEMORY[0x1E4F1DAD8];
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
  CGSize pipCurrentSize = self->_geometryContext.pipCurrentSize;
  CGSize pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
  CGSize v19 = pipCurrentSize;
  long long v6 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
  long long v7 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
  long long v8 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
  long long v29 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
  long long v30 = v7;
  long long v31 = v8;
  CGSize size = self->_geometryContext.containerBounds.size;
  long long v10 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
  long long v11 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
  long long v25 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
  long long v26 = v10;
  CGSize pipStashedSize = self->_geometryContext.pipStashedSize;
  long long v28 = v6;
  long long v27 = v11;
  CGPoint pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
  CGPoint origin = self->_geometryContext.containerBounds.origin;
  CGSize v21 = pipStashedSize;
  CGPoint v22 = pipAnchorPointOffset;
  CGSize v24 = size;
  CGPoint v23 = origin;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __62__SBPIPInteractionController__closestToDefaultCornersPosition__block_invoke;
  v18[3] = &unk_1E6B01A08;
  v18[4] = &v42;
  v18[5] = v3;
  long long v34 = v39;
  long long v35 = v40;
  uint64_t v36 = v41;
  long long v33 = v38;
  long long v32 = v37;
  [(SBPIPInteractionController *)self _enumeratePositionRegionComposersUsingBlock:v18];
  __int16 v15 = [(_UIHyperInteractor *)self->_positionInteractor _region];
  [v15 _closestPoint:&v47 toPoint:v43 + 4];

  _Block_object_dispose(&v42, 8);
  double v16 = v47;
  double v17 = v48;
  result.y = v17;
  result.x = v16;
  return result;
}

uint64_t __62__SBPIPInteractionController__closestToDefaultCornersPosition__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double v5 = *(double *)(v4 + 32);
  double v6 = *(double *)(v4 + 40);
  long long v7 = *(_OWORD *)(a1 + 224);
  v22[10] = *(_OWORD *)(a1 + 208);
  v22[11] = v7;
  long long v8 = *(_OWORD *)(a1 + 256);
  v22[12] = *(_OWORD *)(a1 + 240);
  long long v9 = *(_OWORD *)(a1 + 160);
  v22[6] = *(_OWORD *)(a1 + 144);
  v22[7] = v9;
  long long v10 = *(_OWORD *)(a1 + 192);
  v22[8] = *(_OWORD *)(a1 + 176);
  v22[9] = v10;
  long long v11 = *(_OWORD *)(a1 + 96);
  v22[2] = *(_OWORD *)(a1 + 80);
  v22[3] = v11;
  long long v12 = *(_OWORD *)(a1 + 128);
  v22[4] = *(_OWORD *)(a1 + 112);
  v22[5] = v12;
  long long v13 = *(_OWORD *)(a1 + 64);
  v22[0] = *(_OWORD *)(a1 + 48);
  v22[1] = v13;
  long long v14 = *(_OWORD *)(a1 + 272);
  long long v15 = *(_OWORD *)(a1 + 304);
  v20[2] = *(_OWORD *)(a1 + 288);
  v20[3] = v15;
  uint64_t v21 = *(void *)(a1 + 320);
  v20[0] = v8;
  v20[1] = v14;
  uint64_t result = objc_msgSend(a2, "defaultCornerPositionForLayoutSettingsPosition:proposedCenter:geometry:interaction:", v3, v22, v20, v5, v6);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v17 + 32) = v18;
  *(void *)(v17 + 40) = v19;
  return result;
}

- (unint64_t)_canonicalPositionForPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v41 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
  long long v6 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
  long long v24 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
  long long v25 = v6;
  long long v7 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
  long long v26 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
  long long v27 = v7;
  long long v8 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
  CGSize size = self->_geometryContext.containerBounds.size;
  long long v21 = v8;
  long long v9 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
  long long v22 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
  long long v23 = v9;
  CGSize pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
  CGSize pipStashedSize = self->_geometryContext.pipStashedSize;
  CGPoint origin = self->_geometryContext.containerBounds.origin;
  CGPoint pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
  CGPoint v19 = origin;
  CGSize pipCurrentSize = self->_geometryContext.pipCurrentSize;
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 2;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__SBPIPInteractionController__canonicalPositionForPoint___block_invoke;
  v14[3] = &unk_1E6B01A30;
  v14[4] = &v33;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  long long v30 = v39;
  long long v31 = v40;
  long long v28 = v37;
  long long v29 = v38;
  uint64_t v32 = v41;
  [(SBPIPInteractionController *)self _enumeratePositionRegionComposersUsingBlock:v14];
  pendingTransition = self->_pendingTransition;
  if (pendingTransition)
  {
    unint64_t v12 = [(_SBPIPInteractionControllerTransitionInfo *)pendingTransition layoutCorner];
    v34[3] = v12;
  }
  else
  {
    unint64_t v12 = v34[3];
  }
  _Block_object_dispose(&v33, 8);
  return v12;
}

uint64_t __57__SBPIPInteractionController__canonicalPositionForPoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 200);
  long long v7 = *(_OWORD *)(a1 + 232);
  v17[10] = *(_OWORD *)(a1 + 216);
  v17[11] = v7;
  v17[12] = *(_OWORD *)(a1 + 248);
  long long v8 = *(_OWORD *)(a1 + 136);
  long long v9 = *(_OWORD *)(a1 + 168);
  v17[6] = *(_OWORD *)(a1 + 152);
  v17[7] = v9;
  v17[8] = *(_OWORD *)(a1 + 184);
  v17[9] = v6;
  long long v10 = *(_OWORD *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 104);
  v17[2] = *(_OWORD *)(a1 + 88);
  v17[3] = v11;
  v17[4] = *(_OWORD *)(a1 + 120);
  v17[5] = v8;
  v17[0] = *(_OWORD *)(a1 + 56);
  v17[1] = v10;
  long long v12 = *(_OWORD *)(a1 + 312);
  v15[2] = *(_OWORD *)(a1 + 296);
  v15[3] = v12;
  uint64_t v16 = *(void *)(a1 + 328);
  long long v13 = *(_OWORD *)(a1 + 280);
  v15[0] = *(_OWORD *)(a1 + 264);
  v15[1] = v13;
  uint64_t result = objc_msgSend(a2, "canonicalPositionForPoint:proposedPosition:geometry:interaction:", v3, v17, v15, v4, v5);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
    {
      [(SBPIPInteractionController *)self _setupGestureRecognizers];
      [(SBPIPInteractionController *)self _setupPointerInteraction];
      if (![(SBPIPInteractionController *)self _isInteractive])
      {
        [(SBPIPInteractionController *)self _performInitialLayoutIfNeeded];
      }
    }
    else
    {
      if (![(SBPIPInteractionController *)self _isGesturing]) {
        [(SBPIPInteractionController *)self _setupForInitialFrame];
      }
      [(UIViewFloatAnimatableProperty *)self->_layoutProgressProperty invalidate];
      layoutProgressPropertCGFloat y = self->_layoutProgressProperty;
      self->_layoutProgressPropertCGFloat y = 0;

      [(SBPIPInteractionController *)self _removeGestureRecognizers];
      [(SBPIPInteractionController *)self _removePointerInteraction];
    }
  }
}

- (UIView)targetView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  return (UIView *)WeakRetained;
}

- (CGRect)initialFrame
{
  double x = self->_nonoperationalFrame.origin.x;
  double y = self->_nonoperationalFrame.origin.y;
  double width = self->_nonoperationalFrame.size.width;
  double height = self->_nonoperationalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (SBPIPContentViewLayoutSettings)layoutSettings
{
  return self->_layoutSettings;
}

- (double)currentNormalizedScale
{
  uint64_t v3 = [(_UIHyperInteractor *)self->_scaleInteractor _region];
  double v4 = *(double *)[v3 _minimumPoint];
  double v5 = *(double *)[v3 _maximumPoint] - v4;
  double v6 = 1.0;
  if ((BSFloatIsZero() & 1) == 0) {
    double v6 = (*(double *)[(_UIHyperInteractor *)self->_scaleInteractor _constrainedPoint] - v4) / v5;
  }

  return v6;
}

- (double)preferredNormalizedScale
{
  uint64_t v3 = [(_UIHyperInteractor *)self->_scaleInteractor _region];
  double v4 = *(double *)[v3 _minimumPoint];
  double v5 = *(double *)[v3 _maximumPoint] - v4;
  double v6 = 1.0;
  if ((BSFloatIsZero() & 1) == 0) {
    double v6 = (*(double *)[(_UIHyperInteractor *)self->_scaleInteractor _unconstrainedPoint] - v4) / v5;
  }

  return v6;
}

- (unint64_t)canonicalPosition
{
  [(SBPIPInteractionController *)self _currentPositionForLayoutReason:1024];
  return -[SBPIPInteractionController _canonicalPositionForPoint:](self, "_canonicalPositionForPoint:");
}

- (void)setTargetOverlayView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetOverlayView);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_targetOverlayView, obj);
    if ([obj isHidden]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = 2;
    }
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 setNeedsLayoutForInteractionController:self traits:7 withReason:0x8000 behavior:v5 completion:0];
  }
}

- (void)setContentLayoutSettings:(id)a3 animationBehavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  long long v8 = (SBPIPContentViewLayoutSettings *)a3;
  if (self->_layoutSettings != v8)
  {
    objc_storeStrong((id *)&self->_layoutSettings, a3);
    long long v7 = [(SBPIPContentViewLayoutSettings *)v8 platformMetrics];
    -[SBPIPInteractionController setPlatformMetrics:contentSize:animationBehavior:](self, "setPlatformMetrics:contentSize:animationBehavior:", v7, v4, self->_preferredContentSize.width, self->_preferredContentSize.height);
  }
}

- (void)setPlatformMetrics:(id)a3 contentSize:(CGSize)a4 animationBehavior:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a4.height;
  double width = a4.width;
  [(SBPIPContentViewLayoutSettings *)self->_layoutSettings updatePlatformMetrics:a3];
  layoutSettings = self->_layoutSettings;
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](layoutSettings, "currentContentViewSizeForAspectRatio:", width, height);
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](layoutSettings, "currentContentViewSizeForAspectRatio:");
  self->_toBeAppliedPreferredContentSize.double width = v10;
  self->_toBeAppliedPreferredContentSize.double height = v11;
  self->_preferredContentSize = self->_toBeAppliedPreferredContentSize;
  if ([(SBPIPInteractionController *)self isEnabled])
  {
    [(SBPIPInteractionController *)self preferredNormalizedScale];
    double v13 = v12;
    [(SBPIPInteractionController *)self _updateInteractorsAndCommit:[(SBPIPInteractionController *)self _isInteractive] ^ 1];
    [(SBPIPInteractionController *)self _proratedScaleForNormalizedScale:v13];
    -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:](self, "_setPreferredScale:additionalReasons:animationBehavior:", 4096, v5);
  }
  else
  {
    [(SBPIPInteractionController *)self _setupForInitialFrame];
  }
}

- (void)setContainerSize:(CGSize)a3 withOrientation:(int64_t)a4 scene:(id)a5
{
  if ([a5 isMainDisplayWindowScene])
  {
    BSRectWithSize();
    if (-[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](self, "_updateGeometryContextUsingTargetViewBounds:orientation:", a4))
    {
      if (self->_enabled)
      {
        if ([(SBPIPInteractionController *)self _isInteractive])
        {
          [(SBPIPInteractionController *)self _cancelAllGestures];
        }
        else
        {
          [(SBPIPInteractionController *)self _updateInteractorsAndCommit:1];
          if ([(SBPIPInteractionController *)self _hasInFlightLayoutAnimations]) {
            uint64_t v7 = 2;
          }
          else {
            uint64_t v7 = 0;
          }
          [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:7 withReason:2 behavior:v7];
        }
      }
      else
      {
        [(SBPIPInteractionController *)self _setupForInitialFrame];
      }
    }
  }
}

- (BOOL)isStashed
{
  if (self->_shouldStash == 0x7FFFFFFFFFFFFFFFLL) {
    return self->_didLastSettleInStashedState;
  }
  else {
    return BSSettingFlagIsYes();
  }
}

- (void)setStashed:(BOOL)a3
{
  int v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = SBLogPIP();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    int v11 = 138543618;
    double v12 = shortDescription;
    __int16 v13 = 1024;
    int v14 = v3;
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] setStashed:%{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  if (self->_shouldStash == 0x7FFFFFFFFFFFFFFFLL || BSSettingFlagForBool() != v3)
  {
    self->_shouldStash = BSSettingFlagForBool();
    uint64_t v7 = SBLogPIP();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      long long v8 = self->_shortDescription;
      int IsYes = BSSettingFlagIsYes();
      int v11 = 138543618;
      double v12 = v8;
      __int16 v13 = 1024;
      int v14 = IsYes;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] _shouldStash:%{BOOL}u", (uint8_t *)&v11, 0x12u);
    }

    if (self->_enabled)
    {
      BOOL v10 = [(SBPIPInteractionController *)self _isInteractive];
      [(SBPIPInteractionController *)self _cancelAllGestures];
      [(SBPIPInteractionController *)self _updateInteractorsAndCommit:!v10];
      [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:7 withReason:32 behavior:2];
    }
    else
    {
      [(SBPIPInteractionController *)self _setupForInitialFrame];
    }
  }
}

- (UIEdgeInsets)_minimumStashedPadding:(UIEdgeInsets)a3
{
  CGFloat right = a3.right;
  double bottom = a3.bottom;
  CGFloat left = a3.left;
  double top = a3.top;
  [(SBPIPContentViewLayoutSettings *)self->_layoutSettings contentViewPaddingWhileStashed];
  if (v8 >= top) {
    double top = v8;
  }
  [(SBPIPContentViewLayoutSettings *)self->_layoutSettings contentViewPaddingWhileStashed];
  if (v9 >= bottom) {
    double v10 = v9;
  }
  else {
    double v10 = bottom;
  }
  double v11 = top;
  double v12 = left;
  double v13 = right;
  result.CGFloat right = v13;
  result.double bottom = v10;
  result.CGFloat left = v12;
  result.double top = v11;
  return result;
}

- (UIEdgeInsets)_cachedEdgeInsetsForScene:(id)a3
{
  scenePersistentIdentifierToEdgeInsets = self->_scenePersistentIdentifierToEdgeInsets;
  uint64_t v4 = [a3 session];
  uint64_t v5 = [v4 persistentIdentifier];
  id v6 = [(NSMutableDictionary *)scenePersistentIdentifierToEdgeInsets objectForKeyedSubscript:v5];
  [v6 UIEdgeInsetsValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.CGFloat right = v18;
  result.double bottom = v17;
  result.CGFloat left = v16;
  result.double top = v15;
  return result;
}

- (UIEdgeInsets)_cachedStashedPaddingForScene:(id)a3
{
  scenePersistentIdentifierToStashedPadding = self->_scenePersistentIdentifierToStashedPadding;
  uint64_t v4 = [a3 session];
  uint64_t v5 = [v4 persistentIdentifier];
  id v6 = [(NSMutableDictionary *)scenePersistentIdentifierToStashedPadding objectForKeyedSubscript:v5];
  [v6 UIEdgeInsetsValue];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.CGFloat right = v18;
  result.double bottom = v17;
  result.CGFloat left = v16;
  result.double top = v15;
  return result;
}

- (BOOL)_setEdgeInsets:(UIEdgeInsets)a3 forScene:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  v26.origin.double x = left + self->_geometryContext.containerBounds.origin.x;
  v26.origin.double y = top + self->_geometryContext.containerBounds.origin.y;
  v26.size.double width = self->_geometryContext.containerBounds.size.width - (left + right);
  v26.size.double height = self->_geometryContext.containerBounds.size.height - (top + bottom);
  if (CGRectIsInfinite(v26)
    || (([(SBPIPInteractionController *)self _cachedEdgeInsetsForScene:v9], left == v13)
      ? (BOOL v14 = top == v10)
      : (BOOL v14 = 0),
        v14 ? (BOOL v15 = right == v12) : (BOOL v15 = 0),
        v15 ? (BOOL v16 = bottom == v11) : (BOOL v16 = 0),
        v16))
  {
    BOOL v23 = 0;
  }
  else
  {
    if (!self->_scenePersistentIdentifierToEdgeInsets)
    {
      double v17 = [MEMORY[0x1E4F1CA60] dictionary];
      scenePersistentIdentifierToEdgeInsets = self->_scenePersistentIdentifierToEdgeInsets;
      self->_scenePersistentIdentifierToEdgeInsets = v17;
    }
    *(double *)long long v25 = top;
    *(double *)&v25[1] = left;
    *(double *)&v25[2] = bottom;
    *(double *)&v25[3] = right;
    CGPoint v19 = [MEMORY[0x1E4F29238] valueWithBytes:v25 objCType:"{UIEdgeInsets=dddd}"];
    uint64_t v20 = self->_scenePersistentIdentifierToEdgeInsets;
    long long v21 = [v9 session];
    long long v22 = [v21 persistentIdentifier];
    [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v22];

    if ([v9 isMainDisplayWindowScene])
    {
      self->_geometryContext.edgeInsets.double top = top;
      self->_geometryContext.edgeInsets.double left = left;
      BOOL v23 = 1;
      self->_geometryContext.edgeInsets.double bottom = bottom;
      self->_geometryContext.edgeInsets.double right = right;
    }
    else
    {
      BOOL v23 = 1;
    }
  }

  return v23;
}

- (BOOL)_setStashedPadding:(UIEdgeInsets)a3 forScene:(id)a4
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v9 = a4;
  -[SBPIPInteractionController _minimumStashedPadding:](self, "_minimumStashedPadding:", top, left, bottom, right);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v34.origin.double x = self->_geometryContext.containerBounds.origin.x + v12;
  v34.origin.double y = v11 + self->_geometryContext.containerBounds.origin.y;
  v34.size.double width = self->_geometryContext.containerBounds.size.width - (v13 + v16);
  v34.size.double height = self->_geometryContext.containerBounds.size.height - (v11 + v15);
  if (CGRectIsInfinite(v34)
    || (([(SBPIPInteractionController *)self _cachedStashedPaddingForScene:v9],
         v13 == v21)
      ? (BOOL v22 = v11 == v18)
      : (BOOL v22 = 0),
        v22 ? (BOOL v23 = v17 == v20) : (BOOL v23 = 0),
        v23 ? (BOOL v24 = v15 == v19) : (BOOL v24 = 0),
        v24))
  {
    BOOL v31 = 0;
  }
  else
  {
    if (!self->_scenePersistentIdentifierToStashedPadding)
    {
      long long v25 = [MEMORY[0x1E4F1CA60] dictionary];
      scenePersistentIdentifierToStashedPadding = self->_scenePersistentIdentifierToStashedPadding;
      self->_scenePersistentIdentifierToStashedPadding = v25;
    }
    *(double *)uint64_t v33 = v11;
    *(double *)&v33[1] = v13;
    *(double *)&v33[2] = v15;
    *(double *)&v33[3] = v17;
    long long v27 = [MEMORY[0x1E4F29238] valueWithBytes:v33 objCType:"{UIEdgeInsets=dddd}"];
    long long v28 = self->_scenePersistentIdentifierToStashedPadding;
    long long v29 = [v9 session];
    long long v30 = [v29 persistentIdentifier];
    [(NSMutableDictionary *)v28 setObject:v27 forKeyedSubscript:v30];

    if ([v9 isMainDisplayWindowScene])
    {
      self->_geometryContext.stashedMinimumPadding.double top = v11;
      self->_geometryContext.stashedMinimumPadding.double left = v13;
      BOOL v31 = 1;
      self->_geometryContext.stashedMinimumPadding.double bottom = v15;
      self->_geometryContext.stashedMinimumPadding.double right = v17;
    }
    else
    {
      BOOL v31 = 1;
    }
  }

  return v31;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  -[SBPIPContentViewLayoutSettings currentContentViewSizeForAspectRatio:](self->_layoutSettings, "currentContentViewSizeForAspectRatio:");
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  UISizeRoundToScale();
  double v11 = v10;
  double v13 = v12;
  UISizeRoundToScale();
  if (v11 != v15 || v13 != v14)
  {
    double v17 = SBLogPIP();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      v31.CGFloat width = width;
      v31.CGFloat height = height;
      double v19 = NSStringFromCGSize(v31);
      double v20 = NSStringFromCGSize(self->_toBeAppliedPreferredContentSize);
      BOOL enabled = self->_enabled;
      int v22 = 138544130;
      BOOL v23 = shortDescription;
      __int16 v24 = 2114;
      long long v25 = v19;
      __int16 v26 = 2114;
      long long v27 = v20;
      __int16 v28 = 1024;
      BOOL v29 = enabled;
      _os_log_debug_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating public layout trait preferredContentSize:{%{public}@} currentPreferredContentSize{%{public}@} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);
    }
    self->_toBeAppliedPreferredContentSize.CGFloat width = v7;
    self->_toBeAppliedPreferredContentSize.CGFloat height = v9;
    if (self->_enabled)
    {
      [(SBPIPInteractionController *)self _updatePreferredContentSize];
    }
    else
    {
      self->_preferredContentSize = self->_toBeAppliedPreferredContentSize;
      [(SBPIPInteractionController *)self _setupForInitialFrame];
    }
  }
}

- (void)toggleUserPreferredScale
{
  if (![(SBPIPInteractionController *)self _isInteractive])
  {
    -[SBPIPContentViewLayoutSettings minimumPreferredContentViewSizeForAspectRatio:](self->_layoutSettings, "minimumPreferredContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
    double v4 = v3;
    -[SBPIPContentViewLayoutSettings maximumPreferredContentViewSizeForAspectRatio:](self->_layoutSettings, "maximumPreferredContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
    double width = self->_preferredContentSize.width;
    double v6 = v4 / width;
    double v8 = v7 / width;
    [(SBPIPInteractionController *)self _currentScale];
    double v10 = v9;
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      if (BSFloatEqualToFloat())
      {
        double v8 = v6;
      }
      else if (vabdd_f64(v10, v6) >= vabdd_f64(v10, v8))
      {
        double v8 = v6;
      }
    }
    [(SBPIPInteractionController *)self _setPreferredScale:0 additionalReasons:2 animationBehavior:v8];
  }
}

- (double)_proratedScaleForNormalizedScale:(double)a3
{
  double v4 = [(_UIHyperInteractor *)self->_scaleInteractor _region];
  double v5 = *(double *)[v4 _minimumPoint];
  double v6 = v5 + (*(double *)[v4 _maximumPoint] - v5) * a3;

  return v6;
}

- (void)setPreferredNormalizedScale:(double)a3
{
}

- (void)setPreferredNormalizedScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  [(SBPIPInteractionController *)self currentNormalizedScale];
  char v9 = BSFloatEqualToFloat();
  if (![(SBPIPInteractionController *)self _isInteractive])
  {
    char v10 = (a4 & 8) != 0 ? 0 : v9;
    if ((v10 & 1) == 0)
    {
      [(SBPIPInteractionController *)self _proratedScaleForNormalizedScale:a3];
      -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:](self, "_setPreferredScale:additionalReasons:animationBehavior:", a4, v5);
    }
  }
}

- (void)_setPreferredScale:(double)a3 additionalReasons:(unint64_t)a4 animationBehavior:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  char v9 = SBLogPIP();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SBPIPInteractionController _setPreferredScale:additionalReasons:animationBehavior:]();
  }

  self->_preferredScale = a3;
  [(SBPIPInteractionController *)self _applyPreferredScale];
  if (self->_enabled)
  {
    [(SBPIPInteractionController *)self _updateInteractorsAndCommit:[(SBPIPInteractionController *)self _isPinching] ^ 1];
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:2 withReason:a4 | 0x10 behavior:v5];
  }
  else
  {
    [(SBPIPInteractionController *)self _setupForInitialFrame];
  }
}

- (void)_applyPreferredScale
{
}

- (BOOL)_isPreferredContentSizeDirty
{
  return self->_preferredContentSize.height != self->_toBeAppliedPreferredContentSize.height
      || self->_preferredContentSize.width != self->_toBeAppliedPreferredContentSize.width;
}

- (void)_updatePreferredContentSize
{
  v1 = NSStringFromCGSize(a1[8]);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "[%{public}@][Layout] Applying new size preferredSize[%{public}@]", v4, v5, v6, v7, v8);
}

- (void)layoutInteractedTraits:(unint64_t)a3 withReason:(unint64_t)a4 source:(id)a5
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  if (v9)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_34:
    CGFloat v50 = [MEMORY[0x1E4F28B00] currentHandler];
    [v50 handleFailureInMethod:a2 object:self file:@"SBPIPInteractionController.m" lineNumber:838 description:@"Was asked to layout for no traits."];

    if (a4) {
      goto LABEL_4;
    }
    goto LABEL_35;
  }
  double v49 = [MEMORY[0x1E4F28B00] currentHandler];
  [v49 handleFailureInMethod:a2 object:self file:@"SBPIPInteractionController.m" lineNumber:837 description:@"Was asked to layout for undefined source."];

  if (!a3) {
    goto LABEL_34;
  }
LABEL_3:
  if (a4) {
    goto LABEL_4;
  }
LABEL_35:
  CGFloat v51 = [MEMORY[0x1E4F28B00] currentHandler];
  [v51 handleFailureInMethod:a2 object:self file:@"SBPIPInteractionController.m" lineNumber:839 description:@"Was asked to layout for undefined reason."];

LABEL_4:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  id v11 = objc_loadWeakRetained((id *)&self->_targetOverlayView);
  [(SBPIPInteractionController *)self _currentSizeForLayoutReason:a4];
  double v13 = v12;
  double v15 = v14;
  [(SBPIPInteractionController *)self _currentPositionForLayoutReason:a4];
  double v54 = v16;
  double v55 = v17;
  [(SBPIPInteractionController *)self _currentRotation];
  CGFloat v19 = v18;
  if ((a4 & 0x300) != 0)
  {
    if (self->_enabled)
    {
      double v20 = [WeakRetained layer];
      objc_msgSend(v20, "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
    }
    double v21 = [v11 layer];
    objc_msgSend(v21, "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
  }
  if ((a3 & 7) != 0)
  {
    if (self->_enabled)
    {
      int v22 = [WeakRetained _sbWindowScene];
      [(SBPIPInteractionController *)self _transformFromDisplayArrangeSpaceToWindowScene:v22];
      float64x2_t v52 = vaddq_f64(v64, vmlaq_n_f64(vmulq_n_f64(v63, v55), v62, v54));

      [WeakRetained setCenter:*(_OWORD *)&v52];
    }
    BOOL v23 = objc_msgSend(v11, "_sbWindowScene", *(void *)&v52.f64[0]);
    [(SBPIPInteractionController *)self _transformFromDisplayArrangeSpaceToWindowScene:v23];
    float64x2_t v52 = vaddq_f64(v61, vmlaq_n_f64(vmulq_n_f64(v60, v55), v59, v54));

    [v11 setCenter:*(_OWORD *)&v52];
  }
  if ((a3 & 2) != 0)
  {
    if (self->_enabled) {
      objc_msgSend(WeakRetained, "setBounds:", 0.0, 0.0, v13, v15);
    }
    objc_msgSend(v11, "setBounds:", 0.0, 0.0, v13, v15, *(void *)&v52.f64[0]);
  }
  [(SBPIPInteractionController *)self stashProgress];
  double v25 = v24;
  if (a3)
  {
    [(SBPIPInteractionController *)self _noteStashProgress:a4 withReason:v24];
    [(SBPIPInteractionController *)self _stashTabCompensationTransformForStashProgress:a4 reason:v25];
    long long v26 = *(_OWORD *)&t1[16];
    *(_OWORD *)&self->_stashTabCompensationTransform.a = *(_OWORD *)t1;
    *(_OWORD *)&self->_stashTabCompensationTransform.c = v26;
    *(_OWORD *)&self->_stashTabCompensationTransform.tCGFloat x = *(_OWORD *)&t1[32];
  }
  if ((a3 & 4) != 0)
  {
    p_rotationTransform = &self->_rotationTransform;
    uint64_t v28 = MEMORY[0x1E4F1DAB8];
    long long v29 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    if (v19 == 0.0)
    {
      *(_OWORD *)&p_rotationTransform->a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&self->_rotationTransform.c = v29;
      long long v30 = *(_OWORD *)(v28 + 32);
    }
    else
    {
      *(_OWORD *)&v58.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v58.c = v29;
      *(_OWORD *)&v58.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformRotate((CGAffineTransform *)t1, &v58, v19);
      long long v31 = *(_OWORD *)&t1[16];
      *(_OWORD *)&p_rotationTransform->a = *(_OWORD *)t1;
      *(_OWORD *)&self->_rotationTransform.c = v31;
      long long v30 = *(_OWORD *)&t1[32];
    }
    *(_OWORD *)&self->_rotationTransform.tCGFloat x = v30;
  }
  long long v32 = *(_OWORD *)&self->_stashTabCompensationTransform.c;
  *(_OWORD *)t1 = *(_OWORD *)&self->_stashTabCompensationTransform.a;
  *(_OWORD *)&t1[16] = v32;
  long long v33 = *(_OWORD *)&self->_rotationTransform.a;
  *(_OWORD *)&t1[32] = *(_OWORD *)&self->_stashTabCompensationTransform.tx;
  long long v34 = *(_OWORD *)&self->_rotationTransform.c;
  long long v35 = *(_OWORD *)&self->_rotationTransform.tx;
  *(_OWORD *)&t2.a = v33;
  *(_OWORD *)&t2.c = v34;
  *(_OWORD *)&t2.tCGFloat x = v35;
  memset(&v58, 0, sizeof(v58));
  CGAffineTransformConcat(&v58, (CGAffineTransform *)t1, &t2);
  if (WeakRetained) {
    [WeakRetained transform];
  }
  else {
    memset(&v56, 0, sizeof(v56));
  }
  *(CGAffineTransform *)t1 = v58;
  if (!CGAffineTransformEqualToTransform(&v56, (CGAffineTransform *)t1))
  {
    if (self->_enabled)
    {
      *(CGAffineTransform *)t1 = v58;
      [WeakRetained setTransform:t1];
    }
    *(CGAffineTransform *)t1 = v58;
    [v11 setTransform:t1];
  }
  [WeakRetained layoutIfNeeded];
  [v11 layoutIfNeeded];
  [(SBPIPInteractionController *)self _updateHyperregionVisualizationIfNecessary];
  uint64_t v36 = SBLogPIP();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    long long v38 = SBStringFromPIPLayoutTrait(a3);
    [WeakRetained frame];
    uint64_t v40 = v39;
    [WeakRetained frame];
    uint64_t v42 = v41;
    CGFloat x = self->_anchorPoint.x;
    CGFloat y = self->_anchorPoint.y;
    [(SBPIPInteractionController *)self _currentScale];
    uint64_t v45 = v44;
    long long v46 = SBStringFromPIPLayoutReason(a4);
    double v47 = (objc_class *)objc_opt_class();
    double v48 = NSStringFromClass(v47);
    *(_DWORD *)t1 = 138546946;
    *(void *)&t1[4] = shortDescription;
    *(_WORD *)&t1[12] = 2114;
    *(void *)&t1[14] = v38;
    *(_WORD *)&t1[22] = 2048;
    *(void *)&t1[24] = v40;
    *(_WORD *)&t1[32] = 2048;
    *(void *)&t1[34] = v42;
    *(_WORD *)&t1[42] = 2048;
    *(double *)&t1[44] = v13;
    __int16 v66 = 2048;
    double v67 = v15;
    __int16 v68 = 2048;
    double v69 = v54;
    __int16 v70 = 2048;
    double v71 = v55;
    __int16 v72 = 2048;
    CGFloat v73 = x;
    __int16 v74 = 2048;
    CGFloat v75 = y;
    __int16 v76 = 2048;
    CGFloat v77 = v19;
    __int16 v78 = 2048;
    uint64_t v79 = v45;
    __int16 v80 = 2048;
    double v81 = v25;
    __int16 v82 = 2114;
    v83 = v46;
    __int16 v84 = 2114;
    __int16 v85 = v48;
    _os_log_debug_impl(&dword_1D85BA000, v36, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] traits: %{public}@\t origin{%.2f,%.2f} size{%.2f,%.2f} position{%.2f,%.2f} anchorPoint{%.2f,%.2f} rotation %.2f scale %.2f stashProgress{%.2f} reason{%{public}@} source{%{public}@}", t1, 0x98u);
  }
}

- (void)layoutWithFrame:(CGRect)a3 reason:(id)a4 source:(id)a5 usingDisplayArrangementSpace:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  id v16 = objc_loadWeakRetained((id *)&self->_targetOverlayView);
  double v32 = width;
  double v33 = height;
  double v29 = x;
  double v31 = y;
  if (v6)
  {
    double v17 = [WeakRetained _sbWindowScene];
    [(SBPIPInteractionController *)self _transformFromDisplayArrangeSpaceToWindowScene:v17];
    v49.origin.double x = x;
    v49.origin.double y = y;
    v49.size.double width = width;
    v49.size.double height = height;
    CGRect v50 = CGRectApplyAffineTransform(v49, &v35);
    double v18 = v50.origin.x;
    double v19 = v50.origin.y;
    double v20 = v50.size.width;
    double v21 = v50.size.height;

    int v22 = [v16 _sbWindowScene];
    [(SBPIPInteractionController *)self _transformFromDisplayArrangeSpaceToWindowScene:v22];
    v51.origin.double x = x;
    v51.origin.double y = y;
    v51.size.double width = width;
    v51.size.double height = height;
    CGRect v52 = CGRectApplyAffineTransform(v51, &v34);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
  }
  else
  {
    double v21 = height;
    double v20 = width;
    double v19 = y;
    double v18 = x;
  }
  objc_msgSend(WeakRetained, "setFrame:", v18, v19, v20, v21, *(void *)&v29, *(void *)&v31, *(void *)&v32, *(void *)&v33);
  objc_msgSend(v16, "setFrame:", x, y, width, height);
  [WeakRetained layoutIfNeeded];
  [v16 layoutIfNeeded];
  [(SBPIPInteractionController *)self _updateHyperregionVisualizationIfNecessary];
  BOOL v23 = SBLogPIP();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    shortDescription = self->_shortDescription;
    BOOL enabled = self->_enabled;
    long long v26 = NSStringFromCGRect(v30);
    long long v27 = (objc_class *)objc_opt_class();
    uint64_t v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138544642;
    long long v37 = shortDescription;
    __int16 v38 = 1024;
    BOOL v39 = enabled;
    __int16 v40 = 2114;
    uint64_t v41 = v26;
    __int16 v42 = 2114;
    id v43 = v13;
    __int16 v44 = 2114;
    id v45 = v14;
    __int16 v46 = 2114;
    double v47 = v28;
    _os_log_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@][Layout] With externally provided frame while enabled{%{BOOL}u}: frame{%{public}@} reason{%{public}@} source{[%{public}@]%{public}@}", buf, 0x3Au);
  }
}

- (CGPoint)_currentPosition
{
  double v3 = *(double *)[(_UIHyperInteractor *)self->_positionInteractor _constrainedPoint];
  double v4 = *(double *)([(_UIHyperInteractor *)self->_positionInteractor _constrainedPoint] + 8);
  double v5 = v3;
  result.double y = v4;
  result.double x = v5;
  return result;
}

- (CGPoint)_currentPositionForLayoutReason:(unint64_t)a3
{
  __int16 v3 = a3;
  [(SBPIPInteractionController *)self _currentSizeForLayoutReason:"_currentSizeForLayoutReason:"];
  [(SBPIPInteractionController *)self _currentPosition];
  if ((v3 & 0x400) != 0)
  {
    -[SBPIPInteractionController _roundPosition:forSize:](self, "_roundPosition:forSize:");
  }
  result.double y = v6;
  result.double x = v5;
  return result;
}

- (CGPoint)_roundPosition:(CGPoint)a3 forSize:(CGSize)a4
{
  double v4 = a4.width * 0.5 + floor(a3.x - a4.width * 0.5);
  double v5 = a4.height * 0.5 + floor(a3.y - a4.height * 0.5);
  result.double y = v5;
  result.double x = v4;
  return result;
}

- (CGSize)_currentSizeForLayoutReason:(unint64_t)a3
{
  [(SBPIPInteractionController *)self _currentScale];
  UISizeRoundToScale();
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (double)_currentScale
{
  return *(double *)[(_UIHyperInteractor *)self->_scaleInteractor _constrainedPoint];
}

- (CGSize)_lastSteadySize
{
  double v3 = (double *)[(_UIHyperInteractor *)self->_scaleInteractor _unconstrainedPoint];
  double v4 = *v3 * self->_preferredContentSize.width;
  double v5 = *v3 * self->_preferredContentSize.height;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (double)_currentRotation
{
  return *(double *)[(_UIHyperInteractor *)self->_rotationInteractor _constrainedPoint];
}

- (double)stashProgress
{
  [(SBPIPInteractionController *)self _currentPosition];
  -[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:");
  return result;
}

- (double)_stashProgressForPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  double v6 = 0.0;
  if (![(SBPIPInteractionController *)self _isPinching]
    && ![(SBPIPInteractionController *)self _isRotating]
    && (self->_stashedLeftRegion || self->_stashedRightRegion))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    uint8_t v8 = [WeakRetained superview];
    [v8 bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [WeakRetained frame];
    v60.origin.double x = v17;
    v60.origin.double y = v18;
    v60.size.double width = v19;
    v60.size.double height = v20;
    v59.origin.double x = v10;
    v59.origin.double y = v12;
    v59.size.double width = v14;
    v59.size.double height = v16;
    BOOL v21 = CGRectContainsRect(v59, v60);

    double v6 = 0.0;
    if (!v21)
    {
      v36.double x = 0.0;
      v36.double y = 0.0;
      BOOL v22 = -[SBPIPInteractionController _isPositionCloserToStashedLeftRegion:closestPointOut:](self, "_isPositionCloserToStashedLeftRegion:closestPointOut:", &v36, x, y);
      [WeakRetained bounds];
      double v24 = v23 * 0.5;
      double v25 = v36.x - v23 * 0.5;
      double v26 = v36.x + v23 * 0.5;
      double v27 = -(v23 * 0.5);
      if (!v22) {
        double v27 = v23 * 0.5;
      }
      double v28 = x + v27;
      double v29 = (x + v27 - v25) / (v26 - v25) + 0.0;
      double v30 = 1.0 - v29;
      if (!v22) {
        double v30 = (x + v27 - v25) / (v26 - v25) + 0.0;
      }
      double v6 = fmin(fmax(v30, 0.0), 1.0);
      double v31 = SBLogPIP();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        double v33 = _SBFLoggingMethodProem();
        v58.double x = x;
        v58.double y = y;
        CGAffineTransform v34 = NSStringFromCGPoint(v58);
        CGAffineTransform v35 = NSStringFromCGPoint(v36);
        *(_DWORD *)buf = 138414594;
        __int16 v38 = v33;
        __int16 v39 = 2112;
        __int16 v40 = v34;
        __int16 v41 = 2112;
        __int16 v42 = v35;
        __int16 v43 = 1024;
        BOOL v44 = v22;
        __int16 v45 = 2048;
        double v46 = v24;
        __int16 v47 = 2048;
        double v48 = v28;
        __int16 v49 = 2048;
        double v50 = v25;
        __int16 v51 = 2048;
        double v52 = v26;
        __int16 v53 = 2048;
        double v54 = v29;
        __int16 v55 = 2048;
        double v56 = v6;
        _os_log_debug_impl(&dword_1D85BA000, v31, OS_LOG_TYPE_DEBUG, "%@ position: %@; closestPoint: %@; closerToStashedLeft: %{BOOL}u; bias: %g; effectivePositionX: %g; minValue: "
          "%g; maxValue: %g; progress: %g; normalizedProgress: %g",
          buf,
          0x62u);
      }
    }
  }
  return v6;
}

- (CGPoint)_interactionTargetViewPresentationPosition
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  double v4 = [WeakRetained layer];
  double v5 = [v4 presentationLayer];
  [v5 position];
  double v12 = v7;
  double v13 = v6;

  uint8_t v8 = [WeakRetained _sbWindowScene];
  [(SBPIPInteractionController *)self _transformToDisplayArrangementSpaceFromWindowScene:v8];

  float64x2_t v11 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, v12), v14, v13));
  double v10 = v11.f64[1];
  double v9 = v11.f64[0];
  result.double y = v10;
  result.double x = v9;
  return result;
}

- (void)_noteStashProgress:(double)a3 withReason:(unint64_t)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (self->_lastStashedProgress != a3)
  {
    self->_lastStashedProgress = a3;
    [(SBPIPInteractionSettings *)self->_interactionSettings stashProgressTabAppearanceThresholdX];
    double v7 = v6;
    uint64_t v8 = -[SBPIPInteractionController _isPositionCloserToStashedLeftRegion:closestPointOut:](self, "_isPositionCloserToStashedLeftRegion:closestPointOut:", 0, *(double *)[(_UIHyperInteractor *)self->_positionInteractor _constrainedPoint], *(double *)([(_UIHyperInteractor *)self->_positionInteractor _constrainedPoint]+ 8)) ^ 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 interactionController:self didUpdateStashProgress:a3];
    if ([(_UIHyperInteractor *)self->_positionInteractor sbpip_isInteractive])
    {
      [v10 interactionController:self wantsStashTabHidden:v7 > a3 left:v8];
      if (self->_didLastSettleInStashedState)
      {
        if (v7 > a3
          || (long long v11 = *(_OWORD *)&self->_stashTabCompensationTransform.c,
              *(_OWORD *)&v28.a = *(_OWORD *)&self->_stashTabCompensationTransform.a,
              *(_OWORD *)&v28.c = v11,
              *(_OWORD *)&v28.tdouble x = *(_OWORD *)&self->_stashTabCompensationTransform.tx,
              !CGAffineTransformIsIdentity(&v28)))
        {
          [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:1 withReason:2048 behavior:2];
        }
      }
      goto LABEL_15;
    }
    layoutProgressPropertdouble y = self->_layoutProgressProperty;
    if (layoutProgressProperty)
    {
      [(UIViewFloatAnimatableProperty *)layoutProgressProperty invalidate];
      double v13 = self->_layoutProgressProperty;
      self->_layoutProgressPropertdouble y = 0;
    }
    if (self->_didLastSettleInStashedState)
    {
      float64x2_t v14 = [WeakRetained window];
      if (v14)
      {
        float64x2_t v15 = [WeakRetained window];
        char v16 = [v15 isHidden];

        if ((v16 & 1) == 0)
        {
          CGFloat v20 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
          BOOL v21 = self->_layoutProgressProperty;
          self->_layoutProgressPropertdouble y = v20;

          [(UIViewFloatAnimatableProperty *)self->_layoutProgressProperty setValue:0.0];
          [(UIViewFloatAnimatableProperty *)self->_layoutProgressProperty setValue:1.0];
          objc_initWeak((id *)&v28, self);
          BOOL v22 = (void *)MEMORY[0x1E4F42FF0];
          v29[0] = self->_layoutProgressProperty;
          double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __60__SBPIPInteractionController__noteStashProgress_withReason___block_invoke;
          v24[3] = &unk_1E6B01A58;
          objc_copyWeak(&v26, (id *)&v28);
          v24[4] = self;
          id v25 = v10;
          char v27 = v8;
          [v22 _createTransformerWithInputAnimatableProperties:v23 presentationValueChangedCallback:v24];

          objc_destroyWeak(&v26);
          objc_destroyWeak((id *)&v28);
          goto LABEL_15;
        }
      }
      BOOL v17 = v7 > a3;
      CGFloat v18 = v10;
      CGFloat v19 = self;
    }
    else
    {
      CGFloat v18 = v10;
      CGFloat v19 = self;
      BOOL v17 = 1;
    }
    [v18 interactionController:v19 wantsStashTabHidden:v17 left:v8];
LABEL_15:
  }
}

void __60__SBPIPInteractionController__noteStashProgress_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && WeakRetained[18])
  {
    double v6 = WeakRetained;
    [*(id *)(a1 + 32) _interactionTargetViewPresentationPosition];
    objc_msgSend(v6, "_stashProgressForPosition:");
    double v4 = v3;
    [v6[86] stashProgressTabAppearanceThresholdX];
    [*(id *)(a1 + 40) interactionController:v6 wantsStashTabHidden:v4 < v5 left:*(unsigned __int8 *)(a1 + 56)];
    id WeakRetained = v6;
  }
}

- (BOOL)_isPositionCloserToStashedLeftRegion:(CGPoint)a3 closestPointOut:(CGPoint *)a4
{
  CGPoint v16 = a3;
  stashedLeftRegion = self->_stashedLeftRegion;
  stashedRightRegion = self->_stashedRightRegion;
  if (stashedLeftRegion)
  {
    if (stashedRightRegion)
    {
      long long v15 = *MEMORY[0x1E4F1DAD8];
      long long v13 = v15;
      [(_UIHyperregionUnion *)stashedLeftRegion _closestPoint:&v15 toPoint:&v16];
      long long v14 = v13;
      [(_UIHyperregionUnion *)self->_stashedRightRegion _closestPoint:&v14 toPoint:&v16];
      UIDistanceBetweenPoints();
      double v9 = v8;
      UIDistanceBetweenPoints();
      BOOL result = v9 < v10;
      if (a4)
      {
        if (v9 >= v10) {
          double v12 = (CGPoint *)&v14;
        }
        else {
          double v12 = (CGPoint *)&v15;
        }
        *a4 = *v12;
      }
    }
    else
    {
      [(_UIHyperregionUnion *)stashedLeftRegion _closestPoint:a4 toPoint:&v16];
      return 1;
    }
  }
  else
  {
    if (stashedRightRegion) {
      [(_UIHyperregionUnion *)self->_stashedRightRegion _closestPoint:a4 toPoint:&v16];
    }
    return 0;
  }
  return result;
}

- (CGAffineTransform)_stashTabCompensationTransformForStashProgress:(SEL)a3 reason:(double)a4
{
  long long v7 = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].a;
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[12].tx;
  if ((a5 & 0x400) != 0)
  {
    uint64_t v17 = MEMORY[0x1E4F1DAB8];
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v18;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v17 + 32);
  }
  else if (a5 == 2048)
  {
    double v8 = (id *)self;
    if (LOBYTE(self->ty))
    {
      [*(id *)&self[14].c stashProgressTabAppearanceThresholdX];
      double v10 = v9;
      int v11 = objc_msgSend(v8, "_isPositionCloserToStashedLeftRegion:closestPointOut:", 0, *(double *)objc_msgSend(v8[57], "_constrainedPoint"), *(double *)(objc_msgSend(v8[57], "_constrainedPoint") + 8));
      [v8[88] minimumStashedTabSize];
      if (!v11) {
        double v12 = -v12;
      }
      uint64_t v13 = v11 ^ 1u;
      double v14 = 0.0;
      if (v10 > a4) {
        double v14 = 1.0;
      }
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v19.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v19.c = v15;
      *(_OWORD *)&v19.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransformTranslate(retstr, &v19, v14 * v12, 0.0);
      id WeakRetained = objc_loadWeakRetained(v8 + 1);
      [WeakRetained interactionController:v8 wantsStashTabHidden:v10 > a4 left:v13];
    }
  }
  return self;
}

- (void)_adjustContentViewAnchorPointForGestureRecognizer:(id)a3
{
  double v33 = (UIPanGestureRecognizer *)a3;
  uint64_t v5 = [(UIPanGestureRecognizer *)v33 state];
  double v6 = NSString;
  shortDescription = self->_shortDescription;
  double v8 = (objc_class *)objc_opt_class();
  double v9 = NSStringFromClass(v8);
  double v10 = [v6 stringWithFormat:@"[%@] %@ state — %i — is not suitable for anchor point update", shortDescription, v9, v5];

  if ((unint64_t)(v5 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"SBPIPInteractionController.m" lineNumber:1104 description:v10];
  }
  if (![(_UIHyperInteractor *)self->_positionInteractor sbpip_isRubberBanding])
  {
    if (self->_edgeResizeGestureRecognizer == v33)
    {
      [(SBPIPInteractionController *)self edgeResizeAnchorPoint];
      double v21 = v20;
      double v23 = v22;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
      if ([(SBPIPInteractionController *)self _isSystemGestureRecognizer:v33])
      {
        double v12 = [(UIPanGestureRecognizer *)v33 _activeEventOfType:0];
        uint64_t v13 = [(UIPanGestureRecognizer *)v33 _activeTouchesForEvent:v12];
        double v14 = [v13 anyObject];

        if ([v14 type] == 1)
        {
          long long v15 = [(SBSystemGestureManager *)self->_systemGestureManagerForResizing indirectTouchLifecycleMonitor];
          [v15 systemGestureHoverLocationInView:WeakRetained];
          double v17 = v16;
          double v19 = v18;
        }
        else
        {
          [(UIPanGestureRecognizer *)v33 locationInView:0];
          -[SBPIPInteractionController _convertPointToInteractionTargetView:fromSystemGestureRecognizer:](self, "_convertPointToInteractionTargetView:fromSystemGestureRecognizer:", v33);
          double v17 = v26;
          double v19 = v27;
        }
      }
      else
      {
        [(UIPanGestureRecognizer *)v33 locationInView:WeakRetained];
        double v17 = v24;
        double v19 = v25;
      }
      [WeakRetained bounds];
      double v21 = v17 / v28;
      double v23 = v19 / v29;
    }
    double v30 = (objc_class *)objc_opt_class();
    double v31 = NSStringFromClass(v30);
    -[SBPIPInteractionController __moveToAnchorPoint:reason:](self, "__moveToAnchorPoint:reason:", v31, v21, v23);
  }
}

- (void)_resetAnchorPoint
{
  double v3 = *(double *)[(_UIHyperInteractor *)self->_positionInteractor _translation];
  double v4 = *(double *)([(_UIHyperInteractor *)self->_positionInteractor _translation] + 8);
  [(SBPIPInteractionController *)self _lastSteadySize];
  double v6 = v5;
  [(SBPIPInteractionController *)self _currentSizeForLayoutReason:1024];
  double v8 = v7 / v6;
  double v9 = v3 - self->_geometryContext.pipAnchorPointOffset.x * v8;
  double v10 = v4 - self->_geometryContext.pipAnchorPointOffset.y * v8;
  *(double *)double v16 = v9;
  *(double *)&v16[1] = v10;
  [(_UIHyperInteractor *)self->_positionInteractor _copyTranslation:v16];
  __asm { FMOV            V0.2D, #0.5 }
  self->_anchorPoint = _Q0;
  self->_geometryContext.CGPoint pipAnchorPointOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (void)__moveToAnchorPoint:(CGPoint)a3 reason:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  double v9 = self->_anchorPoint.x;
  double v10 = self->_anchorPoint.y;
  [WeakRetained bounds];
  double v12 = (x - v9) * v11;
  double v14 = (y - v10) * v13;
  double v15 = self->_geometryContext.pipAnchorPointOffset.x + v12;
  double v16 = self->_geometryContext.pipAnchorPointOffset.y + v14;
  self->_anchorPoint.double x = x;
  self->_anchorPoint.double y = y;
  positionInteractor = self->_positionInteractor;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __57__SBPIPInteractionController___moveToAnchorPoint_reason___block_invoke;
  v22[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v22[4] = v12;
  *(double *)&v22[5] = v14;
  [(_UIHyperInteractor *)positionInteractor _mutateTranslation:v22];
  self->_geometryContext.pipAnchorPointOffset.double x = v15;
  self->_geometryContext.pipAnchorPointOffset.double y = v16;
  double v18 = SBLogPIP();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    CGFloat v20 = self->_anchorPoint.x;
    CGFloat v21 = self->_anchorPoint.y;
    *(_DWORD *)buf = 138545666;
    double v24 = shortDescription;
    __int16 v25 = 2114;
    id v26 = v7;
    __int16 v27 = 2048;
    double v28 = v9;
    __int16 v29 = 2048;
    double v30 = v10;
    __int16 v31 = 2048;
    CGFloat v32 = v20;
    __int16 v33 = 2048;
    CGFloat v34 = v21;
    __int16 v35 = 2048;
    double v36 = v12;
    __int16 v37 = 2048;
    double v38 = v14;
    __int16 v39 = 2048;
    double v40 = v15;
    __int16 v41 = 2048;
    double v42 = v16;
    _os_log_debug_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][Anchor Point] Changed for %{public}@: oldAnchorPoint{%.2f, %.2f} newAnchorPoint{%.2f, %.2f} positionTranslation{%.2f, %.2f} positionTranslationOffset{%.2f, %.2f}", buf, 0x66u);
  }
}

double __57__SBPIPInteractionController___moveToAnchorPoint_reason___block_invoke(uint64_t a1, double *a2)
{
  double v2 = a2[1];
  *a2 = *(double *)(a1 + 32) + *a2;
  double result = *(double *)(a1 + 40) + v2;
  a2[1] = result;
  return result;
}

- (void)_sizeChangeBeganWithBehavior:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  self->_isChangingSize = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained interactionControllerDidBeginSizeChange:self behavior:v3];
}

- (void)_sizeChangeEnded
{
  self->_isChangingSize = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained interactionControllerDidEndSizeChange:self];
}

- (CGPoint)_convertPointToInteractionTargetView:(CGPoint)a3 fromSystemGestureRecognizer:(id)a4
{
  p_interactionTargetView = &self->_interactionTargetView;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_interactionTargetView);
  id v7 = [v5 view];

  [v7 size];
  _UIWindowConvertPointFromOrientationToOrientation();
  double v9 = v8;
  double v11 = v10;

  double v12 = [WeakRetained superview];
  objc_msgSend(WeakRetained, "convertPoint:fromView:", v12, v9, v11);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (CGAffineTransform)_transformToDisplayArrangementSpaceFromWindowScene:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1E4F1DAB8];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v7 + 32);
  id v32 = v6;
  if (v6 && ([v6 isMainDisplayWindowScene] & 1) == 0)
  {
    double v9 = [v32 _sbDisplayConfiguration];
    int v10 = SBSDisplayEdgeAdjacentToNeighboringDisplay();
    objc_msgSend(v32, "_boundsForInterfaceOrientation:", objc_msgSend(v32, "interfaceOrientation"));
    CGFloat v15 = v11;
    CGFloat v16 = v12;
    CGFloat v17 = v13;
    CGFloat v18 = v14;
    CGFloat x = self->_geometryContext.containerBounds.origin.x;
    CGFloat y = self->_geometryContext.containerBounds.origin.y;
    CGFloat width = self->_geometryContext.containerBounds.size.width;
    CGFloat height = self->_geometryContext.containerBounds.size.height;
    switch(v10)
    {
      case 0:
        double v23 = CGRectGetWidth(self->_geometryContext.containerBounds);
        goto LABEL_7;
      case 1:
        double v31 = CGRectGetWidth(self->_geometryContext.containerBounds);
        v34.origin.CGFloat x = v15;
        v34.origin.CGFloat y = v16;
        v34.size.CGFloat width = v17;
        v34.size.CGFloat height = v18;
        retstr->tCGFloat x = (v31 - CGRectGetWidth(v34)) * 0.5;
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        double v24 = CGRectGetHeight(v35);
        goto LABEL_9;
      case 2:
        double v23 = -CGRectGetWidth(*(CGRect *)&v11);
LABEL_7:
        retstr->tCGFloat x = v23;
        v36.origin.CGFloat x = x;
        v36.origin.CGFloat y = y;
        v36.size.CGFloat width = width;
        v36.size.CGFloat height = height;
        double v25 = CGRectGetHeight(v36);
        v37.origin.CGFloat x = v15;
        v37.origin.CGFloat y = v16;
        v37.size.CGFloat width = v17;
        v37.size.CGFloat height = v18;
        double v24 = (v25 - CGRectGetHeight(v37)) * 0.5;
        goto LABEL_9;
      case 3:
        double v26 = CGRectGetWidth(self->_geometryContext.containerBounds);
        v38.origin.CGFloat x = v15;
        v38.origin.CGFloat y = v16;
        v38.size.CGFloat width = v17;
        v38.size.CGFloat height = v18;
        retstr->tCGFloat x = (v26 - CGRectGetWidth(v38)) * 0.5;
        v39.origin.CGFloat x = v15;
        v39.origin.CGFloat y = v16;
        v39.size.CGFloat width = v17;
        v39.size.CGFloat height = v18;
        double v24 = -CGRectGetHeight(v39);
LABEL_9:
        retstr->tCGFloat y = v24;
        break;
      default:
        break;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  UIRoundToViewScale();
  retstr->tCGFloat x = v28;
  UIRoundToViewScale();
  retstr->tCGFloat y = v29;

  return result;
}

- (CGAffineTransform)_transformFromDisplayArrangeSpaceToWindowScene:(SEL)a3
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGPoint result = [(SBPIPInteractionController *)self _transformToDisplayArrangementSpaceFromWindowScene:a4];
  *(float64x2_t *)&retstr->tCGFloat x = vnegq_f64(*(float64x2_t *)&retstr->tx);
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (UIPanGestureRecognizer *)a3;
  id v5 = v4;
  if (self->_pendingTransition)
  {
    BOOL v6 = 0;
  }
  else if (self->_panWhileResizingGestureRecognizer == v4)
  {
    BOOL v6 = [(SBPIPInteractionController *)self _isPinching];
  }
  else
  {
    BOOL v6 = self->_edgeResizeGestureRecognizer != v4 || self->_pointerIsHoveringOverEdge != 0;
  }

  return v6;
}

- (BOOL)gestureRecognizerShouldFailForMovementPastHysteresis:(id)a3
{
  if (self->_rotationGestureRecognizer != a3 && self->_pinchGestureRecognizer != a3) {
    return 1;
  }
  if ([(SBPIPInteractionController *)self _isPinching]) {
    return 0;
  }
  return ![(SBPIPInteractionController *)self _isRotating];
}

- (void)handleExternalPanGesture:(id)a3
{
  id v17 = a3;
  uint64_t v5 = [v17 state];
  if (v5 == 1)
  {
    objc_storeStrong((id *)&self->_externalPanDrivingGestureRecognizer, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    uint64_t v7 = [WeakRetained superview];
    [v17 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    [WeakRetained center];
    CGFloat v13 = v9 - v12;
    [WeakRetained center];
    self->_panGestureLocationOffset.CGFloat x = v13;
    self->_panGestureLocationOffset.CGFloat y = v11 - v14;

    [(SBPIPInteractionController *)self handlePanGesture:v17];
  }
  else
  {
    uint64_t v15 = v5;
    [(SBPIPInteractionController *)self handlePanGesture:v17];
    if ((unint64_t)(v15 - 3) <= 2)
    {
      externalPanDrivingGestureRecognizer = self->_externalPanDrivingGestureRecognizer;
      self->_externalPanDrivingGestureRecognizer = 0;

      self->_panGestureLocationOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    }
  }
}

- (void)handleEdgeResizeGesture:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  switch([v4 state])
  {
    case 1:
      uint64_t v7 = SBLogPIP();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handleEdgeResizeGesture:]((uint64_t)self, (uint64_t)v4);
      }

      self->_pinchGestureScaleFactor = 1.0;
      [WeakRetained bounds];
      self->_edgeResizeGestureBaselineWidthScale = v8 / self->_preferredContentSize.width;
      [WeakRetained bounds];
      self->_edgeResizeGestureBaselineHeightScale = v9 / self->_preferredContentSize.height;
      [WeakRetained bounds];
      self->_edgeResizeGestureBaselineWidth = v10;
      [WeakRetained bounds];
      self->_edgeResizeGestureBaselineHeight = v11;
      [(_UIHyperInteractor *)self->_scaleInteractor sbpip_setInteractive:1];
      [(SBPIPInteractionController *)self _adjustContentViewAnchorPointForGestureRecognizer:v4];
      [(SBPIPInteractionController *)self _handleGestureBeganState:v4];
      goto LABEL_10;
    case 2:
LABEL_10:
      double v12 = [WeakRetained superview];
      [v4 translationInView:v12];
      double v19 = 0.0;
      double v20 = 0.0;
      -[SBPIPInteractionController recalculateScale:baselineScale:forTranslationInView:](self, "recalculateScale:baselineScale:forTranslationInView:", &v20, &v19);
      double v13 = v20 * 0.75 + self->_pinchGestureScaleFactor * 0.25;
      self->_pinchGestureScaleFactor = v13;
      double v14 = -(v19 - v19 * v13);
      double v18 = v14;
      uint64_t v15 = SBLogPIP();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        id v17 = [v4 name];
        *(_DWORD *)buf = 138544130;
        double v22 = shortDescription;
        __int16 v23 = 2114;
        double v24 = v17;
        __int16 v25 = 2048;
        double v26 = v20;
        __int16 v27 = 2048;
        double v28 = v14;
        _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Edge Resize Changed: \t scale %.2f scaleTranslation %.2f", buf, 0x2Au);
      }
      [(_UIHyperInteractor *)self->_scaleInteractor _copyTranslation:&v18];
      [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:2 withReason:256 behavior:1];

      break;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      if (self->_systemGestureManagerForResizing) {
        [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setState:4];
      }
LABEL_4:
      BOOL v6 = SBLogPIP();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handleEdgeResizeGesture:]((uint64_t)self, v4);
      }

      [(SBPIPInteractionController *)self _handleGestureEndedState:v4];
      break;
    default:
      break;
  }
}

- (void)handlePanGesture:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  id v6 = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v7 = [v4 state];
  if ((unint64_t)(v7 - 3) >= 3)
  {
    if (v7 != 2)
    {
      if (v7 != 1) {
        goto LABEL_23;
      }
      double v10 = SBLogPIP();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handlePanGesture:]((uint64_t)self, (uint64_t)v4);
      }

      self->_BOOL threeTouchesPanDetected = 0;
      [(_UIHyperInteractor *)self->_positionInteractor sbpip_setInteractive:1];
      if ([v6 interactionControllerScalesDuringPanGesture:self]) {
        [(_UIHyperInteractor *)self->_scaleInteractor sbpip_setInteractive:1];
      }
      [(SBPIPInteractionController *)self _handleGestureBeganState:v4];
    }
    [(SBPIPInteractionController *)self _updateTargetWindowSceneIfNeeded];
    double v11 = [WeakRetained superview];
    [v4 translationInView:v11];
    double v13 = v12 + self->_panGestureLocationOffset.x;
    double v15 = v14 + self->_panGestureLocationOffset.y;
    [v4 velocityInView:v11];
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    v30[0] = v16;
    v30[1] = v18;
    double v20 = v13 + self->_geometryContext.pipAnchorPointOffset.x;
    double v21 = v15 + self->_geometryContext.pipAnchorPointOffset.y;
    BOOL v22 = objc_msgSend(v4, "numberOfTouches", *(void *)&v20, *(void *)&v21, v16, v18) == 3
       || self->_threeTouchesPanDetected;
    self->_BOOL threeTouchesPanDetected = v22;
    __int16 v23 = SBLogPIP();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      __int16 v27 = [v4 name];
      BOOL threeTouchesPanDetected = self->_threeTouchesPanDetected;
      *(_DWORD *)buf = 138545410;
      id v32 = shortDescription;
      __int16 v33 = 2114;
      CGRect v34 = v27;
      __int16 v35 = 2048;
      double v36 = v13;
      __int16 v37 = 2048;
      double v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = v17;
      __int16 v41 = 2048;
      uint64_t v42 = v19;
      __int16 v43 = 2048;
      double v44 = v20;
      __int16 v45 = 2048;
      double v46 = v21;
      __int16 v47 = 1024;
      BOOL v48 = threeTouchesPanDetected;
      _os_log_debug_impl(&dword_1D85BA000, v23, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Pan Changed: \t translation{%.2f, %.2f} velocity{%.2f, %.2f} anchorPointTranslatedPosition{%.2f, %.2f} _threeTouchesPanDetected{%{BOOL}u}", buf, 0x58u);
    }
    [(_UIHyperInteractor *)self->_positionInteractor _copyTranslation:&v29];
    [(_UIHyperInteractor *)self->_positionInteractor _copyVelocity:v30];
    if ([v6 interactionControllerScalesDuringPanGesture:self])
    {
      scaleInteractor = self->_scaleInteractor;
      [(SBPIPInteractionController *)self _lastSteadySize];
      objc_msgSend(v6, "interactionController:updateScaleInteractor:pipSize:forPanGesture:", self, scaleInteractor, v4);
      uint64_t v25 = 3;
    }
    else
    {
      uint64_t v25 = 1;
    }
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:v25 withReason:128 behavior:1];
  }
  else
  {
    if ([v6 interactionControllerScalesDuringPanGesture:self])
    {
      double v8 = self->_scaleInteractor;
      [(SBPIPInteractionController *)self _lastSteadySize];
      objc_msgSend(v6, "interactionController:updateScaleInteractor:pipSize:forPanGesture:", self, v8, v4);
    }
    double v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPInteractionController handlePanGesture:]((uint64_t)self, (uint64_t)v4);
    }

    [(SBPIPInteractionController *)self _handleGestureEndedState:v4];
  }
LABEL_23:
}

- (void)handlePinchGesture:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      id v6 = SBLogPIP();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handlePinchGesture:]((uint64_t)self, (uint64_t)v4);
      }

      self->_pinchGestureScaleFactor = 1.0;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
      [WeakRetained bounds];
      self->_pinchGestureBaselineScale = v8 / self->_preferredContentSize.width;

      [(_UIHyperInteractor *)self->_scaleInteractor sbpip_setInteractive:1];
      [(SBPIPInteractionController *)self _adjustContentViewAnchorPointForGestureRecognizer:v4];
      [(SBPIPInteractionController *)self _handleGestureBeganState:self->_pinchGestureRecognizer];
      goto LABEL_10;
    case 2:
LABEL_10:
      [v4 scale];
      double v10 = v9;
      [v4 velocity];
      uint64_t v12 = v11;
      uint64_t v19 = v11;
      double v13 = v10 * 0.75 + self->_pinchGestureScaleFactor * 0.25;
      self->_pinchGestureScaleFactor = v13;
      double v14 = -(self->_pinchGestureBaselineScale - self->_pinchGestureBaselineScale * v13);
      double v18 = v14;
      double v15 = SBLogPIP();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        uint64_t v17 = objc_msgSend(v4, "name", *(void *)&v18, v19);
        *(_DWORD *)buf = 138544386;
        double v21 = shortDescription;
        __int16 v22 = 2114;
        __int16 v23 = v17;
        __int16 v24 = 2048;
        double v25 = v10;
        __int16 v26 = 2048;
        uint64_t v27 = v12;
        __int16 v28 = 2048;
        double v29 = v14;
        _os_log_debug_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Pinch Changed: \t scale %.2f velocity %.2f scaleTranslation %.2f", buf, 0x34u);
      }
      [(_UIHyperInteractor *)self->_scaleInteractor _copyTranslation:&v18];
      [(_UIHyperInteractor *)self->_scaleInteractor _copyVelocity:&v19];
      [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:2 withReason:256 behavior:1];
      break;
    case 3:
      goto LABEL_4;
    case 4:
    case 5:
      if (self->_systemGestureManagerForResizing) {
        [(UIPanGestureRecognizer *)self->_panWhileResizingGestureRecognizer setState:4];
      }
LABEL_4:
      uint64_t v5 = SBLogPIP();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handlePinchGesture:]((uint64_t)self, v4);
      }

      [(SBPIPInteractionController *)self _handleGestureEndedState:v4];
      break;
    default:
      break;
  }
}

- (void)handleRotationGesture:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 != 2)
    {
      if (v5 != 1) {
        goto LABEL_17;
      }
      uint64_t v7 = SBLogPIP();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPInteractionController handleRotationGesture:]((uint64_t)self, (uint64_t)v4);
      }

      [(_UIHyperInteractor *)self->_rotationInteractor sbpip_setInteractive:1];
      [(SBPIPInteractionController *)self _adjustContentViewAnchorPointForGestureRecognizer:v4];
      [(SBPIPInteractionController *)self _handleGestureBeganState:v4];
    }
    [v4 rotation];
    double v9 = v8;
    double v18 = v8;
    [v4 velocity];
    uint64_t v11 = v10;
    double v12 = *(double *)[(_UIHyperInteractor *)self->_rotationInteractor _translation];
    double v13 = v9 - v12;
    if (v9 - v12 < 0.0) {
      double v13 = -v13;
    }
    if (v13 > 3.14159265)
    {
      [v4 setRotation:v12];
      double v18 = v12;
      double v9 = v12;
    }
    double v14 = SBLogPIP();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      uint64_t v16 = [v4 name];
      *(_DWORD *)buf = 138544130;
      double v20 = shortDescription;
      __int16 v21 = 2114;
      __int16 v22 = v16;
      __int16 v23 = 2048;
      double v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = v11;
      _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Rotation Changed: \t rotation %.2f velocity %.2f", buf, 0x2Au);
    }
    [(_UIHyperInteractor *)self->_rotationInteractor _copyTranslation:&v18];
    [(_UIHyperInteractor *)self->_rotationInteractor _copyVelocity:&v17];
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:4 withReason:512 behavior:1];
  }
  else
  {
    id v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPInteractionController handleRotationGesture:]((uint64_t)self, (uint64_t)v4);
    }

    [(SBPIPInteractionController *)self _handleGestureEndedState:v4];
  }
LABEL_17:
}

- (void)_handleGestureBeganState:(id)a3
{
  id v5 = a3;
  if (![(SBWindowScene *)self->_targetWindowScene isMainDisplayWindowScene]) {
    [(SBPIPInteractionController *)self _updateGeometryContextBoundsUsingMainDisplayWindowScene];
  }
  [(SBPIPInteractionController *)self _updatePositionRegionComposers];
  [(SBPIPInteractionController *)self _updateInteractorsAndCommit:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained interactionControllerDidBeginInteraction:self forGestureRecognizer:v5];
  }
}

- (void)_handleGestureEndedState:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = (UIPanGestureRecognizer *)a3;
  self->_gesturesWereCancelled |= [(UIPanGestureRecognizer *)v5 state] == 4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    if (self->_edgeResizeGestureRecognizer != v5)
    {
      unint64_t v7 = gesturesEndedLayoutReason | 0x80;
LABEL_9:
      self->_unint64_t gesturesEndedLayoutReason = v7;
      goto LABEL_10;
    }
LABEL_6:
    unint64_t v7 = gesturesEndedLayoutReason | 0x100;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v7 = self->_gesturesEndedLayoutReason | 0x200;
    goto LABEL_9;
  }
  uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 1495, @"Unrecognized gesture recognizer: %@", v5 object file lineNumber description];

LABEL_10:
  if (!self->_didHandleGestureEndState)
  {
    self->_didHandleGestureEndState = 1;
    self->_gesturesEndedLayoutReason |= 0x400uLL;
    double v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      uint64_t v13 = [(UIPanGestureRecognizer *)v5 name];
      double v14 = (void *)v13;
      BOOL gesturesWereCancelled = self->_gesturesWereCancelled;
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = shortDescription;
      if (gesturesWereCancelled) {
        uint64_t v16 = @"cancelled";
      }
      else {
        uint64_t v16 = @"recognized";
      }
      __int16 v20 = 2114;
      uint64_t v21 = v13;
      __int16 v22 = 2114;
      __int16 v23 = v16;
      _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture][%{public}@] Will Handle Ended State: %{public}@", buf, 0x20u);
    }
    double v9 = [NSNumber numberWithInt:!self->_gesturesWereCancelled];
    uint64_t v17 = *MEMORY[0x1E4F1C4B0];
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
    [(SBPIPInteractionController *)self performSelector:sel___handleGesturesEndedState_ withObject:v9 afterDelay:v10 inModes:0.0];
  }
}

- (void)__handleGesturesEndedState:(id)a3
{
  id v4 = a3;
  if (self->_didHandleGestureEndState)
  {
    id v5 = SBLogPIP();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPInteractionController __handleGesturesEndedState:]();
    }

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___handleGesturesEndedState_ object:v4];
    [(SBPIPInteractionController *)self _resetAnchorPoint];
    [(SBPIPInteractionController *)self _updateInteractorsAndCommit:1];
    *(_WORD *)&self->_didHandleGestureEndState = 0;
    objc_initWeak(&location, self);
    objc_copyWeak(&to, (id *)&self->_delegate);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    unint64_t gesturesEndedLayoutReason = self->_gesturesEndedLayoutReason;
    if ((gesturesEndedLayoutReason & 0x80) != 0)
    {
      id v8 = objc_loadWeakRetained(&to);
      if (objc_opt_respondsToSelector()) {
        [v8 interactionControllerPanGestureDidEnd:self];
      }
    }
    self->_unint64_t gesturesEndedLayoutReason = 0;
    double v9 = [WeakRetained _sbWindowScene];
    [(SBPIPInteractionController *)self _inFlightHitTestPadding];
    objc_msgSend(WeakRetained, "_setTouchInsets:");
    unint64_t v10 = [(SBPIPInteractionController *)self __traitsForGesturesReasons:gesturesEndedLayoutReason];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke;
    v17[3] = &unk_1E6AFA1B8;
    id v11 = WeakRetained;
    id v18 = v11;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke_2;
    v13[3] = &unk_1E6B01A80;
    objc_copyWeak(&v15, &to);
    objc_copyWeak(&v16, &location);
    id v12 = v9;
    id v14 = v12;
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:v10 withReason:gesturesEndedLayoutReason behavior:2 layoutCompletion:v17 interactionCompletion:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&to);
    objc_destroyWeak(&location);
  }
}

uint64_t __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setTouchInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
}

void __57__SBPIPInteractionController___handleGesturesEndedState___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v2 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = v2;
  if (v2)
  {
    [WeakRetained interactionControllerDidEndAllInteractions:v2 targetWindowScene:v2[91]];
    if (v3[91] != *(void *)(a1 + 32)) {
      [v3 reloadHyperregionComposerData];
    }
  }
}

- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5
{
}

- (void)_setNeedsLayoutForTraits:(unint64_t)a3 withReason:(unint64_t)a4 behavior:(int)a5 layoutCompletion:(id)a6 interactionCompletion:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  id v13 = a7;
  objc_copyWeak(&to, (id *)&self->_delegate);
  self->_allLayoutSessionUpdateReasons |= a4;
  if ([(SBPIPInteractionController *)self _isSizeAffectedByLayoutReasons:a4]) {
    [(SBPIPInteractionController *)self _sizeChangeBeganWithBehavior:v8];
  }
  ++self->_inFlightAnimatedLayouts;
  id v14 = SBLogPIP();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    shortDescription = self->_shortDescription;
    __int16 v22 = SBStringFromPIPLayoutReason(a4);
    unint64_t inFlightAnimatedLayouts = self->_inFlightAnimatedLayouts;
    *(_DWORD *)buf = 138543874;
    double v31 = shortDescription;
    __int16 v32 = 2114;
    __int16 v33 = v22;
    __int16 v34 = 2048;
    unint64_t v35 = inFlightAnimatedLayouts;
    _os_log_debug_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] increment!: %{public}@ %ld", buf, 0x20u);
  }
  objc_initWeak(&location, self);
  id v15 = SBLogPIP();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = self->_shortDescription;
    uint64_t v17 = SBStringFromPIPLayoutReason(a4);
    -[SBPIPInteractionController _setNeedsLayoutForTraits:withReason:behavior:layoutCompletion:interactionCompletion:]((uint64_t)v16, v17, buf, v15);
  }

  id v18 = objc_loadWeakRetained(&to);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke;
  v24[3] = &unk_1E6B01AA8;
  objc_copyWeak(v27, &location);
  v24[4] = self;
  v27[1] = (id)a4;
  id v19 = v12;
  id v25 = v19;
  id v20 = v13;
  id v26 = v20;
  [v18 setNeedsLayoutForInteractionController:self traits:a3 withReason:a4 behavior:v8 completion:v24];

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&to);
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v7 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = WeakRetained + 84;
    --WeakRetained[84];
    double v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_3(a1, (uint64_t *)(v7 + 672), v9);
    }

    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, a2, a3);
    }
    if (*(void *)(a1 + 48))
    {
      if (*(void *)(*(void *)(a1 + 32) + 680))
      {
        id v11 = (void *)MEMORY[0x1D948C7A0](*(void *)(*(void *)(a1 + 32) + 680));
        uint64_t v29 = MEMORY[0x1E4F143A8];
        uint64_t v30 = 3221225472;
        double v31 = __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_321;
        __int16 v32 = &unk_1E6AFEA98;
        id v33 = v11;
        id v34 = *(id *)(a1 + 48);
        id v12 = v11;
        uint64_t v13 = MEMORY[0x1D948C7A0](&v29);
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = *(void **)(v14 + 680);
        *(void *)(v14 + 680) = v13;
      }
      else
      {
        uint64_t v18 = MEMORY[0x1D948C7A0]();
        uint64_t v19 = *(void *)(a1 + 32);
        id v12 = *(id *)(v19 + 680);
        *(void *)(v19 + 680) = v18;
      }
    }
    if ((objc_msgSend((id)v7, "_isGesturing", v29, v30, v31, v32) & 1) == 0)
    {
      id v20 = SBLogPIP();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = *(void *)(v7 + 24);
        __int16 v28 = SBStringFromPIPLayoutReason(*(void *)(a1 + 64));
        *(_DWORD *)buf = 138544130;
        uint64_t v36 = v27;
        __int16 v37 = 2114;
        double v38 = v28;
        __int16 v39 = 1024;
        int v40 = a2;
        __int16 v41 = 1024;
        int v42 = a3;
        _os_log_debug_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Did complete animation for: %{public}@ finished: %{BOOL}u, retargeted %{BOOL}u", buf, 0x22u);
      }
      if (!*v8)
      {
        if (*(void *)(*(void *)(a1 + 32) + 680))
        {
          uint64_t v21 = (void (**)(void, void, void))MEMORY[0x1D948C7A0]();
          uint64_t v22 = *(void *)(a1 + 32);
          __int16 v23 = *(void **)(v22 + 680);
          *(void *)(v22 + 680) = 0;

          v21[2](v21, a2, a3);
        }
        if ([(id)v7 _isSizeAffectedByLayoutReasons:*(void *)(v7 + 152)]) {
          [(id)v7 _sizeChangeEnded];
        }
        uint64_t v24 = SBLogPIP();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_2(v7, (uint64_t *)(v7 + 152));
        }

        *(void *)(v7 + 152) = 0;
        id v25 = objc_loadWeakRetained((id *)(v7 + 8));
        [v25 interactionController:v7 didSettleOnStashState:*(unsigned __int8 *)(v7 + 40)];

        if ([(id)v7 _isPreferredContentSizeDirty])
        {
          id v26 = SBLogPIP();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_1();
          }

          [(id)v7 _updatePreferredContentSize];
        }
        if (!*(unsigned char *)(v7 + 41)) {
          [(id)v7 _setupForInitialFrame];
        }
      }
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 40);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v16, a2, a3);
    }
    uint64_t v17 = *(void *)(a1 + 48);
    if (v17) {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, a2, a3);
    }
  }
}

uint64_t __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_321(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (unint64_t)__traitsForGesturesReasons:(unint64_t)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  id v11 = __57__SBPIPInteractionController___traitsForGesturesReasons___block_invoke;
  id v12 = &unk_1E6AF77E8;
  uint64_t v13 = self;
  uint64_t v14 = &v15;
  id v4 = v10;
  if (a3)
  {
    char v19 = 0;
    uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v5.i16[0] = vaddlv_u8(v5);
    int v6 = v5.i32[0];
    if (v5.i32[0])
    {
      unint64_t v7 = 0;
      do
      {
        if (((1 << v7) & a3) != 0)
        {
          ((void (*)(void *))v11)(v4);
          if (v19) {
            break;
          }
          --v6;
        }
        if (v7 > 0x3E) {
          break;
        }
        ++v7;
      }
      while (v6 > 0);
    }
  }

  unint64_t v8 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v8;
}

void __57__SBPIPInteractionController___traitsForGesturesReasons___block_invoke(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 512:
      uint64_t v2 = a1 + 40;
      uint64_t v5 = 4;
LABEL_9:
      *(void *)(*(void *)(*(void *)v2 + 8) + 24) |= v5;
      return;
    case 256:
      uint64_t v2 = a1 + 40;
LABEL_8:
      uint64_t v5 = 2;
      goto LABEL_9;
    case 128:
      uint64_t v2 = a1 + 40;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 1uLL;
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 760));
      char v4 = [WeakRetained interactionControllerScalesDuringPanGesture:*(void *)(v2 - 8)];

      if (v4) {
        goto LABEL_8;
      }
      break;
  }
}

- (BOOL)_isSystemGestureRecognizer:(id)a3
{
  char v4 = [a3 view];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  int v6 = [WeakRetained window];
  BOOL v7 = v4 != v6;

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  int v6 = (UIPanGestureRecognizer *)a3;
  BOOL v7 = (UIPanGestureRecognizer *)a4;
  if (self->_panGestureRecognizer == v6 && self->_panWhileResizingGestureRecognizer == v7)
  {
    BOOL v10 = 0;
  }
  else
  {
    edgeResizeGestureRecognizer = self->_edgeResizeGestureRecognizer;
    BOOL v10 = edgeResizeGestureRecognizer != v6 && edgeResizeGestureRecognizer != v7;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  int v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  if ([(SBPIPInteractionController *)self _isSystemGestureRecognizer:v6])
  {
    if ([v7 type] == 1)
    {
      double v9 = [(SBSystemGestureManager *)self->_systemGestureManagerForResizing indirectTouchLifecycleMonitor];
      [v9 systemGestureHoverLocationInView:WeakRetained];
      double v11 = v10;
      double v13 = v12;

      int v14 = objc_msgSend(WeakRetained, "pointInside:forEvent:", 0, v11, v13);
      uint64_t v15 = SBLogPIP();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        shortDescription = self->_shortDescription;
        uint64_t v17 = [(UIPanGestureRecognizer *)v6 name];
        int v32 = 138544386;
        id v33 = shortDescription;
        __int16 v34 = 2114;
        unint64_t v35 = v17;
        __int16 v36 = 2048;
        double v37 = v11;
        __int16 v38 = 2048;
        double v39 = v13;
        __int16 v40 = 1024;
        LODWORD(v41) = v14;
        uint64_t v18 = "[%{public}@][Gesture][%{public}@] hoverLocation{%.2f,%.2f} hoverInside{%{BOOL}u}";
        char v19 = v15;
        uint32_t v20 = 48;
LABEL_17:
        _os_log_debug_impl(&dword_1D85BA000, v19, OS_LOG_TYPE_DEBUG, v18, (uint8_t *)&v32, v20);
      }
    }
    else
    {
      [v7 locationInView:0];
      double v23 = v22;
      double v25 = v24;
      -[SBPIPInteractionController _convertPointToInteractionTargetView:fromSystemGestureRecognizer:](self, "_convertPointToInteractionTargetView:fromSystemGestureRecognizer:", v6);
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      int v14 = objc_msgSend(WeakRetained, "pointInside:withEvent:", 0);
      uint64_t v15 = SBLogPIP();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        double v31 = self->_shortDescription;
        uint64_t v17 = [(UIPanGestureRecognizer *)v6 name];
        int v32 = 138544898;
        id v33 = v31;
        __int16 v34 = 2114;
        unint64_t v35 = v17;
        __int16 v36 = 2048;
        double v37 = v23;
        __int16 v38 = 2048;
        double v39 = v25;
        __int16 v40 = 2048;
        uint64_t v41 = v27;
        __int16 v42 = 2048;
        uint64_t v43 = v29;
        __int16 v44 = 1024;
        int v45 = v14;
        uint64_t v18 = "[%{public}@][Gesture][%{public}@] point{%.2f,%.2f} pointInView{%.2f,%.2f} pointInside{%{BOOL}u}";
        char v19 = v15;
        uint32_t v20 = 68;
        goto LABEL_17;
      }
    }

    goto LABEL_15;
  }
  [v7 locationInView:WeakRetained];
  char v21 = objc_msgSend(WeakRetained, "pointInside:withEvent:", 0);
  LOBYTE(v14) = v21;
  if (self->_panGestureRecognizer == v6)
  {
    if (self->_pointerIsHoveringOverEdge) {
      LOBYTE(v14) = 0;
    }
    else {
      LOBYTE(v14) = v21;
    }
  }
  else if (self->_edgeResizeGestureRecognizer == v6)
  {
    if (self->_pointerIsHoveringOverEdge) {
      LOBYTE(v14) = v21;
    }
    else {
      LOBYTE(v14) = 0;
    }
  }
LABEL_15:

  return v14;
}

- (BOOL)_isInteractive
{
  if ([(_UIHyperInteractor *)self->_positionInteractor sbpip_isInteractive]
    || [(_UIHyperInteractor *)self->_scaleInteractor sbpip_isInteractive])
  {
    return 1;
  }
  rotationInteractor = self->_rotationInteractor;
  return [(_UIHyperInteractor *)rotationInteractor sbpip_isInteractive];
}

- (BOOL)_hasInFlightLayoutAnimations
{
  return self->_inFlightAnimatedLayouts != 0;
}

- (BOOL)_isSizeAffectedByLayoutReasons:(unint64_t)a3
{
  return (a3 & 0x119) != 0;
}

- (BOOL)_isGesturing
{
  if ([(SBPIPInteractionController *)self _isPanning]
    || [(SBPIPInteractionController *)self _isPinching])
  {
    return 1;
  }
  return [(SBPIPInteractionController *)self _isRotating];
}

- (BOOL)_isPanning
{
  if ([(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_panGestureRecognizer]|| [(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_panWhileResizingGestureRecognizer]|| [(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_externalPanDrivingGestureRecognizer]|| [(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_edgeResizeGestureRecognizer])
  {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained interactionControllerIsExternalPanGestureRecognizing:self];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_isPinching
{
  if ([(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_pinchGestureRecognizer])
  {
    return 1;
  }
  externalPanDrivingGestureRecognizer = self->_externalPanDrivingGestureRecognizer;
  return [(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:externalPanDrivingGestureRecognizer];
}

- (BOOL)_isRotating
{
  return [(SBPIPInteractionController *)self _isGestureRecognizerRecognizing:self->_rotationGestureRecognizer];
}

- (BOOL)_isGestureRecognizerRecognizing:(id)a3
{
  id v3 = a3;
  char v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 view];
    BOOL v6 = v5 && [v4 state] >= 1 && objc_msgSend(v4, "state") < 3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (UIEdgeInsets)_inFlightHitTestPadding
{
  [(SBPIPInteractionSettings *)self->_interactionSettings inFlightHitTestPadding];
  double v3 = -v2;
  double v4 = v3;
  double v5 = v3;
  double v6 = v3;
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)_cancelAllGestures
{
  [(SBPIPInteractionController *)self _removeGestureRecognizers];
  if (self->_enabled)
  {
    [(SBPIPInteractionController *)self _setupGestureRecognizers];
  }
}

- (CGPoint)edgeResizeAnchorPoint
{
  double v3 = [(SBPIPInteractionSettings *)self->_interactionSettings edgeResizeSettings];
  double v4 = [v3 anchorPointSettings];
  unint64_t pointerIsHoveringOverEdge = self->_pointerIsHoveringOverEdge;
  unint64_t v6 = [(SBPIPInteractionController *)self canonicalPosition];
  switch(pointerIsHoveringOverEdge)
  {
    case 1uLL:
      switch(v6)
      {
        case 0uLL:
          [v4 dockUpperLeftResizeTopEdgeAnchorPointX];
          double v8 = v7;
          [v4 dockUpperLeftResizeTopEdgeAnchorPointY];
          goto LABEL_27;
        case 1uLL:
          [v4 dockLowerLeftResizeTopEdgeAnchorPointX];
          double v8 = v14;
          [v4 dockLowerLeftResizeTopEdgeAnchorPointY];
          goto LABEL_27;
        case 2uLL:
          [v4 dockLowerRightResizeTopEdgeAnchorPointX];
          double v8 = v15;
          [v4 dockLowerRightResizeTopEdgeAnchorPointY];
          goto LABEL_27;
        case 3uLL:
          [v4 dockUpperRightResizeTopEdgeAnchorPointX];
          double v8 = v16;
          [v4 dockUpperRightResizeTopEdgeAnchorPointY];
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 2uLL:
      switch(v6)
      {
        case 0uLL:
          [v4 dockUpperLeftResizeBottomEdgeAnchorPointX];
          double v8 = v11;
          [v4 dockUpperLeftResizeBottomEdgeAnchorPointY];
          goto LABEL_27;
        case 1uLL:
          [v4 dockLowerLeftResizeBottomEdgeAnchorPointX];
          double v8 = v17;
          [v4 dockLowerLeftResizeBottomEdgeAnchorPointY];
          goto LABEL_27;
        case 2uLL:
          [v4 dockLowerRightResizeBottomEdgeAnchorPointX];
          double v8 = v18;
          [v4 dockLowerRightResizeBottomEdgeAnchorPointY];
          goto LABEL_27;
        case 3uLL:
          [v4 dockUpperRightResizeBottomEdgeAnchorPointX];
          double v8 = v19;
          [v4 dockUpperRightResizeBottomEdgeAnchorPointY];
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 3uLL:
      switch(v6)
      {
        case 0uLL:
          [v4 dockUpperLeftResizeLeftEdgeAnchorPointX];
          double v8 = v12;
          [v4 dockUpperLeftResizeLeftEdgeAnchorPointY];
          goto LABEL_27;
        case 1uLL:
          [v4 dockLowerLeftResizeLeftEdgeAnchorPointX];
          double v8 = v20;
          [v4 dockLowerLeftResizeLeftEdgeAnchorPointY];
          goto LABEL_27;
        case 2uLL:
          [v4 dockLowerRightResizeLeftEdgeAnchorPointX];
          double v8 = v21;
          [v4 dockLowerRightResizeLeftEdgeAnchorPointY];
          goto LABEL_27;
        case 3uLL:
          [v4 dockUpperRightResizeLeftEdgeAnchorPointX];
          double v8 = v22;
          [v4 dockUpperRightResizeLeftEdgeAnchorPointY];
          goto LABEL_27;
        default:
          goto LABEL_11;
      }
    case 4uLL:
      switch(v6)
      {
        case 0uLL:
          [v4 dockUpperLeftResizeRightEdgeAnchorPointX];
          double v8 = v13;
          [v4 dockUpperLeftResizeRightEdgeAnchorPointY];
          break;
        case 1uLL:
          [v4 dockLowerLeftResizeRightEdgeAnchorPointX];
          double v8 = v23;
          [v4 dockLowerLeftResizeRightEdgeAnchorPointY];
          break;
        case 2uLL:
          [v4 dockLowerRightResizeRightEdgeAnchorPointX];
          double v8 = v24;
          [v4 dockLowerRightResizeRightEdgeAnchorPointY];
          break;
        case 3uLL:
          [v4 dockUpperRightResizeRightEdgeAnchorPointX];
          double v8 = v25;
          [v4 dockUpperRightResizeRightEdgeAnchorPointY];
          break;
        default:
          goto LABEL_11;
      }
LABEL_27:
      double v10 = v9;
      break;
    case 5uLL:
      double v8 = 1.0;
      double v10 = 1.0;
      break;
    case 6uLL:
      double v10 = 1.0;
      double v8 = 0.0;
      break;
    case 7uLL:
      double v10 = 0.0;
      double v8 = 1.0;
      break;
    case 8uLL:
      double v8 = 0.0;
      double v10 = 0.0;
      break;
    default:
LABEL_11:
      double v8 = 0.5;
      double v10 = 0.5;
      break;
  }

  double v26 = v8;
  double v27 = v10;
  result.CGFloat y = v27;
  result.CGFloat x = v26;
  return result;
}

- (void)recalculateScale:(double *)a3 baselineScale:(double *)a4 forTranslationInView:(CGPoint)a5
{
  double v5 = 0.0;
  double edgeResizeGestureBaselineWidth = self->_edgeResizeGestureBaselineWidth;
  double v7 = edgeResizeGestureBaselineWidth - a5.x;
  switch(self->_pointerIsHoveringOverEdge)
  {
    case 1uLL:
      double edgeResizeGestureBaselineHeight = self->_edgeResizeGestureBaselineHeight;
      double v9 = edgeResizeGestureBaselineHeight - a5.y;
      goto LABEL_4;
    case 2uLL:
      double edgeResizeGestureBaselineHeight = self->_edgeResizeGestureBaselineHeight;
      double v9 = a5.y + edgeResizeGestureBaselineHeight;
LABEL_4:
      double v5 = v9 / edgeResizeGestureBaselineHeight;
      double edgeResizeGestureBaselineWidth = 0.0;
      break;
    case 3uLL:
      goto LABEL_9;
    case 4uLL:
      goto LABEL_12;
    case 5uLL:
      double v10 = self->_edgeResizeGestureBaselineHeight;
      double v11 = v10 - a5.y;
      goto LABEL_8;
    case 6uLL:
      double v12 = self->_edgeResizeGestureBaselineHeight;
      double v13 = v12 - a5.y;
      goto LABEL_11;
    case 7uLL:
      double v10 = self->_edgeResizeGestureBaselineHeight;
      double v11 = a5.y + v10;
LABEL_8:
      double v5 = v11 / v10;
LABEL_9:
      double edgeResizeGestureBaselineWidth = v7 / edgeResizeGestureBaselineWidth;
      break;
    case 8uLL:
      double v12 = self->_edgeResizeGestureBaselineHeight;
      double v13 = a5.y + v12;
LABEL_11:
      double v5 = v13 / v12;
LABEL_12:
      double edgeResizeGestureBaselineWidth = (a5.x + edgeResizeGestureBaselineWidth) / edgeResizeGestureBaselineWidth;
      break;
    default:
      break;
  }
  if (v5 <= edgeResizeGestureBaselineWidth) {
    double v14 = edgeResizeGestureBaselineWidth;
  }
  else {
    double v14 = v5;
  }
  uint64_t v15 = 488;
  if (v5 > edgeResizeGestureBaselineWidth) {
    uint64_t v15 = 496;
  }
  uint64_t v16 = *(uint64_t *)((char *)&self->super.isa + v15);
  *a3 = fmax(v14, 0.0);
  *(void *)a4 = v16;
}

- (void)reloadInsets
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v4 = [WeakRetained interactionControllerConnectedWindowScenes:self];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        [WeakRetained interactionController:self stashedPaddingForWindowScene:v9];
        if (-[SBPIPInteractionController _setStashedPadding:forScene:](self, "_setStashedPadding:forScene:", v9)) {
          v6 |= 0x40uLL;
        }
        [WeakRetained interactionController:self edgeInsetsForWindowScene:v9];
        if (-[SBPIPInteractionController _setEdgeInsets:forScene:](self, "_setEdgeInsets:forScene:", v9)) {
          v6 |= 4uLL;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);

    if (v6)
    {
      [(SBPIPInteractionController *)self _updateInteractorsAndCommit:0];
      if (self->_enabled)
      {
        if (![(SBPIPInteractionController *)self _isInteractive])
        {
          [(SBPIPInteractionController *)self _updateInteractorsAndCommit:1];
          objc_initWeak(&location, self);
          objc_copyWeak(&to, (id *)&self->_delegate);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          void v10[2] = __42__SBPIPInteractionController_reloadInsets__block_invoke;
          v10[3] = &unk_1E6B01AD0;
          objc_copyWeak(&v11, &to);
          v12[1] = (id)v6;
          objc_copyWeak(v12, &location);
          [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:7 withReason:v6 behavior:2 layoutCompletion:0 interactionCompletion:v10];
          objc_destroyWeak(v12);
          objc_destroyWeak(&v11);
          objc_destroyWeak(&to);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        [(SBPIPInteractionController *)self _setupForInitialFrame];
      }
    }
  }
  else
  {
  }
}

void __42__SBPIPInteractionController_reloadInsets__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0 && (*(unsigned char *)(a1 + 48) & 4) != 0)
  {
    id v2 = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained interactionControllerDidUpdateEdgeInsets:v2];
  }
}

- (void)_enumeratePositionRegionComposersUsingBlock:(id)a3
{
}

- (void)_enumerateComposers:(id)a3 usingBlock:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void))a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
          objc_enumerationMutation(v5);
        }
        v6[2](v6, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)_updatePositionRegionComposers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v4 = [WeakRetained defaultPositionHyperregionComposers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke;
  v11[3] = &unk_1E6B01AF8;
  id v12 = v4;
  long long v13 = self;
  id v5 = v4;
  [(SBPIPInteractionController *)self _enumeratePositionRegionComposersUsingBlock:v11];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_2;
  v10[3] = &unk_1E6B01B20;
  void v10[4] = self;
  [(SBPIPInteractionController *)self _enumerateComposers:v5 usingBlock:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_3;
  v7[3] = &unk_1E6B01AF8;
  id v8 = WeakRetained;
  uint64_t v9 = self;
  id v6 = WeakRetained;
  [(SBPIPInteractionController *)self _enumeratePositionRegionComposersUsingBlock:v7];
  [(SBPIPInteractionController *)self reloadInsets];
}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 40) positionRegionComposerDidInvalidate:v3];
  }
}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "containsObject:") & 1) == 0) {
    [*(id *)(a1 + 32) addPositionRegionComposer:v3];
  }
}

void __60__SBPIPInteractionController__updatePositionRegionComposers__block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) interactionControllerConnectedWindowScenes:*(void *)(a1 + 40)];
    [v4 setConnectedWindowScenes:v3];
  }
}

- (void)prepareForTransitionToWindowScene:(id)a3
{
  id v4 = (SBWindowScene *)a3;
  if (self->_targetWindowScene != v4)
  {
    pendingTransition = self->_pendingTransition;
    id v8 = v4;
    if (!pendingTransition)
    {
      id v6 = objc_alloc_init(_SBPIPInteractionControllerTransitionInfo);
      uint64_t v7 = self->_pendingTransition;
      self->_pendingTransition = v6;

      [(_SBPIPInteractionControllerTransitionInfo *)self->_pendingTransition setLayoutCorner:[(SBPIPContentViewLayoutSettings *)self->_layoutSettings currentContentViewPosition]];
      pendingTransition = self->_pendingTransition;
    }
    [(_SBPIPInteractionControllerTransitionInfo *)pendingTransition setTargetWindowScene:v8];
    id v4 = v8;
  }
}

- (void)finishTransitionToWindowScene:(id)a3
{
  [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:1 withReason:1 behavior:2];
  pendingTransition = self->_pendingTransition;
  self->_pendingTransition = 0;
}

- (void)reloadHyperregionComposerData
{
  [(SBPIPInteractionController *)self _updatePositionRegionComposers];
  [(SBPIPInteractionController *)self _updateInteractorsAndCommit:1];
}

- (void)_updateTargetWindowSceneIfNeeded
{
}

- (void)_updateTargetWindowSceneIfNeededUpdatingInteractors:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  id v6 = [WeakRetained _sbWindowScene];

  id v7 = objc_loadWeakRetained((id *)&self->_dataSource);
  id v8 = [v7 interactionControllerConnectedWindowScenes:self];

  p_targetWindowScene = &self->_targetWindowScene;
  uint64_t v10 = self->_targetWindowScene;
  pendingTransition = self->_pendingTransition;
  if (pendingTransition)
  {
    id v12 = [(_SBPIPInteractionControllerTransitionInfo *)pendingTransition targetWindowScene];
LABEL_8:
    long long v13 = v12;

    uint64_t v10 = v13;
    goto LABEL_9;
  }
  [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
  if (!v52 && v6)
  {
    id v12 = v6;
    goto LABEL_8;
  }
  if ([v8 count] == 1)
  {
    objc_msgSend(v8, "bs_firstObjectPassingTest:", &__block_literal_global_157);
    id v12 = (SBWindowScene *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ((unint64_t)[v8 count] >= 2)
  {
    BOOL v41 = v3;
    __int16 v42 = v6;
    uint64_t v51 = 0;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    __int16 v40 = v8;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      long long v17 = 0;
      long long v18 = 0;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(v14);
          }
          double v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          int v22 = objc_msgSend(v21, "isMainDisplayWindowScene", v40);
          id v23 = v21;
          if (v22) {
            double v24 = v18;
          }
          else {
            double v24 = v17;
          }
          if (v22) {
            long long v18 = v23;
          }
          else {
            long long v17 = v23;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v16);
    }
    else
    {
      long long v17 = 0;
      long long v18 = 0;
    }

    double v25 = [v18 _sbDisplayConfiguration];
    id v6 = v42;
    BOOL v3 = v41;
    p_targetWindowScene = &self->_targetWindowScene;
    switch(SBSDisplayEdgeAdjacentToNeighboringDisplay())
    {
      case 0u:
        double v26 = *((double *)&v49 + 1);
        CGFloat MinX = CGRectGetMinX(self->_geometryContext.containerBounds);
        uint64_t v28 = v17;
        if (v26 < MinX) {
          goto LABEL_42;
        }
        double v29 = *((double *)&v49 + 1);
        double v30 = CGRectGetMinX(self->_geometryContext.containerBounds);
        goto LABEL_35;
      case 1u:
        double v31 = *(double *)&v50;
        CGFloat MinY = CGRectGetMinY(self->_geometryContext.containerBounds);
        uint64_t v28 = v17;
        if (v31 >= MinY)
        {
          double v29 = *(double *)&v50;
          double v30 = CGRectGetMinY(self->_geometryContext.containerBounds);
LABEL_35:
          uint64_t v28 = v18;
          if (v29 <= v30) {
            goto LABEL_43;
          }
        }
        goto LABEL_42;
      case 2u:
        double v33 = *((double *)&v49 + 1);
        CGFloat MaxX = CGRectGetMaxX(self->_geometryContext.containerBounds);
        uint64_t v28 = v17;
        if (v33 > MaxX) {
          goto LABEL_42;
        }
        double v35 = *((double *)&v49 + 1);
        double v36 = CGRectGetMaxX(self->_geometryContext.containerBounds);
        break;
      case 3u:
        double v37 = *(double *)&v50;
        CGFloat MaxY = CGRectGetMaxY(self->_geometryContext.containerBounds);
        uint64_t v28 = v17;
        if (v37 > MaxY) {
          goto LABEL_42;
        }
        double v35 = *(double *)&v50;
        double v36 = CGRectGetMaxY(self->_geometryContext.containerBounds);
        break;
      default:
        id v6 = v42;
        BOOL v3 = v41;
        id v8 = v40;
        p_targetWindowScene = &self->_targetWindowScene;
        goto LABEL_44;
    }
    uint64_t v28 = v18;
    if (v35 < v36)
    {
LABEL_42:
      double v39 = v28;

      uint64_t v10 = v39;
    }
LABEL_43:
    id v8 = v40;
LABEL_44:
  }
LABEL_9:
  if (v10 != *p_targetWindowScene)
  {
    objc_storeStrong((id *)p_targetWindowScene, v10);
    if (v3) {
      [(SBPIPInteractionController *)self _updateInteractorsAndCommit:0];
    }
  }
}

uint64_t __82__SBPIPInteractionController__updateTargetWindowSceneIfNeededUpdatingInteractors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isMainDisplayWindowScene];
}

- (void)_updateInteractorsAndCommit:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = 0;
  long long v36 = *MEMORY[0x1E4F1DAD8];
  scaleInteractor = self->_scaleInteractor;
  id v6 = [(SBPIPInteractionController *)self _scaleHyperregion];
  [(_UIHyperInteractor *)scaleInteractor _setRegion:v6];

  if (v3)
  {
    [(_UIHyperInteractor *)self->_scaleInteractor _commitTranslation];
    id v7 = [(_UIHyperInteractor *)self->_scaleInteractor _region];
    objc_msgSend(v7, "_closestPoint:toPoint:", &v34, -[_UIHyperInteractor _projectedPoint](self->_scaleInteractor, "_projectedPoint"));

    [(_UIHyperInteractor *)self->_scaleInteractor sbpip_setInteractive:0];
    [(_UIHyperInteractor *)self->_scaleInteractor _copyVelocity:&v37];
    [(_UIHyperInteractor *)self->_scaleInteractor _copyTranslation:&v37];
    [(_UIHyperInteractor *)self->_scaleInteractor _copyUnconstrainedPoint:&v34];
    layoutSettings = self->_layoutSettings;
    [(SBPIPInteractionController *)self _currentSizeForLayoutReason:1024];
    -[SBPIPContentViewLayoutSettings setContentViewSize:](layoutSettings, "setContentViewSize:");
  }
  rotationInteractor = self->_rotationInteractor;
  uint64_t v10 = [(SBPIPInteractionController *)self _rotationHyperregion];
  [(_UIHyperInteractor *)rotationInteractor _setRegion:v10];

  if (v3)
  {
    long long v11 = [(_UIHyperInteractor *)self->_rotationInteractor _region];
    [(_UIHyperInteractor *)self->_rotationInteractor _commitTranslation];
    [(_UIHyperInteractor *)self->_rotationInteractor sbpip_setInteractive:0];
    [(_UIHyperInteractor *)self->_rotationInteractor _copyVelocity:&v37];
    -[_UIHyperInteractor _copyUnconstrainedPoint:](self->_rotationInteractor, "_copyUnconstrainedPoint:", [v11 _value]);
  }
  [(SBPIPInteractionController *)self _updateTargetWindowSceneIfNeededUpdatingInteractors:0];
  unint64_t v12 = [(SBPIPInteractionController *)self canonicalPosition];
  positionInteractor = self->_positionInteractor;
  id v14 = [(SBPIPInteractionController *)self positionHyperregion];
  [(_UIHyperInteractor *)positionInteractor _setRegion:v14];

  [(SBPIPInteractionController *)self _updateHyperregionVisualizationIfNecessary];
  if (v3)
  {
    uint64_t v15 = [(_UIHyperInteractor *)self->_positionInteractor _region];
    [(_UIHyperInteractor *)self->_positionInteractor _commitTranslation];
    double v34 = 0.0;
    double v35 = 0.0;
    BOOL v16 = [(_UIHyperInteractor *)self->_positionInteractor sbpip_isInteractive];
    if (!self->_pendingTransition) {
      goto LABEL_31;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    long long v18 = [WeakRetained _sbWindowScene];
    uint64_t v19 = [(_SBPIPInteractionControllerTransitionInfo *)self->_pendingTransition targetWindowScene];

    if (v18 != v19)
    {
LABEL_31:
      if (BSSettingFlagIsExplicitNo())
      {
        [(SBPIPInteractionController *)self _closestToDefaultCornersPosition];
        double v34 = v20;
        double v35 = v21;
        self->_didLastSettleInStashedState = 0;
LABEL_28:
        self->_shouldStash = 0x7FFFFFFFFFFFFFFFLL;
        -[_UIHyperInteractor _copyVelocity:](self->_positionInteractor, "_copyVelocity:", &v36, *(void *)&v34, *(void *)&v35);
        [(_UIHyperInteractor *)self->_positionInteractor _copyUnconstrainedPoint:&v34];
        [(_UIHyperInteractor *)self->_positionInteractor sbpip_setInteractive:0];
        self->_BOOL threeTouchesPanDetected = 0;

        return;
      }
      if (v16)
      {
        uint64_t v22 = [(_UIHyperInteractor *)self->_positionInteractor _projectedPoint];
LABEL_16:
        uint64_t v23 = [v15 _regionIndexForClosestPoint:&v34 toPoint:v22];
        if (v23 == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v24 = SBLogPIP();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[SBPIPInteractionController _updateInteractorsAndCommit:]();
          }
        }
        else
        {
          uint64_t v27 = v23;
          uint64_t v28 = [v15 _regions];
          double v24 = [v28 objectAtIndex:v27];

          self->_didLastSettleInStashedState = [(SBPIPInteractionController *)self _regionIsStashedOne:v24];
        }

        pinchGestureRecognizer = self->_pinchGestureRecognizer;
        BOOL v30 = !self->_didLastSettleInStashedState
           && [(SBPIPInteractionSettings *)self->_interactionSettings pinchGestureEnabled];
        [(SBPIPPinchGestureRecognizer *)pinchGestureRecognizer setEnabled:v30];
        unint64_t v31 = -[SBPIPInteractionController _canonicalPositionForPoint:](self, "_canonicalPositionForPoint:", v34, v35);
        unint64_t v32 = v31;
        if (self->_didLastSettleInStashedState && v12 != v31)
        {
          id v33 = objc_loadWeakRetained((id *)&self->_delegate);
          [v33 interactionController:self wantsStashTabHidden:0 left:(v32 & 0xFFFFFFFFFFFFFFFELL) == 2];
        }
        [(SBPIPContentViewLayoutSettings *)self->_layoutSettings setContentViewPosition:v32];
        goto LABEL_28;
      }
      if (self->_didLastSettleInStashedState
        || (BSSettingFlagIsYes() & 1) != 0
        || [(SBPIPInteractionSettings *)self->_interactionSettings freePositioning] == 2)
      {
        uint64_t v22 = [(_UIHyperInteractor *)self->_positionInteractor _constrainedPoint];
        goto LABEL_16;
      }
    }
    [(SBPIPInteractionController *)self _closestToDefaultCornersPosition];
    double v34 = v25;
    double v35 = v26;
    goto LABEL_28;
  }
}

- (id)_scaleHyperregion
{
  -[SBPIPContentViewLayoutSettings minimumPossibleContentViewSizeForAspectRatio:](self->_layoutSettings, "minimumPossibleContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  double v4 = v3;
  -[SBPIPContentViewLayoutSettings maximumPossibleContentViewSizeForAspectRatio:](self->_layoutSettings, "maximumPossibleContentViewSizeForAspectRatio:", self->_preferredContentSize.width, self->_preferredContentSize.height);
  double width = self->_preferredContentSize.width;
  double v6 = v4 / width;
  double v8 = v7 / width;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F431A0]) initWithDimensions:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__SBPIPInteractionController__scaleHyperregion__block_invoke;
  v14[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&v14[4] = v6;
  [v9 _mutateMinimumPoint:v14];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SBPIPInteractionController__scaleHyperregion__block_invoke_2;
  v13[3] = &__block_descriptor_40_e9_v16__0_d8l;
  *(double *)&void v13[4] = v8;
  [v9 _mutateMaximumPoint:v13];
  uint64_t v10 = [(_UIHyperInteractor *)self->_scaleInteractor _extender];
  [(SBPIPInteractionSettings *)self->_interactionSettings scaleExtenderMaximumDistance];
  objc_msgSend(v10, "_setMaximumDistance:", fmax((v8 - v6) * v11, 0.0));

  return v9;
}

double __47__SBPIPInteractionController__scaleHyperregion__block_invoke(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

double __47__SBPIPInteractionController__scaleHyperregion__block_invoke_2(uint64_t a1, double *a2)
{
  double result = *(double *)(a1 + 32);
  *a2 = result;
  return result;
}

- (id)_rotationHyperregion
{
  id v2 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:1];
  return v2;
}

- (id)positionHyperregion
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ([(SBPIPInteractionController *)self _hasValidInteractionTargetView])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    double v4 = [WeakRetained _sbWindowScene];
    char v5 = [v4 isMainDisplayWindowScene];

    if ((v5 & 1) == 0) {
      [(SBPIPInteractionController *)self _updateGeometryContextBoundsUsingMainDisplayWindowScene];
    }
    [(SBPIPInteractionController *)self _updatePIPSizeGeometryContext];
    uint64_t v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
    long long v6 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    long long v7 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    long long v8 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    v30[10] = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    v30[11] = v7;
    v30[12] = v8;
    CGSize size = self->_geometryContext.containerBounds.size;
    long long v10 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    long long v11 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    v30[6] = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    v30[7] = v10;
    v30[8] = v11;
    v30[9] = v6;
    CGPoint pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
    CGPoint origin = self->_geometryContext.containerBounds.origin;
    void v30[2] = self->_geometryContext.pipStashedSize;
    v30[3] = pipAnchorPointOffset;
    CGSize pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
    v30[4] = origin;
    v30[5] = size;
    v30[0] = self->_geometryContext.pipCurrentSize;
    v30[1] = pipLastSteadySize;
    v28[2] = v33;
    v28[3] = v34;
    uint64_t v29 = v35;
    v28[0] = v31;
    v28[1] = v32;
    [(SBPIPInteractionController *)self _updateResolvedPositionHyperRegionsMapWithGeometry:v30 interactionState:v28];
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:10];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v17 = [(NSDictionary *)self->_resolvedPositionRegionsMap allValues];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = [*(id *)(*((void *)&v24 + 1) + 8 * i) _regions];
          [v15 addObjectsFromArray:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v19);
    }

    [v16 _setRegions:v15];
  }
  else
  {
    BOOL v16 = [(_UIHyperInteractor *)self->_positionInteractor _region];
  }
  return v16;
}

- (void)_updatePIPSizeGeometryContext
{
  [(SBPIPInteractionController *)self _lastSteadySize];
  self->_geometryContext.pipLastSteadySize.double width = v3;
  self->_geometryContext.pipLastSteadySize.CGFloat height = v4;
  [(SBPIPInteractionController *)self _currentSizeForLayoutReason:1024];
  CGFloat v6 = v5;
  self->_geometryContext.pipCurrentSize.double width = v5;
  self->_geometryContext.pipCurrentSize.CGFloat height = v7;
  [(SBPIPContentViewLayoutSettings *)self->_layoutSettings minimumStashedTabSize];
  self->_geometryContext.pipStashedSize.double width = v6;
  self->_geometryContext.pipStashedSize.CGFloat height = v8;
}

- (void)_updateGeometryContextBoundsUsingMainDisplayWindowScene
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  CGFloat v4 = objc_msgSend(WeakRetained, "interactionControllerConnectedWindowScenes:", self, 0);

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isMainDisplayWindowScene])
        {
          uint64_t v10 = [v9 interfaceOrientation];
          [v9 _boundsForInterfaceOrientation:v10];
          -[SBPIPInteractionController _updateGeometryContextUsingTargetViewBounds:orientation:](self, "_updateGeometryContextUsingTargetViewBounds:orientation:", v10);
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (BOOL)_updateGeometryContextUsingTargetViewBounds:(CGRect)a3 orientation:(int64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  int64_t orientation = self->_geometryContext.orientation;
  BOOL v10 = orientation != a4;
  if (orientation != a4)
  {
    long long v12 = SBLogPIP();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      shortDescription = self->_shortDescription;
      int64_t v16 = self->_geometryContext.orientation;
      BOOL enabled = self->_enabled;
      int v22 = 138544130;
      uint64_t v23 = shortDescription;
      __int16 v24 = 2048;
      int64_t v25 = v16;
      __int16 v26 = 2048;
      int64_t v27 = a4;
      __int16 v28 = 1024;
      BOOL v29 = enabled;
      _os_log_debug_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating orientation: old{%ld} new{%ld} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);
    }

    self->_geometryContext.int64_t orientation = a4;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  if (!CGRectEqualToRect(self->_geometryContext.containerBounds, v32))
  {
    long long v13 = SBLogPIP();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = self->_shortDescription;
      uint64_t v19 = NSStringFromCGRect(self->_geometryContext.containerBounds);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = y;
      v31.size.CGFloat width = width;
      v31.size.CGFloat height = height;
      uint64_t v20 = NSStringFromCGRect(v31);
      BOOL v21 = self->_enabled;
      int v22 = 138544130;
      uint64_t v23 = v18;
      __int16 v24 = 2114;
      int64_t v25 = (int64_t)v19;
      __int16 v26 = 2114;
      int64_t v27 = (int64_t)v20;
      __int16 v28 = 1024;
      BOOL v29 = v21;
      _os_log_debug_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating container bounds: old{%{public}@ new{%{public}@} while enabled{%{BOOL}u}", (uint8_t *)&v22, 0x26u);
    }
    self->_geometryContext.containerBounds.origin.CGFloat x = x;
    self->_geometryContext.containerBounds.origin.CGFloat y = y;
    BOOL v10 = 1;
    self->_geometryContext.containerBounds.size.CGFloat width = width;
    self->_geometryContext.containerBounds.size.CGFloat height = height;
  }
  return v10;
}

- (SBPIPPositionInteractionStateContext)_currentPositionInteractionStateContext
{
  retstr->projectedPositionStashProgress = 0.0;
  *(_OWORD *)&retstr->initialPosition.CGFloat y = 0u;
  *(_OWORD *)&retstr->currentPosition.CGFloat y = 0u;
  *(_OWORD *)&retstr->isStashed = 0u;
  *(_OWORD *)&retstr->projectedPosition.CGFloat y = 0u;
  retstr->isStashed = [(SBPIPInteractionController *)self isStashed];
  retstr->isInteractive = [(_UIHyperInteractor *)self->_positionInteractor sbpip_isInteractive];
  retstr->hasActiveGesture = [(SBPIPInteractionController *)self _isGesturing];
  retstr->isFreelyPositionable = [(SBPIPInteractionSettings *)self->_interactionSettings freePositioning] != 0;
  double v5 = *(double *)[(_UIHyperInteractor *)self->_positionInteractor _projectedPoint];
  double v6 = *(double *)([(_UIHyperInteractor *)self->_positionInteractor _projectedPoint] + 8);
  retstr->projectedPosition.CGFloat x = v5;
  retstr->projectedPosition.CGFloat y = v6;
  CGFloat v7 = *(double *)[(_UIHyperInteractor *)self->_positionInteractor _unconstrainedPoint];
  CGFloat v8 = *(double *)([(_UIHyperInteractor *)self->_positionInteractor _unconstrainedPoint] + 8);
  retstr->initialPosition.CGFloat x = v7;
  retstr->initialPosition.CGFloat y = v8;
  [(SBPIPInteractionController *)self _currentPosition];
  retstr->currentPosition.CGFloat x = v9;
  retstr->currentPosition.CGFloat y = v10;
  retstr->currentPositionStashProgress = 0.0;
  retstr->projectedPositionStashProgress = 0.0;
  -[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:");
  retstr->currentPositionStashProgress = v11;
  double result = (SBPIPPositionInteractionStateContext *)-[SBPIPInteractionController _stashProgressForPosition:](self, "_stashProgressForPosition:", v5, v6);
  retstr->projectedPositionStashProgress = v13;
  return result;
}

- (void)_updateResolvedPositionHyperRegionsMapWithGeometry:(SBPIPPositionGeometryContext *)a3 interactionState:(SBPIPPositionInteractionStateContext *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  CGFloat v7 = self->_positionRegionComposers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    CGFloat v10 = 0;
    uint64_t v11 = *(void *)v33;
    do
    {
      uint64_t v12 = 0;
      double v13 = v10;
      do
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v14 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
        long long v15 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
        v31[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
        v31[11] = v15;
        v31[12] = *(_OWORD *)&a3->offscreenCorners;
        long long v16 = *(_OWORD *)&a3->edgeInsets.bottom;
        v31[6] = *(_OWORD *)&a3->edgeInsets.top;
        v31[7] = v16;
        long long v17 = *(_OWORD *)&a3->minimumPadding.bottom;
        v31[8] = *(_OWORD *)&a3->minimumPadding.top;
        v31[9] = v17;
        CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
        v31[2] = a3->pipStashedSize;
        v31[3] = pipAnchorPointOffset;
        CGSize size = a3->containerBounds.size;
        v31[4] = a3->containerBounds.origin;
        v31[5] = size;
        CGSize pipLastSteadySize = a3->pipLastSteadySize;
        v31[0] = a3->pipCurrentSize;
        v31[1] = pipLastSteadySize;
        long long v21 = *(_OWORD *)&a4->currentPosition.y;
        void v29[2] = *(_OWORD *)&a4->initialPosition.y;
        v29[3] = v21;
        double projectedPositionStashProgress = a4->projectedPositionStashProgress;
        long long v22 = *(_OWORD *)&a4->projectedPosition.y;
        v29[0] = *(_OWORD *)&a4->isStashed;
        v29[1] = v22;
        CGFloat v10 = [v14 positionRegionsForRegions:v13 geometry:v31 interaction:v29];

        ++v12;
        double v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }
  else
  {
    CGFloat v10 = 0;
  }

  resolvedPositionRegionsMap = self->_resolvedPositionRegionsMap;
  self->_resolvedPositionRegionsMap = v10;
  __int16 v24 = v10;

  int64_t v25 = [(NSDictionary *)v24 objectForKey:&unk_1F334A1C0];
  stashedLeftRegion = self->_stashedLeftRegion;
  self->_stashedLeftRegion = v25;

  int64_t v27 = [(NSDictionary *)v24 objectForKey:&unk_1F334A1D8];
  stashedRightRegion = self->_stashedRightRegion;
  self->_stashedRightRegion = v27;
}

- (void)_updateHyperregionVisualizationIfNecessary
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  CGFloat v3 = +[SBDefaults localDefaults];
  CGFloat v4 = [v3 pipDefaults];
  int v5 = [v4 visualizePositionRegions];

  positionRegionVisualizationView = self->_positionRegionVisualizationView;
  if (v5)
  {
    if (!positionRegionVisualizationView)
    {
      CGFloat v7 = objc_alloc_init(SBPIPInteractionControllerVisualizationView);
      uint64_t v8 = self->_positionRegionVisualizationView;
      self->_positionRegionVisualizationView = v7;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    CGFloat v10 = [WeakRetained superview];

    [v10 addSubview:self->_positionRegionVisualizationView];
    uint64_t v11 = self->_positionRegionVisualizationView;
    uint64_t v12 = [(_UIHyperInteractor *)self->_positionInteractor _region];
    [(SBPIPInteractionControllerVisualizationView *)v11 setRegionUnion:v12];

    double v13 = self->_positionRegionVisualizationView;
    p_geometryContext = &self->_geometryContext;
    long long v15 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    long long v16 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    long long v17 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    long long v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    long long v66 = v16;
    long long v67 = v17;
    CGSize size = self->_geometryContext.containerBounds.size;
    long long v19 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    long long v20 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    long long v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    long long v62 = v19;
    long long v63 = v20;
    long long v64 = v15;
    CGPoint pipAnchorPointOffset = self->_geometryContext.pipAnchorPointOffset;
    CGPoint origin = self->_geometryContext.containerBounds.origin;
    CGSize pipStashedSize = self->_geometryContext.pipStashedSize;
    CGPoint v58 = pipAnchorPointOffset;
    CGSize pipLastSteadySize = self->_geometryContext.pipLastSteadySize;
    CGPoint v59 = origin;
    CGSize v60 = size;
    CGSize pipCurrentSize = self->_geometryContext.pipCurrentSize;
    CGSize v56 = pipLastSteadySize;
    [(SBPIPInteractionControllerVisualizationView *)v13 setMainGeometryContext:&pipCurrentSize];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v24 = objc_loadWeakRetained((id *)&self->_dataSource);
    int64_t v25 = [v24 interactionControllerConnectedWindowScenes:self];

    uint64_t v26 = [v25 countByEnumeratingWithState:&v51 objects:v68 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v52;
      while (2)
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v52 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (([v30 isMainDisplayWindowScene] & 1) == 0)
          {
            double v39 = self->_positionRegionVisualizationView;
            __int16 v40 = [(NSMutableArray *)self->_positionRegionComposers firstObject];
            long long v41 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
            long long v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
            long long v66 = v41;
            long long v67 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
            long long v42 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
            long long v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
            long long v62 = v42;
            long long v43 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
            long long v63 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
            long long v64 = v43;
            CGPoint v44 = self->_geometryContext.pipAnchorPointOffset;
            CGSize pipStashedSize = self->_geometryContext.pipStashedSize;
            CGPoint v58 = v44;
            CGSize v45 = self->_geometryContext.containerBounds.size;
            CGPoint v59 = self->_geometryContext.containerBounds.origin;
            CGSize v60 = v45;
            CGSize v46 = self->_geometryContext.pipLastSteadySize;
            CGSize pipCurrentSize = p_geometryContext->pipCurrentSize;
            CGSize v56 = v46;
            [(SBPIPInteractionController *)self regionComposer:v40 transformGeometryContext:&pipCurrentSize toWindowScene:v30];
            [(SBPIPInteractionControllerVisualizationView *)v39 setExtendedGeometryContext:v50];

            goto LABEL_18;
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v51 objects:v68 count:16];
        if (v27) {
          continue;
        }
        break;
      }
    }

    CGRect v31 = self->_positionRegionVisualizationView;
    long long v32 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.bottom;
    long long v65 = *(_OWORD *)&self->_geometryContext.stashedMinimumPadding.top;
    long long v66 = v32;
    long long v67 = *(_OWORD *)&self->_geometryContext.offscreenCorners;
    long long v33 = *(_OWORD *)&self->_geometryContext.edgeInsets.bottom;
    long long v61 = *(_OWORD *)&self->_geometryContext.edgeInsets.top;
    long long v62 = v33;
    long long v34 = *(_OWORD *)&self->_geometryContext.minimumPadding.bottom;
    long long v63 = *(_OWORD *)&self->_geometryContext.minimumPadding.top;
    long long v64 = v34;
    CGPoint v35 = self->_geometryContext.pipAnchorPointOffset;
    CGSize pipStashedSize = self->_geometryContext.pipStashedSize;
    CGPoint v58 = v35;
    CGSize v36 = self->_geometryContext.containerBounds.size;
    CGPoint v59 = self->_geometryContext.containerBounds.origin;
    CGSize v60 = v36;
    CGSize v37 = self->_geometryContext.pipLastSteadySize;
    CGSize pipCurrentSize = p_geometryContext->pipCurrentSize;
    CGSize v56 = v37;
    [(SBPIPInteractionControllerVisualizationView *)v31 setExtendedGeometryContext:&pipCurrentSize];
LABEL_18:
    long long v47 = self->_positionRegionVisualizationView;
    [(SBPIPInteractionController *)self _currentPositionInteractionStateContext];
    [(SBPIPInteractionControllerVisualizationView *)v47 setInteractionContext:v49];
    long long v48 = self->_positionRegionVisualizationView;
    [v10 bounds];
    -[SBPIPInteractionControllerVisualizationView setFrame:](v48, "setFrame:");
    [(SBPIPInteractionControllerVisualizationView *)self->_positionRegionVisualizationView setNeedsLayout];
    [(SBPIPInteractionControllerVisualizationView *)self->_positionRegionVisualizationView layoutIfNeeded];
  }
  else if (positionRegionVisualizationView)
  {
    [(SBPIPInteractionControllerVisualizationView *)positionRegionVisualizationView removeFromSuperview];
    __int16 v38 = self->_positionRegionVisualizationView;
    self->_positionRegionVisualizationView = 0;
  }
}

- (BOOL)_regionIsStashedOne:(id)a3
{
  id v4 = a3;
  int v5 = [(_UIHyperregionUnion *)self->_stashedLeftRegion _regions];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(_UIHyperregionUnion *)self->_stashedRightRegion _regions];
    char v7 = [v8 containsObject:v4];
  }
  return v7;
}

- (void)addPositionRegionComposer:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    char v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2285, @"Invalid parameter not satisfying: %@", @"positionRegionComposer" object file lineNumber description];

    id v5 = 0;
  }
  if ([(NSMutableArray *)self->_positionRegionComposers containsObject:v5])
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2290, @"[%@] already added to this interaction controller [%@]", v8, self->_shortDescription object file lineNumber description];
  }
  else
  {
    [(NSMutableArray *)self->_positionRegionComposers addObject:v8];
    [v8 setDelegate:self];
  }
}

- (void)positionRegionComposerDidInvalidate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2295, @"Invalid parameter not satisfying: %@", @"positionRegionComposer" object file lineNumber description];
  }
  if ([(NSMutableArray *)self->_positionRegionComposers containsObject:v5])
  {
    [(NSMutableArray *)self->_positionRegionComposers removeObject:v5];
    [v5 setDelegate:0];
    char v6 = SBLogPIP();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      char v7 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      id v13 = (id)objc_opt_class();
      __int16 v14 = 2048;
      id v15 = v5;
      id v8 = v13;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@][Hyper] invalidated: %{public}@(%p)", buf, 0x20u);
    }
  }
  else
  {
    char v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2301, @"[%@] already removed from this interaction controller [%@]", v5, self->_shortDescription object file lineNumber description];
  }
}

- (void)positionRegionComposerNeedsUpdate:(id)a3 behavior:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    __int16 v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2306, @"Invalid parameter not satisfying: %@", @"regionComposer" object file lineNumber description];
  }
  if (([(NSMutableArray *)self->_positionRegionComposers containsObject:v7] & 1) == 0)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SBPIPInteractionController.m", 2307, @"Invalid parameter not satisfying: %@", @"[_positionRegionComposers containsObject:regionComposer]" object file lineNumber description];
  }
  [(SBPIPInteractionController *)self _updateInteractorsAndCommit:0];
  if ([(SBPIPInteractionController *)self isEnabled])
  {
    [(SBPIPInteractionController *)self _setNeedsLayoutForTraits:1 withReason:0x4000 behavior:v4];
    id v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2048;
      id v19 = v7;
      id v10 = v17;
      uint64_t v11 = "[%{public}@][Hyper] enabled; needsUpdate: %{public}@(%p)";
LABEL_10:
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0x20u);
    }
  }
  else
  {
    [(SBPIPInteractionController *)self _setupForInitialFrame];
    id v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = _SBFLoggingMethodProem();
      *(_DWORD *)buf = 138543874;
      id v15 = v9;
      __int16 v16 = 2114;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2048;
      id v19 = v7;
      id v10 = v17;
      uint64_t v11 = "[%{public}@][Hyper] disabled; needsUpdate: %{public}@(%p)";
      goto LABEL_10;
    }
  }
}

- (SBPIPPositionGeometryContext)regionComposer:(SEL)a3 transformGeometryContext:(id)a4 toWindowScene:(SBPIPPositionGeometryContext *)a5
{
  id v10 = a4;
  id v11 = a6;
  __int16 v12 = v11;
  long long v13 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  *(_OWORD *)&retstr->stashedMinimumPadding.double top = *(_OWORD *)&a5->stashedMinimumPadding.top;
  *(_OWORD *)&retstr->stashedMinimumPadding.double bottom = v13;
  *(_OWORD *)&retstr->offscreenCorners = *(_OWORD *)&a5->offscreenCorners;
  long long v14 = *(_OWORD *)&a5->edgeInsets.bottom;
  *(_OWORD *)&retstr->edgeInsets.double top = *(_OWORD *)&a5->edgeInsets.top;
  *(_OWORD *)&retstr->edgeInsets.double bottom = v14;
  long long v15 = *(_OWORD *)&a5->minimumPadding.bottom;
  *(_OWORD *)&retstr->minimumPadding.double top = *(_OWORD *)&a5->minimumPadding.top;
  *(_OWORD *)&retstr->minimumPadding.double bottom = v15;
  CGPoint pipAnchorPointOffset = a5->pipAnchorPointOffset;
  retstr->CGSize pipStashedSize = a5->pipStashedSize;
  retstr->CGPoint pipAnchorPointOffset = pipAnchorPointOffset;
  CGSize size = a5->containerBounds.size;
  retstr->containerBounds.CGPoint origin = a5->containerBounds.origin;
  retstr->containerBounds.CGSize size = size;
  CGSize pipLastSteadySize = a5->pipLastSteadySize;
  retstr->CGSize pipCurrentSize = a5->pipCurrentSize;
  retstr->CGSize pipLastSteadySize = pipLastSteadySize;
  if (v11 && ([v11 isMainDisplayWindowScene] & 1) == 0)
  {
    objc_msgSend(v12, "_boundsForInterfaceOrientation:", objc_msgSend(v12, "interfaceOrientation"));
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    [(SBPIPInteractionController *)self _transformToDisplayArrangementSpaceFromWindowScene:v12];
    v37.origin.CGFloat x = v20;
    v37.origin.CGFloat y = v22;
    v37.size.CGFloat width = v24;
    v37.size.CGFloat height = v26;
    retstr->containerBounds = CGRectApplyAffineTransform(v37, &v36);
    retstr->int64_t orientation = [v12 interfaceOrientation];
  }
  [(SBPIPInteractionController *)self _cachedEdgeInsetsForScene:v12];
  retstr->edgeInsets.double top = v27;
  retstr->edgeInsets.double left = v28;
  retstr->edgeInsets.double bottom = v29;
  retstr->edgeInsets.double right = v30;
  [(SBPIPInteractionController *)self _cachedStashedPaddingForScene:v12];
  retstr->stashedMinimumPadding.double top = v31;
  retstr->stashedMinimumPadding.double left = v32;
  retstr->stashedMinimumPadding.double bottom = v33;
  retstr->stashedMinimumPadding.double right = v34;

  return result;
}

- (id)targetWindowSceneForRegionComposer:(id)a3
{
  [(SBPIPInteractionController *)self _updateTargetWindowSceneIfNeededUpdatingInteractors:0];
  targetWindowScene = self->_targetWindowScene;
  return targetWindowScene;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  uint64_t v9 = [v8 window];
  id v10 = [v9 screen];
  id v11 = [v10 fixedCoordinateSpace];

  __int16 v12 = [v8 window];
  objc_msgSend(v12, "convertPoint:fromView:", v8, x, y);
  objc_msgSend(v9, "convertPoint:toCoordinateSpace:", v11);
  double v14 = v13;
  double v16 = v15;

  if ([(SBPIPInteractionController *)self isStashed] || self->_pendingTransition) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (!objc_msgSend(WeakRetained, "shouldPointerInteractionBeginForInteractionController:atLocation:inView:", self, v8, x, y))
  {
    BOOL v17 = 0;
    goto LABEL_9;
  }
  CGFloat v20 = [(id)SBApp bannerManager];
  double v21 = [v9 _sbWindowScene];
  char v22 = objc_msgSend(v20, "pointInsideBanner:inWindowScene:", v21, v14, v16);

  if ((v22 & 1) == 0)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
    [v23 frame];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    id WeakRetained = [(SBPIPInteractionSettings *)self->_interactionSettings edgeResizeSettings];
    [WeakRetained liveResizePointerInteractionRegionInnerLength];
    double v33 = v32;
    [WeakRetained liveResizePointerInteractionRegionOuterLength];
    double v35 = v34;
    [WeakRetained liveResizePointerInteractionRegionCornerLength];
    BOOL v17 = +[SBEdgeResizeSystemPointerInteractionHelper shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:](SBEdgeResizeSystemPointerInteractionHelper, "shouldBeginPointerInteractionAtLocation:frame:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerLengthOfInteractionRegion:occupiedCorners:hoveringOverEdge:pointerRegion:", 0, &self->_hoveringOverEdge, &self->_pointerRegion, x, y, v25, v27, v29, v31, v33, v35, v36);
LABEL_9:

    goto LABEL_4;
  }
LABEL_3:
  BOOL v17 = 0;
LABEL_4:

  return v17;
}

- (void)pointerWillExitRegion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  objc_msgSend(WeakRetained, "_setTouchInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

  uint64_t v4 = MEMORY[0x1E4F1DB28];
  -[UIView setFrame:](self->_pointerHitTestBlocker, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGSize v5 = *(CGSize *)(v4 + 16);
  self->_pointerRegion.CGPoint origin = *(CGPoint *)v4;
  self->_pointerRegion.CGSize size = v5;
  self->_unint64_t pointerIsHoveringOverEdge = 0;
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  [v6 interactionControllerDidEndEdgeResizing:self];
}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  CGFloat v3 = [(SBPIPInteractionSettings *)self->_interactionSettings edgeResizeSettings];
  [v3 liveResizePointerInteractionRegionOuterLength];
  UIEdgeInsetsMakeWithEdges();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F42CB0];
  double v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  double v8 = objc_msgSend(v5, "regionWithRect:identifier:", v7, self->_pointerRegion.origin.x, self->_pointerRegion.origin.y, self->_pointerRegion.size.width, self->_pointerRegion.size.height);

  objc_msgSend(v8, "setLatchingAxes:", +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:](SBEdgeResizeSystemPointerInteractionHelper, "latchingAxesForHoveredEdge:", self->_hoveringOverEdge));
  return v8;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  interactionSettings = self->_interactionSettings;
  id v6 = a3;
  double v7 = [(SBPIPInteractionSettings *)interactionSettings edgeResizeSettings];
  if (!self->_pointerIsHoveringOverEdge && self->_hoveringOverEdge)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained interactionControllerDidBeginEdgeResizing:self];
  }
  self->_unint64_t pointerIsHoveringOverEdge = self->_hoveringOverEdge;
  id v9 = objc_loadWeakRetained((id *)&self->_interactionTargetView);
  [v7 liveResizePointerInteractionRegionOuterLength];
  UIEdgeInsetsMakeWithEdges();
  objc_msgSend(v9, "_setTouchInsets:");

  pointerHitTestBlocker = self->_pointerHitTestBlocker;
  [v6 rect];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  -[UIView setFrame:](pointerHitTestBlocker, "setFrame:", v12, v14, v16, v18);
  id v19 = objc_loadWeakRetained((id *)&self->_dataSource);
  [v19 currentCornerRadiusForInteractionController:self];
  double v21 = v20;

  unint64_t hoveringOverEdge = self->_hoveringOverEdge;
  [v7 liveResizePointerInteractionRegionInnerLength];
  double v24 = v23;
  [v7 liveResizePointerInteractionRegionOuterLength];
  double v26 = +[SBEdgeResizeSystemPointerInteractionHelper fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:](SBEdgeResizeSystemPointerInteractionHelper, "fancyResizePointerShapeHoveringOverEdge:innerLengthOfInteractionRegion:outerLengthOfInteractionRegion:cornerRadii:", hoveringOverEdge, v24, v25, v21, v21, v21, v21);
  unint64_t v27 = +[SBEdgeResizeSystemPointerInteractionHelper latchingAxesForHoveredEdge:self->_hoveringOverEdge];
  double v28 = [MEMORY[0x1E4F42CC0] styleWithShape:v26 constrainedAxes:v27];

  return v28;
}

- (SBPIPInteractionControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (SBPIPInteractionControllerDataSource *)WeakRetained;
}

- (double)preferredScale
{
  return self->_preferredScale;
}

- (CGRect)nonoperationalFrame
{
  double x = self->_nonoperationalFrame.origin.x;
  double y = self->_nonoperationalFrame.origin.y;
  double width = self->_nonoperationalFrame.size.width;
  double height = self->_nonoperationalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (UIView)targetOverlayView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_targetOverlayView);
  return (UIView *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetOverlayView);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pendingTransition, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifierToStashedPadding, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifierToEdgeInsets, 0);
  objc_storeStrong((id *)&self->_targetWindowScene, 0);
  objc_storeStrong((id *)&self->_positionRegionVisualizationView, 0);
  objc_storeStrong((id *)&self->_pointerHitTestBlocker, 0);
  objc_storeStrong((id *)&self->_layoutSettings, 0);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_interactionSettings, 0);
  objc_storeStrong(&self->_pendingInteractionCompletion, 0);
  objc_storeStrong((id *)&self->_scaleInteractor, 0);
  objc_storeStrong((id *)&self->_rotationInteractor, 0);
  objc_storeStrong((id *)&self->_positionInteractor, 0);
  objc_storeStrong((id *)&self->_stashedRightRegion, 0);
  objc_storeStrong((id *)&self->_stashedLeftRegion, 0);
  objc_storeStrong((id *)&self->_positionRegionComposers, 0);
  objc_storeStrong((id *)&self->_resolvedPositionRegionsMap, 0);
  objc_storeStrong((id *)&self->_panWhileResizingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalPanDrivingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_edgeResizeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_rotationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_layoutProgressProperty, 0);
  objc_storeStrong((id *)&self->_systemPointerInteractionManager, 0);
  objc_storeStrong((id *)&self->_systemGestureManagerForResizing, 0);
  objc_storeStrong((id *)&self->_shortDescription, 0);
  objc_destroyWeak((id *)&self->_interactionTargetView);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_setPreferredScale:additionalReasons:animationBehavior:.cold.1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  int v1 = *(unsigned __int8 *)(v0 + 41);
  int v5 = 138543874;
  uint64_t v6 = v2;
  __int16 v7 = 2048;
  uint64_t v8 = v3;
  __int16 v9 = 1024;
  int v10 = v1;
  _os_log_debug_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Updating public layout trait preferred scale: %f while enabled{%{BOOL}u}", (uint8_t *)&v5, 0x1Cu);
}

- (void)handleEdgeResizeGesture:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Edge Resize Ended", v5, v6, v7, v8, v9);
}

- (void)handleEdgeResizeGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Edge Resize Began", v5, v6, v7, v8, v9);
}

- (void)handlePanGesture:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Pan Ended", v5, v6, v7, v8, v9);
}

- (void)handlePanGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Pan Began", v5, v6, v7, v8, v9);
}

- (void)handlePinchGesture:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 name];
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Pinch Ended", v5, v6, v7, v8, v9);
}

- (void)handlePinchGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Pinch Began", v5, v6, v7, v8, v9);
}

- (void)handleRotationGesture:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Rotation Ended", v5, v6, v7, v8, v9);
}

- (void)handleRotationGesture:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_2_10(a1, a2), "name");
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Gesture][%{public}@] Rotation Began", v5, v6, v7, v8, v9);
}

- (void)__handleGesturesEndedState:.cold.1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  uint64_t v2 = @"cancelled";
  if (!*(unsigned char *)(v3 + 43)) {
    uint64_t v2 = @"recognized";
  }
  int v4 = 138543618;
  uint64_t v5 = v1;
  __int16 v6 = 2114;
  uint64_t v7 = v2;
  _os_log_debug_impl(&dword_1D85BA000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@][Gesture] Did Handle Ended State: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)_setNeedsLayoutForTraits:(uint8_t *)buf withReason:(os_log_t)log behavior:layoutCompletion:interactionCompletion:.cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Will begin animation for: %{public}@", buf, 0x16u);
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] Preferred content size is dirty, attempt updating it now.", (uint8_t *)&v2, 0xCu);
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_2(uint64_t a1, uint64_t *a2)
{
  int v2 = SBStringFromPIPLayoutReason(*a2);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v3, v4, "[%{public}@][Layout] Settled for: %{public}@", v5, v6, v7, v8, v9);
}

void __114__SBPIPInteractionController__setNeedsLayoutForTraits_withReason_behavior_layoutCompletion_interactionCompletion___block_invoke_cold_3(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
  uint64_t v6 = SBStringFromPIPLayoutReason(*(void *)(a1 + 64));
  uint64_t v7 = *a2;
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  double v11 = v6;
  __int16 v12 = 2048;
  uint64_t v13 = v7;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "[%{public}@][Layout] decrement!: %{public}@ %ld", (uint8_t *)&v8, 0x20u);
}

- (void)_updateInteractorsAndCommit:.cold.1()
{
  OUTLINED_FUNCTION_4_2(*MEMORY[0x1E4F143B8]);
  int v2 = 138543362;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Unexpectedly had no subregions for interaction controller %{public}@", (uint8_t *)&v2, 0xCu);
}

@end