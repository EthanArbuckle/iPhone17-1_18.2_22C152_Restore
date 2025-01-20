@interface MSDContentCacheManager
+ (id)sharedInstance;
- (BOOL)copyFileIfPresentInCache:(id)a3 toLocation:(id)a4 verifyHash:(BOOL)a5;
- (BOOL)deleteFromCache:(id)a3;
- (MSDContentCacheManager)init;
- (NSArray)cachedManifestPaths;
- (NSArray)fileDownloadCachePaths;
- (NSFileManager)fileManager;
- (NSMutableDictionary)appPatches;
- (NSString)dataVolumeCacheFolderPath;
- (NSString)demoVolumeCacheFolderPath;
- (NSString)userHomePath;
- (NSString)userVolumeCacheFolderPath;
- (NSURL)appPatchesListFileURL;
- (id)appDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4;
- (id)fileCachePathFromSourcePath:(id)a3 forBackgroundDownload:(BOOL)a4;
- (id)findFileInCache:(id)a3;
- (unint64_t)fileSizeInCache:(id)a3;
- (void)_clearFactoryCache;
- (void)_loadCachedManifestPaths;
- (void)addAppDiffPatchFile:(id)a3 sourceAppUID:(id)a4 targetAppUID:(id)a5;
- (void)clearCache;
- (void)clearCacheExceptFileHashes:(id)a3;
- (void)createDownloadCacheFolders;
- (void)loadAppPatchesList;
- (void)removeAppDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4;
- (void)saveAppPatchesList;
- (void)setAppPatches:(id)a3;
- (void)setAppPatchesListFileURL:(id)a3;
- (void)setDataVolumeCacheFolderPath:(id)a3;
- (void)setDemoVolumeCacheFolderPath:(id)a3;
- (void)setFileDownloadCachePaths:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setUserHomePath:(id)a3;
- (void)setUserVolumeCacheFolderPath:(id)a3;
@end

@implementation MSDContentCacheManager

+ (id)sharedInstance
{
  if (qword_100189C58 != -1) {
    dispatch_once(&qword_100189C58, &stru_100153B68);
  }
  v2 = (void *)qword_100189C50;

  return v2;
}

- (MSDContentCacheManager)init
{
  v14.receiver = self;
  v14.super_class = (Class)MSDContentCacheManager;
  v2 = [(MSDContentCacheManager *)&v14 init];
  if (v2)
  {
    v3 = +[NSFileManager defaultManager];
    [(MSDContentCacheManager *)v2 setFileManager:v3];

    v4 = +[NSURL fileURLWithPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache/AppPatches.plist"];
    [(MSDContentCacheManager *)v2 setAppPatchesListFileURL:v4];

    [(MSDContentCacheManager *)v2 setDemoVolumeCacheFolderPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/.MSD_cache"];
    [(MSDContentCacheManager *)v2 setDataVolumeCacheFolderPath:@"/var/MSDWorkContainer/.MSD_cache"];
    v5 = +[MSDTargetDevice sharedInstance];
    v6 = [v5 demoUserHomePath];
    [(MSDContentCacheManager *)v2 setUserHomePath:v6];

    v7 = [(MSDContentCacheManager *)v2 userHomePath];
    v8 = [v7 stringByAppendingPathComponent:@"/.MSD_cache"];
    [(MSDContentCacheManager *)v2 setUserVolumeCacheFolderPath:v8];

    v9 = [(MSDContentCacheManager *)v2 dataVolumeCacheFolderPath];
    v15[0] = v9;
    v10 = [(MSDContentCacheManager *)v2 demoVolumeCacheFolderPath];
    v15[1] = v10;
    v11 = [(MSDContentCacheManager *)v2 userVolumeCacheFolderPath];
    v15[2] = v11;
    v12 = +[NSArray arrayWithObjects:v15 count:3];
    [(MSDContentCacheManager *)v2 setFileDownloadCachePaths:v12];

    [(MSDContentCacheManager *)v2 _loadCachedManifestPaths];
    [(MSDContentCacheManager *)v2 createDownloadCacheFolders];
    [(MSDContentCacheManager *)v2 loadAppPatchesList];
  }
  return v2;
}

- (void)clearCache
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = [(MSDContentCacheManager *)self fileDownloadCachePaths];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138543362;
    long long v15 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
        v10 = [(MSDContentCacheManager *)self fileManager];
        unsigned int v11 = [v10 fileExistsAtPath:v9];

        if (v11)
        {
          v12 = sub_100068600();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v15;
            uint64_t v21 = v9;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", buf, 0xCu);
          }

          v13 = [(MSDContentCacheManager *)self fileManager];
          [v13 removeItemAtPath:v9 error:0];
        }
        objc_super v14 = [(MSDContentCacheManager *)self fileManager];
        [v14 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }

  [(MSDContentCacheManager *)self _clearFactoryCache];
}

- (void)clearCacheExceptFileHashes:(id)a3
{
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v5 = [(MSDContentCacheManager *)self fileDownloadCachePaths];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138543362;
    long long v17 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        v12 = [(MSDContentCacheManager *)self fileManager];
        unsigned int v13 = [v12 fileExistsAtPath:v11];

        if (v13)
        {
          objc_super v14 = sub_100068600();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v17;
            uint64_t v25 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", buf, 0xCu);
          }

          long long v15 = +[NSFileManager defaultManager];
          long long v16 = [v15 contentsOfDirectoryAtPath:v11 error:0];

          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_1000A2FF4;
          v18[3] = &unk_100153B90;
          v18[4] = v11;
          v18[5] = self;
          id v19 = v4;
          [v16 enumerateObjectsUsingBlock:v18];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  [(MSDContentCacheManager *)self _clearFactoryCache];
}

- (BOOL)copyFileIfPresentInCache:(id)a3 toLocation:(id)a4 verifyHash:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MSDContentCacheManager *)self findFileInCache:v8];
  if (v10)
  {
    if (v5)
    {
      uint64_t v11 = +[MSDFileMetadata fileHashWithPath:v10];
      v12 = [v11 hexStringRepresentation];

      if (![v8 isEqualToString:v12])
      {
        long long v23 = sub_100068600();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1000DB3E4();
        }

        id v17 = 0;
        goto LABEL_19;
      }
    }
    unsigned int v13 = [(MSDContentCacheManager *)self fileManager];
    unsigned int v14 = [v13 fileExistsAtPath:v9];

    if (v14)
    {
      long long v15 = [(MSDContentCacheManager *)self fileManager];
      id v25 = 0;
      unsigned __int8 v16 = [v15 removeItemAtPath:v9 error:&v25];
      id v17 = v25;

      if ((v16 & 1) == 0)
      {
        v12 = sub_100068600();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_1000DB374();
        }
LABEL_19:

        BOOL v18 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      id v17 = 0;
    }
    id v19 = v17;
    long long v20 = [(MSDContentCacheManager *)self fileManager];
    id v24 = v17;
    unsigned __int8 v21 = [v20 copyItemAtPath:v10 toPath:v9 error:&v24];
    id v17 = v24;

    if ((v21 & 1) == 0)
    {
      v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000DB304();
      }
      goto LABEL_19;
    }
    BOOL v18 = 1;
  }
  else
  {
    BOOL v18 = 0;
    id v17 = 0;
  }
LABEL_13:

  return v18;
}

- (id)fileCachePathFromSourcePath:(id)a3 forBackgroundDownload:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 hasPrefix:@"/private"])
  {
    uint64_t v7 = [v6 substringFromIndex:[@"/private" length]];

    id v6 = (id)v7;
  }
  if (v4)
  {
    uint64_t v8 = [(MSDContentCacheManager *)self demoVolumeCacheFolderPath];
  }
  else if (v6 {
         && ([(MSDContentCacheManager *)self userHomePath],
  }
             id v9 = objc_claimAutoreleasedReturnValue(),
             unsigned int v10 = [v6 hasPrefix:v9],
             v9,
             v10))
  {
    uint64_t v8 = [(MSDContentCacheManager *)self userVolumeCacheFolderPath];
  }
  else
  {
    uint64_t v8 = [(MSDContentCacheManager *)self dataVolumeCacheFolderPath];
  }
  uint64_t v11 = (void *)v8;

  return v11;
}

- (void)addAppDiffPatchFile:(id)a3 sourceAppUID:(id)a4 targetAppUID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned int v10 = +[NSString stringWithFormat:@"%@_%@", v8, v9];
  uint64_t v11 = [(MSDContentCacheManager *)self appPatches];
  objc_sync_enter(v11);
  v12 = [(MSDContentCacheManager *)self appPatches];
  [v12 setObject:v13 forKey:v10];

  [(MSDContentCacheManager *)self saveAppPatchesList];
  objc_sync_exit(v11);
}

- (void)removeAppDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = +[NSString stringWithFormat:@"%@_%@", v10, v6];
  id v8 = [(MSDContentCacheManager *)self appPatches];
  objc_sync_enter(v8);
  id v9 = [(MSDContentCacheManager *)self appPatches];
  [v9 removeObjectForKey:v7];

  [(MSDContentCacheManager *)self saveAppPatchesList];
  objc_sync_exit(v8);
}

- (id)appDiffPatchFileForSourceAppUID:(id)a3 targetAppUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSString stringWithFormat:@"%@_%@", v6, v7];
  id v9 = [(MSDContentCacheManager *)self appPatches];
  objc_sync_enter(v9);
  id v10 = [(MSDContentCacheManager *)self appPatches];
  uint64_t v11 = [v10 objectForKey:v8];

  objc_sync_exit(v9);

  return v11;
}

- (id)findFileInCache:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(MSDContentCacheManager *)self fileDownloadCachePaths];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) stringByAppendingPathComponent:v4];
      uint64_t v11 = [(MSDContentCacheManager *)self fileManager];
      unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

      if (v12) {
        break;
      }

      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    id v10 = 0;
  }

  return v10;
}

- (unint64_t)fileSizeInCache:(id)a3
{
  id v4 = [(MSDContentCacheManager *)self findFileInCache:a3];
  BOOL v5 = [(MSDContentCacheManager *)self fileManager];
  id v6 = [v5 attributesOfItemAtPath:v4 error:0];

  if (v6) {
    id v7 = [v6 fileSize];
  }
  else {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (BOOL)deleteFromCache:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MSDContentCacheManager *)self findFileInCache:v4];
  if (!v5)
  {
    uint64_t v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000DB450();
    }
    id v8 = 0;
    goto LABEL_10;
  }
  id v6 = [(MSDContentCacheManager *)self fileManager];
  id v13 = 0;
  unsigned __int8 v7 = [v6 removeItemAtPath:v5 error:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v12 = [v8 localizedDescription];
      *(_DWORD *)buf = 138543874;
      id v15 = v4;
      __int16 v16 = 2114;
      long long v17 = v5;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to delete hash: %{public}@ with path: %{public}@ from cache; error: %{public}@",
        buf,
        0x20u);
    }
LABEL_10:

    BOOL v9 = 0;
    goto LABEL_4;
  }
  BOOL v9 = 1;
LABEL_4:

  return v9;
}

- (void)createDownloadCacheFolders
{
  v3 = +[MSDHelperAgent sharedInstance];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(MSDContentCacheManager *)self fileDownloadCachePaths];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        id v10 = [(MSDContentCacheManager *)self fileManager];
        unsigned __int8 v11 = [v10 fileExistsAtPath:v9];

        if ((v11 & 1) == 0) {
          [v3 prepareWorkDirectory:v9 writableByNonRoot:1];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)loadAppPatchesList
{
  v3 = [(MSDContentCacheManager *)self fileManager];
  id v4 = [(MSDContentCacheManager *)self appPatchesListFileURL];
  id v5 = [v4 path];
  unsigned int v6 = [v3 fileExistsAtPath:v5];

  if (v6)
  {
    uint64_t v7 = [(MSDContentCacheManager *)self appPatchesListFileURL];
    id v12 = 0;
    id v8 = +[NSDictionary dictionaryWithContentsOfURL:v7 error:&v12];
    id v9 = v12;

    if (v8)
    {
      id v10 = [v8 mutableCopy];
      [(MSDContentCacheManager *)self setAppPatches:v10];
    }
    else
    {
      id v10 = sub_100068600();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000DB4BC(v9, v10);
      }
    }
  }
  else
  {
    id v11 = objc_alloc_init((Class)NSMutableDictionary);
    [(MSDContentCacheManager *)self setAppPatches:v11];
  }
}

- (void)saveAppPatchesList
{
  v3 = [(MSDContentCacheManager *)self appPatches];
  id v4 = [(MSDContentCacheManager *)self appPatchesListFileURL];
  id v8 = 0;
  unsigned __int8 v5 = [v3 writeToURL:v4 error:&v8];
  id v6 = v8;

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = sub_100068600();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000DB548(v6, v7);
    }
  }
}

- (void)_loadCachedManifestPaths
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = sub_1000A4004;
  id v12 = sub_1000A4014;
  id v13 = (id)objc_opt_new();
  v3 = +[NSFileManager defaultManager];
  id v4 = [v3 contentsOfDirectoryAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest" error:0];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000A401C;
  v7[3] = &unk_100153800;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  unsigned __int8 v5 = +[NSArray arrayWithArray:v9[5]];
  cachedManifestPaths = self->_cachedManifestPaths;
  self->_cachedManifestPaths = v5;

  _Block_object_dispose(&v8, 8);
}

- (void)_clearFactoryCache
{
  v3 = [(MSDContentCacheManager *)self fileManager];
  unsigned int v4 = [v3 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest"];

  if (v4)
  {
    unsigned __int8 v5 = sub_100068600();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      CFStringRef v12 = @"/var/MSDWorkContainer/.MSD_cache_manifest";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v6 = [(MSDContentCacheManager *)self fileManager];
    [v6 removeItemAtPath:@"/var/MSDWorkContainer/.MSD_cache_manifest" error:0];
  }
  uint64_t v7 = [(MSDContentCacheManager *)self fileManager];
  unsigned int v8 = [v7 fileExistsAtPath:@"/var/MSDWorkContainer/.MSD_cache_content_plist"];

  if (v8)
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      CFStringRef v12 = @"/var/MSDWorkContainer/.MSD_cache_content_plist";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clearing the cache at path: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v10 = [(MSDContentCacheManager *)self fileManager];
    [v10 removeItemAtPath:@"/var/MSDWorkContainer/.MSD_cache_content_plist" error:0];
  }
}

- (NSArray)cachedManifestPaths
{
  return self->_cachedManifestPaths;
}

- (NSArray)fileDownloadCachePaths
{
  return self->_fileDownloadCachePaths;
}

- (void)setFileDownloadCachePaths:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSMutableDictionary)appPatches
{
  return self->_appPatches;
}

- (void)setAppPatches:(id)a3
{
}

- (NSURL)appPatchesListFileURL
{
  return self->_appPatchesListFileURL;
}

- (void)setAppPatchesListFileURL:(id)a3
{
}

- (NSString)dataVolumeCacheFolderPath
{
  return self->_dataVolumeCacheFolderPath;
}

- (void)setDataVolumeCacheFolderPath:(id)a3
{
}

- (NSString)demoVolumeCacheFolderPath
{
  return self->_demoVolumeCacheFolderPath;
}

- (void)setDemoVolumeCacheFolderPath:(id)a3
{
}

- (NSString)userVolumeCacheFolderPath
{
  return self->_userVolumeCacheFolderPath;
}

- (void)setUserVolumeCacheFolderPath:(id)a3
{
}

- (NSString)userHomePath
{
  return self->_userHomePath;
}

- (void)setUserHomePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHomePath, 0);
  objc_storeStrong((id *)&self->_userVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_demoVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_dataVolumeCacheFolderPath, 0);
  objc_storeStrong((id *)&self->_appPatchesListFileURL, 0);
  objc_storeStrong((id *)&self->_appPatches, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_fileDownloadCachePaths, 0);

  objc_storeStrong((id *)&self->_cachedManifestPaths, 0);
}

@end