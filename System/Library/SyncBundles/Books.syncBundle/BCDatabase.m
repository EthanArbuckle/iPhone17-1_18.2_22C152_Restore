@interface BCDatabase
- (BCDatabase)initWithDatabasePath:(id)a3;
- (BOOL)shouldRetryAddingPersistentStoreAfterError:(id)a3;
- (id)databaseURL;
- (id)model;
- (id)newManagedObjectContext;
- (id)persistentStoreCoordinator;
- (void)dealloc;
@end

@implementation BCDatabase

- (BCDatabase)initWithDatabasePath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BCDatabase;
  v4 = [(BCDatabase *)&v6 init];
  if (v4) {
    v4->_path = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_psc = 0;
  self->_path = 0;
  v3.receiver = self;
  v3.super_class = (Class)BCDatabase;
  [(BCDatabase *)&v3 dealloc];
}

- (BOOL)shouldRetryAddingPersistentStoreAfterError:(id)a3
{
  return 0;
}

- (id)model
{
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v4) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 45, @"Failed to get bundle for class: %@", objc_opt_class() object file lineNumber description];
  }
  v5 = +[NSManagedObjectModel mergedModelFromBundles:](NSManagedObjectModel, "mergedModelFromBundles:", +[NSArray arrayWithObject:v4]);
  if (!v5) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 48, @"Failed to get model from bundle: %@", v4 object file lineNumber description];
  }
  return v5;
}

- (id)databaseURL
{
  if (![(NSString *)self->_path length]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"BCDatabase.m" lineNumber:55 description:@"Invalid database path"];
  }
  path = self->_path;

  return +[NSURL fileURLWithPath:path isDirectory:0];
}

- (id)persistentStoreCoordinator
{
  id result = self->_psc;
  if (!result)
  {
    v5 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSMigratePersistentStoresAutomaticallyOption, +[NSNumber numberWithBool:1], NSInferMappingModelAutomaticallyOption, NSFileProtectionNone, NSPersistentStoreFileProtectionKey, 0);
    id v6 = [(BCDatabase *)self model];
    if (!v6) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 72, @"Failed to get model: %@", self object file lineNumber description];
    }
    self->_psc = (NSPersistentStoreCoordinator *)[objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v6];
    id v7 = [(BCDatabase *)self databaseURL];
    if (!v7) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 77, @"Failed to get database URL: %@", self object file lineNumber description];
    }
    while (1)
    {
      v21 = 0;
      if ([(NSPersistentStoreCoordinator *)self->_psc addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v7 options:v5 error:&v21])
      {
        break;
      }
      v8 = v21;
      v9 = BCDefaultLog();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          v25 = v21;
          _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Failed to addPersistentStoreWithType: %@", buf, 0xCu);
        }
      }
      else
      {
        if (v10) {
          sub_15164(&v19, v20, v9);
        }
        v21 = +[NSError errorWithDomain:NSCocoaErrorDomain code:-1 userInfo:0];
      }
      v18 = 0;
      if (([(NSPersistentStoreCoordinator *)self->_psc _destroyPersistentStoreAtURL:v7 withType:NSSQLiteStoreType options:0 error:&v18] & 1) == 0)
      {
        v11 = v18;
        v12 = BCDefaultLog();
        BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
        if (v11)
        {
          if (v13)
          {
            *(_DWORD *)buf = 138412290;
            v25 = v18;
            _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Failed to destroyPersistentStoreAtURL: %@", buf, 0xCu);
          }
        }
        else if (v13)
        {
          sub_15124(&v16, v17, v12);
        }
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 111, @"_destroyPersistentStoreAtURL failed: %@ -- URL: %@", self, v7 object file lineNumber description];
      }
      if (![(BCDatabase *)self shouldRetryAddingPersistentStoreAfterError:v21])
      {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"BCDatabase.m", 116, @"invalid Persistent Store: %@ -- URL: %@", self, v7 object file lineNumber description];
        break;
      }
    }
    id v14 = objc_alloc_init((Class)NSFileManager);
    id v15 = objc_msgSend(v14, "attributesOfItemAtPath:error:", objc_msgSend(v7, "path"), 0);
    if (v15)
    {
      if ((objc_msgSend(objc_msgSend(v15, "fileOwnerAccountName"), "isEqualToString:", @"mobile") & 1) == 0)
      {
        v22[0] = NSFileOwnerAccountName;
        v22[1] = NSFileGroupOwnerAccountName;
        v23[0] = @"mobile";
        v23[1] = @"mobile";
        objc_msgSend(v14, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2), objc_msgSend(v7, "path"), 0);
      }
    }

    return self->_psc;
  }
  return result;
}

- (id)newManagedObjectContext
{
  if (![(BCDatabase *)self persistentStoreCoordinator]) {
    return 0;
  }
  id v3 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  objc_msgSend(v3, "setPersistentStoreCoordinator:", -[BCDatabase persistentStoreCoordinator](self, "persistentStoreCoordinator"));
  [v3 setUndoManager:0];
  return v3;
}

@end