@interface RDStoreControllerMigrator_CKParentReminderIdentifier
- (void)migrateStore:(id)a3;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
@end

@implementation RDStoreControllerMigrator_CKParentReminderIdentifier

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"RDStoreControllerMigrator_CKParentReminderIdentifier"];
  id v8 = [v7 integerValue];

  if ((uint64_t)v8 <= 0)
  {
    [(RDStoreControllerMigrator_CKParentReminderIdentifier *)self migrateStore:v9];
    [v6 setObject:&off_1008D74B0 forKeyedSubscript:@"RDStoreControllerMigrator_CKParentReminderIdentifier"];
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CKParentReminderIdentifierMigration BEGIN {store: %@}", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  id v5 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  id v6 = [v3 persistentStoreCoordinator];
  [v5 setPersistentStoreCoordinator:v6];

  [v5 setTransactionAuthor:RDStoreControllerCKParentReminderIdentifierMigrationAuthor];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100084E30;
  v11[3] = &unk_1008ADFD0;
  id v7 = v3;
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  p_long long buf = &buf;
  [v8 performBlockAndWait:v11];
  id v9 = +[REMLogStore container];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*((void *)&buf + 1) + 24);
    *(_DWORD *)v15 = 138412546;
    id v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CKParentReminderIdentifierMigration END {store: %@, updated.count: %ld}", v15, 0x16u);
  }

  _Block_object_dispose(&buf, 8);
}

@end