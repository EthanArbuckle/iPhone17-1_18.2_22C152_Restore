@interface SBGridToActiveAppLayoutsSwitcherModifier
- (BOOL)_isEffectivelyFullScreen;
- (BOOL)_isIndexActive:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBGridToActiveAppLayoutsSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayouts:(id)a5 gridModifier:(id)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)_unselectedCardScale;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenScale;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)titleOpacityForIndex:(unint64_t)a3;
- (double)wallpaperScale;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheSnapshots;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBGridToActiveAppLayoutsSwitcherModifier

- (SBGridToActiveAppLayoutsSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayouts:(id)a5 gridModifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  v12 = [(SBTransitionSwitcherModifier *)&v17 initWithTransitionID:a3];
  v13 = v12;
  if (v12)
  {
    v12->_direction = a4;
    uint64_t v14 = [v10 copy];
    activeAppLayouts = v13->_activeAppLayouts;
    v13->_activeAppLayouts = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_gridModifier, a6);
    v13->_wantsMinificationFilter = 0;
  }

  return v13;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  int64_t direction = self->_direction;
  if (!direction)
  {
    v6 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self switcherSettings];
    v7 = [v6 animationSettings];
    [v7 disableAsyncRenderingTransitionPercentage];
    double v9 = v8;

    id v10 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self _layoutSettings];
    [v10 settlingDuration];
    double v12 = v9 * v11;
    UIAnimationDragCoefficient();
    *a3 = v12 * v13;
  }
  return direction == 0;
}

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v4 = [(NSArray *)self->_activeAppLayouts bs_firstObjectPassingTest:&__block_literal_global_207];
  int64_t direction = self->_direction;
  v6 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (v4) {
    BOOL v7 = direction == 1;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t v8 = 30;
  }
  else {
    uint64_t v8 = 2;
  }
  double v9 = [(SBUpdateLayoutSwitcherEventResponse *)v6 initWithOptions:v8 updateMode:2];
  id v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v3];

  return v10;
}

BOOL __63__SBGridToActiveAppLayoutsSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionID];
  v6 = [(SBTransitionSwitcherModifier *)self transitionID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v4 fromAppLayout];
    double v9 = [v4 toAppLayout];
    self->_wantsMinificationFilter = [v8 isEqual:v9];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  id v10 = [(SBTransitionSwitcherModifier *)&v12 handleTransitionEvent:v4];

  return v10;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if (![(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen])
  {
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x4010000000;
    v35 = &unk_1D90ED3C6;
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    gridModifier = self->_gridModifier;
    long long v36 = *MEMORY[0x1E4F1DB28];
    long long v37 = v13;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke;
    v31[3] = &unk_1E6AF6358;
    v31[4] = self;
    v31[5] = &v32;
    v31[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v31];
    double v6 = v33[4];
    double v8 = v33[5];
    double v10 = v33[6];
    double v12 = v33[7];
LABEL_6:
    _Block_object_dispose(&v32, 8);
    goto LABEL_7;
  }
  if (![(SBGridToActiveAppLayoutsSwitcherModifier *)self _isIndexActive:a3])
  {
    uint64_t v32 = 0;
    v33 = (double *)&v32;
    uint64_t v34 = 0x4010000000;
    v35 = &unk_1D90ED3C6;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    v16 = self->_gridModifier;
    long long v36 = *MEMORY[0x1E4F1DB28];
    long long v37 = v15;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke_2;
    v29[3] = &unk_1E6AF6358;
    v29[4] = self;
    v29[5] = &v32;
    v29[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v16 usingBlock:v29];
    [(SBGridToActiveAppLayoutsSwitcherModifier *)self _unselectedCardScale];
    CGFloat v18 = v17;
    [(SBGridToActiveAppLayoutsSwitcherModifier *)self switcherViewBounds];
    UIRectGetCenter();
    UIRectGetCenter();
    CGAffineTransformMakeScale(&v28, v18, v18);
    SBUnintegralizedRectCenteredAboutPoint();
    double v6 = v19;
    double v8 = v20;
    double v10 = v21;
    double v12 = v22;
    v23 = v33;
    v33[4] = v19;
    v23[5] = v20;
    v23[6] = v21;
    v23[7] = v22;
    goto LABEL_6;
  }
  v30.receiver = self;
  v30.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  [(SBGridToActiveAppLayoutsSwitcherModifier *)&v30 frameForIndex:a3];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
LABEL_7:
  double v24 = v6;
  double v25 = v8;
  double v26 = v10;
  double v27 = v12;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_frameForIndex___block_invoke_2(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) frameForIndex:a1[6]];
  v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if ([(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen]
    && ![(NSArray *)self->_activeAppLayouts containsObject:v11])
  {
    uint64_t v34 = 0;
    v35 = (double *)&v34;
    uint64_t v36 = 0x4010000000;
    long long v37 = &unk_1D90ED3C6;
    gridModifier = self->_gridModifier;
    long long v38 = 0u;
    long long v39 = 0u;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __86__SBGridToActiveAppLayoutsSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke;
    v26[3] = &unk_1E6AF63A8;
    CGAffineTransform v28 = &v34;
    int64_t v29 = a3;
    v26[4] = self;
    id v27 = v11;
    double v30 = x;
    double v31 = y;
    double v32 = width;
    double v33 = height;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v26];
    double v13 = v35[4];
    double v15 = v35[5];
    double v17 = v35[6];
    double v19 = v35[7];

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    -[SBGridToActiveAppLayoutsSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
  }

  double v21 = v13;
  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

uint64_t __86__SBGridToActiveAppLayoutsSwitcherModifier_frameForLayoutRole_inAppLayout_withBounds___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 152), "frameForLayoutRole:inAppLayout:withBounds:", *(void *)(a1 + 56), *(void *)(a1 + 40), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v3 = *(void **)(*(void *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (id)visibleAppLayouts
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  double v13 = __Block_byref_object_copy__69;
  double v14 = __Block_byref_object_dispose__69;
  id v15 = 0;
  gridModifier = self->_gridModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __61__SBGridToActiveAppLayoutsSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  v9[5] = &v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v9];
  uint64_t v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  uint64_t v5 = [(SBGridToActiveAppLayoutsSwitcherModifier *)&v8 visibleAppLayouts];
  uint64_t v6 = [v4 setByAddingObjectsFromSet:v5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __61__SBGridToActiveAppLayoutsSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (-[SBGridToActiveAppLayoutsSwitcherModifier _isIndexActive:](self, "_isIndexActive:"))
  {
    v15.receiver = self;
    v15.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    [(SBGridToActiveAppLayoutsSwitcherModifier *)&v15 scaleForIndex:a3];
    return v5;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v12 = (double *)&v11;
    uint64_t v13 = 0x2020000000;
    gridModifier = self->_gridModifier;
    uint64_t v14 = 0x3FF0000000000000;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_scaleForIndex___block_invoke;
    v10[3] = &unk_1E6AF6358;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = a3;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v10];
    [(SBGridToActiveAppLayoutsSwitcherModifier *)self _unselectedCardScale];
    double v6 = v8 * v12[3];
    v12[3] = v6;
    _Block_object_dispose(&v11, 8);
  }
  return v6;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_scaleForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) scaleForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  uint64_t v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v3 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self switcherSettings];
  uint64_t v4 = [v3 animationSettings];

  if (self->_direction == 1) {
    [v4 toggleAppSwitcherSettings];
  }
  else {
  double v5 = [v4 launchAppFromSwitcherSettings];
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen]
    || (double v9 = 0.0, [(SBGridToActiveAppLayoutsSwitcherModifier *)self _isIndexActive:a5]))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    [(SBGridToActiveAppLayoutsSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (double)homeScreenAlpha
{
  uint64_t v10 = 0;
  uint64_t v11 = (double *)&v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenAlpha__block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  v9[5] = &v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v9];
  if (!self->_direction
    && (([(SBGridToActiveAppLayoutsSwitcherModifier *)self homeScreenHasOpenFolder] & 1) != 0
     || [(SBGridToActiveAppLayoutsSwitcherModifier *)self isShowingSpotlightOrTodayView]))
  {
    uint64_t v4 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self switcherSettings];
    double v5 = [v4 animationSettings];
    [v5 homeScreenAlphaForMode:1];
    *((void *)v11 + 3) = v6;
  }
  double v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) homeScreenAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenScale
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenScale__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) homeScreenScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)wallpaperScale
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x3FF0000000000000;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SBGridToActiveAppLayoutsSwitcherModifier_wallpaperScale__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__SBGridToActiveAppLayoutsSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) wallpaperScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 1;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) homeScreenBackdropBlurType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  if ([(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen])
  {
    v12.receiver = self;
    v12.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    [(SBGridToActiveAppLayoutsSwitcherModifier *)&v12 homeScreenBackdropBlurProgress];
    return v3;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = (double *)&v8;
    uint64_t v10 = 0x2020000000;
    uint64_t v11 = 0x3FF0000000000000;
    gridModifier = self->_gridModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __74__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
    v7[3] = &unk_1E6AF4B88;
    v7[4] = self;
    v7[5] = &v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v7];
    double v4 = v9[3];
    _Block_object_dispose(&v8, 8);
  }
  return v4;
}

uint64_t __74__SBGridToActiveAppLayoutsSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 152) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)titleOpacityForIndex:(unint64_t)a3
{
  return 1.0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  id v6 = a4;
  [(SBGridToActiveAppLayoutsSwitcherModifier *)&v13 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  uint64_t v9 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self appLayouts];
  uint64_t v10 = [v9 indexOfObject:v6];

  if (![(SBGridToActiveAppLayoutsSwitcherModifier *)self _isIndexActive:v10]
    && [(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen])
  {
    [(SBGridToActiveAppLayoutsSwitcherModifier *)self homeScreenDimmingAlpha];
    return v11;
  }
  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v21 = 0;
  double v22 = (double *)&v21;
  uint64_t v23 = 0x4010000000;
  double v24 = &unk_1D90ED3C6;
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F43C68] + 16);
  gridModifier = self->_gridModifier;
  long long v25 = *MEMORY[0x1E4F43C68];
  long long v26 = v5;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__SBGridToActiveAppLayoutsSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v20[3] = &unk_1E6AF6358;
  v20[4] = self;
  v20[5] = &v21;
  v20[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v20];
  if ([(SBGridToActiveAppLayoutsSwitcherModifier *)self _isIndexActive:a3]
    && [(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen])
  {
    v19.receiver = self;
    v19.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
    [(SBGridToActiveAppLayoutsSwitcherModifier *)&v19 cornerRadiiForIndex:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v8 = v22[4];
    double v10 = v22[5];
    double v12 = v22[6];
    double v14 = v22[7];
  }
  _Block_object_dispose(&v21, 8);
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.topRight = v18;
  result.bottomRight = v17;
  result.bottomLeft = v16;
  result.topLeft = v15;
  return result;
}

uint64_t __64__SBGridToActiveAppLayoutsSwitcherModifier_cornerRadiiForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 152) cornerRadiiForIndex:a1[6]];
  uint64_t v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
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

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__69;
  double v10 = __Block_byref_object_dispose__69;
  id v11 = 0;
  gridModifier = self->_gridModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__SBGridToActiveAppLayoutsSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:gridModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __70__SBGridToActiveAppLayoutsSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)topMostLayoutElements
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  uint64_t v3 = [(SBGridToActiveAppLayoutsSwitcherModifier *)&v18 topMostLayoutElements];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (NSArray *)[v3 mutableCopy];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [(NSArray *)self->_activeAppLayouts reverseObjectEnumerator];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = [(NSArray *)v5 indexOfObject:v11];
          if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
            [(NSArray *)v5 removeObjectAtIndex:v12];
          }
          [(NSArray *)v5 insertObject:v11 atIndex:0];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
  }
  else
  {
    uint64_t v5 = self->_activeAppLayouts;
  }

  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBGridToActiveAppLayoutsSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)([(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:a3] | (self->_wantsMinificationFilter << 8));
}

- (BOOL)_isIndexActive:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_activeAppLayouts;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(v6, "isEqual:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (double)_unselectedCardScale
{
  if (![(SBGridToActiveAppLayoutsSwitcherModifier *)self _isEffectivelyFullScreen]) {
    return 1.0;
  }
  uint64_t v3 = [(SBGridToActiveAppLayoutsSwitcherModifier *)self switcherSettings];
  objc_super v4 = [v3 animationSettings];
  [v4 appToSwitcherTransitionMinCardScaleFactor];
  double v6 = v5;

  return v6;
}

- (BOOL)_isEffectivelyFullScreen
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout]) {
    BOOL v3 = self->_direction == 1;
  }
  else {
    BOOL v3 = 0;
  }
  if ([(SBTransitionSwitcherModifier *)self isUpdatingLayout]) {
    BOOL v4 = self->_direction == 0;
  }
  else {
    BOOL v4 = 0;
  }
  return v3 || v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridModifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayouts, 0);
}

@end