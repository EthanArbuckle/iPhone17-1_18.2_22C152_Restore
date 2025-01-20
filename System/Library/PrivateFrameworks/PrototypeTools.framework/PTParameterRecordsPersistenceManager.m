@interface PTParameterRecordsPersistenceManager
- (NSString)path;
- (PTParameterRecordsPersistenceManager)init;
- (id)createParameterRecordsFromArchiveDictionary;
- (void)_writeToDiskWithParameterRecords:(id)a3;
- (void)setPath:(id)a3;
- (void)writeToDisk:(id)a3;
@end

@implementation PTParameterRecordsPersistenceManager

- (PTParameterRecordsPersistenceManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)PTParameterRecordsPersistenceManager;
  v2 = [(PTParameterRecordsPersistenceManager *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PrototypeTools.PTParameterRecordsPersistenceManager", 0);
    parameterRecordsArchiveQueue = v2->_parameterRecordsArchiveQueue;
    v2->_parameterRecordsArchiveQueue = (OS_dispatch_queue *)v3;

    v5 = _ParameterRecordsPath();
    [(PTParameterRecordsPersistenceManager *)v2 setPath:v5];
  }
  return v2;
}

- (id)createParameterRecordsFromArchiveDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C9B8];
  dispatch_queue_t v3 = [(PTParameterRecordsPersistenceManager *)self path];
  id v16 = 0;
  v4 = [v2 dataWithContentsOfFile:v3 options:0 error:&v16];
  id v5 = v16;

  if (v5)
  {
    v6 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl(&dword_1BEC4F000, v6, OS_LOG_TYPE_DEFAULT, "Unexpected error: %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  v17[3] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];
  v9 = (void *)[v7 initWithArray:v8];

  id v15 = v5;
  id v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v9 fromData:v4 error:&v15];
  id v11 = v15;

  if (!v10)
  {
    v12 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v11;
      _os_log_impl(&dword_1BEC4F000, v12, OS_LOG_TYPE_DEFAULT, "Error unarchiving persisted proxy definition: %@", buf, 0xCu);
    }

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  v13 = [[PTParameterRecords alloc] initWithDictionary:v10];

  return v13;
}

- (void)_writeToDiskWithParameterRecords:(id)a3
{
  id v4 = a3;
  parameterRecordsArchiveQueue = self->_parameterRecordsArchiveQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PTParameterRecordsPersistenceManager__writeToDiskWithParameterRecords___block_invoke;
  v7[3] = &unk_1E63BC548;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(parameterRecordsArchiveQueue, v7);
}

void __73__PTParameterRecordsPersistenceManager__writeToDiskWithParameterRecords___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DB0];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) recordDictionary];
  id v15 = 0;
  id v4 = [v2 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
  id v5 = v15;

  if (!v4) {
    goto LABEL_3;
  }
  id v6 = [*(id *)(a1 + 40) path];
  id v14 = v5;
  char v7 = [v4 writeToFile:v6 options:1 error:&v14];
  id v8 = v14;

  id v5 = v8;
  if ((v7 & 1) == 0)
  {
LABEL_3:
    v9 = PTLogObjectForTopic(2);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*(id *)(a1 + 40) path];
      id v11 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl(&dword_1BEC4F000, v9, OS_LOG_TYPE_DEFAULT, "Unable to write test recipe dictionary to file %@: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = *(void *)(a1 + 40);
  v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;
}

- (void)writeToDisk:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke;
  v6[3] = &unk_1E63BC548;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  dispatch_queue_t v3 = (void *)v2[1];
  if (v3)
  {
    [v3 invalidate];
    v2 = *(void **)(a1 + 32);
  }
  objc_initWeak(&location, v2);
  id v4 = (void *)MEMORY[0x1E4F1CB00];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke_2;
  v8[3] = &unk_1E63BC858;
  objc_copyWeak(&v10, &location);
  id v9 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:v8 block:0.25];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __52__PTParameterRecordsPersistenceManager_writeToDisk___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _writeToDiskWithParameterRecords:*(void *)(a1 + 32)];
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_parameterRecordsArchiveQueue, 0);
  objc_storeStrong((id *)&self->_writeTimer, 0);
}

@end