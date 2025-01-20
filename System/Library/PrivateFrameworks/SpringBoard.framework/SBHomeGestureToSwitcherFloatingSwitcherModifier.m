@interface SBHomeGestureToSwitcherFloatingSwitcherModifier
- (SBAppLayout)selectedAppLayout;
- (SBFluidSwitcherAnimationSettings)animationSettings;
- (SBHomeGestureToSwitcherFloatingSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherModifier)multitaskingModifier;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (void)setAnimationSettings:(id)a3;
- (void)setMultitaskingModifier:(id)a3;
- (void)setSelectedAppLayout:(id)a3;
@end

@implementation SBHomeGestureToSwitcherFloatingSwitcherModifier

- (SBHomeGestureToSwitcherFloatingSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v17 initWithTransitionID:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_multitaskingModifier, a4);
    objc_storeStrong((id *)&v12->_selectedAppLayout, a5);
    v13 = +[SBAppSwitcherDomain rootSettings];
    uint64_t v14 = [v13 animationSettings];
    animationSettings = v12->_animationSettings;
    v12->_animationSettings = (SBFluidSwitcherAnimationSettings *)v14;
  }
  return v12;
}

- (id)transitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  v5 = [SBScrollToAppLayoutSwitcherEventResponse alloc];
  v6 = [(SBHomeGestureToSwitcherFloatingSwitcherModifier *)self selectedAppLayout];
  v7 = [(SBScrollToAppLayoutSwitcherEventResponse *)v5 initWithAppLayout:v6 alignment:0 animated:0];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v7];

  v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v8];

  id v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v9;
}

- (id)visibleAppLayouts
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x3032000000;
    objc_super v11 = __Block_byref_object_copy__123;
    v12 = __Block_byref_object_dispose__123;
    id v13 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__SBHomeGestureToSwitcherFloatingSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E6AF4B88;
    v7[4] = self;
    v7[5] = &v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v7];
    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
    id v4 = [(SBHomeGestureToSwitcherFloatingSwitcherModifier *)&v6 visibleAppLayouts];
  }
  return v4;
}

void __68__SBHomeGestureToSwitcherFloatingSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToSwitcherFloatingSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBHomeGestureToSwitcherFloatingSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  BOOL v3 = SBReduceMotion();
  animationSettings = self->_animationSettings;
  if (v3) {
    [(SBFluidSwitcherAnimationSettings *)animationSettings reduceMotionAppToSwitcherSettings];
  }
  else {
  v5 = [(SBFluidSwitcherAnimationSettings *)animationSettings gestureInitiatedAppToSwitcherSettings];
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 1);
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void)setMultitaskingModifier:(id)a3
{
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)setSelectedAppLayout:(id)a3
{
}

- (SBFluidSwitcherAnimationSettings)animationSettings
{
  return self->_animationSettings;
}

- (void)setAnimationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
}

@end