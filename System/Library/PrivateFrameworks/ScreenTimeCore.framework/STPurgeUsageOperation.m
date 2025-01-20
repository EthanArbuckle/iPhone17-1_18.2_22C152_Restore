@interface STPurgeUsageOperation
- (BOOL)_runWithManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)isAsynchronous;
- (BOOL)purgeAllUsage;
- (STPurgeUsageOperation)initWithPersistenceController:(id)a3 purgeAllUsage:(BOOL)a4;
- (void)main;
@end

@implementation STPurgeUsageOperation

- (STPurgeUsageOperation)initWithPersistenceController:(id)a3 purgeAllUsage:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STPurgeUsageOperation;
  result = [(STPersistenceOperation *)&v6 initWithPersistenceController:a3];
  result->_purgeAllUsage = a4;
  return result;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STPurgeUsageOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &state);

  v5 = [(STPersistenceOperation *)self persistenceController];
  id v6 = [v5 newBackgroundContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005F628;
  v8[3] = &unk_1002FB828;
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v7 performBlock:v8];

  os_activity_scope_leave(&state);
}

- (BOOL)_runWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[STCoreUser fetchLocalUserInContext:v6 error:a4];
  if (v7)
  {
    id v24 = v7;
    [v7 usages];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (!v8) {
      goto LABEL_24;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    while (1)
    {
      v11 = 0;
      id v25 = v9;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v11);
        if ([(STPurgeUsageOperation *)self purgeAllUsage]) {
          goto LABEL_21;
        }
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v13 = [v12 blocks];
        id v14 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v29;
          do
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(void *)v29 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if ([v18 durationInMinutes] == (id)60) {
                [v6 deleteObject:v18];
              }
            }
            id v15 = [v13 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v15);
        }

        v19 = [v12 blocks];
        id v20 = [v19 count];

        id v9 = v25;
        if (!v20)
        {
          v21 = +[STLog usage];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Purging usage with zero blocks", buf, 2u);
          }

LABEL_21:
          [v6 deleteObject:v12];
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (!v9)
      {
LABEL_24:

        id v7 = v24;
        break;
      }
    }
  }
  BOOL v22 = v7 != 0;

  return v22;
}

- (BOOL)purgeAllUsage
{
  return self->_purgeAllUsage;
}

@end