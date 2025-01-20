@interface ABSContactsReclusterizer
+ (id)sharedInstance;
- (ABSContactsReclusterizer)init;
- (void)_insureContact:(id)a3 isClustered:(id)a4;
- (void)_insureContactsAreSolo:(id)a3;
- (void)_processClusters;
- (void)_registerForNotifications;
- (void)stashCluster:(id)a3 forGuid:(id)a4;
@end

@implementation ABSContactsReclusterizer

+ (id)sharedInstance
{
  if (qword_100069C98 != -1) {
    dispatch_once(&qword_100069C98, &stru_1000550B8);
  }
  v2 = (void *)qword_100069C90;

  return v2;
}

- (ABSContactsReclusterizer)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABSContactsReclusterizer;
  v2 = [(ABSContactsReclusterizer *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    clusters = v2->_clusters;
    v2->_clusters = v3;

    uint64_t v5 = sub_100028AC4("LinkReclusterizer");
    q = v2->_q;
    v2->_q = (OS_dispatch_queue *)v5;

    [(ABSContactsReclusterizer *)v2 _registerForNotifications];
  }
  return v2;
}

- (void)stashCluster:(id)a3 forGuid:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014218;
  block[3] = &unk_1000550E0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(q, block);
}

- (void)_registerForNotifications
{
  v3 = +[ABSContactsInterface sharedInstance];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000142B8;
  v4[3] = &unk_100054DD0;
  v4[4] = self;
  [v3 registerPostSaveBlock:v4];
}

- (void)_processClusters
{
  kdebug_trace();
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_1000146F4;
  v30 = sub_100014704;
  id v31 = 0;
  q = self->_q;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001470C;
  block[3] = &unk_100054FF8;
  block[4] = self;
  void block[5] = &v26;
  v20 = self;
  dispatch_sync(q, block);
  if ([(id)v27[5] count])
  {
    v4 = +[ABSContactsInterface sharedInstance];
    [v4 incrementInUse];

    uint64_t v5 = *(id *)(qword_100069D78 + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [(id)v27[5] count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting link cluster processing for %d clusters.", buf, 8u);
    }

    id v7 = objc_alloc((Class)NSMutableArray);
    id v8 = [v7 initWithCapacity:[v27[5] count]];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = (id)v27[5];
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
    if (v10)
    {
      uint64_t v12 = *(void *)v22;
      *(void *)&long long v11 = 138412546;
      long long v19 = v11;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v15 = [v27[5] objectForKeyedSubscript:v14, v19];
          v16 = *(NSObject **)(qword_100069D78 + 8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            uint64_t v33 = v14;
            __int16 v34 = 2112;
            v35 = v15;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Cluster %@ -> %@", buf, 0x16u);
          }
          if ([v15 isNull]) {
            [v8 addObject:v14];
          }
          else {
            [(ABSContactsReclusterizer *)v20 _insureContact:v14 isClustered:v15];
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v21 objects:v36 count:16];
      }
      while (v10);
    }

    if ([v8 count]) {
      [(ABSContactsReclusterizer *)v20 _insureContactsAreSolo:v8];
    }
    v17 = +[ABSContactsInterface sharedInstance];
    [v17 decrementInUse];

    v18 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Completed link cluster processing.", buf, 2u);
    }
  }
  kdebug_trace();
  _Block_object_dispose(&v26, 8);
}

- (void)_insureContactsAreSolo:(id)a3
{
  id v3 = a3;
  v4 = +[ABSContactsInterface sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100014814;
  v6[3] = &unk_100055170;
  id v7 = v3;
  id v5 = v3;
  [v4 accessAssert:v6];
}

- (void)_insureContact:(id)a3 isClustered:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  long long v22 = sub_1000146F4;
  long long v23 = sub_100014704;
  id v24 = 0;
  id v7 = +[ABSContactsInterface sharedInstance];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100014D68;
  v16[3] = &unk_100055198;
  v18 = &v19;
  id v8 = v5;
  id v17 = v8;
  [v7 accessAssert:v16];

  if (([(id)v20[5] isEqual:v6] & 1) == 0
    && objc_msgSend(v6, "haveAllContacts_LOCKED"))
  {
    id v9 = +[ABSContactsInterface sharedInstance];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100014DBC;
    v15[3] = &unk_1000551E8;
    v15[4] = &v19;
    [v9 mutateAssert:v15];

    id v10 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Building cluster for %{public}@", buf, 0xCu);
    }
    long long v11 = +[ABSContactsInterface sharedInstance];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100014E6C;
    v12[3] = &unk_100055238;
    id v13 = v6;
    id v14 = v8;
    [v11 mutateAssert:v12];
  }
  _Block_object_dispose(&v19, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusters, 0);

  objc_storeStrong((id *)&self->_q, 0);
}

@end