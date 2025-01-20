@interface SBContinuousExposeWindowDragContainerSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3;
- (CGRect)_boundingBoxForCurrentStage;
- (SBAppLayout)initialAppLayout;
- (SBContinuousExposeWindowDragContainerSwitcherModifier)initWithAppLayouts:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5 windowDragContentSwitcherModifier:(id)a6;
- (SBContinuousExposeWindowDragContentSwitcherModifier)windowDragContentSwitcherModifier;
- (SBContinuousExposeWindowDragSwitcherModifier)windowDragModifier;
- (SBDisplayItem)selectedDisplayItem;
- (double)_dockProgressForDraggedWindow;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)continuousExposeStripProgress;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dockProgress;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_appLayoutContainingDisplayItem:(id)a3;
- (id)_createInterceptableTransitionRequestForActivatingAppLayout:(id)a3 withSelectedDisplayItem:(id)a4;
- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutOnStage;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)routingModifier:(id)a3 topMostLayoutElementsByModifier:(id)a4;
- (id)topMostLayoutElements;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBContinuousExposeWindowDragContainerSwitcherModifier

- (SBContinuousExposeWindowDragContainerSwitcherModifier)initWithAppLayouts:(id)a3 initialAppLayout:(id)a4 selectedDisplayItem:(id)a5 windowDragContentSwitcherModifier:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v14 = [(SBFilteringSwitcherModifier *)&v17 initWithAppLayouts:a3 modifier:v13];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_initialAppLayout, a4);
    objc_storeStrong((id *)&v15->_selectedDisplayItem, a5);
    objc_storeStrong((id *)&v15->_windowDragContentSwitcherModifier, a6);
    v15->_windowDragSpringLoadState = 0;
  }

  return v15;
}

- (void)didMoveToParentModifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  -[SBFilteringSwitcherModifier didMoveToParentModifier:](&v8, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _appLayoutContainingDisplayItem:self->_selectedDisplayItem];
    v6 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutContainingAppLayout:v5];
    appLayoutContainingAppLayout = self->_appLayoutContainingAppLayout;
    self->_appLayoutContainingAppLayout = v6;
  }
}

- (id)handleTimerEvent:(id)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v17 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v17.receiver, v17.super_class);

  if ([v6 isEqualToString:self->_continuousExposeSpringLoadReasonWithAppLayout])
  {
    int64_t windowDragSpringLoadState = self->_windowDragSpringLoadState;
    switch(windowDragSpringLoadState)
    {
      case 3:
        self->_int64_t windowDragSpringLoadState = 0;
        break;
      case 2:
        objc_super v8 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _createInterceptableTransitionRequestForActivatingAppLayout:self->_springLoadTargetAppLayout withSelectedDisplayItem:self->_selectedDisplayItem];
        if (v8)
        {
          self->_int64_t windowDragSpringLoadState = 3;
          id v11 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v8 gestureInitiated:0];
          uint64_t v12 = SBAppendSwitcherModifierResponse(v11, v5);

          v5 = (void *)v12;
        }
        else
        {
          self->_int64_t windowDragSpringLoadState = 0;
        }
        goto LABEL_10;
      case 1:
        self->_int64_t windowDragSpringLoadState = 2;
        objc_super v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_continuousExposeSpringLoadReasonWithAppLayout reason:0.4];
        v9 = SBAppendSwitcherModifierResponse(v8, v5);

        v10 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"kContinuousExposeSpringLoadBlinkingReason" reason:0.0];
        v5 = SBAppendSwitcherModifierResponse(v10, v9);

LABEL_10:
        break;
    }
  }
  if ([v6 isEqualToString:@"kContinuousExposeSpringLoadBlinkingReason"]
    && self->_blinkCount <= 3)
  {
    id v13 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"kContinuousExposeSpringLoadBlinkingReason" reason:0.1];
    v14 = SBAppendSwitcherModifierResponse(v13, v5);

    v15 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:3];
    v5 = SBAppendSwitcherModifierResponse(v15, v14);

    ++self->_blinkCount;
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v18 handleTransitionEvent:v4];
  if ([v4 isAppLaunchDuringWindowDragGestureTransition] && objc_msgSend(v4, "phase") == 1)
  {
    v6 = [(SBContinuousExposeWindowDragContentSwitcherModifier *)self->_windowDragContentSwitcherModifier gestureModifier];
    v7 = [v4 toAppLayout];
    [v6 updateProposedAppLayoutWithAppLayout:v7 andInitialAppLayout:self->_initialAppLayout];

    windowDragContentSwitcherModifier = self->_windowDragContentSwitcherModifier;
    v9 = [v4 toAppLayout];
    [(SBContinuousExposeWindowDragContentSwitcherModifier *)windowDragContentSwitcherModifier updateFloorModifiersWithAppLayout:v9];
  }
  if ([v4 phase] == 3) {
    self->_blinkCount = 0;
  }
  if ([v4 phase] == 1)
  {
    initialAppLayout = self->_initialAppLayout;
    id v11 = [v4 toAppLayout];
    LOBYTE(initialAppLayout) = [(SBAppLayout *)initialAppLayout isEqual:v11];

    if ((initialAppLayout & 1) == 0)
    {
      uint64_t v12 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
      id v13 = [v4 fromAppLayout];
      v14 = [v4 toAppLayout];
      v15 = [(SBInvalidateContinuousExposeIdentifiersEventResponse *)v12 initWithTransitioningFromAppLayout:v13 transitioningToAppLayout:v14 animated:1];

      uint64_t v16 = SBAppendSwitcherModifierResponse(v15, v5);

      v5 = (void *)v16;
    }
  }

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v27 handleGestureEvent:v4];
  v6 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
  if ([v6 containsItem:self->_selectedDisplayItem])
  {
    self->_int64_t windowDragSpringLoadState = 0;
LABEL_12:
    self->_blinkCount = 0;
    continuousExposeSpringLoadReasonWithAppLayout = self->_continuousExposeSpringLoadReasonWithAppLayout;
    self->_continuousExposeSpringLoadReasonWithAppLayout = 0;

    springLoadTargetAppLayout = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = 0;

    goto LABEL_13;
  }
  [v4 locationInContainerView];
  double v8 = v7;
  double v10 = v9;
  id v11 = [v4 selectedAppLayout];
  uint64_t v12 = [v11 itemForLayoutRole:1];

  id v13 = -[SBContinuousExposeWindowDragContainerSwitcherModifier appLayoutAtLocation:withDraggedItem:environment:](self, "appLayoutAtLocation:withDraggedItem:environment:", v12, 1, v8, v10);
  if (v13 && ([v6 isOrContainsAppLayout:v13] & 1) == 0)
  {
    v15 = v13;
    v14 = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = v15;
  }
  else
  {
    v14 = self->_springLoadTargetAppLayout;
    self->_springLoadTargetAppLayout = 0;
  }

  if (self->_springLoadTargetAppLayout)
  {
    if (!self->_windowDragSpringLoadState)
    {
      self->_int64_t windowDragSpringLoadState = 1;
      v25 = NSString;
      v26 = [(SBAppLayout *)self->_springLoadTargetAppLayout continuousExposeIdentifier];
      uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
      objc_super v17 = [v16 UUIDString];
      objc_super v18 = [v25 stringWithFormat:@"kSpringLoading-%@-%@", v26, v17];
      v19 = self->_continuousExposeSpringLoadReasonWithAppLayout;
      self->_continuousExposeSpringLoadReasonWithAppLayout = v18;

      v20 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:self->_continuousExposeSpringLoadReasonWithAppLayout reason:0.8];
      uint64_t v21 = SBAppendSwitcherModifierResponse(v20, v5);

      v5 = (void *)v21;
    }
  }
  else
  {
    self->_int64_t windowDragSpringLoadState = 0;
  }

  if (!self->_windowDragSpringLoadState) {
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v11 handleTapAppLayoutEvent:v4];
  v6 = [v4 appLayout];
  double v7 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _createInterceptableTransitionRequestForActivatingAppLayout:v6 withSelectedDisplayItem:self->_selectedDisplayItem];

  if (v7)
  {
    double v8 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v7 gestureInitiated:0];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    [v4 handleWithReason:@"SpringLoading"];
    v5 = (void *)v9;
  }

  return v5;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBSwitcherModifier *)&v6 handleTapOutsideToDismissEvent:v3];
  objc_msgSend(v3, "handleWithReason:", @"In window drag", v6.receiver, v6.super_class);

  return v4;
}

- (id)appLayoutOnStage
{
  v2 = [(SBContinuousExposeWindowDragContentSwitcherModifier *)self->_windowDragContentSwitcherModifier gestureModifier];
  id v3 = [v2 proposedAppLayout];

  return v3;
}

- (id)adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem]
    || ([(SBDisplayItem *)self->_selectedDisplayItem bundleIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v4 containsObject:v5],
        v5,
        !v6))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    id v7 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v10 adjustedContinuousExposeIdentifiersInStripFromPreviousIdentifiersInStrip:v4];
  }
  else
  {
    id v7 = v4;
  }
  double v8 = v7;

  return v8;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v13 appLayoutsForContinuousExposeIdentifier:v4];
  if (![(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem])
  {
    int v6 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
    int v7 = [v6 containsItem:self->_selectedDisplayItem];

    if (v7)
    {
      double v8 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
      uint64_t v9 = [v8 leafAppLayoutForItem:self->_selectedDisplayItem];

      objc_super v10 = [v9 continuousExposeIdentifier];
      if (BSEqualStrings())
      {
        uint64_t v11 = [v5 count];

        if (v11)
        {
LABEL_7:

          goto LABEL_8;
        }
        v14[0] = v9;
        [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        v5 = objc_super v10 = v5;
      }

      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (double)continuousExposeStripProgress
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v8 continuousExposeStripProgress];
  double v4 = v3;
  if (BSFloatIsZero())
  {
    v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
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

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v10 animationAttributesForLayoutElement:v4];
  if (![v4 switcherLayoutElementType]
    && ([v4 containsItem:self->_selectedDisplayItem] & 1) == 0)
  {
    BOOL v6 = (void *)[v5 mutableCopy];
    int v7 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self medusaSettings];
    objc_super v8 = [v7 resizeAnimationSettings];
    [v6 setLayoutSettings:v8];

    [v6 setUpdateMode:3];
    v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  initialAppLayout = self->_initialAppLayout;
  objc_super v8 = [v6 itemForLayoutRole:a3];
  LOBYTE(initialAppLayout) = [(SBAppLayout *)initialAppLayout containsItem:v8];

  if (initialAppLayout)
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    BOOL v9 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v11 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return v9;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  initialAppLayout = self->_initialAppLayout;
  id v7 = a4;
  objc_super v8 = [v7 itemForLayoutRole:a3];
  LODWORD(initialAppLayout) = [(SBAppLayout *)initialAppLayout containsItem:v8];

  if (initialAppLayout)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    unsigned __int8 v9 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v13 isLayoutRoleContentReady:a3 inAppLayout:v7];

    return v9 ^ 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    BOOL v10 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v12 isLayoutRoleBlurred:a3 inAppLayout:v7];
  }
  return v10;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  id v6 = a4;
  [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v15 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  initialAppLayout = self->_initialAppLayout;
  BOOL v10 = objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);

  LODWORD(initialAppLayout) = [(SBAppLayout *)initialAppLayout containsItem:v10];
  if (initialAppLayout)
  {
    objc_super v11 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self switcherSettings];
    objc_super v12 = [v11 animationSettings];
    [v12 resizeBlurDelay];
    double v8 = v13;
  }
  return v8;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_initialAppLayout containsAnyItemFromAppLayout:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    BOOL v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v7 wantsSceneResizesHostedContextForAppLayout:v4];
  }

  return v5;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_springLoadTargetAppLayout isOrContainsAppLayout:v6])
  {
    if (self->_blinkCount) {
      double v7 = 0.5;
    }
    else {
      double v7 = 0.2;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v10 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
    double v7 = v8;
  }

  return v7;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![v8 containsItem:self->_selectedDisplayItem]
    || self->_windowDragSpringLoadState != 1
    || ([(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage],
        unsigned __int8 v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 containsItem:self->_selectedDisplayItem],
        v9,
        double v11 = 0.5,
        v10))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
    [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v11 = v12;
  }

  return v11;
}

- (BOOL)wantsDockBehaviorAssertion
{
  [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _dockProgressForDraggedWindow];
  return BSFloatLessThanFloat();
}

- (double)dockProgress
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v6 dockProgress];
  double v4 = v3;
  [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _dockProgressForDraggedWindow];
  if (result >= v4) {
    return v4;
  }
  return result;
}

- (double)_dockProgressForDraggedWindow
{
  double v3 = 1.0;
  if (([(SBContinuousExposeWindowDragContainerSwitcherModifier *)self prefersDockHidden] & 1) == 0)
  {
    if ([(SBAppLayout *)self->_initialAppLayout containsItem:self->_selectedDisplayItem])
    {
      [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self containerViewBounds];
      double v5 = v4;
      [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self floatingDockHeight];
      double v7 = v6;
      id v8 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self chamoisLayoutAttributes];
      [v8 screenEdgePadding];
      double v10 = v9;

      [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _boundingBoxForCurrentStage];
      double v11 = v10 + CGRectGetMaxY(v13);
      if (v11 > v5 - v7) {
        return (v7 - (v5 - v7 + (v11 - (v5 - v7)) * 0.75 - (v5 - v7))) / v7;
      }
    }
  }
  return v3;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeWindowDragContainerSwitcherModifier;
  double v3 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)&v8 topMostLayoutElements];
  double v4 = [(SBAppLayout *)self->_appLayoutContainingAppLayout allItems];
  if ((unint64_t)[v4 count] >= 2)
  {
    appLayoutContainingAppLayout = self->_appLayoutContainingAppLayout;
    double v6 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
    LOBYTE(appLayoutContainingAppLayout) = [(SBAppLayout *)appLayoutContainingAppLayout isOrContainsAppLayout:v6];

    if (appLayoutContainingAppLayout) {
      goto LABEL_5;
    }
    objc_msgSend(v3, "sb_arrayByRemovingObject:", self->_appLayoutContainingAppLayout);
    v3 = double v4 = v3;
  }

LABEL_5:
  return v3;
}

- (id)routingModifier:(id)a3 topMostLayoutElementsByModifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v8 = objc_msgSend(v5, "modifiers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        CGRect v13 = [v6 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        [v7 addObjectsFromArray:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  objc_super v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA0]) initWithArray:v7];
  objc_super v15 = [v14 array];

  return v15;
}

- (id)_createInterceptableTransitionRequestForActivatingAppLayout:(id)a3 withSelectedDisplayItem:(id)a4
{
  id v6 = (SBAppLayout *)a3;
  id v7 = a4;
  objc_super v8 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
  uint64_t v9 = self->_initialAppLayout;
  uint64_t v10 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self _appLayoutContainingDisplayItem:v7];
  if (v10)
  {
    uint64_t v11 = [(SBContinuousExposeWindowDragContentSwitcherModifier *)self->_windowDragContentSwitcherModifier gestureModifier];
    double v12 = [v11 appLayoutByAddingAppLayout:v10 toAppLayout:v6];

    if (![v8 containsItem:v7]
      || (BOOL v13 = [(SBAppLayout *)v9 containsItem:v7], v14 = v12, !v13))
    {
      objc_super v14 = v6;
    }
    objc_super v15 = v14;
    initialAppLayout = self->_initialAppLayout;
    self->_initialAppLayout = v12;
    long long v17 = v12;

    long long v18 = +[SBSwitcherTransitionRequest requestForActivatingAppLayout:v15];
    [v18 setAppLaunchDuringWindowDragGesture:1];
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)_appLayoutContainingDisplayItem:(id)a3
{
  id v4 = a3;
  id v5 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayouts];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  BOOL v13 = __89__SBContinuousExposeWindowDragContainerSwitcherModifier__appLayoutContainingDisplayItem___block_invoke;
  objc_super v14 = &unk_1E6AF4B60;
  id v6 = v4;
  id v15 = v6;
  id v7 = objc_msgSend(v5, "bs_firstObjectPassingTest:", &v11);

  if (!v7)
  {
    objc_super v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9) {
      NSLog(&cfstr_ExpectedAnAppL.isa, v6, v11, v12, v13, v14);
    }
  }

  return v7;
}

uint64_t __89__SBContinuousExposeWindowDragContainerSwitcherModifier__appLayoutContainingDisplayItem___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(a1 + 32)];
}

- (CGRect)_boundingBoxForCurrentStage
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v3 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayoutOnStage];
  if (v3)
  {
    id v4 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v3];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v3 allItems];
    uint64_t v5 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v42;
      double v8 = 1.79769313e308;
      double v9 = -1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v42 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          objc_super v14 = [v4 autoLayoutItemForDisplayItem:v13];
          [v14 size];
          double v16 = v15;
          double v18 = v17;
          [v14 position];
          double v20 = v19;
          double v22 = v21;
          if ([(SBDisplayItem *)self->_selectedDisplayItem isEqual:v13])
          {
            v23 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self appLayouts];
            v40[0] = MEMORY[0x1E4F143A8];
            v40[1] = 3221225472;
            v40[2] = __84__SBContinuousExposeWindowDragContainerSwitcherModifier__boundingBoxForCurrentStage__block_invoke;
            v40[3] = &unk_1E6AFA000;
            v40[4] = self;
            uint64_t v24 = [v23 indexOfObjectPassingTest:v40];

            if (v24 != 0x7FFFFFFFFFFFFFFFLL)
            {
              [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self frameForIndex:v24];
              double v26 = v25;
              double v28 = v27;
              double v16 = v29;
              double v18 = v30;
              [(SBContinuousExposeWindowDragContainerSwitcherModifier *)self anchorPointForIndex:v24];
              double v33 = v28 + (0.5 - v32) * v18;
              double v20 = v16 * 0.5 + v26 + (0.5 - v31) * v16;
              double v22 = v18 * 0.5 + v33;
            }
          }
          if (v11 >= v20 - v16 * 0.5) {
            double v11 = v20 - v16 * 0.5;
          }
          double v34 = v18 * 0.5;
          if (v8 >= v22 - v18 * 0.5) {
            double v8 = v22 - v18 * 0.5;
          }
          if (v10 < v20 + v16 * 0.5) {
            double v10 = v20 + v16 * 0.5;
          }
          if (v9 < v22 + v34) {
            double v9 = v22 + v34;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 1.79769313e308;
      double v9 = -1.79769313e308;
      double v10 = -1.79769313e308;
      double v11 = 1.79769313e308;
    }
  }
  else
  {
    double v8 = 1.79769313e308;
    double v9 = -1.79769313e308;
    double v10 = -1.79769313e308;
    double v11 = 1.79769313e308;
  }

  double v35 = v10 - v11;
  double v36 = v9 - v8;
  double v37 = v11;
  double v38 = v8;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

uint64_t __84__SBContinuousExposeWindowDragContainerSwitcherModifier__boundingBoxForCurrentStage__block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 184)];
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (SBDisplayItem)selectedDisplayItem
{
  return self->_selectedDisplayItem;
}

- (SBContinuousExposeWindowDragContentSwitcherModifier)windowDragContentSwitcherModifier
{
  return self->_windowDragContentSwitcherModifier;
}

- (SBContinuousExposeWindowDragSwitcherModifier)windowDragModifier
{
  return self->_windowDragModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowDragModifier, 0);
  objc_storeStrong((id *)&self->_windowDragContentSwitcherModifier, 0);
  objc_storeStrong((id *)&self->_selectedDisplayItem, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
  objc_storeStrong((id *)&self->_continuousExposeSpringLoadReasonWithAppLayout, 0);
  objc_storeStrong((id *)&self->_springLoadTargetAppLayout, 0);
  objc_storeStrong((id *)&self->_appLayoutContainingAppLayout, 0);
}

@end