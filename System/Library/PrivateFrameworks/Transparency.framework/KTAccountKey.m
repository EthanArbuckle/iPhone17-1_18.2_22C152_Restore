@interface KTAccountKey
+ (id)accountPublicID:(id)a3;
+ (id)accountPublicKey:(id)a3;
- (KTAccountKey)initWithApplication:(id)a3;
- (KTAccountPublicID)accountPublicID;
- (NSData)_accountPublicKeyInfo;
- (NSData)accountPublicKeyInfo;
- (NSString)applicationIdentifier;
- (TransparencyApplication)application;
- (void)rollKey:(id)a3;
- (void)setApplication:(id)a3;
- (void)set_accountPublicKeyInfo:(id)a3;
- (void)signData:(id)a3 completionBlock:(id)a4;
- (void)signDataCIP:(id)a3 completionBlock:(id)a4;
@end

@implementation KTAccountKey

- (KTAccountKey)initWithApplication:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[TransparencyApplication applicationValueForIdentifier:v5];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)KTAccountKey;
    v7 = [(KTAccountKey *)&v14 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
      v9 = [[TransparencyApplication alloc] initWithIdentifier:v8->_applicationIdentifier];
      application = v8->_application;
      v8->_application = v9;
    }
    self = v8;
    v11 = self;
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_2);
    }
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

uint64_t __36__KTAccountKey_initWithApplication___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)accountPublicKey:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  objc_super v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__KTAccountKey_accountPublicKey___block_invoke;
  v7[3] = &unk_26479E798;
  id v4 = v3;
  id v8 = v4;
  v9 = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:&__block_literal_global_8];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __33__KTAccountKey_accountPublicKey___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __33__KTAccountKey_accountPublicKey___block_invoke_2;
  v4[3] = &unk_26479E770;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  return [a2 accountKey:v2 complete:v4];
}

void __33__KTAccountKey_accountPublicKey___block_invoke_2(uint64_t a1, void *a2)
{
}

void __33__KTAccountKey_accountPublicKey___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_10);
  }
  id v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __33__KTAccountKey_accountPublicKey___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)accountPublicID:(id)a3
{
  id v3 = [a1 accountPublicKey:a3];
  if (v3)
  {
    int v4 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v3 error:0];
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (NSData)accountPublicKeyInfo
{
  id v3 = [(KTAccountKey *)self _accountPublicKeyInfo];
  objc_sync_enter(v3);
  int v4 = [(KTAccountKey *)self _accountPublicKeyInfo];

  if (v4)
  {
    id v5 = [(KTAccountKey *)self _accountPublicKeyInfo];
    objc_sync_exit(v3);
  }
  else
  {
    objc_sync_exit(v3);

    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__0;
    uint64_t v12 = __Block_byref_object_dispose__0;
    id v13 = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __36__KTAccountKey_accountPublicKeyInfo__block_invoke;
    v7[3] = &unk_26479E798;
    void v7[4] = self;
    v7[5] = &v8;
    +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:&__block_literal_global_24_0];
    id v5 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }

  return (NSData *)v5;
}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_13);
    }
    uint64_t v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v14 = v7;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_16);
    }
    uint64_t v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending synchronous signData for public key", buf, 2u);
    }
    v9 = [*(id *)(a1 + 32) applicationIdentifier];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__KTAccountKey_accountPublicKeyInfo__block_invoke_17;
    v11[3] = &unk_26479E7C0;
    long long v12 = *(_OWORD *)(a1 + 32);
    [v5 signData:0 application:v9 completionBlock:v11];
  }
}

uint64_t __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __36__KTAccountKey_accountPublicKeyInfo__block_invoke_14()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_17(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v10)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    objc_super v14 = [*(id *)(a1 + 32) _accountPublicKeyInfo];
    objc_sync_enter(v14);
    objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v10);
    objc_sync_exit(v14);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_20);
    }
    uint64_t v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v13;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

uint64_t __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2_18()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __36__KTAccountKey_accountPublicKeyInfo__block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_27);
  }
  id v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "Failed to get account public key: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __36__KTAccountKey_accountPublicKeyInfo__block_invoke_2_25()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (KTAccountPublicID)accountPublicID
{
  id v2 = [(KTAccountKey *)self accountPublicKeyInfo];
  if (v2)
  {
    id v3 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v2 error:0];
  }
  else
  {
    id v3 = 0;
  }

  return (KTAccountPublicID *)v3;
}

- (void)signData:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__KTAccountKey_signData_completionBlock___block_invoke;
  v8[3] = &unk_26479E7E8;
  id v9 = v6;
  id v7 = v6;
  [(KTAccountKey *)self signDataCIP:a3 completionBlock:v8];
}

uint64_t __41__KTAccountKey_signData_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)signDataCIP:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke;
  v12[3] = &unk_26479E838;
  objc_super v14 = self;
  id v15 = v7;
  id v13 = v6;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2_34;
  v10[3] = &unk_26479E748;
  id v11 = v15;
  id v8 = v15;
  id v9 = v6;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v12 errorHandler:v10];
}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_29);
    }
    id v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v16 = v7;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_32);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous signData", buf, 2u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [*(id *)(a1 + 40) applicationIdentifier];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_33;
    v13[3] = &unk_26479E810;
    id v11 = *(void **)(a1 + 48);
    v13[4] = *(void *)(a1 + 40);
    id v14 = v11;
    [v5 signData:v9 application:v10 completionBlock:v13];
  }
}

uint64_t __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_30()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_33(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v13 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [*(id *)(a1 + 32) _accountPublicKeyInfo];
  objc_sync_enter(v12);
  objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v13);
  objc_sync_exit(v12);

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_2_34(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_36_0);
  }
  int v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__KTAccountKey_signDataCIP_completionBlock___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)rollKey:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __24__KTAccountKey_rollKey___block_invoke;
  v8[3] = &unk_26479E888;
  void v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __24__KTAccountKey_rollKey___block_invoke_49;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v8 errorHandler:v6];
}

void __24__KTAccountKey_rollKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_38);
    }
    id v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_41_0);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous rollKey", buf, 2u);
    }
    id v9 = [*(id *)(a1 + 32) applicationIdentifier];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __24__KTAccountKey_rollKey___block_invoke_42;
    v12[3] = &unk_26479E860;
    id v10 = *(void **)(a1 + 40);
    void v12[4] = *(void *)(a1 + 32);
    id v13 = v10;
    [v5 rollKeyForApplication:v9 completionBlock:v12];
  }
}

uint64_t __24__KTAccountKey_rollKey___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __24__KTAccountKey_rollKey___block_invoke_39()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __24__KTAccountKey_rollKey___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) _accountPublicKeyInfo];
    objc_sync_enter(v7);
    objc_msgSend(*(id *)(a1 + 32), "set_accountPublicKeyInfo:", v5);
    objc_sync_exit(v7);

    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_45);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 applicationIdentifier];
      int v16 = 138543362;
      uint64_t v17 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_DEFAULT, "Successfully rolled account key for %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_48);
    }
    id v12 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      id v13 = *(void **)(a1 + 32);
      id v14 = v12;
      id v15 = [v13 applicationIdentifier];
      int v16 = 138543618;
      uint64_t v17 = v15;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_226345000, v14, OS_LOG_TYPE_ERROR, "Failed to roll account key for %{public}@: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __24__KTAccountKey_rollKey___block_invoke_2_43()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __24__KTAccountKey_rollKey___block_invoke_46()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __24__KTAccountKey_rollKey___block_invoke_49(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_1 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_1, &__block_literal_global_52);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown rollKeyForApplication error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __24__KTAccountKey_rollKey___block_invoke_2_50()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_1 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (NSString)applicationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (TransparencyApplication)application
{
  return (TransparencyApplication *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSData)_accountPublicKeyInfo
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_accountPublicKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accountPublicKeyInfo, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end