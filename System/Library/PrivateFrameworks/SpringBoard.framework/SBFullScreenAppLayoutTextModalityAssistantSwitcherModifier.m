@interface SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier
- (BOOL)_isAppLayoutAtIndex:(unint64_t)a3;
- (BOOL)_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait;
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (SBAppLayout)appLayout;
- (SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier)initWithAppLayout:(id)a3 interfaceOrientation:(int64_t)a4 multitaskingModifier:(id)a5;
- (SBSwitcherModifier)multitaskingModifier;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOffsetForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)wallpaperScale;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleAssistantPresentationChangedEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)interfaceOrientation;
- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (int64_t)wallpaperStyle;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
@end

@implementation SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier

- (SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier)initWithAppLayout:(id)a3 interfaceOrientation:(int64_t)a4 multitaskingModifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appLayout, a3);
    v12->_interfaceOrientation = a4;
    objc_storeStrong((id *)&v12->_multitaskingModifier, a5);
  }

  return v12;
}

- (id)handleAssistantPresentationChangedEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  v4 = [(SBSwitcherModifier *)&v10 handleAssistantPresentationChangedEvent:a3];
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait])
  {
    v5 = [SBUpdateLayoutSwitcherEventResponse alloc];
LABEL_4:
    v7 = [(SBUpdateLayoutSwitcherEventResponse *)v5 initWithOptions:28 updateMode:3];
    v8 = SBAppendSwitcherModifierResponse(v7, v4);

    goto LABEL_6;
  }
  uint64_t v6 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self assistantPresentationState];
  v5 = [SBUpdateLayoutSwitcherEventResponse alloc];
  if (v6) {
    goto LABEL_4;
  }
  v7 = [(SBUpdateLayoutSwitcherEventResponse *)v5 initWithOptions:8 updateMode:2];
  v8 = SBAppendSwitcherModifierResponse(v7, v4);

  [(SBChainableModifier *)self setState:1];
LABEL_6:

  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v10 handleTransitionEvent:v4];
  uint64_t v6 = [v4 fromInterfaceOrientation];
  uint64_t v7 = [v4 toInterfaceOrientation];
  if (v7 != v6)
  {
    int64_t v8 = v7;
    if ((unint64_t)(v7 - 3) <= 1)
    {
      if ([v4 phase] == 2)
      {
        self->_interfaceOrientation = v8;
      }
      else if ([v4 phase] == 3)
      {
        [(SBChainableModifier *)self setState:1];
      }
    }
  }

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  if ([v4 switcherLayoutElementType] || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    v5 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v10 animationAttributesForLayoutElement:v4];
  }
  else
  {
    v5 = objc_alloc_init(SBMutableSwitcherAnimationAttributes);
    [(SBSwitcherAnimationAttributes *)v5 setUpdateMode:3];
    uint64_t v6 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self siriSettings];
    uint64_t v7 = [v6 systemAssistantExperienceSettings];
    int64_t v8 = [v7 typeToSiriPushInAnimationSettings];
    [(SBSwitcherAnimationAttributes *)v5 setScaleSettings:v8];
  }
  return v5;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  if (![(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAppLayoutAtIndex:"_isAppLayoutAtIndex:"]
    || (BOOL v6 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait], result = 0.0, !v6))
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    -[SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, result);
  }
  return result;
}

- (BOOL)isContainerStatusBarVisible
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v4 isContainerStatusBarVisible];
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAppLayoutAtIndex:"_isAppLayoutAtIndex:"]
    && ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait]|| (unint64_t)(self->_interfaceOrientation - 3) < 2))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v6 isContentStatusBarVisibleForIndex:a3];
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAppLayoutAtIndex:"_isAppLayoutAtIndex:"])
  {
    [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v9 cornerRadiiForIndex:a3];
  }
  result.topRight = v8;
  result.bottomRight = v7;
  result.bottomLeft = v6;
  result.topLeft = v5;
  return result;
}

- (double)homeScreenAlpha
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenAlpha__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) homeScreenAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurType__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __88__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurType__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) homeScreenBackdropBlurType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (double)homeScreenBackdropBlurProgress
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenDimmingAlpha
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __84__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) homeScreenDimmingAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenScale
{
  uint64_t v6 = 0;
  double v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenScale__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __77__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) homeScreenScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isHomeScreenContentRequired
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isHomeScreenContentRequired__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __89__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isHomeScreenContentRequired__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) isHomeScreenContentRequired];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 isEqual:self->_appLayout]
    && [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    BOOL v5 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v7 isResizeGrabberVisibleForAppLayout:v4];
  }

  return v5;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __92__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_isWallpaperRequiredForSwitcher__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) isWallpaperRequiredForSwitcher];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAppLayoutAtIndex:"_isAppLayoutAtIndex:"]) {
    return 15;
  }
  v6.receiver = self;
  v6.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
  return [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v6 maskedCornersForIndex:a3];
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([v6 isEqual:self->_appLayout])
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    BOOL v7 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v9 shouldAllowContentViewTouchesForLayoutRole:a3 inAppLayout:v6];
  }

  return v7;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAppLayoutAtIndex:"_isAppLayoutAtIndex:"]
    && [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait])
  {
    BOOL v5 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self siriSettings];
    id v6 = [v5 systemAssistantExperienceSettings];
    [v6 typeToSiriPushInScale];
    double v8 = v7;

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v10 scaleForIndex:a3];
  }
  return result;
}

- (double)shadowOffsetForIndex:(unint64_t)a3
{
  uint64_t v7 = 0;
  double v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  multitaskingModifier = self->_multitaskingModifier;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOffsetForIndex___block_invoke;
  v6[3] = &unk_1E6AF6358;
  v6[4] = self;
  v6[5] = &v7;
  v6[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v6];
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __83__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOffsetForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 112) shadowOffsetForIndex:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  uint64_t v8 = 0;
  uint64_t v9 = (double *)&v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke;
  v7[3] = &unk_1E6AF6420;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v7];
  double v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __97__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowOpacityForLayoutRole_atIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 112) shadowOpacityForLayoutRole:a1[6] atIndex:a1[7]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = v3;
  return result;
}

- (int64_t)shadowStyleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  multitaskingModifier = self->_multitaskingModifier;
  uint64_t v18 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __99__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke;
  v11[3] = &unk_1E6AF63D0;
  v13 = &v15;
  int64_t v14 = a3;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v11];
  int64_t v9 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __99__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_shadowStyleForLayoutRole_inAppLayout___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 112) shadowStyleForLayoutRole:a1[7] inAppLayout:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (id)visibleHomeAffordanceLayoutElements
{
  if ([(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self _isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier;
    uint64_t v3 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)&v5 visibleHomeAffordanceLayoutElements];
  }
  return v3;
}

- (double)wallpaperScale
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperScale__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) wallpaperScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)wallpaperStyle
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperStyle__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __76__SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier_wallpaperStyle__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 112) wallpaperStyle];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isAppLayoutAtIndex:(unint64_t)a3
{
  double v4 = self;
  objc_super v5 = [(SBFullScreenAppLayoutTextModalityAssistantSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];
  LOBYTE(v4) = [v6 isEqual:v4->_appLayout];

  return (char)v4;
}

- (BOOL)_isAssistantEffectivelyPresentedForSAETypeToSiriInPortrait
{
  BOOL v3 = [(SBSwitcherModifier *)self isAssistantEffectivelyPresentedForSAETypeToSiri];
  if (v3) {
    LOBYTE(v3) = (unint64_t)(self->_interfaceOrientation - 1) < 2;
  }
  return v3;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (SBSwitcherModifier)multitaskingModifier
{
  return self->_multitaskingModifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end