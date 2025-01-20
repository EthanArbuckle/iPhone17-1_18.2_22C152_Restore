@interface ULPersistenceStore
- (BOOL)loadWithCoordinator:(id)a3 error:(id *)a4;
- (NSPersistentStoreDescription)storeDescription;
- (ULPersistenceStore)initWithURL:(id)a3 useWal:(BOOL)a4;
- (void)setStoreDescription:(id)a3;
@end

@implementation ULPersistenceStore

- (ULPersistenceStore)initWithURL:(id)a3 useWal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ULPersistenceStore;
  v7 = [(ULPersistenceStore *)&v20 init];
  if (v7)
  {
    v8 = objc_opt_new();
    [(ULPersistenceStore *)v7 setStoreDescription:v8];

    v9 = [(ULPersistenceStore *)v7 storeDescription];
    [v9 setShouldAddStoreAsynchronously:0];

    v10 = [(ULPersistenceStore *)v7 storeDescription];
    [v10 setShouldMigrateStoreAutomatically:1];

    v11 = [(ULPersistenceStore *)v7 storeDescription];
    [v11 setShouldInferMappingModelAutomatically:1];

    v12 = [(ULPersistenceStore *)v7 storeDescription];
    [v12 setURL:v6];

    uint64_t v13 = *MEMORY[0x263EFF168];
    v14 = [(ULPersistenceStore *)v7 storeDescription];
    [v14 setType:v13];

    v15 = [(ULPersistenceStore *)v7 storeDescription];
    [v15 setOption:*MEMORY[0x263F08088] forKey:*MEMORY[0x263EFF0E0]];

    v16 = @"DELETE";
    if (v4) {
      v16 = @"WAL";
    }
    v17 = v16;
    v18 = [(ULPersistenceStore *)v7 storeDescription];
    [v18 setValue:v17 forPragmaNamed:@"journal_mode"];
  }
  return v7;
}

- (BOOL)loadWithCoordinator:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__15;
  v15 = __Block_byref_object_dispose__15;
  id v16 = 0;
  v7 = [(ULPersistenceStore *)self storeDescription];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__ULPersistenceStore_loadWithCoordinator_error___block_invoke;
  v10[3] = &unk_2653F9F20;
  v10[4] = &v11;
  v10[5] = &v17;
  [v6 addPersistentStoreWithDescription:v7 completionHandler:v10];

  if (a4) {
    *a4 = (id) v12[5];
  }
  char v8 = *((unsigned char *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __48__ULPersistenceStore_loadWithCoordinator_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == 0;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    if (onceToken_MicroLocation_Default != -1) {
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_81);
    }
    id v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_25631F000, v6, OS_LOG_TYPE_FAULT, "Could not add store with error = %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (NSPersistentStoreDescription)storeDescription
{
  return self->_storeDescription;
}

- (void)setStoreDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end