@interface RDStoreControllerMigrator_AccountIdentifierMetadata
- (void)migrateStore:(id)a3 metadata:(id)a4;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_AccountIdentifierMetadata

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 URL];
  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:@"RDStoreControllerAccountIdentifier"];

    if (!v9) {
      [(RDStoreControllerMigrator_AccountIdentifierMetadata *)self migrateStore:v6 metadata:v7];
    }
  }
  else
  {
    v10 = +[REMLogStore container];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_100749174((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

- (void)migrateStore:(id)a3 metadata:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[REMCDAccount fetchRequest];
  [v7 setFetchLimit:1];
  [v7 setPropertiesToFetch:&off_1008D7820];
  id v35 = v5;
  v8 = +[NSArray arrayWithObjects:&v35 count:1];
  [v7 setAffectedStores:v8];

  id v9 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  v10 = [v5 persistentStoreCoordinator];
  [v9 setPersistentStoreCoordinator:v10];

  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_100005C64;
  v29 = sub_100005C74;
  id v30 = 0;
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100005C7C;
  v20 = &unk_1008ADB40;
  id v11 = v9;
  id v21 = v11;
  id v12 = v7;
  id v22 = v12;
  id v13 = v5;
  id v23 = v13;
  v24 = &v25;
  [v11 performBlockAndWait:&v17];
  if (v26[5])
  {
    uint64_t v14 = +[REMLogStore container];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [(id)v26[5] UUIDString];
      *(_DWORD *)buf = 138543618;
      id v32 = v13;
      __int16 v33 = 2114;
      v34 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Populating RDStoreControllerAccountIdentifier {store: %{public}@, identifier: %{public}@}", buf, 0x16u);
    }
    uint64_t v16 = [(id)v26[5] UUIDString];
    [v6 setObject:v16 forKeyedSubscript:@"RDStoreControllerAccountIdentifier"];
  }
  _Block_object_dispose(&v25, 8);
}

@end