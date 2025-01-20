@interface UAFAutoAssetHistory
+ (BOOL)_createHistoryDirIfNeeded:(id)a3 error:(id *)a4;
+ (BOOL)_persistAssetSetInfo:(id)a3 assetSetIdentifier:(id)a4 isEliminating:(BOOL)a5 jsonData:(id)a6 error:(id *)a7;
+ (BOOL)_writeAssetInfoToFile:(id)a3 data:(id)a4 filePath:(id)a5 error:(id *)a6;
+ (id)_getAutoAssetSetInfo:(id)a3 entries:(id)a4 includeAssetVersion:(BOOL)a5;
+ (id)_getPersistAssetInfoPath;
+ (id)getPersistedAssetInfo;
+ (void)persistAssetSetInfoConfiguring:(id)a3 entries:(id)a4 isEliminating:(BOOL)a5 reason:(id)a6;
+ (void)persistAssetSetInfoLocked:(id)a3 atomicEntries:(id)a4 autoAssetSet:(id)a5 isEliminating:(BOOL)a6 reason:(id)a7;
@end

@implementation UAFAutoAssetHistory

+ (id)_getAutoAssetSetInfo:(id)a3 entries:(id)a4 includeAssetVersion:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = 0x263EFF000uLL;
  v10 = [MEMORY[0x263EFF9A0] dictionary];
  v11 = [v7 assetSetIdentifier];
  v32 = v10;
  v33 = v7;
  if (v11)
  {
    v12 = [v7 assetSetIdentifier];
    [v10 setObject:v12 forKeyedSubscript:@"assetSetIdentifier"];
  }
  else
  {
    [v10 setObject:&stru_26EA999B8 forKeyedSubscript:@"assetSetIdentifier"];
  }

  v13 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v37 = *(void *)v39;
    BOOL v34 = v5;
    do
    {
      uint64_t v16 = 0;
      uint64_t v35 = v15;
      do
      {
        if (*(void *)v39 != v37) {
          objc_enumerationMutation(obj);
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
        v18 = objc_msgSend(*(id *)(v9 + 2464), "dictionary", v32, v33);
        v19 = [v17 assetSelector];
        v20 = [v19 assetSpecifier];

        if (v20)
        {
          v21 = [v17 assetSelector];
          v22 = [v21 assetSpecifier];

          if (!v5) {
            goto LABEL_14;
          }
        }
        else
        {
          v22 = &stru_26EA999B8;
          if (!v5)
          {
LABEL_14:
            [v18 setObject:v22 forKeyedSubscript:@"assetSpecifier"];
            goto LABEL_20;
          }
        }
        v23 = [*(id *)(v9 + 2464) dictionary];
        [v23 setObject:v22 forKeyedSubscript:@"assetSpecifier"];
        v24 = [v17 assetSelector];
        v25 = [v24 assetVersion];
        if (v25)
        {
          v26 = [v17 assetSelector];
          [v26 assetVersion];
          v28 = v27 = v13;
          [v23 setObject:v28 forKeyedSubscript:@"assetVersion"];

          v13 = v27;
          BOOL v5 = v34;
          unint64_t v9 = 0x263EFF000;
        }
        else
        {
          [v23 setObject:&stru_26EA999B8 forKeyedSubscript:@"assetVersion"];
        }

        if (v23) {
          v29 = v23;
        }
        else {
          v29 = &unk_26EAA1128;
        }
        [v18 setObject:v29 forKeyedSubscript:@"assetSelector"];

        uint64_t v15 = v35;
LABEL_20:
        if ([v17 assetLockedInhibitsRemoval])
        {
          v30 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v17, "assetLockedInhibitsRemoval"));
          [v18 setObject:v30 forKeyedSubscript:@"assetLockedInhibitsRemoval"];
        }
        [v13 addObject:v18];

        ++v16;
      }
      while (v15 != v16);
      uint64_t v15 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v15);
  }

  if ([v13 count]) {
    [v32 setObject:v13 forKeyedSubscript:@"autoAssetEntries"];
  }

  return v32;
}

+ (id)_getPersistAssetInfoPath
{
  v7[2] = *MEMORY[0x263EF8340];
  v2 = NSString;
  v3 = +[UAFCommonUtilities getDefaultStoragePath];
  v7[0] = v3;
  v7[1] = @"history";
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];
  BOOL v5 = [v2 pathWithComponents:v4];

  return v5;
}

+ (id)getPersistedAssetInfo
{
  v41[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08850] defaultManager];
  v3 = [MEMORY[0x263EFF980] array];
  v4 = +[UAFAutoAssetHistory _getPersistAssetInfoPath];
  if ([v2 fileExistsAtPath:v4])
  {
    v24 = v4;
    [NSURL fileURLWithPath:v4];
    id v36 = 0;
    uint64_t v23 = v25 = v2;
    BOOL v5 = objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:");
    id v6 = v36;
    v28 = [NSString stringWithFormat:@".%@.%@", @"cur", @"json"];
    v26 = [NSString stringWithFormat:@".%@.%@", @"prev", @"json"];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v29 = *(void *)v33;
      unint64_t v9 = v3;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v29) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v12 = [v11 lastPathComponent];
          if (v12)
          {
            v13 = v12;
            if ([(__CFString *)v12 hasSuffix:v28])
            {
              uint64_t v14 = @"cur";
            }
            else if ([(__CFString *)v13 hasSuffix:v26])
            {
              uint64_t v14 = @"prev";
            }
            else
            {
              uint64_t v14 = @"unknown";
            }
          }
          else
          {
            uint64_t v14 = @"unknown";
            v13 = @"unknown";
          }
          id v31 = v6;
          uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v11 options:2 error:&v31];
          uint64_t v16 = (__CFString *)v31;

          if (v16 || !v15)
          {
            v19 = @"unknown error";
            if (v16) {
              v19 = v16;
            }
            v17 = [NSString stringWithFormat:@"failed to get data from persisted info URL '%@', err = '%@'", v11, v19];
            id v6 = v16;
          }
          else
          {
            id v30 = 0;
            v17 = [MEMORY[0x263F08900] JSONObjectWithData:v15 options:0 error:&v30];
            id v6 = v30;
            if (v6)
            {
              uint64_t v18 = [NSString stringWithFormat:@"failed to parse data from persisted info URL '%@', err = '%@'", v11, v6];

              v17 = (void *)v18;
            }
          }
          v3 = v9;
          v37[0] = @"assetSetInfo";
          v37[1] = @"filename";
          v38[0] = v17;
          v38[1] = v13;
          v37[2] = @"history";
          v38[2] = v14;
          v20 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:3];
          [v9 addObject:v20];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v39 count:16];
      }
      while (v8);
    }

    v4 = v24;
    v2 = v25;
    v21 = (void *)v23;
  }
  else
  {
    long long v40 = @"error";
    id v6 = [NSString stringWithFormat:@"no info available, topdir '%@' does not exist", v4];
    v41[0] = v6;
    v21 = [NSDictionary dictionaryWithObjects:v41 forKeys:&v40 count:1];
    [v3 addObject:v21];
  }

  return v3;
}

+ (BOOL)_createHistoryDirIfNeeded:(id)a3 error:(id *)a4
{
  v35[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  char v21 = 0;
  if (![v6 fileExistsAtPath:v5 isDirectory:&v21])
  {
    uint64_t v26 = *MEMORY[0x263F08078];
    uint64_t v8 = [NSNumber numberWithShort:448];
    v27 = v8;
    BOOL v7 = 1;
    unint64_t v9 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    char v10 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:v9 error:a4];

    if (v10) {
      goto LABEL_22;
    }
    if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a4)
      {
        v24[0] = *MEMORY[0x263F08320];
        v13 = [NSString stringWithFormat:@"failed to create UAF history directory path at '%@'", v5];
        v24[1] = *MEMORY[0x263F08608];
        v25[0] = v13;
        v25[1] = *a4;
        uint64_t v14 = NSDictionary;
        uint64_t v15 = (NSObject **)v25;
        uint64_t v16 = v24;
LABEL_11:
        uint64_t v17 = 2;
LABEL_20:
        v19 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
        *a4 = [v11 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v12 userInfo:v19];

        goto LABEL_21;
      }
      uint64_t v22 = *MEMORY[0x263F08320];
      v13 = [NSString stringWithFormat:@"failed to create UAF history directory path at '%@'", v5];
      uint64_t v23 = v13;
      uint64_t v14 = NSDictionary;
      uint64_t v15 = &v23;
      uint64_t v16 = &v22;
LABEL_19:
      uint64_t v17 = 1;
      goto LABEL_20;
    }
    v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "+[UAFAutoAssetHistory _createHistoryDirIfNeeded:error:]";
      __int16 v30 = 2112;
      id v31 = v5;
      uint64_t v18 = "%s failed to create UAF history directory path at '%@'";
LABEL_16:
      _os_log_error_impl(&dword_23797A000, v13, OS_LOG_TYPE_ERROR, v18, buf, 0x16u);
    }
LABEL_21:

    BOOL v7 = 0;
    goto LABEL_22;
  }
  if (!v21)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x263F087E8];
      uint64_t v12 = UAFErrorCodeAssetHistoryPathExistsIsNotDir;
      if (*a4)
      {
        v34[0] = *MEMORY[0x263F08320];
        v13 = [NSString stringWithFormat:@"UAF history directory path exists but is not a directory, not preserving info, path is '%@'", v5];
        v35[0] = v13;
        v34[1] = *MEMORY[0x263F08608];
        v35[1] = *a4;
        uint64_t v14 = NSDictionary;
        uint64_t v15 = (NSObject **)v35;
        uint64_t v16 = v34;
        goto LABEL_11;
      }
      uint64_t v32 = *MEMORY[0x263F08320];
      v13 = [NSString stringWithFormat:@"UAF history directory path exists but is not a directory, not preserving info, path is '%@'", v5];
      long long v33 = v13;
      uint64_t v14 = NSDictionary;
      uint64_t v15 = &v33;
      uint64_t v16 = &v32;
      goto LABEL_19;
    }
    v13 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v29 = "+[UAFAutoAssetHistory _createHistoryDirIfNeeded:error:]";
      __int16 v30 = 2112;
      id v31 = v5;
      uint64_t v18 = "%s UAF history directory path exists but is not a directory, not preserving info, path is '%@'";
      goto LABEL_16;
    }
    goto LABEL_21;
  }
  BOOL v7 = 1;
LABEL_22:

  return v7;
}

+ (BOOL)_writeAssetInfoToFile:(id)a3 data:(id)a4 filePath:(id)a5 error:(id *)a6
{
  v45[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[UAFCommonUtilities openFD:v11 oflags:1537 mode:420 error:a6];
  if ((v12 & 0x80000000) != 0)
  {
    if (a6)
    {
      uint64_t v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v23 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a6)
      {
        v44[0] = *MEMORY[0x263F08320];
        uint64_t v14 = [NSString stringWithFormat:@"failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'", v9, v11];
        v44[1] = *MEMORY[0x263F08608];
        id v24 = *a6;
        v45[0] = v14;
        v45[1] = v24;
        v25 = NSDictionary;
        uint64_t v26 = (NSObject **)v45;
        v27 = v44;
        uint64_t v28 = 2;
      }
      else
      {
        uint64_t v42 = *MEMORY[0x263F08320];
        uint64_t v14 = [NSString stringWithFormat:@"failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'", v9, v11];
        uint64_t v43 = v14;
        v25 = NSDictionary;
        uint64_t v26 = &v43;
        v27 = &v42;
        uint64_t v28 = 1;
      }
      uint64_t v29 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:v28];
      *a6 = [v22 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v23 userInfo:v29];
    }
    else
    {
      uint64_t v14 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v37 = "+[UAFAutoAssetHistory _writeAssetInfoToFile:data:filePath:error:]";
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v11;
        _os_log_error_impl(&dword_23797A000, v14, OS_LOG_TYPE_ERROR, "%s failed to open file for persisting info for assetSetIdentifier '%@' at path = '%@'", buf, 0x20u);
      }
    }
    goto LABEL_18;
  }
  BOOL v13 = 1;
  uint64_t v14 = [objc_alloc(MEMORY[0x263F08840]) initWithFileDescriptor:v12 closeOnDealloc:1];
  if (([v14 writeData:v10 error:a6] & 1) == 0)
  {
    if (a6)
    {
      uint64_t v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v16 = UAFErrorCodeAssetHistoryFailedToCreateFile;
      if (*a6)
      {
        v34[0] = *MEMORY[0x263F08320];
        uint64_t v17 = [NSString stringWithFormat:@"failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'", v9, v11];
        v34[1] = *MEMORY[0x263F08608];
        v35[0] = v17;
        v35[1] = *a6;
        uint64_t v18 = NSDictionary;
        v19 = (NSObject **)v35;
        v20 = v34;
        uint64_t v21 = 2;
      }
      else
      {
        uint64_t v17 = [NSString stringWithFormat:@"failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'", v9, v11, *MEMORY[0x263F08320]];
        long long v33 = v17;
        uint64_t v18 = NSDictionary;
        v19 = &v33;
        v20 = &v32;
        uint64_t v21 = 1;
      }
      __int16 v30 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:v21];
      *a6 = [v15 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v16 userInfo:v30];
    }
    else
    {
      uint64_t v17 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v37 = "+[UAFAutoAssetHistory _writeAssetInfoToFile:data:filePath:error:]";
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2112;
        id v41 = v11;
        _os_log_error_impl(&dword_23797A000, v17, OS_LOG_TYPE_ERROR, "%s failed to write to file for persisting info for assetSetIdentifier '%@' at path = '%@'", buf, 0x20u);
      }
    }

LABEL_18:
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)_persistAssetSetInfo:(id)a3 assetSetIdentifier:(id)a4 isEliminating:(BOOL)a5 jsonData:(id)a6 error:(id *)a7
{
  v66[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v47 = a6;
  BOOL v13 = +[UAFAutoAssetManager getSerialQueue];
  dispatch_assert_queue_V2(v13);

  if ([@"configuration" isEqualToString:v11])
  {
    id v46 = v11;
    uint64_t v14 = @"uafConfiguredLog";
  }
  else
  {
    if (([@"locked" isEqualToString:v11] & 1) == 0)
    {
      if (a7)
      {
        v25 = (void *)MEMORY[0x263F087E8];
        uint64_t v26 = UAFErrorCodeAssetHistoryUnknownType;
        if (*a7)
        {
          v65[0] = *MEMORY[0x263F08320];
          v27 = [NSString stringWithFormat:@"unknown infoType '%@'", v11];
          v65[1] = *MEMORY[0x263F08608];
          v66[0] = v27;
          v66[1] = *a7;
          uint64_t v28 = NSDictionary;
          uint64_t v29 = (NSObject **)v66;
          __int16 v30 = v65;
          uint64_t v31 = 2;
        }
        else
        {
          uint64_t v63 = *MEMORY[0x263F08320];
          v27 = [NSString stringWithFormat:@"unknown infoType '%@'", v11];
          v64 = v27;
          uint64_t v28 = NSDictionary;
          uint64_t v29 = &v64;
          __int16 v30 = &v63;
          uint64_t v31 = 1;
        }
        id v39 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:v31];
        *a7 = [v25 errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v26 userInfo:v39];
      }
      else
      {
        v27 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
          __int16 v55 = 2112;
          id v56 = v11;
          _os_log_error_impl(&dword_23797A000, v27, OS_LOG_TYPE_ERROR, "%s unknown infoType '%@'", buf, 0x16u);
        }
      }
      uint64_t v18 = 0;
      uint64_t v15 = 0;
      uint64_t v21 = 0;
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      goto LABEL_29;
    }
    id v46 = v11;
    uint64_t v14 = @"uafLockedLog";
  }
  uint64_t v15 = +[UAFAutoAssetHistory _getPersistAssetInfoPath];
  if (!+[UAFAutoAssetHistory _createHistoryDirIfNeeded:v15 error:a7])
  {
    uint64_t v18 = 0;
    uint64_t v21 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    BOOL v24 = 0;
    id v11 = v46;
    goto LABEL_31;
  }
  id v45 = v12;
  uint64_t v16 = [NSString stringWithFormat:@"%@/%@-%@", v15, v12, v14];
  uint64_t v17 = [NSString stringWithFormat:@"%@.%@.%@", v16, @"cur", @"json"];
  uint64_t v18 = [NSString stringWithFormat:@"%@.%@.%@", v16, @"prev", @"json"];
  id v48 = 0;
  int v19 = +[UAFCommonUtilities rename:v17 toPath:v18 error:&v48];
  id v20 = v48;
  uint64_t v21 = v20;
  if (v19)
  {
    uint64_t v22 = [v20 code];
    uint64_t v23 = [v21 domain];
    if (v22 != 2 && [(id)*MEMORY[0x263F08438] isEqualToString:v23])
    {
      log = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
        __int16 v55 = 2114;
        id v56 = v17;
        __int16 v57 = 2114;
        v58 = v18;
        __int16 v59 = 2114;
        v60 = v23;
        __int16 v61 = 2048;
        uint64_t v62 = v22;
        _os_log_impl(&dword_23797A000, log, OS_LOG_TYPE_DEFAULT, "%s failed to rename current persisted info file '%{public}@' to previous '%{public}@', domain = '%{public}@', code = %ld", buf, 0x34u);
      }
    }
  }
  if (!a5)
  {
    uint64_t v32 = [NSURL fileURLWithPath:v17 isDirectory:0];
    id v12 = v45;
    if (v32)
    {
      v27 = v32;
      BOOL v24 = +[UAFAutoAssetHistory _writeAssetInfoToFile:v45 data:v47 filePath:v17 error:a7];
      id v11 = v46;
LABEL_30:

      goto LABEL_31;
    }
    if (a7)
    {
      os_log_t loga = (os_log_t)MEMORY[0x263F087E8];
      uint64_t v33 = UAFErrorCodeAssetHistoryFailedToCreateObject;
      id v11 = v46;
      if (*a7)
      {
        v51[0] = *MEMORY[0x263F08320];
        long long v34 = [NSString stringWithFormat:@"unknown infoType '%@'", v46];
        v51[1] = *MEMORY[0x263F08608];
        v52[0] = v34;
        v52[1] = *a7;
        long long v35 = NSDictionary;
        id v36 = (void **)v52;
        uint64_t v37 = v51;
        uint64_t v38 = 2;
      }
      else
      {
        uint64_t v49 = *MEMORY[0x263F08320];
        long long v34 = [NSString stringWithFormat:@"unknown infoType '%@'", v46];
        v50 = v34;
        long long v35 = NSDictionary;
        id v36 = &v50;
        uint64_t v37 = &v49;
        uint64_t v38 = 1;
      }
      uint64_t v42 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:v38];
      *a7 = [loga errorWithDomain:@"com.apple.UnifiedAssetFramework" code:v33 userInfo:v42];

      v27 = 0;
      BOOL v24 = 0;
      id v12 = v45;
      goto LABEL_30;
    }
    id v41 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    id v11 = v46;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v54 = "+[UAFAutoAssetHistory _persistAssetSetInfo:assetSetIdentifier:isEliminating:jsonData:error:]";
      __int16 v55 = 2112;
      id v56 = v46;
      _os_log_error_impl(&dword_23797A000, v41, OS_LOG_TYPE_ERROR, "%s unknown infoType '%@'", buf, 0x16u);
    }

    v27 = 0;
LABEL_29:
    BOOL v24 = 0;
    goto LABEL_30;
  }
  BOOL v24 = 1;
  id v12 = v45;
  id v11 = v46;
LABEL_31:

  return v24;
}

+ (void)persistAssetSetInfoConfiguring:(id)a3 entries:(id)a4 isEliminating:(BOOL)a5 reason:(id)a6
{
  BOOL v7 = a5;
  v33[2] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v9 assetSetIdentifier];
  if (v7)
  {
    BOOL v13 = [MEMORY[0x263EFF8F8] data];
    uint64_t v14 = 0;
    id v15 = 0;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x263EFF9A0] dictionary];
    if (!v16)
    {
      uint64_t v23 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v27 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:entries:isEliminating:reason:]";
        __int16 v28 = 2114;
        uint64_t v29 = v12;
        _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s failed to create output dictionary for persisting info about configuring asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      uint64_t v14 = 0;
      BOOL v13 = 0;
      id v15 = 0;
      goto LABEL_15;
    }
    uint64_t v14 = (void *)v16;
    v32[0] = @"reason";
    v32[1] = @"timestamp";
    v33[0] = v11;
    uint64_t v17 = [MEMORY[0x263EFF910] date];
    uint64_t v18 = +[UAFCommonUtilities getISO8601Timestamp:v17 withFractionalSeconds:1];
    v33[1] = v18;
    int v19 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v14 setObject:v19 forKeyedSubscript:@"UAFHistoryMetadata"];

    id v20 = +[UAFAutoAssetHistory _getAutoAssetSetInfo:v9 entries:v10 includeAssetVersion:0];
    [v14 setObject:v20 forKeyedSubscript:@"autoAssetSet"];

    id v25 = 0;
    BOOL v13 = +[UAFCommonUtilities serializeDictToJSONData:v14 error:&v25];
    id v15 = v25;
    if (!v13)
    {
      uint64_t v23 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:entries:isEliminating:reason:]";
        __int16 v28 = 2114;
        uint64_t v29 = v12;
        __int16 v30 = 2114;
        id v31 = v15;
        _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s could not serialize output dictionary to json, not persisting info about configuring asset set '%{public}@', error is '%{public}@'", buf, 0x20u);
      }
      BOOL v13 = 0;
      goto LABEL_15;
    }
  }
  uint64_t v21 = v15;
  id v24 = v15;
  BOOL v22 = +[UAFAutoAssetHistory _persistAssetSetInfo:@"configuration" assetSetIdentifier:v12 isEliminating:v7 jsonData:v13 error:&v24];
  id v15 = v24;

  if (!v22 || v15)
  {
    uint64_t v23 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v27 = "+[UAFAutoAssetHistory persistAssetSetInfoConfiguring:entries:isEliminating:reason:]";
      __int16 v28 = 2114;
      uint64_t v29 = v12;
      __int16 v30 = 2114;
      id v31 = v15;
      _os_log_error_impl(&dword_23797A000, v23, OS_LOG_TYPE_ERROR, "%s failed to persist info while configuring assetSetIdentifier '%{public}@', error is '%{public}@'", buf, 0x20u);
    }
LABEL_15:
  }
}

+ (void)persistAssetSetInfoLocked:(id)a3 atomicEntries:(id)a4 autoAssetSet:(id)a5 isEliminating:(BOOL)a6 reason:(id)a7
{
  BOOL v8 = a6;
  v82[2] = *MEMORY[0x263EF8340];
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = (__CFString *)a7;
  BOOL v15 = v8;
  uint64_t v16 = v14;
  uint64_t v17 = [v13 assetSetIdentifier];
  if (v8)
  {
    uint64_t v18 = [MEMORY[0x263EFF8F8] data];
    v52 = 0;
    id v19 = 0;
    __int16 v55 = 0;
  }
  else
  {
    __int16 v55 = [MEMORY[0x263EFF980] array];
    if (!v55)
    {
      BOOL v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        __int16 v72 = 2114;
        v73 = v17;
        _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s failed to create array for atomic entries for persisting info about locked asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      v52 = 0;
      uint64_t v18 = 0;
      id v19 = 0;
      __int16 v55 = 0;
      goto LABEL_53;
    }
    uint64_t v23 = [MEMORY[0x263EFF9A0] dictionary];
    if (!v23)
    {
      BOOL v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v71 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        __int16 v72 = 2114;
        v73 = v17;
        _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s failed to create output dictionary for persisting info about locked asset set '%{public}@', not persisting information", buf, 0x16u);
      }
      v52 = 0;
      uint64_t v18 = 0;
      id v19 = 0;
      goto LABEL_53;
    }
    v50 = v17;
    v51 = v16;
    if (v16) {
      id v24 = v16;
    }
    else {
      id v24 = @"<no reason provided>";
    }
    v81[0] = @"reason";
    v81[1] = @"timestamp";
    v82[0] = v24;
    id v25 = (void *)v23;
    uint64_t v26 = [MEMORY[0x263EFF910] date];
    v27 = +[UAFCommonUtilities getISO8601Timestamp:v26 withFractionalSeconds:1];
    v82[1] = v27;
    __int16 v28 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:2];
    [v25 setObject:v28 forKeyedSubscript:@"UAFHistoryMetadata"];

    uint64_t v49 = v11;
    if (v11) {
      uint64_t v29 = v11;
    }
    else {
      uint64_t v29 = &stru_26EA999B8;
    }
    [v25 setObject:v29 forKeyedSubscript:@"atomicInstance"];
    __int16 v30 = [v13 autoAssetEntries];
    id v47 = v13;
    id v31 = +[UAFAutoAssetHistory _getAutoAssetSetInfo:v13 entries:v30 includeAssetVersion:1];
    v52 = v25;
    [v25 setObject:v31 forKeyedSubscript:@"autoAssetSet"];

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v48 = v12;
    id obj = v12;
    uint64_t v56 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
    if (v56)
    {
      uint64_t v54 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v56; ++i)
        {
          if (*(void *)v67 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          v78[0] = @"fullAssetSelector";
          v76[0] = @"assetSpecifier";
          long long v34 = [v33 fullAssetSelector];
          long long v35 = [v34 assetSpecifier];
          if (v35)
          {
            uint64_t v63 = [v33 fullAssetSelector];
            __int16 v59 = [v63 assetSpecifier];
            id v36 = v59;
          }
          else
          {
            id v36 = &stru_26EA999B8;
          }
          v77[0] = v36;
          v76[1] = @"assetVersion";
          uint64_t v37 = [v33 fullAssetSelector];
          uint64_t v38 = [v37 assetVersion];
          if (v38)
          {
            uint64_t v62 = [v33 fullAssetSelector];
            v58 = [v62 assetVersion];
            id v39 = v58;
          }
          else
          {
            id v39 = &stru_26EA999B8;
          }
          v77[1] = v39;
          __int16 v40 = [NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:2];
          v79[0] = v40;
          v78[1] = @"assetID";
          id v41 = [v33 assetID];
          if (v41)
          {
            __int16 v61 = [v33 assetID];
            uint64_t v42 = v61;
          }
          else
          {
            uint64_t v42 = &stru_26EA999B8;
          }
          v79[1] = v42;
          v78[2] = @"localContentURL";
          uint64_t v43 = [v33 localContentURL];
          if (v43)
          {
            v60 = [v33 localContentURL];
            __int16 v57 = [v60 absoluteString];
            v44 = v57;
          }
          else
          {
            v44 = &stru_26EA999B8;
          }
          v79[2] = v44;
          v78[3] = @"inhibitedFromEmergencyRemoval";
          id v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "inhibitedFromEmergencyRemoval"));
          v79[3] = v45;
          id v46 = [NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:4];

          if (v43)
          {
          }
          if (v41) {

          }
          if (v38)
          {
          }
          if (v35)
          {
          }
          [v55 addObject:v46];
        }
        uint64_t v56 = [obj countByEnumeratingWithState:&v66 objects:v80 count:16];
      }
      while (v56);
    }

    [v52 setObject:v55 forKeyedSubscript:@"atomicEntries"];
    id v65 = 0;
    uint64_t v18 = +[UAFCommonUtilities serializeDictToJSONData:v52 error:&v65];
    id v19 = v65;
    if (!v18)
    {
      BOOL v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
      uint64_t v17 = v50;
      uint64_t v16 = v51;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v71 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
        __int16 v72 = 2114;
        v73 = v50;
        __int16 v74 = 2114;
        id v75 = v19;
        _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s could not serialize output dictionary to json, not persisting info about locked asset set '%{public}@', error is '%{public}@'", buf, 0x20u);
      }
      uint64_t v18 = 0;
      id v12 = v48;
      id v11 = v49;
      id v13 = v47;
      goto LABEL_53;
    }
    id v12 = v48;
    id v11 = v49;
    id v13 = v47;
    uint64_t v17 = v50;
    uint64_t v16 = v51;
    BOOL v15 = 0;
  }
  id v20 = v19;
  id v64 = v19;
  BOOL v21 = +[UAFAutoAssetHistory _persistAssetSetInfo:@"locked" assetSetIdentifier:v17 isEliminating:v15 jsonData:v18 error:&v64];
  id v19 = v64;

  if (!v21 || v19)
  {
    BOOL v22 = UAFGetLogCategory((void **)&UAFLogContextMAConfig);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v71 = "+[UAFAutoAssetHistory persistAssetSetInfoLocked:atomicEntries:autoAssetSet:isEliminating:reason:]";
      __int16 v72 = 2114;
      v73 = v17;
      __int16 v74 = 2114;
      id v75 = v19;
      _os_log_error_impl(&dword_23797A000, v22, OS_LOG_TYPE_ERROR, "%s failed to persist info for locked assetSetIdentifier '%{public}@', error is '%{public}@'", buf, 0x20u);
    }
LABEL_53:
  }
}

@end