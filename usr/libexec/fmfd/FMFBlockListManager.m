@interface FMFBlockListManager
+ (id)sharedInstance;
- (void)_rulesChanged:(id)a3;
- (void)sanitizeBlockList;
@end

@implementation FMFBlockListManager

+ (id)sharedInstance
{
  if (qword_1000BB708 != -1) {
    dispatch_once(&qword_1000BB708, &stru_1000A1DA8);
  }
  v2 = (void *)qword_1000BB700;

  return v2;
}

- (void)_rulesChanged:(id)a3
{
  v4 = sub_100005560();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager _rulesChanged:", v5, 2u);
  }

  [(FMFBlockListManager *)self sanitizeBlockList];
}

- (void)sanitizeBlockList
{
  v2 = sub_100005560();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager sanitizeBlockList", buf, 2u);
  }

  v3 = +[NSMutableSet set];
  v4 = +[FMFDataManager sharedInstance];
  v5 = [v4 followerHandles];

  v6 = +[TUPrivacyManager sharedPrivacyManager];
  v7 = [v6 allBlacklistRules];

  v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v5;
    __int16 v34 = 2112;
    v35 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFBlockListManager sanitizeBlockList: %@, %@", buf, 0x16u);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v28;
    *(void *)&long long v11 = 138412290;
    long long v24 = v11;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v15, "type", v24) == 1)
        {
          v16 = [v15 email];
          v17 = sub_100005560();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v33 = v16;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Block rule exists for email: %@", buf, 0xCu);
          }

          v18 = +[FMFHandle handleWithId:v16];
          if ([v5 containsObject:v18]) {
            [v3 addObject:v18];
          }
        }
        else
        {
          if ([v15 type]) {
            continue;
          }
          v16 = [v15 phoneNumber];
          v18 = [v16 unformattedInternationalRepresentation];
          v19 = sub_100005560();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v33 = v18;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Block rule exists for phone: %@", buf, 0xCu);
          }

          v20 = +[FMFHandle handleWithId:v18];
          if ([v5 containsObject:v20]) {
            [v3 addObject:v20];
          }
        }
      }
      id v12 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  if ([v3 count])
  {
    v21 = sub_100005560();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v3;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Stopping offers to handles in block list: %@", buf, 0xCu);
    }

    v22 = +[FMFSession sharedInstance];
    uint64_t v23 = FMFGroupIdOneToOne;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000152F4;
    v25[3] = &unk_1000A1DD0;
    id v26 = v3;
    [v22 stopSharingMyLocationWithHandles:v26 groupId:v23 callerId:0 completion:v25];
  }
}

@end