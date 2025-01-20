@interface NSPersistentHistoryTransaction
- (id)bc_changeTypeToString:(int64_t)a3;
- (void)bc_getManagedObjectsWith:(id)a3 entityName:(id)a4 inserted:(id *)a5 updated:(id *)a6 tombstones:(id *)a7;
- (void)bc_logChanges;
@end

@implementation NSPersistentHistoryTransaction

- (id)bc_changeTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 < 3) {
    return off_2C55B0[a3];
  }
  +[NSException raise:NSGenericException format:@"Unexpected NSPersistentHistoryChangeType."];
  return 0;
}

- (void)bc_getManagedObjectsWith:(id)a3 entityName:(id)a4 inserted:(id *)a5 updated:(id *)a6 tombstones:(id *)a7
{
  id v9 = a3;
  id v47 = a4;
  v10 = [(NSPersistentHistoryTransaction *)self changes];
  id v11 = [v10 count];
  id v45 = +[NSMutableArray array];
  id v46 = +[NSMutableArray array];
  id v44 = +[NSMutableArray array];
  v12 = BCRemoteManagedObjectIDMonitorLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(NSPersistentHistoryTransaction *)self timestamp];
    v14 = [v13 description];
    *(_DWORD *)buf = 138544130;
    v56 = v14;
    __int16 v57 = 2048;
    int64_t v58 = [(NSPersistentHistoryTransaction *)self transactionNumber];
    __int16 v59 = 2048;
    id v60 = v11;
    __int16 v61 = 2112;
    id v62 = v47;
    _os_log_impl(&def_7D91C, v12, OS_LOG_TYPE_DEFAULT, "bc_getManagedObjectsWith %{public}@ Processing transaction#:(%lld) changeCount:%lu entityName:%@", buf, 0x2Au);
  }
  v39 = self;
  [(NSPersistentHistoryTransaction *)self bc_logChanges];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v10;
  id v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v49;
    *(void *)&long long v16 = 138412290;
    long long v38 = v16;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(NSPersistentHistoryTransaction **)(*((void *)&v48 + 1) + 8 * (void)v19);
        v22 = [(NSPersistentHistoryTransaction *)v20 changedObjectID];
        v23 = [v22 entity];
        v24 = [v23 name];
        unsigned int v25 = [v24 isEqualToString:v47];

        if (!v25)
        {
          v27 = BCRemoteManagedObjectIDMonitorLog();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_25;
          }
          v32 = [(NSPersistentHistoryTransaction *)v20 changedObjectID];
          v33 = [(NSPersistentHistoryTransaction *)v20 changedObjectID];
          v34 = [v33 entity];
          v35 = [v34 name];
          *(_DWORD *)buf = 138412802;
          v56 = v39;
          __int16 v57 = 2112;
          int64_t v58 = (int64_t)v32;
          __int16 v59 = 2112;
          id v60 = v35;
          _os_log_impl(&def_7D91C, v27, OS_LOG_TYPE_DEFAULT, "%@ Skipping history transaction id:%@ with entity (%@)", buf, 0x20u);

          goto LABEL_16;
        }
        if ([(NSPersistentHistoryTransaction *)v20 changeType]
          && [(NSPersistentHistoryTransaction *)v20 changeType] != (char *)&def_7D91C + 1)
        {
          v27 = [(NSPersistentHistoryTransaction *)v20 tombstone];
          if (!v27)
          {
            v32 = BCRemoteManagedObjectIDMonitorLog();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v38;
              v56 = v20;
              _os_log_error_impl(&def_7D91C, v32, OS_LOG_TYPE_ERROR, "bc_getManagedObjectsWith Change contains deletion but no tombstone. Change: %@", buf, 0xCu);
            }
LABEL_16:

            goto LABEL_25;
          }
          [v45 addObject:v27];
        }
        else
        {
          v26 = [(NSPersistentHistoryTransaction *)v20 changedObjectID];
          v27 = [v9 existingObjectWithID:v26 error:0];

          v28 = [v27 entity];
          v29 = [v28 name];
          unsigned int v30 = [v29 isEqualToString:v47];

          if (v30)
          {
            if ([(NSPersistentHistoryTransaction *)v20 changeType]) {
              v31 = v46;
            }
            else {
              v31 = v44;
            }
            [v31 addObject:v27];
          }
          else
          {
            v36 = BCRemoteManagedObjectIDMonitorLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
              sub_1EABE8(v52, v20, &v53, v36);
            }
          }
          [v9 refreshObject:v27 mergeChanges:0];
        }
LABEL_25:

        [v9 processPendingChanges];
        *a6 = v46;
        *a5 = v44;
        *a7 = v45;
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      id v17 = v37;
    }
    while (v37);
  }
}

- (void)bc_logChanges
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSPersistentHistoryTransaction *)self changes];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = -[NSPersistentHistoryTransaction bc_changeTypeToString:](self, "bc_changeTypeToString:", [*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) changeType]);
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  v10 = BCRemoteManagedObjectIDMonitorLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1EAC60(self);
  }
}

@end