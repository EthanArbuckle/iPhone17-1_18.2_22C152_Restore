@interface DMDManagedMediaManager
+ (BOOL)shouldBypassVPPLicenseCheck;
+ (DMDManagedMediaManager)sharedManager;
+ (id)homeSharingCloudClient;
- (DMDManagedMediaManager)init;
- (NSArray)nonStoreBooks;
- (NSArray)storeBooks;
- (NSMutableDictionary)memberQueuePersistentIDToNonStoreBook;
- (NSMutableDictionary)memberQueueiTunesStoreIDToStoreBook;
- (OS_dispatch_queue)memberQueue;
- (void)cancelNonStoreDownloadsWithDownloadIdentifiers:(id)a3 completionBlock:(id)a4;
- (void)cleanUpWithAssertion:(id)a3 completionBlock:(id)a4;
- (void)installNonStoreBook:(id)a3 fileExtension:(id)a4 URL:(id)a5 assertion:(id)a6 completionBlock:(id)a7;
- (void)installStoreBookWithiTunesStoreID:(id)a3 originator:(id)a4 assertion:(id)a5 completionBlock:(id)a6;
- (void)memberQueueCleanUp;
- (void)memberQueueCommitNonStoreBooksManifest;
- (void)memberQueueCommitStoreBooksManifest;
- (void)memberQueueMoveTransientStatesForward;
- (void)memberQueueRereadNonStoreBooksManifest;
- (void)memberQueueRereadStoreBooksManifest;
- (void)moveTransientStatesForward;
- (void)refreshBookPurchaseHistoryCompletion:(id)a3;
- (void)removeNonStoreBookWithPersistentID:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)removeStoreBookWithiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)rereadNonStoreBooksManifestCompletionBlock:(id)a3;
- (void)rereadStoreBooksManifestCompletionBlock:(id)a3;
- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5;
- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 triesLeft:(int)a5 completionBlock:(id)a6;
- (void)setMemberQueue:(id)a3;
- (void)setMemberQueuePersistentIDToNonStoreBook:(id)a3;
- (void)setMemberQueueiTunesStoreIDToStoreBook:(id)a3;
- (void)setNonStoreManagedBook:(id)a3;
- (void)setState:(id)a3 forNonStoreBookWithPersistentID:(id)a4;
- (void)setState:(id)a3 forStoreBookWithiTunesStoreID:(id)a4;
- (void)setStoreManagedBook:(id)a3;
- (void)uprootWithAssertion:(id)a3 completionBlock:(id)a4;
@end

@implementation DMDManagedMediaManager

+ (DMDManagedMediaManager)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053CD8;
  block[3] = &unk_1000C9F80;
  block[4] = a1;
  if (qword_1000FBB48 != -1) {
    dispatch_once(&qword_1000FBB48, block);
  }
  v2 = (void *)qword_1000FBB40;

  return (DMDManagedMediaManager *)v2;
}

+ (id)homeSharingCloudClient
{
  if (qword_1000FBB58 != -1) {
    dispatch_once(&qword_1000FBB58, &stru_1000CB4B8);
  }
  v2 = (void *)qword_1000FBB50;

  return v2;
}

- (DMDManagedMediaManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)DMDManagedMediaManager;
  v3 = [(DMDManagedMediaManager *)&v16 init];
  if (v3)
  {
    v4 = +[DMDPowerAssertion assertionForOperation:@"DMDManagedMediaManager: init"];
    if ((MCHasMDMMigrated() & 1) == 0)
    {
      v13 = +[NSAssertionHandler currentHandler];
      [v13 handleFailureInMethod:a2 object:v3 file:@"DMDManagedMediaManager+iOS.m" lineNumber:130 description:@"Media operations cannot proceed when MDM migration is not complete."];
    }
    dispatch_queue_t v5 = dispatch_queue_create("DMDManagedMediaManager Member Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    memberQueue = v3->_memberQueue;
    v3->_memberQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_opt_new();
    memberQueuePersistentIDToNonStoreBook = v3->_memberQueuePersistentIDToNonStoreBook;
    v3->_memberQueuePersistentIDToNonStoreBook = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    memberQueueiTunesStoreIDToStoreBook = v3->_memberQueueiTunesStoreIDToStoreBook;
    v3->_memberQueueiTunesStoreIDToStoreBook = (NSMutableDictionary *)v9;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100053F30;
    v14[3] = &unk_1000CA508;
    id v15 = v4;
    id v11 = v4;
    [(DMDManagedMediaManager *)v3 cleanUpWithAssertion:v11 completionBlock:v14];
    [v11 stayAliveThroughHereAtLeast];
  }
  return v3;
}

- (void)cleanUpWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  v6 = [(DMDManagedMediaManager *)self memberQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053FEC;
  v8[3] = &unk_1000CA828;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_barrier_async(v6, v8);
}

- (void)memberQueueCleanUp
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cleaning up media manager manifests", buf, 2u);
  }
  v72 = sub_100054B6C();
  [(DMDManagedMediaManager *)self memberQueueRereadNonStoreBooksManifest];
  v74 = objc_opt_new();
  v2 = [v72 downloads];
  id obj = [v2 mutableCopy];

  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  v3 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
  id v4 = [v3 countByEnumeratingWithState:&v105 objects:v116 count:16];
  if (v4)
  {
    char v78 = 0;
    uint64_t v5 = *(void *)v106;
    uint64_t v75 = SSDownloadPhaseFailed;
    uint64_t v73 = SSDownloadPhaseFinished;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v106 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v105 + 1) + 8 * i);
        v8 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
        id v9 = [v8 objectForKeyedSubscript:v7];

        v10 = [v9 downloadIdentifier];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          *(void *)buf = 0;
          v100 = buf;
          uint64_t v101 = 0x3032000000;
          v102 = sub_100054BC0;
          v103 = sub_100054BD0;
          id v104 = 0;
          v12 = [v9 downloadIdentifier];
          id v13 = [v12 longLongValue];

          v98[0] = _NSConcreteStackBlock;
          v98[1] = 3221225472;
          v98[2] = sub_100054BD8;
          v98[3] = &unk_1000CB508;
          v98[4] = buf;
          v98[5] = v13;
          [obj enumerateObjectsUsingBlock:v98];
          v14 = (void *)*((void *)v100 + 5);
          if (v14)
          {
            id v15 = [v14 downloadPhaseIdentifier];
            if ([v15 isEqualToString:v75])
            {
              id v16 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v23 = v3;
                v24 = [v9 friendlyName];
                v25 = [*((id *)v100 + 5) failureError];
                *(_DWORD *)v112 = 138543618;
                v113 = v24;
                __int16 v114 = 2114;
                v115 = v25;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Book failed to download: %{public}@\nError: %{public}@", v112, 0x16u);

                v3 = v23;
              }

              [v9 setDownloadIdentifier:0];
              v17 = [v9 state];
              BOOL v18 = v17 == @"Failed";

              if (!v18)
              {
                [v9 setState:@"Failed"];
                char v78 = 1;
              }
              [v74 addObject:*((void *)v100 + 5)];
            }
            else if ([v15 isEqualToString:v73])
            {
              id v19 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v20 = [v9 friendlyName];
                *(_DWORD *)v112 = 138543362;
                v113 = v20;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Book completed downloading: %{public}@", v112, 0xCu);
              }
              [v9 setDownloadIdentifier:0];
              v21 = [v9 state];
              BOOL v22 = v21 == @"Managed";

              if (!v22)
              {
                [v9 setState:@"Managed"];
                char v78 = 1;
              }
            }
            [obj removeObjectIdenticalTo:*((void *)v100 + 5)];
          }
          _Block_object_dispose(buf, 8);
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v105 objects:v116 count:16];
    }
    while (v4);
  }
  else
  {
    char v78 = 0;
  }

  [v72 finishDownloads:v74];
  if ([obj count])
  {
    v95[0] = _NSConcreteStackBlock;
    v95[1] = 3221225472;
    v95[2] = sub_100054C58;
    v95[3] = &unk_1000C9B78;
    id v96 = v72;
    id v97 = obj;
    [v96 cancelDownloads:v97 completionBlock:v95];
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v26 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
  id v27 = [v26 countByEnumeratingWithState:&v91 objects:v111 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v92;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v92 != v28) {
          objc_enumerationMutation(v26);
        }
        uint64_t v30 = *(void *)(*((void *)&v91 + 1) + 8 * (void)j);
        v31 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
        v32 = [v31 objectForKeyedSubscript:v30];

        v33 = [v32 fullPath];
        if (!v33) {
          goto LABEL_38;
        }
        v34 = +[NSFileManager defaultManager];
        v35 = [v32 fullPath];
        unsigned int v36 = [v34 fileExistsAtPath:v35];

        if (!v36)
        {
LABEL_38:
          v40 = [v32 state];
          BOOL v41 = v40 == @"ManagedButUninstalled";

          CFStringRef v39 = @"ManagedButUninstalled";
          if (v41) {
            goto LABEL_40;
          }
LABEL_39:
          [v32 setState:v39];
          char v78 = 1;
          goto LABEL_40;
        }
        v37 = [v32 state];
        BOOL v38 = v37 == @"Managed";

        CFStringRef v39 = @"Managed";
        if (!v38) {
          goto LABEL_39;
        }
LABEL_40:
      }
      id v27 = [v26 countByEnumeratingWithState:&v91 objects:v111 count:16];
    }
    while (v27);
  }

  if (v78) {
    [(DMDManagedMediaManager *)self memberQueueCommitNonStoreBooksManifest];
  }

  v42 = +[DMDPaths purchasedBooksManifest];
  v76 = +[NSDictionary dictionaryWithContentsOfFile:v42];

  v43 = [v76 objectForKeyedSubscript:@"Books"];
  v44 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v43 count]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obja = v43;
  id v45 = [obja countByEnumeratingWithState:&v87 objects:v110 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v88;
    do
    {
      for (k = 0; k != v45; k = (char *)k + 1)
      {
        if (*(void *)v88 != v46) {
          objc_enumerationMutation(obja);
        }
        v48 = *(void **)(*((void *)&v87 + 1) + 8 * (void)k);
        v49 = [v48 objectForKeyedSubscript:@"s"];
        uint64_t v50 = [v48 objectForKeyedSubscript:@"Path"];
        v51 = (void *)v50;
        if (v49) {
          BOOL v52 = v50 == 0;
        }
        else {
          BOOL v52 = 1;
        }
        if (!v52)
        {
          v53 = +[DMDPaths purchasedBooksDirectory];
          v54 = [v53 stringByAppendingPathComponent:v51];
          [v44 setObject:v54 forKeyedSubscript:v49];
        }
      }
      id v45 = [obja countByEnumeratingWithState:&v87 objects:v110 count:16];
    }
    while (v45);
  }

  [(DMDManagedMediaManager *)self memberQueueRereadStoreBooksManifest];
  v79 = +[NSFileManager defaultManager];
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  v55 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
  id v56 = [v55 countByEnumeratingWithState:&v83 objects:v109 count:16];
  if (!v56)
  {

    goto LABEL_74;
  }
  char v77 = 0;
  uint64_t v57 = *(void *)v84;
  do
  {
    for (m = 0; m != v56; m = (char *)m + 1)
    {
      if (*(void *)v84 != v57) {
        objc_enumerationMutation(v55);
      }
      uint64_t v59 = *(void *)(*((void *)&v83 + 1) + 8 * (void)m);
      v60 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
      v61 = [v60 objectForKeyedSubscript:v59];

      v62 = sub_100054C64();
      v63 = [v61 state];
      unsigned __int8 v64 = [v62 containsObject:v63];

      if ((v64 & 1) == 0)
      {
        v65 = [v61 iTunesStoreID];
        v66 = [v44 objectForKeyedSubscript:v65];

        if (v66 && [v79 fileExistsAtPath:v66])
        {
          v67 = [v61 state];
          BOOL v68 = v67 == @"Installed";

          CFStringRef v69 = @"Installed";
          if (v68) {
            goto LABEL_68;
          }
LABEL_67:
          [v61 setState:v69];
          char v77 = 1;
        }
        else
        {
          v70 = [v61 state];
          BOOL v71 = v70 == @"Uninstalled";

          CFStringRef v69 = @"Uninstalled";
          if (!v71) {
            goto LABEL_67;
          }
        }
LABEL_68:
      }
    }
    id v56 = [v55 countByEnumeratingWithState:&v83 objects:v109 count:16];
  }
  while (v56);

  if (v77) {
    [(DMDManagedMediaManager *)self memberQueueCommitStoreBooksManifest];
  }
LABEL_74:
}

- (void)memberQueueCommitNonStoreBooksManifest
{
  v3 = objc_opt_new();
  id v4 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
  uint64_t v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
  uint64_t v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v11) manifestDictionary];
        [v5 addObject:v12];

        BOOL v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v9);
  }

  [v3 setObject:v5 forKeyedSubscript:kNonStoreBooksManifestBooksKey];
  id v13 = +[NSFileManager defaultManager];
  v14 = +[DMDPaths managedNonStoreBooksDirectory];
  if (([v13 fileExistsAtPath:v14] & 1) == 0)
  {
    NSFileAttributeKey v23 = NSFilePosixPermissions;
    v24 = &off_1000D35D8;
    id v15 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v15 error:0];

    id v16 = +[MCProfileConnection sharedConnection];
    uint64_t v17 = [v16 isEnterpriseBookBackupAllowed] ^ 1;

    if (!+[DMDMDMUtilities setSkipBackupAttribute:v17 toItemAtPath:v14]&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000859E0();
    }
  }
  BOOL v18 = +[DMDPaths managedNonStoreBooksManifestPath];
  [v3 writeToFile:v18 atomically:1];

  MCSendManagedBooksChangedNotification();
}

- (void)memberQueueCommitStoreBooksManifest
{
  v3 = objc_opt_new();
  id v4 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
  uint64_t v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
  uint64_t v7 = [v6 allValues];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) manifestDictionary];
        [v5 addObject:v12];

        BOOL v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [v3 setObject:v5 forKeyedSubscript:kStoreBooksManifestBooksKey];
  id v13 = +[DMDPaths managedStoreBooksManifestPath];
  [v3 writeToFile:v13 atomically:1];

  MCSendManagedBooksChangedNotification();
}

- (void)memberQueueRereadNonStoreBooksManifest
{
  v3 = objc_opt_new();
  id v4 = +[DMDPaths managedNonStoreBooksManifestPath];
  uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:kNonStoreBooksManifestBooksKey];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          BOOL v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [objc_alloc((Class)MDMBook) initWithManifestDictionary:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
            id v13 = [v12 persistentID];

            if (v13)
            {
              long long v14 = [v12 persistentID];
              [v3 setObject:v12 forKeyedSubscript:v14];
            }
            BOOL v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
  [(DMDManagedMediaManager *)self setMemberQueuePersistentIDToNonStoreBook:v3];
}

- (void)memberQueueRereadStoreBooksManifest
{
  v3 = objc_opt_new();
  id v4 = +[DMDPaths managedStoreBooksManifestPath];
  uint64_t v5 = +[NSDictionary dictionaryWithContentsOfFile:v4];

  if (v5)
  {
    v6 = [v5 objectForKeyedSubscript:kStoreBooksManifestBooksKey];
    uint64_t v7 = v6;
    if (v6)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v16;
        do
        {
          BOOL v11 = 0;
          do
          {
            if (*(void *)v16 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [objc_alloc((Class)MDMBook) initWithManifestDictionary:*(void *)(*((void *)&v15 + 1) + 8 * (void)v11)];
            id v13 = [v12 iTunesStoreID];

            if (v13)
            {
              long long v14 = [v12 iTunesStoreID];
              [v3 setObject:v12 forKeyedSubscript:v14];
            }
            BOOL v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
  [(DMDManagedMediaManager *)self setMemberQueueiTunesStoreIDToStoreBook:v3];
}

- (void)rereadNonStoreBooksManifestCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMDManagedMediaManager *)self memberQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100055548;
  v7[3] = &unk_1000CA828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

- (void)rereadStoreBooksManifestCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DMDManagedMediaManager *)self memberQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100055674;
  v7[3] = &unk_1000CA828;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

- (void)setNonStoreManagedBook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 persistentID];

  if (v5)
  {
    id v6 = [(DMDManagedMediaManager *)self memberQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000557D8;
    v7[3] = &unk_1000C9BE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100085A28();
  }
}

- (void)setStoreManagedBook:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 iTunesStoreID];

  if (v5)
  {
    id v6 = [(DMDManagedMediaManager *)self memberQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100055938;
    v7[3] = &unk_1000C9BE0;
    v7[4] = self;
    id v8 = v4;
    dispatch_barrier_async(v6, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100085A98();
  }
}

- (void)setState:(id)a3 forNonStoreBookWithPersistentID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDManagedMediaManager *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055A84;
  block[3] = &unk_1000C9C08;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(v8, block);
}

- (void)setState:(id)a3 forStoreBookWithiTunesStoreID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DMDManagedMediaManager *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100055BD8;
  block[3] = &unk_1000C9C08;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(v8, block);
}

- (void)cancelNonStoreDownloadsWithDownloadIdentifiers:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100054B6C();
  id v8 = objc_opt_new();
  if ([v5 count])
  {
    long long v19 = v7;
    id v20 = v6;
    id v9 = [v7 downloads];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v15 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v14 persistentIdentifier]);
          unsigned int v16 = [v5 containsObject:v15];

          if (v16) {
            [v8 addObject:v14];
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    id v7 = v19;
    id v6 = v20;
  }
  if ([v8 count])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100055EDC;
    v23[3] = &unk_1000CA250;
    long long v17 = &v24;
    id v24 = v6;
    [v7 cancelDownloads:v8 completionBlock:v23];
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    long long v18 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100055F40;
    block[3] = &unk_1000CB4E0;
    long long v17 = &v22;
    id v22 = v6;
    dispatch_async(v18, block);

    goto LABEL_16;
  }
LABEL_17:
}

- (void)installNonStoreBook:(id)a3 fileExtension:(id)a4 URL:(id)a5 assertion:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting installation of book: %{public}@", buf, 0xCu);
  }
  long long v17 = [v12 persistentID];
  if (!v17) {
    sub_100085B78();
  }

  long long v18 = [(DMDManagedMediaManager *)self memberQueue];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10005612C;
  v24[3] = &unk_1000CB5D0;
  v24[4] = self;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v14;
  id v29 = v16;
  id v19 = v14;
  id v20 = v15;
  id v21 = v16;
  id v22 = v13;
  id v23 = v12;
  dispatch_barrier_async(v18, v24);
}

+ (BOOL)shouldBypassVPPLicenseCheck
{
  CFPreferencesAppSynchronize(@"com.apple.managedconfiguration.mdmd");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MediaBypassVPPCheck", @"com.apple.managedconfiguration.mdmd", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (void)refreshBookPurchaseHistoryCompletion:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Refreshing book purchase history and trying again.", v5, 2u);
  }
  id v4 = +[DMDManagedMediaManager homeSharingCloudClient];
  [v4 updateJaliscoLibraryWithReason:8 completionHandler:v3];
}

- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 triesLeft:(int)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Searching book purchase history for iTunes Store ID %{public}@", buf, 0xCu);
  }
  id v13 = +[DMDManagedMediaManager homeSharingCloudClient];
  id v24 = v10;
  id v14 = +[NSArray arrayWithObjects:&v24 count:1];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100056F10;
  v18[3] = &unk_1000CB620;
  int v23 = a5;
  id v19 = v10;
  id v20 = self;
  id v21 = v11;
  id v22 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v12;
  [v13 loadBooksForStoreIDs:v14 withCompletionHandler:v18];
}

- (void)searchBookPurchaseHistoryForiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
}

- (void)installStoreBookWithiTunesStoreID:(id)a3 originator:(id)a4 assertion:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting installation of book with iTunes Store ID %{public}@", buf, 0xCu);
  }
  if (v10)
  {
    id v14 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"Book Installation" value:&stru_1000CC390 table:@"DMFNotifications"];

    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"Sign in to iTunes to allow %@ to manage and install books." value:&stru_1000CC390 table:@"DMFNotifications"];
    long long v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v11);

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10005760C;
    v20[3] = &unk_1000CB698;
    id v24 = v13;
    id v21 = v12;
    id v22 = self;
    id v23 = v10;
    [(DMDManagedAssetManager *)self promptUserToLoginToiTunesIfNeededTitle:v15 message:v18 assertion:v21 completionBlock:v20];

LABEL_7:
    goto LABEL_8;
  }
  if (v13)
  {
    id v19 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057594;
    block[3] = &unk_1000CB3B8;
    id v27 = v13;
    id v26 = v12;
    dispatch_async(v19, block);

    id v15 = v27;
    goto LABEL_7;
  }
LABEL_8:
}

- (NSArray)storeBooks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100054BC0;
  id v11 = sub_100054BD0;
  id v12 = 0;
  id v3 = [(DMDManagedMediaManager *)self memberQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100057A64;
  v6[3] = &unk_1000CA4B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)nonStoreBooks
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_100054BC0;
  id v11 = sub_100054BD0;
  id v12 = 0;
  id v3 = [(DMDManagedMediaManager *)self memberQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100057C18;
  v6[3] = &unk_1000CA4B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_barrier_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)memberQueueMoveTransientStatesForward
{
  id v29 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
  id v4 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v36;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v9 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
        id v10 = [v9 objectForKeyedSubscript:v8];

        id v11 = sub_100054C64();
        id v12 = [v10 state];
        unsigned int v13 = [v11 containsObject:v12];

        if (v13) {
          [v29 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v5);
  }

  if ([v29 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = [v29 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing %u non-store books because we have reported their transient state.", buf, 8u);
    }
    id v15 = [(DMDManagedMediaManager *)self memberQueuePersistentIDToNonStoreBook];
    [v15 removeObjectsForKeys:v29];

    [(DMDManagedMediaManager *)self memberQueueCommitNonStoreBooksManifest];
  }

  uint64_t v30 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v16 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
  id v17 = [v16 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * (void)j);
        id v22 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
        id v23 = [v22 objectForKeyedSubscript:v21];

        id v24 = sub_100054C64();
        id v25 = [v23 state];
        unsigned int v26 = [v24 containsObject:v25];

        if (v26) {
          [v30 addObject:v21];
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v18);
  }

  if ([v30 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v27 = [v30 count];
      *(_DWORD *)buf = 134217984;
      id v40 = v27;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing %lu store books because we have reported their transient state.", buf, 0xCu);
    }
    id v28 = [(DMDManagedMediaManager *)self memberQueueiTunesStoreIDToStoreBook];
    [v28 removeObjectsForKeys:v30];

    [(DMDManagedMediaManager *)self memberQueueCommitStoreBooksManifest];
  }
}

- (void)moveTransientStatesForward
{
  id v3 = [(DMDManagedMediaManager *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000580D4;
  block[3] = &unk_1000CA508;
  void block[4] = self;
  dispatch_barrier_async(v3, block);
}

- (void)removeNonStoreBookWithPersistentID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(DMDManagedMediaManager *)self memberQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000581DC;
  v15[3] = &unk_1000CA940;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_barrier_async(v11, v15);
}

- (void)removeStoreBookWithiTunesStoreID:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [(DMDManagedMediaManager *)self memberQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000586D4;
  block[3] = &unk_1000C9BE0;
  void block[4] = self;
  id v16 = v7;
  id v10 = v7;
  dispatch_sync(v9, block);

  id v11 = dispatch_get_global_queue(0, 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100058724;
  v13[3] = &unk_1000CB4E0;
  id v14 = v8;
  id v12 = v8;
  dispatch_async(v11, v13);
}

- (void)uprootWithAssertion:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Canceling all book downloads.", buf, 2u);
  }
  id v8 = sub_100054B6C();
  [v8 downloads];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005888C;
  v13[3] = &unk_1000CB6C0;
  id v14 = v8;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v17 = v6;
  id v18 = v7;
  id v16 = self;
  id v9 = v6;
  id v10 = v7;
  id v11 = v15;
  id v12 = v8;
  [v12 cancelDownloads:v11 completionBlock:v13];
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
}

- (NSMutableDictionary)memberQueuePersistentIDToNonStoreBook
{
  return self->_memberQueuePersistentIDToNonStoreBook;
}

- (void)setMemberQueuePersistentIDToNonStoreBook:(id)a3
{
}

- (NSMutableDictionary)memberQueueiTunesStoreIDToStoreBook
{
  return self->_memberQueueiTunesStoreIDToStoreBook;
}

- (void)setMemberQueueiTunesStoreIDToStoreBook:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueiTunesStoreIDToStoreBook, 0);
  objc_storeStrong((id *)&self->_memberQueuePersistentIDToNonStoreBook, 0);

  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end