@interface SiriUICachedUserNotificationsSettings
- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3;
- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3 fromSettingsCenter:(id)a4;
- (BOOL)_currentlyObservingForAppBundleId:(id)a3;
- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3;
- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3 fromSettingsCenter:(id)a4;
- (BOOL)syncAnnounceNotificationsEnabledForAppBundleId:(id)a3;
- (BOOL)syncNotificationBannersVisibleInCarPlayForAppBundleId:(id)a3;
- (NSMutableDictionary)appNotificationSettings;
- (SiriUICachedUserNotificationsSettings)init;
- (id)_appNotificationSettingsForAppBundleId:(id)a3;
- (id)_appNotificationSettingsForAppBundleId:(id)a3 fromSettingsCenter:(id)a4;
- (id)cachedNotificationSettingsForAppBundleId:(id)a3 asyncFetchNewValuesAndUpdateObservers:(BOOL)a4;
- (int64_t)announceCarPlaySetting;
- (int64_t)cachedAnnounceCarPlaySetting;
- (void)_addObserver:(id)a3 forAppBundleId:(id)a4;
- (void)_notifyAllObserversThatPreferencesDidChange;
- (void)_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:(id)a3;
- (void)_removeObserver:(id)a3 forAppBundleId:(id)a4;
- (void)_updateNotificationSettingsChangeAndNotifyObserversForAppBundleId:(id)a3 ifDifferentFromSettings:(id)a4;
- (void)_updateNotificationSettingsChangeForAppBundleId:(id)a3 fromSettingsCenter:(id)a4 notifyObservers:(BOOL)a5;
- (void)_updateNotificationSystemSettingsChangeFromSettingsCenter:(id)a3 notifyObservers:(BOOL)a4;
- (void)addObserver:(id)a3 forAppBundleId:(id)a4;
- (void)removeObserver:(id)a3 forAppBundleId:(id)a4;
- (void)setAppNotificationSettings:(id)a3;
- (void)setCachedAnnounceCarPlaySetting:(int64_t)a3;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4;
- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4;
@end

@implementation SiriUICachedUserNotificationsSettings

- (SiriUICachedUserNotificationsSettings)init
{
  v14.receiver = self;
  v14.super_class = (Class)SiriUICachedUserNotificationsSettings;
  v2 = [(SiriUICachedUserNotificationsSettings *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    appObservers = v2->_appObservers;
    v2->_appObservers = (NSMapTable *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("SiriUICachedUserNotificationsSettings", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    appNotificationSettings = v2->_appNotificationSettings;
    v2->_appNotificationSettings = (NSMutableDictionary *)v7;

    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __45__SiriUICachedUserNotificationsSettings_init__block_invoke;
    v11[3] = &unk_26469F1D0;
    objc_copyWeak(&v12, &location);
    dispatch_async(v9, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__SiriUICachedUserNotificationsSettings_init__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [MEMORY[0x263F84580] currentNotificationSettingsCenter];
    id v2 = WeakRetained[3];
    WeakRetained[3] = (id)v1;

    objc_msgSend(WeakRetained[3], "setDelegate:");
    [WeakRetained _updateNotificationSystemSettingsChangeFromSettingsCenter:WeakRetained[3] notifyObservers:1];
  }
}

- (void)addObserver:(id)a3 forAppBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__SiriUICachedUserNotificationsSettings_addObserver_forAppBundleId___block_invoke;
    v9[3] = &unk_26469F1F8;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __68__SiriUICachedUserNotificationsSettings_addObserver_forAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _addObserver:*(void *)(a1 + 32) forAppBundleId:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3 forAppBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __71__SiriUICachedUserNotificationsSettings_removeObserver_forAppBundleId___block_invoke;
    v9[3] = &unk_26469F1F8;
    objc_copyWeak(&v12, &location);
    id v10 = v6;
    id v11 = v7;
    dispatch_async(queue, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __71__SiriUICachedUserNotificationsSettings_removeObserver_forAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _removeObserver:*(void *)(a1 + 32) forAppBundleId:*(void *)(a1 + 40)];
}

- (BOOL)syncAnnounceNotificationsEnabledForAppBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__SiriUICachedUserNotificationsSettings_syncAnnounceNotificationsEnabledForAppBundleId___block_invoke;
  v8[3] = &unk_26469F220;
  id v10 = &v13;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(queue, v8);
  LOBYTE(queue) = *((unsigned char *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __88__SiriUICachedUserNotificationsSettings_syncAnnounceNotificationsEnabledForAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _announceNotificationsEnabledForAppBundleId:*(void *)(a1 + 32)];
}

- (BOOL)syncNotificationBannersVisibleInCarPlayForAppBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  objc_super v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __95__SiriUICachedUserNotificationsSettings_syncNotificationBannersVisibleInCarPlayForAppBundleId___block_invoke;
  v8[3] = &unk_26469F220;
  id v10 = &v13;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v6 = v4;
  dispatch_sync(queue, v8);
  LOBYTE(queue) = *((unsigned char *)v14 + 24);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);
  return (char)queue;
}

void __95__SiriUICachedUserNotificationsSettings_syncNotificationBannersVisibleInCarPlayForAppBundleId___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _notificationBannersVisibleInCarPlayForAppBundleId:*(void *)(a1 + 32)];
}

- (id)cachedNotificationSettingsForAppBundleId:(id)a3 asyncFetchNewValuesAndUpdateObservers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_appNotificationSettings objectForKeyedSubscript:v6];
  if (v4 && [v6 length])
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __120__SiriUICachedUserNotificationsSettings_cachedNotificationSettingsForAppBundleId_asyncFetchNewValuesAndUpdateObservers___block_invoke;
    v12[3] = &unk_26469F1F8;
    objc_copyWeak(&v15, &location);
    id v13 = v6;
    id v14 = v7;
    dispatch_async(queue, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = [[AppNotificationSettings alloc] initWithAnnounceEnabled:0 carPlayBannersEnabled:0];
  }
  id v10 = v9;

  return v10;
}

void __120__SiriUICachedUserNotificationsSettings_cachedNotificationSettingsForAppBundleId_asyncFetchNewValuesAndUpdateObservers___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _updateNotificationSettingsChangeAndNotifyObserversForAppBundleId:*(void *)(a1 + 32) ifDifferentFromSettings:*(void *)(a1 + 40)];
}

- (int64_t)announceCarPlaySetting
{
  return self->_cachedAnnounceCarPlaySetting;
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSystemSettings:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __108__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke;
  v8[3] = &unk_26469F248;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __108__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSystemSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateNotificationSystemSettingsChangeFromSettingsCenter:*(void *)(a1 + 40) notifyObservers:1];
}

- (void)userNotificationSettingsCenter:(id)a3 didUpdateNotificationSourceIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke;
  block[3] = &unk_26469F270;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __111__SiriUICachedUserNotificationsSettings_userNotificationSettingsCenter_didUpdateNotificationSourceIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_updateNotificationSettingsChangeForAppBundleId:fromSettingsCenter:notifyObservers:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), *(void *)(a1 + 48), 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_addObserver:(id)a3 forAppBundleId:(id)a4
{
  id v9 = a3;
  appObservers = self->_appObservers;
  id v7 = a4;
  long long v8 = [(NSMapTable *)appObservers objectForKey:v7];
  if (!v8)
  {
    long long v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
  }
  if (([v8 containsObject:v9] & 1) == 0) {
    [v8 addObject:v9];
  }
  [(NSMapTable *)self->_appObservers setObject:v8 forKey:v7];
  [(SiriUICachedUserNotificationsSettings *)self _updateNotificationSettingsChangeForAppBundleId:v7 fromSettingsCenter:self->_notificationsSettingsCenter notifyObservers:0];
}

- (void)_removeObserver:(id)a3 forAppBundleId:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(NSMapTable *)self->_appObservers objectForKey:v6];
  long long v8 = v7;
  if (v7) {
    [v7 removeObject:v9];
  }
  if (![v8 count]) {
    [(NSMapTable *)self->_appObservers removeObjectForKey:v6];
  }
  [(NSMutableDictionary *)self->_appNotificationSettings removeObjectForKey:v6];
}

- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3
{
  uint64_t v3 = [(SiriUICachedUserNotificationsSettings *)self _appNotificationSettingsForAppBundleId:a3];
  char v4 = [v3 isAnnounceEnabled];

  return v4;
}

- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3
{
  uint64_t v3 = [(SiriUICachedUserNotificationsSettings *)self _appNotificationSettingsForAppBundleId:a3];
  char v4 = [v3 areCarPlayBannersEnabled];

  return v4;
}

- (id)_appNotificationSettingsForAppBundleId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_appNotificationSettings objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SiriUICachedUserNotificationsSettings *)self _appNotificationSettingsForAppBundleId:v4 fromSettingsCenter:self->_notificationsSettingsCenter];
  }
  long long v8 = v7;

  return v8;
}

- (id)_appNotificationSettingsForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  notificationsSettingsCenter = self->_notificationsSettingsCenter;
  id v6 = a3;
  BOOL v7 = [(SiriUICachedUserNotificationsSettings *)self _announceNotificationsEnabledForAppBundleId:v6 fromSettingsCenter:notificationsSettingsCenter];
  BOOL v8 = [(SiriUICachedUserNotificationsSettings *)self _notificationBannersVisibleInCarPlayForAppBundleId:v6 fromSettingsCenter:self->_notificationsSettingsCenter];

  id v9 = [[AppNotificationSettings alloc] initWithAnnounceEnabled:v7 carPlayBannersEnabled:v8];
  return v9;
}

- (void)_updateNotificationSystemSettingsChangeFromSettingsCenter:(id)a3 notifyObservers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 notificationSystemSettings];
  int64_t v7 = [v6 announcementCarPlaySetting];

  if (v7 != self->_cachedAnnounceCarPlaySetting)
  {
    self->_cachedAnnounceCarPlaySetting = v7;
    if (v4)
    {
      [(SiriUICachedUserNotificationsSettings *)self _notifyAllObserversThatPreferencesDidChange];
    }
  }
}

- (void)_updateNotificationSettingsChangeForAppBundleId:(id)a3 fromSettingsCenter:(id)a4 notifyObservers:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  id v8 = a4;
  if ([(SiriUICachedUserNotificationsSettings *)self _currentlyObservingForAppBundleId:v11])
  {
    id v9 = [(NSMutableDictionary *)self->_appNotificationSettings objectForKeyedSubscript:v11];
    long long v10 = [(SiriUICachedUserNotificationsSettings *)self _appNotificationSettingsForAppBundleId:v11 fromSettingsCenter:v8];
    if (!v9 || ([v9 isEqual:v10] & 1) == 0)
    {
      [(NSMutableDictionary *)self->_appNotificationSettings setObject:v10 forKeyedSubscript:v11];
      if (v5) {
        [(SiriUICachedUserNotificationsSettings *)self _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:v11];
      }
    }
  }
}

- (void)_updateNotificationSettingsChangeAndNotifyObserversForAppBundleId:(id)a3 ifDifferentFromSettings:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(SiriUICachedUserNotificationsSettings *)self _currentlyObservingForAppBundleId:v8])
  {
    int64_t v7 = [(SiriUICachedUserNotificationsSettings *)self _appNotificationSettingsForAppBundleId:v8 fromSettingsCenter:self->_notificationsSettingsCenter];
    if (([v7 isEqual:v6] & 1) == 0)
    {
      [(NSMutableDictionary *)self->_appNotificationSettings setObject:v7 forKeyedSubscript:v8];
      [(SiriUICachedUserNotificationsSettings *)self _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:v8];
    }
  }
}

- (BOOL)_announceNotificationsEnabledForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  BOOL v4 = [a4 notificationSourceWithIdentifier:a3];
  BOOL v5 = [v4 sourceSettings];
  id v6 = [v5 notificationSettings];
  BOOL v7 = [v6 announcementSetting] == 2;

  return v7;
}

- (BOOL)_notificationBannersVisibleInCarPlayForAppBundleId:(id)a3 fromSettingsCenter:(id)a4
{
  BOOL v4 = [a4 notificationSourceWithIdentifier:a3];
  BOOL v5 = [v4 sourceSettings];
  id v6 = [v5 notificationSettings];
  BOOL v7 = [v6 carPlaySetting] == 2;

  return v7;
}

- (BOOL)_currentlyObservingForAppBundleId:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(NSMapTable *)self->_appObservers keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v4])
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_notifyAllObserversThatPreferencesDidChange
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = [(NSMapTable *)self->_appObservers keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(SiriUICachedUserNotificationsSettings *)self _notifyAllObserversWithAppBundleIdThatPreferencesDidChange:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_notifyAllObserversWithAppBundleIdThatPreferencesDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMapTable *)self->_appObservers objectForKey:v4];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) cachedSettings:self didChangeForAppBundleId:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)cachedAnnounceCarPlaySetting
{
  return self->_cachedAnnounceCarPlaySetting;
}

- (void)setCachedAnnounceCarPlaySetting:(int64_t)a3
{
  self->_cachedAnnounceCarPlaySetting = a3;
}

- (NSMutableDictionary)appNotificationSettings
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAppNotificationSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appNotificationSettings, 0);
  objc_storeStrong((id *)&self->_notificationsSettingsCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_appObservers, 0);
}

@end