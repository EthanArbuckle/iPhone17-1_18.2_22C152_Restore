@interface SBGridSwipeUpGestureSwitcherModifier
- (BOOL)delayCompletionUntilTransitionBegins;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGPoint)scrollViewContentOffset;
- (CGRect)switcherViewBounds;
- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3;
- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3 delayCompletionUntilTransitionBegins:(BOOL)a4;
- (double)contentViewScale;
- (id)handleGestureEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)visibleAppLayouts;
- (int64_t)finalResponseForGestureEvent:(id)a3;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)_applyPrototypeSettings;
- (void)_performBlockByApplyContentViewScaleToSwitcherViewBounds:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBGridSwipeUpGestureSwitcherModifier

- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3
{
  return [(SBGridSwipeUpGestureSwitcherModifier *)self initWithGestureID:a3 delayCompletionUntilTransitionBegins:0];
}

- (SBGridSwipeUpGestureSwitcherModifier)initWithGestureID:(id)a3 delayCompletionUntilTransitionBegins:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  v5 = [(SBGestureSwitcherModifier *)&v10 initWithGestureID:a3];
  v6 = v5;
  if (v5)
  {
    v5->_delayCompletionUntilTransitionBegins = a4;
    v7 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v6->_dismissSiriModifier;
    v6->_dismissSiriModifier = v7;

    [(SBChainableModifier *)v6 addChildModifier:v6->_dismissSiriModifier];
  }
  return v6;
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3) {
    [(SBGridSwipeUpGestureSwitcherModifier *)self _applyPrototypeSettings];
  }
}

- (CGRect)switcherViewBounds
{
  v17.receiver = self;
  v17.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  [(SBGridSwipeUpGestureSwitcherModifier *)&v17 switcherViewBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if (self->_isApplyingContentViewScaleToSwitcherViewBounds)
  {
    [(SBGridSwipeUpGestureSwitcherModifier *)self contentViewScale];
    CGAffineTransformMakeScale(&v16, 1.0 / v11, 1.0 / v11);
    v18.origin.x = v4;
    v18.origin.y = v6;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
    CGFloat v4 = *MEMORY[0x1E4F1DAD8];
    CGFloat v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  double v12 = v4;
  double v13 = v6;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)scrollViewContentOffset
{
  v21.receiver = self;
  v21.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  [(SBGridSwipeUpGestureSwitcherModifier *)&v21 scrollViewContentOffset];
  double v4 = v3;
  double v6 = v5;
  if (self->_isApplyingContentViewScaleToSwitcherViewBounds)
  {
    v20.receiver = self;
    v20.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
    [(SBGridSwipeUpGestureSwitcherModifier *)&v20 switcherViewBounds];
    double v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    UIRectGetCenter();
    [(SBGridSwipeUpGestureSwitcherModifier *)self contentViewScale];
    CGAffineTransformMakeScale(&v19, 1.0 / v15, 1.0 / v15);
    v23.origin.x = v8;
    v23.origin.y = v10;
    v23.size.CGFloat width = v12;
    v23.size.CGFloat height = v14;
    CGRectApplyAffineTransform(v23, &v19);
    SBUnintegralizedRectCenteredAboutPoint();
    double v4 = v4 - (v8 - v16);
  }
  double v17 = v4;
  double v18 = v6;
  result.y = v18;
  result.x = v17;
  return result;
}

- (double)contentViewScale
{
  v4.receiver = self;
  v4.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  [(SBGridSwipeUpGestureSwitcherModifier *)&v4 switcherViewBounds];
  BSUIConstrainValueWithRubberBand();
  BSIntervalMap();
  return v2 * (*(double *)&kGridSwitcherSwipeUpMinimumScale + -1.0) + 1.0;
}

- (id)visibleAppLayouts
{
  uint64_t v5 = 0;
  double v6 = &v5;
  uint64_t v7 = 0x3032000000;
  double v8 = __Block_byref_object_copy__104;
  double v9 = __Block_byref_object_dispose__104;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__SBGridSwipeUpGestureSwitcherModifier_visibleAppLayouts__block_invoke;
  v4[3] = &unk_1E6AF4B88;
  v4[4] = self;
  v4[5] = &v5;
  [(SBGridSwipeUpGestureSwitcherModifier *)self _performBlockByApplyContentViewScaleToSwitcherViewBounds:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __57__SBGridSwipeUpGestureSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  objc_super v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
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

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  objc_super v5 = [(SBGestureSwitcherModifier *)&v15 handleGestureEvent:v4];
  if ([v4 phase] == 2 || objc_msgSend(v4, "phase") == 3)
  {
    [v4 translationInContainerView];
    self->_translation.x = v6;
    self->_translation.y = v7;
    if ([v4 phase] == 3)
    {
      int64_t v8 = [(SBGridSwipeUpGestureSwitcherModifier *)self finalResponseForGestureEvent:v4];
      double v9 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      id v10 = v9;
      if (v8)
      {
        [(SBSwitcherTransitionRequest *)v9 setUnlockedEnvironmentMode:2];
      }
      else
      {
        double v11 = +[SBAppLayout homeScreenAppLayout];
        [(SBSwitcherTransitionRequest *)v10 setAppLayout:v11];
      }
      CGFloat v12 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v10 gestureInitiated:1];
      uint64_t v13 = +[SBChainableModifierEventResponse responseByAppendingResponse:v12 toResponse:v5];

      if (![(SBGridSwipeUpGestureSwitcherModifier *)self delayCompletionUntilTransitionBegins])[(SBChainableModifier *)self setState:1]; {
      objc_super v5 = (void *)v13;
      }
    }
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBGridSwipeUpGestureSwitcherModifier;
  objc_super v5 = [(SBGestureSwitcherModifier *)&v7 handleTransitionEvent:v4];
  if (-[SBGridSwipeUpGestureSwitcherModifier delayCompletionUntilTransitionBegins](self, "delayCompletionUntilTransitionBegins")&& (unint64_t)[v4 phase] >= 2)
  {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (int64_t)finalResponseForGestureEvent:(id)a3
{
  id v4 = a3;
  [v4 velocityInContainerView];
  double v6 = v5;
  double y = self->_translation.y;
  [(SBGridSwipeUpGestureSwitcherModifier *)self containerViewBounds];
  double v9 = v8;
  int v10 = [v4 isMouseEvent];

  if (v10)
  {
    [(SBGridSwipeUpGestureSwitcherModifier *)self containerViewBounds];
    double v12 = v11 * 0.125;
  }
  else
  {
    double v12 = v9 * 0.25;
  }
  return -(y - v6 * -0.15) <= v12;
}

- (void)_applyPrototypeSettings
{
  id v5 = [(SBGridSwipeUpGestureSwitcherModifier *)self switcherSettings];
  [v5 gridSwitcherSwipeUpNormalizedRubberbandingRange];
  kGridSwitcherSwipeUpNormalizedRubberbandingRange = v2;
  [v5 gridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale];
  kGridSwitcherSwipeUpNormalizedRubberbandedTranslationAtMinimumScale = v3;
  [v5 gridSwitcherSwipeUpMinimumScale];
  kGridSwitcherSwipeUpMinimumScale = v4;
}

- (void)_performBlockByApplyContentViewScaleToSwitcherViewBounds:(id)a3
{
  self->_isApplyingContentViewScaleToSwitcherViewBounds = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_isApplyingContentViewScaleToSwitcherViewBounds = 0;
}

- (BOOL)delayCompletionUntilTransitionBegins
{
  return self->_delayCompletionUntilTransitionBegins;
}

- (void).cxx_destruct
{
}

@end