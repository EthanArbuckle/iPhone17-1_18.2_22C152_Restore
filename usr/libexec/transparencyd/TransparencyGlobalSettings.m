@interface TransparencyGlobalSettings
- (BOOL)setupCloudKit;
- (BOOL)shouldFetch:(id)a3;
- (CKContainer)container;
- (CKDatabase)publicCloudDatabase;
- (TransparencyAnalytics)logger;
- (TransparencyGlobalSettings)initWithContainer:(id)a3 dew:(id)a4 logger:(id)a5;
- (TransparencyGlobalSettingsProtocol)delegate;
- (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_)dew;
- (void)fetchCloudData:(id)a3 updateField:(id)a4 complete:(id)a5;
- (void)fetchSettings:(id)a3 force:(BOOL)a4;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDew:(id)a3;
- (void)setLogger:(id)a3;
- (void)setPublicCloudDatabase:(id)a3;
- (void)updateDewConfigurationWithData:(id)a3;
- (void)updateSFAConfigurationWithData:(id)a3;
@end

@implementation TransparencyGlobalSettings

- (TransparencyGlobalSettings)initWithContainer:(id)a3 dew:(id)a4 logger:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (+[TransparencyAnalytics hasInternalDiagnostics])
  {
    [(TransparencyGlobalSettings *)v11 setLogger:v10];
    [(TransparencyGlobalSettings *)self setDew:v9];
    [(TransparencyGlobalSettings *)self setDelegate:self];
    [(TransparencyGlobalSettings *)self setContainer:v8];
    self = self;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)setupCloudKit
{
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(TransparencyGlobalSettings *)v2 container];

  if (v3)
  {
    v4 = [(TransparencyGlobalSettings *)v2 publicCloudDatabase];

    if (v4)
    {
      LOBYTE(v3) = 0;
      LOBYTE(v5) = 1;
    }
    else
    {
      uint64_t v3 = [(TransparencyGlobalSettings *)v2 container];
      uint64_t v5 = [(id)v3 publicCloudDatabase];
      [(TransparencyGlobalSettings *)v2 setPublicCloudDatabase:v5];

      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  objc_sync_exit(v2);

  return (v5 | v3) & 1;
}

- (void)fetchSettings:(id)a3 force:(BOOL)a4
{
  v6 = (_xpc_activity_s *)a3;
  id location = 0;
  objc_initWeak(&location, self);
  v7 = [(TransparencyGlobalSettings *)self delegate];
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = sub_10005788C;
  v14[4] = sub_10005789C;
  id v15 = 0;
  id v15 = (id)os_transaction_create();
  if (v6 && xpc_activity_should_defer(v6))
  {
    if (qword_100326800 != -1) {
      dispatch_once(&qword_100326800, &stru_1002BB6E0);
    }
    id v8 = qword_100326808;
    if (os_log_type_enabled((os_log_t)qword_100326808, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deferring fetchSettings", buf, 2u);
    }
    xpc_activity_set_state(v6, 3);
  }
  else if (v7 && (a4 || [v7 shouldFetch:@"globalSettingsKey"]))
  {
    v17[0] = @"TransparencySFASettings";
    v17[1] = @"TransparencyDewSettings";
    id v9 = +[NSArray arrayWithObjects:v17 count:2];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000578E8;
    v11[3] = &unk_1002BB748;
    objc_copyWeak(&v12, &location);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100057B44;
    v10[3] = &unk_1002BB790;
    v10[4] = v14;
    [v7 fetchCloudData:v9 updateField:v11 complete:v10];
    objc_destroyWeak(&v12);
  }
  _Block_object_dispose(v14, 8);

  objc_destroyWeak(&location);
}

- (BOOL)shouldFetch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TransparencyGlobalSettings *)self logger];
  v6 = [v5 datePropertyForKey:v4];

  v7 = [v6 dateByAddingTimeInterval:86400.0];
  id v8 = +[NSDate date];
  if (v7 && (uint64_t)[v7 compare:v8] >= 1)
  {
    if (qword_100326800 != -1) {
      dispatch_once(&qword_100326800, &stru_1002BB7B0);
    }
    id v9 = qword_100326808;
    if (os_log_type_enabled((os_log_t)qword_100326808, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No enough time passed to run the CKFetch for new configuration", v13, 2u);
    }
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(TransparencyGlobalSettings *)self logger];
    [v11 setDateProperty:v8 forKey:@"globalSettingsKey"];

    BOOL v10 = 1;
  }

  return v10;
}

- (void)fetchCloudData:(id)a3 updateField:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void))a5;
  if ([(TransparencyGlobalSettings *)self setupCloudKit])
  {
    v23 = v9;
    v11 = +[NSMutableArray array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = [objc_alloc((Class)CKRecordID) initWithRecordName:*(void *)(*((void *)&v29 + 1) + 8 * i)];
          if (!v17)
          {
            if (qword_100326800 != -1) {
              dispatch_once(&qword_100326800, &stru_1002BB7D0);
            }
            id v9 = v23;
            v22 = qword_100326808;
            if (os_log_type_enabled((os_log_t)qword_100326808, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to create CKRecord", buf, 2u);
            }
            v10[2](v10, 0);
            goto LABEL_17;
          }
          v18 = v17;
          [v11 addObject:v17];
        }
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v12 = [objc_alloc((Class)CKFetchRecordsOperation) initWithRecordIDs:v11];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000581A4;
    v26[3] = &unk_1002BB838;
    id v9 = v23;
    id v27 = v23;
    [v12 setPerRecordCompletionBlock:v26];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10005841C;
    v24[3] = &unk_1002BB048;
    v25 = v10;
    v19 = +[NSBlockOperation blockOperationWithBlock:v24];
    [v19 addDependency:v12];
    v20 = +[NSOperationQueue mainQueue];
    [v20 addOperation:v19];

    v21 = [(TransparencyGlobalSettings *)self publicCloudDatabase];
    [v21 addOperation:v12];

LABEL_17:
  }
  else
  {
    v11 = +[TransparencyError errorWithDomain:kTransparencyErrorNetwork code:-1001 description:@"time out"];
    ((void (**)(id, void *))v10)[2](v10, v11);
  }
}

- (void)updateSFAConfigurationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyGlobalSettings *)self logger];
  [v5 updateCollectionConfigurationWithData:v4];
}

- (void)updateDewConfigurationWithData:(id)a3
{
  id v4 = a3;
  id v5 = [(TransparencyGlobalSettings *)self dew];
  [v5 updateDewConfigurationWithData:v4];
}

- (TransparencyGlobalSettingsProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TransparencyGlobalSettingsProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKDatabase)publicCloudDatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPublicCloudDatabase:(id)a3
{
}

- (TransparencyAnalytics)logger
{
  return (TransparencyAnalytics *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogger:(id)a3
{
}

- (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_)dew
{
  return (_TtP13transparencyd34DewConfigurationObjectiveCProtocol_ *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDew:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dew, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_publicCloudDatabase, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end