@interface TUSuggestionsMetadataCacheDataProvider
+ (BOOL)canUseSiriSuggestions;
+ (BOOL)shouldQuerySupportsInfo;
+ (SGSuggestionsServiceContactsProtocol)sharedService;
+ (id)newestSuggestedContactForDestinationID:(id)a3;
+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 error:(id *)a5;
+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 supportsInfoLookup:(BOOL)a5 error:(id *)a6;
+ (void)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 withCompletion:(id)a5;
- (OS_dispatch_semaphore)suggestionsServiceThrottleSemaphore;
- (TUSuggestionsMetadataCacheDataProvider)init;
- (id)suggestionsContactsObserver;
- (void)setSuggestionsServiceThrottleSemaphore:(id)a3;
- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4;
@end

@implementation TUSuggestionsMetadataCacheDataProvider

void __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    v7 = *(void **)(a1 + 32);
    v8 = [v5 firstObject];
    [v7 setObject:v8 forDestinationID:*(void *)(a1 + 40)];
  }
  if (v6)
  {
    v9 = TUDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_19C496000, v9, OS_LOG_TYPE_DEFAULT, "Could not fetch suggested contact via [SGSuggestionsService namesForDetail:limitTo:prependMaybe:withCompletion:]: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v10 = TUDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(a1, v10);
  }

  v11 = [*(id *)(a1 + 32) suggestionsServiceThrottleSemaphore];
  dispatch_semaphore_signal(v11);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

- (TUSuggestionsMetadataCacheDataProvider)init
{
  v12.receiver = self;
  v12.super_class = (Class)TUSuggestionsMetadataCacheDataProvider;
  v2 = [(TUMetadataCacheDataProvider *)&v12 init];
  if (v2)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(9);
    suggestionsServiceThrottleSemaphore = v2->_suggestionsServiceThrottleSemaphore;
    v2->_suggestionsServiceThrottleSemaphore = (OS_dispatch_semaphore *)v3;

    objc_initWeak(&location, v2);
    id v5 = [(id)objc_opt_class() sharedService];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __46__TUSuggestionsMetadataCacheDataProvider_init__block_invoke;
    v9[3] = &unk_1E58E5E58;
    objc_copyWeak(&v10, &location);
    uint64_t v6 = [v5 registerContactsChangeObserver:v9];
    id suggestionsContactsObserver = v2->_suggestionsContactsObserver;
    v2->_id suggestionsContactsObserver = (id)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)updateCacheWithDestinationIDs:(id)a3 withGroup:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v28;
    *(void *)&long long v9 = 138412290;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v13, "handle", v23);
        v15 = [v14 normalizedValue];

        if ([v15 length])
        {
          v16 = [(TUSuggestionsMetadataCacheDataProvider *)self suggestionsServiceThrottleSemaphore];
          dispatch_time_t v17 = dispatch_time(0, 1000000000);
          intptr_t v18 = dispatch_semaphore_wait(v16, v17);

          v19 = TUDefaultLog();
          v20 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v32 = v13;
              _os_log_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEFAULT, "[WARN] TUSuggestionsMetadataCacheDataProvider waited too long for other requests and will not look up '%@'", buf, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v23;
              v32 = v15;
              _os_log_debug_impl(&dword_19C496000, v20, OS_LOG_TYPE_DEBUG, "dispatch_group_enter %@", buf, 0xCu);
            }

            dispatch_group_enter(v7);
            v21 = objc_opt_class();
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke;
            v24[3] = &unk_1E58E5E80;
            v24[4] = self;
            v24[5] = v13;
            id v22 = v15;
            id v25 = v22;
            v26 = v7;
            [v21 suggestedNamesForDestinationID:v22 onlySignificant:0 withCompletion:v24];
          }
        }
      }
      uint64_t v10 = [v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v10);
  }
}

- (OS_dispatch_semaphore)suggestionsServiceThrottleSemaphore
{
  return self->_suggestionsServiceThrottleSemaphore;
}

+ (void)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  long long v9 = [a1 sharedService];
  if (v9 && [a1 canUseSiriSuggestions])
  {
    if ([(id)objc_opt_class() shouldQuerySupportsInfo]) {
      [v9 namesForDetail:v10 limitTo:1 prependMaybe:1 onlySignificant:v6 supportsInfoLookup:1 withCompletion:v8];
    }
    else {
      [v9 namesForDetail:v10 limitTo:1 prependMaybe:1 onlySignificant:v6 withCompletion:v8];
    }
  }
  else if (v8)
  {
    (*((void (**)(id, void, void))v8 + 2))(v8, MEMORY[0x1E4F1CBF0], 0);
  }
}

+ (SGSuggestionsServiceContactsProtocol)sharedService
{
  if (sharedService_onceToken != -1) {
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedService_sharedService;

  return (SGSuggestionsServiceContactsProtocol *)v2;
}

+ (BOOL)shouldQuerySupportsInfo
{
  return 0;
}

+ (BOOL)canUseSiriSuggestions
{
  v2 = (void *)CFPreferencesCopyAppValue(@"AppCanShowSiriSuggestionsBlacklist", @"com.apple.suggestions");
  char v3 = [v2 containsObject:@"com.apple.mobilephone"] ^ 1;

  return v3;
}

void __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke()
{
  uint64_t v0 = [(id)CUTWeakLinkClass() serviceForContacts];
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = v0;

  [(id)sharedService_sharedService setSyncTimeout:5.0];
  if (!sharedService_sharedService)
  {
    v2 = TUDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke_cold_1(v2);
    }
  }
}

+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  long long v9 = objc_msgSend(v8, "suggestedNamesForDestinationID:onlySignificant:supportsInfoLookup:error:", v7, v6, objc_msgSend((id)objc_opt_class(), "shouldQuerySupportsInfo"), a5);

  return v9;
}

+ (id)suggestedNamesForDestinationID:(id)a3 onlySignificant:(BOOL)a4 supportsInfoLookup:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [a1 sharedService];
  if (v11 && [a1 canUseSiriSuggestions])
  {
    if ([(id)objc_opt_class() shouldQuerySupportsInfo]) {
      [v11 namesForDetail:v10 limitTo:1 prependMaybe:1 onlySignificant:v8 supportsInfoLookup:v7 error:a6];
    }
    else {
    objc_super v12 = [v11 namesForDetail:v10 limitTo:1 prependMaybe:1 onlySignificant:v8 error:a6];
    }
  }
  else
  {
    objc_super v12 = 0;
  }
  if (v12) {
    id v13 = v12;
  }
  else {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  return v14;
}

+ (id)newestSuggestedContactForDestinationID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![a1 canUseSiriSuggestions]) {
    goto LABEL_14;
  }
  if (![v4 destinationIdIsEmailAddress])
  {
    if ([v4 destinationIdIsPhoneNumber])
    {
      long long v9 = [a1 sharedService];
      id v30 = 0;
      BOOL v6 = [v9 contactMatchesByPhoneNumber:v4 error:&v30];
      id v7 = v30;

      if (!v6 && v7)
      {
        BOOL v8 = TUDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          +[TUSuggestionsMetadataCacheDataProvider newestSuggestedContactForDestinationID:]();
        }
        goto LABEL_12;
      }
      goto LABEL_17;
    }
LABEL_14:
    id v7 = 0;
    BOOL v6 = 0;
    goto LABEL_15;
  }
  id v5 = [a1 sharedService];
  id v31 = 0;
  BOOL v6 = [v5 contactMatchesByEmailAddress:v4 error:&v31];
  id v7 = v31;

  if (v6 || !v7)
  {
LABEL_17:
    if (v6)
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      BOOL v6 = v6;
      id v10 = (void *)[v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
      if (v10)
      {
        id v24 = v7;
        id v25 = v4;
        BOOL v8 = 0;
        uint64_t v13 = *(void *)v27;
        uint64_t v14 = -1;
        do
        {
          for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v6);
            }
            v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            dispatch_time_t v17 = objc_msgSend(v16, "contact", v24);
            intptr_t v18 = [v17 recordId];
            uint64_t v19 = [v18 numericValue];

            if (v19 > v14)
            {
              v20 = [v16 contact];
              v21 = [v20 recordId];
              uint64_t v14 = [v21 numericValue];

              id v22 = v16;
              BOOL v8 = v22;
            }
          }
          id v10 = (void *)[v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
        }
        while (v10);

        id v7 = v24;
        if (!v8)
        {
          id v10 = 0;
          id v4 = v25;
          goto LABEL_16;
        }
        long long v23 = [v8 contact];
        id v10 = [v23 cnContact];

        id v4 = v25;
      }
      else
      {
        BOOL v8 = v6;
      }
      goto LABEL_13;
    }
LABEL_15:
    id v10 = 0;
    goto LABEL_16;
  }
  BOOL v8 = TUDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[TUSuggestionsMetadataCacheDataProvider newestSuggestedContactForDestinationID:]();
  }
LABEL_12:
  BOOL v6 = 0;
  id v10 = 0;
LABEL_13:

LABEL_16:
  id v11 = v10;

  return v11;
}

void __46__TUSuggestionsMetadataCacheDataProvider_init__block_invoke(uint64_t a1)
{
  v2 = TUDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19C496000, v2, OS_LOG_TYPE_DEFAULT, "Handling Suggestions contacts change by refreshing", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refresh];
}

- (void)setSuggestionsServiceThrottleSemaphore:(id)a3
{
}

- (id)suggestionsContactsObserver
{
  return self->_suggestionsContactsObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsContactsObserver, 0);

  objc_storeStrong((id *)&self->_suggestionsServiceThrottleSemaphore, 0);
}

void __55__TUSuggestionsMetadataCacheDataProvider_sharedService__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C496000, log, OS_LOG_TYPE_ERROR, "serviceForContacts is nil", v1, 2u);
}

+ (void)newestSuggestedContactForDestinationID:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Retrieving suggested contact matches by email address %@ failed with error %@.");
}

+ (void)newestSuggestedContactForDestinationID:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_19C496000, v0, v1, "Retrieving suggested contact matches by phone number %@ failed with error %@.");
}

void __82__TUSuggestionsMetadataCacheDataProvider_updateCacheWithDestinationIDs_withGroup___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19C496000, a2, OS_LOG_TYPE_DEBUG, "dispatch_group_leave %@", (uint8_t *)&v3, 0xCu);
}

@end