@interface TransparencyGossip
+ (id)retrieveCurrentVerifiedTLTSTH:(id *)a3;
+ (void)sthsReceivedFromPeers:(id)a3 error:(id *)a4;
@end

@implementation TransparencyGossip

+ (id)retrieveCurrentVerifiedTLTSTH:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5;
  v13 = __Block_byref_object_dispose__5;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke;
  v8[3] = &unk_26479EBC8;
  v8[4] = &v9;
  v8[5] = &v15;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2_9;
  v7[3] = &unk_26479EB08;
  v7[4] = &v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v8 errorHandler:v7];
  if (a3)
  {
    v4 = (void *)v10[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_14);
    }
    uint64_t v9 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    if (v7) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_5);
    }
    v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending synchronous retrieveCurrentVerifiedTLTSTH", buf, 2u);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_6;
    v10[3] = &unk_26479F608;
    long long v11 = *(_OWORD *)(a1 + 32);
    [v5 retrieveCurrentVerifiedTLTSTH:v10];
  }
}

uint64_t __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

{
  uint64_t vars8;

  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (v8) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __52__TransparencyGossip_retrieveCurrentVerifiedTLTSTH___block_invoke_2_9(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_11);
  }
  v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown retrieveCurrentVerifiedTLTSTH error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

+ (void)sthsReceivedFromPeers:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke;
  v9[3] = &unk_26479EC18;
  long long v11 = &v12;
  id v6 = v5;
  id v10 = v6;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2_19;
  v8[3] = &unk_26479EB08;
  v8[4] = &v12;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:v8];
  if (a4)
  {
    int v7 = (void *)v13[5];
    if (v7) {
      *a4 = v7;
    }
  }

  _Block_object_dispose(&v12, 8);
}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  int v7 = v6;
  if (!v5 || v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_14);
    }
    id v10 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_226345000, v10, OS_LOG_TYPE_ERROR, "Unknown invokeXPCSynchronousCallWithBlock error: %@", buf, 0xCu);
    }
    if (v7) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    }
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_17);
    }
    id v8 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v8, OS_LOG_TYPE_INFO, "Sending synchronous sthsReceivedFromPeers", buf, 2u);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_18;
    v11[3] = &unk_26479EB08;
    uint64_t v9 = *(void *)(a1 + 32);
    v11[4] = *(void *)(a1 + 40);
    [v5 sthsReceivedFromPeers:v9 completionBlock:v11];
  }
}

uint64_t __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_15()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_18(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

void __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_2_19(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_12 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_12, &__block_literal_global_21_0);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_12;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_12, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "Unknown sthsReceivedFromPeers error: %@", (uint8_t *)&v7, 0xCu);
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __50__TransparencyGossip_sthsReceivedFromPeers_error___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_12 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

@end