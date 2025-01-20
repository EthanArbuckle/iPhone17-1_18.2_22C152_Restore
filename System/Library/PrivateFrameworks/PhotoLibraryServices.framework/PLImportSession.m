@interface PLImportSession
+ (id)albumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)albumsWithImportSessionIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)entityName;
+ (id)insertNewImportSessionAlbumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4;
+ (id)validKindsForPersistence;
- (BOOL)_isAssetIncludedInImportDates:(id)a3;
- (BOOL)_isDateAfterEndDate:(id)a3;
- (BOOL)_isDateBeforeStartDate:(id)a3;
- (BOOL)albumShouldBeAutomaticallyDeleted;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isValidForPersistence;
- (BOOL)needsPersistenceUpdate;
- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3;
- (id)_orderedBatchedAssets;
- (id)mutableAssets;
- (id)payloadForChangedKeys:(id)a3;
- (unint64_t)count;
- (void)_updateEndDate:(id)a3;
- (void)_updateStartDate:(id)a3;
- (void)didSave;
- (void)persistMetadataToFileSystemWithPathManager:(id)a3;
- (void)prepareForDeletion;
- (void)removePersistedFileSystemDataWithPathManager:(id)a3;
- (void)revalidateImportDates;
- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)updateImportDatesFromAddedAsset:(id)a3;
- (void)willSave;
@end

@implementation PLImportSession

- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 2) = a3;
}

- (BOOL)albumShouldBeAutomaticallyDeleted
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 2);
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  *(&self->super.didRegisteredWithUserInterfaceContext + 1) = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return *(&self->super.didRegisteredWithUserInterfaceContext + 1);
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (BOOL)isEmpty
{
  return [(PLImportSession *)self count] == 0;
}

- (unint64_t)count
{
  v2 = [(PLImportSession *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)prepareForDeletion
{
  v6.receiver = self;
  v6.super_class = (Class)PLImportSession;
  [(PLManagedObject *)&v6 prepareForDeletion];
  unint64_t v3 = [(PLImportSession *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v3 mergingChanges] & 1) == 0
    && [(PLImportSession *)self isValidForPersistence])
  {
    v4 = [(PLGenericAlbum *)self photoLibrary];
    v5 = [v4 pathManager];
    [(PLImportSession *)self removePersistedFileSystemDataWithPathManager:v5];
  }
}

- (void)didSave
{
  v8.receiver = self;
  v8.super_class = (Class)PLImportSession;
  [(PLGenericAlbum *)&v8 didSave];
  if ([(PLImportSession *)self needsPersistenceUpdate])
  {
    uint64_t v3 = [(PLImportSession *)self uuid];
    if (v3)
    {
      v4 = (void *)v3;
      char v5 = [(PLImportSession *)self isDeleted];

      if ((v5 & 1) == 0)
      {
        objc_super v6 = [(PLGenericAlbum *)self photoLibrary];
        v7 = [v6 pathManager];
        [(PLImportSession *)self persistMetadataToFileSystemWithPathManager:v7];
      }
    }
  }
  [(PLImportSession *)self setNeedsPersistenceUpdate:0];
}

- (void)willSave
{
  v11.receiver = self;
  v11.super_class = (Class)PLImportSession;
  [(PLGenericAlbum *)&v11 willSave];
  [(PLImportSession *)self setNeedsPersistenceUpdate:0];
  uint64_t v3 = [(PLImportSession *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PLImportSession *)self changedValues];
    if ([(PLImportSession *)self isValidForPersistence])
    {
      if (([(PLImportSession *)self isInserted] & 1) != 0
        || ([v4 objectForKeyedSubscript:@"assets"],
            char v5 = objc_claimAutoreleasedReturnValue(),
            v5,
            v5))
      {
        [(PLImportSession *)self setNeedsPersistenceUpdate:1];
      }
    }
    if (([(PLImportSession *)self isDeleted] & 1) == 0)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"assets"];
      if (v6)
      {
        v7 = (void *)v6;
        objc_super v8 = [(PLImportSession *)self assets];
        uint64_t v9 = [v8 count];

        if (!v9) {
          [(PLGenericAlbum *)self delete];
        }
      }
    }
    v10 = [v3 delayedSaveActions];
    [v10 recordImportSessionCountsAndDateRangeUpdate:self];
  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLImportSession.m", 204, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 removePersistedAlbumData];
  }
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (!v5)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PLImportSession.m", 196, @"Invalid parameter not satisfying: %@", @"pathManager" object file lineNumber description];

    id v5 = 0;
  }
  if ([v5 isDCIM])
  {
    uint64_t v6 = [[PLPersistedAlbumMetadata alloc] initWithPLGenericAlbum:self pathManager:v8];
    [(PLPersistedAlbumMetadata *)v6 persistAlbumData];
  }
}

- (BOOL)isValidForPersistence
{
  uint64_t v3 = [(id)objc_opt_class() validKindsForPersistence];
  v4 = [(PLImportSession *)self kind];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (id)_orderedBatchedAssets
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[PLManagedAsset entityName];
  char v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setFetchBatchSize:100];
  [v5 setReturnsObjectsAsFaults:0];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"importSession", self];
  [v5 setPredicate:v6];

  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v22[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v5 setSortDescriptors:v8];

  uint64_t v9 = [(PLImportSession *)self managedObjectContext];
  id v17 = 0;
  v10 = [v9 executeFetchRequest:v5 error:&v17];
  id v11 = v17;
  if (!v10)
  {
    v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = (uint64_t)v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch batchedAssets: %@", buf, 0xCu);
    }
  }
  v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v10 count];
    v15 = [(PLManagedObject *)self shortObjectIDURI];
    *(_DWORD *)buf = 134218242;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from import session %@", buf, 0x16u);
  }
  return v10;
}

- (BOOL)_isDateAfterEndDate:(id)a3
{
  id v4 = a3;
  char v5 = [(PLImportSession *)self endDate];
  if (v5)
  {
    uint64_t v6 = [(PLImportSession *)self endDate];
    BOOL v7 = [v6 compare:v4] == -1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_isDateBeforeStartDate:(id)a3
{
  id v4 = a3;
  char v5 = [(PLImportSession *)self startDate];
  if (v5)
  {
    uint64_t v6 = [(PLImportSession *)self startDate];
    BOOL v7 = [v6 compare:v4] == 1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_isAssetIncludedInImportDates:(id)a3
{
  id v3 = a3;
  if ([v3 isInTrash]) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isDeleted] ^ 1;
  }

  return v4;
}

- (void)updateImportDatesFromAddedAsset:(id)a3
{
  id v4 = a3;
  id v6 = [v4 addedDate];
  BOOL v5 = [(PLImportSession *)self _isAssetIncludedInImportDates:v4];

  if (v5)
  {
    if ([(PLImportSession *)self _isDateBeforeStartDate:v6]) {
      [(PLImportSession *)self _updateStartDate:v6];
    }
    if ([(PLImportSession *)self _isDateAfterEndDate:v6]) {
      [(PLImportSession *)self _updateEndDate:v6];
    }
  }
}

- (void)revalidateImportDates
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = PLBackendGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [(PLImportSession *)self importSessionID];
    int v13 = 138412290;
    uint64_t v14 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Revalidating importDates for %@", (uint8_t *)&v13, 0xCu);
  }
  BOOL v5 = [(PLImportSession *)self _orderedBatchedAssets];
  id v6 = [v5 objectEnumerator];
  BOOL v7 = 0;
  while (1)
  {
    id v8 = v7;
    BOOL v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    if ([(PLImportSession *)self _isAssetIncludedInImportDates:v7])
    {
      uint64_t v9 = [v7 addedDate];
      goto LABEL_8;
    }
  }
  uint64_t v9 = 0;
LABEL_8:
  v10 = [v5 reverseObjectEnumerator];
  while (1)
  {
    id v11 = v7;
    BOOL v7 = [v10 nextObject];

    if (!v7) {
      break;
    }
    if ([(PLImportSession *)self _isAssetIncludedInImportDates:v7])
    {
      v12 = [v7 addedDate];
      goto LABEL_13;
    }
  }
  v12 = 0;
LABEL_13:
  [(PLImportSession *)self _updateStartDate:v9];
  [(PLImportSession *)self _updateEndDate:v12];
}

- (void)_updateEndDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLImportSession *)self endDate];
  if (!v5
    || (id v6 = (void *)v5,
        [(PLImportSession *)self endDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:v4],
        double v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(PLImportSession *)self importSessionID];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "setEndDate: %@ for %@", (uint8_t *)&v12, 0x16u);
    }
    [(PLImportSession *)self setEndDate:v4];
  }
}

- (void)_updateStartDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLImportSession *)self startDate];
  if (!v5
    || (id v6 = (void *)v5,
        [(PLImportSession *)self startDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:v4],
        double v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(PLImportSession *)self importSessionID];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "setStartDate: %@ for %@", (uint8_t *)&v12, 0x16u);
    }
    [(PLImportSession *)self setStartDate:v4];
  }
}

- (id)mutableAssets
{
  return (id)[(PLImportSession *)self mutableSetValueForKey:@"assets"];
}

+ (id)validKindsForPersistence
{
  return &unk_1EEBF15F8;
}

+ (id)albumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v13 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = a3;
    double v9 = [v6 arrayWithObjects:&v13 count:1];

    v10 = objc_msgSend(a1, "albumsWithImportSessionIDs:inManagedObjectContext:", v9, v7, v13, v14);

    id v11 = [v10 firstObject];
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

+ (id)albumsWithImportSessionIDs:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"ImportSession"];
    id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"importSessionID", v5];
    [v7 setPredicate:v8];

    objc_msgSend(v7, "setFetchLimit:", objc_msgSend(v5, "count"));
    [v7 setReturnsObjectsAsFaults:0];
    if ((unint64_t)[v5 count] >= 0x65) {
      [v7 setFetchBatchSize:100];
    }
    id v13 = 0;
    double v9 = [v6 executeFetchRequest:v7 error:&v13];
    id v10 = v13;
    if (!v9)
    {
      id v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v15 = v7;
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

+ (id)insertNewImportSessionAlbumWithImportSessionID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = +[PLManagedObject insertInManagedObjectContext:a4];
  [v6 setImportSessionID:v5];

  [v6 setKindValue:1506];
  return v6;
}

+ (id)entityName
{
  return @"ImportSession";
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return 0;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(PLManagedObjectJournalEntryPayload *)[PLImportSessionJournalEntryPayload alloc] initWithManagedObject:self changedKeys:v4];

  return v5;
}

@end