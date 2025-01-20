@interface SBHomeGestureToSwitcherSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4;
- (SBHomeGestureToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 adjustAppLayoutsBeforeTransition:(BOOL)a9 keepSelectedAppLayoutAsTopMostElement:(BOOL)a10;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)containerStatusBarAnimationDuration;
- (id)_appLayoutToScrollToDuringTransition;
- (id)_dismissForEmptySwitcherResponseName;
- (id)_layoutSettings;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)_appLayoutAlignmentToScrollToDuringTransition;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)hidEventSenderID;
- (void)setHidEventSenderID:(unint64_t)a3;
@end

@implementation SBHomeGestureToSwitcherSwitcherModifier

- (SBHomeGestureToSwitcherSwitcherModifier)initWithTransitionID:(id)a3 multitaskingModifier:(id)a4 selectedAppLayout:(id)a5 startingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 liftOffTranslation:(CGPoint)a8 adjustAppLayoutsBeforeTransition:(BOOL)a9 keepSelectedAppLayoutAsTopMostElement:(BOOL)a10
{
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  CGFloat v14 = a7.y;
  CGFloat v15 = a7.x;
  id v21 = a4;
  id v22 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  v23 = [(SBTransitionSwitcherModifier *)&v26 initWithTransitionID:a3];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_multitaskingModifier, a4);
    objc_storeStrong((id *)&v24->_selectedAppLayout, a5);
    v24->_startingEnvironmentMode = a6;
    v24->_liftOffVelocity.CGFloat x = v15;
    v24->_liftOffVelocity.CGFloat y = v14;
    v24->_liftOffTranslation.CGFloat x = x;
    v24->_liftOffTranslation.CGFloat y = y;
    v24->_adjustAppLayoutsBeforeTransition = a9;
    v24->_keepSelectedAppLayoutAsTopMostElement = a10;
    v24->_hidEventSenderID = 0;
  }

  return v24;
}

- (id)transitionWillBegin
{
  v20.receiver = self;
  v20.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v20 transitionWillBegin];
  v4 = objc_alloc_init(SBSwitcherModifierEventResponse);
  if (self->_adjustAppLayoutsBeforeTransition)
  {
    v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v5];
  }
  v6 = [(SBHomeGestureToSwitcherSwitcherModifier *)self _appLayoutToScrollToDuringTransition];
  if (v6)
  {
    v7 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v6 alignment:[(SBHomeGestureToSwitcherSwitcherModifier *)self _appLayoutAlignmentToScrollToDuringTransition] animated:0];
    [(SBChainableModifierEventResponse *)v4 addChildResponse:v7];
  }
  v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  [(SBChainableModifierEventResponse *)v4 addChildResponse:v8];

  v9 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
    v11 = [(SBHomeGestureToSwitcherSwitcherModifier *)self switcherSettings];
    v12 = [v11 animationSettings];
    [v12 emptySwitcherDismissDelay];
    double v14 = v13;

    CGFloat v15 = [SBTimerEventSwitcherEventResponse alloc];
    v16 = [(SBHomeGestureToSwitcherSwitcherModifier *)self _dismissForEmptySwitcherResponseName];
    v17 = [(SBTimerEventSwitcherEventResponse *)v15 initWithDelay:0 validator:v16 reason:v14];

    [(SBChainableModifierEventResponse *)v4 addChildResponse:v17];
  }
  v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v18;
}

- (id)handleTimerEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v11 handleTimerEvent:v4];
  objc_msgSend(v4, "reason", v11.receiver, v11.super_class);
  v6 = (SBDismissForEmptySwitcherSwitcherEventResponse *)objc_claimAutoreleasedReturnValue();

  v7 = [(SBHomeGestureToSwitcherSwitcherModifier *)self _dismissForEmptySwitcherResponseName];
  if ([(SBDismissForEmptySwitcherSwitcherEventResponse *)v6 isEqualToString:v7])
  {
    v8 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
    uint64_t v9 = [v8 count];

    if (v9) {
      goto LABEL_5;
    }
    v6 = [[SBDismissForEmptySwitcherSwitcherEventResponse alloc] initWithHIDEventSenderID:self->_hidEventSenderID];
    +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];
    v5 = v7 = v5;
  }

LABEL_5:
  return v5;
}

- (CGPoint)contentOffsetForIndex:(unint64_t)a3 alignment:(int64_t)a4
{
  uint64_t v10 = 0;
  objc_super v11 = (double *)&v10;
  uint64_t v12 = 0x3010000000;
  double v13 = &unk_1D90ED3C6;
  long long v14 = *MEMORY[0x1E4F1DAD8];
  multitaskingModifier = self->_multitaskingModifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__SBHomeGestureToSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke;
  v9[3] = &unk_1E6AF6420;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = a3;
  v9[7] = a4;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v9];
  double v5 = v11[4];
  double v6 = v11[5];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

uint64_t __75__SBHomeGestureToSwitcherSwitcherModifier_contentOffsetForIndex_alignment___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) contentOffsetForIndex:a1[6] alignment:a1[7]];
  uint64_t v3 = *(void *)(a1[5] + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v15 handleTransitionEvent:v4];
  if ([(SBHomeGestureToSwitcherSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    double v6 = [(SBHomeGestureToSwitcherSwitcherModifier *)self chamoisLayoutAttributes];
    int v7 = [v6 isAdditiveModelEnabled];

    if (v7)
    {
      if ([v4 phase] == 1)
      {
        double v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
        uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v8];

        uint64_t v10 = [SBInvalidateContinuousExposeIdentifiersEventResponse alloc];
        objc_super v11 = [v4 fromAppLayout];
        uint64_t v12 = [v4 toAppLayout];
        double v13 = [(SBInvalidateContinuousExposeIdentifiersEventResponse *)v10 initWithTransitioningFromAppLayout:v11 transitioningToAppLayout:v12 animated:0];
        uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v13 toResponse:v9];
      }
    }
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  if -[SBHomeGestureToSwitcherSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")&& (-[SBHomeGestureToSwitcherSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes"), id v4 = objc_claimAutoreleasedReturnValue(), v5 = [v4 isAdditiveModelEnabled], v4, (v5))
  {
    v23.receiver = self;
    v23.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    double v6 = [(SBHomeGestureToSwitcherSwitcherModifier *)&v23 appLayoutOnStage];
    if (v6)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      double v8 = [v6 zOrderedItems];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v34 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v18[0] = MEMORY[0x1E4F143A8];
            v18[1] = 3221225472;
            v18[2] = __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
            v18[3] = &unk_1E6AF4B38;
            v18[4] = v12;
            double v13 = [v6 appLayoutWithItemsPassingTest:v18];
            [v7 addObject:v13];
          }
          uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v34 count:16];
        }
        while (v9);
      }

      id v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v7];
    }
    else
    {
      id v14 = [MEMORY[0x1E4F1C978] array];
    }
  }
  else if (self->_adjustAppLayoutsBeforeTransition {
         && [(SBTransitionSwitcherModifier *)self isPreparingLayout])
  }
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__124;
    v32 = __Block_byref_object_dispose__124;
    id v33 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
    v25[3] = &unk_1E6AF6380;
    v27 = &v28;
    v25[4] = self;
    id v26 = v17;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v25];
    id v14 = (id)v29[5];

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    id v14 = [(SBTransitionSwitcherModifier *)&v24 adjustedAppLayoutsForAppLayouts:v17];
  }

  return v14;
}

void __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 144) adjustedAppLayoutsForAppLayouts:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __75__SBHomeGestureToSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2()
{
  return BSEqualObjects();
}

- (id)visibleAppLayouts
{
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    objc_super v11 = __Block_byref_object_copy__124;
    uint64_t v12 = __Block_byref_object_dispose__124;
    id v13 = 0;
    multitaskingModifier = self->_multitaskingModifier;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__SBHomeGestureToSwitcherSwitcherModifier_visibleAppLayouts__block_invoke;
    v7[3] = &unk_1E6AF4B88;
    v7[4] = self;
    v7[5] = &v8;
    [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v7];
    id v4 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    id v4 = [(SBHomeGestureToSwitcherSwitcherModifier *)&v6 visibleAppLayouts];
  }
  return v4;
}

void __60__SBHomeGestureToSwitcherSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) visibleAppLayouts];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  char v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBHomeGestureToSwitcherSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  uint64_t v3 = [(SBHomeGestureToSwitcherSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  if ([(SBHomeGestureToSwitcherSwitcherModifier *)self isReduceMotionEnabled]) {
    [v4 reduceMotionAppToSwitcherSettings];
  }
  else {
  char v5 = [v4 gestureInitiatedAppToSwitcherSettings];
  }

  return v5;
}

- (id)topMostLayoutElements
{
  if (-[SBHomeGestureToSwitcherSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")&& (-[SBHomeGestureToSwitcherSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes"), v3 = objc_claimAutoreleasedReturnValue(), int v4 = [v3 isAdditiveModelEnabled], v3, v4))
  {
    char v5 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeGestureToSwitcherSwitcherModifier;
    char v5 = [(SBHomeGestureToSwitcherSwitcherModifier *)&v8 topMostLayoutElements];
    if (self->_selectedAppLayout && self->_keepSelectedAppLayoutAsTopMostElement)
    {
      objc_super v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:v5];
      [v6 removeObject:self->_selectedAppLayout];
      [v6 insertObject:self->_selectedAppLayout atIndex:0];

      char v5 = v6;
    }
  }
  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  uint64_t v14 = 0;
  objc_super v15 = (double *)&v14;
  uint64_t v16 = 0x4010000000;
  id v17 = &unk_1D90ED3C6;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F43C68] + 16);
  multitaskingModifier = self->_multitaskingModifier;
  long long v18 = *MEMORY[0x1E4F43C68];
  long long v19 = v3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SBHomeGestureToSwitcherSwitcherModifier_cornerRadiiForIndex___block_invoke;
  v13[3] = &unk_1E6AF6358;
  v13[4] = self;
  v13[5] = &v14;
  v13[6] = a3;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v13];
  double v5 = v15[4];
  double v6 = v15[5];
  double v7 = v15[6];
  double v8 = v15[7];
  _Block_object_dispose(&v14, 8);
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  result.topRight = v12;
  result.bottomRight = v11;
  result.bottomLeft = v10;
  result.topLeft = v9;
  return result;
}

uint64_t __63__SBHomeGestureToSwitcherSwitcherModifier_cornerRadiiForIndex___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 144) cornerRadiiForIndex:a1[6]];
  long long v3 = *(void **)(a1[5] + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (double)containerStatusBarAnimationDuration
{
  long long v3 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0.35;
  }
  uint64_t v6 = [(SBHomeGestureToSwitcherSwitcherModifier *)self switcherSettings];
  uint64_t v7 = [v6 animationSettings];
  [v7 statusBarToApexBounceAnimationDuration];
  double v9 = v8;

  return v9;
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
  double v9 = __Block_byref_object_copy__124;
  double v10 = __Block_byref_object_dispose__124;
  id v11 = 0;
  multitaskingModifier = self->_multitaskingModifier;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__SBHomeGestureToSwitcherSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke;
  v5[3] = &unk_1E6AF4B88;
  v5[4] = self;
  v5[5] = &v6;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:multitaskingModifier usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __69__SBHomeGestureToSwitcherSwitcherModifier_appLayoutsToCacheSnapshots__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 144) appLayoutsToCacheSnapshots];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  uint64_t v3 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
  uint64_t v4 = v3;
  if (self->_selectedAppLayout)
  {
    uint64_t v5 = objc_msgSend(v3, "indexOfObject:");
    if (v5)
    {
      NSUInteger v6 = v5 - 1;
      NSUInteger v7 = 3;
    }
    else
    {
      NSUInteger v6 = 0;
      NSUInteger v7 = 2;
    }
  }
  else
  {
    NSUInteger v6 = 0;
    NSUInteger v7 = 1;
  }
  v13.length = [v4 count];
  v12.location = v6;
  v12.length = v7;
  v13.location = 0;
  NSRange v8 = NSIntersectionRange(v12, v13);
  double v9 = objc_msgSend(v4, "subarrayWithRange:", v8.location, v8.length);

  return v9;
}

- (id)_appLayoutToScrollToDuringTransition
{
  uint64_t v3 = [(SBHomeGestureToSwitcherSwitcherModifier *)self homeGestureSettings];
  [v3 velocityXThresholdForUnconditionalArcSwipe];
  double v5 = v4;
  double v6 = SBMainScreenPointsPerMillimeter();
  NSUInteger v7 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayouts];
  int v8 = [(SBHomeGestureToSwitcherSwitcherModifier *)self isChamoisWindowingUIEnabled];
  char v9 = v8;
  if (self->_startingEnvironmentMode == 1)
  {
    if (v8)
    {
      double v10 = [(SBHomeGestureToSwitcherSwitcherModifier *)self continuousExposeIdentifiersInSwitcher];
      id v11 = [v10 firstObject];

      if (v11)
      {
        NSRange v12 = [(SBHomeGestureToSwitcherSwitcherModifier *)self appLayoutsForContinuousExposeIdentifier:v11];
        NSRange v13 = [v12 firstObject];
      }
      else
      {
        NSRange v13 = 0;
      }

      goto LABEL_27;
    }
    uint64_t v15 = [v7 firstObject];
    goto LABEL_24;
  }
  uint64_t v14 = [v7 indexOfObject:self->_selectedAppLayout];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSRange v13 = 0;
    goto LABEL_27;
  }
  uint64_t v16 = v14;
  double v17 = v5 * v6;
  [(SBHomeGestureToSwitcherSwitcherModifier *)self containerViewBounds];
  double x = self->_liftOffVelocity.x;
  BOOL v20 = x > v17 || self->_liftOffTranslation.x > v18 * 0.5;
  if (x >= -v17 && self->_liftOffTranslation.x >= v18 * -0.5)
  {
    int v22 = 0;
    uint64_t v21 = v16 + v20;
    if ((v9 & 1) == 0)
    {
LABEL_14:
      if (v21) {
        BOOL v23 = 0;
      }
      else {
        BOOL v23 = self->_startingEnvironmentMode == 3;
      }
      uint64_t v24 = (v22 | v20) ^ 1u;
      if (v23) {
        uint64_t v21 = v24;
      }
    }
  }
  else
  {
    uint64_t v21 = v16 - 1;
    int v22 = 1;
    if ((v9 & 1) == 0) {
      goto LABEL_14;
    }
  }
  uint64_t v25 = [v7 count];
  if (v25 - 1 >= (v21 & ~(v21 >> 63))) {
    uint64_t v26 = v21 & ~(v21 >> 63);
  }
  else {
    uint64_t v26 = v25 - 1;
  }
  uint64_t v15 = [v7 objectAtIndex:v26];
LABEL_24:
  NSRange v13 = (void *)v15;
LABEL_27:

  return v13;
}

- (int64_t)_appLayoutAlignmentToScrollToDuringTransition
{
  return 2 * (self->_startingEnvironmentMode != 1);
}

- (id)_dismissForEmptySwitcherResponseName
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"DismissForEmptySwitcher-%p", self);
}

- (unint64_t)hidEventSenderID
{
  return self->_hidEventSenderID;
}

- (void)setHidEventSenderID:(unint64_t)a3
{
  self->_hidEventSenderID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end