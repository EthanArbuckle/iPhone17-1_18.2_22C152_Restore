@interface WebBundleDownloadManager
+ (id)sharedInstance;
- (BOOL)_fileHashesInFiles:(id)a3 areEqualToFilesInDirectory:(id)a4 error:(id *)a5;
- (BOOL)_isVersion:(id)a3 newerThan:(id)a4;
- (BOOL)_saveFileData:(id)a3 toDirectory:(id)a4 toFilePath:(id)a5 error:(id *)a6;
- (BOOL)_saveWebBundleManifestToDevice:(id)a3 error:(id *)a4;
- (BOOL)isWebBundleDownloading;
- (WebBundleDownloadManager)initWithConfiguration:(id)a3;
- (id)_fileHashForFile:(id)a3;
- (id)_loadCachedWebBundleVersion;
- (id)loadWebBundleManifestWithError:(id *)a3;
- (id)observers;
- (void)_downloadCompleteWithNewDirectory:(id)a3 withError:(id)a4;
- (void)_downloadManifestWithForce:(BOOL)a3 completion:(id)a4;
- (void)_downloadWebBundleFileWithPath:(id)a3 inDirectory:(id)a4 withCompletion:(id)a5;
- (void)_downloadWebBundleWithForce:(BOOL)a3;
- (void)_updateCachedBundleFromBuiltInDirectoryWithManifest:(id)a3 error:(id *)a4;
- (void)_updateCachedBundleFromDownloadedBundleDirectoryWithManifest:(id)a3 error:(id *)a4;
- (void)_updateCachedWebBundleVersion:(id)a3;
- (void)_updateOnDevicesWebBundleIfNeed;
- (void)addObserver:(id)a3;
- (void)downloadWebBundle;
- (void)removeObserver:(id)a3;
- (void)setWebBundleDownloading:(BOOL)a3;
@end

@implementation WebBundleDownloadManager

- (id)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___WebBundleDownloadManagerObserver queue:&_dispatch_main_q];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (WebBundleDownloadManager)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WebBundleDownloadManager;
  v6 = [(WebBundleDownloadManager *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.maps.webbundle.downloading", v8);
    downloadingQueue = v7->_downloadingQueue;
    v7->_downloadingQueue = (OS_dispatch_queue *)v9;

    [(WebBundleDownloadManager *)v7 _updateOnDevicesWebBundleIfNeed];
  }

  return v7;
}

- (void)_downloadCompleteWithNewDirectory:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = sub_1000B8184();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Download failed with error:%@", (uint8_t *)&v13, 0xCu);
    }

    dispatch_queue_t v9 = [(WebBundleDownloadManager *)self observers];
    [v9 webBundleEncounteredError:v7];
LABEL_5:

    goto LABEL_10;
  }
  v10 = sub_1000B8184();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v11)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Web bundle hasn't changed", (uint8_t *)&v13, 2u);
    }

    dispatch_queue_t v9 = [(WebBundleDownloadManager *)self observers];
    [v9 webBundleHadNoChanges];
    goto LABEL_5;
  }
  if (v11)
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Download complete with new directory: %@", (uint8_t *)&v13, 0xCu);
  }

  objc_super v12 = [(WebBundleDownloadManager *)self observers];
  [v12 webBundleUpdatedWithWebBundlePath:v6];

  [(WebBundleConfiguration *)self->_configuration setWebBundleDirectory:v6];
  +[RAPWebBundleConfigurationManager saveConfiguration:self->_configuration];
  [(WebBundleDownloadManager *)self _updateOnDevicesWebBundleIfNeed];
LABEL_10:
  [(WebBundleDownloadManager *)self setWebBundleDownloading:0];
}

- (void)_updateOnDevicesWebBundleIfNeed
{
  id v13 = 0;
  v3 = [(WebBundleDownloadManager *)self loadWebBundleManifestWithError:&v13];
  id v4 = v13;
  if (v4)
  {
    id v5 = sub_1000B8184();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "manifest loading error: %@", buf, 0xCu);
    }
  }
  id v6 = [(WebBundleConfiguration *)self->_configuration absoluteBuiltInWebBundleDirectory];
  id v7 = [v6 URLByAppendingPathComponent:@"manifest.json"];

  v8 = +[NSData dataWithContentsOfURL:v7];
  if (!v8)
  {
    dispatch_queue_t v9 = sub_1000B8184();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Empty data in built-in manifest at path: %@", buf, 0xCu);
    }
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000B7D7C;
  v11[3] = &unk_101321BB8;
  v11[4] = self;
  id v12 = v3;
  id v10 = v3;
  +[WebBundleFileHelper parseManifestFileFromData:v8 withCompletion:v11];
}

- (void)_downloadManifestWithForce:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  id v7 = +[GEOResourceManifestManager modernManager];
  v8 = [v7 activeTileGroup];
  dispatch_queue_t v9 = [v8 explicitResources];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000266A0;
  v18[3] = &unk_101321B40;
  objc_copyWeak(&v19, &location);
  id v10 = +[NSPredicate predicateWithBlock:v18];
  BOOL v11 = [v9 filteredArrayUsingPredicate:v10];

  id v12 = +[GEOResourceRequester sharedRequester];
  global_queue = (void *)geo_get_global_queue();
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000353D0;
  v15[3] = &unk_1012EB628;
  objc_copyWeak(&v17, &location);
  id v14 = v6;
  id v16 = v14;
  [v12 fetchResources:v11 force:v4 manifestConfiguration:0 auditToken:0 queue:global_queue handler:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

- (id)loadWebBundleManifestWithError:(id *)a3
{
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [(WebBundleConfiguration *)self->_configuration manifestKey];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    BOOL v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v7 error:a3];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_loadCachedWebBundleVersion
{
  v3 = +[NSUserDefaults standardUserDefaults];
  BOOL v4 = [v3 stringForKey:@"kRAPBuiltInWebBundleVersionKey"];

  if (v4)
  {
    id v5 = sub_1000B8184();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found RAPCachedWebBundleVersionKey key in NSUserDefaults when loading cached web bundle. Load using NSUserDefaults string, setting GEOConfig with version, then removing from NSUserDefaults.", (uint8_t *)&v16, 2u);
    }

    id v6 = [v3 stringForKey:@"kRAPBuiltInWebBundleVersionKey"];
    GEOConfigSetString();
    [v3 removeObjectForKey:@"kRAPBuiltInWebBundleVersionKey"];
  }
  else
  {
    id v6 = GEOConfigGetString();
  }
  id v7 = +[NSFileManager defaultManager];
  uint64_t v8 = [(WebBundleConfiguration *)self->_configuration absoluteCachedWebBundleDirectory];
  uint64_t v9 = [v8 path];
  uint64_t v10 = [v7 contentsOfDirectoryAtPath:v9 error:0];

  BOOL v11 = sub_1000B8184();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = [v10 count];
    id v13 = [(WebBundleConfiguration *)self->_configuration absoluteCachedWebBundleDirectory];
    int v16 = 134218242;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "number of files in cached web bundle directory: %lu, directory:%@", (uint8_t *)&v16, 0x16u);
  }
  if ([v10 count]) {
    id v14 = v6;
  }
  else {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)_fileHashesInFiles:(id)a3 areEqualToFilesInDirectory:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        int v16 = [v15 filePath];
        id v17 = [v9 URLByAppendingPathComponent:v16];

        __int16 v18 = [(WebBundleDownloadManager *)self _fileHashForFile:v17];
        id v19 = [v15 fileHash];
        if (([v18 isEqualToString:v19] & 1) == 0)
        {
          v21 = +[NSFileManager defaultManager];
          v22 = [v17 path];
          unsigned int v23 = [v21 fileExistsAtPath:v22];

          v24 = sub_1000B8184();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            if (v23) {
              CFStringRef v25 = &stru_101324E70;
            }
            else {
              CFStringRef v25 = @" NOT";
            }
            v26 = [v17 absoluteString];
            *(_DWORD *)buf = 138412546;
            CFStringRef v33 = v25;
            __int16 v34 = 2112;
            v35 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "File%@ exists and hashes doesn't match: %@", buf, 0x16u);
          }
          if (a5)
          {
            *a5 = +[NSError errorWithDomain:@"com.apple.Maps.ReportAProblem.Downloader" code:-4 userInfo:0];
          }

          BOOL v20 = 0;
          goto LABEL_18;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v20 = 1;
LABEL_18:

  return v20;
}

- (id)_fileHashForFile:(id)a3
{
  v3 = +[NSData dataWithContentsOfURL:a3];
  if (v3)
  {
    BOOL v4 = +[NSMutableData dataWithLength:32];
    id v5 = v3;
    id v6 = [v5 bytes];
    LODWORD(v5) = [v5 length];
    id v7 = v4;
    CC_SHA256(v6, (CC_LONG)v5, (unsigned __int8 *)[v7 mutableBytes]);
    id v8 = [v7 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v8 = &stru_101324E70;
  }

  return v8;
}

- (BOOL)_isVersion:(id)a3 newerThan:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    if ([v6 length]) {
      BOOL v7 = [v5 compare:v6 options:64] == (id)1;
    }
    else {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setWebBundleDownloading:(BOOL)a3
{
  self->_webBundleDownloading = a3;
}

- (BOOL)isWebBundleDownloading
{
  return self->_webBundleDownloading;
}

- (void)downloadWebBundle
{
}

- (void)_downloadWebBundleWithForce:(BOOL)a3
{
  if (![(WebBundleDownloadManager *)self isWebBundleDownloading])
  {
    [(WebBundleDownloadManager *)self setWebBundleDownloading:1];
    downloadingQueue = self->_downloadingQueue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10004D55C;
    v6[3] = &unk_1012E6300;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(downloadingQueue, v6);
  }
}

+ (id)sharedInstance
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBundleDownloadManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(WebBundleDownloadManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)_downloadWebBundleFileWithPath:(id)a3 inDirectory:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WebBundleConfiguration *)self->_configuration serverURL];
  id v12 = [v11 URLByAppendingPathComponent:v8];

  uint64_t v13 = +[NSURLRequest requestWithURL:v12];
  objc_initWeak(&location, self);
  id v14 = +[NSURLSession sharedSession];
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  v21 = sub_100CFDA4C;
  v22 = &unk_101321B90;
  objc_copyWeak(&v27, &location);
  id v15 = v10;
  id v26 = v15;
  unsigned int v23 = self;
  id v16 = v9;
  id v24 = v16;
  id v17 = v8;
  id v25 = v17;
  __int16 v18 = [v14 dataTaskWithRequest:v13 completionHandler:&v19];

  [v18 resume:v19, v20, v21, v22, v23];
  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
}

- (BOOL)_saveWebBundleManifestToDevice:(id)a3 error:(id *)a4
{
  id v6 = a3;
  BOOL v7 = +[NSUserDefaults standardUserDefaults];
  id v13 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v13];

  id v9 = v13;
  id v10 = v9;
  if (v9)
  {
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v11 = [(WebBundleConfiguration *)self->_configuration manifestKey];
    [v7 setObject:v8 forKey:v11];

    [v7 synchronize];
  }

  return v10 == 0;
}

- (BOOL)_saveFileData:(id)a3 toDirectory:(id)a4 toFilePath:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a4 URLByAppendingPathComponent:a5];
  id v11 = [v10 URLByDeletingLastPathComponent];
  id v12 = +[NSFileManager defaultManager];
  id v20 = 0;
  [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v20];
  id v13 = v20;

  if (v13)
  {
    if (a6) {
      *a6 = v13;
    }
    id v14 = sub_1000B8184();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Directory %@ creation error: %@", buf, 0x16u);
    }

LABEL_7:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  id v19 = 0;
  [v9 writeToURL:v10 options:0 error:&v19];
  id v13 = v19;
  id v17 = sub_1000B8184();
  __int16 v18 = v17;
  if (v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v22 = v10;
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "File %@ saving error: %@", buf, 0x16u);
    }

    if (a6)
    {
      id v13 = v13;
      BOOL v15 = 0;
      *a6 = v13;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "File downloaded: %@", buf, 0xCu);
  }

  id v13 = 0;
  BOOL v15 = 1;
LABEL_8:

  return v15;
}

- (void)_updateCachedWebBundleVersion:(id)a3
{
}

- (void)_updateCachedBundleFromDownloadedBundleDirectoryWithManifest:(id)a3 error:(id *)a4
{
  configuration = self->_configuration;
  id v7 = a3;
  id v9 = [(WebBundleConfiguration *)configuration absoluteCachedWebBundleDirectory];
  id v8 = [(WebBundleConfiguration *)self->_configuration webBundleDirectory];
  +[WebBundleFileHelper copyWebBundleFilesToDirectory:v9 fromDirectory:v8 webBundleManifest:v7 error:a4];
}

- (void)_updateCachedBundleFromBuiltInDirectoryWithManifest:(id)a3 error:(id *)a4
{
  configuration = self->_configuration;
  id v7 = a3;
  id v9 = [(WebBundleConfiguration *)configuration absoluteCachedWebBundleDirectory];
  id v8 = [(WebBundleConfiguration *)self->_configuration absoluteBuiltInWebBundleDirectory];
  +[WebBundleFileHelper copyWebBundleFilesToDirectory:v9 fromDirectory:v8 webBundleManifest:v7 error:a4];

  [(WebBundleConfiguration *)self->_configuration setWebBundleDirectory:v9];
  +[RAPWebBundleConfigurationManager saveConfiguration:self->_configuration];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_downloadingQueue, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end