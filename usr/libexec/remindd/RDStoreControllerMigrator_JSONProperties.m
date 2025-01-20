@interface RDStoreControllerMigrator_JSONProperties
- (BOOL)migratedAccount;
- (id)reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3 listID:(id)a4;
- (unint64_t)migratedListsCount;
- (unint64_t)totalListCount;
- (unint64_t)totalMigratedCount;
- (void)migrateCRDTsInAccount:(id)a3;
- (void)migrateCRDTsInList:(id)a3;
- (void)migrateCRDTsInObject:(id)a3;
- (void)migrateStore:(id)a3;
- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4;
- (void)migrateTokenResolutionMapInObject:(id)a3;
- (void)setMigratedAccount:(BOOL)a3;
- (void)setMigratedListsCount:(unint64_t)a3;
- (void)setTotalListCount:(unint64_t)a3;
- (void)setTotalMigratedCount:(unint64_t)a3;
@end

@implementation RDStoreControllerMigrator_JSONProperties

- (void)migrateStoreIfNeeded:(id)a3 metadata:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [v6 objectForKeyedSubscript:@"RDStoreControllerMigrator_JSONProperties"];
  uint64_t v8 = (uint64_t)[v7 integerValue];

  if (v8 <= 2)
  {
    [(RDStoreControllerMigrator_JSONProperties *)self migrateStore:v9];
    [v6 setObject:&off_1008D7438 forKeyedSubscript:@"RDStoreControllerMigrator_JSONProperties"];
  }
}

- (void)migrateStore:(id)a3
{
  id v4 = a3;
  v5 = +[REMLogStore container];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v20 = (unint64_t)v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "JSONPropertiesMigration BEGIN {store: %@}", buf, 0xCu);
  }

  id v6 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
  v7 = [v4 persistentStoreCoordinator];
  [v6 setPersistentStoreCoordinator:v7];

  [v6 setTransactionAuthor:RDStoreControllerJSONPropertiesMigrationAuthor];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100055F5C;
  v15[3] = &unk_1008ADD00;
  id v8 = v4;
  id v16 = v8;
  id v9 = v6;
  id v17 = v9;
  v18 = self;
  [v9 performBlockAndWait:v15];
  v10 = +[REMLogStore container];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v11 = [(RDStoreControllerMigrator_JSONProperties *)self totalMigratedCount];
    unint64_t v12 = [(RDStoreControllerMigrator_JSONProperties *)self totalListCount];
    unsigned int v13 = [(RDStoreControllerMigrator_JSONProperties *)self migratedAccount];
    unint64_t v14 = [(RDStoreControllerMigrator_JSONProperties *)self migratedListsCount];
    *(_DWORD *)buf = 134219010;
    unint64_t v20 = v11;
    __int16 v21 = 2048;
    unint64_t v22 = v12;
    __int16 v23 = 1024;
    unsigned int v24 = v13;
    __int16 v25 = 2048;
    unint64_t v26 = v14;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "JSONPropertiesMigration END {totalMigratedCount: %ld, totalListCount: %ld, migratedAccount: %d. migratedListsCount: %ld, store: %@}", buf, 0x30u);
  }
}

- (void)migrateTokenResolutionMapInObject:(id)a3
{
  id v7 = a3;
  id v4 = [v7 primitiveValueForKey:@"resolutionTokenMap_v3_JSONData"];
  if (!v4)
  {
    v5 = [v7 primitiveValueForKey:@"resolutionTokenMap_v2_JSON"];
    if (v5)
    {
      [v7 setResolutionTokenMap:v5];
      [v7 willChangeValueForKey:@"resolutionTokenMap_v2_JSON"];
      [v7 setPrimitiveValue:0 forKey:@"resolutionTokenMap_v2_JSON"];
      [v7 didChangeValueForKey:@"resolutionTokenMap_v2_JSON"];
    }
    else
    {
      id v6 = [v7 primitiveValueForKey:@"resolutionTokenMap"];
      if (v6)
      {
        [v7 setResolutionTokenMap:v6];
        [v7 willChangeValueForKey:@"resolutionTokenMap"];
        [v7 setPrimitiveValue:0 forKey:@"resolutionTokenMap"];
        [v7 didChangeValueForKey:@"resolutionTokenMap"];
      }
    }
  }
}

- (void)migrateCRDTsInObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RDStoreControllerMigrator_JSONProperties *)self migrateCRDTsInAccount:v5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(RDStoreControllerMigrator_JSONProperties *)self migrateCRDTsInList:v5];
  }
}

- (void)migrateCRDTsInAccount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 primitiveValueForKey:@"listIDsMergeableOrdering_v2"];
  if (!v5)
  {
    id v6 = [v4 remObjectID];
    id v7 = [objc_alloc((Class)REMReplicaIDSource) initWithAccountID:v6 objectID:v6 property:@"listIDsMergeableOrdering"];
    id v8 = [v4 primitiveValueForKey:@"listIDsMergeableOrdering"];
    id v35 = 0;
    id v9 = [objc_alloc((Class)REMCRMergeableOrderedSet) initWithReplicaIDSource:v7 serializedData:v8 error:&v35];
    id v10 = v35;
    unint64_t v11 = v10;
    if (v9)
    {
      __int16 v25 = self;
      id v26 = v9;
      id v27 = v10;
      id v28 = v8;
      v29 = v6;
      v30 = v4;
      unint64_t v12 = [v9 orderedSet];
      id v13 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:[v12 count]];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      unint64_t v14 = v12;
      id v15 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
      if (!v15) {
        goto LABEL_17;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v32;
      while (1)
      {
        v18 = 0;
        do
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v18);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unint64_t v20 = [v19 uuid];
            __int16 v21 = [v20 UUIDString];
            [v13 addObject:v21];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v13 addObject:v19];
              goto LABEL_15;
            }
            unint64_t v20 = +[REMLogStore container];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v19;
              _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Failed to create NSUUID from item in legacyOrderedSet. Skipping {item: %@}", buf, 0xCu);
            }
          }

LABEL_15:
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v31 objects:v38 count:16];
        if (!v16)
        {
LABEL_17:

          id v22 = [objc_alloc((Class)REMCRMergeableOrderedSet) initWithReplicaIDSource:v7 orderedSet:v13];
          __int16 v23 = [v22 serializedData];
          if (v23)
          {
            id v4 = v30;
            [v30 willChangeValueForKey:@"listIDsMergeableOrdering_v2"];
            [v30 setPrimitiveValue:v23 forKey:@"listIDsMergeableOrdering_v2"];
            [v30 didChangeValueForKey:@"listIDsMergeableOrdering_v2"];
            [v30 willChangeValueForKey:@"listIDsMergeableOrdering"];
            [v30 setPrimitiveValue:0 forKey:@"listIDsMergeableOrdering"];
            [v30 didChangeValueForKey:@"listIDsMergeableOrdering"];
            [(RDStoreControllerMigrator_JSONProperties *)v25 setMigratedAccount:1];
            id v6 = v29;
            id v5 = 0;
            unint64_t v11 = v27;
          }
          else
          {
            unsigned int v24 = +[REMLogStore container];
            id v4 = v30;
            id v6 = v29;
            unint64_t v11 = v27;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              sub_1007521A4();
            }

            id v5 = 0;
          }

          id v8 = v28;
          id v9 = v26;
          goto LABEL_25;
        }
      }
    }
    unint64_t v14 = +[REMLogStore container];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10075213C();
    }
LABEL_25:
  }
}

- (void)migrateCRDTsInList:(id)a3
{
  id v4 = a3;
  [(RDStoreControllerMigrator_JSONProperties *)self setTotalListCount:(char *)[(RDStoreControllerMigrator_JSONProperties *)self totalListCount] + 1];
  id v5 = [v4 primitiveValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
  if (!v5)
  {
    id v6 = [v4 account];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 remObjectID];
      id v9 = [v4 remObjectID];
      id v10 = [(RDStoreControllerMigrator_JSONProperties *)self reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:v8 listID:v9];

      unint64_t v11 = [v4 primitiveValueForKey:@"reminderIDsMergeableOrdering"];
      id v38 = 0;
      id v12 = [objc_alloc((Class)REMCRMergeableOrderedSet) initWithReplicaIDSource:v10 serializedData:v11 error:&v38];
      id v13 = v38;
      unint64_t v14 = v13;
      if (v12)
      {
        id v27 = self;
        id v28 = v13;
        v30 = v11;
        long long v31 = v10;
        long long v32 = v7;
        id v29 = v12;
        id v15 = [v12 orderedSet];
        id v16 = [objc_alloc((Class)NSMutableOrderedSet) initWithCapacity:[v15 count]];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v17 = v15;
        id v18 = [v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = *(void *)v35;
          do
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v17);
              }
              uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [v16 addObject:v22];
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v23 = [objc_alloc((Class)NSUUID) initWithUUIDString:v22];
                  if (v23)
                  {
                    unsigned int v24 = +[REMReminder objectIDWithUUID:v23];
                    [v16 addObject:v24];
                  }
                  else
                  {
                    unsigned int v24 = +[REMLogStore container];
                    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      uint64_t v40 = v22;
                      _os_log_fault_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Failed to create NSUUID from item in legacyOrderedSet. Skipping {item: %@}", buf, 0xCu);
                    }
                  }
                }
              }
            }
            id v19 = [v17 countByEnumeratingWithState:&v34 objects:v41 count:16];
          }
          while (v19);
        }

        long long v33 = v28;
        __int16 v25 = +[REMListStorage reminderIDUUIDStringsJSONDataFromReminderIDsMergeableOrdering:v16 error:&v33];
        unint64_t v14 = v33;

        if (v25)
        {
          [v4 willChangeValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
          [v4 setPrimitiveValue:v25 forKey:@"reminderIDsMergeableOrdering_v2_JSON"];
          [v4 didChangeValueForKey:@"reminderIDsMergeableOrdering_v2_JSON"];
          [v4 willChangeValueForKey:@"reminderIDsMergeableOrdering"];
          [v4 setPrimitiveValue:0 forKey:@"reminderIDsMergeableOrdering"];
          [v4 didChangeValueForKey:@"reminderIDsMergeableOrdering"];
          [(RDStoreControllerMigrator_JSONProperties *)v27 setMigratedListsCount:(char *)[(RDStoreControllerMigrator_JSONProperties *)v27 migratedListsCount] + 1];
        }
        else
        {
          id v26 = +[REMLogStore container];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_1007522EC();
          }
        }
        id v7 = v32;
        id v5 = 0;

        unint64_t v11 = v30;
        id v10 = v31;
        id v12 = v29;
      }
      else
      {
        uint64_t v17 = +[REMLogStore container];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100752284();
        }
      }
    }
    else
    {
      unint64_t v14 = +[REMLogStore container];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10075220C((uint64_t)v4, v14);
      }
    }
  }
}

- (id)reminderIDsMergeableOrderingReplicaIDSourceWithAccountID:(id)a3 listID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)REMReplicaIDSource) initWithAccountID:v6 objectID:v5 property:@"reminderIDsMergeableOrdering"];

  return v7;
}

- (unint64_t)totalMigratedCount
{
  return self->_totalMigratedCount;
}

- (void)setTotalMigratedCount:(unint64_t)a3
{
  self->_totalMigratedCount = a3;
}

- (unint64_t)totalListCount
{
  return self->_totalListCount;
}

- (void)setTotalListCount:(unint64_t)a3
{
  self->_totalListCount = a3;
}

- (BOOL)migratedAccount
{
  return self->_migratedAccount;
}

- (void)setMigratedAccount:(BOOL)a3
{
  self->_migratedAccount = a3;
}

- (unint64_t)migratedListsCount
{
  return self->_migratedListsCount;
}

- (void)setMigratedListsCount:(unint64_t)a3
{
  self->_migratedListsCount = a3;
}

@end