@interface WBSHistoryContextController
- (WBSHistory)history;
- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4;
- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4 qualityOfService:(unsigned int)a5;
- (void)_persistTopicsFromContextResult:(id)a3 forPageURL:(id)a4;
- (void)cachedResponseForURL:(id)a3 completionHandler:(id)a4;
- (void)contextForPageURL:(id)a3 content:(id)a4 contentType:(int64_t)a5 metadata:(id)a6 isPrivate:(BOOL)a7 isReaderAvailable:(BOOL)a8 withCompletionHandler:(id)a9;
- (void)invalidateCachedResults;
@end

@implementation WBSHistoryContextController

- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4 qualityOfService:(unsigned int)a5
{
  id v9 = a3;
  id v10 = a4;
  v24.receiver = self;
  v24.super_class = (Class)WBSHistoryContextController;
  v11 = [(WBSHistoryContextController *)&v24 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_history, a3);
    v13 = NSString;
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = [v13 stringWithFormat:@"com.apple.SafariShared.%@.%p.internalQueue", v15, v12];

    id v17 = v16;
    v18 = (const char *)[v17 UTF8String];
    v19 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a5, 0);
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    internalQueue = v12->_internalQueue;
    v12->_internalQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v12->_client, a4);
    v22 = v12;
  }
  return v12;
}

- (WBSHistoryContextController)initWithHistory:(id)a3 contextClient:(id)a4
{
  return [(WBSHistoryContextController *)self initWithHistory:a3 contextClient:a4 qualityOfService:17];
}

- (void)cachedResponseForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__WBSHistoryContextController_cachedResponseForURL_completionHandler___block_invoke;
  block[3] = &unk_1E5E40940;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(internalQueue, block);
}

uint64_t __70__WBSHistoryContextController_cachedResponseForURL_completionHandler___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 16) isEqual:a1[5]];
  v2 = *(uint64_t (**)(void))(a1[6] + 16);
  return v2();
}

- (void)invalidateCachedResults
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__WBSHistoryContextController_invalidateCachedResults__block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

void __54__WBSHistoryContextController_invalidateCachedResults__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = 0;
}

- (void)contextForPageURL:(id)a3 content:(id)a4 contentType:(int64_t)a5 metadata:(id)a6 isPrivate:(BOOL)a7 isReaderAvailable:(BOOL)a8 withCompletionHandler:(id)a9
{
  BOOL v10 = a7;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  v19 = v18;
  if (v10)
  {
    if (v18) {
      (*((void (**)(id, void))v18 + 2))(v18, 0);
    }
  }
  else
  {
    if (![v16 length])
    {
      dispatch_queue_t v20 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryContextController contextForPageURL:content:contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:](a8, v20);
      }
      v21 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[WBSHistoryContextController contextForPageURL:content:contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:]((uint64_t)v15, v21, v22, v23, v24, v25, v26, v27);
      }
    }
    internalQueue = self->_internalQueue;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke;
    v29[3] = &unk_1E5E409E0;
    id v30 = v15;
    v31 = self;
    id v34 = v19;
    id v32 = v17;
    id v33 = v16;
    int64_t v35 = a5;
    dispatch_async(internalQueue, v29);
  }
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqual:*(void *)(*(void *)(a1 + 40) + 16)]
    && ([*(id *)(*(void *)(a1 + 40) + 8) results],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 count],
        v2,
        v3))
  {
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_4(v4);
    }
    v5 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1();
    }
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(*(void *)(a1 + 40) + 8));
    }
  }
  else
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_2(v7);
    }
    v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1();
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_5;
    v25[3] = &unk_1E5E409B8;
    int8x16_t v20 = *(int8x16_t *)(a1 + 32);
    id v9 = (id)v20.i64[0];
    int8x16_t v26 = vextq_s8(v20, v20, 8uLL);
    id v27 = *(id *)(a1 + 64);
    BOOL v10 = (void *)MEMORY[0x1AD115160](v25);
    v11 = (void *)[*(id *)(*(void *)(a1 + 40) + 32) newRequest];
    id v12 = objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", *MEMORY[0x1E4F98698]);
    [v11 setContentAuthor:v12];

    id v13 = objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", *MEMORY[0x1E4F986A0]);
    [v11 setContentDescription:v13];

    v14 = objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", *MEMORY[0x1E4F986A8]);
    [v11 setContentKeywords:v14];

    [v11 setIncludeHigherLevelTopics:1];
    id v15 = objc_msgSend(*(id *)(a1 + 56), "safari_bestLanguageTag");
    [v11 setLanguageTag:v15];

    [v11 setText:*(void *)(a1 + 56)];
    [v11 setTextIsRaw:*(void *)(a1 + 72) == 2];
    id v16 = objc_msgSend(*(id *)(a1 + 48), "safari_stringForKey:", *MEMORY[0x1E4F986B0]);
    [v11 setTitle:v16];

    id v17 = [*(id *)(a1 + 32) absoluteString];
    [v11 setUrl:v17];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_7;
    v22[3] = &unk_1E5E409B8;
    int8x16_t v21 = *(int8x16_t *)(a1 + 32);
    id v18 = (id)v21.i64[0];
    int8x16_t v23 = vextq_s8(v21, v21, 8uLL);
    id v24 = v10;
    id v19 = v10;
    [v11 executeWithReply:v22];
  }
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E5E40990;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v12 = *(id *)(a1 + 48);
  id v7 = v3;
  dispatch_async(v4, v8);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    id v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_2(v3, v2);
    }
    uint64_t v4 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_1();
    }
    id v5 = 0;
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 8), v5);
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 16), *(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_7(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v6 = a2;
  uint64_t v4 = [v6 results];
  id v5 = [v4 firstObject];
  [v3 _persistTopicsFromContextResult:v5 forPageURL:a1[5]];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)_persistTopicsFromContextResult:(id)a3 forPageURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 topicId];
  if (v8)
  {
    id v9 = [v6 title];
    id v10 = objc_msgSend(v9, "safari_stringByRemovingParenthesizedDomain");

    history = self->_history;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke;
    v12[3] = &unk_1E5E40A08;
    id v13 = v8;
    v14 = self;
    [(WBSHistory *)history addTagWithIdentifier:v13 title:v10 toItemAtURL:v7 level:200 completionHandler:v12];
  }
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_1();
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_8;
    block[3] = &unk_1E5E40968;
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_2(a1, v7, v5);
  }
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_8(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WBSHistoryContextControllerDidAddTagNotification" object:*(void *)(a1 + 32)];
}

- (WBSHistory)history
{
  return self->_history;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pageURLForCachedResponse, 0);
  objc_storeStrong((id *)&self->_cachedResponse, 0);
}

- (void)contextForPageURL:(uint64_t)a3 content:(uint64_t)a4 contentType:(uint64_t)a5 metadata:(uint64_t)a6 isPrivate:(uint64_t)a7 isReaderAvailable:(uint64_t)a8 withCompletionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)contextForPageURL:(char)a1 content:(NSObject *)a2 contentType:metadata:isPrivate:isReaderAvailable:withCompletionHandler:.cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_DEBUG, "ContextKit query with empty text; isReaderAvailable: %d",
    (uint8_t *)v2,
    8u);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1ABB70000, v0, v1, "Page URL: %{private}@", v2, v3, v4, v5, v6);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Performing ContextKit query", v1, 2u);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "Using cached ContextKit response", v1, 2u);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1ABB70000, v0, v1, "Page URL: %{private}@", v2, v3, v4, v5, v6);
}

void __128__WBSHistoryContextController_contextForPageURL_content_contentType_metadata_isPrivate_isReaderAvailable_withCompletionHandler___block_invoke_2_cold_2(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Received ContextKit response with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1ABB70000, v0, v1, "Added tag with topic ID: %{private}@ to history item", v2, v3, v4, v5, v6);
}

void __74__WBSHistoryContextController__persistTopicsFromContextResult_forPageURL___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  int v7 = 138478083;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  id v10 = v6;
  _os_log_error_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_ERROR, "Could not add tag with topic ID: %{private}@ to history item with error: %{public}@", (uint8_t *)&v7, 0x16u);
}

@end