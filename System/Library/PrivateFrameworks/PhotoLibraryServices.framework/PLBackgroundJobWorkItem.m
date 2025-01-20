@interface PLBackgroundJobWorkItem
+ (BOOL)backgroundJobSearchIndexingEnabled;
+ (id)_predicateForJobFlags:(int64_t)a3;
+ (id)_predicateForJobType:(signed __int16)a3;
+ (id)_searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5 additionalPredicate:(id)a6;
+ (id)_workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 fetchLimit:(id)a5 resultType:(unint64_t)a6 inManagedObjectContext:(id)a7 error:(id *)a8;
+ (id)countOfSearchIndexInsertAssetWorkItemsInManagedObjectContext:(id)a3;
+ (id)countOfSearchIndexWorkItemsInManagedObjectContext:(id)a3;
+ (id)deleteAllSearchIndexJobsInManagedObjectContext:(id)a3;
+ (id)entityName;
+ (id)insertBackgroundJobWorkItemIfNeededWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6;
+ (id)insertBackgroundJobWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6;
+ (id)insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 managedObjectContext:(id)a4;
+ (id)insertSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 flags:(int64_t)a4 managedObjectContext:(id)a5;
+ (id)jobIdentifierWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5;
+ (id)nextSearchIndexWorkItemJobFlagsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4;
+ (id)searchIndexWorkItemManagedObjectIDNeedingRepairInManagedObjectContext:(id)a3;
+ (id)searchIndexWorkItemManagedObjectIDsByPriorityInManagedObjectContext:(id)a3 fetchLimit:(unint64_t)a4;
+ (id)searchIndexWorkItemManagedObjectIDsForIdentifiers:(id)a3 managedObjectContext:(id)a4;
+ (id)searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5;
+ (id)searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 fetchLimit:(unint64_t)a6;
+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobType:(signed __int16)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6;
+ (id)workItemsSortedByTimestampWithJobType:(signed __int16)a3 fetchLimit:(id)a4 resultType:(unint64_t)a5 inManagedObjectContext:(id)a6 error:(id *)a7;
+ (signed)searchJobTypeForCurrentQOS;
- (BOOL)validateForInsert:(id *)a3;
- (double)delayInterval;
- (id)description;
- (id)descriptionForSearchIndexingWorkItem;
- (id)jobFlagsDescription;
- (id)jobIdentifier;
@end

@implementation PLBackgroundJobWorkItem

+ (id)entityName
{
  return @"BackgroundJobWorkItem";
}

- (id)descriptionForSearchIndexingWorkItem
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unsigned int v6 = [(PLBackgroundJobWorkItem *)self jobType];
  if (v6 > 5) {
    v7 = @"unknown";
  }
  else {
    v7 = off_1E586CC90[(unsigned __int16)v6];
  }
  v8 = v7;
  v9 = [(PLBackgroundJobWorkItem *)self identifier];
  v10 = [(PLBackgroundJobWorkItem *)self timestamp];
  v11 = PLBackgroundJobWorkerSearchJobFlagsDescription([(PLBackgroundJobWorkItem *)self jobFlags]);
  v12 = [(PLBackgroundJobWorkItem *)self delayUntilDate];
  v13 = [v3 stringWithFormat:@"<%@: %p> %@ identifier: %@ timestamp: %@ %@, delay until: %@", v5, self, v8, v9, v10, v11, v12];

  return v13;
}

+ (id)deleteAllSearchIndexJobsInManagedObjectContext:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  unsigned int v6 = [a1 entityName];
  v7 = [v5 fetchRequestWithEntityName:v6];

  v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"jobType", &unk_1EEBF1D78];
  [v7 setPredicate:v8];

  id v24 = 0;
  v9 = [v4 executeFetchRequest:v7 error:&v24];
  id v10 = v24;
  if (v9)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          [v4 deleteObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v13);
    }

    v16 = (void *)MEMORY[0x1E4F8B9B8];
    v17 = [MEMORY[0x1E4F1CA98] null];
    v18 = [v16 successWithResult:v17];
  }
  else
  {
    v18 = [MEMORY[0x1E4F8B9B8] failureWithError:v10];
  }

  return v18;
}

+ (signed)searchJobTypeForCurrentQOS
{
  qos_class_t v2 = qos_class_self();
  if (v2 > QOS_CLASS_USER_INTERACTIVE || ((1 << v2) & 0x220201) != 0 || ((1 << v2) & 0x202000000) == 0) {
    return 2;
  }
  else {
    return 1;
  }
}

+ (id)searchIndexWorkItemManagedObjectIDNeedingRepairInManagedObjectContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28F60];
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  v7 = [v5 date];
  v8 = [v4 predicateWithFormat:@"%K < %@", @"delayUntilDate", v7];

  v9 = [a1 _searchIndexWorkItemManagedObjectIDsInManagedObjectContext:v6 jobType:3 fetchLimit:1 additionalPredicate:v8];

  return v9;
}

+ (id)searchIndexWorkItemManagedObjectIDsForIdentifiers:(id)a3 managedObjectContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a4;
  id v8 = a3;
  v9 = [a1 entityName];
  id v10 = [v6 fetchRequestWithEntityName:v9];

  [v10 setResultType:1];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(%K == %d OR %K == %d) AND %K in %@", @"jobType", 1, @"jobType", 2, @"identifier", v8];

  [v10 setPredicate:v11];
  id v16 = 0;
  uint64_t v12 = [v7 executeFetchRequest:v10 error:&v16];

  id v13 = v16;
  if (v12) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v12];
  }
  else {
  uint64_t v14 = [MEMORY[0x1E4F8B9B8] failureWithError:v13];
  }

  return v14;
}

+ (id)searchIndexWorkItemManagedObjectIDsByPriorityInManagedObjectContext:(id)a3 fetchLimit:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [a1 searchIndexWorkItemManagedObjectIDsInManagedObjectContext:v6 jobType:1 fetchLimit:a4];
  if (([v7 isFailure] & 1) != 0
    || ([v7 result],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 count],
        v8,
        v9 >= a4))
  {
    id v18 = v7;
  }
  else
  {
    id v10 = [v7 result];
    unint64_t v11 = a4 - [v10 count];

    uint64_t v12 = [a1 searchIndexWorkItemManagedObjectIDsInManagedObjectContext:v6 jobType:2 fetchLimit:v11];
    if (([v12 isFailure] & 1) != 0
      || ([v12 result],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unint64_t v14 = [v13 count],
          v13,
          v14 >= a4))
    {
      id v18 = v12;
    }
    else
    {
      v15 = [v7 result];
      id v16 = [v12 result];
      v17 = [v15 arrayByAddingObjectsFromArray:v16];

      id v18 = [MEMORY[0x1E4F8B9B8] successWithResult:v17];
    }
  }

  return v18;
}

+ (id)searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5
{
  return (id)[a1 _searchIndexWorkItemManagedObjectIDsInManagedObjectContext:a3 jobType:a4 fetchLimit:a5 additionalPredicate:0];
}

+ (id)_searchIndexWorkItemManagedObjectIDsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 fetchLimit:(unint64_t)a5 additionalPredicate:(id)a6
{
  int v7 = a4;
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  unint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = a3;
  id v13 = [a1 entityName];
  unint64_t v14 = [v11 fetchRequestWithEntityName:v13];

  [v14 setResultType:1];
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"jobType", v7);
  [v15 addObject:v16];
  if (v10) {
    [v15 addObject:v10];
  }
  v17 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
  [v14 setPredicate:v17];
  if (a5) {
    [v14 setFetchLimit:a5];
  }
  id v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v25[0] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v14 setSortDescriptors:v19];

  id v24 = 0;
  long long v20 = [v12 executeFetchRequest:v14 error:&v24];

  id v21 = v24;
  if (v20) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v20];
  }
  else {
  long long v22 = [MEMORY[0x1E4F8B9B8] failureWithError:v21];
  }

  return v22;
}

+ (id)searchIndexWorkItemsForIncrementalUpdatesInManagedObjectContext:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 fetchLimit:(unint64_t)a6
{
  uint64_t v8 = a4;
  v24[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  unint64_t v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = [a1 entityName];
  id v13 = [v11 fetchRequestWithEntityName:v12];

  unint64_t v14 = (void *)MEMORY[0x1E4F28BA0];
  id v15 = [a1 _predicateForJobType:v8];
  v24[0] = v15;
  id v16 = [a1 _predicateForJobFlags:a5];
  v24[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v18 = [v14 andPredicateWithSubpredicates:v17];
  [v13 setPredicate:v18];

  if (a6) {
    [v13 setFetchLimit:a6];
  }
  id v23 = 0;
  v19 = [v10 executeFetchRequest:v13 error:&v23];
  id v20 = v23;
  if (v19) {
    [MEMORY[0x1E4F8B9B8] successWithResult:v19];
  }
  else {
  id v21 = [MEMORY[0x1E4F8B9B8] failureWithError:v20];
  }

  return v21;
}

+ (id)nextSearchIndexWorkItemJobFlagsInManagedObjectContext:(id)a3 jobType:(signed __int16)a4
{
  uint64_t v4 = a4;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v7 = a3;
  uint64_t v8 = [a1 entityName];
  unint64_t v9 = [v6 fetchRequestWithEntityName:v8];

  [v9 setResultType:2];
  if (v4 == 3)
  {
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    unint64_t v11 = [a1 _predicateForJobType:3];
    v27[0] = v11;
    id v12 = (void *)MEMORY[0x1E4F28F60];
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    unint64_t v14 = [v12 predicateWithFormat:@"%K < %@", @"delayUntilDate", v13];
    v27[1] = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    id v16 = [v10 andPredicateWithSubpredicates:v15];
    [v9 setPredicate:v16];
  }
  else
  {
    unint64_t v11 = [a1 _predicateForJobType:v4];
    [v9 setPredicate:v11];
  }

  [v9 setFetchLimit:1];
  uint64_t v26 = @"jobFlags";
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v9 setPropertiesToFetch:v17];

  id v25 = 0;
  id v18 = [v7 executeFetchRequest:v9 error:&v25];

  id v19 = v25;
  if (v18)
  {
    if ([v18 count])
    {
      id v20 = [v18 firstObject];
      id v21 = [v20 objectForKey:@"jobFlags"];

      long long v22 = [MEMORY[0x1E4F8B9B8] successWithResult:v21];

      goto LABEL_10;
    }
    uint64_t v23 = [MEMORY[0x1E4F8B9B8] successWithResult:&unk_1EEBEE850];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F8B9B8] failureWithError:v19];
  }
  long long v22 = (void *)v23;
LABEL_10:

  return v22;
}

+ (id)_predicateForJobFlags:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"jobFlags", a3);
}

+ (id)_predicateForJobType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"jobType", a3);
}

+ (id)countOfSearchIndexInsertAssetWorkItemsInManagedObjectContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = [a1 entityName];
  id v7 = [v5 fetchRequestWithEntityName:v6];

  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"jobType", &unk_1EEBF1D60];
  [v7 setPredicate:v8];

  [v7 setFetchBatchSize:100];
  id v25 = 0;
  unint64_t v9 = [v4 executeFetchRequest:v7 error:&v25];
  id v10 = v25;
  if (v9)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          if ([*(id *)(*((void *)&v21 + 1) + 8 * i) jobFlags] == 14) {
            ++v14;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v13);
    }
    else
    {
      uint64_t v14 = 0;
    }

    id v18 = (void *)MEMORY[0x1E4F8B9B8];
    id v19 = [NSNumber numberWithUnsignedInteger:v14];
    v17 = [v18 successWithResult:v19];
  }
  else
  {
    v17 = [MEMORY[0x1E4F8B9B8] failureWithError:v10];
  }

  return v17;
}

+ (id)countOfSearchIndexWorkItemsInManagedObjectContext:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C0D0];
  id v5 = a3;
  id v6 = [a1 entityName];
  id v7 = [v4 fetchRequestWithEntityName:v6];

  uint64_t v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"jobType", &unk_1EEBF1D48];
  [v7 setPredicate:v8];

  [v7 setResultType:4];
  id v15 = 0;
  uint64_t v9 = [v5 countForFetchRequest:v7 error:&v15];

  id v10 = v15;
  id v11 = (void *)MEMORY[0x1E4F8B9B8];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v12 = [MEMORY[0x1E4F8B9B8] failureWithError:v10];
  }
  else
  {
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v9];
    uint64_t v12 = [v11 successWithResult:v13];
  }
  return v12;
}

+ (id)insertSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 flags:(int64_t)a4 managedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = [a1 backgroundJobSearchIndexingEnabled];
  id v11 = 0;
  if (a4 && v10)
  {
    if (a4) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = +[PLBackgroundJobWorkItem searchJobTypeForCurrentQOS];
    }
    id v11 = +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemIfNeededWithIdentifier:v8 jobType:v12 jobFlags:a4 inManagedObjectContext:v9];
  }

  return v11;
}

+ (id)insertDeleteFromSearchIndexWorkItemIfNeededWithIdentifier:(id)a3 managedObjectContext:(id)a4
{
  return (id)[a1 insertSearchIndexWorkItemIfNeededWithIdentifier:a3 flags:1 managedObjectContext:a4];
}

+ (BOOL)backgroundJobSearchIndexingEnabled
{
  return _os_feature_enabled_impl();
}

- (double)delayInterval
{
  v3 = [(PLBackgroundJobWorkItem *)self delayUntilDate];

  if (!v3) {
    return 0.0;
  }
  id v4 = [(PLBackgroundJobWorkItem *)self delayUntilDate];
  id v5 = [(PLBackgroundJobWorkItem *)self timestamp];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (id)jobIdentifier
{
  v3 = objc_opt_class();
  id v4 = [(PLBackgroundJobWorkItem *)self identifier];
  id v5 = objc_msgSend(v3, "jobIdentifierWithIdentifier:jobType:jobFlags:", v4, -[PLBackgroundJobWorkItem jobType](self, "jobType"), -[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));

  return v5;
}

- (BOOL)validateForInsert:(id *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLBackgroundJobWorkItem;
  BOOL v4 = [(PLBackgroundJobWorkItem *)&v6 validateForInsert:a3];
  if (v4) {
    LOBYTE(v4) = [(PLBackgroundJobWorkItem *)self jobType] - 1 > 2
  }
              || [(PLBackgroundJobWorkItem *)self jobFlags] != 0;
  return v4;
}

- (id)jobFlagsDescription
{
  if ([(PLBackgroundJobWorkItem *)self jobType] - 1 > 2) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[PLBackgroundJobWorkItem jobFlags](self, "jobFlags"));
  }
  else {
  v3 = PLBackgroundJobWorkerSearchJobFlagsDescription([(PLBackgroundJobWorkItem *)self jobFlags]);
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unsigned int v6 = [(PLBackgroundJobWorkItem *)self jobType];
  if (v6 > 5) {
    double v7 = @"unknown";
  }
  else {
    double v7 = off_1E586CC90[(unsigned __int16)v6];
  }
  id v8 = [(PLBackgroundJobWorkItem *)self identifier];
  id v9 = [(PLBackgroundJobWorkItem *)self jobFlagsDescription];
  int v10 = [(PLBackgroundJobWorkItem *)self timestamp];
  id v11 = [(PLBackgroundJobWorkItem *)self delayUntilDate];
  uint64_t v12 = [v3 stringWithFormat:@"<%@ %p> %@ %@ flags: %@ timestamp: %@, delay until: %@", v5, self, v7, v8, v9, v10, v11];

  return v12;
}

+ (id)jobIdentifierWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5
{
  return (id)[NSString stringWithFormat:@"%@%lu%lu", a3, a4, a5];
}

+ (id)_workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 fetchLimit:(id)a5 resultType:(unint64_t)a6 inManagedObjectContext:(id)a7 error:(id *)a8
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v31 = a7;
  if (!v15)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"PLBackgroundJobWorkItem.m", 122, @"Invalid parameter not satisfying: %@", @"jobTypes" object file lineNumber description];
  }
  if (a6 >= 2)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, a1, @"PLBackgroundJobWorkItem.m", 123, @"Invalid parameter not satisfying: %@", @"resultType == NSManagedObjectResultType || resultType == NSManagedObjectIDResultType" object file lineNumber description];
  }
  v17 = (void *)MEMORY[0x1E4F1C0D0];
  id v18 = [a1 entityName];
  id v19 = [v17 fetchRequestWithEntityName:v18];

  id v20 = (void *)MEMORY[0x1E4F28BA0];
  if (v14) {
    [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"identifier", v14];
  }
  else {
  long long v21 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  }
  v34[0] = v21;
  long long v22 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"jobType", v15];
  v34[1] = v22;
  long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  long long v24 = [v20 andPredicateWithSubpredicates:v23];
  [v19 setPredicate:v24];

  id v25 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  v33 = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  [v19 setSortDescriptors:v26];

  [v19 setResultType:a6];
  if (v16) {
    objc_msgSend(v19, "setFetchLimit:", objc_msgSend(v16, "integerValue"));
  }
  uint64_t v27 = [v31 executeFetchRequest:v19 error:a8];

  return v27;
}

+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobTypes:(id)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  return (id)[a1 _workItemsSortedByTimestampWithIdentifier:a3 jobTypes:a4 fetchLimit:0 resultType:0 inManagedObjectContext:a5 error:a6];
}

+ (id)workItemsSortedByTimestampWithIdentifier:(id)a3 jobType:(signed __int16)a4 inManagedObjectContext:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  int v10 = NSNumber;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [v10 numberWithShort:v7];
  v17[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  id v15 = [a1 workItemsSortedByTimestampWithIdentifier:v12 jobTypes:v14 inManagedObjectContext:v11 error:a6];

  return v15;
}

+ (id)workItemsSortedByTimestampWithJobType:(signed __int16)a3 fetchLimit:(id)a4 resultType:(unint64_t)a5 inManagedObjectContext:(id)a6 error:(id *)a7
{
  uint64_t v10 = a3;
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = NSNumber;
  id v13 = a6;
  id v14 = a4;
  id v15 = [v12 numberWithShort:v10];
  v19[0] = v15;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v17 = [a1 _workItemsSortedByTimestampWithIdentifier:0 jobTypes:v16 fetchLimit:v14 resultType:a5 inManagedObjectContext:v13 error:a7];

  return v17;
}

+ (id)insertBackgroundJobWorkItemIfNeededWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if ([v11 hasRecordedBackgroundWorkItemWithIdentifier:v10 jobType:v8 jobFlags:a5])
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [a1 insertBackgroundJobWorkItemWithIdentifier:v10 jobType:v8 jobFlags:a5 inManagedObjectContext:v11];
    [v11 recordBackgroundJobWorkItemCreated:v12];
  }

  return v12;
}

+ (id)insertBackgroundJobWorkItemWithIdentifier:(id)a3 jobType:(signed __int16)a4 jobFlags:(int64_t)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8 = a4;
  id v11 = a3;
  id v12 = a6;
  if (!v11)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"PLBackgroundJobWorkItem.m", 89, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  id v13 = [a1 insertInManagedObjectContext:v12];
  [v13 setIdentifier:v11];
  [v13 setJobType:v8];
  [v13 setJobFlags:a5];
  id v14 = [MEMORY[0x1E4F1C9C8] now];
  [v13 setTimestamp:v14];

  return v13;
}

@end