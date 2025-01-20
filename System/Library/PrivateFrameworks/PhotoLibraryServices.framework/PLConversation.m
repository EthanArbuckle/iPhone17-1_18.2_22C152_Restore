@interface PLConversation
+ (id)albumWithConversationID:(id)a3 inLibrary:(id)a4;
+ (id)albumsWithConversationIDs:(id)a3 inLibrary:(id)a4;
+ (id)createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5 createIfNeeded:(BOOL)a6 didCreate:(BOOL *)a7 isSyndicatable:(BOOL *)a8 error:(id *)a9;
+ (id)entityName;
+ (id)insertNewConversationAlbumWithConversationID:(id)a3 inManagedObjectContext:(id)a4;
- (BOOL)_isAssetIncludedInConversationDates:(id)a3;
- (BOOL)_isDateAfterEndDate:(id)a3;
- (BOOL)_isDateBeforeStartDate:(id)a3;
- (BOOL)albumShouldBeAutomaticallyDeleted;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)isEmpty;
- (BOOL)needsPersistenceUpdate;
- (id)_orderedBatchedAssets;
- (id)mutableAssets;
- (unint64_t)count;
- (void)_updateAssetSyndicationState:(unsigned __int16)a3;
- (void)_updateEndDate:(id)a3;
- (void)_updateStartDate:(id)a3;
- (void)setAlbumShouldBeAutomaticallyDeleted:(BOOL)a3;
- (void)setNeedsPersistenceUpdate:(BOOL)a3;
- (void)updateConversationDatesFromAddedAsset:(id)a3;
- (void)willSave;
@end

@implementation PLConversation

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
  return [(PLConversation *)self count] == 0;
}

- (unint64_t)count
{
  v2 = [(PLConversation *)self assets];
  unint64_t v3 = [v2 count];

  return v3;
}

- (void)willSave
{
  v6.receiver = self;
  v6.super_class = (Class)PLConversation;
  [(PLGenericAlbum *)&v6 willSave];
  unint64_t v3 = [(PLConversation *)self managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(PLConversation *)self changedValues];
    v5 = [v4 objectForKey:@"syndicate"];

    if (v5) {
      [(PLConversation *)self _updateAssetSyndicationState:[(PLConversation *)self syndicate]];
    }
  }
}

- (void)_updateAssetSyndicationState:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(PLConversation *)self assets];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = [v9 syndicationState];
        if (v3 == 1)
        {
          unsigned __int16 v11 = v10 & 0xFFFB;
        }
        else if (v3)
        {
          unsigned __int16 v11 = 0;
        }
        else
        {
          unsigned __int16 v11 = v10 | 4;
        }
        if (v10 != v11) {
          [v9 setSyndicationState:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)_orderedBatchedAssets
{
  v22[1] = *MEMORY[0x1E4F143B8];
  int v3 = (void *)MEMORY[0x1E4F1C0D0];
  v4 = +[PLManagedAsset entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setFetchBatchSize:100];
  [v5 setReturnsObjectsAsFaults:0];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"conversation", self];
  [v5 setPredicate:v6];

  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:1];
  v22[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [v5 setSortDescriptors:v8];

  v9 = [(PLConversation *)self managedObjectContext];
  id v17 = 0;
  int v10 = [v9 executeFetchRequest:v5 error:&v17];
  id v11 = v17;
  if (!v10)
  {
    long long v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = (uint64_t)v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Unable to fetch batchedAssets: %@", buf, 0xCu);
    }
  }
  long long v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [v10 count];
    long long v15 = [(PLManagedObject *)self shortObjectIDURI];
    *(_DWORD *)buf = 134218242;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    v21 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEBUG, "Batch fetched %lu assets from conversation %@", buf, 0x16u);
  }
  return v10;
}

- (BOOL)_isDateAfterEndDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLConversation *)self endDate];
  if (v5)
  {
    uint64_t v6 = [(PLConversation *)self endDate];
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
  uint64_t v5 = [(PLConversation *)self startDate];
  if (v5)
  {
    uint64_t v6 = [(PLConversation *)self startDate];
    BOOL v7 = [v6 compare:v4] == 1;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)_isAssetIncludedInConversationDates:(id)a3
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

- (void)updateConversationDatesFromAddedAsset:(id)a3
{
  id v4 = a3;
  id v6 = [v4 addedDate];
  BOOL v5 = [(PLConversation *)self _isAssetIncludedInConversationDates:v4];

  if (v5)
  {
    if ([(PLConversation *)self _isDateBeforeStartDate:v6]) {
      [(PLConversation *)self _updateStartDate:v6];
    }
    if ([(PLConversation *)self _isDateAfterEndDate:v6]) {
      [(PLConversation *)self _updateEndDate:v6];
    }
  }
}

- (void)_updateEndDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLConversation *)self endDate];
  if (!v5
    || (id v6 = (void *)v5,
        [(PLConversation *)self endDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:v4],
        double v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    int v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(PLConversation *)self importSessionID];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      long long v15 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "setEndDate: %@ for %@", (uint8_t *)&v12, 0x16u);
    }
    [(PLConversation *)self setEndDate:v4];
  }
}

- (void)_updateStartDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLConversation *)self startDate];
  if (!v5
    || (id v6 = (void *)v5,
        [(PLConversation *)self startDate],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 timeIntervalSinceDate:v4],
        double v9 = fabs(v8),
        v7,
        v6,
        v9 > 2.22044605e-16))
  {
    int v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(PLConversation *)self importSessionID];
      int v12 = 138412546;
      id v13 = v4;
      __int16 v14 = 2112;
      long long v15 = v11;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEBUG, "setStartDate: %@ for %@", (uint8_t *)&v12, 0x16u);
    }
    [(PLConversation *)self setStartDate:v4];
  }
}

- (id)mutableAssets
{
  return (id)[(PLConversation *)self mutableSetValueForKey:@"assets"];
}

+ (id)createOrUpdateObjectFromSearchableItem:(id)a3 library:(id)a4 fullIndexSyncStartDate:(id)a5 createIfNeeded:(BOOL)a6 didCreate:(BOOL *)a7 isSyndicatable:(BOOL *)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  uint64_t IsChatAutoDonating = PLSearchableItemMessagesIsChatAutoDonating(v13);
  uint64_t v16 = PLSyndicationGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [v13 uniqueIdentifier];
    v18 = (void *)v17;
    uint64_t v19 = @"not ";
    if (IsChatAutoDonating) {
      uint64_t v19 = &stru_1EEB2EB80;
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    v27 = v19;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "[sync] considering spotlight item with ID: %@ (%{public}@autoDonating) for syndication conversation", buf, 0x16u);
  }
  __int16 v20 = [v13 uniqueIdentifier];
  v21 = [v14 managedObjectContext];
  v22 = +[PLConversation albumWithConversationID:v20 inLibrary:v14];

  if (v22) {
    BOOL v11 = 0;
  }
  if (v11)
  {
    v22 = +[PLConversation insertNewConversationAlbumWithConversationID:v20 inManagedObjectContext:v21];
  }
  if (v22) {
    [v22 setSyndicate:IsChatAutoDonating];
  }
  if (a7) {
    *a7 = v11;
  }
  if (a8) {
    *a8 = 1;
  }
  if (a9) {
    *a9 = 0;
  }

  return v22;
}

+ (id)albumWithConversationID:(id)a3 inLibrary:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v13 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = a3;
    double v9 = [v6 arrayWithObjects:&v13 count:1];

    int v10 = objc_msgSend(a1, "albumsWithConversationIDs:inLibrary:", v9, v7, v13, v14);

    BOOL v11 = [v10 firstObject];
  }
  else
  {
    BOOL v11 = 0;
  }
  return v11;
}

+ (id)albumsWithConversationIDs:(id)a3 inLibrary:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = (void *)MEMORY[0x19F38D3B0]();
    id v8 = [v6 managedObjectContext];
    double v9 = (void *)MEMORY[0x1E4F1C0D0];
    int v10 = +[PLConversation entityName];
    BOOL v11 = [v9 fetchRequestWithEntityName:v10];

    int v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"importSessionID", v5];
    [v11 setPredicate:v12];

    objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v5, "count"));
    [v11 setReturnsObjectsAsFaults:0];
    if ((unint64_t)[v5 count] >= 0x65) {
      [v11 setFetchBatchSize:100];
    }
    id v17 = 0;
    id v13 = [v8 executeFetchRequest:v11 error:&v17];
    id v14 = v17;
    if (!v13)
    {
      long long v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        id v21 = v14;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

+ (id)insertNewConversationAlbumWithConversationID:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = +[PLManagedObject insertInManagedObjectContext:a4];
  [v6 setImportSessionID:v5];

  [v6 setKindValue:1509];
  return v6;
}

+ (id)entityName
{
  return @"Conversation";
}

@end