@interface TCSSuggestions
+ (id)_descriptorForRequiredKeys;
- (BOOL)_shouldGenerateNewSuggestions;
- (BOOL)generationTimerEnabled;
- (BOOL)shouldObserveSuggestionsDefaultChanges;
- (CNContactStore)contactStore;
- (NSArray)suggestedDestinations;
- (NSMutableDictionary)suggestions;
- (NSUserDefaults)defaults;
- (TCSContacts)contacts;
- (TCSSuggestions)initWithContactStore:(id)a3 contacts:(id)a4;
- (id)_destinationsFromCallHistory;
- (id)_destinationsFromCoreRecents;
- (id)_destinationsFromFavorites;
- (id)_performHousekeepingOnSuggestions:(id)a3;
- (void)_addSuggestedDestination:(id)a3 withTimestamp:(id)a4;
- (void)_deleteSuggestions;
- (void)_deviceDidPair:(id)a3;
- (void)_generateNewSuggestions;
- (void)_handleDeviceFirstUnlock;
- (void)_invalidate;
- (void)_notifyObserversSuggestionsChanged;
- (void)_performIDQueryForSuggestions:(id)a3;
- (void)_saveSuggestions;
- (void)_startGenerationTimerWithFireDate:(id)a3;
- (void)_stopGenerationTimer;
- (void)_syncSuggestions;
- (void)_updateGenerationTimestamps;
- (void)addObserver:(id)a3;
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)dealloc;
- (void)generateNewSuggestionsIfNecessary;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setGenerationTimerEnabled:(BOOL)a3;
- (void)setShouldObserveSuggestionsDefaultChanges:(BOOL)a3;
- (void)setSuggestedDestinations:(id)a3;
- (void)setSuggestions:(id)a3;
@end

@implementation TCSSuggestions

- (TCSSuggestions)initWithContactStore:(id)a3 contacts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)TCSSuggestions;
  v9 = [(TCSSuggestions *)&v35 init];
  if (v9)
  {
    v10 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.tincan.suggestions", v10);
    generationQueue = v9->_generationQueue;
    v9->_generationQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.tincan.suggestions.recents", v13);
    coreRecentsQueue = v9->_coreRecentsQueue;
    v9->_coreRecentsQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v9->_contacts, a4);
    [(TCSContacts *)v9->_contacts addObserver:v9];
    uint64_t v16 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v16;

    uint64_t v18 = objc_opt_new();
    npsManager = v9->_npsManager;
    v9->_npsManager = (NPSManager *)v18;

    v20 = [MEMORY[0x263F33668] defaultProvider];
    objc_initWeak(&location, v9);
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __48__TCSSuggestions_initWithContactStore_contacts___block_invoke;
    v32 = &unk_2644C8B00;
    objc_copyWeak(&v33, &location);
    v21 = (void *)MEMORY[0x223C32060](&v29);
    id v22 = objc_alloc(MEMORY[0x263F33580]);
    v23 = objc_msgSend(v20, "mainThreadScheduler", v29, v30, v31, v32);
    uint64_t v24 = [v22 initWithDelay:1 options:v21 block:v20 schedulerProvider:v23 downstreamScheduler:0.3];
    suggestionsSaveTimer = v9->_suggestionsSaveTimer;
    v9->_suggestionsSaveTimer = (CNCoalescingTimer *)v24;

    [(TCSSuggestions *)v9 setShouldObserveSuggestionsDefaultChanges:1];
    v26 = [MEMORY[0x263F08A00] defaultCenter];
    v27 = [MEMORY[0x263F57730] sharedInstance];
    [v26 addObserver:v9 selector:sel__deviceDidPair_ name:*MEMORY[0x263F576A8] object:v27];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  return v9;
}

void __48__TCSSuggestions_initWithContactStore_contacts___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _saveSuggestions];
}

- (void)dealloc
{
  [(IDSBatchIDQueryController *)self->_queryController invalidate];
  [(TCSContacts *)self->_contacts removeObserver:self];
  [(TCSSuggestions *)self setShouldObserveSuggestionsDefaultChanges:0];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  notify_cancel(self->_firstUnlockToken);
  notify_cancel(self->_npsInitialSyncToken);
  v4.receiver = self;
  v4.super_class = (Class)TCSSuggestions;
  [(TCSSuggestions *)&v4 dealloc];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)generateNewSuggestionsIfNecessary
{
  if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot])
  {
    if ([(TCSSuggestions *)self _shouldGenerateNewSuggestions])
    {
      objc_initWeak(location, self);
      generationQueue = self->_generationQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__TCSSuggestions_generateNewSuggestionsIfNecessary__block_invoke;
      block[3] = &unk_2644C8B00;
      objc_copyWeak(&v8, location);
      dispatch_async(generationQueue, block);
      objc_destroyWeak(&v8);
      objc_destroyWeak(location);
    }
  }
  else
  {
    _TCSInitializeLogging();
    objc_super v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "TCSSuggestions will wait for first device unlock before it checks if new suggestions should be generated.", (uint8_t *)location, 2u);
    }
    v5 = [MEMORY[0x263F08A00] defaultCenter];
    v6 = +[TCSBehavior sharedBehavior];
    [v5 addObserver:self selector:sel__handleDeviceFirstUnlock name:@"TCSFirstUnlockNotification" object:v6];
  }
}

void __51__TCSSuggestions_generateNewSuggestionsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _generateNewSuggestions];
}

- (NSUserDefaults)defaults
{
  defaults = self->_defaults;
  if (!defaults)
  {
    objc_super v4 = +[TCSTinCanUserDefaults defaults];
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (void)setShouldObserveSuggestionsDefaultChanges:(BOOL)a3
{
  if (self->_shouldObserveSuggestionsDefaultChanges != a3)
  {
    BOOL v3 = a3;
    self->_shouldObserveSuggestionsDefaultChanges = a3;
    v5 = [(TCSSuggestions *)self defaults];
    id v6 = v5;
    if (v3) {
      [v5 addObserver:self forKeyPath:@"Suggestions" options:1 context:TCSSuggestionsObservationContext];
    }
    else {
      [v5 removeObserver:self forKeyPath:@"Suggestions" context:TCSSuggestionsObservationContext];
    }
  }
}

- (NSMutableDictionary)suggestions
{
  if (!self->_suggestions && ([MEMORY[0x263F1C408] isRunningInStoreDemoMode] & 1) == 0)
  {
    BOOL v3 = [(TCSSuggestions *)self defaults];
    objc_super v4 = [v3 dictionaryForKey:@"Suggestions"];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [NSDictionary dictionary];
    }
    id v7 = v6;

    if ([v7 count])
    {
      id v8 = [(TCSSuggestions *)self _performHousekeepingOnSuggestions:v7];
      int v9 = [v7 isEqualToDictionary:v8];
      if ((v9 & 1) == 0)
      {
        id v10 = v8;

        id v7 = v10;
      }
      int v11 = v9 ^ 1;
    }
    else
    {
      int v11 = 0;
    }
    v12 = (NSMutableDictionary *)[v7 mutableCopy];
    suggestions = self->_suggestions;
    self->_suggestions = v12;

    if (v11) {
      [(CNCoalescingTimer *)self->_suggestionsSaveTimer handleEvent];
    }
  }
  dispatch_queue_t v14 = self->_suggestions;
  return v14;
}

- (NSArray)suggestedDestinations
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  suggestedDestinations = self->_suggestedDestinations;
  if (!suggestedDestinations)
  {
    objc_super v4 = [(TCSSuggestions *)self suggestions];
    v5 = [v4 allKeys];
    id v6 = (void *)[v5 mutableCopy];

    id v7 = [(TCSSuggestions *)self suggestions];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __39__TCSSuggestions_suggestedDestinations__block_invoke;
    v19[3] = &unk_2644C8B28;
    id v8 = v6;
    id v20 = v8;
    [v7 enumerateKeysAndObjectsUsingBlock:v19];

    int v9 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
    id v10 = self->_suggestedDestinations;
    self->_suggestedDestinations = v9;

    NSUInteger v11 = [(NSArray *)self->_suggestedDestinations count];
    _TCSInitializeLogging();
    v12 = TCSLogDefault;
    BOOL v13 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        dispatch_queue_t v14 = self->_suggestedDestinations;
        v15 = v12;
        uint64_t v16 = [(NSArray *)v14 componentsJoinedByString:@", "];
        v17 = TCSLogSafeDescription(v16);
        *(_DWORD *)buf = 138412290;
        id v22 = v17;
        _os_log_impl(&dword_21E834000, v15, OS_LOG_TYPE_DEFAULT, "TCSSuggestions has suggested destinations: %@", buf, 0xCu);
      }
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E834000, v12, OS_LOG_TYPE_DEFAULT, "TCSSuggestions has no suggested destinations.", buf, 2u);
    }
    [(TCSSuggestions *)self generateNewSuggestionsIfNecessary];

    suggestedDestinations = self->_suggestedDestinations;
  }
  return suggestedDestinations;
}

void __39__TCSSuggestions_suggestedDestinations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  v5 = [a3 objectForKeyedSubscript:@"Expired"];

  if (v5) {
    [*(id *)(a1 + 32) removeObject:v6];
  }
}

- (void)setGenerationTimerEnabled:(BOOL)a3
{
  if (self->_generationTimerEnabled != a3)
  {
    self->_generationTimerEnabled = a3;
    if (!a3) {
      [(TCSSuggestions *)self _stopGenerationTimer];
    }
  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v9 count])
  {
    if ([@"com.apple.private.alloy.tincan.audio" isEqualToString:v10])
    {
      if (v11)
      {
        _TCSInitializeLogging();
        v12 = TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
          -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:]((uint64_t)v11, v12);
        }
      }
      else
      {
        id v38 = v10;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v39 = v9;
        id v15 = v9;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v45 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8 * i);
              v21 = [(NSMutableDictionary *)self->_suggestedDestinationToStatus objectForKeyedSubscript:v20];

              if (v21)
              {
                id v22 = [v15 objectForKeyedSubscript:v20];
                [(NSMutableDictionary *)self->_suggestedDestinationToStatus setObject:v22 forKeyedSubscript:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v51 count:16];
          }
          while (v17);
        }

        uint64_t v23 = [MEMORY[0x263EFF910] date];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        uint64_t v24 = self->_suggestedDestinationToStatus;
        uint64_t v25 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v40 objects:v50 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v41;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v41 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = *(void **)(*((void *)&v40 + 1) + 8 * j);
              uint64_t v30 = [(NSMutableDictionary *)self->_suggestedDestinationToStatus objectForKeyedSubscript:v29];
              uint64_t v31 = [v30 integerValue];

              if (v31 == 1)
              {
                suggestions = self->_suggestions;
                if (!suggestions)
                {
                  id v33 = [(TCSSuggestions *)self suggestions];
                  suggestions = self->_suggestions;
                }
                v34 = [(NSMutableDictionary *)suggestions objectForKey:v29];

                if (!v34)
                {
                  _TCSInitializeLogging();
                  objc_super v35 = (void *)TCSLogDefault;
                  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
                  {
                    v36 = v35;
                    v37 = TCSLogSafeDescription(v29);
                    *(_DWORD *)buf = 138412290;
                    v49 = v37;
                    _os_log_impl(&dword_21E834000, v36, OS_LOG_TYPE_DEFAULT, "Adding new suggested and valid destination: %@", buf, 0xCu);
                  }
                  [(TCSSuggestions *)self _addSuggestedDestination:v29 withTimestamp:v23];
                }
              }
            }
            uint64_t v26 = [(NSMutableDictionary *)v24 countByEnumeratingWithState:&v40 objects:v50 count:16];
          }
          while (v26);
        }

        id v10 = v38;
        id v9 = v39;
        id v11 = 0;
      }
    }
    else
    {
      _TCSInitializeLogging();
      dispatch_queue_t v14 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
        -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:]((uint64_t)v10, v14);
      }
    }
  }
  else
  {
    _TCSInitializeLogging();
    BOOL v13 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR)) {
      -[TCSSuggestions batchQueryController:updatedDestinationsStatus:onService:error:](v13);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TCSSuggestionsObservationContext == a6)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__TCSSuggestions_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v7[3] = &unk_2644C8B50;
    v7[4] = self;
    TCSGuaranteeMainThread(v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TCSSuggestions;
    -[TCSSuggestions observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

uint64_t __65__TCSSuggestions_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_deleteSuggestions
{
  BOOL v3 = [(TCSSuggestions *)self defaults];
  [v3 removeObjectForKey:@"Suggestions"];

  objc_super v4 = [(TCSSuggestions *)self defaults];
  [v4 removeObjectForKey:@"SuggestionsFirstGenerated"];

  id v5 = [(TCSSuggestions *)self defaults];
  [v5 removeObjectForKey:@"SuggestionsPreviouslyGenerated"];
}

+ (id)_descriptorForRequiredKeys
{
  if (_descriptorForRequiredKeys_cn_once_token_8 != -1) {
    dispatch_once(&_descriptorForRequiredKeys_cn_once_token_8, &__block_literal_global);
  }
  v2 = (void *)_descriptorForRequiredKeys_cn_once_object_8;
  return v2;
}

void __44__TCSSuggestions__descriptorForRequiredKeys__block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFE9F8];
  uint64_t v1 = *MEMORY[0x263EFE020];
  v7[0] = *MEMORY[0x263EFDFE0];
  v7[1] = v1;
  uint64_t v2 = *MEMORY[0x263EFDF80];
  v7[2] = *MEMORY[0x263EFE070];
  v7[3] = v2;
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];
  objc_super v4 = [NSString stringWithUTF8String:"+[TCSSuggestions _descriptorForRequiredKeys]_block_invoke"];
  uint64_t v5 = [v0 descriptorWithKeyDescriptors:v3 description:v4];
  objc_super v6 = (void *)_descriptorForRequiredKeys_cn_once_object_8;
  _descriptorForRequiredKeys_cn_once_object_8 = v5;
}

- (void)_handleDeviceFirstUnlock
{
  _TCSInitializeLogging();
  BOOL v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "TCSSuggestions was notified of first device unlock.", v4, 2u);
  }
  [(TCSSuggestions *)self generateNewSuggestionsIfNecessary];
}

- (void)_invalidate
{
  suggestions = self->_suggestions;
  self->_suggestions = 0;

  suggestedDestinations = self->_suggestedDestinations;
  self->_suggestedDestinations = 0;

  [(TCSSuggestions *)self _notifyObserversSuggestionsChanged];
}

- (BOOL)_shouldGenerateNewSuggestions
{
  if ([MEMORY[0x263F1C408] isRunningInStoreDemoMode])
  {
    _TCSInitializeLogging();
    BOOL v3 = TCSLogDefault;
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E834000, v3, OS_LOG_TYPE_DEFAULT, "Suggestions are not generated while running in store demo mode.", buf, 2u);
      return 0;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    objc_super v6 = [(TCSSuggestions *)self defaults];
    id v7 = [v6 objectForKey:@"SuggestionsFirstGenerated"];

    if (v7)
    {
      [v5 timeIntervalSinceDate:v7];
      if (v8 <= 31536000.0)
      {
        id v10 = [(TCSSuggestions *)self defaults];
        id v11 = [v10 objectForKey:@"SuggestionsPreviouslyGenerated"];

        if (v11 && ([v5 timeIntervalSinceDate:v11], v12 < 86400.0))
        {
          if (![(NSTimer *)self->_suggestionGenerationTimer isValid])
          {
            BOOL v13 = [v11 dateByAddingTimeInterval:86400.0];
            [(TCSSuggestions *)self _startGenerationTimerWithFireDate:v13];
          }
          BOOL v4 = 0;
        }
        else
        {
          _TCSInitializeLogging();
          dispatch_queue_t v14 = TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)uint64_t v16 = 0;
            _os_log_impl(&dword_21E834000, v14, OS_LOG_TYPE_DEFAULT, "Suggestions will be generated.", v16, 2u);
          }
          BOOL v4 = 1;
        }
      }
      else
      {
        [(TCSSuggestions *)self _stopGenerationTimer];
        BOOL v4 = 0;
      }
    }
    else
    {
      _TCSInitializeLogging();
      id v9 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_21E834000, v9, OS_LOG_TYPE_DEFAULT, "Suggestions will be generated for the first time.", v17, 2u);
      }
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (void)_startGenerationTimerWithFireDate:(id)a3
{
  id v4 = a3;
  [(TCSSuggestions *)self _stopGenerationTimer];
  if (self->_generationTimerEnabled)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(MEMORY[0x263EFFA20]);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    id v11 = __52__TCSSuggestions__startGenerationTimerWithFireDate___block_invoke;
    double v12 = &unk_2644C8B98;
    objc_copyWeak(&v13, &location);
    objc_super v6 = (NSTimer *)[v5 initWithFireDate:v4 interval:0 repeats:&v9 block:0.0];
    suggestionGenerationTimer = self->_suggestionGenerationTimer;
    self->_suggestionGenerationTimer = v6;

    -[NSTimer setTolerance:](self->_suggestionGenerationTimer, "setTolerance:", 300.0, v9, v10, v11, v12);
    double v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [v8 addTimer:self->_suggestionGenerationTimer forMode:*MEMORY[0x263EFF478]];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __52__TCSSuggestions__startGenerationTimerWithFireDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained generateNewSuggestionsIfNecessary];
}

- (void)_stopGenerationTimer
{
  suggestionGenerationTimer = self->_suggestionGenerationTimer;
  if (suggestionGenerationTimer)
  {
    [(NSTimer *)suggestionGenerationTimer invalidate];
    id v4 = self->_suggestionGenerationTimer;
    self->_suggestionGenerationTimer = 0;
  }
}

- (void)_generateNewSuggestions
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  BOOL v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [(TCSSuggestions *)self _destinationsFromFavorites];
  [v3 unionSet:v4];

  id v5 = [(TCSSuggestions *)self _destinationsFromCallHistory];
  [v3 unionSet:v5];

  objc_super v6 = [(TCSSuggestions *)self _destinationsFromCoreRecents];
  [v3 unionSet:v6];

  [(TCSSuggestions *)self _updateGenerationTimestamps];
  unint64_t v7 = [v3 count];
  _TCSInitializeLogging();
  double v8 = TCSLogDefault;
  BOOL v9 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    val = self;
    if (v9)
    {
      uint64_t v10 = NSNumber;
      id v11 = v8;
      double v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", v7, self);
      uint64_t v13 = TCSLogSafeDescription(v12);
      dispatch_queue_t v14 = (void *)v13;
      id v15 = &stru_26CFCDDE8;
      if (v7 > 1) {
        id v15 = @"s";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v36 = v13;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_impl(&dword_21E834000, v11, OS_LOG_TYPE_DEFAULT, "Gathered %@ suggested destination%@ total:", buf, 0x16u);
    }
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v26 = v3;
    id v16 = v3;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v31 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          _TCSInitializeLogging();
          id v22 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v23 = v22;
            uint64_t v24 = TCSLogSafeDescription(v21);
            *(_DWORD *)buf = 138412290;
            uint64_t v36 = (uint64_t)v24;
            _os_log_impl(&dword_21E834000, v23, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v18);
    }

    objc_initWeak((id *)buf, val);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__TCSSuggestions__generateNewSuggestions__block_invoke;
    block[3] = &unk_2644C8BC0;
    objc_copyWeak(&v29, (id *)buf);
    id v28 = v16;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
    BOOL v3 = v26;
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E834000, v8, OS_LOG_TYPE_DEFAULT, "Suggestion generation pass gathered no suggestions.", buf, 2u);
  }
}

void __41__TCSSuggestions__generateNewSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performIDQueryForSuggestions:*(void *)(a1 + 32)];
}

- (void)_updateGenerationTimestamps
{
  id v8 = [MEMORY[0x263EFF910] date];
  BOOL v3 = [(TCSSuggestions *)self defaults];
  id v4 = [v3 objectForKey:@"SuggestionsFirstGenerated"];

  if (!v4)
  {
    id v5 = [(TCSSuggestions *)self defaults];
    [v5 setObject:v8 forKey:@"SuggestionsFirstGenerated"];
  }
  objc_super v6 = [(TCSSuggestions *)self defaults];
  [v6 setObject:v8 forKey:@"SuggestionsPreviouslyGenerated"];

  unint64_t v7 = [v8 dateByAddingTimeInterval:86400.0];
  [(TCSSuggestions *)self _startGenerationTimerWithFireDate:v7];
}

- (void)_saveSuggestions
{
  [(TCSSuggestions *)self setShouldObserveSuggestionsDefaultChanges:0];
  BOOL v3 = [(TCSSuggestions *)self defaults];
  id v4 = v3;
  suggestions = self->_suggestions;
  if (suggestions)
  {
    [v3 setObject:suggestions forKey:@"Suggestions"];
  }
  else
  {
    objc_super v6 = [NSDictionary dictionary];
    [v4 setObject:v6 forKey:@"Suggestions"];
  }
  [(TCSSuggestions *)self setShouldObserveSuggestionsDefaultChanges:1];
  [(TCSSuggestions *)self _syncSuggestions];
}

- (void)_syncSuggestions
{
  v12[3] = *MEMORY[0x263EF8340];
  if (NPSHasCompletedInitialSync())
  {
    npsManager = self->_npsManager;
    id v4 = (void *)MEMORY[0x263EFFA08];
    v12[0] = @"Suggestions";
    v12[1] = @"SuggestionsFirstGenerated";
    v12[2] = @"SuggestionsPreviouslyGenerated";
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:3];
    objc_super v6 = [v4 setWithArray:v5];
    [(NPSManager *)npsManager synchronizeUserDefaultsDomain:@"com.apple.tincan" keys:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    unint64_t v7 = (const char *)[(id)*MEMORY[0x263F57530] UTF8String];
    id v8 = MEMORY[0x263EF83A0];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__TCSSuggestions__syncSuggestions__block_invoke;
    v9[3] = &unk_2644C8BE8;
    objc_copyWeak(&v10, &location);
    notify_register_dispatch(v7, &self->_npsInitialSyncToken, MEMORY[0x263EF83A0], v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __34__TCSSuggestions__syncSuggestions__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[3] == a2)
  {
    id v4 = WeakRetained;
    [WeakRetained _syncSuggestions];
    notify_cancel(v4[3]);
    id WeakRetained = v4;
  }
}

- (void)_addSuggestedDestination:(id)a3 withTimestamp:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TCSSuggestions *)self suggestions];
  id v11 = @"Added";
  v12[0] = v6;
  BOOL v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v8 setObject:v9 forKey:v7];

  [(CNCoalescingTimer *)self->_suggestionsSaveTimer handleEvent];
  suggestedDestinations = self->_suggestedDestinations;
  self->_suggestedDestinations = 0;

  [(TCSSuggestions *)self _notifyObserversSuggestionsChanged];
}

- (id)_performHousekeepingOnSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  id v6 = [MEMORY[0x263EFF910] date];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  void v12[2] = __52__TCSSuggestions__performHousekeepingOnSuggestions___block_invoke;
  v12[3] = &unk_2644C8C10;
  id v13 = v6;
  dispatch_queue_t v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v12];

  BOOL v9 = v15;
  id v10 = v7;

  return v10;
}

void __52__TCSSuggestions__performHousekeepingOnSuggestions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"Added"];
  if (v6)
  {
    [*(id *)(a1 + 32) timeIntervalSinceDate:v6];
    BOOL v8 = v7 >= 7776000.0;
  }
  else
  {
    BOOL v8 = 0;
  }
  if ([*(id *)(*(void *)(a1 + 40) + 96) isDestinationAccepted:v14])
  {
    int v9 = 0;
  }
  else
  {
    int v9 = [*(id *)(*(void *)(a1 + 40) + 96) isDestinationAnInviter:v14];
    if ((v8 | v9) != 1) {
      goto LABEL_13;
    }
  }
  id v10 = (void *)[v5 mutableCopy];
  [v10 setObject:*(void *)(a1 + 32) forKey:@"Expired"];
  if ((v8 | v9) == 1)
  {
    id v11 = TCSDefaultsSuggestionExpiryReasonAgedOut;
    if (!v8) {
      id v11 = TCSDefaultsSuggestionExpiryReasonInviter;
    }
    double v12 = *v11;
  }
  else
  {
    double v12 = +[TCSTinCanUserDefaults suggestionExpiryReasonAllowlistedValue];
  }
  id v13 = v12;
  [v10 setObject:v12 forKey:@"ExpiryReason"];
  [*(id *)(a1 + 48) setObject:v10 forKey:v14];

LABEL_13:
}

- (id)_destinationsFromFavorites
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  uint64_t v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = objc_alloc(MEMORY[0x263EFEA98]);
  id v4 = objc_opt_new();
  id v5 = (void *)[v3 initWithContactStore:v4];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = [v5 entries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) contactProperty];
        double v12 = [v11 contact];

        if (v12)
        {
          id v13 = +[TCSContacts canonicalDestinationsForContact:v12];
          [v2 addObjectsFromArray:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v8);
  }

  uint64_t v14 = [v2 count];
  if (v14)
  {
    unint64_t v15 = v14;
    long long v33 = v5;
    _TCSInitializeLogging();
    id v16 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = NSNumber;
      uint64_t v18 = v16;
      uint64_t v19 = [v17 numberWithUnsignedInteger:v15];
      uint64_t v20 = TCSLogSafeDescription(v19);
      v21 = (void *)v20;
      id v22 = &stru_26CFCDDE8;
      if (v15 > 1) {
        id v22 = @"s";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v44 = v20;
      __int16 v45 = 2112;
      long long v46 = v22;
      _os_log_impl(&dword_21E834000, v18, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from Favorites:", buf, 0x16u);
    }
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v2;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          _TCSInitializeLogging();
          id v29 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            long long v30 = v29;
            long long v31 = TCSLogSafeDescription(v28);
            *(_DWORD *)buf = 138412290;
            uint64_t v44 = (uint64_t)v31;
            _os_log_impl(&dword_21E834000, v30, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v25);
    }

    id v5 = v33;
  }

  return v2;
}

- (id)_destinationsFromCallHistory
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-2419200.0];
  id v6 = [(TCSSuggestions *)self defaults];
  uint64_t v7 = [v6 objectForKey:@"SuggestionsPreviouslyGenerated"];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x263EFF910] distantPast];
  }
  id v10 = v9;

  long long v43 = v10;
  uint64_t v44 = v5;
  id v11 = [v5 laterDate:v10];
  [v4 setLimitingStartDate:v11];

  [v4 setCoalescingStrategy:*MEMORY[0x263F30618]];
  __int16 v45 = v4;
  [v4 recentCalls];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v47 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v47) {
          objc_enumerationMutation(obj);
        }
        unint64_t v15 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v16 = [v15 remoteParticipantHandles];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v65 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v53;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v53 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = *(void **)(*((void *)&v52 + 1) + 8 * j);
              if ([v21 type] == 2 || objc_msgSend(v21, "type") == 3)
              {
                id v22 = [v21 value];
                id v23 = +[TCSContacts _canonicalDestinationForString:v22];
                [v3 addObject:v23];
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v65 count:16];
          }
          while (v18);
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v66 count:16];
    }
    while (v13);
  }
  uint64_t v24 = [v3 count];
  if (v24)
  {
    unint64_t v25 = v24;
    _TCSInitializeLogging();
    uint64_t v26 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = NSNumber;
      id v28 = v26;
      id v29 = [v27 numberWithUnsignedInteger:v25];
      uint64_t v30 = TCSLogSafeDescription(v29);
      long long v31 = (void *)v30;
      long long v32 = &stru_26CFCDDE8;
      if (v25 > 1) {
        long long v32 = @"s";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v62 = v30;
      __int16 v63 = 2112;
      v64 = v32;
      _os_log_impl(&dword_21E834000, v28, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from Call History:", buf, 0x16u);
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v33 = v3;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v60 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v49;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v49 != v36) {
            objc_enumerationMutation(v33);
          }
          long long v38 = *(void **)(*((void *)&v48 + 1) + 8 * k);
          _TCSInitializeLogging();
          long long v39 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            long long v40 = v39;
            long long v41 = TCSLogSafeDescription(v38);
            *(_DWORD *)buf = 138412290;
            uint64_t v62 = (uint64_t)v41;
            _os_log_impl(&dword_21E834000, v40, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v60 count:16];
      }
      while (v35);
    }
  }
  return v3;
}

- (id)_destinationsFromCoreRecents
{
  v71[2] = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_generationQueue);
  id v52 = [MEMORY[0x263EFF9C0] set];
  id v3 = [MEMORY[0x263F37DB0] defaultInstance];
  id v4 = objc_opt_new();
  id v5 = (void *)MEMORY[0x263F37DB8];
  uint64_t v6 = *MEMORY[0x263F37D78];
  uint64_t v7 = (void *)*MEMORY[0x263F37D48];
  uint64_t v8 = (void *)*MEMORY[0x263F37D58];
  v71[0] = *MEMORY[0x263F37D48];
  v71[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
  id v10 = [v5 predicateForKey:v6 inCollection:v9];
  [v4 setSearchPredicate:v10];

  uint64_t v11 = *MEMORY[0x263F37D90];
  v70[0] = *MEMORY[0x263F37DA0];
  v70[1] = v11;
  uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:2];
  [v4 setDomains:v12];

  uint64_t v13 = [MEMORY[0x263F37DC0] frecencyComparator];
  [v4 setComparator:v13];

  uint64_t v14 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
  coreRecentsQueue = self->_coreRecentsQueue;
  v61[0] = MEMORY[0x263EF8330];
  v61[1] = 3221225472;
  v61[2] = __46__TCSSuggestions__destinationsFromCoreRecents__block_invoke;
  v61[3] = &unk_2644C8C38;
  id v17 = v14;
  id v62 = v17;
  uint64_t v18 = v15;
  __int16 v63 = v18;
  long long v49 = v4;
  long long v50 = v3;
  [v3 performRecentsSearch:v4 queue:coreRecentsQueue completion:v61];
  long long v48 = v18;
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obuint64_t j = v17;
  uint64_t v19 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v24 = [v23 kind];
        if ([v7 isEqualToString:v24])
        {
        }
        else
        {
          unint64_t v25 = [v23 kind];
          int v26 = [v8 isEqualToString:v25];

          if (!v26) {
            continue;
          }
        }
        uint64_t v27 = [v23 address];
        id v28 = +[TCSContacts _canonicalDestinationForString:v27];
        [v52 addObject:v28];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v20);
  }

  uint64_t v29 = [v52 count];
  if (v29)
  {
    unint64_t v30 = v29;
    _TCSInitializeLogging();
    long long v31 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      long long v32 = NSNumber;
      id v33 = v31;
      uint64_t v34 = [v32 numberWithUnsignedInteger:v30];
      uint64_t v35 = TCSLogSafeDescription(v34);
      uint64_t v36 = (void *)v35;
      long long v37 = &stru_26CFCDDE8;
      if (v30 > 1) {
        long long v37 = @"s";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v66 = v35;
      __int16 v67 = 2112;
      v68 = v37;
      _os_log_impl(&dword_21E834000, v33, OS_LOG_TYPE_DEFAULT, "Gathered %@ destination%@ from CoreRecents:", buf, 0x16u);
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v38 = v52;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v64 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v54 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = *(void **)(*((void *)&v53 + 1) + 8 * j);
          _TCSInitializeLogging();
          uint64_t v44 = (void *)TCSLogDefault;
          if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v45 = v44;
            long long v46 = TCSLogSafeDescription(v43);
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = (uint64_t)v46;
            _os_log_impl(&dword_21E834000, v45, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);
          }
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v53 objects:v64 count:16];
      }
      while (v40);
    }
  }
  return v52;
}

void __46__TCSSuggestions__destinationsFromCoreRecents__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
      if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count", (void)v9) > 0x1F) {
        break;
      }
      [*(id *)(a1 + 32) addObject:v8];
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_performIDQueryForSuggestions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(IDSBatchIDQueryController *)self->_queryController invalidate];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  suggestedDestinationToStatus = self->_suggestedDestinationToStatus;
  self->_suggestedDestinationToStatus = v5;

  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[TCSContacts _canonicalDestinationForString:](TCSContacts, "_canonicalDestinationForString:", *(void *)(*((void *)&v25 + 1) + 8 * v12), (void)v25);
        [v7 addObject:v13];
        [(NSMutableDictionary *)self->_suggestedDestinationToStatus setObject:&unk_26CFD1DC0 forKeyedSubscript:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  id v14 = objc_alloc(MEMORY[0x263F4A008]);
  dispatch_semaphore_t v15 = (IDSBatchIDQueryController *)[v14 initWithService:@"com.apple.private.alloy.tincan.audio" delegate:self queue:MEMORY[0x263EF83A0]];
  queryController = self->_queryController;
  self->_queryController = v15;

  [(IDSBatchIDQueryController *)self->_queryController setDestinations:v7];
  unint64_t v17 = [v7 count];
  _TCSInitializeLogging();
  uint64_t v18 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = NSNumber;
    uint64_t v20 = v18;
    uint64_t v21 = [v19 numberWithUnsignedInteger:v17];
    uint64_t v22 = TCSLogSafeDescription(v21);
    id v23 = (void *)v22;
    uint64_t v24 = &stru_26CFCDDE8;
    if (v17 > 1) {
      uint64_t v24 = @"s";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = v22;
    __int16 v31 = 2112;
    long long v32 = v24;
    _os_log_impl(&dword_21E834000, v20, OS_LOG_TYPE_DEFAULT, "IDS status query initiated for %@ suggested destination%@.", buf, 0x16u);
  }
}

- (void)_notifyObserversSuggestionsChanged
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (void *)[(NSHashTable *)self->_observers copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 suggestionsDidChange:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_deviceDidPair:(id)a3
{
  _TCSInitializeLogging();
  uint64_t v4 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21E834000, v4, OS_LOG_TYPE_DEFAULT, "Device did pair. Will check to see if we need to generate Walkie-Talkie suggested contacts.", v5, 2u);
  }
  [(TCSSuggestions *)self generateNewSuggestionsIfNecessary];
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
}

- (TCSContacts)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (void)setSuggestedDestinations:(id)a3
{
}

- (BOOL)generationTimerEnabled
{
  return self->_generationTimerEnabled;
}

- (void)setDefaults:(id)a3
{
}

- (BOOL)shouldObserveSuggestionsDefaultChanges
{
  return self->_shouldObserveSuggestionsDefaultChanges;
}

- (void)setSuggestions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_suggestedDestinations, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_suggestedDestinationToStatus, 0);
  objc_storeStrong((id *)&self->_queryController, 0);
  objc_storeStrong((id *)&self->_suggestionGenerationTimer, 0);
  objc_storeStrong((id *)&self->_suggestionsSaveTimer, 0);
  objc_storeStrong((id *)&self->_npsManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_coreRecentsQueue, 0);
  objc_storeStrong((id *)&self->_generationQueue, 0);
}

- (void)batchQueryController:(os_log_t)log updatedDestinationsStatus:onService:error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21E834000, log, OS_LOG_TYPE_ERROR, "IDS status query returned an empty status update!", v1, 2u);
}

- (void)batchQueryController:(uint64_t)a1 updatedDestinationsStatus:(NSObject *)a2 onService:error:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E834000, a2, OS_LOG_TYPE_ERROR, "IDS status query returned returned an error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)batchQueryController:(uint64_t)a1 updatedDestinationsStatus:(NSObject *)a2 onService:error:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E834000, a2, OS_LOG_TYPE_ERROR, "IDS status query returned results for service %@ which we do not care about.", (uint8_t *)&v2, 0xCu);
}

@end