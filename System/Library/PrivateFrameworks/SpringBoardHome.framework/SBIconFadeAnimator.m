@interface SBIconFadeAnimator
- (BOOL)fadesReferenceView;
- (SBIconFadeAnimator)initWithAnimationContainer:(id)a3 crossfadeView:(id)a4;
- (unint64_t)_numberOfSignificantAnimations;
- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5;
- (void)_applyAlphaForFraction:(double)a3;
- (void)_cleanupAnimation;
- (void)_prepareAnimation;
- (void)_setAnimationFraction:(double)a3;
- (void)setFadesReferenceView:(BOOL)a3;
@end

@implementation SBIconFadeAnimator

- (SBIconFadeAnimator)initWithAnimationContainer:(id)a3 crossfadeView:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBIconFadeAnimator;
  v8 = [(SBIconAnimator *)&v16 initWithAnimationContainer:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_crossfadeView, a4);
    v9->_fadesReferenceView = 1;
    v10 = [v7 window];

    if (!v10)
    {
      v11 = [(SBIconAnimator *)v9 animationContainer];
      v12 = [v11 fallbackIconContainerView];
      [v12 addSubview:v7];

      v13 = [v7 window];

      if (v13)
      {
        v9->_addedToWindow = 1;
      }
      else if (v7)
      {
        v14 = SBLogCommon();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SBIconFadeAnimator initWithAnimationContainer:crossfadeView:](v14);
        }
      }
    }
  }

  return v9;
}

- (void)_prepareAnimation
{
  [(UIView *)self->_crossfadeView setHidden:0];
  v3.receiver = self;
  v3.super_class = (Class)SBIconFadeAnimator;
  [(SBIconAnimator *)&v3 _prepareAnimation];
}

- (void)_setAnimationFraction:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBIconFadeAnimator;
  -[SBIconAnimator _setAnimationFraction:](&v5, sel__setAnimationFraction_);
  [(SBIconFadeAnimator *)self _applyAlphaForFraction:a3];
}

- (void)_cleanupAnimation
{
  if (self->_addedToWindow)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __39__SBIconFadeAnimator__cleanupAnimation__block_invoke;
    aBlock[3] = &unk_1E6AAC810;
    aBlock[4] = self;
    objc_super v3 = (void (**)(void))_Block_copy(aBlock);
    v4 = [(SBIconAnimator *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || [v4 iconAnimator:self canAlterViewHierarchyDuringCleanupUsingBlock:v3])
    {
      v3[2](v3);
    }
  }
  [(UIView *)self->_crossfadeView setAlpha:1.0];
  v5.receiver = self;
  v5.super_class = (Class)SBIconFadeAnimator;
  [(SBIconAnimator *)&v5 _cleanupAnimation];
}

uint64_t __39__SBIconFadeAnimator__cleanupAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 88) removeFromSuperview];
}

- (unint64_t)_numberOfSignificantAnimations
{
  v3.receiver = self;
  v3.super_class = (Class)SBIconFadeAnimator;
  return [(SBIconAnimator *)&v3 _numberOfSignificantAnimations] + 1;
}

- (void)_animateToFraction:(double)a3 afterDelay:(double)a4 withSharedCompletion:(id)a5
{
  id v8 = a5;
  BOOL v9 = [(SBIconAnimator *)self isAnimating];
  v14.receiver = self;
  v14.super_class = (Class)SBIconFadeAnimator;
  [(SBIconAnimator *)&v14 _animateToFraction:v8 afterDelay:a3 withSharedCompletion:a4];
  if (v9) {
    uint64_t v10 = 6;
  }
  else {
    uint64_t v10 = 2;
  }
  v11 = (void *)MEMORY[0x1E4F4F898];
  v12 = [(SBIconAnimator *)self centralAnimationFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__SBIconFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke;
  v13[3] = &unk_1E6AAC838;
  v13[4] = self;
  *(double *)&v13[5] = a3;
  [v11 animateWithFactory:v12 additionalDelay:v10 options:v13 actions:v8 completion:a4];
}

uint64_t __73__SBIconFadeAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyAlphaForFraction:*(double *)(a1 + 40)];
}

- (void)_applyAlphaForFraction:(double)a3
{
  -[UIView setAlpha:](self->_crossfadeView, "setAlpha:");
  if ([(SBIconFadeAnimator *)self fadesReferenceView])
  {
    id v5 = [(SBIconAnimator *)self referenceView];
    [v5 setAlpha:1.0 - a3];
  }
}

- (BOOL)fadesReferenceView
{
  return self->_fadesReferenceView;
}

- (void)setFadesReferenceView:(BOOL)a3
{
  self->_fadesReferenceView = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithAnimationContainer:(os_log_t)log crossfadeView:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_ERROR, "Fade icon animator was not attached to hierarchy!", v1, 2u);
}

@end