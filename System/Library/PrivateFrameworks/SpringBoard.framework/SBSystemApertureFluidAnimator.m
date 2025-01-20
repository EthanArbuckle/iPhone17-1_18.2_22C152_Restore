@interface SBSystemApertureFluidAnimator
+ (id)currentAnimationParameters;
- (SBSystemApertureFluidAnimator)init;
- (SBSystemApertureFluidAnimator)initWithSettings:(id)a3;
- (double)transitionDuration:(id)a3;
- (id)_fluidBehaviorSettings;
- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5;
- (void)animateWithMode:(int64_t)a3 animations:(id)a4 completion:(id)a5;
@end

@implementation SBSystemApertureFluidAnimator

+ (id)currentAnimationParameters
{
  return (id)SBSystemApertureAnimatorCurrentAnimationParameters;
}

- (SBSystemApertureFluidAnimator)initWithSettings:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSystemApertureFluidAnimator;
  v5 = [(SBSystemApertureFluidAnimator *)&v7 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4FA5F08]);
      [v4 setDefaultValues];
    }
    [(SBSystemApertureAnimator *)v5 _setSettings:v4];
  }

  return v5;
}

- (SBSystemApertureFluidAnimator)init
{
  return [(SBSystemApertureFluidAnimator *)self initWithSettings:0];
}

- (void)animateWithMode:(int64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [(SBSystemApertureFluidAnimator *)self _fluidBehaviorSettings];
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA7D48]) initWithFluidBehaviorSettings:v10 tracking:a3 == 5 retargeted:a3 == 4];
  objc_storeStrong((id *)&SBSystemApertureAnimatorCurrentAnimationParameters, v11);
  v12 = (void *)MEMORY[0x1E4F42FF0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__SBSystemApertureFluidAnimator_animateWithMode_animations_completion___block_invoke;
  v15[3] = &unk_1E6AFA340;
  id v16 = v11;
  id v17 = v8;
  id v13 = v8;
  id v14 = v11;
  objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v10, a3, v9, v15);
}

uint64_t __71__SBSystemApertureFluidAnimator_animateWithMode_animations_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2 == (void *)SBSystemApertureAnimatorCurrentAnimationParameters)
  {
    SBSystemApertureAnimatorCurrentAnimationParameters = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_animateTransition:(id)a3 actions:(id)a4 completion:(id)a5
{
}

- (double)transitionDuration:(id)a3
{
  v3 = [(SBSystemApertureFluidAnimator *)self _fluidBehaviorSettings];
  [v3 settlingDuration];
  double v5 = v4;

  return v5;
}

- (id)_fluidBehaviorSettings
{
  v2 = [(SBSystemApertureAnimator *)self _settings];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end