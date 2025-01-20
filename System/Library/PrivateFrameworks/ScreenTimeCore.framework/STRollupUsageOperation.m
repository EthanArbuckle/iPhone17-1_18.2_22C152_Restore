@interface STRollupUsageOperation
- (BOOL)_purgeEmptyUsageInManagedObjectContext:(id)a3 error:(id *)a4;
- (BOOL)_purgeUsageBlocksWithPredicate:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5;
- (BOOL)isAsynchronous;
- (BOOL)isBackgroundTask;
- (BOOL)isRecomputingUsage;
- (NSDate)genesisDate;
- (NSDate)referenceDate;
- (NSOperationQueue)usageOperationQueue;
- (STRollupUsageOperation)initWithPersistenceController:(id)a3 genesisDate:(id)a4 duration:(int64_t)a5 isBackgroundTask:(BOOL)a6 isRecomputingUsage:(BOOL)a7;
- (id)_dayDurationPredicate;
- (id)_lastUsageItemStartDate;
- (int64_t)duration;
- (void)_persistUsageOperationDidFinish:(id)a3 inContext:(id)a4;
- (void)_runWithManagedObjectContext:(id)a3 purgePredicate:(id)a4;
- (void)_saveContextAndEndOperation:(id)a3;
- (void)cancel;
- (void)main;
- (void)setReferenceDate:(id)a3;
- (void)setUsageOperationQueue:(id)a3;
@end

@implementation STRollupUsageOperation

- (STRollupUsageOperation)initWithPersistenceController:(id)a3 genesisDate:(id)a4 duration:(int64_t)a5 isBackgroundTask:(BOOL)a6 isRecomputingUsage:(BOOL)a7
{
  id v12 = a4;
  v19.receiver = self;
  v19.super_class = (Class)STRollupUsageOperation;
  v13 = [(STPersistenceOperation *)&v19 initWithPersistenceController:a3];
  if (v13)
  {
    v14 = (NSDate *)[v12 copy];
    genesisDate = v13->_genesisDate;
    v13->_genesisDate = v14;

    v13->_duration = a5;
    v13->_isBackgroundTask = a6;
    v13->_recomputingUsage = a7;
    uint64_t v16 = objc_opt_new();
    usageOperationQueue = v13->_usageOperationQueue;
    v13->_usageOperationQueue = (NSOperationQueue *)v16;

    [(NSOperationQueue *)v13->_usageOperationQueue setName:@"com.apple.rollup-usage-operation"];
    [(NSOperationQueue *)v13->_usageOperationQueue setMaxConcurrentOperationCount:1];
  }

  return v13;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)STRollupUsageOperation;
  [(STRollupUsageOperation *)&v4 cancel];
  v3 = [(STRollupUsageOperation *)self usageOperationQueue];
  [v3 cancelAllOperations];
}

- (void)main
{
  os_activity_t v3 = _os_activity_create((void *)&_mh_execute_header, "STRollupUsageOperation start", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  [(STOperation *)self setActivity:v3];

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  objc_super v4 = [(STOperation *)self activity];
  os_activity_scope_enter(v4, &state);

  v5 = [(STPersistenceOperation *)self persistenceController];
  id v6 = [v5 newBackgroundContext];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100076CCC;
  v8[3] = &unk_1002FB828;
  v8[4] = self;
  id v7 = v6;
  id v9 = v7;
  [v7 performBlockAndWait:v8];

  os_activity_scope_leave(&state);
}

- (id)_dayDurationPredicate
{
  return +[NSPredicate predicateWithFormat:@"(%K == %lld)", @"durationInMinutes", 1440];
}

- (void)_runWithManagedObjectContext:(id)a3 purgePredicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[STUserDeviceState fetchRequestMatchingLocalUserDeviceState];
  CFStringRef v32 = @"user";
  id v9 = +[NSArray arrayWithObjects:&v32 count:1];
  [v8 setRelationshipKeyPathsForPrefetching:v9];

  id v30 = 0;
  v10 = [v8 execute:&v30];
  id v11 = v30;
  if (v10)
  {
    if ((unint64_t)[v10 count] >= 2)
    {
      id v12 = +[STLog usage];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        sub_1002655A0((uint64_t)v10, v12);
      }
    }
    v13 = [v10 firstObject];
    if (v13)
    {
      id v29 = v11;
      unsigned __int8 v14 = [(STRollupUsageOperation *)self _purgeUsageBlocksWithPredicate:v7 inManagedObjectContext:v6 error:&v29];
      id v15 = v29;

      if ((v14 & 1) == 0)
      {
        v17 = STXPCSafeErrorFromCoreDataError();
        [(STRollupUsageOperation *)self endOperationWithError:v17];
        id v11 = v15;
        goto LABEL_15;
      }
      id v28 = v15;
      unsigned __int8 v16 = [(STRollupUsageOperation *)self _purgeEmptyUsageInManagedObjectContext:v6 error:&v28];
      id v11 = v28;

      if (v16)
      {
        v17 = [(STRollupUsageOperation *)self _lastUsageItemStartDate];
        v27 = [(STRollupUsageOperation *)self referenceDate];
        int64_t v18 = [(STRollupUsageOperation *)self duration];
        v25 = [STFetchUsageOperation alloc];
        objc_super v19 = [(STRollupUsageOperation *)self genesisDate];
        v24 = [v13 user];
        v26 = -[STFetchUsageOperation initWithGenesisDate:lastStartDate:referenceDate:includeAggregateUsage:includeRemoteUsage:forceRemoteDeviceSync:duration:](v25, "initWithGenesisDate:lastStartDate:referenceDate:includeAggregateUsage:includeRemoteUsage:forceRemoteDeviceSync:duration:", v19, v17, v27, [v24 syncingEnabled], v18 != 1440, -[STRollupUsageOperation isBackgroundTask](self, "isBackgroundTask") ^ 1, v18);

        v20 = [[STPersistUsageOperation alloc] initWithManagedObjectContext:v6 fetchUsageOperation:v26 userDeviceState:v13 referenceDate:v27 duration:v18];
        [(STPersistUsageOperation *)v20 addDependency:v26];
        [(STPersistUsageOperation *)v20 addTarget:self selector:"_persistUsageOperationDidFinish:inContext:" forOperationEvents:6 userInfo:v6];
        v21 = [(STRollupUsageOperation *)self usageOperationQueue];
        v31[0] = v26;
        v31[1] = v20;
        v22 = +[NSArray arrayWithObjects:v31 count:2];
        [v21 addOperations:v22 waitUntilFinished:0];

LABEL_15:
        goto LABEL_16;
      }
      uint64_t v23 = STXPCSafeErrorFromCoreDataError();
    }
    else
    {
      uint64_t v23 = +[NSError errorWithDomain:STErrorDomain code:7 userInfo:0];
    }
    v17 = (void *)v23;
    [(STRollupUsageOperation *)self endOperationWithError:v23];
    goto LABEL_15;
  }
  v13 = STXPCSafeErrorFromCoreDataError();
  [(STRollupUsageOperation *)self endOperationWithError:v13];
LABEL_16:
}

- (void)_persistUsageOperationDidFinish:(id)a3 inContext:(id)a4
{
  id v7 = a4;
  id v6 = [a3 error];
  if (v6) {
    [(STRollupUsageOperation *)self endOperationWithError:v6];
  }
  else {
    [(STRollupUsageOperation *)self _saveContextAndEndOperation:v7];
  }
}

- (BOOL)_purgeUsageBlocksWithPredicate:(id)a3 inManagedObjectContext:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = +[STUsageBlock fetchRequest];
  [v9 setPredicate:v7];
  v10 = [v9 execute:a5];
  id v11 = v10;
  if (v10)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        id v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          [v8 deleteObject:*(void *)(*((void *)&v17 + 1) + 8 * (void)v15)];
          id v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }
  }

  return v11 != 0;
}

- (BOOL)_purgeEmptyUsageInManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(STRollupUsageOperation *)self isRecomputingUsage])
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[STUsage fetchRequest];
    id v9 = +[NSPredicate predicateWithFormat:@"(%K.@count == 0)", @"blocks"];
    [v8 setPredicate:v9];

    v10 = [v8 execute:a4];
    id v11 = v10;
    BOOL v7 = v10 != 0;
    if (v10)
    {
      id v12 = [v10 count];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = +[STLog usage];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v27 = v13;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Purging %ld usages with zero blocks", buf, 0xCu);
        }

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v15 = v11;
        id v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v22;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v22 != v18) {
                objc_enumerationMutation(v15);
              }
              [v6 deleteObject:*(void *)(*((void *)&v21 + 1) + 8 * i)];
            }
            id v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v17);
        }
      }
    }
  }
  return v7;
}

- (void)_saveContextAndEndOperation:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100077764;
  v4[3] = &unk_1002FB828;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (id)_lastUsageItemStartDate
{
  id v3 = +[STUsageBlock fetchRequest];
  objc_super v4 = +[NSPredicate predicateWithFormat:@"(%K != NULL) AND (%K == %lld)", @"usage.user.localUserDeviceState", @"durationInMinutes", [(STRollupUsageOperation *)self duration]];
  [v3 setPredicate:v4];

  CFStringRef v16 = @"startDate";
  id v5 = +[NSArray arrayWithObjects:&v16 count:1];
  [v3 setPropertiesToFetch:v5];

  id v6 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
  id v15 = v6;
  BOOL v7 = +[NSArray arrayWithObjects:&v15 count:1];
  [v3 setSortDescriptors:v7];

  [v3 setFetchLimit:1];
  id v14 = 0;
  id v8 = [v3 execute:&v14];
  id v9 = v14;
  if (!v8)
  {
    v10 = +[STLog usage];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100265618((uint64_t)v9, v10);
    }
  }
  id v11 = [v8 firstObject];
  id v12 = [v11 startDate];

  return v12;
}

- (NSDate)genesisDate
{
  return self->_genesisDate;
}

- (int64_t)duration
{
  return self->_duration;
}

- (BOOL)isBackgroundTask
{
  return self->_isBackgroundTask;
}

- (BOOL)isRecomputingUsage
{
  return self->_recomputingUsage;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void)setReferenceDate:(id)a3
{
}

- (NSOperationQueue)usageOperationQueue
{
  return self->_usageOperationQueue;
}

- (void)setUsageOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOperationQueue, 0);
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_genesisDate, 0);
}

@end