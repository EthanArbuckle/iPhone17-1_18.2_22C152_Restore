@interface PLCPLPlistHandler
+ (BOOL)CPLPlistFileExistsWithPathManager:(id)a3;
+ (id)_cplPlistURLWithPathManager:(id)a3 verb:(id)a4;
+ (id)_readCPLPlistWithPathManager:(id)a3;
+ (id)readCPLPlistObjectWithKey:(id)a3 pathManager:(id)a4;
+ (void)deleteCPLPlistWithPathManager:(id)a3;
+ (void)initialize;
+ (void)saveCPLPlistObject:(id)a3 forKey:(id)a4 pathManager:(id)a5;
@end

@implementation PLCPLPlistHandler

+ (void)deleteCPLPlistWithPathManager:(id)a3
{
  v3 = [a1 _cplPlistURLWithPathManager:a3 verb:@"deleting"];
  v4 = v3;
  if (v3)
  {
    v5 = cplPlistQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLCPLPlistHandler_deleteCPLPlistWithPathManager___block_invoke;
    block[3] = &unk_1E58A1EC0;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

void __51__PLCPLPlistHandler_deleteCPLPlistWithPathManager___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  id v9 = 0;
  char v4 = [v2 removeItemAtURL:v3 error:&v9];
  id v5 = v9;
  v6 = v5;
  if ((v4 & 1) == 0 && (PLIsErrorFileNotFound(v5) & 1) == 0)
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v8;
      __int16 v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Error trying to remove mobileCPL.plist at path %@: %@", buf, 0x16u);
    }
  }
}

+ (void)saveCPLPlistObject:(id)a3 forKey:(id)a4 pathManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [a1 _cplPlistURLWithPathManager:a5 verb:@"writing"];
  uint64_t v11 = v10;
  if (v10)
  {
    __int16 v12 = cplPlistQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PLCPLPlistHandler_saveCPLPlistObject_forKey_pathManager___block_invoke;
    block[3] = &unk_1E58A1508;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    dispatch_async(v12, block);
  }
}

void __59__PLCPLPlistHandler_saveCPLPlistObject_forKey_pathManager___block_invoke(void *a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1[4];
  id v22 = 0;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2 error:&v22];
  id v4 = v22;
  id v5 = [v3 mutableCopy];

  if (v5) {
    goto LABEL_6;
  }
  int v6 = PLIsErrorFileNotFound(v4);
  id v7 = PLBackendGetLog();
  id v5 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      *(_DWORD *)buf = 136446466;
      v24 = "+[PLCPLPlistHandler saveCPLPlistObject:forKey:pathManager:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v8;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Could not read mobileCPL.plist at path %@: File doesn't exist", buf, 0x16u);
    }

    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_6:
    uint64_t v9 = a1[5];
    if (v9)
    {
      [v5 setObject:v9 forKey:a1[6]];
    }
    else
    {
      v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = (const char *)a1[6];
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEBUG, "Object is nil, deleting key %@ from mobileCPL.plist", buf, 0xCu);
      }

      [v5 removeObjectForKey:a1[6]];
    }
    id v21 = 0;
    __int16 v12 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:100 options:0 error:&v21];
    id v13 = v21;

    if (v12)
    {
      uint64_t v14 = a1[4];
      id v20 = v13;
      char v15 = [v12 writeToURL:v14 options:1073741825 error:&v20];
      id v4 = v20;

      if (v15)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = a1[4];
        *(_DWORD *)buf = 138412802;
        v24 = (const char *)v5;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Error saving mobileCPL.plist: %@ at path %@: %@", buf, 0x20u);
      }
      id v13 = v4;
    }
    else
    {
      id v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[4];
        *(_DWORD *)buf = 138412802;
        v24 = (const char *)v5;
        __int16 v25 = 2112;
        uint64_t v26 = v18;
        __int16 v27 = 2112;
        id v28 = v13;
        _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Error trying to serialize data: %@ to write to mobileCPL.plist at path %@: %@", buf, 0x20u);
      }
    }

    id v4 = v13;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v19 = a1[4];
    *(_DWORD *)buf = 136446722;
    v24 = "+[PLCPLPlistHandler saveCPLPlistObject:forKey:pathManager:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v19;
    __int16 v27 = 2112;
    id v28 = v4;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "%{public}s: Error reading mobileCPL.plist at path %@: %@", buf, 0x20u);
  }
LABEL_20:
}

+ (id)readCPLPlistObjectWithKey:(id)a3 pathManager:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [a1 _readCPLPlistWithPathManager:a4];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:v6];
    v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      char v15 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEBUG, "Reading %@ from mobileCPL.plist: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_readCPLPlistWithPathManager:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 _cplPlistURLWithPathManager:v4 verb:@"reading"];
  id v6 = v5;
  if (!v5)
  {
    id v17 = 0;
    goto LABEL_12;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3346;
  v34 = __Block_byref_object_dispose__3347;
  id v35 = 0;
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x3032000000;
  __int16 v27 = __Block_byref_object_copy__3346;
  id v28 = __Block_byref_object_dispose__3347;
  id v29 = 0;
  id v7 = cplPlistQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PLCPLPlistHandler__readCPLPlistWithPathManager___block_invoke;
  block[3] = &unk_1E589F820;
  id v22 = &v24;
  id v8 = v5;
  id v21 = v8;
  v23 = &v30;
  dispatch_sync(v7, block);
  uint64_t v9 = (void *)v25[5];
  if (!v9)
  {
    int v10 = PLIsErrorFileNotFound((void *)v31[5]);
    uint64_t v11 = PLBackendGetLog();
    int v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v37 = "+[PLCPLPlistHandler _readCPLPlistWithPathManager:]";
        __int16 v38 = 2112;
        id v39 = v8;
        id v13 = "%{public}s: Could not read mobileCPL.plist at path %@: File doesn't exist";
        __int16 v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 22;
LABEL_9:
        _os_log_impl(&dword_19BCFB000, v14, v15, v13, buf, v16);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = v31[5];
      *(_DWORD *)buf = 136446722;
      v37 = "+[PLCPLPlistHandler _readCPLPlistWithPathManager:]";
      __int16 v38 = 2112;
      id v39 = v8;
      __int16 v40 = 2112;
      uint64_t v41 = v18;
      id v13 = "%{public}s: Error reading mobileCPL.plist at path %@: %@";
      __int16 v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
      goto LABEL_9;
    }

    uint64_t v9 = (void *)v25[5];
  }
  id v17 = v9;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

LABEL_12:
  return v17;
}

void __50__PLCPLPlistHandler__readCPLPlistWithPathManager___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  uint64_t v5 = *(void *)(a1[5] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (BOOL)CPLPlistFileExistsWithPathManager:(id)a3
{
  uint64_t v3 = [a1 _cplPlistURLWithPathManager:a3 verb:@"checking existence of"];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v5 = [v3 path];
    char v6 = [v4 fileExistsAtPath:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)_cplPlistURLWithPathManager:(id)a3 verb:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v13 = 0;
  id v7 = [v5 photoDirectoryWithType:13 leafType:3 createIfNeeded:1 error:&v13];
  id v8 = v13;
  uint64_t v9 = [v7 stringByAppendingPathComponent:@"mobileCPL.plist"];
  if (v9)
  {
    int v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:0];
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_FAULT, "Error %{public}@ mobileCPL.plist, path is nil, pathManager: %@, error: %@", buf, 0x20u);
    }

    int v10 = 0;
  }

  return v10;
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_3360);
  }
}

void __31__PLCPLPlistHandler_initialize__block_invoke()
{
  uint64_t v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.assetsd.PLCPLPlistHandler.cplPlistQueue", v2);
  v1 = (void *)cplPlistQueue;
  cplPlistQueue = (uint64_t)v0;
}

@end