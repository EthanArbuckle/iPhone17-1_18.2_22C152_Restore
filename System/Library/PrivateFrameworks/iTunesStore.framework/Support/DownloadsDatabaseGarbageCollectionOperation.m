@interface DownloadsDatabaseGarbageCollectionOperation
+ (BOOL)garbageCollectionTimerIsExpired;
- (void)_garbageCollectPersistentManagers;
- (void)_garbageCollectSoftwareDownloads;
- (void)_garbageCollectWorkingDirectory;
- (void)_garbageCollectWorkingDirectoryPath:(id)a3;
- (void)run;
@end

@implementation DownloadsDatabaseGarbageCollectionOperation

+ (BOOL)garbageCollectionTimerIsExpired
{
  v2 = (void *)CFPreferencesCopyAppValue(@"DownloadsScratchGarbageCollectionTime", kSSUserDefaultsIdentifier);
  v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    BOOL v5 = v4 < -86400.0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)run
{
  [(DownloadsDatabaseGarbageCollectionOperation *)self _garbageCollectWorkingDirectory];
  [(DownloadsDatabaseGarbageCollectionOperation *)self _garbageCollectPersistentManagers];
  [(DownloadsDatabaseGarbageCollectionOperation *)self _garbageCollectSoftwareDownloads];
  v3 = +[NSDate date];
  CFStringRef v4 = (const __CFString *)kSSUserDefaultsIdentifier;
  CFPreferencesSetAppValue(@"DownloadsScratchGarbageCollectionTime", v3, kSSUserDefaultsIdentifier);
  CFPreferencesAppSynchronize(v4);

  [(DownloadsDatabaseGarbageCollectionOperation *)self setSuccess:1];
}

- (void)_garbageCollectPersistentManagers
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = +[DownloadsDatabase downloadsDatabase];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001852E8;
  v20[3] = &unk_1003A85F8;
  id v4 = v2;
  id v21 = v4;
  [v3 readUsingTransactionBlock:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001854D8;
  v18[3] = &unk_1003A8620;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v19 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v18];
  if ([v5 count])
  {
    v6 = +[SSLogConfig sharedDaemonConfig];
    if (!v6)
    {
      v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
      v8 &= 2u;
    }
    if (v8)
    {
      v10 = objc_opt_class();
      id v11 = v10;
      id v12 = [v5 count];
      int v22 = 138412546;
      v23 = v10;
      __int16 v24 = 2048;
      id v25 = v12;
      LODWORD(v15) = 22;
      v13 = (void *)_os_log_send_and_compose_impl();

      if (!v13)
      {
LABEL_13:

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_10018554C;
        v16[3] = &unk_1003A5648;
        id v17 = v5;
        id v14 = [v3 modifyUsingTransactionBlock:v16];

        goto LABEL_14;
      }
      v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4, &v22, v15);
      free(v13);
      SSFileLog();
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_garbageCollectSoftwareDownloads
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    v5 &= 2u;
  }
  if (!v5) {
    goto LABEL_11;
  }
  int v13 = 138412290;
  id v14 = (id)objc_opt_class();
  id v7 = v14;
  LODWORD(v11) = 12;
  int v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    v6 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v13, v11);
    free(v8);
    SSFileLog();
LABEL_11:
  }
  v9 = +[DownloadsDatabase downloadsDatabase];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100185858;
  v12[3] = &unk_1003A5648;
  v12[4] = self;
  id v10 = [v9 modifyUsingTransactionBlock:v12];
}

- (void)_garbageCollectWorkingDirectory
{
  v3 = +[ScratchManager baseDirectoryPath];
  [(DownloadsDatabaseGarbageCollectionOperation *)self _garbageCollectWorkingDirectoryPath:v3];

  unsigned int v4 = +[ApplicationWorkspace defaultWorkspace];
  unsigned int v5 = [v4 isMultiUser];

  if (v5)
  {
    id v6 = +[ScratchManager containerDirectoryPath];
    [(DownloadsDatabaseGarbageCollectionOperation *)self _garbageCollectWorkingDirectoryPath:v6];
  }
}

- (void)_garbageCollectWorkingDirectoryPath:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4)
  {
    unsigned int v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  id v7 = [v4 OSLogObject];
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    int v68 = 138412546;
    id v69 = (id)objc_opt_class();
    __int16 v70 = 2112;
    id v71 = v3;
    id v8 = v69;
    LODWORD(v46) = 22;
    v44 = &v68;
    v9 = (void *)_os_log_send_and_compose_impl();

    if (!v9) {
      goto LABEL_12;
    }
    id v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v68, v46);
    free(v9);
    v44 = (int *)v7;
    SSFileLog();
  }

LABEL_12:
  id v10 = objc_alloc_init((Class)NSFileManager);
  id v11 = objc_alloc_init((Class)NSMutableSet);
  [v10 contentsOfDirectoryAtPath:v3 error:0];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v63;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v63 != v14) {
          objc_enumerationMutation(obj);
        }
        id v16 = objc_msgSend(*(id *)(*((void *)&v62 + 1) + 8 * i), "longLongValue", v44);
        if (v16)
        {
          id v17 = [objc_alloc((Class)NSNumber) initWithLongLong:v16];
          [v11 addObject:v17];
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v62 objects:v67 count:16];
    }
    while (v13);
  }
  if (objc_msgSend(v11, "count", v44))
  {
    v18 = +[DownloadsDatabase downloadsDatabase];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100186384;
    v57[3] = &unk_1003A7768;
    id v19 = v11;
    id v58 = v19;
    v59 = self;
    id v49 = v3;
    id v20 = v3;
    id v60 = v20;
    id v48 = v10;
    id v21 = v10;
    id v61 = v21;
    [v18 readUsingTransactionBlock:v57];

    int v22 = +[SSLogConfig sharedDaemonConfig];
    if (!v22)
    {
      int v22 = +[SSLogConfig sharedConfig];
    }
    id v47 = v11;
    unsigned int v23 = [v22 shouldLog];
    if ([v22 shouldLogToDisk]) {
      int v24 = v23 | 2;
    }
    else {
      int v24 = v23;
    }
    id v25 = [v22 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
      int v26 = v24;
    }
    else {
      int v26 = v24 & 2;
    }
    if (v26)
    {
      v27 = objc_opt_class();
      id v28 = v27;
      id v29 = [v19 count];
      int v68 = 138412546;
      id v69 = v27;
      __int16 v70 = 2048;
      id v71 = v29;
      LODWORD(v46) = 22;
      v45 = &v68;
      v30 = (void *)_os_log_send_and_compose_impl();

      if (!v30)
      {
LABEL_34:

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v50 = v19;
        id v31 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
        if (!v31) {
          goto LABEL_51;
        }
        id v32 = v31;
        uint64_t v33 = *(void *)v54;
        while (1)
        {
          v34 = 0;
          v35 = &syslog_ptr;
          do
          {
            if (*(void *)v54 != v33) {
              objc_enumerationMutation(v50);
            }
            v36 = objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)v34), "stringValue", v45, v46);
            v37 = [v20 stringByAppendingPathComponent:v36];

            [v21 removeItemAtPath:v37 error:0];
            v38 = [v35[405] sharedDaemonConfig];
            if (!v38)
            {
              v38 = [v35[405] sharedConfig];
            }
            unsigned int v39 = [v38 shouldLog];
            if ([v38 shouldLogToDisk]) {
              v39 |= 2u;
            }
            v40 = [v38 OSLogObject];
            if (!os_log_type_enabled(v40, OS_LOG_TYPE_INFO)) {
              v39 &= 2u;
            }
            if (v39)
            {
              v41 = objc_opt_class();
              int v68 = 138412546;
              id v69 = v41;
              __int16 v70 = 2112;
              id v71 = v37;
              id v42 = v41;
              LODWORD(v46) = 22;
              v45 = &v68;
              v43 = (void *)_os_log_send_and_compose_impl();

              v35 = &syslog_ptr;
              if (!v43) {
                goto LABEL_49;
              }
              v40 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v43, 4, &v68, v46);
              free(v43);
              v45 = (int *)v40;
              SSFileLog();
            }

LABEL_49:
            v34 = (char *)v34 + 1;
          }
          while (v32 != v34);
          id v32 = [v50 countByEnumeratingWithState:&v53 objects:v66 count:16];
          if (!v32)
          {
LABEL_51:

            id v10 = v48;
            id v3 = v49;
            id v11 = v47;
            goto LABEL_52;
          }
        }
      }
      id v25 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v30, 4, &v68, v46);
      free(v30);
      v45 = (int *)v25;
      SSFileLog();
    }

    goto LABEL_34;
  }
LABEL_52:
}

@end