@interface TITextCheckerExemptionsImpl
+ (id)sharedTextCheckerExemptionsImpl;
- (BOOL)stringIsExemptFromChecker:(id)a3;
- (NSSet)addressBookTokens;
- (NSSet)userDictionaryTokens;
- (NSUUID)userDictionaryUUID;
- (void)addObserverAssertion;
- (void)dealloc;
- (void)removeObserverAssertion;
- (void)setAddressBookTokens:(id)a3;
- (void)setUserDictionaryTokens:(id)a3;
- (void)setUserDictionaryUUID:(id)a3;
@end

@implementation TITextCheckerExemptionsImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDictionaryUUID, 0);
  objc_storeStrong((id *)&self->_userDictionaryTokens, 0);
  objc_storeStrong((id *)&self->_addressBookTokens, 0);
  objc_storeStrong(&self->_userDictionaryObserver, 0);

  objc_storeStrong(&self->_contactObserver, 0);
}

- (void)setUserDictionaryUUID:(id)a3
{
}

- (NSUUID)userDictionaryUUID
{
  return self->_userDictionaryUUID;
}

- (void)setUserDictionaryTokens:(id)a3
{
}

- (NSSet)userDictionaryTokens
{
  return self->_userDictionaryTokens;
}

- (void)setAddressBookTokens:(id)a3
{
}

- (NSSet)addressBookTokens
{
  return self->_addressBookTokens;
}

- (void)removeObserverAssertion
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    unint64_t v3 = self->_observerAssertionCount - 1;
    self->_observerAssertionCount = v3;
    v4 = TIPersonalizationContactOSLogFacility();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:removeObserverAssertion - skipping observer", "-[TITextCheckerExemptionsImpl removeObserverAssertion]");
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:removeObserverAssertion - removing observer", "-[TITextCheckerExemptionsImpl removeObserverAssertion]");
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      v8 = +[TITransientLexiconManager sharedInstance];
      [v8 removeContactObserver:self->_contactObserver];

      id contactObserver = self->_contactObserver;
      self->_id contactObserver = 0;

      v10 = +[TIUserDictionaryServer sharedInstance];
      [v10 removeObserver:self->_userDictionaryObserver];

      id userDictionaryObserver = self->_userDictionaryObserver;
      self->_id userDictionaryObserver = 0;
    }
  }
  else
  {
    TIDispatchAsync();
  }
}

uint64_t __54__TITextCheckerExemptionsImpl_removeObserverAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeObserverAssertion];
}

- (void)addObserverAssertion
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    unint64_t observerAssertionCount = self->_observerAssertionCount;
    self->_unint64_t observerAssertionCount = observerAssertionCount + 1;
    v4 = TIPersonalizationContactOSLogFacility();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (observerAssertionCount)
    {
      if (v5)
      {
        v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:addObserverAssertion - skipping observer", "-[TITextCheckerExemptionsImpl addObserverAssertion]");
        *(_DWORD *)buf = 138412290;
        v16 = v6;
        _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
    }
    else
    {
      if (v5)
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:addObserverAssertion - adding observer", "-[TITextCheckerExemptionsImpl addObserverAssertion]");
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
      }
      v8 = +[TITransientLexiconManager sharedInstance];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_41;
      v14[3] = &unk_1E6E2BB68;
      v14[4] = self;
      v9 = [v8 addContactObserver:v14];
      id contactObserver = self->_contactObserver;
      self->_id contactObserver = v9;

      v4 = +[TIUserDictionaryServer sharedInstance];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_49;
      v13[3] = &unk_1E6E2CB20;
      v13[4] = self;
      v11 = [v4 addObserver:v13];
      id userDictionaryObserver = self->_userDictionaryObserver;
      self->_id userDictionaryObserver = v11;
    }
  }
  else
  {
    v14[5] = MEMORY[0x1E4F143A8];
    v14[6] = 3221225472;
    v14[7] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke;
    v14[8] = &unk_1E6E2DE00;
    v14[9] = self;
    TIDispatchAsync();
  }
}

uint64_t __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addObserverAssertion];
}

void __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  unint64_t v3 = TIPersonalizationContactOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s TITextCheckerExemptions:addObserverAssertion - processing %ld contacts", "-[TITextCheckerExemptionsImpl addObserverAssertion]_block_invoke", objc_msgSend(v2, "count"));
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }
  BOOL v5 = [MEMORY[0x1E4F1CA80] set];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [v2 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v28 = *(void *)v38;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(obj);
        }
        id v9 = v2;
        v10 = [v2 objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * v8)];
        v11 = [v10 flatten];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v34;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v34 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v33 + 1) + 8 * v15) lowercaseString];
              [v5 addObject:v16];

              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v13);
        }

        ++v8;
        id v2 = v9;
      }
      while (v8 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v7);
  }

  uint64_t v17 = +[TIProactiveQuickTypeManager sharedInstance];
  v18 = [v17 searchForMeCardEmailAddresses];

  if (v18)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v19 = v18;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v29 + 1) + 8 * v23) lowercaseString];
          [v5 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v29 objects:v41 count:16];
      }
      while (v21);
    }
  }
  id v25 = *(id *)(a1 + 32);
  objc_sync_enter(v25);
  [*(id *)(a1 + 32) setAddressBookTokens:v5];
  objc_sync_exit(v25);
}

void __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[TIUserDictionaryServer sharedInstance];
  BOOL v5 = [v4 userDictionaryUUID];

  id v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  uint64_t v7 = [*(id *)(a1 + 32) userDictionaryUUID];
  objc_sync_exit(v6);

  if (([v7 isEqual:v5] & 1) == 0)
  {
    v24 = v7;
    uint64_t v25 = a1;
    v26 = v5;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
    id v27 = v3;
    id v9 = v3;
    id v10 = v8;
    v11 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v9;
    uint64_t v12 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v33 + 1) + 8 * v15);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v17 = [v11 allTokensForString:v16];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v30;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v30 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = [*(id *)(*((void *)&v29 + 1) + 8 * v21) lowercaseString];
                [v10 addObject:v22];

                ++v21;
              }
              while (v19 != v21);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v13);
        uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    id v23 = *(id *)(v25 + 32);
    objc_sync_enter(v23);
    [*(id *)(v25 + 32) setUserDictionaryTokens:v10];
    BOOL v5 = v26;
    [*(id *)(v25 + 32) setUserDictionaryUUID:v26];
    objc_sync_exit(v23);

    id v3 = v27;
    uint64_t v7 = v24;
  }
}

- (BOOL)stringIsExemptFromChecker:(id)a3
{
  v4 = [a3 lowercaseString];
  BOOL v5 = self;
  objc_sync_enter(v5);
  id v6 = [(TITextCheckerExemptionsImpl *)v5 addressBookTokens];
  uint64_t v7 = [(TITextCheckerExemptionsImpl *)v5 userDictionaryTokens];
  objc_sync_exit(v5);

  if ([v6 containsObject:v4] & 1) != 0 || (objc_msgSend(v7, "containsObject:", v4))
  {
    char v8 = 1;
  }
  else
  {
    id v9 = +[TITransientLexiconManager sharedInstance];
    char v8 = [v9 searchForWordCaseInsensitive:v4];
  }
  return v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TITextCheckerExemptionsImpl;
  [(TITextCheckerExemptionsImpl *)&v2 dealloc];
}

+ (id)sharedTextCheckerExemptionsImpl
{
  if (+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::onceToken != -1) {
    dispatch_once(&+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::onceToken, &__block_literal_global_5938);
  }
  objc_super v2 = (void *)+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::singleton;

  return v2;
}

uint64_t __62__TITextCheckerExemptionsImpl_sharedTextCheckerExemptionsImpl__block_invoke()
{
  +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::singleton = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end