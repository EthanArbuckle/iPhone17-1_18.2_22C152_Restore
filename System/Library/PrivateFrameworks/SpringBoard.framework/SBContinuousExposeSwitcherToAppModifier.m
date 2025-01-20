@interface SBContinuousExposeSwitcherToAppModifier
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBContinuousExposeSwitcherToAppModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5;
- (SBSwitcherModifier)multitaskingModifier;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)direction;
@end

@implementation SBContinuousExposeSwitcherToAppModifier

- (SBContinuousExposeSwitcherToAppModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    v10->_direction = a4;
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
  }

  return v11;
}

- (id)transitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillBegin];
  if (self->_direction == 1)
  {
    v4 = [SBScrollToAppLayoutSwitcherEventResponse alloc];
    v5 = [(SBContinuousExposeSwitcherToAppModifier *)self appLayouts];
    v6 = [v5 firstObject];
    v7 = [(SBScrollToAppLayoutSwitcherEventResponse *)v4 initWithAppLayout:v6 alignment:0 animated:0];

    v8 = SBAppendSwitcherModifierResponse(v7, v3);

    id v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
    v3 = SBAppendSwitcherModifierResponse(v9, v8);
  }
  return v3;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  v5 = [(SBContinuousExposeSwitcherToAppModifier *)&v15 appLayoutsForContinuousExposeIdentifier:v4];
  v6 = [(SBContinuousExposeSwitcherToAppModifier *)self appLayoutOnStage];
  v7 = v6;
  if (self->_direction) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (v8
    || ([v6 continuousExposeIdentifier],
        id v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = BSEqualStrings(),
        v9,
        !v10))
  {
    id v11 = v5;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __83__SBContinuousExposeSwitcherToAppModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v13[3] = &unk_1E6AF4B60;
    id v14 = v7;
    objc_msgSend(v5, "bs_filter:", v13);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

uint64_t __83__SBContinuousExposeSwitcherToAppModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isOrContainsAppLayout:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [v3 isOrContainsAppLayout:*(void *)(a1 + 32)] ^ 1;
  }

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v38 = 0;
  v39 = (double *)&v38;
  uint64_t v40 = 0x4010000000;
  v41 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v42 = *MEMORY[0x1E4F1DB28];
  long long v43 = v5;
  v6 = [(SBContinuousExposeSwitcherToAppModifier *)self appLayouts];
  v7 = [v6 objectAtIndex:a3];

  v37.receiver = self;
  v37.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  BOOL v8 = [(SBContinuousExposeSwitcherToAppModifier *)&v37 continuousExposeIdentifiersInStrip];
  id v9 = [v7 continuousExposeIdentifier];
  int v10 = [v8 containsObject:v9];

  id v11 = [(SBContinuousExposeSwitcherToAppModifier *)self appLayoutOnStage];
  int v12 = [v7 isOrContainsAppLayout:v11];

  int64_t direction = self->_direction;
  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1 && direction == 1) {
    int v15 = v12;
  }
  else {
    int v15 = 1;
  }
  if ((v15 | v10))
  {
    v31.receiver = self;
    v31.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
    [(SBContinuousExposeSwitcherToAppModifier *)&v31 frameForIndex:a3];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    v24 = v39;
    v39[4] = v16;
    v24[5] = v18;
    v24[6] = v20;
    v24[7] = v22;
  }
  else
  {
    v25 = [(SBContinuousExposeSwitcherToAppModifier *)self multitaskingModifier];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __57__SBContinuousExposeSwitcherToAppModifier_frameForIndex___block_invoke;
    v32[3] = &unk_1E6AF63D0;
    v35 = &v38;
    id v26 = v25;
    unint64_t v36 = a3;
    id v33 = v26;
    v34 = self;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v26 usingBlock:v32];

    double v17 = v39[4];
    double v19 = v39[5];
    double v21 = v39[6];
    double v23 = v39[7];
  }

  _Block_object_dispose(&v38, 8);
  double v27 = v17;
  double v28 = v19;
  double v29 = v21;
  double v30 = v23;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

void __57__SBContinuousExposeSwitcherToAppModifier_frameForIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frameForIndex:*(void *)(a1 + 56)];
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  int v7 = [*(id *)(a1 + 40) isRTLEnabled];
  [*(id *)(a1 + 32) distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:*(void *)(a1 + 56)];
  if (v7) {
    double v9 = v8;
  }
  else {
    double v9 = -v8;
  }
  *(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = CGRectOffset(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8)+ 32), v9, 0.0);
}

- (id)visibleAppLayouts
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__72;
  int v15 = __Block_byref_object_dispose__72;
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  id v16 = [(SBContinuousExposeSwitcherToAppModifier *)&v10 visibleAppLayouts];
  uint64_t v3 = [(SBContinuousExposeSwitcherToAppModifier *)self multitaskingModifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__SBContinuousExposeSwitcherToAppModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  double v9 = &v11;
  id v4 = v3;
  id v8 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v4 usingBlock:v7];
  id v5 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v5;
}

void __60__SBContinuousExposeSwitcherToAppModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v21 = 0;
  double v22 = (double *)&v21;
  uint64_t v23 = 0x3010000000;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  v24 = &unk_1D90ED3C6;
  v20.receiver = self;
  v20.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  -[SBContinuousExposeSwitcherToAppModifier contentOffsetForIndex:alignment:](&v20, sel_contentOffsetForIndex_alignment_);
  uint64_t v25 = v7;
  uint64_t v26 = v8;
  double v9 = [(SBContinuousExposeSwitcherToAppModifier *)self multitaskingModifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__SBContinuousExposeSwitcherToAppModifier_contentOffsetForIndex_alignment___block_invoke;
  v15[3] = &unk_1E6B04FD8;
  unint64_t v18 = a3;
  int64_t v19 = a4;
  v15[4] = self;
  double v17 = &v21;
  id v10 = v9;
  id v16 = v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v10 usingBlock:v15];
  double v11 = v22[4];
  double v12 = v22[5];

  _Block_object_dispose(&v21, 8);
  double v13 = v11;
  double v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

uint64_t __75__SBContinuousExposeSwitcherToAppModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 appLayouts];
  [v2 indexOfFirstFloatingAppFromAppLayouts:v3];

  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "contentOffsetForIndex:alignment:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeSwitcherToAppModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  [v5 setLayoutUpdateMode:3];
  uint64_t v6 = [(SBContinuousExposeSwitcherToAppModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v2 = [(SBContinuousExposeSwitcherToAppModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  id v4 = [v3 layoutSettings];

  return v4;
}

- (int64_t)direction
{
  return self->_direction;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
}

@end