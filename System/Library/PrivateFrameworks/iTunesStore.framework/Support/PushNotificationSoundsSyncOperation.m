@interface PushNotificationSoundsSyncOperation
- (BOOL)_downloadSoundFileWithURL:(id)a3 name:(id)a4 cache:(id)a5 error:(id *)a6;
- (BOOL)_downloadSoundFiles:(id)a3 error:(id *)a4;
- (id)_newSoundFileURLCache;
- (void)run;
@end

@implementation PushNotificationSoundsSyncOperation

- (void)run
{
  uint64_t v17 = 0;
  v3 = +[SSURLBagContext contextWithBagType:0];
  if ([(PushNotificationSoundsSyncOperation *)self loadURLBagWithContext:v3 returningError:&v17])
  {
    id v4 = objc_msgSend(objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", v3), "valueForKey:", @"push-notifications");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKey:@"sound-files"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
    }
    else
    {
      id v6 = 0;
    }
    BOOL v14 = [(PushNotificationSoundsSyncOperation *)self _downloadSoundFiles:v6 error:&v17];
  }
  else
  {
    id v7 = +[SSLogConfig sharedDaemonConfig];
    if (!v7) {
      id v7 = +[SSLogConfig sharedConfig];
    }
    unsigned int v8 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v9 = v8 | 2;
    }
    else {
      int v9 = v8;
    }
    if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v9 &= 2u;
    }
    if (v9)
    {
      uint64_t v10 = objc_opt_class();
      int v18 = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      LODWORD(v16) = 22;
      v15 = &v18;
      uint64_t v11 = _os_log_send_and_compose_impl();
      if (v11)
      {
        v12 = (void *)v11;
        v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v18, v16);
        free(v12);
        v15 = (int *)v13;
        SSFileLog();
      }
    }
    BOOL v14 = 0;
  }
  -[PushNotificationSoundsSyncOperation setError:](self, "setError:", v17, v15);
  [(PushNotificationSoundsSyncOperation *)self setSuccess:v14];
}

- (BOOL)_downloadSoundFileWithURL:(id)a3 name:(id)a4 cache:(id)a5 error:(id *)a6
{
  v50 = 0;
  id v10 = [objc_alloc((Class)NSURLRequest) initWithURL:a3];
  id v48 = a5;
  id v11 = [a5 cachedResponseForRequest:v10];
  if (!v11) {
    goto LABEL_12;
  }
  objc_msgSend(objc_msgSend(v11, "response"), "_calculatedExpiration");
  double v13 = v12;
  id v14 = +[SSLogConfig sharedDaemonConfig];
  if (!v14) {
    id v14 = +[SSLogConfig sharedConfig];
  }
  unsigned int v15 = [v14 shouldLog];
  if ([v14 shouldLogToDisk]) {
    v15 |= 2u;
  }
  if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_INFO)) {
    v15 &= 2u;
  }
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    +[NSDate timeIntervalSinceReferenceDate];
    int v51 = 138412546;
    uint64_t v52 = v16;
    __int16 v53 = 2048;
    double v54 = v13 - v17;
    LODWORD(v47) = 22;
    v45 = &v51;
    uint64_t v18 = _os_log_send_and_compose_impl();
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      __int16 v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, &v51, v47);
      free(v19);
      v45 = (int *)v20;
      SSFileLog();
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  if (v13 >= v21)
  {
    LOBYTE(v32) = 1;
  }
  else
  {
LABEL_12:
    id v22 = objc_alloc_init((Class)ISStoreURLOperation);
    id v23 = [objc_alloc((Class)SSMutableURLRequestProperties) initWithURL:a3];
    [v23 setCachePolicy:1];
    [v22 setRequestProperties:v23];

    id v24 = objc_alloc_init((Class)ISHashedDownloadProvider);
    objc_msgSend(v24, "setLocalFilePath:", objc_msgSend(+[PushNotificationController soundFilesDirectoryPath](PushNotificationController, "soundFilesDirectoryPath"), "stringByAppendingPathComponent:", a4));
    [v24 resetStream];
    id v25 = +[SSLogConfig sharedDaemonConfig];
    if (!v25) {
      id v25 = +[SSLogConfig sharedConfig];
    }
    unsigned int v26 = [v25 shouldLog];
    if ([v25 shouldLogToDisk]) {
      v26 |= 2u;
    }
    if (!os_log_type_enabled((os_log_t)[v25 OSLogObject], OS_LOG_TYPE_INFO)) {
      v26 &= 2u;
    }
    if (v26)
    {
      uint64_t v27 = objc_opt_class();
      id v28 = [v24 localFilePath];
      int v51 = 138412802;
      uint64_t v52 = v27;
      __int16 v53 = 2112;
      double v54 = *(double *)&a3;
      __int16 v55 = 2112;
      id v56 = v28;
      LODWORD(v47) = 32;
      v45 = &v51;
      uint64_t v29 = _os_log_send_and_compose_impl();
      if (v29)
      {
        v30 = (void *)v29;
        v31 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v29, 4, &v51, v47);
        free(v30);
        v45 = (int *)v31;
        SSFileLog();
      }
    }
    objc_msgSend(v22, "setDataProvider:", v24, v45);

    unsigned int v32 = [(PushNotificationSoundsSyncOperation *)self runSubOperation:v22 returningError:&v50];
    if (v32)
    {
      id v33 = [objc_alloc((Class)NSMutableData) initWithLength:1];
      id v34 = objc_msgSend(objc_alloc((Class)NSCachedURLResponse), "initWithResponse:data:", objc_msgSend(v22, "response"), v33);
      id v35 = +[SSLogConfig sharedDaemonConfig];
      if (!v35) {
        id v35 = +[SSLogConfig sharedConfig];
      }
      unsigned int v36 = [v35 shouldLog];
      if ([v35 shouldLogToDisk]) {
        v36 |= 2u;
      }
      if (!os_log_type_enabled((os_log_t)[v35 OSLogObject], OS_LOG_TYPE_INFO)) {
        v36 &= 2u;
      }
      if (v36)
      {
        uint64_t v37 = objc_opt_class();
        objc_msgSend(objc_msgSend(v22, "response"), "_calculatedExpiration");
        double v39 = v38;
        +[NSDate timeIntervalSinceReferenceDate];
        int v51 = 138412546;
        uint64_t v52 = v37;
        __int16 v53 = 2048;
        double v54 = v39 - v40;
        LODWORD(v47) = 22;
        v46 = &v51;
        uint64_t v41 = _os_log_send_and_compose_impl();
        if (v41)
        {
          v42 = (void *)v41;
          v43 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v41, 4, &v51, v47);
          free(v42);
          v46 = (int *)v43;
          SSFileLog();
        }
      }
      objc_msgSend(v48, "storeCachedResponse:forRequest:", v34, v10, v46);
      [v48 saveMemoryCacheToDisk];
    }
  }

  if (a6) {
    *a6 = v50;
  }
  return v32;
}

- (BOOL)_downloadSoundFiles:(id)a3 error:(id *)a4
{
  id v6 = objc_alloc_init((Class)NSFileManager);
  id v7 = +[PushNotificationController soundFilesDirectoryPath];
  [v6 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = [v6 contentsOfDirectoryAtPath:v7 error:0];
  if (v9) {
    [v8 addObjectsFromArray:v9];
  }
  id v48 = a3;
  id v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10) {
    id v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_INFO)) {
    v12 &= 2u;
  }
  if (v12)
  {
    *(_DWORD *)v59 = 138412546;
    *(void *)&v59[4] = objc_opt_class();
    __int16 v60 = 2048;
    id v61 = [v48 count];
    LODWORD(v43) = 22;
    uint64_t v41 = (NSString *)v59;
    uint64_t v13 = _os_log_send_and_compose_impl();
    if (v13)
    {
      id v14 = (void *)v13;
      unsigned int v15 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, v59, v43);
      free(v14);
      uint64_t v41 = v15;
      SSFileLog();
    }
  }
  uint64_t v16 = v48;
  if (objc_msgSend(v48, "count", v41))
  {
    id v44 = [(PushNotificationSoundsSyncOperation *)self _newSoundFileURLCache];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v17 = [v48 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v47 = 0;
      uint64_t v19 = *(void *)v54;
      int v46 = 1;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v54 != v19) {
            objc_enumerationMutation(v16);
          }
          double v21 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = [v21 objectForKey:@"name"];
            id v23 = [v21 objectForKey:@"url"];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v24 = [objc_alloc((Class)NSURL) initWithString:v23];
                if (v24)
                {
                  id v25 = v24;
                  *(void *)v59 = 0;
                  v46 &= [(PushNotificationSoundsSyncOperation *)self _downloadSoundFileWithURL:v24 name:v22 cache:v44 error:v59];
                  unsigned int v26 = v47;
                  if (!v47) {
                    unsigned int v26 = *(void **)v59;
                  }
                  uint64_t v47 = v26;
                  [v8 removeObject:v22];
                }
              }
            }
            uint64_t v16 = v48;
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v18);
    }
    else
    {
      uint64_t v47 = 0;
      LOBYTE(v46) = 1;
    }

    BOOL v27 = v46 & 1;
  }
  else
  {
    uint64_t v47 = 0;
    BOOL v27 = 1;
  }
  id v28 = +[SSLogConfig sharedDaemonConfig];
  if (!v28) {
    id v28 = +[SSLogConfig sharedConfig];
  }
  unsigned int v29 = [v28 shouldLog];
  if ([v28 shouldLogToDisk]) {
    int v30 = v29 | 2;
  }
  else {
    int v30 = v29;
  }
  if (!os_log_type_enabled((os_log_t)[v28 OSLogObject], OS_LOG_TYPE_INFO)) {
    v30 &= 2u;
  }
  if (v30)
  {
    uint64_t v31 = objc_opt_class();
    id v32 = [v8 count];
    *(_DWORD *)v59 = 138412546;
    *(void *)&v59[4] = v31;
    __int16 v60 = 2048;
    id v61 = v32;
    LODWORD(v43) = 22;
    v42 = (NSString *)v59;
    uint64_t v33 = _os_log_send_and_compose_impl();
    if (v33)
    {
      id v34 = (void *)v33;
      id v35 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v33, 4, v59, v43);
      free(v34);
      v42 = v35;
      SSFileLog();
    }
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v36 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v57, 16, v42);
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v50;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v50 != v38) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v6, "removeItemAtPath:error:", objc_msgSend(v7, "stringByAppendingPathComponent:", *(void *)(*((void *)&v49 + 1) + 8 * (void)j)), 0);
      }
      id v37 = [v8 countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v37);
  }

  if (a4) {
    *a4 = v47;
  }
  return v27;
}

- (id)_newSoundFileURLCache
{
  id v2 = objc_alloc_init((Class)ISURLCacheConfiguration);
  [v2 setPersistentIdentifier:@"com.apple.itunesstored.APNS_Sounds_Cache"];
  [v2 setDiskCapacity:10485760];
  [v2 setMemoryCapacity:0x100000];
  id v3 = [objc_alloc((Class)ISURLCache) initWithCacheConfiguration:v2];

  return v3;
}

@end