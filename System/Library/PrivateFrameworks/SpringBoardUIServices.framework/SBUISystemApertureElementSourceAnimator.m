@interface SBUISystemApertureElementSourceAnimator
+ (id)activeAnimator;
+ (void)setActiveAnimator:(id)a3;
- (SBUISystemApertureAnimationParameters)settings;
- (SBUISystemApertureElementSourceAnimator)initWithSettings:(id)a3 window:(id)a4;
- (double)transitionDuration:(id)a3;
- (void)_finishTransition:(BOOL)a3;
- (void)_performAnimation;
- (void)addPostAlongsideAnimation:(id)a3;
- (void)addPostflightAction:(id)a3;
- (void)addPreAlongsideAnimation:(id)a3;
- (void)addPreflightAction:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SBUISystemApertureElementSourceAnimator

+ (id)activeAnimator
{
  return (id)SBUISystemApertureElementSourceActiveAnimator;
}

+ (void)setActiveAnimator:(id)a3
{
  id v4 = a3;
  id v7 = [a1 activeAnimator];
  v5 = (void *)SBUISystemApertureElementSourceActiveAnimator;
  SBUISystemApertureElementSourceActiveAnimator = (uint64_t)v4;

  v6 = v7;
  if (v7)
  {
    [v7 _finishTransition:0];
    v6 = v7;
  }
}

- (SBUISystemApertureElementSourceAnimator)initWithSettings:(id)a3 window:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBUISystemApertureElementSourceAnimator;
  v9 = [(SBUISystemApertureElementSourceAnimator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_settings, a3);
    objc_storeWeak((id *)&v10->_window, v8);
  }

  return v10;
}

- (void)addPreflightAction:(id)a3
{
  id v4 = a3;
  preflightActions = self->_preflightActions;
  id v9 = v4;
  if (!preflightActions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_preflightActions;
    self->_preflightActions = v6;

    preflightActions = self->_preflightActions;
  }
  id v8 = (void *)MEMORY[0x1AD0CF1C0]();
  [(NSMutableArray *)preflightActions addObject:v8];
}

- (void)addPostflightAction:(id)a3
{
  id v4 = a3;
  postflightActions = self->_postflightActions;
  id v9 = v4;
  if (!postflightActions)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_postflightActions;
    self->_postflightActions = v6;

    postflightActions = self->_postflightActions;
  }
  id v8 = (void *)MEMORY[0x1AD0CF1C0]();
  [(NSMutableArray *)postflightActions addObject:v8];
}

- (void)addPreAlongsideAnimation:(id)a3
{
  id v4 = a3;
  preAlongsideAnimations = self->_preAlongsideAnimations;
  id v9 = v4;
  if (!preAlongsideAnimations)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_preAlongsideAnimations;
    self->_preAlongsideAnimations = v6;

    preAlongsideAnimations = self->_preAlongsideAnimations;
  }
  id v8 = (void *)MEMORY[0x1AD0CF1C0]();
  [(NSMutableArray *)preAlongsideAnimations addObject:v8];
}

- (void)addPostAlongsideAnimation:(id)a3
{
  id v4 = a3;
  postAlongsideAnimations = self->_postAlongsideAnimations;
  id v9 = v4;
  if (!postAlongsideAnimations)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = self->_postAlongsideAnimations;
    self->_postAlongsideAnimations = v6;

    postAlongsideAnimations = self->_postAlongsideAnimations;
  }
  id v8 = (void *)MEMORY[0x1AD0CF1C0]();
  [(NSMutableArray *)postAlongsideAnimations addObject:v8];
}

- (void)_performAnimation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[(NSMutableArray *)self->_preAlongsideAnimations copy];
  preAlongsideAnimations = self->_preAlongsideAnimations;
  self->_preAlongsideAnimations = 0;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v22 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(WeakRetained, "__runAlongsideAnimations");
  }
  v11 = (void *)[(NSMutableArray *)self->_postAlongsideAnimations copy];
  postAlongsideAnimations = self->_postAlongsideAnimations;
  self->_postAlongsideAnimations = 0;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void)_finishTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionContext);
  [WeakRetained completeTransition:v3];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__SBUISystemApertureElementSourceAnimator__finishTransition___block_invoke;
  v7[3] = &unk_1E5CCC5A8;
  v7[4] = self;
  BOOL v8 = v3;
  objc_msgSend(MEMORY[0x1E4F42FF0], "SBUISA_performWithoutAnimationOrRetargeting:", v7);
  uint64_t v6 = [(id)objc_opt_class() activeAnimator];

  if (v6 == self) {
    [(id)objc_opt_class() setActiveAnimator:0];
  }
}

void __61__SBUISystemApertureElementSourceAnimator__finishTransition___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)animateTransition:(id)a3
{
  p_window = &self->_window;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_window);
  objc_storeWeak((id *)&self->_transitionContext, v5);

  [(id)objc_opt_class() setActiveAnimator:self];
  uint64_t v7 = [(SBUISystemApertureElementSourceAnimator *)self settings];
  char v8 = [v7 isAnimated];

  if ((v8 & 1) == 0) {
    [WeakRetained _removeAllRetargetableAnimations:1];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke;
  v13[3] = &unk_1E5CCC580;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E4F42FF0], "SBUISA_performWithoutAnimationOrRetargeting:", v13);
  uint64_t v9 = (void *)MEMORY[0x1E4F42FF0];
  long long v10 = [(SBUISystemApertureElementSourceAnimator *)self settings];
  v11[4] = self;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_2;
  v12[3] = &unk_1E5CCC580;
  v12[4] = self;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_3;
  v11[3] = &unk_1E5CCE7E8;
  objc_msgSend(v9, "SBUISA_animateWithSettings:animations:completion:", v10, v12, v11);
}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  v2 = [(id)objc_opt_class() activeAnimator];
  uint64_t v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 _performAnimation];
  }
}

void __61__SBUISystemApertureElementSourceAnimator_animateTransition___block_invoke_3(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = [(id)objc_opt_class() activeAnimator];
  uint64_t v7 = *(void **)(a1 + 32);

  if (v6 == v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    [v8 _finishTransition:a2 & ~a3];
  }
}

- (double)transitionDuration:(id)a3
{
  uint64_t v3 = [(SBUISystemApertureElementSourceAnimator *)self settings];
  id v4 = [v3 fluidBehaviorSettings];
  [v4 settlingDuration];
  double v6 = v5;

  return v6;
}

- (SBUISystemApertureAnimationParameters)settings
{
  return self->_settings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_postAlongsideAnimations, 0);
  objc_storeStrong((id *)&self->_preAlongsideAnimations, 0);
  objc_storeStrong((id *)&self->_postflightActions, 0);
  objc_storeStrong((id *)&self->_preflightActions, 0);
}

@end