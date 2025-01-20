@interface RMPersistentController
+ (BOOL)startPersistentController;
+ (NSManagedObjectModel)managedObjectModel;
+ (NSURL)managedObjectModelURL;
+ (RMPersistentController)sharedController;
+ (id)_createLoadedPersistentContainerWithURL:(id)a3;
+ (id)currentPersistentHistoryTokenForContainer:(id)a3;
+ (id)unarchiveObjectOfClass:(Class)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5;
+ (id)unarchiveObjectOfClasses:(id)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5;
+ (void)archiveObject:(id)a3 forKey:(id)a4 intoMetadataForPersistentStore:(id)a5;
+ (void)metadataOnPersistentStore:(id)a3 updateHandler:(id)a4;
- (NSPersistentContainer)persistentContainer;
- (RMPersistentController)initWithPersistentContainer:(id)a3;
@end

@implementation RMPersistentController

- (RMPersistentController)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMPersistentController;
  v6 = [(RMPersistentController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

+ (RMPersistentController)sharedController
{
  if (qword_1000DB2C0 != -1) {
    dispatch_once(&qword_1000DB2C0, &stru_1000C6438);
  }
  v2 = (void *)qword_1000DB2B8;

  return (RMPersistentController *)v2;
}

+ (BOOL)startPersistentController
{
  v2 = +[RMPersistentController sharedController];
  [v2 persistentContainer];

  return byte_1000DB2C8;
}

+ (id)_createLoadedPersistentContainerWithURL:(id)a3
{
  id v3 = a3;
  v4 = +[RMLog persistentController];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000573D4((uint64_t)v3, v4);
  }

  id v5 = +[NSPersistentStoreDescription persistentStoreDescriptionWithURL:v3];
  [v5 setType:NSSQLiteStoreType];
  [v5 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
  [v5 setShouldMigrateStoreAutomatically:1];
  [v5 setShouldInferMappingModelAutomatically:1];
  id v6 = objc_alloc((Class)NSPersistentContainer);
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  objc_super v9 = +[RMPersistentController managedObjectModel];
  id v10 = [v6 initWithName:v8 managedObjectModel:v9];

  v24 = v5;
  v11 = +[NSArray arrayWithObjects:&v24 count:1];
  [v10 setPersistentStoreDescriptions:v11];

  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1000569F8;
  v20 = sub_100056A08;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100056A10;
  v15[3] = &unk_1000C6460;
  v15[4] = &v16;
  [v10 loadPersistentStoresWithCompletionHandler:v15];
  if (v17[5])
  {
    id v12 = 0;
  }
  else
  {
    v13 = +[RMLog persistentController];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Created loaded persistent container at %{public}@", buf, 0xCu);
    }

    id v12 = v10;
  }
  _Block_object_dispose(&v16, 8);

  return v12;
}

+ (NSURL)managedObjectModelURL
{
  if (qword_1000DB2D8 != -1) {
    dispatch_once(&qword_1000DB2D8, &stru_1000C6480);
  }
  v2 = (void *)qword_1000DB2D0;

  return (NSURL *)v2;
}

+ (NSManagedObjectModel)managedObjectModel
{
  if (qword_1000DB2E8 != -1) {
    dispatch_once(&qword_1000DB2E8, &stru_1000C64A0);
  }
  v2 = (void *)qword_1000DB2E0;

  return (NSManagedObjectModel *)v2;
}

+ (void)metadataOnPersistentStore:(id)a3 updateHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 persistentStoreCoordinator];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100056CEC;
  v10[3] = &unk_1000C64C8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = v11;
  [v9 performBlockAndWait:v10];
}

+ (void)archiveObject:(id)a3 forKey:(id)a4 intoMetadataForPersistentStore:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100056E3C;
  v10[3] = &unk_1000C64F0;
  id v11 = a3;
  id v12 = a4;
  id v8 = v12;
  id v9 = v11;
  [a1 metadataOnPersistentStore:a5 updateHandler:v10];
}

+ (id)unarchiveObjectOfClass:(Class)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[NSSet setWithObject:a3];
  id v11 = [a1 unarchiveObjectOfClasses:v10 forKey:v9 fromMetadataForPersistentStore:v8];

  return v11;
}

+ (id)unarchiveObjectOfClasses:(id)a3 forKey:(id)a4 fromMetadataForPersistentStore:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000569F8;
  id v23 = sub_100056A08;
  id v24 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000571AC;
  v15[3] = &unk_1000C6518;
  id v11 = v9;
  id v16 = v11;
  uint64_t v18 = &v19;
  id v12 = v8;
  id v17 = v12;
  [a1 metadataOnPersistentStore:v10 updateHandler:v15];
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);

  return v13;
}

+ (id)currentPersistentHistoryTokenForContainer:(id)a3
{
  id v3 = [a3 persistentStoreCoordinator];
  v4 = [v3 persistentStores];
  id v5 = [v3 currentPersistentHistoryTokenFromStores:v4];

  return v5;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void).cxx_destruct
{
}

@end