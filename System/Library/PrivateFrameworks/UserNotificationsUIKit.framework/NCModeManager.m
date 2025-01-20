@interface NCModeManager
- (NCModeManager)init;
- (id)currentModeConfiguration;
- (void)_fetchCurrentModeConfiguration;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_updateWithModeConfiguration:(id)a3 previousModeConfiguration:(id)a4;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setModeConfiguration:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation NCModeManager

- (NCModeManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)NCModeManager;
  v2 = [(NCModeManager *)&v13 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    v4 = [v3 bundleIdentifier];
    int v5 = [v4 isEqualToString:@"com.apple.internal.NotificationsUITool"];

    if (v5) {
      v6 = @"com.apple.internal.NotificationsUITool.NCModeManager";
    }
    else {
      v6 = @"com.apple.springboard.NCModeManager";
    }
    uint64_t v7 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:v6];
    stateService = v2->_stateService;
    v2->_stateService = (DNDStateService *)v7;

    [(DNDStateService *)v2->_stateService addStateUpdateListener:v2 withCompletionHandler:0];
    uint64_t v9 = [MEMORY[0x1E4F5F690] serviceForClientIdentifier:v6];
    modeConfigurationService = v2->_modeConfigurationService;
    v2->_modeConfigurationService = (DNDModeConfigurationService *)v9;

    [(DNDModeConfigurationService *)v2->_modeConfigurationService addListener:v2 withCompletionHandler:0];
    currentModeConfiguration = v2->_currentModeConfiguration;
    v2->_currentModeConfiguration = 0;

    [(NCModeManager *)v2 _fetchCurrentModeConfiguration];
  }
  return v2;
}

- (void)dealloc
{
  [(DNDModeConfigurationService *)self->_modeConfigurationService removeListener:self];
  v3.receiver = self;
  v3.super_class = (Class)NCModeManager;
  [(NCModeManager *)&v3 dealloc];
}

- (id)currentModeConfiguration
{
  return self->_currentModeConfiguration;
}

- (void)setModeConfiguration:(id)a3
{
  modeConfigurationService = self->_modeConfigurationService;
  uint64_t v4 = 0;
  [(DNDModeConfigurationService *)modeConfigurationService setModeConfiguration:a3 error:&v4];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    uint64_t v9 = v4;
    if (!observers)
    {
      v6 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
      uint64_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v9];
    v8 = [(NCModeManager *)self currentModeConfiguration];
    [v9 modeManager:self didUpdateCurrentModeConfiguration:v8 previousModeConfiguration:0];

    id v4 = v9;
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    observers = self->_observers;
    if (observers) {
      -[NSHashTable removeObject:](observers, "removeObject:");
    }
  }
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  id v5 = a4;
  v6 = [v5 state];
  id v9 = [v6 activeModeConfiguration];

  uint64_t v7 = [v5 previousState];

  v8 = [v7 activeModeConfiguration];

  [(NCModeManager *)self _updateWithModeConfiguration:v9 previousModeConfiguration:v8];
}

- (void)_fetchCurrentModeConfiguration
{
  objc_super v3 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__NCModeManager__fetchCurrentModeConfiguration__block_invoke;
  block[3] = &unk_1E6A91BB0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __47__NCModeManager__fetchCurrentModeConfiguration__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = 0;
  objc_super v3 = [v2 queryCurrentStateWithError:&v6];
  id v4 = v6;
  id v5 = [v3 activeModeConfiguration];
  [*(id *)(a1 + 32) _updateWithModeConfiguration:v5 previousModeConfiguration:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)_updateWithModeConfiguration:(id)a3 previousModeConfiguration:(id)a4
{
  uint64_t v7 = (DNDModeConfiguration *)a3;
  id v8 = a4;
  if (self->_currentModeConfiguration != v7)
  {
    objc_storeStrong((id *)&self->_currentModeConfiguration, a3);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke;
    block[3] = &unk_1E6A93A88;
    block[4] = self;
    v10 = v7;
    id v11 = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke_2;
  v3[3] = &unk_1E6A950D8;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 _notifyObserversWithBlock:v3];
}

uint64_t __72__NCModeManager__updateWithModeConfiguration_previousModeConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 modeManager:a2 didUpdateCurrentModeConfiguration:*(void *)(a1 + 32) previousModeConfiguration:*(void *)(a1 + 40)];
}

- (void)_notifyObserversWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, NCModeManager *, void))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v6 = (id)[(NSHashTable *)observers copy];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7)
      {
        uint64_t v8 = *(void *)v14;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v14 != v8) {
              objc_enumerationMutation(v6);
            }
            uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
            id v11 = objc_initWeak(&location, self);
            v4[2](v4, self, v10);

            objc_destroyWeak(&location);
            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModeConfiguration, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_modeConfigurationService, 0);

  objc_storeStrong((id *)&self->_stateService, 0);
}

@end