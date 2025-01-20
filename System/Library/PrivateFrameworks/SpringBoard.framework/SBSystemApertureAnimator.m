@interface SBSystemApertureAnimator
- (SBSystemApertureAnimator)initWithSettings:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)_bsAnimationSettings;
- (id)_settings;
- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5;
- (void)_setSettings:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation SBSystemApertureAnimator

- (SBSystemApertureAnimator)initWithSettings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSystemApertureAnimator;
  v6 = [(SBSystemApertureAnimator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong(&v6->_settings, a3);
  }

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 _alongsideAnimationsCount] >= 1)
  {
    v6 = v17;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__SBSystemApertureAnimator_animateTransition___block_invoke;
    v17[3] = &unk_1E6AF4AC0;
    v3 = &v18;
    id v18 = v5;
    int v7 = 1;
  }
  else
  {
    int v7 = 0;
    v6 = 0;
  }
  v8 = (void (**)(void))MEMORY[0x1D948C7A0](v6);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __46__SBSystemApertureAnimator_animateTransition___block_invoke_2;
  v15 = &unk_1E6AFA1B8;
  id v9 = v5;
  id v16 = v9;
  v10 = (void (**)(void, void, void))MEMORY[0x1D948C7A0](&v12);
  if (v8)
  {
    if (objc_msgSend(v9, "isAnimated", v12, v13, v14, v15))
    {
      [(SBSystemApertureAnimator *)self transitionDuration:v9];
      if (v11 > 0.0)
      {
        [(SBSystemApertureAnimator *)self _animateTransition:v9 actions:v8 completion:v10];
        goto LABEL_11;
      }
    }
    v8[2](v8);
  }
  v10[2](v10, 1, 0);
LABEL_11:

  if (v7) {
}
  }

uint64_t __46__SBSystemApertureAnimator_animateTransition___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "__runAlongsideAnimations");
  }
  return result;
}

uint64_t __46__SBSystemApertureAnimator_animateTransition___block_invoke_2(uint64_t a1, int a2, int a3)
{
  return [*(id *)(a1 + 32) completeTransition:a2 & ~a3];
}

- (double)transitionDuration:(id)a3
{
  objc_msgSend(self->_settings, "duration", a3);
  return result;
}

- (id)_bsAnimationSettings
{
  id settings = self->_settings;
  uint64_t v3 = objc_opt_class();
  id v4 = settings;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = (void *)MEMORY[0x1E4F4F898];
  id v9 = a4;
  v10 = [(SBSystemApertureAnimator *)self _bsAnimationSettings];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SBSystemApertureAnimator__animateTransition_actions_completion___block_invoke;
  v12[3] = &unk_1E6AF5A50;
  id v13 = v7;
  id v11 = v7;
  [v8 animateWithSettings:v10 actions:v9 completion:v12];
}

uint64_t __66__SBSystemApertureAnimator__animateTransition_actions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_settings
{
  return self->_settings;
}

- (void)_setSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end