@interface SBSwitcherToActiveFloatingSwitcherModifier
- (BOOL)wantsSwitcherBackdropBlur;
- (BOOL)wantsSwitcherDimmingView;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherToActiveFloatingSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingDeckModifier:(id)a6;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsToCacheSnapshots;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)switcherBackdropBlurType;
@end

@implementation SBSwitcherToActiveFloatingSwitcherModifier

- (SBSwitcherToActiveFloatingSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 floatingDeckModifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v14->_floatingDeckModifier, a6);
  }

  return v14;
}

- (id)transitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (self->_direction == 1)
  {
    v5 = self->_fullScreenAppLayout;
    if (v5)
    {
      v6 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v5 alignment:0 animated:0];
      [(SBChainableModifierEventResponse *)v4 addChildResponse:v6];
    }
  }
  else
  {
    v5 = 0;
  }
  if (self->_direction == 1 && [(SBAppLayout *)self->_fullScreenAppLayout type] == 2) {
    uint64_t v7 = 30;
  }
  else {
    uint64_t v7 = 2;
  }
  v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:v7 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v8];

  v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v9;
}

- (id)visibleAppLayouts
{
  uint64_t v10 = 0;
  objc_super v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__52;
  v14 = __Block_byref_object_dispose__52;
  id v15 = 0;
  floatingDeckModifier = self->_floatingDeckModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__SBSwitcherToActiveFloatingSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  v9[5] = &v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:floatingDeckModifier usingBlock:v9];
  v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  v5 = [(SBSwitcherToActiveFloatingSwitcherModifier *)&v8 visibleAppLayouts];
  v6 = [v4 setByAddingObjectsFromSet:v5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __63__SBSwitcherToActiveFloatingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(SBSwitcherToActiveFloatingSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v2 = [(SBSwitcherToActiveFloatingSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  v4 = [v3 launchAppFromSwitcherSettings];

  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (BOOL)wantsSwitcherBackdropBlur
{
  return 1;
}

- (int64_t)switcherBackdropBlurType
{
  return 3;
}

- (BOOL)wantsSwitcherDimmingView
{
  return 1;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__52;
  uint64_t v10 = __Block_byref_object_dispose__52;
  id v11 = 0;
  floatingDeckModifier = self->_floatingDeckModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SBSwitcherToActiveFloatingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:floatingDeckModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __72__SBSwitcherToActiveFloatingSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherToActiveFloatingSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)([(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:a3] | 0x100);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDeckModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end