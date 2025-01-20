@interface NTKDCollectionCoordinator
+ (id)sharedInstance;
+ (void)runCollectionServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NTKDCollectionCoordinator)init;
- (void)_onCalloutQueue_async:(id)a3;
- (void)_onQueue_async:(id)a3;
- (void)_queue_addCheckoutHandler:(id)a3 forStoreKey:(id)a4;
- (void)_queue_curateStore:(id)a3 withCompletion:(id)a4;
- (void)_queue_invokeCheckoutHandlersForStoreKey:(id)a3 withStore:(id)a4;
- (void)_queue_notifyObserversStoreCreated:(id)a3;
- (void)addCollectionLifecycleObserver:(id)a3;
- (void)checkoutStore:(id)a3;
- (void)checkoutStoreForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withHandler:(id)a5;
- (void)enumerateAllStoresIncludingUnpaired:(BOOL)a3 withHandler:(id)a4;
- (void)enumerateAllStoresWithHandler:(id)a3;
- (void)registerCurator:(id)a3 forCollectionIdentifier:(id)a4;
- (void)relinquishStore:(id)a3;
- (void)removeCollectionLifecycleObserver:(id)a3;
- (void)removeOrphanedResourceDirectories;
- (void)resetStoreDefaults:(id)a3;
@end

@implementation NTKDCollectionCoordinator

+ (void)runCollectionServer
{
  if (qword_1000722D0 != -1) {
    dispatch_once(&qword_1000722D0, &stru_100060B98);
  }
}

+ (id)sharedInstance
{
  if (qword_1000722E0 != -1) {
    dispatch_once(&qword_1000722E0, &stru_100060BB8);
  }
  v2 = (void *)qword_1000722D8;
  return v2;
}

- (NTKDCollectionCoordinator)init
{
  v23.receiver = self;
  v23.super_class = (Class)NTKDCollectionCoordinator;
  v2 = [(NTKDCollectionCoordinator *)&v23 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntkd.collectioncoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ntkd.collectioncoordinator.xpcIncomingMessageQueue", v5);
    xpcIncomingMessageQueue = v2->_xpcIncomingMessageQueue;
    v2->_xpcIncomingMessageQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.ntkd.collectioncoordinator.callouts", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    curatedStores = v2->_curatedStores;
    v2->_curatedStores = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    storesBeingCurated = v2->_storesBeingCurated;
    v2->_storesBeingCurated = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    checkoutHandlersByStoreKey = v2->_checkoutHandlersByStoreKey;
    v2->_checkoutHandlersByStoreKey = v16;

    uint64_t v18 = +[NSHashTable weakObjectsHashTable];
    collectionLifecycleObservers = v2->_collectionLifecycleObservers;
    v2->_collectionLifecycleObservers = (NSHashTable *)v18;

    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    curatorsByCollectionIdentifier = v2->_curatorsByCollectionIdentifier;
    v2->_curatorsByCollectionIdentifier = v20;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100007328;
  v9[3] = &unk_100060AB8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

- (void)checkoutStoreForCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000756C;
  v11[3] = &unk_100060B08;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [(NTKDCollectionCoordinator *)self _onQueue_async:v11];
}

- (void)checkoutStore:(id)a3
{
  id v3 = a3;
  v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "checked out store %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)relinquishStore:(id)a3
{
  id v3 = a3;
  v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "relinquished store %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)enumerateAllStoresWithHandler:(id)a3
{
}

- (void)enumerateAllStoresIncludingUnpaired:(BOOL)a3 withHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[NSMutableSet set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = +[NRPairedDeviceRegistry sharedInstance];
  id v9 = [v8 getAllDevices];

  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    uint64_t v13 = NRDevicePropertyPairingID;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v14) valueForProperty:v13];
        if (v15) {
          [v7 addObject:v15];
        }

        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100007D38;
  v18[3] = &unk_100060CA8;
  BOOL v22 = a3;
  id v19 = v7;
  v20 = self;
  id v21 = v6;
  id v16 = v6;
  id v17 = v7;
  +[NTKDCollectionStore enumerateStoreIdentifiersWithBlock:v18];
}

- (void)addCollectionLifecycleObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007FCC;
  v4[3] = &unk_100060AB8;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionCoordinator *)v5 _onQueue_async:v4];
}

- (void)removeCollectionLifecycleObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000081C4;
  v7[3] = &unk_100060AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)resetStoreDefaults:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008264;
  v4[3] = &unk_100060AB8;
  int v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDCollectionCoordinator *)v5 _onQueue_async:v4];
}

- (void)registerCurator:(id)a3 forCollectionIdentifier:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000083B4;
  v7[3] = &unk_100060C58;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(NTKDCollectionCoordinator *)v8 _onQueue_async:v7];
}

- (void)removeOrphanedResourceDirectories
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "checking for orphaned resource directories", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000868C;
  v24[3] = &unk_100060CF8;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  id v25 = v4;
  +[NTKDCollectionStore enumerateStoreIdentifiersWithBlock:v24];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000086F0;
  v21[3] = &unk_100060D60;
  id v16 = v4;
  id v22 = v16;
  long long v23 = self;
  id v5 = objc_retainBlock(v21);
  uint64_t v6 = NTKCollectionIdentifierPhotosFaces;
  ((void (*)(void *, void, void))v5[2])(v5, NTKCollectionIdentifierPhotosFaces, 0);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = +[NRPairedDeviceRegistry sharedInstance];
  id v8 = [v7 getPairedDevices];

  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    uint64_t v12 = NRDevicePropertyPairingID;
    uint64_t v13 = NTKCollectionIdentifierLibraryFaces;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) valueForProperty:v12];
        ((void (*)(void *, uint64_t, void *))v5[2])(v5, v13, v15);
        ((void (*)(void *, uint64_t, void *))v5[2])(v5, v6, v15);

        v14 = (char *)v14 + 1;
      }
      while (v10 != v14);
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectioncoordinator.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000884C;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_onCalloutQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.collectioncoordinator.callout");
  calloutQueue = self->_calloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008930;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, block);
}

- (void)_queue_addCheckoutHandler:(id)a3 forStoreKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_checkoutHandlersByStoreKey objectForKey:v6];
  if (!v7)
  {
    id v7 = objc_alloc_init((Class)NSMutableArray);
    [(NSMutableDictionary *)self->_checkoutHandlersByStoreKey setObject:v7 forKey:v6];
  }
  id v8 = [v10 copy];
  id v9 = objc_retainBlock(v8);
  [v7 addObject:v9];
}

- (void)_queue_notifyObserversStoreCreated:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_collectionLifecycleObservers;
  id v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100008BA0;
        v11[3] = &unk_100060AB8;
        void v11[4] = v10;
        id v12 = v4;
        [(NTKDCollectionCoordinator *)self _onCalloutQueue_async:v11];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)_queue_invokeCheckoutHandlersForStoreKey:(id)a3 withStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_checkoutHandlersByStoreKey objectForKey:v6];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) + 16))();
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
  [(NSMutableDictionary *)self->_checkoutHandlersByStoreKey removeObjectForKey:v6];
}

- (void)_queue_curateStore:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  uint64_t v8 = [v6 collectionIdentifier];
  id v9 = [(NSMutableDictionary *)self->_curatorsByCollectionIdentifier objectForKey:v8];
  if (v9)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008E98;
    v11[3] = &unk_100060DB0;
    id v12 = v6;
    id v13 = v8;
    id v14 = v9;
    long long v15 = self;
    long long v16 = v7;
    [(NTKDCollectionCoordinator *)self _onCalloutQueue_async:v11];
  }
  else
  {
    id v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "no curator for store %@", buf, 0xCu);
    }

    [v6 markInitialSetupComplete];
    v7[2](v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_xpcIncomingMessageQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collectionLifecycleObservers, 0);
  objc_storeStrong((id *)&self->_curatorsByCollectionIdentifier, 0);
  objc_storeStrong((id *)&self->_checkoutHandlersByStoreKey, 0);
  objc_storeStrong((id *)&self->_storesBeingCurated, 0);
  objc_storeStrong((id *)&self->_curatedStores, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end