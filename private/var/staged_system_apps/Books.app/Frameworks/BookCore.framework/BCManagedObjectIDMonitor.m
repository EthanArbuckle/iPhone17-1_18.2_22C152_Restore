@interface BCManagedObjectIDMonitor
- (BCManagedObjectIDMonitor)initWithContext:(id)a3 coordinator:(id)a4 entityName:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9;
- (BCManagedObjectIDMonitorObserver)observer;
- (BOOL)_objectHasChangesOfInterest:(id)a3;
- (NSManagedObjectContext)context;
- (NSMapTable)mocToChangesMap;
- (NSMutableSet)currentObjectIdentifiers;
- (NSPersistentStoreCoordinator)coordinator;
- (NSPredicate)predicate;
- (NSSet)currentIdentifiers;
- (NSSet)propertiesOfInterest;
- (NSString)entityName;
- (NSString)mapProperty;
- (OS_dispatch_queue)sync;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_managedObjectContextWillSave:(id)a3;
- (void)dealloc;
@end

@implementation BCManagedObjectIDMonitor

- (BCManagedObjectIDMonitor)initWithContext:(id)a3 coordinator:(id)a4 entityName:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9
{
  id v16 = a3;
  id v47 = a4;
  id v48 = a5;
  id v46 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v20 = BCSignpostLibrary();
  os_signpost_id_t v21 = os_signpost_id_generate(v20);

  v22 = BCSignpostLibrary();
  v23 = v22;
  os_signpost_id_t spid = v21;
  unint64_t v24 = v21 - 1;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v48;
    _os_signpost_emit_with_name_impl(&def_7D91C, v23, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BCManagedObjectIDMonitor initial fetch", "%@", buf, 0xCu);
  }

  v52.receiver = self;
  v52.super_class = (Class)BCManagedObjectIDMonitor;
  v25 = [(BCManagedObjectIDMonitor *)&v52 init];
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_context, a3);
    objc_storeStrong((id *)&v26->_coordinator, a4);
    v27 = (NSString *)[v48 copy];
    entityName = v26->_entityName;
    v26->_entityName = v27;

    objc_storeStrong((id *)&v26->_predicate, a6);
    v29 = v17;
    v30 = (NSString *)[v17 copy];
    mapProperty = v26->_mapProperty;
    v26->_mapProperty = v30;

    v32 = (NSSet *)[v18 copy];
    propertiesOfInterest = v26->_propertiesOfInterest;
    v26->_propertiesOfInterest = v32;

    objc_storeWeak((id *)&v26->_observer, v19);
    dispatch_queue_t v34 = dispatch_queue_create("BCManagedObjectIDMonitor.sync", 0);
    sync = v26->_sync;
    v26->_sync = (OS_dispatch_queue *)v34;

    dispatch_suspend((dispatch_object_t)v26->_sync);
    v36 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentObjectIdentifiers = v26->_currentObjectIdentifiers;
    v26->_currentObjectIdentifiers = v36;

    uint64_t v38 = +[NSMapTable strongToStrongObjectsMapTable];
    mocToChangesMap = v26->_mocToChangesMap;
    v26->_mocToChangesMap = (NSMapTable *)v38;

    v40 = +[NSNotificationCenter defaultCenter];
    [v40 addObserver:v26 selector:"_managedObjectContextWillSave:" name:NSManagedObjectContextWillSaveNotification object:0];

    v41 = +[NSNotificationCenter defaultCenter];
    [v41 addObserver:v26 selector:"_managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveNotification object:0];

    if (!v16)
    {
      id v16 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
      [v16 setPersistentStoreCoordinator:v26->_coordinator];
      [v16 setUndoManager:0];
      [v16 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_17EBD0;
    v49[3] = &unk_2C3AF8;
    v50 = v26;
    id v16 = v16;
    id v51 = v16;
    [v16 performBlockAndWait:v49];
  }
  else
  {
    v29 = v17;
  }
  v42 = BCSignpostLibrary();
  v43 = v42;
  if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_DWORD *)buf = 138412290;
    id v54 = v48;
    _os_signpost_emit_with_name_impl(&def_7D91C, v43, OS_SIGNPOST_INTERVAL_BEGIN, spid, "BCManagedObjectIDMonitor initial fetch", "%@", buf, 0xCu);
  }

  return v26;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextWillSaveNotification object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)BCManagedObjectIDMonitor;
  [(BCManagedObjectIDMonitor *)&v5 dealloc];
}

- (BOOL)_objectHasChangesOfInterest:(id)a3
{
  v4 = [a3 changedValues];
  objc_super v5 = [v4 allKeys];
  v6 = +[NSSet setWithArray:v5];

  LOBYTE(self) = [v6 intersectsSet:self->_propertiesOfInterest];
  return (char)self;
}

- (void)_managedObjectContextWillSave:(id)a3
{
  id v49 = a3;
  v4 = [v49 object];
  v50 = v4;
  context = self->_context;
  v6 = v4;
  if (context == v4
    || !context
    && self->_coordinator
    && ([(NSManagedObjectContext *)v4 persistentStoreCoordinator],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 hasStoreInCommonWith:self->_coordinator],
        v7,
        v6 = v50,
        v8))
  {
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = sub_17F574;
    v74 = sub_17F584;
    id v75 = 0;
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17F58C;
    block[3] = &unk_2C39F0;
    block[4] = self;
    block[5] = &v70;
    dispatch_sync(sync, block);
    v53 = +[NSMutableArray array];
    objc_super v52 = +[NSMutableArray array];
    id v51 = +[NSMutableArray array];
    mapProperty = (__CFString *)self->_mapProperty;
    if (!mapProperty) {
      mapProperty = @"objectID";
    }
    v11 = mapProperty;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v12 = [(NSManagedObjectContext *)v6 deletedObjects];
    id v13 = [v12 countByEnumeratingWithState:&v65 objects:v78 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v66;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v66 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v65 + 1) + 8 * i);
          id v17 = [v16 entity];
          id v18 = [v17 name];
          unsigned int v19 = [v18 isEqualToString:self->_entityName];

          if (v19)
          {
            v20 = [v16 valueForKey:v11];
            if (v20 && [(id)v71[5] containsObject:v20]) {
              [v52 addObject:v20];
            }
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v65 objects:v78 count:16];
      }
      while (v13);
    }

    long long v63 = 0u;
    long long v64 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    os_signpost_id_t v21 = [(NSManagedObjectContext *)v50 insertedObjects];
    id v22 = [v21 countByEnumeratingWithState:&v61 objects:v77 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v62;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v62 != v23) {
            objc_enumerationMutation(v21);
          }
          v25 = *(void **)(*((void *)&v61 + 1) + 8 * (void)j);
          v26 = [v25 entity];
          v27 = [v26 name];
          unsigned int v28 = [v27 isEqualToString:self->_entityName];

          if (v28)
          {
            v29 = [v25 valueForKey:v11];
            if (v29)
            {
              predicate = self->_predicate;
              if (!predicate || [(NSPredicate *)predicate evaluateWithObject:v25]) {
                [v53 addObject:v29];
              }
            }
          }
        }
        id v22 = [v21 countByEnumeratingWithState:&v61 objects:v77 count:16];
      }
      while (v22);
    }

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v31 = [(NSManagedObjectContext *)v50 updatedObjects];
    id v32 = [v31 countByEnumeratingWithState:&v57 objects:v76 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v58;
      do
      {
        for (k = 0; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v58 != v33) {
            objc_enumerationMutation(v31);
          }
          v35 = *(void **)(*((void *)&v57 + 1) + 8 * (void)k);
          v36 = [v35 entity];
          v37 = [v36 name];
          unsigned int v38 = [v37 isEqualToString:self->_entityName];

          if (v38)
          {
            v39 = [v35 valueForKey:v11];
            if (v39
              && (!self->_propertiesOfInterest
               || [(BCManagedObjectIDMonitor *)self _objectHasChangesOfInterest:v35]))
            {
              v40 = self->_predicate;
              unsigned int v41 = !v40 || [(NSPredicate *)v40 evaluateWithObject:v35];
              unsigned int v42 = [(id)v71[5] containsObject:v39];
              v43 = v53;
              if (((v41 ^ 1 | v42) & 1) == 0
                || (int v44 = v42 ^ 1, v43 = v52, (v41 | v44) != 1)
                || (v43 = v51, ((v41 ^ 1 | v44) & 1) == 0))
              {
                [v43 addObject:v39];
              }
            }
          }
        }
        id v32 = [v31 countByEnumeratingWithState:&v57 objects:v76 count:16];
      }
      while (v32);
    }

    if ([v53 count] || objc_msgSend(v52, "count") || objc_msgSend(v51, "count"))
    {
      v45 = [[BCManagedObjectIDChanges alloc] initWithAdded:v53 updated:v51 deleted:v52 context:v50];
      id v46 = self->_sync;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_17F5D8;
      v54[3] = &unk_2C48E0;
      v54[4] = self;
      id v47 = v45;
      v55 = v47;
      v56 = v50;
      dispatch_sync(v46, v54);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if (objc_opt_respondsToSelector()) {
        [WeakRetained managedObjectBackgroundMonitor:self willSaveNotify:v47];
      }
    }
    _Block_object_dispose(&v70, 8);

    v6 = v50;
  }
}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 object];
  v6 = v5;
  context = self->_context;
  if (context == v5
    || !context
    && self->_coordinator
    && ([(NSManagedObjectContext *)v5 persistentStoreCoordinator],
        unsigned int v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 hasStoreInCommonWith:self->_coordinator],
        v8,
        v9))
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    id v22 = sub_17F574;
    uint64_t v23 = sub_17F584;
    id v24 = 0;
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17F7E8;
    block[3] = &unk_2C3AD0;
    id v18 = &v19;
    block[4] = self;
    id v17 = v6;
    dispatch_sync(sync, block);
    v11 = [(id)v20[5] addedObjects];
    if (![v11 count])
    {
      v12 = [(id)v20[5] deletedObjects];
      if (![v12 count])
      {
        uint64_t v14 = [(id)v20[5] updatedObjects];
        id v15 = [v14 count];

        if (!v15) {
          goto LABEL_10;
        }
        goto LABEL_9;
      }
    }
LABEL_9:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
    [WeakRetained managedObjectBackgroundMonitor:self didSaveNotify:v20[5]];

LABEL_10:
    _Block_object_dispose(&v19, 8);
  }
}

- (NSSet)currentIdentifiers
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  unsigned int v9 = sub_17F574;
  v10 = sub_17F584;
  id v11 = 0;
  sync = self->_sync;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_17FA2C;
  v5[3] = &unk_2C39F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sync, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentStoreCoordinator)coordinator
{
  return self->_coordinator;
}

- (NSString)entityName
{
  return self->_entityName;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (NSString)mapProperty
{
  return self->_mapProperty;
}

- (NSSet)propertiesOfInterest
{
  return self->_propertiesOfInterest;
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (BCManagedObjectIDMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (BCManagedObjectIDMonitorObserver *)WeakRetained;
}

- (NSMapTable)mocToChangesMap
{
  return self->_mocToChangesMap;
}

- (NSMutableSet)currentObjectIdentifiers
{
  return self->_currentObjectIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_mocToChangesMap, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mapProperty, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end