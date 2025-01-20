@interface PLBackgroundJobPersonSyncWorker
+ (BOOL)_isTokenInvalidError:(id)a3;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)usesMultipleLibrariesConcurrently;
- (BOOL)_resetPersonSyncInTargetLibrary:(id)a3 error:(id *)a4;
- (BOOL)_shouldCancelCurrentWorkItem:(id)a3;
- (BOOL)_syncFaceCropsFromLibrary:(id)a3 toLibrary:(id)a4 error:(id *)a5;
- (BOOL)_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (BOOL)isInterruptible;
- (NSPersistentHistoryToken)cancelledWorkItem;
- (PLPhotoLibraryBundle)testingSourceBundle;
- (id)_anyPersistentHistoryTokenWithLibrary:(id)a3;
- (id)_faceCropUuidsFromLibrary:(id)a3 error:(id *)a4;
- (id)_faceCropUuidsMissingFromList:(id)a3 inLibrary:(id)a4 error:(id *)a5;
- (id)_lastPersonSyncSourceLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (id)_lastPersonSyncTokenFromLibrary:(id)a3;
- (id)_sourcePhotoLibraryWithName:(const char *)a3;
- (id)_transactionIteratorSinceLastToken:(id)a3 sourceLibrary:(id)a4 error:(id *)a5;
- (id)_transactionIteratorSinceTokenIfValid:(id)a3 sourceLibrary:(id)a4 error:(id *)a5;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)_deletePersonWithUuid:(id)a3 fromLibrary:(id)a4;
- (void)_processNextPersonInChangedObjectIDs:(id)a3 fromSourceLibrary:(id)a4 toDestLibrary:(id)a5 group:(id)a6 workItem:(id)a7 deletedUuids:(id)a8 errorHandler:(id)a9;
- (void)_resetCancelledWorkItem;
- (void)_resetFacesProcessingForPerson:(id)a3;
- (void)_savePersonSyncToken:(id)a3 toLibrary:(id)a4;
- (void)_setupPropertiesToIgnoreWithSourceLibrary:(id)a3;
- (void)_syncPerson:(id)a3 toLibrary:(id)a4 completion:(id)a5;
- (void)_updateLastPersonSyncSourceLibraryURLWithSourceLibrary:(id)a3 targetLibrary:(id)a4;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
- (void)setCancelledWorkItem:(id)a3;
- (void)setTestingSourceBundle:(id)a3;
- (void)stopWorkingOnItem:(id)a3;
@end

@implementation PLBackgroundJobPersonSyncWorker

+ (BOOL)_isTokenInvalidError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 code];
  BOOL v5 = v4 == 134501 || v4 == 134301;
  if (v5
    && ([v3 domain],
        v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F281F8]],
        v6,
        (v7 & 1) != 0))
  {
    BOOL v8 = 1;
  }
  else
  {
    v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "PersonSync: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v11, 0xCu);
    }

    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)usesMultipleLibrariesConcurrently
{
  return 1;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelledWorkItem, 0);
  objc_storeStrong((id *)&self->_testingSourceBundle, 0);
  objc_storeStrong((id *)&self->_propertiesToIgnore, 0);
}

- (void)setCancelledWorkItem:(id)a3
{
}

- (NSPersistentHistoryToken)cancelledWorkItem
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTestingSourceBundle:(id)a3
{
}

- (PLPhotoLibraryBundle)testingSourceBundle
{
  return (PLPhotoLibraryBundle *)objc_getProperty(self, a2, 112, 1);
}

- (BOOL)_systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [(PLBackgroundJobPersonSyncWorker *)self _lastPersonSyncSourceLibraryURLFromSourceLibrary:v6 targetLibrary:a4];
  BOOL v8 = [v6 pathManager];
  v9 = [v8 libraryURL];
  char v10 = [v7 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    int v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [MEMORY[0x1E4F8B908] redactedDescriptionForFileURL:v7];
      uint64_t v13 = [v6 pathManager];
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "PersonSync: System photo library URL changed since last run %{public}@ -> %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v10 ^ 1;
}

- (void)_updateLastPersonSyncSourceLibraryURLWithSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 pathManager];
  id v9 = [v6 libraryURL];

  char v7 = [v9 path];
  BOOL v8 = [v5 globalValues];

  [v8 setLastPersonSyncSourceLibraryPath:v7];
}

- (id)_lastPersonSyncSourceLibraryURLFromSourceLibrary:(id)a3 targetLibrary:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = [v6 globalValues];
  BOOL v8 = [v7 lastPersonSyncSourceLibraryPath];

  if (v8)
  {
    id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
  }
  else
  {
    char v10 = [v5 pathManager];
    id v9 = [v10 libraryURL];

    int v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [v5 pathManager];
      int v16 = 138412290;
      __int16 v17 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "PersonSync: last source library URL is nil, setting to %@", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v13 = [v9 path];
    v14 = [v6 globalValues];
    [v14 setLastPersonSyncSourceLibraryPath:v13];
  }
  return v9;
}

- (void)_savePersonSyncToken:(id)a3 toLibrary:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = PLSyndicationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "PersonSync: saving sync token %{public}@ to library %@", (uint8_t *)&v9, 0x16u);
  }

  BOOL v8 = [v6 globalValues];
  [v8 setLastPersonSyncToken:v5];
}

- (BOOL)_resetPersonSyncInTargetLibrary:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = PLSyndicationGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = [v6 libraryBundle];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "PersonSync: resetting all faces and persons in library %@", (uint8_t *)&buf, 0xCu);
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke;
  v22[3] = &unk_1E5875E18;
  id v9 = v6;
  id v23 = v9;
  v24 = self;
  [v9 performTransactionAndWait:v22];
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__62796;
  v28 = __Block_byref_object_dispose__62797;
  id v29 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_85;
  v14[3] = &unk_1E5875A90;
  id v10 = v9;
  id v15 = v10;
  int v16 = &v18;
  p_long long buf = &buf;
  [v10 performBlockAndWait:v14];
  __int16 v11 = *(void **)(*((void *)&buf + 1) + 40);
  if (v11 && a4) {
    *a4 = v11;
  }
  BOOL v12 = *((unsigned char *)v19 + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLPerson entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_2;
  v7[3] = &unk_1E586C968;
  v7[4] = *(void *)(a1 + 40);
  id v6 = (id)[v5 enumerateObjectsFromFetchRequest:v4 usingDefaultBatchSizeWithBlock:v7];
}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_85(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  id v3 = +[PLPerson entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = [*(id *)(a1 + 32) managedObjectContext];
  id v16 = 0;
  uint64_t v6 = [v5 countForFetchRequest:v4 error:&v16];
  id v7 = v16;
  id v8 = v16;

  if (v6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v8 == 0;
  }
  if (v9)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v18[0] = @"Persons still present in target library";
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v13 = [v10 errorWithDomain:v11 code:41001 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
}

void __73__PLBackgroundJobPersonSyncWorker__resetPersonSyncInTargetLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLSyndicationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 personUUID];
    int v8 = 138543362;
    BOOL v9 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "PersonSync: resetting nameSource on faces from person %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(a1 + 32) _resetFacesProcessingForPerson:v3];
  uint64_t v6 = PLSyndicationGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 personUUID];
    int v8 = 138543362;
    BOOL v9 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "PersonSync: deleting person %{public}@", (uint8_t *)&v8, 0xCu);
  }
  [v3 deletePersonWithReason:9];
}

- (id)_lastPersonSyncTokenFromLibrary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 globalValues];
  uint64_t v4 = [v3 lastPersonSyncToken];

  id v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "PersonSync: last people sync token is %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)_sourcePhotoLibraryWithName:(const char *)a3
{
  uint64_t v4 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v5 = [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryURLForIdentifier:1];
  uint64_t v6 = [v4 openBundleAtLibraryURL:v5];

  int v7 = [v6 libraryServicesManager];
  id v17 = 0;
  int v8 = [v7 activate:&v17];
  id v9 = v17;
  id v10 = v9;
  if (v8
    && (v9,
        id v16 = 0,
        int v11 = [v7 awaitLibraryState:7 error:&v16],
        id v10 = v16,
        v11))
  {
    BOOL v12 = [v7 databaseContext];
    uint64_t v13 = (void *)[v12 newShortLivedLibraryWithName:a3];
  }
  else
  {
    BOOL v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "PersonSync: Unable to provide source library for person sync worker", v15, 2u);
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)_anyPersistentHistoryTokenWithLibrary:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLBackgroundJobPersonSyncWorker *)self _lastPersonSyncTokenFromLibrary:v4];
  if (v5)
  {
    uint64_t v6 = PLSyndicationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken is lastToken %{public}@", (uint8_t *)&buf, 0xCu);
    }

    id v7 = v5;
  }
  else
  {
    int v8 = -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker _anyPersistentHistoryTokenWithLibrary:]");
    id v9 = [(PLBackgroundJobPersonSyncWorker *)self _transactionIteratorSinceLastToken:0 sourceLibrary:v8 error:0];

    if ([v9 count])
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v18 = 0x3032000000;
      uint64_t v19 = __Block_byref_object_copy__62796;
      uint64_t v20 = __Block_byref_object_dispose__62797;
      id v21 = 0;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __73__PLBackgroundJobPersonSyncWorker__anyPersistentHistoryTokenWithLibrary___block_invoke;
      v14[3] = &unk_1E586C8A0;
      void v14[4] = &buf;
      [v9 enumerateRemainingTransactionsWithBlock:v14];
      id v10 = PLSyndicationGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)id v15 = 138543362;
        uint64_t v16 = v11;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken is %{public}@", v15, 0xCu);
      }

      id v7 = *(id *)(*((void *)&buf + 1) + 40);
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      BOOL v12 = PLSyndicationGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "PersonSync: anyPersistentHistoryToken found no token", (uint8_t *)&buf, 2u);
      }

      id v7 = 0;
    }
  }
  return v7;
}

void __73__PLBackgroundJobPersonSyncWorker__anyPersistentHistoryTokenWithLibrary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 token];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

- (id)_transactionIteratorSinceTokenIfValid:(id)a3 sourceLibrary:(id)a4 error:(id *)a5
{
  id v7 = a3;
  int v8 = [a4 managedObjectContext];
  id v13 = 0;
  id v9 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v7 withManagedObjectObjectContext:v8 error:&v13];

  id v10 = v13;
  if (v9) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = a5 == 0;
  }
  if (!v11) {
    *a5 = v10;
  }

  return v9;
}

- (id)_transactionIteratorSinceLastToken:(id)a3 sourceLibrary:(id)a4 error:(id *)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v15 = 0;
    id v10 = [(PLBackgroundJobPersonSyncWorker *)self _transactionIteratorSinceTokenIfValid:v8 sourceLibrary:v9 error:&v15];
    id v11 = v15;
    if (!v10)
    {
      while (1)
      {
        BOOL v12 = PLSyndicationGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v17 = v11;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "PersonSync: Error creating persistent history transaction iterator: %@", buf, 0xCu);
        }

        if (![(id)objc_opt_class() _isTokenInvalidError:v11]) {
          break;
        }
        id v13 = PLSyndicationGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "PersonSync: Assuming people sync in syndication library has been reset, creating iterator with nil token", buf, 2u);
        }

        id v15 = 0;
        id v10 = [(PLBackgroundJobPersonSyncWorker *)self _transactionIteratorSinceTokenIfValid:0 sourceLibrary:v9 error:&v15];
        id v11 = v15;
        id v8 = 0;
        if (v10) {
          goto LABEL_14;
        }
      }
      if (a5)
      {
        id v11 = v11;
        id v10 = 0;
        *a5 = v11;
      }
      else
      {
        id v10 = 0;
      }
    }
LABEL_14:
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldCancelCurrentWorkItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLBackgroundJobPersonSyncWorker *)self cancelledWorkItem];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    id v7 = PLSyndicationGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "PersonSync: current work item cancelled", v9, 2u);
    }
  }
  return v6;
}

- (void)_resetCancelledWorkItem
{
  id v3 = PLSyndicationGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "PersonSync: reset cancelled work item", v4, 2u);
  }

  [(PLBackgroundJobPersonSyncWorker *)self setCancelledWorkItem:0];
}

- (void)_deletePersonWithUuid:(id)a3 fromLibrary:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__62796;
  uint64_t v20 = __Block_byref_object_dispose__62797;
  id v21 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PLBackgroundJobPersonSyncWorker__deletePersonWithUuid_fromLibrary___block_invoke;
  v11[3] = &unk_1E5875368;
  id v15 = &v16;
  id v8 = v6;
  id v12 = v8;
  id v9 = v7;
  id v13 = v9;
  uint64_t v14 = self;
  [v9 performTransactionAndWait:v11];
  if (v17[5])
  {
    id v10 = PLSyndicationGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v23 = v8;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "PersonSync: Finished deleting person %{public}@ from syndication library.", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v16, 8);
}

void __69__PLBackgroundJobPersonSyncWorker__deletePersonWithUuid_fromLibrary___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v4 = +[PLPerson personWithUUID:v2 inManagedObjectContext:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_resetFacesProcessingForPerson:");
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    [v7 deletePersonWithReason:9];
  }
  else
  {
    id v8 = PLSyndicationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "PersonSync: Person with uuid %{public}@ does not exist in syndication library", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_resetFacesProcessingForPerson:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PLSyndicationGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [v3 personUUID];
    int v6 = 138543362;
    id v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "PersonSync: resetting faces processing on person %{public}@", (uint8_t *)&v6, 0xCu);
  }
  [v3 resetFacesProcessing];
}

- (void)_syncPerson:(id)a3 toLibrary:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, id))a5;
  id v10 = a3;
  uint64_t v11 = [v10 personUUID];
  uint64_t v12 = PLSyndicationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "PersonSync: _syncPerson %{public}@ begin", buf, 0xCu);
  }

  id v13 = +[PLInterLibraryTransferOptions newTransferOptionsForPersonFromSystemToSyndication];
  uint64_t v14 = [PLInterLibraryTransfer alloc];
  id v15 = [v10 photoLibrary];

  uint64_t v16 = [(PLInterLibraryTransfer *)v14 initWithSourceLibrary:v15 destinationLibrary:v8 options:v13];
  id v25 = 0;
  BOOL v17 = [(PLInterLibraryTransfer *)v16 transferPersonWithUuid:v11 error:&v25];
  id v18 = v25;
  uint64_t v19 = PLSyndicationGetLog();
  uint64_t v20 = v19;
  if (v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_INFO, "PersonSync: _syncPerson %{public}@ succeeded", buf, 0xCu);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __68__PLBackgroundJobPersonSyncWorker__syncPerson_toLibrary_completion___block_invoke;
    v21[3] = &unk_1E5873A50;
    uint64_t v22 = v11;
    id v23 = v8;
    uint64_t v24 = self;
    [v23 performTransactionAndWait:v21];

    uint64_t v20 = v22;
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138543618;
    v27 = v11;
    __int16 v28 = 2112;
    id v29 = v18;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "PersonSync: _syncPerson %{public}@ failed with error %@", buf, 0x16u);
  }

  v9[2](v9, v18);
}

void __68__PLBackgroundJobPersonSyncWorker__syncPerson_toLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = +[PLPerson personWithUUID:v2 inManagedObjectContext:v3];

  uint64_t v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 48) _resetFacesProcessingForPerson:v5];
    uint64_t v4 = v5;
  }
}

- (void)_processNextPersonInChangedObjectIDs:(id)a3 fromSourceLibrary:(id)a4 toDestLibrary:(id)a5 group:(id)a6 workItem:(id)a7 deletedUuids:(id)a8 errorHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  uint64_t v22 = [v15 anyObject];
  if ([(PLBackgroundJobPersonSyncWorker *)self _shouldCancelCurrentWorkItem:v19]
    || !v22)
  {
    dispatch_group_leave(v18);
  }
  else
  {
    [v15 removeObject:v22];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke;
    v23[3] = &unk_1E586C940;
    id v24 = v16;
    id v25 = v22;
    id v26 = v20;
    v27 = self;
    id v28 = v15;
    id v29 = v17;
    uint64_t v30 = v18;
    id v31 = v19;
    id v32 = v21;
    [v24 performBlockAndWait:v23];
  }
}

void __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [v2 existingObjectWithID:*(void *)(a1 + 40) error:0];

  uint64_t v4 = [v3 personUUID];
  if (v3)
  {
    if ([*(id *)(a1 + 48) containsObject:v4])
    {
      id v5 = PLSyndicationGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        v44 = v4;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "PersonSync: Found unexpected deleted person in source library with uuid %{public}@", buf, 0xCu);
      }

      int v6 = *(void **)(a1 + 32);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_79;
      v35[3] = &unk_1E586C8F0;
      id v7 = *(void **)(a1 + 64);
      v35[4] = *(void *)(a1 + 56);
      id v36 = v7;
      id v37 = *(id *)(a1 + 32);
      id v38 = *(id *)(a1 + 72);
      id v39 = *(id *)(a1 + 80);
      id v40 = *(id *)(a1 + 88);
      id v41 = *(id *)(a1 + 48);
      id v42 = *(id *)(a1 + 96);
      [v6 performBlock:v35];

      id v8 = v36;
    }
    else
    {
      id v13 = *(void **)(a1 + 56);
      uint64_t v14 = *(void *)(a1 + 72);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_2;
      v26[3] = &unk_1E586C918;
      id v34 = *(id *)(a1 + 96);
      id v27 = *(id *)(a1 + 80);
      id v15 = *(id *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 56);
      id v17 = *(void **)(a1 + 64);
      id v28 = v15;
      uint64_t v29 = v16;
      id v30 = v17;
      id v31 = *(id *)(a1 + 72);
      id v32 = *(id *)(a1 + 88);
      id v33 = *(id *)(a1 + 48);
      [v13 _syncPerson:v3 toLibrary:v14 completion:v26];

      id v8 = v34;
    }
  }
  else
  {
    uint64_t v9 = PLSyndicationGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 138412290;
      v44 = v10;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_INFO, "PersonSync: Unable to find changed object %@ in source library", buf, 0xCu);
    }

    uint64_t v11 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_80;
    v18[3] = &unk_1E586C8F0;
    uint64_t v12 = *(void **)(a1 + 64);
    v18[4] = *(void *)(a1 + 56);
    id v19 = v12;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 72);
    id v22 = *(id *)(a1 + 80);
    id v23 = *(id *)(a1 + 88);
    id v24 = *(id *)(a1 + 48);
    id v25 = *(id *)(a1 + 96);
    [v11 performBlock:v18];

    id v8 = v19;
  }
}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_79(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextPersonInChangedObjectIDs:*(void *)(a1 + 40) fromSourceLibrary:*(void *)(a1 + 48) toDestLibrary:*(void *)(a1 + 56) group:*(void *)(a1 + 64) workItem:*(void *)(a1 + 72) deletedUuids:*(void *)(a1 + 80) errorHandler:*(void *)(a1 + 88)];
}

void __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    id v3 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v3);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_3;
    v6[3] = &unk_1E586C8F0;
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 56);
    v6[4] = *(void *)(a1 + 48);
    id v7 = v5;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 64);
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 72);
    id v12 = *(id *)(a1 + 80);
    id v13 = *(id *)(a1 + 88);
    [v4 performBlock:v6];
  }
}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextPersonInChangedObjectIDs:*(void *)(a1 + 40) fromSourceLibrary:*(void *)(a1 + 48) toDestLibrary:*(void *)(a1 + 56) group:*(void *)(a1 + 64) workItem:*(void *)(a1 + 72) deletedUuids:*(void *)(a1 + 80) errorHandler:*(void *)(a1 + 88)];
}

uint64_t __145__PLBackgroundJobPersonSyncWorker__processNextPersonInChangedObjectIDs_fromSourceLibrary_toDestLibrary_group_workItem_deletedUuids_errorHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processNextPersonInChangedObjectIDs:*(void *)(a1 + 40) fromSourceLibrary:*(void *)(a1 + 48) toDestLibrary:*(void *)(a1 + 56) group:*(void *)(a1 + 64) workItem:*(void *)(a1 + 72) deletedUuids:*(void *)(a1 + 80) errorHandler:*(void *)(a1 + 88)];
}

- (void)_setupPropertiesToIgnoreWithSourceLibrary:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1C0A8];
  id v5 = a3;
  int v6 = +[PLPerson entityName];
  id v7 = [v5 managedObjectContext];

  id v16 = [v4 entityForName:v6 inManagedObjectContext:v7];

  id v8 = [v16 attributesByName];
  id v9 = [v16 relationshipsByName];
  id v10 = (void *)MEMORY[0x1E4F1CA80];
  id v11 = [v9 allValues];
  id v12 = [v10 setWithArray:v11];

  id v13 = [v8 objectForKeyedSubscript:@"faceCount"];
  [v12 addObject:v13];

  uint64_t v14 = (NSSet *)[v12 copy];
  propertiesToIgnore = self->_propertiesToIgnore;
  self->_propertiesToIgnore = v14;
}

- (BOOL)_syncFaceCropsFromLibrary:(id)a3 toLibrary:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PLBackgroundJobPersonSyncWorker *)self _faceCropUuidsFromLibrary:v8 error:a5];
  if (v10)
  {
    id v11 = [(PLBackgroundJobPersonSyncWorker *)self _faceCropUuidsMissingFromList:v10 inLibrary:v9 error:a5];
    if (v11)
    {
      id v12 = +[PLInterLibraryTransferOptions newTransferOptionsForFaceCropFromSyndicationToSystem];
      id v13 = [[PLInterLibraryTransfer alloc] initWithSourceLibrary:v8 destinationLibrary:v9 options:v12];
      uint64_t v14 = PLSyndicationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218242;
        uint64_t v29 = [v11 count];
        __int16 v30 = 2114;
        id v31 = v11;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "PersonSync: %tu face crops to copy to SPL: %{public}@", buf, 0x16u);
      }

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v15 = v11;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        id v22 = v12;
        uint64_t v18 = *(void *)v24;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v24 != v18) {
              objc_enumerationMutation(v15);
            }
            if (![(PLInterLibraryTransfer *)v13 transferFaceCropWithUuid:*(void *)(*((void *)&v23 + 1) + 8 * i) error:a5])
            {
              BOOL v20 = 0;
              goto LABEL_16;
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v17) {
            continue;
          }
          break;
        }
        BOOL v20 = 1;
LABEL_16:
        id v12 = v22;
      }
      else
      {
        BOOL v20 = 1;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)_faceCropUuidsMissingFromList:(id)a3 inLibrary:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLFaceCrop entityName];
  id v11 = [v9 fetchRequestWithEntityName:v10];

  id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"uuid", v7];
  [v11 setPredicate:v12];

  [v11 setResultType:2];
  v46[0] = @"uuid";
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [v11 setPropertiesToFetch:v13];

  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = __Block_byref_object_copy__62796;
  id v42 = __Block_byref_object_dispose__62797;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__62796;
  id v36 = __Block_byref_object_dispose__62797;
  id v37 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __81__PLBackgroundJobPersonSyncWorker__faceCropUuidsMissingFromList_inLibrary_error___block_invoke;
  v27[3] = &unk_1E5874900;
  __int16 v30 = &v38;
  id v14 = v8;
  id v28 = v14;
  id v15 = v11;
  id v29 = v15;
  id v31 = &v32;
  [v14 performBlockAndWait:v27];
  if (v39[5])
  {
    uint64_t v16 = [v7 count];
    if (v16 == [(id)v39[5] count])
    {
      uint64_t v17 = PLSyndicationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "PersonSync: all face crops from processing library are in the SPL", buf, 2u);
      }

      uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v7];
      id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      long long v23 = [(id)v39[5] valueForKey:@"uuid"];
      long long v24 = (void *)[v22 initWithArray:v23];

      [v21 minusSet:v24];
      long long v25 = PLSyndicationGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        uint64_t v45 = v21;
        _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_INFO, "PersonSync: missing the following face crops in the SPL: %{public}@", buf, 0xCu);
      }

      uint64_t v18 = [v21 allObjects];
    }
  }
  else
  {
    id v19 = PLSyndicationGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      BOOL v20 = (void *)v33[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v45 = v20;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "PersonSync: Unable to fetch face crop uuids from the SPL: %@", buf, 0xCu);
    }

    uint64_t v18 = 0;
    if (a5) {
      *a5 = (id) v33[5];
    }
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v18;
}

void __81__PLBackgroundJobPersonSyncWorker__faceCropUuidsMissingFromList_inLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  id v6 = v9;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  }
}

- (id)_faceCropUuidsFromLibrary:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v7 = +[PLFaceCrop entityName];
  id v8 = [v6 fetchRequestWithEntityName:v7];

  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"type", &unk_1EEBF1F88];
  [v8 setPredicate:v9];

  [v8 setResultType:2];
  v37[0] = @"uuid";
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v8 setPropertiesToFetch:v10];

  uint64_t v29 = 0;
  __int16 v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__62796;
  id v33 = __Block_byref_object_dispose__62797;
  id v34 = 0;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = __Block_byref_object_copy__62796;
  id v27 = __Block_byref_object_dispose__62797;
  id v28 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __67__PLBackgroundJobPersonSyncWorker__faceCropUuidsFromLibrary_error___block_invoke;
  v18[3] = &unk_1E5874900;
  id v21 = &v29;
  id v11 = v5;
  id v19 = v11;
  id v12 = v8;
  id v20 = v12;
  id v22 = &v23;
  [v11 performBlockAndWait:v18];
  id v13 = (void *)v30[5];
  if (v13)
  {
    id v14 = [v13 valueForKey:@"uuid"];
  }
  else
  {
    id v15 = PLSyndicationGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = v24[5];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v36 = v16;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "PersonSync: Unable to fetch face crop uuids from the processing library: %@", buf, 0xCu);
    }

    id v14 = 0;
    if (a4) {
      *a4 = (id) v24[5];
    }
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __67__PLBackgroundJobPersonSyncWorker__faceCropUuidsFromLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v9 = 0;
  uint64_t v4 = [v2 executeFetchRequest:v3 error:&v9];
  id v5 = v9;
  id v6 = v9;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v5);
  }
}

- (void)stopWorkingOnItem:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLSyndicationGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = v4;
    _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker stopWorkingOnItem: %p", (uint8_t *)&v6, 0xCu);
  }

  [(PLBackgroundJobPersonSyncWorker *)self setCancelledWorkItem:v4];
}

- (BOOL)isInterruptible
{
  return 1;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, id))a5;
  [(PLBackgroundJobPersonSyncWorker *)self _resetCancelledWorkItem];
  id v12 = PLSyndicationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218242;
    id v29 = v9;
    __int16 v30 = 2112;
    id v31 = v9;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker performWorkOnItem: %p %@", buf, 0x16u);
  }

  if (!v10)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLBackgroundJobPersonSyncWorker.m", 151, @"Invalid parameter not satisfying: %@", @"library != nil" object file lineNumber description];
  }
  id v13 = -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker performWorkOnItem:inLibrary:completion:]");
  if (v13)
  {
    if ([(PLBackgroundJobPersonSyncWorker *)self _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:v13 targetLibrary:v10])
    {
      id v27 = 0;
      BOOL v14 = [(PLBackgroundJobPersonSyncWorker *)self _resetPersonSyncInTargetLibrary:v10 error:&v27];
      id v15 = v27;
      if (!v14)
      {
        v11[2](v11, v15);
LABEL_18:

        goto LABEL_19;
      }
      [(PLBackgroundJobPersonSyncWorker *)self _updateLastPersonSyncSourceLibraryURLWithSourceLibrary:v13 targetLibrary:v10];
    }
    id v26 = 0;
    BOOL v16 = [(PLBackgroundJobPersonSyncWorker *)self _syncFaceCropsFromLibrary:v10 toLibrary:v13 error:&v26];
    id v15 = v26;
    if (!v16)
    {
      uint64_t v17 = PLSyndicationGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v29 = v15;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "PersonSync: continuing after _syncFaceCropsFromLibrary failed with error %@", buf, 0xCu);
      }
    }
    [(PLBackgroundJobPersonSyncWorker *)self _setupPropertiesToIgnoreWithSourceLibrary:v13];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke;
    v20[3] = &unk_1E58747F0;
    v20[4] = self;
    id v21 = v10;
    id v22 = v13;
    long long v24 = v11;
    id v23 = v9;
    SEL v25 = a2;
    [v22 performBlock:v20];

    goto LABEL_18;
  }
  uint64_t v18 = PLSyndicationGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    id v29 = v9;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_INFO, "PersonSync: No work for item %p: sourceLibrary is nil", buf, 0xCu);
  }

  v11[2](v11, 0);
LABEL_19:
}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) _lastPersonSyncTokenFromLibrary:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  id v60 = 0;
  int v6 = [v4 _transactionIteratorSinceTokenIfValid:v3 sourceLibrary:v5 error:&v60];
  id v7 = v60;
  if (v6) {
    goto LABEL_2;
  }
  if (![(id)objc_opt_class() _isTokenInvalidError:v7]) {
    goto LABEL_11;
  }
  if (v3)
  {
    long long v24 = PLSyndicationGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "PersonSync: last people sync token was non-null but invalid. Resetting people sync in syndication library.", (uint8_t *)&buf, 2u);
    }

    SEL v25 = *(void **)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    id v59 = 0;
    char v27 = [v25 _resetPersonSyncInTargetLibrary:v26 error:&v59];
    id v28 = v59;
    id v29 = v28;
    if ((v27 & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

      goto LABEL_18;
    }
  }
  __int16 v30 = *(void **)(a1 + 32);
  uint64_t v31 = *(void *)(a1 + 48);
  id v58 = v7;
  int v6 = [v30 _transactionIteratorSinceLastToken:v3 sourceLibrary:v31 error:&v58];
  id v32 = v58;

  id v7 = v32;
  if (v6)
  {
LABEL_2:
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v57[0] = 0;
    v57[1] = v57;
    v57[2] = 0x2020000000;
    v57[3] = 0;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_39;
    v50[3] = &unk_1E586C8C8;
    v50[4] = *(void *)(a1 + 32);
    id v51 = *(id *)(a1 + 56);
    id v52 = *(id *)(a1 + 48);
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 72);
    id v53 = v10;
    uint64_t v56 = v11;
    id v12 = v9;
    id v54 = v12;
    v55 = v57;
    [v6 enumerateRemainingTransactionsWithBlock:v50];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__62796;
    v68 = __Block_byref_object_dispose__62797;
    id v69 = 0;
    id v13 = (objc_class *)objc_opt_class();
    BOOL v14 = NSStringFromClass(v13);
    id v15 = [v14 stringByAppendingString:@".transferpersonsgroupcompletion"];
    BOOL v16 = (const char *)[v15 UTF8String];
    qos_class_t v17 = qos_class_self();
    uint64_t v18 = dispatch_queue_attr_make_with_qos_class(0, v17, 0);
    id v19 = dispatch_queue_create(v16, v18);

    id v20 = dispatch_group_create();
    dispatch_group_enter(v20);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_51;
    block[3] = &unk_1E5875BA8;
    p_long long buf = &buf;
    id v21 = v12;
    uint64_t v22 = *(void *)(a1 + 32);
    id v43 = v21;
    uint64_t v44 = v22;
    id v45 = *(id *)(a1 + 56);
    id v46 = *(id *)(a1 + 40);
    id v23 = v6;
    id v47 = v23;
    id v48 = *(id *)(a1 + 64);
    dispatch_group_notify(v20, v19, block);
    if ([*(id *)(a1 + 32) _shouldCancelCurrentWorkItem:*(void *)(a1 + 56)])
    {
      dispatch_group_leave(v20);
    }
    else
    {
      id v34 = PLSyndicationGetLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        uint64_t v35 = [v10 count];
        uint64_t v36 = [v21 count];
        *(_DWORD *)v61 = 134218240;
        uint64_t v62 = v35;
        __int16 v63 = 2048;
        uint64_t v64 = v36;
        _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_INFO, "PersonSync: %tu changes, %tu deletes to process", v61, 0x16u);
      }

      id v37 = *(void **)(a1 + 32);
      uint64_t v38 = *(void *)(a1 + 40);
      uint64_t v39 = *(void *)(a1 + 48);
      uint64_t v40 = *(void *)(a1 + 56);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_56;
      v41[3] = &unk_1E5874CF8;
      v41[4] = &buf;
      [v37 _processNextPersonInChangedObjectIDs:v10 fromSourceLibrary:v39 toDestLibrary:v38 group:v20 workItem:v40 deletedUuids:v21 errorHandler:v41];
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(v57, 8);
  }
  else
  {
LABEL_11:
    id v33 = PLSyndicationGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "PersonSync: no transactionIterator, error: %@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
LABEL_18:
}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_39(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([*(id *)(a1 + 32) _shouldCancelCurrentWorkItem:*(void *)(a1 + 40)])
  {
    *a3 = 1;
    goto LABEL_29;
  }
  id v33 = a3;
  uint64_t v6 = [*(id *)(a1 + 48) managedObjectContext];
  id v7 = (void *)MEMORY[0x1E4F1C0A8];
  id v8 = +[PLPerson entityName];
  id v32 = (void *)v6;
  id v9 = [v7 entityForName:v8 inManagedObjectContext:v6];

  id v34 = v5;
  id v10 = [v5 changes];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v36 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      BOOL v16 = [v15 changedObjectID];
      qos_class_t v17 = [v16 entity];
      int v18 = [v17 isEqual:v9];

      if (v18)
      {
        uint64_t v19 = [v15 changeType];
        switch(v19)
        {
          case 2:
            uint64_t v22 = [v15 tombstone];
            id v23 = [v22 objectForKeyedSubscript:@"personUUID"];

            if (!v23)
            {
              long long v24 = [MEMORY[0x1E4F28B00] currentHandler];
              [v24 handleFailureInMethod:*(void *)(a1 + 80), *(void *)(a1 + 32), @"PLBackgroundJobPersonSyncWorker.m", 242, @"Invalid parameter not satisfying: %@", @"personUuid != nil" object file lineNumber description];
            }
            [*(id *)(a1 + 64) addObject:v23];

            break;
          case 1:
            id v20 = [v15 updatedProperties];
            char v21 = [v20 isSubsetOfSet:*(void *)(*(void *)(a1 + 32) + 104)];

            if (v21) {
              break;
            }
LABEL_14:
            [*(id *)(a1 + 56) addObject:v16];
            break;
          case 0:
            goto LABEL_14;
        }
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
  }
  while (v12);
LABEL_20:
  uint64_t v25 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v26 = *(void *)(v25 + 24) + 1;
  *(void *)(v25 + 24) = v26;
  if (v26 == 1000)
  {
    char v27 = PLSyndicationGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      unint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      *(_DWORD *)long long buf = 134217984;
      unint64_t v40 = v28;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_INFO, "PersonSync: reached transaction batch limit of %tu", buf, 0xCu);
    }

    *id v33 = 1;
  }
  uint64_t v29 = [*(id *)(a1 + 56) count];
  unint64_t v30 = [*(id *)(a1 + 64) count] + v29;
  if (v30 >= 0xC8)
  {
    uint64_t v31 = PLSyndicationGetLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v40 = v30;
      _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_INFO, "PersonSync: reached changes per batch limit: %tu", buf, 0xCu);
    }

    *id v33 = 1;
  }

  id v5 = v34;
LABEL_29:
}

uint64_t __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_51(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(a1 + 32);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
          id v8 = (void *)MEMORY[0x19F38D3B0](v3);
          if (objc_msgSend(*(id *)(a1 + 40), "_shouldCancelCurrentWorkItem:", *(void *)(a1 + 48), (void)v15))
          {
            goto LABEL_12;
          }
          [*(id *)(a1 + 40) _deletePersonWithUuid:v7 fromLibrary:*(void *)(a1 + 56)];
          ++v6;
        }
        while (v4 != v6);
        uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
        uint64_t v4 = v3;
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (([*(id *)(a1 + 40) _shouldCancelCurrentWorkItem:*(void *)(a1 + 48)] & 1) == 0)
    {
      id v9 = *(void **)(a1 + 40);
      id v10 = [*(id *)(a1 + 64) lastIteratedToken];
      [v9 _savePersonSyncToken:v10 toLibrary:*(void *)(a1 + 56)];
    }
  }
  uint64_t v11 = PLSyndicationGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v13 = @"success";
    if (v12) {
      uint64_t v13 = *(__CFString **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    }
    *(_DWORD *)long long buf = 134218242;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    uint64_t v22 = v13;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "PersonSync: calling completionBlock with %p %@", buf, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __74__PLBackgroundJobPersonSyncWorker_performWorkOnItem_inLibrary_completion___block_invoke_56(uint64_t a1, void *a2)
{
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLBackgroundJobCriteria criteriaForHubbleWorker];
  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v6 = -[PLBackgroundJobPersonSyncWorker _sourcePhotoLibraryWithName:](self, "_sourcePhotoLibraryWithName:", "-[PLBackgroundJobPersonSyncWorker workItemsNeedingProcessingInLibrary:]");
  if ([(PLBackgroundJobPersonSyncWorker *)self _systemPhotoLibraryChangedSinceLastRunWithSourceLibrary:v6 targetLibrary:v4])
  {
    uint64_t v7 = [(PLBackgroundJobPersonSyncWorker *)self _anyPersistentHistoryTokenWithLibrary:v4];
    id v8 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    id v9 = v8;
    if (v7)
    {
      v39[0] = v7;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
      self = [(PLBackgroundJobWorkerPendingWorkItems *)v9 initWithCriteria:v5 workItemsNeedingProcessing:v10];
    }
    else
    {
      self = [(PLBackgroundJobWorkerPendingWorkItems *)v8 initWithZeroWorkItems];
    }
  }
  else
  {
    uint64_t v11 = [(PLBackgroundJobPersonSyncWorker *)self _lastPersonSyncTokenFromLibrary:v4];
    uint64_t v12 = [(PLBackgroundJobPersonSyncWorker *)self _transactionIteratorSinceLastToken:v11 sourceLibrary:v6 error:0];
    if ([v12 count])
    {
      if (v11)
      {
        uint64_t v13 = PLSyndicationGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker returning 1 work item (lastToken %@)", (uint8_t *)&buf, 0xCu);
        }

        BOOL v14 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        long long v38 = v11;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        self = [(PLBackgroundJobWorkerPendingWorkItems *)v14 initWithCriteria:v5 workItemsNeedingProcessing:v15];
      }
      else
      {
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v34 = 0x3032000000;
        long long v35 = __Block_byref_object_copy__62796;
        long long v36 = __Block_byref_object_dispose__62797;
        id v37 = 0;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __71__PLBackgroundJobPersonSyncWorker_workItemsNeedingProcessingInLibrary___block_invoke;
        v28[3] = &unk_1E586C8A0;
        v28[4] = &buf;
        [v12 enumerateRemainingTransactionsWithBlock:v28];
        uint64_t v22 = PLSyndicationGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v23 = *(void *)(*((void *)&buf + 1) + 40);
          *(_DWORD *)uint64_t v31 = 138412290;
          uint64_t v32 = v23;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "PersonSync: PLBackgroundJobPersonSyncWorker returning 1 work item (firstTransactionToken %@)", v31, 0xCu);
        }

        uint64_t v24 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        uint64_t v30 = *(void *)(*((void *)&buf + 1) + 40);
        uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        self = [(PLBackgroundJobWorkerPendingWorkItems *)v24 initWithCriteria:v5 workItemsNeedingProcessing:v25];

        _Block_object_dispose(&buf, 8);
      }
      int v21 = 1;
    }
    else
    {
      long long v16 = [(PLBackgroundJobPersonSyncWorker *)self _faceCropUuidsFromLibrary:v4 error:0];
      long long v17 = [(PLBackgroundJobPersonSyncWorker *)self _faceCropUuidsMissingFromList:v16 inLibrary:v6 error:0];
      if ([v17 count]
        && ([(PLBackgroundJobPersonSyncWorker *)self _anyPersistentHistoryTokenWithLibrary:v4], (long long v18 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        uint64_t v19 = [PLBackgroundJobWorkerPendingWorkItems alloc];
        uint64_t v29 = v18;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
        self = [(PLBackgroundJobWorkerPendingWorkItems *)v19 initWithCriteria:v5 workItemsNeedingProcessing:v20];

        int v21 = 1;
      }
      else
      {
        int v21 = 0;
      }
    }
    if (!v21) {
      self = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
    }
  }

  return self;
}

void __71__PLBackgroundJobPersonSyncWorker_workItemsNeedingProcessingInLibrary___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 token];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = 1;
}

@end