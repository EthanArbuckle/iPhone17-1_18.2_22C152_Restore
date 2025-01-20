@interface SBContinuousExposeWindowDragSwitcherModifier
- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem;
- (BOOL)_isStripStashed;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGPoint)preferredCenterForSelectedItemInDestinationModifier:(id)a3 clippingToInitialStageArea:(BOOL)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)hoveringOverAppLayout;
- (SBAppLayout)initialAppLayout;
- (SBAppLayout)proposedAppLayout;
- (SBContinuousExposeWindowDragSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5;
- (SBDisplayItem)selectedDisplayItem;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)continuousExposeStripProgress;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (id)_appLayoutContainingDisplayItem:(id)a3;
- (id)_baseLayoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutOnStage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (void)_beginAnimatingAnchorPointRampingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)_beginStageRubberbandingRampingPropertyWithMode:(int64_t)a3 settings:(id)a4;
- (void)didMoveToParentModifier:(id)a3;
- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4;
@end

@implementation SBContinuousExposeWindowDragSwitcherModifier

- (SBContinuousExposeWindowDragSwitcherModifier)initWithGestureID:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  v12 = [(SBGestureSwitcherModifier *)&v24 initWithGestureID:a3];
  if (v12)
  {
    if (v11)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)v12 + 32, a4);
        objc_storeStrong((id *)v12 + 33, a5);
        *(_OWORD *)(v12 + 136) = SBInvalidPoint;
        v12[192] = [*((id *)v12 + 32) containsItem:*((void *)v12 + 33)];
        v13 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:*((void *)v12 + 33)];
        [v12 addChildModifier:v13];
        v14 = [[SBContinuousExposeWindowDragDestinationSwitcherModifier alloc] initWithSelectedDisplayItem:*((void *)v12 + 33) initialAppLayout:*((void *)v12 + 32) delegate:v12];
        v15 = (void *)*((void *)v12 + 28);
        *((void *)v12 + 28) = v14;

        [v12 addChildModifier:*((void *)v12 + 28)];
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
        v17 = (void *)*((void *)v12 + 27);
        *((void *)v12 + 27) = v16;

        [*((id *)v12 + 27) setResponse:0.36];
        [*((id *)v12 + 27) setDampingRatio:1.0];
        v18 = (void *)*((void *)v12 + 27);
        CAFrameRateRange v25 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
        objc_msgSend(v18, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
        v19 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
        v20 = (void *)*((void *)v12 + 31);
        *((void *)v12 + 31) = v19;

        goto LABEL_5;
      }
    }
    else
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, v12, @"SBContinuousExposeWindowDragSwitcherModifier.m", 60, @"Invalid parameter not satisfying: %@", @"selectedDisplayItem" object file lineNumber description];

      if (v10) {
        goto LABEL_4;
      }
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, v12, @"SBContinuousExposeWindowDragSwitcherModifier.m", 61, @"Invalid parameter not satisfying: %@", @"initialAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return (SBContinuousExposeWindowDragSwitcherModifier *)v12;
}

- (void)didMoveToParentModifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v7, sel_didMoveToParentModifier_);
  if (a3 && !self->_initialAutoLayoutSpace)
  {
    if (self->_initialAppLayout)
    {
      v5 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:"autoLayoutSpaceForAppLayout:"];
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      self->_initialAutoLayoutSpace = v5;

      objc_storeStrong((id *)&self->_previousAutoLayoutSpace, self->_initialAutoLayoutSpace);
    }
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  v4 = [(SBGestureSwitcherModifier *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_initialAppLayout withName:@"initialAppLayout"];
  id v6 = (id)[v4 appendObject:self->_selectedDisplayItem withName:@"selectedDisplayItem"];
  id v7 = (id)objc_msgSend(v4, "appendPoint:withName:", @"initialAnchorPoint", self->_initialAnchorPoint.x, self->_initialAnchorPoint.y);
  id v8 = (id)objc_msgSend(v4, "appendPoint:withName:", @"anchorPoint", self->_anchorPoint.x, self->_anchorPoint.y);
  return v4;
}

- (SBAppLayout)proposedAppLayout
{
  return [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
}

- (id)appLayoutByAddingAppLayout:(id)a3 toAppLayout:(id)a4
{
  return [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier appLayoutByAddingAppLayout:a3 toAppLayout:a4];
}

- (void)updateProposedAppLayoutWithAppLayout:(id)a3 andInitialAppLayout:(id)a4
{
  objc_storeStrong((id *)&self->_initialAppLayout, a4);
  id v7 = a4;
  id v8 = a3;
  [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier updateProposedAppLayoutWithAppLayout:v8 andInitialAppLayout:v7];
}

- (CGPoint)preferredCenterForSelectedItemInDestinationModifier:(id)a3 clippingToInitialStageArea:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
  id v7 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  uint64_t v8 = [v7 indexOfObject:v6];

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double x = self->_location.x;
    double y = self->_location.y;
  }
  else
  {
    [(SBContinuousExposeWindowDragSwitcherModifier *)self frameForIndex:v8];
    double v12 = v11;
    double v14 = v13;
    [(SBContinuousExposeWindowDragSwitcherModifier *)self scaleForIndex:v8];
    double x = self->_location.x + (0.5 - self->_anchorPoint.x) * (v15 * v12);
    double y = self->_location.y + (0.5 - self->_anchorPoint.y) * (v15 * v14);
    if (v4)
    {
      initialAutoLayoutSpace = self->_initialAutoLayoutSpace;
      if (initialAutoLayoutSpace)
      {
        [(SBContinuousExposeAutoLayoutSpace *)initialAutoLayoutSpace stageArea];
        CGFloat v18 = v17;
        CGFloat v20 = v19;
        CGFloat v22 = v21;
        CGFloat v24 = v23;
        [(SBContinuousExposeAutoLayoutSpace *)self->_initialAutoLayoutSpace boundingBox];
        v35.origin.double x = v25;
        v35.origin.double y = v26;
        v35.size.width = v27;
        v35.size.height = v28;
        v33.origin.double x = v18;
        v33.origin.double y = v20;
        v33.size.width = v22;
        v33.size.height = v24;
        CGRect v34 = CGRectUnion(v33, v35);
        double v29 = v12 * 0.5 + v34.origin.x;
        if (x < v29) {
          double x = v29;
        }
        if (y >= v34.origin.y + v34.size.height - v14 * 0.5) {
          double y = v34.origin.y + v34.size.height - v14 * 0.5;
        }
      }
    }
  }

  double v30 = x;
  double v31 = y;
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (id)handleEvent:(id)a3
{
  destinationModifier = self->_destinationModifier;
  id v5 = a3;
  id v6 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)destinationModifier proposedAppLayout];
  int v7 = [v6 containsItem:self->_selectedDisplayItem];

  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  uint64_t v8 = [(SBGestureSwitcherModifier *)&v16 handleEvent:v5];

  v9 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
  int v10 = [v9 containsItem:self->_selectedDisplayItem];

  if (v7 != v10)
  {
    double v11 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _baseLayoutSettings];
    [(SBContinuousExposeWindowDragSwitcherModifier *)self _beginAnimatingAnchorPointRampingPropertyWithMode:3 settings:v11];
  }
  double v12 = [(SBContinuousExposeWindowDragSwitcherModifier *)self proposedAppLayout];
  double v13 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v12];
  previousAutoLayoutSpace = self->_previousAutoLayoutSpace;
  self->_previousAutoLayoutSpace = v13;

  return v8;
}

- (id)handleGestureEvent:(id)a3
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v186.receiver = self;
  v186.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  id v5 = [(SBGestureSwitcherModifier *)&v186 handleGestureEvent:v4];
  p_location = &self->_location;
  [v4 locationInContainerView];
  self->_location.double x = v7;
  self->_location.double y = v8;
  v9 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  BOOL v10 = ([v4 isCanceled] & 1) != 0
     || [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedDestination] == 0;
  self->_gestureWasCanceled = v10;
  uint64_t v11 = [v4 phase];
  double v12 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
  uint64_t v174 = v11;
  if (v11 == 1)
  {
    uint64_t v13 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    double v14 = [(SBContinuousExposeWindowDragSwitcherModifier *)self draggingAppLayoutsForWindowDrag];
    v185[0] = MEMORY[0x1E4F143A8];
    v185[1] = 3221225472;
    v185[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke;
    v185[3] = &unk_1E6AF4B60;
    v185[4] = self;
    double v15 = objc_msgSend(v14, "bs_firstObjectPassingTest:", v185);

    [v4 sizeOfSelectedDisplayItem];
    self->_sizeOfSelectedDisplayItem.double width = v16;
    self->_sizeOfSelectedDisplayItem.double height = v17;
    uint64_t v18 = [v15 preferredDisplayOrdinal];
    self->_dragBeganInOtherSwitcher = v18 != [(SBContinuousExposeWindowDragSwitcherModifier *)self displayOrdinal];
    char v19 = [v4 isDraggingFromContinuousExposeStrips];
    self->_dragBeganInAnyStrip = v19;
    self->_dragBeganOnAnyStage = v19 ^ 1;
    if (v13)
    {
      CGFloat v20 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
      uint64_t v21 = [v20 indexOfObject:v13];

      [v4 locationInSelectedDisplayItem];
      double v23 = v22;
      double v25 = v24;
      if (self->_dragBeganInOtherSwitcher)
      {
        double width = self->_sizeOfSelectedDisplayItem.width;
        double height = self->_sizeOfSelectedDisplayItem.height;
      }
      else
      {
        v184.receiver = self;
        v184.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
        [(SBContinuousExposeWindowDragSwitcherModifier *)&v184 frameForIndex:v21];
        uint64_t v68 = [(id)v13 layoutRoleForItem:self->_selectedDisplayItem];
        SBRectWithSize();
        v183.receiver = self;
        v183.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
        -[SBContinuousExposeWindowDragSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v183, sel_frameForLayoutRole_inAppLayout_withBounds_, v68, v13);
      }
      self->_anchorPoint.double x = v23 / width;
      self->_anchorPoint.double y = v25 / height;
      self->_initialAnchorPoint = self->_anchorPoint;
      v69 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
      v70 = SBAppendSwitcherModifierResponse(v69, v5);

      v71 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
      id v5 = SBAppendSwitcherModifierResponse(v71, v70);
    }
    LOBYTE(v13) = [(SBContinuousExposeWindowDragSwitcherModifier *)self isPartiallyOffscreenWindowsEnabled];
    v9 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    double v12 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    goto LABEL_25;
  }
  uint64_t v28 = v11;
  LODWORD(v13) = [(SBContinuousExposeWindowDragSwitcherModifier *)self isPartiallyOffscreenWindowsEnabled];
  if (v28 == 2
    && ([(SBContinuousExposeWindowDragSwitcherModifier *)self prefersDockHidden] & 1) == 0)
  {
    double v29 = [(SBContinuousExposeWindowDragSwitcherModifier *)self proposedAppLayout];
    double v30 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v29];

    double v12 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
    double v31 = [v30 autoLayoutItemForDisplayItemIfExists:self->_selectedDisplayItem];
    if (!v31)
    {
LABEL_24:

      goto LABEL_25;
    }
    double x = p_location->x;
    double y = self->_location.y;
    CGRect v34 = v31;
    [v30 stageArea];
    double v36 = v35;
    double v38 = v37;
    id v168 = v34;
    [v34 size];
    double v166 = v39;
    double v40 = x + (0.5 - self->_anchorPoint.x) * v39;
    double v170 = v41;
    double v42 = y + (0.5 - self->_anchorPoint.y) * v41;
    v172 = v30;
    if (v13)
    {
      v43 = (void *)[v30 mutableCopy];
      v160 = [v43 autoLayoutItemForDisplayItem:self->_selectedDisplayItem];
      objc_msgSend(v160, "setPosition:", v40, v42);
      v44 = [SBContinuousExposeAutoLayoutConfiguration alloc];
      [(SBContinuousExposeWindowDragSwitcherModifier *)self containerViewBounds];
      double v46 = v45;
      double v48 = v47;
      double v159 = v38;
      double v50 = v49;
      double v163 = v51;
      [(SBContinuousExposeWindowDragSwitcherModifier *)self screenScale];
      double v53 = v52;
      [(SBContinuousExposeWindowDragSwitcherModifier *)self floatingDockHeight];
      double v54 = v42;
      double v55 = v40;
      double v56 = v36;
      double v58 = v57;
      v59 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
      double v60 = v50;
      double v38 = v159;
      double v61 = v58;
      double v36 = v56;
      double v40 = v55;
      double v42 = v54;
      uint64_t v62 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:](v44, "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v59, v46, v48, v60, v163, v53, v61);

      v162 = (void *)v62;
      v164 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController spaceByPerformingAutoLayoutWithSpace:v43 previousSpace:0 configuration:v62 options:0];
      [v164 stageArea];
      double v64 = v63;
      [(SBContinuousExposeWindowDragSwitcherModifier *)self containerViewBounds];
      double v66 = v65;
      [(SBContinuousExposeWindowDragSwitcherModifier *)self floatingDockHeight];
      if (v64 + v67 > v66)
      {
LABEL_21:
        v75 = (void *)[v172 mutableCopy];

        v76 = [v75 autoLayoutItemForDisplayItem:self->_selectedDisplayItem];

        v161 = v76;
        objc_msgSend(v76, "setPosition:", v40, v42);
        v77 = [SBContinuousExposeAutoLayoutConfiguration alloc];
        [(SBContinuousExposeWindowDragSwitcherModifier *)self containerViewBounds];
        double v79 = v78;
        double v81 = v80;
        double v83 = v82;
        double v85 = v84;
        [(SBContinuousExposeWindowDragSwitcherModifier *)self screenScale];
        double v87 = v86;
        [(SBContinuousExposeWindowDragSwitcherModifier *)self floatingDockHeight];
        double v89 = v88;
        v90 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
        v91 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:](v77, "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v90, v79, v81, v83, v85, v87, v89);

        v92 = [(SBContinuousExposeAutoLayoutController *)self->_autoLayoutController spaceByPerformingAutoLayoutWithSpace:v75 previousSpace:0 configuration:v91 options:0];

        [v92 stageArea];
        double v95 = v93 + v94;
        [(SBContinuousExposeAutoLayoutSpace *)self->_previousAutoLayoutSpace stageArea];
        if (v95 != v96 + v97) {
          [(SBContinuousExposeWindowDragSwitcherModifier *)self _beginStageRubberbandingRampingPropertyWithMode:3 settings:self->_stageRubberbandingSettings];
        }
        CGFloat v98 = v42 - (0.5 - self->_anchorPoint.y) * v170;
        p_location->double x = v40 - (0.5 - self->_anchorPoint.x) * v166;
        self->_location.double y = v98;

        v9 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
        double v12 = &OBJC_IVAR___SBWakeDebounceFilter__overrideTime;
        double v30 = v172;
        double v31 = v168;
        goto LABEL_24;
      }
    }
    else
    {
      v43 = 0;
      v160 = 0;
      v162 = 0;
      v164 = 0;
    }
    v72 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
    int v73 = [v72 isAutoLayoutEnabled];

    if (v73)
    {
      *(double *)&v182[5] = v36 + v170 * 0.5;
      *(double *)&v182[7] = v36 + v38 - v170 * 0.5;
      v182[6] = 1;
      v182[8] = 1;
      BSUIConstrainValueToIntervalWithRubberBand();
      double v42 = v74;
    }
    goto LABEL_21;
  }
LABEL_25:
  BOOL v99 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem];
  uint64_t v100 = v9[289];
  v101 = [*(id *)((char *)&self->super.super.super.super.isa + v100) proposedAppLayout];
  uint64_t v102 = v12[286];
  int v103 = [v101 containsItem:*(Class *)((char *)&self->super.super.super.super.isa + v102)];

  if (self->_dragBeganInOurSwitcher && (v103 & 1) == 0 && v99
    || (self->_dragBeganInOtherSwitcher ? (int v104 = v103) : (int v104 = 0),
        v104 == 1 || (self->_dragBeganInAnyStrip ? (BOOL v105 = v99) : (BOOL v105 = 0), v105)))
  {
    __asm { FMOV            V0.2D, #0.5 }
    self->_anchorPoint = _Q0;
  }
  else
  {
    char v149 = !self->_dragBeganOnAnyStage || v99;
    p_anchorPoint = &self->_anchorPoint;
    if (v149) {
      CGPoint *p_anchorPoint = self->_initialAnchorPoint;
    }
    else {
      p_anchorPoint->double x = 0.4;
    }
  }
  if (v174 != 3) {
    goto LABEL_72;
  }
  if (self->_gestureWasCanceled)
  {
    v111 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:self->_initialAppLayout];
    v112 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v111 gestureInitiated:1];
    uint64_t v113 = SBAppendSwitcherModifierResponse(v112, v5);

    id v5 = (void *)v113;
    goto LABEL_72;
  }
  v114 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  v182[0] = MEMORY[0x1E4F143A8];
  v182[1] = 3221225472;
  v182[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_2;
  v182[3] = &unk_1E6AF4B60;
  v182[4] = self;
  v115 = objc_msgSend(v114, "bs_firstObjectPassingTest:", v182);

  v116 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  uint64_t v117 = [v116 indexOfObject:v115];

  v118 = [*(id *)((char *)&self->super.super.super.super.isa + v100) proposedAppLayout];
  v119 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
  [v119 maximumWindowHeightWithDock];
  [v119 screenEdgePadding];
  [(SBContinuousExposeWindowDragSwitcherModifier *)self frameForIndex:v117];
  [(SBContinuousExposeWindowDragSwitcherModifier *)self anchorPointForIndex:v117];
  UIRectGetCenter();
  [v4 velocityInContainerView];
  if (v13) {
    goto LABEL_46;
  }
  double v122 = v120;
  double v123 = v121;
  if (![v119 isAutoLayoutEnabled]) {
    goto LABEL_46;
  }
  char v124 = 0;
  if (v123 <= 2500.0 || v123 <= fabs(v122)) {
    goto LABEL_47;
  }
  if (BSFloatGreaterThanOrEqualToFloat())
  {
    v181[0] = MEMORY[0x1E4F143A8];
    v181[1] = 3221225472;
    v181[2] = __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_3;
    v181[3] = &unk_1E6AF4B38;
    v181[4] = self;
    [v118 appLayoutWithItemsPassingTest:v181];
    uint64_t v126 = v125 = v119;

    char v124 = 1;
    v118 = (void *)v126;
    v119 = v125;
  }
  else
  {
LABEL_46:
    char v124 = 0;
  }
LABEL_47:
  if ([v118 containsItem:*(Class *)((char *)&self->super.super.super.super.isa + v102)])
  {
    char v167 = v124;
    id v169 = v119;
    v171 = v115;
    id v173 = v4;
    v175 = v5;
    [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v118];
    long long v177 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    v165 = long long v180 = 0u;
    v127 = [v165 items];
    uint64_t v128 = [v127 countByEnumeratingWithState:&v177 objects:v187 count:16];
    if (v128)
    {
      uint64_t v129 = v128;
      uint64_t v130 = *(void *)v178;
      do
      {
        uint64_t v131 = 0;
        v132 = v118;
        do
        {
          if (*(void *)v178 != v130) {
            objc_enumerationMutation(v127);
          }
          v133 = *(void **)(*((void *)&v177 + 1) + 8 * v131);
          v134 = [v133 displayItem];
          [v133 position];
          double v136 = v135;
          double v138 = v137;
          [(SBContinuousExposeWindowDragSwitcherModifier *)self containerViewBounds];
          +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v136, v138, v139, v140, v141, v142);
          double v144 = v143;
          double v146 = v145;
          v147 = [v132 layoutAttributesForItem:v134];
          v148 = objc_msgSend(v147, "attributesByModifyingNormalizedCenter:", v144, v146);

          v118 = [v132 appLayoutByModifyingLayoutAttributes:v148 forItem:v134];

          ++v131;
          v132 = v118;
        }
        while (v129 != v131);
        uint64_t v129 = [v127 countByEnumeratingWithState:&v177 objects:v187 count:16];
      }
      while (v129);
    }

    if ((v167 & 1) == 0)
    {
      uint64_t v151 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayoutByBringingItemToFront:*(Class *)((char *)&self->super.super.super.super.isa + v102) inAppLayout:v118];

      v118 = (void *)v151;
    }
    id v4 = v173;
    id v5 = v175;
    v115 = v171;

    v119 = v169;
  }
  if (!v118)
  {
    v118 = +[SBAppLayout homeScreenAppLayout];
  }
  v152 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v118];
  v153 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v152 gestureInitiated:1];
  v154 = SBAppendSwitcherModifierResponse(v153, v5);

  [(SBContinuousExposeWindowDragSwitcherModifier *)self continuousExposeStripProgress];
  v176.receiver = self;
  v176.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  [(SBContinuousExposeWindowDragSwitcherModifier *)&v176 continuousExposeStripProgress];
  char v155 = BSFloatEqualToFloat();
  if (v118
    && (v155 & 1) == 0
    && ([v118 containsItem:*(Class *)((char *)&self->super.super.super.super.isa + v102)] & 1) == 0)
  {
    v156 = [[SBUpdateContinuousExposeStripsPresentationResponse alloc] initWithPresentationOptions:1 dismissalOptions:0];
    uint64_t v157 = SBAppendSwitcherModifierResponse(v156, v154);

    v154 = (void *)v157;
  }

  id v5 = v154;
LABEL_72:

  return v5;
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 264)];
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 264)];
}

uint64_t __67__SBContinuousExposeWindowDragSwitcherModifier_handleGestureEvent___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(*(void *)(a1 + 32) + 264)] ^ 1;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  id v5 = [(SBGestureSwitcherModifier *)&v7 handleTransitionEvent:v4];
  if ((unint64_t)[v4 phase] >= 2
    && ([v4 isAppLaunchDuringWindowDragGestureTransition] & 1) == 0)
  {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  id v5 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
  if ([v5 containsAllItemsFromAppLayout:v4])
  {
    id v6 = v5;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    id v6 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v9 appLayoutContainingAppLayout:v4];
  }
  objc_super v7 = v6;

  return v7;
}

- (id)appLayoutOnStage
{
  return [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
}

- (SBAppLayout)hoveringOverAppLayout
{
  return [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier hoveringOverAppLayout];
}

- (double)continuousExposeStripProgress
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  [(SBContinuousExposeWindowDragSwitcherModifier *)&v8 continuousExposeStripProgress];
  double v4 = v3;
  if ([(SBContinuousExposeWindowDragSwitcherModifier *)self _isStripStashed])
  {
    id v5 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
    if ([v5 containsItem:self->_selectedDisplayItem])
    {
    }
    else
    {
      BOOL v6 = [(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem];

      if (v6) {
        return 1.0;
      }
    }
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if (![v6 containsItem:self->_selectedDisplayItem]
    || (self->_anchorPoint.x == 1.79769313e308 ? (BOOL v7 = self->_anchorPoint.y == 1.79769313e308) : (BOOL v7 = 0), v7))
  {
    v45.receiver = self;
    v45.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v45 frameForIndex:a3];
  }
  else
  {
    BOOL v8 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem];
    objc_super v9 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
    char v10 = [v9 containsItem:self->_selectedDisplayItem];

    BOOL v11 = !self->_dragBeganInOtherSwitcher || !v8;
    if (v11 || (v10 & 1) != 0)
    {
      CGFloat v16 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
      if ([v16 containsItem:self->_selectedDisplayItem]) {
        CGFloat v17 = v16;
      }
      else {
        CGFloat v17 = v6;
      }
      id v18 = v17;
      char v19 = [(SBContinuousExposeWindowDragSwitcherModifier *)self displayItemLayoutAttributesCalculator];
      uint64_t v20 = [v18 layoutRoleForItem:self->_selectedDisplayItem];
      [(SBContinuousExposeWindowDragSwitcherModifier *)self containerViewBounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      uint64_t v29 = [(SBContinuousExposeWindowDragSwitcherModifier *)self switcherInterfaceOrientation];
      double v30 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
      [(SBContinuousExposeWindowDragSwitcherModifier *)self floatingDockHeight];
      double v32 = v31;
      [(SBContinuousExposeWindowDragSwitcherModifier *)self screenScale];
      double v34 = v33;
      uint64_t v35 = [(SBContinuousExposeWindowDragSwitcherModifier *)self prefersStripHidden];
      LOBYTE(v44) = [(SBContinuousExposeWindowDragSwitcherModifier *)self prefersDockHidden];
      objc_msgSend(v19, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v20, v18, v29, v30, 1, v35, v22, v24, v26, v28, v32, v34, v44);
    }
    if (SBSizeEqualsSize())
    {
      v46.receiver = self;
      v46.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
      [(SBContinuousExposeWindowDragSwitcherModifier *)&v46 frameForIndex:a3];
    }
    SBRectWithSize();
    UIRectCenteredAboutPoint();
  }
  double v36 = v12;
  double v37 = v13;
  double v38 = v14;
  double v39 = v15;

  double v40 = v36;
  double v41 = v37;
  double v42 = v38;
  double v43 = v39;
  result.size.double height = v43;
  result.size.double width = v42;
  result.origin.double y = v41;
  result.origin.double x = v40;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if (![v6 containsItem:self->_selectedDisplayItem]
    || (self->_anchorPoint.x == 1.79769313e308 ? (BOOL v7 = self->_anchorPoint.y == 1.79769313e308) : (BOOL v7 = 0), v7))
  {
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](&v16, sel_scaleForIndex_, a3, self, SBContinuousExposeWindowDragSwitcherModifier, v17.receiver, v17.super_class);
LABEL_10:
    double v8 = v9;
    goto LABEL_11;
  }
  if (self->_dragBeganInAnyStrip)
  {
    if ([(SBContinuousExposeWindowDragSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem])
    {
      double v8 = 0.6;
      goto LABEL_11;
    }
LABEL_24:
    double v14 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
    [v14 stripCardScale];
    double v8 = v15;

    goto LABEL_11;
  }
  if (!self->_dragBeganOnAnyStage)
  {
    -[SBContinuousExposeWindowDragSwitcherModifier scaleForIndex:](&v17, sel_scaleForIndex_, a3, v16.receiver, v16.super_class, self, SBContinuousExposeWindowDragSwitcherModifier);
    goto LABEL_10;
  }
  BOOL v11 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem];
  double v12 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
  int v13 = [v12 containsItem:self->_selectedDisplayItem];

  if (self->_dragBeganInOtherSwitcher)
  {
    if (v13) {
      double v8 = 0.6;
    }
    else {
      double v8 = 1.0;
    }
    if (((v13 | v11) & 1) == 0) {
      goto LABEL_24;
    }
  }
  else
  {
    if (v13) {
      double v8 = 1.0;
    }
    else {
      double v8 = 0.6;
    }
    if (((v13 | v11) & 1) == 0) {
      goto LABEL_24;
    }
  }
LABEL_11:

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if (![v6 containsItem:self->_selectedDisplayItem]
    || ((double x = self->_anchorPoint.x, y = self->_anchorPoint.y, x == 1.79769313e308)
      ? (BOOL v9 = y == 1.79769313e308)
      : (BOOL v9 = 0),
        v9))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v14 anchorPointForIndex:a3];
    double x = v10;
    double y = v11;
  }

  double v12 = x;
  double v13 = y;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    BOOL v7 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if (![v6 containsItem:self->_selectedDisplayItem]
    || (self->_anchorPoint.x == 1.79769313e308 ? (BOOL v7 = self->_anchorPoint.y == 1.79769313e308) : (BOOL v7 = 0), v7))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    BOOL v8 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v10 shouldPinLayoutRolesToSpace:a3];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if (![v11 containsItem:self->_selectedDisplayItem]
    || (self->_anchorPoint.x == 1.79769313e308 ? (BOOL v12 = self->_anchorPoint.y == 1.79769313e308) : (BOOL v12 = 0), v12))
  {
    v21.receiver = self;
    v21.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    -[SBContinuousExposeWindowDragSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v21, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double x = v13;
    double y = v14;
    double width = v15;
    double height = v16;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  double v9 = 1.0;
  if (([v8 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  BOOL v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    BOOL v7 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
    id v8 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
    if ([v7 containsItem:self->_selectedDisplayItem])
    {
      [(SBContinuousExposeWindowDragSwitcherModifier *)self displayCornerRadius];
      double v9 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
      [v9 stageCornerRadii];

      if ([(SBSwitcherModifier *)self appLayoutContainsFullScreenDisplayItem:v6])
      {
        BSFloatIsZero();
      }
    }
    else
    {
      [v8 stripCornerRadii];
    }
    [(SBContinuousExposeWindowDragSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
    double v11 = v18;
    double v13 = v19;
    double v15 = v20;
    double v17 = v21;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v26 cornerRadiiForIndex:a3];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }

  double v22 = v11;
  double v23 = v13;
  double v24 = v15;
  double v25 = v17;
  result.topRight = v25;
  result.bottomRight = v24;
  result.bottomLeft = v23;
  result.topLeft = v22;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  initialAppLayout = self->_initialAppLayout;
  id v8 = [v6 itemForLayoutRole:a3];
  if ([(SBAppLayout *)initialAppLayout containsItem:v8])
  {
  }
  else
  {
    selectedDisplayItem = self->_selectedDisplayItem;
    double v10 = [v6 itemForLayoutRole:a3];
    LOBYTE(selectedDisplayItem) = [(SBDisplayItem *)selectedDisplayItem isEqual:v10];

    if ((selectedDisplayItem & 1) == 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
      BOOL v11 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v13 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
      goto LABEL_6;
    }
  }
  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_initialAppLayout containsAnyItemFromAppLayout:v4]
    || ([v4 containsItem:self->_selectedDisplayItem] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    BOOL v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v7 wantsSceneResizesHostedContextForAppLayout:v4];
  }

  return v5;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  double v3 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v7 visibleAppLayouts];
  id v4 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
  if (v4)
  {
    uint64_t v5 = [v3 setByAddingObject:v4];

    double v3 = (void *)v5;
  }

  return v3;
}

- (id)topMostLayoutElements
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  double v3 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v7 topMostLayoutElements];
  id v4 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v4, 0);

    double v3 = (void *)v5;
  }

  return v3;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
  uint64_t v5 = [(SBGestureSwitcherModifier *)&v38 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType]
    && [v4 containsItem:self->_selectedDisplayItem])
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    objc_super v7 = [(SBContinuousExposeWindowDragSwitcherModifier *)self _baseLayoutSettings];
    [v7 dampingRatio];
    objc_msgSend(v6, "setTrackingDampingRatio:");
    [v7 response];
    objc_msgSend(v6, "setTrackingResponse:");
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    double v9 = [(SBContinuousExposeWindowDragSwitcherModifier *)self switcherSettings];
    double v10 = [v9 chamoisSettings];
    BOOL v11 = [v10 windowDragAnimationSettings];

    anchorPointRampingPropertdouble y = self->_anchorPointRampingProperty;
    if (anchorPointRampingProperty)
    {
      [(UIViewFloatAnimatableProperty *)anchorPointRampingProperty presentationValue];
      double v14 = v13;
      [v11 trackingResponse];
      double v16 = v15;
      [v6 trackingResponse];
      double v18 = v14 * (v16 - v17);
      [v6 trackingResponse];
      double v20 = v19 + v18;
    }
    else
    {
      [v11 trackingResponse];
    }
    [v8 setTrackingResponse:v20];
    [v11 trackingDampingRatio];
    objc_msgSend(v8, "setTrackingDampingRatio:");
    CAFrameRateRange v40 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v8, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v40.minimum, *(double *)&v40.maximum, *(double *)&v40.preferred);
    stageRubberbandingRampingPropertdouble y = self->_stageRubberbandingRampingProperty;
    if (stageRubberbandingRampingProperty)
    {
      [(UIViewFloatAnimatableProperty *)stageRubberbandingRampingProperty presentationValue];
      double v23 = v22;
      [v8 trackingResponse];
      double v25 = v24;
      [(SBFFluidBehaviorSettings *)self->_stageRubberbandingSettings response];
      double v27 = v23 * (v25 - v26);
      [(SBFFluidBehaviorSettings *)self->_stageRubberbandingSettings response];
      double v29 = v27 + v28;
      [v8 trackingDampingRatio];
      double v31 = v30;
      [(SBFFluidBehaviorSettings *)self->_stageRubberbandingSettings dampingRatio];
      double v33 = v23 * (v31 - v32);
      [(SBFFluidBehaviorSettings *)self->_stageRubberbandingSettings dampingRatio];
      double v35 = v33 + v34;
      [v8 setTrackingResponse:v29];
      [v8 setTrackingDampingRatio:v35];
    }
    double v36 = (void *)[v5 mutableCopy];
    [v36 setLayoutSettings:v6];
    [v36 setPositionSettings:v8];

    uint64_t v5 = v36;
  }

  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = 0.0;
  if (([v6 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v10 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
    double v7 = v8;
  }

  return v7;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (![v6 containsItem:self->_selectedDisplayItem]
    || (double v7 = 0.0, [(SBGestureSwitcherModifier *)self gesturePhase] <= 1))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v10 titleAndIconOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 containsItem:self->_selectedDisplayItem])
  {
    double v5 = 0.0;
    if (![(SBContinuousExposeWindowDragSwitcherModifier *)self _anyProposedAppLayoutContainsSelectedDisplayItem])
    {
      int v6 = [(SBContinuousExposeWindowDragSwitcherModifier *)self isRTLEnabled];
      double v7 = [(SBContinuousExposeWindowDragSwitcherModifier *)self chamoisLayoutAttributes];
      [v7 stripTiltAngle];
      double v5 = v8;
      if (v6) {
        double v5 = -v8;
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v11 perspectiveAngleForAppLayout:v4];
    double v5 = v9;
  }

  return v5;
}

- (SBSwitcherWallpaperGradientAttributes)wallpaperGradientAttributesForIndex:(unint64_t)a3
{
  double v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  int v6 = [v5 objectAtIndex:a3];

  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    Emptdouble y = SBSwitcherWallpaperGradientAttributesMakeEmpty();
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    [(SBContinuousExposeWindowDragSwitcherModifier *)&v13 wallpaperGradientAttributesForIndex:a3];
  }
  double v9 = Empty;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.trailingAlpha = v12;
  result.leadingAlpha = v11;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 containsItem:self->_selectedDisplayItem]
    && ([(SBContinuousExposeWindowDragSwitcherModifier *)self proposedAppLayout],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsItem:self->_selectedDisplayItem],
        v7,
        !v8))
  {
    int64_t v9 = 2;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragSwitcherModifier;
    int64_t v9 = [(SBContinuousExposeWindowDragSwitcherModifier *)&v11 shadowStyleForLayoutRole:a3 inAppLayout:v6];
  }

  return v9;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (void)_beginStageRubberbandingRampingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6 = a4;
  stageRubberbandingRampingPropertdouble y = self->_stageRubberbandingRampingProperty;
  if (stageRubberbandingRampingProperty)
  {
    [(UIViewFloatAnimatableProperty *)stageRubberbandingRampingProperty invalidate];
    int v8 = self->_stageRubberbandingRampingProperty;
    self->_stageRubberbandingRampingPropertdouble y = 0;
  }
  int64_t v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  double v10 = self->_stageRubberbandingRampingProperty;
  self->_stageRubberbandingRampingPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_stageRubberbandingRampingProperty setValue:0.0];
  objc_super v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114112, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  double v16 = self->_stageRubberbandingRampingProperty;
  double v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  double v18 = v16;
  double v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) setValue:1.0];
}

void __105__SBContinuousExposeWindowDragSwitcherModifier__beginStageRubberbandingRampingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[26];
    id v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[26];
      v6[26] = 0;
    }
    WeakRetained = v6;
  }
}

- (void)_beginAnimatingAnchorPointRampingPropertyWithMode:(int64_t)a3 settings:(id)a4
{
  id v6 = a4;
  anchorPointRampingPropertdouble y = self->_anchorPointRampingProperty;
  if (anchorPointRampingProperty)
  {
    [(UIViewFloatAnimatableProperty *)anchorPointRampingProperty invalidate];
    int v8 = self->_anchorPointRampingProperty;
    self->_anchorPointRampingPropertdouble y = 0;
  }
  int64_t v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E4F43000]);
  double v10 = self->_anchorPointRampingProperty;
  self->_anchorPointRampingPropertdouble y = v9;

  [(UIViewFloatAnimatableProperty *)self->_anchorPointRampingProperty setValue:0.0];
  objc_super v11 = (void *)[v6 copy];
  LODWORD(v12) = *MEMORY[0x1E4F39AF0];
  LODWORD(v13) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v14) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114112, v12, v13, v14);
  id v15 = v11;

  objc_initWeak(&location, self);
  double v16 = self->_anchorPointRampingProperty;
  double v17 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke;
  v22[3] = &unk_1E6AF4AC0;
  v22[4] = self;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke_2;
  v19[3] = &unk_1E6AFBE70;
  objc_copyWeak(&v21, &location);
  double v18 = v16;
  double v20 = v18;
  objc_msgSend(v17, "sb_animateWithSettings:mode:animations:completion:", v15, a3, v22, v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

uint64_t __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) setValue:1.0];
}

void __107__SBContinuousExposeWindowDragSwitcherModifier__beginAnimatingAnchorPointRampingPropertyWithMode_settings___block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = WeakRetained[25];
    id v4 = v3;
    if (v3 && v3 == *(id *)(a1 + 32))
    {
      id v5 = v6[25];
      v6[25] = 0;
    }
    WeakRetained = v6;
  }
}

- (id)_baseLayoutSettings
{
  v2 = [(SBContinuousExposeWindowDragSwitcherModifier *)self medusaSettings];
  id v3 = [v2 resizeAnimationSettings];

  return v3;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBContinuousExposeWindowDragSwitcherModifier *)self appLayouts];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__SBContinuousExposeWindowDragSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  v9[3] = &unk_1E6AF4B60;
  id v10 = v4;
  id v6 = v4;
  double v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __80__SBContinuousExposeWindowDragSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (BOOL)_isStripStashed
{
  id v3 = [(SBContinuousExposeWindowDragDestinationSwitcherModifier *)self->_destinationModifier proposedAppLayout];
  id v4 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v3];

  LOBYTE(v3) = [v4 isStripVisible] ^ 1;
  return (char)v3;
}

- (BOOL)_anyProposedAppLayoutContainsSelectedDisplayItem
{
  v2 = self;
  id v3 = [(SBContinuousExposeWindowDragSwitcherModifier *)self proposedAppLayoutsForWindowDrag];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __96__SBContinuousExposeWindowDragSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke;
  v5[3] = &unk_1E6AF4B60;
  v5[4] = v2;
  LOBYTE(v2) = objc_msgSend(v3, "bs_containsObjectPassingTest:", v5);

  return (char)v2;
}

uint64_t __96__SBContinuousExposeWindowDragSwitcherModifier__anyProposedAppLayoutContainsSelectedDisplayItem__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 264)];
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_previousAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_initialAutoLayoutSpace, 0);
  objc_storeStrong((id *)&self->_destinationModifier, 0);
  objc_storeStrong((id *)&self->_stageRubberbandingSettings, 0);
  objc_storeStrong((id *)&self->_stageRubberbandingRampingProperty, 0);
  objc_storeStrong((id *)&self->_anchorPointRampingProperty, 0);
}

@end