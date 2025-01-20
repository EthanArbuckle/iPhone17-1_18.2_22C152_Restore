@interface VCIntentDefinitionManager
+ (id)allBundleIdentifiers;
+ (id)appInfoForBundleID:(id)a3;
+ (id)intentDefinitionBundleURLForBundleID:(id)a3;
+ (id)intentDefinitionURLsForBundleID:(id)a3;
+ (id)intentDefinitionURLsForBundleID:(id)a3 inDirectory:(id)a4;
@end

@implementation VCIntentDefinitionManager

+ (id)allBundleIdentifiers
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v2 = WFSyncedDefinitionDirectoryURL();
  v21[0] = v2;
  v3 = WFBundledDefinitionDirectoryURL();
  v21[1] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  v5 = objc_msgSend(v4, "if_flatMap:", &__block_literal_global_7308);
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "wf_fileIsDirectory", (void)v16))
        {
          v13 = [v12 lastPathComponent];
          [v6 addObject:v13];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  v14 = [v6 allObjects];

  return v14;
}

id __49__VCIntentDefinitionManager_allBundleIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v11 = 0;
  v4 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:0 options:0 error:&v11];
  id v5 = v11;

  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  if (!v6 && (objc_msgSend(v5, "vc_isFileNotFound") & 1) == 0)
  {
    id v7 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "+[VCIntentDefinitionManager allBundleIdentifiers]_block_invoke";
      __int16 v14 = 2114;
      id v15 = v2;
      __int16 v16 = 2114;
      id v17 = v5;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Failed to enumerate search directory %{public}@ for synced application data: %{public}@", buf, 0x20u);
    }
  }
  if (v4) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v9 = v8;

  return v9;
}

+ (id)appInfoForBundleID:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v3 = a3;
  v4 = WFSyncedDefinitionDirectoryURL();
  v32 = v3;
  id v5 = WFDefinitionDirectoryURLsForBundleIdentifier();

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v37;
    uint64_t v10 = @"AppInfo.appinfo";
    unint64_t v11 = 0x1E4F28000uLL;
    *(void *)&long long v7 = 136315906;
    long long v30 = v7;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v37 != v9) {
        objc_enumerationMutation(obj);
      }
      v13 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v12), "URLByAppendingPathComponent:", v10, v30);
      __int16 v14 = [*(id *)(v11 + 3256) defaultManager];
      id v15 = [v13 path];
      char v16 = [v14 isReadableFileAtPath:v15];

      if ((v16 & 1) == 0) {
        break;
      }
      id v17 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v35 = 0;
      uint64_t v18 = [v17 initWithContentsOfURL:v13 options:0 error:&v35];
      long long v19 = v35;
      v20 = v19;
      if (v18)
      {
        uint64_t v21 = v8;
        uint64_t v22 = v9;
        unint64_t v23 = v11;
        v24 = v10;
        id v34 = 0;
        v25 = [MEMORY[0x1E4F302B0] appInfoWithData:v18 error:&v34];
        id v26 = v34;
        if (v26)
        {
          v31 = v25;
          v27 = getWFWatchSyncLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
            __int16 v42 = 2114;
            v43 = v18;
            __int16 v44 = 2114;
            v45 = v32;
            __int16 v46 = 2114;
            v47 = v13;
            __int16 v48 = 2114;
            id v49 = v26;
            _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_ERROR, "%s Failed to create INAppInfo from data: %{public}@, bundleID: %{public}@, appInfoURL: %{public}@: %{public}@", buf, 0x34u);
          }

          v25 = v31;
        }

        if (v25)
        {

          goto LABEL_26;
        }
        uint64_t v10 = v24;
        unint64_t v11 = v23;
        uint64_t v9 = v22;
        uint64_t v8 = v21;
        goto LABEL_21;
      }
      if ([v19 vc_isFileNotFound]) {
        goto LABEL_21;
      }
      if (v20)
      {
        v28 = getWFWatchSyncLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
          __int16 v42 = 2114;
          v43 = v32;
          __int16 v44 = 2114;
          v45 = v13;
          __int16 v46 = 2114;
          v47 = v20;
          _os_log_impl(&dword_1C7D7E000, v28, OS_LOG_TYPE_ERROR, "%s Failed to load INAppInfo data for %{public}@ at %{public}@: %{public}@", buf, 0x2Au);
        }

LABEL_21:
      }

      if (v8 == ++v12)
      {
        uint64_t v8 = [obj countByEnumeratingWithState:&v36 objects:v50 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_24;
      }
    }
    v20 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v41 = "+[VCIntentDefinitionManager appInfoForBundleID:]";
      __int16 v42 = 2114;
      v43 = v32;
      __int16 v44 = 2114;
      v45 = v13;
      _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_ERROR, "%s Failed to load INAppInfo data for %{public}@ at %{public}@. App Info URL is not readable.", buf, 0x20u);
    }
    goto LABEL_21;
  }
LABEL_24:
  v25 = 0;
LABEL_26:

  return v25;
}

+ (id)intentDefinitionBundleURLForBundleID:(id)a3
{
  v52[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = WFSyncedDefinitionDirectoryURL();
  v52[0] = v4;
  id v5 = WFBundledDefinitionDirectoryURL();
  v52[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v7 = v6;
  uint64_t v32 = [v7 countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (!v32)
  {
    id v28 = 0;
    goto LABEL_33;
  }
  uint64_t v9 = *(void *)v41;
  unint64_t v10 = 0x1E4F28000uLL;
  *(void *)&long long v8 = 136315650;
  long long v30 = v8;
  v33 = v7;
  uint64_t v31 = *(void *)v41;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v40 + 1) + 8 * v11);
      v13 = objc_msgSend(*(id *)(v10 + 3256), "defaultManager", v30);
      id v39 = 0;
      __int16 v14 = [v13 contentsOfDirectoryAtURL:v12 includingPropertiesForKeys:0 options:0 error:&v39];
      id v15 = v39;

      if (v14) {
        BOOL v16 = 1;
      }
      else {
        BOOL v16 = v15 == 0;
      }
      if (!v16 && (objc_msgSend(v15, "vc_isFileNotFound") & 1) == 0)
      {
        id v17 = getWFWatchSyncLogObject();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v30;
          __int16 v46 = "+[VCIntentDefinitionManager intentDefinitionBundleURLForBundleID:]";
          __int16 v47 = 2114;
          uint64_t v48 = v12;
          __int16 v49 = 2114;
          id v50 = v15;
          _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Failed to enumerate search directory %{public}@ for synced application data: %{public}@", buf, 0x20u);
        }
      }
      id v34 = v15;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v18 = v14;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (!v19) {
        goto LABEL_27;
      }
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          unint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v24 = [v23 lastPathComponent];
          id v25 = v3;
          id v26 = v25;
          if (v24 == v25)
          {

            goto LABEL_32;
          }
          if (v3 && v24)
          {
            char v27 = [v24 isEqualToString:v25];

            if (v27)
            {
              id v26 = v24;
LABEL_32:
              id v28 = v23;

              id v7 = v33;
              goto LABEL_33;
            }
          }
          else
          {
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v20) {
          continue;
        }
        break;
      }
LABEL_27:

      ++v11;
      id v7 = v33;
      uint64_t v9 = v31;
      unint64_t v10 = 0x1E4F28000;
    }
    while (v11 != v32);
    id v28 = 0;
    uint64_t v32 = [v33 countByEnumeratingWithState:&v40 objects:v51 count:16];
  }
  while (v32);
LABEL_33:

  return v28;
}

+ (id)intentDefinitionURLsForBundleID:(id)a3 inDirectory:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v34 = v7;
  if (!v7)
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v28 = id v27 = v8;
    [v28 handleFailureInMethod:a2, a1, @"VCIntentDefinitionManager.m", 36, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];

    id v8 = v27;
  }
  if (!v8)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"VCIntentDefinitionManager.m", 37, @"Invalid parameter not satisfying: %@", @"searchDirectory" object file lineNumber description];

    id v8 = 0;
  }
  WFDefinitionDirectoryURLsForBundleIdentifier();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v33)
  {
    id v30 = v8;
    uint64_t v32 = *(void *)v44;
    uint64_t v9 = *MEMORY[0x1E4F1C628];
    while (2)
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v44 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
        uint64_t v48 = v9;
        v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __73__VCIntentDefinitionManager_intentDefinitionURLsForBundleID_inDirectory___block_invoke;
        v41[3] = &unk_1E6542028;
        id v42 = v34;
        __int16 v14 = [v12 enumeratorAtURL:v11 includingPropertiesForKeys:v13 options:4 errorHandler:v41];

        if (v14)
        {
          uint64_t v35 = i;
          id v15 = objc_opt_new();
          long long v37 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v16 = v14;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v38;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v21 = *(void **)(*((void *)&v37 + 1) + 8 * j);
                id v36 = 0;
                [v21 getResourceValue:&v36 forKey:v9 error:0];
                id v22 = v36;
                if (([v22 BOOLValue] & 1) == 0)
                {
                  unint64_t v23 = [v21 pathExtension];
                  if (v23 == @"intentdefinition"
                    || (id v24 = v23) != 0
                    && (int v25 = [(__CFString *)v23 isEqualToString:@"intentdefinition"],
                        v24,
                        v24,
                        v25))
                  {
                    [v15 addObject:v21];
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v47 count:16];
            }
            while (v18);
          }

          if ([v15 count])
          {

            goto LABEL_29;
          }

          uint64_t i = v35;
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      if (v33) {
        continue;
      }
      break;
    }
    id v15 = 0;
LABEL_29:
    id v8 = v30;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

uint64_t __73__VCIntentDefinitionManager_intentDefinitionURLsForBundleID_inDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6 && (objc_msgSend(v6, "vc_isFileNotFound") & 1) == 0)
  {
    uint64_t v9 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 136315906;
      v13 = "+[VCIntentDefinitionManager intentDefinitionURLsForBundleID:inDirectory:]_block_invoke";
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      __int16 v16 = 2114;
      id v17 = v5;
      __int16 v18 = 2114;
      uint64_t v19 = v7;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to enumerate intent definition files for %{public}@ in search directory %{public}@: %{public}@", (uint8_t *)&v12, 0x2Au);
    }

    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

+ (id)intentDefinitionURLsForBundleID:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    __int16 v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"VCIntentDefinitionManager.m", 22, @"Invalid parameter not satisfying: %@", @"bundleID" object file lineNumber description];
  }
  id v6 = WFSyncedDefinitionDirectoryURL();
  v22[0] = v6;
  id v7 = WFBundledDefinitionDirectoryURL();
  v22[1] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v9);
      }
      __int16 v14 = [a1 intentDefinitionURLsForBundleID:v5 inDirectory:*(void *)(*((void *)&v17 + 1) + 8 * v13)];
      if ([v14 count]) {
        break;
      }

      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    __int16 v14 = 0;
  }

  return v14;
}

@end