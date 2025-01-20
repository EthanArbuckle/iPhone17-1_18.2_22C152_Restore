@interface KTPublicKeyStore
- (BOOL)anyStoreExpired;
- (BOOL)clearDiskApplicationKeyStore:(id)a3 error:(id *)a4;
- (BOOL)configureWithDisk:(id)a3 contextStore:(id)a4 error:(id *)a5;
- (BOOL)forceRefresh;
- (BOOL)hasApplicationPublicKeyStoreOnDisk:(id)a3 error:(id *)a4;
- (BOOL)initiallyFetched;
- (BOOL)ready;
- (BOOL)readyWithRefresh:(BOOL)a3;
- (BOOL)saveDiskApplicationKeyStore:(id)a3 error:(id *)a4;
- (BOOL)stop;
- (BOOL)writePublicKeyStoreToDisk:(id)a3 error:(id *)a4;
- (KTApplicationPublicKeyStore)tltKeyStore;
- (KTPublicKeyStore)initWithDataStore:(id)a3 settings:(id)a4;
- (NSArray)applications;
- (NSDictionary)applicationKeyStores;
- (NSMutableDictionary)_applicationKeyStores;
- (OS_dispatch_group)configureGroup;
- (OS_dispatch_queue)configureQueue;
- (TransparencySettingsProtocol)settings;
- (id)applicationPublicKeyStore:(id)a3;
- (id)copyKeyStoreState;
- (id)copyMetadata;
- (id)createApplicationKeyStore:(id)a3 keyStoreData:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7;
- (id)createApplicationKeyStore:(id)a3 keyStoreResponse:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7;
- (id)keyStoreFileName;
- (id)readPublicKeyStoreFromDisk:(id *)a3;
- (void)clearApplicationState:(id)a3 error:(id *)a4;
- (void)clearForEnvironmentChange;
- (void)configureWithClient:(id)a3 dataStore:(id)a4 contextStore:(id)a5 applicationHandler:(id)a6 completionHandler:(id)a7;
- (void)configureWithClient:(id)a3 ignoreCachedKeys:(BOOL)a4 dataStore:(id)a5 contextStore:(id)a6 applicationHandler:(id)a7 completionHandler:(id)a8;
- (void)fetchKeyStore:(id)a3 application:(id)a4 contextStore:(id)a5 completionHandler:(id)a6;
- (void)setApplications:(id)a3;
- (void)setConfigureGroup:(id)a3;
- (void)setConfigureQueue:(id)a3;
- (void)setForceRefresh:(BOOL)a3;
- (void)setPublicKeyStoreDelegate:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStop:(BOOL)a3;
- (void)setTltKeyStore:(id)a3;
- (void)set_applicationKeyStores:(id)a3;
- (void)updatePublicKeyStores:(id)a3 diskStore:(id)a4 contextStore:(id)a5 complete:(id)a6;
- (void)updateTLTKeyStoreWithApplicationKeyStore:(id)a3;
@end

@implementation KTPublicKeyStore

- (void)setPublicKeyStoreDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(KTPublicKeyStore *)self _applicationKeyStores];
  objc_sync_enter(v5);
  objc_storeWeak((id *)&self->_delegate, v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(KTPublicKeyStore *)self _applicationKeyStores];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        v11 = [(KTPublicKeyStore *)self _applicationKeyStores];
        v12 = [v11 objectForKeyedSubscript:v10];

        [v12 setDelegate:v4];
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (NSDictionary)applicationKeyStores
{
  v3 = [(KTPublicKeyStore *)self _applicationKeyStores];
  objc_sync_enter(v3);
  id v4 = [(KTPublicKeyStore *)self _applicationKeyStores];
  v5 = +[NSDictionary dictionaryWithDictionary:v4];

  objc_sync_exit(v3);

  return (NSDictionary *)v5;
}

- (id)applicationPublicKeyStore:(id)a3
{
  id v4 = a3;
  v5 = [(KTPublicKeyStore *)self _applicationKeyStores];
  objc_sync_enter(v5);
  v6 = [(KTPublicKeyStore *)self _applicationKeyStores];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);

  return v7;
}

- (void)updateTLTKeyStoreWithApplicationKeyStore:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v52 = self;
    v5 = [(KTPublicKeyStore *)self tltKeyStore];

    if (v5)
    {
      id obj = [(KTPublicKeyStore *)v52 tltKeyStore];
      objc_sync_enter(obj);
      v6 = [(KTPublicKeyStore *)v52 tltKeyStore];
      id v7 = [v6 keyBag];
      id v8 = [v7 tltLogBeginningMs];
      v9 = [v4 keyBag];
      id v10 = [v9 tltLogBeginningMs];

      if (v8 < v10)
      {
        v11 = [v4 keyBag];
        id v12 = [v11 copyTltBag];
        long long v13 = [(KTPublicKeyStore *)v52 tltKeyStore];
        [v13 setKeyBag:v12];

        long long v14 = [v4 receiptTime];
        long long v15 = [(KTPublicKeyStore *)v52 tltKeyStore];
        [v15 setReceiptTime:v14];

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v16 = [(KTPublicKeyStore *)v52 applicationKeyStores];
        id v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v17)
        {
          uint64_t v18 = *(void *)v54;
          do
          {
            v19 = 0;
            do
            {
              if (*(void *)v54 != v18) {
                objc_enumerationMutation(v16);
              }
              v20 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v19);
              v21 = [v4 application:obj];
              unsigned __int8 v22 = [v20 isEqualToString:v21];

              if ((v22 & 1) == 0)
              {
                v23 = [(KTPublicKeyStore *)v52 applicationKeyStores];
                v24 = [v23 objectForKeyedSubscript:v20];
                v25 = [v24 keyBag];
                v26 = [v25 tltKeyStore];
                v27 = [v26 signatureVerifier];
                [v27 setNeedsRefresh:1];
              }
              v19 = (char *)v19 + 1;
            }
            while (v17 != v19);
            id v17 = [v16 countByEnumeratingWithState:&v53 objects:v57 count:16];
          }
          while (v17);
        }

        goto LABEL_20;
      }
      v29 = [(KTPublicKeyStore *)v52 tltKeyStore];
      v30 = [v29 keyBag];
      id v31 = [v30 tltLogBeginningMs];
      v32 = [v4 keyBag];
      id v33 = [v32 tltLogBeginningMs];

      if (v31 <= v33)
      {
        v37 = [(KTPublicKeyStore *)v52 tltKeyStore];
        unsigned __int8 v38 = [v37 readyWithRefresh:0];

        if (v38)
        {
LABEL_20:
          objc_sync_exit(obj);

          goto LABEL_21;
        }
        v39 = [(KTPublicKeyStore *)v52 tltKeyStore];
        v40 = [v39 keyBag];
        v41 = [v40 vrfKey];
        [v41 setNeedsRefresh:0];

        v42 = [(KTPublicKeyStore *)v52 tltKeyStore];
        v43 = [v42 keyBag];
        v44 = [v43 appSthKeyStore];
        v45 = [v44 signatureVerifier];
        [v45 setNeedsRefresh:0];

        v46 = [(KTPublicKeyStore *)v52 tltKeyStore];
        v47 = [v46 keyBag];
        v48 = [v47 appSmtKeyStore];
        v49 = [v48 signatureVerifier];
        [v49 setNeedsRefresh:0];

        v34 = [(KTPublicKeyStore *)v52 tltKeyStore];
        v35 = [v34 keyBag];
        v36 = [v35 tltKeyStore];
        v50 = [v36 signatureVerifier];
        [v50 setNeedsRefresh:0];
      }
      else
      {
        v34 = [v4 keyBag];
        v35 = [v34 tltKeyStore];
        v36 = [v35 signatureVerifier];
        [v36 setNeedsRefresh:1];
      }

      goto LABEL_20;
    }
    v28 = [v4 createTLTApplicationPublicKeyStore];
    [(KTPublicKeyStore *)v52 setTltKeyStore:v28];
  }
LABEL_21:
}

- (void)updatePublicKeyStores:(id)a3 diskStore:(id)a4 contextStore:(id)a5 complete:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D0C90;
  v11[3] = &unk_1002B9CA0;
  id v12 = a6;
  id v10 = v12;
  [(KTPublicKeyStore *)self configureWithClient:a3 ignoreCachedKeys:1 dataStore:a4 contextStore:a5 applicationHandler:0 completionHandler:v11];
}

- (id)copyMetadata
{
  v2 = +[NSNumber numberWithBool:[(KTPublicKeyStore *)self readyWithRefresh:0]];
  v7[0] = v2;
  v6[0] = off_1003255D0;
  v6[1] = off_1003255D8;
  v3 = +[NSNumber numberWithInt:kTransparencyProtocolVersion];
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (id)copyKeyStoreState
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(KTPublicKeyStore *)self copyMetadata];
  [v3 setObject:v4 forKeyedSubscript:off_1003255C8];

  v5 = [(KTPublicKeyStore *)self applicationKeyStores];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        id v12 = [v11 copyKeyStoreState];
        [v3 setObject:v12 forKeyedSubscript:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)keyStoreFileName
{
  v2 = [(KTPublicKeyStore *)self settings];
  id v3 = [v2 getEnvironment];

  if (v3 == (id)2)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C72C0);
    }
    id v6 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "using QA2 key store", v7, 2u);
    }
    return @"KTPublicKeyStore-qa2.plist";
  }
  else if (v3 == (id)1)
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C72A0);
    }
    id v4 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "using QA1 key store", buf, 2u);
    }
    return @"KTPublicKeyStore-qa1.plist";
  }
  else
  {
    return @"KTPublicKeyStore.plist";
  }
}

- (id)readPublicKeyStoreFromDisk:(id *)a3
{
  id v4 = [(KTPublicKeyStore *)self keyStoreFileName];
  id v9 = 0;
  v5 = +[TransparencyFileSupport readDictionaryFromFile:v4 error:&v9];
  id v6 = v9;

  if (!v5)
  {
    id v7 = +[TransparencyAnalytics logger];
    [v7 logResultForEvent:@"ktDiskPublicKeyStoreEvent" hardFailure:1 result:v6 withAttributes:&off_1002DA448];

    if (a3) {
      *a3 = v6;
    }
  }

  return v5;
}

- (BOOL)writePublicKeyStoreToDisk:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTPublicKeyStore *)self keyStoreFileName];
  BOOL v8 = +[TransparencyFileSupport writeDictionaryToFile:v6 fileName:v7 error:a4];

  id v9 = +[TransparencyAnalytics logger];
  uint64_t v10 = v9;
  if (v8) {
    [v9 logSuccessForEventNamed:@"ktDiskPublicKeyStoreWriteEvent"];
  }
  else {
    [v9 logResultForEvent:@"ktDiskPublicKeyStoreEvent" hardFailure:1 result:*a4 withAttributes:&off_1002DA470];
  }

  return v8;
}

- (BOOL)clearDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTPublicKeyStore *)self readPublicKeyStoreFromDisk:0];
  id v8 = [v7 mutableCopy];

  if (!v8)
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  [v8 setObject:0 forKeyedSubscript:v6];
  BOOL v9 = [(KTPublicKeyStore *)self writePublicKeyStoreToDisk:v8 error:a4];

  return v9;
}

- (BOOL)hasApplicationPublicKeyStoreOnDisk:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(KTPublicKeyStore *)self readPublicKeyStoreFromDisk:0];
  id v7 = [v6 mutableCopy];

  if (v7)
  {
    id v8 = [v7 objectForKeyedSubscript:v5];
    BOOL v9 = v8 != 0;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)saveDiskApplicationKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTPublicKeyStore *)self readPublicKeyStoreFromDisk:0];
  id v8 = [v7 mutableCopy];

  if (!v8)
  {
    id v8 = +[NSMutableDictionary dictionary];
  }
  id v9 = [v6 copyKeyStoreState];
  uint64_t v10 = [v6 application];

  [v8 setObject:v9 forKeyedSubscript:v10];
  id v11 = [(KTPublicKeyStore *)self copyMetadata];
  [v8 setObject:v11 forKeyedSubscript:off_1003255C8];

  BOOL v12 = [(KTPublicKeyStore *)self writePublicKeyStoreToDisk:v8 error:a4];
  return v12;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreData:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [KTApplicationPublicKeyStore alloc];
  long long v17 = [(KTPublicKeyStore *)self settings];
  uint64_t v18 = [(KTApplicationPublicKeyStore *)v16 initWithApplication:v12 dataStore:v14 diskState:v13 contextStore:v15 settings:v17 error:a7];

  if (v18)
  {
    v19 = [(KTPublicKeyStore *)self _applicationKeyStores];
    objc_sync_enter(v19);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(KTApplicationPublicKeyStore *)v18 setDelegate:WeakRetained];

    v21 = [(KTPublicKeyStore *)self _applicationKeyStores];
    [v21 setValue:v18 forKey:v12];

    objc_sync_exit(v19);
    unsigned __int8 v22 = v18;
  }

  return v18;
}

- (id)createApplicationKeyStore:(id)a3 keyStoreResponse:(id)a4 dataStore:(id)a5 contextStore:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [KTApplicationPublicKeyStore alloc];
  long long v17 = [(KTPublicKeyStore *)self settings];
  uint64_t v18 = [(KTApplicationPublicKeyStore *)v16 initWithApplication:v12 dataStore:v14 response:v13 contextStore:v15 settings:v17 error:a7];

  if (v18)
  {
    v19 = [(KTPublicKeyStore *)self _applicationKeyStores];
    objc_sync_enter(v19);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(KTApplicationPublicKeyStore *)v18 setDelegate:WeakRetained];

    v21 = [(KTPublicKeyStore *)self _applicationKeyStores];
    [v21 setValue:v18 forKey:v12];

    objc_sync_exit(v19);
    unsigned __int8 v22 = v18;
  }

  return v18;
}

- (void)fetchKeyStore:(id)a3 application:(id)a4 contextStore:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v23 = 0;
  id v14 = +[TransparencyRPCRequestBuilder buildPublicKeysRequest:v11 error:&v23];
  id v15 = v23;
  long long v16 = v15;
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001D187C;
    v18[3] = &unk_1002C7388;
    id v22 = v13;
    v18[4] = self;
    id v19 = v11;
    id v20 = v10;
    id v21 = v12;
    [v20 fetchPublicKeys:v14 completionHandler:v18];
  }
  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

- (void)configureWithClient:(id)a3 ignoreCachedKeys:(BOOL)a4 dataStore:(id)a5 contextStore:(id)a6 applicationHandler:(id)a7 completionHandler:(id)a8
{
  id v44 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (a4)
  {
    id v42 = v14;
    id v18 = 0;
LABEL_16:
    v43 = v16;
    v25 = [(KTPublicKeyStore *)self applications];
    id v26 = [v25 count];

    if (v26)
    {
      unint64_t v27 = 0;
      do
      {
        v28 = [(KTPublicKeyStore *)self configureGroup];
        dispatch_group_enter(v28);

        ++v27;
        v29 = [(KTPublicKeyStore *)self applications];
        id v30 = [v29 count];
      }
      while (v27 < (unint64_t)v30);
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v31 = self->_applications;
    id v32 = [(NSArray *)v31 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v50;
      do
      {
        for (i = 0; i != v33; i = (char *)i + 1)
        {
          id v36 = v15;
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v37 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          v47[0] = _NSConcreteStackBlock;
          v47[1] = 3221225472;
          v47[2] = sub_1001D2290;
          v47[3] = &unk_1002C68D8;
          id v38 = v43;
          v47[5] = self;
          id v48 = v38;
          v47[4] = v37;
          uint64_t v39 = v37;
          id v15 = v36;
          [(KTPublicKeyStore *)self fetchKeyStore:v44 application:v39 contextStore:v36 completionHandler:v47];
        }
        id v33 = [(NSArray *)v31 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v33);
    }

    v40 = [(KTPublicKeyStore *)self configureGroup];
    v41 = [(KTPublicKeyStore *)self configureQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001D22FC;
    block[3] = &unk_1002BB048;
    id v46 = v17;
    dispatch_group_notify(v40, v41, block);

    id v14 = v42;
    id v16 = v43;
    goto LABEL_27;
  }
  id v57 = 0;
  unsigned int v19 = [(KTPublicKeyStore *)self configureWithDisk:v14 contextStore:v15 error:&v57];
  id v18 = v57;
  if (!v19)
  {
    id v42 = v14;
    goto LABEL_16;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v20 = self->_applications;
  id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v54;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v54 != v23) {
          objc_enumerationMutation(v20);
        }
        if (v16) {
          (*((void (**)(id, void, id))v16 + 2))(v16, *(void *)(*((void *)&v53 + 1) + 8 * (void)j), v18);
        }
      }
      id v22 = [(NSArray *)v20 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v22);
  }

  if (v17) {
    (*((void (**)(id, id))v17 + 2))(v17, v18);
  }
LABEL_27:
}

- (void)configureWithClient:(id)a3 dataStore:(id)a4 contextStore:(id)a5 applicationHandler:(id)a6 completionHandler:(id)a7
{
}

- (BOOL)configureWithDisk:(id)a3 contextStore:(id)a4 error:(id *)a5
{
  id v34 = a3;
  id v33 = a4;
  id v8 = [(KTPublicKeyStore *)self readPublicKeyStoreFromDisk:a5];
  id v9 = v8;
  if (v8)
  {
    id v30 = [v8 objectForKeyedSubscript:off_1003255C8];
    if (v30
      && ([v30 objectForKeyedSubscript:off_1003255D8],
          id v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = [v10 unsignedIntegerValue],
          unint64_t v12 = kTransparencyProtocolVersion,
          v10,
          (unint64_t)v11 >= v12))
    {
      id v18 = [v30 objectForKey:off_1003255D0];

      if (v18)
      {
        unsigned int v19 = [v30 objectForKey:off_1003255D0];
        -[KTPublicKeyStore setForceRefresh:](self, "setForceRefresh:", [v19 BOOLValue] ^ 1);
      }
      id v15 = self;
      objc_sync_enter(v15);
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v20 = v15->_applications;
      id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v36;
        uint64_t v31 = kTransparencyErrorFile;
        char v32 = 1;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(KTPublicKeyStore **)(*((void *)&v35 + 1) + 8 * (void)v23);
            v25 = [v9 objectForKeyedSubscript:v24];

            if (v25)
            {
              id v26 = [v9 objectForKeyedSubscript:v24];
              unint64_t v27 = [(KTPublicKeyStore *)v15 createApplicationKeyStore:v24 keyStoreData:v26 dataStore:v34 contextStore:v33 error:a5];

              if (v27)
              {
                [(KTPublicKeyStore *)v15 updateTLTKeyStoreWithApplicationKeyStore:v27];
              }
              else
              {
                [(KTPublicKeyStore *)v15 clearDiskApplicationKeyStore:v24 error:a5];
                char v32 = 0;
              }
            }
            else
            {
              if (a5)
              {
                *a5 = +[TransparencyError errorWithDomain:v31, -39, *a5, @"On-disk key store not found for %@", v24 code underlyingError description];
              }
              if (qword_10032F138 != -1) {
                dispatch_once(&qword_10032F138, &stru_1002C7408);
              }
              v28 = qword_10032F140;
              if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v42 = v24;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "On-disk key store not found for %@", buf, 0xCu);
              }
            }
            uint64_t v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          id v21 = [(NSArray *)v20 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v21);
      }
      else
      {
        char v32 = 1;
      }

      objc_sync_exit(v15);
    }
    else
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C73C8);
      }
      id v13 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Updating to newer protocol version used by this client", buf, 2u);
      }
      [(KTPublicKeyStore *)self setForceRefresh:1];
      id v39 = 0;
      unsigned __int8 v14 = [v34 clearState:&v39];
      id v15 = (KTPublicKeyStore *)v39;
      if ((v14 & 1) == 0)
      {
        if (qword_10032F138 != -1) {
          dispatch_once(&qword_10032F138, &stru_1002C73E8);
        }
        id v16 = qword_10032F140;
        if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to clear DB state: %@", buf, 0xCu);
        }
      }
      char v32 = 0;
    }
  }
  else
  {
    [(KTPublicKeyStore *)self setForceRefresh:1];
    if (a5)
    {
      *a5 = +[TransparencyError errorWithDomain:kTransparencyErrorFile code:-38 underlyingError:*a5 description:@"On-disk key store not found"];
    }
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C73A8);
    }
    id v17 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "On-disk key store not found", buf, 2u);
    }
    char v32 = 0;
  }

  return v32 & 1;
}

- (KTPublicKeyStore)initWithDataStore:(id)a3 settings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KTPublicKeyStore;
  id v8 = [(KTPublicKeyStore *)&v22 init];
  if (!v8)
  {
LABEL_9:
    id v18 = v8;
    goto LABEL_15;
  }
  v25[0] = kKTApplicationIdentifierIDS;
  v25[1] = kKTApplicationIdentifierIDSMultiplex;
  v25[2] = kKTApplicationIdentifierIDSFaceTime;
  id v9 = +[NSArray arrayWithObjects:v25 count:3];
  [(KTPublicKeyStore *)v8 setApplications:v9];

  id v10 = [(KTPublicKeyStore *)v8 applications];
  id v11 = [v10 count];

  if (v11 == (id)3)
  {
    id v12 = objc_alloc_init((Class)NSMutableDictionary);
    [(KTPublicKeyStore *)v8 set_applicationKeyStores:v12];

    dispatch_group_t v13 = dispatch_group_create();
    [(KTPublicKeyStore *)v8 setConfigureGroup:v13];

    unsigned __int8 v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.transparency.keyStoreConfiguration", v14);
    [(KTPublicKeyStore *)v8 setConfigureQueue:v15];

    [(KTPublicKeyStore *)v8 setSettings:v7];
    id v21 = 0;
    LOBYTE(v15) = [(KTPublicKeyStore *)v8 configureWithDisk:v6 contextStore:0 error:&v21];
    id v16 = v21;
    if ((v15 & 1) == 0)
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7448);
      }
      id v17 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "failed to read disk public key store:%@", buf, 0xCu);
      }
    }

    goto LABEL_9;
  }
  if (qword_10032F138 != -1) {
    dispatch_once(&qword_10032F138, &stru_1002C7428);
  }
  unsigned int v19 = qword_10032F140;
  if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "hey silly, update the KT_APPLICATION_COUNT, too!", buf, 2u);
  }
  id v18 = 0;
LABEL_15:

  return v18;
}

- (void)clearApplicationState:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(KTPublicKeyStore *)self applicationKeyStores];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if ([v6 isEqualToString:kKTApplicationIdentifierTLT])
  {
    uint64_t v9 = [(KTPublicKeyStore *)self tltKeyStore];

    id v8 = (void *)v9;
  }
  if (v8)
  {
    [v8 clearState:a4];
    id v10 = [v8 application];
    [(KTPublicKeyStore *)self clearDiskApplicationKeyStore:v10 error:a4];
  }
  else
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C7468);
    }
    id v11 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unknown key store for application %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)clearForEnvironmentChange
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = [(KTPublicKeyStore *)self applications];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v23;
    *(void *)&long long v5 = 138412290;
    long long v19 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v8);
        id v10 = [(KTPublicKeyStore *)self applicationKeyStores];
        id v11 = [v10 objectForKeyedSubscript:v9];

        if (v11)
        {
          id v21 = 0;
          [v11 clearState:&v21];
          id v12 = v21;
          if (v12)
          {
            if (qword_10032F138 != -1) {
              dispatch_once(&qword_10032F138, &stru_1002C74A8);
            }
            id v13 = qword_10032F140;
            if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v27 = v9;
              __int16 v28 = 2112;
              id v29 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error clearing application keystore state[%@]: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          if (qword_10032F138 != -1) {
            dispatch_once(&qword_10032F138, &stru_1002C7488);
          }
          unsigned __int8 v14 = qword_10032F140;
          if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            id v27 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Tried to clear key store for unknown application %@", buf, 0xCu);
          }
        }

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v6);
  }

  dispatch_queue_t v15 = [(KTPublicKeyStore *)self tltKeyStore];

  if (v15)
  {
    id v16 = [(KTPublicKeyStore *)self tltKeyStore];
    id v20 = 0;
    [v16 clearState:&v20];
    id v17 = v20;

    if (v17)
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C74C8);
      }
      id v18 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Error clearing application keystore state[TLT]: %@", buf, 0xCu);
      }
    }
  }
}

- (BOOL)readyWithRefresh:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(KTPublicKeyStore *)self forceRefresh])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    id v6 = [(KTPublicKeyStore *)self applicationKeyStores];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [(KTPublicKeyStore *)self applications];
    id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = [v6 objectForKeyedSubscript:v12];
          if (v13)
          {
            unsigned __int8 v14 = (void *)v13;
            dispatch_queue_t v15 = [v6 objectForKeyedSubscript:v12];
            unsigned int v16 = [v15 readyWithRefresh:v3];

            if (v16) {
              continue;
            }
          }

          goto LABEL_16;
        }
        id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = [(KTPublicKeyStore *)self tltKeyStore];
    if (v17)
    {
      id v18 = (void *)v17;
      long long v19 = [(KTPublicKeyStore *)self tltKeyStore];
      unsigned int v5 = [v19 readyWithRefresh:v3];

      if (v5) {
        LOBYTE(v5) = [v6 count] != 0;
      }
    }
    else
    {
LABEL_16:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)ready
{
  return [(KTPublicKeyStore *)self readyWithRefresh:1];
}

- (BOOL)anyStoreExpired
{
  BOOL v3 = [(KTPublicKeyStore *)self applicationKeyStores];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(KTPublicKeyStore *)self applications];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        unsigned __int8 v10 = [v9 storeExpired];

        if (v10)
        {
          unsigned __int8 v11 = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  id v4 = [(KTPublicKeyStore *)self tltKeyStore];
  unsigned __int8 v11 = [v4 storeExpired];
LABEL_11:

  return v11;
}

- (BOOL)initiallyFetched
{
  id v11 = 0;
  v2 = [(KTPublicKeyStore *)self readPublicKeyStoreFromDisk:&v11];
  id v3 = v11;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:off_1003255C8];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 objectForKeyedSubscript:off_1003255D0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned __int8 v6 = [v5 BOOLValue];
      }
      else
      {
        if (qword_10032F138 != -1) {
          dispatch_once(&qword_10032F138, &stru_1002C7528);
        }
        id v9 = qword_10032F140;
        if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Disk data store ready flag wrong class", buf, 2u);
        }
        unsigned __int8 v6 = 0;
      }
    }
    else
    {
      if (qword_10032F138 != -1) {
        dispatch_once(&qword_10032F138, &stru_1002C7508);
      }
      id v8 = qword_10032F140;
      if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Disk data store missing metadata", buf, 2u);
      }
      unsigned __int8 v6 = 0;
    }
  }
  else
  {
    if (qword_10032F138 != -1) {
      dispatch_once(&qword_10032F138, &stru_1002C74E8);
    }
    uint64_t v7 = qword_10032F140;
    if (os_log_type_enabled((os_log_t)qword_10032F140, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Initial readPublicKeyStoreFromDisk failed with: %@", buf, 0xCu);
    }
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (OS_dispatch_group)configureGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConfigureGroup:(id)a3
{
}

- (OS_dispatch_queue)configureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConfigureQueue:(id)a3
{
}

- (NSMutableDictionary)_applicationKeyStores
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_applicationKeyStores:(id)a3
{
}

- (NSArray)applications
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplications:(id)a3
{
}

- (KTApplicationPublicKeyStore)tltKeyStore
{
  return (KTApplicationPublicKeyStore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTltKeyStore:(id)a3
{
}

- (BOOL)forceRefresh
{
  return self->_forceRefresh;
}

- (void)setForceRefresh:(BOOL)a3
{
  self->_forceRefresh = a3;
}

- (BOOL)stop
{
  return self->_stop;
}

- (void)setStop:(BOOL)a3
{
  self->_stop = a3;
}

- (TransparencySettingsProtocol)settings
{
  return (TransparencySettingsProtocol *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_tltKeyStore, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->__applicationKeyStores, 0);
  objc_storeStrong((id *)&self->_configureQueue, 0);
  objc_storeStrong((id *)&self->_configureGroup, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end