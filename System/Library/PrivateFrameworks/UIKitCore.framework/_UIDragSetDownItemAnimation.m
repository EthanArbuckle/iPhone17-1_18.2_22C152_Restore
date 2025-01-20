@interface _UIDragSetDownItemAnimation
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)initialTargetVelocity;
- ($FE0FA7B0FBCE76F76F882EF47F3AD961)initialVelocity;
- (BOOL)almostToTarget;
- (BOOL)defaultAnimation;
- (BOOL)done;
- (BOOL)hasStartedSpringAnimation;
- (BOOL)midwayToTarget;
- (BOOL)needsReparenting;
- (BOOL)reachedTarget;
- (BOOL)reparentingCrossfadeComplete;
- (BOOL)sourceAnimation;
- (BOOL)updatedPreviewWasAdded;
- (CAPoint3D)center;
- (CGRect)targetFrame;
- (UIDragItem)item;
- (UITargetedDragPreview)targetedDropPreview;
- (UITargetedDragPreview)updatedTargetedDropPreview;
- (UIView)dropContainerView;
- (UIView)retargetingContainerView;
- (UIViewPropertyAnimator)propertyAnimator;
- (UIViewSpringAnimationBehaviorDescribing)customSpringAnimationBehavior;
- (UIWindow)targetContainerWindow;
- (_DUIVisibleDroppedItem)droppedItem;
- (_UIDragSetDownAnimationTarget)visualTarget;
- (_UIDragSetDownItemAnimation)initWithDragItem:(id)a3 droppedItem:(id)a4 dropContainerView:(id)a5 defaultAnimation:(BOOL)a6 sourceAnimation:(BOOL)a7 delegate:(id)a8;
- (_UIDragSetDownItemAnimationDelegate)delegate;
- (_UIPlatterContainerView)platterContainerView;
- (_UIPlatterView)appPlatterView;
- (_UIPlatterView)defaultPlatterView;
- (_UIPlatterView)druidPlatterView;
- (_UIPlatterView)updatedAppPlatterView;
- (_UIPortalView)retargetingContainerPortalView;
- (double)estimatedFractionCompleteOfAnimation;
- (double)initialDistanceFromTargetFrame;
- (double)targetCenterZ;
- (id)animationCompletionHandler;
- (id)completionHandler;
- (id)midpointHandler;
- (id)morphHandler;
- (id)nearCompletionHandler;
- (id)nonAnimatedMidpointHandler;
- (id)positionHandler;
- (int)animationCount;
- (int64_t)previewMode;
- (void)_setCenterAndVelocityFromDroppedItem:(id)a3;
- (void)animationCompleted;
- (void)animationReachedTarget;
- (void)beginAnimation;
- (void)configureAnimation;
- (void)configureCrossfadingAnimationToTargetedPreview;
- (void)configureSystemDefaultAnimation;
- (void)dirtyTargetedDropPreview;
- (void)performSpringAnimations:(id)a3;
- (void)performTrackingAnimations:(id)a3;
- (void)prepareAnimationInWindow;
- (void)prepareToBeginAnimation;
- (void)previewContainerAnimationDidComplete;
- (void)reparentRetargetingContainerViewInTargetContainer;
- (void)setAlmostToTarget:(BOOL)a3;
- (void)setAnimationCount:(int)a3;
- (void)setAppPlatterView:(id)a3;
- (void)setCenter:(CAPoint3D)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCustomSpringAnimationBehavior:(id)a3;
- (void)setDefaultAnimation:(BOOL)a3;
- (void)setDefaultPlatterView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropContainerView:(id)a3;
- (void)setDruidPlatterView:(id)a3;
- (void)setHasStartedSpringAnimation:(BOOL)a3;
- (void)setInitialDistanceFromTargetFrame:(double)a3;
- (void)setInitialTargetVelocity:(id)a3;
- (void)setInitialVelocity:(id)a3;
- (void)setMidpointHandler:(id)a3;
- (void)setMidwayToTarget:(BOOL)a3;
- (void)setMorphHandler:(id)a3;
- (void)setNearCompletionHandler:(id)a3;
- (void)setNonAnimatedMidpointHandler:(id)a3;
- (void)setPlatterContainerView:(id)a3;
- (void)setPositionHandler:(id)a3;
- (void)setPropertyAnimator:(id)a3;
- (void)setReparentingCrossfadeComplete:(BOOL)a3;
- (void)setRetargetingContainerPortalView:(id)a3;
- (void)setRetargetingContainerView:(id)a3;
- (void)setSourceAnimation:(BOOL)a3;
- (void)setTargetCenterZ:(double)a3;
- (void)setTargetFrame:(CGRect)a3;
- (void)setTargetedDropPreview:(id)a3;
- (void)setUpdatedAppPlatterView:(id)a3;
- (void)setUpdatedPreviewWasAdded:(BOOL)a3;
- (void)setUpdatedTargetedDropPreview:(id)a3;
- (void)setVisualTarget:(id)a3;
- (void)updateAnimationTargeting;
- (void)updateCurrentTargetFrame;
- (void)updateDroppedItem:(id)a3;
- (void)updateTargetedDropPreview:(id)a3;
@end

@implementation _UIDragSetDownItemAnimation

- (_UIDragSetDownItemAnimation)initWithDragItem:(id)a3 droppedItem:(id)a4 dropContainerView:(id)a5 defaultAnimation:(BOOL)a6 sourceAnimation:(BOOL)a7 delegate:(id)a8
{
  id v15 = a3;
  id v23 = a4;
  id v16 = a5;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_UIDragSetDownItemAnimation;
  v24.receiver = [(_UIDragSetDownItemAnimation *)&v25 init];
  v24.super_class = (Class)_UIDragSetDownItemAnimation;
  v18 = [(_UIDragSetDownItemAnimation *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_item, a3);
    objc_storeStrong((id *)&v19->_droppedItem, a4);
    objc_storeStrong((id *)&v19->_dropContainerView, a5);
    v19->_sourceAnimation = a7;
    v19->_defaultAnimation = a6;
    if (a7) {
      [v15 _sourceVisualTarget];
    }
    else {
    uint64_t v20 = [v15 _destinationVisualTarget];
    }
    visualTarget = v19->_visualTarget;
    v19->_visualTarget = (_UIDragSetDownAnimationTarget *)v20;

    objc_storeWeak((id *)&v19->_delegate, v17);
    [(_UIDragSetDownItemAnimation *)v19 prepareAnimationInWindow];
    [(_UIDragSetDownItemAnimation *)v19 configureAnimation];
  }

  return v19;
}

- (void)prepareAnimationInWindow
{
  double v3 = *MEMORY[0x1E4F1DB20];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  v7 = self->_visualTarget;
  if (!v7) {
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [(_UIDragSetDownAnimationTarget *)v7 _window];
    v9 = v8;
    if (!v8 || ([v8 isHidden] & 1) != 0)
    {

LABEL_6:
LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
  }
  if (self->_defaultAnimation) {
    goto LABEL_9;
  }
  visualTarget = self->_visualTarget;
  v13 = [(_UIDragSetDownItemAnimation *)self delegate];
  v10 = [(_UIDragSetDownAnimationTarget *)visualTarget _setDownAnimation:v13 prepareForSetDownOfDragItem:self->_item visibleDroppedItem:self->_droppedItem];

  double v3 = _targetFrameForTargetedPreviewInContainerView(v10, self->_dropContainerView);
  CGFloat v4 = v14;
  CGFloat v5 = v15;
  CGFloat v6 = v16;
LABEL_10:
  self->_targetFrame.origin.x = v3;
  self->_targetFrame.origin.y = v4;
  self->_targetFrame.size.width = v5;
  self->_targetFrame.size.height = v6;
  targetedDropPreview = self->_targetedDropPreview;
  self->_targetedDropPreview = v10;
  id v17 = v10;

  [(_UIDragSetDownItemAnimation *)self _setCenterAndVelocityFromDroppedItem:self->_droppedItem];
}

- (void)prepareToBeginAnimation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  propertyAnimator = self->_propertyAnimator;
  if (has_internal_diagnostics)
  {
    if (!propertyAnimator)
    {
      v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "property animator passed to delegate API must be non-nil", buf, 2u);
      }
    }
  }
  else if (!propertyAnimator)
  {
    v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &prepareToBeginAnimation___s_category) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "property animator passed to delegate API must be non-nil", v9, 2u);
    }
  }
  CGFloat v5 = [(_UIDragSetDownItemAnimation *)self delegate];
  [(_UIDragSetDownAnimationTarget *)self->_visualTarget _setDownAnimation:v5 willAnimateSetDownOfDragItem:self->_item withAnimator:self->_propertyAnimator preview:self->_targetedDropPreview];
  item = self->_item;
  if (item) {
    objc_storeWeak((id *)&item->__currentSetDownAnimation, v5);
  }
}

- (void)beginAnimation
{
  [(UIView *)self->_retargetingContainerView setHidden:0];
  if (self->_defaultAnimation)
  {
    propertyAnimator = self->_propertyAnimator;
    [(UIViewPropertyAnimator *)propertyAnimator startAnimation];
  }
}

- (void)animationReachedTarget
{
  self->_reachedTarget = 1;
  id v3 = [(_UIDragSetDownItemAnimation *)self delegate];
  [v3 itemAnimationReachedTarget:self];
}

- (void)animationCompleted
{
  self->_done = 1;
  [(UIView *)self->_appPlatterView removeFromSuperview];
  [(UIView *)self->_updatedAppPlatterView removeFromSuperview];
  [(UIView *)self->_druidPlatterView removeFromSuperview];
  [(UIView *)self->_retargetingContainerPortalView removeFromSuperview];
  [(UIView *)self->_retargetingContainerView removeFromSuperview];
  [(UIView *)self->_defaultPlatterView removeFromSuperview];
  id v3 = [(_UIDragSetDownItemAnimation *)self delegate];
  [v3 itemAnimationCompleted:self];
}

- (UIWindow)targetContainerWindow
{
  v2 = [(UITargetedPreview *)self->_targetedDropPreview target];
  id v3 = [v2 container];
  CGFloat v4 = [v3 _window];

  return (UIWindow *)v4;
}

- (void)configureAnimation
{
  if (self->_defaultAnimation || CGRectIsNull(self->_targetFrame))
  {
    self->_defaultAnimation = 1;
    [(_UIDragSetDownItemAnimation *)self configureSystemDefaultAnimation];
  }
  else
  {
    [(_UIDragSetDownItemAnimation *)self configureCrossfadingAnimationToTargetedPreview];
  }
}

- (void)configureSystemDefaultAnimation
{
  id v3 = [[_UIPlatterView alloc] initWithDroppedItem:self->_droppedItem];
  -[UIView setCenter:](v3, "setCenter:", self->_center.x, self->_center.y);
  objc_storeStrong((id *)&self->_defaultPlatterView, v3);
  [(UIView *)self->_dropContainerView insertSubview:v3 atIndex:0];
  CGFloat v4 = [(id)objc_opt_class() defaultSetDownPropertyAnimator];
  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = v4;

  if (self->_sourceAnimation)
  {
    CGFloat v6 = [(_UIDragSetDownItemAnimation *)self droppedItem];
    uint64_t v7 = [v6 itemIndex];

    v8 = self->_propertyAnimator;
    if (v7)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_2;
      v19[3] = &unk_1E52D9F70;
      v9 = (id *)&v20;
      uint64_t v20 = v3;
      v10 = v19;
    }
    else
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke;
      v21[3] = &unk_1E52D9F70;
      v9 = (id *)&v22;
      v22 = v3;
      v10 = v21;
    }
  }
  else
  {
    v8 = self->_propertyAnimator;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_3;
    v17[3] = &unk_1E52D9F70;
    v9 = (id *)&v18;
    v18 = v3;
    v10 = v17;
  }
  [(UIViewPropertyAnimator *)v8 addAnimations:v10];

  objc_initWeak(&location, self);
  v11 = self->_propertyAnimator;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62___UIDragSetDownItemAnimation_configureSystemDefaultAnimation__block_invoke_4;
  v13[3] = &unk_1E52E6710;
  objc_copyWeak(&v15, &location);
  v12 = v3;
  double v14 = v12;
  [(UIViewPropertyAnimator *)v11 addCompletion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)configureCrossfadingAnimationToTargetedPreview
{
  id v3 = (UIViewPropertyAnimator *)objc_opt_new();
  propertyAnimator = self->_propertyAnimator;
  self->_propertyAnimator = v3;

  CGFloat v5 = [(_DUIVisibleDroppedItem *)self->_droppedItem preview];
  CGFloat v6 = [UIView alloc];
  [(UIView *)self->_dropContainerView bounds];
  uint64_t v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
  [(UIView *)v7 setHidden:1];
  [(UIView *)v7 setUserInteractionEnabled:0];
  [(UIView *)self->_dropContainerView insertSubview:v7 atIndex:0];
  v67 = v7;
  objc_storeStrong((id *)&self->_retargetingContainerView, v7);
  [v5 unscaledSize];
  double v9 = v8;
  double v11 = v10;
  v12 = -[_UIPlatterContainerView initWithFrame:]([_UIPlatterContainerView alloc], "initWithFrame:", 0.0, 0.0, v8, v10);
  platterContainerView = self->_platterContainerView;
  self->_platterContainerView = v12;

  -[UIView setCenter:](self->_platterContainerView, "setCenter:", self->_center.x, self->_center.y);
  [(UIView *)self->_retargetingContainerView addSubview:self->_platterContainerView];
  double v14 = self->_platterContainerView;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v94 = 0u;
  id v15 = [(UITargetedPreview *)self->_targetedDropPreview target];
  double v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "transform", v67);
  }
  else
  {
    long long v95 = 0u;
    long long v96 = 0u;
    long long v94 = 0u;
  }

  id v17 = [(UITargetedPreview *)self->_targetedDropPreview view];
  v18 = [(UITargetedDragPreview *)self->_targetedDropPreview _duiPreview];
  v19 = [v17 window];
  if (v19)
  {
    uint64_t v20 = [(UITargetedPreview *)self->_targetedDropPreview parameters];
    objc_msgSend(v18, "setHidesSourceView:", objc_msgSend(v20, "hidesSourceViewDuringDropAnimation"));
  }
  else
  {
    [v18 setHidesSourceView:1];
  }

  v21 = [v17 window];

  if (!v21)
  {
    v22 = [(UITargetedPreview *)self->_targetedDropPreview target];
    id v23 = [v22 container];
    [v23 addSubview:v17];

    [v17 setAlpha:0.0];
  }
  objc_super v24 = [[_UIPlatterView alloc] initWithDUIPreview:v18];
  appPlatterView = self->_appPlatterView;
  self->_appPlatterView = v24;

  [(_UIPlatterView *)self->_appPlatterView setTransformAppliedExternally:1];
  [(_UIPlatterView *)self->_appPlatterView setSourceView:v17];
  [(_DUIVisibleDroppedItem *)self->_droppedItem rotation];
  -[_UIPlatterView setStackRotation:](self->_appPlatterView, "setStackRotation:");
  droppedItem = self->_droppedItem;
  if (droppedItem)
  {
    [(_DUIVisibleDroppedItem *)droppedItem appliedTransform];
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v91 = 0u;
  }
  v27 = self->_appPlatterView;
  v90[0] = v91;
  v90[1] = v92;
  v90[2] = v93;
  -[_UIPlatterView setAppliedTransform:](v27, "setAppliedTransform:", v90, v67);
  if ([v18 previewMode] != 2)
  {
    [(UIView *)self->_appPlatterView setAlpha:0.0];
    [(_UIPlatterView *)self->_appPlatterView setLifted:1];
  }
  v28 = self->_appPlatterView;

  if ((unint64_t)([(_UIDragSetDownItemAnimation *)self previewMode] - 3) < 2
    || [(UITargetedPreview *)self->_targetedDropPreview _isDefaultPreview])
  {
    v29 = [(UITargetedDragPreview *)self->_targetedDropPreview _duiPreview];
    [v29 stackAlpha];
    -[UIView setAlpha:](v28, "setAlpha:");

    [(_UIPlatterView *)v28 setLifted:1];
    [(_UIPlatterView *)v28 setConstrainSize:[(_DUIVisibleDroppedItem *)self->_droppedItem constrainSize]];
    if ([(UITargetedPreview *)self->_targetedDropPreview _isDefaultPreview])
    {
      v30 = [(_DUIVisibleDroppedItem *)self->_droppedItem preview];
      v31 = [v30 shadowProperties];
      [(_UIPlatterView *)v28 setShadowProperties:v31];
    }
    v32 = 0;
  }
  else
  {
    v33 = [[_UIPlatterView alloc] initWithDroppedItem:self->_droppedItem];
    druidPlatterView = self->_druidPlatterView;
    self->_druidPlatterView = v33;

    [(_UIPlatterView *)self->_druidPlatterView setTransformAppliedExternally:1];
    v32 = self->_druidPlatterView;
  }
  [(_UIPlatterContainerView *)self->_platterContainerView setSource:v32];
  [(_UIPlatterContainerView *)self->_platterContainerView setTarget:v28];
  memset(&v89, 0, sizeof(v89));
  if (v32)
  {
    v35 = v32;
LABEL_24:
    [(_UIPlatterView *)v35 targetTransform];
    goto LABEL_25;
  }
  if (v28)
  {
    v35 = v28;
    goto LABEL_24;
  }
  memset(&v88, 0, sizeof(v88));
LABEL_25:
  CATransform3DGetAffineTransform(&v89, &v88);
  CGAffineTransform location = v89;
  -[_UIPlatterContainerView applyTransform:withSize:](v14, "applyTransform:withSize:", &location, v9, v11);
  v36 = [(UITargetedDragPreview *)self->_targetedDropPreview _previewContainer];
  if (v36)
  {
    v37 = [(_DUIVisibleDroppedItem *)self->_droppedItem imageComponent];
    if ([(UITargetedPreview *)self->_targetedDropPreview _isDefaultPreview]
      && ([v37 representsPortal] & 1) == 0)
    {
      v39 = [_UIDragSlotHostingView alloc];
      [v37 frame];
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      [v37 size3D];
      v38 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v39, "initWithFrame:contentSize:slotID:", [v37 slotID], v41, v43, v45, v47, v48, v49, v50);
    }
    else
    {
      v38 = 0;
    }
    [(_UIPlatterContainerView *)v14 installPreviewContainer:v36 overrideSourceView:v38];
    ++self->_animationCount;
  }
  if ([(_UIDragSetDownItemAnimation *)self needsReparenting]) {
    [(_UIDragSetDownItemAnimation *)self reparentRetargetingContainerViewInTargetContainer];
  }
  objc_initWeak((id *)&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke;
  aBlock[3] = &unk_1E52DC308;
  objc_copyWeak(&v86, (id *)&location);
  v51 = _Block_copy(aBlock);
  id positionHandler = self->_positionHandler;
  self->_id positionHandler = v51;

  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_2;
  v80[3] = &unk_1E52FC0A8;
  objc_copyWeak(&v84, (id *)&location);
  v53 = v28;
  v81 = v53;
  v82 = v32;
  v83 = v14;
  v54 = v14;
  v55 = v32;
  v56 = _Block_copy(v80);
  id morphHandler = self->_morphHandler;
  self->_id morphHandler = v56;

  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_3;
  v78[3] = &unk_1E52D9F70;
  v58 = v53;
  v79 = v58;
  v59 = _Block_copy(v78);
  id midpointHandler = self->_midpointHandler;
  self->_id midpointHandler = v59;

  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_4;
  v76[3] = &unk_1E52D9F70;
  v77 = v58;
  v61 = v58;
  v62 = _Block_copy(v76);
  id nearCompletionHandler = self->_nearCompletionHandler;
  self->_id nearCompletionHandler = v62;

  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __77___UIDragSetDownItemAnimation_configureCrossfadingAnimationToTargetedPreview__block_invoke_5;
  v69[3] = &unk_1E53106E8;
  objc_copyWeak(&v71, (id *)&location);
  BOOL v75 = v21 == 0;
  id v70 = v17;
  long long v72 = v94;
  long long v73 = v95;
  long long v74 = v96;
  id v64 = v17;
  v65 = _Block_copy(v69);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v65;

  objc_destroyWeak(&v71);
  objc_destroyWeak(&v84);
  objc_destroyWeak(&v86);
  objc_destroyWeak((id *)&location);
}

- (void)reparentRetargetingContainerViewInTargetContainer
{
  id v3 = self->_dropContainerView;
  CGFloat v4 = [(UITargetedPreview *)self->_targetedDropPreview target];
  CGFloat v5 = [v4 container];

  [v5 bounds];
  CGFloat v6 = [v5 layer];
  uint64_t v7 = [v6 flipsHorizontalAxis];
  double v8 = [(UIView *)self->_retargetingContainerView layer];
  [v8 setFlipsHorizontalAxis:v7];

  double v9 = [v5 layer];
  double v10 = [v9 presentationLayer];
  double v11 = [v5 _window];
  v12 = [v11 layer];
  v13 = [v12 presentationLayer];
  int v14 = [v10 isDescendantOf:v13];

  id v15 = [v5 layer];
  double v16 = v15;
  if (v14)
  {
    uint64_t v17 = [v15 presentationLayer];

    double v16 = (void *)v17;
  }
  v18 = [v5 _window];
  v19 = [v18 layer];
  objc_msgSend(v19, "convertPoint:toLayer:", v16, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v21 = v20;
  double v23 = v22;

  objc_super v24 = [v18 layer];
  objc_msgSend(v24, "convertPoint:toLayer:", v16, 1.0, 0.0);
  double v26 = v25;
  double v28 = v27;

  v29 = [v18 layer];
  objc_msgSend(v29, "convertPoint:toLayer:", v16, 0.0, 1.0);
  double v31 = v30;
  double v33 = v32;

  long double v34 = hypot(v26 - v21, v28 - v23);
  long double v35 = hypot(v31 - v21, v33 - v23);
  memset(&v68, 0, sizeof(v68));
  CGAffineTransformMakeScale(&v68, v34, v35);
  double RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v5, v3, 1);
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeRotation(&v67, -RotationAngleFromViewToView);
  CGAffineTransform t1 = v68;
  CGAffineTransform t2 = v67;
  CGAffineTransformConcat(&v69, &t1, &t2);

  retargetingContainerView = self->_retargetingContainerView;
  CGAffineTransform v64 = v69;
  [(UIView *)retargetingContainerView setTransform:&v64];
  [v5 addSubview:self->_retargetingContainerView];
  [(UIView *)v3 bounds];
  double v40 = v39 + v38 * 0.5;
  double v43 = v42 + v41 * 0.5;
  double v44 = [v5 _window];
  -[UIView convertPoint:toCoordinateSpace:](v3, "convertPoint:toCoordinateSpace:", v44, v40, v43);
  double v46 = v45;
  double v48 = v47;

  double v49 = [v5 _window];
  double v50 = [v49 layer];
  objc_msgSend(v50, "convertPoint:toLayer:", v16, v46, v48);
  double v52 = v51;
  double v54 = v53;

  -[UIView setCenter:](self->_retargetingContainerView, "setCenter:", v52, v54);
  v55 = [(UITargetedPreview *)self->_targetedDropPreview view];
  v56 = [v55 layer];
  [v56 zPosition];
  double v58 = v57;
  v59 = [(UIView *)self->_retargetingContainerView layer];
  [v59 setZPosition:v58];

  [(UIView *)self->_retargetingContainerView setAlpha:0.0];
  v60 = [_UIPortalView alloc];
  [(UIView *)v3 bounds];
  v61 = -[_UIPortalView initWithFrame:](v60, "initWithFrame:");
  [(_UIPortalView *)v61 setMatchesTransform:1];
  [(_UIPortalView *)v61 setMatchesAlpha:0];
  [(_UIPortalView *)v61 setMatchesPosition:1];
  [(_UIPortalView *)v61 setSourceView:self->_platterContainerView];
  [(_UIPortalView *)v61 setAllowsHitTesting:[(_UIDragSetDownItemAnimation *)self previewMode] == 4];
  [(UIView *)v3 insertSubview:v61 atIndex:0];
  retargetingContainerPortalView = self->_retargetingContainerPortalView;
  self->_retargetingContainerPortalView = v61;

  if ([(_UIDragSetDownItemAnimation *)self previewMode] == 4)
  {
    [(UIView *)self->_retargetingContainerView setAlpha:1.0];
    [(_UIPortalView *)self->_retargetingContainerPortalView setHidden:1];
    self->_reparentingCrossfadeComplete = 1;
  }
  else
  {
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __80___UIDragSetDownItemAnimation_reparentRetargetingContainerViewInTargetContainer__block_invoke;
    v63[3] = &unk_1E52D9F70;
    v63[4] = self;
    +[UIView performWithoutAnimation:v63];
  }
}

- (void)updateCurrentTargetFrame
{
  updatedAppPlatterView = self->_updatedAppPlatterView;
  if (!updatedAppPlatterView) {
    updatedAppPlatterView = self->_appPlatterView;
  }
  objc_super v24 = updatedAppPlatterView;
  updatedTargetedDropPreview = self->_updatedTargetedDropPreview;
  if (!updatedTargetedDropPreview) {
    updatedTargetedDropPreview = self->_targetedDropPreview;
  }
  CGFloat v5 = updatedTargetedDropPreview;
  CGFloat v6 = [(UITargetedPreview *)v5 target];
  uint64_t v7 = [v6 container];
  [v6 center];
  objc_msgSend(v7, "convertPoint:toCoordinateSpace:", self->_dropContainerView);
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [(_UIPlatterView *)v24 constrainSize];
  v13 = [(UITargetedDragPreview *)v5 _duiPreview];

  if (v12) {
    [v13 scaledSize];
  }
  else {
    [v13 unscaledSize];
  }
  double v16 = v14;
  double v17 = v15;

  v18 = [v6 container];
  [v18 _currentScreenScale];
  UIRectCenteredAboutPointScale(0.0, 0.0, v16, v17, v9, v11, v19);
  self->_targetFrame.origin.x = v20;
  self->_targetFrame.origin.y = v21;
  self->_targetFrame.size.width = v22;
  self->_targetFrame.size.height = v23;
}

- (double)estimatedFractionCompleteOfAnimation
{
  id v3 = [(UIView *)self->_platterContainerView layer];
  CGFloat v4 = [v3 presentationLayer];
  [v4 position];
  double v6 = v5;
  double v8 = v7;

  __asm { FMOV            V2.2D, #0.5 }
  [(UIView *)self->_dropContainerView convertPoint:self->_retargetingContainerView toCoordinateSpace:vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q2))];
  return (self->_initialDistanceFromTargetFrame - sqrt((v14 - v6) * (v14 - v6) + (v15 - v8) * (v15 - v8)))
       / self->_initialDistanceFromTargetFrame;
}

- (void)performTrackingAnimations:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = v4;
    if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_19_0, @"DNDSetDownDampingRatio"))double v6 = 0.85; {
    else
    }
      double v6 = *(double *)&qword_1EB257B38;
    if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257B40, @"DNDSetDownResponse")) {
      double v7 = 0.55;
    }
    else {
      double v7 = *(double *)&qword_1EB257B48;
    }
    ++self->_animationCount;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __57___UIDragSetDownItemAnimation_performTrackingAnimations___block_invoke;
    aBlock[3] = &unk_1E52DA040;
    id v12 = v5;
    double v8 = _Block_copy(aBlock);
    if (self->_hasStartedSpringAnimation)
    {
      double v9 = [(_UIDragSetDownItemAnimation *)self animationCompletionHandler];
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v8 tracking:v9 dampingRatioSmoothing:v6 responseSmoothing:0.0015 targetSmoothing:1.0 projectionDeceleration:1.0 animations:0.0 completion:0.0];
    }
    else
    {
      customSpringAnimationBehavior = self->_customSpringAnimationBehavior;
      double v9 = [(_UIDragSetDownItemAnimation *)self animationCompletionHandler];
      if (customSpringAnimationBehavior) {
        +[UIView _animateUsingSpringBehavior:customSpringAnimationBehavior tracking:1 animations:v8 completion:v9];
      }
      else {
        +[UIView _animateUsingSpringWithDampingRatio:1 response:v8 tracking:v9 initialDampingRatio:v6 initialResponse:v7 dampingRatioSmoothing:v6 responseSmoothing:v7 targetSmoothing:1.0 projectionDeceleration:1.0 animations:0.0 completion:0.0];
      }
    }
  }
}

- (void)previewContainerAnimationDidComplete
{
  v2 = [(_UIDragSetDownItemAnimation *)self animationCompletionHandler];
  v2[2](v2, 1, 0);
}

- (void)performSpringAnimations:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    ++self->_animationCount;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55___UIDragSetDownItemAnimation_performSpringAnimations___block_invoke;
    aBlock[3] = &unk_1E52DA040;
    id v13 = v4;
    double v5 = _Block_copy(aBlock);
    customSpringAnimationBehavior = self->_customSpringAnimationBehavior;
    if (customSpringAnimationBehavior)
    {
      double v7 = [(_UIDragSetDownItemAnimation *)self animationCompletionHandler];
      +[UIView _animateUsingSpringBehavior:customSpringAnimationBehavior tracking:0 animations:v5 completion:v7];
    }
    else
    {
      if (_UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_19_0, @"DNDSetDownDampingRatio"))double v8 = 0.85; {
      else
      }
        double v8 = *(double *)&qword_1EB257B38;
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257B40, @"DNDSetDownResponse")) {
        double v9 = 0.55;
      }
      else {
        double v9 = *(double *)&qword_1EB257B48;
      }
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257B50, @"DNDSetDownTargetResponse"))double v10 = 0.15; {
      else
      }
        double v10 = *(double *)&qword_1EB257B58;
      if (_UIInternalPreferenceUsesDefault_1((int *)&unk_1EB257B60, @"DNDSetDownProjectionFactor"))double v11 = 0.996; {
      else
      }
        double v11 = *(double *)&qword_1EB257B68;
      double v7 = [(_UIDragSetDownItemAnimation *)self animationCompletionHandler];
      +[UIView _animateUsingSpringWithDampingRatio:0 response:v5 tracking:v7 dampingRatioSmoothing:v8 responseSmoothing:v9 targetSmoothing:0.0 projectionDeceleration:0.0 animations:v10 completion:v11];
    }
  }
}

- (id)animationCompletionHandler
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __57___UIDragSetDownItemAnimation_animationCompletionHandler__block_invoke;
  aBlock[3] = &unk_1E52DA9D0;
  void aBlock[4] = self;
  v2 = _Block_copy(aBlock);
  return v2;
}

- (BOOL)needsReparenting
{
  if ([(_UIDragSetDownItemAnimation *)self previewMode] == 2) {
    return 0;
  }
  if ([(_UIDragSetDownItemAnimation *)self previewMode] == 3) {
    return _UIApplicationIsExtension() ^ 1;
  }
  return 1;
}

- (int64_t)previewMode
{
  updatedTargetedDropPreview = self->_updatedTargetedDropPreview;
  if (!updatedTargetedDropPreview) {
    updatedTargetedDropPreview = self->_targetedDropPreview;
  }
  id v4 = [(UITargetedDragPreview *)updatedTargetedDropPreview _duiPreview];
  int64_t v5 = [v4 previewMode];

  return v5;
}

- (void)updateAnimationTargeting
{
  if (!self->_reachedTarget && !self->_defaultAnimation)
  {
    if (self->_hasStartedSpringAnimation)
    {
      if ([(_UIDragSetDownItemAnimation *)self needsReparenting]
        && self->_hasStartedSpringAnimation
        && !self->_reparentingCrossfadeComplete)
      {
        id v3 = [(UITargetedPreview *)self->_targetedDropPreview target];
        id v4 = [v3 container];

        int64_t v5 = [(UIView *)self->_platterContainerView layer];
        double v6 = [v5 presentationLayer];

        if (v6)
        {
          double v7 = [(UIView *)self->_platterContainerView layer];
          double v8 = [v7 presentationLayer];
          [v8 position];
          double v10 = v9;
          double v12 = v11;

          -[UIView convertPoint:toCoordinateSpace:](self->_retargetingContainerView, "convertPoint:toCoordinateSpace:", v4, v10, v12);
          if (objc_msgSend(v4, "pointInside:withEvent:", 0))
          {
            self->_reparentingCrossfadeComplete = 1;
            int v13 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_DNDSetDownReparentingCrossfadeDuration, @"DNDSetDownReparentingCrossfadeDuration");
            double v14 = *(double *)&qword_1E8FD5648;
            if (v13) {
              double v14 = 0.2;
            }
            v38[4] = self;
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke;
            v39[3] = &unk_1E52D9F70;
            v39[4] = self;
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = __55___UIDragSetDownItemAnimation_updateAnimationTargeting__block_invoke_64;
            v38[3] = &unk_1E52DC3A0;
            +[UIView animateWithDuration:v39 animations:v38 completion:v14];
          }
        }
      }
      CGFloat x = self->_targetFrame.origin.x;
      CGFloat y = self->_targetFrame.origin.y;
      CGFloat width = self->_targetFrame.size.width;
      CGFloat height = self->_targetFrame.size.height;
      double targetCenterZ = self->_targetCenterZ;
      [(_UIDragSetDownItemAnimation *)self updateCurrentTargetFrame];
      __asm { FMOV            V2.2D, #0.5 }
      *(float64x2_t *)&self->_center.CGFloat x = vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q2));
      self->_center.z = self->_targetCenterZ;
      if (self->_hasStartedSpringAnimation && (!self->_almostToTarget || !self->_midwayToTarget))
      {
        [(_UIDragSetDownItemAnimation *)self estimatedFractionCompleteOfAnimation];
        double v26 = v25;
        if (!self->_midwayToTarget && v25 >= 0.5)
        {
          self->_midwayToTarget = 1;
          [(_UIDragSetDownItemAnimation *)self performSpringAnimations:self->_midpointHandler];
          nonAnimatedMidpointHandler = (void (**)(void))self->_nonAnimatedMidpointHandler;
          if (nonAnimatedMidpointHandler) {
            nonAnimatedMidpointHandler[2]();
          }
        }
        if (v26 >= 0.9)
        {
          double v28 = [(UIView *)self->_platterContainerView _velocityForKey:@"position"];
          [v28 CGPointValue];
          long double v30 = v29;
          long double v32 = v31;

          if (hypot(v30, v32) < 175.0)
          {
            self->_almostToTarget = 1;
            [(_UIDragSetDownItemAnimation *)self performSpringAnimations:self->_nearCompletionHandler];
          }
        }
      }
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      if (!CGRectEqualToRect(v40, self->_targetFrame)
        || vabdd_f64(targetCenterZ, self->_targetCenterZ) > 2.22044605e-16)
      {
        [(_UIDragSetDownItemAnimation *)self performTrackingAnimations:self->_positionHandler];
      }
    }
    else
    {
      platterContainerView = self->_platterContainerView;
      long double v34 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_initialVelocity.var0.x, self->_initialVelocity.var0.y);
      [(UIView *)platterContainerView _setVelocity:v34 forKey:@"position"];

      long double v35 = self->_platterContainerView;
      v36 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", self->_initialTargetVelocity.var0.x, self->_initialTargetVelocity.var0.y);
      [(UIView *)v35 _setTargetVelocity:v36 forKey:@"position"];

      v37 = [(UIView *)self->_platterContainerView layer];
      LODWORD(v36) = [v37 hasBeenCommitted];

      if (v36)
      {
        [(_UIDragSetDownItemAnimation *)self performTrackingAnimations:self->_positionHandler];
        [(_UIDragSetDownItemAnimation *)self performSpringAnimations:self->_morphHandler];
        self->_hasStartedSpringAnimation = 1;
      }
    }
  }
}

- (void)dirtyTargetedDropPreview
{
  if (!self->_defaultAnimation && !self->_almostToTarget)
  {
    id v4 = [(_UIDragSetDownItemAnimation *)self delegate];
    id v3 = [(_UIDragSetDownAnimationTarget *)self->_visualTarget _setDownAnimation:v4 updatedSetDownOfDragItem:self->_item preview:self->_targetedDropPreview];
    [(_UIDragSetDownItemAnimation *)self updateTargetedDropPreview:v3];
  }
}

- (void)updateTargetedDropPreview:(id)a3
{
  id v5 = a3;
  double v6 = v5;
  if (!self->_defaultAnimation && !self->_almostToTarget && !self->_updatedTargetedDropPreview)
  {
    if (self->_midwayToTarget)
    {
      v26.origin.CGFloat x = _targetFrameForTargetedPreviewInContainerView(v5, self->_dropContainerView);
      if (!CGRectIsNull(v26))
      {
        objc_storeStrong((id *)&self->_updatedTargetedDropPreview, a3);
        double v7 = [v6 view];
        double v8 = [v6 _duiPreview];
        double v9 = [v7 window];
        [v8 setHidesSourceView:v9 == 0];

        double v10 = [v7 window];

        if (!v10)
        {
          double v11 = [v6 target];
          double v12 = [v11 container];
          int v13 = [(UIView *)self->_retargetingContainerView superview];

          double v14 = [v6 target];
          double v15 = [v14 container];
          double v16 = v15;
          if (v12 == v13) {
            [v15 _addSubview:v7 positioned:-3 relativeTo:self->_retargetingContainerView];
          }
          else {
            [v15 addSubview:v7];
          }

          [v7 setAlpha:0.0];
          self->_updatedPreviewWasAdded = 1;
        }
        double v19 = [[_UIPlatterView alloc] initWithDUIPreview:v8];
        [(_UIPlatterView *)v19 setTransformAppliedExternally:1];
        [(_UIPlatterView *)v19 setSourceView:v7];
        [(UIView *)v19 setAlpha:0.0];
        [(_UIPlatterView *)v19 setLifted:0];
        [(_UIPlatterView *)v19 setShadowVisible:0];
        [(_UIPlatterView *)v19 setBackgroundVisible:0];
        [(_UIPlatterContainerView *)self->_platterContainerView setUpdatedTarget:v19];

        updatedAppPlatterView = self->_updatedAppPlatterView;
        self->_updatedAppPlatterView = v19;

        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke_2;
        v21[3] = &unk_1E52D9F70;
        void v21[4] = self;
        [(_UIDragSetDownItemAnimation *)self performSpringAnimations:v21];
      }
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __57___UIDragSetDownItemAnimation_updateTargetedDropPreview___block_invoke;
      aBlock[3] = &unk_1E52D9960;
      objc_copyWeak(&v24, &location);
      id v23 = v6;
      double v17 = _Block_copy(aBlock);
      id nonAnimatedMidpointHandler = self->_nonAnimatedMidpointHandler;
      self->_id nonAnimatedMidpointHandler = v17;

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

- (void)updateDroppedItem:(id)a3
{
  id v4 = a3;
  [(_UIDragSetDownItemAnimation *)self _setCenterAndVelocityFromDroppedItem:v4];
  [v4 rotation];
  double v6 = v5;
  memset(&v11, 0, sizeof(v11));
  if (v4) {
    [v4 appliedTransform];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }
  CGAffineTransformDecompose(&v11, &v10);
  double v7 = v6 + v11.rotation;
  -[UIView setCenter:](self->_platterContainerView, "setCenter:", self->_center.x, self->_center.y);
  [(_UIPlatterContainerView *)self->_platterContainerView applyRotation:v7];
  double z = self->_center.z;
  double v9 = [(UIView *)self->_platterContainerView layer];
  [v9 setZPosition:z];

  [(_UIPlatterView *)self->_appPlatterView setStackRotation:v7];
  [(_UIPlatterView *)self->_druidPlatterView setStackRotation:v7];
  -[UIView setCenter:](self->_defaultPlatterView, "setCenter:", self->_center.x, self->_center.y);
}

- (void)_setCenterAndVelocityFromDroppedItem:(id)a3
{
  id v4 = a3;
  [v4 center];
  self->_center.CGFloat x = v5.f64[0];
  self->_center.CGFloat y = v6;
  self->_center.double z = 0.0;
  p_initialVelocitCGFloat y = &self->_initialVelocity;
  if (v4)
  {
    [v4 velocity3D];
    *(_OWORD *)&p_initialVelocity->var0.CGFloat x = v14;
    *(_OWORD *)&self->_initialVelocity.var0.double z = v15;
    [v4 targetVelocity3D];
    float64x2_t v5 = *(float64x2_t *)&self->_center.x;
  }
  else
  {
    *(_OWORD *)&p_initialVelocity->var0.CGFloat x = 0u;
    *(_OWORD *)&self->_initialVelocity.var0.double z = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v5.f64[1] = v6;
  }
  *(_OWORD *)&self->_initialTargetVelocity.var0.CGFloat x = v14;
  *(_OWORD *)&self->_initialTargetVelocity.var0.double z = v15;
  __asm { FMOV            V3.2D, #0.5 }
  float64x2_t v13 = vsubq_f64(vaddq_f64((float64x2_t)self->_targetFrame.origin, vmulq_f64((float64x2_t)self->_targetFrame.size, _Q3)), v5);
  self->_initialDistanceFromTargetFrame = sqrt(vaddvq_f64(vmulq_f64(v13, v13)));
}

- (UIDragItem)item
{
  return self->_item;
}

- (_DUIVisibleDroppedItem)droppedItem
{
  return self->_droppedItem;
}

- (BOOL)reachedTarget
{
  return self->_reachedTarget;
}

- (BOOL)done
{
  return self->_done;
}

- (UIViewSpringAnimationBehaviorDescribing)customSpringAnimationBehavior
{
  return self->_customSpringAnimationBehavior;
}

- (void)setCustomSpringAnimationBehavior:(id)a3
{
}

- (_UIDragSetDownItemAnimationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragSetDownItemAnimationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)dropContainerView
{
  return self->_dropContainerView;
}

- (void)setDropContainerView:(id)a3
{
}

- (_UIDragSetDownAnimationTarget)visualTarget
{
  return self->_visualTarget;
}

- (void)setVisualTarget:(id)a3
{
}

- (UITargetedDragPreview)targetedDropPreview
{
  return self->_targetedDropPreview;
}

- (void)setTargetedDropPreview:(id)a3
{
}

- (UITargetedDragPreview)updatedTargetedDropPreview
{
  return self->_updatedTargetedDropPreview;
}

- (void)setUpdatedTargetedDropPreview:(id)a3
{
}

- (CAPoint3D)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  double z = self->_center.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CAPoint3D)a3
{
  self->_center = a3;
}

- (double)initialDistanceFromTargetFrame
{
  return self->_initialDistanceFromTargetFrame;
}

- (void)setInitialDistanceFromTargetFrame:(double)a3
{
  self->_initialDistanceFromTargetFrame = a3;
}

- (double)targetCenterZ
{
  return self->_targetCenterZ;
}

- (void)setTargetCenterZ:(double)a3
{
  self->_double targetCenterZ = a3;
}

- (CGRect)targetFrame
{
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  double height = self->_targetFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  self->_targetFrame = a3;
}

- (BOOL)defaultAnimation
{
  return self->_defaultAnimation;
}

- (void)setDefaultAnimation:(BOOL)a3
{
  self->_defaultAnimation = a3;
}

- (BOOL)sourceAnimation
{
  return self->_sourceAnimation;
}

- (void)setSourceAnimation:(BOOL)a3
{
  self->_sourceAnimation = a3;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  return self->_propertyAnimator;
}

- (void)setPropertyAnimator:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (BOOL)hasStartedSpringAnimation
{
  return self->_hasStartedSpringAnimation;
}

- (void)setHasStartedSpringAnimation:(BOOL)a3
{
  self->_hasStartedSpringAnimation = a3;
}

- (BOOL)midwayToTarget
{
  return self->_midwayToTarget;
}

- (void)setMidwayToTarget:(BOOL)a3
{
  self->_midwayToTarget = a3;
}

- (BOOL)almostToTarget
{
  return self->_almostToTarget;
}

- (void)setAlmostToTarget:(BOOL)a3
{
  self->_almostToTarget = a3;
}

- (BOOL)reparentingCrossfadeComplete
{
  return self->_reparentingCrossfadeComplete;
}

- (void)setReparentingCrossfadeComplete:(BOOL)a3
{
  self->_reparentingCrossfadeComplete = a3;
}

- (BOOL)updatedPreviewWasAdded
{
  return self->_updatedPreviewWasAdded;
}

- (void)setUpdatedPreviewWasAdded:(BOOL)a3
{
  self->_updatedPreviewWasAdded = a3;
}

- (int)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(int)a3
{
  self->_animationCount = a3;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)initialVelocity
{
  long long v3 = *(_OWORD *)&self->_initialVelocity.var0.x;
  long long v4 = *(_OWORD *)&self->_initialVelocity.var0.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setInitialVelocity:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self->_initialVelocity.var0.double x = *v3;
  *(_OWORD *)&self->_initialVelocity.var0.double z = v4;
}

- ($FE0FA7B0FBCE76F76F882EF47F3AD961)initialTargetVelocity
{
  long long v3 = *(_OWORD *)&self->_initialTargetVelocity.var0.x;
  long long v4 = *(_OWORD *)&self->_initialTargetVelocity.var0.z;
  _OWORD *v2 = v3;
  v2[1] = v4;
  result.var0.var1 = *(double *)&v4;
  result.var0.var0 = *(double *)&v3;
  return result;
}

- (void)setInitialTargetVelocity:(id)a3
{
  long long v4 = v3[1];
  *(_OWORD *)&self->_initialTargetVelocity.var0.double x = *v3;
  *(_OWORD *)&self->_initialTargetVelocity.var0.double z = v4;
}

- (UIView)retargetingContainerView
{
  return self->_retargetingContainerView;
}

- (void)setRetargetingContainerView:(id)a3
{
}

- (_UIPortalView)retargetingContainerPortalView
{
  return self->_retargetingContainerPortalView;
}

- (void)setRetargetingContainerPortalView:(id)a3
{
}

- (_UIPlatterView)appPlatterView
{
  return self->_appPlatterView;
}

- (void)setAppPlatterView:(id)a3
{
}

- (_UIPlatterView)updatedAppPlatterView
{
  return self->_updatedAppPlatterView;
}

- (void)setUpdatedAppPlatterView:(id)a3
{
}

- (_UIPlatterView)druidPlatterView
{
  return self->_druidPlatterView;
}

- (void)setDruidPlatterView:(id)a3
{
}

- (_UIPlatterContainerView)platterContainerView
{
  return self->_platterContainerView;
}

- (void)setPlatterContainerView:(id)a3
{
}

- (_UIPlatterView)defaultPlatterView
{
  return self->_defaultPlatterView;
}

- (void)setDefaultPlatterView:(id)a3
{
}

- (id)positionHandler
{
  return self->_positionHandler;
}

- (void)setPositionHandler:(id)a3
{
}

- (id)morphHandler
{
  return self->_morphHandler;
}

- (void)setMorphHandler:(id)a3
{
}

- (id)midpointHandler
{
  return self->_midpointHandler;
}

- (void)setMidpointHandler:(id)a3
{
}

- (id)nonAnimatedMidpointHandler
{
  return self->_nonAnimatedMidpointHandler;
}

- (void)setNonAnimatedMidpointHandler:(id)a3
{
}

- (id)nearCompletionHandler
{
  return self->_nearCompletionHandler;
}

- (void)setNearCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_nearCompletionHandler, 0);
  objc_storeStrong(&self->_nonAnimatedMidpointHandler, 0);
  objc_storeStrong(&self->_midpointHandler, 0);
  objc_storeStrong(&self->_morphHandler, 0);
  objc_storeStrong(&self->_positionHandler, 0);
  objc_storeStrong((id *)&self->_defaultPlatterView, 0);
  objc_storeStrong((id *)&self->_platterContainerView, 0);
  objc_storeStrong((id *)&self->_druidPlatterView, 0);
  objc_storeStrong((id *)&self->_updatedAppPlatterView, 0);
  objc_storeStrong((id *)&self->_appPlatterView, 0);
  objc_storeStrong((id *)&self->_retargetingContainerPortalView, 0);
  objc_storeStrong((id *)&self->_retargetingContainerView, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_updatedTargetedDropPreview, 0);
  objc_storeStrong((id *)&self->_targetedDropPreview, 0);
  objc_storeStrong((id *)&self->_visualTarget, 0);
  objc_storeStrong((id *)&self->_dropContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_customSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_droppedItem, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

@end