@interface NEKReminderChangeTrackingStateMap
+ (BOOL)supportsSecureCoding;
- (BOOL)hasChangeTrackingTokens;
- (NEKReminderChangeTrackingStateMap)initWithCoder:(id)a3;
- (NEKReminderChangeTrackingStateMap)initWithData:(id)a3 store:(id)a4 clientName:(id)a5;
- (NSSet)deletedAccountIDsFromLoadedMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filterAccountToSync:(id)a3;
- (id)persistToData:(id *)a3;
- (id)transactionAuthorsToExclude;
- (void)_beginTrackingForStore:(id)a3 clientName:(id)a4 verifyAccountsBlock:(id)a5 changeTrackingStateFromAccountBlock:(id)a6;
- (void)_beginTrackingFromLoadedStateForStore:(id)a3 clientName:(id)a4;
- (void)beginTrackingFromEpochForStore:(id)a3 clientName:(id)a4;
- (void)beginTrackingFromNowForStore:(id)a3 clientName:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)fetchChangedObjectIDs:(id)a3;
- (void)setChangeToken:(id)a3 forAccountID:(id)a4;
@end

@implementation NEKReminderChangeTrackingStateMap

- (NEKReminderChangeTrackingStateMap)initWithData:(id)a3 store:(id)a4 clientName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v8 length])
  {
    id v22 = 0;
    v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v8 error:&v22];
    id v12 = v22;

    v13 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Decoded NEKReminderChangeTrackingStateMap. %@", buf, 0xCu);
      }
      if ([(NEKReminderChangeTrackingStateMap *)v11 hasChangeTrackingTokens]) {
        [(NEKReminderChangeTrackingStateMap *)v11 _beginTrackingFromLoadedStateForStore:v9 clientName:v10];
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100070A64((uint64_t)v12, v13, v15, v16, v17, v18, v19, v20);
      }
      v11 = (NEKReminderChangeTrackingStateMap *)[0 init];
    }
  }
  else
  {
    v14 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No previous NEKReminderChangeTrackingStateMap found", buf, 2u);
    }
    v11 = [(NEKReminderChangeTrackingStateMap *)self init];
  }

  return v11;
}

- (id)transactionAuthorsToExclude
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064BC0;
  block[3] = &unk_1000A8B90;
  block[4] = self;
  if (qword_1000C6C70 != -1) {
    dispatch_once(&qword_1000C6C70, block);
  }
  return (id)qword_1000C6C68;
}

- (id)persistToData:(id *)a3
{
  v4 = +[NSKeyedArchiver archivedDataWithRootObject:self requiringSecureCoding:1 error:a3];
  v5 = *(NSObject **)(qword_1000C6CA8 + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Encoded NEKReminderChangeTrackingStateMap: %@ (encoded=%@)", (uint8_t *)&v7, 0x16u);
  }

  return v4;
}

- (id)filterAccountToSync:(id)a3
{
  id v3 = a3;
  v4 = +[NSPredicate predicateWithBlock:&stru_1000A9FC0];
  v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (BOOL)hasChangeTrackingTokens
{
  return self->_loadedChangeTokenMap || self->_changeTrackingStateMap != 0;
}

- (void)beginTrackingFromEpochForStore:(id)a3 clientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  loadedChangeTokenMap = self->_loadedChangeTokenMap;
  self->_loadedChangeTokenMap = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100064ECC;
  v11[3] = &unk_1000AA028;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  [(NEKReminderChangeTrackingStateMap *)self _beginTrackingForStore:v10 clientName:v9 verifyAccountsBlock:&stru_1000AA000 changeTrackingStateFromAccountBlock:v11];
}

- (void)beginTrackingFromNowForStore:(id)a3 clientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  loadedChangeTokenMap = self->_loadedChangeTokenMap;
  self->_loadedChangeTokenMap = 0;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100065078;
  v11[3] = &unk_1000AA028;
  id v12 = v6;
  id v13 = v7;
  v14 = self;
  id v9 = v7;
  id v10 = v6;
  [(NEKReminderChangeTrackingStateMap *)self _beginTrackingForStore:v10 clientName:v9 verifyAccountsBlock:&stru_1000AA048 changeTrackingStateFromAccountBlock:v11];
}

- (void)_beginTrackingFromLoadedStateForStore:(id)a3 clientName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_loadedChangeTokenMap;
  loadedChangeTokenMap = self->_loadedChangeTokenMap;
  self->_loadedChangeTokenMap = 0;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000652A4;
  v18[3] = &unk_1000AA070;
  uint64_t v19 = v8;
  uint64_t v20 = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000654C0;
  v13[3] = &unk_1000AA098;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = self;
  uint64_t v17 = v19;
  id v10 = v19;
  id v11 = v7;
  id v12 = v6;
  [(NEKReminderChangeTrackingStateMap *)self _beginTrackingForStore:v12 clientName:v11 verifyAccountsBlock:v18 changeTrackingStateFromAccountBlock:v13];
}

- (void)_beginTrackingForStore:(id)a3 clientName:(id)a4 verifyAccountsBlock:(id)a5 changeTrackingStateFromAccountBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (unsigned int (**)(id, void *))a5;
  id v13 = (void (**)(id, void *))a6;
  if (self->_changeTrackingStateMap && os_log_type_enabled(*(os_log_t *)(qword_1000C6CA8 + 8), OS_LOG_TYPE_FAULT)) {
    sub_100070B3C();
  }
  id v42 = 0;
  id v14 = [v10 fetchAccountsIncludingInactive:1 error:&v42];
  id v15 = v42;
  if (v14)
  {
    uint64_t v16 = [(NEKReminderChangeTrackingStateMap *)self filterAccountToSync:v14];
    if (v12[2](v12, v16))
    {
      id v35 = v15;
      id v36 = v11;
      id v37 = v10;
      objc_storeStrong((id *)&self->_clientName, a4);
      uint64_t v17 = +[NSMutableDictionary dictionary];
      changeTrackingStateMap = self->_changeTrackingStateMap;
      self->_changeTrackingStateMap = v17;

      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      v34 = v16;
      id v19 = v16;
      id v20 = [v19 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v39;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v39 != v22) {
              objc_enumerationMutation(v19);
            }
            v24 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            v25 = [v24 objectID];
            v26 = v13[2](v13, v24);
            [(NSMutableDictionary *)self->_changeTrackingStateMap setObject:v26 forKeyedSubscript:v25];
          }
          id v21 = [v19 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v21);
      }

      id v11 = v36;
      id v10 = v37;
      id v15 = v35;
      uint64_t v16 = v34;
    }
  }
  else
  {
    v27 = *(NSObject **)(qword_1000C6CA8 + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_100070AD0((uint64_t)v15, v27, v28, v29, v30, v31, v32, v33);
    }
  }
}

- (void)setChangeToken:(id)a3 forAccountID:(id)a4
{
  id v14 = a4;
  changeTrackingStateMap = self->_changeTrackingStateMap;
  id v7 = a3;
  id v8 = [(NSMutableDictionary *)changeTrackingStateMap objectForKeyedSubscript:v14];
  id v9 = [v8 changeTracking];

  if (!v9)
  {
    id v10 = +[REMStore eks_storeForSyncing];
    clientName = self->_clientName;
    id v12 = [(NEKReminderChangeTrackingStateMap *)self transactionAuthorsToExclude];
    id v9 = [v10 provideChangeTrackingForAccountID:v14 clientName:clientName transactionAuthorKeysToExclude:v12];
  }
  id v13 = [[NEKReminderChangeTrackingState alloc] initWithChangeTracking:v9 lastChangeToken:v7];

  [(NSMutableDictionary *)self->_changeTrackingStateMap setObject:v13 forKeyedSubscript:v14];
}

- (void)fetchChangedObjectIDs:(id)a3
{
  id v19 = (void (**)(void))a3;
  id v4 = [(NEKReminderChangeTrackingStateMap *)self copy];
  v5 = +[NSMutableArray array];
  id v6 = +[NSMutableArray array];
  id v7 = +[NSMutableArray array];
  id v8 = +[NSMutableDictionary dictionary];
  id v20 = +[NSMutableDictionary dictionary];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  char v30 = 0;
  changeTrackingStateMap = self->_changeTrackingStateMap;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100065B94;
  v22[3] = &unk_1000AA0E8;
  uint64_t v28 = v29;
  id v10 = v8;
  id v23 = v10;
  id v21 = v5;
  id v24 = v21;
  id v11 = v6;
  id v25 = v11;
  id v12 = v7;
  id v26 = v12;
  id v13 = v4;
  id v27 = v13;
  [(NSMutableDictionary *)changeTrackingStateMap enumerateKeysAndObjectsUsingBlock:v22];
  id v14 = [v21 copy];
  id v15 = [v11 copy];
  id v16 = [v12 copy];
  id v17 = [v10 copy];
  id v18 = [v20 copy];
  v19[2]();

  _Block_object_dispose(v29, 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v5 = [(NSMutableDictionary *)self->_changeTrackingStateMap mutableCopy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@: loaded:%@ - active:%@>", objc_opt_class(), self->_loadedChangeTokenMap, self->_changeTrackingStateMap];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NEKReminderChangeTrackingStateMap)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(NEKReminderChangeTrackingStateMap *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    NSClassFromString(@"REMNSPersistentHistoryToken");
    uint64_t v8 = objc_opt_class();
    NSClassFromString(@"_REMChangeUniversalToken");
    id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"loadedChangeTokenMap"];
    loadedChangeTokenMap = v5->_loadedChangeTokenMap;
    v5->_loadedChangeTokenMap = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  changeTrackingStateMap = self->_changeTrackingStateMap;
  id v5 = a3;
  uint64_t v6 = +[NSMutableDictionary dictionaryWithCapacity:[(NSMutableDictionary *)changeTrackingStateMap count]];
  uint64_t v7 = self->_changeTrackingStateMap;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100066CC4;
  v10[3] = &unk_1000AA110;
  id v11 = v6;
  id v8 = v6;
  [(NSMutableDictionary *)v7 enumerateKeysAndObjectsUsingBlock:v10];
  id v9 = [v8 copy];
  [v5 encodeObject:v9 forKey:@"loadedChangeTokenMap"];
}

- (NSSet)deletedAccountIDsFromLoadedMap
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedAccountIDsFromLoadedMap, 0);
  objc_storeStrong((id *)&self->_changeTrackingStateMap, 0);
  objc_storeStrong((id *)&self->_loadedChangeTokenMap, 0);

  objc_storeStrong((id *)&self->_clientName, 0);
}

@end