@interface SBGestureSwitcherModifier
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isHitTestBlockingViewVisible;
- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isPreparingLayout;
- (BOOL)isUpdatingLayout;
- (BOOL)requireStripContentsInViewHierarchy;
- (SBGestureSwitcherModifier)initWithGestureID:(id)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (unint64_t)gesturePhase;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
@end

@implementation SBGestureSwitcherModifier

- (SBGestureSwitcherModifier)initWithGestureID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBGestureSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_gestureID, a3);
    v7->_gesturePhase = 0;
  }

  return v7;
}

- (BOOL)isPreparingLayout
{
  return self->_gesturePhase == 1;
}

- (BOOL)isUpdatingLayout
{
  return (self->_gesturePhase & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 1;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBGestureSwitcherModifier;
  v3 = [(SBGestureSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:5];
  return v4;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBGestureSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 1;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if ([v4 isGestureEvent]
    && ([v4 gestureID],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqual:self->_gestureID],
        v5,
        (v6 & 1) == 0))
  {
    lastGestureEvent = self->_lastGestureEvent;
    if (lastGestureEvent && self->_gesturePhase != 3)
    {
      [(SBGestureSwitcherModifierEvent *)lastGestureEvent setPhase:3];
      objc_super v9 = self->_lastGestureEvent;
      v13.receiver = self;
      v13.super_class = (Class)SBGestureSwitcherModifier;
      v7 = [(SBChainableModifier *)&v13 handleEvent:v9];
    }
    else
    {
      v7 = 0;
    }
    [(SBChainableModifier *)self setState:1];
    v10 = self->_lastGestureEvent;
    self->_lastGestureEvent = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGestureSwitcherModifier;
    v7 = [(SBChainableModifier *)&v12 handleEvent:v4];
  }

  return v7;
}

- (id)handleGestureEvent:(id)a3
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBGestureSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v17 handleGestureEvent:v6];
  v8 = [v6 gestureID];
  int v9 = [v8 isEqual:self->_gestureID];

  if (v9)
  {
    unint64_t v10 = [v6 phase];
    if (v10 < self->_gesturePhase)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      v15 = SBStringFromGesturePhase(v10);
      v16 = SBStringFromGesturePhase(self->_gesturePhase);
      [v14 handleFailureInMethod:a2, self, @"SBGestureSwitcherModifier.m", 115, @"Expected the same or a more advanced phase. Got %@, currently %@.", v15, v16 object file lineNumber description];
    }
    self->_gesturePhase = v10;
    if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      v11 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
      uint64_t v12 = +[SBChainableModifierEventResponse responseByAppendingResponse:v11 toResponse:v7];

      v7 = (void *)v12;
    }
    objc_storeStrong((id *)&self->_lastGestureEvent, a3);
  }

  return v7;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if (([v4 isGestureInitiated] & 1) == 0
    && ([v4 isAppLaunchDuringWindowDragGestureTransition] & 1) == 0)
  {
    [(SBChainableModifier *)self setState:1];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBGestureSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v7 handleTransitionEvent:v4];

  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBGestureSwitcherModifier;
  id v4 = [(SBChainableModifier *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = SBStringFromGesturePhase(self->_gesturePhase);
  [v4 appendString:v5 withName:@"phase"];

  return v4;
}

- (unint64_t)gesturePhase
{
  return self->_gesturePhase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGestureEvent, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
}

@end