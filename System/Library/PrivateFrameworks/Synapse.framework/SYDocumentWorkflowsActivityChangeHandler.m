@interface SYDocumentWorkflowsActivityChangeHandler
+ (id)_indexKeyFromUserActivity:(id)a3;
- (BOOL)canHandleUserActivityChange:(id)a3 appStateObserver:(id)a4;
- (SYDocumentWorkflowsActivityChangeHandler)init;
- (void)_fetchAttributesForItemsWithIndexKeys:(id)a3 maxRetryCount:(int64_t)a4 completion:(id)a5;
- (void)handleActiveUserActivityChange:(id)a3 withCompletion:(id)a4;
@end

@implementation SYDocumentWorkflowsActivityChangeHandler

- (BOOL)canHandleUserActivityChange:(id)a3 appStateObserver:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((SYIsMailApp() & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    __int16 v16 = 0;
    v10 = "User activity isn't from Mail";
    v11 = (uint8_t *)&v16;
LABEL_14:
    _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    goto LABEL_15;
  }
  if (([v6 appIsActive] & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    __int16 v15 = 0;
    v10 = "App changed user activity while it is inactive";
    v11 = (uint8_t *)&v15;
    goto LABEL_14;
  }
  if ((SYIsCurrentLocalUserActivity(v5) & 1) == 0)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      goto LABEL_15;
    }
    __int16 v14 = 0;
    v10 = "User activity isn't the current user activity";
    v11 = (uint8_t *)&v14;
    goto LABEL_14;
  }
  v7 = +[SYDocumentWorkflowsActivityChangeHandler _indexKeyFromUserActivity:v5];

  if (!v7)
  {
    v9 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      v10 = "User activity doesn't have an index key";
      v11 = (uint8_t *)&v13;
      goto LABEL_14;
    }
LABEL_15:

    BOOL v8 = 0;
    goto LABEL_16;
  }
  BOOL v8 = 1;
LABEL_16:

  return v8;
}

- (SYDocumentWorkflowsActivityChangeHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)SYDocumentWorkflowsActivityChangeHandler;
  v2 = [(SYDocumentWorkflowsActivityChangeHandler *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(SYDocumentWorkflowsClient);
    client = v2->_client;
    v2->_client = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.synapse.DocumentWorkflowsActivityChangeHandler.retryQueue", 0);
    retryQueue = v2->_retryQueue;
    v2->_retryQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)_indexKeyFromUserActivity:(id)a3
{
  return (id)[a3 _syRelatedUniqueIdentifier];
}

- (void)handleActiveUserActivityChange:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke;
  v26[3] = &unk_1E6463968;
  id v8 = v7;
  id v27 = v8;
  v9 = (void *)MEMORY[0x1C8769940](v26);
  v10 = +[SYDocumentWorkflowsActivityChangeHandler _indexKeyFromUserActivity:v6];
  v11 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl(&dword_1C2C5F000, v11, OS_LOG_TYPE_INFO, "Handle user activity with index key: %@", buf, 0xCu);
  }

  v12 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SYDocumentWorkflowsActivityChangeHandler handleActiveUserActivityChange:withCompletion:](v6, v12);
  }

  __int16 v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v10;
    _os_log_impl(&dword_1C2C5F000, v13, OS_LOG_TYPE_INFO, "Saving current user activity for message with index key: %@", buf, 0xCu);
  }

  __int16 v14 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v15 = [v14 bundleIdentifier];
  __int16 v16 = (void *)v15;
  if (v15) {
    v17 = (__CFString *)v15;
  }
  else {
    v17 = &stru_1F1E16740;
  }
  v18 = v17;

  [v6 setTitle:&stru_1F1E16740];
  client = self->_client;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7;
  v22[3] = &unk_1E6464220;
  v24 = self;
  id v25 = v9;
  id v23 = v10;
  id v20 = v10;
  id v21 = v9;
  [(SYDocumentWorkflowsClient *)client saveUserActivity:v6 forDocumentIndexKey:v20 sourceBundleIdentifier:v18 completion:v22];
}

uint64_t __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7(uint64_t a1, char a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  id v7 = v6;
  if (!v5 || (a2 & 1) != 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1C2C5F000, v7, OS_LOG_TYPE_INFO, "Fetching attachments for message with index key: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9;
    v11[3] = &unk_1E6464488;
    id v12 = *(id *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    [v9 _fetchAttributesForItemsWithIndexKeys:v10 maxRetryCount:3 completion:v11];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_log_t v7 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  os_log_t v8 = v7;
  if (v5 || !v6)
  {
    id v29 = v6;
    v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v5 count];
      v11 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1C2C5F000, v9, OS_LOG_TYPE_INFO, "Found %ld attachments for message with index key: %@", buf, 0x16u);
    }
    uint64_t v28 = a1;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v30 = v5;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v13)
    {
LABEL_27:

      (*(void (**)(void))(*(void *)(v28 + 40) + 16))();
      id v6 = v29;
      id v5 = v30;
      goto LABEL_28;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v33;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v33 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void **)(*((void *)&v32 + 1) + 8 * v16);
      v18 = [v17 originalFileURL];
      v19 = +[SYDocumentAttributes documentAttributesForFileAtURL:v18];

      if (v19)
      {
        id v20 = os_log_create("com.apple.synapse", "DocumentWorkflows");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          id v21 = [v17 originalFileURL];
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = (uint64_t)v21;
          _os_log_impl(&dword_1C2C5F000, v20, OS_LOG_TYPE_INFO, "Skip attachment with existing document attributes, URL: %@", buf, 0xCu);
        }
        v22 = v20;
        goto LABEL_23;
      }
      id v23 = [v17 originalFileURL];
      id v31 = 0;
      char v24 = [v17 saveToFileURL:v23 error:&v31];
      v22 = v31;

      id v25 = os_log_create("com.apple.synapse", "DocumentWorkflows");
      id v20 = v25;
      if ((v24 & 1) == 0) {
        break;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [v17 originalFileURL];
        *(_DWORD *)buf = 138412290;
        uint64_t v38 = (uint64_t)v26;
        _os_log_impl(&dword_1C2C5F000, v20, OS_LOG_TYPE_INFO, "Extended attributes added to URL: %@", buf, 0xCu);
LABEL_20:
      }
LABEL_22:

LABEL_23:
      if (v14 == ++v16)
      {
        uint64_t v27 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v14 = v27;
        if (!v27) {
          goto LABEL_27;
        }
        goto LABEL_10;
      }
    }
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    v26 = [v17 originalFileURL];
    *(_DWORD *)buf = 138412546;
    uint64_t v38 = (uint64_t)v26;
    __int16 v39 = 2112;
    v40 = v22;
    _os_log_error_impl(&dword_1C2C5F000, v20, OS_LOG_TYPE_ERROR, "Unable to save extended attributes to URL: %@, error: %@", buf, 0x16u);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_28:
}

- (void)_fetchAttributesForItemsWithIndexKeys:(id)a3 maxRetryCount:(int64_t)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = os_log_create("com.apple.synapse", "DocumentWorkflows");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v8;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl(&dword_1C2C5F000, v10, OS_LOG_TYPE_INFO, "Fetching attributes for items with index keys: %@, retryCount: %ld", buf, 0x16u);
  }

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke;
  v13[3] = &unk_1E64644D8;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  +[SYDocumentAttributesFetchRequest fetchAttributesForDocumentsWithIndexKeys:v12 completion:v13];
}

void __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6 || [v5 count] || *(uint64_t *)(a1 + 56) < 1)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
    }
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    dispatch_time_t v8 = dispatch_time(0, 1500000000);
    id v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke_2;
    block[3] = &unk_1E64644B0;
    objc_copyWeak(v16, &location);
    id v10 = *(id *)(a1 + 40);
    id v12 = *(void **)(a1 + 48);
    id v11 = *(void **)(a1 + 56);
    id v14 = v10;
    v16[1] = v11;
    id v15 = v12;
    dispatch_after(v8, v9, block);

    objc_destroyWeak(v16);
    objc_destroyWeak(&location);
  }
}

void __107__SYDocumentWorkflowsActivityChangeHandler__fetchAttributesForItemsWithIndexKeys_maxRetryCount_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _fetchAttributesForItemsWithIndexKeys:*(void *)(a1 + 32) maxRetryCount:*(void *)(a1 + 56) - 1 completion:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_retryQueue, 0);
}

- (void)handleActiveUserActivityChange:(void *)a1 withCompletion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = [a1 _syLoggableDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v4, 0xCu);
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_7_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to save user activity for index key: %@, error: %@");
}

void __90__SYDocumentWorkflowsActivityChangeHandler_handleActiveUserActivityChange_withCompletion___block_invoke_9_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_0(&dword_1C2C5F000, v0, v1, "Unable to fetch attachments for message with index key: %@, error: %@");
}

@end