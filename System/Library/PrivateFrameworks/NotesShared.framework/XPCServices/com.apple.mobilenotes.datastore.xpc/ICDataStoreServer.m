@interface ICDataStoreServer
+ (BOOL)storeNeedsMigrationAtURL:(id)a3;
+ (void)migrateStoreAtURL:(id)a3;
- (ICDataStoreServer)init;
- (id)dataStoreServiceShouldAbortNotification:(id)a3;
- (void)dealloc;
- (void)setupEnvironment;
- (void)startListening;
@end

@implementation ICDataStoreServer

- (ICDataStoreServer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ICDataStoreServer;
  v2 = [(ICDataStoreServer *)&v5 init];
  if (v2)
  {
    v3 = +[NSDistributedNotificationCenter defaultCenter];
    [v3 addObserver:v2, "dataStoreServiceShouldAbortNotification:", @"Dear Notes data store service, would you mind aborting?", 0 selector name object];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICDataStoreServer;
  [(ICDataStoreServer *)&v4 dealloc];
}

- (void)startListening
{
  objc_super v4 = os_log_create("com.apple.notes", "DataStoreServer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100002BA0();
  }

  [(ICDataStoreServer *)self setupEnvironment];
  objc_super v5 = +[ICPaths managedObjectModelURL];
  uint64_t v6 = +[ICPaths persistentStoreURL];
  if (!v6)
  {
    v12 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100002B60();
    }

    exit(22);
  }
  v7 = (void *)v6;
  v8 = (void *)os_transaction_create();
  if (+[ICDataStoreServer storeNeedsMigrationAtURL:v7]) {
    +[ICDataStoreServer migrateStoreAtURL:v7];
  }

  v9 = objc_alloc_init(ICDataStoreServerRequestHandlingPolicy);
  v13[0] = NSXPCStorePostUpdateNotificationsKey;
  v13[1] = NSPersistentHistoryTrackingKey;
  v14[0] = &__kCFBooleanTrue;
  v14[1] = &__kCFBooleanTrue;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v11 = [objc_alloc((Class)NSXPCStoreServer) initForStoreWithURL:v7 usingModelAtURL:v5 options:v10 policy:v9];

  [v11 startListening];
}

- (void)setupEnvironment
{
  if (qword_1000082D0 != -1) {
    dispatch_once(&qword_1000082D0, &stru_1000041C8);
  }
}

+ (BOOL)storeNeedsMigrationAtURL:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[ICPersistentContainer standardStoreOptions];
  id v12 = 0;
  objc_super v5 = +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:v3 options:v4 error:&v12];

  id v6 = v12;
  if (v5)
  {
    v7 = +[ICPersistentContainer managedObjectModel];
    v8 = [v7 entityVersionHashesByName];
    v9 = [v5 objectForKey:NSStoreModelVersionHashesKey];
    unsigned int v10 = [v8 isEqual:v9] ^ 1;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100002E78();
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

+ (void)migrateStoreAtURL:(id)a3
{
  id v3 = a3;
  if (!dlopen("/System/Library/Frameworks/CloudKit.framework/CloudKit", 2))
  {
    objc_super v4 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100003078();
    }
  }
  if (!dlopen("/System/Library/Frameworks/CoreLocation.framework/CoreLocation", 2))
  {
    objc_super v5 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100003000();
    }
  }
  if (!dlopen("/System/Library/Frameworks/MapKit.framework/MapKit", 2))
  {
    id v6 = os_log_create("com.apple.notes", "DataStoreServer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100002F88();
    }
  }
  v7 = +[ICPersistentContainer standardStoreOptions];
  id v8 = [objc_alloc((Class)ICPersistentContainer) initWithStoreURL:v3 storeType:NSSQLiteStoreType options:v7 mergePolicy:0];

  id v13 = 0;
  unsigned __int8 v9 = [v8 loadPersistentStore:&v13];
  id v10 = v13;
  id v11 = os_log_create("com.apple.notes", "DataStoreServer");
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100002EE0();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_100002F20();
  }
}

- (id)dataStoreServiceShouldAbortNotification:(id)a3
{
  id v3 = a3;
  objc_super v4 = os_log_create("com.apple.notes", "DataStoreServer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Data store received a notification that it should abort. Good bye, world.", v5, 2u);
  }

  exit(0);
}

@end