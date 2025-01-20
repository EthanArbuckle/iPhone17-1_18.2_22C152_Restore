@interface KTPeerOverrides
+ (id)listPeerOverrides;
+ (void)clearPeerOverride:(id)a3 application:(id)a4;
+ (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5;
@end

@implementation KTPeerOverrides

+ (void)setPeerOverride:(id)a3 application:(id)a4 state:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke;
  v13[3] = &unk_26479E508;
  id v14 = v7;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v13 errorHandler:&__block_literal_global];
}

uint64_t __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke(void *a1, void *a2)
{
  return [a2 setPeerOverride:a1[4] application:a1[5] state:a1[6]];
}

void __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_30);
  }
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "setPeerOverride error: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __53__KTPeerOverrides_setPeerOverride_application_state___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (void)clearPeerOverride:(id)a3 application:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__KTPeerOverrides_clearPeerOverride_application___block_invoke;
  v9[3] = &unk_26479E570;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:&__block_literal_global_34];
}

uint64_t __49__KTPeerOverrides_clearPeerOverride_application___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearPeerOverride:*(void *)(a1 + 32) application:*(void *)(a1 + 40)];
}

void __49__KTPeerOverrides_clearPeerOverride_application___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_36);
  }
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "clearPeerOverride error: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __49__KTPeerOverrides_clearPeerOverride_application___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

+ (id)listPeerOverrides
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__KTPeerOverrides_listPeerOverrides__block_invoke;
  v4[3] = &unk_26479E5C0;
  v4[4] = &v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v4 errorHandler:&__block_literal_global_39];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

uint64_t __36__KTPeerOverrides_listPeerOverrides__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __36__KTPeerOverrides_listPeerOverrides__block_invoke_2;
  v3[3] = &unk_26479E598;
  v3[4] = *(void *)(a1 + 32);
  return [a2 listPeerOverrides:v3];
}

void __36__KTPeerOverrides_listPeerOverrides__block_invoke_2(uint64_t a1, void *a2)
{
}

void __36__KTPeerOverrides_listPeerOverrides__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK, &__block_literal_global_41);
  }
  v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "listPeerOverrides error: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __36__KTPeerOverrides_listPeerOverrides__block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

@end