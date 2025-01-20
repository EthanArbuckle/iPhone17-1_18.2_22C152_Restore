@interface WKWallpaperRepresentingCollectionsManager
+ (WKWallpaperRepresentingCollectionsManager)defaultManager;
- (NSMapTable)_wallpaperCollectionLookupTable;
- (NSMutableArray)_wallpaperCollections;
- (WKWallpaperBundleDownloadManager)_downloadManager;
- (WKWallpaperRepresentingCollectionsManager)initWithDownloadManager:(id)a3;
- (id)wallpaperCollectionAtIndex:(int64_t)a3;
- (id)wallpaperCollectionWithIdentifier:(id)a3;
- (int64_t)numberOfWallpaperCollections;
- (void)_loadCollections;
- (void)_loadSystemWallpaperCollections;
- (void)set_downloadManager:(id)a3;
- (void)set_wallpaperCollectionLookupTable:(id)a3;
- (void)set_wallpaperCollections:(id)a3;
@end

@implementation WKWallpaperRepresentingCollectionsManager

- (WKWallpaperRepresentingCollectionsManager)initWithDownloadManager:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WKWallpaperRepresentingCollectionsManager;
  v6 = [(WKWallpaperRepresentingCollectionsManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__downloadManager, a3);
    uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
    wallpaperCollections = v7->__wallpaperCollections;
    v7->__wallpaperCollections = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    wallpaperCollectionLookupTable = v7->__wallpaperCollectionLookupTable;
    v7->__wallpaperCollectionLookupTable = (NSMapTable *)v10;

    [(WKWallpaperRepresentingCollectionsManager *)v7 _loadCollections];
  }

  return v7;
}

- (void)_loadCollections
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    v9 = v5;
    __int16 v10 = 2082;
    v11 = "-[WKWallpaperRepresentingCollectionsManager _loadCollections]";
    _os_log_impl(&dword_1BE13A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s start.", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__WKWallpaperRepresentingCollectionsManager__loadCollections__block_invoke;
  aBlock[3] = &unk_1E6376C98;
  aBlock[4] = self;
  v6 = (void (**)(void))_Block_copy(aBlock);
  [(WKWallpaperRepresentingCollectionsManager *)self _loadSystemWallpaperCollections];
  v6[2](v6);
}

void __61__WKWallpaperRepresentingCollectionsManager__loadCollections__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = (objc_class *)objc_opt_class();
    v2 = NSStringFromClass(v1);
    int v3 = 138543618;
    v4 = v2;
    __int16 v5 = 2082;
    v6 = "-[WKWallpaperRepresentingCollectionsManager _loadCollections]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s complete.", (uint8_t *)&v3, 0x16u);
  }
}

- (void)_loadSystemWallpaperCollections
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  v2 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
    _os_log_impl(&dword_1BE13A000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: start.", buf, 0xCu);
  }

  v90 = (void *)MGCopyAnswer();
  int v3 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    __int16 v5 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v114 = v5;
    __int16 v115 = 2114;
    v116 = v90;
    _os_log_impl(&dword_1BE13A000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolving default wallpaper collections for device name '%{public}@'", buf, 0x16u);
  }
  v6 = WKWallpapersBaseURL();
  v91 = [v6 URLByAppendingPathComponent:@"Collections"];

  uint64_t v7 = NSString;
  uint64_t v8 = [v90 lowercaseString];
  uint64_t v9 = [v7 stringWithFormat:@"Collections~%@.plist", v8];
  v92 = [v91 URLByAppendingPathComponent:v9];

  __int16 v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  v11 = [v92 path];
  LOBYTE(v9) = [v10 fileExistsAtPath:v11];

  if ((v9 & 1) == 0)
  {
    uint64_t v12 = [v91 URLByAppendingPathComponent:@"Collections.plist"];

    v92 = (void *)v12;
  }
  objc_super v13 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (char *)(id)objc_claimAutoreleasedReturnValue();
    v16 = [v92 path];
    *(_DWORD *)buf = 138543618;
    v114 = v15;
    __int16 v115 = 2114;
    v116 = v16;
    _os_log_impl(&dword_1BE13A000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Resolved to default wallpaper collections file at path '%{public}@'", buf, 0x16u);
  }
  v87 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v92];
  v17 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v109 = 0;
  v88 = [v17 contentsOfDirectoryAtURL:v91 includingPropertiesForKeys:0 options:0 error:&v109];
  id v89 = v109;

  if (v89)
  {
    log = WKLogForCategory(4uLL);
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (char *)(id)objc_claimAutoreleasedReturnValue();
      v20 = [v91 path];
      *(_DWORD *)buf = 138543874;
      v114 = v19;
      __int16 v115 = 2114;
      v116 = v20;
      __int16 v117 = 2114;
      id v118 = v89;
      _os_log_error_impl(&dword_1BE13A000, log, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load contents of directory at path '%{public}@'. Error '%{public}@'.", buf, 0x20u);
    }
    goto LABEL_55;
  }
  log = [MEMORY[0x1E4F1CA60] dictionary];
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v21 = v88;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v112 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v106 != v23) {
          objc_enumerationMutation(v21);
        }
        v25 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        v26 = [v25 path];
        v27 = [(WKWallpaperRepresentingCollection *)v26 lowercaseString];
        if (![v27 hasSuffix:@"wallpapercollection"]) {
          goto LABEL_23;
        }
        BOOL v28 = +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:v25];

        if (!v28) {
          continue;
        }
        v29 = [WKWallpaperRepresentingCollection alloc];
        v30 = [(WKWallpaperRepresentingCollectionsManager *)self _downloadManager];
        v26 = [(WKWallpaperRepresentingCollection *)v29 initWithURL:v25 downloadManager:v30];

        if (v26)
        {
          v31 = WKLogForCategory(4uLL);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = [(WKWallpaperRepresentingCollection *)v26 identifier];
            v33 = [v32 UUIDString];
            v34 = [(WKWallpaperRepresentingCollection *)v26 displayName];
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            __int16 v115 = 2114;
            v116 = v33;
            __int16 v117 = 2114;
            id v118 = v34;
            _os_log_impl(&dword_1BE13A000, v31, OS_LOG_TYPE_DEFAULT, "%s: Loaded wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);
          }
          v27 = [(WKWallpaperRepresentingCollection *)v26 identifier];
          v35 = [v27 UUIDString];
          [log setObject:v26 forKeyedSubscript:v35];

LABEL_23:
        }
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v22);
  }

  v36 = WKAppleInternalWallpapersBaseURL();
  v86 = [v36 URLByAppendingPathComponent:@"Collections"];

  v93 = [MEMORY[0x1E4FB16C8] currentDevice];
  if (objc_msgSend(v93, "sf_isInternalInstall"))
  {
    v37 = WKAppleInternalWallpapersBaseURL();
    if (v37)
    {
      v38 = [MEMORY[0x1E4F28CB8] defaultManager];
      v39 = [v86 path];
      int v40 = [v38 fileExistsAtPath:v39];

      if (!v40)
      {
        id v89 = 0;
        goto LABEL_35;
      }
      v41 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v104 = 0;
      v93 = [v41 contentsOfDirectoryAtURL:v86 includingPropertiesForKeys:0 options:0 error:&v104];
      id v89 = v104;

      if (v89)
      {
        v42 = WKLogForCategory(4uLL);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (char *)(id)objc_claimAutoreleasedReturnValue();
          v45 = [v86 path];
          *(_DWORD *)buf = 138543874;
          v114 = v44;
          __int16 v115 = 2114;
          v116 = v45;
          __int16 v117 = 2114;
          id v118 = v89;
          _os_log_error_impl(&dword_1BE13A000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Unable to load internal contents of directory at path '%{public}@'. Error '%{public}@'.", buf, 0x20u);
        }
LABEL_72:

        goto LABEL_34;
      }
      long long v102 = 0u;
      long long v103 = 0u;
      long long v100 = 0u;
      long long v101 = 0u;
      v42 = v93;
      uint64_t v72 = [v42 countByEnumeratingWithState:&v100 objects:v111 count:16];
      if (!v72) {
        goto LABEL_72;
      }
      uint64_t v73 = *(void *)v101;
LABEL_59:
      uint64_t v74 = 0;
      while (1)
      {
        if (*(void *)v101 != v73) {
          objc_enumerationMutation(v42);
        }
        v75 = *(void **)(*((void *)&v100 + 1) + 8 * v74);
        v76 = [v75 path];
        v77 = [(WKWallpaperRepresentingCollection *)v76 lowercaseString];
        if (![v77 hasSuffix:@"wallpapercollection"]) {
          goto LABEL_68;
        }
        BOOL v78 = +[WKWallpaperRepresentingCollection shouldLoadWallpaperCollectionAtURL:v75];

        if (v78) {
          break;
        }
LABEL_70:
        if (v72 == ++v74)
        {
          uint64_t v72 = [v42 countByEnumeratingWithState:&v100 objects:v111 count:16];
          if (!v72) {
            goto LABEL_72;
          }
          goto LABEL_59;
        }
      }
      v79 = [WKWallpaperRepresentingCollection alloc];
      v80 = [(WKWallpaperRepresentingCollectionsManager *)self _downloadManager];
      v76 = [(WKWallpaperRepresentingCollection *)v79 initWithURL:v75 downloadManager:v80];

      if (v76)
      {
        v81 = WKLogForCategory(4uLL);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = [(WKWallpaperRepresentingCollection *)v76 identifier];
          v83 = [v82 UUIDString];
          v84 = [(WKWallpaperRepresentingCollection *)v76 displayName];
          *(_DWORD *)buf = 136315650;
          v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
          __int16 v115 = 2114;
          v116 = v83;
          __int16 v117 = 2114;
          id v118 = v84;
          _os_log_impl(&dword_1BE13A000, v81, OS_LOG_TYPE_DEFAULT, "%s: Loaded internal wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);
        }
        v77 = [(WKWallpaperRepresentingCollection *)v76 identifier];
        v85 = [v77 UUIDString];
        [log setObject:v76 forKeyedSubscript:v85];

LABEL_68:
      }

      goto LABEL_70;
    }
  }
  id v89 = 0;
LABEL_34:

LABEL_35:
  objc_opt_class();
  id v46 = [v87 objectForKeyedSubscript:@"order"];
  if (objc_opt_isKindOfClass()) {
    v47 = v46;
  }
  else {
    v47 = 0;
  }
  id v48 = v47;

  if (!v48)
  {
    v49 = (void *)MEMORY[0x1E4F1CA00];
    v50 = NSString;
    v51 = (objc_class *)objc_opt_class();
    v52 = NSStringFromClass(v51);
    v54 = v53 = [v92 path];
    v55 = [v49 exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v54 userInfo:0];

    [v55 raise];
  }
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v56 = v48;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v96 objects:v110 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v57; ++j)
      {
        if (*(void *)v97 != v58) {
          objc_enumerationMutation(v56);
        }
        v60 = [log objectForKeyedSubscript:*(void *)(*((void *)&v96 + 1) + 8 * j)];
        v61 = v60;
        if (v60 && [v60 numberOfWallpapers] >= 1)
        {
          v62 = WKLogForCategory(4uLL);
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            v63 = [v61 identifier];
            v64 = [v63 UUIDString];
            v65 = [v61 displayName];
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            __int16 v115 = 2114;
            v116 = v64;
            __int16 v117 = 2114;
            id v118 = v65;
            _os_log_impl(&dword_1BE13A000, v62, OS_LOG_TYPE_DEFAULT, "%s: Adding wallpaper collection (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);
          }
          v66 = [(WKWallpaperRepresentingCollectionsManager *)self _wallpaperCollections];
          objc_msgSend(v66, "na_safeAddObject:", v61);

          v67 = [(WKWallpaperRepresentingCollectionsManager *)self _wallpaperCollectionLookupTable];
          v68 = [v61 identifier];
          [v67 setObject:v61 forKey:v68];
        }
        else
        {
          v67 = WKLogForCategory(4uLL);
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            v69 = [v61 identifier];
            v70 = [v69 UUIDString];
            v71 = [v61 displayName];
            *(_DWORD *)buf = 136315650;
            v114 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]";
            __int16 v115 = 2114;
            v116 = v70;
            __int16 v117 = 2114;
            id v118 = v71;
            _os_log_impl(&dword_1BE13A000, v67, OS_LOG_TYPE_DEFAULT, "%s: Skipping empty wallpaper colleciton (identifier: '%{public}@', displayName: '%{public}@').", buf, 0x20u);
          }
        }
      }
      uint64_t v57 = [v56 countByEnumeratingWithState:&v96 objects:v110 count:16];
    }
    while (v57);
  }

LABEL_55:
  __76__WKWallpaperRepresentingCollectionsManager__loadSystemWallpaperCollections__block_invoke();
}

void __76__WKWallpaperRepresentingCollectionsManager__loadSystemWallpaperCollections__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = WKLogForCategory(4uLL);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446210;
    v2 = "-[WKWallpaperRepresentingCollectionsManager _loadSystemWallpaperCollections]_block_invoke";
    _os_log_impl(&dword_1BE13A000, v0, OS_LOG_TYPE_DEFAULT, "%{public}s: complete.", (uint8_t *)&v1, 0xCu);
  }
}

+ (WKWallpaperRepresentingCollectionsManager)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_30_1);
  }
  v2 = (void *)defaultManager__defaultWallpaperCollectionsManager;
  return (WKWallpaperRepresentingCollectionsManager *)v2;
}

void __59__WKWallpaperRepresentingCollectionsManager_defaultManager__block_invoke()
{
  v0 = [WKWallpaperRepresentingCollectionsManager alloc];
  id v3 = +[WKWallpaperBundleDownloadManager defaultManager];
  uint64_t v1 = [(WKWallpaperRepresentingCollectionsManager *)v0 initWithDownloadManager:v3];
  v2 = (void *)defaultManager__defaultWallpaperCollectionsManager;
  defaultManager__defaultWallpaperCollectionsManager = v1;
}

- (int64_t)numberOfWallpaperCollections
{
  v2 = [(WKWallpaperRepresentingCollectionsManager *)self _wallpaperCollections];
  int64_t v3 = [v2 count];

  return v3;
}

- (id)wallpaperCollectionAtIndex:(int64_t)a3
{
  v4 = [(WKWallpaperRepresentingCollectionsManager *)self _wallpaperCollections];
  __int16 v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (id)wallpaperCollectionWithIdentifier:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(WKWallpaperRepresentingCollectionsManager *)self _wallpaperCollectionLookupTable];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (WKWallpaperBundleDownloadManager)_downloadManager
{
  return self->__downloadManager;
}

- (void)set_downloadManager:(id)a3
{
}

- (NSMutableArray)_wallpaperCollections
{
  return self->__wallpaperCollections;
}

- (void)set_wallpaperCollections:(id)a3
{
}

- (NSMapTable)_wallpaperCollectionLookupTable
{
  return self->__wallpaperCollectionLookupTable;
}

- (void)set_wallpaperCollectionLookupTable:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wallpaperCollectionLookupTable, 0);
  objc_storeStrong((id *)&self->__wallpaperCollections, 0);
  objc_storeStrong((id *)&self->__downloadManager, 0);
}

@end