@interface UIActivityRecipientManager
@end

@implementation UIActivityRecipientManager

void __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Recipient Manager: Error getting synchronous remote object proxy %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __90___UIActivityRecipientManager_requestMessagesRecipientInfoForSessionID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v7 = [v3 realName];
  v4 = [v3 displayName];
  int v5 = [v3 formattedHandles];

  id v6 = [v5 allObjects];
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v7, v4, v6);
}

void __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Recipient Manager: Error getting synchronous remote object proxy %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79___UIActivityRecipientManager_requestRecipientsForSessionID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v9), "formattedHandles", (void)v14);
          v11 = [v10 allObjects];

          if (v11) {
            [v4 addObjectsFromArray:v11];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (objc_msgSend(v4, "count", (void)v14))
  {
    v13 = (void *)[v4 copy];
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
  }
}

void __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = share_sheet_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A0AD8000, v4, OS_LOG_TYPE_DEFAULT, "Recipient Manager: Error getting synchronous remote object proxy %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81___UIActivityRecipientManager_requestRecipientsV2ForSessionID_completionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end