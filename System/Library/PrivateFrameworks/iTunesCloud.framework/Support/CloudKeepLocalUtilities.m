@interface CloudKeepLocalUtilities
+ (void)downPinCollectionsForClasses:(id)a3 configuration:(id)a4;
+ (void)rePinCollectionsForClasses:(id)a3 configuration:(id)a4;
@end

@implementation CloudKeepLocalUtilities

+ (void)rePinCollectionsForClasses:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v28 = a4;
  v6 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v28;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "RePinning collection classes %{public}@ and configuration %{public}@", buf, 0x16u);
  }

  v7 = [v28 userIdentity];
  v33 = +[ML3MusicLibrary musicLibraryForUserAccount:v7];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v5;
  id v31 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v49;
    uint64_t v37 = ML3EntityPropertyKeepLocalStatus;
    uint64_t v38 = ML3EntityPropertyKeepLocal;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v49 != v30)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v32 = v8;
        v10 = *(void **)(*((void *)&v48 + 1) + 8 * v8);
        v11 = objc_opt_new();
        v12 = +[ML3ComparisonPredicate predicateWithProperty:v37 equalToInteger:3];
        v34 = [v10 queryWithLibrary:v33 predicate:v12];

        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10005BEF0;
        v44[3] = &unk_1001BAEC8;
        v47 = v10;
        id v36 = v33;
        id v45 = v36;
        id v13 = v11;
        id v46 = v13;
        [v34 enumeratePersistentIDsUsingBlock:v44];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v35 = v13;
        id v14 = [v35 countByEnumeratingWithState:&v40 objects:v59 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v41;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v41 != v15) {
                objc_enumerationMutation(v35);
              }
              v17 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v18 = [(id)objc_opt_class() trackForeignPersistentID];
              v19 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v17 persistentID]);
              v20 = +[ML3ComparisonPredicate predicateWithProperty:v18 value:v19 comparison:1];
              v58[0] = v20;
              v21 = +[ML3ComparisonPredicate predicateWithProperty:v38 equalToInt64:0];
              v58[1] = v21;
              v22 = +[NSArray arrayWithObjects:v58 count:2];
              v23 = +[ML3AllCompoundPredicate predicateMatchingPredicates:v22];

              v24 = +[ML3Track queryWithLibrary:v36 predicate:v23];
              *(void *)buf = 0;
              *(void *)&buf[8] = buf;
              *(void *)&buf[16] = 0x2020000000;
              char v57 = 0;
              v39[0] = _NSConcreteStackBlock;
              v39[1] = 3221225472;
              v39[2] = sub_10005BF4C;
              v39[3] = &unk_1001BAEF0;
              v39[4] = buf;
              [v24 enumeratePersistentIDsUsingBlock:v39];
              LODWORD(v19) = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
              v25 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
              BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
              if (v19)
              {
                if (v26)
                {
                  *(_DWORD *)v54 = 138543362;
                  v55 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Clearing status for %{public}@", v54, 0xCu);
                }

                uint64_t v52 = v37;
                v27 = +[NSArray arrayWithObjects:&v52 count:1];
                [v17 setValues:&off_1001CCC28 forProperties:v27];
              }
              else
              {
                if (v26)
                {
                  *(_DWORD *)v54 = 138543362;
                  v55 = v17;
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "RePinning %{public}@", v54, 0xCu);
                }

                v53[0] = v38;
                v53[1] = v37;
                v27 = +[NSArray arrayWithObjects:v53 count:2];
                [v17 setValues:&off_1001CCC10 forProperties:v27];
              }

              _Block_object_dispose(buf, 8);
            }
            id v14 = [v35 countByEnumeratingWithState:&v40 objects:v59 count:16];
          }
          while (v14);
        }

        uint64_t v8 = v32 + 1;
      }
      while ((id)(v32 + 1) != v31);
      id v31 = [obj countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v31);
  }
}

+ (void)downPinCollectionsForClasses:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v64 = v5;
    __int16 v65 = 2114;
    id v66 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "DownPinning collection classes %{public}@ and configuration %{public}@", buf, 0x16u);
  }

  uint64_t v32 = v6;
  uint64_t v8 = [v6 userIdentity];
  id v35 = +[ML3MusicLibrary musicLibraryForUserAccount:v8];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v5;
  id v36 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v56;
    uint64_t v40 = ML3EntityPropertyKeepLocal;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v9;
        v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        v11 = objc_opt_new();
        v12 = +[ML3ComparisonPredicate predicateWithProperty:v40 value:&off_1001CBD08 comparison:3];
        id v13 = [v10 queryWithLibrary:v35 predicate:v12];

        uint64_t v61 = v40;
        id v14 = +[NSArray arrayWithObjects:&v61 count:1];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_10005C504;
        v51[3] = &unk_1001BAEA0;
        v54 = v10;
        id v15 = v35;
        id v52 = v15;
        id v16 = v11;
        id v53 = v16;
        uint64_t v37 = v13;
        [v13 enumeratePersistentIDsAndProperties:v14 usingBlock:v51];

        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v39 = v16;
        id v17 = [v39 countByEnumeratingWithState:&v47 objects:v60 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v48;
          do
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v48 != v19) {
                objc_enumerationMutation(v39);
              }
              v21 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              v22 = os_log_create("com.apple.amp.itunescloudd", "Downloads");
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                id v64 = v21;
                _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DownPinning %{public}@", buf, 0xCu);
              }

              v23 = objc_opt_new();
              v24 = [(id)objc_opt_class() trackForeignPersistentID];
              v25 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v21 persistentID]);
              BOOL v26 = +[ML3ComparisonPredicate predicateWithProperty:v24 value:v25 comparison:1];
              v27 = +[ML3Track queryWithLibrary:v15 predicate:v26];

              uint64_t v59 = v40;
              id v28 = +[NSArray arrayWithObjects:&v59 count:1];
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10005C560;
              v45[3] = &unk_1001BEF58;
              id v29 = v23;
              id v46 = v29;
              [v27 enumeratePersistentIDsAndProperties:v28 usingBlock:v45];

              v41[0] = _NSConcreteStackBlock;
              v41[1] = 3221225472;
              v41[2] = sub_10005C5E8;
              v41[3] = &unk_1001BEA70;
              id v42 = v29;
              id v30 = v15;
              id v43 = v30;
              v44 = v21;
              id v31 = v29;
              [v30 performDatabaseTransactionWithBlock:v41];
            }
            id v18 = [v39 countByEnumeratingWithState:&v47 objects:v60 count:16];
          }
          while (v18);
        }

        uint64_t v9 = v38 + 1;
      }
      while ((id)(v38 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v36);
  }
}

@end