@interface FLFollowUpController
@end

@implementation FLFollowUpController

void __65__FLFollowUpController_ICQUI__icq_dismissFollowUpWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v25;
    v8 = "Successfully cleared lockscreen notification for followup item ID %@";
    *(void *)&long long v5 = 138412546;
    long long v22 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "uniqueIdentifier", v22);
        int v12 = [v11 isEqualToString:*(void *)(a1 + 32)];

        if (v12)
        {
          v13 = *(void **)(a1 + 40);
          id v23 = 0;
          int v14 = [v13 clearNotificationForItem:v10 error:&v23];
          id v15 = v23;
          v16 = _ICQGetLogSystem();
          v17 = v16;
          if (v14)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v18 = *(void *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              uint64_t v29 = v18;
              _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = v8;
            uint64_t v20 = *(void *)(a1 + 32);
            v21 = [v15 localizedDescription];
            *(_DWORD *)buf = v22;
            uint64_t v29 = v20;
            v8 = v19;
            __int16 v30 = 2112;
            v31 = v21;
            _os_log_error_impl(&dword_1D5851000, v17, OS_LOG_TYPE_ERROR, "Unable to clear lockscreen notification for followup item ID %@, error: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v6);
  }
}

@end