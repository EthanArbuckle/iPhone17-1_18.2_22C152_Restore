@interface SBHomeGestureToMixedGridSwitcherSwitcherModifier
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBHomeGestureToMixedGridSwitcherSwitcherModifier)initWithTransitionID:(id)a3 mixedGridModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOfVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 floatingAppLayout:(id)a9 floatingConfiguration:(int64_t)a10;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_appLayoutToScrollTo;
- (id)_dismissForEmptySwitcherResponseName;
- (id)_firstFloatingAppLayout:(id)a3;
- (id)_newMixedGridModifier;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)visibleAppLayouts;
- (unint64_t)hidEventSenderID;
- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3;
- (void)setHidEventSenderID:(unint64_t)a3;
@end

@implementation SBHomeGestureToMixedGridSwitcherSwitcherModifier

- (SBHomeGestureToMixedGridSwitcherSwitcherModifier)initWithTransitionID:(id)a3 mixedGridModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOfVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 floatingAppLayout:(id)a9 floatingConfiguration:(int64_t)a10
{
  double y = a8.y;
  double x = a8.x;
  double v14 = a7.y;
  double v15 = a7.x;
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
  v24 = [(SBTransitionSwitcherModifier *)&v33 initWithTransitionID:v20];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_mixedGridModifier, a4);
    objc_storeStrong((id *)&v25->_appLayout, a5);
    v25->_startingEnvironmentMode = a6;
    v25->_liftOffVelocity.double x = v15;
    v25->_liftOffVelocity.double y = v14;
    v25->_liftOffTranslation.double x = x;
    v25->_liftOffTranslation.double y = y;
    v25->_hidEventSenderID = 0;
    v26 = -[SBHomeGestureToSwitcherSwitcherModifier initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:]([SBHomeGestureToSwitcherSwitcherModifier alloc], "initWithTransitionID:multitaskingModifier:selectedAppLayout:startingEnvironmentMode:liftOffVelocity:liftOffTranslation:adjustAppLayoutsBeforeTransition:keepSelectedAppLayoutAsTopMostElement:", v20, v21, v22, a6, 1, 0, v15, v14, x, y);
    homeGestureModifier = v25->_homeGestureModifier;
    v25->_homeGestureModifier = v26;

    [(SBChainableModifier *)v25 addChildModifier:v25->_homeGestureModifier];
    v28 = [SBRouteToMixedGridSwitcherModifier alloc];
    id v29 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)v25 _newMixedGridModifier];
    v30 = [(SBRouteToMixedGridSwitcherModifier *)v28 initWithTransitionID:v20 mixedGridModifier:v29];

    [(SBChainableModifier *)v25 addChildModifier:v30];
    if (v23)
    {
      v31 = [[SBRelocateFloatingAppLayoutSwitcherModifier alloc] initWithTransitionID:v20 floatingAppLayout:v23 floatingConfiguration:a10 direction:1 mixedGridModifier:v21];
      [(SBChainableModifier *)v25 addChildModifier:v31];
    }
  }

  return v25;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
  -[SBHomeGestureToSwitcherSwitcherModifier setHidEventSenderID:](self->_homeGestureModifier, "setHidEventSenderID:");
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
  v6 = [(SBChainableModifier *)&v11 responseForProposedChildResponse:a3 childModifier:a4 event:a5];
  if (v6)
  {
    v7 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __105__SBHomeGestureToMixedGridSwitcherSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
    v10[3] = &unk_1E6B00028;
    v10[4] = self;
    v8 = [v6 responseByTransformingResponseWithTransformer:v10];
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id __105__SBHomeGestureToMixedGridSwitcherSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 11)
  {
    v4 = [*(id *)(a1 + 32) _appLayoutToScrollTo];
    if (v4)
    {
      v5 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v4 alignment:0 animated:0];
      uint64_t v6 = SBAppendSwitcherModifierResponse(v5, v3);

      id v3 = v5;
    }
    else
    {
      uint64_t v6 = 0;
    }

    id v3 = (id)v6;
  }
  return v3;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v10 = 0;
  objc_super v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = &unk_1D90ED3C6;
  long long v14 = *MEMORY[0x1E4F1DAD8];
  mixedGridModifier = self->_mixedGridModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__SBHomeGestureToMixedGridSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
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
  result.double y = v8;
  result.double x = v7;
  return result;
}

uint64_t __84__SBHomeGestureToMixedGridSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [v2 appLayouts];
  [v2 indexOfFirstFloatingAppFromAppLayouts:v3];

  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "contentOffsetForIndex:alignment:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v5 + 32) = v6;
  *(void *)(v5 + 40) = v7;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v30 = 0;
  v31 = (double *)&v30;
  uint64_t v32 = 0x4010000000;
  objc_super v33 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v34 = *MEMORY[0x1E4F1DB28];
  long long v35 = v5;
  uint64_t v6 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self appLayouts];
  unint64_t v7 = [(SBSwitcherModifier *)self indexOfFirstMainAppLayoutFromAppLayouts:v6];

  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1 && v7 > a3)
  {
    uint64_t v26 = 0;
    v27 = (double *)&v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_frameForIndex___block_invoke;
    v25[3] = &unk_1E6AFFE90;
    v25[4] = self;
    v25[5] = &v30;
    v25[6] = &v26;
    v25[7] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v25];
    uint64_t v9 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    double v10 = v27[3];
    if (v9 == 1) {
      double v10 = -v10;
    }
    v31[4] = v31[4] + v10;
    _Block_object_dispose(&v26, 8);
    double v11 = v31[4];
    double v12 = v31[5];
    double v13 = v31[6];
    double v14 = v31[7];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)&v24 frameForIndex:a3];
    double v11 = v15;
    double v12 = v16;
    double v13 = v17;
    double v14 = v18;
    v19 = v31;
    v31[4] = v15;
    v19[5] = v16;
    v19[6] = v17;
    v19[7] = v18;
  }
  _Block_object_dispose(&v30, 8);
  double v20 = v11;
  double v21 = v12;
  double v22 = v13;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

uint64_t __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 144) frameForIndex:a1[7]];
  v2 = *(void **)(a1[5] + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  uint64_t result = [*(id *)(a1[4] + 144) firstFloatingCardPeekingWidth];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v8;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if ([v6 environment] == 2)
  {
    uint64_t v13 = 0;
    double v14 = (double *)&v13;
    uint64_t v15 = 0x2020000000;
    mixedGridModifier = self->_mixedGridModifier;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_scaleForIndex___block_invoke;
    v12[3] = &unk_1E6AF6358;
    v12[4] = self;
    v12[5] = &v13;
    v12[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v12];
    double v8 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)&v11 scaleForIndex:a3];
    double v8 = v9;
  }

  return v8;
}

uint64_t __66__SBHomeGestureToMixedGridSwitcherSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    uint64_t v8 = 0;
    double v9 = &v8;
    uint64_t v10 = 0x3032000000;
    objc_super v11 = __Block_byref_object_copy__44;
    double v12 = __Block_byref_object_dispose__44;
    id v13 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __69__SBHomeGestureToMixedGridSwitcherSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E6AF4B88;
    v7[4] = self;
    v7[5] = &v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v7];
    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToMixedGridSwitcherSwitcherModifier;
    id v4 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)&v6 visibleAppLayouts];
  }
  return v4;
}

void __69__SBHomeGestureToMixedGridSwitcherSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"DismissForEmptySwitcher-%p", self);
}

- (id)_appLayoutToScrollTo
{
  uint64_t v3 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self appLayouts];
  id v4 = [(SBTransitionSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v3];

  uint64_t v5 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self _firstFloatingAppLayout:v4];
  objc_super v6 = v5;
  if (v5)
  {
    unint64_t v7 = v5;
  }
  else
  {
    unint64_t v7 = [v4 firstObject];
  }
  uint64_t v8 = v7;
  if (self->_appLayout)
  {
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    mixedGridModifier = self->_mixedGridModifier;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke;
    v14[3] = &unk_1E6AFA6F8;
    v14[4] = self;
    id v15 = v4;
    uint64_t v16 = &v17;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v14];
    appLayout = v8;
    if (!*((unsigned char *)v18 + 24)) {
      appLayout = self->_appLayout;
    }
    objc_super v11 = appLayout;

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    objc_super v11 = v7;
  }
  double v12 = v11;

  return v12;
}

void __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke_2;
  v5[3] = &unk_1E6AFA6F8;
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 48);
  [v2 _performBlockWhileSimulatingPostPresentationScrollViewContentOffset:v5];
}

uint64_t __72__SBHomeGestureToMixedGridSwitcherSwitcherModifier__appLayoutToScrollTo__block_invoke_2(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 144), "isIndexFullyVisible:", objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", *(void *)(*(void *)(a1 + 40) + 136)));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_firstFloatingAppLayout:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      double v9 = v6;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        if (objc_msgSend(v10, "environment", (void)v12) == 1)
        {
          id v6 = v9;
          goto LABEL_12;
        }
        id v6 = v10;

        ++v8;
        double v9 = v6;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v6 = 0;
  }
LABEL_12:

  return v6;
}

- (void)_performBlockWhileSimulatingPostPresentationScrollViewContentOffset:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self appLayouts];
  id v6 = [(SBTransitionSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v5];

  uint64_t v7 = [(SBHomeGestureToMixedGridSwitcherSwitcherModifier *)self _firstFloatingAppLayout:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [v6 firstObject];
  }
  uint64_t v10 = v9;
  -[SBHomeGestureToMixedGridSwitcherSwitcherModifier contentOffsetForIndex:alignment:](self, "contentOffsetForIndex:alignment:", [v6 indexOfObject:v9], 3);
  long long v13 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v11, v12);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__SBHomeGestureToMixedGridSwitcherSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke;
  v15[3] = &unk_1E6AF5300;
  id v16 = v4;
  id v14 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v13 usingBlock:v15];
}

uint64_t __120__SBHomeGestureToMixedGridSwitcherSwitcherModifier__performBlockWhileSimulatingPostPresentationScrollViewContentOffset___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_newMixedGridModifier
{
  return (id)[(SBMixedGridSwitcherProviding *)self->_mixedGridModifier copy];
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureModifier, 0);
  objc_storeStrong((id *)&self->_mixedGridModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end