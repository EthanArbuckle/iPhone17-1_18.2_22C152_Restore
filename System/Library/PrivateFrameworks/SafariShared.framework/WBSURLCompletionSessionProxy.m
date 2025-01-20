@interface WBSURLCompletionSessionProxy
- (WBSURLCompletionSessionProxy)init;
- (void)_completionSessionWithCompletionHandler:(id)a3;
- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8;
@end

@implementation WBSURLCompletionSessionProxy

- (WBSURLCompletionSessionProxy)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSURLCompletionSessionProxy;
  v2 = [(WBSURLCompletionSessionProxy *)&v9 init];
  if (v2)
  {
    v3 = objc_alloc_init(WBSHistoryConnectionProxy);
    historyConnectionProxy = v2->_historyConnectionProxy;
    v2->_historyConnectionProxy = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariShared.WBSURLCompletionSessionProxy", 0);
    completionSessionAccessQueue = v2->_completionSessionAccessQueue;
    v2->_completionSessionAccessQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)_completionSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  completionSessionAccessQueue = self->_completionSessionAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(completionSessionAccessQueue, v7);
}

void __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__36;
    v23 = __Block_byref_object_dispose__36;
    id v24 = 0;
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = *(void *)(a1 + 32);
    dispatch_queue_t v5 = *(void **)(v4 + 8);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke_2;
    v15 = &unk_1E5CA0830;
    uint64_t v16 = v4;
    v18 = &v19;
    id v6 = v3;
    v17 = v6;
    [v5 beginURLCompletionSession:&v12];
    dispatch_time_t v7 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v6, v7))
    {
      uint64_t v25 = *MEMORY[0x1E4F28568];
      id v8 = _WBSLocalizedString();
      v26[0] = v8;
      objc_super v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v12, v13, v14, v15, v16);

      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"WBSURLCompletionSessionProxyErrorDomain" code:0 userInfo:v9];
      v11 = (void *)v20[5];
      v20[5] = v10;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    _Block_object_dispose(&v19, 8);
  }
}

void __72__WBSURLCompletionSessionProxy__completionSessionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)getBestMatchesForTypedString:(id)a3 filterResultsUsingProfileIdentifier:(id)a4 limit:(unint64_t)a5 forQueryID:(int64_t)a6 withSearchParameters:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__36;
  v31[4] = __Block_byref_object_dispose__36;
  v18 = self;
  v32 = v18;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke;
  v23[3] = &unk_1E5CA0880;
  id v19 = v17;
  id v27 = v19;
  id v20 = v14;
  id v24 = v20;
  id v21 = v15;
  id v25 = v21;
  unint64_t v29 = a5;
  int64_t v30 = a6;
  id v22 = v16;
  id v26 = v22;
  v28 = v31;
  [(WBSURLCompletionSessionProxy *)v18 _completionSessionWithCompletionHandler:v23];

  _Block_object_dispose(v31, 8);
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v14 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_cold_1(v14, v6);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 80);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_10;
    v15[3] = &unk_1E5CA0858;
    uint64_t v18 = v9;
    uint64_t v11 = *(void *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 64);
    id v16 = v12;
    uint64_t v17 = v13;
    [a2 getBestMatchesForTypedString:v7 filterResultsUsingProfileIdentifier:v8 limit:v9 forQueryID:v10 withSearchParameters:v11 completionHandler:v15];
  }
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_10(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  if ([v7 count]) {
    [v10 addObjectsFromArray:v7];
  }
  if ([v8 count]) {
    [v10 addObjectsFromArray:v8];
  }
  unint64_t v11 = [v10 count];
  unint64_t v12 = a1[6];
  if (v11 > v12) {
    objc_msgSend(v10, "removeObjectsInRange:", v12, objc_msgSend(v10, "count") - a1[6]);
  }
  (*(void (**)(void))(a1[4] + 16))();
  uint64_t v13 = WBS_LOG_CHANNEL_PREFIXURLAutocomplete();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = v13;
    int v17 = 134217984;
    uint64_t v18 = [v10 count];
    _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "Returning %zi matches", (uint8_t *)&v17, 0xCu);
  }
  uint64_t v15 = *(void *)(a1[5] + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSessionAccessQueue, 0);
  objc_storeStrong((id *)&self->_completionSession, 0);
  objc_storeStrong((id *)&self->_historyConnectionProxy, 0);
}

void __153__WBSURLCompletionSessionProxy_getBestMatchesForTypedString_filterResultsUsingProfileIdentifier_limit_forQueryID_withSearchParameters_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1A6B5F000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain a completion session: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end