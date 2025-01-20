@interface SBShelfRootSwitcherModifier
- (CGRect)containerViewBounds;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)targetFrame;
- (double)floatingDockHeight;
- (id)appLayoutsToResignActive;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)orderedVisibleAppLayoutsForShelfExpansionModifier:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (unint64_t)animationStyle;
- (unint64_t)appearanceState;
- (unint64_t)displayMode;
- (void)_rebuildContainerBounds;
- (void)didMoveToParentModifier:(id)a3;
- (void)setAnimationStyle:(unint64_t)a3;
- (void)setAppearanceState:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayMode:(unint64_t)a3;
- (void)setTargetFrame:(CGRect)a3;
@end

@implementation SBShelfRootSwitcherModifier

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBShelfRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBShelfRootSwitcherModifier *)self _rebuildContainerBounds];
  }
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBShelfRootSwitcherModifier;
  -[SBFluidSwitcherRootSwitcherModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3) {
    [(SBShelfRootSwitcherModifier *)self _rebuildContainerBounds];
  }
}

- (void)setDisplayMode:(unint64_t)a3
{
  if (*(void *)&self->_isRoutingFrameForIndexToFloating != a3)
  {
    *(void *)&self->_isRoutingFrameForIndexToFloating = a3;
    v4 = [(SBChainableModifier *)self parentModifier];
    if (v4)
    {
    }
    else
    {
      objc_super v5 = [(SBChainableModifier *)self delegate];

      if (!v5) {
        return;
      }
    }
    [(SBShelfRootSwitcherModifier *)self _rebuildContainerBounds];
  }
}

- (void)_rebuildContainerBounds
{
  uint64_t v3 = *(void *)&self->_isRoutingFrameForIndexToFloating;
  if (v3 == 1)
  {
    SBAppLayoutGenericAppLayoutWithConfiguration(3);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    -[SBShelfRootSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 1, v16, 4, 0.0, 0.0, self->_portraitContainerBounds.size.width, self->_portraitContainerBounds.origin.y);
    *(void *)&self->super._hasPerformedInitialSetup = v11;
    self->_portraitContainerBounds.origin.x = v12;
    self->_portraitContainerBounds.origin.y = v13;
    self->_portraitContainerBounds.size.width = v14;
    long long v15 = *(_OWORD *)&self->_portraitContainerBounds.origin.y;
    *(_OWORD *)&self->_portraitContainerBounds.size.height = *(_OWORD *)&self->super._hasPerformedInitialSetup;
    *(_OWORD *)&self->_landscapeContainerBounds.origin.y = v15;
  }
  else if (!v3)
  {
    v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    if (v6 >= v8) {
      double v9 = v8;
    }
    else {
      double v9 = v6;
    }
    if (v6 >= v8) {
      double v10 = v6;
    }
    else {
      double v10 = v8;
    }
    *(void *)&self->super._hasPerformedInitialSetup = 0;
    self->_portraitContainerBounds.origin.x = 0.0;
    self->_portraitContainerBounds.origin.y = v9;
    self->_portraitContainerBounds.size.width = v10;
    self->_portraitContainerBounds.size.height = 0.0;
    self->_landscapeContainerBounds.origin.x = 0.0;
    self->_landscapeContainerBounds.origin.y = v10;
    self->_landscapeContainerBounds.size.width = v9;
  }
}

- (CGRect)containerViewBounds
{
  if ((unint64_t)([(SBShelfRootSwitcherModifier *)self switcherInterfaceOrientation]- 1) >= 2)uint64_t v3 = &OBJC_IVAR___SBShelfRootSwitcherModifier__landscapeContainerBounds; {
  else
  }
    uint64_t v3 = &OBJC_IVAR___SBShelfRootSwitcherModifier__portraitContainerBounds;
  v4 = (double *)((char *)self + *v3);
  double v5 = v4[2];
  double v6 = v4[3];
  double v7 = *v4;
  double v8 = v4[1];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)floatingDockHeight
{
  return 0.0;
}

- (int64_t)tintStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  if ([v5 type] == 5) {
    goto LABEL_11;
  }
  if ([(SBShelfRootSwitcherModifier *)self userInterfaceStyle] != 2)
  {
    if ([(SBShelfRootSwitcherModifier *)self userInterfaceStyle] == 1)
    {
      double v6 = [(SBShelfRootSwitcherModifier *)self shelfFocusedDisplayItems];
      if ([v5 containsAnyItemFromSet:v6]) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = 3;
      }
      goto LABEL_10;
    }
LABEL_11:
    int64_t v7 = 0;
    goto LABEL_12;
  }
  double v6 = [(SBShelfRootSwitcherModifier *)self shelfFocusedDisplayItems];
  if ([v5 containsAnyItemFromSet:v6]) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = 4;
  }
LABEL_10:

LABEL_12:
  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBShelfRootSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if ([v6 environment] == 2)
  {
    char height_low = LOBYTE(self->_landscapeContainerBounds.size.height);
    LOBYTE(self->_landscapeContainerBounds.size.height) = 1;
    v25.receiver = self;
    v25.super_class = (Class)SBShelfRootSwitcherModifier;
    [(SBShelfRootSwitcherModifier *)&v25 frameForIndex:a3];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    LOBYTE(self->_landscapeContainerBounds.size.height) = height_low;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBShelfRootSwitcherModifier;
    [(SBShelfRootSwitcherModifier *)&v24 frameForIndex:a3];
    double v9 = v16;
    double v11 = v17;
    double v13 = v18;
    double v15 = v19;
  }

  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (id)appLayoutsToResignActive
{
  return 0;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  uint64_t v3 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  if (!v3) {
    uint64_t v3 = objc_alloc_init(SBShelfCarouselSwitcherModifier);
  }
  return v3;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  id v3 = a3;
  v4 = [SBRemovalSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  double v6 = [v3 appLayout];
  uint64_t v7 = [v3 reason];

  double v8 = [(SBRemovalSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 reason:v7];
  return v8;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  id v3 = a3;
  v4 = [SBInsertionSwitcherModifier alloc];
  uint64_t v5 = [v3 appLayout];

  double v6 = [(SBInsertionSwitcherModifier *)v4 initWithAppLayout:v5];
  return v6;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  id v3 = a3;
  v4 = [SBSwipeToKillSwitcherModifier alloc];
  uint64_t v5 = [v3 layoutRole];
  double v6 = [v3 appLayout];

  uint64_t v7 = [(SBSwipeToKillSwitcherModifier *)v4 initWithLayoutRole:v5 inAppLayout:v6 fadeOutSwipedItems:1];
  return v7;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  id v3 = objc_alloc_init(SBScrollingSwitcherModifier);
  return v3;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  id v3 = a3;
  v4 = [SBFocusedAppLayoutSwitcherModifier alloc];
  uint64_t v5 = [v3 appLayout];

  double v6 = [(SBFocusedAppLayoutSwitcherModifier *)v4 initWithFocusedAppLayout:v5];
  return v6;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  if (self->_displayMode - 1 > 1)
  {
    double v11 = 0;
  }
  else
  {
    unint64_t animationStyle = self->_animationStyle;
    CGFloat x = self->_targetFrame.origin.x;
    CGFloat y = self->_targetFrame.origin.y;
    CGFloat width = self->_targetFrame.size.width;
    id v8 = a3;
    *(void *)&v21.origin.CGFloat x = animationStyle;
    v21.origin.CGFloat y = x;
    v21.size.CGFloat width = y;
    v21.size.height = width;
    if (CGRectIsNull(v21))
    {
      double v9 = *MEMORY[0x1E4F1DAD8];
      double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else
    {
      UIRectGetCenter();
      double v9 = v12;
      [(SBShelfRootSwitcherModifier *)self switcherViewBounds];
      double v14 = v13;
      double v15 = [(SBShelfRootSwitcherModifier *)self medusaSettings];
      [v15 switcherShelfGenieInitialYIncrementBelowScreen];
      double v10 = v14 + v16;
    }
    double v17 = [SBShelfExpansionSwitcherModifier alloc];
    double v18 = [v8 transitionID];

    double v11 = -[SBShelfExpansionSwitcherModifier initWithTransitionID:expand:style:target:animationDelegate:](v17, "initWithTransitionID:expand:style:target:animationDelegate:", v18, self->_displayMode == 1, self->_appearanceState, self, v9, v10);
  }
  return v11;
}

- (id)orderedVisibleAppLayoutsForShelfExpansionModifier:(id)a3
{
  id v3 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  v4 = [v3 orderedVisibleAppLayouts];

  return v4;
}

- (unint64_t)displayMode
{
  return *(void *)&self->_isRoutingFrameForIndexToFloating;
}

- (unint64_t)appearanceState
{
  return self->_displayMode;
}

- (void)setAppearanceState:(unint64_t)a3
{
  self->_displayMode = a3;
}

- (CGRect)targetFrame
{
  double v2 = *(double *)&self->_animationStyle;
  double x = self->_targetFrame.origin.x;
  double y = self->_targetFrame.origin.y;
  double width = self->_targetFrame.size.width;
  result.size.height = width;
  result.size.double width = y;
  result.origin.double y = x;
  result.origin.double x = v2;
  return result;
}

- (void)setTargetFrame:(CGRect)a3
{
  *(CGRect *)&self->_unint64_t animationStyle = a3;
}

- (unint64_t)animationStyle
{
  return self->_appearanceState;
}

- (void)setAnimationStyle:(unint64_t)a3
{
  self->_appearanceState = a3;
}

@end