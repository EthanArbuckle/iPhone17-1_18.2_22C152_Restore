@interface DMDConfigurationDatabase
+ (id)_newDatabaseWithURL:(id)a3;
+ (id)descriptionForSQLiteStoreWithDatabaseURL:(id)a3;
+ (id)managedObjectModel;
+ (id)newUserDatabase;
- (DMDConfigurationDatabase)init;
- (id)description;
- (void)performBackgroundTask:(id)a3;
@end

@implementation DMDConfigurationDatabase

+ (id)managedObjectModel
{
  if (qword_1000FBA88 != -1) {
    dispatch_once(&qword_1000FBA88, &stru_1000CA750);
  }
  v2 = (void *)qword_1000FBA80;

  return v2;
}

- (id)description
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10002B004;
  v11 = sub_10002B014;
  id v12 = 0;
  id v3 = [(DMDConfigurationDatabase *)self newBackgroundContext];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B01C;
  v6[3] = &unk_1000C9F48;
  v6[4] = &v7;
  [v3 performBlockAndWait:v6];

  v4 = +[NSString stringWithFormat:@"<%@: %p\n%@>", objc_opt_class(), self, v8[5]];
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (id)descriptionForSQLiteStoreWithDatabaseURL:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setType:NSSQLiteStoreType];
  [v4 setURL:v3];

  return v4;
}

+ (id)newUserDatabase
{
  id v3 = +[NSFileManager dmd_userConfigurationDatabaseURL];
  id v4 = [a1 _newDatabaseWithURL:v3];

  return v4;
}

+ (id)_newDatabaseWithURL:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [a1 descriptionForSQLiteStoreWithDatabaseURL:v4];

  uint64_t v9 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];
  [v5 setPersistentStoreDescriptions:v7];

  return v5;
}

- (DMDConfigurationDatabase)init
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(id)objc_opt_class() managedObjectModel];
  v6 = [(DMDConfigurationDatabase *)self initWithName:v4 managedObjectModel:v5];

  return v6;
}

- (void)performBackgroundTask:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"DMDConfigurationDatabase.m", 67, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002B390;
  v9[3] = &unk_1000CA778;
  id v10 = v5;
  v8.receiver = self;
  v8.super_class = (Class)DMDConfigurationDatabase;
  id v6 = v5;
  [(DMDConfigurationDatabase *)&v8 performBackgroundTask:v9];
}

@end