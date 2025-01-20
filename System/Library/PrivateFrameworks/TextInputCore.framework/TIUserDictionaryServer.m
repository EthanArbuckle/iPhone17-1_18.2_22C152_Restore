@interface TIUserDictionaryServer
+ (double)decrementClientDelay;
+ (id)sharedInstance;
+ (id)singletonInstance;
+ (void)setSharedInstance:(id)a3;
- (NSUUID)userDictionaryUUID;
- (TIUserDictionaryServer)init;
- (_KSTextReplacementServer)textReplacementServer;
- (id)addObserver:(id)a3;
- (void)dealloc;
- (void)decrementRecentClientCountAfterDelay;
- (void)getPhraseShortcutPairs:(id)a3;
- (void)handleIdleTimeout;
- (void)incrementRecentClientCount;
- (void)keyboardActivityDidTransition:(id)a3;
- (void)loadPhraseShortcutPairs:(id)a3;
- (void)managedKeyboardSettingsDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetCache;
- (void)setTextReplacementServer:(id)a3;
- (void)setUserDictionaryUUID:(id)a3;
- (void)startServer;
- (void)updateCache;
@end

@implementation TIUserDictionaryServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textReplacementServer, 0);
  objc_storeStrong((id *)&self->_userDictionaryUUID, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (void)setTextReplacementServer:(id)a3
{
}

- (_KSTextReplacementServer)textReplacementServer
{
  return self->_textReplacementServer;
}

- (void)setUserDictionaryUUID:(id)a3
{
}

- (NSUUID)userDictionaryUUID
{
  return self->_userDictionaryUUID;
}

- (void)handleIdleTimeout
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  if (TICanLogMessageAtLevel_logLevel)
  {
    v3 = TIOSLogFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Closing user dictionary due to lack of activity", "-[TIUserDictionaryServer handleIdleTimeout]");
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
  }
  v4 = [(TIUserDictionaryServer *)self textReplacementServer];
  [v4 cleanup];

  [(TIUserDictionaryServer *)self resetCache];
}

- (void)keyboardActivityDidTransition:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

void *__56__TIUserDictionaryServer_keyboardActivityDidTransition___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) toState];
  result = (void *)[*(id *)(a1 + 40) toState];
  if (result == (void *)3)
  {
    result = *(void **)(a1 + 32);
    if (!result[6])
    {
      return (void *)[result handleIdleTimeout];
    }
  }
  return result;
}

- (void)decrementRecentClientCountAfterDelay
{
  +[TIUserDictionaryServer decrementClientDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__TIUserDictionaryServer_decrementRecentClientCountAfterDelay__block_invoke;
  block[3] = &unk_1E6E2DE00;
  block[4] = self;
  dispatch_after(v4, dispatchQueue, block);
}

void *__62__TIUserDictionaryServer_decrementRecentClientCountAfterDelay__block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 48);
  result = *(void **)(a1 + 32);
  if (result[5] == 3 && !result[6]) {
    return (void *)[result handleIdleTimeout];
  }
  return result;
}

- (void)incrementRecentClientCount
{
}

uint64_t __52__TIUserDictionaryServer_incrementRecentClientCount__block_invoke(uint64_t result)
{
  return result;
}

- (void)managedKeyboardSettingsDidChange:(id)a3
{
}

uint64_t __59__TIUserDictionaryServer_managedKeyboardSettingsDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCache];
}

- (void)loadPhraseShortcutPairs:(id)a3
{
  dispatch_time_t v4 = (void (**)(id, void))a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  v5 = (void *)getMCProfileConnectionClass_softClass_14588;
  uint64_t v21 = getMCProfileConnectionClass_softClass_14588;
  if (!getMCProfileConnectionClass_softClass_14588)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __getMCProfileConnectionClass_block_invoke_14589;
    v17[3] = &unk_1E6E2E248;
    v17[4] = &v18;
    __getMCProfileConnectionClass_block_invoke_14589((uint64_t)v17);
    v5 = (void *)v19[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v18, 8);
  v7 = [v6 sharedConnection];
  char v8 = [v7 isKeyboardShortcutsAllowed];

  if (v8)
  {
    v9 = [(TIUserDictionaryServer *)self textReplacementServer];

    if (!v9) {
      v4[2](v4, MEMORY[0x1E4F1CBF0]);
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v11 = [(TIUserDictionaryServer *)self textReplacementServer];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke;
    v13[3] = &unk_1E6E2CB48;
    id v14 = v10;
    v15 = self;
    v16 = v4;
    id v12 = v10;
    [v11 queryTextReplacementsWithCallback:v13];
  }
  else
  {
    v4[2](v4, MEMORY[0x1E4F1CBF0]);
  }
}

void __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v10 phrase];

        if (v11)
        {
          id v12 = [v10 shortcut];

          if (!v12)
          {
            v13 = [v10 phrase];
            [v10 setShortcut:v13];
          }
          id v14 = *(void **)(a1 + 32);
          v15 = [v10 phrase];
          [v14 addObject:v15];

          v16 = *(void **)(a1 + 32);
          v17 = [v10 shortcut];
          [v16 addObject:v17];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
  if (a3)
  {
    id v19 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 32);
    TIDispatchAsync();
  }
}

uint64_t __50__TIUserDictionaryServer_loadPhraseShortcutPairs___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resetCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  cache = self->_cache;
  self->_cache = 0;

  [(TIUserDictionaryServer *)self setUserDictionaryUUID:0];
}

- (void)updateCache
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_updating)
  {
    ++self->_pendingUpdates;
  }
  else
  {
    self->_pendingUpdates = 0;
    [(TIUserDictionaryServer *)self incrementRecentClientCount];
    self->_updating = 1;
    cache = self->_cache;
    self->_cache = 0;

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__TIUserDictionaryServer_updateCache__block_invoke;
    v4[3] = &unk_1E6E2CB20;
    v4[4] = self;
    [(TIUserDictionaryServer *)self loadPhraseShortcutPairs:v4];
  }
}

void __37__TIUserDictionaryServer_updateCache__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = [MEMORY[0x1E4F29128] UUID];
  [*(id *)(a1 + 32) setUserDictionaryUUID:v5];

  if ([*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), a2);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  objc_msgSend(*(id *)(a1 + 32), "decrementRecentClientCountAfterDelay", (void)v12);
  v11 = *(_DWORD **)(a1 + 32);
  if (v11[9]) {
    [v11 updateCache];
  }
}

- (void)getPhraseShortcutPairs:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

uint64_t __49__TIUserDictionaryServer_getPhraseShortcutPairs___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2[3]) {
    return (*(uint64_t (**)(void))(v3 + 16))(*(void *)(a1 + 40));
  }
  else {
    return [v2 loadPhraseShortcutPairs:v3];
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  TIDispatchAsync();
}

void __41__TIUserDictionaryServer_removeObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  [v2 removeObject:v3];

  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 24);
    *(void *)(v4 + 24) = 0;
  }
}

- (id)addObserver:(id)a3
{
  id v6 = (void *)[a3 copy];
  id v3 = v6;
  TIDispatchAsync();
  uint64_t v4 = _Block_copy(v3);

  return v4;
}

uint64_t __38__TIUserDictionaryServer_addObserver___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  [v2 addObject:v3];

  [*(id *)(a1 + 32) incrementRecentClientCount];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else if (!*(unsigned char *)(v4 + 32))
  {
    [(id)v4 updateCache];
  }
  id v5 = *(void **)(a1 + 32);

  return [v5 decrementRecentClientCountAfterDelay];
}

- (void)startServer
{
}

void __37__TIUserDictionaryServer_startServer__block_invoke(uint64_t a1)
{
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v2 = (void *)get_KSTextReplacementServerClass_softClass;
  uint64_t v25 = get_KSTextReplacementServerClass_softClass;
  if (!get_KSTextReplacementServerClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __get_KSTextReplacementServerClass_block_invoke;
    long long v20 = &unk_1E6E2E248;
    long long v21 = &v22;
    __get_KSTextReplacementServerClass_block_invoke((uint64_t)&v17);
    v2 = (void *)v23[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v22, 8);
  uint64_t v4 = [v3 textReplacementServer];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v4;

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v9 = (void *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  uint64_t v25 = getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __getMCKeyboardSettingsChangedNotificationSymbolLoc_block_invoke;
    long long v20 = &unk_1E6E2E248;
    long long v21 = &v22;
    uint64_t v10 = (void *)ManagedConfigurationLibrary_14592();
    v11 = dlsym(v10, "MCKeyboardSettingsChangedNotification");
    *(void *)(v21[1] + 24) = v11;
    getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = *(void *)(v21[1] + 24);
    uint64_t v9 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (v9)
  {
    [v7 addObserver:v8 selector:sel_managedKeyboardSettingsDidChange_ name:*v9 object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    long long v13 = *(const void **)(a1 + 32);
    getKSTextReplacementDidChangeNotification();
    long long v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v13, (CFNotificationCallback)ShortcutsDidChange, v14, 0, (CFNotificationSuspensionBehavior)0);

    long long v15 = [*(id *)(a1 + 32) textReplacementServer];
    [v15 start];
  }
  else
  {
    dlerror();
    uint64_t v16 = abort_report_np();
    __get_KSTextReplacementServerClass_block_invoke(v16);
  }
}

- (TIUserDictionaryServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIUserDictionaryServer;
  v2 = [(TIUserDictionaryServer *)&v10 init];
  if (v2)
  {
    id v3 = +[TIKeyboardActivityController sharedController];
    [v3 addActivityObserver:v2];

    uint64_t v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    observers = v2->_observers;
    v2->_observers = v4;

    id v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.TextInput.shortcuts", v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  getKSTextReplacementDidChangeNotification();
  uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0);

  id v6 = +[TIKeyboardActivityController sharedController];
  [v6 removeActivityObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)TIUserDictionaryServer;
  [(TIUserDictionaryServer *)&v7 dealloc];
}

+ (double)decrementClientDelay
{
  if (decrementClientDelay_onceToken != -1) {
    dispatch_once(&decrementClientDelay_onceToken, &__block_literal_global_17_14620);
  }
  return *(double *)&decrementClientDelay_result;
}

void __46__TIUserDictionaryServer_decrementClientDelay__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  decrementClientDelay_result = 0x4066800000000000;
  if (TI_IS_INTERNAL_INSTALL::once_token != -1) {
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3708);
  }
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"idleTimeout", @"com.apple.keyboard", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      CFIndex v1 = AppIntegerValue;
      if ((AppIntegerValue & 0x8000000000000000) == 0)
      {
        *(double *)&decrementClientDelay_result = (double)AppIntegerValue;
        if (TICanLogMessageAtLevel_onceToken != -1) {
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
        }
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          v2 = TIOSLogFacility();
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
          {
            id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s Setting decrement client delay to %ld seconds", "+[TIUserDictionaryServer decrementClientDelay]_block_invoke", v1);
            *(_DWORD *)buf = 138412290;
            id v6 = v3;
            _os_log_debug_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_14632 != -1) {
    dispatch_once(&singletonInstance_onceToken_14632, &__block_literal_global_14633);
  }
  v2 = (void *)singletonInstance_singletonInstance_14634;

  return v2;
}

uint64_t __43__TIUserDictionaryServer_singletonInstance__block_invoke()
{
  v0 = objc_alloc_init(TIUserDictionaryServer);
  uint64_t v1 = singletonInstance_singletonInstance_14634;
  singletonInstance_singletonInstance_14634 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedInstance
{
  if (__testingServer)
  {
    id v2 = (id)__testingServer;
  }
  else
  {
    id v2 = +[TIUserDictionaryServer singletonInstance];
  }

  return v2;
}

+ (void)setSharedInstance:(id)a3
{
  id v4 = a3;
  if ((id)__testingServer != v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)&__testingServer, a3);
    id v4 = v5;
  }
}

@end