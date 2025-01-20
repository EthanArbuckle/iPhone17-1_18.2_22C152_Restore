@interface NSManagedObject
+ (id)_ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6;
+ (id)_ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9;
+ (id)ic_dictionariesMatchingPredicate:(id)a3 propertiesToFetch:(id)a4 context:(id)a5;
+ (id)ic_objectFromObjectID:(id)a3 context:(id)a4;
+ (id)ic_objectIDsFromObjects:(id)a3;
+ (id)ic_objectIDsMatchingPredicate:(id)a3 context:(id)a4;
+ (id)ic_objectIDsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5;
+ (id)ic_objectsFromObjectIDs:(id)a3 context:(id)a4;
+ (id)ic_objectsMatchingPredicate:(id)a3 context:(id)a4;
+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5;
+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 propertiesToFetch:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 context:(id)a7;
+ (id)ic_permanentObjectIDsFromObjects:(id)a3;
+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9;
- (BOOL)ic_obtainPermanentObjectIDIfNecessary;
- (id)ic_permanentObjectID;
- (id)ic_postNotificationOnMainThreadAfterSaveWithName:(id)a3;
- (void)ic_postNotificationOnMainThreadWithName:(id)a3;
@end

@implementation NSManagedObject

+ (id)ic_objectFromObjectID:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    id v14 = 0;
    v7 = [v6 existingObjectWithID:v5 error:&v14];
    v8 = v14;
    v9 = REMCheckedDynamicCast();

    if (v8)
    {
      id v10 = [v8 code];
      v11 = +[REMLog cloudkit];
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
      if (v10 == (id)133000)
      {
        if (v12) {
          sub_10074F30C((uint64_t)v5, v11);
        }
      }
      else if (v12)
      {
        sub_10074F384();
      }
    }
  }
  else
  {
    v8 = +[REMLog cloudkit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10074F26C(v8);
    }
    v9 = 0;
  }

  return v9;
}

+ (id)ic_objectsFromObjectIDs:(id)a3 context:(id)a4
{
  return [a1 ic_objectsFromObjectIDs:a3 propertiesToFetch:0 relationshipKeyPathsForPrefetching:0 context:a4];
}

+ (id)ic_objectIDsFromObjects:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectID:v12];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)ic_permanentObjectIDsFromObjects:(id)a3
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if (v5)
  {
    id v6 = [v4 ic_objectsPassingTest:&stru_1008AF8E0];
    id v7 = [v5 managedObjectContext];
    id v13 = 0;
    unsigned __int8 v8 = [v7 obtainPermanentIDsForObjects:v6 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = +[REMLog cloudkit];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10074F400((uint64_t)v9, v10);
      }
    }
  }
  v11 = [a1 ic_objectIDsFromObjects:v4];

  return v11;
}

- (BOOL)ic_obtainPermanentObjectIDIfNecessary
{
  id v3 = [(NSManagedObject *)self objectID];
  unsigned int v4 = [v3 isTemporaryID];

  if (!v4) {
    return 1;
  }
  id v5 = [(NSManagedObject *)self managedObjectContext];
  long long v12 = self;
  id v6 = +[NSArray arrayWithObjects:&v12 count:1];
  id v11 = 0;
  unsigned __int8 v7 = [v5 obtainPermanentIDsForObjects:v6 error:&v11];
  id v8 = v11;

  if ((v7 & 1) == 0)
  {
    id v9 = +[REMLog cloudkit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10074F478((uint64_t)self, (uint64_t)v8, v9);
    }
  }
  return v7;
}

- (id)ic_permanentObjectID
{
  [(NSManagedObject *)self ic_obtainPermanentObjectIDIfNecessary];

  return [(NSManagedObject *)self objectID];
}

- (void)ic_postNotificationOnMainThreadWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(NSManagedObject *)self managedObjectContext];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004436C;
  v7[3] = &unk_1008ADC10;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)ic_postNotificationOnMainThreadAfterSaveWithName:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v15 = 0;
  v16 = (id *)&v15;
  uint64_t v17 = 0x3042000000;
  v18 = sub_100044664;
  v19 = sub_100044670;
  id v20 = 0;
  id v5 = +[NSNotificationCenter defaultCenter];
  id v6 = [(NSManagedObject *)self managedObjectContext];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100044678;
  v11[3] = &unk_1008AF908;
  objc_copyWeak(&v14, &location);
  id v7 = v4;
  id v12 = v7;
  id v13 = &v15;
  id v8 = [v5 addObserverForName:NSManagedObjectContextDidSaveObjectIDsNotification object:v6 queue:0 usingBlock:v11];
  objc_storeWeak(v16 + 5, v8);

  id WeakRetained = objc_loadWeakRetained(v16 + 5);
  _Block_object_dispose(&v15, 8);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return WeakRetained;
}

+ (id)ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  return [a1 _ic_resultsMatchingPredicate:a3 sortDescriptors:a4 resultType:a5 fetchBatchSize:a6 propertiesToFetch:a7 relationshipKeyPathsForPrefetching:a8];
}

+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5
{
  return [a1 ic_objectsMatchingPredicate:a3 sortDescriptors:a4 propertiesToFetch:0 relationshipKeyPathsForPrefetching:0 context:a5];
}

+ (id)ic_objectsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 propertiesToFetch:(id)a5 relationshipKeyPathsForPrefetching:(id)a6 context:(id)a7
{
  return [a1 ic_resultsMatchingPredicate:a3 sortDescriptors:a4 resultType:0 fetchBatchSize:0 propertiesToFetch:a5 relationshipKeyPathsForPrefetching:a6 context:a7];
}

+ (id)ic_objectsMatchingPredicate:(id)a3 context:(id)a4
{
  return [a1 ic_objectsMatchingPredicate:a3 sortDescriptors:0 context:a4];
}

+ (id)ic_objectIDsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 context:(id)a5
{
  return [a1 ic_resultsMatchingPredicate:a3 sortDescriptors:a4 resultType:1 fetchBatchSize:0 propertiesToFetch:0 relationshipKeyPathsForPrefetching:0 context:a5];
}

+ (id)ic_objectIDsMatchingPredicate:(id)a3 context:(id)a4
{
  return [a1 ic_objectIDsMatchingPredicate:a3 sortDescriptors:0 context:a4];
}

+ (id)ic_dictionariesMatchingPredicate:(id)a3 propertiesToFetch:(id)a4 context:(id)a5
{
  return [a1 ic_resultsMatchingPredicate:a3 sortDescriptors:0 resultType:2 fetchBatchSize:0 propertiesToFetch:a4 relationshipKeyPathsForPrefetching:0 context:a5];
}

+ (id)_ic_objectsFromObjectIDs:(id)a3 propertiesToFetch:(id)a4 relationshipKeyPathsForPrefetching:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [a1 entity];
  uint64_t v15 = [v14 name];

  if (!v15)
  {
    v22 = +[REMLog cloudkit];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100750428(v22);
    }
  }
  v16 = +[NSFetchRequest fetchRequestWithEntityName:v15];
  [v16 setIncludesSubentities:1];
  uint64_t v17 = +[NSPredicate predicateWithFormat:@"SELF in %@", v10];
  [v16 setPredicate:v17];

  [v16 setPropertiesToFetch:v13];
  [v16 setRelationshipKeyPathsForPrefetching:v12];

  id v23 = 0;
  v18 = [v11 executeFetchRequest:v16 error:&v23];

  id v19 = v23;
  if (v19)
  {
    id v20 = +[REMLog cloudkit];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10075038C(v10, (uint64_t)v19, v20);
    }
  }

  return v18;
}

+ (id)_ic_resultsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 resultType:(unint64_t)a5 fetchBatchSize:(unint64_t)a6 propertiesToFetch:(id)a7 relationshipKeyPathsForPrefetching:(id)a8 context:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10004A2B8;
  v36 = sub_10004A2C8;
  id v37 = [a1 fetchRequest];
  id v20 = (void *)v33[5];
  if (!v20)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004A2D0;
    v31[3] = &unk_1008AFA70;
    v31[4] = &v32;
    v31[5] = a1;
    [v19 performBlockAndWait:v31];
    id v20 = (void *)v33[5];
  }
  [v20 setPredicate:v15];
  [(id)v33[5] setResultType:a5];
  [(id)v33[5] setFetchBatchSize:a6];
  [(id)v33[5] setSortDescriptors:v16];
  [(id)v33[5] setRelationshipKeyPathsForPrefetching:v18];
  if (v17) {
    [(id)v33[5] setPropertiesToFetch:v17];
  }
  uint64_t v21 = v33[5];
  id v30 = 0;
  v22 = [v19 executeFetchRequest:v21 error:&v30];
  id v23 = v30;
  if (v23)
  {
    v24 = +[REMLog cloudkit];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v39 = v28;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2114;
      id v43 = v16;
      __int16 v44 = 2114;
      id v45 = v23;
      id v29 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Error fetching %{public}@ (predicate=%@ sortDescriptors=%{public}@): %{public}@", buf, 0x2Au);
    }
LABEL_8:

    goto LABEL_10;
  }
  if (!v22)
  {
    v24 = +[REMLog cloudkit];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_opt_class();
      *(_DWORD *)buf = 138544130;
      v39 = v26;
      __int16 v40 = 2112;
      id v41 = v15;
      __int16 v42 = 2114;
      id v43 = v16;
      __int16 v44 = 2114;
      id v45 = v19;
      id v27 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Nil objects array fetching %{public}@ (predicate=%@ sortDescriptors=%{public}@ context=%{public}@)", buf, 0x2Au);
    }
    goto LABEL_8;
  }
LABEL_10:

  _Block_object_dispose(&v32, 8);

  return v22;
}

@end