@interface PPTopicBlocklist
+ (id)sharedInstance;
- (BOOL)shouldBlock:(id)a3;
- (PPTopicBlocklist)initWithTrialWrapper:(id)a3;
- (id)indicesOfBlockedTopicsInRecordArray:(id)a3;
- (id)indicesOfBlockedTopicsInScoredTopicArray:(id)a3;
- (void)_loadAssetData;
- (void)dealloc;
@end

@implementation PPTopicBlocklist

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialToken, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_blocklistTrie, 0);
}

- (id)indicesOfBlockedTopicsInScoredTopicArray:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__PPTopicBlocklist_indicesOfBlockedTopicsInScoredTopicArray___block_invoke;
  v5[3] = &unk_1E65D9720;
  v5[4] = self;
  v3 = [a3 indexesOfObjectsPassingTest:v5];
  return v3;
}

uint64_t __61__PPTopicBlocklist_indicesOfBlockedTopicsInScoredTopicArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 scoredTopic];
  v4 = [v3 item];
  v5 = [v4 topicIdentifier];
  uint64_t v6 = [v2 shouldBlock:v5];

  return v6;
}

- (id)indicesOfBlockedTopicsInRecordArray:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PPTopicBlocklist_indicesOfBlockedTopicsInRecordArray___block_invoke;
  v5[3] = &unk_1E65D96F8;
  v5[4] = self;
  v3 = [a3 indexesOfObjectsPassingTest:v5];
  return v3;
}

uint64_t __56__PPTopicBlocklist_indicesOfBlockedTopicsInRecordArray___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 topic];
  v4 = [v3 topicIdentifier];
  uint64_t v5 = [v2 shouldBlock:v4];

  return v5;
}

- (BOOL)shouldBlock:(id)a3
{
  return [(_PASCFBurstTrie *)self->_blocklistTrie payloadForString:a3] != 0;
}

- (void)dealloc
{
  [(PPTrialWrapper *)self->_trialWrapper removeUpdateHandlerForToken:self->_trialToken];
  v3.receiver = self;
  v3.super_class = (Class)PPTopicBlocklist;
  [(PPTopicBlocklist *)&v3 dealloc];
}

- (PPTopicBlocklist)initWithTrialWrapper:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PPTopicBlocklist;
  uint64_t v6 = [(PPTopicBlocklist *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_trialWrapper, a3);
    -[PPTopicBlocklist _loadAssetData]((uint64_t)v7);
    id location = 0;
    objc_initWeak(&location, v7);
    trialWrapper = v7->_trialWrapper;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__PPTopicBlocklist_initWithTrialWrapper___block_invoke;
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
  v2 = [*(id *)(a1 + 16) filepathForFactor:@"topicBlocklist.trie" namespaceName:@"PERSONALIZATION_PORTRAIT_TOPICS"];
  objc_super v3 = pp_topics_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    v11 = v2;
    _os_log_impl(&dword_1CA9A8000, v3, OS_LOG_TYPE_INFO, "Loading topic blocklist from \"%@\".", (uint8_t *)&v10, 0xCu);
  }

  if (!v2)
  {
    uint64_t v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      v7 = "Failed to read path for topic blocklist.";
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
    uint64_t v6 = pp_default_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v10 = 138412290;
      v11 = v2;
      v7 = "Failed to initialize topic blocklist trie from file at \"%@\"";
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

void __41__PPTopicBlocklist_initWithTrialWrapper___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[PPTopicBlocklist _loadAssetData]((uint64_t)WeakRetained);
    id WeakRetained = v2;
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken2_18344 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken2_18344, &__block_literal_global_18345);
  }
  id v2 = (void *)sharedInstance__pasExprOnceResult_18346;
  return v2;
}

void __34__PPTopicBlocklist_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1CB79D060]();
  v1 = [PPTopicBlocklist alloc];
  id v2 = +[PPTrialWrapper sharedInstance];
  uint64_t v3 = [(PPTopicBlocklist *)v1 initWithTrialWrapper:v2];
  uint64_t v4 = (void *)sharedInstance__pasExprOnceResult_18346;
  sharedInstance__pasExprOnceResult_18346 = v3;
}

@end