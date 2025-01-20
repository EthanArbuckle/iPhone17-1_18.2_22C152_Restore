@interface SBContinuousExposeArcSwipeSwitcherModifier
- (SBContinuousExposeArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 selectedAppLayout:(id)a6 initialVisibleAppLayouts:(id)a7 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a8;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_selectedAppLayout;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBContinuousExposeArcSwipeSwitcherModifier

- (SBContinuousExposeArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 selectedAppLayout:(id)a6 initialVisibleAppLayouts:(id)a7 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a8
{
  BOOL v26 = a8;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  v18 = [(SBTransitionSwitcherModifier *)&v27 initWithTransitionID:v13];
  if (v18)
  {
    if (!v15)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v18, @"SBContinuousExposeArcSwipeSwitcherModifier.m", 36, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];
    }
    v19 = [[SBArcSwipeSwitcherModifier alloc] initWithTransitionID:v13 fromAppLayout:v14 toAppLayout:v15 pinSpaceCornerRadiiToDisplayCornerRadii:v26];
    arcSwipeModifier = v18->_arcSwipeModifier;
    v18->_arcSwipeModifier = v19;

    objc_storeStrong((id *)&v18->_fromAppLayout, a4);
    objc_storeStrong((id *)&v18->_toAppLayout, a5);
    objc_storeStrong((id *)&v18->_selectedAppLayout, a6);
    uint64_t v21 = [v17 copy];
    initialVisibleAppLayouts = v18->_initialVisibleAppLayouts;
    v18->_initialVisibleAppLayouts = (NSArray *)v21;
  }
  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBChainableModifier *)self->_arcSwipeModifier parentModifier];

    if (!v5) {
      [(SBChainableModifier *)self addChildModifier:self->_arcSwipeModifier];
    }
  }
}

- (id)handleTransitionEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  id v3 = a3;
  v4 = [(SBTransitionSwitcherModifier *)&v9 handleTransitionEvent:v3];
  uint64_t v5 = objc_msgSend(v3, "phase", v9.receiver, v9.super_class);

  if (v5 == 1)
  {
    objc_super v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:2];
    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v4);

    v4 = (void *)v7;
  }
  return v4;
}

- (id)topMostLayoutElements
{
  id v3 = [(SBContinuousExposeArcSwipeSwitcherModifier *)self _selectedAppLayout];
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  uint64_t v5 = [(SBContinuousExposeArcSwipeSwitcherModifier *)&v8 topMostLayoutElements];
  objc_super v6 = [v4 arrayWithArray:v5];

  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 2)
  {
    [v6 removeObject:self->_toAppLayout];
    if (v3)
    {
      [v6 removeObject:v3];
      [v6 insertObject:v3 atIndex:0];
    }
    [v6 insertObject:self->_toAppLayout atIndex:0];
  }

  return v6;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  initialVisibleAppLayouts = self->_initialVisibleAppLayouts;
  id v7 = a4;
  int v8 = [(NSArray *)initialVisibleAppLayouts containsObject:v7];
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeArcSwipeSwitcherModifier;
  objc_super v9 = [(SBContinuousExposeArcSwipeSwitcherModifier *)&v15 visibleAppLayouts];
  int v10 = [v9 containsObject:v7];

  unint64_t v11 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  int v12 = v10 ^ 1;
  int v13 = v8 ^ 1;
  if (v11 == 1) {
    int v12 = v10;
  }
  else {
    int v13 = v8;
  }
  double result = 1.0;
  if ((v13 & v12) != 0) {
    return 0.0;
  }
  return result;
}

- (id)_selectedAppLayout
{
  p_selectedAppLayout = &self->_selectedAppLayout;
  selectedAppLayout = self->_selectedAppLayout;
  if (!selectedAppLayout || [(SBAppLayout *)selectedAppLayout isEqual:self->_toAppLayout]) {
    p_selectedAppLayout = &self->_fromAppLayout;
  }
  uint64_t v5 = *p_selectedAppLayout;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialVisibleAppLayouts, 0);
  objc_storeStrong((id *)&self->_arcSwipeModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end