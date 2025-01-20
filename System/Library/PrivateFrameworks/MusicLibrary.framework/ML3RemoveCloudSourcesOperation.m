@interface ML3RemoveCloudSourcesOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (unint64_t)type;
@end

@implementation ML3RemoveCloudSourcesOperation

- (BOOL)_execute:(id *)a3
{
  v97[2] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  v6 = [(ML3DatabaseOperation *)self attributes];
  v70 = [v6 objectForKey:@"MLDatabaseOperationAttributeRemoveCloudSourcesKey"];

  int v7 = [v70 containsObject:@"MLDatabaseOperationAttributeRemoveSubscriptionContentKey"];
  int v8 = [v70 containsObject:@"MLDatabaseOperationAttributeRemovePurchaseHistoryKey"];
  int v9 = [v70 containsObject:@"MLDatabaseOperationAttributeRemovePurchaseHistoryForMediaItemsKey"];
  int v10 = [v70 containsObject:@"MLDatabaseOperationAttributeRemoveMatchKey"];
  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&buf[4] = v10;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v9;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v8;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Beginning remove cloud sources operation - removeSourceMatch=%{BOOL}u, subscription=%{BOOL}u, purchasesForMediaItems=%{BOOL}u, removeSourcePurchaseHistory=%{BOOL}u", buf, 0x1Au);
  }

  v71 = [(ML3DatabaseOperation *)self transaction];
  v72 = [v71 connection];
  v73 = [v71 library];
  if (v7)
  {
    v12 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.is_subscription" equalToInt64:1];
    v13 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:v73 predicate:v12 orderingTerms:0];
    [v13 setIgnoreSystemFilterPredicates:1];
    if ([v13 hasEntities]) {
      [v73 removeSource:6 forImportOperation:self usingConnection:v72 postNotifications:0];
    }
  }
  if ([v73 sagaOnDiskDatabaseRevision]) {
    int v14 = 1;
  }
  else {
    int v14 = v10;
  }
  if (v14 != 1)
  {
    id v35 = 0;
    if (!v9) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud source from playlists", buf, 0xCu);
  }

  id v92 = 0;
  char v16 = [v72 executeUpdate:@"UPDATE container SET store_cloud_id = 0" withParameters:0 error:&v92];
  id v17 = v92;
  if ((v16 & 1) == 0)
  {
    v18 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id properties failed with error=%{public}@.", buf, 0x16u);
    }
  }
  id v91 = v17;
  char v19 = [v72 executeUpdate:@"UPDATE container SET is_src_remote=1 WHERE sync_id != 0" withParameters:0 error:&v91];
  id v67 = v91;

  if ((v19 & 1) == 0)
  {
    v20 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v67;
      _os_log_impl(&dword_1B022D000, v20, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Updating is_src_remote failed with error=%{public}@.", buf, 0x16u);
    }
  }
  v21 = +[ML3ComparisonPredicate predicateWithProperty:@"is_src_remote" equalToInt64:2];
  v68 = +[ML3Entity queryWithLibrary:v73 predicate:v21];

  v22 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v68 countOfEntities];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v23;
    _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing %ld playlists synced from the cloud", buf, 0x16u);
  }

  [v68 deleteAllEntitiesFromLibraryWithDeletionType:2];
  v24 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1B022D000, v24, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud source from albums and artists", buf, 0xCu);
  }

  v25 = [v72 executeQuery:@"SELECT album_artist_pid FROM album_artist where cloud_universal_library_id !=''"];
  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke;
  v88[3] = &unk_1E5FB6278;
  id v26 = v73;
  id v89 = v26;
  id v27 = v72;
  id v90 = v27;
  [v25 enumerateRowsWithBlock:v88];
  v28 = [v27 executeQuery:@"SELECT album_pid FROM album where cloud_library_id !=''"];

  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_2;
  v85[3] = &unk_1E5FB6278;
  id v29 = v26;
  id v86 = v29;
  id v30 = v27;
  id v87 = v30;
  [v28 enumerateRowsWithBlock:v85];
  id v84 = 0;
  char v31 = [v30 executeUpdate:@"UPDATE album_artist SET cloud_universal_library_id=?, liked_state=?, liked_state_changed_date=? WHERE cloud_universal_library_id !=''", &unk_1F090EA10, &v84 withParameters error];
  id v32 = v84;
  if ((v31 & 1) == 0)
  {
    v33 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v32;
      _os_log_impl(&dword_1B022D000, v33, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id property from album artists failed with error=%{public}@.", buf, 0x16u);
    }
  }
  id v83 = v32;
  char v34 = [v30 executeUpdate:@"UPDATE album SET cloud_library_id=?, liked_state=?, liked_state_changed_date=? WHERE cloud_library_id !=''", &unk_1F090EA28, &v83 withParameters error];
  id v35 = v83;

  if ((v34 & 1) == 0)
  {
    v36 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v35;
      _os_log_impl(&dword_1B022D000, v36, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing cloud id property from albums failed with error=%{public}@.", buf, 0x16u);
    }
  }
  v37 = [NSNumber numberWithBool:1];
  v38 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.distinguished_kind = 32)" value:v37 comparison:1];

  v39 = +[ML3Entity queryWithLibrary:v29 predicate:v38];
  v40 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v41 = [v39 countOfEntities];
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v41;
    _os_log_impl(&dword_1B022D000, v40, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] %{public}@ - Removing %ld genius mixes.", buf, 0x16u);
  }

  [v39 deleteAllEntitiesFromLibraryWithDeletionType:2];
  [v29 removeSource:2 forImportOperation:self usingConnection:v30 postNotifications:0];

  if (v9)
  {
LABEL_38:
    v42 = +[ML3ComparisonPredicate predicateWithProperty:@"media_type" value:&unk_1F0910BB8 comparison:10];
    v43 = +[ML3ComparisonPredicate predicateWithProperty:@"item_store.purchase_history_id" value:&unk_1F0910BA0 comparison:2];
    v97[0] = v42;
    v97[1] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
    v45 = +[ML3CompoundPredicate predicateMatchingPredicates:v44];

    v46 = +[ML3Entity unrestrictedQueryWithLibrary:v73 predicate:v45 orderingTerms:MEMORY[0x1E4F1CBF0]];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    *(void *)&buf[24] = __Block_byref_object_copy__1533;
    v95 = __Block_byref_object_dispose__1534;
    id v96 = [MEMORY[0x1E4F1CA48] array];
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_42;
    v82[3] = &unk_1E5FAF498;
    v82[4] = buf;
    [v46 enumeratePersistentIDsUsingBlock:v82];
    [v73 removeSource:4 fromPersistentIDS:*(void *)(*(void *)&buf[8] + 40) forImportOperation:self usingConnection:v72 postNotifications:0];
    _Block_object_dispose(buf, 8);
  }
LABEL_39:
  if (v8)
  {
    if ([v73 jaliscoOnDiskDatabaseRevision] >= 1)
    {
      [v73 removeSource:4 forImportOperation:self usingConnection:v72 postNotifications:0];
      [v73 setJaliscoOnDiskDatabaseRevision:0];
      v47 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v73 setJaliscoLastGeniusUpdateDate:v47];

      if ([v73 jaliscoHasCloudGeniusData])
      {
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        uint64_t v48 = [&unk_1F090EA40 countByEnumeratingWithState:&v78 objects:v93 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v79;
          while (2)
          {
            uint64_t v50 = 0;
            v51 = v35;
            do
            {
              if (*(void *)v79 != v49) {
                objc_enumerationMutation(&unk_1F090EA40);
              }
              uint64_t v52 = *(void *)(*((void *)&v78 + 1) + 8 * v50);
              v53 = [NSString stringWithFormat:@"DELETE FROM %@", v52];
              id v77 = v51;
              char v54 = [v72 executeUpdate:v53 withParameters:0 error:&v77];
              id v35 = v77;

              if ((v54 & 1) == 0)
              {
                v55 = os_log_create("com.apple.amp.medialibrary", "Default");
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v52;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v35;
                  _os_log_impl(&dword_1B022D000, v55, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] failed to empty rows from table=%{public}@, error=%{public}@", buf, 0x16u);
                }

                goto LABEL_54;
              }
              ++v50;
              v51 = v35;
            }
            while (v48 != v50);
            uint64_t v48 = [&unk_1F090EA40 countByEnumeratingWithState:&v78 objects:v93 count:16];
            if (v48) {
              continue;
            }
            break;
          }
        }
LABEL_54:
        v56 = +[ML3ComparisonPredicate predicateWithProperty:@"(container.is_container_type_active_target AND container.smart_is_genius)" equalToInteger:1];
        v57 = +[ML3Entity queryWithLibrary:v73 predicate:v56];
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_60;
        v75[3] = &unk_1E5FB7EE0;
        id v58 = v73;
        id v76 = v58;
        [v57 enumeratePersistentIDsUsingBlock:v75];
        [v58 setJaliscoHasCloudGeniusData:0];
        [v58 setJaliscoIsMusicGeniusUserEnabled:0];
      }
    }
    [v73 clearAllCloudKVSData];
    [v73 clearCachedPurchaseHistoryVersionsUsingConnection:v72];
  }
  id v74 = 0;
  int v59 = [v72 executeUpdate:@"UPDATE album SET liked_state=? WHERE NOT EXISTS (SELECT 1 FROM item WHERE in_my_library AND item.album_pid = album.album_pid)" withParameters:&unk_1F090EA58 error:&v74];
  id v60 = v74;
  v61 = v60;
  if (v59)
  {
    id v62 = v35;
  }
  else
  {
    id v62 = v60;

    v63 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v62;
      _os_log_impl(&dword_1B022D000, v63, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] failed to update liked_state on potentially orphaned albums, error=%{public}@", buf, 0xCu);
    }
  }
  [v73 clearCachedCloudLibraryVersionsUsingConnection:v72];
  v64 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v59;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v65 - v5;
    _os_log_impl(&dword_1B022D000, v64, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Remove cloud sources operation finished with success=%d in %.3f seconds, starting maintenance task", buf, 0x12u);
  }

  if (v59)
  {
    [v73 notifyEntitiesAddedOrRemoved];
    [v73 notifyContentsDidChange];
  }
  if (a3) {
    *a3 = v62;
  }

  return v59;
}

BOOL __43__ML3RemoveCloudSourcesOperation__execute___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [a2 int64ForColumnIndex:0];
  uint64_t v5 = *(void *)(a1 + 40);

  return +[ML3Entity incrementRevisionWithLibrary:v3 persistentID:v4 deletionType:0 revisionType:1 usingConnection:v5];
}

BOOL __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [a2 int64ForColumnIndex:0];
  uint64_t v5 = *(void *)(a1 + 40);

  return +[ML3Entity incrementRevisionWithLibrary:v3 persistentID:v4 deletionType:0 revisionType:1 usingConnection:v5];
}

void __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_42(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

void __43__ML3RemoveCloudSourcesOperation__execute___block_invoke_60(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = +[ML3Entity newWithPersistentID:a2 inLibrary:*(void *)(a1 + 32)];
  if ([v3 existsInLibrary])
  {
    [v3 deleteFromLibrary];
    uint64_t v4 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      uint64_t v6 = a2;
      _os_log_impl(&dword_1B022D000, v4, OS_LOG_TYPE_DEFAULT, "[ML3RemoveCloudSourcesOperation] Deleted active Genius playlist with pid: %lld", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ML3RemoveCloudSourcesOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v10, sel__verifyLibraryConnectionAndAttributesProperties_))return 0; {
  int v5 = [(ML3DatabaseOperation *)self attributes];
  }
  uint64_t v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeRemoveCloudSourcesKey"];

  uint64_t v7 = [v6 count];
  BOOL v8 = v7 != 0;
  if (a3 && !v7)
  {
    *a3 = +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"ML3RemoveCloudSourcesOperation requires a track source attribute"];
  }

  return v8;
}

- (unint64_t)type
{
  return 9;
}

@end