@interface SiriUICardProviderRegistry
+ (id)sharedInstance;
- (void)loadProviders;
- (void)preloadProviders;
@end

@implementation SiriUICardProviderRegistry

+ (id)sharedInstance
{
  if (sharedInstance_onceInitializationToken != -1) {
    dispatch_once(&sharedInstance_onceInitializationToken, &__block_literal_global_11);
  }
  v2 = (void *)sharedInstance_registry;
  return v2;
}

uint64_t __44__SiriUICardProviderRegistry_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SiriUICardProviderRegistry);
  uint64_t v1 = sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)preloadProviders
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[SiriUICardProviderRegistry preloadProviders]";
    _os_log_impl(&dword_2231EF000, v3, OS_LOG_TYPE_DEFAULT, "%s Enqueuing load card providers", buf, 0xCu);
  }
  v4 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SiriUICardProviderRegistry_preloadProviders__block_invoke;
  block[3] = &unk_26469EFA8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __46__SiriUICardProviderRegistry_preloadProviders__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SiriUICardProviderRegistry preloadProviders]_block_invoke";
    _os_log_impl(&dword_2231EF000, v2, OS_LOG_TYPE_DEFAULT, "%s Loading card providers", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) loadProviders];
}

- (void)loadProviders
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (loadProviders__onceToken != -1) {
    dispatch_once(&loadProviders__onceToken, &__block_literal_global_2);
  }
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[SiriUICardProviderRegistry loadProviders]";
    _os_log_impl(&dword_2231EF000, v2, OS_LOG_TYPE_DEFAULT, "%s Card Providers loaded", (uint8_t *)&v3, 0xCu);
  }
}

void __43__SiriUICardProviderRegistry_loadProviders__block_invoke()
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v0 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v1 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SiriUICardProviderRegistry loadProviders]_block_invoke";
    _os_log_impl(&dword_2231EF000, v1, OS_LOG_TYPE_DEFAULT, "%s starting", (uint8_t *)&buf, 0xCu);
  }
  v2 = (void *)MEMORY[0x263F315E8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  int v3 = (void *)getSUICKPEntryPointClass_softClass;
  uint64_t v22 = getSUICKPEntryPointClass_softClass;
  if (!getSUICKPEntryPointClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v24 = __getSUICKPEntryPointClass_block_invoke;
    v25 = &unk_26469F170;
    v26 = &v19;
    __getSUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    int v3 = (void *)v20[3];
  }
  int v4 = v3;
  _Block_object_dispose(&v19, 8);
  id v5 = objc_alloc_init(v4);
  objc_msgSend(v2, "registerProvider:", v5, v19);

  uint64_t v6 = (void *)MEMORY[0x263F315E8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v7 = (void *)getINUICKPEntryPointClass_softClass;
  uint64_t v22 = getINUICKPEntryPointClass_softClass;
  if (!getINUICKPEntryPointClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v24 = __getINUICKPEntryPointClass_block_invoke;
    v25 = &unk_26469F170;
    v26 = &v19;
    __getINUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v20[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v19, 8);
  id v9 = objc_alloc_init(v8);
  objc_msgSend(v6, "registerProvider:", v9, v19);

  v10 = (void *)MEMORY[0x263F315E8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v11 = (void *)getVSUICKPEntryPointClass_softClass;
  uint64_t v22 = getVSUICKPEntryPointClass_softClass;
  if (!getVSUICKPEntryPointClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v24 = __getVSUICKPEntryPointClass_block_invoke;
    v25 = &unk_26469F170;
    v26 = &v19;
    __getVSUICKPEntryPointClass_block_invoke((uint64_t)&buf);
    v11 = (void *)v20[3];
  }
  v12 = v11;
  _Block_object_dispose(&v19, 8);
  id v13 = objc_alloc_init(v12);
  objc_msgSend(v10, "registerProvider:", v13, v19);

  v14 = (void *)MEMORY[0x263F315E8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v15 = (void *)getSCKPProviderClass_softClass;
  uint64_t v22 = getSCKPProviderClass_softClass;
  if (!getSCKPProviderClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v24 = __getSCKPProviderClass_block_invoke;
    v25 = &unk_26469F170;
    v26 = &v19;
    __getSCKPProviderClass_block_invoke((uint64_t)&buf);
    v15 = (void *)v20[3];
  }
  v16 = v15;
  _Block_object_dispose(&v19, 8);
  id v17 = objc_alloc_init(v16);
  objc_msgSend(v14, "registerProvider:", v17, v19);

  v18 = *v0;
  if (os_log_type_enabled(*v0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SiriUICardProviderRegistry loadProviders]_block_invoke";
    _os_log_impl(&dword_2231EF000, v18, OS_LOG_TYPE_DEFAULT, "%s completed", (uint8_t *)&buf, 0xCu);
  }
}

@end