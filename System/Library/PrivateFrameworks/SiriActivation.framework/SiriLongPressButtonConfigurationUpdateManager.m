@interface SiriLongPressButtonConfigurationUpdateManager
- (BOOL)monitoringForUpdates;
- (NSMapTable)delegatesBySource;
- (SiriLongPressButtonConfigurationUpdateManager)init;
- (id)userDefaults;
- (int64_t)currentLongPressBehavior;
- (void)_addDelegate:(id)a3 forSource:(id)a4;
- (void)_setupKVOMonitoring;
- (void)_stopKVOMonitoring;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentLongPressBehavior:(int64_t)a3;
- (void)setDelegatesBySource:(id)a3;
- (void)setMonitoringForUpdates:(BOOL)a3;
- (void)startManagingConfigurationFromSource:(id)a3 withDelegate:(id)a4;
- (void)stopManagingAllConfigurations;
- (void)stopManagingConfigurationFromSource:(id)a3;
@end

@implementation SiriLongPressButtonConfigurationUpdateManager

- (SiriLongPressButtonConfigurationUpdateManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
  v2 = [(SiriLongPressButtonConfigurationUpdateManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    delegatesBySource = v2->_delegatesBySource;
    v2->_delegatesBySource = (NSMapTable *)v3;

    v2->_currentLongPressBehavior = 0;
  }
  return v2;
}

- (void)dealloc
{
  internalUserDefaults = self->_internalUserDefaults;
  if (internalUserDefaults) {
    [(NSUserDefaults *)internalUserDefaults removeObserver:self forKeyPath:@"SiriHardwareButtonLongPressBehavior"];
  }
  v4.receiver = self;
  v4.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
  [(SiriLongPressButtonConfigurationUpdateManager *)&v4 dealloc];
}

- (void)startManagingConfigurationFromSource:(id)a3 withDelegate:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!self->_monitoringForUpdates) {
    [(SiriLongPressButtonConfigurationUpdateManager *)self _setupKVOMonitoring];
  }
  [(SiriLongPressButtonConfigurationUpdateManager *)self _addDelegate:v6 forSource:v9];
  v7 = [v9 configuration];
  NSLog(&cfstr_Configurationu.isa, self->_currentLongPressBehavior, [v7 longPressBehavior]);
  if (v7)
  {
    int64_t currentLongPressBehavior = self->_currentLongPressBehavior;
    if (currentLongPressBehavior != [v7 longPressBehavior])
    {
      [v7 setLongPressBehavior:self->_currentLongPressBehavior];
      [v9 setConfiguration:v7];
      [v6 configurationUpdateManager:self configurationDidUpdateForLongPressSource:v9];
    }
  }
}

- (void)stopManagingConfigurationFromSource:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(NSMapTable *)self->_delegatesBySource removeObjectForKey:v4];
    if (![(NSMapTable *)self->_delegatesBySource count]) {
      [(SiriLongPressButtonConfigurationUpdateManager *)self _stopKVOMonitoring];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)stopManagingAllConfigurations
{
  [(NSMapTable *)self->_delegatesBySource removeAllObjects];
  [(SiriLongPressButtonConfigurationUpdateManager *)self _stopKVOMonitoring];
  internalUserDefaults = self->_internalUserDefaults;
  self->_internalUserDefaults = 0;
}

- (id)userDefaults
{
  internalUserDefaults = self->_internalUserDefaults;
  if (!internalUserDefaults)
  {
    id v4 = (NSUserDefaults *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SiriViewService"];
    v5 = self->_internalUserDefaults;
    self->_internalUserDefaults = v4;

    internalUserDefaults = self->_internalUserDefaults;
  }
  return internalUserDefaults;
}

- (void)_addDelegate:(id)a3 forSource:(id)a4
{
  if (a4) {
    -[NSMapTable setObject:forKey:](self->_delegatesBySource, "setObject:forKey:", a3);
  }
}

- (void)_setupKVOMonitoring
{
  self->_monitoringForUpdates = 1;
  uint64_t v3 = [(SiriLongPressButtonConfigurationUpdateManager *)self userDefaults];
  [v3 addObserver:self forKeyPath:@"SiriHardwareButtonLongPressBehavior" options:1 context:0];

  id v5 = [(SiriLongPressButtonConfigurationUpdateManager *)self userDefaults];
  id v4 = [v5 objectForKey:@"SiriHardwareButtonLongPressBehavior"];
  self->_int64_t currentLongPressBehavior = [v4 integerValue];
}

- (void)_stopKVOMonitoring
{
  self->_monitoringForUpdates = 0;
  id v3 = [(SiriLongPressButtonConfigurationUpdateManager *)self userDefaults];
  [v3 removeObserver:self forKeyPath:@"SiriHardwareButtonLongPressBehavior"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"SiriHardwareButtonLongPressBehavior"])
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__SiriLongPressButtonConfigurationUpdateManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6B67B00;
    objc_copyWeak(&v17, &location);
    id v15 = v12;
    id v16 = v10;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SiriLongPressButtonConfigurationUpdateManager;
    [(SiriLongPressButtonConfigurationUpdateManager *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __96__SiriLongPressButtonConfigurationUpdateManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    NSLog(&cfstr_Configurationu_0.isa, *(void *)(a1 + 40), v3);
    id v4 = [MEMORY[0x1E4F1CA98] null];
    char v5 = [v3 isEqual:v4];

    if ((v5 & 1) == 0)
    {
      id v16 = v3;
      uint64_t v6 = [v3 integerValue];
      *((void *)WeakRetained + 3) = v6;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v7 = [*((id *)WeakRetained + 4) keyEnumerator];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            objc_super v13 = [*((id *)WeakRetained + 4) objectForKey:v12];
            if (v12)
            {
              v14 = [v12 configuration];
              uint64_t v15 = [v14 longPressBehavior];
              [v14 setLongPressBehavior:v6];
              [v12 setConfiguration:v14];
              if (v15 != v6) {
                [v13 configurationUpdateManager:WeakRetained configurationDidUpdateForLongPressSource:v12];
              }
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      id v3 = v16;
    }
  }
}

- (int64_t)currentLongPressBehavior
{
  return self->_currentLongPressBehavior;
}

- (void)setCurrentLongPressBehavior:(int64_t)a3
{
  self->_int64_t currentLongPressBehavior = a3;
}

- (BOOL)monitoringForUpdates
{
  return self->_monitoringForUpdates;
}

- (void)setMonitoringForUpdates:(BOOL)a3
{
  self->_monitoringForUpdates = a3;
}

- (NSMapTable)delegatesBySource
{
  return self->_delegatesBySource;
}

- (void)setDelegatesBySource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegatesBySource, 0);
  objc_storeStrong((id *)&self->_internalUserDefaults, 0);
}

@end