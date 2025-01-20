@interface SBMedusaWindowDragGestureDestinationModifier
- (BOOL)_draggingCenterWindow;
- (BOOL)_draggingFullScreenApp;
- (BOOL)_draggingSlideOverApp;
- (BOOL)_draggingSplitViewApp;
- (BOOL)_isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4;
- (BOOL)_isDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5;
- (BOOL)_shouldMinimizeOrEnterSplitHomeScreen;
- (BOOL)hasEnteredPlatterZone;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)_leftFloatingZoneForCenterWindow;
- (CGRect)_rightFloatingZoneForCenterWindow;
- (CGRect)_universalCenterZone;
- (CGSize)_fullscreenActivationRegionSize;
- (SBAppLayout)currentAppLayout;
- (SBAppLayout)proposedAppLayout;
- (SBMedusaWindowDragGestureDestinationModifier)initWithSelectedLeafAppLayout:(id)a3 initialMainAppLayout:(id)a4 initialFloatingAppLayout:(id)a5 initialFloatingConfiguration:(int64_t)a6 delegate:(id)a7;
- (double)_contentDraggingCommandeerWidth;
- (double)_contentDraggingFloatingActivationWidth;
- (double)_contentDraggingSideActivationWidth;
- (double)_dismissLeftBoundary;
- (double)_dismissRightBoundary;
- (double)_sideActivationGutterSize;
- (id)_transitionRequestForDestination:(unint64_t)a3 complete:(BOOL)a4;
- (id)_updateForWindowDrag;
- (id)handleGestureEvent:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)proposedAppLayoutForWindowDrag;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)_layoutRoleForDraggedApp;
- (unint64_t)currentDestination;
- (void)_displayLinkFired:(id)a3;
- (void)_updateCurrentDropAction;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBMedusaWindowDragGestureDestinationModifier

- (SBMedusaWindowDragGestureDestinationModifier)initWithSelectedLeafAppLayout:(id)a3 initialMainAppLayout:(id)a4 initialFloatingAppLayout:(id)a5 initialFloatingConfiguration:(int64_t)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  v17 = [(SBSwitcherModifier *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_selectedLeafAppLayout, a3);
    objc_storeStrong((id *)&v18->_initialMainAppLayout, a4);
    objc_storeStrong((id *)&v18->_initialFloatingAppLayout, a5);
    v18->_initialFloatingConfiguration = a6;
    objc_storeStrong((id *)&v18->_currentAppLayout, a4);
    objc_storeStrong((id *)&v18->_proposedAppLayout, a4);
    objc_storeWeak((id *)&v18->_dragDestinationDelegate, v16);
    v18->_gesturePhase = 0;
    v18->_currentDestination = 0;
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
    self->_supportsMedusa = [(SBMedusaWindowDragGestureDestinationModifier *)self displayItemSupportsMedusa:v5];
    self->_supportsCenterRole = [(SBMedusaWindowDragGestureDestinationModifier *)self displayItemSupportsCenterRole:v5];
  }
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  v5 = [(SBSwitcherModifier *)&v31 handleGestureEvent:v4];
  self->_gesturePhase = [v4 phase];
  [v4 locationInContainerView];
  self->_location.x = v6;
  self->_location.y = v7;
  [v4 translationInContainerView];
  self->_translation.x = v8;
  self->_translation.y = v9;
  [v4 averageTouchVelocityOverTimeDuration:0.0416666667];
  self->_velocity.x = v10;
  self->_velocity.y = v11;
  pendingEnterPlatterZoneResponse = self->_pendingEnterPlatterZoneResponse;
  if (pendingEnterPlatterZoneResponse)
  {
    uint64_t v13 = SBAppendSwitcherModifierResponse(pendingEnterPlatterZoneResponse, v5);

    id v14 = self->_pendingEnterPlatterZoneResponse;
    self->_pendingEnterPlatterZoneResponse = 0;

    v5 = (void *)v13;
  }
  if ([v4 phase] == 1)
  {
    id v15 = [(SBMedusaWindowDragGestureDestinationModifier *)self draggingAppLayoutsForWindowDrag];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __67__SBMedusaWindowDragGestureDestinationModifier_handleGestureEvent___block_invoke;
    v30[3] = &unk_1E6AF4B60;
    v30[4] = self;
    id v16 = objc_msgSend(v15, "bs_firstObjectPassingTest:", v30);

    uint64_t v17 = [v16 preferredDisplayOrdinal];
    uint64_t v18 = [(SBMedusaWindowDragGestureDestinationModifier *)self displayOrdinal];
    self->_dragBeganInOtherSwitcher = v17 != v18;
    self->_dragBeganInOurSwitcher = v17 == v18;
  }
  v19 = [(SBMedusaWindowDragGestureDestinationModifier *)self _updateForWindowDrag];
  objc_super v20 = SBAppendSwitcherModifierResponse(v19, v5);

  int v21 = [(SBAppLayout *)self->_proposedAppLayout containsAllItemsFromAppLayout:self->_selectedLeafAppLayout];
  [(SBMedusaWindowDragGestureDestinationModifier *)self _updateCurrentDropAction];
  int v22 = [(SBAppLayout *)self->_proposedAppLayout containsAllItemsFromAppLayout:self->_selectedLeafAppLayout];
  if ([v4 phase] == 2 && v21 != v22)
  {
    v23 = [(SBMedusaWindowDragGestureDestinationModifier *)self _transitionRequestForDestination:self->_currentDestination complete:0];
    v24 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v23 gestureInitiated:1];
    uint64_t v25 = SBAppendSwitcherModifierResponse(v24, v20);

    objc_super v20 = (void *)v25;
  }
  if ([v4 phase] == 3)
  {
    v26 = [(SBMedusaWindowDragGestureDestinationModifier *)self _transitionRequestForDestination:self->_currentDestination complete:1];
    v27 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v26 gestureInitiated:1];
    uint64_t v28 = SBAppendSwitcherModifierResponse(v27, v20);

    objc_super v20 = (void *)v28;
  }

  return v20;
}

uint64_t __67__SBMedusaWindowDragGestureDestinationModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  id v4 = [v2 itemForLayoutRole:1];
  uint64_t v5 = [v3 containsItem:v4];

  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (*(_WORD *)&self->_isResizingToFullScreen)
  {
    [v4 progress];
    self->_isResizingToFullScreen = BSFloatIsOne() ^ 1;
    CGFloat v6 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
    [v6 dropAnimationUnblurThresholdPercentage];
    self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();
  }
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  CGFloat v7 = [(SBSwitcherModifier *)&v9 handleResizeProgressEvent:v5];

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if (self->_isResizingToFullScreen
    && [(SBAppLayout *)self->_currentAppLayout isFullScreen]
    && ([v6 itemForLayoutRole:1],
        CGFloat v7 = objc_claimAutoreleasedReturnValue(),
        [(SBAppLayout *)self->_currentAppLayout itemForLayoutRole:1],
        CGFloat v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 isEqual:v8],
        v8,
        v7,
        v9)
    || self->_gesturePhase == 3 && self->_currentDestination - 11 <= 1)
  {
    unsigned __int8 v10 = !self->_hasResizedEnoughToUnblur;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
    unsigned __int8 v10 = [(SBMedusaWindowDragGestureDestinationModifier *)&v12 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return v10;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBMedusaWindowDragGestureDestinationModifier;
  CGFloat v7 = [(SBMedusaWindowDragGestureDestinationModifier *)&v18 resizeProgressNotificationsForLayoutRole:a3 inAppLayout:v6];
  if (self->_isResizingToFullScreen)
  {
    if ([(SBAppLayout *)self->_currentAppLayout isFullScreen])
    {
      CGFloat v8 = [v6 itemForLayoutRole:1];
      int v9 = [(SBAppLayout *)self->_currentAppLayout itemForLayoutRole:1];
      int v10 = [v8 isEqual:v9];

      if (v10)
      {
        CGFloat v11 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
        [v11 dropAnimationUnblurThresholdPercentage];
        double v13 = v12;

        v19[0] = &unk_1F3348B08;
        id v14 = [NSNumber numberWithDouble:v13];
        v19[1] = v14;
        v19[2] = &unk_1F3348B18;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
        uint64_t v16 = [v7 setByAddingObjectsFromArray:v15];

        CGFloat v7 = (void *)v16;
      }
    }
  }

  return v7;
}

- (id)proposedAppLayoutForWindowDrag
{
  return self->_proposedAppLayout;
}

- (void)_displayLinkFired:(id)a3
{
  if (self->_gesturePhase == 2)
  {
    p_velocity = &self->_velocity;
    [(SBMedusaWindowDragGestureDestinationModifier *)self gestureHandlingModifier:self averageVelocityOverDuration:0.0416666667];
    p_velocity->x = v5;
    p_velocity->y = v6;
    CGFloat v7 = [(SBMedusaWindowDragGestureDestinationModifier *)self _updateForWindowDrag];
    if (self->_enteredPlatterZone)
    {
      CGFloat v8 = v7;
      objc_storeStrong((id *)&self->_pendingEnterPlatterZoneResponse, v7);
      [(SBMedusaWindowDragGestureDestinationModifier *)self gestureHandlingModifierRequestsUpdate:self];
      CGFloat v7 = v8;
      if (self->_pendingEnterPlatterZoneResponse == v8)
      {
        self->_pendingEnterPlatterZoneResponse = 0;

        CGFloat v7 = v8;
      }
    }
  }
}

- (id)_updateForWindowDrag
{
  if (self->_enteredPlatterZone) {
    goto LABEL_2;
  }
  if (!self->_displayLink)
  {
    CGFloat v5 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__displayLinkFired_];
    displayLink = self->_displayLink;
    self->_displayLink = v5;

    CGFloat v7 = self->_displayLink;
    CGFloat v8 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v7 addToRunLoop:v8 forMode:*MEMORY[0x1E4F1C4B0]];

    self->_unint64_t dragPauseCounter = 0;
  }
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double x = self->_location.x;
  double y = self->_location.y;
  double v19 = self->_translation.x;
  [(SBMedusaWindowDragGestureDestinationModifier *)self _contentDraggingCommandeerWidth];
  double v21 = v20;
  if (BSFloatLessThanFloat()
    && (![(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp]
     && -[SBMedusaWindowDragGestureDestinationModifier _isDragOverFullscreenRegionAtLocation:inBounds:](self, "_isDragOverFullscreenRegionAtLocation:inBounds:", x, y, v10, v12, v14, v16)|| -[SBMedusaWindowDragGestureDestinationModifier _layoutRoleForDraggedApp](self, "_layoutRoleForDraggedApp") == 3&& -[SBMedusaWindowDragGestureDestinationModifier _isDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:](self, "_isDragOverSideGutterRegionsAtLocation:inBounds:totalContentDragGutterWidth:", x, y, v10, v12, v14, v16, v21)))
  {
    ++self->_dragPauseCounter;
  }
  else
  {
    self->_unint64_t dragPauseCounter = 0;
  }
  double v22 = SBScreenMaximumFramesPerSecond() * 0.05;
  unint64_t dragPauseCounter = self->_dragPauseCounter;
  self->_enteredPlatterZone = dragPauseCounter > (uint64_t)v22;
  if (dragPauseCounter <= (uint64_t)v22)
  {
    v36.origin.double x = v10;
    v36.origin.double y = v12;
    v36.size.width = v14;
    v36.size.height = v16;
    v35.double x = x;
    v35.double y = y;
    if (CGRectContainsPoint(v36, v35))
    {
      if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp])
      {
        BOOL v24 = fabs(v19) > 150.0;
        if (y > 150.0) {
          BOOL v24 = 1;
        }
      }
      else if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSplitViewApp])
      {
        BOOL v24 = fabs(v19) > 150.0;
        if (y <= 150.0) {
          BOOL v24 = 0;
        }
      }
      else
      {
        if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingCenterWindow]) {
          BOOL v25 = fabs(v19) <= 150.0;
        }
        else {
          BOOL v25 = y <= 150.0;
        }
        BOOL v24 = !v25;
      }
      self->_enteredPlatterZone = v24;
      if (!v24) {
        goto LABEL_2;
      }
    }
    else if (!self->_enteredPlatterZone)
    {
LABEL_2:
      v2 = 0;
      goto LABEL_3;
    }
  }
  [(CADisplayLink *)self->_displayLink invalidate];
  v26 = self->_displayLink;
  self->_displayLink = 0;

  v2 = 0;
  if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSplitViewApp])
  {
    v27 = [(SBMedusaWindowDragGestureDestinationModifier *)self _transitionRequestForDestination:7 complete:0];
    uint64_t v28 = [v27 appLayout];
    currentAppLayout = self->_currentAppLayout;
    self->_currentAppLayout = v28;

    self->_isResizingToFullScreen = 1;
    self->_hasResizedEnoughToUnblur = 0;
    initialMainAppLayout = self->_initialMainAppLayout;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __68__SBMedusaWindowDragGestureDestinationModifier__updateForWindowDrag__block_invoke;
    v33[3] = &unk_1E6AF4B38;
    v33[4] = self;
    objc_super v31 = [(SBAppLayout *)initialMainAppLayout appLayoutWithItemsPassingTest:v33];
    if (v31)
    {
      v32 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      [(SBSwitcherTransitionRequest *)v32 setAppLayout:v31];
      [(SBSwitcherTransitionRequest *)v32 setSceneUpdatesOnly:1];
      v2 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v32 gestureInitiated:1];
    }
    else
    {
      v2 = 0;
    }
  }
LABEL_3:
  return v2;
}

BOOL __68__SBMedusaWindowDragGestureDestinationModifier__updateForWindowDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 248) containsItem:v3]) {
    BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 248) layoutRoleForItem:v3] != 3;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_updateCurrentDropAction
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  CGFloat v78 = v3;
  CGFloat v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double x = self->_location.x;
  double y = self->_location.y;
  double v13 = self->_velocity.x;
  double v12 = self->_velocity.y;
  double v79 = y + v12 * 0.15;
  int v14 = [(SBMedusaWindowDragGestureDestinationModifier *)self isRTLEnabled];
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke;
  v101[3] = &unk_1E6AFE788;
  v101[4] = self;
  double v72 = v7 * 0.5;
  double v80 = x + v13 * 0.15;
  BOOL v15 = v80 < v7 * 0.5;
  *(double *)&v101[5] = v13;
  *(double *)&v101[6] = v12;
  if (v14) {
    BOOL v15 = x + v13 * 0.15 >= v7 * 0.5;
  }
  *(CGFloat *)&v101[7] = v78;
  *(CGFloat *)&v101[8] = v5;
  if (v15) {
    uint64_t v16 = 6;
  }
  else {
    uint64_t v16 = 7;
  }
  *(double *)&v101[9] = v7;
  *(CGFloat *)&v101[10] = v9;
  *(double *)&v101[11] = x;
  *(double *)&v101[12] = y;
  uint64_t v17 = MEMORY[0x1D948C7A0](v101);
  BOOL supportsMedusa = self->_supportsMedusa;
  char v19 = [(SBMedusaWindowDragGestureDestinationModifier *)self isInMedusaCapableSpace];
  int v20 = [(SBMedusaWindowDragGestureDestinationModifier *)self isMedusaCapable];
  [(SBMedusaWindowDragGestureDestinationModifier *)self _fullscreenActivationRegionSize];
  SBRectWithSize();
  UIRectCenteredXInRect();
  v102.double x = x;
  v102.double y = y;
  BOOL v81 = CGRectContainsPoint(v107, v102);
  v77 = (uint64_t (**)(void))v17;
  char v73 = v19;
  int v74 = v20;
  BOOL v75 = supportsMedusa;
  if (self->_supportsCenterRole)
  {
    [(SBMedusaWindowDragGestureDestinationModifier *)self _universalCenterZone];
    v103.double x = x;
    v103.double y = y;
    BOOL v21 = CGRectContainsPoint(v108, v103);
    if (self->_supportsCenterRole)
    {
      [(SBMedusaWindowDragGestureDestinationModifier *)self _leftFloatingZoneForCenterWindow];
      v104.double x = x;
      v104.double y = y;
      BOOL v22 = CGRectContainsPoint(v109, v104);
      if (self->_supportsCenterRole)
      {
        [(SBMedusaWindowDragGestureDestinationModifier *)self _rightFloatingZoneForCenterWindow];
        v105.double x = x;
        v105.double y = y;
        BOOL v23 = CGRectContainsPoint(v110, v105);
        goto LABEL_13;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
    BOOL v21 = 0;
  }
  BOOL v23 = 0;
LABEL_13:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDestinationDelegate);
  uint64_t v25 = [(SBMedusaWindowDragGestureDestinationModifier *)self switcherInterfaceOrientation];
  [(SBMedusaWindowDragGestureDestinationModifier *)self _sideActivationGutterSize];
  double v27 = v26 + v26;
  id v76 = WeakRetained;
  [WeakRetained platterScaleForWindowDragGestureDestinationModifier:self];
  double v29 = v28;
  [(SBMedusaWindowDragGestureDestinationModifier *)self floatingApplicationFrameInInterfaceOrientation:v25 floatingConfiguration:self->_initialFloatingConfiguration];
  double v31 = v27 + v29 * v30 * 0.5;
  LOBYTE(v25) = [(SBMedusaWindowDragGestureDestinationModifier *)self isSplitViewSupported];
  v32 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:"itemForLayoutRole:"];
  v33 = [(SBMedusaWindowDragGestureDestinationModifier *)self proposedAppLayoutForWindowDrag];
  char v34 = [v33 containsItem:v32];

  CGPoint v35 = [(SBMedusaWindowDragGestureDestinationModifier *)self proposedAppLayoutsForWindowDrag];
  v99[0] = MEMORY[0x1E4F143A8];
  v99[1] = 3221225472;
  v99[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_2;
  v99[3] = &unk_1E6AF4B60;
  id v100 = v32;
  id v36 = v32;
  unsigned __int8 v37 = objc_msgSend(v35, "bs_containsObjectPassingTest:", v99);

  BOOL dragBeganInOurSwitcher = self->_dragBeganInOurSwitcher;
  v39 = self->_currentAppLayout;
  v82[0] = MEMORY[0x1E4F143A8];
  v82[1] = 3221225472;
  v82[2] = __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_3;
  v82[3] = &unk_1E6AFE7B0;
  v82[4] = self;
  BOOL v94 = v81;
  char v95 = v25;
  double v84 = v80;
  double v85 = v79;
  CGFloat v86 = v78;
  CGFloat v87 = v5;
  double v88 = v7;
  CGFloat v89 = v9;
  v40 = v39;
  v83 = v40;
  double v90 = x;
  double v91 = y;
  BOOL v96 = v22;
  BOOL v97 = v23;
  double v92 = v31;
  BOOL v98 = v21;
  uint64_t v93 = v16;
  uint64_t v41 = MEMORY[0x1D948C7A0](v82);
  v42 = (uint64_t (**)(void))v41;
  if (!self->_dragBeganInOtherSwitcher)
  {
    if ((dragBeganInOurSwitcher & ~v34 & v37) == 1)
    {
      v46 = v77;
      if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingCenterWindow])
      {
        unint64_t v45 = 13;
LABEL_40:
        v47 = v76;
        goto LABEL_72;
      }
      v47 = v76;
      if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSlideOverApp])
      {
LABEL_31:
        unint64_t v45 = 0;
        goto LABEL_72;
      }
      if (![(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSplitViewApp])
      {
        unint64_t v45 = 14;
        goto LABEL_72;
      }
      int64_t v49 = [(SBMedusaWindowDragGestureDestinationModifier *)self _layoutRoleForDraggedApp];
      uint64_t v50 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
      uint64_t v51 = 2;
      if (v50 == 1) {
        uint64_t v51 = 1;
      }
      BOOL v52 = v49 == v51;
      uint64_t v53 = 11;
LABEL_45:
      if (v52) {
        unint64_t v45 = v53 + 1;
      }
      else {
        unint64_t v45 = v53;
      }
      goto LABEL_72;
    }
    v46 = v77;
    if (v75 && ((v74 ^ 1) & 1) == 0)
    {
      if (v73)
      {
        if (self->_enteredPlatterZone)
        {
          unint64_t v45 = (*(uint64_t (**)(uint64_t))(v41 + 16))(v41);
          goto LABEL_40;
        }
        int64_t v55 = [(SBMedusaWindowDragGestureDestinationModifier *)self _layoutRoleForDraggedApp];
        v47 = v76;
        if (v55 != 4)
        {
          if (v55 == 3) {
            goto LABEL_70;
          }
          if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp]) {
            goto LABEL_31;
          }
          if (![(SBMedusaWindowDragGestureDestinationModifier *)self _shouldMinimizeOrEnterSplitHomeScreen]&& self->_gesturePhase >= 3)
          {
            double x = v80;
          }
          double v56 = v7 * 0.5;
          unint64_t currentDestination = self->_currentDestination;
          if (currentDestination == 5)
          {
            double v58 = -100.0;
          }
          else
          {
            if (currentDestination != 4) {
              goto LABEL_77;
            }
            double v58 = 100.0;
          }
          double v56 = v72 + v58;
LABEL_77:
          [(SBMedusaWindowDragGestureDestinationModifier *)self _dismissRightBoundary];
          if (x > v62)
          {
            int64_t v63 = [(SBMedusaWindowDragGestureDestinationModifier *)self _layoutRoleForDraggedApp];
            uint64_t v64 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
            uint64_t v65 = 2;
            if (v64 == 1) {
              uint64_t v65 = 1;
            }
            if (v63 == v65)
            {
              unint64_t v45 = 12;
              goto LABEL_72;
            }
          }
          [(SBMedusaWindowDragGestureDestinationModifier *)self _dismissLeftBoundary];
          if (x < v66)
          {
            int64_t v67 = [(SBMedusaWindowDragGestureDestinationModifier *)self _layoutRoleForDraggedApp];
            uint64_t v68 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
            uint64_t v69 = 2;
            if (v68 != 1) {
              uint64_t v69 = 1;
            }
            if (v67 == v69)
            {
              unint64_t v45 = 11;
              goto LABEL_72;
            }
          }
          int v70 = [(SBMedusaWindowDragGestureDestinationModifier *)self isRTLEnabled];
          BOOL v71 = x < v56;
          if (v70) {
            BOOL v71 = x >= v56;
          }
          BOOL v52 = !v71;
          uint64_t v53 = 4;
          goto LABEL_45;
        }
LABEL_69:
        unint64_t v45 = 10;
        goto LABEL_72;
      }
      if (![(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp])
      {
        if (self->_enteredPlatterZone)
        {
          if (v81) {
            unint64_t v45 = 1;
          }
          else {
            unint64_t v45 = 10;
          }
          v47 = v76;
          if (v81 || v21) {
            goto LABEL_72;
          }
          goto LABEL_70;
        }
        v47 = v76;
        if ([(SBMedusaWindowDragGestureDestinationModifier *)self _layoutRoleForDraggedApp] != 4)
        {
LABEL_70:
          uint64_t v48 = v46[2](v46);
          goto LABEL_71;
        }
        goto LABEL_69;
      }
    }
    unint64_t v45 = !v81;
    goto LABEL_40;
  }
  v111.origin.double x = v78;
  v111.origin.double y = v5;
  v111.size.width = v7;
  v111.size.height = v9;
  v106.double x = x;
  v106.double y = y;
  if (!CGRectContainsPoint(v111, v106))
  {
    unint64_t v45 = 0;
LABEL_24:
    v47 = v76;
    v46 = v77;
    goto LABEL_72;
  }
  v43 = [(SBAppLayout *)v40 allItems];
  uint64_t v44 = [v43 count];

  unint64_t v45 = 1;
  if (!v44 || !v75) {
    goto LABEL_24;
  }
  v47 = v76;
  v46 = v77;
  if ((v74 ^ 1)) {
    goto LABEL_72;
  }
  if (v73)
  {
    uint64_t v48 = v42[2](v42);
LABEL_71:
    unint64_t v45 = v48;
    goto LABEL_72;
  }
  if (!self->_enteredPlatterZone)
  {
    v54 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
    if ([(SBMedusaWindowDragGestureDestinationModifier *)self displayItemSupportsCenterRole:v54])unint64_t v45 = 10; {
    else
    }
      unint64_t v45 = v77[2](v77);

    goto LABEL_72;
  }
  if (v81) {
    unint64_t v45 = 1;
  }
  else {
    unint64_t v45 = 10;
  }
  if (!v81 && !v21) {
    goto LABEL_70;
  }
LABEL_72:
  if (self->_currentDestination != v45)
  {
    self->_unint64_t currentDestination = v45;
    v59 = [(SBMedusaWindowDragGestureDestinationModifier *)self _transitionRequestForDestination:v45 complete:0];
    v60 = [v59 appLayout];
    proposedAppLayout = self->_proposedAppLayout;
    self->_proposedAppLayout = v60;
  }
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _contentDraggingFloatingActivationWidth];
  double v3 = v2;
  double v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[15];
  double v6 = *(double *)(a1 + 40);
  double v7 = *(double *)(a1 + 88);
  double v8 = [v4 medusaSettings];
  unint64_t v9 = SBFloatingConfigurationForMovingFloatingApplication(v5, v8, v6, *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), v3, v7);

  if (v9 > 4) {
    return 0;
  }
  else {
    return qword_1D8FD1320[v9];
  }
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

uint64_t __72__SBMedusaWindowDragGestureDestinationModifier__updateCurrentDropAction__block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _draggingFullScreenApp])
  {
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v2 = 0;
      goto LABEL_35;
    }
    if (*(unsigned char *)(a1 + 129))
    {
      int v44 = [*(id *)(a1 + 32) isRTLEnabled];
      double v45 = *(double *)(a1 + 48);
      double v46 = *(double *)(a1 + 80) * 0.5;
      BOOL v47 = v45 < v46;
      if (v44) {
        BOOL v47 = v45 >= v46;
      }
      BOOL v48 = !v47;
      goto LABEL_29;
    }
LABEL_34:
    uint64_t v2 = 1;
    goto LABEL_35;
  }
  if (![*(id *)(a1 + 40) isSplitConfiguration])
  {
    if (*(unsigned char *)(a1 + 129))
    {
      double v43 = *(double *)(a1 + 96);
      if (v43 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 112))
      {
        BOOL v41 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
        uint64_t v42 = 4;
        goto LABEL_18;
      }
      double v50 = *(double *)(a1 + 96);
      if (v50 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 112))
      {
        BOOL v48 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
LABEL_29:
        uint64_t v49 = 4;
        goto LABEL_30;
      }
    }
    if (*(unsigned char *)(a1 + 128)) {
      goto LABEL_34;
    }
    if (!*(unsigned char *)(a1 + 132))
    {
LABEL_61:
      uint64_t v2 = *(void *)(a1 + 120);
      goto LABEL_35;
    }
LABEL_49:
    uint64_t v2 = 10;
    goto LABEL_35;
  }
  [*(id *)(a1 + 32) containerViewBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", 1, *(void *)(a1 + 40));
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", 2, *(void *)(a1 + 40), v4, v6, v8, v10);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  int v27 = [*(id *)(a1 + 32) isRTLEnabled];
  double v28 = v12;
  CGFloat v63 = v14;
  CGFloat v64 = v12;
  CGFloat v67 = v22;
  CGFloat v68 = v20;
  if (v27) {
    CGFloat v12 = v20;
  }
  double v29 = v14;
  if (v27) {
    CGFloat v14 = v22;
  }
  double v30 = v16;
  CGFloat v61 = v18;
  CGFloat v62 = v16;
  CGFloat v65 = v26;
  CGFloat v66 = v24;
  if (v27) {
    CGFloat v16 = v24;
  }
  double v31 = v18;
  if (v27)
  {
    CGFloat v18 = v26;
    CGFloat v20 = v28;
    CGFloat v22 = v29;
    CGFloat v24 = v30;
    CGFloat v26 = v31;
  }
  v69.origin.CGFloat x = v12;
  v69.origin.CGFloat y = v14;
  v69.size.CGFloat width = v16;
  v69.size.CGFloat height = v18;
  CGFloat MaxX = CGRectGetMaxX(v69);
  v70.origin.CGFloat x = v12;
  v70.origin.CGFloat y = v14;
  v70.size.CGFloat width = v16;
  v70.size.CGFloat height = v18;
  CGFloat MinY = CGRectGetMinY(v70);
  v71.origin.CGFloat x = v20;
  v71.origin.CGFloat y = v22;
  v71.size.CGFloat width = v24;
  v71.size.CGFloat height = v26;
  double MinX = CGRectGetMinX(v71);
  v72.origin.CGFloat x = v12;
  v72.origin.CGFloat y = v14;
  v72.size.CGFloat width = v16;
  v72.size.CGFloat height = v18;
  CGFloat v33 = MinX - CGRectGetMaxX(v72);
  v73.origin.CGFloat x = v12;
  v73.origin.CGFloat y = v14;
  v73.size.CGFloat width = v16;
  v73.size.CGFloat height = v18;
  v74.size.CGFloat height = CGRectGetHeight(v73);
  v74.origin.CGFloat y = MinY;
  v74.origin.CGFloat x = MaxX;
  v74.size.CGFloat width = v33;
  CGRect v75 = CGRectInset(v74, -50.0, 0.0);
  CGFloat x = v75.origin.x;
  CGFloat y = v75.origin.y;
  CGFloat width = v75.size.width;
  CGFloat height = v75.size.height;
  v75.origin.CGFloat y = v63;
  v75.origin.CGFloat x = v64;
  v75.size.CGFloat height = v61;
  v75.size.CGFloat width = v62;
  BOOL v38 = CGRectContainsPoint(v75, *(CGPoint *)(a1 + 96));
  v76.origin.CGFloat y = v67;
  v76.origin.CGFloat x = v68;
  v76.size.CGFloat height = v65;
  v76.size.CGFloat width = v66;
  BOOL v39 = CGRectContainsPoint(v76, *(CGPoint *)(a1 + 96));
  v77.origin.CGFloat x = x;
  v77.origin.CGFloat y = y;
  v77.size.CGFloat width = width;
  v77.size.CGFloat height = height;
  BOOL v40 = CGRectContainsPoint(v77, *(CGPoint *)(a1 + 96));
  if (*(unsigned char *)(a1 + 130))
  {
    BOOL v41 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
    uint64_t v42 = 6;
    goto LABEL_18;
  }
  if (*(unsigned char *)(a1 + 131))
  {
    BOOL v48 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
    uint64_t v49 = 6;
    goto LABEL_30;
  }
  BOOL v55 = v40;
  double v56 = *(double *)(a1 + 96);
  if (v56 < CGRectGetMinX(*(CGRect *)(a1 + 64)) + *(double *)(a1 + 112))
  {
    BOOL v41 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
    uint64_t v42 = 2;
LABEL_18:
    if (v41) {
      uint64_t v2 = v42;
    }
    else {
      uint64_t v2 = v42 + 1;
    }
    goto LABEL_35;
  }
  double v57 = *(double *)(a1 + 96);
  if (v57 > CGRectGetMaxX(*(CGRect *)(a1 + 64)) - *(double *)(a1 + 112))
  {
    BOOL v48 = [*(id *)(a1 + 32) isRTLEnabled] == 0;
    uint64_t v49 = 2;
LABEL_30:
    if (v48) {
      uint64_t v2 = v49 + 1;
    }
    else {
      uint64_t v2 = v49;
    }
    goto LABEL_35;
  }
  if (*(unsigned char *)(a1 + 128)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)(a1 + 132)) {
    goto LABEL_49;
  }
  if (v55) {
    goto LABEL_61;
  }
  BOOL v58 = v38 || v39;
  uint64_t v2 = v38 ? 2 : 3;
  if (!v58) {
    goto LABEL_61;
  }
LABEL_35:
  if (objc_msgSend(*(id *)(a1 + 32), "_draggingSlideOverApp", *(void *)&MinY))
  {
    uint64_t v51 = [*(id *)(a1 + 40) itemForLayoutRole:4];

    if (v51)
    {
      BOOL v52 = v2 == 5 || v2 == 3;
      uint64_t v53 = 7;
      if (!v52) {
        uint64_t v53 = v2;
      }
      if (v2 == 4) {
        uint64_t v53 = 6;
      }
      if (v2 == 2) {
        return 6;
      }
      else {
        return v53;
      }
    }
  }
  return v2;
}

- (int64_t)_layoutRoleForDraggedApp
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(SBAppLayout *)self->_initialFloatingAppLayout isOrContainsAppLayout:self->_selectedLeafAppLayout])
  {
    return 3;
  }
  BOOL v4 = [(SBAppLayout *)self->_initialMainAppLayout isOrContainsAppLayout:self->_selectedLeafAppLayout];
  selectedLeafAppLayout = self->_selectedLeafAppLayout;
  if (v4)
  {
    initialMainAppLayout = self->_initialMainAppLayout;
    double v7 = [(SBAppLayout *)selectedLeafAppLayout itemForLayoutRole:1];
    int64_t v3 = [(SBAppLayout *)initialMainAppLayout layoutRoleForItem:v7];
  }
  else
  {
    int64_t v3 = 0;
    double v7 = [(SBAppLayout *)selectedLeafAppLayout itemForLayoutRole:1];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v8 = [(SBMedusaWindowDragGestureDestinationModifier *)self draggingAppLayoutsForWindowDrag];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 containsItem:v7])
          {
            int64_t v3 = [v13 layoutRoleForItem:v7];
            goto LABEL_15;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v3;
}

- (BOOL)_draggingFullScreenApp
{
  return [(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialMainAppLayout];
}

- (BOOL)_draggingSplitViewApp
{
  if ([(SBAppLayout *)self->_initialMainAppLayout isOrContainsAppLayout:self->_selectedLeafAppLayout]&& ![(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialMainAppLayout])
  {
    BOOL v4 = [(SBAppLayout *)self->_initialMainAppLayout itemForLayoutRole:4];
    double v5 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
    int v3 = [v4 isEqual:v5] ^ 1;
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)_draggingSlideOverApp
{
  return [(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialFloatingAppLayout];
}

- (BOOL)_draggingCenterWindow
{
  int v3 = [(SBAppLayout *)self->_initialMainAppLayout itemForLayoutRole:4];
  BOOL v4 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
  char v5 = [v3 isEqual:v4];

  return v5;
}

- (CGRect)_universalCenterZone
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGRect)_leftFloatingZoneForCenterWindow
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SBMedusaWindowDragGestureDestinationModifier *)self _universalCenterZone];
  CGFloat rect = v11;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  CGFloat v18 = CGRectGetWidth(v25) * 0.25;
  v26.origin.CGFloat x = rect;
  v26.origin.CGFloat y = v13;
  v26.size.CGFloat width = v15;
  v26.size.CGFloat height = v17;
  CGFloat v19 = CGRectGetMinX(v26) - v18;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double Height = CGRectGetHeight(v27);
  double v21 = 0.0;
  double v22 = v19;
  double v23 = v18;
  result.size.CGFloat height = Height;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v22;
  return result;
}

- (CGRect)_rightFloatingZoneForCenterWindow
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SBMedusaWindowDragGestureDestinationModifier *)self _universalCenterZone];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  CGFloat v24 = CGRectGetWidth(v25) * 0.25;
  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v14;
  v26.size.CGFloat width = v16;
  v26.size.CGFloat height = v18;
  CGFloat MaxX = CGRectGetMaxX(v26);
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double Height = CGRectGetHeight(v27);
  double v21 = 0.0;
  double v22 = MaxX;
  double v23 = v24;
  result.size.CGFloat height = Height;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v22;
  return result;
}

- (double)_sideActivationGutterSize
{
  double v2 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v2 draggingPlatterSideActivationGutterPadding];
  double v4 = v3;

  return v4;
}

- (CGSize)_fullscreenActivationRegionSize
{
  uint64_t v3 = 0x4062C00000000000;
  uint64_t v4 = 0x4062C00000000000;
  if (![(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp])
  {
    double v5 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
    [v5 draggingPlatterFullscreenActivationRegionWidth];
    uint64_t v3 = v6;
    [v5 draggingPlatterFullscreenActivationRegionHeight];
    uint64_t v4 = v7;
  }
  double v8 = *(double *)&v3;
  double v9 = *(double *)&v4;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (double)_contentDraggingCommandeerWidth
{
  double v2 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v2 contentDraggingCommandeerGutterWidth];
  double v4 = v3;

  return v4;
}

- (double)_contentDraggingSideActivationWidth
{
  double v2 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v2 contentDraggingSideActivationGutterWidth];
  double v4 = v3;

  return v4;
}

- (double)_contentDraggingFloatingActivationWidth
{
  double v2 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v2 contentDraggingFloatingActivationGutterWidth];
  double v4 = v3;

  return v4;
}

- (double)_dismissLeftBoundary
{
  double v2 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v2 windowSplitViewDismissalGutterWidth];
  double v4 = v3;

  return v4;
}

- (double)_dismissRightBoundary
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self containerViewBounds];
  double v4 = v3;
  double v5 = [(SBMedusaWindowDragGestureDestinationModifier *)self medusaSettings];
  [v5 windowSplitViewDismissalGutterWidth];
  double v7 = v4 - v6;

  return v7;
}

- (BOOL)_isDragOverFullscreenRegionAtLocation:(CGPoint)a3 inBounds:(CGRect)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SBMedusaWindowDragGestureDestinationModifier *)self _fullscreenActivationRegionSize];
  SBRectWithSize();
  UIRectCenteredXInRect();
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (BOOL)_isDragOverSideGutterRegionsAtLocation:(CGPoint)a3 inBounds:(CGRect)a4 totalContentDragGutterWidth:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v14.CGFloat y = a3.y;
  double v10 = a3.x;
  v15.origin.CGFloat x = a4.origin.x;
  v15.origin.CGFloat y = a4.origin.y;
  v15.size.CGFloat width = a4.size.width;
  v15.size.CGFloat height = height;
  v14.CGFloat x = v10;
  BOOL v11 = CGRectContainsPoint(v15, v14);
  if (v11)
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    BOOL v12 = v10 < CGRectGetMinX(v16) + a5;
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    LOBYTE(v11) = v10 > CGRectGetMaxX(v17) - a5 || v12;
  }
  return v11;
}

- (BOOL)_shouldMinimizeOrEnterSplitHomeScreen
{
  [(SBMedusaWindowDragGestureDestinationModifier *)self switcherViewBounds];
  double height = v6.size.height;
  BOOL v4 = CGRectContainsPoint(v6, self->_location);
  if (v4) {
    LOBYTE(v4) = !self->_enteredPlatterZone && self->_location.y + self->_velocity.y * 0.15 > height * 0.5;
  }
  return v4;
}

- (id)_transitionRequestForDestination:(unint64_t)a3 complete:(BOOL)a4
{
  BOOL v4 = a4;
  v71[3] = *MEMORY[0x1E4F143B8];
  double v8 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
  if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingFullScreenApp])
  {
    switch(a3)
    {
      case 0uLL:
      case 1uLL:
        BOOL v11 = [(SBAppLayout *)self->_selectedLeafAppLayout appLayoutByModifyingEnvironment:1];
        CGFloat v18 = v8;
        CGFloat v19 = v11;
        goto LABEL_41;
      case 2uLL:
      case 3uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
        double v9 = [MEMORY[0x1E4F28B00] currentHandler];
        double v10 = SBStringForWindowDragGestureDestination(a3);
        [v9 handleFailureInMethod:a2, self, @"SBMedusaWindowDragGestureDestinationModifier.m", 775, @"Unsupported destination when dragging fullscreen app: %@", v10 object file lineNumber description];

        goto LABEL_4;
      case 4uLL:
        id v36 = [(SBAppLayout *)self->_selectedLeafAppLayout appLayoutByModifyingEnvironment:1];
        double v9 = [v36 appLayoutByModifyingConfiguration:3];

        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v9];
        unsigned __int8 v37 = v8;
        uint64_t v38 = 2;
        goto LABEL_25;
      case 5uLL:
        BOOL v39 = [(SBAppLayout *)self->_selectedLeafAppLayout appLayoutByModifyingEnvironment:1];
        double v9 = [v39 appLayoutByModifyingConfiguration:3];

        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v9];
        unsigned __int8 v37 = v8;
        uint64_t v38 = 3;
LABEL_25:
        [(SBSwitcherTransitionRequest *)v37 setPeekConfiguration:v38];
LABEL_4:

        break;
      case 0xEuLL:
        BOOL v11 = +[SBAppLayout homeScreenAppLayout];
        uint64_t v40 = [(SBAppLayout *)v11 appLayoutByModifyingPreferredDisplayOrdinal:[(SBMedusaWindowDragGestureDestinationModifier *)self displayOrdinal]];
        goto LABEL_50;
      default:
        break;
    }
  }
  else
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke;
    v69[3] = &unk_1E6AFE7D8;
    v69[4] = self;
    v69[5] = a2;
    BOOL v11 = (SBAppLayout *)MEMORY[0x1D948C7A0](v69);
    switch(a3)
    {
      case 0uLL:
        goto LABEL_40;
      case 1uLL:
        uint64_t v40 = [(SBAppLayout *)self->_selectedLeafAppLayout appLayoutByModifyingEnvironment:1];
        goto LABEL_50;
      case 2uLL:
      case 4uLL:
        if (self->_gesturePhase == 3
          && [(SBMedusaWindowDragGestureDestinationModifier *)self _shouldMinimizeOrEnterSplitHomeScreen])
        {
          initialMainAppLayout = self->_initialMainAppLayout;
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_2;
          v68[3] = &unk_1E6AF4B38;
          v68[4] = self;
          double v13 = [(SBAppLayout *)initialMainAppLayout appLayoutWithItemsPassingTest:v68];
          [(SBSwitcherTransitionRequest *)v8 setAppLayout:v13];

          CGPoint v14 = [(SBSwitcherTransitionRequest *)v8 appLayout];
          CGRect v15 = objc_msgSend(v14, "appLayoutByModifyingConfiguration:", -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration"));
          [(SBSwitcherTransitionRequest *)v8 setAppLayout:v15];

          CGRect v16 = v8;
          uint64_t v17 = 3;
          goto LABEL_13;
        }
        uint64_t v24 = [(SBAppLayout *)self->_initialMainAppLayout configuration];
        if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSplitViewApp])
        {
          CGRect v25 = self->_initialMainAppLayout;
          CGRect v26 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
          uint64_t v27 = [(SBAppLayout *)v25 layoutRoleForItem:v26];

          if (v27 != 1 && SBLayoutRoleIsValidForSplitView(v27)) {
            uint64_t v24 = ((uint64_t (*)(SBAppLayout *, uint64_t, uint64_t))v11->_cachedHash)(v11, v24, [(SBMedusaWindowDragGestureDestinationModifier *)self switcherInterfaceOrientation]);
          }
        }
        double v28 = [(SBAppLayout *)self->_currentAppLayout appLayoutByModifyingConfiguration:v24];
        double v29 = [v28 appLayoutByInsertingLeafAppLayout:self->_selectedLeafAppLayout inRole:1];

        goto LABEL_51;
      case 3uLL:
      case 5uLL:
        if (self->_gesturePhase != 3
          || ![(SBMedusaWindowDragGestureDestinationModifier *)self _shouldMinimizeOrEnterSplitHomeScreen])
        {
          uint64_t v30 = [(SBAppLayout *)self->_initialMainAppLayout configuration];
          if ([(SBMedusaWindowDragGestureDestinationModifier *)self _draggingSplitViewApp])
          {
            double v31 = self->_initialMainAppLayout;
            v32 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
            uint64_t v33 = [(SBAppLayout *)v31 layoutRoleForItem:v32];

            if (v33 == 1) {
              uint64_t v30 = ((uint64_t (*)(SBAppLayout *, uint64_t, uint64_t))v11->_cachedHash)(v11, v30, [(SBMedusaWindowDragGestureDestinationModifier *)self switcherInterfaceOrientation]);
            }
          }
          char v34 = [(SBAppLayout *)self->_currentAppLayout appLayoutByModifyingConfiguration:v30];
          uint64_t v35 = [v34 appLayoutByInsertingLeafAppLayout:self->_selectedLeafAppLayout inRole:2];
          goto LABEL_54;
        }
        uint64_t v20 = self->_initialMainAppLayout;
        v67[0] = MEMORY[0x1E4F143A8];
        v67[1] = 3221225472;
        v67[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_3;
        v67[3] = &unk_1E6AF4B38;
        v67[4] = self;
        double v21 = [(SBAppLayout *)v20 appLayoutWithItemsPassingTest:v67];
        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v21];

        double v22 = [(SBSwitcherTransitionRequest *)v8 appLayout];
        double v23 = objc_msgSend(v22, "appLayoutByModifyingConfiguration:", -[SBAppLayout configuration](self->_initialMainAppLayout, "configuration"));
        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v23];

        CGRect v16 = v8;
        uint64_t v17 = 2;
LABEL_13:
        [(SBSwitcherTransitionRequest *)v16 setPeekConfiguration:v17];
        break;
      case 6uLL:
        if ([(SBAppLayout *)self->_currentAppLayout isOrContainsAppLayout:self->_selectedLeafAppLayout])
        {
          int64_t v41 = 1;
        }
        else
        {
          int64_t v41 = [(SBAppLayout *)self->_currentAppLayout configuration];
        }
        BOOL v52 = [(SBAppLayout *)self->_currentAppLayout appLayoutByModifyingConfiguration:v41];
        uint64_t v51 = [v52 appLayoutByInsertingLeafAppLayout:self->_selectedLeafAppLayout inRole:3];

        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v51];
        uint64_t v53 = v8;
        uint64_t v54 = 1;
        goto LABEL_59;
      case 7uLL:
        if ([(SBAppLayout *)self->_currentAppLayout isOrContainsAppLayout:self->_selectedLeafAppLayout])
        {
          int64_t v48 = 1;
        }
        else
        {
          int64_t v48 = [(SBAppLayout *)self->_currentAppLayout configuration];
        }
        BOOL v55 = [(SBAppLayout *)self->_currentAppLayout appLayoutByModifyingConfiguration:v48];
        uint64_t v51 = [v55 appLayoutByInsertingLeafAppLayout:self->_selectedLeafAppLayout inRole:3];

        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v51];
        uint64_t v53 = v8;
        uint64_t v54 = 2;
LABEL_59:
        [(SBSwitcherTransitionRequest *)v53 setFloatingConfiguration:v54];
        goto LABEL_60;
      case 8uLL:
        [(SBSwitcherTransitionRequest *)v8 setAppLayout:self->_currentAppLayout];
        uint64_t v42 = v8;
        uint64_t v43 = 3;
        goto LABEL_32;
      case 9uLL:
        [(SBSwitcherTransitionRequest *)v8 setAppLayout:self->_currentAppLayout];
        uint64_t v42 = v8;
        uint64_t v43 = 4;
LABEL_32:
        [(SBSwitcherTransitionRequest *)v42 setFloatingConfiguration:v43];
        break;
      case 0xAuLL:
        if (self->_gesturePhase == 3
          && [(SBMedusaWindowDragGestureDestinationModifier *)self _shouldMinimizeOrEnterSplitHomeScreen])
        {
          uint64_t v49 = self->_initialMainAppLayout;
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_4;
          v66[3] = &unk_1E6AF4B38;
          v66[4] = self;
          double v50 = [(SBAppLayout *)v49 appLayoutWithItemsPassingTest:v66];
          [(SBSwitcherTransitionRequest *)v8 setAppLayout:v50];

          double v29 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
          BOOL v47 = [v29 bundleIdentifier];
          [(SBSwitcherTransitionRequest *)v8 setBundleIdentifierForAppExpose:v47];
LABEL_43:

          goto LABEL_52;
        }
        char v34 = [(SBAppLayout *)self->_currentAppLayout appLayoutByInsertingLeafAppLayout:self->_selectedLeafAppLayout inRole:4];
        uint64_t v35 = [v34 appLayoutByModifyingConfiguration:1];
LABEL_54:
        uint64_t v51 = (void *)v35;

        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v51];
LABEL_60:

        break;
      case 0xBuLL:
        if (self->_gesturePhase != 3) {
          goto LABEL_40;
        }
        uint64_t v44 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
        double v45 = &SBLayoutRoleSide;
        double v46 = &SBLayoutRolePrimary;
        goto LABEL_37;
      case 0xCuLL:
        if (self->_gesturePhase == 3)
        {
          uint64_t v44 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
          double v45 = &SBLayoutRolePrimary;
          double v46 = &SBLayoutRoleSide;
LABEL_37:
          if (v44 == 1) {
            double v45 = v46;
          }
          uint64_t v40 = [(SBAppLayout *)self->_initialMainAppLayout leafAppLayoutForRole:*v45];
LABEL_50:
          double v29 = (void *)v40;
LABEL_51:
          [(SBSwitcherTransitionRequest *)v8 setAppLayout:v29];
LABEL_52:
        }
        else
        {
LABEL_40:
          CGFloat v19 = self->_initialMainAppLayout;
          CGFloat v18 = v8;
LABEL_41:
          [(SBSwitcherTransitionRequest *)v18 setAppLayout:v19];
        }
        break;
      case 0xDuLL:
        uint64_t v40 = [(SBAppLayout *)self->_currentAppLayout appLayoutByRemovingItemInLayoutRole:4];
        goto LABEL_50;
      case 0xEuLL:
        double v29 = +[SBAppLayout homeScreenAppLayout];
        BOOL v47 = objc_msgSend(v29, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBMedusaWindowDragGestureDestinationModifier displayOrdinal](self, "displayOrdinal"));
        [(SBSwitcherTransitionRequest *)v8 setAppLayout:v47];
        goto LABEL_43;
      default:
        break;
    }
  }
  BOOL v56 = !v4;
  [(SBSwitcherTransitionRequest *)v8 setSceneUpdatesOnly:v56];
  if (!v56)
  {
    v70[0] = *MEMORY[0x1E4FA76C8];
    double v57 = [(SBAppLayout *)self->_selectedLeafAppLayout itemForLayoutRole:1];
    BOOL v58 = [v57 bundleIdentifier];
    v71[0] = v58;
    v70[1] = *MEMORY[0x1E4FA76D0];
    v59 = [NSNumber numberWithUnsignedInteger:a3];
    v71[1] = v59;
    v70[2] = *MEMORY[0x1E4FA76D8];
    v60 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBSwitcherTransitionRequest peekConfiguration](v8, "peekConfiguration"));
    v71[2] = v60;
    CGFloat v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v71 forKeys:v70 count:3];
    CGFloat v62 = (void *)MEMORY[0x1E4FA5E78];
    id v63 = v61;
    CGFloat v64 = [v62 sharedInstance];
    [v64 emitEvent:51 withPayload:v63];
  }
  return v8;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration(a2);
  uint64_t v6 = SBSpaceConfigurationForSpaceConfigurationAndInterfaceOrientation(v5, a3);
  switch(v6)
  {
    case 0:
    case 1:
      double v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = a1 + 32;
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v10 + 8);
      BOOL v11 = SBStringForSpaceConfiguration(v6);
      [v7 handleFailureInMethod:v9, v8, @"SBMedusaWindowDragGestureDestinationModifier.m", 793, @"Can't swap primary/side in space configuration: %@", v11 object file lineNumber description];

      break;
    case 2:
      uint64_t v6 = 4;
      break;
    case 3:
      uint64_t v6 = 3;
      break;
    case 4:
      uint64_t v6 = 2;
      break;
    default:
      break;
  }
  return SBAppLayoutConfigurationFromMainDisplayLayoutStateSpaceConfiguration(v6);
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  BOOL v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_3(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  BOOL v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

uint64_t __90__SBMedusaWindowDragGestureDestinationModifier__transitionRequestForDestination_complete___block_invoke_4(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = a2;
  BOOL v4 = [v2 itemForLayoutRole:1];
  int v5 = [v3 isEqual:v4];

  return v5 ^ 1u;
}

- (BOOL)hasEnteredPlatterZone
{
  return self->_enteredPlatterZone;
}

- (unint64_t)currentDestination
{
  return self->_currentDestination;
}

- (SBAppLayout)currentAppLayout
{
  return self->_currentAppLayout;
}

- (SBAppLayout)proposedAppLayout
{
  return self->_proposedAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedAppLayout, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_pendingEnterPlatterZoneResponse, 0);
  objc_destroyWeak((id *)&self->_dragDestinationDelegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_initialFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_initialMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
}

@end