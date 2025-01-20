@interface ICDeleteCoherenceContextsFromGroupContainerLaunchTask
- (id)taskIdentifier;
- (void)runOneTimeLaunchTask;
@end

@implementation ICDeleteCoherenceContextsFromGroupContainerLaunchTask

- (id)taskIdentifier
{
  return @"DidDeleteCoherenceContextsFromGroupContainerLaunchTask";
}

- (void)runOneTimeLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10008D014;
  v57 = sub_10008D024;
  id v58 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10008D02C;
  v50[3] = &unk_100626040;
  v52 = &v53;
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v51;
  [v51 performBlockAndWait:v50];
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v3 = (id)v54[5];
  id v4 = [v3 countByEnumeratingWithState:&v46 objects:v66 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v47;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v47 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v46 + 1) + 8 * i);
        v8 = +[ICAccountUtilities sharedInstance];
        v9 = [v8 applicationDocumentsURLForAccountIdentifier:v7];

        [v2 ic_addNonNilObject:v9];
      }
      id v4 = [v3 countByEnumeratingWithState:&v46 objects:v66 count:16];
    }
    while (v4);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v2;
  id v32 = [obj countByEnumeratingWithState:&v42 objects:v65 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v43;
    do
    {
      for (j = 0; j != v32; j = (char *)j + 1)
      {
        if (*(void *)v43 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = [*(id *)(*((void *)&v42 + 1) + 8 * (void)j) URLByAppendingPathComponent:@"Accounts" isDirectory:1];
        v10 = +[NSFileManager defaultManager];
        NSURLResourceKey v64 = NSURLIsDirectoryKey;
        v11 = +[NSArray arrayWithObjects:&v64 count:1];
        v12 = [v10 enumeratorAtURL:v33 includingPropertiesForKeys:v11 options:1 errorHandler:0];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v35 = v12;
        id v13 = [v35 countByEnumeratingWithState:&v38 objects:v63 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v39;
          do
          {
            v15 = 0;
            do
            {
              if (*(void *)v39 != v14) {
                objc_enumerationMutation(v35);
              }
              v16 = *(void **)(*((void *)&v38 + 1) + 8 * (void)v15);
              id v37 = 0;
              unsigned int v17 = [v16 getResourceValue:&v37 forKey:NSURLIsDirectoryKey error:0];
              id v18 = v37;
              v19 = v18;
              if (v17 && [v18 BOOLValue])
              {
                v20 = [v16 URLByAppendingPathComponent:@"Paper" isDirectory:1];
                v21 = [v20 URLByAppendingPathComponent:@"CoherenceContexts" isDirectory:1];
                v22 = +[NSFileManager defaultManager];
                v23 = [v21 path];
                unsigned int v24 = [v22 fileExistsAtPath:v23];

                if (v24)
                {
                  v25 = +[NSFileManager defaultManager];
                  id v36 = 0;
                  [v25 removeItemAtURL:v21 error:&v36];
                  v26 = v36;

                  v27 = os_log_create("com.apple.notes", "Application");
                  v28 = v27;
                  if (v26)
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412546;
                      v60 = v21;
                      __int16 v61 = 2112;
                      v62 = v26;
                      _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to clean up coherence context directory %@, error %@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v60 = v21;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Successfully cleaned up coherence context directory %@", buf, 0xCu);
                    }
                    v26 = v28;
                  }
                }
              }

              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            id v13 = [v35 countByEnumeratingWithState:&v38 objects:v63 count:16];
          }
          while (v13);
        }
      }
      id v32 = [obj countByEnumeratingWithState:&v42 objects:v65 count:16];
    }
    while (v32);
  }

  _Block_object_dispose(&v53, 8);
}

@end