@interface _UISystemInputActivityManager
- (BSSimpleAssertion)_activeSystemInputInteraction;
- (UIScene)_scene;
- (_UISystemInputActivityManager)initWithScene:(id)a3;
- (id)beginTrackingSystemInputActivity;
- (id)windowHostingScene;
- (void)_setScene:(id)a3;
- (void)_updateClientSettingsSystemInputActive:(BOOL)a3;
- (void)set_activeSystemInputInteraction:(id)a3;
@end

@implementation _UISystemInputActivityManager

- (_UISystemInputActivityManager)initWithScene:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISystemInputActivityManager;
  v5 = [(_UISystemInputActivityManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scene, v4);
  }

  return v6;
}

- (id)beginTrackingSystemInputActivity
{
  v3 = [(_UISystemInputActivityManager *)self _activeSystemInputInteraction];
  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = objc_alloc(MEMORY[0x1E4F4F838]);
    uint64_t v5 = MEMORY[0x1E4F14428];
    id v6 = MEMORY[0x1E4F14428];
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v10 = __65___UISystemInputActivityManager_beginTrackingSystemInputActivity__block_invoke;
    v11 = &unk_1E52E04F8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)[v4 initWithIdentifier:@"SystemInputActivity" forReason:@"Active System Input Interaction" queue:v5 invalidationBlock:&v8];

    -[_UISystemInputActivityManager set_activeSystemInputInteraction:](self, "set_activeSystemInputInteraction:", v3, v8, v9, v10, v11);
    [(_UISystemInputActivityManager *)self _updateClientSettingsSystemInputActive:1];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (id)windowHostingScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return WeakRetained;
}

- (void)_updateClientSettingsSystemInputActive:(BOOL)a3
{
  int v3 = a3;
  id v4 = [(_UISystemInputActivityManager *)self windowHostingScene];
  uint64_t v5 = v4;
  if (v4)
  {
    if (([v4 _hasInvalidated] & 1) == 0)
    {
      id v6 = [v5 _effectiveUIClientSettings];
      int v7 = [v6 systemInputActive];

      if (v7 != v3)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __72___UISystemInputActivityManager__updateClientSettingsSystemInputActive___block_invoke;
        v8[3] = &__block_descriptor_33_e49_v16__0__UIMutableApplicationSceneClientSettings_8l;
        char v9 = v3;
        [v5 _updateUIClientSettingsWithBlock:v8];
      }
    }
  }
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)_setScene:(id)a3
{
}

- (BSSimpleAssertion)_activeSystemInputInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__activeSystemInputInteraction);
  return (BSSimpleAssertion *)WeakRetained;
}

- (void)set_activeSystemInputInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__activeSystemInputInteraction);
  objc_destroyWeak((id *)&self->_scene);
}

@end