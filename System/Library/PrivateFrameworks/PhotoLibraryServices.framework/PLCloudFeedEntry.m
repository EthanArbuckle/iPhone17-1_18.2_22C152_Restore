@interface PLCloudFeedEntry
+ (id)_recentEntriesInLibrary:(id)a3 forEntity:(id)a4 usingPredicate:(id)a5 earliestDate:(id)a6 latestDate:(id)a7 limit:(unint64_t)a8 sortDescriptors:(id)a9;
+ (id)allEntriesInLibrary:(id)a3;
+ (id)allEntriesInManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)entriesSortDescriptorsAscending:(BOOL)a3;
+ (id)entryWithURIRepresentation:(id)a3 inLibrary:(id)a4;
+ (id)fetchesForFilter:(int64_t)a3 inManagedObjectContext:(id)a4;
+ (id)firstEntryWithType:(int64_t)a3 albumGUID:(id)a4 inLibrary:(id)a5;
+ (id)notificationPredicateForFilter:(int64_t)a3;
+ (id)predicateExcludingEntryTypes:(id)a3;
+ (id)predicateIncludingOnlyAssetsAddedByOthers;
+ (id)predicateIncludingOnlyCommentsAndLikesFromOthers;
+ (id)predicateIncludingOnlyEntryTypes:(id)a3;
+ (id)predicateIncludingOnlyEntryTypes:(id)a3 noIndex:(BOOL)a4;
+ (id)recentAssetsEntriesInLibrary:(id)a3 limit:(int64_t)a4;
+ (id)recentEntriesInLibrary:(id)a3 earliestDate:(id)a4 latestDate:(id)a5 limit:(unint64_t)a6 filter:(int64_t)a7 sortDescriptors:(id)a8;
- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3;
- (NSURL)URIRepresentation;
- (int64_t)entryPriority;
- (int64_t)entryType;
- (void)recalcIsMine;
- (void)willSave;
@end

@implementation PLCloudFeedEntry

- (BOOL)shouldBeRemovedFromPhotoLibrary:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PLCloudFeedEntry *)self entryDate];

  if (v5
    && (([(PLCloudFeedEntry *)self entryAlbumGUID], (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0)
     || (v7 = (void *)v6,
         +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v6 inLibrary:v4], v8 = objc_claimAutoreleasedReturnValue(), v8, v7, v8)))
  {
    uint64_t v9 = [(PLCloudFeedEntry *)self entryInvitationRecordGUID];
    v10 = (void *)v9;
    if (v9)
    {
      v16[0] = v9;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
      v12 = +[PLCloudSharedAlbumInvitationRecord cloudSharedAlbumInvitationRecordsWithGUIDs:v11 inLibrary:v4];
      v13 = [v12 firstObject];
      BOOL v14 = v13 == 0;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 1;
  }

  return v14;
}

- (int64_t)entryPriority
{
  v2 = [(PLCloudFeedEntry *)self entryPriorityNumber];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (int64_t)entryType
{
  v2 = [(PLCloudFeedEntry *)self entryTypeNumber];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (NSURL)URIRepresentation
{
  v2 = [(PLCloudFeedEntry *)self objectID];
  int64_t v3 = [v2 URIRepresentation];

  return (NSURL *)v3;
}

- (void)recalcIsMine
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  switch([(PLCloudFeedEntry *)self entryType])
  {
    case 1:
      id v4 = [(PLCloudFeedEntry *)self entity];
      v5 = +[PLCloudFeedAssetsEntry entity];
      uint64_t v3 = [v4 isKindOfEntity:v5];

      if (v3)
      {
        uint64_t v6 = [(PLCloudFeedEntry *)self entryAssets];
        id v7 = [(PLCloudFeedEntry *)v6 firstObject];
        uint64_t v3 = [v7 cloudIsMyAsset];
        goto LABEL_20;
      }
      break;
    case 2:
      v8 = [(PLCloudFeedEntry *)self entity];
      uint64_t v9 = +[PLCloudFeedCommentsEntry entity];
      uint64_t v3 = [v8 isKindOfEntity:v9];

      if (v3)
      {
        uint64_t v6 = self;
        v10 = [(PLCloudFeedEntry *)v6 entryComments];
        if ([v10 count]) {
          [(PLCloudFeedEntry *)v6 entryComments];
        }
        else {
        v11 = [(PLCloudFeedEntry *)v6 entryLikeComments];
        }

        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v7 = v11;
        uint64_t v12 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          while (2)
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v7);
              }
              v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v15), "isMyComment", (void)v19);
              int v17 = [v16 BOOLValue];

              if (!v17)
              {
                uint64_t v3 = 0;
                goto LABEL_19;
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
        uint64_t v3 = 1;
LABEL_19:

LABEL_20:
      }
      break;
    case 4:
    case 7:
      uint64_t v3 = 1;
      break;
    default:
      break;
  }
  v18 = objc_msgSend(NSNumber, "numberWithBool:", v3, (void)v19);
  [(PLManagedObject *)self pl_safeSetValue:v18 forKey:@"entryIsMine" valueDidChangeHandler:0];
}

- (void)willSave
{
  v7.receiver = self;
  v7.super_class = (Class)PLCloudFeedEntry;
  [(PLManagedObject *)&v7 willSave];
  if (([(PLCloudFeedEntry *)self isDeleted] & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    uint64_t v3 = [(PLCloudFeedEntry *)self changedValues];
    if (([(PLCloudFeedEntry *)self isInserted] & 1) == 0)
    {
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v4 = @"entryAssets";
        goto LABEL_6;
      }
      objc_opt_class();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_12:

        return;
      }
      uint64_t v6 = [v3 objectForKeyedSubscript:@"entryLikeComments"];
      if (!v6)
      {
        id v4 = @"entryComments";
LABEL_6:
        v5 = [v3 objectForKeyedSubscript:v4];

        if (!v5) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
    }
LABEL_11:
    [(PLCloudFeedEntry *)self recalcIsMine];
    goto LABEL_12;
  }
}

+ (id)entityName
{
  return @"CloudFeedEntry";
}

+ (id)entryWithURIRepresentation:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 managedObjectContext];
  objc_super v7 = [v6 persistentStoreCoordinator];
  v8 = [v7 managedObjectIDForURIRepresentation:v5];

  if (v8)
  {
    uint64_t v9 = [v6 objectWithID:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)allEntriesInManagedObjectContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = +[PLManagedObject entityInManagedObjectContext:v4];
  [v5 setEntity:v6];

  [v5 setFetchBatchSize:100];
  objc_super v7 = +[PLCloudFeedEntry entriesSortDescriptorsAscending:1];
  [v5 setSortDescriptors:v7];
  id v12 = 0;
  v8 = [v4 executeFetchRequest:v5 error:&v12];

  id v9 = v12;
  if (!v8)
  {
    v10 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "error fetching all entries: %@", buf, 0xCu);
    }
  }
  return v8;
}

+ (id)firstEntryWithType:(int64_t)a3 albumGUID:(id)a4 inLibrary:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v7 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(v7);
  v11 = [v8 managedObjectContext];

  id v12 = +[PLManagedObject entityInManagedObjectContext:v11];
  [v10 setEntity:v12];

  [v10 setFetchLimit:1];
  uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryTypeNumber = %d) AND (entryAlbumGUID = %@)", a3, v9];

  [v10 setPredicate:v13];
  id v19 = 0;
  id v14 = [v11 executeFetchRequest:v10 error:&v19];
  id v15 = v19;
  if (v14)
  {
    v16 = [v14 firstObject];
  }
  else
  {
    int v17 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v15;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

+ (id)recentAssetsEntriesInLibrary:(id)a3 limit:(int64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F1C0D0];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = [v6 managedObjectContext];

  id v9 = +[PLManagedObject entityInManagedObjectContext:v8];
  [v7 setEntity:v9];

  [v7 setFetchLimit:a4];
  id v10 = +[PLCloudFeedEntry entriesSortDescriptorsAscending:0];
  [v7 setSortDescriptors:v10];
  id v15 = 0;
  v11 = [v8 executeFetchRequest:v7 error:&v15];
  id v12 = v15;
  if (!v11)
  {
    uint64_t v13 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }
  }
  return v11;
}

+ (id)_recentEntriesInLibrary:(id)a3 forEntity:(id)a4 usingPredicate:(id)a5 earliestDate:(id)a6 latestDate:(id)a7 limit:(unint64_t)a8 sortDescriptors:(id)a9
{
  v55[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1C0D0]);
  id v21 = [v14 managedObjectContext];
  [v20 setEntity:v15];
  v46 = v14;
  v44 = v17;
  v45 = v16;
  v43 = v18;
  if (v17 && v18)
  {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryDate > %@) AND (entryDate <= %@)", v17, v18];
  }
  else if (v17)
  {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryDate > %@)", v17, v40];
  }
  else
  {
    if (!v18)
    {
      uint64_t v22 = 0;
      BOOL v24 = v16 != 0;
      BOOL v23 = 1;
      goto LABEL_12;
    }
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"(entryDate <= %@)", v18, v40];
  uint64_t v22 = };
  BOOL v23 = v22 == 0;
  BOOL v24 = v16 != 0;
  if (!v16 && v22)
  {
    id v25 = v22;
    v41 = v25;
    goto LABEL_20;
  }
LABEL_12:
  v41 = v22;
  if (v24 && v23)
  {
    id v25 = v16;
    if (!v25)
    {
LABEL_21:
      if (!a8) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
LABEL_20:
    [v20 setPredicate:v25];
    goto LABEL_21;
  }
  char v26 = !v24;
  if (!v22) {
    char v26 = 1;
  }
  if ((v26 & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E4F28BA0];
    v55[0] = v22;
    v55[1] = v16;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    id v25 = [v27 andPredicateWithSubpredicates:v28];

    if (!v25) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  id v25 = 0;
  if (a8) {
LABEL_22:
  }
    [v20 setFetchLimit:a8];
LABEL_23:
  v42 = v25;
  id v29 = v19;
  v30 = v29;
  if (!v29)
  {
    v30 = +[PLCloudFeedEntry entriesSortDescriptorsAscending:0];
  }
  [v20 setSortDescriptors:v30];
  [v20 setRelationshipKeyPathsForPrefetching:&unk_1EEBF2648];
  id v51 = 0;
  v31 = [v21 executeFetchRequest:v20 error:&v51];
  id v32 = v51;
  if (!v31)
  {
    v33 = PLCloudFeedGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v32;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "error fetching recent asset entries: %@", buf, 0xCu);
    }
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v34 = v31;
  uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(v34);
        }
        objc_msgSend(v21, "refreshObject:mergeChanges:", *(void *)(*((void *)&v47 + 1) + 8 * i), objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * i), "hasChanges"));
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v36);
  }

  return v34;
}

+ (id)recentEntriesInLibrary:(id)a3 earliestDate:(id)a4 latestDate:(id)a5 limit:(unint64_t)a6 filter:(int64_t)a7 sortDescriptors:(id)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v37 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = v13;
  uint64_t v17 = [v13 managedObjectContext];
  if (a6 <= 0x64) {
    unint64_t v18 = 100;
  }
  else {
    unint64_t v18 = a6;
  }
  [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
  v35 = id v34 = (void *)v17;
  +[PLCloudFeedEntry fetchesForFilter:a7 inManagedObjectContext:v17];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v23 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        BOOL v24 = [v23 predicate];
        id v25 = [v23 entity];
        char v26 = +[PLCloudFeedEntry _recentEntriesInLibrary:v16 forEntity:v25 usingPredicate:v24 earliestDate:v37 latestDate:v14 limit:a6 sortDescriptors:v15];
        v27 = v26;
        if (v26 && [v26 count]) {
          [v35 addObjectsFromArray:v27];
        }
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v20);
  }
  if ((unint64_t)[obj count] < 2)
  {
    id v29 = v35;
  }
  else
  {
    id v28 = v15;
    id v29 = v35;
    if (!v28)
    {
      id v28 = +[PLCloudFeedEntry entriesSortDescriptorsAscending:0];
    }
    [v35 sortUsingDescriptors:v28];
    if (a6 && [v35 count] > a6)
    {
      v30 = objc_msgSend(v35, "subarrayWithRange:", 0, a6);
      uint64_t v31 = [v30 mutableCopy];

      id v29 = (void *)v31;
    }
  }
  id v32 = (void *)[v29 copy];

  return v32;
}

+ (id)fetchesForFilter:(int64_t)a3 inManagedObjectContext:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  switch(a3)
  {
    case 0:
    case 2:
      id v8 = [PLCloudFeedEntryFetch alloc];
      id v9 = +[PLManagedObject entityInManagedObjectContext:v6];
      id v10 = [(PLCloudFeedEntryFetch *)v8 initWithPredicate:0 entity:v9];

      [v7 addObject:v10];
      goto LABEL_12;
    case 1:
      v11 = &unk_1EEBF2600;
      goto LABEL_5;
    case 3:
      v11 = &unk_1EEBF2618;
LABEL_5:
      uint64_t v12 = [a1 predicateIncludingOnlyEntryTypes:v11];
      goto LABEL_10;
    case 4:
      id v10 = [a1 predicateIncludingOnlyCommentsAndLikesFromOthers];
      id v13 = [PLCloudFeedEntryFetch alloc];
      id v14 = +[PLManagedObject entityInManagedObjectContext:v6];
      id v15 = [(PLCloudFeedEntryFetch *)v13 initWithPredicate:v10 entity:v14];

      id v16 = [a1 predicateIncludingOnlyEntryTypes:&unk_1EEBF2630 noIndex:0];
      uint64_t v17 = [PLCloudFeedEntryFetch alloc];
      unint64_t v18 = +[PLManagedObject entityInManagedObjectContext:v6];
      uint64_t v19 = [(PLCloudFeedEntryFetch *)v17 initWithPredicate:v16 entity:v18];

      v33[0] = v15;
      v33[1] = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
      [v7 addObjectsFromArray:v20];
      goto LABEL_8;
    case 5:
      id v10 = [a1 predicateIncludingOnlyCommentsAndLikesFromOthers];
      uint64_t v21 = [PLCloudFeedEntryFetch alloc];
      uint64_t v22 = +[PLManagedObject entityInManagedObjectContext:v6];
      id v15 = [(PLCloudFeedEntryFetch *)v21 initWithPredicate:v10 entity:v22];

      id v16 = [a1 predicateIncludingOnlyAssetsAddedByOthers];
      BOOL v23 = [PLCloudFeedEntryFetch alloc];
      BOOL v24 = +[PLManagedObject entityInManagedObjectContext:v6];
      uint64_t v19 = [(PLCloudFeedEntryFetch *)v23 initWithPredicate:v16 entity:v24];

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(noindex:(entryTypeNumber) = %d) OR (noindex:(entryTypeNumber) = %d)", 5, 6);
      id v25 = [PLCloudFeedEntryFetch alloc];
      char v26 = +[PLManagedObject entityInManagedObjectContext:v6];
      v27 = [(PLCloudFeedEntryFetch *)v25 initWithPredicate:v20 entity:v26];

      v32[0] = v15;
      v32[1] = v19;
      v32[2] = v27;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
      [v7 addObjectsFromArray:v28];

LABEL_8:
      goto LABEL_11;
    case 6:
      uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(entryTypeNumber != %d) AND (entryTypeNumber != %d)", 4, 7);
LABEL_10:
      id v10 = (PLCloudFeedEntryFetch *)v12;
      id v29 = [PLCloudFeedEntryFetch alloc];
      v30 = +[PLManagedObject entityInManagedObjectContext:v6];
      id v15 = [(PLCloudFeedEntryFetch *)v29 initWithPredicate:v10 entity:v30];

      [v7 addObject:v15];
LABEL_11:

LABEL_12:
      break;
    default:
      break;
  }

  return v7;
}

+ (id)notificationPredicateForFilter:(int64_t)a3
{
  uint64_t v3 = 0;
  v17[2] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 1:
      id v5 = &unk_1EEBF2588;
      goto LABEL_4;
    case 3:
      id v5 = &unk_1EEBF25A0;
LABEL_4:
      uint64_t v6 = [a1 predicateIncludingOnlyEntryTypes:v5];
      goto LABEL_9;
    case 4:
      id v7 = (void *)MEMORY[0x1E4F28BA0];
      id v8 = [a1 predicateIncludingOnlyCommentsAndLikesFromOthers];
      v17[0] = v8;
      id v9 = [a1 predicateIncludingOnlyEntryTypes:&unk_1EEBF25B8];
      v17[1] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
      uint64_t v3 = [v7 orPredicateWithSubpredicates:v10];

      goto LABEL_7;
    case 5:
      v11 = (void *)MEMORY[0x1E4F28BA0];
      id v8 = [a1 predicateIncludingOnlyCommentsAndLikesFromOthers];
      uint64_t v12 = objc_msgSend(a1, "predicateIncludingOnlyAssetsAddedByOthers", v8);
      v16[1] = v12;
      id v13 = [a1 predicateIncludingOnlyEntryTypes:&unk_1EEBF25D0];
      void v16[2] = v13;
      id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
      uint64_t v3 = [v11 orPredicateWithSubpredicates:v14];

LABEL_7:
      break;
    case 6:
      uint64_t v6 = [a1 predicateExcludingEntryTypes:&unk_1EEBF25E8];
LABEL_9:
      uint64_t v3 = (void *)v6;
      break;
    default:
      break;
  }
  return v3;
}

+ (id)predicateIncludingOnlyAssetsAddedByOthers
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(entryTypeNumber = %d AND entryIsMine = NO)", 1);
}

+ (id)predicateIncludingOnlyCommentsAndLikesFromOthers
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(entryTypeNumber = %d AND entryIsMine = NO)", 2);
}

+ (id)predicateExcludingEntryTypes:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) intValue];
        v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"entryTypeNumber != %d", v10);
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v12;
}

+ (id)predicateIncludingOnlyEntryTypes:(id)a3 noIndex:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    if (v4) {
      v11 = @"(noindex:(entryTypeNumber) = %d)";
    }
    else {
      v11 = @"entryTypeNumber = %d";
    }
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        int v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) intValue];
        long long v14 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v11, v13);
        [v6 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  long long v15 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v6];

  return v15;
}

+ (id)predicateIncludingOnlyEntryTypes:(id)a3
{
  return (id)[a1 predicateIncludingOnlyEntryTypes:a3 noIndex:0];
}

+ (id)allEntriesInLibrary:(id)a3
{
  BOOL v4 = [a3 managedObjectContext];
  id v5 = [a1 allEntriesInManagedObjectContext:v4];

  return v5;
}

+ (id)entriesSortDescriptorsAscending:(BOOL)a3
{
  BOOL v3 = a3;
  v8[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryPriorityNumber" ascending:a3];
  id v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"entryDate" ascending:v3];
  v8[0] = v4;
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];

  return v6;
}

@end