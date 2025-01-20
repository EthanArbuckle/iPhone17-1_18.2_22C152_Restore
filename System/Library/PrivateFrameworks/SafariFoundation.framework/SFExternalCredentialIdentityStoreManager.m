@interface SFExternalCredentialIdentityStoreManager
+ (id)sharedManager;
- (SFExternalCredentialIdentityStoreManager)init;
- (id)_credentialIdentityStoreWithIdentifier:(id)a3;
- (void)getCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4;
- (void)removeCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SFExternalCredentialIdentityStoreManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __57__SFExternalCredentialIdentityStoreManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(SFExternalCredentialIdentityStoreManager);
  return MEMORY[0x270F9A758]();
}

- (SFExternalCredentialIdentityStoreManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SFExternalCredentialIdentityStoreManager;
  v2 = [(SFExternalCredentialIdentityStoreManager *)&v11 init];
  if (v2)
  {
    v3 = NSString;
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"com.apple.SafariFoundation.%@.%p", v5, v2];
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = v2;
  }

  return v2;
}

- (void)getCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __96__SFExternalCredentialIdentityStoreManager_getCredentialIdentityStoreWithIdentifier_completion___block_invoke;
    block[3] = &unk_264390F18;
    id v12 = v7;
    block[4] = self;
    id v11 = v6;
    dispatch_async(queue, block);
  }
}

void __96__SFExternalCredentialIdentityStoreManager_getCredentialIdentityStoreWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) _credentialIdentityStoreWithIdentifier:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (id)_credentialIdentityStoreWithIdentifier:(id)a3
{
  if (a3)
  {
    v3 = containerForCredentialIdentityStoreWithIdentifier(a3);
    v4 = v3;
    if (v3)
    {
      v5 = [v3 URLByAppendingPathComponent:@"Identities" isDirectory:1];
      if (v5)
      {
        id v6 = [MEMORY[0x263F08850] defaultManager];
        id v13 = 0;
        char v7 = [v6 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
        id v8 = v13;

        if (v7)
        {
          v9 = [v5 URLByAppendingPathComponent:@"Identities.db" isDirectory:0];
          v10 = [[SFExternalCredentialIdentityStore alloc] initWithURL:v9];
        }
        else
        {
          id v11 = WBS_LOG_CHANNEL_PREFIXCredentials();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            -[SFExternalCredentialIdentityStoreManager _credentialIdentityStoreWithIdentifier:]((uint64_t)v8, v11);
          }
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)removeCredentialIdentityStoreWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = &__block_literal_global_7_0;
  }
  id v8 = (void *)MEMORY[0x21D47DB00](v7);
  queue = self->_queue;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __99__SFExternalCredentialIdentityStoreManager_removeCredentialIdentityStoreWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_264390F60;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(queue, v12);
}

void __99__SFExternalCredentialIdentityStoreManager_removeCredentialIdentityStoreWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = containerForCredentialIdentityStoreWithIdentifier(v2);
    v4 = v3;
    if (!v3)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      id v14 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);

LABEL_16:
      return;
    }
    v5 = [v3 URLByAppendingPathComponent:@"Identities" isDirectory:1];
    if (v5)
    {
      id v6 = [MEMORY[0x263F08850] defaultManager];
      id v17 = 0;
      char v7 = [v6 removeItemAtURL:v5 error:&v17];
      id v8 = v17;

      if ((v7 & 1) == 0)
      {
        v9 = [v8 domain];
        if ([v9 isEqualToString:*MEMORY[0x263F07F70]])
        {
          uint64_t v10 = [v8 code];

          if (v10 == 4)
          {
            id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_15:
            v11();

            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v11 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_15;
    }
    uint64_t v15 = *(void *)(a1 + 40);
    id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
    id v11 = *(void (**)(void))(v15 + 16);
    goto LABEL_15;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  id v16 = [MEMORY[0x263F087E8] errorWithDomain:@"SFExternalCredentialIdentityStoreErrorDomain" code:0 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v12 + 16))(v12, 0, v16);
}

- (void).cxx_destruct
{
}

- (void)_credentialIdentityStoreWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218FBF000, a2, OS_LOG_TYPE_ERROR, "Failed to create directory for identities database with error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end