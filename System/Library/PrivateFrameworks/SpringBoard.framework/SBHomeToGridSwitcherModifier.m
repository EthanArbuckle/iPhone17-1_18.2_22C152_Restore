@interface SBHomeToGridSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToScrollToDuringTransition;
- (id)appLayoutsToCacheSnapshots;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (int64_t)headerStyleForIndex:(unint64_t)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBHomeToGridSwitcherModifier

- (id)appLayoutToScrollToDuringTransition
{
  v3 = [(SBHomeToGridSwitcherModifier *)self appLayouts];
  if ([(SBHomeToSwitcherSwitcherModifier *)self direction] == 1)
  {
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
  uint64_t v21 = 0;
  v22 = (double *)&v21;
  uint64_t v23 = 0x4010000000;
  v24 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v25 = *MEMORY[0x1E4F1DB28];
  long long v26 = v5;
  v6 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__SBHomeToGridSwitcherModifier_frameForIndex___block_invoke;
  v16[3] = &unk_1E6AF63D0;
  v19 = &v21;
  id v7 = v6;
  unint64_t v20 = a3;
  id v17 = v7;
  v18 = self;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v7 usingBlock:v16];
  double v8 = v22[4];
  double v9 = v22[5];
  double v10 = v22[6];
  double v11 = v22[7];

  _Block_object_dispose(&v21, 8);
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

void __46__SBHomeToGridSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frameForIndex:*(void *)(a1 + 56)];
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if ([*(id *)(a1 + 40) isEffectivelyHome])
  {
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
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a4;
  uint64_t v33 = 0;
  v34 = (double *)&v33;
  uint64_t v35 = 0x4010000000;
  v36 = &unk_1D90ED3C6;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v37 = *MEMORY[0x1E4F1DB28];
  long long v38 = v12;
  double v13 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __74__SBHomeToGridSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
  v24[3] = &unk_1E6AF63A8;
  v27 = &v33;
  id v14 = v13;
  id v25 = v14;
  int64_t v28 = a3;
  id v15 = v11;
  id v26 = v15;
  CGFloat v29 = x;
  CGFloat v30 = y;
  CGFloat v31 = width;
  CGFloat v32 = height;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v14 usingBlock:v24];
  double v16 = v34[4];
  double v17 = v34[5];
  double v18 = v34[6];
  double v19 = v34[7];

  _Block_object_dispose(&v33, 8);
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

uint64_t __74__SBHomeToGridSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  uint64_t v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  id v14 = (double *)&v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v5 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__SBHomeToGridSwitcherModifier_scaleForIndex___block_invoke;
  v9[3] = &unk_1E6AF6358;
  id v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  unint64_t v12 = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v6 usingBlock:v9];
  double v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__SBHomeToGridSwitcherModifier_scaleForIndex___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) scaleForIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  double v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x3FF0000000000000;
  double v7 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__SBHomeToGridSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke;
  v12[3] = &unk_1E6AF63D0;
  uint64_t v15 = &v17;
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

uint64_t __63__SBHomeToGridSwitcherModifier_scaleForLayoutRole_inAppLayout___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) scaleForLayoutRole:*(void *)(a1 + 56) inAppLayout:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__5;
  id v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  uint64_t v3 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__SBHomeToGridSwitcherModifier_visibleAppLayouts__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  id v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v4 usingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __49__SBHomeToGridSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHomeToGridSwitcherModifier *)self switcherSettings];
  id v6 = [v5 animationSettings];

  if ([(SBHomeToSwitcherSwitcherModifier *)self direction]) {
    [v6 toggleAppSwitcherSettings];
  }
  else {
  double v7 = [v6 switcherToHomeSettings];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBHomeToGridSwitcherModifier;
  id v8 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];

  id v9 = (void *)[v8 mutableCopy];
  [v9 setLayoutSettings:v7];
  uint64_t v10 = [v6 switcherToHomeOpacitySettings];
  [v9 setOpacitySettings:v10];

  return v9;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  id v9 = [(SBHomeToGridSwitcherModifier *)self visibleAppLayouts];
  double v10 = 0.0;
  if ([v9 containsObject:v8])
  {
    uint64_t v19 = 0;
    uint64_t v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    id v11 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __73__SBHomeToGridSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke;
    v14[3] = &unk_1E6AF8508;
    id v12 = v11;
    id v15 = v12;
    int64_t v16 = &v19;
    unint64_t v17 = a5;
    int64_t v18 = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v12 usingBlock:v14];
    double v10 = v20[3];

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

void __73__SBHomeToGridSwitcherModifier_opacityForLayoutRole_inAppLayout_atIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayouts];
  id v4 = [v2 objectAtIndex:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) opacityForLayoutRole:*(void *)(a1 + 56) inAppLayout:v4 atIndex:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v20 = 0;
  uint64_t v21 = (double *)&v20;
  uint64_t v22 = 0x4010000000;
  double v23 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F43C68] + 16);
  long long v24 = *MEMORY[0x1E4F43C68];
  long long v25 = v5;
  id v6 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __52__SBHomeToGridSwitcherModifier_cornerRadiiForIndex___block_invoke;
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

uint64_t __52__SBHomeToGridSwitcherModifier_cornerRadiiForIndex___block_invoke(uint64_t a1)
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
  v9[2] = __60__SBHomeToGridSwitcherModifier_titleAndIconOpacityForIndex___block_invoke;
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

uint64_t __60__SBHomeToGridSwitcherModifier_titleAndIconOpacityForIndex___block_invoke(uint64_t a1)
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
  v9[2] = __53__SBHomeToGridSwitcherModifier_titleOpacityForIndex___block_invoke;
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

uint64_t __53__SBHomeToGridSwitcherModifier_titleOpacityForIndex___block_invoke(uint64_t a1)
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
  v11[2] = __67__SBHomeToGridSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
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

uint64_t __67__SBHomeToGridSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(uint64_t a1)
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
  uint64_t v13 = __Block_byref_object_copy__5;
  int64_t v14 = __Block_byref_object_dispose__5;
  id v15 = 0;
  uint64_t v3 = [(SBHomeToSwitcherSwitcherModifier *)self multitaskingModifier];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__SBHomeToGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v7[3] = &unk_1E6AF4B88;
  double v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v4 usingBlock:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __58__SBHomeToGridSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)topMostLayoutElements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end