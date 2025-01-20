@interface KTStatus
- (KTStatus)initWithApplication:(id)a3;
- (NSString)applicationIdentifier;
- (TransparencyApplication)application;
- (id)status:(id *)a3;
- (void)errorForFailedEvent:(id)a3 completionBlock:(id)a4;
- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4;
- (void)getCurrentStatus:(id)a3;
- (void)getSelfStatus:(id)a3;
- (void)getStatus:(id)a3;
- (void)ignoreFailedEvent:(id)a3 completionBlock:(id)a4;
- (void)ignoreFailedEvents:(id)a3 completionBlock:(id)a4;
- (void)setApplication:(id)a3;
@end

@implementation KTStatus

- (KTStatus)initWithApplication:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = +[TransparencyApplication applicationValueForIdentifier:v5];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)KTStatus;
    v7 = [(KTStatus *)&v14 init];
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
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_5);
    }
    v12 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v5;
      _os_log_impl(&dword_226345000, v12, OS_LOG_TYPE_ERROR, "Unknown application identifier: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

uint64_t __32__KTStatus_initWithApplication___block_invoke()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getCurrentStatus:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __29__KTStatus_getCurrentStatus___block_invoke;
  v6[3] = &unk_26479EA90;
  id v7 = v4;
  id v5 = v4;
  [(KTStatus *)self getStatus:v6];
}

void __29__KTStatus_getCurrentStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 optInState];
  id v8 = [v6 recentFailedEventIds];

  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, v7, v8, v5);
}

- (id)status:(id *)a3
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__1;
  v20 = __Block_byref_object_dispose__1;
  id v21 = 0;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__1;
  objc_super v14 = __Block_byref_object_dispose__1;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __19__KTStatus_status___block_invoke;
  v9[3] = &unk_26479EAE0;
  v9[4] = self;
  v9[5] = &v10;
  v9[6] = &v16;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __19__KTStatus_status___block_invoke_3;
  v8[3] = &unk_26479EB08;
  v8[4] = &v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:v8];
  if (!v17[5] && v11[5])
  {
    uint64_t v4 = +[TransparencyError errorWithDomain:@"TransparencyErrorInterface" code:-386 description:@"status failed without status and no error"];
    id v5 = (void *)v11[5];
    v11[5] = v4;
  }
  if (a3) {
    *a3 = (id) v11[5];
  }
  id v6 = (id)v17[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);

  return v6;
}

void __19__KTStatus_status___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) applicationIdentifier];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __19__KTStatus_status___block_invoke_2;
    v9[3] = &unk_26479EAB8;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    [v5 getStatus:v8 completionBlock:v9];
  }
}

void __19__KTStatus_status___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  int8x16_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __19__KTStatus_status___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_256);
  }
  uint64_t v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __19__KTStatus_status___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getStatus:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __22__KTStatus_getStatus___block_invoke;
  v8[3] = &unk_26479E888;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __22__KTStatus_getStatus___block_invoke_267;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v8 errorHandler:v6];
}

void __22__KTStatus_getStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_263);
    }
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_226345000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_266);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int8x16_t v10 = v8;
      id v11 = [v9 applicationIdentifier];
      int v14 = 138543362;
      id v15 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous get KT status for %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 32) applicationIdentifier];
    [v5 getStatus:v12 completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __22__KTStatus_getStatus___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __22__KTStatus_getStatus___block_invoke_264()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __22__KTStatus_getStatus___block_invoke_267(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_270);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __22__KTStatus_getStatus___block_invoke_2_268()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getSelfStatus:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __26__KTStatus_getSelfStatus___block_invoke;
  v8[3] = &unk_26479E888;
  v8[4] = self;
  id v9 = v4;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __26__KTStatus_getSelfStatus___block_invoke_276;
  v6[3] = &unk_26479E748;
  id v7 = v9;
  id v5 = v9;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v8 errorHandler:v6];
}

void __26__KTStatus_getSelfStatus___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_272);
    }
    v13 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_226345000, v13, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v14, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_275);
    }
    id v8 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int8x16_t v10 = v8;
      id v11 = [v9 applicationIdentifier];
      int v14 = 138543362;
      id v15 = v11;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_INFO, "Sending asynchronous get KT status for %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v12 = [*(id *)(a1 + 32) applicationIdentifier];
    [v5 getSelfStatus:v12 completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __26__KTStatus_getSelfStatus___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __26__KTStatus_getSelfStatus___block_invoke_273()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __26__KTStatus_getSelfStatus___block_invoke_276(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_279);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getCurrentStatus error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __26__KTStatus_getSelfStatus___block_invoke_2_277()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)errorForFailedEvent:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2_287;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_281);
    }
    id v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_284);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous error lookup for %@", buf, 0xCu);
    }
    uint64_t v14 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v14 count:1];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_285;
    v12[3] = &unk_26479E970;
    id v13 = *(id *)(a1 + 40);
    [v5 errorsForFailedEvents:v10 completionBlock:v12];
  }
}

uint64_t __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_282()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_285(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v7);
  }
  else if (v10)
  {
    id v9 = [v10 objectAtIndexedSubscript:0];
    (*(void (**)(uint64_t, uint64_t, void *))(v8 + 16))(v8, a2, v9);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, a2, 0);
  }
}

void __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_2_287(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_289);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown errorForFailedEvent error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __48__KTStatus_errorForFailedEvent_completionBlock___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)errorsForFailedEvents:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_295;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_291);
    }
    id v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_294);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous error lookup for %@", (uint8_t *)&v11, 0xCu);
    }
    [v5 errorsForFailedEvents:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_292()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_295(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_298);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown errorForFailedEvent error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__KTStatus_errorsForFailedEvents_completionBlock___block_invoke_2_296()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)ignoreFailedEvent:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_304;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_300);
    }
    int v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_303);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous ignore error for %@", buf, 0xCu);
    }
    uint64_t v12 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
    [v5 ignoreFailedEvents:v10 completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_301()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_304(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_307);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __46__KTStatus_ignoreFailedEvent_completionBlock___block_invoke_2_305()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)ignoreFailedEvents:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke;
  v11[3] = &unk_26479E888;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_313;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_309);
    }
    id v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_312);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
    {
      id v9 = *(void **)(a1 + 32);
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending asynchronous ignore error for %@", (uint8_t *)&v11, 0xCu);
    }
    [v5 ignoreFailedEvents:*(void *)(a1 + 32) completionBlock:*(void *)(a1 + 40)];
  }
}

uint64_t __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_310()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_313(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_4 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_4, &__block_literal_global_316);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown invokeXPCAsynchronousCallWithBlock error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__KTStatus_ignoreFailedEvents_completionBlock___block_invoke_2_314()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.Transparency", "default");

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