@interface SBMainSwitcherRoutingSwitcherModifier
- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4;
- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4;
- (SBMainSwitcherRoutingSwitcherModifier)initWithMainModifierSubtree:(id)a3 floatingModifierSubtree:(id)a4;
- (id)_modifierToHandleLayoutElement:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugPotentialChildModifiers;
- (id)fallbackModifierForRoutingModifier:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)homeScreenModifierForRoutingModifier:(id)a3;
- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4;
- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4;
- (id)scrollModifierForRoutingModifier:(id)a3;
- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3;
@end

@implementation SBMainSwitcherRoutingSwitcherModifier

- (SBMainSwitcherRoutingSwitcherModifier)initWithMainModifierSubtree:(id)a3 floatingModifierSubtree:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v17 init];
  v10 = v9;
  if (v9)
  {
    p_mainModifierSubtree = (id *)&v9->_mainModifierSubtree;
    objc_storeStrong((id *)&v9->_mainModifierSubtree, a3);
    objc_storeStrong((id *)&v10->_floatingModifierSubtree, a4);
    objc_storeStrong((id *)&v10->_currentScrollableSubtree, *p_mainModifierSubtree);
    objc_storeStrong((id *)&v10->_activeSubtree, *p_mainModifierSubtree);
    v12 = [SBRoutingSwitcherModifier alloc];
    v18[0] = v10->_floatingModifierSubtree;
    v18[1] = *p_mainModifierSubtree;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v14 = [(SBRoutingSwitcherModifier *)v12 initWithModifiers:v13 delegate:v10];
    routingModifier = v10->_routingModifier;
    v10->_routingModifier = (SBRoutingSwitcherModifier *)v14;

    [(SBChainableModifier *)v10 addChildModifier:v10->_routingModifier];
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[(SBSwitcherModifier *)self->_mainModifierSubtree copy];
  v6 = (void *)[(SBSwitcherModifier *)self->_floatingModifierSubtree copy];
  id v7 = (void *)[v4 initWithMainModifierSubtree:v5 floatingModifierSubtree:v6];

  return v7;
}

- (id)debugPotentialChildModifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  floatingModifierSubtree = self->_floatingModifierSubtree;
  v5[0] = self->_mainModifierSubtree;
  v5[1] = floatingModifierSubtree;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  id v7 = a4;
  id v8 = (SBSwitcherModifier *)a5;
  if ([v7 type] == 17)
  {
    v9 = [v7 appLayout];
    uint64_t v10 = [v9 environment];

    BOOL v11 = v10 != 2;
    BOOL v12 = v10 == 2;
  }
  else
  {
    BOOL v12 = 1;
    BOOL v11 = 1;
  }
  if ([v7 type] == 16)
  {
    if (self->_floatingSwitcherVisible)
    {
      BOOL v11 = 0;
      BOOL v12 = 1;
    }
    else
    {
      BOOL v12 = self->_currentEnvironmentMode == 3;
      BOOL v11 = 1;
    }
  }
  if ([v7 type] == 12)
  {
    v13 = [v7 appLayout];
    uint64_t v14 = [v13 environment];

    BOOL v11 = v14 != 2;
    BOOL v12 = v14 == 2;
  }
  if ([v7 type] == 14)
  {
    v15 = [v7 appLayout];
    uint64_t v16 = [v15 environment];

    BOOL v11 = v16 != 2;
    BOOL v12 = v16 == 2;
  }
  if ([v7 type] == 13)
  {
    objc_super v17 = [v7 appLayout];
    uint64_t v18 = [v17 environment];

    BOOL v11 = v18 != 2;
    BOOL v12 = v18 == 2;
  }
  if (self->_mainModifierSubtree == v8 || (BOOL v11 = v12, self->_floatingModifierSubtree == v8))
  {
    if (v11) {
      v20 = v7;
    }
    else {
      v20 = 0;
    }
    id v19 = v20;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  id v7 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __88__SBMainSwitcherRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
  v11[3] = &unk_1E6AFA888;
  id v12 = v7;
  v13 = self;
  id v8 = v7;
  v9 = objc_msgSend(a4, "bs_filter:", v11);

  return v9;
}

BOOL __88__SBMainSwitcherRoutingSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 104);
  uint64_t v4 = [a2 environment];
  if (v2 == v3) {
    return v4 != 2;
  }
  else {
    return v4 == 2;
  }
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  id v7 = a4;
  id v8 = v7;
  if (self->_mainModifierSubtree == a5) {
    id v9 = v7;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "environment", a3);
  v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
  if (v5 == 2) {
    v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  }
  id v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  return v7;
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_currentScrollableSubtree;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  return self->_mainModifierSubtree;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_activeSubtree;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  return [(SBMainSwitcherRoutingSwitcherModifier *)self _modifierToHandleLayoutElement:a4];
}

- (id)_modifierToHandleLayoutElement:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 switcherLayoutElementType];
  v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  if ((unint64_t)(v5 - 2) >= 3)
  {
    if (v5)
    {
      v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
    else if ([v4 environment] != 2)
    {
      v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_mainModifierSubtree;
}

- (BOOL)isLayoutRoleOccluded:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  if (![(SBMainSwitcherRoutingSwitcherModifier *)&v38 isLayoutRoleOccluded:a3 inAppLayout:v6])
  {
    if (self->_floatingAppLayout
      && self->_currentEnvironmentMode == 3
      && (unint64_t)(self->_floatingConfiguration - 1) <= 1)
    {
      id v8 = [(SBMainSwitcherRoutingSwitcherModifier *)self appLayouts];
      if ([v8 containsObject:v6])
      {
        id v9 = [(SBMainSwitcherRoutingSwitcherModifier *)self appLayouts];
        int v10 = [v9 containsObject:self->_floatingAppLayout];

        if (v10)
        {
          BOOL v11 = [(SBMainSwitcherRoutingSwitcherModifier *)self appLayouts];
          -[SBMainSwitcherRoutingSwitcherModifier frameForIndex:](self, "frameForIndex:", [v11 indexOfObject:v6]);
          double v13 = v12;
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;

          -[SBMainSwitcherRoutingSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6, v13, v15, v17, v19);
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          v28 = [(SBMainSwitcherRoutingSwitcherModifier *)self appLayouts];
          -[SBMainSwitcherRoutingSwitcherModifier frameForIndex:](self, "frameForIndex:", [v28 indexOfObject:self->_floatingAppLayout]);
          CGFloat v30 = v29;
          CGFloat v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;

          v39.origin.x = v21;
          v39.origin.y = v23;
          v39.size.width = v25;
          v39.size.height = v27;
          v40.origin.x = v30;
          v40.origin.y = v32;
          v40.size.width = v34;
          v40.size.height = v36;
          BOOL v7 = CGRectIntersectsRect(v39, v40);
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    BOOL v7 = 0;
    goto LABEL_11;
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)canPerformKeyboardShortcutAction:(int64_t)a3 forBundleIdentifier:(id)a4
{
  id v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  unsigned int v7 = [(SBMainSwitcherRoutingSwitcherModifier *)&v38 canPerformKeyboardShortcutAction:a3 forBundleIdentifier:v6];
  LODWORD(v8) = v7;
  switch(a3)
  {
    case 4:
    case 5:
    case 15:
    case 16:
      if (v7)
      {
        if (self->_currentEnvironmentMode != 3) {
          goto LABEL_19;
        }
        id v9 = [(SBSwitcherModifier *)self->_mainModifierSubtree visibleAppLayouts];
        if (objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_7_0))
        {
          int v10 = [(SBSwitcherModifier *)self->_floatingModifierSubtree visibleAppLayouts];
          LOBYTE(v8) = [v10 count] != 0;
        }
        else
        {
          LOBYTE(v8) = 1;
        }
      }
      goto LABEL_35;
    case 9:
    case 10:
      uint64_t v34 = 0;
      double v35 = &v34;
      uint64_t v36 = 0x2020000000;
      int v37 = 0;
      BOOL v11 = [(SBSwitcherModifier *)self->_floatingModifierSubtree visibleAppLayouts];
      uint64_t v12 = [v11 count];

      if (v12)
      {
        double v13 = [(SBMainSwitcherRoutingSwitcherModifier *)self appLayouts];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3;
        v33[3] = &unk_1E6AFB450;
        v33[4] = &v34;
        [v13 enumerateObjectsUsingBlock:v33];
      }
      if (v8) {
        LOBYTE(v8) = self->_currentEnvironmentMode == 3 && *((_DWORD *)v35 + 6) > 1;
      }
      _Block_object_dispose(&v34, 8);
      goto LABEL_35;
    case 12:
      if (v7)
      {
        if (self->_currentEnvironmentMode == 3)
        {
          double v20 = [(SBSwitcherModifier *)self->_mainModifierSubtree visibleAppLayouts];
          LOBYTE(v8) = objc_msgSend(v20, "bs_containsObjectPassingTest:", &__block_literal_global_67);
        }
        else
        {
LABEL_19:
          LOBYTE(v8) = 0;
        }
      }
      goto LABEL_35;
    case 13:
    case 14:
      unsigned int v14 = v7;
      if (!v6)
      {
        id v8 = [(SBMainSwitcherRoutingSwitcherModifier *)self leafAppLayoutForKeyboardFocusedScene];
        uint64_t v21 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
        uint64_t v22 = 1;
        if (a3 == 13) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = 2;
        }
        if (a3 == 13) {
          uint64_t v22 = 2;
        }
        if (v21 == 1) {
          uint64_t v24 = v22;
        }
        else {
          uint64_t v24 = v23;
        }
        CGFloat v25 = [(SBSwitcherModifier *)self->_mainModifierSubtree visibleAppLayouts];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_4;
        v30[3] = &unk_1E6AFB478;
        double v31 = v8;
        uint64_t v32 = v24;
        id v16 = v8;
        char v26 = objc_msgSend(v25, "bs_containsObjectPassingTest:", v30);

        LOBYTE(v8) = v14 & (v26 ^ 1);
        double v19 = v31;
        goto LABEL_29;
      }
      double v15 = +[SBApplicationController sharedInstanceIfExists];
      id v16 = [v15 applicationWithBundleIdentifier:v6];

      if (v16)
      {
        id v8 = [v16 info];
        char v17 = [v8 supportsMultiwindow];

        LOBYTE(v8) = v17 & v14;
        if ((v17 & 1) == 0 && ((v14 ^ 1) & 1) == 0)
        {
          double v18 = [(SBSwitcherModifier *)self->_mainModifierSubtree visibleAppLayouts];
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_5;
          v28[3] = &unk_1E6AF4B60;
          id v29 = v6;
          LODWORD(v8) = objc_msgSend(v18, "bs_containsObjectPassingTest:", v28) ^ 1;

          double v19 = v29;
LABEL_29:
        }
      }

LABEL_35:
      return (char)v8;
    default:
      goto LABEL_35;
  }
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([a2 configuration]);
  return SBSpaceConfigurationIsSplitView(v2);
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration([a2 centerConfiguration]);
  return SBCenterConfigurationIsValid(v2);
}

uint64_t __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 environment];
  if (result == 2) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 2) {
    *a4 = 1;
  }
  return result;
}

BOOL __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SBMainDisplayLayoutStateSpaceConfigurationFromAppLayoutConfiguration([v3 configuration]);
  if (SBSpaceConfigurationIsSplitView(v4))
  {
    uint64_t v5 = [v3 leafAppLayoutForRole:*(void *)(a1 + 40)];
    BOOL v6 = v5 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

uint64_t __94__SBMainSwitcherRoutingSwitcherModifier_canPerformKeyboardShortcutAction_forBundleIdentifier___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 containsItemWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  char v5 = [v4 toFloatingSwitcherVisible];
  BOOL v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
  if ((v5 & 1) == 0)
  {
    int v7 = [v4 fromFloatingSwitcherVisible];
    BOOL v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    if (v7) {
      BOOL v6 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
    }
  }
  objc_storeStrong((id *)&self->_currentScrollableSubtree, *(id *)((char *)&self->super.super.super.isa + *v6));
  self->_currentEnvironmentMode = [v4 toEnvironmentMode];
  self->_floatingSwitcherVisible = [v4 toFloatingSwitcherVisible];
  id v8 = [v4 toFloatingAppLayout];
  floatingAppLayout = self->_floatingAppLayout;
  self->_floatingAppLayout = v8;

  self->_floatingConfiguration = [v4 toFloatingConfiguration];
  if ([v4 phase] == 1 && (objc_msgSend(v4, "isGestureInitiated") & 1) == 0)
  {
    BOOL v10 = [v4 fromWindowPickerRole] != 1 && objc_msgSend(v4, "toWindowPickerRole") == 1;
    BOOL v11 = [v4 fromWindowPickerRole] == 1 && objc_msgSend(v4, "toWindowPickerRole") != 1;
    BOOL v12 = [v4 fromWindowPickerRole] != 2 && objc_msgSend(v4, "toWindowPickerRole") == 2;
    BOOL v13 = [v4 fromWindowPickerRole] == 2 && objc_msgSend(v4, "toWindowPickerRole") != 2;
    char v14 = v10 || v11 || v12 || v13;
    double v15 = [v4 fromAppExposeBundleID];
    id v16 = [v4 toAppExposeBundleID];
    int v17 = BSEqualStrings();

    double v18 = [v4 fromAppLayout];
    double v19 = [v4 toAppLayout];
    if (v18 == v19
      && ((uint64_t v20 = [v4 fromEnvironmentMode], v20 != objc_msgSend(v4, "toEnvironmentMode"))
        ? (char v21 = 1)
        : (char v21 = v14),
          (v21 & 1) == 0))
    {

      uint64_t v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
      if (v17) {
        uint64_t v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
      }
    }
    else
    {

      uint64_t v22 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    }
    uint64_t v23 = (SBSwitcherModifier *)*(id *)((char *)&self->super.super.super.isa + *v22);
    activeSubtree = self->_activeSubtree;
    self->_activeSubtree = v23;
  }
  v27.receiver = self;
  v27.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  CGFloat v25 = [(SBSwitcherModifier *)&v27 handleTransitionEvent:v4];

  return v25;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  if ([v4 phase] == 1)
  {
    char v5 = [v4 selectedAppLayout];
    uint64_t v6 = [v5 environment];
    int v7 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__mainModifierSubtree;
    if (v6 == 2) {
      int v7 = &OBJC_IVAR___SBMainSwitcherRoutingSwitcherModifier__floatingModifierSubtree;
    }
    objc_storeStrong((id *)&self->_activeSubtree, *(id *)((char *)&self->super.super.super.isa + *v7));
  }
  v10.receiver = self;
  v10.super_class = (Class)SBMainSwitcherRoutingSwitcherModifier;
  id v8 = [(SBSwitcherModifier *)&v10 handleGestureEvent:v4];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingAppLayout, 0);
  objc_storeStrong((id *)&self->_activeSubtree, 0);
  objc_storeStrong((id *)&self->_currentScrollableSubtree, 0);
  objc_storeStrong((id *)&self->_floatingModifierSubtree, 0);
  objc_storeStrong((id *)&self->_mainModifierSubtree, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
}

@end