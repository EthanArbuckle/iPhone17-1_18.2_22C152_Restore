@interface UAFAutoAssetInstance
+ (BOOL)clear:(id)a3 path:(id)a4;
+ (BOOL)decomposeSaveFileURL:(id)a3 assetSetName:(id *)a4 atomicInstance:(id *)a5;
+ (id)instanceDirURL;
+ (id)saveFileURL:(id)a3;
@end

@implementation UAFAutoAssetInstance

+ (id)instanceDirURL
{
  v2 = +[UAFCommonUtilities getDefaultStoragePath];
  if (v2)
  {
    v3 = [NSURL fileURLWithPath:v2 isDirectory:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)saveFileURL:(id)a3
{
  id v3 = a3;
  v4 = +[UAFAutoAssetInstance instanceDirURL];

  if (v4)
  {
    v5 = +[UAFAutoAssetInstance instanceDirURL];
    v6 = [v5 URLByAppendingPathComponent:v3 isDirectory:0];

    v4 = [v6 URLByAppendingPathExtension:@"instance"];
  }

  return v4;
}

+ (BOOL)decomposeSaveFileURL:(id)a3 assetSetName:(id *)a4 atomicInstance:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  v9 = [v7 pathExtension];
  int v10 = [v9 isEqualToString:@"instance"];

  if (v10)
  {
    v11 = [v8 lastPathComponent];
    v12 = [v11 stringByDeletingPathExtension];

    uint64_t v13 = [v12 rangeOfString:@"@" options:4];
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v15 = 0;
      if (!a4) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v16 = v13;
      v15 = [v12 substringFromIndex:v13 + v14];
      uint64_t v17 = [v12 substringToIndex:v16];

      v12 = (void *)v17;
      if (!a4)
      {
LABEL_11:
        if (a5) {
          *a5 = v15;
        }

        goto LABEL_14;
      }
    }
    *a4 = v12;
    goto LABEL_11;
  }
LABEL_14:

  return v10;
}

+ (BOOL)clear:(id)a3 path:(id)a4
{
  v46[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v6) {
    [NSURL URLWithString:v6];
  }
  else {
  id v7 = +[UAFAutoAssetInstance instanceDirURL];
  }
  if (v7)
  {
    v8 = [MEMORY[0x263F08850] defaultManager];
    v46[0] = *MEMORY[0x263EFF6F0];
    BOOL v9 = 1;
    int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    v11 = [v8 enumeratorAtURL:v7 includingPropertiesForKeys:v10 options:0 errorHandler:0];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v27 = v7;
      id v28 = v6;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v36;
      id v29 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          id v33 = 0;
          id v34 = 0;
          BOOL v18 = +[UAFAutoAssetInstance decomposeSaveFileURL:assetSetName:atomicInstance:](UAFAutoAssetInstance, "decomposeSaveFileURL:assetSetName:atomicInstance:", v17, &v34, &v33, v27);
          id v19 = v34;
          id v20 = v33;
          if (v18 && (!v5 || [v19 isEqualToString:v5]))
          {
            v31 = v20;
            v21 = [MEMORY[0x263F08850] defaultManager];
            id v32 = v14;
            char v22 = [v21 removeItemAtURL:v17 error:&v32];
            id v23 = v32;

            v24 = UAFGetLogCategory((void **)&UAFLogContextClient);
            v25 = v24;
            if ((v22 & 1) == 0)
            {
              id v6 = v28;
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v40 = "+[UAFAutoAssetInstance clear:path:]";
                __int16 v41 = 2112;
                uint64_t v42 = v17;
                __int16 v43 = 2114;
                id v44 = v23;
                _os_log_error_impl(&dword_23797A000, v25, OS_LOG_TYPE_ERROR, "%s Failed to remove \"%@\": %{public}@", buf, 0x20u);
              }

              BOOL v9 = 0;
              id v5 = v29;
              goto LABEL_24;
            }
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v40 = "+[UAFAutoAssetInstance clear:path:]";
              __int16 v41 = 2112;
              uint64_t v42 = v17;
              _os_log_impl(&dword_23797A000, v25, OS_LOG_TYPE_DEFAULT, "%s Removed \"%@\"", buf, 0x16u);
            }

            uint64_t v14 = v23;
            id v5 = v29;
            id v20 = v31;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v9 = 1;
      id v23 = v14;
      id v6 = v28;
LABEL_24:
      id v7 = v27;
    }
    else
    {
      id v23 = 0;
    }
  }
  else
  {
    id v23 = 0;
    BOOL v9 = 0;
  }

  return v9;
}

@end