@interface KTOptInManager
+ (id)notificationKeyForApplication:(id)a3;
+ (void)getOptInState:(id)a3 completion:(id)a4;
- (BOOL)getOptInState;
- (KTOptInManager)initWithApplication:(id)a3;
- (NSString)applicationIdentifier;
- (TransparencyApplication)application;
- (void)changeOptInState:(unint64_t)a3 detailedCompletionBlock:(id)a4;
- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4;
- (void)getOptInStateWithSync:(id)a3;
- (void)setApplication:(id)a3;
- (void)setOptInState:(BOOL)a3 completionBlock:(id)a4;
- (void)setOptInState:(BOOL)a3 detailedCompletionBlock:(id)a4;
- (void)waitForIDSRegistration:(id)a3;
@end

@implementation KTOptInManager

+ (void)getOptInState:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [KTOptInState alloc];
  v8 = [v5 application];
  v9 = [(KTOptInState *)v7 initWithApplication:v8];

  [(KTOptInState *)v9 setState:2];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __43__KTOptInManager_getOptInState_completion___block_invoke;
  v17[3] = &unk_26479E838;
  id v20 = v6;
  v18 = v9;
  id v19 = v5;
  id v10 = v5;
  uint64_t v11 = [v10 sync];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__KTOptInManager_getOptInState_completion___block_invoke_207;
  v14[3] = &unk_26479E8D0;
  v15 = v18;
  id v16 = v20;
  v12 = v18;
  id v13 = v20;
  +[TransparencyXPCConnection invokeXPCWithBlock:v17 synchronous:v11 errorHandler:v14];
}

void __43__KTOptInManager_getOptInState_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_4);
    }
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCWithBlock error: %@", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    [v5 getKTOptInState:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

uint64_t __43__KTOptInManager_getOptInState_completion___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __43__KTOptInManager_getOptInState_completion___block_invoke_207(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_210);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "getOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __43__KTOptInManager_getOptInState_completion___block_invoke_2_208()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)notificationKeyForApplication:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"IDS"])
  {
    v4 = @"com.apple.Transparency.KT.IDS.OptInStateChanged";
  }
  else if ([v3 isEqualToString:@"MP"])
  {
    v4 = @"com.apple.Transparency.KT.MP.OptInStateChanged";
  }
  else if ([v3 isEqualToString:@"FT"])
  {
    v4 = @"com.apple.Transparency.KT.FT.OptInStateChanged";
  }
  else if ([v3 isEqualToString:@"CK"])
  {
    v4 = @"com.apple.Transparency.KT.CK.OptInStateChanged";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (KTOptInManager)initWithApplication:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = +[TransparencyApplication applicationValueForIdentifier:v5];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)KTOptInManager;
    uint64_t v7 = [(KTOptInManager *)&v14 init];
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_applicationIdentifier, a3);
      int v9 = [[TransparencyApplication alloc] initWithIdentifier:v8->_applicationIdentifier];
      application = v8->_application;
      v8->_application = v9;
    }
    self = v8;
    uint64_t v11 = self;
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_214);
    }
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t __38__KTOptInManager_initWithApplication___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (BOOL)getOptInState
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__KTOptInManager_getOptInState__block_invoke;
  v4[3] = &unk_26479E798;
  v4[4] = self;
  v4[5] = &v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v4 errorHandler:&__block_literal_global_229];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __31__KTOptInManager_getOptInState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_217);
    }
    v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_220);
    }
    char v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      int v9 = *(void **)(a1 + 32);
      id v10 = v8;
      uint64_t v11 = [v9 applicationIdentifier];
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state fetch for %{public}@", buf, 0xCu);
    }
    v12 = [KTOptInStateRequest alloc];
    id v13 = [*(id *)(a1 + 32) applicationIdentifier];
    objc_super v14 = [(KTOptInStateRequest *)v12 initWithApplication:v13];

    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __31__KTOptInManager_getOptInState__block_invoke_222;
    v16[3] = &unk_26479E8F8;
    long long v17 = *(_OWORD *)(a1 + 32);
    [v5 getKTOptInState:v14 completion:v16];
  }
}

uint64_t __31__KTOptInManager_getOptInState__block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __31__KTOptInManager_getOptInState__block_invoke_218()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __31__KTOptInManager_getOptInState__block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_225);
    }
    uint64_t v7 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      char v8 = *(void **)(a1 + 32);
      int v9 = v7;
      id v10 = [v8 applicationIdentifier];
      int v11 = 138543618;
      v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "opt-in state fetch for %{public}@ failed: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 state] == 1;
  }
}

uint64_t __31__KTOptInManager_getOptInState__block_invoke_2_223()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __31__KTOptInManager_getOptInState__block_invoke_227(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_232);
  }
  id v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "Unknown getOptInState error: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __31__KTOptInManager_getOptInState__block_invoke_2_230()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getOptInState:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke;
  v10[3] = &unk_26479E948;
  v10[4] = self;
  id v11 = v6;
  BOOL v12 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2_239;
  v8[3] = &unk_26479E748;
  id v9 = v11;
  id v7 = v11;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v10 errorHandler:v8];
}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_234);
    }
    uint64_t v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_237);
    }
    char v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      id v10 = v8;
      id v11 = [v9 applicationIdentifier];
      *(_DWORD *)buf = 138543362;
      id v19 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous opt-in state fetch for %{public}@", buf, 0xCu);
    }
    BOOL v12 = [KTOptInStateRequest alloc];
    __int16 v13 = [*(id *)(a1 + 32) applicationIdentifier];
    id v14 = [(KTOptInStateRequest *)v12 initWithApplication:v13];

    [(KTOptInStateRequest *)v14 setFetchCloudKit:*(unsigned __int8 *)(a1 + 48)];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__KTOptInManager_getOptInState_completionBlock___block_invoke_238;
    v16[3] = &unk_26479E920;
    id v17 = *(id *)(a1 + 40);
    [v5 getKTOptInState:v14 completion:v16];
  }
}

uint64_t __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __48__KTOptInManager_getOptInState_completionBlock___block_invoke_235()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __48__KTOptInManager_getOptInState_completionBlock___block_invoke_238(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  BOOL v7 = [v6 state] == 1;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = [v6 smtTimestamp];

  (*(void (**)(uint64_t, BOOL, id, id))(v8 + 16))(v8, v7, v9, v5);
}

uint64_t __48__KTOptInManager_getOptInState_completionBlock___block_invoke_2_239(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOptInStateWithSync:(id)a3
{
}

- (void)setOptInState:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __48__KTOptInManager_setOptInState_completionBlock___block_invoke;
  v8[3] = &unk_26479E970;
  id v9 = v6;
  id v7 = v6;
  [(KTOptInManager *)self setOptInState:v4 detailedCompletionBlock:v8];
}

uint64_t __48__KTOptInManager_setOptInState_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)waitForIDSRegistration:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__KTOptInManager_waitForIDSRegistration___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __41__KTOptInManager_waitForIDSRegistration___block_invoke_243;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_242);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v9, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    [v5 waitForIDSRegistration:*(void *)(a1 + 32)];
  }
}

uint64_t __41__KTOptInManager_waitForIDSRegistration___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __41__KTOptInManager_waitForIDSRegistration___block_invoke_243(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_246);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown checkIDSRegistration error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __41__KTOptInManager_waitForIDSRegistration___block_invoke_2_244()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)setOptInState:(BOOL)a3 detailedCompletionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke;
  block[3] = &unk_26479E9C0;
  BOOL v11 = a3;
  block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2;
  v5[3] = &unk_26479E948;
  id v2 = *(id *)(a1 + 40);
  char v7 = *(unsigned char *)(a1 + 48);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_252;
  v3[3] = &unk_26479E748;
  id v4 = *(id *)(a1 + 40);
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v5 errorHandler:v3];
}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  char v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_248);
    }
    id v14 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl(&dword_226345000, v14, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v15, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_251);
    }
    int v9 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 32);
      BOOL v11 = v9;
      BOOL v12 = [v10 applicationIdentifier];
      int v15 = 138543362;
      id v16 = v12;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state set for %{public}@", (uint8_t *)&v15, 0xCu);
    }
    __int16 v13 = [*(id *)(a1 + 32) applicationIdentifier];
    [v5 changeOptInState:v8 application:v13 completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_249()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_252(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_255);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown setKTOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__KTOptInManager_setOptInState_detailedCompletionBlock___block_invoke_2_253()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)changeOptInState:(unint64_t)a3 detailedCompletionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = dispatch_get_global_queue(33, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke;
  block[3] = &unk_26479EA10;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2;
  v5[3] = &unk_26479E9E8;
  id v2 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v2;
  uint64_t v7 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_261;
  v3[3] = &unk_26479E748;
  id v4 = *(id *)(a1 + 40);
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v5 errorHandler:v3];
}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_257);
    }
    int v15 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      uint64_t v17 = v7;
      _os_log_impl(&dword_226345000, v15, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", (uint8_t *)&v16, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_260);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_INFO))
    {
      int v9 = *(void **)(a1 + 32);
      id v10 = v8;
      unint64_t v11 = [v9 applicationIdentifier];
      uint64_t v12 = *(void *)(a1 + 48);
      int v16 = 138543618;
      uint64_t v17 = v11;
      __int16 v18 = 1024;
      int v19 = v12;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending synchronous opt-in state set for %{public}@: %d", (uint8_t *)&v16, 0x12u);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    id v14 = [*(id *)(a1 + 32) applicationIdentifier];
    [v5 changeOptInState:v13 application:v14 completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_258()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_261(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_3 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_3, &__block_literal_global_264);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_3;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown changeOptInState error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__KTOptInManager_changeOptInState_detailedCompletionBlock___block_invoke_2_262()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_3 = (uint64_t)os_log_create("com.apple.Transparency", "default");

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
}

@end