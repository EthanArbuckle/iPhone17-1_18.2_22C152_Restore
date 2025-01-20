@interface SBRouteToAppExposeSwitcherModifier
- (BOOL)reversesFloatingCardDirection;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4;
- (SBRouteToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeModifier:(id)a4;
- (double)contentPageViewScaleForAppLayout:(id)a3 withScale:(double)a4;
- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appExposeAccessoryButtonsBundleIdentifier;
- (id)handleTransitionEvent:(id)a3;
- (id)scrollViewAttributes;
- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle;
- (int64_t)plusButtonStyle;
- (void)setReversesFloatingCardDirection:(BOOL)a3;
@end

@implementation SBRouteToAppExposeSwitcherModifier

- (SBRouteToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 appExposeModifier:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
  v8 = [(SBTransitionSwitcherModifier *)&v11 initWithTransitionID:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appExposeModifier, a4);
    v9->_isTransitioningOutOfAppExpose = 0;
  }

  return v9;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 fromAppExposeBundleID];
  if (v5)
  {
    v6 = [v4 toAppExposeBundleID];
    self->_isTransitioningOutOfAppExpose = v6 == 0;
  }
  else
  {
    self->_isTransitioningOutOfAppExpose = 0;
  }

  v9.receiver = self;
  v9.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
  id v7 = [(SBTransitionSwitcherModifier *)&v9 handleTransitionEvent:v4];

  return v7;
}

- (void)setReversesFloatingCardDirection:(BOOL)a3
{
}

- (BOOL)reversesFloatingCardDirection
{
  return [(SBAppExposeGridSwitcherModifier *)self->_appExposeModifier reversesFloatingCardDirection];
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_isTransitioningOutOfAppExpose)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBRouteToAppExposeSwitcherModifier;
    id v6 = [(SBTransitionSwitcherModifier *)&v20 adjustedAppLayoutsForAppLayouts:v4];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__117;
  v18 = __Block_byref_object_dispose__117;
  id v19 = 0;
  appExposeModifier = self->_appExposeModifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__SBRouteToAppExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v11[3] = &unk_1E6AF6380;
  v13 = &v14;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __70__SBRouteToAppExposeSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 136) adjustedAppLayoutsForAppLayouts:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appExposeAccessoryButtonsBundleIdentifier
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__117;
  v10 = __Block_byref_object_dispose__117;
  id v11 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsBundleIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) appExposeAccessoryButtonsBundleIdentifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (int64_t)appExposeAccessoryButtonsOverrideUserInterfaceStyle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__SBRouteToAppExposeSwitcherModifier_appExposeAccessoryButtonsOverrideUserInterfaceStyle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) appExposeAccessoryButtonsOverrideUserInterfaceStyle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)plusButtonStyle
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__SBRouteToAppExposeSwitcherModifier_plusButtonStyle__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __53__SBRouteToAppExposeSwitcherModifier_plusButtonStyle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) plusButtonStyle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)snapshotScaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  uint64_t v16 = (double *)&v15;
  uint64_t v17 = 0x2020000000;
  appExposeModifier = self->_appExposeModifier;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__SBRouteToAppExposeSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v13 = &v15;
  int64_t v14 = a3;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v11];
  double v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __77__SBRouteToAppExposeSwitcherModifier_snapshotScaleForLayoutRole_inAppLayout___block_invoke(void *a1)
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
  appExposeModifier = self->_appExposeModifier;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__SBRouteToAppExposeSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v13 = &v15;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  double v14 = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v11];
  double v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __81__SBRouteToAppExposeSwitcherModifier_contentPageViewScaleForAppLayout_withScale___block_invoke(uint64_t a1)
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
  double v9 = __Block_byref_object_copy__117;
  v10 = __Block_byref_object_dispose__117;
  id v11 = 0;
  appExposeModifier = self->_appExposeModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBRouteToAppExposeSwitcherModifier_scrollViewAttributes__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__SBRouteToAppExposeSwitcherModifier_scrollViewAttributes__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 136) scrollViewAttributes];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v10 = 0;
  id v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  v13 = &unk_1D90ED3C6;
  long long v14 = *MEMORY[0x1E4F1DAD8];
  appExposeModifier = self->_appExposeModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__SBRouteToAppExposeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E6AF6420;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v9];
  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __70__SBRouteToAppExposeSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 136) contentOffsetForIndex:a1[6] alignment:a1[7]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (CGPoint)restingOffsetForScrollOffset:(CGPoint)a3 velocity:(CGPoint)a4
{
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x3010000000;
  uint64_t v15 = &unk_1D90ED3C6;
  long long v16 = *MEMORY[0x1E4F1DAD8];
  appExposeModifier = self->_appExposeModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBRouteToAppExposeSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke;
  v9[3] = &unk_1E6AFA9B0;
  v9[4] = self;
  v9[5] = &v12;
  CGPoint v10 = a3;
  CGPoint v11 = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:appExposeModifier usingBlock:v9];
  double v5 = v13[4];
  double v6 = v13[5];
  _Block_object_dispose(&v12, 8);
  double v7 = v5;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

uint64_t __76__SBRouteToAppExposeSwitcherModifier_restingOffsetForScrollOffset_velocity___block_invoke(uint64_t a1)
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