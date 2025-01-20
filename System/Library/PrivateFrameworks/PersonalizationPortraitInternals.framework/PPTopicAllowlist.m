@interface PPTopicAllowlist
+ (id)_keyFor:(uint64_t)a1 of:(void *)a2;
+ (id)sharedInstance;
- (BOOL)_topicIsAllowedForClientProcess:(void *)a3 topic:;
- (BOOL)shouldBypassAllowlist:(id)a3;
- (PPTopicAllowlist)initWithTrialWrapper:(id)a3;
- (id)filterTopicDictionary:(id)a3 clientProcess:(id)a4;
- (id)indicesOfAllowedTopicsInRecordArray:(id)a3 clientProcess:(id)a4;
- (id)indicesOfAllowedTopicsInScoredTopicArray:(id)a3 clientProcess:(id)a4;
- (void)_loadAssetData;
- (void)dealloc;
@end

@implementation PPTopicAllowlist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_allowlistTrie, 0);
}

- (id)filterTopicDictionary:(id)a3 clientProcess:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  v9 = +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  LODWORD(allowlistTrie) = [(_PASCFBurstTrie *)allowlistTrie payloadForString:v9];

  if (allowlistTrie)
  {
    id v10 = v6;
  }
  else
  {
    v11 = [v6 allKeys];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56__PPTopicAllowlist_filterTopicDictionary_clientProcess___block_invoke;
    v25[3] = &unk_1E65D4428;
    v25[4] = self;
    id v26 = v7;
    v12 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v25);

    id v10 = (id)objc_opt_new();
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v19 = objc_msgSend(v6, "objectForKeyedSubscript:", v18, (void)v21);
          [v10 setObject:v19 forKeyedSubscript:v18];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v15);
    }
  }
  return v10;
}

+ (id)_keyFor:(uint64_t)a1 of:(void *)a2
{
  id v2 = a2;
  v3 = @"/ShouldBypassTopicAllowlist/";
  self;
  v4 = (void *)[[NSString alloc] initWithFormat:@"%@/%@", v2, @"/ShouldBypassTopicAllowlist/"];

  return v4;
}

BOOL __56__PPTopicAllowlist_filterTopicDictionary_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (objc_class *)NSString;
  id v5 = a2;
  id v6 = [v4 alloc];
  id v7 = [v5 stringValue];

  v8 = (void *)[v6 initWithFormat:@"Q%@", v7];
  BOOL v9 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v8);

  return v9;
}

- (BOOL)_topicIsAllowedForClientProcess:(void *)a3 topic:
{
  if (!a1) {
    return 0;
  }
  v4 = *(void **)(a1 + 8);
  id v5 = (objc_class *)NSString;
  id v6 = a3;
  id v7 = a2;
  v8 = (void *)[[v5 alloc] initWithFormat:@"%@/%@", v7, v6];

  BOOL v9 = [v4 payloadForString:v8] != 0;
  return v9;
}

- (id)indicesOfAllowedTopicsInScoredTopicArray:(id)a3 clientProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  BOOL v9 = +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  LODWORD(allowlistTrie) = [(_PASCFBurstTrie *)allowlistTrie payloadForString:v9];

  if (allowlistTrie)
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __75__PPTopicAllowlist_indicesOfAllowedTopicsInScoredTopicArray_clientProcess___block_invoke;
    v12[3] = &unk_1E65D4400;
    v12[4] = self;
    id v13 = v7;
    id v10 = [v6 indexesOfObjectsPassingTest:v12];
  }
  return v10;
}

BOOL __75__PPTopicAllowlist_indicesOfAllowedTopicsInScoredTopicArray_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = [a2 item];
  id v5 = [v4 topicIdentifier];
  BOOL v6 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v5);

  return v6;
}

- (id)indicesOfAllowedTopicsInRecordArray:(id)a3 clientProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  allowlistTrie = self->_allowlistTrie;
  BOOL v9 = +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, v7);
  LODWORD(allowlistTrie) = [(_PASCFBurstTrie *)allowlistTrie payloadForString:v9];

  if (allowlistTrie)
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(v6, "count"));
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__PPTopicAllowlist_indicesOfAllowedTopicsInRecordArray_clientProcess___block_invoke;
    v12[3] = &unk_1E65D43D8;
    v12[4] = self;
    id v13 = v7;
    id v10 = [v6 indexesOfObjectsPassingTest:v12];
  }
  return v10;
}

BOOL __70__PPTopicAllowlist_indicesOfAllowedTopicsInRecordArray_clientProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = [a2 topic];
  id v5 = [v4 topicIdentifier];
  BOOL v6 = -[PPTopicAllowlist _topicIsAllowedForClientProcess:topic:](v2, v3, v5);

  return v6;
}

- (BOOL)shouldBypassAllowlist:(id)a3
{
  allowlistTrie = self->_allowlistTrie;
  v4 = +[PPTopicAllowlist _keyFor:of:]((uint64_t)PPTopicAllowlist, a3);
  LODWORD(allowlistTrie) = [(_PASCFBurstTrie *)allowlistTrie payloadForString:v4];

  return allowlistTrie != 0;
}

- (void)dealloc
{
  [(PPTrialWrapper *)self->_trialWrapper removeUpdateHandlerForToken:self->_trialToken];
  v3.receiver = self;
  v3.super_class = (Class)PPTopicAllowlist;
  [(PPTopicAllowlist *)&v3 dealloc];
}

- (PPTopicAllowlist)initWithTrialWrapper:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPTopicAllowlist;
  BOOL v6 = [(PPTopicAllowlist *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialWrapper, a3);
    -[PPTopicAllowlist _loadAssetData]((uint64_t)v7);
    id location = 0;
    objc_initWeak(&location, v7);
    trialWrapper = v7->_trialWrapper;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PPTopicAllowlist_initWithTrialWrapper___block_invoke;
    v12[3] = &unk_1E65DC540;
    objc_copyWeak(&v13, &location);
    uint64_t v9 = [(PPTrialWrapper *)trialWrapper addUpdateHandlerForNamespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS" block:v12];
    trialToken = v7->_trialToken;
    v7->_trialToken = (TRINotificationToken *)v9;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)_loadAssetData
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 16) filepathForFactor:@"topicAllowlist.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
  objc_super v3 = pp_topics_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "Loading topic allowlist from \"%@\".", (uint8_t *)&v10, 0xCu);
  }

  if (!v2)
  {
    BOOL v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      id v7 = "Failed to read path for topic allowlist.";
      v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_11;
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v2];
  id v5 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v4;

  if (!*(void *)(a1 + 8))
  {
    BOOL v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      v11 = v2;
      id v7 = "Failed to initialize topic allowlist trie from file at \"%@\"";
      v8 = v6;
      uint32_t v9 = 12;
LABEL_11:
      _os_log_fault_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v10, v9);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:
}

void __41__PPTopicAllowlist_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PPTopicAllowlist _loadAssetData]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_489 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_489, &__block_literal_global_490);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_491;
  return v2;
}

void __34__PPTopicAllowlist_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  v1 = [PPTopicAllowlist alloc];
  id v2 = +[PPTrialWrapper sharedInstance];
  uint64_t v3 = [(PPTopicAllowlist *)v1 initWithTrialWrapper:v2];
  uint64_t v4 = (void *)sharedInstance__pasExprOnceResult_491;
  sharedInstance__pasExprOnceResult_491 = v3;
}

@end