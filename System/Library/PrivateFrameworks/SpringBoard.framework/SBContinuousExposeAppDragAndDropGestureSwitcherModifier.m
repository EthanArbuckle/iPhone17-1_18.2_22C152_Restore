@interface SBContinuousExposeAppDragAndDropGestureSwitcherModifier
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)switcherHitTestsAsOpaque;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBContinuousExposeAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 displayItemThatWouldBeEvicted:(id)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenDimmingAlpha;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
@end

@implementation SBContinuousExposeAppDragAndDropGestureSwitcherModifier

- (SBContinuousExposeAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 displayItemThatWouldBeEvicted:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  v12 = [(SBGestureSwitcherModifier *)&v15 initWithGestureID:a3];
  if (v12)
  {
    if (!v10)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBContinuousExposeAppDragAndDropGestureSwitcherModifier.m", 48, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v12->_appLayout, a4);
    objc_storeStrong((id *)&v12->_initialAppLayout, v12->_appLayout);
    objc_storeStrong((id *)&v12->_displayItemThatWouldBeEvictedIfAny, a5);
  }

  return v12;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_transitionModifier != 0;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  v5 = [(SBGestureSwitcherModifier *)&v41 handleGestureEvent:v4];
  if ([v4 isCanceled])
  {
    [(SBChainableModifier *)self setState:1];
    id v6 = v5;
    goto LABEL_21;
  }
  id v7 = v4;
  self->_dropAction = [v7 dropAction];
  v8 = [v7 draggedSceneIdentifier];
  draggedSceneIdentifier = self->_draggedSceneIdentifier;
  self->_draggedSceneIdentifier = v8;

  self->_hasPlatterized = [v7 hasPlatterized];
  self->_hasPreviewLifted = [v7 hasPreviewLifted];
  self->_draggedSceneOriginalLayoutRole = [v7 draggedSceneLayoutRole];
  [v7 platterViewFrame];
  self->_platterFrame.origin.double x = v10;
  self->_platterFrame.origin.y = v11;
  self->_platterFrame.size.width = v12;
  self->_platterFrame.size.height = v13;
  p_location = &self->_location;
  [v7 locationInContainerView];
  self->_location.double x = v15;
  self->_location.y = v16;
  self->_gestureEnded = [v7 phase] == 3;
  [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self containerViewBounds];
  double v18 = v17;
  char v19 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self isRTLEnabled];
  double x = self->_location.x;
  if (v19)
  {
    if (p_location->x < v18 * 0.5) {
      goto LABEL_16;
    }
  }
  else if (p_location->x >= v18 * 0.5)
  {
    goto LABEL_16;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)&v40 continuousExposeStripProgress];
  v21 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self chamoisLayoutAttributes];
  [v21 screenEdgePadding];
  double v23 = v22;

  if ([(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self isRTLEnabled]) {
    BOOL v24 = p_location->x > v18 - v23;
  }
  else {
    BOOL v24 = p_location->x < v23;
  }
  if (BSFloatGreaterThanFloat())
  {
    if (!v24)
    {
      v25 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
      uint64_t v26 = 0;
      uint64_t v27 = 1;
LABEL_15:
      v28 = [(SBUpdateContinuousExposeStripsPresentationResponse *)v25 initWithPresentationOptions:v26 dismissalOptions:v27];
      uint64_t v29 = SBAppendSwitcherModifierResponse(v28, v5);

      v5 = (void *)v29;
    }
  }
  else if (v24)
  {
    v25 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
    uint64_t v26 = 1;
    uint64_t v27 = 0;
    goto LABEL_15;
  }
LABEL_16:
  if (self->_gestureEnded)
  {
    v30 = -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier topMostLayoutRolesForAppLayout:](self, "topMostLayoutRolesForAppLayout:", self->_appLayout, x);
    v31 = [v30 firstObject];
    uint64_t v32 = [v31 integerValue];

    v33 = [(SBAppLayout *)self->_appLayout itemForLayoutRole:v32];
    v34 = [v33 uniqueIdentifier];
    LODWORD(v32) = [v34 isEqualToString:self->_draggedSceneIdentifier];

    if (v32)
    {
      v35 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      v36 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self appLayoutByBringingItemToFront:v33 inAppLayout:self->_appLayout];
      [(SBSwitcherTransitionRequest *)v35 setAppLayout:v36];

      v37 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v35 gestureInitiated:0];
      uint64_t v38 = SBAppendSwitcherModifierResponse(v37, v5);

      v5 = (void *)v38;
    }
  }
  id v6 = v5;

LABEL_21:
  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_gestureEnded && !self->_transitionModifier)
  {
    id v6 = [v4 fromAppLayout];
    dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
    self->_dropTransitionFromAppLayout = v6;

    v8 = [SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier alloc];
    v9 = [v5 transitionID];
    CGFloat v10 = [(SBTransitionSwitcherModifier *)v8 initWithTransitionID:v9];
    transitionModifier = self->_transitionModifier;
    self->_transitionModifier = v10;

    [(SBChainableModifier *)self addChildModifier:self->_transitionModifier];
  }
  else if ([v4 isGestureInitiated] && !self->_transitionModifier)
  {
    [(SBChainableModifier *)self setState:1];
  }
  CGFloat v12 = [v5 toAppLayout];
  appLayout = self->_appLayout;
  self->_appLayout = v12;

  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  v14 = [(SBGestureSwitcherModifier *)&v16 handleTransitionEvent:v5];

  return v14;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  v5 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)&v25 topMostLayoutRolesForAppLayout:v4];
  if ([v4 isEqual:self->_initialAppLayout])
  {
    id v6 = (void *)[v5 mutableCopy];
    uint64_t v7 = 0;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v8 = [v4 allItems];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      char v19 = v6;
      v20 = v5;
      uint64_t v11 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          CGFloat v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v14 = [v13 uniqueIdentifier];
          int v15 = [v14 isEqualToString:self->_draggedSceneIdentifier];

          if (v15)
          {
            uint64_t v7 = [v4 layoutRoleForItem:v13];
            id v6 = v19;
            v5 = v20;
            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v10) {
          continue;
        }
        break;
      }
      id v6 = v19;
      v5 = v20;
      uint64_t v7 = 0;
    }
LABEL_13:

    objc_super v16 = [NSNumber numberWithInteger:v7];
    [v6 removeObject:v16];

    double v17 = [NSNumber numberWithInteger:v7];
    [v6 insertObject:v17 atIndex:0];
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v5 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];
  uint64_t v7 = v6;
  if (!self->_gestureEnded) {
    goto LABEL_5;
  }
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == self->_appLayout) {
    goto LABEL_5;
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = [v6 allItems];
  uint64_t v11 = [v9 setWithArray:v10];
  BOOL v12 = [(SBAppLayout *)dropTransitionFromAppLayout containsAnyItemFromSet:v11];

  if (v12) {
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, [v5 indexOfObject:self->_appLayout], v25.receiver, v25.super_class, self, SBContinuousExposeAppDragAndDropGestureSwitcherModifier);
  }
  else {
LABEL_5:
  }
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_, a3, self, SBContinuousExposeAppDragAndDropGestureSwitcherModifier, v26.receiver, v26.super_class);
  double v17 = v13;
  double v18 = v14;
  double v19 = v15;
  double v20 = v16;

  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.double x = v21;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  int v5 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self isChamoisWindowingUIEnabled];
  double result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  if ([(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    v8 = self;
    v3 = &v8;
LABEL_6:
    v3[1] = (SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    objc_msgSendSuper2((objc_super *)v3, sel_homeScreenDimmingAlpha, v7);
    return result;
  }
  transitionModifier = self->_transitionModifier;
  if (!transitionModifier
    || (unint64_t v5 = [(SBTransitionSwitcherModifier *)transitionModifier transitionPhase],
        double result = 1.0,
        v5 <= 1))
  {
    objc_super v7 = self;
    v3 = &v7;
    goto LABEL_6;
  }
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  if (self->_appLayout == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  return [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)&v4 isResizeGrabberVisibleForAppLayout:sel_isResizeGrabberVisibleForAppLayout_];
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return self->_transitionModifier != 0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = (SBAppLayout *)a4;
  objc_super v7 = v6;
  displayItemThatWouldBeEvictedIfAny = self->_displayItemThatWouldBeEvictedIfAny;
  if (!displayItemThatWouldBeEvictedIfAny || self->_appLayout != v6) {
    goto LABEL_7;
  }
  uint64_t v9 = [(SBAppLayout *)v6 itemForLayoutRole:a3];
  if (![(SBDisplayItem *)displayItemThatWouldBeEvictedIfAny isEqual:v9])
  {

LABEL_7:
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)&v14 dimmingAlphaForLayoutRole:a3 inAppLayout:v7];
    double v11 = v12;
    goto LABEL_8;
  }
  int64_t dropAction = self->_dropAction;

  double v11 = 0.5;
  if (!dropAction) {
    goto LABEL_7;
  }
LABEL_8:

  return v11;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  objc_super v4 = -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:", a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_initialAppLayout isOrContainsAppLayout:v6]
    || (dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout) != 0
    && [(SBAppLayout *)dropTransitionFromAppLayout isOrContainsAppLayout:v6])
  {
    v8 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self chamoisLayoutAttributes];
    [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self displayCornerRadius];
    if (BSFloatIsZero()) {
      [v8 stageCornerRadii];
    }
    [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self scaleForIndex:a3];
    SBRectCornerRadiiForRadius();
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)&v25 cornerRadiiForIndex:a3];
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
    double v16 = v20;
  }

  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  double v24 = v16;
  result.topRight = v24;
  result.bottomRight = v23;
  result.bottomLeft = v22;
  result.topLeft = v21;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  objc_super v4 = [(SBGestureSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  BOOL v5 = (void *)[v4 mutableCopy];

  id v6 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
  objc_super v7 = [v6 resizeAnimationSettings];
  [v5 setLayoutSettings:v7];

  [v5 setUpdateMode:3];
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionModifier, 0);
  objc_storeStrong((id *)&self->_dropTransitionFromAppLayout, 0);
  objc_storeStrong((id *)&self->_displayItemThatWouldBeEvictedIfAny, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
}

@end