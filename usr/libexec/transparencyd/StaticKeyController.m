@interface StaticKeyController
+ (id)cloudPersistentStoreDescription:(id)a3;
+ (id)persistentStoreDescriptions:(id)a3;
- (BOOL)deleteStaticKey:(id)a3 error:(id *)a4;
- (BOOL)deleteStaticKeyByContactExternalURI:(id)a3 error:(id *)a4;
- (BOOL)deleteStaticKeyByContactIdentifier:(id)a3 error:(id *)a4;
- (BOOL)exportToCloud;
- (BOOL)haveContact:(id)a3 error:(id *)a4;
- (BOOL)importFromCloud;
- (BOOL)resetCloudZone:(id *)a3;
- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5;
- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4;
- (BOOL)shouldDoInitialCloudSyncing:(id)a3;
- (BOOL)triggerSync:(id *)a3;
- (KTContactsStoreProtocol)contactStore;
- (KTNotificationCenter)notificationCenter;
- (NSPersistentCloudKitContainer)cloudContainer;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (STCConfigurationStoreDelegate)configurationStore;
- (StaticKeyContactsProtocol)contacts;
- (StaticKeyIDSDelegate)idsDelegate;
- (id)dataFromHistoryToken:(id)a3;
- (id)fetchContactsSyncToken;
- (id)fetchHandles:(id)a3 moc:(id)a4 error:(id *)a5;
- (id)findStaticKeyByContact:(id)a3 error:(id *)a4;
- (id)findStaticKeyByContactExternalURI:(id)a3 error:(id *)a4;
- (id)findStaticKeyByContactIdentifier:(id)a3 error:(id *)a4;
- (id)findStaticKeyByHandle:(id)a3 error:(id *)a4;
- (id)findStaticKeyByKey:(id)a3 error:(id *)a4;
- (id)historyTokenFromData:(id)a3;
- (id)initCloudDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 complete:(id)a7;
- (id)initLocalDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 contactStore:(id)a7 complete:(id)a8;
- (id)lastContactSyncDate;
- (id)listStaticKey:(id *)a3;
- (id)mapStaticKeyToStoreEntry:(id)a3 handles:(id)a4 moc:(id)a5 error:(id *)a6;
- (id)staticKeyModelURL;
- (id)storeStaticKey:(id)a3 contactIdentifier:(id)a4 contactExternalIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7;
- (id)validateStaticKeyStoreMappingByContactExternalURI:(id)a3 error:(id *)a4;
- (id)validateStaticKeyStoreMappingByContactIdentifer:(id)a3 error:(id *)a4;
- (id)validateStaticKeyStoreMappingByKey:(id)a3 error:(id *)a4;
- (id)validateStoreEntry:(id)a3 error:(id *)a4;
- (void)consumeContactsChangeHistory;
- (void)deleteContact:(id)a3 contactExternalURI:(id)a4;
- (void)drainContactsSyncing;
- (void)fetchPeerHandles:(id)a3 application:(id)a4 complete:(id)a5;
- (void)launchCloudSyncing:(id)a3 initialDelay:(double)a4;
- (void)peerVerificationUpdated:(id)a3;
- (void)postChangeForEntry:(id)a3 publicAccountIdentity:(id)a4;
- (void)processCoreDataHistory;
- (void)remoteUpdate:(id)a3;
- (void)setCloudContainer:(id)a3;
- (void)setConfigurationStore:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContacts:(id)a3;
- (void)setContactsSyncController:(id)a3;
- (void)setIdsDelegate:(id)a3;
- (void)setLog:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setQueue:(id)a3;
- (void)startContactsSyncing;
- (void)storeContactsSyncToken:(id)a3;
- (void)updateContact:(id)a3;
- (void)updateLastContactSyncDate;
- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5;
@end

@implementation StaticKeyController

- (id)initCloudDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 complete:(id)a7
{
  id v12 = a3;
  id v46 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "StaticKeyController: %@", (uint8_t *)&buf, 0xCu);
  }
  if (v12)
  {
    id v16 = 0;
LABEL_5:
    v52.receiver = self;
    v52.super_class = (Class)StaticKeyController;
    v17 = [(StaticKeyController *)&v52 init];
    v18 = v17;
    if (v17)
    {
      if (v14)
      {
        [(StaticKeyController *)v17 setNotificationCenter:v14];
      }
      else
      {
        v25 = +[NSDistributedNotificationCenter defaultCenter];
        [(StaticKeyController *)v18 setNotificationCenter:v25];
      }
      [(StaticKeyController *)v18 setIdsDelegate:v46];
      [(StaticKeyController *)v18 setConfigurationStore:v13];
      id v26 = objc_alloc_init((Class)CNContactStore);
      v27 = [[KTContactsStore alloc] initWithContactStore:v26];
      [(StaticKeyController *)v18 setContactStore:v27];

      dispatch_queue_t v28 = dispatch_queue_create("StaticKeyController", 0);
      [(StaticKeyController *)v18 setQueue:v28];

      v29 = [(StaticKeyController *)v18 queue];
      dispatch_suspend(v29);

      os_log_t v30 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
      [(StaticKeyController *)v18 setLog:v30];

      v31 = [(StaticKeyController *)v18 log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "setup StaticKeyController: %@", (uint8_t *)&buf, 0xCu);
      }

      id v32 = objc_alloc((Class)NSManagedObjectModel);
      v33 = [(StaticKeyController *)v18 staticKeyModelURL];
      id v34 = [v32 initWithContentsOfURL:v33];

      v35 = +[StaticKeyController cloudPersistentStoreDescription:v12];
      v36 = +[NSPersistentCloudKitContainer persistentContainerWithName:@"StaticKey" managedObjectModel:v34];
      [(StaticKeyController *)v18 setCloudContainer:v36];

      v37 = [(StaticKeyController *)v18 cloudContainer];
      [v37 setPersistentStoreDescriptions:v35];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v56 = 0x2020000000;
      id v57 = 0;
      id v57 = [v35 count];
      v38 = [(StaticKeyController *)v18 cloudContainer];
      [(StaticKeyController *)v18 setPersistentContainer:v38];

      v39 = [(StaticKeyController *)v18 log];
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v51 = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Load Core Data", v51, 2u);
      }

      v40 = [(StaticKeyController *)v18 persistentContainer];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_10002FF48;
      v47[3] = &unk_1002B96A8;
      v41 = v18;
      v48 = v41;
      p_long long buf = &buf;
      id v49 = v15;
      [v40 loadPersistentStoresWithCompletionHandler:v47];

      self = v41;
      _Block_object_dispose(&buf, 8);

      v42 = self;
      goto LABEL_33;
    }
    if (qword_100326780 != -1) {
      dispatch_once(&qword_100326780, &stru_1002B9680);
    }
    v24 = qword_100326788;
    if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "StaticKeyController: super init", (uint8_t *)&buf, 2u);
    }
    self = 0;
LABEL_27:
    v42 = 0;
    goto LABEL_33;
  }
  id v54 = 0;
  v19 = +[TransparencyFileSupport transparencyFilesPath:&v54];
  id v16 = v54;
  if (!v19)
  {
    if (qword_100326780 != -1) {
      dispatch_once(&qword_100326780, &stru_1002B9640);
    }
    v43 = qword_100326788;
    if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v16;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "StaticKeyController: transparencyFilesPath: %@", (uint8_t *)&buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_27;
  }
  id v12 = [v19 URLByAppendingPathComponent:@"StaticKey" isDirectory:1];

  v20 = +[NSFileManager defaultManager];
  NSFileAttributeKey v58 = NSFileProtectionKey;
  NSFileProtectionType v59 = NSFileProtectionNone;
  v21 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  id v53 = v16;
  unsigned __int8 v22 = [v20 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:v21 error:&v53];
  id v23 = v53;

  if (v22)
  {
    id v16 = v23;
    goto LABEL_5;
  }
  if (qword_100326780 != -1) {
    dispatch_once(&qword_100326780, &stru_1002B9660);
  }
  v44 = qword_100326788;
  if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "StaticKeyController: create directory %@", (uint8_t *)&buf, 0xCu);
  }
  v42 = 0;
  id v16 = v23;
LABEL_33:

  return v42;
}

- (id)initLocalDataStore:(id)a3 idsDelegate:(id)a4 configurationStore:(id)a5 notificationCenter:(id)a6 contactStore:(id)a7 complete:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v41.receiver = self;
  v41.super_class = (Class)StaticKeyController;
  v20 = [(StaticKeyController *)&v41 init];
  v21 = v20;
  if (v20)
  {
    id v37 = v16;
    if (v17)
    {
      [(StaticKeyController *)v20 setNotificationCenter:v17];
    }
    else
    {
      unsigned __int8 v22 = +[NSDistributedNotificationCenter defaultCenter];
      [(StaticKeyController *)v21 setNotificationCenter:v22];
    }
    [(StaticKeyController *)v21 setIdsDelegate:v15];
    [(StaticKeyController *)v21 setContactStore:v18];
    dispatch_queue_t v23 = dispatch_queue_create("StaticKeyController", 0);
    [(StaticKeyController *)v21 setQueue:v23];

    os_log_t v24 = os_log_create("com.apple.Transparency", "StaticKeyDatabase");
    [(StaticKeyController *)v21 setLog:v24];

    id v25 = objc_alloc((Class)NSManagedObjectModel);
    id v26 = [(StaticKeyController *)v21 staticKeyModelURL];
    id v27 = [v25 initWithContentsOfURL:v26];

    dispatch_queue_t v28 = +[StaticKeyController persistentStoreDescriptions:v14];
    v29 = +[NSPersistentContainer persistentContainerWithName:@"StaticKey" managedObjectModel:v27];
    [(StaticKeyController *)v21 setPersistentContainer:v29];

    os_log_t v30 = [(StaticKeyController *)v21 persistentContainer];
    [v30 setPersistentStoreDescriptions:v28];

    v31 = [(StaticKeyController *)v21 persistentContainer];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100030430;
    v38[3] = &unk_1002B96D0;
    id v32 = v15;
    id v33 = v14;
    id v34 = v21;
    v39 = v34;
    id v40 = v19;
    [v31 loadPersistentStoresWithCompletionHandler:v38];

    id v16 = v37;
    [(StaticKeyController *)v34 setConfigurationStore:v37];
    v35 = v34;
    id v14 = v33;
    id v15 = v32;
  }
  return v21;
}

- (void)remoteUpdate:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v4 userInfo];
    *(_DWORD *)long long buf = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "remoteUpdate: %@/%@", buf, 0x16u);
  }
  v6 = [(StaticKeyController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030638;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)historyTokenFromData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)dataFromHistoryToken:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)processCoreDataHistory
{
  id v3 = [(StaticKeyController *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(StaticKeyController *)self persistentContainer];
  id v5 = [v4 newBackgroundContext];

  v6 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v5 setMergePolicy:v6];

  v7 = +[NSMutableSet set];
  v8 = [(StaticKeyController *)self configurationStore];
  id v9 = [v8 getSettingsData:@"CoreDataSyncToken"];

  [(StaticKeyController *)self historyTokenFromData:v9];
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_1000309D8;
  id v18 = &unk_1002B9718;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v5;
  v21 = self;
  id v10 = v7;
  id v22 = v10;
  id v11 = v5;
  id v12 = v19;
  [v11 performBlockAndWait:&v15];
  if (objc_msgSend(v10, "count", v15, v16, v17, v18))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processCoreDataHistory: updating: %@", buf, 0xCu);
    }
    id v13 = [(StaticKeyController *)self idsDelegate];
    id v14 = [v10 allObjects];
    [v13 didUpdateStaticKeyStore:v14 application:kKTApplicationIdentifierIDS];
  }
}

- (void)setContactsSyncController:(id)a3
{
  id v8 = a3;
  id v4 = [(StaticKeyController *)self contacts];

  if (v4)
  {
    id v5 = [(StaticKeyController *)self contacts];
    [v5 invalidateContactsSyncing];

    [(StaticKeyController *)self setContacts:0];
  }
  v6 = v8;
  if (v8)
  {
    [(StaticKeyController *)self setContacts:v8];
    v7 = [(StaticKeyController *)self contacts];
    [v7 setDelegate:self];

    v6 = v8;
  }
}

- (void)consumeContactsChangeHistory
{
  id v2 = [(StaticKeyController *)self contacts];
  [v2 consumeContactsChangeHistory];
}

- (void)startContactsSyncing
{
  id v2 = [(StaticKeyController *)self contacts];
  [v2 startContactsSyncing];
}

- (void)drainContactsSyncing
{
  id v2 = [(StaticKeyController *)self contacts];
  [v2 drainContactsSyncing];
}

- (id)staticKeyModelURL
{
  id v2 = +[NSBundle bundleWithIdentifier:@"com.apple.Transparency"];
  id v3 = [v2 URLForResource:@"StaticKeyDataModel" withExtension:@"momd"];

  return v3;
}

+ (id)persistentStoreDescriptions:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"StaticKey"];
  id v4 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v3];
  [v4 setType:NSSQLiteStoreType];
  [v4 setShouldAddStoreAsynchronously:0];
  [v4 setConfiguration:@"Default"];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  v7 = v4;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];

  return v5;
}

+ (id)cloudPersistentStoreDescription:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"CloudStore"];
  id v4 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v3];
  [v4 setConfiguration:@"Cloud"];
  [v4 setShouldAddStoreAsynchronously:0];
  id v5 = objc_alloc((Class)NSPersistentCloudKitContainerOptions);
  id v6 = [v5 initWithContainerIdentifier:off_10031E998];
  [v6 setUseDeviceToDeviceEncryption:1];
  [v6 setApsConnectionMachServiceName:@"com.apple.aps.transparencyd-coredata"];
  [v4 setCloudKitContainerOptions:v6];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentStoreRemoteChangeNotificationPostOptionKey];
  [v4 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  id v9 = v4;
  v7 = +[NSArray arrayWithObjects:&v9 count:1];

  return v7;
}

- (BOOL)importFromCloud
{
  id v3 = [(StaticKeyController *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = [(StaticKeyController *)self persistentContainer];
  id v5 = [v4 newBackgroundContext];

  id v6 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v5 setMergePolicy:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000314E4;
  v9[3] = &unk_1002B9768;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  [v7 performBlockAndWait:v9];
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)exportToCloud
{
  id v3 = [(StaticKeyController *)self queue];
  dispatch_assert_queue_V2(v3);

  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  id v4 = [(StaticKeyController *)self persistentContainer];
  id v5 = [v4 newBackgroundContext];

  id v6 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v5 setMergePolicy:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100031844;
  v9[3] = &unk_1002B9768;
  id v11 = &v12;
  v9[4] = self;
  id v7 = v5;
  id v10 = v7;
  [v7 performBlockAndWait:v9];
  LOBYTE(v5) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)v5;
}

- (BOOL)triggerSync:(id *)a3
{
  id v4 = [(StaticKeyController *)self cloudContainer];

  if (v4)
  {
    id v5 = [(StaticKeyController *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100031B48;
    block[3] = &unk_1002B6CF8;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  else
  {
    id v6 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1002188D0();
    }
  }
  return v4 != 0;
}

- (BOOL)setupCloudSchema:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = [(StaticKeyController *)self cloudContainer];

  if (v7)
  {
    if (v5) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = [(StaticKeyController *)self cloudContainer];
    id v14 = 0;
    unsigned __int8 v10 = [v9 initializeCloudKitSchemaWithOptions:v8 error:&v14];
    id v11 = v14;

    if ((v10 & 1) == 0)
    {
      uint64_t v12 = [(StaticKeyController *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100218904();
      }

      if (a4)
      {
        id v11 = v11;
        *a4 = v11;
      }
    }
  }
  else
  {
    id v11 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1002188D0();
    }
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (BOOL)resetCloudZone:(id *)a3
{
  id v4 = [(StaticKeyController *)self cloudContainer];

  BOOL v5 = [(StaticKeyController *)self log];
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "reset zone start", buf, 2u);
    }

    id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    uint64_t v8 = [(StaticKeyController *)self cloudContainer];
    id v9 = [v8 persistentStoreCoordinator];
    [v7 setPersistentStoreCoordinator:v9];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100031E08;
    v11[3] = &unk_1002B7D58;
    v11[4] = self;
    id v12 = v7;
    id v6 = v7;
    [v6 performBlockAndWait:v11];
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    sub_1002188D0();
  }

  return v4 != 0;
}

- (id)fetchHandles:(id)a3 moc:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  unsigned __int8 v10 = +[KTCoreDataSTHandle fetchRequest];
  id v11 = +[NSPredicate predicateWithFormat:@"publicIdentity == %@", v9];

  [v10 setPredicate:v11];
  id v18 = 0;
  id v12 = [v8 executeFetchRequest:v10 error:&v18];

  id v13 = v18;
  if (v12)
  {
    uint64_t v14 = +[NSMutableSet setWithArray:v12];
  }
  else
  {
    char v15 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetchHandles failed with: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }
    uint64_t v14 = +[NSMutableSet set];
  }
  uint64_t v16 = (void *)v14;

  return v16;
}

- (id)storeStaticKey:(id)a3 contactIdentifier:(id)a4 contactExternalIdentifier:(id)a5 mappings:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = [(StaticKeyController *)self fetchContactsSyncToken];

  if (!v16)
  {
    if (qword_100326780 != -1) {
      dispatch_once(&qword_100326780, &stru_1002B97B0);
    }
    id v17 = qword_100326788;
    if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "storeStaticKey no previously existing sync token", buf, 2u);
    }
    id v18 = [(StaticKeyController *)self contactStore];
    id v19 = [(StaticKeyController *)self configurationStore];
    [v18 fetchAndStoreContactsSyncTokenWithConfigStore:v19];
  }
  *(void *)long long buf = 0;
  id v57 = buf;
  uint64_t v58 = 0x3032000000;
  NSFileProtectionType v59 = sub_100032714;
  v60 = sub_100032724;
  id v61 = 0;
  id v20 = [(StaticKeyController *)self persistentContainer];
  id v21 = [v20 newBackgroundContext];

  id v22 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v21 setMergePolicy:v22];

  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x3032000000;
  id v53 = sub_100032714;
  id v54 = sub_100032724;
  id v55 = 0;
  dispatch_queue_t v23 = [v12 ktStorageString];
  id v24 = [(StaticKeyController *)self log];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = [v15 componentsJoinedByString:@","];
    *(_DWORD *)v62 = 138412802;
    id v63 = v12;
    __int16 v64 = 2112;
    v65 = v23;
    __int16 v66 = 2112;
    v67 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "storeStaticKey identity: %@ %@ mappings: %@", v62, 0x20u);
  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10003272C;
  v41[3] = &unk_1002B97D8;
  id v26 = v14;
  id v42 = v26;
  id v27 = v13;
  id v43 = v27;
  id v28 = v21;
  id v44 = v28;
  v48 = &v50;
  id v29 = v23;
  id v45 = v29;
  id v46 = self;
  id v30 = v15;
  id v47 = v30;
  id v49 = buf;
  [v28 performBlockAndWait:v41];
  v31 = (void *)*((void *)v57 + 5);
  if (!a7 || v31)
  {
    id v32 = [v31 contactExternalURI];
    id v33 = [*((id *)v57 + 5) publicKeyID];
    id v34 = [v33 publicAccountIdentity];
    [(StaticKeyController *)self postChangeForEntry:v32 publicAccountIdentity:v34];

    v35 = [(StaticKeyController *)self idsDelegate];
    v36 = [*((id *)v57 + 5) mappings];
    [v35 didUpdateStaticKeyStore:v36 application:kKTApplicationIdentifierIDS];
  }
  else
  {
    *a7 = (id) v51[5];
  }
  id v37 = [(StaticKeyController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032EFC;
  block[3] = &unk_1002B6CF8;
  block[4] = self;
  dispatch_async(v37, block);

  id v38 = *((id *)v57 + 5);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(buf, 8);

  return v38;
}

- (void)postChangeForEntry:(id)a3 publicAccountIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(StaticKeyController *)self log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "postChangeToEntry externalURI: %@ publicKey: %@", buf, 0x16u);
  }

  if (v6 && v7)
  {
    v11[0] = kTransparencyStaticKeyStoreContactIdentifier;
    v11[1] = kTransparencyStaticKeyStorePublicIdentifydentifier;
    v12[0] = v6;
    v12[1] = v7;
    id v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    unsigned __int8 v10 = [(StaticKeyController *)self notificationCenter];
    [v10 postNotificationName:kTransparencyStaticKeyStoreNotification object:0 userInfo:v9 deliverImmediately:1];
  }
}

- (id)mapStaticKeyToStoreEntry:(id)a3 handles:(id)a4 moc:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 publicIdentity];
  if (v11)
  {
    id v43 = 0;
    id v12 = +[KTAccountPublicID ktAccountPublicIDWithStorageString:v11 error:&v43];
    id v13 = v43;
    id v14 = v13;
    if (v12)
    {
      v36 = v13;
      id v37 = v11;
      id v15 = objc_alloc_init((Class)KTIDStaticKeyStoreEntry);
      v35 = v12;
      [v15 setPublicKeyID:v12];
      id v16 = [v9 contactIdentifier];
      [v15 setContactIdentifier:v16];

      id v38 = v9;
      id v17 = [v9 contactExternalIdentifier];
      id v34 = v15;
      [v15 setContactServerPath:v17];

      id v18 = +[NSMutableArray array];
      id v19 = +[NSMutableDictionary dictionary];
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v20 = v10;
      id v21 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v40;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v40 != v23) {
              objc_enumerationMutation(v20);
            }
            id v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            id v26 = [v25 idsID];

            if (v26)
            {
              id v27 = objc_alloc_init((Class)KTIDStaticKeyStoreHandle);
              [v27 setValidationDate:0];
              [v27 setValid:0];
              id v28 = [v25 idsID];
              [v27 setHandle:v28];

              [v27 setErrorCode:[v25 error]];
              id v29 = [v25 idsID];
              [v19 setObject:v27 forKeyedSubscript:v29];

              id v30 = [v25 idsID];
              [v18 addObject:v30];
            }
          }
          id v22 = [v20 countByEnumeratingWithState:&v39 objects:v44 count:16];
        }
        while (v22);
      }

      v31 = v34;
      if ([v18 count])
      {
        [v34 setMappings:v18];
        [v34 setHandles:v19];
      }

      id v9 = v38;
      id v14 = v36;
      id v11 = v37;
      id v12 = v35;
    }
    else
    {
      id v32 = [(StaticKeyController *)self log];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v46 = v14;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to create KTAccountPublicID: %@", buf, 0xCu);
      }

      v31 = 0;
      if (a6) {
        *a6 = v14;
      }
    }
  }
  else
  {
    id v14 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "failed to create public identity string", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)findStaticKeyByKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100032714;
  id v32 = sub_100032724;
  id v33 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_100032714;
  id v26 = sub_100032724;
  id v27 = 0;
  id v7 = [v6 ktStorageString];
  if (v7)
  {
    id v8 = [(StaticKeyController *)self persistentContainer];
    id v9 = [v8 newBackgroundContext];

    id v10 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
    [v9 setMergePolicy:v10];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100033648;
    v16[3] = &unk_1002B9800;
    id v17 = v7;
    id v11 = v9;
    id v18 = v11;
    id v19 = self;
    id v20 = &v28;
    id v21 = &v22;
    [v11 performBlockAndWait:v16];
    id v12 = (void *)v23[5];
    if (!v12)
    {
      if (a4)
      {
        id v13 = (void *)v29[5];
        if (v13)
        {
          *a4 = v13;
          id v12 = (void *)v23[5];
        }
      }
    }
    id v14 = v12;
  }
  else
  {
    id v14 = 0;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v14;
}

- (id)findStaticKeyByHandle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100032714;
  v31 = sub_100032724;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100032714;
  id v25 = sub_100032724;
  id v26 = 0;
  id v7 = [(StaticKeyController *)self persistentContainer];
  id v8 = [v7 newBackgroundContext];

  id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v8 setMergePolicy:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000339A8;
  v15[3] = &unk_1002B9800;
  id v10 = v6;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  id v19 = &v27;
  id v20 = &v21;
  [v11 performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v28[5];
    if (v12) {
      *a4 = v12;
    }
  }
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (BOOL)shouldDoInitialCloudSyncing:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(StaticKeyController *)self configurationStore];

  if (v5)
  {
    id v6 = [(StaticKeyController *)self configurationStore];
    id v7 = [v6 getSettingsDate:@"lastCKSyncData"];

    if (v4 && v7)
    {
      if (qword_100326780 != -1) {
        dispatch_once(&qword_100326780, &stru_1002B9860);
      }
      id v8 = qword_100326788;
      if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        id v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cloud sync: last sync: %{public}@", (uint8_t *)&v17, 0xCu);
      }
      id v9 = [v4 dateByAddingTimeInterval:-604800.0];
      id v10 = [v7 compare:v9];
      BOOL v11 = v10 == (id)-1;
      if (v10 != (id)-1) {
        goto LABEL_24;
      }
      if (qword_100326780 != -1) {
        dispatch_once(&qword_100326780, &stru_1002B9880);
      }
      id v12 = qword_100326788;
      if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "7d cloud sync setting", (uint8_t *)&v17, 2u);
      }
      id v13 = [(StaticKeyController *)self configurationStore];
      [v13 setSettingsDate:@"lastCKSyncData" date:v4];
    }
    else
    {
      if (qword_100326780 != -1) {
        dispatch_once(&qword_100326780, &stru_1002B9840);
      }
      id v15 = qword_100326788;
      if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Initial cloud sync setting", (uint8_t *)&v17, 2u);
      }
      id v9 = [(StaticKeyController *)self configurationStore];
      [v9 setSettingsDate:@"lastCKSyncData" date:v4];
    }
    BOOL v11 = 1;
LABEL_24:

    goto LABEL_25;
  }
  if (qword_100326780 != -1) {
    dispatch_once(&qword_100326780, &stru_1002B9820);
  }
  id v14 = qword_100326788;
  BOOL v11 = 0;
  if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No cloud sync setting", (uint8_t *)&v17, 2u);
    BOOL v11 = 0;
  }
LABEL_25:

  return v11;
}

- (void)launchCloudSyncing:(id)a3 initialDelay:(double)a4
{
  id v6 = a3;
  if (a4 >= 0.0 && [(StaticKeyController *)self shouldDoInitialCloudSyncing:v6])
  {
    id v7 = (void *)os_transaction_create();
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    id v9 = [(StaticKeyController *)self queue];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_1000341A8;
    v12[3] = &unk_1002B7D58;
    v12[4] = self;
    id v13 = v7;
    id v10 = v7;
    dispatch_after(v8, v9, v12);
  }
  else
  {
    if (qword_100326780 != -1) {
      dispatch_once(&qword_100326780, &stru_1002B98A0);
    }
    BOOL v11 = qword_100326788;
    if (os_log_type_enabled((os_log_t)qword_100326788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping initial cloud sync", buf, 2u);
    }
  }
}

- (id)findStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_100032714;
  v31 = sub_100032724;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100032714;
  id v25 = sub_100032724;
  id v26 = 0;
  id v7 = [(StaticKeyController *)self persistentContainer];
  id v8 = [v7 newBackgroundContext];

  id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v8 setMergePolicy:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100034488;
  v15[3] = &unk_1002B9800;
  id v10 = v6;
  id v16 = v10;
  id v11 = v8;
  id v17 = v11;
  id v18 = self;
  id v19 = &v27;
  id v20 = &v21;
  [v11 performBlockAndWait:v15];
  if (a4)
  {
    id v12 = (void *)v28[5];
    if (v12) {
      *a4 = v12;
    }
  }
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v13;
}

- (id)findStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v26 = 0;
    uint64_t v27 = &v26;
    uint64_t v28 = 0x3032000000;
    uint64_t v29 = sub_100032714;
    uint64_t v30 = sub_100032724;
    id v31 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = sub_100032714;
    uint64_t v24 = sub_100032724;
    id v25 = 0;
    id v7 = [(StaticKeyController *)self persistentContainer];
    id v8 = [v7 newBackgroundContext];

    id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
    [v8 setMergePolicy:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100034810;
    v14[3] = &unk_1002B9800;
    id v15 = v6;
    id v10 = v8;
    id v16 = v10;
    id v17 = self;
    id v18 = &v26;
    id v19 = &v20;
    [v10 performBlockAndWait:v14];
    if (a4)
    {
      id v11 = (void *)v27[5];
      if (v11) {
        *a4 = v11;
      }
    }
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)validateStaticKeyStoreMappingByKey:(id)a3 error:(id *)a4
{
  id v6 = -[StaticKeyController findStaticKeyByKey:error:](self, "findStaticKeyByKey:error:", a3);
  if (v6)
  {
    id v7 = [(StaticKeyController *)self validateStoreEntry:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactIdentifer:(id)a3 error:(id *)a4
{
  id v6 = -[StaticKeyController findStaticKeyByContactIdentifier:error:](self, "findStaticKeyByContactIdentifier:error:", a3);
  if (v6)
  {
    id v7 = [(StaticKeyController *)self validateStoreEntry:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)validateStaticKeyStoreMappingByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = -[StaticKeyController findStaticKeyByContactExternalURI:error:](self, "findStaticKeyByContactExternalURI:error:", a3);
  if (v6)
  {
    id v7 = [(StaticKeyController *)self validateStoreEntry:v6 error:a4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)deleteStaticKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v7 = [(StaticKeyController *)self persistentContainer];
  id v8 = [v7 newBackgroundContext];

  id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v8 setMergePolicy:v9];

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100032714;
  uint64_t v29 = sub_100032724;
  id v30 = 0;
  id v10 = +[NSMutableSet set];
  id v11 = [v6 ktStorageString];
  id v12 = v11;
  if (v11)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100034D68;
    v19[3] = &unk_1002B9800;
    id v20 = v11;
    id v21 = v8;
    uint64_t v23 = &v25;
    id v13 = v10;
    id v22 = v13;
    uint64_t v24 = &v31;
    [v21 performBlockAndWait:v19];
    if (a4)
    {
      id v14 = (void *)v26[5];
      if (v14) {
        *a4 = v14;
      }
    }
    if ([v13 count])
    {
      id v15 = [(StaticKeyController *)self idsDelegate];
      id v16 = [v13 allObjects];
      [v15 didUpdateStaticKeyStore:v16 application:kKTApplicationIdentifierIDS];
    }
    BOOL v17 = *((unsigned char *)v32 + 24) != 0;
  }
  else
  {
    BOOL v17 = 0;
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  id v7 = [(StaticKeyController *)self persistentContainer];
  id v8 = [v7 newBackgroundContext];

  id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v8 setMergePolicy:v9];

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100032714;
  uint64_t v29 = sub_100032724;
  id v30 = 0;
  id v10 = +[NSMutableSet set];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000352B4;
  v19[3] = &unk_1002B9800;
  id v11 = v6;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  uint64_t v23 = &v25;
  id v13 = v10;
  id v22 = v13;
  uint64_t v24 = &v31;
  [v12 performBlockAndWait:v19];
  if (a4)
  {
    id v14 = (void *)v26[5];
    if (v14) {
      *a4 = v14;
    }
  }
  if ([v13 count])
  {
    id v15 = [(StaticKeyController *)self idsDelegate];
    id v16 = [v13 allObjects];
    [v15 didUpdateStaticKeyStore:v16 application:kKTApplicationIdentifierIDS];
  }
  char v17 = *((unsigned char *)v32 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v17;
}

- (BOOL)deleteStaticKeyByContactExternalURI:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (v6)
  {
    uint64_t v30 = 0;
    uint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    char v33 = 0;
    id v7 = [(StaticKeyController *)self persistentContainer];
    id v8 = [v7 newBackgroundContext];

    id v9 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
    [v8 setMergePolicy:v9];

    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000;
    uint64_t v27 = sub_100032714;
    uint64_t v28 = sub_100032724;
    id v29 = 0;
    id v10 = +[NSMutableSet set];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10003585C;
    v18[3] = &unk_1002B9800;
    id v19 = v6;
    id v11 = v8;
    id v20 = v11;
    id v22 = &v24;
    id v12 = v10;
    id v21 = v12;
    uint64_t v23 = &v30;
    [v11 performBlockAndWait:v18];
    if (a4)
    {
      id v13 = (void *)v25[5];
      if (v13) {
        *a4 = v13;
      }
    }
    if ([v12 count])
    {
      id v14 = [(StaticKeyController *)self idsDelegate];
      id v15 = [v12 allObjects];
      [v14 didUpdateStaticKeyStore:v15 application:kKTApplicationIdentifierIDS];
    }
    BOOL v16 = *((unsigned char *)v31 + 24) != 0;

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)listStaticKey:(id *)a3
{
  id v4 = objc_alloc_init((Class)NSMutableArray);
  BOOL v5 = [(StaticKeyController *)self persistentContainer];
  id v6 = [v5 newBackgroundContext];

  id v7 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v6 setMergePolicy:v7];

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100032714;
  v17[4] = sub_100032724;
  id v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100035D30;
  v13[3] = &unk_1002B7A58;
  id v8 = v6;
  id v14 = v8;
  BOOL v16 = v17;
  id v9 = v4;
  id v15 = v9;
  [v8 performBlockAndWait:v13];
  id v10 = v15;
  id v11 = v9;

  _Block_object_dispose(v17, 8);

  return v11;
}

- (BOOL)setErrorCode:(int)a3 forMapping:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_100032714;
  uint64_t v27 = sub_100032724;
  id v28 = 0;
  id v9 = [(StaticKeyController *)self persistentContainer];
  id v10 = [v9 newBackgroundContext];

  id v11 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v10 setMergePolicy:v11];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000360B4;
  v17[3] = &unk_1002B9908;
  id v12 = v8;
  id v18 = v12;
  id v13 = v10;
  id v19 = v13;
  id v20 = &v23;
  int v22 = a3;
  id v21 = &v29;
  [v13 performBlockAndWait:v17];
  if (a5)
  {
    id v14 = (void *)v24[5];
    if (v14) {
      *a5 = v14;
    }
  }
  char v15 = *((unsigned char *)v30 + 24);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (BOOL)haveContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(StaticKeyController *)self contactStore];
  LOBYTE(a4) = [v7 haveContact:v6 error:a4];

  return (char)a4;
}

- (id)lastContactSyncDate
{
  id v2 = [(StaticKeyController *)self configurationStore];
  id v3 = [v2 getSettingsDate:@"lastContactSyncDate"];

  return v3;
}

- (void)updateLastContactSyncDate
{
  id v3 = [(StaticKeyController *)self configurationStore];
  id v2 = +[NSDate date];
  [v3 setSettingsDate:@"lastContactSyncDate" date:v2];
}

- (id)fetchContactsSyncToken
{
  id v2 = [(StaticKeyController *)self configurationStore];
  id v3 = [v2 getSettingsData:@"lastContactSyncData"];

  return v3;
}

- (void)storeContactsSyncToken:(id)a3
{
  id v4 = a3;
  id v5 = [(StaticKeyController *)self configurationStore];
  [v5 setSettingsData:@"lastContactSyncData" data:v4];
}

- (void)fetchPeerHandles:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(StaticKeyController *)self idsDelegate];
  id v12 = v11;
  if (v11)
  {
    [v11 fetchPeerHandles:v8 application:v9 complete:v10];
  }
  else
  {
    id v13 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1002189D4();
    }

    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
}

- (void)validatePeerResult:(id)a3 uuid:(id)a4 completionBlock:(id)a5
{
  id v5 = (void (**)(id, id, void))a5;
  id v6 = objc_alloc_init((Class)KTVerifierResult);
  [v6 setSucceed:0];
  v5[2](v5, v6, 0);
}

- (id)validateStoreEntry:(id)a3 error:(id *)a4
{
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_100032714;
  uint64_t v25 = sub_100032724;
  id v26 = 0;
  id v5 = a3;
  id v26 = v5;
  if (qword_100326780 != -1) {
    dispatch_once(&qword_100326780, &stru_1002B9928);
  }
  id v6 = (id)qword_100326788;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 mappings];
    id v8 = [v7 componentsJoinedByString:@","];
    *(_DWORD *)long long buf = 138412290;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "validateStoreEntry looking for handles: %@", buf, 0xCu);
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  id v10 = kKTApplicationIdentifierIDS;
  id v11 = [v5 mappings];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10003681C;
  v17[3] = &unk_1002B99B0;
  id v12 = v5;
  id v18 = v12;
  id v20 = &v21;
  id v13 = v9;
  id v19 = v13;
  [(StaticKeyController *)self fetchPeerHandles:v11 application:v10 complete:v17];

  dispatch_time_t v14 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(v13, v14);
  id v15 = (id)v22[5];

  _Block_object_dispose(&v21, 8);

  return v15;
}

- (void)peerVerificationUpdated:(id)a3
{
  id v3 = [(StaticKeyController *)self log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "StaticKeyController updating verification", v4, 2u);
  }
}

- (id)findStaticKeyByContact:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 externalURI];
  id v14 = 0;
  id v8 = [(StaticKeyController *)self findStaticKeyByContactExternalURI:v7 error:&v14];
  id v9 = v14;

  if (v8)
  {
    id v10 = v9;
  }
  else
  {
    id v11 = [v6 identifier];
    id v13 = v9;
    id v8 = [(StaticKeyController *)self findStaticKeyByContactIdentifier:v11 error:&v13];
    id v10 = v13;

    if (a4 && !v8 && v10)
    {
      id v10 = v10;
      id v8 = 0;
      *a4 = v10;
    }
  }

  return v8;
}

- (void)updateContact:(id)a3
{
  id v4 = a3;
  id v5 = +[KeyTransparencyContactMapping mapContactsToIDS:v4];
  id v6 = [(StaticKeyController *)self log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v29 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updateContact contactMappings: %@", buf, 0xCu);
  }

  id v27 = 0;
  id v7 = [(StaticKeyController *)self findStaticKeyByContact:v4 error:&v27];

  id v8 = v27;
  if (v7)
  {
    id v9 = [v7 mappings];
    id v10 = +[NSSet setWithArray:v9];

    if ([v10 isEqual:v5])
    {
      id v11 = [(StaticKeyController *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        id v12 = "updateContact mappings match";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, buf, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    if ([v5 count])
    {
      uint64_t v23 = [v7 publicKeyID];
      id v13 = [v7 contactIdentifier];
      id v14 = [v7 contactExternalURI];
      id v15 = [v5 allObjects];
      id v24 = v8;
      BOOL v16 = [(StaticKeyController *)self storeStaticKey:v23 contactIdentifier:v13 contactExternalIdentifier:v14 mappings:v15 error:&v24];
      id v17 = v24;

      if (!v16)
      {
        id v11 = [(StaticKeyController *)self log];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100218AD8();
        }
        id v8 = v17;
        goto LABEL_18;
      }
LABEL_15:
      id v8 = v17;
      id v11 = [(StaticKeyController *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        id v12 = "updateContact complete";
        goto LABEL_17;
      }
LABEL_18:

      goto LABEL_19;
    }
    id v18 = [v7 contactExternalURI];
    id v26 = v8;
    unsigned __int8 v19 = [(StaticKeyController *)self deleteStaticKeyByContactExternalURI:v18 error:&v26];
    id v17 = v26;

    if (v19) {
      goto LABEL_15;
    }
    id v20 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100218A70();
    }

    uint64_t v21 = [v7 contactIdentifier];
    id v25 = v17;
    unsigned __int8 v22 = [(StaticKeyController *)self deleteStaticKeyByContactIdentifier:v21 error:&v25];
    id v8 = v25;

    if ((v22 & 1) == 0)
    {
      id v11 = [(StaticKeyController *)self log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100218A70();
      }
      goto LABEL_18;
    }
  }
  else
  {
    id v10 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100218A08();
    }
  }
LABEL_19:
}

- (void)deleteContact:(id)a3 contactExternalURI:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v15 = 0;
    unsigned __int8 v8 = [(StaticKeyController *)self deleteStaticKeyByContactExternalURI:v7 error:&v15];
    id v9 = v15;
    id v10 = v9;
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v11 = [(StaticKeyController *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100218BA8();
  }

  id v14 = v9;
  unsigned __int8 v12 = [(StaticKeyController *)self deleteStaticKeyByContactIdentifier:v6 error:&v14];
  id v10 = v14;

  if ((v12 & 1) == 0)
  {
    id v13 = [(StaticKeyController *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100218B40();
    }
  }
LABEL_11:
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (NSPersistentCloudKitContainer)cloudContainer
{
  return self->_cloudContainer;
}

- (void)setCloudContainer:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLog:(id)a3
{
}

- (StaticKeyContactsProtocol)contacts
{
  return (StaticKeyContactsProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContacts:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (STCConfigurationStoreDelegate)configurationStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationStore);

  return (STCConfigurationStoreDelegate *)WeakRetained;
}

- (void)setConfigurationStore:(id)a3
{
}

- (KTNotificationCenter)notificationCenter
{
  return (KTNotificationCenter *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationCenter:(id)a3
{
}

- (StaticKeyIDSDelegate)idsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsDelegate);

  return (StaticKeyIDSDelegate *)WeakRetained;
}

- (void)setIdsDelegate:(id)a3
{
}

- (KTContactsStoreProtocol)contactStore
{
  return (KTContactsStoreProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContactStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_idsDelegate);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_destroyWeak((id *)&self->_configurationStore);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cloudContainer, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end