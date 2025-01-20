@interface RCPersistentContainer
+ (id)storeDescriptionForURL:(id)a3 isXPCClient:(BOOL)a4 configuration:(id)a5;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentStore)store;
- (NSString)transactionAuthor;
- (RCPersistentContainer)initWithURL:(id)a3;
- (id)loadStore:(id)a3 error:(id *)a4;
- (id)newBackgroundModel;
- (id)newContextWithConcurrencyType:(unint64_t)a3;
- (id)storeDescriptionWithURL:(id)a3;
- (void)_configureContext:(id)a3 isViewContext:(BOOL)a4;
@end

@implementation RCPersistentContainer

uint64_t __57__RCPersistentContainer__configureContext_isViewContext___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTransactionAuthor:*(void *)(*(void *)(a1 + 40) + 24)];
  [*(id *)(a1 + 32) setMergePolicy:*MEMORY[0x1E4F1BE40]];
  if (*(unsigned char *)(a1 + 48)) {
    v2 = @"view";
  }
  else {
    v2 = @"background";
  }
  v3 = *(void **)(a1 + 32);
  return [v3 setName:v2];
}

- (NSString)transactionAuthor
{
  return self->_transactionAuthor;
}

- (id)newBackgroundModel
{
  v3 = [RCSavedRecordingsModel alloc];
  id v4 = [(RCPersistentContainer *)self newContextWithConcurrencyType:1];
  v5 = [(RCSavedRecordingsModel *)v3 initWithContext:v4];

  return v5;
}

- (id)newContextWithConcurrencyType:(unint64_t)a3
{
  persistentContainer = self->_persistentContainer;
  if (a3 == 2)
  {
    v5 = [(NSPersistentContainer *)persistentContainer viewContext];
    if (!self->_viewContextIsConfigured)
    {
      [(RCPersistentContainer *)self _configureContext:v5 isViewContext:1];
      self->_viewContextIsConfigured = 1;
    }
  }
  else
  {
    v5 = [(NSPersistentContainer *)persistentContainer newBackgroundContext];
    [(RCPersistentContainer *)self _configureContext:v5 isViewContext:0];
  }
  return v5;
}

- (void)_configureContext:(id)a3 isViewContext:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__RCPersistentContainer__configureContext_isViewContext___block_invoke;
  v8[3] = &unk_1E6496710;
  id v9 = v6;
  v10 = self;
  BOOL v11 = a4;
  id v7 = v6;
  [v7 performBlockAndWait:v8];
}

void __41__RCPersistentContainer_loadStore_error___block_invoke(uint64_t a1, int a2, id obj)
{
}

- (RCPersistentContainer)initWithURL:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RCPersistentContainer;
  v5 = [(RCPersistentContainer *)&v24 init];
  if (!v5)
  {
LABEL_10:
    v18 = v5;
    goto LABEL_11;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1C120], "rc_newObjectModel");
  uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1C150]) initWithName:@"VoiceMemos" managedObjectModel:v6];
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = (NSPersistentContainer *)v7;

  id v23 = 0;
  uint64_t v9 = [(RCPersistentContainer *)v5 loadStore:v4 error:&v23];
  id v10 = v23;
  store = v5->_store;
  v5->_store = (NSPersistentStore *)v9;

  if (v5->_store)
  {
    v12 = [MEMORY[0x1E4F28F80] processInfo];
    v13 = [MEMORY[0x1E4F28B50] mainBundle];
    v14 = [v13 bundleIdentifier];
    v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [v12 processName];
    }
    v19 = v16;

    uint64_t v20 = [NSString stringWithFormat:@"%@.%d", v19, objc_msgSend(v12, "processIdentifier")];
    transactionAuthor = v5->_transactionAuthor;
    v5->_transactionAuthor = (NSString *)v20;

    goto LABEL_10;
  }
  v17 = OSLogForCategory(@"Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[RCPersistentContainer initWithURL:]((uint64_t)v10, v17);
  }

  v18 = 0;
LABEL_11:

  return v18;
}

- (id)loadStore:(id)a3 error:(id *)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(RCPersistentContainer *)self storeDescriptionWithURL:v6];
  v23[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  uint64_t v9 = [(RCPersistentContainer *)self persistentContainer];
  [v9 setPersistentStoreDescriptions:v8];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  id v10 = [(RCPersistentContainer *)self persistentContainer];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __41__RCPersistentContainer_loadStore_error___block_invoke;
  v16[3] = &unk_1E6496FA0;
  v16[4] = &v17;
  [v10 loadPersistentStoresWithCompletionHandler:v16];

  if (a4) {
    *a4 = (id) v18[5];
  }
  BOOL v11 = [(RCPersistentContainer *)self persistentContainer];
  v12 = [v11 persistentStoreCoordinator];
  v13 = [v7 URL];
  v14 = [v12 persistentStoreForURL:v13];

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (id)storeDescriptionWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() storeDescriptionForURL:v3 isXPCClient:1 configuration:@"Cloud"];

  return v4;
}

+ (id)storeDescriptionForURL:(id)a3 isXPCClient:(BOOL)a4 configuration:(id)a5
{
  BOOL v5 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C190];
  id v8 = a5;
  uint64_t v9 = [v7 persistentStoreDescriptionWithURL:a3];
  uint64_t v10 = MEMORY[0x1E4F1CC38];
  [v9 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BE50]];
  [v9 setOption:v10 forKey:*MEMORY[0x1E4F1BDE8]];
  [v9 setOption:*MEMORY[0x1E4F28358] forKey:*MEMORY[0x1E4F1BEC0]];
  [v9 setOption:v10 forKey:*MEMORY[0x1E4F1BE80]];
  [v9 setOption:v10 forKey:*MEMORY[0x1E4F1BEF0]];
  [v9 setOption:v10 forKey:*MEMORY[0x1E4F1BFD8]];
  [v9 setConfiguration:v8];

  if (v5)
  {
    [v9 setOption:@"com.apple.voicememod.datastore.Cloud" forKey:*MEMORY[0x1E4F1BFE8]];
    [v9 setOption:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F1BFC8]];
    BOOL v11 = (void *)MEMORY[0x1E4F1BFF8];
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x1E4F1BF70];
  }
  [v9 setType:*v11];
  return v9;
}

- (NSPersistentStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_transactionAuthor, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)initWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  id v3 = "-[RCPersistentContainer initWithURL:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1C3964000, a2, OS_LOG_TYPE_FAULT, "%s -- Failed to load persistent store, error = %@", (uint8_t *)&v2, 0x16u);
}

@end