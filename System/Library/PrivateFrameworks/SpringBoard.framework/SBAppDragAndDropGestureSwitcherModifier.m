@interface SBAppDragAndDropGestureSwitcherModifier
- (BOOL)_isDraggingLiveWindow;
- (BOOL)_shouldPushInFullScreenContentForEvent:(id)a3;
- (BOOL)_showResizeUI;
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)switcherHitTestsAsOpaque;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenDimmingAlpha;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleBlurProgressEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (void)_recomputeBlurStateWithCompletion:(id)a3;
@end

@implementation SBAppDragAndDropGestureSwitcherModifier

- (SBAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  v11 = [(SBGestureSwitcherModifier *)&v14 initWithGestureID:a3];
  if (v11)
  {
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v11, @"SBAppDragAndDropGestureSwitcherModifier.m", 63, @"Invalid parameter not satisfying: %@", @"fullScreenAppLayout" object file lineNumber description];
    }
    v11->_floatingSwitcherVisible = a4;
    objc_storeStrong((id *)&v11->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v11->_initialFullScreenAppLayout, v11->_fullScreenAppLayout);
  }

  return v11;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_transitionModifier != 0;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__96;
  v35 = __Block_byref_object_dispose__96;
  v30.receiver = self;
  v30.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  id v36 = [(SBGestureSwitcherModifier *)&v30 handleGestureEvent:v4];
  if ([v4 isCanceled])
  {
    [(SBChainableModifier *)self setState:1];
    id v5 = (id)v32[5];
  }
  else
  {
    v6 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
    uint64_t v7 = [v6 indexOfObject:self->_fullScreenAppLayout];

    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
    [(SBAppDragAndDropGestureSwitcherModifier *)self frameForIndex:v8];
    double v10 = v9;
    double v12 = v11;
    id v13 = v4;
    self->_shouldPushInFullScreenContent = [(SBAppDragAndDropGestureSwitcherModifier *)self _shouldPushInFullScreenContentForEvent:v13];
    self->_dropAction = [v13 dropAction];
    objc_super v14 = [v13 draggedSceneIdentifier];
    draggedSceneIdentifier = self->_draggedSceneIdentifier;
    self->_draggedSceneIdentifier = v14;

    self->_isWindowDrag = [v13 isWindowDrag];
    self->_hasPlatterized = [v13 hasPlatterized];
    self->_hasPreviewLifted = [v13 hasPreviewLifted];
    self->_draggedSceneOriginalLayoutRole = [v13 draggedSceneLayoutRole];
    [v13 platterViewFrame];
    self->_platterFrame.origin.x = v16;
    self->_platterFrame.origin.y = v17;
    self->_platterFrame.size.width = v18;
    self->_platterFrame.size.height = v19;
    [v13 locationInContainerView];
    self->_location.x = v20;
    self->_location.y = v21;
    self->_gestureEnded = [v13 phase] == 3;
    v22 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
    uint64_t v23 = [v22 indexOfObject:self->_fullScreenAppLayout];

    if (v23 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v24 = 0;
    }
    else {
      uint64_t v24 = v23;
    }
    [(SBAppDragAndDropGestureSwitcherModifier *)self frameForIndex:v24];
    BOOL v27 = (v10 != v26 || v12 != v25) && !self->_gestureEnded;
    self->_needsBlurBecauseFramesWillMismatch = v27;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __62__SBAppDragAndDropGestureSwitcherModifier_handleGestureEvent___block_invoke;
    v29[3] = &unk_1E6AFF1F8;
    v29[4] = &v31;
    [(SBAppDragAndDropGestureSwitcherModifier *)self _recomputeBlurStateWithCompletion:v29];
    id v5 = (id)v32[5];
  }
  _Block_object_dispose(&v31, 8);

  return v5;
}

void __62__SBAppDragAndDropGestureSwitcherModifier_handleGestureEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SBAppendSwitcherModifierResponse(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x3032000000;
  CGFloat v16 = __Block_byref_object_copy__96;
  CGFloat v17 = __Block_byref_object_dispose__96;
  v12.receiver = self;
  v12.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  id v18 = [(SBSwitcherModifier *)&v12 handleResizeProgressEvent:v4];
  [v4 progress];
  self->_isResizing = BSFloatIsOne() ^ 1;
  [v4 progress];
  id v5 = [(SBAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
  [v5 dropAnimationUnblurThresholdPercentage];
  self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__SBAppDragAndDropGestureSwitcherModifier_handleResizeProgressEvent___block_invoke;
  v11[3] = &unk_1E6AFF1F8;
  v11[4] = &v13;
  [(SBAppDragAndDropGestureSwitcherModifier *)self _recomputeBlurStateWithCompletion:v11];
  v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v14[5]);
  uint64_t v8 = (void *)v14[5];
  v14[5] = v7;

  id v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __69__SBAppDragAndDropGestureSwitcherModifier_handleResizeProgressEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SBAppendSwitcherModifierResponse(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)handleBlurProgressEvent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__96;
  CGFloat v16 = __Block_byref_object_dispose__96;
  v11.receiver = self;
  v11.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  id v17 = [(SBSwitcherModifier *)&v11 handleBlurProgressEvent:v4];
  [v4 progress];
  self->_isBlurring = BSFloatIsOne() ^ 1;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBAppDragAndDropGestureSwitcherModifier_handleBlurProgressEvent___block_invoke;
  v10[3] = &unk_1E6AFF1F8;
  v10[4] = &v12;
  [(SBAppDragAndDropGestureSwitcherModifier *)self _recomputeBlurStateWithCompletion:v10];
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  uint64_t v6 = SBAppendSwitcherModifierResponse(v5, v13[5]);
  uint64_t v7 = (void *)v13[5];
  v13[5] = v6;

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __67__SBAppDragAndDropGestureSwitcherModifier_handleBlurProgressEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SBAppendSwitcherModifierResponse(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__96;
  CGFloat v16 = __Block_byref_object_dispose__96;
  v11.receiver = self;
  v11.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  id v17 = [(SBSwitcherModifier *)&v11 handleSceneReadyEvent:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__SBAppDragAndDropGestureSwitcherModifier_handleSceneReadyEvent___block_invoke;
  v10[3] = &unk_1E6AFF1F8;
  v10[4] = &v12;
  [(SBAppDragAndDropGestureSwitcherModifier *)self _recomputeBlurStateWithCompletion:v10];
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  uint64_t v6 = SBAppendSwitcherModifierResponse(v5, v13[5]);
  uint64_t v7 = (void *)v13[5];
  v13[5] = v6;

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __65__SBAppDragAndDropGestureSwitcherModifier_handleSceneReadyEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SBAppendSwitcherModifierResponse(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gestureEnded && !self->_transitionModifier)
  {
    uint64_t v6 = [v4 fromAppLayout];
    dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
    self->_dropTransitionFromAppLayout = v6;

    id v8 = [SBDragAndDropToAppTransitionSwitcherModifier alloc];
    id v9 = [v5 transitionID];
    double v10 = [(SBTransitionSwitcherModifier *)v8 initWithTransitionID:v9];
    transitionModifier = self->_transitionModifier;
    self->_transitionModifier = v10;

    [(SBChainableModifier *)self addChildModifier:self->_transitionModifier];
  }
  else if ([v4 isGestureInitiated] && !self->_transitionModifier)
  {
    [(SBChainableModifier *)self setState:1];
  }
  uint64_t v12 = [v5 toAppLayout];
  fullScreenAppLayout = self->_fullScreenAppLayout;
  self->_fullScreenAppLayout = v12;

  uint64_t v18 = 0;
  CGFloat v19 = &v18;
  uint64_t v20 = 0x3032000000;
  CGFloat v21 = __Block_byref_object_copy__96;
  v22 = __Block_byref_object_dispose__96;
  v17.receiver = self;
  v17.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  id v23 = [(SBGestureSwitcherModifier *)&v17 handleTransitionEvent:v5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65__SBAppDragAndDropGestureSwitcherModifier_handleTransitionEvent___block_invoke;
  v16[3] = &unk_1E6AFF1F8;
  v16[4] = &v18;
  [(SBAppDragAndDropGestureSwitcherModifier *)self _recomputeBlurStateWithCompletion:v16];
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v14;
}

void __65__SBAppDragAndDropGestureSwitcherModifier_handleTransitionEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SBAppendSwitcherModifierResponse(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];
  uint64_t v7 = v6;
  if (!self->_gestureEnded) {
    goto LABEL_5;
  }
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == self->_fullScreenAppLayout) {
    goto LABEL_5;
  }
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  double v10 = [v6 allItems];
  objc_super v11 = [v9 setWithArray:v10];
  BOOL v12 = [(SBAppLayout *)dropTransitionFromAppLayout containsAnyItemFromSet:v11];

  if (v12) {
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, [v5 indexOfObject:self->_fullScreenAppLayout], v25.receiver, v25.super_class, self, SBAppDragAndDropGestureSwitcherModifier);
  }
  else {
LABEL_5:
  }
    -[SBAppDragAndDropGestureSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_, a3, self, SBAppDragAndDropGestureSwitcherModifier, v26.receiver, v26.super_class);
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
  result.origin.x = v21;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (SBAppLayout *)a4;
  uint64_t v7 = v6;
  if (self->_fullScreenAppLayout == v6)
  {
    if (self->_gestureEnded)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v9 = [(SBAppLayout *)v6 allItems];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v9);
            }
            double v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([(SBAppLayout *)v7 layoutRoleForItem:v14] == a3)
            {
              double v15 = [v14 uniqueIdentifier];
              char v16 = [v15 isEqualToString:self->_draggedSceneIdentifier];

              if (v16)
              {

                unsigned __int8 isBlurred = 0;
                goto LABEL_16;
              }
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    unsigned __int8 isBlurred = self->_isBlurred;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    unsigned __int8 isBlurred = [(SBAppDragAndDropGestureSwitcherModifier *)&v18 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }
LABEL_16:

  return isBlurred;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  int v5 = [(SBAppDragAndDropGestureSwitcherModifier *)self isChamoisWindowingUIEnabled];
  double result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  if ([(SBAppDragAndDropGestureSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    id v8 = self;
    uint64_t v3 = &v8;
LABEL_6:
    v3[1] = (SBAppDragAndDropGestureSwitcherModifier *)SBAppDragAndDropGestureSwitcherModifier;
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
    uint64_t v3 = &v7;
    goto LABEL_6;
  }
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  if (self->_fullScreenAppLayout == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  return [(SBAppDragAndDropGestureSwitcherModifier *)&v4 isResizeGrabberVisibleForAppLayout:sel_isResizeGrabberVisibleForAppLayout_];
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return self->_transitionModifier != 0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v6 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout != v6 || !self->_dropAction)
  {
    v15.receiver = self;
    v15.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    [(SBAppDragAndDropGestureSwitcherModifier *)&v15 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
    double v8 = v7;
    goto LABEL_3;
  }
  uint64_t v10 = [(SBAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
  [v10 defaultDimmingOpacity];
  double v12 = v11;

  double v8 = 0.0;
  if (self->_gestureEnded) {
    goto LABEL_3;
  }
  int64_t dropAction = self->_dropAction;
  switch(dropAction)
  {
    case 3:
      double v14 = &SBLayoutRoleSide;
      goto LABEL_12;
    case 2:
      double v14 = &SBLayoutRolePrimary;
LABEL_12:
      if (*v14 == a3) {
        double v8 = v12;
      }
      else {
        double v8 = 0.0;
      }
      break;
    case 1:
      double v8 = v12;
      break;
  }
LABEL_3:

  return v8;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = (SBAppLayout *)a4;
  if (self->_fullScreenAppLayout == v11 && !self->_gestureEnded)
  {
    if ([(SBAppDragAndDropGestureSwitcherModifier *)self _isDraggingLiveWindow]
      && !self->_hasPlatterized)
    {
      int64_t dropAction = self->_dropAction;
      if (dropAction == 4)
      {
        int64_t draggedSceneOriginalLayoutRole = self->_draggedSceneOriginalLayoutRole;
        v64 = &SBLayoutRoleSide;
      }
      else
      {
        if (dropAction != 5) {
          goto LABEL_38;
        }
        int64_t draggedSceneOriginalLayoutRole = self->_draggedSceneOriginalLayoutRole;
        v64 = &SBLayoutRolePrimary;
      }
      if (draggedSceneOriginalLayoutRole == *v64)
      {
        v87.receiver = self;
        v87.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
        -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v87, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v11, x, y, width, height);
        double v30 = v65;
        double v32 = v66;
        double v34 = v67;
        double v36 = v68;
        v86.receiver = self;
        v86.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
        -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v86, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v11, x, y, width, height);
        if (a3 == 1)
        {
          double v30 = v30 + v71 + v69 - (v30 + v34);
          goto LABEL_40;
        }
        if (a3 == 2)
        {
          double v36 = v72;
          double v34 = v71;
          double v32 = v70;
          goto LABEL_40;
        }
      }
      goto LABEL_38;
    }
    if (a3 != 1) {
      goto LABEL_38;
    }
    v52 = [(SBAppLayout *)v11 itemForLayoutRole:2];

    if (v52 || (self->_dropAction & 0xFFFFFFFFFFFFFFFELL) != 4) {
      goto LABEL_38;
    }
    v85.receiver = self;
    v85.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v85, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v11, x, y, width, height);
    double v30 = v53;
    double v32 = v54;
    double v56 = v55;
    double v36 = v57;
    v58 = [(SBAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
    [v58 draggingPlatterSideActivationGutterPadding];

    [(SBAppDragAndDropGestureSwitcherModifier *)self screenScale];
    BSFloatRoundForScale();
    double v60 = v59;
    int64_t v61 = self->_dropAction;
    if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
    {
      if (v61 == 4) {
        goto LABEL_35;
      }
    }
    else if (v61 != 4)
    {
LABEL_35:
      double v34 = v56 - v60;
      goto LABEL_40;
    }
    double v30 = v30 + v60;
    goto LABEL_35;
  }
  if ([(SBAppLayout *)self->_initialFullScreenAppLayout isOrContainsAppLayout:v11]
    && !self->_gestureEnded)
  {
    initialFullScreenAppLayout = self->_initialFullScreenAppLayout;
    v38 = [(SBAppLayout *)v11 itemForLayoutRole:1];
    uint64_t v39 = [(SBAppLayout *)initialFullScreenAppLayout layoutRoleForItem:v38];

    v40 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
    uint64_t v41 = [v40 indexOfObject:v11];

    if (v41 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v42 = 0;
    }
    else {
      uint64_t v42 = v41;
    }
    v43 = self->_initialFullScreenAppLayout;
    [(SBAppDragAndDropGestureSwitcherModifier *)self frameForIndex:v42];
    SBRectWithSize();
    v84.receiver = self;
    v84.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v84, sel_frameForLayoutRole_inAppLayout_withBounds_, v39, v43, v44, v45, v46, v47);
    goto LABEL_39;
  }
  fullScreenAppLayout = self->_fullScreenAppLayout;
  if (fullScreenAppLayout == v11) {
    goto LABEL_38;
  }
  if (!self->_gestureEnded) {
    goto LABEL_38;
  }
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == fullScreenAppLayout) {
    goto LABEL_38;
  }
  double v14 = (void *)MEMORY[0x1E4F1CAD0];
  objc_super v15 = [(SBAppLayout *)v11 allItems];
  char v16 = [v14 setWithArray:v15];
  BOOL v17 = [(SBAppLayout *)dropTransitionFromAppLayout containsAnyItemFromSet:v16];

  objc_super v18 = self->_dropTransitionFromAppLayout;
  long long v19 = (void *)MEMORY[0x1E4F1CAD0];
  long long v20 = [(SBAppLayout *)self->_fullScreenAppLayout allItems];
  long long v21 = [v19 setWithArray:v20];
  BOOL v22 = [(SBAppLayout *)v18 containsAnyItemFromSet:v21];

  if (!v17 || !v22)
  {
LABEL_38:
    v77.receiver = self;
    v77.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v77, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
LABEL_39:
    double v30 = v48;
    double v32 = v49;
    double v34 = v50;
    double v36 = v51;
    goto LABEL_40;
  }
  uint64_t v80 = 0;
  v81 = &v80;
  uint64_t v82 = 0x2020000000;
  uint64_t v83 = 0;
  double v23 = self->_dropTransitionFromAppLayout;
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __85__SBAppDragAndDropGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v79[3] = &unk_1E6AFD168;
  v79[4] = self;
  v79[5] = &v80;
  [(SBAppLayout *)v23 enumerate:v79];
  uint64_t v24 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  uint64_t v25 = [v24 indexOfObject:v11];

  if (v25 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v26 = 0;
  }
  else {
    uint64_t v26 = v25;
  }
  uint64_t v27 = v81[3];
  v28 = self->_dropTransitionFromAppLayout;
  [(SBAppDragAndDropGestureSwitcherModifier *)self frameForIndex:v26];
  SBRectWithSize();
  v78.receiver = self;
  v78.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  -[SBAppDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v78, sel_frameForLayoutRole_inAppLayout_withBounds_, v27, v28);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  _Block_object_dispose(&v80, 8);
LABEL_40:

  double v73 = v30;
  double v74 = v32;
  double v75 = v34;
  double v76 = v36;
  result.size.double height = v76;
  result.size.double width = v75;
  result.origin.double y = v74;
  result.origin.double x = v73;
  return result;
}

uint64_t __85__SBAppDragAndDropGestureSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "containsItem:");
  if ((result & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  if (!self->_isResizing) {
    return 0;
  }
  objc_super v4 = -[SBAppLayout itemForLayoutRole:](self->_fullScreenAppLayout, "itemForLayoutRole:", a3, a4);
  BOOL v5 = v4 != 0;

  return v5;
}

- (double)scaleForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_fullScreenAppLayout && self->_shouldPushInFullScreenContent && !self->_gestureEnded)
  {
    double v8 = 0.98;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    [(SBAppDragAndDropGestureSwitcherModifier *)&v10 scaleForIndex:a3];
    double v8 = v7;
  }

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  BOOL v5 = [(SBAppDragAndDropGestureSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if ([v6 environment] == 1)
  {
    [(SBAppDragAndDropGestureSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
    [(SBAppDragAndDropGestureSwitcherModifier *)&v19 cornerRadiiForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  objc_super v4 = [(SBGestureSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  BOOL v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(SBAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
  double v7 = [v6 resizeAnimationSettings];
  [v5 setLayoutSettings:v7];

  [v5 setUpdateMode:3];
  return v5;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v17[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)SBAppDragAndDropGestureSwitcherModifier;
  uint64_t v6 = (SBAppLayout *)a4;
  double v7 = [(SBAppDragAndDropGestureSwitcherModifier *)&v16 resizeProgressNotificationsForLayoutRole:a3 inAppLayout:v6];
  fullScreenAppLayout = self->_fullScreenAppLayout;

  if (fullScreenAppLayout == v6)
  {
    objc_super v9 = [(SBAppDragAndDropGestureSwitcherModifier *)self medusaSettings];
    [v9 dropAnimationUnblurThresholdPercentage];
    double v11 = v10;

    v17[0] = &unk_1F3348E08;
    double v12 = [NSNumber numberWithDouble:v11];
    v17[1] = v12;
    v17[2] = &unk_1F3348E18;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
    uint64_t v14 = [v7 setByAddingObjectsFromArray:v13];

    double v7 = (void *)v14;
  }
  return v7;
}

- (BOOL)_shouldPushInFullScreenContentForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 dropAction];
  if ((unint64_t)(v5 - 1) < 5) {
    goto LABEL_5;
  }
  if ((unint64_t)(v5 - 6) > 3)
  {
    char v6 = 0;
    goto LABEL_6;
  }
  if ([v4 isWindowDrag]) {
    char v6 = [v4 hasPlatterized];
  }
  else {
LABEL_5:
  }
    char v6 = 1;
LABEL_6:
  if ([(SBAppDragAndDropGestureSwitcherModifier *)self _isDraggingLiveWindow]
    && !self->_hasPreviewLifted)
  {
    char v6 = 0;
  }
  if (self->_floatingSwitcherVisible) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (BOOL)_showResizeUI
{
  return !self->_gestureEnded
      && (self->_dropAction & 0xFFFFFFFFFFFFFFFELL) == 4
      && (![(SBAppDragAndDropGestureSwitcherModifier *)self _isDraggingLiveWindow]
       || self->_hasPlatterized);
}

- (BOOL)_isDraggingLiveWindow
{
  return self->_draggedSceneIdentifier && self->_isWindowDrag && self->_draggedSceneOriginalLayoutRole != 0;
}

- (void)_recomputeBlurStateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  BOOL isBlurred = self->_isBlurred;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  fullScreenAppLayout = self->_fullScreenAppLayout;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__SBAppDragAndDropGestureSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke;
  v12[3] = &unk_1E6AFD168;
  v12[4] = self;
  v12[5] = &v13;
  [(SBAppLayout *)fullScreenAppLayout enumerate:v12];
  if (!self->_gestureEnded)
  {
    if (self->_isBlurred)
    {
      BOOL isResizing = self->_isResizing;
      goto LABEL_7;
    }
LABEL_6:
    BOOL isResizing = 0;
    goto LABEL_7;
  }
  if (!self->_isBlurred) {
    goto LABEL_6;
  }
  BOOL isResizing = !self->_hasResizedEnoughToUnblur;
LABEL_7:
  int v8 = !*((unsigned char *)v14 + 24)
    || ((isResizing | [(SBAppDragAndDropGestureSwitcherModifier *)self _showResizeUI]) & 1) != 0
    || self->_needsBlurBecauseFramesWillMismatch;
  int v9 = self->_isBlurred;
  if (v9 != v8)
  {
    self->_BOOL isBlurred = v8;
    int v9 = v8;
  }
  if (isBlurred && self->_gestureEnded && !v9)
  {
    double v10 = objc_alloc_init(SBUpdateDragPlatterBlurSwitcherEventResponse);
    double v11 = SBAppendSwitcherModifierResponse(v10, 0);
    if (v4) {
      v4[2](v4, v11);
    }
  }
  _Block_object_dispose(&v13, 8);
}

void __77__SBAppDragAndDropGestureSwitcherModifier__recomputeBlurStateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v14 = a3;
  uint64_t v5 = *(id **)(a1 + 32);
  char v6 = [v5[17] leafAppLayoutForRole:a2];
  LOBYTE(a2) = [v5 isLayoutRoleContentReady:a2 inAppLayout:v6];

  if (a2) {
    goto LABEL_2;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v8 + 246))
  {
    unint64_t v9 = *(void *)(v8 + 160);
    if (v9 > 7) {
      goto LABEL_8;
    }
    if (((1 << v9) & 0xC) != 0)
    {
      uint64_t v11 = 244;
LABEL_13:
      char v7 = *(unsigned char *)(v8 + v11) == 0;
      goto LABEL_15;
    }
    if (((1 << v9) & 0x30) == 0)
    {
      if (((1 << v9) & 0xC0) != 0)
      {
LABEL_2:
        char v7 = 1;
        goto LABEL_15;
      }
LABEL_8:
      if (!*(unsigned char *)(v8 + 176))
      {
        double v10 = [v14 uniqueIdentifier];
        char v7 = [v10 isEqualToString:*(void *)(*(void *)(a1 + 32) + 168)];

        goto LABEL_15;
      }
      goto LABEL_14;
    }
    if (*(unsigned char *)(v8 + 176))
    {
      uint64_t v11 = 177;
      goto LABEL_13;
    }
  }
LABEL_14:
  char v7 = 0;
LABEL_15:
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v12 + 24)) {
    char v13 = v7;
  }
  else {
    char v13 = 0;
  }
  *(unsigned char *)(v12 + 24) = v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionModifier, 0);
  objc_storeStrong((id *)&self->_dropTransitionFromAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_initialFullScreenAppLayout, 0);
}

@end