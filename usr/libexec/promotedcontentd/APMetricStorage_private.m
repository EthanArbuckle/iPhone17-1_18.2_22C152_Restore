@interface APMetricStorage_private
+ (id)metricsFileManager;
+ (id)pathsToExpiredBatchesWithFileManager:(id)a3 closedPathPrefix:(id)a4;
+ (id)preparedDataPathForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5;
+ (id)signedPathFromUnsigned:(id)a3;
+ (int64_t)_countEventsInBatch:(id)a3;
+ (int64_t)batchPathToPurpose:(id)a3;
+ (void)moveExistingOpenFilesToClosed:(id)a3 closedPrefix:(id)a4;
+ (void)removeExpiredBatchesFromClosedPrefix:(id)a3;
+ (void)shelveClosedForChannel:(id)a3;
@end

@implementation APMetricStorage_private

+ (void)moveExistingOpenFilesToClosed:(id)a3 closedPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  id v102 = 0;
  unsigned int v9 = [v8 directoryExistsAtPath:v6 error:&v102];
  v10 = v102;
  if (v10)
  {
    v64 = v10;
    v11 = APLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      id v104 = v6;
      __int16 v105 = 2114;
      v106 = v64;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error determining status of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
LABEL_80:

    v12 = v64;
LABEL_81:

    goto LABEL_82;
  }
  if (v9)
  {
    id v101 = 0;
    v12 = [v8 contentsOfDirectoryAtPath:v6 error:&v101];
    v13 = v101;
    if (v13)
    {
      v11 = v13;
      v64 = v12;
      v14 = APLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138740227;
        id v104 = v6;
        __int16 v105 = 2114;
        v106 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error getting contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
      }
LABEL_79:

      goto LABEL_80;
    }
    if (!v12) {
      goto LABEL_81;
    }
    v15 = v12;
    if (![v12 count]) {
      goto LABEL_81;
    }
    id v69 = v7;
    id v70 = a1;
    v16 = +[NSMutableArray array];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    v64 = v15;
    v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v97 objects:v113 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v98;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v98 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v97 + 1) + 8 * i)];
          [v16 addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v97 objects:v113 count:16];
      }
      while (v19);
    }
    id v63 = v6;

    v23 = +[NSMutableArray array];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v24 = v16;
    id v25 = [v24 countByEnumeratingWithState:&v93 objects:v112 count:16];
    v73 = v8;
    obj = v24;
    if (!v25)
    {
      v27 = 0;
      id v7 = v69;
      goto LABEL_48;
    }
    id v26 = v25;
    v27 = 0;
    uint64_t v28 = *(void *)v94;
    id v7 = v69;
    while (1)
    {
      v29 = 0;
      v30 = v27;
      do
      {
        if (*(void *)v94 != v28) {
          objc_enumerationMutation(obj);
        }
        v31 = *(void **)(*((void *)&v93 + 1) + 8 * (void)v29);

        id v92 = 0;
        unsigned int v32 = [v8 directoryExistsAtPath:v31 error:&v92];
        v33 = v92;
        if (v33)
        {
          v34 = v33;
          v35 = APLogForCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138740227;
            id v104 = v31;
            __int16 v105 = 2114;
            v30 = v34;
            v106 = v34;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Error opening contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
          }
          else
          {
            v30 = v34;
          }
LABEL_29:

          id v8 = v73;
          goto LABEL_30;
        }
        if (v32)
        {
          id v91 = 0;
          v35 = [v8 contentsOfDirectoryAtPath:v31 error:&v91];
          v36 = v91;
          if (v36)
          {
            v30 = v36;
          }
          else if (v35 && [v35 count])
          {
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            v35 = v35;
            id v37 = [v35 countByEnumeratingWithState:&v87 objects:v111 count:16];
            if (v37)
            {
              id v38 = v37;
              uint64_t v39 = *(void *)v88;
              do
              {
                for (j = 0; j != v38; j = (char *)j + 1)
                {
                  if (*(void *)v88 != v39) {
                    objc_enumerationMutation(v35);
                  }
                  v41 = [v31 stringByAppendingPathComponent:*(void *)(*((void *)&v87 + 1) + 8 * (void)j)];
                  [v23 addObject:v41];
                }
                id v38 = [v35 countByEnumeratingWithState:&v87 objects:v111 count:16];
              }
              while (v38);
            }

            v30 = 0;
            id v7 = v69;
          }
          else
          {
            v30 = 0;
          }
          goto LABEL_29;
        }
        v30 = 0;
LABEL_30:
        v29 = (char *)v29 + 1;
      }
      while (v29 != v26);
      v27 = v30;
      v24 = obj;
      id v42 = [obj countByEnumeratingWithState:&v93 objects:v112 count:16];
      id v26 = v42;
      if (!v42)
      {
LABEL_48:

        long long v86 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v83 = 0u;
        id v43 = v23;
        id v44 = [v43 countByEnumeratingWithState:&v83 objects:v110 count:16];
        if (!v44)
        {
          id v6 = v63;
          v11 = v27;
          goto LABEL_78;
        }
        id v45 = v44;
        uint64_t v46 = *(void *)v84;
        id v6 = v63;
        v11 = v27;
        uint64_t v61 = *(void *)v84;
        id v62 = v43;
        while (1)
        {
          uint64_t v47 = 0;
          id v65 = v45;
          do
          {
            if (*(void *)v84 != v46)
            {
              uint64_t v48 = v47;
              objc_enumerationMutation(v43);
              uint64_t v47 = v48;
            }
            uint64_t v68 = v47;
            v49 = *(void **)(*((void *)&v83 + 1) + 8 * v47);

            id v82 = 0;
            v74 = v49;
            v50 = [v8 contentsOfDirectoryAtPath:v49 error:&v82];
            v51 = v82;
            v67 = v50;
            if (v51)
            {
              v11 = v51;
              v52 = APLogForCategory();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138740227;
                id v104 = v74;
                __int16 v105 = 2114;
                v106 = v11;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Error getting contents of open storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
              }
            }
            else
            {
              if (!v50 || ![v50 count])
              {
                v11 = 0;
                goto LABEL_74;
              }
              long long v80 = 0u;
              long long v81 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              v52 = v50;
              id v75 = [v52 countByEnumeratingWithState:&v78 objects:v109 count:16];
              if (v75)
              {
                v76 = 0;
                uint64_t v71 = *(void *)v79;
                v72 = v52;
                do
                {
                  for (k = 0; k != v75; k = (char *)k + 1)
                  {
                    if (*(void *)v79 != v71) {
                      objc_enumerationMutation(v52);
                    }
                    v54 = [v74 stringByAppendingPathComponent:*(void *)(*((void *)&v78 + 1) + 8 * (void)k)];
                    uint64_t v55 = [v54 substringFromIndex:[v54 rangeOfString:@"/"]];
                    v56 = [v7 stringByAppendingPathComponent:v55];

                    v57 = sub_100119A0C((uint64_t)APMetricsObservability, v54, v8);
                    id v58 = [v70 _countEventsInBatch:v54];

                    id v77 = 0;
                    LOBYTE(v55) = [v8 moveItemAtPath:v54 toPath:v56 error:&v77];
                    v76 = v77;
                    if (v55)
                    {
                      v59 = sub_100118560();
                      v60 = [v54 lastPathComponent];
                      sub_100119440(v59, v57, v60, (uint64_t)[v70 batchPathToPurpose:v54], (uint64_t)v58, v73, v7);

                      id v8 = v73;
                    }
                    else
                    {
                      v59 = APLogForCategory();
                      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138740483;
                        id v104 = v54;
                        __int16 v105 = 2117;
                        v106 = v56;
                        __int16 v107 = 2114;
                        v108 = v76;
                        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Error moving file from (%{sensitive}@) to (%{sensitive}@)! %{public}@", buf, 0x20u);
                      }
                      id v7 = v69;
                    }
                    v52 = v72;
                  }
                  id v75 = [v72 countByEnumeratingWithState:&v78 objects:v109 count:16];
                }
                while (v75);
                id v43 = v62;
                id v6 = v63;
                v11 = v76;
                uint64_t v46 = v61;
                id v45 = v65;
              }
              else
              {
                v11 = 0;
              }
            }

LABEL_74:
            uint64_t v47 = v68 + 1;
          }
          while ((id)(v68 + 1) != v45);
          id v45 = [v43 countByEnumeratingWithState:&v83 objects:v110 count:16];
          if (!v45)
          {
LABEL_78:

            v14 = obj;
            goto LABEL_79;
          }
        }
      }
    }
  }
LABEL_82:
}

+ (void)removeExpiredBatchesFromClosedPrefix:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  id v19 = v4;
  [a1 pathsToExpiredBatchesWithFileManager:v5 closedPathPrefix:v4];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v21 = *(void *)v24;
    *(void *)&long long v7 = 138740227;
    long long v18 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v11 = [v10 lastPathComponent:v18];
        id v12 = [a1 batchPathToPurpose:v10];
        v13 = sub_100118560();
        sub_1001189F4(v13, v11, v10, (uint64_t)v12);

        v14 = sub_100119AC0((uint64_t)APMetricsObservability, v10, v5);
        v15 = APLogForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v28 = v10;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Removing batch due to expiration: %{private}@", buf, 0xCu);
        }

        id v22 = 0;
        [v5 removeObjectAtPath:v10 error:&v22];
        id v16 = v22;
        if (v16)
        {
          v17 = APLogForCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v18;
            uint64_t v28 = v10;
            __int16 v29 = 2114;
            id v30 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error removing batch at (%{sensitive}@)! %{public}@", buf, 0x16u);
          }
        }
        else
        {
          v17 = sub_100118560();
          sub_10011967C(v17, v14, v11, (uint64_t)v12, v5, v19);
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v8);
  }
}

+ (id)pathsToExpiredBatchesWithFileManager:(id)a3 closedPathPrefix:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v79 = 0;
  unsigned int v7 = [v5 directoryExistsAtPath:v6 error:&v79];
  id v8 = v79;
  if (v8)
  {
    unsigned int v9 = v8;
    goto LABEL_3;
  }
  if (!v7)
  {
    v10 = &__NSArray0__struct;
    goto LABEL_5;
  }
  id v78 = 0;
  unsigned int v9 = [v5 contentsOfDirectoryAtPath:v6 error:&v78];
  id v12 = v78;
  if (v12)
  {
    id v13 = v12;
    v14 = APLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      id v85 = v6;
      __int16 v86 = 2114;
      id v87 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error getting contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
    v10 = &__NSArray0__struct;
    goto LABEL_13;
  }
  if (!v9 || ![v9 count])
  {
LABEL_3:
    v10 = &__NSArray0__struct;
    goto LABEL_4;
  }
  v15 = +[NSMutableArray array];
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  v50 = v9;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v75;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v75 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = [v6 stringByAppendingPathComponent:*(void *)(*((void *)&v74 + 1) + 8 * i)];
        [v15 addObject:v21];
      }
      id v18 = [v16 countByEnumeratingWithState:&v74 objects:v83 count:16];
    }
    while (v18);
  }
  id v51 = v6;

  id v22 = +[NSMutableArray array];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v23 = v15;
  id v24 = [v23 countByEnumeratingWithState:&v70 objects:v82 count:16];
  v54 = v5;
  v52 = v23;
  if (!v24)
  {
    id v13 = 0;
    goto LABEL_52;
  }
  id v25 = v24;
  id v13 = 0;
  uint64_t v26 = *(void *)v71;
  do
  {
    for (j = 0; j != v25; j = (char *)j + 1)
    {
      if (*(void *)v71 != v26) {
        objc_enumerationMutation(v23);
      }
      uint64_t v28 = *(void **)(*((void *)&v70 + 1) + 8 * (void)j);

      id v69 = 0;
      unsigned int v29 = [v5 directoryExistsAtPath:v28 error:&v69];
      id v30 = v69;
      if (v30)
      {
        id v13 = v30;
        v31 = APLogForCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138740227;
          id v85 = v28;
          __int16 v86 = 2114;
          id v87 = v13;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Error opening contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (!v29)
        {
          id v13 = 0;
          continue;
        }
        id v68 = 0;
        v31 = [v5 contentsOfDirectoryAtPath:v28 error:&v68];
        id v32 = v68;
        if (v32)
        {
          id v13 = v32;
        }
        else if (v31 && [v31 count])
        {
          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          v31 = v31;
          id v33 = [v31 countByEnumeratingWithState:&v64 objects:v81 count:16];
          if (v33)
          {
            id v34 = v33;
            uint64_t v35 = *(void *)v65;
            do
            {
              for (k = 0; k != v34; k = (char *)k + 1)
              {
                if (*(void *)v65 != v35) {
                  objc_enumerationMutation(v31);
                }
                id v37 = [v28 stringByAppendingPathComponent:*(void *)(*((void *)&v64 + 1) + 8 * (void)k)];
                [v22 addObject:v37];
              }
              id v34 = [v31 countByEnumeratingWithState:&v64 objects:v81 count:16];
            }
            while (v34);
          }

          id v13 = 0;
          id v5 = v54;
          long long v23 = v52;
        }
        else
        {
          id v13 = 0;
        }
      }
    }
    id v25 = [v23 countByEnumeratingWithState:&v70 objects:v82 count:16];
  }
  while (v25);
LABEL_52:

  id v38 = +[NSMutableArray array];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v22;
  id v39 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v61;
    do
    {
      id v42 = 0;
      id v43 = v13;
      do
      {
        if (*(void *)v61 != v41) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void *)(*((void *)&v60 + 1) + 8 * (void)v42);
        id v59 = v43;
        id v45 = [v54 contentsOfDirectoryAtPath:v44 error:&v59];
        id v13 = v59;

        v58[0] = _NSConcreteStackBlock;
        v58[1] = 3221225472;
        v58[2] = sub_100121AA4;
        v58[3] = &unk_1002368D8;
        v58[4] = v44;
        uint64_t v46 = [v45 mapObjectsUsingBlock:v58];
        [v38 addObjectsFromArray:v46];

        id v42 = (char *)v42 + 1;
        id v43 = v13;
      }
      while (v40 != v42);
      id v40 = [obj countByEnumeratingWithState:&v60 objects:v80 count:16];
    }
    while (v40);
  }

  if (v13)
  {
    uint64_t v47 = APLogForCategory();
    unsigned int v9 = v50;
    id v6 = v51;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138740227;
      id v85 = v51;
      __int16 v86 = 2114;
      id v87 = v13;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Error getting contents of closed storage directory (%{sensitive}@)! %{public}@", buf, 0x16u);
    }
    v10 = &__NSArray0__struct;
LABEL_63:
    v14 = v52;

    id v5 = v54;
  }
  else
  {
    id v5 = v54;
    unsigned int v9 = v50;
    id v6 = v51;
    if (v38 && [v38 count])
    {
      uint64_t v48 = +[NSDate date];
      v49 = [v48 dateByAddingTimeInterval:-604800.0];

      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_100121AB0;
      v55[3] = &unk_100236900;
      id v56 = v54;
      id v57 = v49;
      uint64_t v47 = v49;
      v10 = [v38 filteredArrayUsingBlock:v55];

      goto LABEL_63;
    }
    v10 = &__NSArray0__struct;
    v14 = v52;
  }

LABEL_13:
LABEL_4:

LABEL_5:

  return v10;
}

+ (void)shelveClosedForChannel:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];
  v46[0] = @"c";
  id v5 = [v3 destination];
  id v6 = [v5 value];
  v46[1] = v6;
  unsigned int v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 purpose]);
  id v8 = [v7 stringValue];
  v46[2] = v8;
  unsigned int v9 = +[NSArray arrayWithObjects:v46 count:3];
  v10 = +[NSString pathWithComponents:v9];

  v45[0] = @"s";
  v11 = [v3 destination];
  id v12 = [v11 value];
  v45[1] = v12;
  id v32 = v3;
  id v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 purpose]);
  v14 = [v13 stringValue];
  v45[2] = v14;
  v15 = +[NSArray arrayWithObjects:v45 count:3];
  id v16 = +[NSString pathWithComponents:v15];

  id v39 = 0;
  unsigned int v17 = [v4 directoryExistsAtPath:v10 error:&v39];
  id v18 = v39;
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = APLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      id v42 = v10;
      __int16 v43 = 2114;
      id v44 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Error determining status of closed storage directory (%{private}@)! %{public}@", buf, 0x16u);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (v17)
  {
    id v38 = 0;
    uint64_t v20 = [v4 contentsOfDirectoryAtPath:v10 error:&v38];
    id v21 = v38;
    if (v21)
    {
      id v19 = v21;
      id v22 = APLogForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138478083;
        id v42 = v10;
        __int16 v43 = 2114;
        id v44 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Error accessing files in (%{private}@)! %{public}@", buf, 0x16u);
      }
    }
    else
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v22 = v20;
      id v23 = [v22 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v23)
      {
        id v24 = v23;
        v31 = v20;
        id v19 = 0;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (i = 0; i != v24; i = (char *)i + 1)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * i);

            uint64_t v28 = [v10 stringByAppendingPathComponent:v27];
            unsigned int v29 = [v16 stringByAppendingPathComponent:v27];
            id v33 = 0;
            [v4 moveItemAtPath:v28 toPath:v29 error:&v33];
            id v19 = v33;

            if (v19)
            {
              id v30 = APLogForCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                id v42 = v19;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error shelved file. %{public}@", buf, 0xCu);
              }
            }
          }
          id v24 = [v22 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v24);
        uint64_t v20 = v31;
      }
      else
      {
        id v19 = 0;
      }
    }

    goto LABEL_23;
  }
  id v19 = 0;
LABEL_24:
}

+ (id)metricsFileManager
{
  id v2 = [objc_alloc((Class)APStorageManager) initWithPathPrefix:@"m"];

  return v2;
}

+ (id)signedPathFromUnsigned:(id)a3
{
  id v3 = a3;
  id v4 = +[NSString stringWithFormat:@"/%@/", @"ws"];
  id v5 = +[NSString stringWithFormat:@"/%@/", @"ns"];
  id v6 = [v3 stringByReplacingOccurrencesOfString:v5 withString:v4];

  return v6;
}

+ (id)preparedDataPathForDestination:(id)a3 purpose:(int64_t)a4 containsSignature:(BOOL)a5
{
  CFStringRef v5 = @"ns";
  if (a5) {
    CFStringRef v5 = @"ws";
  }
  return +[NSString stringWithFormat:@"%@/%@/%@/%ld", @"p", a3, v5, a4];
}

+ (int64_t)batchPathToPurpose:(id)a3
{
  id v3 = [a3 pathComponents];
  if ((unint64_t)[v3 count] >= 2)
  {
    CFStringRef v5 = [v3 objectAtIndexedSubscript:[v3 count] - 2];
    id v6 = +[NSScanner scannerWithString:v5];
    int v8 = 0;
    if (![v6 scanInt:&v8]
      || ([v6 isAtEnd] & 1) == 0
      || (int64_t v4 = v8, v8 <= 0))
    {
      APSimulateCrashNoKillProcess();
      int64_t v4 = 0;
    }
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (int64_t)_countEventsInBatch:(id)a3
{
  id v3 = a3;
  id v5 = [objc_alloc([MetricsModuleClasses batchClass](MetricsModuleClasses, "batchClass")) initWithPath:v3];
  int64_t v6 = -1;
  do
  {
    unsigned int v7 = [v5 nextMetric];

    ++v6;
  }
  while (v7);

  return v6;
}

@end