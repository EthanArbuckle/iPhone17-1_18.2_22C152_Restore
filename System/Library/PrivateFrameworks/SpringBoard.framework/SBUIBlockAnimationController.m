@interface SBUIBlockAnimationController
- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3;
- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5;
- (id)animationSettings;
- (void)_didComplete;
- (void)_startAnimation;
@end

@implementation SBUIBlockAnimationController

- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3 animationSettings:(id)a4 animationBlock:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBUIBlockAnimationController.m", 22, @"Invalid parameter not satisfying: %@", @"animationBlock" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)SBUIBlockAnimationController;
  v12 = [(SBUIWorkspaceAnimationController *)&v18 initWithWorkspaceTransitionRequest:v9];
  if (v12)
  {
    v13 = v10;
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.0];
    }
    objc_storeStrong((id *)&v12->_animationSettings, v13);
    if (!v10) {

    }
    uint64_t v14 = [v11 copy];
    id animationBlock = v12->_animationBlock;
    v12->_id animationBlock = (id)v14;
  }
  return v12;
}

uint64_t __47__SBUIBlockAnimationController__startAnimation__block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 _noteAnimationDidFinish];
  }
  else {
    return [v2 _noteAnimationDidFail];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
}

- (id)animationSettings
{
  return self->_animationSettings;
}

- (void)_startAnimation
{
  id animationBlock = (void (**)(id, SBUIBlockAnimationController *, void *, BSAnimationSettings *, void *))self->_animationBlock;
  if (animationBlock)
  {
    v4 = [(SBUIWorkspaceAnimationController *)self workspaceTransitionRequest];
    animationSettings = self->_animationSettings;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__SBUIBlockAnimationController__startAnimation__block_invoke;
    v9[3] = &unk_1E6AF5350;
    v9[4] = self;
    animationBlock[2](animationBlock, self, v4, animationSettings, v9);

    id v6 = self->_animationBlock;
    self->_id animationBlock = 0;
  }
  else
  {
    v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "Animation ran with a nil animation block", v8, 2u);
    }

    [(SBUIAnimationController *)self _noteAnimationDidFail];
  }
}

- (void)_didComplete
{
  id animationBlock = self->_animationBlock;
  self->_id animationBlock = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBUIBlockAnimationController;
  [(SBUIBlockAnimationController *)&v4 _didComplete];
}

- (SBUIBlockAnimationController)initWithWorkspaceTransitionRequest:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3A8];
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%s is not a valid initializer. You must call -[%@ initWithWorkspaceTransitionRequest:animationSettings:animationBlock:].", "-[SBUIBlockAnimationController initWithWorkspaceTransitionRequest:]", v7 format];

  return [(SBUIBlockAnimationController *)self initWithWorkspaceTransitionRequest:0 animationSettings:0 animationBlock:0];
}

@end