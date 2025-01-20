@interface BKSeriesCheck
+ (BOOL)shouldRecheckAdamID:(id)a3 withIntervalInDays:(double)a4 inManagedObjectContext:(id)a5;
+ (id)adamIDsNeedingToBeCheckedFromAdamIDs:(id)a3 inManagedObjectContext:(id)a4;
+ (id)fetchRequest;
+ (id)insertSeriesCheckWithAdamId:(id)a3 intoManagedObjectContext:(id)a4;
+ (id)predicateForSeriesCheckWithAdamIDsInList:(id)a3;
+ (void)recordAdamIDsAsChecked:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation BKSeriesCheck

+ (id)insertSeriesCheckWithAdamId:(id)a3 intoManagedObjectContext:(id)a4
{
  id v5 = a3;
  v6 = +[NSEntityDescription insertNewObjectForEntityForName:@"BKSeriesCheck" inManagedObjectContext:a4];
  [v6 setAdamId:v5];

  return v6;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"BKSeriesCheck"];
}

+ (id)predicateForSeriesCheckWithAdamIDsInList:(id)a3
{
  return +[NSPredicate predicateWithFormat:@"%K IN %@", @"adamId", a3];
}

+ (id)adamIDsNeedingToBeCheckedFromAdamIDs:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BKSeriesCheck: Filtering Adam IDs that need updating", buf, 2u);
  }
  v7 = +[NSMutableArray array];
  if ([v5 count])
  {
    v8 = +[NSFetchRequest fetchRequestWithEntityName:@"BKSeriesCheck"];
    [v8 setFetchBatchSize:100];
    v9 = +[BKSeriesCheck predicateForSeriesCheckWithAdamIDsInList:v5];
    [v8 setPredicate:v9];

    [v8 setResultType:2];
    v32[0] = @"objectID";
    v32[1] = @"adamId";
    v10 = +[NSArray arrayWithObjects:v32 count:2];
    [v8 setPropertiesToFetch:v10];

    id v29 = 0;
    v11 = [v6 executeFetchRequest:v8 error:&v29];
    id v12 = v29;
    v13 = v12;
    if (v11)
    {
      id v23 = v12;
      id v24 = v6;
      v14 = [v11 valueForKey:@"adamId"];
      v15 = +[NSSet setWithArray:v14];

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v16 = v5;
      id v17 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v26;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            if (([v15 containsObject:v21] & 1) == 0) {
              [v7 addObject:v21];
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v25 objects:v31 count:16];
        }
        while (v18);
      }

      v13 = v23;
      id v6 = v24;
    }
  }

  return v7;
}

+ (void)recordAdamIDsAsChecked:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v42 = v5;
    _os_log_impl(&def_7D91C, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "BKSeriesCheck: recordAdamIDsAsChecked: %@", buf, 0xCu);
  }
  if ([v5 count])
  {
    v7 = [(id)objc_opt_class() fetchRequest];
    [v7 setFetchBatchSize:100];
    v8 = [(id)objc_opt_class() predicateForSeriesCheckWithAdamIDsInList:v5];
    [v7 setPredicate:v8];

    id v38 = 0;
    v9 = [v6 executeFetchRequest:v7 error:&v38];
    id v10 = v38;
    v11 = v10;
    if (v9)
    {
      id v27 = v10;
      id v29 = v7;
      id v12 = +[NSMutableSet setWithArray:v5];
      v13 = +[NSDate date];
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v28 = v9;
      id v14 = v9;
      id v15 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v35;
        do
        {
          id v18 = 0;
          do
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = *(id *)(*((void *)&v34 + 1) + 8 * (void)v18);
            if (([v19 isDeleted] & 1) == 0)
            {
              [v19 setDateChecked:v13];
              v20 = [v19 adamId];
              [v12 removeObject:v20];
            }
            id v18 = (char *)v18 + 1;
          }
          while (v16 != v18);
          id v16 = [v14 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v16);
      }

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = v12;
      id v22 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v31;
        do
        {
          long long v25 = 0;
          do
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = +[BKSeriesCheck insertSeriesCheckWithAdamId:*(void *)(*((void *)&v30 + 1) + 8 * (void)v25) intoManagedObjectContext:v6];
            [v26 setDateChecked:v13];

            long long v25 = (char *)v25 + 1;
          }
          while (v23 != v25);
          id v23 = [v21 countByEnumeratingWithState:&v30 objects:v39 count:16];
        }
        while (v23);
      }

      v9 = v28;
      v7 = v29;
      v11 = v27;
    }
  }
}

+ (BOOL)shouldRecheckAdamID:(id)a3 withIntervalInDays:(double)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (v7)
  {
    v9 = +[NSDate date];
    id v10 = v9;
    double v11 = a4 * -86400.0;
    if (a4 < 0.0) {
      double v11 = a4;
    }
    id v12 = [v9 dateByAddingTimeInterval:v11];

    v13 = [(id)objc_opt_class() fetchRequest];
    id v14 = objc_opt_class();
    id v37 = v7;
    id v15 = +[NSArray arrayWithObjects:&v37 count:1];
    id v16 = [v14 predicateForSeriesCheckWithAdamIDsInList:v15];
    [v13 setPredicate:v16];

    id v35 = 0;
    uint64_t v17 = [v8 executeFetchRequest:v13 error:&v35];
    id v18 = v35;
    if (v17)
    {
      if ([v17 count])
      {
        id v30 = v8;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v19 = v17;
        id v20 = [v19 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v20)
        {
          id v21 = v20;
          id v29 = v18;
          uint64_t v22 = *(void *)v32;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v32 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = [*(id *)(*((void *)&v31 + 1) + 8 * i) dateChecked:v29];
              id v25 = [v24 compare:v12];

              if (v25 == (id)-1)
              {
                int v26 = 1;
                goto LABEL_18;
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v31 objects:v36 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          int v26 = 0;
LABEL_18:
          id v18 = v29;
        }
        else
        {
          int v26 = 0;
        }

        id v8 = v30;
      }
      else
      {
        int v26 = 1;
      }
    }
    else
    {
      int v26 = 0;
    }

    BOOL v27 = v26 != 0;
  }
  else
  {
    BOOL v27 = 0;
  }

  return v27;
}

@end