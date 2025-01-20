@interface RMConfigurationSubscriberClient
+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4;
+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4 initializeSandbox:(BOOL)a5;
+ (void)_currentLocaleDidChange:(id)a3;
+ (void)_loadDynamicSchema;
+ (void)_registerApplicatorModelClasses:(id)a3;
+ (void)_registerForLocaleChange;
+ (void)_registerPublisherModelClasses:(id)a3;
- (RMConfigurationSubscriberDelegate)subscriberDelegate;
- (RMStatusPublisherDelegate)publisherDelegate;
- (void)_buildSubscribedReferences:(id)a3 declarations:(id)a4 store:(id)a5;
- (void)fetchConfigurationUIsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)fetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5;
- (void)sendStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6;
- (void)setPublisherDelegate:(id)a3;
- (void)setSubscriberDelegate:(id)a3;
@end

@implementation RMConfigurationSubscriberClient

+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4
{
  return [a1 runConfigurationSubscriberClientWithApplicators:a3 publisherClass:a4 initializeSandbox:1];
}

+ (int)runConfigurationSubscriberClientWithApplicators:(id)a3 publisherClass:(Class)a4 initializeSandbox:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [MEMORY[0x263F635B0] configurationSubscriberClient];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:initializeSandbox:](v9);
  }

  v10 = [MEMORY[0x263F635B0] configurationSubscriberClient];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:initializeSandbox:](v5, v10);
  }

  if (v5 && ![MEMORY[0x263F635C8] configureSandbox])
  {
    int v20 = 78;
  }
  else
  {
    v11 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSUserName();
      *(_DWORD *)buf = 138412290;
      v24 = v12;
      _os_log_impl(&dword_25B003000, v11, OS_LOG_TYPE_INFO, "User: %@", buf, 0xCu);
    }
    v13 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = NSHomeDirectory();
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_25B003000, v13, OS_LOG_TYPE_INFO, "Home directory: %@", buf, 0xCu);
    }
    v15 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = NSTemporaryDirectory();
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_25B003000, v15, OS_LOG_TYPE_INFO, "Temp directory: %@", buf, 0xCu);
    }
    [a1 _registerForLocaleChange];
    [a1 _loadDynamicSchema];
    [a1 _registerApplicatorModelClasses:v8];
    if (a4)
    {
      Class v22 = a4;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
      [a1 _registerPublisherModelClasses:v17];
    }
    v18 = [[RMConfigurationSubscriberXPCListenerDelegate alloc] initWithApplicators:v8 publisherClass:a4];
    v19 = [MEMORY[0x263F08D88] serviceListener];
    [v19 setDelegate:v18];
    [v19 resume];

    int v20 = 0;
  }

  return v20;
}

+ (void)_registerForLocaleChange
{
  v3 = [MEMORY[0x263F635B0] configurationSubscriberClient];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_25B003000, v3, OS_LOG_TYPE_INFO, "Subscribing to locale changes.", v5, 2u);
  }

  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:a1 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x263EFF458] object:0];
}

+ (void)_currentLocaleDidChange:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263F635B0], "configurationSubscriberClient", a3);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_25B003000, v3, OS_LOG_TYPE_DEFAULT, "Notified of locale change. Exiting when clean.", v4, 2u);
  }

  xpc_transaction_exit_clean();
}

+ (void)_loadDynamicSchema
{
  v2 = (void *)MEMORY[0x263F635A8];
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 resourceURL];
  id v14 = [v2 configurationSchemaDirectoryForXPCServiceResourceURL:v4];

  BOOL v5 = [MEMORY[0x263F08850] defaultManager];
  v6 = [v14 path];
  LODWORD(v4) = [v5 fileExistsAtPath:v6];

  if (v4) {
    [MEMORY[0x263F63658] loadDynamicSchemaFromDirectory:v14];
  }
  v7 = (void *)MEMORY[0x263F635A8];
  id v8 = [MEMORY[0x263F086E0] mainBundle];
  v9 = [v8 resourceURL];
  v10 = [v7 statusSchemaDirectoryForXPCServiceResourceURL:v9];

  v11 = [MEMORY[0x263F08850] defaultManager];
  v12 = [v10 path];
  int v13 = [v11 fileExistsAtPath:v12];

  if (v13) {
    [MEMORY[0x263F63690] loadDynamicSchemaFromDirectory:v10];
  }
}

+ (void)_registerApplicatorModelClasses:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          v9 = [v8 supportedConfigurationClassesArray];
          [MEMORY[0x263F63640] ensureClassForDeclarations:v9];
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_11;
          }
          v9 = [v8 supportedConfigurationClasses];
          v10 = (void *)MEMORY[0x263F63640];
          v11 = [v9 allObjects];
          [v10 ensureClassForDeclarations:v11];
        }
LABEL_11:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

+ (void)_registerPublisherModelClasses:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector())
        {
          v9 = [v8 supportedStatusClasses];
          [MEMORY[0x263F63640] ensureClassForStatusItems:v9];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)fetchConfigurationsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__RMConfigurationSubscriberClient_fetchConfigurationsWithTypes_scope_completionHandler___block_invoke;
  v12[3] = &unk_26548F5C8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  +[RMSubscriberStore subscribedStoreDeclarationsWithScope:a4 configurationTypes:v11 completionHandler:v12];
}

void __88__RMConfigurationSubscriberClient_fetchConfigurationsWithTypes_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v36 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) subscriberDelegate];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) subscriberDelegate];
      id v11 = [*(id *)(a1 + 40) allObjects];
      [v10 didFailToFetchConfigurationsWithTypes:v11 scope:*(void *)(a1 + 56) error:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v33 = 0;
    long long v12 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v35 = a1;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v19 = objc_opt_new();
          [v12 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v15);
    }

    int v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v7;
    id v21 = v7;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v27 = *(void **)(v35 + 32);
          v28 = objc_msgSend(v26, "identifier", v33);
          v29 = [v36 objectForKeyedSubscript:v28];
          [v27 _buildSubscribedReferences:v12 declarations:v29 store:v26];

          v30 = [v26 identifier];
          [v20 setObject:v26 forKeyedSubscript:v30];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v23);
    }

    v31 = [*(id *)(v35 + 32) subscriberDelegate];

    if (v31)
    {
      v32 = [*(id *)(v35 + 32) subscriberDelegate];
      [v32 didFetchConfigurationsByType:v12 storesByIdentifier:v20 scope:*(void *)(v35 + 56) completionHandler:*(void *)(v35 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(v35 + 48) + 16))();
    }
    id v8 = v33;
    id v7 = v34;
  }
}

- (void)fetchConfigurationUIsWithTypes:(id)a3 scope:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__RMConfigurationSubscriberClient_fetchConfigurationUIsWithTypes_scope_completionHandler___block_invoke;
  v12[3] = &unk_26548F5C8;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a4;
  id v10 = v9;
  id v11 = v8;
  +[RMSubscriberStore subscribedStoreConfigurationsVisibleUIWithScope:a4 configurationTypes:v11 completionHandler:v12];
}

void __90__RMConfigurationSubscriberClient_fetchConfigurationUIsWithTypes_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v36 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = [*(id *)(a1 + 32) subscriberDelegate];

    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) subscriberDelegate];
      id v11 = [*(id *)(a1 + 40) allObjects];
      [v10 didFailToFetchConfigurationsWithTypes:v11 scope:*(void *)(a1 + 56) error:v8];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v33 = 0;
    long long v12 = objc_opt_new();
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v35 = a1;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          v19 = objc_opt_new();
          [v12 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v15);
    }

    int v20 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v34 = v7;
    id v21 = v7;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          v27 = *(void **)(v35 + 32);
          v28 = objc_msgSend(v26, "identifier", v33);
          v29 = [v36 objectForKeyedSubscript:v28];
          [v27 _buildSubscribedReferences:v12 declarations:v29 store:v26];

          v30 = [v26 identifier];
          [v20 setObject:v26 forKeyedSubscript:v30];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v23);
    }

    v31 = [*(id *)(v35 + 32) subscriberDelegate];

    if (v31)
    {
      v32 = [*(id *)(v35 + 32) subscriberDelegate];
      [v32 didFetchConfigurationsWithVisibleUIByType:v12 storesByIdentifier:v20 scope:*(void *)(v35 + 56) completionHandler:*(void *)(v35 + 48)];
    }
    else
    {
      (*(void (**)(void))(*(void *)(v35 + 48) + 16))();
    }
    id v8 = v33;
    id v7 = v34;
  }
}

- (void)sendStatusKeys:(id)a3 storeIdentifier:(id)a4 scope:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke;
  v16[3] = &unk_26548F618;
  id v17 = v11;
  uint64_t v18 = self;
  id v19 = v10;
  id v20 = v12;
  id v13 = v10;
  id v14 = v12;
  id v15 = v11;
  +[RMSubscriberStore storeWithIdentifier:v15 scope:a5 completionHandler:v16];
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_2();
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) publisherDelegate];

    if (v8)
    {
      id v9 = [*(id *)(a1 + 40) publisherDelegate];
      id v10 = *(void **)(a1 + 48);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_30;
      v11[3] = &unk_26548F5F0;
      id v12 = v10;
      id v14 = *(id *)(a1 + 56);
      id v13 = v5;
      [v9 fetchStatusForStatusKeys:v12 store:v13 completionHandler:v11];

      goto LABEL_7;
    }
    id v7 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(v7);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_7:
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = [MEMORY[0x263F635B0] configurationSubscriberClient];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_30_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) publishStatus:a2 completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)_buildSubscribedReferences:(id)a3 declarations:(id)a4 store:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v39 = a3;
  id v7 = a4;
  id v38 = a5;
  id v8 = objc_opt_new();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = [v14 declarationIdentifier];
          [v8 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v11);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v9;
  uint64_t v16 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v47;
    *(void *)&long long v17 = 138543362;
    long long v36 = v17;
    uint64_t v37 = *(void *)v47;
    do
    {
      uint64_t v20 = 0;
      uint64_t v40 = v18;
      do
      {
        if (*(void *)v47 != v19) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(void **)(*((void *)&v46 + 1) + 8 * v20);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = [v21 assetReferences];
          uint64_t v23 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v22, "count"));
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          id v24 = v22;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v56 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v43;
            do
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v43 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "identifier", v36);
                v30 = [v8 objectForKeyedSubscript:v29];
                if (v30) {
                  [v23 addObject:v30];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v56 count:16];
            }
            while (v26);
          }

          if (![v23 count])
          {

            uint64_t v23 = 0;
          }
          v31 = [[RMSubscribedConfigurationReference alloc] initWithDeclaration:v21 subscriberStore:v38 assets:v23];
          v32 = [v21 declarationType];
          v33 = [v39 objectForKeyedSubscript:v32];
          id v34 = v33;
          uint64_t v19 = v37;
          if (v33)
          {
            [v33 addObject:v31];
          }
          else
          {
            uint64_t v35 = [MEMORY[0x263F635B0] configurationSubscriberClient];
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v36;
              v55 = v32;
              _os_log_error_impl(&dword_25B003000, v35, OS_LOG_TYPE_ERROR, "Store returned unexpected configuration type %{public}@ - ignoring", buf, 0xCu);
            }
          }
          uint64_t v18 = v40;
        }
        ++v20;
      }
      while (v20 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v46 objects:v57 count:16];
    }
    while (v18);
  }
}

- (RMConfigurationSubscriberDelegate)subscriberDelegate
{
  return self->_subscriberDelegate;
}

- (void)setSubscriberDelegate:(id)a3
{
}

- (RMStatusPublisherDelegate)publisherDelegate
{
  return self->_publisherDelegate;
}

- (void)setPublisherDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherDelegate, 0);
  objc_storeStrong((id *)&self->_subscriberDelegate, 0);
}

+ (void)runConfigurationSubscriberClientWithApplicators:(char)a1 publisherClass:(NSObject *)a2 initializeSandbox:.cold.1(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = @"No";
  if (a1) {
    v2 = @"Yes";
  }
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_25B003000, a2, OS_LOG_TYPE_DEBUG, "Will initialize Configuration Subscriber sandbox: %{public}@", (uint8_t *)&v3, 0xCu);
}

+ (void)runConfigurationSubscriberClientWithApplicators:(NSObject *)a1 publisherClass:initializeSandbox:.cold.2(NSObject *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F086E0] mainBundle];
  int v3 = [v2 bundleIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_25B003000, a1, OS_LOG_TYPE_DEBUG, "Starting Configuration Subscriber XPC Service: %{public}@", (uint8_t *)&v4, 0xCu);
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Status is not being published", v1, 2u);
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Failed to lookup store %{public}@: %{public}@");
}

void __90__RMConfigurationSubscriberClient_sendStatusKeys_storeIdentifier_scope_completionHandler___block_invoke_30_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_25B003000, v0, v1, "Failed to fetch status keys %{public}@: %{public}@");
}

@end