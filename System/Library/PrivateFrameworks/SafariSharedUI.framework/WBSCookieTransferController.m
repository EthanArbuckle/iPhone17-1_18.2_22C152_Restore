@interface WBSCookieTransferController
+ (NSArray)domainsToDisableCookieCopying;
+ (WBSCookieTransferController)sharedController;
- (BOOL)copyCookiesFromArray:(id)a3 matchingDomain:(id)a4 intoFolderAtURL:(id)a5;
- (WBSCookieTransferController)init;
- (void)_copyCookiesFromCookieStore:(id)a3 matchingDomain:(id)a4 intoFolderAtURL:(id)a5 completionHandler:(id)a6;
- (void)copyCookiesFromFolderAtURL:(id)a3 intoDataStore:(id)a4;
- (void)copyCookiesFromWebView:(id)a3 intoFolderAtURL:(id)a4 completionHandler:(id)a5;
@end

@implementation WBSCookieTransferController

+ (WBSCookieTransferController)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__WBSCookieTransferController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_controller;
  return (WBSCookieTransferController *)v2;
}

void __47__WBSCookieTransferController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedController_controller;
  sharedController_controller = (uint64_t)v1;
}

- (WBSCookieTransferController)init
{
  v9.receiver = self;
  v9.super_class = (Class)WBSCookieTransferController;
  v2 = [(WBSCookieTransferController *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.SafariShared.cookieTransferQueue", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

    v7 = v2;
  }

  return v2;
}

+ (NSArray)domainsToDisableCookieCopying
{
  return (NSArray *)&unk_1F0341AB0;
}

- (void)copyCookiesFromWebView:(id)a3 intoFolderAtURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = [(id)objc_opt_class() domainsToDisableCookieCopying];
  v12 = [v10 configuration];
  v13 = [v12 websiteDataStore];
  v14 = [v13 httpCookieStore];

  v15 = [v10 URL];

  v16 = [v15 host];
  v17 = objc_msgSend(v16, "safari_highLevelDomainFromHost");

  if (v14)
  {
    v18 = objc_msgSend(v17, "safari_stringByRemovingWwwDotPrefix");
    int v19 = [v11 containsObject:v18];

    if (!v19)
    {
      [(WBSCookieTransferController *)self _copyCookiesFromCookieStore:v14 matchingDomain:v17 intoFolderAtURL:v8 completionHandler:v9];
      goto LABEL_9;
    }
    v20 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v20, OS_LOG_TYPE_INFO, "Skipping cookie copying due to quirks", buf, 2u);
    }
  }
  else
  {
    v21 = WBS_LOG_CHANNEL_PREFIXWebApps();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[WBSCookieTransferController copyCookiesFromWebView:intoFolderAtURL:completionHandler:](v21);
    }
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__WBSCookieTransferController_copyCookiesFromWebView_intoFolderAtURL_completionHandler___block_invoke;
  block[3] = &unk_1E5E41548;
  id v24 = v9;
  dispatch_async(internalQueue, block);

LABEL_9:
}

uint64_t __88__WBSCookieTransferController_copyCookiesFromWebView_intoFolderAtURL_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_copyCookiesFromCookieStore:(id)a3 matchingDomain:(id)a4 intoFolderAtURL:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [MEMORY[0x1E4F28CB8] defaultManager];
  v15 = objc_msgSend(v14, "safari_ensureDirectoryExists:", v12);

  if (v15)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke;
    v16[3] = &unk_1E5E41570;
    v16[4] = self;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    [v10 getAllCookies:v16];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2;
  v6[3] = &unk_1E5E40990;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v7, "safari_belongsToDomain:", *(void *)(a1 + 40)))
        {
          id v8 = *(void **)(a1 + 48);
          id v9 = NSString;
          uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
          id v11 = [(id)v10 UUIDString];
          id v12 = [v9 stringWithFormat:@"%@.plist", v11];
          id v13 = [v8 URLByAppendingPathComponent:v12];

          v14 = [v7 properties];
          id v18 = 0;
          LOBYTE(v10) = [v14 writeToURL:v13 error:&v18];
          id v15 = v18;

          if ((v10 & 1) == 0)
          {
            v16 = WBS_LOG_CHANNEL_PREFIXWebApps();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2_cold_1((uint64_t)v23, v16);
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (BOOL)copyCookiesFromArray:(id)a3 matchingDomain:(id)a4 intoFolderAtURL:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v30 = v9;
  id v11 = objc_msgSend(v10, "safari_ensureDirectoryExists:", v9);

  if (v11)
  {
    v27 = v11;
    v28 = v10;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v29 = v7;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(v17, "safari_belongsToDomain:", v8))
          {
            id v18 = NSString;
            uint64_t v19 = [MEMORY[0x1E4F29128] UUID];
            long long v20 = [(id)v19 UUIDString];
            long long v21 = [v18 stringWithFormat:@"%@.plist", v20];
            long long v22 = [v30 URLByAppendingPathComponent:v21];

            v23 = [v17 properties];
            id v31 = 0;
            LOBYTE(v19) = [v23 writeToURL:v22 error:&v31];
            id v24 = v31;

            if ((v19 & 1) == 0)
            {
              uint64_t v25 = WBS_LOG_CHANNEL_PREFIXWebApps();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
                __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2_cold_1((uint64_t)v36, v25);
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v14);
    }

    uint64_t v10 = v28;
    id v7 = v29;
    id v11 = v27;
  }

  return v11 != 0;
}

- (void)copyCookiesFromFolderAtURL:(id)a3 intoDataStore:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  unsigned __int8 v50 = 0;
  id v8 = [v5 path];
  int v9 = [v7 fileExistsAtPath:v8 isDirectory:&v50];
  int v10 = v50;

  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    id v49 = 0;
    id v12 = [v7 contentsOfDirectoryAtURL:v5 includingPropertiesForKeys:0 options:0 error:&v49];
    id v13 = v49;
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = WBS_LOG_CHANNEL_PREFIXWebApps();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.5(v15, v14);
      }
    }
    else
    {
      v39 = v7;
      id v36 = v6;
      id v37 = v5;
      uint64_t v38 = [v6 httpCookieStore];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v35 = v12;
      id v16 = v12;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v46 != v20) {
              objc_enumerationMutation(v16);
            }
            long long v22 = *(void **)(*((void *)&v45 + 1) + 8 * i);
            v23 = objc_msgSend(v22, "pathExtension", v35);
            int v24 = [v23 isEqualToString:@"plist"];

            if (v24)
            {
              id v44 = v19;
              uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v22 error:&v44];
              id v26 = v44;

              if (v25)
              {
                v27 = [MEMORY[0x1E4F18D28] cookieWithProperties:v25];
                if (v27)
                {
                  [v38 setCookie:v27 completionHandler:0];
                  id v41 = v26;
                  char v28 = [v39 removeItemAtURL:v22 error:&v41];
                  id v29 = v41;

                  if (v28)
                  {
                    id v26 = v29;
                  }
                  else
                  {
                    long long v32 = WBS_LOG_CHANNEL_PREFIXWebApps();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                      -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:].cold.4((uint64_t)v51, v32);
                    }

                    id v26 = 0;
                  }
                }
                else
                {
                  id v31 = WBS_LOG_CHANNEL_PREFIXWebApps();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
                    -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:](&buf, v43, v31);
                  }
                }
              }
              else
              {
                v30 = WBS_LOG_CHANNEL_PREFIXWebApps();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
                  -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:]((uint64_t)v52, v30);
                }
              }

              uint64_t v19 = v26;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v18);
      }
      else
      {
        uint64_t v19 = 0;
      }

      id v40 = v19;
      id v7 = v39;
      id v5 = v37;
      char v33 = [v39 removeItemAtURL:v37 error:&v40];
      id v14 = v40;

      if ((v33 & 1) == 0)
      {
        long long v34 = WBS_LOG_CHANNEL_PREFIXWebApps();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          -[WBSCookieTransferController copyCookiesFromFolderAtURL:intoDataStore:](v34, v14);
        }
      }

      id v12 = v35;
      id v6 = v36;
    }
  }
}

- (void).cxx_destruct
{
}

- (void)copyCookiesFromWebView:(os_log_t)log intoFolderAtURL:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unable to find cookie store", v1, 2u);
}

void __108__WBSCookieTransferController__copyCookiesFromCookieStore_matchingDomain_intoFolderAtURL_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_2((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1ABB70000, v4, v5, "Unable to write cookie to plist: %{public}@");
}

- (void)copyCookiesFromFolderAtURL:(void *)a1 intoDataStore:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Unable to remove staged cookie directory: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)copyCookiesFromFolderAtURL:(uint64_t)a1 intoDataStore:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_2((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1ABB70000, v4, v5, "Unable to read cookie plist: %{public}@");
}

- (void)copyCookiesFromFolderAtURL:(os_log_t)log intoDataStore:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Unable to initialize cookie with plist", buf, 2u);
}

- (void)copyCookiesFromFolderAtURL:(uint64_t)a1 intoDataStore:(void *)a2 .cold.4(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2_2((uint64_t)v3, 5.8381e-34);
  OUTLINED_FUNCTION_0_6(&dword_1ABB70000, v4, v5, "Unable to remove cookie plist: %{public}@");
}

- (void)copyCookiesFromFolderAtURL:(void *)a1 intoDataStore:(void *)a2 .cold.5(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Unable to enumerate staged cookies directory: %{public}@", v7, v8, v9, v10, 2u);
}

@end