@interface BCRemoteManagedObjectIDMonitor
- (BCRemoteManagedObjectIDMonitor)initWithCoordinator:(id)a3 entityName:(id)a4 historyToken:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9;
- (BCRemoteManagedObjectIDMonitorObserver)observer;
- (BOOL)_objectHasChangesOfInterest:(id)a3;
- (NSManagedObjectContext)context;
- (NSMutableSet)currentObjectIdentifiers;
- (NSPersistentHistoryToken)historyToken;
- (NSPersistentStoreCoordinator)coordinator;
- (NSPredicate)predicate;
- (NSSet)propertiesOfInterest;
- (NSString)entityName;
- (NSString)mapProperty;
- (OS_dispatch_queue)sync;
- (id)_fetchPersistentHistoryWithHistoryToken:(id)a3;
- (id)description;
- (void)_persistentStoreRemoteDidChange:(id)a3;
- (void)dealloc;
- (void)setHistoryToken:(id)a3;
@end

@implementation BCRemoteManagedObjectIDMonitor

- (BCRemoteManagedObjectIDMonitor)initWithCoordinator:(id)a3 entityName:(id)a4 historyToken:(id)a5 predicate:(id)a6 mapProperty:(id)a7 propertiesOfInterest:(id)a8 observer:(id)a9
{
  id v16 = a3;
  id v56 = a4;
  id v54 = a5;
  id v55 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v65.receiver = self;
  v65.super_class = (Class)BCRemoteManagedObjectIDMonitor;
  v20 = [(BCRemoteManagedObjectIDMonitor *)&v65 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_coordinator, a3);
    v22 = (NSString *)[v56 copy];
    entityName = v21->_entityName;
    v21->_entityName = v22;

    objc_storeStrong((id *)&v21->_historyToken, a5);
    objc_storeStrong((id *)&v21->_predicate, a6);
    v24 = (NSString *)[v17 copy];
    mapProperty = v21->_mapProperty;
    v21->_mapProperty = v24;

    v26 = (NSSet *)[v18 copy];
    propertiesOfInterest = v21->_propertiesOfInterest;
    v21->_propertiesOfInterest = v26;

    objc_storeWeak((id *)&v21->_observer, v19);
    v28 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v29 = dispatch_queue_create("BCRemoteManagedObjectIDMonitor.sync", v28);
    sync = v21->_sync;
    v21->_sync = (OS_dispatch_queue *)v29;

    v31 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    currentObjectIdentifiers = v21->_currentObjectIdentifiers;
    v21->_currentObjectIdentifiers = v31;

    v33 = [v16 persistentStores];
    BOOL v34 = [v33 count] == 0;

    if (v34)
    {
      v53 = @"empty";
    }
    else
    {
      v35 = [v16 persistentStores];
      v36 = [v35 firstObject];
      v53 = [v36 identifier];
    }
    v37 = BCRemoteManagedObjectIDMonitorLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v38 = [(BCRemoteManagedObjectIDMonitor *)v21 observer];
      v39 = [v38 remoteManagerObserverId];
      v40 = [(BCRemoteManagedObjectIDMonitor *)v21 historyToken];
      v41 = [v16 persistentStores];
      id v42 = [v41 count];
      *(_DWORD *)buf = 138413826;
      *(void *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v67 = v39;
      *(_WORD *)v68 = 2112;
      *(void *)&v68[2] = v40;
      *(_WORD *)&v68[10] = 2048;
      *(void *)&v68[12] = v42;
      __int16 v69 = 2112;
      v70 = v53;
      __int16 v71 = 2112;
      id v72 = v55;
      _os_log_impl(&def_7D91C, v37, OS_LOG_TYPE_DEFAULT, "BCRemoteManagedObjectIDMonitor %@ initialized %@ with observer:%@ token:%@ storeCount:%lu persistentstoreID:(%@), predicate:%@", buf, 0x48u);
    }
    v43 = +[NSNotificationCenter defaultCenter];
    [v43 addObserver:v21 selector:"_persistentStoreRemoteDidChange:" name:NSPersistentStoreRemoteChangeNotification object:v21->_coordinator];

    v44 = (NSManagedObjectContext *)[objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
    context = v21->_context;
    v21->_context = v44;

    [(NSManagedObjectContext *)v21->_context setPersistentStoreCoordinator:v21->_coordinator];
    [(NSManagedObjectContext *)v21->_context setUndoManager:0];
    [(NSManagedObjectContext *)v21->_context setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v67 = sub_44598;
    *(void *)v68 = sub_445A8;
    *(void *)&v68[8] = 0;
    dispatch_semaphore_t v46 = dispatch_semaphore_create(0);
    v47 = v21->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_445B0;
    block[3] = &unk_2C4720;
    v48 = v46;
    v62 = v48;
    v49 = v21;
    v63 = v49;
    v64 = buf;
    dispatch_async(v47, block);
    v50 = v21->_context;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_445FC;
    v57[3] = &unk_2C5530;
    v58 = v49;
    v60 = buf;
    v51 = v48;
    v59 = v51;
    [(NSManagedObjectContext *)v50 performBlock:v57];

    _Block_object_dispose(buf, 8);
  }

  return v21;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSPersistentStoreRemoteChangeNotification object:self->_coordinator];

  v4.receiver = self;
  v4.super_class = (Class)BCRemoteManagedObjectIDMonitor;
  [(BCRemoteManagedObjectIDMonitor *)&v4 dealloc];
}

- (BOOL)_objectHasChangesOfInterest:(id)a3
{
  if (!self->_propertiesOfInterest) {
    return 1;
  }
  v3 = self;
  objc_super v4 = [a3 changedValues];
  v5 = [v4 allKeys];
  v6 = +[NSSet setWithArray:v5];

  LOBYTE(v3) = [v6 intersectsSet:v3->_propertiesOfInterest];
  return (char)v3;
}

- (void)_persistentStoreRemoteDidChange:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&def_7D91C, "BCRemoteMonitorHistoryProcessing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_449F4;
  v7[3] = &unk_2C3AF8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  os_activity_apply(v5, v7);
}

- (id)_fetchPersistentHistoryWithHistoryToken:(id)a3
{
  id v4 = a3;
  v5 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v4];
  id v6 = [(BCRemoteManagedObjectIDMonitor *)self context];
  id v15 = 0;
  v7 = [v6 executeRequest:v5 error:&v15];
  id v8 = v15;

  v9 = BCRemoteManagedObjectIDMonitorLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1EAB44((uint64_t)v4, v7);
  }

  if (!v7)
  {
    v10 = BCRemoteManagedObjectIDMonitorLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1EAAC8();
    }
  }
  v11 = [v7 result];
  if ([v11 count]) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(BCRemoteManagedObjectIDMonitor *)self observer];
  id v6 = [v5 remoteManagerObserverId];
  v7 = [(BCRemoteManagedObjectIDMonitor *)self entityName];
  id v8 = +[NSString stringWithFormat:@"<%@:%p observer:%@-%@>", v4, self, v6, v7];

  return v8;
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

- (BCRemoteManagedObjectIDMonitorObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (BCRemoteManagedObjectIDMonitorObserver *)WeakRetained;
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (NSMutableSet)currentObjectIdentifiers
{
  return self->_currentObjectIdentifiers;
}

- (NSPersistentHistoryToken)historyToken
{
  return self->_historyToken;
}

- (void)setHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_currentObjectIdentifiers, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_propertiesOfInterest, 0);
  objc_storeStrong((id *)&self->_mapProperty, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

@end