@interface RDStoreControllerMigrator_RemoveOrphanedLists
- (void)migrateStore:(id)a3;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_RemoveOrphanedLists

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"RDStoreControllerMigrator_RemoveUnparentedObjects"];
  id v8 = [v7 integerValue];

  if ((uint64_t)v8 <= 0)
  {
    [(RDStoreControllerMigrator_RemoveOrphanedLists *)self migrateStore:v9];
    [v6 setObject:&off_1008D7138 forKeyedSubscript:@"RDStoreControllerMigrator_RemoveUnparentedObjects"];
  }
}

- (void)migrateStore:(id)a3
{
  id v3 = a3;
  v4 = +[REMLogStore container];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UnparentedObjectsMigration BEGIN {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  id v5 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  id v6 = [v3 persistentStoreCoordinator];
  [v5 setPersistentStoreCoordinator:v6];

  [v5 setTransactionAuthor:RDStoreControllerOrphanedListMigrationAuthor];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  v22 = sub_1000038C0;
  v23 = sub_1000038D0;
  id v24 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000038D8;
  v12[3] = &unk_1008AD990;
  id v7 = v3;
  id v13 = v7;
  p_long long buf = &buf;
  id v8 = v5;
  id v14 = v8;
  [v8 performBlockAndWait:v12];
  id v9 = [*(id *)(*((void *)&buf + 1) + 40) result];
  id v10 = [v9 unsignedIntegerValue];

  v11 = +[REMLogStore container];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2048;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "UnparentedObjectsMigration End {store: %@, countDeleted: %ld}", v16, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

@end