@interface ML3ITunesSyncImportOperation
- (BOOL)_performImportFromPlistFiles:(id)a3 withTransaction:(id)a4;
- (BOOL)_performImportOfTrackData:(id)a3 WithTransaction:(id)a4;
- (BOOL)_performImportWithTransaction:(id)a3;
- (BOOL)_processDeletePlaylistOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processDeleteTrackOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processInsertPlaylistOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processInsertTrackOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processUpdateDBInfoOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processUpdatePlaylistOperation:(id)a3 withImportSession:(void *)a4;
- (BOOL)_processUpdateTrackOperation:(id)a3 withImportSession:(void *)a4;
- (id)_dbInfoValuesForStep:(id)a3;
- (id)_syncOperationsFromPlistFile:(id)a3;
- (id)_syncPlistFilesFromDirectory:(id)a3;
- (unint64_t)importSource;
- (void)_archiveSyncPlistFiles;
- (void)_processGeniusConfigPlist:(id)a3;
- (void)_recoverExistingAsset:(id)a3 forTrackId:(int64_t)a4;
- (void)main;
@end

@implementation ML3ITunesSyncImportOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedPlaylists, 0);
  objc_storeStrong((id *)&self->_cachedSyncIDsToPIDsMap, 0);
  objc_storeStrong((id *)&self->_cachedPIDToLocationPropertyMap, 0);

  objc_storeStrong((id *)&self->_cachedPIDToFilePathMap, 0);
}

- (void)_archiveSyncPlistFiles
{
  v56[3] = *MEMORY[0x1E4F143B8];
  v42 = [MEMORY[0x1E4F28CB8] defaultManager];
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = MSVMediaLoggingDirectory();
  v56[0] = v3;
  v56[1] = @"SyncData";
  v56[2] = @"iTunes";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:3];
  v41 = [v2 fileURLWithPathComponents:v4];

  uint64_t v38 = 297;
  if (self->_resetSync)
  {
    [v42 removeItemAtURL:v41 error:0];
  }
  else
  {
    v43 = objc_opt_new();
    uint64_t v5 = *MEMORY[0x1E4F1C628];
    uint64_t v6 = *MEMORY[0x1E4F1C540];
    v55[0] = *MEMORY[0x1E4F1C628];
    v55[1] = v6;
    uint64_t v44 = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
    v8 = [v42 enumeratorAtURL:v41 includingPropertiesForKeys:v7 options:4 errorHandler:0];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v9);
          }
          v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "lastPathComponent", v38);
          char v15 = [v14 isEqualToString:@"Reset"];

          if ((v15 & 1) == 0)
          {
            id v46 = 0;
            int v16 = [v13 getResourceValue:&v46 forKey:v5 error:0];
            id v17 = v46;
            v18 = v17;
            if (v16 && [v17 BOOLValue])
            {
              id v45 = 0;
              int v19 = [v13 getResourceValue:&v45 forKey:v44 error:0];
              id v20 = v45;
              if (v19) {
                [v43 setObject:v13 forKey:v20];
              }
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v10);
    }

    if ((unint64_t)[v43 count] >= 4)
    {
      v21 = [v43 allKeys];
      v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_23633];

      for (unint64_t j = 3; objc_msgSend(v22, "count", v38) > j; ++j)
      {
        v24 = [v22 objectAtIndexedSubscript:j];
        v25 = [v43 objectForKeyedSubscript:v24];
        [v42 removeItemAtURL:v25 error:0];
      }
    }
  }
  objc_msgSend(v42, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v41, 1, 0, 0, v38);
  if (*((unsigned char *)&self->super.super.super.isa + v39))
  {
    v26 = @"Reset";
  }
  else
  {
    v27 = [MEMORY[0x1E4F1C9C8] date];
    v26 = [v27 description];
  }
  v28 = [(__CFString *)v26 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  v29 = (void *)MEMORY[0x1E4F1CB10];
  v30 = [v41 path];
  v53[0] = v30;
  v53[1] = v28;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v32 = [v29 fileURLWithPathComponents:v31];

  v33 = [MEMORY[0x1E4F1C9C8] date];
  v34 = [v32 path];
  [v42 copyItemAtPath:@"/var/mobile/Media/iTunes_Control/Sync/Media/" toPath:v34 error:0];

  uint64_t v35 = *MEMORY[0x1E4F28310];
  v51[0] = *MEMORY[0x1E4F282C0];
  v51[1] = v35;
  v52[0] = v33;
  v52[1] = v33;
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v37 = [v32 path];
  [v42 setAttributes:v36 ofItemAtPath:v37 error:0];
}

uint64_t __54__ML3ITunesSyncImportOperation__archiveSyncPlistFiles__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)_processGeniusConfigPlist:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 objectForKey:@"data"];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F1CA98] null];
    }
    id v9 = v7;

    uint64_t v10 = [v4 objectForKey:@"default_num_results"];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA98] null];
    }
    v13 = v12;

    v14 = [v4 objectForKey:@"min_num_results"];
    char v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1CA98] null];
    }
    id v17 = v16;

    v18 = [v4 objectForKey:@"version"];
    int v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F1CA98] null];
    }
    v21 = v20;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v41 = 0x2020000000;
    char v42 = 0;
    v22 = [(ML3ImportOperation *)self import];
    v23 = [v22 library];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__ML3ITunesSyncImportOperation__processGeniusConfigPlist___block_invoke;
    v32[3] = &unk_1E5FB7A28;
    p_long long buf = &buf;
    os_log_t v8 = v9;
    os_log_t v33 = v8;
    id v31 = v13;
    id v34 = v31;
    id v24 = v17;
    id v35 = v24;
    id v25 = v21;
    id v36 = v25;
    [v23 databaseConnectionAllowingWrites:1 withBlock:v32];

    LODWORD(v21) = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
    v26 = os_log_create("com.apple.amp.medialibrary", "Default");
    v27 = v26;
    if (v21)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v38 = 138543362;
        id v39 = v4;
        v28 = "Updated Genius configuration: %{public}@";
        v29 = v27;
        os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
LABEL_21:
        _os_log_impl(&dword_1B022D000, v29, v30, v28, v38, 0xCu);
      }
    }
    else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v38 = 138543362;
      id v39 = v4;
      v28 = "Failed to update Genius configuration: %{public}@";
      v29 = v27;
      os_log_type_t v30 = OS_LOG_TYPE_ERROR;
      goto LABEL_21;
    }

    _Block_object_dispose(&buf, 8);
    goto LABEL_23;
  }
  os_log_t v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_ERROR, "No valid genius_config found in: %{public}@", (uint8_t *)&buf, 0xCu);
  }
LABEL_23:
}

void __58__ML3ITunesSyncImportOperation__processGeniusConfigPlist___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v5 count:4];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v3 executeUpdate:@"INSERT OR REPLACE INTO genius_config (id, data, default_num_results, min_num_results, version) VALUES (0,?,?,?,?)", v4, 0 withParameters error];
}

- (id)_dbInfoValuesForStep:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKey:@"pid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [v6 setValue:v5 forKey:@"ROWID"];
    uint64_t v7 = [v4 objectForKey:@"db_info"];
    v19[0] = @"audio_language";
    v19[1] = @"subtitle_language";
    v20[0] = @"audio_language";
    v20[1] = @"subtitle_language";
    v19[2] = @"genius_cuid";
    v20[2] = @"genius_cuid";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
    os_log_t v9 = v7;
    id v10 = v6;
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v22 = ___ZL23TranslateDictionaryKeysP12NSDictionaryS0_P19NSMutableDictionary_block_invoke;
    v23 = &unk_1E5FB7A70;
    os_log_t v24 = v9;
    id v25 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:&buf];

    uint64_t v11 = [v9 objectForKeyedSubscript:@"primary_container_pid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v10 setObject:v11 forKey:@"primary_container_pid"];
    }
    uint64_t v12 = [v9 objectForKeyedSubscript:@"genius_config"];

    v13 = (void *)v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ML3ITunesSyncImportOperation *)self _processGeniusConfigPlist:v12];
    }
    else
    {
      v14 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_1B022D000, v14, OS_LOG_TYPE_ERROR, "Unexpected genius config format: %{public}@", (uint8_t *)&buf, 0xCu);
      }
    }
    char v15 = [v9 objectForKeyedSubscript:@"apple_ids"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __53__ML3ITunesSyncImportOperation__dbInfoValuesForStep___block_invoke;
      v18[3] = &unk_1E5FB7A00;
      v18[4] = self;
      [v15 enumerateKeysAndObjectsUsingBlock:v18];
    }
    else
    {
      id v16 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v15;
        _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "Unexpected AppleID config format: %@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else
  {
    os_log_t v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1B022D000, v9, OS_LOG_TYPE_ERROR, "Got update_db_info with invalid pid: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

void __53__ML3ITunesSyncImportOperation__dbInfoValuesForStep___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = [*(id *)(a1 + 32) import];
    uint64_t v8 = [v7 library];
    os_log_t v9 = [v8 accountCacheDatabase];
    objc_msgSend(v9, "setAppleID:forDSID:", v6, objc_msgSend(v5, "longLongValue"));
  }
  else
  {
    id v10 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = (id)objc_opt_class();
      int v13 = 138543618;
      id v14 = v11;
      __int16 v15 = 2114;
      id v16 = (id)objc_opt_class();
      id v12 = v16;
      _os_log_impl(&dword_1B022D000, v10, OS_LOG_TYPE_ERROR, "Unexpected DSID/AppleID pair format: %{public}@/%{public}@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_recoverExistingAsset:(id)a3 forTrackId:(int64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = +[ML3MusicLibrary mediaFolderPathByAppendingPathComponent:v6];
  if (([v7 fileExistsAtPath:v8] & 1) == 0)
  {
    os_log_t v9 = [(ML3ImportOperation *)self import];
    id v10 = [v9 library];
    id v11 = +[ML3ComparisonPredicate predicateWithProperty:@"ROWID" equalToInt64:a4];
    id v12 = +[ML3Entity anyInLibrary:v10 predicate:v11 options:7];

    if (v12)
    {
      int v13 = [v12 absoluteFilePath];
      int v14 = [v7 fileExistsAtPath:v13];
      __int16 v15 = os_log_create("com.apple.amp.medialibrary", "Default");
      id v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 134218498;
          int64_t v22 = a4;
          __int16 v23 = 2114;
          os_log_t v24 = v13;
          __int16 v25 = 2114;
          uint64_t v26 = v8;
          _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_DEFAULT, "Asset path differs for pid %lld. ours=%{public}@, theirs=%{public}@", buf, 0x20u);
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218242;
          int64_t v22 = a4;
          __int16 v23 = 2114;
          os_log_t v24 = v6;
          _os_log_impl(&dword_1B022D000, v16, OS_LOG_TYPE_ERROR, "No longer have asset for pid %lld. filePath=%{public}@", buf, 0x16u);
        }

        id v16 = [(ML3ImportOperation *)self import];
        uint64_t v17 = [v16 library];
        v18 = [NSNumber numberWithLongLong:a4];
        id v20 = v18;
        int v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
        +[ML3Track clearLocationFromLibrary:v17 persistentIDs:v19 disableKeepLocal:0];
      }
    }
    else
    {
      int v13 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 134217984;
        int64_t v22 = a4;
        _os_log_impl(&dword_1B022D000, v13, OS_LOG_TYPE_ERROR, "recoverExistingAsset called with unknown track pid %lld", buf, 0xCu);
      }
    }
  }
}

- (BOOL)_processDeletePlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  id v5 = a3;
  if (!self->_sagaIsEnabled) {
    operator new();
  }

  return 1;
}

- (BOOL)_processUpdatePlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  id v5 = a3;
  if (!self->_sagaIsEnabled)
  {
    if (self->_devicePrimaryContainer)
    {
      id v6 = [v5 objectForKey:@"pid"];
      [v6 longLongValue];
    }
    operator new();
  }

  return 1;
}

- (BOOL)_processInsertPlaylistOperation:(id)a3 withImportSession:(void *)a4
{
  id v5 = a3;
  if (!self->_sagaIsEnabled)
  {
    if (self->_devicePrimaryContainer)
    {
      id v6 = [v5 objectForKey:@"pid"];
      [v6 longLongValue];
    }
    operator new();
  }

  return 1;
}

void __82__ML3ITunesSyncImportOperation__processInsertPlaylistOperation_withImportSession___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [ML3Container alloc];
  id v5 = [*(id *)(a1 + 32) import];
  id v6 = [v5 library];
  uint64_t v7 = [(ML3Entity *)v4 initWithPersistentID:a2 inLibrary:v6];

  [(ML3Entity *)v7 setValue:&unk_1F0912460 forProperty:@"is_container_type_active_target"];
}

- (BOOL)_processUpdateDBInfoOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(ML3ITunesSyncImportOperation *)self _dbInfoValuesForStep:v5];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKey:@"ROWID"];
    uint64_t v9 = [v8 longLongValue];
    id v10 = [(ML3ImportOperation *)self import];
    id v11 = [v10 library];
    id v12 = [v11 databaseInfo];

    if (![v12 existsInLibrary] || objc_msgSend(v12, "persistentID") != v9)
    {
      int v13 = [(ML3ImportOperation *)self import];
      int v14 = [v13 library];
      __int16 v15 = +[ML3Entity queryWithLibrary:v14 predicate:0];
      [v15 deleteAllEntitiesFromLibrary];

      id v16 = [(ML3ImportOperation *)self import];
      uint64_t v17 = [v16 library];
      id v18 = +[ML3Entity newWithDictionary:v7 inLibrary:v17 cachedNameOrders:0];

      id v12 = v18;
    }
    int v19 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      uint64_t v32 = (uint64_t)v7;
      _os_log_impl(&dword_1B022D000, v19, OS_LOG_TYPE_DEFAULT, "DBInfo values: %{public}@", buf, 0xCu);
    }

    BOOL v20 = v12 != 0;
    if (v12)
    {
      uint64_t v21 = [v7 count];
      uint64_t v22 = v21;
      if (v21)
      {
        uint64_t v23 = 8 * v21;
        MEMORY[0x1F4188790](v21);
        os_log_t v24 = &buf[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
        bzero(v24, 8 * v22);
        MEMORY[0x1F4188790](v25);
        bzero(v24, 8 * v22);
        [v7 getObjects:v24 andKeys:v24 count:v22];
        [v12 setValues:v24 forProperties:v24 count:v22];
      }
      uint64_t v26 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)long long buf = 138543362;
      uint64_t v32 = (uint64_t)v12;
      uint64_t v27 = "Updated dbInfo: %{public}@";
      v28 = v26;
      os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    }
    else
    {
      uint64_t v26 = os_log_create("com.apple.amp.medialibrary", "Default");
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
LABEL_16:

        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 134217984;
      uint64_t v32 = v9;
      uint64_t v27 = "Could not update dbInfo: %lld";
      v28 = v26;
      os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    }
    _os_log_impl(&dword_1B022D000, v28, v29, v27, buf, 0xCu);
    goto LABEL_16;
  }
  BOOL v20 = 0;
LABEL_17:

  return v20;
}

- (BOOL)_processDeleteTrackOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"pid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    operator new();
  }
  id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    *(void *)uint64_t v9 = v5;
    _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_ERROR, "Got delete_track for with invalid pid: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return 0;
}

- (BOOL)_processUpdateTrackOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _os_feature_enabled_impl();
  operator new();
}

- (BOOL)_processInsertTrackOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _os_feature_enabled_impl();
  operator new();
}

- (BOOL)_processSyncOperation:(id)a3 withImportSession:(void *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "_processSyncOperation %{public}@", (uint8_t *)&v13, 0xCu);
  }

  int v8 = [v6 objectForKey:@"operation"];
  if ([v8 isEqualToString:@"insert_track"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processInsertTrackOperation:v6 withImportSession:a4];
LABEL_17:
    BOOL v10 = v9;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"update_track"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processUpdateTrackOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"delete_track"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processDeleteTrackOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"insert_playlist"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processInsertPlaylistOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"update_playlist"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processUpdatePlaylistOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"delete_playlist"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processDeletePlaylistOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  if ([v8 isEqualToString:@"update_db_info"])
  {
    BOOL v9 = [(ML3ITunesSyncImportOperation *)self _processUpdateDBInfoOperation:v6 withImportSession:a4];
    goto LABEL_17;
  }
  id v12 = _ML3LogCategoryDefault();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, "got unhandled sync operation %{public}@", (uint8_t *)&v13, 0xCu);
  }

  BOOL v10 = 1;
LABEL_18:

  return v10;
}

- (id)_syncOperationsFromPlistFile:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:0];
  }
  else
  {
    id v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKey:@"operations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v6;
      uint64_t v7 = v6;
      goto LABEL_13;
    }
    int v8 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1B022D000, v8, OS_LOG_TYPE_DEFAULT, "No operations in %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v3;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Invalid sync plist at %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v7 = 0;
LABEL_13:

  return v7;
}

- (id)_syncPlistFilesFromDirectory:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F28CB8] defaultManager];
  v13 = id v20 = 0;
  id v5 = [v13 contentsOfDirectoryAtPath:v3 error:&v20];
  id v14 = v5;
  id v15 = v20;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    os_log_t v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v6);
          }
          int v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v11 = [v3 stringByAppendingPathComponent:v10];
          if ([v10 hasPrefix:@"Sync_"]
            && [v10 hasSuffix:@".plist"])
          {
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v25 count:16];
      }
      while (v7);
    }
  }
  else
  {
    os_log_t v6 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543618;
      id v22 = v3;
      __int16 v23 = 2114;
      id v24 = v15;
      _os_log_impl(&dword_1B022D000, v6, OS_LOG_TYPE_DEFAULT, "Could not read %{public}@: %{public}@", buf, 0x16u);
    }
  }

  [v4 sortUsingSelector:sel_compare_];

  return v4;
}

- (BOOL)_performImportFromPlistFiles:(id)a3 withTransaction:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v12 = a4;
  os_log_t v6 = [(ML3ImportOperation *)self import];
  int v10 = [v6 library];

  uint64_t v7 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v15 = v13;
    _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_DEFAULT, "processing plist files: %{public}@", buf, 0xCu);
  }

  [v13 count];
  objc_msgSend(v12, "connection", v10);
  uint64_t v8 = (ML3DatabaseConnection *)objc_claimAutoreleasedReturnValue();
  ML3ImportSession::ML3ImportSession((ML3ImportSession *)buf, v11, v8, 3, 1);
}

void __77__ML3ITunesSyncImportOperation__performImportFromPlistFiles_withTransaction___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) currentRevision];
    id v4 = [*(id *)(a1 + 40) import];
    id v7 = [v4 syncAnchor];

    id v5 = *(void **)(a1 + 32);
    os_log_t v6 = [NSNumber numberWithLongLong:v3];
    [v5 setValue:v6 forDatabaseProperty:@"MLSyncClientLastSyncedRevision"];

    [*(id *)(a1 + 32) setValue:v7 forDatabaseProperty:@"MLSyncClientSyncAnchor"];
    [*(id *)(a1 + 32) setSyncGenerationID:ML3CreateIntegerUUID()];
  }
}

- (BOOL)_performImportOfTrackData:(id)a3 WithTransaction:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v26 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v6 options:0 format:0 error:&v26];
  id v21 = v26;
  if (!v8)
  {
    id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 138543362;
      id v29 = v21;
      id v13 = "failed to deserialize track data. err=%{public}@";
LABEL_18:
      _os_log_impl(&dword_1B022D000, v12, OS_LOG_TYPE_ERROR, v13, v28, 0xCu);
    }
LABEL_19:
    BOOL v19 = 0;
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    [(ML3ImportOperation *)self import];
    int v10 = [(id)objc_claimAutoreleasedReturnValue() library];
    id v11 = [v7 connection];
    ML3ImportSession::ML3ImportSession((ML3ImportSession *)v28, v10, v11, 3, 1);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v28 = 138543362;
      id v29 = v8;
      id v13 = "unsupported import data. importData=%{public}@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v12 = v8;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [(ML3ITunesSyncImportOperation *)self _syncPlistFilesFromDirectory:*(void *)(*((void *)&v22 + 1) + 8 * i)];
        BOOL v18 = [(ML3ITunesSyncImportOperation *)self _performImportFromPlistFiles:v17 withTransaction:v7];

        if (!v18)
        {
          BOOL v19 = 0;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v19 = 1;
LABEL_21:

LABEL_22:
  return v19;
}

- (BOOL)_performImportWithTransaction:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ML3ImportOperation *)self import];
  self->_sagaIsEnabled = [v5 isSagaEnabled];

  id v6 = [(ML3ImportOperation *)self import];
  self->_resetSync = [v6 isResetSync];

  id v7 = [(ML3ImportOperation *)self import];
  uint64_t v8 = [v7 library];
  id v9 = [v8 databaseInfo];
  int v10 = [v9 valueForProperty:@"primary_container_pid"];
  self->_devicePrimaryContainer = [v10 longLongValue];

  id v11 = [(ML3ImportOperation *)self import];
  id v12 = [v11 trackData];
  uint64_t v13 = [v12 length];

  if (!v13)
  {
    if (MSVDeviceOSIsInternalInstall()) {
      [(ML3ITunesSyncImportOperation *)self _archiveSyncPlistFiles];
    }
    id v21 = [(ML3ITunesSyncImportOperation *)self _syncPlistFilesFromDirectory:@"/var/mobile/Media/iTunes_Control/Sync/Media/"];
    BOOL v22 = [(ML3ITunesSyncImportOperation *)self _performImportFromPlistFiles:v21 withTransaction:v4];

    if (v22) {
      goto LABEL_3;
    }
LABEL_7:
    BOOL v20 = 0;
    goto LABEL_8;
  }
  uint64_t v14 = [(ML3ImportOperation *)self import];
  uint64_t v15 = [v14 trackData];
  BOOL v16 = [(ML3ITunesSyncImportOperation *)self _performImportOfTrackData:v15 WithTransaction:v4];

  if (!v16) {
    goto LABEL_7;
  }
LABEL_3:
  long long v24 = @"modified_playlist_pids";
  long long v17 = [(NSMutableSet *)self->_importedPlaylists allObjects];
  v25[0] = v17;
  BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];

  BOOL v19 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v18 requiringSecureCoding:1 error:0];
  [(ML3ImportOperation *)self setReturnData:v19];

  BOOL v20 = 1;
LABEL_8:

  return v20;
}

- (void)main
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  BOOL v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cachedPIDToFilePathMap = self->_cachedPIDToFilePathMap;
  self->_cachedPIDToFilePathMap = v3;

  id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cachedPIDToLocationPropertyMap = self->_cachedPIDToLocationPropertyMap;
  self->_cachedPIDToLocationPropertyMap = v5;

  id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  importedPlaylists = self->_importedPlaylists;
  self->_importedPlaylists = v7;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9;
  if (*((unsigned char *)v18 + 24) && ([(ML3ITunesSyncImportOperation *)self isCancelled] & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __36__ML3ITunesSyncImportOperation_main__block_invoke;
    v16[3] = &unk_1E5FB81E0;
    v16[4] = self;
    v16[5] = &v17;
    [(ML3ImportOperation *)self _writerTransactionWithBlock:v16];
  }
  id v11 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [(ML3ITunesSyncImportOperation *)self isCancelled];
    int v13 = *((unsigned __int8 *)v18 + 24);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *(_DWORD *)long long buf = 67109632;
    int v22 = v12;
    __int16 v23 = 1024;
    int v24 = v13;
    __int16 v25 = 2048;
    double v26 = v14 - v10;
    _os_log_impl(&dword_1B022D000, v11, OS_LOG_TYPE_DEFAULT, "[ML3ITunesSyncImportOperation] import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((unsigned char *)v18 + 24)) {
    uint64_t v15 = [(ML3ITunesSyncImportOperation *)self isCancelled] ^ 1;
  }
  else {
    uint64_t v15 = 0;
  }
  [(ML3ImportOperation *)self setSuccess:v15];
  _Block_object_dispose(&v17, 8);
}

uint64_t __36__ML3ITunesSyncImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1B022D000, v7, OS_LOG_TYPE_ERROR, "[ML3ITunesSyncImportOperation] failed to start transaction. error=%{public}@", (uint8_t *)&v10, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    [*(id *)(a1 + 32) setError:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _performImportWithTransaction:v5];
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v8 = [*(id *)(a1 + 32) isCancelled] ^ 1;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)importSource
{
  return 5;
}

@end