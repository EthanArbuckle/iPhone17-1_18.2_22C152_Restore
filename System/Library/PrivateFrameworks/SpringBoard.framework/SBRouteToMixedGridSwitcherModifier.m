@interface SBRouteToMixedGridSwitcherModifier
- (BOOL)reversesFloatingCardDirection;
- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4;
- (SBRouteToMixedGridSwitcherModifier)initWithTransitionID:(id)a3 mixedGridModifier:(id)a4;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appLayoutsToCacheSnapshots;
- (id)handleTransitionEvent:(id)a3;
- (id)scrollViewAttributes;
- (void)setReversesFloatingCardDirection:(BOOL)a3;
@end

@implementation SBRouteToMixedGridSwitcherModifier

- (SBRouteToMixedGridSwitcherModifier)initWithTransitionID:(id)a3 mixedGridModifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBRouteToMixedGridSwitcherModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v11 initWithTransitionID:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mixedGridModifier, a4);
    v9->_isTransitioningOutOfAppSwitcher = 0;
  }

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fromEnvironmentMode];
  uint64_t v6 = [v4 toEnvironmentMode];
  BOOL v8 = v5 == 2 && v6 != 2;
  self->_isTransitioningOutOfAppSwitcher = v8;
  v11.receiver = self;
  v11.super_class = (Class)SBRouteToMixedGridSwitcherModifier;
  v9 = [(SBTransitionSwitcherModifier *)&v11 handleTransitionEvent:v4];

  return v9;
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
}

- (BOOL)reversesFloatingCardDirection
{
  return [(SBMixedGridSwitcherProviding *)self->_mixedGridModifier reversesFloatingCardDirection];
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_isTransitioningOutOfAppSwitcher)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBRouteToMixedGridSwitcherModifier;
    id v6 = [(SBTransitionSwitcherModifier *)&v20 adjustedAppLayoutsForAppLayouts:v4];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__93;
  v18 = __Block_byref_object_dispose__93;
  id v19 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBRouteToMixedGridSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v11[3] = &unk_1E6AF6380;
  v13 = &v14;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __70__SBRouteToMixedGridSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 136) adjustedAppLayoutsForAppLayouts:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__93;
  v10 = __Block_byref_object_dispose__93;
  id v11 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SBRouteToMixedGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __64__SBRouteToMixedGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  mixedGridModifier = self->_mixedGridModifier;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SBRouteToMixedGridSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v13 = &v15;
  int64_t v14 = a3;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v11];
  double v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __77__SBRouteToMixedGridSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 136) snapshotScaleForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  return result;
}

- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4
{
  id v6 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SBRouteToMixedGridSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  double v14 = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v11];
  double v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __81__SBRouteToMixedGridSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) contentPageViewScaleForAppLayout:*(void *)(a1 + 40) withScale:*(double *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)scrollViewAttributes
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__93;
  v10 = __Block_byref_object_dispose__93;
  id v11 = 0;
  mixedGridModifier = self->_mixedGridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBRouteToMixedGridSwitcherModifier_scrollViewAttributes__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__SBRouteToMixedGridSwitcherModifier_scrollViewAttributes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) scrollViewAttributes];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x3010000000;
  uint64_t v15 = &unk_1D90ED3C6;
  long long v16 = *MEMORY[0x1E4F1DAD8];
  mixedGridModifier = self->_mixedGridModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBRouteToMixedGridSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke;
  v9[3] = &unk_1E6AFA9B0;
  v9[4] = self;
  v9[5] = &v12;
  CGPoint v10 = a3;
  CGPoint v11 = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:mixedGridModifier usingBlock:v9];
  double v5 = v13[4];
  double v6 = v13[5];
  _Block_object_dispose(&v12, 8);
  double v7 = v5;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __76__SBRouteToMixedGridSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 136), "restingOffsetForScrollOffset:velocity:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (void).cxx_destruct
{
}

@end