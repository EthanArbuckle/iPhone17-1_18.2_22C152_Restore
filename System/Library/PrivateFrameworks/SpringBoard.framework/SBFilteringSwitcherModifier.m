@interface SBFilteringSwitcherModifier
- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4;
- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4;
- (NSArray)appLayoutsToFilter;
- (SBFilteringSwitcherModifier)initWithAppLayouts:(id)a3 modifier:(id)a4;
- (SBSwitcherModifier)modifier;
- (id)fallbackModifierForRoutingModifier:(id)a3;
- (id)homeScreenModifierForRoutingModifier:(id)a3;
- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4;
- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5;
- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4;
- (id)scrollModifierForRoutingModifier:(id)a3;
- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation SBFilteringSwitcherModifier

- (SBFilteringSwitcherModifier)initWithAppLayouts:(id)a3 modifier:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBFilteringSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v25 init];
  if (v9)
  {
    if (v7)
    {
      if (v8)
      {
LABEL_4:
        uint64_t v10 = [v7 copy];
        appLayoutsToFilter = v9->_appLayoutsToFilter;
        v9->_appLayoutsToFilter = (NSArray *)v10;

        objc_storeStrong((id *)&v9->_modifier, a4);
        v12 = objc_alloc_init(_SBFilteringPassthroughTargetSwitcherModifier);
        passthroughModifier = v9->_passthroughModifier;
        v9->_passthroughModifier = v12;

        v14 = [SBRoutingSwitcherModifier alloc];
        v26[0] = v9->_modifier;
        v26[1] = v9->_passthroughModifier;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
        v16 = [(SBRoutingSwitcherModifier *)v14 initWithModifiers:v15 delegate:v9];

        [(SBChainableModifier *)v9 addChildModifier:v16 atLevel:0 key:0];
        v17 = (void *)MEMORY[0x1E4F1CAD0];
        v18 = objc_msgSend(v7, "bs_compactMap:", &__block_literal_global_286);
        v19 = objc_msgSend(v18, "bs_flatten");
        uint64_t v20 = [v17 setWithArray:v19];
        displayItemsToFilter = v9->_displayItemsToFilter;
        v9->_displayItemsToFilter = (NSSet *)v20;

        goto LABEL_5;
      }
    }
    else
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, v9, @"SBFilteringSwitcherModifier.m", 36, @"Invalid parameter not satisfying: %@", @"appLayoutsToFilter" object file lineNumber description];

      if (v8) {
        goto LABEL_4;
      }
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, v9, @"SBFilteringSwitcherModifier.m", 37, @"Invalid parameter not satisfying: %@", @"modifier" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

uint64_t __59__SBFilteringSwitcherModifier_initWithAppLayouts_modifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allItems];
}

- (void)didMoveToParentModifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFilteringSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v6, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBChainableModifier *)self->_passthroughModifier delegate];

    if (v5)
    {
      [(SBChainableModifier *)self->_passthroughModifier setDelegate:0];
      [(SBChainableModifier *)self addChildModifier:self->_passthroughModifier atLevel:1 key:0];
      [(SBFilteringSwitcherModifier *)self newAppLayoutsGenCount];
    }
  }
}

- (void)setState:(int64_t)a3
{
  int64_t v5 = [(SBChainableModifier *)self state];
  if (a3 == 1 && v5 != 1) {
    [(SBFilteringSwitcherModifier *)self newAppLayoutsGenCount];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFilteringSwitcherModifier;
  [(SBChainableModifier *)&v6 setState:a3];
}

- (id)routingModifier:(id)a3 event:(id)a4 forModifier:(id)a5
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = (_SBFilteringPassthroughTargetSwitcherModifier *)a5;
  if ([v7 type] == 17)
  {
    if ((_SBFilteringPassthroughTargetSwitcherModifier *)self->_modifier != v8
      || (v9 = self->_appLayoutsToFilter,
          [v7 appLayout],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          LODWORD(v9) = [(NSArray *)v9 containsObject:v10],
          v10,
          !v9))
    {
      if (self->_passthroughModifier != v8
        || (appLayoutsToFilter = self->_appLayoutsToFilter,
            [v7 appLayout],
            v12 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(appLayoutsToFilter) = [(NSArray *)appLayoutsToFilter containsObject:v12],
            v12,
            (appLayoutsToFilter & 1) != 0))
      {
        id v13 = 0;
        goto LABEL_28;
      }
    }
    goto LABEL_17;
  }
  if ([v7 type] != 1)
  {
LABEL_17:
    id v13 = v7;
    goto LABEL_28;
  }
  id v13 = (id)[v7 copy];
  v14 = [v13 fromAppLayout];
  v15 = [v13 toAppLayout];
  if (v14)
  {
    routingModifier = self->_routingModifier;
    v32[0] = v14;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    v18 = [(SBFilteringSwitcherModifier *)self routingModifier:routingModifier filteredAppLayouts:v17 forModifier:v8];
    v19 = [v18 firstObject];
    [v13 setFromAppLayout:v19];
  }
  if (v15)
  {
    uint64_t v20 = self->_routingModifier;
    v31 = v15;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    v22 = [(SBFilteringSwitcherModifier *)self routingModifier:v20 filteredAppLayouts:v21 forModifier:v8];
    v23 = [v22 firstObject];
    [v13 setToAppLayout:v23];
  }
  if ([v13 fromEnvironmentMode] == 3)
  {
    v24 = [v13 fromAppLayout];

    if (!v24)
    {
      uint64_t v26 = 1;
      goto LABEL_19;
    }
  }
  if ([v13 fromEnvironmentMode] == 1)
  {
    objc_super v25 = [v13 fromAppLayout];

    if (v25)
    {
      uint64_t v26 = 3;
LABEL_19:
      [v13 setFromEnvironmentMode:v26];
    }
  }
  if ([v13 toEnvironmentMode] == 3
    && ([v13 toAppLayout], v27 = objc_claimAutoreleasedReturnValue(), v27, !v27))
  {
    uint64_t v29 = 1;
  }
  else
  {
    if ([v13 toEnvironmentMode] != 1) {
      goto LABEL_27;
    }
    v28 = [v13 toAppLayout];

    if (!v28) {
      goto LABEL_27;
    }
    uint64_t v29 = 3;
  }
  [v13 setToEnvironmentMode:v29];
LABEL_27:

LABEL_28:
  return v13;
}

- (id)routingModifier:(id)a3 filteredAppLayouts:(id)a4 forModifier:(id)a5
{
  if (self->_modifier == a5)
  {
    int64_t v5 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    objc_super v6 = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke;
  }
  else
  {
    int64_t v5 = &v9;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    objc_super v6 = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_3;
  }
  v5[2] = (uint64_t)v6;
  v5[3] = (uint64_t)&unk_1E6AF9F18;
  v5[4] = (uint64_t)self;
  id v7 = objc_msgSend(a4, "bs_compactMap:", v9, v10);
  return v7;
}

id __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2;
  v4[3] = &unk_1E6AF4B38;
  v4[4] = *(void *)(a1 + 32);
  v2 = [a2 appLayoutWithItemsPassingTest:v4];
  return v2;
}

uint64_t __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) containsObject:a2];
}

id __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_3(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_4;
  v4[3] = &unk_1E6AF4B38;
  v4[4] = *(void *)(a1 + 32);
  v2 = [a2 appLayoutWithItemsPassingTest:v4];
  return v2;
}

uint64_t __78__SBFilteringSwitcherModifier_routingModifier_filteredAppLayouts_forModifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) containsObject:a2] ^ 1;
}

- (id)routingModifier:(id)a3 modifierForAppLayout:(id)a4
{
  int v5 = [a4 containsAnyItemFromSet:self->_displayItemsToFilter];
  objc_super v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__passthroughModifier;
  if (v5) {
    objc_super v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__modifier;
  }
  id v7 = *(Class *)((char *)&self->super.super.super.isa + *v6);
  return v7;
}

- (id)routingModifier:(id)a3 filteredContinuousExposeIdentifiers:(id)a4 forModifier:(id)a5
{
  id v5 = a4;
  return v5;
}

- (CGRect)routingModifier:(id)a3 containerViewBoundsForModifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFilteringSwitcherModifier;
  [(SBFilteringSwitcherModifier *)&v8 containerViewBounds];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)routingModifier:(id)a3 switcherViewBoundsForModifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SBFilteringSwitcherModifier;
  [(SBFilteringSwitcherModifier *)&v8 switcherViewBounds];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)scrollModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)homeScreenModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)transactionCompletionOptionsModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (id)routingModifier:(id)a3 animationAttributesModifierForLayoutElement:(id)a4
{
  id v5 = a4;
  if ([v5 switcherLayoutElementType]
    || ![(NSArray *)self->_appLayoutsToFilter containsObject:v5])
  {
    double v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__passthroughModifier;
  }
  else
  {
    double v6 = &OBJC_IVAR___SBFilteringSwitcherModifier__modifier;
  }
  id v7 = *(id *)((char *)&self->super.super.super.isa + *v6);

  return v7;
}

- (id)fallbackModifierForRoutingModifier:(id)a3
{
  return self->_passthroughModifier;
}

- (NSArray)appLayoutsToFilter
{
  return self->_appLayoutsToFilter;
}

- (SBSwitcherModifier)modifier
{
  return self->_modifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifier, 0);
  objc_storeStrong((id *)&self->_appLayoutsToFilter, 0);
  objc_storeStrong((id *)&self->_displayItemsToFilter, 0);
  objc_storeStrong((id *)&self->_passthroughModifier, 0);
  objc_storeStrong((id *)&self->_routingModifier, 0);
}

@end