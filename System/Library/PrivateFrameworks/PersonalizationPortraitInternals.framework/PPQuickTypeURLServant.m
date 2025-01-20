@interface PPQuickTypeURLServant
- (PPQuickTypeURLServant)init;
- (PPQuickTypeURLServant)initWithConversationManager:(id)a3;
- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5;
- (void)registerFeedback:(id)a3;
@end

@implementation PPQuickTypeURLServant

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataLock, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
}

- (void)registerFeedback:(id)a3
{
  id v4 = a3;
  v5 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA9A8000, v5, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: registerFeedback called.", buf, 2u);
  }

  dataLock = self->_dataLock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__PPQuickTypeURLServant_registerFeedback___block_invoke;
  v8[3] = &unk_1E65D7288;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  [(_PASLock *)dataLock runWithLockAcquired:v8];
}

void __42__PPQuickTypeURLServant_registerFeedback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  if (v3[1])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v4 = [*(id *)(a1 + 32) feedbackItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v27 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v9 itemFeedbackType] == 1)
          {
            v10 = [v9 itemString];
            v11 = [v3[1] value];
            int v12 = [v10 isEqualToString:v11];

            if (v12)
            {
              v13 = pp_quicktype_log_handle();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                id v14 = v3[3];
                *(_DWORD *)buf = 138412290;
                v31 = v14;
                _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: URL engaged in app '%@'", buf, 0xCu);
              }

              v15 = pp_quicktype_log_handle();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                v22 = [v3[1] value];
                id v23 = v3[3];
                *(_DWORD *)buf = 138740227;
                v31 = v22;
                __int16 v32 = 2112;
                id v33 = v23;
                _os_log_debug_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_DEBUG, "PPQuickTypeURLServant: '%{sensitive}@' engaged in app '%@'", buf, 0x16u);
              }
              if (v3[2])
              {
                dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
                v17 = *(void **)(*(void *)(a1 + 40) + 8);
                id v18 = v3[2];
                v24[0] = MEMORY[0x1E4F143A8];
                v24[1] = 3221225472;
                v24[2] = __42__PPQuickTypeURLServant_registerFeedback___block_invoke_25;
                v24[3] = &unk_1E65D7260;
                v19 = v16;
                v25 = v19;
                [v17 activateLink:v18 completionHandler:v24];
                [MEMORY[0x1E4F93B18] waitForSemaphore:v19];
                v20 = pp_quicktype_log_handle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1CA9A8000, v20, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: activateLink completed.", buf, 2u);
                }

                [v3 reset];
              }
              else
              {
                v21 = pp_quicktype_log_handle();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  _os_log_error_impl(&dword_1CA9A8000, v21, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: _tuConversationLink is unexpectedly nil.", buf, 2u);
                }

                [v3 reset];
              }
              goto LABEL_23;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_23:
  }
}

void __42__PPQuickTypeURLServant_registerFeedback___block_invoke_25(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_error_impl(&dword_1CA9A8000, v6, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: activateLink error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)quickTypeItemsWithQuery:(id)a3 limit:(unint64_t)a4 explanationSet:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 type] != 5) {
    goto LABEL_12;
  }
  uint64_t v9 = pp_quicktype_log_handle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1CA9A8000, v9, OS_LOG_TYPE_INFO, "PPQuickTypeURLServant: quickTypeItemsWithQuery", (uint8_t *)&buf, 2u);
  }

  if ([v7 subtype] == 13)
  {
    v10 = +[PPSettings sharedInstance];
    uint64_t v11 = *MEMORY[0x1E4F8A060];
    char v12 = [v10 bundleIdentifierIsEnabledForDonation:*MEMORY[0x1E4F8A060]];

    v13 = pp_quicktype_log_handle();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: queried for %@ URL.", (uint8_t *)&buf, 0xCu);
      }

      v13 = +[PPQuickTypeFormatter formatterWithQuery:v7];
      dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__10864;
      v44 = __Block_byref_object_dispose__10865;
      id v45 = 0;
      conversationManager = self->_conversationManager;
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke;
      v35[3] = &unk_1E65D7210;
      p_long long buf = &buf;
      v17 = v15;
      v36 = v17;
      [(TUConversationManager *)conversationManager getInactiveLinkWithCompletionHandler:v35];
      [MEMORY[0x1E4F93B18] waitForSemaphore:v17];
      id v18 = pp_quicktype_log_handle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1CA9A8000, v18, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: getInactiveLinkWithCompletionHandler completed.", v39, 2u);
      }

      v19 = [*(id *)(*((void *)&buf + 1) + 40) URL];
      v20 = [v19 absoluteString];

      if ([v20 length])
      {
        id v21 = [NSString alloc];
        v22 = [v13 inviteLinkLabel];
        id v23 = [v21 initWithFormat:@"🔗 %@", v22];

        BYTE2(v30) = 10;
        LOWORD(v30) = 1024;
        v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F89EE0]), "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", &stru_1F253DF18, v20, v23, 0, 0x2000000, 0, 1.0, 0, 0, v30, 0);
        dataLock = self->_dataLock;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke_22;
        v31[3] = &unk_1E65D7238;
        v34 = &buf;
        id v26 = v24;
        id v32 = v26;
        id v33 = v7;
        [(_PASLock *)dataLock runWithLockAcquired:v31];
        id v38 = v26;
        long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      }
      else
      {
        id v23 = pp_quicktype_log_handle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v29 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)v39 = 138412290;
          uint64_t v40 = v29;
          _os_log_error_impl(&dword_1CA9A8000, v23, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: link URL was empty or nil: %@", v39, 0xCu);
        }
        long long v27 = 0;
      }

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1CA9A8000, v13, OS_LOG_TYPE_DEFAULT, "PPQuickTypeURLServant: ignoring request for %@ URL due to settings.", (uint8_t *)&buf, 0xCu);
      }
      long long v27 = 0;
    }
  }
  else
  {
LABEL_12:
    long long v27 = 0;
  }

  return v27;
}

void __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (!v6)
  {
    id v8 = pp_quicktype_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "PPQuickTypeURLServant: getInactiveLinkWithCompletionHandler error: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__PPQuickTypeURLServant_quickTypeItemsWithQuery_limit_explanationSet___block_invoke_22(uint64_t a1, id *a2)
{
  objc_storeStrong(a2 + 2, *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v4 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) copy];
  id v6 = v4[1];
  v4[1] = (id)v5;

  id v9 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v7 = [v9 copy];
  id v8 = v4[3];
  v4[3] = (id)v7;
}

- (PPQuickTypeURLServant)init
{
  v3 = objc_opt_new();
  id v4 = [(PPQuickTypeURLServant *)self initWithConversationManager:v3];

  return v4;
}

- (PPQuickTypeURLServant)initWithConversationManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPQuickTypeURLServant;
  id v6 = [(PPQuickTypeURLServant *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversationManager, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v9 = objc_opt_new();
    uint64_t v10 = [v8 initWithGuardedData:v9];
    dataLock = v7->_dataLock;
    v7->_dataLock = (_PASLock *)v10;
  }
  return v7;
}

@end