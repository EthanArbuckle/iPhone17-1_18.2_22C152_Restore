@interface SBContinuousExposeWindowDragRootSwitcherModifier
- (SBAppLayout)initialAppLayout;
- (SBContinuousExposeWindowDragRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 initialAppLayout:(id)a4;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)appLayoutsToResignActive;
- (id)debugPotentialChildModifiers;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleGestureEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBContinuousExposeWindowDragRootSwitcherModifier

- (SBContinuousExposeWindowDragRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 initialAppLayout:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  v8 = [(SBGestureRootSwitcherModifier *)&v11 initWithStartingEnvironmentMode:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_initialAppLayout, a4);
  }

  return v9;
}

- (id)debugPotentialChildModifiers
{
  v7.receiver = self;
  v7.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  v3 = [(SBChainableModifier *)&v7 debugPotentialChildModifiers];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SBContinuousExposeWindowDragRootSwitcherModifier_debugPotentialChildModifiers__block_invoke;
  v6[3] = &unk_1E6AFABE0;
  v6[4] = self;
  v4 = objc_msgSend(v3, "bs_map:", v6);

  return v4;
}

id __80__SBContinuousExposeWindowDragRootSwitcherModifier_debugPotentialChildModifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) gestureModifier];
  if ([v3 isEqual:v4])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [v3 modifier];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v6 = v3;
LABEL_6:
  objc_super v7 = v6;

  return v7;
}

- (int64_t)gestureType
{
  return 8;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
  objc_super v7 = [v6 itemForLayoutRole:1];
  v8 = [SBContinuousExposeWindowDragContentSwitcherModifier alloc];
  v9 = [v5 gestureID];

  v10 = [(SBContinuousExposeWindowDragContentSwitcherModifier *)v8 initWithGestureID:v9 initialAppLayout:self->_initialAppLayout selectedDisplayItem:v7];
  objc_super v11 = [SBContinuousExposeWindowDragContainerSwitcherModifier alloc];
  v15[0] = v6;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v13 = [(SBContinuousExposeWindowDragContainerSwitcherModifier *)v11 initWithAppLayouts:v12 initialAppLayout:self->_initialAppLayout selectedDisplayItem:v7 windowDragContentSwitcherModifier:v10];

  return v13;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  id v5 = a3;
  id v6 = [SBContinuousExposeWindowDropSwitcherModifier alloc];
  objc_super v7 = [v5 transitionID];
  v8 = [(SBGestureRootSwitcherModifier *)self selectedAppLayout];
  v9 = [v8 itemForLayoutRole:1];
  v10 = [v5 toAppLayout];

  objc_super v11 = [(SBContinuousExposeWindowDropSwitcherModifier *)v6 initWithTransitionID:v7 selectedDisplayItem:v9 toAppLayout:v10 initialAppLayout:self->_initialAppLayout];
  return v11;
}

- (id)handleGestureEvent:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  id v3 = a3;
  v4 = [(SBGestureRootSwitcherModifier *)&v9 handleGestureEvent:v3];
  uint64_t v5 = objc_msgSend(v3, "phase", v9.receiver, v9.super_class);

  if (v5 == 1)
  {
    id v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v4);

    v4 = (void *)v7;
  }
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  id v6 = [(SBGestureRootSwitcherModifier *)&v11 handleTransitionEvent:v5];
  uint64_t v7 = [v5 toAppLayout];
  v8 = v7;
  if (!v7)
  {
    id v3 = +[SBAppLayout homeScreenAppLayout];
    v8 = objc_msgSend(v3, "appLayoutByModifyingPreferredDisplayOrdinal:", -[SBContinuousExposeWindowDragRootSwitcherModifier displayOrdinal](self, "displayOrdinal"));
  }
  objc_storeStrong((id *)&self->_initialAppLayout, v8);
  if (!v7)
  {
  }
  if ([v5 phase] == 1 && (objc_msgSend(v5, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0)
  {
    objc_super v9 = [(SBGestureRootSwitcherModifier *)self gestureModifier];
    [v9 setState:1];
  }
  if ([v5 phase] == 3 && (objc_msgSend(v5, "isAppLaunchDuringWindowDragGestureTransition") & 1) == 0) {
    [(SBChainableModifier *)self setState:1];
  }

  return v6;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v11 handleSceneReadyEvent:v4];
  initialAppLayout = self->_initialAppLayout;
  uint64_t v7 = objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);

  LODWORD(initialAppLayout) = [(SBAppLayout *)initialAppLayout containsAllItemsFromAppLayout:v7];
  if (initialAppLayout)
  {
    v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:0];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    id v5 = (void *)v9;
  }
  return v5;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  if ([(SBContinuousExposeWindowDragRootSwitcherModifier *)self isSoftwareKeyboardVisible])
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    v8.receiver = self;
    v8.super_class = (Class)SBContinuousExposeWindowDragRootSwitcherModifier;
    id v4 = [(SBContinuousExposeWindowDragRootSwitcherModifier *)&v8 appLayouts];
    id v5 = [v3 setWithArray:v4];
    id v6 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v5];

    [v6 setApplyAssertionEvenIfAppIsHostingTheKeyboard:1];
  }
  else
  {
    id v6 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
  }
  return v6;
}

- (SBAppLayout)initialAppLayout
{
  return self->_initialAppLayout;
}

- (void).cxx_destruct
{
}

@end