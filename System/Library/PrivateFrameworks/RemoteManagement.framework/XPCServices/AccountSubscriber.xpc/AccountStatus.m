@interface AccountStatus
+ (id)supportedStatusKeys;
- (AccountStatus)init;
- (AccountStatus)initWithAdapter:(id)a3;
- (AccountStatusAdapter)adapter;
- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5;
@end

@implementation AccountStatus

- (AccountStatus)init
{
  v3 = objc_opt_new();
  v4 = [(AccountStatus *)self initWithAdapter:v3];

  return v4;
}

- (AccountStatus)initWithAdapter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AccountStatus;
  v6 = [(AccountStatus *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_adapter, a3);
  }

  return v7;
}

+ (id)supportedStatusKeys
{
  v5[0] = RMModelStatusItemAccountListCalDAV;
  v5[1] = RMModelStatusItemAccountListCardDAV;
  v5[2] = RMModelStatusItemAccountListExchange;
  v5[3] = RMModelStatusItemAccountListGoogle;
  v5[4] = RMModelStatusItemAccountListLDAP;
  v5[5] = RMModelStatusItemAccountListMailIncoming;
  v5[6] = RMModelStatusItemAccountListMailOutgoing;
  v5[7] = RMModelStatusItemAccountListSubscribedCalendar;
  v2 = +[NSArray arrayWithObjects:v5 count:8];
  v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)queryForStatusWithKeyPaths:(id)a3 store:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v33 = (void (**)(id, void *, void))a5;
  v10 = +[RMLog accountStatus];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100014CC8((uint64_t)v8, v10);
  }

  v11 = [(AccountStatus *)self adapter];
  v34 = v9;
  v12 = [v11 getRemotelyManagedAccountsForStore:v9];

  v13 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v14 = v8;
  id v15 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v40;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v39 + 1) + 8 * (void)v18);
        v20 = objc_opt_new();
        [v13 setObject:v20 forKeyedSubscript:v19];

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v16);
  }
  v32 = v14;

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v21 = v12;
  id v22 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v35 + 1) + 8 * (void)v25);
        v27 = [(AccountStatus *)self adapter];
        v28 = [v27 getStatusKeyPathFromAccount:v26];

        v29 = [v13 objectForKeyedSubscript:v28];
        if (v29)
        {
          v30 = [(AccountStatus *)self adapter];
          v31 = [v30 getStatusInfoFromAccount:v26];

          [v29 addObject:v31];
        }

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v23);
  }

  v33[2](v33, v13, 0);
}

- (AccountStatusAdapter)adapter
{
  return self->_adapter;
}

- (void).cxx_destruct
{
}

@end