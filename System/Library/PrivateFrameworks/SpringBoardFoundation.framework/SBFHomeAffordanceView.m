@interface SBFHomeAffordanceView
- (SBFHomeAffordanceView)initWithFrame:(CGRect)a3;
- (SBFHomeGrabberSettings)homeGrabberSettings;
- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings;
- (UIView)contentViewContainerView;
- (UIView)topLevelContainerView;
- (UIVisualEffectView)visualEffectView;
- (int64_t)_incrementBounceAnimationGenerationCount;
- (int64_t)_incrementGlowAnimationGenerationCount;
- (int64_t)_incrementPulseAnimationGenerationCount;
- (int64_t)bounceAnimationGenerationCount;
- (int64_t)glowAnimationGenerationCount;
- (int64_t)outstandingGlowOrPulseAnimationCount;
- (int64_t)pulseAnimationGenerationCount;
- (unint64_t)hintStyle;
- (void)_performBounceAnimationWithCompletionHandler:(id)a3;
- (void)_performGlowAnimationWithCompletionHandler:(id)a3;
- (void)_performPulseAnimationWithCompletionHandler:(id)a3;
- (void)addContentView:(id)a3;
- (void)cancelHintAnimation;
- (void)cancelHintAnimationWithCompletionHandler:(id)a3;
- (void)insertContentView:(id)a3 atIndex:(int64_t)a4;
- (void)layoutSubviews;
- (void)performHintAnimation;
- (void)performHintAnimationWithCompletionHandler:(id)a3;
- (void)removeContentView:(id)a3;
- (void)setBounceAnimationGenerationCount:(int64_t)a3;
- (void)setContentViewContainerView:(id)a3;
- (void)setGlowAnimationGenerationCount:(int64_t)a3;
- (void)setHintStyle:(unint64_t)a3;
- (void)setOutstandingGlowOrPulseAnimationCount:(int64_t)a3;
- (void)setPulseAnimationGenerationCount:(int64_t)a3;
- (void)setTopLevelContainerView:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation SBFHomeAffordanceView

- (void)addContentView:(id)a3
{
  id v7 = a3;
  v4 = [(SBFHomeAffordanceView *)self contentViewContainerView];
  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v4 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = [(SBFHomeAffordanceView *)self topLevelContainerView];
    [v6 addSubview:v4];

    [(SBFHomeAffordanceView *)self setContentViewContainerView:v4];
  }
  [v4 addSubview:v7];
}

- (void)setContentViewContainerView:(id)a3
{
}

- (SBFHomeAffordanceView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBFHomeAffordanceView;
  v3 = -[SBFHomeAffordanceView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SBFHomeGrabberDomain rootSettings];
    homeGrabberSettings = v3->_homeGrabberSettings;
    v3->_homeGrabberSettings = (SBFHomeGrabberSettings *)v4;

    v6 = +[SBFSiriDomain rootSettings];
    uint64_t v7 = [v6 systemAssistantExperienceSettings];
    systemAssistantExperienceSettings = v3->_systemAssistantExperienceSettings;
    v3->_systemAssistantExperienceSettings = (SBFSiriSystemAssistantExperienceSettings *)v7;

    id v9 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v10 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v12.receiver = v3;
    v12.super_class = (Class)SBFHomeAffordanceView;
    [(SBFHomeAffordanceView *)&v12 addSubview:v10];
    objc_storeWeak((id *)&v3->_topLevelContainerView, v10);
  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SBFHomeAffordanceView;
  [(SBFHomeAffordanceView *)&v24 layoutSubviews];
  [(SBFHomeAffordanceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBFHomeAffordanceView *)self topLevelContainerView];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");
  objc_super v12 = [(SBFHomeAffordanceView *)self visualEffectView];
  if (v12)
  {
    [v11 bounds];
    objc_msgSend(v12, "setFrame:");
    [v11 bounds];
    [v12 _setCornerRadius:CGRectGetHeight(v27) * 0.5];
    [v11 bringSubviewToFront:v12];
  }
  objc_super v13 = [(SBFHomeAffordanceView *)self contentViewContainerView];
  if (v13)
  {
    [v11 bounds];
    objc_msgSend(v13, "setFrame:");
    [v11 sendSubviewToBack:v13];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = objc_msgSend(v13, "subviews", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v21;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v21 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v20 + 1) + 8 * v18);
          [v13 bounds];
          objc_msgSend(v19, "setFrame:");
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v16);
    }
  }
}

- (UIVisualEffectView)visualEffectView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualEffectView);
  return (UIVisualEffectView *)WeakRetained;
}

- (UIView)topLevelContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topLevelContainerView);
  return (UIView *)WeakRetained;
}

- (UIView)contentViewContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentViewContainerView);
  return (UIView *)WeakRetained;
}

- (void)setHintStyle:(unint64_t)a3
{
  if (self->_hintStyle != a3)
  {
    char v3 = a3;
    self->_hintStyle = a3;
    double v5 = [(SBFHomeAffordanceView *)self visualEffectView];
    double v6 = v5;
    if ((v3 & 2) == 0 || v5)
    {
      if ((v3 & 2) == 0)
      {
        if (v5)
        {
          [v5 removeFromSuperview];
          [(SBFHomeAffordanceView *)self setVisualEffectView:0];
        }
      }
    }
    else
    {
      id v7 = objc_alloc(MEMORY[0x1E4F43028]);
      double v6 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v8 = [(SBFHomeAffordanceView *)self topLevelContainerView];
      [v8 addSubview:v6];

      [(SBFHomeAffordanceView *)self setVisualEffectView:v6];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __38__SBFHomeAffordanceView_setHintStyle___block_invoke;
      v9[3] = &unk_1E548CA88;
      v9[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contentViewContainerView);
  objc_destroyWeak((id *)&self->_visualEffectView);
  objc_destroyWeak((id *)&self->_topLevelContainerView);
  objc_storeStrong((id *)&self->_systemAssistantExperienceSettings, 0);
  objc_storeStrong((id *)&self->_homeGrabberSettings, 0);
}

uint64_t __38__SBFHomeAffordanceView_setHintStyle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)insertContentView:(id)a3 atIndex:(int64_t)a4
{
  id v9 = a3;
  double v6 = [(SBFHomeAffordanceView *)self contentViewContainerView];
  if (!v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v6 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v8 = [(SBFHomeAffordanceView *)self topLevelContainerView];
    [v8 addSubview:v6];

    [(SBFHomeAffordanceView *)self setContentViewContainerView:v6];
  }
  [v6 insertSubview:v9 atIndex:a4];
}

- (void)removeContentView:(id)a3
{
  id v9 = a3;
  double v4 = [(SBFHomeAffordanceView *)self contentViewContainerView];
  double v5 = [v9 superview];
  int v6 = [v5 isEqual:v4];

  if (v6) {
    [v9 removeFromSuperview];
  }
  id v7 = [v4 subviews];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [v4 removeFromSuperview];
    [(SBFHomeAffordanceView *)self setContentViewContainerView:0];
  }
}

- (void)performHintAnimation
{
}

- (void)performHintAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (self->_outstandingGlowOrPulseAnimationCount >= 1)
  {
    int v6 = (void (*)(void))*((void *)v4 + 2);
LABEL_3:
    v6();
    goto LABEL_18;
  }
  char v7 = [(SBFHomeAffordanceView *)self hintStyle];
  char v8 = v7;
  if ((v7 & 6) == 0)
  {
    if (v7)
    {
      [(SBFHomeAffordanceView *)self _performBounceAnimationWithCompletionHandler:v5];
      goto LABEL_18;
    }
    int v6 = (void (*)(void))v5[2];
    goto LABEL_3;
  }
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__SBFHomeAffordanceView_performHintAnimationWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E548C8C8;
  objc_copyWeak(&v12, &location);
  v11 = v5;
  id v9 = (void *)MEMORY[0x18C133210](v10);
  if ((v8 & 2) != 0)
  {
    ++self->_outstandingGlowOrPulseAnimationCount;
    if ((v8 & 4) == 0)
    {
LABEL_7:
      if ((v8 & 2) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_7;
  }
  ++self->_outstandingGlowOrPulseAnimationCount;
  if ((v8 & 2) != 0) {
LABEL_13:
  }
    [(SBFHomeAffordanceView *)self _performGlowAnimationWithCompletionHandler:v9];
LABEL_14:
  if ((v8 & 4) != 0) {
    [(SBFHomeAffordanceView *)self _performPulseAnimationWithCompletionHandler:v9];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
LABEL_18:
}

void __67__SBFHomeAffordanceView_performHintAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained[60];
    WeakRetained[60] = v3 - 1;
    if (v3 > 1) {
      goto LABEL_6;
    }
    double v5 = WeakRetained;
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    double v5 = 0;
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v4();
  id WeakRetained = v5;
LABEL_6:
}

- (void)cancelHintAnimation
{
}

- (void)cancelHintAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(SBFHomeAffordanceView *)self _incrementBounceAnimationGenerationCount];
  [(SBFHomeAffordanceView *)self _incrementGlowAnimationGenerationCount];
  [(SBFHomeAffordanceView *)self _incrementPulseAnimationGenerationCount];
  double v5 = [(SBFHomeAffordanceView *)self topLevelContainerView];
  int v6 = [(SBFHomeAffordanceView *)self visualEffectView];
  char v7 = [(SBFSiriSystemAssistantExperienceSettings *)self->_systemAssistantExperienceSettings homeAffordanceHintCancellationAnimationSettings];
  char v8 = (void *)MEMORY[0x1E4F42FF0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E548CBA0;
  id v15 = v6;
  id v16 = v5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke_2;
  v12[3] = &unk_1E548DB98;
  id v13 = v4;
  id v9 = v4;
  id v10 = v5;
  id v11 = v6;
  objc_msgSend(v8, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v14, v12);
}

uint64_t __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
  v2 = *(void **)(a1 + 40);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __66__SBFHomeAffordanceView_cancelHintAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (int64_t)_incrementBounceAnimationGenerationCount
{
  int64_t v3 = [(SBFHomeAffordanceView *)self bounceAnimationGenerationCount] + 1;
  [(SBFHomeAffordanceView *)self setBounceAnimationGenerationCount:v3];
  return v3;
}

- (int64_t)_incrementGlowAnimationGenerationCount
{
  int64_t v3 = [(SBFHomeAffordanceView *)self glowAnimationGenerationCount] + 1;
  [(SBFHomeAffordanceView *)self setGlowAnimationGenerationCount:v3];
  return v3;
}

- (int64_t)_incrementPulseAnimationGenerationCount
{
  int64_t v3 = [(SBFHomeAffordanceView *)self pulseAnimationGenerationCount] + 1;
  [(SBFHomeAffordanceView *)self setPulseAnimationGenerationCount:v3];
  return v3;
}

- (void)_performBounceAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  double v5 = [(SBFHomeAffordanceView *)self homeGrabberSettings];
  objc_initWeak(&location, self);
  int v6 = [(SBFHomeAffordanceView *)self _incrementBounceAnimationGenerationCount];
  char v7 = [(SBFHomeAffordanceView *)self topLevelContainerView];
  char v8 = [v5 bounceAnimationSettings];
  id v9 = (void *)MEMORY[0x1E4F42FF0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E548CBA0;
  id v10 = v7;
  id v23 = v10;
  id v11 = v5;
  id v24 = v11;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v22, 0);
  [v11 bounceReverseAnimationDelay];
  dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_1E548DBC0;
  objc_copyWeak(v21, &location);
  id v18 = v8;
  id v19 = v10;
  v21[1] = v6;
  id v20 = v4;
  id v14 = v4;
  id v15 = v10;
  id v16 = v8;
  dispatch_after(v13, MEMORY[0x1E4F14428], v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) bounceTranslation];
  CGAffineTransformMakeTranslation(&v4, 0.0, -v2);
  return [v1 setTransform:&v4];
}

void __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [WeakRetained bounceAnimationGenerationCount];
  uint64_t v4 = *(void *)(a1 + 64);

  if (v3 == v4)
  {
    double v5 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E548CA88;
    uint64_t v6 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_4;
    v8[3] = &unk_1E548DB98;
    id v9 = *(id *)(a1 + 48);
    objc_msgSend(v5, "sb_animateWithSettings:mode:animations:completion:", v6, 3, v10, v8);
  }
  else
  {
    char v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v7();
  }
}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __70__SBFHomeAffordanceView__performBounceAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performGlowAnimationWithCompletionHandler:(id)a3
{
  id v48 = a3;
  uint64_t v4 = [(SBFHomeAffordanceView *)self systemAssistantExperienceSettings];
  id v5 = objc_alloc(MEMORY[0x1E4F43118]);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F428B8], "sbf_siriIntelligenceLightColors");
  unint64_t v7 = [v6 count];
  uint32_t v8 = arc4random_uniform(v7);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v7];
  if (v7)
  {
    unint64_t v10 = v8;
    unint64_t v11 = v7;
    do
    {
      double v12 = [v6 objectAtIndex:v10 % v7];
      [v9 addObject:v12];

      ++v10;
      --v11;
    }
    while (v11);
  }

  uint64_t v13 = [v5 initWithColors:v9];
  v49 = (void *)v13;
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F43138]) initWithColorPalette:v13];
  uint64_t v15 = [MEMORY[0x1E4F431D0] directionalLightWithConfiguration:v14];
  id v16 = objc_alloc(MEMORY[0x1E4F431C8]);
  [v4 homeAffordanceGlowInnerLightRadius];
  uint64_t v17 = objc_msgSend(v16, "initWithLightSource:radius:region:", v15, 0);
  [v17 setActivationTransitionDirection:2];
  id v18 = objc_alloc(MEMORY[0x1E4F431C8]);
  [v4 homeAffordanceGlowOuterLightRadius];
  v47 = (void *)v15;
  id v19 = objc_msgSend(v18, "initWithLightSource:radius:region:", v15, 1);
  [v19 setActivationTransitionDirection:2];
  id v20 = objc_alloc(MEMORY[0x1E4F431D8]);
  [v4 homeAffordanceGlowHighlightThickness];
  double v22 = v21;
  id v23 = (void *)MEMORY[0x1E4F428B8];
  [v4 homeAffordanceGlowHighlightWhiteness];
  double v25 = v24;
  [v4 homeAffordanceGlowHighlightAlpha];
  CGRect v27 = [v23 colorWithWhite:v25 alpha:v26];
  [v4 homeAffordanceGlowHighlightRadius];
  v29 = (void *)[v20 initWithThickness:v27 color:2 softRadius:2 region:v22 activationDirection:v28];

  objc_initWeak(location, self);
  v30 = [(SBFHomeAffordanceView *)self _incrementGlowAnimationGenerationCount];
  v31 = [(SBFHomeAffordanceView *)self visualEffectView];
  v32 = [v4 homeAffordanceGlowAnimationSettings];
  v33 = (void *)MEMORY[0x1E4F42FF0];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke;
  v56[3] = &unk_1E548CC18;
  id v34 = v31;
  id v57 = v34;
  id v35 = v17;
  id v58 = v35;
  id v36 = v19;
  id v59 = v36;
  id v37 = v29;
  id v60 = v37;
  objc_msgSend(v33, "sb_animateWithSettings:mode:animations:completion:", v32, 3, v56, 0);
  v46 = (void *)v14;
  [v4 homeAffordanceGlowReverseAnimationDelay];
  double v39 = v38;
  UIAnimationDragCoefficient();
  dispatch_time_t v41 = dispatch_time(0, (uint64_t)(v39 * v40 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E548DC10;
  objc_copyWeak(v55, location);
  v55[1] = v30;
  id v51 = v32;
  id v52 = v34;
  id v53 = v4;
  id v54 = v48;
  id v42 = v48;
  id v43 = v4;
  id v44 = v34;
  id v45 = v32;
  dispatch_after(v41, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v55);
  objc_destroyWeak(location);
}

void __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  long long v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:3];
  [v1 setBackgroundEffects:v2];
}

void __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  long long v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained glowAnimationGenerationCount];
  uint64_t v5 = *(void *)(a1 + 72);

  if (v4 == v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E548CA88;
    uint64_t v7 = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    objc_msgSend(v6, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v18, 0);
    [*(id *)(a1 + 48) homeAffordanceGlowEffectiveAnimationDuration];
    double v9 = v8;
    [*(id *)(a1 + 48) homeAffordanceGlowReverseAnimationDelay];
    double v11 = v9 - v10;
    UIAnimationDragCoefficient();
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v11 * v12 * 1000000000.0));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E548DBE8;
    objc_copyWeak(v17, v2);
    v17[1] = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 56);
    dispatch_after(v13, MEMORY[0x1E4F14428], v15);

    objc_destroyWeak(v17);
  }
  else
  {
    uint64_t v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v14();
  }
}

uint64_t __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
}

uint64_t __68__SBFHomeAffordanceView__performGlowAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained glowAnimationGenerationCount];

  long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)_performPulseAnimationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBFHomeAffordanceView *)self systemAssistantExperienceSettings];
  objc_initWeak(&location, self);
  uint64_t v6 = [(SBFHomeAffordanceView *)self _incrementPulseAnimationGenerationCount];
  uint64_t v7 = [(SBFHomeAffordanceView *)self topLevelContainerView];
  double v8 = [v5 homeAffordancePulseAnimationSettings];
  double v9 = (void *)MEMORY[0x1E4F42FF0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke;
  v26[3] = &unk_1E548CBA0;
  id v10 = v7;
  id v27 = v10;
  id v11 = v5;
  id v28 = v11;
  objc_msgSend(v9, "sb_animateWithSettings:mode:animations:completion:", v8, 3, v26, 0);
  [v11 homeAffordancePulseReverseAnimationDelay];
  double v13 = v12;
  UIAnimationDragCoefficient();
  dispatch_time_t v15 = dispatch_time(0, (uint64_t)(v13 * v14 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E548DC10;
  objc_copyWeak(v25, &location);
  v25[1] = v6;
  id v21 = v8;
  id v22 = v10;
  id v23 = v11;
  id v24 = v4;
  id v16 = v4;
  id v17 = v11;
  id v18 = v10;
  id v19 = v8;
  dispatch_after(v15, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) homeAffordancePulseXScale];
  CGFloat v4 = v3;
  [*(id *)(a1 + 40) homeAffordancePulseYScale];
  CGAffineTransformMakeScale(&v7, v4, v5);
  return [v2 setTransform:&v7];
}

void __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  long long v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v4 = [WeakRetained pulseAnimationGenerationCount];
  uint64_t v5 = *(void *)(a1 + 72);

  if (v4 == v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F42FF0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_3;
    v18[3] = &unk_1E548CA88;
    uint64_t v7 = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    objc_msgSend(v6, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v18, 0);
    [*(id *)(a1 + 48) homeAffordancePulseEffectiveAnimationDuration];
    double v9 = v8;
    [*(id *)(a1 + 48) homeAffordancePulseReverseAnimationDelay];
    double v11 = v9 - v10;
    UIAnimationDragCoefficient();
    dispatch_time_t v13 = dispatch_time(0, (uint64_t)(v11 * v12 * 1000000000.0));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_1E548DBE8;
    objc_copyWeak(v17, v2);
    v17[1] = *(id *)(a1 + 72);
    id v16 = *(id *)(a1 + 56);
    dispatch_after(v13, MEMORY[0x1E4F14428], v15);

    objc_destroyWeak(v17);
  }
  else
  {
    float v14 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v14();
  }
}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __69__SBFHomeAffordanceView__performPulseAnimationWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained pulseAnimationGenerationCount];

  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (unint64_t)hintStyle
{
  return self->_hintStyle;
}

- (SBFHomeGrabberSettings)homeGrabberSettings
{
  return self->_homeGrabberSettings;
}

- (SBFSiriSystemAssistantExperienceSettings)systemAssistantExperienceSettings
{
  return self->_systemAssistantExperienceSettings;
}

- (void)setTopLevelContainerView:(id)a3
{
}

- (void)setVisualEffectView:(id)a3
{
}

- (int64_t)bounceAnimationGenerationCount
{
  return self->_bounceAnimationGenerationCount;
}

- (void)setBounceAnimationGenerationCount:(int64_t)a3
{
  self->_bounceAnimationGenerationCount = a3;
}

- (int64_t)glowAnimationGenerationCount
{
  return self->_glowAnimationGenerationCount;
}

- (void)setGlowAnimationGenerationCount:(int64_t)a3
{
  self->_glowAnimationGenerationCount = a3;
}

- (int64_t)pulseAnimationGenerationCount
{
  return self->_pulseAnimationGenerationCount;
}

- (void)setPulseAnimationGenerationCount:(int64_t)a3
{
  self->_pulseAnimationGenerationCount = a3;
}

- (int64_t)outstandingGlowOrPulseAnimationCount
{
  return self->_outstandingGlowOrPulseAnimationCount;
}

- (void)setOutstandingGlowOrPulseAnimationCount:(int64_t)a3
{
  self->_outstandingGlowOrPulseAnimationCount = a3;
}

@end