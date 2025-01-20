@interface STConcreteCoreDataObserver
+ (BOOL)_changeIsInteresting:(id)a3 triggerPredicate:(id)a4;
+ (id)_updatedOrInsertedChangePredicate;
- (NSDate)startTime;
- (NSManagedObjectContext)managedObjectContext;
- (NSMapTable)triggerableObservationFiltersByDelegate;
- (NSObject)managedObjectContextObserver;
- (NSPersistentContainer)persistentContainer;
- (NSPersistentHistoryToken)lastToken;
- (STConcreteCoreDataObserver)initWithPersistentContainer:(id)a3;
- (STDebouncer)changeNotificationDebouncer;
- (id)_coreDataChangesFromInterestingDeleteChanges:(id)a3 withObservationFilters:(id)a4 inContext:(id)a5;
- (id)_coreDataChangesFromInterestingUpsertChanges:(id)a3 withObservationFilters:(id)a4 inContext:(id)a5;
- (id)_filteredObjectIDsFromObjects:(id)a3 predicate:(id)a4;
- (id)_filteredPersistentHistoryChangesFromChanges:(id)a3 predicate:(id)a4;
- (id)_filteredTombstonesFromChanges:(id)a3 predicate:(id)a4;
- (void)addObservationFiltersByTriggerPredicate:(id)a3 forDelegate:(id)a4;
- (void)dealloc;
- (void)debouncer:(id)a3 didDebounce:(id)a4;
- (void)handleManagedObjectContextDidMergeChangesNotification:(id)a3;
- (void)setLastToken:(id)a3;
- (void)setManagedObjectContextObserver:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setTriggerableObservationFiltersByDelegate:(id)a3;
- (void)start;
@end

@implementation STConcreteCoreDataObserver

- (STConcreteCoreDataObserver)initWithPersistentContainer:(id)a3
{
  v4 = (NSPersistentContainer *)a3;
  v15.receiver = self;
  v15.super_class = (Class)STConcreteCoreDataObserver;
  v5 = [(STConcreteCoreDataObserver *)&v15 init];
  persistentContainer = v5->_persistentContainer;
  v5->_persistentContainer = v4;
  v7 = v4;

  uint64_t v8 = [(NSPersistentContainer *)v7 viewContext];
  managedObjectContext = v5->_managedObjectContext;
  v5->_managedObjectContext = (NSManagedObjectContext *)v8;

  uint64_t v10 = +[NSMapTable weakToStrongObjectsMapTable];
  triggerableObservationFiltersByDelegate = v5->_triggerableObservationFiltersByDelegate;
  v5->_triggerableObservationFiltersByDelegate = (NSMapTable *)v10;

  v12 = (STDebouncer *)[objc_alloc((Class)STDebouncer) initWithMinCoalescenceInterval:5.0 maxCoalescenceInterval:10.0];
  changeNotificationDebouncer = v5->_changeNotificationDebouncer;
  v5->_changeNotificationDebouncer = v12;

  [(STDebouncer *)v5->_changeNotificationDebouncer setDelegate:v5];
  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self->_managedObjectContextObserver];

  v4.receiver = self;
  v4.super_class = (Class)STConcreteCoreDataObserver;
  [(STConcreteCoreDataObserver *)&v4 dealloc];
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = +[NSDate now];
  [(STConcreteCoreDataObserver *)self setStartTime:v3];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100013E84;
  v9 = &unk_1002FB800;
  objc_copyWeak(&v10, &location);
  v5 = [v4 addObserverForName:NSManagedObjectContextDidSaveObjectIDsNotification object:0 queue:0 usingBlock:&v6];
  -[STConcreteCoreDataObserver setManagedObjectContextObserver:](self, "setManagedObjectContextObserver:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)addObservationFiltersByTriggerPredicate:(id)a3 forDelegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STConcreteCoreDataObserver *)self triggerableObservationFiltersByDelegate];
  [v8 setObject:v7 forKey:v6];
}

- (void)debouncer:(id)a3 didDebounce:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(STConcreteCoreDataObserver *)self changeNotificationDebouncer];

  id v8 = v9;
  if (v7 == v6 && v9)
  {
    [(STConcreteCoreDataObserver *)self handleManagedObjectContextDidMergeChangesNotification:v9];
    id v8 = v9;
  }
}

- (void)handleManagedObjectContextDidMergeChangesNotification:(id)a3
{
  [(STConcreteCoreDataObserver *)self managedObjectContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001408C;
  v5[3] = &unk_1002FB828;
  v5[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v6;
  [v4 performBlock:v5];
}

+ (BOOL)_changeIsInteresting:(id)a3 triggerPredicate:(id)a4
{
  return _[a4 evaluateWithObject:a3];
}

+ (id)_updatedOrInsertedChangePredicate
{
  if (qword_100346908 != -1) {
    dispatch_once(&qword_100346908, &stru_1002FB848);
  }
  v2 = (void *)qword_100346900;
  return v2;
}

- (id)_filteredPersistentHistoryChangesFromChanges:(id)a3 predicate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[STConcreteCoreDataObserver _updatedOrInsertedChangePredicate];
  v12[0] = v7;
  v12[1] = v5;
  id v8 = +[NSArray arrayWithObjects:v12 count:2];
  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];

  id v10 = [v6 filteredArrayUsingPredicate:v9];

  return v10;
}

- (id)_coreDataChangesFromInterestingUpsertChanges:(id)a3 withObservationFilters:(id)a4 inContext:(id)a5
{
  id v7 = a3;
  id v41 = a4;
  id v8 = a5;
  id v9 = [v7 valueForKeyPath:@"changedObjectID"];
  id v10 = +[STLog coreDataObserver];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_10025BF80(v9);
  }

  v49 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v9 count]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = v9;
  id v11 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v59;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v59 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v16 = [v8 objectWithID:v15];
        if (v16)
        {
          [v49 addObject:v16];
        }
        else
        {
          v17 = +[STLog coreDataObserver];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v65 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch managed object for objectID: %{public}@", buf, 0xCu);
          }
        }
      }
      id v12 = [obj countByEnumeratingWithState:&v58 objects:v66 count:16];
    }
    while (v12);
  }

  if ([v49 count])
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v42 = v41;
    id v47 = [v42 countByEnumeratingWithState:&v54 objects:v63 count:16];
    v18 = 0;
    if (v47)
    {
      uint64_t v45 = *(void *)v55;
      id v43 = v8;
      do
      {
        for (j = 0; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v55 != v45) {
            objc_enumerationMutation(v42);
          }
          v20 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
          v21 = [v20 predicate];
          v22 = [(STConcreteCoreDataObserver *)self _filteredObjectIDsFromObjects:v49 predicate:v21];

          if ([v22 count])
          {
            id v23 = [v20 primaryType];
            id v24 = [v20 secondaryType];
            v25 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v22 count]);

            long long v52 = 0u;
            long long v53 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            v48 = v22;
            id v26 = v22;
            id v27 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
            if (v27)
            {
              id v28 = v27;
              uint64_t v29 = *(void *)v51;
              do
              {
                for (k = 0; k != v28; k = (char *)k + 1)
                {
                  if (*(void *)v51 != v29) {
                    objc_enumerationMutation(v26);
                  }
                  v31 = [[STCoreDataChange alloc] initWithChangeIdentifier:*(void *)(*((void *)&v50 + 1) + 8 * (void)k) primaryType:v23 secondaryType:v24];
                  [v25 addObject:v31];
                }
                id v28 = [v26 countByEnumeratingWithState:&v50 objects:v62 count:16];
              }
              while (v28);
            }

            v18 = v25;
            id v8 = v43;
            v22 = v48;
          }
        }
        id v47 = [v42 countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v47);
    }

    id v32 = [v18 copy];
  }
  else
  {
    v18 = +[STLog coreDataObserver];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_10025BF48(v18, v33, v34, v35, v36, v37, v38, v39);
    }
    id v32 = 0;
  }

  return v32;
}

- (id)_coreDataChangesFromInterestingDeleteChanges:(id)a3 withObservationFilters:(id)a4 inContext:(id)a5
{
  id v29 = a3;
  id v7 = a4;
  id v25 = a5;
  id v8 = +[STLog coreDataObserver];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10025BFFC(v29);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  id v9 = 0;
  if (v30)
  {
    uint64_t v27 = *(void *)v37;
    do
    {
      for (i = 0; i != v30; i = (char *)i + 1)
      {
        if (*(void *)v37 != v27) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v12 = [v11 predicate];
        uint64_t v13 = [(STConcreteCoreDataObserver *)self _filteredTombstonesFromChanges:v29 predicate:v12];

        if ([v13 count])
        {
          id v14 = [v11 primaryType];
          id v15 = [v11 secondaryType];
          v16 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v13 count]);

          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          v31 = v13;
          id v17 = v13;
          id v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v33;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v33 != v20) {
                  objc_enumerationMutation(v17);
                }
                v22 = [[STCoreDataChange alloc] initWithChangeIdentifier:*(void *)(*((void *)&v32 + 1) + 8 * (void)j) primaryType:v14 secondaryType:v15];
                [v16 addObject:v22];
              }
              id v19 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
            }
            while (v19);
          }

          id v9 = v16;
          uint64_t v13 = v31;
        }
      }
      id v30 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v30);
  }

  id v23 = [v9 copy];
  return v23;
}

- (id)_filteredObjectIDsFromObjects:(id)a3 predicate:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  [v6 filterUsingPredicate:v5];

  id v7 = [v6 valueForKeyPath:@"objectID"];

  return v7;
}

- (id)_filteredTombstonesFromChanges:(id)a3 predicate:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  [v6 filterUsingPredicate:v5];

  id v7 = [v6 valueForKeyPath:@"tombstone"];

  return v7;
}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSObject)managedObjectContextObserver
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setManagedObjectContextObserver:(id)a3
{
}

- (NSMapTable)triggerableObservationFiltersByDelegate
{
  return (NSMapTable *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTriggerableObservationFiltersByDelegate:(id)a3
{
}

- (NSPersistentHistoryToken)lastToken
{
  return (NSPersistentHistoryToken *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastToken:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStartTime:(id)a3
{
}

- (STDebouncer)changeNotificationDebouncer
{
  return (STDebouncer *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeNotificationDebouncer, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_lastToken, 0);
  objc_storeStrong((id *)&self->_triggerableObservationFiltersByDelegate, 0);
  objc_storeStrong((id *)&self->_managedObjectContextObserver, 0);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

@end