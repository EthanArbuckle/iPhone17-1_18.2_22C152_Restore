@interface MSDComponentCompleteOperation
- (int64_t)type;
- (void)execute;
@end

@implementation MSDComponentCompleteOperation

- (int64_t)type
{
  return 5;
}

- (void)execute
{
  v3 = +[MSDProgressUpdater sharedInstance];
  v71 = +[MSDHelperAgent sharedInstance];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = [(MSDOperation *)self component];
  v6 = [v5 finishedOperationContexts];

  v7 = [(MSDOperation *)self component];
  v69 = [v7 name];

  v8 = [(MSDOperation *)self component];
  v9 = [v8 errors];
  v10 = [v9 firstObject];

  unsigned int v11 = +[MSDOperationContext downloadOnly];
  v12 = [(MSDOperation *)self component];
  unint64_t v13 = (unint64_t)[v12 result];

  v70 = v6;
  v68 = v10;
  if (!v13)
  {
    id v16 = v10;
    goto LABEL_6;
  }
  if (v11)
  {
    if (+[MSDHubFeatureFlags disableBackgroundInstall])
    {
      id v14 = 0;
      uint64_t v15 = 1;
      goto LABEL_55;
    }
    v66 = self;
    v67 = v3;
    id v18 = objc_alloc_init((Class)NSMutableSet);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v31 = v6;
    id v32 = [v31 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v32)
    {
      id v33 = v32;
      unsigned int v65 = v13;
      uint64_t v34 = *(void *)v83;
      id obj = v31;
      while (2)
      {
        v35 = 0;
        do
        {
          if (*(void *)v83 != v34) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v35);
          v37 = [v36 secondaryStagingRootPath];
          if (v37 && ![v36 skipped])
          {
            v39 = [v36 uniqueName];
            unsigned __int8 v40 = [v18 containsObject:v39];

            if ((v40 & 1) == 0)
            {
              v41 = [v36 secondaryStagingRootPath];
              v42 = [v36 stashedStagingRootPath];
              unsigned __int8 v43 = [v71 moveStagingToFinal:v41 finalPath:v42];

              if ((v43 & 1) == 0)
              {
                v62 = sub_100068600();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
                  sub_1000D24D8(v62);
                }

                id v16 = 0;
                self = v66;
                v3 = v67;
                v6 = v70;
                goto LABEL_63;
              }
            }
          }
          else
          {
          }
          v38 = [v36 uniqueName];
          [v18 addObject:v38];

          v35 = (char *)v35 + 1;
        }
        while (v33 != v35);
        id v31 = obj;
        id v44 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        id v33 = v44;
        if (v44) {
          continue;
        }
        break;
      }
    }

LABEL_41:
    id v14 = 0;
    uint64_t v15 = 1;
    v6 = v70;
    goto LABEL_42;
  }
  unsigned int v65 = v13;
  v66 = self;
  v67 = v3;
  id v18 = objc_alloc_init((Class)NSMutableSet);
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v78 objects:v89 count:16];
  if (!v20) {
    goto LABEL_23;
  }
  id v21 = v20;
  uint64_t v22 = *(void *)v79;
  do
  {
    for (i = 0; i != v21; i = (char *)i + 1)
    {
      if (*(void *)v79 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v78 + 1) + 8 * i);
      uint64_t v25 = [v24 secondaryStagingRootPath];
      if (v25)
      {
        v26 = (void *)v25;
        if (![v24 skipped])
        {

LABEL_20:
          v28 = [v24 secondaryStagingRootPath];
          [v18 addObject:v28];

          continue;
        }
        unsigned __int8 v27 = [v24 restored];

        if (v27) {
          goto LABEL_20;
        }
      }
    }
    id v21 = [v19 countByEnumeratingWithState:&v78 objects:v89 count:16];
  }
  while (v21);
LABEL_23:

  if (![v18 count]) {
    goto LABEL_41;
  }
  v29 = [v18 allObjects];
  unsigned __int8 v30 = [v71 moveStagingsToFinal:v29 finalPath:@"/private/var/.backup"];

  v6 = v70;
  if (v30)
  {
    id v14 = 0;
    uint64_t v15 = 1;
    goto LABEL_42;
  }
  v64 = sub_100068600();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
    sub_1000D251C(v64);
  }

  id v16 = 0;
  self = v66;
  v3 = v67;
LABEL_63:
  unint64_t v13 = v65;
LABEL_6:
  v66 = self;
  v67 = v3;
  id v77 = v16;
  sub_1000C31D4(&v77, 3727744768, @"An error has occurred.");
  id v14 = v77;

  if ([v14 code] != (id)3727741184 && objc_msgSend(v14, "code") != (id)3727741185)
  {
    v17 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v17 demoUpdateFailed:v14];
  }
  id v18 = +[MSDAnalyticsEventHandler sharedInstance];
  [v18 sendContentUpdateFailureEvent:v14 isFatal:v13];
  uint64_t v15 = 0;
LABEL_42:

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v45 = v6;
  id v46 = [v45 countByEnumeratingWithState:&v73 objects:v88 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v74;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(void *)v74 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v73 + 1) + 8 * (void)j);
        v51 = [v50 stagingRootPath];
        [v4 addObject:v51];

        v52 = [v50 secondaryStagingRootPath];

        if (v52)
        {
          v53 = [v50 secondaryStagingRootPath];
          [v4 addObject:v53];
        }
        if ((v11 & 1) == 0)
        {
          v54 = [v50 stashedStagingRootPath];

          if (v54)
          {
            v55 = [v50 stashedStagingRootPath];
            [v4 addObject:v55];
          }
        }
      }
      id v47 = [v45 countByEnumeratingWithState:&v73 objects:v88 count:16];
    }
    while (v47);
  }

  v56 = [v4 allObjects];
  [v71 removeWorkDirectories:v56];

  self = v66;
  v3 = v67;
LABEL_55:
  v57 = [v3 bundleInProgress];
  [v57 updateComponentProgress:v69 withResult:v15 withAdditionalInfo:&__NSDictionary0__struct];

  v58 = [v3 bundleInProgress];
  id v59 = [v58 getPercentageProgress];

  v60 = sub_100068600();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v87 = v59;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "New update progress: %ld", buf, 0xCu);
  }

  if ((v11 & 1) == 0)
  {
    v61 = +[MSDDemoUpdateStatusHub sharedInstance];
    [v61 demoUpdateProgress:v59];
  }
  [(MSDOperation *)self setResult:v15];
  [(MSDOperation *)self setError:v14];
}

@end