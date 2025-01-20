@interface ICFixTombstonesWithoutAccountsLaunchTask
- (void)fixTombstonesWithNilAccountWithContext:(id)a3;
- (void)runLaunchTask;
@end

@implementation ICFixTombstonesWithoutAccountsLaunchTask

- (void)runLaunchTask
{
  [(ICWorkerContextLaunchTask *)self workerContext];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10010AFAC;
  v4[3] = &unk_100625860;
  v4[4] = self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (void)fixTombstonesWithNilAccountWithContext:(id)a3
{
  id v3 = a3;
  v4 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1004DC45C(v4);
  }

  id v5 = +[NSPredicate predicateWithFormat:@"account == nil"];
  v38[0] = v5;
  v6 = +[NSPredicate predicateWithFormat:@"markedForDeletion == NO"];
  v38[1] = v6;
  v7 = +[NSArray arrayWithObjects:v38 count:2];

  v8 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
  v9 = +[ICLegacyTombstone ic_objectsMatchingPredicate:v8 context:v3];
  v10 = os_log_create("com.apple.notes", "LaunchTask");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1004DC3E0(v9);
  }

  v11 = +[ICAccount allActiveCloudKitAccountsInContext:v3];
  if ([v11 count] == (id)1)
  {
    uint64_t v12 = [v11 lastObject];
    if (v12)
    {
      v13 = (void *)v12;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      os_log_t v14 = (os_log_t)[v9 copy];
      id v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v15)
      {
        id v16 = v15;
        v24 = v11;
        v25 = v9;
        v26 = v8;
        v27 = v7;
        id v28 = v3;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v20 = [v19 account];
            if (!v20)
            {
              v21 = os_log_create("com.apple.notes", "LaunchTask");
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                v22 = [v19 ic_loggingDescription];
                v23 = [0 identifier];
                *(_DWORD *)buf = 138412546;
                v34 = v22;
                __int16 v35 = 2112;
                v36 = v23;
                _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Found tombstone %@ without an account, will move to account %@.", buf, 0x16u);
              }
              [v19 setAccount:v13];
            }
          }
          id v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v16);
        v7 = v27;
        id v3 = v28;
        v9 = v25;
        v8 = v26;
        v11 = v24;
      }
LABEL_23:

      goto LABEL_24;
    }
  }
  if ([v9 count])
  {
    os_log_t v14 = os_log_create("com.apple.notes", "LaunchTask");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_1004DC364(v9);
    }
    v13 = v14;
    goto LABEL_23;
  }
LABEL_24:
  [v3 ic_save];
}

@end