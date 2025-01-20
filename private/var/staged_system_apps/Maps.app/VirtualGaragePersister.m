@interface VirtualGaragePersister
- (NSArray)storeSubscriptionTypes;
- (NSString)selectedVehicleIdentifier;
- (VGVirtualGaragePersistingDelegate)delegate;
- (VirtualGaragePersister)init;
- (id)_processUpdatedSyncVehicles:(id)a3;
- (id)persistedVehicleForVehicle:(id)a3;
- (void)_addOrEditVehicle:(id)a3;
- (void)_removeSyncVehicle:(id)a3;
- (void)addVehicle:(id)a3;
- (void)loadVehiclesWithCompletion:(id)a3;
- (void)removeVehicle:(id)a3;
- (void)saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedVehicleIdentifier:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
@end

@implementation VirtualGaragePersister

- (VirtualGaragePersister)init
{
  v12.receiver = self;
  v12.super_class = (Class)VirtualGaragePersister;
  v2 = [(VirtualGaragePersister *)&v12 init];
  if (v2)
  {
    id v3 = +[NSString stringWithFormat:@"com.apple.Navigation.persister.%@.%p", objc_opt_class(), v2];
    v4 = (const char *)[v3 UTF8String];
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(v4, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = +[MapsSyncStore sharedStore];
    [v8 subscribe:v2];

    uint64_t v13 = objc_opt_class();
    uint64_t v9 = +[NSArray arrayWithObjects:&v13 count:1];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v9;
  }
  return v2;
}

- (void)loadVehiclesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init((Class)MSVehicleRequest);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100475B30;
  v7[3] = &unk_1012EB628;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 fetchWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)addVehicle:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Trying to add vehicle: %@", buf, 0xCu);
  }

  id v6 = [v4 copy];
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100475ECC;
  v9[3] = &unk_1012E6690;
  objc_copyWeak(&v11, (id *)buf);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

- (void)removeVehicle:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Trying to remove vehicle: %@", buf, 0xCu);
  }

  id v6 = [v4 copy];
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10047608C;
  v9[3] = &unk_1012E7ED0;
  id v10 = v6;
  id v8 = v6;
  objc_copyWeak(&v11, (id *)buf);
  dispatch_async(queue, v9);
  objc_destroyWeak(&v11);

  objc_destroyWeak((id *)buf);
}

- (void)_removeSyncVehicle:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100476468;
    block[3] = &unk_1012E5D08;
    id v10 = v4;
    dispatch_async(queue, block);
    v7 = v10;
  }
  else
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [0 identifier];
      *(_DWORD *)buf = 138412290;
      objc_super v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Vehicle: %@ not found in MapsSync storage. Ignoring the call.", buf, 0xCu);
    }
  }
}

- (void)saveVehicle:(id)a3 syncAcrossDevices:(BOOL)a4
{
  id v6 = a3;
  v7 = GEOFindOrCreateLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Trying to save vehicle: %@", buf, 0xCu);
    }

    id v9 = [v6 copy];
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100476864;
    v11[3] = &unk_1012E6690;
    objc_copyWeak(&v13, (id *)buf);
    id v6 = v9;
    id v12 = v6;
    dispatch_async(queue, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Persister won't save vehicle, as we don't want it to sync: %@", buf, 0xCu);
    }
  }
}

- (id)persistedVehicleForVehicle:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_lastPersistedVehicles;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 identifier:v14];
        id v11 = [v4 identifier];
        unsigned __int8 v12 = [v10 isEqual:v11];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setSelectedVehicleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"VGVirtualGarageSelectedVehicleStorageKey"];
}

- (NSString)selectedVehicleIdentifier
{
  v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 objectForKey:@"VGVirtualGarageSelectedVehicleStorageKey"];

  return (NSString *)v3;
}

- (void)_addOrEditVehicle:(id)a3
{
  id v4 = a3;
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Trying to add or edit vehicle: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v4);
  id v6 = [v4 identifier];
  long long v17 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v17 count:1];
  BOOL v8 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"vehicleIdentifier == %@" argumentArray:v7];

  id v9 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v8 sortDescriptors:0 range:0];
  id v10 = objc_alloc_init((Class)MSVehicleRequest);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100476D4C;
  v12[3] = &unk_1012EB6E0;
  objc_copyWeak(&v14, (id *)buf);
  objc_copyWeak(&v15, &location);
  id v11 = v4;
  id v13 = v11;
  [v10 fetchWithOptions:v9 completionHandler:v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

- (id)_processUpdatedSyncVehicles:(id)a3
{
  id v4 = a3;
  id v17 = (id)objc_opt_new();
  id v5 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        unsigned __int8 v12 = [v11 vehicleIdentifier];
        if (v12 && ([v5 containsObject:v12] & 1) == 0)
        {
          [v5 addObject:v12];
          id v14 = [objc_alloc((Class)VGVehicle) initWithMapsSyncVehicle:v11];
          [v17 addObject:v14];
        }
        else
        {
          id v13 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Discard duplicate vehicle: %@", buf, 0xCu);
          }

          [(VirtualGaragePersister *)self _removeSyncVehicle:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  id v15 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Loaded vehicles: %@", buf, 0xCu);
  }

  return v17;
}

- (void)storeDidChangeWithTypes:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100477C80;
  v5[3] = &unk_1012E6E78;
  objc_copyWeak(&v6, &location);
  [(VirtualGaragePersister *)self loadVehiclesWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (VGVirtualGaragePersistingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VGVirtualGaragePersistingDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastPersistedVehicles, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end