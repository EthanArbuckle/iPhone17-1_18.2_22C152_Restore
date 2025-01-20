@interface WBUGeneratedPasswordCredentialUpdater
+ (id)sharedUpdater;
- (WBUGeneratedPasswordCredentialUpdater)init;
- (id)_performRequest:(id)a3;
- (void)updateCredentialWithNewUsername:(id)a3 newGeneratedPassword:(id)a4 lastGeneratedPassword:(id)a5 credentialURL:(id)a6 protectionSpace:(id)a7 shouldSaveNewCredential:(BOOL)a8 completionHandler:(id)a9;
@end

@implementation WBUGeneratedPasswordCredentialUpdater

- (WBUGeneratedPasswordCredentialUpdater)init
{
  v15.receiver = self;
  v15.super_class = (Class)WBUGeneratedPasswordCredentialUpdater;
  v2 = [(WBUGeneratedPasswordCredentialUpdater *)&v15 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.WebUI.%@.%p", v5, v2];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    urlsToUpdateRequests = v2->_urlsToUpdateRequests;
    v2->_urlsToUpdateRequests = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9C0] set];
    urlsScheduledForUpdating = v2->_urlsScheduledForUpdating;
    v2->_urlsScheduledForUpdating = (NSMutableSet *)v11;

    v13 = v2;
  }

  return v2;
}

+ (id)sharedUpdater
{
  if (sharedUpdater_onceToken != -1) {
    dispatch_once(&sharedUpdater_onceToken, &__block_literal_global_544);
  }
  v2 = (void *)sharedUpdater_updater;
  return v2;
}

uint64_t __54__WBUGeneratedPasswordCredentialUpdater_sharedUpdater__block_invoke()
{
  sharedUpdater_updater = objc_alloc_init(WBUGeneratedPasswordCredentialUpdater);
  return MEMORY[0x270F9A758]();
}

- (void)updateCredentialWithNewUsername:(id)a3 newGeneratedPassword:(id)a4 lastGeneratedPassword:(id)a5 credentialURL:(id)a6 protectionSpace:(id)a7 shouldSaveNewCredential:(BOOL)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v21 = v20;
  if (v18 && v19 && (v15 || v16 || v17))
  {
    queue = self->_queue;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke;
    v23[3] = &unk_2643F09F0;
    id v24 = v15;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    BOOL v31 = a8;
    id v28 = v19;
    v29 = self;
    id v30 = v21;
    dispatch_async(queue, v23);
  }
  else if (v20)
  {
    (*((void (**)(id, void))v20 + 2))(v20, 0);
  }
}

void __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke(uint64_t a1)
{
  v2 = +[WBUGeneratedPasswordCredentialUpdateRequest requestWithNewUsername:*(void *)(a1 + 32) newGeneratedPassword:*(void *)(a1 + 40) lastGeneratedPassword:*(void *)(a1 + 48) credentialURL:*(void *)(a1 + 56) protectionSpace:*(void *)(a1 + 64) shouldSaveNewCredential:*(unsigned __int8 *)(a1 + 88)];
  [*(id *)(*(void *)(a1 + 72) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 56)];
  if ([*(id *)(*(void *)(a1 + 72) + 16) containsObject:*(void *)(a1 + 56)])
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3) {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 72) + 16) addObject:*(void *)(a1 + 56)];
    uint64_t v4 = *(void *)(a1 + 72);
    v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke_2;
    block[3] = &unk_2643F0360;
    block[4] = v4;
    id v7 = *(id *)(a1 + 56);
    id v8 = *(id *)(a1 + 80);
    dispatch_async(v5, block);
  }
}

void __188__WBUGeneratedPasswordCredentialUpdater_updateCredentialWithNewUsername_newGeneratedPassword_lastGeneratedPassword_credentialURL_protectionSpace_shouldSaveNewCredential_completionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_performRequest:");
  [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
}

- (id)_performRequest:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v32 = [MEMORY[0x263EFC618] sharedCredentialStorage];
  id v4 = [v3 protectionSpace];
  v5 = [v3 lastGeneratedPassword];
  id v6 = [v3 username];
  id v7 = [v3 generatedPassword];
  if (![v5 length]) {
    goto LABEL_20;
  }
  v33 = v7;
  id v30 = v6;
  id v29 = v3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = [v32 credentialsForProtectionSpace:v4];
  uint64_t v9 = [v8 allValues];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v35;
  uint64_t v31 = *MEMORY[0x263EFC5B0];
  v13 = v4;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v35 != v12) {
        objc_enumerationMutation(v9);
      }
      id v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ([v15 hasPassword])
      {
        id v16 = [v15 password];
        if (![v16 isEqualToString:v5]) {
          goto LABEL_16;
        }
        if (([v33 isEqualToString:v5] & 1) == 0)
        {

LABEL_13:
          id v19 = WBS_LOG_CHANNEL_PREFIXAutoFill();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = v19;
            v21 = [v15 user];
            v22 = [v4 host];
            *(_DWORD *)buf = 138740227;
            v41 = v21;
            __int16 v42 = 2117;
            v43 = v22;
            _os_log_impl(&dword_21C355000, v20, OS_LOG_TYPE_DEFAULT, "Using NSURLCredentialStorage to remove credential for user %{sensitive}@ on %{sensitive}@", buf, 0x16u);

            id v4 = v13;
          }
          uint64_t v38 = v31;
          uint64_t v39 = MEMORY[0x263EFFA88];
          id v16 = [NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
          [v32 removeCredential:v15 forProtectionSpace:v4 options:v16];
LABEL_16:

          continue;
        }
        id v17 = [v15 user];
        char v18 = [v30 isEqualToString:v17];

        id v4 = v13;
        if ((v18 & 1) == 0) {
          goto LABEL_13;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v34 objects:v44 count:16];
  }
  while (v11);
LABEL_19:

  id v3 = v29;
  id v6 = v30;
  id v7 = v33;
LABEL_20:
  if ([v3 shouldSaveNewCredential])
  {
    v23 = [MEMORY[0x263F66258] sharedLogger];
    [v23 didUseGeneratedPassword];

    id v24 = [MEMORY[0x263F663B0] sharedStore];
    id v25 = objc_msgSend(v4, "safari_userVisibleSiteForProtectionSpace");
    id v26 = objc_msgSend(v25, "safari_highLevelDomainForPasswordManager");
    id v27 = [v24 saveUser:v6 password:v7 forProtectionSpace:v4 highLevelDomain:v26 groupID:*MEMORY[0x263F66440]];

    [v24 setSavedAccountAsDefault:v27 forProtectionSpace:v4];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlsToUpdateRequests, 0);
  objc_storeStrong((id *)&self->_urlsScheduledForUpdating, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end