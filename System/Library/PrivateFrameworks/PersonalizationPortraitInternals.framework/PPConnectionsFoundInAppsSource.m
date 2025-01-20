@interface PPConnectionsFoundInAppsSource
+ (id)sharedInstance;
- (PPConnectionsFoundInAppsSource)init;
- (PPConnectionsFoundInAppsSource)initWithFoundInAppsService:(id)a3;
- (id)identifier;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8;
@end

@implementation PPConnectionsFoundInAppsSource

- (id)identifier
{
  return @"foundinapps";
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = objc_opt_new();
  if (a7 == 4 || a7 == 2)
  {
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    fiaURLService = self->_fiaURLService;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __106__PPConnectionsFoundInAppsSource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke;
    v24[3] = &unk_1E65D5E70;
    v18 = v16;
    v25 = v18;
    id v26 = v13;
    id v27 = v14;
    id v28 = v12;
    id v19 = v15;
    id v29 = v19;
    [(SGSuggestionsServiceURLsProtocol *)fiaURLService recentURLsWithLimit:32 withCompletion:v24];
    [MEMORY[0x1E4F93B18] waitForSemaphore:v18];
    v20 = pp_connections_log_handle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = [v19 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPConnectionsFoundInAppsSource found %tu urls", buf, 0xCu);
    }

    id v22 = v19;
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

void __106__PPConnectionsFoundInAppsSource_locationItemsWithCriteria_earliest_latest_limit_consumer_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v49 = v6;
      id v50 = v5;
      uint64_t v10 = *(void *)v54;
      uint64_t v52 = *(void *)v54;
      while (1)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v53 + 1) + 8 * v11);
          id v13 = (void *)MEMORY[0x1CB79D060]();
          if ([v12 flags])
          {
            v18 = pp_connections_log_handle();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_30;
            }
            *(_WORD *)buf = 0;
            id v22 = v18;
            v23 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is from outgoing document";
            goto LABEL_16;
          }
          if (*(void *)(a1 + 40))
          {
            id v14 = [v12 receivedAt];
            uint64_t v15 = [v14 compare:*(void *)(a1 + 40)];

            if (v15 == -1)
            {
              v18 = pp_connections_log_handle();
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_30;
              }
              id v19 = [v12 receivedAt];
              *(_DWORD *)buf = 138412290;
              id v60 = v19;
              v20 = v18;
              uint64_t v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is too old. Received at %@";
              goto LABEL_24;
            }
          }
          if (*(void *)(a1 + 48))
          {
            dispatch_semaphore_t v16 = [v12 receivedAt];
            uint64_t v17 = [v16 compare:*(void *)(a1 + 48)];

            if (v17 == 1)
            {
              v18 = pp_connections_log_handle();
              if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
                goto LABEL_30;
              }
              id v19 = [v12 receivedAt];
              *(_DWORD *)buf = 138412290;
              id v60 = v19;
              v20 = v18;
              uint64_t v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is too new. Received at %@";
LABEL_24:
              _os_log_debug_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0xCu);

              goto LABEL_30;
            }
          }
          v24 = objc_msgSend(*(id *)(a1 + 56), "bundleIdentifier", v49, v50);
          v25 = [v12 bundleIdentifier];
          int v26 = [v24 isEqualToString:v25];

          if (v26)
          {
            v18 = pp_connections_log_handle();
            if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
              goto LABEL_30;
            }
            id v19 = [v12 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            id v60 = v19;
            v20 = v18;
            uint64_t v21 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is from the consumer (%@)";
            goto LABEL_24;
          }
          id v27 = [v12 url];
          id v28 = [v27 scheme];
          if ([v28 isEqualToString:@"maps"])
          {

LABEL_26:
            id v34 = objc_alloc(MEMORY[0x1E4F89DC0]);
            v35 = [v12 bundleIdentifier];
            v18 = [v34 initWithOriginatingBundleID:v35];

            v36 = [v12 url];
            [v18 setMapItemURL:v36];

            v37 = [v12 documentIdentifier];
            [v18 setDocumentID:v37];

            [v18 setSource:@"foundinapps"];
            v38 = [v12 receivedAt];
            [v18 setCreatedAt:v38];

            v39 = NSNumber;
            v40 = +[PPConnectionsParameters sharedInstance];
            [v40 foundInAppsSourceExpirySeconds];
            v41 = objc_msgSend(v39, "numberWithDouble:");
            [v18 setLifetime:v41];

            v42 = [v12 receivedFromHandle];
            uint64_t v43 = [v42 length];

            if (v43)
            {
              v44 = [v12 receivedFromHandle];
              [v18 setAuthorHandle:v44];

              v45 = (void *)MEMORY[0x1CB79D060]();
              v46 = [v12 receivedFromHandle];
              v57 = v46;
              v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];

              [v18 setContactHandles:v47];
            }
            [*(id *)(a1 + 64) addObject:v18];
            uint64_t v10 = v52;
            goto LABEL_30;
          }
          id v29 = [v12 url];
          [v29 host];
          uint64_t v30 = a1;
          uint64_t v31 = v9;
          v33 = uint64_t v32 = v7;
          char v51 = [v33 isEqualToString:@"maps.apple.com"];

          v7 = v32;
          uint64_t v9 = v31;
          a1 = v30;

          if (v51) {
            goto LABEL_26;
          }
          v18 = pp_connections_log_handle();
          uint64_t v10 = v52;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            id v22 = v18;
            v23 = "PPConnectionsFoundInAppsSource: ignoring SGURL that is not a Maps URL.";
LABEL_16:
            _os_log_debug_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_DEBUG, v23, buf, 2u);
          }
LABEL_30:

          ++v11;
        }
        while (v9 != v11);
        uint64_t v48 = [v7 countByEnumeratingWithState:&v53 objects:v58 count:16];
        uint64_t v9 = v48;
        if (!v48)
        {
          id v6 = v49;
          id v5 = v50;
          break;
        }
      }
    }
  }
  else
  {
    v7 = pp_connections_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v60 = v6;
      _os_log_error_impl(&dword_1CA9A8000, v7, OS_LOG_TYPE_ERROR, "PPConnectionsFoundInAppsSource: recentURLsWithLimit error: %@", buf, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
}

- (PPConnectionsFoundInAppsSource)init
{
  v3 = PPSharedSuggestionsURLService();
  v4 = [(PPConnectionsFoundInAppsSource *)self initWithFoundInAppsService:v3];

  return v4;
}

- (PPConnectionsFoundInAppsSource)initWithFoundInAppsService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPConnectionsFoundInAppsSource;
  id v6 = [(PPConnectionsFoundInAppsSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fiaURLService, a3);
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_5594 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_5594, &__block_literal_global_5595);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_5596;
  return v2;
}

void __48__PPConnectionsFoundInAppsSource_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_5596;
  sharedInstance__pasExprOnceResult_5596 = v1;
}

@end