@interface SBWindowSceneStatusBarSettingsAssertion
- (NSDate)timestamp;
- (NSString)description;
- (NSString)reason;
- (SBStatusBarSettings)settings;
- (SBWindowSceneStatusBarAssertionManager)assertionManager;
- (SBWindowSceneStatusBarSettingsAssertion)init;
- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 settings:(id)a4 atLevel:(unint64_t)a5 reason:(id)a6;
- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 statusBarHidden:(BOOL)a4 atLevel:(unint64_t)a5 reason:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)level;
- (void)acquire;
- (void)acquireWithAnimationParameters:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)invalidateWithAnimationParameters:(id)a3;
- (void)modifySettingsWithBlock:(id)a3;
- (void)modifySettingsWithBlock:(id)a3 animationParameters:(id)a4;
@end

@implementation SBWindowSceneStatusBarSettingsAssertion

- (NSString)description
{
  return (NSString *)[(SBWindowSceneStatusBarSettingsAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)acquireWithAnimationParameters:(id)a3
{
  p_assertionManager = &self->_assertionManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_assertionManager);
  [WeakRetained _addStatusBarSettingsAssertion:self withAnimationParameters:v5];
}

- (SBStatusBarSettings)settings
{
  return self->_settings;
}

- (unint64_t)level
{
  return self->_level;
}

- (void)acquire
{
}

- (void)modifySettingsWithBlock:(id)a3 animationParameters:(id)a4
{
  if (a3)
  {
    settings = self->_settings;
    id v7 = a4;
    v8 = (void (**)(id, id))a3;
    id v12 = (id)[(SBStatusBarSettings *)settings mutableCopy];
    v8[2](v8, v12);

    v9 = (SBStatusBarSettings *)[v12 copy];
    v10 = self->_settings;
    self->_settings = v9;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionManager);
    [WeakRetained _modifiedStatusBarSettingsAssertion:self withAnimationParameters:v7];
  }
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 statusBarHidden:(BOOL)a4 atLevel:(unint64_t)a5 reason:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = objc_alloc_init(SBMutableStatusBarSettings);
  double v13 = 1.0;
  if (v7) {
    double v13 = 0.0;
  }
  v14 = [NSNumber numberWithDouble:v13];
  [(SBMutableStatusBarSettings *)v12 setAlpha:v14];

  id v15 = [(SBWindowSceneStatusBarSettingsAssertion *)self _initWithWindowSceneStatusBarAssertionManager:v11 settings:v12 atLevel:a5 reason:v10];
  return v15;
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 settings:(id)a4 atLevel:(unint64_t)a5 reason:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBWindowSceneStatusBarSettingsAssertion;
  v14 = [(SBWindowSceneStatusBarSettingsAssertion *)&v25 init];
  if (v14)
  {
    if (a5 >= 0xD)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:v14 file:@"SBWindowSceneStatusBarSettingsAssertion.m" lineNumber:36 description:@"invalid status bar settings level"];

      if (v12)
      {
LABEL_4:
        if (v13)
        {
LABEL_5:
          uint64_t v15 = [v12 copy];
          settings = v14->_settings;
          v14->_settings = (SBStatusBarSettings *)v15;

          v14->_level = a5;
          uint64_t v17 = [v13 copy];
          reason = v14->_reason;
          v14->_reason = (NSString *)v17;

          uint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
          timestamp = v14->_timestamp;
          v14->_timestamp = (NSDate *)v19;

          objc_storeWeak((id *)&v14->_assertionManager, v11);
          goto LABEL_6;
        }
LABEL_9:
        v24 = [MEMORY[0x1E4F28B00] currentHandler];
        [v24 handleFailureInMethod:a2 object:v14 file:@"SBWindowSceneStatusBarSettingsAssertion.m" lineNumber:38 description:@"invalid reason"];

        goto LABEL_5;
      }
    }
    else if (v12)
    {
      goto LABEL_4;
    }
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:v14 file:@"SBWindowSceneStatusBarSettingsAssertion.m" lineNumber:37 description:@"invalid status bar settings"];

    if (v13) {
      goto LABEL_5;
    }
    goto LABEL_9;
  }
LABEL_6:

  return v14;
}

id __81__SBWindowSceneStatusBarSettingsAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"settings"];
  v3 = *(void **)(a1 + 32);
  v4 = SBWindowSceneStatusBarSettingsLevelDescription(*(void *)(*(void *)(a1 + 40) + 16));
  id v5 = (id)[v3 appendObject:v4 withName:@"level"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"reason"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBWindowSceneStatusBarSettingsAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(SBWindowSceneStatusBarSettingsAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SBWindowSceneStatusBarSettingsAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBWindowSceneStatusBarSettingsAssertion)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBWindowSceneStatusBarSettingsAssertion.m" lineNumber:30 description:@"use initWithSettings:..."];

  return 0;
}

- (void)dealloc
{
  [(SBWindowSceneStatusBarSettingsAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBWindowSceneStatusBarSettingsAssertion;
  [(SBWindowSceneStatusBarSettingsAssertion *)&v3 dealloc];
}

- (void)modifySettingsWithBlock:(id)a3
{
}

- (void)invalidate
{
}

- (void)invalidateWithAnimationParameters:(id)a3
{
  p_assertionManager = &self->_assertionManager;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_assertionManager);
  [WeakRetained _removeStatusBarSettingsAssertion:self withAnimationParameters:v5];
}

- (id)succinctDescription
{
  id v2 = [(SBWindowSceneStatusBarSettingsAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (NSString)reason
{
  return self->_reason;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (SBWindowSceneStatusBarAssertionManager)assertionManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_assertionManager);
  return (SBWindowSceneStatusBarAssertionManager *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_destroyWeak((id *)&self->_assertionManager);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end