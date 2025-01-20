@interface SRUIFCachedPreferences
+ (id)sharedInstance;
- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled;
- (BOOL)assetsDownloading;
- (BOOL)assetsNeedSpace;
- (BOOL)isHoldToTalkForTextInputEnabled;
- (BOOL)isSiriSafeForLockScreen;
- (BOOL)isStreamingDictationEnabled;
- (BOOL)understandingOnDeviceAssetsAvailable;
- (NSDictionary)assistantUODStatus;
- (SRUIFCachedPreferences)init;
- (UAFAssetStatus)assetStatus;
- (void)_notifyObserversOfSettingsChangeWithBlock:(id)a3;
- (void)_setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleAssetStatusUpdated;
- (void)init;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setAssetStatus:(id)a3;
- (void)setAssistantUODStatus:(id)a3;
- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3;
- (void)siriUODAvailabilityDidChange:(BOOL)a3;
- (void)siriUODStatusDidChange;
- (void)updatePreferences;
@end

@implementation SRUIFCachedPreferences

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__SRUIFCachedPreferences_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __40__SRUIFCachedPreferences_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (SRUIFCachedPreferences)init
{
  v16.receiver = self;
  v16.super_class = (Class)SRUIFCachedPreferences;
  v2 = [(SRUIFCachedPreferences *)&v16 init];
  if (v2)
  {
    v3 = (os_log_t *)MEMORY[0x263F28348];
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG)) {
      -[SRUIFCachedPreferences init](v4);
    }
    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("SRUIFCachedPreferences", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.textinput"];
    textInputDefaults = v2->_textInputDefaults;
    v2->_textInputDefaults = (NSUserDefaults *)v9;

    [(NSUserDefaults *)v2->_textInputDefaults addObserver:v2 forKeyPath:@"SiriUITextInputEnabled" options:5 context:&SRUIFCachedPreferencesContext];
    [(NSUserDefaults *)v2->_textInputDefaults addObserver:v2 forKeyPath:@"SiriUITextInputHTTEnabled" options:5 context:&SRUIFCachedPreferencesContext];
    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel_updatePreferences name:*MEMORY[0x263F28318] object:0];

    [(SRUIFCachedPreferences *)v2 updatePreferences];
    v2->_understandingOnDeviceAssetsAvailable = 1;
    v12 = (UAFAssetUtilities *)objc_alloc_init(MEMORY[0x263F84088]);
    assetUtilities = v2->_assetUtilities;
    v2->_assetUtilities = v12;

    [(UAFAssetUtilities *)v2->_assetUtilities setDelegate:v2];
    [(UAFAssetUtilities *)v2->_assetUtilities startObserversWithOptions:17];
    v14 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG)) {
      -[SRUIFCachedPreferences init](v14);
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(NSUserDefaults *)self->_textInputDefaults removeObserver:self forKeyPath:@"SiriUITextInputEnabled" context:&SRUIFCachedPreferencesContext];
  [(NSUserDefaults *)self->_textInputDefaults removeObserver:self forKeyPath:@"SiriUITextInputHTTEnabled" context:&SRUIFCachedPreferencesContext];
  [(NSHashTable *)self->_observers removeAllObjects];
  v4.receiver = self;
  v4.super_class = (Class)SRUIFCachedPreferences;
  [(SRUIFCachedPreferences *)&v4 dealloc];
}

- (void)updatePreferences
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[SRUIFCachedPreferences updatePreferences]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s Syncing cached SiriUIPreferences.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__SRUIFCachedPreferences_updatePreferences__block_invoke;
  block[3] = &unk_264785A20;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __43__SRUIFCachedPreferences_updatePreferences__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[17] = AFPreferencesStreamingDictationEnabled();
    v3 = [MEMORY[0x263F285A0] sharedPreferences];
    WeakRetained[18] = [v3 disableAssistantWhilePasscodeLocked] ^ 1;

    objc_super v4 = [MEMORY[0x263F285A0] sharedPreferences];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __43__SRUIFCachedPreferences_updatePreferences__block_invoke_2;
    v5[3] = &unk_2647866F0;
    objc_copyWeak(&v6, v1);
    [v4 getAnnounceNotificationsInCarPlayTemporarilyDisabledWithCompletion:v5];

    objc_destroyWeak(&v6);
  }
}

void __43__SRUIFCachedPreferences_updatePreferences__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _setAnnounceNotificationsInCarPlayTemporarilyDisabled:a2];
    id WeakRetained = v4;
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SRUIFCachedPreferences_addObserver___block_invoke;
  block[3] = &unk_264785A48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __38__SRUIFCachedPreferences_addObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[4] addObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SRUIFCachedPreferences_removeObserver___block_invoke;
  block[3] = &unk_264785A48;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__SRUIFCachedPreferences_removeObserver___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[4] removeObject:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (BOOL)isHoldToTalkForTextInputEnabled
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__SRUIFCachedPreferences_isHoldToTalkForTextInputEnabled__block_invoke;
  block[3] = &unk_264786718;
  objc_copyWeak(&v6, &location);
  void block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __57__SRUIFCachedPreferences_isHoldToTalkForTextInputEnabled__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[16];
  }
}

- (BOOL)isStreamingDictationEnabled
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SRUIFCachedPreferences_isStreamingDictationEnabled__block_invoke;
  block[3] = &unk_264786718;
  objc_copyWeak(&v6, &location);
  void block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __53__SRUIFCachedPreferences_isStreamingDictationEnabled__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[17];
  }
}

- (BOOL)isSiriSafeForLockScreen
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SRUIFCachedPreferences_isSiriSafeForLockScreen__block_invoke;
  block[3] = &unk_264786718;
  objc_copyWeak(&v6, &location);
  void block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __49__SRUIFCachedPreferences_isSiriSafeForLockScreen__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[18];
  }
}

- (BOOL)announceNotificationsInCarPlayTemporarilyDisabled
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__SRUIFCachedPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke;
  block[3] = &unk_264786718;
  objc_copyWeak(&v6, &location);
  void block[4] = &v8;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((unsigned char *)v9 + 24);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v8, 8);
  return (char)queue;
}

void __75__SRUIFCachedPreferences_announceNotificationsInCarPlayTemporarilyDisabled__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[19];
  }
}

- (BOOL)assetsNeedSpace
{
  v2 = [(SRUIFCachedPreferences *)self assetStatus];
  BOOL v3 = [v2 state] == 6;

  return v3;
}

- (BOOL)assetsDownloading
{
  v2 = [(SRUIFCachedPreferences *)self assetStatus];
  BOOL v3 = [v2 state] == 3;

  return v3;
}

- (BOOL)understandingOnDeviceAssetsAvailable
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__SRUIFCachedPreferences_understandingOnDeviceAssetsAvailable__block_invoke;
  v5[3] = &unk_264786740;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__SRUIFCachedPreferences_understandingOnDeviceAssetsAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

- (UAFAssetStatus)assetStatus
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__SRUIFCachedPreferences_assetStatus__block_invoke;
  v5[3] = &unk_264786740;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (UAFAssetStatus *)v3;
}

void __37__SRUIFCachedPreferences_assetStatus__block_invoke(uint64_t a1)
{
}

- (NSDictionary)assistantUODStatus
{
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SRUIFCachedPreferences_assistantUODStatus__block_invoke;
  v5[3] = &unk_264786740;
  void v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __44__SRUIFCachedPreferences_assistantUODStatus__block_invoke(uint64_t a1)
{
}

- (void)siriUODStatusDidChange
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SRUIFCachedPreferences_siriUODStatusDidChange__block_invoke;
  v4[3] = &unk_264785A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SRUIFCachedPreferences_siriUODStatusDidChange__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [*((id *)WeakRetained + 5) assistantUODStatus];
    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v2[7];
      int v6 = 136315650;
      dispatch_queue_t v7 = "-[SRUIFCachedPreferences siriUODStatusDidChange]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating assistant UOD status from %@ to %@", (uint8_t *)&v6, 0x20u);
    }
    [v2 setAssistantUODStatus:v3];
  }
}

- (void)siriUODAvailabilityDidChange:(BOOL)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SRUIFCachedPreferences_siriUODAvailabilityDidChange___block_invoke;
  block[3] = &unk_264785F28;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__SRUIFCachedPreferences_siriUODAvailabilityDidChange___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = WeakRetained[48];
      int v5 = *(unsigned __int8 *)(a1 + 40);
      int v6 = 136315650;
      id v7 = "-[SRUIFCachedPreferences siriUODAvailabilityDidChange:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = v4;
      __int16 v10 = 1024;
      int v11 = v5;
      _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s Updating UOD assets available from %{BOOL}d to %{BOOL}d", (uint8_t *)&v6, 0x18u);
    }
    [WeakRetained setUnderstandingOnDeviceAssetsAvailable:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)handleAssetStatusUpdated
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SRUIFCachedPreferences_handleAssetStatusUpdated__block_invoke;
  v4[3] = &unk_264785A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__SRUIFCachedPreferences_handleAssetStatusUpdated__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [*((id *)WeakRetained + 5) currentAssetStatus];
    int v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = v2[8];
      int v6 = 136315650;
      id v7 = "-[SRUIFCachedPreferences handleAssetStatusUpdated]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      int v11 = v3;
      _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating assets status from %@ to %@", (uint8_t *)&v6, 0x20u);
    }
    [v2 setAssetStatus:v3];
  }
}

- (void)_setAnnounceNotificationsInCarPlayTemporarilyDisabled:(BOOL)a3
{
  if ([(SRUIFCachedPreferences *)self announceNotificationsInCarPlayTemporarilyDisabled] != a3)
  {
    self->_announceNotificationsInCarPlayTemporarilyDisabled = a3;
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __80__SRUIFCachedPreferences__setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke;
    v5[3] = &unk_264786768;
    objc_copyWeak(&v6, &location);
    BOOL v7 = a3;
    [(SRUIFCachedPreferences *)self _notifyObserversOfSettingsChangeWithBlock:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __80__SRUIFCachedPreferences__setAnnounceNotificationsInCarPlayTemporarilyDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [v4 cachedPreferences:WeakRetained announceNotificationsInCarPlayTemporarilyDisabledChanged:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  int v11 = (NSUserDefaults *)a4;
  id v12 = a5;
  if (a6 == &SRUIFCachedPreferencesContext)
  {
    if (self->_textInputDefaults == v11)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __73__SRUIFCachedPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_264785F50;
      id v16 = v10;
      v17 = self;
      dispatch_async(queue, block);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SRUIFCachedPreferences;
    [(SRUIFCachedPreferences *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

void __73__SRUIFCachedPreferences_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:@"SiriUITextInputHTTEnabled"])
  {
    id v2 = [*(id *)(*(void *)(a1 + 40) + 8) objectForKey:@"SiriUITextInputHTTEnabled"];
    *(unsigned char *)(*(void *)(a1 + 40) + 16) = [v2 BOOLValue];
  }
}

- (void)_notifyObserversOfSettingsChangeWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v5 = self->_observers;
    uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)setUnderstandingOnDeviceAssetsAvailable:(BOOL)a3
{
  self->_understandingOnDeviceAssetsAvailable = a3;
}

- (void)setAssistantUODStatus:(id)a3
{
}

- (void)setAssetStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetStatus, 0);
  objc_storeStrong((id *)&self->_assistantUODStatus, 0);
  objc_storeStrong((id *)&self->_assetUtilities, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_textInputDefaults, 0);
}

- (void)init
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[SRUIFCachedPreferences init]";
  _os_log_debug_impl(&dword_225FBA000, log, OS_LOG_TYPE_DEBUG, "%s Initializing...", (uint8_t *)&v1, 0xCu);
}

@end