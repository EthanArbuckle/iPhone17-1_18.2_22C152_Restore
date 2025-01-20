@interface MRMediaSuggestionPreferences
+ (NSArray)allContexts;
- (BOOL)suggestionsDisabledInContext:(id)a3;
- (MRMediaSuggestionPreferences)init;
- (id)bundlesDisabledInAllContexts;
- (id)description;
- (id)dictionaryRepresentation;
- (id)disabledBundleIdentifiersInContext:(id)a3;
- (id)disabledBundlesForContexts;
- (id)globalDisplayPreferencesForContexts;
- (id)userDisplayPreferencesDidChangeCallback;
- (void)_notifyListener;
- (void)_registerForNotifications;
- (void)_updateGlobalToggleState;
- (void)dealloc;
- (void)initWithGlobalPreferences:(void *)a3 disabledBundlesForContexts:;
- (void)setUserDisplayPreferencesDidChangeCallback:(id)a3;
- (void)snapshot;
@end

@implementation MRMediaSuggestionPreferences

- (BOOL)suggestionsDisabledInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(NSMutableDictionary *)v5->_globalDisplayPreferencesForContexts objectForKeyedSubscript:v4];
  char v7 = [v6 BOOLValue] ^ 1;

  objc_sync_exit(v5);
  return v7;
}

- (void)_updateGlobalToggleState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    objc_sync_enter(v1);
    v2 = -[MRMediaSuggestionPreferences dictionaryRepresentation](v1);
    CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"ShowWhenListeningEnabled", @"com.apple.suggestions");
    id v4 = (void *)v3;
    v5 = (void *)MEMORY[0x1E4F1CC38];
    if (v3) {
      v5 = (void *)v3;
    }
    id v6 = v5;

    [v1[3] setObject:v6 forKeyedSubscript:@"HomeScreen"];
    char v7 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
    int v8 = [v7 containsObject:@"com.apple.Home"];

    int v9 = [v6 BOOLValue];
    if (v9)
    {
      v10 = [NSNumber numberWithBool:v8 ^ 1u];
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4F1CC28];
    }
    [v1[3] setObject:v10 forKeyedSubscript:@"Home"];
    if (v9) {

    }
    v11 = (void *)MEMORY[0x1E4F1CA80];
    v12 = (void *)CFPreferencesCopyAppValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui");
    v13 = [v11 setWithArray:v12];
    [v1[4] setObject:v13 forKeyedSubscript:@"HomeScreen"];

    v14 = [v1[4] objectForKeyedSubscript:@"HomeScreen"];
    [v1[4] setObject:v14 forKeyedSubscript:@"Home"];

    v15 = -[MRMediaSuggestionPreferences dictionaryRepresentation](v1);
    int v16 = [v2 isEqualToDictionary:v15];

    if ((v16 & 1) == 0)
    {
      v17 = _MRLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v1;
        _os_log_impl(&dword_194F3C000, v17, OS_LOG_TYPE_DEFAULT, "[MRMediaSuggestionPreferences] Updated to new state: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    objc_sync_exit(v1);

    return (void *)(v16 ^ 1u);
  }
  return result;
}

- (id)dictionaryRepresentation
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CFPropertyListRef v3 = -[MRMediaSuggestionPreferences globalDisplayPreferencesForContexts](v1);
    [v2 setObject:v3 forKeyedSubscript:@"globalDisplayPreferencesForContexts"];

    id v4 = -[MRMediaSuggestionPreferences disabledBundlesForContexts](v1);
    [v2 setObject:v4 forKeyedSubscript:@"disabledBundlesForContexts"];

    v5 = -[MRMediaSuggestionPreferences bundlesDisabledInAllContexts](v1);
    [v2 setObject:v5 forKeyedSubscript:@"bundlesDisabledInAllContexts"];

    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)globalDisplayPreferencesForContexts
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)[v1[3] mutableCopy];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)disabledBundlesForContexts
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)[v1[4] mutableCopy];
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)bundlesDisabledInAllContexts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v2 = v1[4];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      id v4 = 0;
      uint64_t v5 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v12 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          id v8 = v1[4];
          if (v4)
          {
            int v9 = [v8 objectForKeyedSubscript:v7];
            [v4 intersectSet:v9];
          }
          else
          {
            int v9 = objc_msgSend(v8, "objectForKeyedSubscript:", v7, (void)v11);
            id v4 = (void *)[v9 mutableCopy];
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v3);

      if (v4) {
        goto LABEL_16;
      }
    }
    else
    {
    }
    id v4 = objc_opt_new();
LABEL_16:
    objc_sync_exit(v1);

    goto LABEL_17;
  }
  id v4 = 0;
LABEL_17:

  return v4;
}

+ (NSArray)allContexts
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HomeScreen";
  v4[1] = @"Home";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return (NSArray *)v2;
}

- (MRMediaSuggestionPreferences)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRMediaSuggestionPreferences;
  id v2 = [(MRMediaSuggestionPreferences *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    globalDisplayPreferencesForContexts = v2->_globalDisplayPreferencesForContexts;
    v2->_globalDisplayPreferencesForContexts = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    disabledBundlesForContexts = v2->_disabledBundlesForContexts;
    v2->_disabledBundlesForContexts = (NSMutableDictionary *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.MediaRemote.MRMediaSuggestionPreferences.callbackQueue", v7);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v8;

    -[MRMediaSuggestionPreferences _updateGlobalToggleState](v2);
    -[MRMediaSuggestionPreferences _registerForNotifications](v2);
  }
  return v2;
}

- (void)_registerForNotifications
{
  if (a1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_processNotification, @"com.apple.spotlightui.prefschanged", 0, (CFNotificationSuspensionBehavior)1028);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, a1, (CFNotificationCallback)_processNotification, @"com.apple.suggestions.settingsChanged", 0, (CFNotificationSuspensionBehavior)1028);
  }
}

- (void)initWithGlobalPreferences:(void *)a3 disabledBundlesForContexts:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)MRMediaSuggestionPreferences;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v7 = [v5 mutableCopy];
      dispatch_queue_t v8 = (void *)a1[3];
      a1[3] = v7;

      uint64_t v9 = [v6 mutableCopy];
      v10 = (void *)a1[4];
      a1[4] = v9;
    }
  }

  return a1;
}

- (id)description
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = -[MRMediaSuggestionPreferences dictionaryRepresentation](v2);
  id v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, v2, v5];

  objc_sync_exit(v2);

  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)MRMediaSuggestionPreferences;
  [(MRMediaSuggestionPreferences *)&v4 dealloc];
}

- (void)setUserDisplayPreferencesDidChangeCallback:(id)a3
{
  obj = self;
  id v4 = a3;
  objc_sync_enter(obj);
  uint64_t v5 = MEMORY[0x1997190F0](v4);

  id userDisplayPreferencesDidChangeCallback = obj->_userDisplayPreferencesDidChangeCallback;
  obj->_id userDisplayPreferencesDidChangeCallback = (id)v5;

  objc_sync_exit(obj);
}

- (void)snapshot
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = -[MRMediaSuggestionPreferences initWithGlobalPreferences:disabledBundlesForContexts:]([MRMediaSuggestionPreferences alloc], v1[3], v1[4]);
    objc_sync_exit(v1);
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (id)disabledBundleIdentifiersInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(NSMutableDictionary *)v5->_disabledBundlesForContexts objectForKeyedSubscript:v4];
  uint64_t v7 = [v6 allObjects];
  dispatch_queue_t v8 = (void *)[v7 copy];

  objc_sync_exit(v5);

  return v8;
}

- (void)_notifyListener
{
  if (a1)
  {
    id v1 = a1;
    objc_sync_enter(v1);
    id v2 = (void *)MEMORY[0x1997190F0](v1[1]);
    objc_sync_exit(v1);

    if (v2)
    {
      id v3 = v1[2];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__MRMediaSuggestionPreferences__notifyListener__block_invoke;
      block[3] = &unk_1E57D0FC0;
      id v5 = v2;
      dispatch_async(v3, block);
    }
  }
}

uint64_t __47__MRMediaSuggestionPreferences__notifyListener__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)userDisplayPreferencesDidChangeCallback
{
  return self->_userDisplayPreferencesDidChangeCallback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledBundlesForContexts, 0);
  objc_storeStrong((id *)&self->_globalDisplayPreferencesForContexts, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);

  objc_storeStrong(&self->_userDisplayPreferencesDidChangeCallback, 0);
}

@end