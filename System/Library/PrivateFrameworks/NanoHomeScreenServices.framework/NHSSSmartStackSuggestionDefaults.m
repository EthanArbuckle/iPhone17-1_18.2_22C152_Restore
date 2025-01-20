@interface NHSSSmartStackSuggestionDefaults
+ (NHSSSmartStackSuggestionDefaults)sharedInstance;
- (BOOL)appSuggestionsEnabledForContainerBundleIdentifier:(id)a3;
- (BOOL)clearWidgetAlertAcknowledged;
- (BOOL)globalSuggestionsEnabled;
- (BOOL)soundDetectionButtonDismissedOnce;
- (BOOL)widgetSuggestionsEnabledForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5;
- (NHSSSmartStackSuggestionDefaults)init;
- (double)defaultMuteForHourDuration;
- (double)defaultMuteForTodayDuration;
- (id)_compositeKeyWithContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5;
- (id)widgetSuggestionsUnmuteDateForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5;
- (void)_cleanUpExpiredMutePreferences;
- (void)_mainQueue_notifyObserversDefaultsDidChange;
- (void)_observeChangesToUserDefaults;
- (void)_requestUserDefaultsSyncForKey:(id)a3;
- (void)_scheduleTimerToUnmuteWidgetForKey:(id)a3 onDate:(id)a4;
- (void)_scheduleTimersToUnmuteWidgets;
- (void)addObserver:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setAppSuggestionsEnabled:(BOOL)a3 forContainerBundleIdentifier:(id)a4;
- (void)setClearWidgetAlertAcknowledged:(BOOL)a3;
- (void)setGlobalSuggestionsEnabled:(BOOL)a3;
- (void)setSoundDetectionButtonDismissedOnce:(BOOL)a3;
- (void)setWidgetSuggestionsEnabled:(BOOL)a3 forContainerBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 kind:(id)a6;
- (void)setWidgetSuggestionsUnmuteDate:(id)a3 forContainerBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 kind:(id)a6;
@end

@implementation NHSSSmartStackSuggestionDefaults

+ (NHSSSmartStackSuggestionDefaults)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return (NHSSSmartStackSuggestionDefaults *)v2;
}

uint64_t __50__NHSSSmartStackSuggestionDefaults_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = objc_alloc_init(NHSSSmartStackSuggestionDefaults);
  return MEMORY[0x270F9A758]();
}

- (NHSSSmartStackSuggestionDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)NHSSSmartStackSuggestionDefaults;
  v2 = [(NHSSSmartStackSuggestionDefaults *)&v10 init];
  if (v2)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"NHSSSmartStackSuggestionDefaults is unsupported on companion"];
    uint64_t v3 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    lock_observers = v2->_lock_observers;
    v2->_lock_observers = (NSHashTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    lock_scheduledTimers = v2->_lock_scheduledTimers;
    v2->_lock_scheduledTimers = (NSMapTable *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.NanoHomeScreen.SmartStackSuggestions"];
    lock_userDefaults = v2->_lock_userDefaults;
    v2->_lock_userDefaults = (NSUserDefaults *)v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    [(NHSSSmartStackSuggestionDefaults *)v2 _cleanUpExpiredMutePreferences];
    [(NHSSSmartStackSuggestionDefaults *)v2 _observeChangesToUserDefaults];
    [(NHSSSmartStackSuggestionDefaults *)v2 _scheduleTimersToUnmuteWidgets];
  }
  return v2;
}

- (BOOL)clearWidgetAlertAcknowledged
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"clearWidgetAlertAcknowledged"];
  uint64_t v5 = (void *)v4;
  v6 = (void *)MEMORY[0x263EFFA80];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_lock);
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setClearWidgetAlertAcknowledged:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v4 forKey:@"clearWidgetAlertAcknowledged"];
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)soundDetectionButtonDismissedOnce
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"soundDetectionButtonDismissedOnce"];
  uint64_t v5 = (void *)v4;
  v6 = (void *)MEMORY[0x263EFFA80];
  if (v4) {
    v6 = (void *)v4;
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_lock);
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setSoundDetectionButtonDismissedOnce:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v4 forKey:@"soundDetectionButtonDismissedOnce"];
  os_unfair_lock_unlock(&self->_lock);
}

- (double)defaultMuteForHourDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"defaultMuteForHourDuration"];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 3600.0;
  }

  return v6;
}

- (double)defaultMuteForTodayDuration
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"defaultMuteForTodayDuration"];
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 86400.0;
  }

  return v6;
}

- (BOOL)globalSuggestionsEnabled
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"global"];
  double v5 = (void *)v4;
  double v6 = (void *)MEMORY[0x263EFFA88];
  if (v4) {
    double v6 = (void *)v4;
  }
  id v7 = v6;

  os_unfair_lock_unlock(p_lock);
  char v8 = [v7 BOOLValue];

  return v8;
}

- (void)setGlobalSuggestionsEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  os_unfair_lock_lock(&self->_lock);
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v4 forKey:@"global"];
  os_unfair_lock_unlock(&self->_lock);
  [(NHSSSmartStackSuggestionDefaults *)self _requestUserDefaultsSyncForKey:@"global"];
}

- (BOOL)appSuggestionsEnabledForContainerBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"app"];
  id v7 = (void *)v6;
  char v8 = (void *)MEMORY[0x263EFFA78];
  if (v6) {
    char v8 = (void *)v6;
  }
  id v9 = v8;

  os_unfair_lock_unlock(p_lock);
  objc_super v10 = [v9 objectForKey:v5];

  v11 = (void *)MEMORY[0x263EFFA88];
  if (v10) {
    v11 = v10;
  }
  id v12 = v11;

  char v13 = [v12 BOOLValue];
  return v13;
}

- (void)setAppSuggestionsEnabled:(BOOL)a3 forContainerBundleIdentifier:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = NSNumber;
  id v7 = a4;
  id v11 = [v6 numberWithBool:v4];
  os_unfair_lock_lock(&self->_lock);
  char v8 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"app"];
  id v9 = v8;
  if (!v8) {
    char v8 = (void *)MEMORY[0x263EFFA78];
  }
  objc_super v10 = (void *)[v8 mutableCopy];

  [v10 setObject:v11 forKey:v7];
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v10 forKey:@"app"];
  os_unfair_lock_unlock(&self->_lock);
  [(NHSSSmartStackSuggestionDefaults *)self _requestUserDefaultsSyncForKey:@"app"];
}

- (BOOL)widgetSuggestionsEnabledForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v12 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"widget"];
  char v13 = (void *)v12;
  v14 = (void *)MEMORY[0x263EFFA78];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  os_unfair_lock_unlock(p_lock);
  v16 = [(NHSSSmartStackSuggestionDefaults *)self _compositeKeyWithContainerBundleIdentifier:v11 extensionBundleIdentifier:v10 kind:v9];

  v17 = [v15 objectForKey:v16];

  v18 = (void *)MEMORY[0x263EFFA88];
  if (v17) {
    v18 = v17;
  }
  id v19 = v18;

  char v20 = [v19 BOOLValue];
  return v20;
}

- (void)setWidgetSuggestionsEnabled:(BOOL)a3 forContainerBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 kind:(id)a6
{
  BOOL v8 = a3;
  id v10 = NSNumber;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v18 = [v10 numberWithBool:v8];
  v14 = [(NHSSSmartStackSuggestionDefaults *)self _compositeKeyWithContainerBundleIdentifier:v13 extensionBundleIdentifier:v12 kind:v11];

  os_unfair_lock_lock(&self->_lock);
  id v15 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"widget"];
  v16 = v15;
  if (!v15) {
    id v15 = (void *)MEMORY[0x263EFFA78];
  }
  v17 = (void *)[v15 mutableCopy];

  [v17 setObject:v18 forKey:v14];
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v17 forKey:@"widget"];
  os_unfair_lock_unlock(&self->_lock);
  [(NHSSSmartStackSuggestionDefaults *)self _requestUserDefaultsSyncForKey:@"widget"];
}

- (id)widgetSuggestionsUnmuteDateForContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5
{
  p_lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v12 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"mute"];
  id v13 = (void *)v12;
  v14 = (void *)MEMORY[0x263EFFA78];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  os_unfair_lock_unlock(p_lock);
  v16 = [(NHSSSmartStackSuggestionDefaults *)self _compositeKeyWithContainerBundleIdentifier:v11 extensionBundleIdentifier:v10 kind:v9];

  v17 = [v15 objectForKey:v16];

  return v17;
}

- (void)setWidgetSuggestionsUnmuteDate:(id)a3 forContainerBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 kind:(id)a6
{
  id v10 = a3;
  id v14 = [(NHSSSmartStackSuggestionDefaults *)self _compositeKeyWithContainerBundleIdentifier:a4 extensionBundleIdentifier:a5 kind:a6];
  os_unfair_lock_lock(&self->_lock);
  id v11 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"mute"];
  uint64_t v12 = v11;
  if (!v11) {
    id v11 = (void *)MEMORY[0x263EFFA78];
  }
  id v13 = (void *)[v11 mutableCopy];

  [v13 setObject:v10 forKey:v14];
  [(NSUserDefaults *)self->_lock_userDefaults setObject:v13 forKey:@"mute"];
  os_unfair_lock_unlock(&self->_lock);
  [(NHSSSmartStackSuggestionDefaults *)self _scheduleTimerToUnmuteWidgetForKey:v14 onDate:v10];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)_Context == a6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__NHSSSmartStackSuggestionDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_265427B08;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NHSSSmartStackSuggestionDefaults;
    -[NHSSSmartStackSuggestionDefaults observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __83__NHSSSmartStackSuggestionDefaults_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_notifyObserversDefaultsDidChange");
}

- (void)_cleanUpExpiredMutePreferences
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF910] now];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"mute"];
  objc_super v6 = v5;
  if (!v5) {
    id v5 = (void *)MEMORY[0x263EFFA78];
  }
  id v7 = (void *)[v5 mutableCopy];

  BOOL v8 = [v7 allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v15 = [v7 objectForKey:v14];
        if ([v15 compare:v3] == -1)
        {
          [v7 removeObjectForKey:v14];
          char v11 = 1;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
    p_lock = &self->_lock;
    if (v11) {
      [(NSUserDefaults *)self->_lock_userDefaults setObject:v7 forKey:@"mute"];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)_requestUserDefaultsSyncForKey:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263F57528];
  id v4 = a3;
  id v6 = objc_alloc_init(v3);
  id v5 = [MEMORY[0x263EFFA08] setWithObject:v4];

  [v6 synchronizeUserDefaultsDomain:@"com.apple.NanoHomeScreen.SmartStackSuggestions" keys:v5];
}

- (void)_scheduleTimersToUnmuteWidgets
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSUserDefaults *)self->_lock_userDefaults objectForKey:@"mute"];
  id v5 = v4;
  if (!v4) {
    id v4 = (void *)MEMORY[0x263EFFA78];
  }
  id v6 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__NHSSSmartStackSuggestionDefaults__scheduleTimersToUnmuteWidgets__block_invoke;
  v7[3] = &unk_265427B30;
  v7[4] = self;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
}

uint64_t __66__NHSSSmartStackSuggestionDefaults__scheduleTimersToUnmuteWidgets__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _scheduleTimerToUnmuteWidgetForKey:a2 onDate:a3];
}

- (void)_scheduleTimerToUnmuteWidgetForKey:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    objc_initWeak(&location, self);
    id v8 = objc_alloc(MEMORY[0x263EFFA20]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __78__NHSSSmartStackSuggestionDefaults__scheduleTimerToUnmuteWidgetForKey_onDate___block_invoke;
    v14[3] = &unk_265427B58;
    objc_copyWeak(&v16, &location);
    id v9 = v6;
    id v15 = v9;
    uint64_t v10 = (void *)[v8 initWithFireDate:v7 interval:0 repeats:v14 block:0.0];
    os_unfair_lock_lock(&self->_lock);
    char v11 = [(NSMapTable *)self->_lock_scheduledTimers objectForKey:v9];
    [(NSMapTable *)self->_lock_scheduledTimers setObject:v10 forKey:v9];
    os_unfair_lock_unlock(&self->_lock);
    [v11 invalidate];
    uint64_t v12 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v12 addTimer:v10 forMode:*MEMORY[0x263EFF478]];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    os_unfair_lock_lock(&self->_lock);
    id v13 = [(NSMapTable *)self->_lock_scheduledTimers objectForKey:v6];
    [(NSMapTable *)self->_lock_scheduledTimers removeObjectForKey:v6];
    os_unfair_lock_unlock(&self->_lock);
    [v13 invalidate];
  }
}

void __78__NHSSSmartStackSuggestionDefaults__scheduleTimerToUnmuteWidgetForKey_onDate___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = WeakRetained + 8;
    id v7 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    id v4 = [v7[3] objectForKey:@"mute"];
    id v5 = v4;
    if (!v4) {
      id v4 = (void *)MEMORY[0x263EFFA78];
    }
    id v6 = (void *)[v4 mutableCopy];

    [v6 removeObjectForKey:*(void *)(a1 + 32)];
    [v7[3] setObject:v6 forKey:@"mute"];
    os_unfair_lock_unlock(v3);

    WeakRetained = (os_unfair_lock_s *)v7;
  }
}

- (void)_observeChangesToUserDefaults
{
  [(NSUserDefaults *)self->_lock_userDefaults addObserver:self forKeyPath:@"global" options:0 context:_Context];
  [(NSUserDefaults *)self->_lock_userDefaults addObserver:self forKeyPath:@"app" options:0 context:_Context];
  [(NSUserDefaults *)self->_lock_userDefaults addObserver:self forKeyPath:@"widget" options:0 context:_Context];
  lock_userDefaults = self->_lock_userDefaults;
  uint64_t v4 = _Context;
  [(NSUserDefaults *)lock_userDefaults addObserver:self forKeyPath:@"mute" options:0 context:v4];
}

- (id)_compositeKeyWithContainerBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4 kind:(id)a5
{
  return (id)[NSString stringWithFormat:@"%@-%@-%@", a3, a4, a5];
}

- (void)_mainQueue_notifyObserversDefaultsDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
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
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "smartStackSuggestionDefaultsDidChange", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_userDefaults, 0);
  objc_storeStrong((id *)&self->_lock_scheduledTimers, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

@end