@interface ICDeleteOrphanedAccountDirectoriesFromAppDataContainerLaunchTask
- (void)runLaunchTask;
@end

@implementation ICDeleteOrphanedAccountDirectoriesFromAppDataContainerLaunchTask

- (void)runLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = sub_100057358;
  v55 = sub_100057368;
  id v56 = 0;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100057370;
  v48[3] = &unk_100626040;
  v50 = &v51;
  id v49 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = v49;
  [v49 performBlockAndWait:v48];
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v3 = (id)v52[5];
  id v4 = [v3 countByEnumeratingWithState:&v44 objects:v64 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v45;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v45 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v44 + 1) + 8 * i);
        v8 = +[ICAccountUtilities sharedInstance];
        v9 = [v8 applicationDataContainerURLForAccountIdentifier:v7];

        [v2 ic_addNonNilObject:v9];
      }
      id v4 = [v3 countByEnumeratingWithState:&v44 objects:v64 count:16];
    }
    while (v4);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v2;
  id v30 = [obj countByEnumeratingWithState:&v40 objects:v63 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        v31 = [*(id *)(*((void *)&v40 + 1) + 8 * (void)j) URLByAppendingPathComponent:@"Documents" isDirectory:1];
        v32 = [v31 URLByAppendingPathComponent:@"Accounts" isDirectory:1];
        v10 = +[NSFileManager defaultManager];
        NSURLResourceKey v62 = NSURLIsDirectoryKey;
        v11 = +[NSArray arrayWithObjects:&v62 count:1];
        v12 = [v10 enumeratorAtURL:v32 includingPropertiesForKeys:v11 options:1 errorHandler:0];

        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v13 = v12;
        id v14 = [v13 countByEnumeratingWithState:&v36 objects:v61 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v37;
          do
          {
            for (k = 0; k != v14; k = (char *)k + 1)
            {
              if (*(void *)v37 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v36 + 1) + 8 * (void)k);
              id v35 = 0;
              unsigned int v18 = [v17 getResourceValue:&v35 forKey:NSURLIsDirectoryKey error:0];
              id v19 = v35;
              v20 = v19;
              if (v18)
              {
                if ([v19 BOOLValue])
                {
                  v21 = (void *)v52[5];
                  v22 = [v17 lastPathComponent];
                  LOBYTE(v21) = [v21 containsObject:v22];

                  if ((v21 & 1) == 0)
                  {
                    v23 = +[NSFileManager defaultManager];
                    id v34 = 0;
                    [v23 removeItemAtURL:v17 error:&v34];
                    id v24 = v34;

                    v25 = os_log_create("com.apple.notes", "Application");
                    v26 = v25;
                    if (v24)
                    {
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v58 = v17;
                        __int16 v59 = 2112;
                        id v60 = v24;
                        _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to clean up orphaned account directory %@, error %@", buf, 0x16u);
                      }
                    }
                    else if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v58 = v17;
                      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully cleaned up orphaned account directory %@", buf, 0xCu);
                    }
                  }
                }
              }
            }
            id v14 = [v13 countByEnumeratingWithState:&v36 objects:v61 count:16];
          }
          while (v14);
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v40 objects:v63 count:16];
    }
    while (v30);
  }

  _Block_object_dispose(&v51, 8);
}

@end