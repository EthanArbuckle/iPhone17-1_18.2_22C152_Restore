@interface NTKDComplicationStoreCoordinator
+ (id)sharedInstance;
+ (void)runComplicationStoreServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NTKDComplicationStoreCoordinator)init;
- (void)_onCalloutQueue_async:(id)a3;
- (void)_onQueue_async:(id)a3;
- (void)_queue_notifyObserversStoreCreated:(id)a3;
- (void)addComplicationCollectionLifecycleObserver:(id)a3;
- (void)checkoutStoreForComplicationCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withHandler:(id)a5;
- (void)removeComplicationCollectionLifecycleObserver:(id)a3;
@end

@implementation NTKDComplicationStoreCoordinator

+ (void)runComplicationStoreServer
{
  if (qword_1000723E0 != -1) {
    dispatch_once(&qword_1000723E0, &stru_100061CD0);
  }
}

+ (id)sharedInstance
{
  if (qword_1000723F0 != -1) {
    dispatch_once(&qword_1000723F0, &stru_100061CF0);
  }
  v2 = (void *)qword_1000723E8;

  return v2;
}

- (NTKDComplicationStoreCoordinator)init
{
  v16.receiver = self;
  v16.super_class = (Class)NTKDComplicationStoreCoordinator;
  v2 = [(NTKDComplicationStoreCoordinator *)&v16 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ntkd.complicationcollectioncoordinator", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.ntkd.complicationcollectioncoordinator.callouts", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    clients = v2->_clients;
    v2->_clients = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    stores = v2->_stores;
    v2->_stores = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    checkoutHandlersByStoreKey = v2->_checkoutHandlersByStoreKey;
    v2->_checkoutHandlersByStoreKey = v11;

    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    collectionLifecycleObservers = v2->_collectionLifecycleObservers;
    v2->_collectionLifecycleObservers = (NSHashTable *)v13;
  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100025E40;
  v9[3] = &unk_100060AB8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

- (void)checkoutStoreForComplicationCollectionIdentifier:(id)a3 deviceUUID:(id)a4 withHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026078;
  v11[3] = &unk_100060B08;
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [(NTKDComplicationStoreCoordinator *)self _onQueue_async:v11];
}

- (void)addComplicationCollectionLifecycleObserver:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002630C;
  v4[3] = &unk_100060AB8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(NTKDComplicationStoreCoordinator *)v5 _onQueue_async:v4];
}

- (void)removeComplicationCollectionLifecycleObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100026504;
  v7[3] = &unk_100060AB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)_onQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationcollectioncoordinator.busy");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000265B8;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);
}

- (void)_onCalloutQueue_async:(id)a3
{
  id v4 = a3;
  sub_10000B610(@"com.apple.ntkd.complicationcollectioncoordinator.callout");
  calloutQueue = self->_calloutQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002669C;
  block[3] = &unk_100060B30;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, block);
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
        v11[2] = sub_10002684C;
        v11[3] = &unk_100060AB8;
        void v11[4] = v10;
        id v12 = v4;
        [(NTKDComplicationStoreCoordinator *)self _onCalloutQueue_async:v11];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_collectionLifecycleObservers, 0);
  objc_storeStrong((id *)&self->_checkoutHandlersByStoreKey, 0);
  objc_storeStrong((id *)&self->_stores, 0);

  objc_storeStrong((id *)&self->_clients, 0);
}

@end