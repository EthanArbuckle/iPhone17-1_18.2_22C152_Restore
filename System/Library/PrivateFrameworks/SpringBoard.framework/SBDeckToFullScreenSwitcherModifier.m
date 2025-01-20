@interface SBDeckToFullScreenSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (SBDeckToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 deckModifier:(id)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_appLayoutToScrollToDuringTransition;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutToScrollToBeforeTransitioning;
- (id)appLayoutsToCacheSnapshots;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBDeckToFullScreenSwitcherModifier

- (SBDeckToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 fullScreenAppLayout:(id)a5 deckModifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_fullScreenAppLayout, a5);
    objc_storeStrong((id *)&v14->_deckModifier, a6);
    v14->_wantsMinificationFilter = 0;
  }

  return v14;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  int64_t direction = self->_direction;
  if (!direction)
  {
    v6 = [(SBDeckToFullScreenSwitcherModifier *)self switcherSettings];
    v7 = [v6 animationSettings];
    [v7 disableAsyncRenderingTransitionPercentage];
    double v9 = v8;

    v10 = [(SBDeckToFullScreenSwitcherModifier *)self _layoutSettings];
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
  v12.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v4 = [(SBDeckToFullScreenSwitcherModifier *)self _appLayoutToScrollToDuringTransition];
  if (v4)
  {
    v5 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v4 alignment:0 animated:0];
    uint64_t v6 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v3];

    v3 = (void *)v6;
  }
  if (self->_direction == 1 && [(SBAppLayout *)self->_fullScreenAppLayout type] == 2)
  {
    v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
    uint64_t v8 = 30;
  }
  else
  {
    v7 = [SBUpdateLayoutSwitcherEventResponse alloc];
    uint64_t v8 = 2;
  }
  double v9 = [(SBUpdateLayoutSwitcherEventResponse *)v7 initWithOptions:v8 updateMode:2];
  v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v3];

  return v10;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v5 = [v4 transitionID];
  uint64_t v6 = [(SBTransitionSwitcherModifier *)self transitionID];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v4 fromAppLayout];
    double v9 = [v4 toAppLayout];
    self->_wantsMinificationFilter = [v8 isEqual:v9];
  }
  v12.receiver = self;
  v12.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v12 handleTransitionEvent:v4];

  return v10;
}

- (id)visibleAppLayouts
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  float v13 = __Block_byref_object_copy__121;
  v14 = __Block_byref_object_dispose__121;
  id v15 = 0;
  deckModifier = self->_deckModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SBDeckToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke;
  v9[3] = &unk_1E6AF4B88;
  v9[4] = self;
  v9[5] = &v10;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:deckModifier usingBlock:v9];
  id v4 = (void *)v11[5];
  v8.receiver = self;
  v8.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  v5 = [(SBDeckToFullScreenSwitcherModifier *)&v8 visibleAppLayouts];
  uint64_t v6 = [v4 setByAddingObjectsFromSet:v5];

  _Block_object_dispose(&v10, 8);
  return v6;
}

void __55__SBDeckToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  uint64_t v6 = [(SBDeckToFullScreenSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v3 = [(SBDeckToFullScreenSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  if (self->_direction == 1) {
    [v4 toggleAppSwitcherSettings];
  }
  else {
  v5 = [v4 launchAppFromSwitcherSettings];
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if (self->_direction)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
    [(SBDeckToFullScreenSwitcherModifier *)&v7 cornerRadiiForIndex:a3];
  }
  else
  {
    [(SBDeckToFullScreenSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 2;
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

- (id)topMostLayoutElements
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__121;
  uint64_t v10 = __Block_byref_object_dispose__121;
  id v11 = 0;
  deckModifier = self->_deckModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__SBDeckToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:deckModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__SBDeckToFullScreenSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) topMostLayoutElements];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutsToCacheSnapshots
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__121;
  uint64_t v10 = __Block_byref_object_dispose__121;
  id v11 = 0;
  deckModifier = self->_deckModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SBDeckToFullScreenSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:deckModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __64__SBDeckToFullScreenSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 152) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutToScrollToBeforeTransitioning
{
  if (self->_direction) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = self->_fullScreenAppLayout;
  }
  return v2;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDeckToFullScreenSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)([(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:a3] | (self->_wantsMinificationFilter << 8));
}

- (id)_appLayoutToScrollToDuringTransition
{
  if (self->_direction == 1)
  {
    uint64_t v3 = [(SBDeckToFullScreenSwitcherModifier *)self appLayouts];
    uint64_t v4 = [v3 indexOfObject:self->_fullScreenAppLayout];
    uint64_t v5 = [v3 count];
    if (v5 - 1 >= (unint64_t)(v4 + 1)) {
      uint64_t v6 = v4 + 1;
    }
    else {
      uint64_t v6 = v5 - 1;
    }
    objc_super v7 = [v3 objectAtIndex:v6];
  }
  else
  {
    objc_super v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deckModifier, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end