@interface WFSiriWorkflowVocabularyUpdater
- (NSOrderedSet)speakableStrings;
- (OS_dispatch_queue)queue;
- (WFDatabaseProvider)databaseProvider;
- (WFDebouncer)debouncer;
- (WFSiriWorkflowVocabularyUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4;
- (void)applicationWasRegistered:(id)a3;
- (void)assistantPreferencesDidChange;
- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6;
- (void)queue_debouncerDidFire;
- (void)queue_startIfPossible;
- (void)queue_updateIfNeededWithTransaction:(id)a3;
- (void)setSpeakableStrings:(id)a3;
- (void)startIfPossible;
- (void)updateIfPossibleWithTransaction:(id)a3;
@end

@implementation WFSiriWorkflowVocabularyUpdater

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakableStrings, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setSpeakableStrings:(id)a3
{
}

- (NSOrderedSet)speakableStrings
{
  return self->_speakableStrings;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (void *)os_transaction_create();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__WFSiriWorkflowVocabularyUpdater_databaseDidChange_modified_inserted_removed___block_invoke;
  aBlock[3] = &unk_1E65420F0;
  id v15 = v14;
  id v25 = v15;
  v16 = (void (**)(void))_Block_copy(aBlock);
  if (WFDatabaseChangesContainObjectType(0, v11, v17, v18, v19, v20, v21, v22, (uint64_t)v12))
  {
    v23 = [(WFSiriWorkflowVocabularyUpdater *)self debouncer];
    [v23 poke];
  }
  else
  {
    v23 = getWFSiriVocabLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFSiriWorkflowVocabularyUpdater databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_INFO, "%s Not syncing vocabulary to server, the database change contained no shortcut modifications", buf, 0xCu);
    }
  }

  v16[2](v16);
}

- (void)queue_updateIfNeededWithTransaction:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFSiriWorkflowVocabularyUpdater.m", 133, @"Invalid parameter not satisfying: %@", @"transaction" object file lineNumber description];
  }
  v6 = [(WFSiriWorkflowVocabularyUpdater *)self queue];
  dispatch_assert_queue_V2(v6);

  v7 = [(WFSiriWorkflowVocabularyUpdater *)self databaseProvider];
  id v24 = 0;
  v8 = [v7 databaseWithError:&v24];
  id v9 = v24;

  if (v8)
  {
    id v10 = (void *)MEMORY[0x1C87C4C10]();
    id v11 = [v8 sortedVisibleWorkflowsByLastRunOrModificationDateWithLimit:1000];
    id v12 = [v11 descriptors];

    id v13 = objc_alloc(MEMORY[0x1E4F1CAA0]);
    v14 = objc_msgSend(v12, "if_map:", &__block_literal_global_207);
    id v15 = (void *)[v13 initWithArray:v14];

    v16 = [(WFSiriWorkflowVocabularyUpdater *)self speakableStrings];
    int v17 = [v16 isEqualToOrderedSet:v15];

    if (v17)
    {
      uint64_t v18 = getWFSiriVocabLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
        _os_log_impl(&dword_1C7D7E000, v18, OS_LOG_TYPE_INFO, "%s Not syncing vocabulary to server, the shortcut names have not changed", buf, 0xCu);
      }
    }
    else
    {
      if ((unint64_t)[v15 count] >= 0x3E9)
      {
        uint64_t v20 = getWFSiriVocabLogObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
          _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_INFO, "%s Shortcut count >1000, some may be dropped", buf, 0xCu);
        }
      }
      uint64_t v21 = getWFSiriVocabLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
        _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEFAULT, "%s Syncing vocabulary to server", buf, 0xCu);
      }

      [(WFSiriWorkflowVocabularyUpdater *)self setSpeakableStrings:v15];
      uint64_t v22 = [MEMORY[0x1E4F30870] sharedVocabulary];
      [v22 setVocabulary:v15 ofType:50000];

      notify_post((const char *)[(id)*MEMORY[0x1E4FB4C10] UTF8String]);
    }
  }
  else
  {
    uint64_t v19 = getWFSiriVocabLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[WFSiriWorkflowVocabularyUpdater queue_updateIfNeededWithTransaction:]";
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, not updating vocabulary, %{public}@", buf, 0x16u);
    }
  }
}

id __71__WFSiriWorkflowVocabularyUpdater_queue_updateIfNeededWithTransaction___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F30750];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 identifier];
  v6 = [v3 name];

  v7 = (void *)[v4 initWithVocabularyIdentifier:v5 spokenPhrase:v6 pronunciationHint:0];
  return v7;
}

- (void)queue_debouncerDidFire
{
  id v3 = (id)os_transaction_create();
  [(WFSiriWorkflowVocabularyUpdater *)self queue_updateIfNeededWithTransaction:v3];
}

- (void)queue_startIfPossible
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(WFSiriWorkflowVocabularyUpdater *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(WFSiriWorkflowVocabularyUpdater *)self databaseProvider];
  id v12 = 0;
  id v5 = [v4 databaseWithError:&v12];
  id v6 = v12;

  if (v5)
  {
    [v5 addObjectObserver:self];
    v7 = getWFSiriVocabLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[WFSiriWorkflowVocabularyUpdater queue_startIfPossible]";
      v8 = "%s Started observing the database for vocabulary changes";
      id v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_INFO;
      uint32_t v11 = 12;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v9, v10, v8, buf, v11);
    }
  }
  else
  {
    v7 = getWFSiriVocabLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[WFSiriWorkflowVocabularyUpdater queue_startIfPossible]";
      __int16 v15 = 2114;
      id v16 = v6;
      v8 = "%s Failed to load database, not starting observation, %{public}@";
      id v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 22;
      goto LABEL_6;
    }
  }
}

- (void)updateIfPossibleWithTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(WFSiriWorkflowVocabularyUpdater *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__WFSiriWorkflowVocabularyUpdater_updateIfPossibleWithTransaction___block_invoke;
  v7[3] = &unk_1E6541F68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __67__WFSiriWorkflowVocabularyUpdater_updateIfPossibleWithTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_updateIfNeededWithTransaction:", *(void *)(a1 + 40));
}

- (void)startIfPossible
{
  id v3 = [(WFSiriWorkflowVocabularyUpdater *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__WFSiriWorkflowVocabularyUpdater_startIfPossible__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __50__WFSiriWorkflowVocabularyUpdater_startIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
}

- (void)applicationWasRegistered:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  id v6 = [v4 userInfo];
  v7 = [v6 objectForKeyedSubscript:@"isPlaceholder"];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  char v10 = [v9 BOOLValue];
  if ((v10 & 1) == 0)
  {
    uint32_t v11 = [v4 userInfo];
    id v12 = [v11 objectForKeyedSubscript:@"bundleIDs"];

    if (v12)
    {
      objc_opt_class();
      id v13 = (objc_opt_isKindOfClass() & 1) != 0 ? v12 : 0;
    }
    else
    {
      id v13 = 0;
    }
    id v14 = v13;

    int v15 = [v14 containsObject:*MEMORY[0x1E4FB4BE8]];
    if (v15)
    {
      id v16 = getWFSiriVocabLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        uint64_t v18 = "-[WFSiriWorkflowVocabularyUpdater applicationWasRegistered:]";
        _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEFAULT, "%s Shortcuts app installed, starting observation and requesting a vocabulary sync", (uint8_t *)&v17, 0xCu);
      }

      [(WFSiriWorkflowVocabularyUpdater *)self startIfPossible];
      [(WFSiriWorkflowVocabularyUpdater *)self updateIfPossibleWithTransaction:v5];
    }
  }
}

- (void)assistantPreferencesDidChange
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)os_transaction_create();
  id v4 = getWFSiriVocabLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[WFSiriWorkflowVocabularyUpdater assistantPreferencesDidChange]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Assistant preferences changed, requesting a vocabulary sync", (uint8_t *)&v5, 0xCu);
  }

  [(WFSiriWorkflowVocabularyUpdater *)self updateIfPossibleWithTransaction:v3];
}

- (WFSiriWorkflowVocabularyUpdater)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"WFSiriWorkflowVocabularyUpdater.m", 51, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"WFSiriWorkflowVocabularyUpdater.m", 52, @"Invalid parameter not satisfying: %@", @"eventHandler" object file lineNumber description];

LABEL_3:
  v29.receiver = self;
  v29.super_class = (Class)WFSiriWorkflowVocabularyUpdater;
  uint32_t v11 = [(WFSiriWorkflowVocabularyUpdater *)&v29 init];
  if (v11)
  {
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.shortcuts.WFSiriWorkflowVocabularyUpdater", v13);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [objc_alloc(MEMORY[0x1E4FB71B8]) initWithDelay:v11->_queue maximumDelay:0.5 queue:15.0];
    debouncer = v11->_debouncer;
    v11->_debouncer = (WFDebouncer *)v16;

    objc_storeStrong((id *)&v11->_databaseProvider, a3);
    uint64_t v18 = objc_opt_new();
    speakableStrings = v11->_speakableStrings;
    v11->_speakableStrings = (NSOrderedSet *)v18;

    [(WFDebouncer *)v11->_debouncer addTarget:v11 action:sel_queue_debouncerDidFire];
    uint64_t v20 = [(WFSiriWorkflowVocabularyUpdater *)v11 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__WFSiriWorkflowVocabularyUpdater_initWithDatabaseProvider_eventHandler___block_invoke;
    block[3] = &unk_1E6541F68;
    uint64_t v21 = v11;
    __int16 v27 = v21;
    id v28 = v10;
    dispatch_sync(v20, block);

    uint64_t v22 = v21;
  }

  return v11;
}

uint64_t __73__WFSiriWorkflowVocabularyUpdater_initWithDatabaseProvider_eventHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "queue_startIfPossible");
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel_startIfPossible name:@"com.apple.mobile.keybagd.first_unlock"];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel_assistantPreferencesDidChange name:@"kAFPreferencesDidChangeDarwinNotification"];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  return [v2 addObserver:v3 selector:sel_applicationWasRegistered_ name:@"ApplicationRegistered"];
}

@end