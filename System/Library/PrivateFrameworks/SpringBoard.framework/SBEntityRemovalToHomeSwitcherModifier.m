@interface SBEntityRemovalToHomeSwitcherModifier
- (BOOL)isContainerStatusBarVisible;
- (BOOL)isContentStatusBarVisible;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (SBEntityRemovalToHomeSwitcherModifier)initWithTransitionID:(id)a3 homeAnimationDelay:(double)a4 multitaskingModifier:(id)a5;
- (double)dockProgress;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (double)wallpaperScale;
- (id)_cornerRadiusSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (int64_t)dockUpdateMode;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBEntityRemovalToHomeSwitcherModifier

- (SBEntityRemovalToHomeSwitcherModifier)initWithTransitionID:(id)a3 homeAnimationDelay:(double)a4 multitaskingModifier:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v10 = [(SBTransitionSwitcherModifier *)&v13 initWithTransitionID:a3];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_multitaskingModifier, a5);
    v11->_homeAnimationDelay = a4;
    v11->_canAnimateHomeScreenStyle = a4 <= 0.0;
  }

  return v11;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)transitionWillUpdate
{
  v15.receiver = self;
  v15.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v15 transitionWillUpdate];
  if (!self->_canAnimateHomeScreenStyle)
  {
    objc_initWeak(&location, self);
    v4 = [SBTimerEventSwitcherEventResponse alloc];
    double homeAnimationDelay = self->_homeAnimationDelay;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    v11 = __61__SBEntityRemovalToHomeSwitcherModifier_transitionWillUpdate__block_invoke;
    v12 = &unk_1E6AF90F0;
    objc_copyWeak(&v13, &location);
    objc_super v6 = [(SBTimerEventSwitcherEventResponse *)v4 initWithDelay:&v9 validator:@"kSBEntityRemovalToHomeSwitcherModifierHomeScreenLayoutReason" reason:homeAnimationDelay];
    uint64_t v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v6, v3, v9, v10, v11, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    v3 = (void *)v7;
  }
  return v3;
}

BOOL __61__SBEntityRemovalToHomeSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  objc_super v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBEntityRemovalToHomeSwitcherModifierHomeScreenLayoutReason"];
  if (v4)
  {
    self->_canAnimateHomeScreenStyle = 1;
    uint64_t v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v5 = (void *)v8;
  }
  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:v4];
  uint64_t v6 = objc_msgSend(v4, "switcherLayoutElementType", v10.receiver, v10.super_class);

  if (!v6)
  {
    uint64_t v7 = (void *)[v5 mutableCopy];
    uint64_t v8 = [(SBEntityRemovalToHomeSwitcherModifier *)self _cornerRadiusSettings];
    [v7 setCornerRadiusSettings:v8];

    v5 = v7;
  }
  return v5;
}

- (id)_cornerRadiusSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
  [v2 setResponse:0.0];
  return v2;
}

- (double)dockProgress
{
  return 1.0;
}

- (double)homeScreenScale
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenScale__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    [(SBEntityRemovalToHomeSwitcherModifier *)&v7 homeScreenScale];
    double v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) homeScreenScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)wallpaperScale
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__SBEntityRemovalToHomeSwitcherModifier_wallpaperScale__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    [(SBEntityRemovalToHomeSwitcherModifier *)&v7 wallpaperScale];
    double v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __55__SBEntityRemovalToHomeSwitcherModifier_wallpaperScale__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) wallpaperScale];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (BOOL)isWallpaperRequiredForSwitcher
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
  return 0;
}

- (BOOL)isContainerStatusBarVisible
{
  return self->_canAnimateHomeScreenStyle;
}

- (BOOL)isContentStatusBarVisible
{
  return ![(SBEntityRemovalToHomeSwitcherModifier *)self isContainerStatusBarVisible];
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 1;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 1;
}

- (BOOL)shouldFireTransitionCompletionInDefaultRunLoopMode
{
  return 1;
}

- (int64_t)homeScreenBackdropBlurType
{
  if ([(SBEntityRemovalToHomeSwitcherModifier *)self hasHomeButton]) {
    return 1;
  }
  else {
    return 3;
  }
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__SBEntityRemovalToHomeSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    [(SBEntityRemovalToHomeSwitcherModifier *)&v7 homeScreenBackdropBlurProgress];
    double v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __71__SBEntityRemovalToHomeSwitcherModifier_homeScreenBackdropBlurProgress__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) homeScreenBackdropBlurProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenAlpha
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenAlpha__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    [(SBEntityRemovalToHomeSwitcherModifier *)&v7 homeScreenAlpha];
    double v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __56__SBEntityRemovalToHomeSwitcherModifier_homeScreenAlpha__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) homeScreenAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)homeScreenDimmingAlpha
{
  uint64_t v9 = 0;
  objc_super v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout] || !self->_canAnimateHomeScreenStyle)
  {
    multitaskingModifier = self->_multitaskingModifier;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __63__SBEntityRemovalToHomeSwitcherModifier_homeScreenDimmingAlpha__block_invoke;
    v8[3] = &unk_1E6AF4B88;
    v8[4] = self;
    v8[5] = &v9;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v8];
    double v4 = v10[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBEntityRemovalToHomeSwitcherModifier;
    [(SBEntityRemovalToHomeSwitcherModifier *)&v7 homeScreenDimmingAlpha];
    double v4 = v3;
    v10[3] = v3;
  }
  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __63__SBEntityRemovalToHomeSwitcherModifier_homeScreenDimmingAlpha__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 136) homeScreenDimmingAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (void).cxx_destruct
{
}

@end