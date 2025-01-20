@interface ICQFollowupSpecification
@end

@implementation ICQFollowupSpecification

void __83___ICQFollowupSpecification_postFollowupWithController_replaceExisting_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v7), "uniqueIdentifier", (void)v15);
        v9 = [*(id *)(a1 + 32) identifierPrefix];
        int v10 = [v8 isEqualToString:v9];

        if (v10)
        {
          v13 = _ICQGetLogSystem();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = [*(id *)(a1 + 32) identifierPrefix];
            *(_DWORD *)buf = 138412290;
            v20 = v14;
            _os_log_impl(&dword_1D5851000, v13, OS_LOG_TYPE_DEFAULT, "Found existing followup with id %@. Not reposting.", buf, 0xCu);
          }
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

          goto LABEL_15;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  v11 = _ICQGetLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [*(id *)(a1 + 32) identifierPrefix];
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "ICQFollowup not found with id %@. Posting now.", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _postFollowupWithController:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_15:
}

void __68___ICQFollowupSpecification__postFollowupWithController_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a3;
  uint64_t v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) title];
    uint64_t v8 = [*(id *)(a1 + 32) groupIdentifier];
    v9 = (void *)v8;
    int v10 = @"failure: ";
    if (a2) {
      int v10 = @"success";
    }
    int v13 = 138413058;
    v14 = v7;
    v11 = &stru_1F2DCE430;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    if (v5) {
      v11 = v5;
    }
    long long v18 = v10;
    __int16 v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Posted ICQFollowup item (title:%@ group:%@) %@%@", (uint8_t *)&v13, 0x2Au);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v12 + 16))(v12, a2, v5);
  }
}

void __63___ICQFollowupSpecification_clearLegacyFollowupWithController___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (a2) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    uint64_t v7 = [v4 localizedDescription];
    int v8 = 138412546;
    v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "legacy ICQFollowup items clear completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t __53___ICQFollowupSpecification_sharedFollowUpController__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F5B768]) initWithClientIdentifier:@"com.apple.icloud.quota"];
  uint64_t v1 = sharedFollowUpController_controller;
  sharedFollowUpController_controller = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

void __82___ICQFollowupSpecification_clearNotificationWithController_offerType_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v9 = [v8 uniqueIdentifier];
        int v10 = [v9 isEqualToString:a1[4]];

        if (v10)
        {
          v11 = (void *)a1[5];
          id v13 = 0;
          [v11 clearNotificationForItem:v8 error:&v13];
          id v12 = v13;
          (*(void (**)(void))(a1[6] + 16))();

          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

@end