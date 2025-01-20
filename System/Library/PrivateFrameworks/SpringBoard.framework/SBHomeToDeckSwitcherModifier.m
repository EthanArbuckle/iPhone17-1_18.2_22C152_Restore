@interface SBHomeToDeckSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGRect)frameForIndex:(unint64_t)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)_opacitySettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToScrollToDuringTransition;
- (id)appLayoutsToCacheSnapshots;
- (id)visibleAppLayouts;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBHomeToDeckSwitcherModifier

- (id)appLayoutToScrollToDuringTransition
{
  if ([(SBHomeToSwitcherSwitcherModifier *)self direction] == 1)
  {
    v3 = [(SBHomeToDeckSwitcherModifier *)self appLayouts];
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v20 = 0;
  v21 = (double *)&v20;
  uint64_t v22 = 0x4010000000;
  v23 = &unk_1D90ED3C6;
  long long v24 = 0u;
  long long v25 = 0u;
  v5 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __46__SBHomeToDeckSwitcherModifier_frameForIndex___block_invoke;
  v15[3] = &unk_1E6AF63D0;
  v18 = &v20;
  id v6 = v5;
  unint64_t v19 = a3;
  id v16 = v6;
  v17 = self;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v6 usingBlock:v15];
  double v7 = v21[4];
  double v8 = v21[5];
  double v9 = v21[6];
  double v10 = v21[7];

  _Block_object_dispose(&v20, 8);
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

void __46__SBHomeToDeckSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frameForIndex:*(void *)(a1 + 56)];
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if ([*(id *)(a1 + 40) isEffectivelyHome])
  {
    double v7 = *(CGRect **)(*(void *)(a1 + 48) + 8);
    int v8 = [*(id *)(a1 + 40) isRTLEnabled];
    [*(id *)(a1 + 32) distanceToLeadingEdgeOfLeadingCardFromTrailingEdgeOfScreenWithVisibleIndexToStartSearch:*(void *)(a1 + 56)];
    if (v8) {
      double v10 = v9;
    }
    else {
      double v10 = -v9;
    }
    *(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = CGRectOffset(v7[1], v10, 0.0);
  }
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v5 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__SBHomeToDeckSwitcherModifier_scaleForIndex___block_invoke;
  v9[3] = &unk_1E6AF6358;
  double v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  unint64_t v12 = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v6 usingBlock:v9];
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__SBHomeToDeckSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) scaleForIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  double v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBHomeToDeckSwitcherModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  double v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v4 usingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __49__SBHomeToDeckSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeToDeckSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = [(SBHomeToDeckSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  double v7 = [(SBHomeToDeckSwitcherModifier *)self _opacitySettings];
  [v5 setOpacitySettings:v7];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v3 = [(SBHomeToDeckSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  if ([(SBHomeToSwitcherSwitcherModifier *)self direction]) {
    [v4 toggleAppSwitcherSettings];
  }
  else {
  id v5 = [v4 switcherToHomeSettings];
  }

  return v5;
}

- (id)_opacitySettings
{
  uint64_t v2 = [(SBHomeToDeckSwitcherModifier *)self switcherSettings];
  uint64_t v3 = [v2 animationSettings];
  id v4 = [v3 switcherToHomeOpacitySettings];

  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  objc_super v9 = [(SBHomeToDeckSwitcherModifier *)self visibleAppLayouts];
  double v10 = 0.0;
  if ([v9 containsObject:v8])
  {
    uint64_t v19 = 0;
    uint64_t v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    double v11 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__SBHomeToDeckSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
    v14[3] = &unk_1E6AF8508;
    id v12 = v11;
    id v15 = v12;
    uint64_t v16 = &v19;
    unint64_t v17 = a5;
    int64_t v18 = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v12 usingBlock:v14];
    double v10 = v20[3];

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

void __73__SBHomeToDeckSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayouts];
  id v4 = [v2 objectAtIndex:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) opacityForLayoutRole:*(void *)(a1 + 56) inAppLayout:v4 atIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  int64_t v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  double v7 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __70__SBHomeToDeckSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke;
  v12[3] = &unk_1E6AF63D0;
  id v15 = &v17;
  id v8 = v7;
  id v13 = v8;
  int64_t v16 = a3;
  id v9 = v6;
  id v14 = v9;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v8 usingBlock:v12];
  double v10 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t __70__SBHomeToDeckSwitcherModifier_dimmingAlphaForLayoutRole_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dimmingAlphaForLayoutRole:*(void *)(a1 + 56) inAppLayout:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x4010000000;
  v23 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F43C68] + 16);
  long long v24 = *MEMORY[0x1E4F43C68];
  long long v25 = v5;
  id v6 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__SBHomeToDeckSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v16[3] = &unk_1E6AF6358;
  int64_t v18 = &v20;
  id v7 = v6;
  id v17 = v7;
  unint64_t v19 = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v7 usingBlock:v16];
  double v8 = v21[4];
  double v9 = v21[5];
  double v10 = v21[6];
  double v11 = v21[7];

  _Block_object_dispose(&v20, 8);
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.topRight = v15;
  result.bottomRight = v14;
  result.bottomLeft = v13;
  result.topLeft = v12;
  return result;
}

uint64_t __52__SBHomeToDeckSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) cornerRadiiForIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)headerStyleForIndex:(unint64_t)a3
{
  return 0;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v5 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__SBHomeToDeckSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
  v9[3] = &unk_1E6AF6358;
  double v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  unint64_t v12 = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v6 usingBlock:v9];
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __60__SBHomeToDeckSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) titleAndIconOpacityForIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  double v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v5 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__SBHomeToDeckSwitcherModifier_titleOpacityForIndex___block_invoke;
  v9[3] = &unk_1E6AF6358;
  double v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  unint64_t v12 = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v6 usingBlock:v9];
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __53__SBHomeToDeckSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) titleOpacityForIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v16 = 0;
  id v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  double v7 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__SBHomeToDeckSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v11[3] = &unk_1E6AF6420;
  uint64_t v13 = &v16;
  id v8 = v7;
  id v12 = v8;
  int64_t v14 = a3;
  unint64_t v15 = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v8 usingBlock:v11];
  double v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __67__SBHomeToDeckSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) shadowOpacityForLayoutRole:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 56)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return [(SBHomeToSwitcherSwitcherModifier *)self direction] != 0;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__16;
  int64_t v14 = __Block_byref_object_dispose__16;
  id v15 = 0;
  uint64_t v3 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SBHomeToDeckSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  double v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v4 usingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __58__SBHomeToDeckSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end