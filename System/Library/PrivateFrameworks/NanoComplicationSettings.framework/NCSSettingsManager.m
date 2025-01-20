@interface NCSSettingsManager
+ (id)sharedSettingsManager;
- (NCSSettingsManager)init;
- (NCSSettingsManagerDelegate)delegate;
- (id)_fetchSockPuppetComplications;
- (void)_updateSockPuppetComplications;
- (void)dealloc;
- (void)loadSettings;
- (void)setDelegate:(id)a3;
@end

@implementation NCSSettingsManager

+ (id)sharedSettingsManager
{
  if (sharedSettingsManager_onceToken != -1) {
    dispatch_once(&sharedSettingsManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedSettingsManager_sharedManager;
  return v2;
}

uint64_t __43__NCSSettingsManager_sharedSettingsManager__block_invoke()
{
  sharedSettingsManager_sharedManager = objc_alloc_init(NCSSettingsManager);
  return MEMORY[0x270F9A758]();
}

- (NCSSettingsManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)NCSSettingsManager;
  v2 = [(NCSInternalSettingsManager *)&v9 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PairedDeviceChanged, (CFStringRef)*MEMORY[0x263F576F0], 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, v2, (CFNotificationCallback)ComplicationSettingsChanged, @"NCSSettingsChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)ApplicationsChanged, (CFStringRef)*MEMORY[0x263F017F8], 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)SPApplicationsChanged, (CFStringRef)*MEMORY[0x263F24EA8], 0, (CFNotificationSuspensionBehavior)0);
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:v2 selector:sel__handleLocaleChange_ name:*MEMORY[0x263EFF458] object:0];

    [(NCSSettingsManager *)v2 loadSettings];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"NCSSettingsChangedNotification", 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F017F8], 0);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x263F24EA8], 0);
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)NCSSettingsManager;
  [(NCSSettingsManager *)&v7 dealloc];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ([(NCSInternalSettingsManager *)self hasSettings])
    {
      v5 = [(NCSSettingsManager *)self delegate];
      [v5 settingsManagerReloadedComplications:self];
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)loadSettings
{
  v4.receiver = self;
  v4.super_class = (Class)NCSSettingsManager;
  [(NCSInternalSettingsManager *)&v4 loadSettings];
  [(NCSSettingsManager *)self _updateSockPuppetComplications];
  if ([(NCSInternalSettingsManager *)self hasSettings])
  {
    v3 = [(NCSSettingsManager *)self delegate];
    [v3 settingsManagerReloadedComplications:self];
  }
}

- (void)_updateSockPuppetComplications
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(NCSSettingsManager *)self _fetchSockPuppetComplications];
  objc_super v4 = (void *)[v3 mutableCopy];

  v5 = [MEMORY[0x263EFF980] array];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __52__NCSSettingsManager__updateSockPuppetComplications__block_invoke;
  v17[3] = &unk_264E1A170;
  id v6 = v4;
  id v18 = v6;
  id v7 = v5;
  id v19 = v7;
  [(NCSInternalSettingsManager *)self enumerateAllComplicationDefinitionsUsingBlock:v17];
  [(NCSInternalSettingsManager *)self removeComplicationDefinitionsInArray:v7];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(v6, "allValues", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NCSInternalSettingsManager *)self addComplicationDefinition:*(void *)(*((void *)&v13 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v20 count:16];
    }
    while (v10);
  }

  [(NCSInternalSettingsManager *)self saveSettings];
}

void __52__NCSSettingsManager__updateSockPuppetComplications__block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = [v19 sockPuppetIdentifier];

  if (v3)
  {
    objc_super v4 = *(void **)(a1 + 32);
    v5 = [v19 sockPuppetIdentifier];
    id v6 = [v4 objectForKeyedSubscript:v5];

    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      v8 = [v19 sockPuppetIdentifier];
      uint64_t v9 = [v7 objectForKeyedSubscript:v8];

      uint64_t v10 = [v9 name];
      [v19 setName:v10];

      uint64_t v11 = [v9 appBundleIdentifier];
      [v19 setAppBundleIdentifier:v11];

      uint64_t v12 = [v19 installState];
      if (v12 != [v9 installState])
      {
        if (([v19 isActive] & 1) == 0 && objc_msgSend(v9, "installState") == 2) {
          [v19 setActive:1];
        }
        objc_msgSend(v19, "setInstallState:", objc_msgSend(v9, "installState"));
      }
      long long v13 = (void *)MEMORY[0x263F01868];
      long long v14 = [v19 appBundleIdentifier];
      long long v15 = [v13 applicationProxyForIdentifier:v14];

      if (v15)
      {
        long long v16 = [v15 localizedName];
        [v19 setName:v16];
      }
      v17 = *(void **)(a1 + 32);
      id v18 = [v19 sockPuppetIdentifier];
      [v17 removeObjectForKey:v18];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v19];
    }
  }
}

- (id)_fetchSockPuppetComplications
{
  v2 = [MEMORY[0x263F24EB0] sharedDeviceConnection];
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__0;
  v35[4] = __Block_byref_object_dispose__0;
  id v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__0;
  v33 = __Block_byref_object_dispose__0;
  id v34 = 0;
  v3 = dispatch_queue_create("com.apple.nano-complications.sockpuppet-loader", MEMORY[0x263EF83A8]);
  dispatch_group_t v4 = dispatch_group_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke;
  block[3] = &unk_264E1A1C0;
  v5 = v4;
  v26 = v5;
  id v6 = v2;
  id v27 = v6;
  v28 = v35;
  dispatch_sync(v3, block);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_3;
  v21[3] = &unk_264E1A1C0;
  id v7 = v5;
  v22 = v7;
  id v8 = v6;
  id v23 = v8;
  v24 = &v29;
  dispatch_sync(v3, v21);
  uint64_t v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend((id)v30[5], "count"));
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_5;
  v16[3] = &unk_264E1A1E8;
  id v19 = &v29;
  v20 = v35;
  id v11 = v9;
  id v17 = v11;
  dispatch_semaphore_t v18 = v10;
  uint64_t v12 = v10;
  dispatch_group_notify(v7, v3, v16);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_t v13 = v18;
  id v14 = v11;

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  return v14;
}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_2;
  v3[3] = &unk_264E1A198;
  v2 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  [v2 fetchInstalledApplicationsForPairedDevice:0 completion:v3];
}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_3(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_4;
  v3[3] = &unk_264E1A198;
  v2 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  [v2 fetchInstalledComplicationsForPairedDevice:0 completion:v3];
}

void __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

intptr_t __51__NCSSettingsManager__fetchSockPuppetComplications__block_invoke_5(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v2 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v20 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v6];
        id v8 = [v7 objectForKeyedSubscript:@"s"];
        int v9 = [v8 intValue];

        dispatch_semaphore_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) objectForKeyedSubscript:v6];
        id v11 = objc_alloc_init(NCSComplication);
        uint64_t v12 = [v7 objectForKeyedSubscript:@"CFBundleName"];
        [(NCSComplication *)v11 setName:v12];

        dispatch_semaphore_t v13 = [v10 objectForKeyedSubscript:@"SPContainerAppBundleId"];
        [(NCSComplication *)v11 setAppBundleIdentifier:v13];

        [(NCSComplication *)v11 setComplicationBundleIdentifier:@"NCSSockPuppetBundleIdentifier"];
        [(NCSComplication *)v11 setActive:1];
        id v14 = [v7 objectForKeyedSubscript:@"CFBundleIdentifier"];
        [(NCSComplication *)v11 setSockPuppetIdentifier:v14];

        [(NCSComplication *)v11 setInstallState:2 * ((v9 & 0xFFFFFFFE) == 2)];
        long long v15 = *(void **)(a1 + 32);
        long long v16 = [(NCSComplication *)v11 sockPuppetIdentifier];
        [v15 setObject:v11 forKeyedSubscript:v16];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v3);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (NCSSettingsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NCSSettingsManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end