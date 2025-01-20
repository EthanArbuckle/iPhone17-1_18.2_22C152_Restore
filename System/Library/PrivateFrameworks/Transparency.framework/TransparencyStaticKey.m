@interface TransparencyStaticKey
- (KTAccountPublicID)accountIdentity;
- (void)deleteKTSession:(id)a3 complete:(id)a4;
- (void)getKTSessionByHandle:(id)a3 complete:(id)a4;
- (void)getKTSessionByID:(id)a3 complete:(id)a4;
- (void)listKTSessions:(id)a3;
- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5 complete:(id)a6;
- (void)setAccountIdentity:(id)a3;
- (void)setupKTSession:(id)a3 complete:(id)a4;
- (void)transparencyHaveContact:(id)a3 complete:(id)a4;
@end

@implementation TransparencyStaticKey

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke;
  v11[3] = &unk_26479F658;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2_306;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v11 errorHandler:v9];
}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_302);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_303;
    v10[3] = &unk_26479F630;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v5 setupKTSession:v8 complete:v10];
  }
}

uint64_t __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_2_306(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_308_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown setupKTSession error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__TransparencyStaticKey_setupKTSession_complete___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke;
  v11[3] = &unk_26479F658;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2_314;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v11 errorHandler:v9];
}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_311_0);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_312;
    v10[3] = &unk_26479F680;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v5 deleteKTSession:v8 complete:v10];
  }
}

uint64_t __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_2_314(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_316_0);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown deleteKTSession error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __50__TransparencyStaticKey_deleteKTSession_complete___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)listKTSessions:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke;
  v7[3] = &unk_26479F6D0;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke_2_321;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v7 errorHandler:v5];
}

void __40__TransparencyStaticKey_listKTSessions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_318);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __40__TransparencyStaticKey_listKTSessions___block_invoke_319;
    v9[3] = &unk_26479F6A8;
    id v10 = *(id *)(a1 + 32);
    [v5 listKTSession:v9];
  }
}

uint64_t __40__TransparencyStaticKey_listKTSessions___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__TransparencyStaticKey_listKTSessions___block_invoke_319(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__TransparencyStaticKey_listKTSessions___block_invoke_2_321(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_323);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown listKTSessions error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__TransparencyStaticKey_listKTSessions___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke;
  v11[3] = &unk_26479F658;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2_327;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v11 errorHandler:v9];
}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_325_0);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_326;
    v10[3] = &unk_26479F6A8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v5 getKTSessionByHandle:v8 complete:v10];
  }
}

uint64_t __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_326(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_2_327(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_329);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getKTSessionByHandle error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__TransparencyStaticKey_getKTSessionByHandle_complete___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke;
  v11[3] = &unk_26479F658;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2_334;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v11 errorHandler:v9];
}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_331);
    }
    v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_332;
    v10[3] = &unk_26479F6F8;
    uint64_t v8 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v5 getKTSessionByID:v8 complete:v10];
  }
}

uint64_t __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_332(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_2_334(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_336);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown getKTSessionByID error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__TransparencyStaticKey_getKTSessionByID_complete___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5 complete:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke;
  v19[3] = &unk_26479F720;
  id v20 = v9;
  id v21 = v10;
  id v22 = v11;
  id v23 = v12;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_2_340;
  v17[3] = &unk_26479E748;
  id v18 = v23;
  id v13 = v23;
  id v14 = v11;
  id v15 = v10;
  id v16 = v9;
  +[TransparencyXPCConnection invokeIDSXPCWithBlock:v19 errorHandler:v17];
}

void __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_338);
    }
    id v11 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_226345000, v11, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_339;
    v12[3] = &unk_26479E748;
    uint64_t v10 = *(void *)(a1 + 48);
    id v13 = *(id *)(a1 + 56);
    [v5 sasTTR:v8 toHandle:v9 pushToken:v10 complete:v12];
  }
}

uint64_t __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_339(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_2_340(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_13 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_13, &__block_literal_global_342_0);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_13;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_13, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown setupKTSession error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__TransparencyStaticKey_sasTTR_toHandle_pushToken_complete___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_13 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)transparencyHaveContact:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke;
  v11[3] = &unk_26479F770;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke_3;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeIDSSupportWithBlock:v11 errorHandler:v9];
}

void __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke_2;
    v6[3] = &unk_26479F748;
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    [a2 haveContact:v5 complete:v6];
  }
}

uint64_t __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__TransparencyStaticKey_transparencyHaveContact_complete___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (KTAccountPublicID)accountIdentity
{
  return (KTAccountPublicID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccountIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end