@interface ML3RemovePlaylistsOperation
- (BOOL)_execute:(id *)a3;
- (BOOL)_removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingTransaction:(id)a5;
- (BOOL)_removeRemotePlaylistsWithNoSourceUsingTransation:(id)a3;
- (BOOL)_removeSource:(int)a3 usingTransaction:(id)a4;
- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3;
- (unint64_t)type;
@end

@implementation ML3RemovePlaylistsOperation

- (BOOL)_removeRemotePlaylistsWithNoSourceUsingTransation:(id)a3
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 connection];
  v5 = [v3 library];

  v6 = +[ML3ComparisonPredicate predicateWithProperty:@"is_src_remote" equalToInteger:1];
  v30[0] = v6;
  v7 = +[ML3ComparisonPredicate predicateWithProperty:@"sync_id" equalToInt64:0];
  v30[1] = v7;
  v8 = +[ML3ComparisonPredicate predicateWithProperty:@"cloud_global_id" equalToInt64:0];
  v30[2] = v8;
  v9 = +[ML3ComparisonPredicate predicateWithProperty:@"store_cloud_id" equalToInt64:0];
  v30[3] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  v11 = +[ML3CompoundPredicate predicateMatchingPredicates:v10];

  v12 = +[ML3Entity unrestrictedAllItemsQueryWithlibrary:v5 predicate:v11 orderingTerms:MEMORY[0x1E4F1CBF0]];
  v13 = [MEMORY[0x1E4F1CA48] array];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __81__ML3RemovePlaylistsOperation__removeRemotePlaylistsWithNoSourceUsingTransation___block_invoke;
  v24[3] = &unk_1E5FB7EE0;
  id v14 = v13;
  id v25 = v14;
  [v12 enumeratePersistentIDsUsingBlock:v24];
  v15 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [v14 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v27 = v16;
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_impl(&dword_1B022D000, v15, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] removing %lu containers that no longer have a remote source. container_pids=%{public}@", buf, 0x16u);
  }

  v17 = +[ML3DatabaseStatementRenderer defaultRenderer];
  v18 = objc_msgSend(v17, "statementWithPrefix:inParameterCount:", @"DELETE FROM container WHERE container_pid", objc_msgSend(v14, "count"));
  id v23 = 0;
  char v19 = [v4 executeUpdate:v18 withParameters:v14 error:&v23];
  id v20 = v23;

  if ((v19 & 1) == 0)
  {
    v21 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = (uint64_t)v20;
      _os_log_impl(&dword_1B022D000, v21, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove sourceless containers. err=%{public}@", buf, 0xCu);
    }
  }
  return v19;
}

void __81__ML3RemovePlaylistsOperation__removeRemotePlaylistsWithNoSourceUsingTransation___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithLongLong:a2];
  [v2 addObject:v3];
}

- (BOOL)_removePlaylistsWithPersistentIDs:(id)a3 fromSource:(int)a4 usingTransaction:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v8 = a3;
  id v9 = a5;
  v10 = [v9 connection];
  if (v6)
  {
    v11 = ML3ContainerRulesRemovalSourceIdentityPropertyForSource(v6);
    v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v11;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing source property %{public}@ from container pids %{public}@", buf, 0x16u);
    }

    v13 = [NSString stringWithFormat:@"UPDATE container set %@=0 WHERE container_pid", v11];
    id v14 = +[ML3DatabaseStatementRenderer defaultRenderer];
    v15 = objc_msgSend(v14, "statementWithPrefix:inParameterCount:", v13, -[NSObject count](v8, "count"));
    id v24 = 0;
    char v16 = [v10 executeUpdate:v15 withParameters:v8 error:&v24];
    v17 = v24;

    if (v16)
    {
      BOOL v18 = [(ML3RemovePlaylistsOperation *)self _removeRemotePlaylistsWithNoSourceUsingTransation:v9];
    }
    else
    {
      v22 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v27 = v11;
        __int16 v28 = 2114;
        id v29 = v17;
        _os_log_impl(&dword_1B022D000, v22, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove source %{public}@ from containers. err=%{public}@", buf, 0x16u);
      }

      BOOL v18 = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  char v19 = +[ML3DatabaseStatementRenderer defaultRenderer];
  id v20 = objc_msgSend(v19, "statementWithPrefix:inParameterCount:", @"DELETE FROM container WHERE container_pid", -[NSObject count](v8, "count"));
  id v25 = 0;
  char v21 = [v10 executeUpdate:v20 withParameters:v8 error:&v25];
  v17 = v25;

  if ((v21 & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v27 = v17;
      _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove containers. err=%{public}@", buf, 0xCu);
    }
    BOOL v18 = 0;
    goto LABEL_15;
  }
  BOOL v18 = 1;
LABEL_16:

  return v18;
}

- (BOOL)_removeSource:(int)a3 usingTransaction:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 connection];
  v8 = [v6 library];
  if (v4)
  {
    id v9 = ML3ContainerRulesRemovalSourceIdentityPropertyForSource(v4);
    v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v8 databasePath];
      *(_DWORD *)buf = 138543618;
      id v24 = v9;
      __int16 v25 = 2114;
      v26 = v11;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing source property %{public}@ from all containers in library at path %{public}@", buf, 0x16u);
    }
    v12 = [NSString stringWithFormat:@"UPDATE container set %@=0", v9];
    id v21 = 0;
    char v13 = [v7 executeUpdate:v12 withParameters:0 error:&v21];
    id v14 = v21;
    if (v13)
    {
      BOOL v15 = [(ML3RemovePlaylistsOperation *)self _removeRemotePlaylistsWithNoSourceUsingTransation:v6];
    }
    else
    {
      char v19 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v24 = v9;
        __int16 v25 = 2114;
        v26 = v14;
        _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove source %{public}@ from containers. err=%{public}@", buf, 0x16u);
      }

      BOOL v15 = 0;
    }

LABEL_17:
    goto LABEL_18;
  }
  char v16 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [v8 databasePath];
    *(_DWORD *)buf = 138543362;
    id v24 = v17;
    _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Removing all containers from library at path %{public}@", buf, 0xCu);
  }
  id v22 = 0;
  char v18 = [v7 executeUpdate:@"DELETE FROM container" withParameters:0 error:&v22];
  id v14 = v22;
  if ((v18 & 1) == 0)
  {
    id v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v14;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] failed to remove all containers. err=%{public}@", buf, 0xCu);
    }
    BOOL v15 = 0;
    goto LABEL_17;
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (BOOL)_verifyLibraryConnectionAndAttributesProperties:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ML3RemovePlaylistsOperation;
  if (!-[ML3DatabaseOperation _verifyLibraryConnectionAndAttributesProperties:](&v9, sel__verifyLibraryConnectionAndAttributesProperties_))return 0; {
  v5 = [(ML3DatabaseOperation *)self attributes];
  }
  id v6 = [v5 objectForKey:@"MLDatabaseOperationAttributeTrackSourceKey"];
  BOOL v7 = v6 != 0;

  if (a3 && !v6)
  {
    +[ML3MediaLibraryWriter writerErrorWithCode:500 description:@"ML3RemovePlaylistsOperation requires a track source attribute"];
    BOOL v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (BOOL)_execute:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v5 = [(ML3DatabaseOperation *)self transaction];
  id v6 = [(ML3DatabaseOperation *)self attributes];
  BOOL v7 = [v6 objectForKey:@"MLDatabaseOperationAttributeTrackSourceKey"];
  uint64_t v8 = [v7 intValue];

  objc_super v9 = [(ML3DatabaseOperation *)self attributes];
  v10 = [v9 objectForKey:@"MLDatabaseOperationAttributePersistentIDsArrayKey"];

  v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109376;
    int v21 = v8;
    __int16 v22 = 2048;
    double v23 = COERCE_DOUBLE([v10 count]);
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Beginning remove playlists operation with source %d (%lu specified playlists)", (uint8_t *)&v20, 0x12u);
  }

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v13 = v12;
  if ([v10 count]) {
    BOOL v14 = [(ML3RemovePlaylistsOperation *)self _removePlaylistsWithPersistentIDs:v10 fromSource:v8 usingTransaction:v5];
  }
  else {
    BOOL v14 = [(ML3RemovePlaylistsOperation *)self _removeSource:v8 usingTransaction:v5];
  }
  BOOL v15 = v14;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v17 = v16;
  char v18 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 67109376;
    int v21 = v15;
    __int16 v22 = 2048;
    double v23 = v17 - v13;
    _os_log_impl(&dword_1B022D000, v18, OS_LOG_TYPE_DEFAULT, "[ML3RemovePlaylistsOperation] Remove playlists operation success=%d in %.3f seconds", (uint8_t *)&v20, 0x12u);
  }

  if (a3) {
    *a3 = 0;
  }

  return v15;
}

- (unint64_t)type
{
  return 6;
}

@end