@interface SBMixedGridToHomeSwitcherModifier
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBMixedGridToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 mixedGridModifier:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (id)_newMixedGridModifier;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
@end

@implementation SBMixedGridToHomeSwitcherModifier

- (SBMixedGridToHomeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 mixedGridModifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v20 initWithTransitionID:v9];
  if (v11)
  {
    if (!v10)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v11, @"SBMixedGridToHomeSwitcherModifier.m", 36, @"Invalid parameter not satisfying: %@", @"mixedGridModifier" object file lineNumber description];
    }
    v11->_direction = a4;
    objc_storeStrong((id *)&v11->_mixedGridModifier, a5);
    v12 = [SBRouteToMixedGridSwitcherModifier alloc];
    id v13 = [(SBMixedGridToHomeSwitcherModifier *)v11 _newMixedGridModifier];
    v14 = [(SBRouteToMixedGridSwitcherModifier *)v12 initWithTransitionID:v9 mixedGridModifier:v13];

    [(SBChainableModifier *)v11 addChildModifier:v14 atLevel:0 key:0];
    v15 = [SBHomeToGridSwitcherModifier alloc];
    id v16 = [(SBMixedGridToHomeSwitcherModifier *)v11 _newMixedGridModifier];
    v17 = [(SBHomeToSwitcherSwitcherModifier *)v15 initWithTransitionID:v9 direction:a4 != 0 multitaskingModifier:v16];

    [(SBChainableModifier *)v11 addChildModifier:v17 atLevel:1 key:0];
  }

  return v11;
}

- (id)transitionWillBegin
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v23 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v4];

  if (self->_direction == 1)
  {
    v6 = [(SBMixedGridToHomeSwitcherModifier *)self appLayouts];
    v7 = [(SBTransitionSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v6];

    id v8 = [v7 firstObject];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        uint64_t v13 = 0;
        v14 = v8;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v15 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
          if (objc_msgSend(v15, "environment", (void)v19) == 1)
          {
            id v8 = v14;
            goto LABEL_12;
          }
          id v8 = v15;

          ++v13;
          v14 = v8;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (v8)
    {
      id v16 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v8 alignment:0 animated:0];
      uint64_t v17 = +[SBChainableModifierEventResponse responseByAppendingResponse:v16 toResponse:v5];

      v5 = (void *)v17;
    }
  }
  return v5;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  uint64_t v13 = &unk_1D90ED3C6;
  long long v14 = *MEMORY[0x1E4F1DAD8];
  mixedGridModifier = self->_mixedGridModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBMixedGridToHomeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E6AF8508;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = &v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v9];
  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __69__SBMixedGridToHomeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 appLayouts];
  [v2 indexOfFirstFloatingAppFromAppLayouts:v3];

  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "contentOffsetForIndex:alignment:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x4010000000;
  v39 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v40 = *MEMORY[0x1E4F1DB28];
  long long v41 = v5;
  uint64_t v6 = [(SBMixedGridToHomeSwitcherModifier *)self appLayouts];
  unint64_t v7 = [(SBSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v6];

  if (v7 <= a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
    [(SBMixedGridToHomeSwitcherModifier *)&v28 frameForIndex:a3];
    uint64_t v11 = v37;
    v37[4] = v12;
    v11[5] = v13;
    v11[6] = v14;
    v11[7] = v15;
  }
  else
  {
    if (self->_direction)
    {
      uint64_t v32 = 0;
      v33 = (double *)&v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0;
      mixedGridModifier = self->_mixedGridModifier;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_3;
      v29[3] = &unk_1E6AFFE90;
      v29[4] = self;
      v29[5] = &v36;
      v29[6] = &v32;
      v29[7] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v29];
      int v9 = [(SBMixedGridToHomeSwitcherModifier *)self isRTLEnabled];
      double v10 = v33[3];
      if (v9) {
        double v10 = -v10;
      }
      *((double *)v37 + 4) = *((double *)v37 + 4) + v10;
    }
    else
    {
      if ([(SBTransitionSwitcherModifier *)self transitionPhase] != 2)
      {
        v27 = self->_mixedGridModifier;
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_2;
        v30[3] = &unk_1E6AF6358;
        v30[4] = self;
        v30[5] = &v36;
        v30[6] = a3;
        [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v27 usingBlock:v30];
        goto LABEL_13;
      }
      uint64_t v32 = 0;
      v33 = (double *)&v32;
      uint64_t v34 = 0x2020000000;
      uint64_t v35 = 0;
      id v16 = self->_mixedGridModifier;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke;
      v31[3] = &unk_1E6AFFE90;
      v31[4] = self;
      v31[5] = &v36;
      v31[6] = &v32;
      v31[7] = a3;
      [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v16 usingBlock:v31];
      uint64_t v17 = (CGRect *)v37;
      if ([(SBMixedGridToHomeSwitcherModifier *)self isRTLEnabled]) {
        double v18 = -v33[3];
      }
      else {
        double v18 = v33[3];
      }
      CGRect v42 = CGRectOffset(v17[1], v18, 0.0);
      *((CGRect *)v37 + 1) = v42;
    }
    _Block_object_dispose(&v32, 8);
  }
LABEL_13:
  double v19 = *((double *)v37 + 4);
  double v20 = *((double *)v37 + 5);
  double v21 = *((double *)v37 + 6);
  double v22 = *((double *)v37 + 7);
  _Block_object_dispose(&v36, 8);
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

CGFloat __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 144) frameForIndex:a1[7]];
  v2 = *(void **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  [*(id *)(a1[4] + 144) distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:a1[7]];
  uint64_t v7 = a1[7];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v8;
  [*(id *)(a1[4] + 144) scaledFrameForIndex:v7];
  CGFloat Width = CGRectGetWidth(v12);
  uint64_t v10 = *(void *)(a1[6] + 8);
  CGFloat result = Width + *(double *)(v10 + 24);
  *(CGFloat *)(v10 + 24) = result;
  return result;
}

uint64_t __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) frameForIndex:a1[6]];
  uint64_t v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __51__SBMixedGridToHomeSwitcherModifier_frameForIndex___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 144) frameForIndex:*(void *)(a1 + 56)];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  uint64_t result = [*(id *)(a1 + 32) transitionPhase];
  if (result == 1)
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 144) firstFloatingCardPeekingWidth];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  }
  return result;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CGRect v12 = &v11;
  uint64_t v13 = 0x2810000000;
  uint64_t v14 = &unk_1D90ED3C6;
  __int16 v15 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SBMixedGridToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke;
  v8[3] = &unk_1E6AF6380;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v6 = v4;
  id v9 = v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v8];
  LOWORD(self) = *((_WORD *)v12 + 16);

  _Block_object_dispose(&v11, 8);
  return (SBSwitcherAsyncRenderingAttributes)self;
}

uint64_t __74__SBMixedGridToHomeSwitcherModifier_asyncRenderingAttributesForAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) asyncRenderingAttributesForAppLayout:a1[5]];
  *(_WORD *)(*(void *)(a1[6] + 8) + 32) = result;
  return result;
}

- (id)topMostLayoutElements
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  CGRect v12 = __Block_byref_object_copy__42;
  uint64_t v13 = __Block_byref_object_dispose__42;
  id v14 = 0;
  if (self->_direction == 1)
  {
    mixedGridModifier = self->_mixedGridModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__SBMixedGridToHomeSwitcherModifier_topMostLayoutElements__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    void v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMixedGridToHomeSwitcherModifier;
    uint64_t v3 = [(SBMixedGridToHomeSwitcherModifier *)&v7 topMostLayoutElements];
    id v4 = (void *)v10[5];
    v10[5] = v3;
  }
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __58__SBMixedGridToHomeSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) topMostLayoutElements];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_newMixedGridModifier
{
  return (id)[(SBMixedGridSwitcherProviding *)self->_mixedGridModifier copy];
}

- (void).cxx_destruct
{
}

@end