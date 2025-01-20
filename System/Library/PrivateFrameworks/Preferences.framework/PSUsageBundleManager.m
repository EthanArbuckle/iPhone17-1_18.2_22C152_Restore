@interface PSUsageBundleManager
- (id)allUsageBundleApps;
- (void)_loadUsageBundlesWithHandler:(id)a3;
- (void)vendUsageBundleAppsWithHandler:(id)a3;
@end

@implementation PSUsageBundleManager

- (void)_loadUsageBundlesWithHandler:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v4 = (uint64_t (**)(id, void *))a3;
  v45 = self;
  storageReporters = self->_storageReporters;
  if (!storageReporters)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_storageReporters;
    self->_storageReporters = v6;

    storageReporters = self->_storageReporters;
  }
  [(NSMutableArray *)storageReporters removeAllObjects];
  v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v42 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v41 = [&unk_1EFB74360 countByEnumeratingWithState:&v61 objects:v71 count:16];
  id v10 = 0;
  if (v41)
  {
    uint64_t v40 = *(void *)v62;
    *(void *)&long long v9 = 138412546;
    long long v39 = v9;
LABEL_5:
    uint64_t v11 = 0;
    v12 = v10;
    while (1)
    {
      if (*(void *)v62 != v40) {
        objc_enumerationMutation(&unk_1EFB74360);
      }
      id v13 = *(id *)(*((void *)&v61 + 1) + 8 * v11);
      v14 = SFRuntimeAbsoluteFilePathForPath();
      uint64_t v15 = [v14 stringByAppendingPathComponent:@"UsageBundles"];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v56 = v12;
      v47 = (void *)v15;
      v16 = [v42 contentsOfDirectoryAtPath:v15 error:&v56];
      id v10 = v56;

      id obj = v16;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v57 objects:v70 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v43 = v11;
        id v44 = v10;
        uint64_t v19 = *(void *)v58;
        v20 = v47;
        uint64_t v46 = *(void *)v58;
        do
        {
          uint64_t v21 = 0;
          uint64_t v48 = v18;
          do
          {
            if (*(void *)v58 != v19) {
              objc_enumerationMutation(obj);
            }
            v22 = objc_msgSend(v20, "stringByAppendingPathComponent:", *(void *)(*((void *)&v57 + 1) + 8 * v21), v39);
            v23 = _PSLoggingFacility();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v66 = v22;
              _os_log_impl(&dword_1A6597000, v23, OS_LOG_TYPE_DEFAULT, "Loading usage bundle %@", buf, 0xCu);
            }

            v24 = [v22 pathExtension];
            char v25 = [v24 isEqualToString:@"bundle"];

            if (v25)
            {
              v51 = v22;
              v50 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v22];
              id v26 = objc_alloc_init((Class)[v50 principalClass]);
              v27 = [v26 usageBundleApps];
              if ([v27 count]) {
                [(NSMutableArray *)v45->_storageReporters addObject:v26];
              }
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v28 = v27;
              uint64_t v29 = [v28 countByEnumeratingWithState:&v52 objects:v69 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v31 = *(void *)v53;
                while (2)
                {
                  for (uint64_t i = 0; i != v30; ++i)
                  {
                    if (*(void *)v53 != v31) {
                      objc_enumerationMutation(v28);
                    }
                    v33 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                    [v33 setUsageBundleStorageReporter:v26];
                    v34 = [v33 bundleIdentifier];
                    [(NSDictionary *)v8 setValue:v33 forKey:v34];

                    if (v4 && (v4[2](v4, v33) & 1) == 0)
                    {

                      int v35 = 0;
                      v8 = 0;
                      goto LABEL_30;
                    }
                  }
                  uint64_t v30 = [v28 countByEnumeratingWithState:&v52 objects:v69 count:16];
                  if (v30) {
                    continue;
                  }
                  break;
                }
                int v35 = 1;
LABEL_30:
                uint64_t v19 = v46;
                v20 = v47;
              }
              else
              {
                int v35 = 1;
              }

              uint64_t v18 = v48;
              if (!v35) {
                goto LABEL_36;
              }
            }
            else
            {
            }
            ++v21;
          }
          while (v21 != v18);
          uint64_t v18 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
        }
        while (v18);
        int v35 = 1;
LABEL_36:
        uint64_t v11 = v43;
        id v10 = v44;
      }
      else
      {
        int v35 = 1;
      }

      if (v10)
      {
        v36 = _PSLoggingFacility();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v39;
          v66 = v47;
          __int16 v67 = 2112;
          id v68 = v10;
          _os_log_impl(&dword_1A6597000, v36, OS_LOG_TYPE_DEFAULT, "Error loading usage bundles from %@: %@", buf, 0x16u);
        }
      }
      if (!v35) {
        break;
      }
      ++v11;
      v12 = v10;
      if (v11 == v41)
      {
        uint64_t v41 = [&unk_1EFB74360 countByEnumeratingWithState:&v61 objects:v71 count:16];
        if (v41) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  bundleMap = v45->_bundleMap;
  v45->_bundleMap = v8;
  v38 = v8;
}

- (id)allUsageBundleApps
{
  bundleMap = self->_bundleMap;
  if (!bundleMap)
  {
    [(PSUsageBundleManager *)self _loadUsageBundlesWithHandler:0];
    bundleMap = self->_bundleMap;
  }
  return [(NSDictionary *)bundleMap allValues];
}

- (void)vendUsageBundleAppsWithHandler:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void))a3;
  bundleMap = self->_bundleMap;
  if (bundleMap)
  {
    if (v4)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      v6 = [(NSDictionary *)bundleMap allValues];
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
  else
  {
    [(PSUsageBundleManager *)self _loadUsageBundlesWithHandler:v4];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageReporters, 0);
  objc_storeStrong((id *)&self->_usageBundleApps, 0);
  objc_storeStrong((id *)&self->_bundleMap, 0);
}

@end