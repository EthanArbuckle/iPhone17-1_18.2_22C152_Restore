@interface PSUIntentMessageHistorySearcher
- (void)recentMessagesSinceDate:(id)a3 conversationIdentifier:(id)a4 appBundleId:(id)a5 incomingMessageID:(id)a6 limit:(int64_t)a7 options:(unint64_t)a8 completionHandler:(id)a9;
@end

@implementation PSUIntentMessageHistorySearcher

- (void)recentMessagesSinceDate:(id)a3 conversationIdentifier:(id)a4 appBundleId:(id)a5 incomingMessageID:(id)a6 limit:(int64_t)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  char v9 = a8;
  v37[1] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a9;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  v18 = (void *)[objc_alloc(MEMORY[0x263F0FA60]) initWithStartDate:v13 endDate:0 onCalendar:0 inTimeZone:0];
  id v19 = objc_alloc(MEMORY[0x263F0FE80]);
  v37[0] = v14;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:1];
  v21 = (void *)[v19 initWithRecipients:0 senders:0 searchTerms:0 attributes:v9 & 3 dateTimeRange:v18 identifiers:0 notificationIdentifiers:0 speakableGroupNames:0 conversationIdentifiers:v20];

  [v21 _setLaunchId:v15];
  v22 = (void *)[objc_alloc(MEMORY[0x263F502A8]) initWithIntent:v21];
  [v22 setRequiresTCC:0];
  [v22 setRequestTimeoutInterval:5.0];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke;
  v32[3] = &unk_26547F868;
  v34 = v35;
  id v23 = v17;
  id v33 = v23;
  [v22 setTimeoutHandler:v32];
  [v22 setInterruptionHandler:&__block_literal_global];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_5;
  v27[3] = &unk_26547F900;
  v31 = v35;
  id v24 = v23;
  id v30 = v24;
  id v25 = v16;
  id v28 = v25;
  id v26 = v22;
  id v29 = v26;
  [v26 resumeWithCompletionHandler:v27];

  _Block_object_dispose(v35, 8);
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = PSUSummarizationLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_error_impl(&dword_25A8BB000, v4, OS_LOG_TYPE_ERROR, "Request to fetch messages timed out with error: %@", (uint8_t *)&v5, 0xCu);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if ([v6 code] != 3001)
    {
      char v9 = PSUSummarizationLogging();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v7;
        _os_log_error_impl(&dword_25A8BB000, v9, OS_LOG_TYPE_ERROR, "Unable to resume intent connection with error: %@", buf, 0xCu);
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_6;
    v11[3] = &unk_26547F8D8;
    long long v10 = *(_OWORD *)(a1 + 48);
    id v8 = (id)v10;
    long long v15 = v10;
    id v12 = *(id *)(a1 + 32);
    id v13 = v5;
    id v14 = *(id *)(a1 + 40);
    [v13 handleIntentWithCompletionHandler:v11];
  }
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v13 = PSUSummarizationLogging();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    id v14 = "Unable to handle the search for messages intent: %@";
    long long v15 = v13;
    uint32_t v16 = 12;
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v5 messages];
    char v9 = (void *)v8;
    long long v10 = (void *)MEMORY[0x263EFFA68];
    if (v8) {
      long long v10 = (void *)v8;
    }
    id v11 = v10;

    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_8;
    v17[3] = &unk_26547F8B0;
    id v18 = *(id *)(a1 + 32);
    id v12 = objc_msgSend(v11, "_pas_filteredArrayWithTest:", v17);

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }

    goto LABEL_14;
  }
  id v13 = PSUSummarizationLogging();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v14 = "Unable to handle the search for messages intent (incorrect response)";
    long long v15 = v13;
    uint32_t v16 = 2;
LABEL_16:
    _os_log_error_impl(&dword_25A8BB000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
  }
LABEL_12:

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
LABEL_14:
}

BOOL __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (*(void *)(a1 + 32)
    && ([v3 identifier],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToString:*(void *)(a1 + 32)],
        v5,
        (v6 & 1) != 0)
    || [v4 messageEffectType] == 6)
  {
    BOOL v7 = 0;
  }
  else
  {
    uint64_t v8 = [v4 sender];
    BOOL v7 = v8 != 0;
  }
  return v7;
}

void __144__PSUIntentMessageHistorySearcher_recentMessagesSinceDate_conversationIdentifier_appBundleId_incomingMessageID_limit_options_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = PSUSummarizationLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_25A8BB000, v3, OS_LOG_TYPE_ERROR, "Request to fetch messages was interrupted with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end