@interface SBGridSwitcherModifier
- (CGRect)containerViewBounds;
- (char)activityModeForAppLayout:(id)a3;
- (char)jetsamModeForAppLayout:(id)a3;
- (id)foregroundAppLayouts;
- (id)gridLayoutModifier;
- (id)handleRemovalEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleSwipeToKillEvent:(id)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)handleTapOutsideToDismissEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBGridSwitcherModifier

- (void)didMoveToParentModifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBGridSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v11, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_gridLayoutModifier)
    {
      v5 = [[SBGridLayoutSwitcherModifier alloc] initWithAlignment:0 layoutDirection:0];
      gridLayoutModifier = self->_gridLayoutModifier;
      self->_gridLayoutModifier = v5;

      [(SBChainableModifier *)self addChildModifier:self->_gridLayoutModifier atLevel:0 key:0];
      v7 = objc_alloc_init(_SBGridFloorSwitcherModifier);
      floorModifier = self->_floorModifier;
      self->_floorModifier = v7;

      [(SBChainableModifier *)self addChildModifier:self->_floorModifier atLevel:1 key:0];
      v9 = objc_alloc_init(SBDefaultImplementationsSwitcherModifier);
      [(SBChainableModifier *)self addChildModifier:v9 atLevel:2 key:0];

      CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      self->_containerViewBounds_lastBounds.size = v10;
    }
  }
}

- (id)gridLayoutModifier
{
  gridLayoutModifier = self->_gridLayoutModifier;
  if (!gridLayoutModifier)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBGridSwitcherModifier.m" lineNumber:78 description:@"Trying to use the grid layout modifier but it doesn't exist yet!"];

    gridLayoutModifier = self->_gridLayoutModifier;
  }
  return gridLayoutModifier;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  if ([v4 toEnvironmentMode] == 2)
  {
    v5 = [v4 fromAppLayout];
    activeAppLayoutInSwitcher = self->_activeAppLayoutInSwitcher;
    self->_activeAppLayoutInSwitcher = v5;
  }
  v7 = [v4 toAppLayout];
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v7;

  v11.receiver = self;
  v11.super_class = (Class)SBGridSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v11 handleTransitionEvent:v4];

  return v9;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBGridSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v16 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    ++self->_ongoingAppLayoutRemovals;
    goto LABEL_13;
  }
  if ([v4 phase] == 2)
  {
    --self->_ongoingAppLayoutRemovals;
    v6 = [(SBGridSwitcherModifier *)self appLayouts];
    if ([v6 count])
    {
    }
    else
    {
      unint64_t ongoingAppLayoutRemovals = self->_ongoingAppLayoutRemovals;

      if (!ongoingAppLayoutRemovals)
      {
        CGSize v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
        v12 = +[SBAppLayout homeScreenAppLayout];
        [(SBSwitcherTransitionRequest *)v10 setAppLayout:v12];

        [(SBSwitcherTransitionRequest *)v10 setAutoPIPDisabled:1];
LABEL_12:
        v13 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:0];
        uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v5];

        v5 = (void *)v14;
        goto LABEL_13;
      }
    }
    v8 = [v4 appLayout];
    if (!BSEqualObjects())
    {

      goto LABEL_13;
    }
    unint64_t v9 = self->_ongoingAppLayoutRemovals;

    if (v9) {
      goto LABEL_13;
    }
    CGSize v10 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    objc_super v11 = +[SBAppLayout homeScreenAppLayout];
    [(SBSwitcherTransitionRequest *)v10 setAppLayout:v11];

    [(SBSwitcherTransitionRequest *)v10 setUnlockedEnvironmentMode:2];
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SBGridSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v14 handleScrollEvent:v4];
  uint64_t v6 = [v4 phase];

  if (v6 == 1)
  {
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_containerViewBounds_lastBounds.size = v11;
  }
  else if (!v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBGridSwitcherModifier;
    [(SBGridSwitcherModifier *)&v13 containerViewBounds];
    self->_containerViewBounds_lastBounds.origin.x = v7;
    self->_containerViewBounds_lastBounds.origin.y = v8;
    self->_containerViewBounds_lastBounds.size.width = v9;
    self->_containerViewBounds_lastBounds.size.height = v10;
  }
  return v5;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBGridSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v13 handleSwipeToKillEvent:v4];
  if (([v4 isDragging] & 1) == 0
    && ([v4 progress], BSFloatIsZero())
    && ([v4 decelerationTargetProgress], (BSFloatIsZero() & 1) != 0))
  {
    CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_containerViewBounds_lastBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_containerViewBounds_lastBounds.size = v6;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridSwitcherModifier;
    [(SBGridSwitcherModifier *)&v12 containerViewBounds];
    self->_containerViewBounds_lastBounds.origin.x = v7;
    self->_containerViewBounds_lastBounds.origin.y = v8;
    self->_containerViewBounds_lastBounds.size.width = v9;
    self->_containerViewBounds_lastBounds.size.height = v10;
  }

  return v5;
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBGridSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTapAppLayoutEvent:v4];
  CGSize v6 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:](SBMutableSwitcherTransitionRequest, "requestForTapAppLayoutEvent:", v4, v10.receiver, v10.super_class);

  objc_msgSend(v6, "setRetainsSiri:", -[SBGridSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
  CGFloat v7 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v6 gestureInitiated:0];
  CGFloat v8 = SBAppendSwitcherModifierResponse(v7, v5);

  return v8;
}

- (id)handleTapOutsideToDismissEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBGridSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBSwitcherModifier *)&v11 handleTapOutsideToDismissEvent:v3];
  char v5 = objc_msgSend(v3, "isHandled", v11.receiver, v11.super_class);

  if ((v5 & 1) == 0)
  {
    CGSize v6 = [SBPerformTransitionSwitcherEventResponse alloc];
    CGFloat v7 = +[SBSwitcherTransitionRequest requestForActivatingHomeScreen];
    CGFloat v8 = [(SBPerformTransitionSwitcherEventResponse *)v6 initWithTransitionRequest:v7 gestureInitiated:0];

    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v4];

    id v4 = (void *)v9;
  }
  return v4;
}

- (CGRect)containerViewBounds
{
  p_containerViewBounds_lastBounds = &self->_containerViewBounds_lastBounds;
  if (CGRectIsNull(self->_containerViewBounds_lastBounds))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBGridSwitcherModifier;
    [(SBGridSwitcherModifier *)&v8 containerViewBounds];
  }
  else
  {
    double x = p_containerViewBounds_lastBounds->origin.x;
    double y = p_containerViewBounds_lastBounds->origin.y;
    double width = p_containerViewBounds_lastBounds->size.width;
    double height = p_containerViewBounds_lastBounds->size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)topMostLayoutElements
{
  id v3 = [(SBGridSwitcherModifier *)self appLayouts];
  gridLayoutModifier = self->_gridLayoutModifier;
  [(SBGridSwitcherModifier *)self scrollViewContentOffset];
  uint64_t v5 = [(SBGridLayoutSwitcherModifier *)gridLayoutModifier visibleAppLayoutRangeForContentOffset:"visibleAppLayoutRangeForContentOffset:"];
  CGFloat v7 = objc_msgSend(v3, "subarrayWithRange:", v5, v6);

  return v7;
}

- (id)foregroundAppLayouts
{
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwitcherModifier;
  v2 = [(SBGridSwitcherModifier *)&v4 foregroundAppLayouts];
  return v2;
}

- (char)jetsamModeForAppLayout:(id)a3
{
  if (self->_activeAppLayoutInSwitcher == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwitcherModifier;
  return [(SBGridSwitcherModifier *)&v4 jetsamModeForAppLayout:sel_jetsamModeForAppLayout_];
}

- (char)activityModeForAppLayout:(id)a3
{
  if (self->_activeAppLayoutInSwitcher == a3) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwitcherModifier;
  return [(SBGridSwitcherModifier *)&v4 activityModeForAppLayout:sel_activityModeForAppLayout_];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAppLayoutInSwitcher, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_gridLayoutModifier, 0);
}

@end