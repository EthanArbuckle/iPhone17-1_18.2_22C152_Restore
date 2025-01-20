@interface SSKeyValueStoreDatabase
- (SSKeyValueStoreDatabase)init;
- (id)_initReadOnly:(BOOL)a3;
- (id)initReadOnly;
- (void)_dispatchBlockAsync:(id)a3;
- (void)dealloc;
- (void)modifyAsyncUsingTransactionBlock:(id)a3;
- (void)modifyUsingTransactionBlock:(id)a3;
- (void)readAsyncUsingSessionBlock:(id)a3;
- (void)readUsingSessionBlock:(id)a3;
@end

@implementation SSKeyValueStoreDatabase

- (id)_initReadOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SSKeyValueStoreSchema databasePath];
  id v6 = v5;
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke;
    block[3] = &unk_1E5BA73F8;
    block[4] = v5;
    if (_initReadOnly__sOnce != -1) {
      dispatch_once(&_initReadOnly__sOnce, block);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)SSKeyValueStoreDatabase;
  v7 = [(SSKeyValueStoreDatabase *)&v11 init];
  if (v7)
  {
    v8 = [SSSQLiteDatabase alloc];
    v9 = -[SSSQLiteDatabase initWithDatabaseURL:readOnly:](v8, "initWithDatabaseURL:readOnly:", [MEMORY[0x1E4F1CB10] fileURLWithPath:v6], v3);
    v7->_database = v9;
    if (!v3) {
      [(SSSQLiteDatabase *)v9 setSetupBlock:&__block_literal_global_25];
    }
  }
  return v7;
}

void __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", objc_msgSend(*(id *)(a1 + 32), "stringByDeletingLastPathComponent"), 1, 0, 0);
}

uint64_t __41__SSKeyValueStoreDatabase__initReadOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[SSKeyValueStoreSchema createSchemaInDatabase:a2];
}

- (SSKeyValueStoreDatabase)init
{
  return (SSKeyValueStoreDatabase *)[(SSKeyValueStoreDatabase *)self _initReadOnly:0];
}

- (id)initReadOnly
{
  return [(SSKeyValueStoreDatabase *)self _initReadOnly:1];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSKeyValueStoreDatabase;
  [(SSKeyValueStoreDatabase *)&v3 dealloc];
}

- (void)modifyAsyncUsingTransactionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__SSKeyValueStoreDatabase_modifyAsyncUsingTransactionBlock___block_invoke;
  v3[3] = &unk_1E5BAA2E0;
  v3[4] = self;
  v3[5] = a3;
  [(SSKeyValueStoreDatabase *)self _dispatchBlockAsync:v3];
}

uint64_t __60__SSKeyValueStoreDatabase_modifyAsyncUsingTransactionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) modifyUsingTransactionBlock:*(void *)(a1 + 40)];
}

- (void)modifyUsingTransactionBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55__SSKeyValueStoreDatabase_modifyUsingTransactionBlock___block_invoke;
  v4[3] = &unk_1E5BACD50;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __55__SSKeyValueStoreDatabase_modifyUsingTransactionBlock___block_invoke(uint64_t a1)
{
  id v2 = [(SSKeyValueStoreSession *)[SSKeyValueStoreTransaction alloc] initWithDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();

  return v3;
}

- (void)readAsyncUsingSessionBlock:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SSKeyValueStoreDatabase_readAsyncUsingSessionBlock___block_invoke;
  v3[3] = &unk_1E5BAA2E0;
  v3[4] = self;
  v3[5] = a3;
  [(SSKeyValueStoreDatabase *)self _dispatchBlockAsync:v3];
}

uint64_t __54__SSKeyValueStoreDatabase_readAsyncUsingSessionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) readUsingSessionBlock:*(void *)(a1 + 40)];
}

- (void)readUsingSessionBlock:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__SSKeyValueStoreDatabase_readUsingSessionBlock___block_invoke;
  v4[3] = &unk_1E5BACD50;
  v4[4] = self;
  v4[5] = a3;
  [(SSSQLiteDatabase *)database performTransactionWithBlock:v4];
}

uint64_t __49__SSKeyValueStoreDatabase_readUsingSessionBlock___block_invoke(uint64_t a1)
{
  id v2 = [[SSKeyValueStoreSession alloc] initWithDatabase:*(void *)(*(void *)(a1 + 32) + 8)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

  return 1;
}

- (void)_dispatchBlockAsync:(id)a3
{
  database = self->_database;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SSKeyValueStoreDatabase__dispatchBlockAsync___block_invoke;
  v4[3] = &unk_1E5BA7700;
  v4[4] = a3;
  [(SSSQLiteDatabase *)database dispatchBlockAsync:v4];
}

uint64_t __47__SSKeyValueStoreDatabase__dispatchBlockAsync___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end