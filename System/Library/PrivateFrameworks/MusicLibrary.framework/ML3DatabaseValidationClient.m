@interface ML3DatabaseValidationClient
+ (id)sharedClient;
- (BOOL)_validateDatabaseForPath:(id)a3 usingLibrary:(id)a4;
- (BOOL)isValidatingDatabaseForPath:(id)a3;
- (BOOL)validateDatabaseAtPath:(id)a3;
- (BOOL)validateDatabaseForConnection:(id)a3;
- (BOOL)validateDatabaseForLibrary:(id)a3;
- (ML3DatabaseValidationClient)init;
- (id)_validatableDatabaseForPath:(id)a3;
@end

@implementation ML3DatabaseValidationClient

void __59__ML3DatabaseValidationClient__validatableDatabaseForPath___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    v5 = [[_ML3ValidatableDatabase alloc] initWithDatabasePath:a1[5]];
    [*(id *)(a1[4] + 8) setObject:v5 forKey:a1[5]];
    uint64_t v6 = *(void *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

uint64_t __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) validationState];
  if (result == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    return result;
  }
  [*(id *)(a1 + 32) setValidationState:1];
  if (([*(id *)(a1 + 40) isHomeSharingLibrary] & 1) == 0
    && ![*(id *)(a1 + 40) isUnitTesting])
  {
    v5 = +[MLMediaLibraryService sharedMediaLibraryService];
    uint64_t v6 = *(void *)(a1 + 48);
    id v15 = 0;
    char v7 = [(ML3DatabaseValidation *)v5 validateDatabaseAtPath:v6 error:&v15];
    id v8 = v15;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7;
    int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        v12 = "Database validation succeeded";
        v13 = v10;
        uint32_t v14 = 2;
LABEL_11:
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      v12 = "Database validation FAILED with error: %{public}@";
      v13 = v10;
      uint32_t v14 = 12;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  uint64_t v3 = [ML3DatabaseValidation alloc];
  uint64_t v4 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke_2;
  v16[3] = &unk_1E5FB7C00;
  v16[4] = *(void *)(a1 + 56);
  v5 = [(ML3DatabaseValidation *)v3 initWithLibrary:v4 delegate:0 completion:v16];
  [(ML3DatabaseValidation *)v5 runValidation];
LABEL_13:

  return [*(id *)(a1 + 32) setValidationState:0];
}

- (BOOL)validateDatabaseForLibrary:(id)a3
{
  id v4 = a3;
  v5 = [v4 databasePath];
  LOBYTE(self) = [(ML3DatabaseValidationClient *)self _validateDatabaseForPath:v5 usingLibrary:v4];

  return (char)self;
}

- (BOOL)_validateDatabaseForPath:(id)a3 usingLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v8 = [(ML3DatabaseValidationClient *)self _validatableDatabaseForPath:v6];
  if (([v8 currentQueueIsValidationQueue] & 1) == 0)
  {
    int v9 = [v8 validationSerialQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke;
    v12[3] = &unk_1E5FB7C28;
    id v13 = v8;
    id v14 = v7;
    v16 = &v17;
    id v15 = v6;
    dispatch_sync(v9, v12);
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (id)_validatableDatabaseForPath:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__24422;
  v16 = __Block_byref_object_dispose__24423;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseValidationClient__validatableDatabaseForPath___block_invoke;
  block[3] = &unk_1E5FB8208;
  id v10 = v4;
  BOOL v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

+ (id)sharedClient
{
  if (sharedClient___once != -1) {
    dispatch_once(&sharedClient___once, &__block_literal_global_24474);
  }
  uint64_t v2 = (void *)sharedClient___sharedValidator;

  return v2;
}

uint64_t __43__ML3DatabaseValidationClient_sharedClient__block_invoke()
{
  sharedClient___sharedValidator = objc_alloc_init(ML3DatabaseValidationClient);

  return MEMORY[0x1F41817F8]();
}

- (ML3DatabaseValidationClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)ML3DatabaseValidationClient;
  uint64_t v2 = [(ML3DatabaseValidationClient *)&v8 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    validatableDatabases = v2->_validatableDatabases;
    v2->_validatableDatabases = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MusicLibrary.ML3DatabaseValidationClient", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_validatableDatabases, 0);
}

- (BOOL)isValidatingDatabaseForPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseValidationClient_isValidatingDatabaseForPath___block_invoke;
  block[3] = &unk_1E5FB8208;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  LOBYTE(serialQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)serialQueue;
}

void __59__ML3DatabaseValidationClient_isValidatingDatabaseForPath___block_invoke(void *a1)
{
  id v2 = [*(id *)(a1[4] + 8) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 validationState] == 1;
}

uint64_t __69__ML3DatabaseValidationClient__validateDatabaseForPath_usingLibrary___block_invoke_2(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)validateDatabaseForConnection:(id)a3
{
  id v5 = a3;
  id v6 = [v5 databasePath];

  if (!v6)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ML3DatabaseValidationClient.m", 78, @"Invalid parameter not satisfying: %@", @"connection.databasePath != nil" object file lineNumber description];
  }
  id v7 = [v5 databasePath];
  BOOL v8 = [(ML3DatabaseValidationClient *)self _validateDatabaseForPath:v7 usingLibrary:0];

  return v8;
}

- (BOOL)validateDatabaseAtPath:(id)a3
{
  return [(ML3DatabaseValidationClient *)self _validateDatabaseForPath:a3 usingLibrary:0];
}

@end