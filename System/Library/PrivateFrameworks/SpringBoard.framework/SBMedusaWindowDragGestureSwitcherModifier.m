@interface SBMedusaWindowDragGestureSwitcherModifier
- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem;
- (BOOL)_draggingFullScreenAppOrSplitView;
- (BOOL)_ourProposedAppLayoutContainsSelectedDisplayItem;
- (BOOL)_shouldPushInFullScreenContent;
- (BOOL)_updateHomeScreenStyleInteractively;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)_boundsForDraggingAppLayout;
- (CGRect)_initialTransformedFrameForDraggingAppLayout;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)initialFloatingAppLayout;
- (SBAppLayout)initialMainAppLayout;
- (SBAppLayout)selectedLeafAppLayout;
- (SBMedusaWindowDragGestureSwitcherModifier)initWithGestureID:(id)a3 selectedLeafAppLayout:(id)a4 initialMainAppLayout:(id)a5 initialFloatingAppLayout:(id)a6 initialFloatingConfiguration:(int64_t)a7;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_distanceYToMaxTranslation;
- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3;
- (double)_platterScale;
- (double)_scaleForTranslation:(CGPoint)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)_appLayoutContainingSelectedDisplayItem;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (id)topMostLayoutElements;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (id)visibleAppLayouts;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)currentFloatingConfiguration;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)currentDestination;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBMedusaWindowDragGestureSwitcherModifier

- (SBMedusaWindowDragGestureSwitcherModifier)initWithGestureID:(id)a3 selectedLeafAppLayout:(id)a4 initialMainAppLayout:(id)a5 initialFloatingAppLayout:(id)a6 initialFloatingConfiguration:(int64_t)a7
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  v17 = [(SBGestureSwitcherModifier *)&v22 initWithGestureID:a3];
  if (v17)
  {
    if (!v14)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v17, @"SBMedusaWindowDragGestureSwitcherModifier.m", 74, @"Invalid parameter not satisfying: %@", @"selectedLeafAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v17->_selectedLeafAppLayout, a4);
    objc_storeStrong((id *)&v17->_initialMainAppLayout, a5);
    objc_storeStrong((id *)&v17->_initialFloatingAppLayout, a6);
    v17->_currentFloatingConfiguration = a7;
    v17->_initialAnchorPoint = (CGPoint)SBInvalidPoint;
    v17->_anchorPoint = (CGPoint)SBInvalidPoint;
    uint64_t v18 = [v14 itemForLayoutRole:1];
    selectedDisplayItem = v17->_selectedDisplayItem;
    v17->_selectedDisplayItem = (SBDisplayItem *)v18;
  }
  return v17;
}

- (unint64_t)currentDestination
{
  return [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination];
}

- (void)didMoveToParentModifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_destinationModifier)
    {
      v5 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:self->_selectedDisplayItem];
      [(SBChainableModifier *)self addChildModifier:v5 atLevel:0 key:0];
      v6 = [[SBMedusaWindowDragGestureDestinationModifier alloc] initWithSelectedLeafAppLayout:self->_selectedLeafAppLayout initialMainAppLayout:self->_initialMainAppLayout initialFloatingAppLayout:self->_initialFloatingAppLayout initialFloatingConfiguration:self->_currentFloatingConfiguration delegate:self];
      destinationModifier = self->_destinationModifier;
      self->_destinationModifier = v6;

      [(SBChainableModifier *)self addChildModifier:self->_destinationModifier atLevel:1 key:0];
    }
    v8 = objc_alloc_init(SBHomeScreenSwitcherModifier);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__SBMedusaWindowDragGestureSwitcherModifier_didMoveToParentModifier___block_invoke;
    v10[3] = &unk_1E6AF5290;
    v10[4] = self;
    v11 = v8;
    v9 = v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v9 usingBlock:v10];
  }
}

uint64_t __69__SBMedusaWindowDragGestureSwitcherModifier_didMoveToParentModifier___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) homeScreenAlpha];
  *(void *)(*(void *)(a1 + 32) + 200) = v2;
  [*(id *)(a1 + 40) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(a1 + 32) + 208) = v3;
  uint64_t result = [*(id *)(a1 + 40) homeScreenDimmingAlpha];
  *(void *)(*(void *)(a1 + 32) + 216) = v5;
  return result;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  uint64_t v5 = [(SBGestureSwitcherModifier *)&v48 handleGestureEvent:v4];
  [v4 locationInContainerView];
  self->_location.x = v6;
  self->_location.double y = v7;
  [v4 translationInContainerView];
  self->_translation.x = v8;
  self->_translation.double y = v9;
  if ([(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialMainAppLayout])
  {
    double y = fabs(self->_translation.x);
    if (y < self->_translation.y) {
      double y = self->_translation.y;
    }
  }
  else
  {
    double y = self->_translation.y;
  }
  [(SBMedusaWindowDragGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:y];
  self->_progressToMaxTranslation = v11;
  objc_super v12 = &OBJC_IVAR___SBControlCenterController__observers;
  v13 = &OBJC_IVAR___SBControlCenterController__observers;
  id v14 = &OBJC_IVAR___SBControlCenterController__observers;
  if ([v4 phase] == 1)
  {
    id v15 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    id v16 = SBAppendSwitcherModifierResponse(v15, v5);

    v17 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
    uint64_t v18 = SBAppendSwitcherModifierResponse(v17, v16);

    v19 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:4];
    uint64_t v5 = SBAppendSwitcherModifierResponse(v19, v18);

    v20 = [(SBMedusaWindowDragGestureSwitcherModifier *)self draggingAppLayoutsForWindowDrag];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __64__SBMedusaWindowDragGestureSwitcherModifier_handleGestureEvent___block_invoke;
    v47[3] = &unk_1E6AF4B60;
    v47[4] = self;
    v21 = objc_msgSend(v20, "bs_firstObjectPassingTest:", v47);

    [v4 sizeOfSelectedDisplayItem];
    self->_sizeOfSelectedDisplayItem.width = v22;
    self->_sizeOfSelectedDisplayItem.height = v23;
    uint64_t v24 = [v21 preferredDisplayOrdinal];
    uint64_t v25 = [(SBMedusaWindowDragGestureSwitcherModifier *)self displayOrdinal];
    self->_dragBeganInOtherSwitcher = v24 != v25;
    self->_dragBeganInOurSwitcher = v24 == v25;
    if (self->_dragBeganInOtherSwitcher)
    {
      [v4 locationInSelectedDisplayItem];
      CGFloat v27 = v26 / self->_sizeOfSelectedDisplayItem.width;
      double v29 = v28 / self->_sizeOfSelectedDisplayItem.height;
      self->_initialAnchorPoint.x = v27;
    }
    else
    {
      [(SBMedusaWindowDragGestureSwitcherModifier *)self _initialTransformedFrameForDraggingAppLayout];
      double v31 = v30;
      double v33 = v32;
      UIRectGetCenter();
      CGFloat v36 = (self->_location.x - v34) / v31 + 0.5;
      double v29 = (self->_location.y - v35) / v33 + 0.5;
      self->_initialAnchorPoint.x = v36;
    }
    id v14 = &OBJC_IVAR___SBControlCenterController__observers;
    self->_initialAnchorPoint.double y = v29;
    self->_anchorPoint = self->_initialAnchorPoint;

    objc_super v12 = &OBJC_IVAR___SBControlCenterController__observers;
    v13 = &OBJC_IVAR___SBControlCenterController__observers;
  }
  BOOL v37 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem];
  BOOL v38 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _ourProposedAppLayoutContainsSelectedDisplayItem];
  if (*((unsigned char *)&self->super.super.super.super.isa + v13[546]) && !v38 && v37)
  {
    __asm { FMOV            V0.2D, #0.5 }
    *(_OWORD *)((char *)&self->super.super.super.super.isa + v14[535]) = _Q0;
  }
  else
  {
    if (*((unsigned char *)&self->super.super.super.super.isa + v12[545])) {
      BOOL v44 = v38;
    }
    else {
      BOOL v44 = 0;
    }
    if (v44) {
      __asm { FMOV            V0.2D, #0.5 }
    }
    else {
      _Q0 = self->_initialAnchorPoint;
    }
    *(CGPoint *)((char *)&self->super.super.super.super.isa + v14[535]) = _Q0;
  }

  return v5;
}

uint64_t __64__SBMedusaWindowDragGestureSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 224)];
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v9.receiver = self;
  v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  CGFloat v6 = [(SBSwitcherModifier *)&v9 handleSceneReadyEvent:v4];

  CGFloat v7 = SBAppendSwitcherModifierResponse(v5, v6);

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  uint64_t v5 = [(SBGestureSwitcherModifier *)&v7 handleTransitionEvent:v4];
  if ([v4 isGestureInitiated] && (unint64_t)objc_msgSend(v4, "phase") >= 2) {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier proposedAppLayout];
  if ([v5 isOrContainsAppLayout:v4])
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    id v6 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v9 appLayoutContainingAppLayout:v4];
  }
  objc_super v7 = v6;

  return v7;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  id v4 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v8 adjustedAppLayoutsForAppLayouts:a3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__SBMedusaWindowDragGestureSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v7[3] = &unk_1E6AF4B60;
  v7[4] = self;
  if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v7) & 1) == 0)
  {
    uint64_t v5 = [v4 arrayByAddingObject:self->_selectedLeafAppLayout];

    id v4 = (void *)v5;
  }
  return v4;
}

uint64_t __77__SBMedusaWindowDragGestureSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 224)];
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem] && (BSPointEqualToPoint() & 1) == 0)
  {
    CGFloat x = self->_anchorPoint.x;
    CGFloat y = self->_anchorPoint.y;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    [(SBMedusaWindowDragGestureSwitcherModifier *)&v13 anchorPointForIndex:a3];
    CGFloat x = v7;
    CGFloat y = v9;
  }

  double v11 = x;
  double v12 = y;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (([v6 containsItem:self->_selectedDisplayItem] & 1) == 0
    && [v6 isEqual:self->_initialFloatingAppLayout]
    && [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone])
  {
    if (self->_currentFloatingConfiguration == 1) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 4;
    }
    [(SBMedusaWindowDragGestureSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBMedusaWindowDragGestureSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:v7];
  }
  else if ([v6 containsItem:self->_selectedDisplayItem])
  {
    [(SBMedusaWindowDragGestureSwitcherModifier *)self _boundsForDraggingAppLayout];
    UIRectCenteredAboutPoint();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    [(SBMedusaWindowDragGestureSwitcherModifier *)&v20 frameForIndex:a3];
  }
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;

  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  BOOL v12 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone];
  destinationModifier = self->_destinationModifier;
  if (v12) {
    [(SBMedusaWindowDragGestureDestinationModifier *)destinationModifier currentAppLayout];
  }
  else {
  double v14 = [(SBMedusaWindowDragGestureDestinationModifier *)destinationModifier proposedAppLayout];
  }
  if (([v11 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    if (![v14 isOrContainsAppLayout:v11]
      || ![v11 isFullScreen]
      || ((unint64_t v15 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"), [v14 isFullScreen])? (v16 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 4): (v16 = 0), !v16))
    {
      v34.receiver = self;
      v34.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
      double x = v17;
      double y = v18;
      double width = v19;
      double height = v20;
      goto LABEL_12;
    }
    [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
    double x = v25;
    double y = v26;
    double v28 = v27;
    double height = v29;
    double v30 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
    [v30 draggingPlatterSideActivationGutterPadding];

    [(SBMedusaWindowDragGestureSwitcherModifier *)self _boundsForDraggingAppLayout];
    double v31 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
    [v31 iconPlatterScale];

    [(SBMedusaWindowDragGestureSwitcherModifier *)self screenScale];
    BSFloatRoundForScale();
    double v33 = v32;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      if (v15 == 4) {
        goto LABEL_18;
      }
    }
    else if (v15 != 4)
    {
LABEL_18:
      double width = v28 - v33;
      goto LABEL_12;
    }
    double x = x + v33;
    goto LABEL_18;
  }
LABEL_12:

  double v21 = x;
  double v22 = y;
  double v23 = width;
  double v24 = height;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    -[SBMedusaWindowDragGestureSwitcherModifier _scaleForTranslation:](self, "_scaleForTranslation:", self->_translation.x, self->_translation.y);
LABEL_8:
    double v10 = v7;
    goto LABEL_9;
  }
  double v8 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentAppLayout];
  if (![v8 isOrContainsAppLayout:v6])
  {

    goto LABEL_7;
  }
  BOOL v9 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _shouldPushInFullScreenContent];

  if (!v9)
  {
LABEL_7:
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    [(SBMedusaWindowDragGestureSwitcherModifier *)&v12 scaleForIndex:a3];
    goto LABEL_8;
  }
  double v10 = 0.98;
LABEL_9:

  return v10;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  return 0.0;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (![(SBAppLayout *)self->_initialMainAppLayout isOrContainsAppLayout:v8]
    && ([v8 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    [(SBMedusaWindowDragGestureSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  double v7 = 1.0;
  if ([(SBGestureSwitcherModifier *)self gesturePhase] == 1)
  {
    id v8 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
    double v9 = [v8 objectAtIndex:a4];

    double v10 = [v9 itemForLayoutRole:a3];
    if (![(SBAppLayout *)self->_initialMainAppLayout containsItem:v10]
      || [(SBAppLayout *)self->_initialMainAppLayout layoutRoleForItem:v10] != 4)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      [(SBMedusaWindowDragGestureSwitcherModifier *)&v13 shadowOpacityForLayoutRole:a3 atIndex:a4];
      double v7 = v11;
    }
  }
  return v7;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v9 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  double v10 = [v9 objectAtIndex:a3];

  if ([v10 containsItem:self->_selectedDisplayItem]
    && [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone])
  {
    if ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination] > 0xE)goto LABEL_11; {
    [(SBMedusaWindowDragGestureSwitcherModifier *)self _platterScale];
    }
    goto LABEL_9;
  }
  if ([(SBAppLayout *)self->_initialMainAppLayout containsAnyItemFromAppLayout:v10]
    || ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentAppLayout],
        double v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 containsAnyItemFromAppLayout:v10],
        v11,
        v12))
  {
    [(SBMedusaWindowDragGestureSwitcherModifier *)self displayCornerRadius];
LABEL_9:
    SBRectCornerRadiiForRadius();
    goto LABEL_10;
  }
  v21.receiver = self;
  v21.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v21 cornerRadiiForIndex:a3];
LABEL_10:
  double v3 = v13;
  double v4 = v14;
  double v5 = v15;
  double v6 = v16;
LABEL_11:

  double v17 = v3;
  double v18 = v4;
  double v19 = v5;
  double v20 = v6;
  result.topRight = v20;
  result.bottomRight = v19;
  result.bottomLeft = v18;
  result.topLeft = v17;
  return result;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  [(SBMedusaWindowDragGestureSwitcherModifier *)self scaleForIndex:a3];
  return 1.0 / v3;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    int64_t v7 = 2;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    int64_t v7 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v9 shadowStyleForLayoutRole:a3 inAppLayout:v6];
  }

  return v7;
}

- (double)homeScreenAlpha
{
  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v6 homeScreenAlpha];
  double v4 = v3;
  if ([(SBMedusaWindowDragGestureSwitcherModifier *)self _updateHomeScreenStyleInteractively])
  {
    return v4 + self->_progressToMaxTranslation * (self->_toHomeScreenAlpha - v4);
  }
  return v4;
}

- (double)homeScreenDimmingAlpha
{
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self proposedAppLayoutForWindowDrag];
  double v4 = [v3 allItems];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 0.0;
  }
  double v6 = 1.0;
  if ([(SBGestureSwitcherModifier *)self gesturePhase] >= 2)
  {
    if ([(SBMedusaWindowDragGestureSwitcherModifier *)self _shouldPushInFullScreenContent])
    {
      v9.receiver = self;
      v9.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      [(SBMedusaWindowDragGestureSwitcherModifier *)&v9 homeScreenDimmingAlpha];
      double v6 = v7;
      if ([(SBMedusaWindowDragGestureSwitcherModifier *)self _updateHomeScreenStyleInteractively])
      {
        if (v6 + self->_progressToMaxTranslation * (self->_toHomeScreenDimmingAlpha - v6) >= 0.2) {
          return v6 + self->_progressToMaxTranslation * (self->_toHomeScreenDimmingAlpha - v6);
        }
        else {
          return 0.2;
        }
      }
    }
  }
  return v6;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)homeScreenBackdropBlurProgress
{
  v6.receiver = self;
  v6.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v6 homeScreenBackdropBlurProgress];
  double v4 = v3;
  if ([(SBMedusaWindowDragGestureSwitcherModifier *)self _updateHomeScreenStyleInteractively])
  {
    if (v4 + self->_progressToMaxTranslation * (self->_toHomeScreenBlurProgress - v4) >= 0.5) {
      double v4 = v4 + self->_progressToMaxTranslation * (self->_toHomeScreenBlurProgress - v4);
    }
    else {
      double v4 = 0.5;
    }
  }
  return fmin(fmax(v4, 0.0), 1.0);
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v25.receiver = self;
  v25.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  id v6 = a4;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v25 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  unint64_t v9 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination];
  double v10 = [v6 itemForLayoutRole:a3];
  char v11 = [v6 containsItem:self->_selectedDisplayItem];

  if (v11)
  {
    if (v9 - 11 <= 1)
    {
      int v12 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
      [v12 resizeAnimationDismissItemOpacity];
      goto LABEL_21;
    }
  }
  else
  {
    if ([(SBAppLayout *)self->_initialMainAppLayout containsItem:v10])
    {
      double v14 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier proposedAppLayout];
      char v15 = [v14 containsItem:v10];

      if ((v15 & 1) == 0)
      {
        int64_t v18 = [(SBAppLayout *)self->_initialMainAppLayout layoutRoleForItem:v10];
        if (v18 == 3 && (v9 & 0xFFFFFFFFFFFFFFFELL) == 6)
        {
          objc_super v21 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
          int v12 = v21;
        }
        else
        {
          int64_t v20 = v18;
          objc_super v21 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
          int v12 = v21;
          if (v20 != 4 || v9 != 10)
          {
            [v21 defaultDimmingOpacity];
            double v8 = v8 + v23;
LABEL_22:

            goto LABEL_23;
          }
        }
        [v21 replacementDimmingAlpha];
LABEL_21:
        double v8 = v13;
        goto LABEL_22;
      }
    }
    if (v9 == 10)
    {
      int v12 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentAppLayout];
      if ([v12 containsItem:v10] && objc_msgSend(v12, "layoutRoleForItem:", v10) != 4)
      {
        double v16 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
        [v16 defaultDimmingOpacity];
        double v8 = v17;
      }
      goto LABEL_22;
    }
  }
LABEL_23:

  return v8;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem]) {
    goto LABEL_4;
  }
  double v7 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentAppLayout];
  if (![v7 isOrContainsAppLayout:v6])
  {

    goto LABEL_6;
  }
  BOOL v8 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _shouldPushInFullScreenContent];

  if (!v8)
  {
LABEL_6:
    v11.receiver = self;
    v11.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    BOOL v9 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v11 isContentStatusBarVisibleForIndex:a3];
    goto LABEL_7;
  }
LABEL_4:
  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (id)keyboardSuppressionMode
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  double v4 = [v2 setWithArray:v3];
  id v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v4];

  [v5 setApplyAssertionEvenIfAppIsHostingTheKeyboard:1];
  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = [v6 itemForLayoutRole:a3];
  if ([v7 isEqual:self->_selectedDisplayItem]
    && [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone]&& [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination])
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    BOOL v9 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone];
    destinationModifier = self->_destinationModifier;
    if (v9) {
      [(SBMedusaWindowDragGestureDestinationModifier *)destinationModifier currentAppLayout];
    }
    else {
    objc_super v11 = [(SBMedusaWindowDragGestureDestinationModifier *)destinationModifier proposedAppLayout];
    }
    if (([v6 containsItem:self->_selectedDisplayItem] & 1) == 0
      && [v11 isOrContainsAppLayout:v6]
      && ((unint64_t v12 = -[SBMedusaWindowDragGestureDestinationModifier currentDestination](self->_destinationModifier, "currentDestination"), [v11 isFullScreen])? (v13 = (v12 & 0xFFFFFFFFFFFFFFFELL) == 4): (v13 = 0), v13)|| (v15.receiver = self, v15.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier, -[SBMedusaWindowDragGestureSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v15, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6)))
    {
      LOBYTE(v8) = 1;
    }
    else
    {
      int v8 = [(SBMedusaWindowDragGestureSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
    }
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 containsItem:self->_selectedDisplayItem])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBMedusaWindowDragGestureSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  else
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(1u, 1);
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  if ([v4 switcherLayoutElementType]
    && [(SBGestureSwitcherModifier *)self gesturePhase] == 1)
  {
    v21.receiver = self;
    v21.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    unsigned __int16 v5 = [(SBGestureSwitcherModifier *)&v21 animationAttributesForLayoutElement:v4];
    SBSwitcherAsyncRenderingAttributes v6 = (void *)[v5 mutableCopy];

    double v7 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    if ([v4 switcherLayoutElementType])
    {
      v19.receiver = self;
      v19.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
      SBSwitcherAsyncRenderingAttributes v6 = [(SBGestureSwitcherModifier *)&v19 animationAttributesForLayoutElement:v4];
      goto LABEL_13;
    }
    v20.receiver = self;
    v20.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    BOOL v9 = [(SBGestureSwitcherModifier *)&v20 animationAttributesForLayoutElement:v4];
    SBSwitcherAsyncRenderingAttributes v6 = (void *)[v9 mutableCopy];

    LODWORD(v9) = [v4 containsItem:self->_selectedDisplayItem];
    double v10 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
    objc_super v11 = v10;
    if (v9)
    {
      unint64_t v12 = [v10 windowDragAnimationSettings];

      BOOL v13 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
      double v14 = [v13 resizeAnimationSettings];

      objc_super v15 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
      [v14 dampingRatio];
      objc_msgSend(v15, "setTrackingDampingRatio:");
      [v14 response];
      objc_msgSend(v15, "setTrackingResponse:");
      CAFrameRateRange v23 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      objc_msgSend(v15, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v23.minimum, *(double *)&v23.maximum, *(double *)&v23.preferred);
      [v6 setLayoutSettings:v15];
      [v6 setCornerRadiusSettings:v15];
      [v6 setPositionSettings:v12];
      if ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone])
      {
        double v16 = v15;
      }
      else
      {
        double v16 = v12;
      }
      [v6 setScaleSettings:v16];

      goto LABEL_13;
    }
    double v17 = [v10 resizeAnimationSettings];
    [v6 setLayoutSettings:v17];

    double v7 = v6;
    uint64_t v8 = 3;
  }
  [v7 setUpdateMode:v8];
LABEL_13:

  return v6;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v7 visibleAppLayouts];
  id v4 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _appLayoutContainingSelectedDisplayItem];
  unsigned __int16 v5 = [v3 setByAddingObject:v4];

  return v5;
}

- (id)topMostLayoutElements
{
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v7 topMostLayoutElements];
  id v4 = (void *)[v3 mutableCopy];

  unsigned __int16 v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _appLayoutContainingSelectedDisplayItem];
  [v4 removeObject:v5];
  [v4 insertObject:v5 atIndex:0];
  if (self->_initialFloatingAppLayout && !-[SBAppLayout isEqual:](self->_selectedLeafAppLayout, "isEqual:"))
  {
    [v4 removeObject:self->_initialFloatingAppLayout];
    [v4 insertObject:self->_initialFloatingAppLayout atIndex:0];
  }

  return v4;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  selectedDisplayItem = self->_selectedDisplayItem;
  id v5 = a3;
  if ([v5 containsItem:selectedDisplayItem])
  {
    SBSwitcherAsyncRenderingAttributes v6 = NSNumber;
    uint64_t v7 = [v5 layoutRoleForItem:self->_selectedDisplayItem];

    id v5 = [v6 numberWithInteger:v7];
    v12[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    uint64_t v8 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v11 topMostLayoutRolesForAppLayout:v5];
  }
  BOOL v9 = (void *)v8;

  return v9;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  v7.receiver = self;
  v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v7 visibleHomeAffordanceLayoutElements];
  if ([v3 containsObject:self->_selectedLeafAppLayout])
  {
    id v4 = (void *)[v3 mutableCopy];
    [v4 removeObject:self->_selectedLeafAppLayout];

    double v3 = v4;
  }
  if ([v3 containsObject:self->_initialMainAppLayout]
    && [(SBAppLayout *)self->_initialMainAppLayout containsItem:self->_selectedDisplayItem])
  {
    id v5 = (void *)[v3 mutableCopy];
    [v5 removeObject:self->_initialMainAppLayout];

    double v3 = v5;
  }
  return v3;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBGestureSwitcherModifier *)self gesturePhase] == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
    BOOL v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v7 isResizeGrabberVisibleForAppLayout:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  BOOL v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)&v16 resizeGrabberLayoutAttributesForAppLayout:v4];
  SBSwitcherAsyncRenderingAttributes v6 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier proposedAppLayout];
  objc_super v7 = [v6 itemForLayoutRole:2];
  if (v7
    && [v6 isOrContainsAppLayout:v4]
    && ([v4 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    int v8 = [v6 containsItem:self->_selectedDisplayItem];

    if (!v8) {
      goto LABEL_15;
    }
    BOOL v9 = [v4 itemForLayoutRole:1];
    uint64_t v10 = [v6 layoutRoleForItem:v9];

    int v11 = [(SBMedusaWindowDragGestureSwitcherModifier *)self isRTLEnabled];
    int v12 = v11 ^ 1;
    if (v10 != 1) {
      int v12 = 0;
    }
    if (v10 == 2) {
      int v13 = v11;
    }
    else {
      int v13 = 0;
    }
    if (v12 | v13) {
      uint64_t v14 = 8;
    }
    else {
      uint64_t v14 = 2;
    }
    [v5 setEdge:v14];
    objc_super v7 = [v6 leafAppLayoutForRole:v10];
    [v5 setLeafAppLayout:v7];
  }

LABEL_15:
  return v5;
}

- (CGRect)_boundsForDraggingAppLayout
{
  uint64_t v4 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination];
  uint64_t v5 = [(SBMedusaWindowDragGestureSwitcherModifier *)self switcherInterfaceOrientation];
  SBSwitcherAsyncRenderingAttributes v6 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier proposedAppLayout];
  objc_super v7 = v6;
  if (self->_dragBeganInOtherSwitcher && ([v6 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
LABEL_15:
    SBRectWithSize();
    double v8 = v21;
    double v9 = v22;
    double v10 = v23;
    double v11 = v24;
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    if ([(SBAppLayout *)self->_initialMainAppLayout isFullScreen]
      && [(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialMainAppLayout])
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __72__SBMedusaWindowDragGestureSwitcherModifier__boundsForDraggingAppLayout__block_invoke;
      v43[3] = &unk_1E6B03348;
      v43[4] = self;
      uint64_t v12 = MEMORY[0x1D948C7A0](v43);
      int v13 = (void *)v12;
      switch(v4)
      {
        case 0:
        case 1:
        case 14:
          double v29 = SBAppLayoutGenericAppLayoutWithConfiguration(1);
          [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
          v42.receiver = self;
          v42.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v42, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v29);
          double v8 = v30;
          double v9 = v31;
          double v10 = v32;
          double v11 = v33;

          break;
        case 2:
        case 4:
          objc_super v34 = &SBLayoutRolePrimary;
          goto LABEL_20;
        case 3:
        case 5:
          objc_super v34 = &SBLayoutRoleSide;
LABEL_20:
          (*(void (**)(uint64_t, uint64_t))(v12 + 16))(v12, *v34);
          SBRectWithSize();
          double v8 = v35;
          double v9 = v36;
          double v10 = v37;
          double v11 = v38;
          break;
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          objc_super v15 = SBStringForWindowDragGestureDestination(v4);
          [v14 handleFailureInMethod:a2, self, @"SBMedusaWindowDragGestureSwitcherModifier.m", 653, @"Unsupported destination when dragging fullscreen app: %@", v15 object file lineNumber description];

          break;
        default:
          break;
      }
    }
    else
    {
      switch(v4)
      {
        case 0:
        case 1:
        case 14:
          objc_super v16 = SBAppLayoutGenericAppLayoutWithConfiguration(1);
          [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
          v41.receiver = self;
          v41.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v41, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v16);
          double v8 = v17;
          double v9 = v18;
          double v10 = v19;
          double v11 = v20;

          break;
        case 2:
        case 4:
        case 11:
          [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
          v40.receiver = self;
          v40.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v40, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v7);
          goto LABEL_15;
        case 3:
        case 5:
        case 12:
          [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
          v39.receiver = self;
          v39.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
          -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v39, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v7);
          goto LABEL_15;
        case 6:
        case 7:
        case 8:
        case 9:
          [(SBMedusaWindowDragGestureSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBMedusaWindowDragGestureSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:2];
          goto LABEL_15;
        case 10:
        case 13:
          [(SBMedusaWindowDragGestureSwitcherModifier *)self centerWindowFrameInInterfaceOrientation:v5 centerConfiguration:1];
          goto LABEL_15;
        default:
          break;
      }
    }
  }

  double v25 = v8;
  double v26 = v9;
  double v27 = v10;
  double v28 = v11;
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

double __72__SBMedusaWindowDragGestureSwitcherModifier__boundsForDraggingAppLayout__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = SBAppLayoutGenericAppLayoutWithConfiguration(3);
  [*(id *)(a1 + 32) containerViewBounds];
  objc_msgSend(v4, "frameForLayoutRole:inAppLayout:withBounds:", a2, v5);
  double v7 = v6;

  return v7;
}

- (CGRect)_initialTransformedFrameForDraggingAppLayout
{
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self _appLayoutContainingSelectedDisplayItem];
  uint64_t v4 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  uint64_t v5 = [v4 indexOfObject:v3];

  v39.receiver = self;
  v39.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v39 frameForIndex:v5];
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [v3 layoutRoleForItem:self->_selectedDisplayItem];
  SBRectWithSize();
  v38.receiver = self;
  v38.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  -[SBMedusaWindowDragGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v38, sel_frameForLayoutRole_inAppLayout_withBounds_, v10, v3);
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v7 + v15;
  CGFloat v18 = v9 + v17;
  v37.receiver = self;
  v37.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v37 scaleForIndex:v5];
  double v20 = v19;
  v36.receiver = self;
  v36.super_class = (Class)SBMedusaWindowDragGestureSwitcherModifier;
  [(SBMedusaWindowDragGestureSwitcherModifier *)&v36 scaleForLayoutRole:v10 inAppLayout:v3];
  CGFloat v22 = v20 * v21;
  UIRectGetCenter();
  CGAffineTransformMakeScale(&v35, v22, v22);
  v40.origin.double x = v16;
  v40.origin.double y = v18;
  v40.size.double width = v12;
  v40.size.double height = v14;
  CGRectApplyAffineTransform(v40, &v35);
  UIRectCenteredAboutPoint();
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (double)_distanceYToMaxTranslation
{
  [(SBMedusaWindowDragGestureSwitcherModifier *)self containerViewBounds];
  return v2 + -48.0;
}

- (double)_gestureProgressToMaxTranslationForTranslation:(double)a3
{
  [(SBMedusaWindowDragGestureSwitcherModifier *)self _distanceYToMaxTranslation];
  return a3 / v4;
}

- (double)_platterScale
{
  double v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self medusaSettings];
  [v3 windowPlatterScale];
  double v5 = v4;
  if ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination] == 1)
  {
    [v3 windowPlatterScaleForReplacingEntireSpace];
    double v5 = v6;
  }

  return v5;
}

- (double)_scaleForTranslation:(CGPoint)a3
{
  double y = a3.y;
  if ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone]&& [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier currentDestination])
  {
    [(SBMedusaWindowDragGestureSwitcherModifier *)self _platterScale];
  }
  else
  {
    [(SBMedusaWindowDragGestureSwitcherModifier *)self _gestureProgressToMaxTranslationForTranslation:y];
    double result = 1.0 - v6;
    if (result < 0.0) {
      double result = 0.0;
    }
    if (result >= 0.2)
    {
      if (result > 1.0)
      {
        BSUIConstrainValueWithRubberBand();
        return v8 + 1.0;
      }
    }
    else
    {
      BSUIConstrainValueWithRubberBand();
      return 0.2 - v7;
    }
  }
  return result;
}

- (BOOL)_updateHomeScreenStyleInteractively
{
  if (![(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone]|| (BOOL v3 = [(SBAppLayout *)self->_selectedLeafAppLayout isEqual:self->_initialMainAppLayout]))
  {
    LOBYTE(v3) = [(SBMedusaWindowDragGestureSwitcherModifier *)self _draggingFullScreenAppOrSplitView];
  }
  return v3;
}

- (BOOL)_draggingFullScreenAppOrSplitView
{
  BOOL v3 = [(SBAppLayout *)self->_initialMainAppLayout containsItem:self->_selectedDisplayItem];
  if (v3)
  {
    uint64_t v4 = [(SBAppLayout *)self->_initialMainAppLayout layoutRoleForItem:self->_selectedDisplayItem];
    LOBYTE(v3) = SBLayoutRoleIsValidForSplitView(v4);
  }
  return v3;
}

- (BOOL)_shouldPushInFullScreenContent
{
  if ([(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier hasEnteredPlatterZone])
  {
    return 1;
  }
  return [(SBMedusaWindowDragGestureSwitcherModifier *)self _draggingFullScreenAppOrSplitView];
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  double v2 = self;
  BOOL v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self proposedAppLayoutsForWindowDrag];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__SBMedusaWindowDragGestureSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E6AF4B60;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __93__SBMedusaWindowDragGestureSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 224)];
}

- (BOOL)_ourProposedAppLayoutContainsSelectedDisplayItem
{
  double v2 = self;
  BOOL v3 = [(SBMedusaWindowDragGestureDestinationModifier *)self->_destinationModifier proposedAppLayout];
  LOBYTE(v2) = [v3 containsItem:v2->_selectedDisplayItem];

  return (char)v2;
}

- (id)_appLayoutContainingSelectedDisplayItem
{
  BOOL v3 = [(SBMedusaWindowDragGestureSwitcherModifier *)self appLayouts];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__SBMedusaWindowDragGestureSwitcherModifier__appLayoutContainingSelectedDisplayItem__block_invoke;
  v6[3] = &unk_1E6AF4B60;
  v6[4] = self;
  uint64_t v4 = objc_msgSend(v3, "bs_firstObjectPassingTest:", v6);

  return v4;
}

uint64_t __84__SBMedusaWindowDragGestureSwitcherModifier__appLayoutContainingSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 224)];
}

- (SBAppLayout)selectedLeafAppLayout
{
  return self->_selectedLeafAppLayout;
}

- (SBAppLayout)initialMainAppLayout
{
  return self->_initialMainAppLayout;
}

- (SBAppLayout)initialFloatingAppLayout
{
  return self->_initialFloatingAppLayout;
}

- (int64_t)currentFloatingConfiguration
{
  return self->_currentFloatingConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_initialMainAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_destinationModifier, 0);
}

@end