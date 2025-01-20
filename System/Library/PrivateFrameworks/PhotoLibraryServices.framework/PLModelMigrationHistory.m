@interface PLModelMigrationHistory
- (BOOL)isLibraryOlderThanVersion:(unsigned __int16)a3;
- (BOOL)libraryWasEverRebuilt;
- (PLModelMigrationHistory)initWithManagedObjectContext:(id)a3;
- (id)libraryVersionHistorySinceLastRebuildOnly:(BOOL)a3;
@end

@implementation PLModelMigrationHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrationHistory, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
}

- (id)libraryVersionHistorySinceLastRebuildOnly:(BOOL)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__76979;
  v14 = __Block_byref_object_dispose__76980;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  managedObjectContext = self->_managedObjectContext;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke;
  v8[3] = &unk_1E58711C8;
  v8[4] = self;
  v8[5] = &v10;
  BOOL v9 = a3;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v8];
  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

uint64_t __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke_2;
  v3[3] = &unk_1E586F4C0;
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __69__PLModelMigrationHistory_libraryVersionHistorySinceLastRebuildOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  switch([v3 migrationType])
  {
    case 0u:
      BOOL v9 = PLMigrationGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Migration type not specified, skipping version record", v10, 2u);
      }

      break;
    case 1u:
    case 4u:
      if (*(unsigned char *)(a1 + 40))
      {
        id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
        id v6 = *(void **)(v5 + 40);
        *(void *)(v5 + 40) = v4;
      }
      goto LABEL_4;
    case 2u:
    case 3u:
LABEL_4:
      v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "modelVersion"));
      [v7 addObject:v8];

      break;
    default:
      break;
  }
}

- (BOOL)libraryWasEverRebuilt
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  managedObjectContext = self->_managedObjectContext;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke;
  v5[3] = &unk_1E5875E68;
  v5[4] = self;
  v5[5] = &v6;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke_2;
  v3[3] = &unk_1E586F498;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

uint64_t __48__PLModelMigrationHistory_libraryWasEverRebuilt__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 migrationType];
  if (result == 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isLibraryOlderThanVersion:(unsigned __int16)a3
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  managedObjectContext = self->_managedObjectContext;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke;
  v6[3] = &unk_1E586F470;
  unsigned __int16 v7 = a3;
  v6[4] = self;
  v6[5] = &v8;
  [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke_2;
  v3[3] = &unk_1E586F448;
  __int16 v4 = *(_WORD *)(a1 + 48);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

void __53__PLModelMigrationHistory_isLibraryOlderThanVersion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unsigned __int16 v7 = [v6 sourceModelVersion];
  if ([v7 integerValue] <= 0)
  {
    uint64_t v9 = [v6 modelVersion];
  }
  else
  {
    uint64_t v8 = [v6 sourceModelVersion];

    uint64_t v9 = [v8 integerValue];
    id v6 = v8;
  }

  if (v9 < *(unsigned __int16 *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (PLModelMigrationHistory)initWithManagedObjectContext:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PLModelMigrationHistory.m", 20, @"Invalid parameter not satisfying: %@", @"ctx" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PLModelMigrationHistory;
  unsigned __int16 v7 = [(PLModelMigrationHistory *)&v18 init];
  if (v7)
  {
    uint64_t v8 = v7;
    objc_storeStrong((id *)&v7->_managedObjectContext, a3);
    managedObjectContext = v8->_managedObjectContext;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__PLModelMigrationHistory_initWithManagedObjectContext___block_invoke;
    v15[3] = &unk_1E5875E18;
    uint64_t v10 = v8;
    v16 = v10;
    id v17 = v6;
    [(NSManagedObjectContext *)managedObjectContext performBlockAndWait:v15];
    if (!v10->_migrationHistory)
    {
      char v11 = PLMigrationGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to identify migration history", buf, 2u);
      }

      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void __56__PLModelMigrationHistory_initWithManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = +[PLMigrationHistory migrationHistoryWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  __int16 v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

@end