@interface SCArchivingService
- (void)getBoolAtKey:(int64_t)a3 completion:(id)a4;
- (void)getIntAtKey:(int64_t)a3 completion:(id)a4;
- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5;
- (void)getValueAtKey:(int64_t)a3 completion:(id)a4;
- (void)setObject:(id)a3 atKey:(id)a4 completion:(id)a5;
- (void)setValue:(id)a3 atKey:(int64_t)a4 completion:(id)a5;
@end

@implementation SCArchivingService

- (void)setObject:(id)a3 atKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[SCSharingReminderArchiver sharedInstance];
  [v10 setObject:v9 atKey:v8 withCompletion:v7];
}

- (void)getObjectOfClass:(Class)a3 atKey:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = +[SCSharingReminderArchiver sharedInstance];
  [v9 getObjectOfClass:a3 atKey:v8 completion:v7];
}

- (void)setValue:(id)a3 atKey:(int64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  storeKeyToString(a4);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [(SCArchivingService *)self setObject:v9 atKey:v10 completion:v8];
}

- (void)getValueAtKey:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = storeKeyToString(a3);
  uint64_t v8 = objc_opt_class();
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__SCArchivingService_getValueAtKey_completion___block_invoke;
  v11[3] = &unk_265497068;
  objc_copyWeak(v14, &location);
  id v9 = v7;
  id v12 = v9;
  v14[1] = (id)a3;
  id v10 = v6;
  id v13 = v10;
  [(SCArchivingService *)self getObjectOfClass:v8 atKey:v9 completion:v11];

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      uint64_t v8 = SCLogger();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v9;
        _os_log_impl(&dword_25B654000, v8, OS_LOG_TYPE_INFO, "\"Couldn't find value for %@, using and setting default instead\"", buf, 0xCu);
      }

      id v10 = +[SCSharingReminderKVStoreValue defaultForKey:*(void *)(a1 + 56)];
      uint64_t v11 = *(void *)(a1 + 56);
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __47__SCArchivingService_getValueAtKey_completion___block_invoke_2;
      v13[3] = &unk_265497040;
      id v16 = *(id *)(a1 + 40);
      id v14 = v10;
      id v15 = v6;
      id v12 = v10;
      [WeakRetained setValue:v12 atKey:v11 completion:v13];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke_2(void *a1, char a2, void *a3)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = SCLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__SCArchivingService_getValueAtKey_completion___block_invoke_2_cold_1(v6);
    }

    uint64_t v7 = a1[6];
    uint64_t v8 = a1[4];
    uint64_t v9 = [v5 code];
    v12[0] = a1[5];
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v11 = +[SCDaemonError errorWithCode:v9 underlyingErrors:v10];
    (*(void (**)(uint64_t, uint64_t, void *))(v7 + 16))(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)getIntAtKey:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__SCArchivingService_getIntAtKey_completion___block_invoke;
  v8[3] = &unk_265497090;
  id v9 = v6;
  id v7 = v6;
  [(SCArchivingService *)self getValueAtKey:a3 completion:v8];
}

void __45__SCArchivingService_getIntAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

- (void)getBoolAtKey:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SCArchivingService_getBoolAtKey_completion___block_invoke;
  v8[3] = &unk_265497090;
  id v9 = v6;
  id v7 = v6;
  [(SCArchivingService *)self getValueAtKey:a3 completion:v8];
}

void __46__SCArchivingService_getBoolAtKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

void __47__SCArchivingService_getValueAtKey_completion___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_25B654000, log, OS_LOG_TYPE_ERROR, "\"Error: couldn't set default value for SCSharingReminderStoreKey\"", v1, 2u);
}

@end