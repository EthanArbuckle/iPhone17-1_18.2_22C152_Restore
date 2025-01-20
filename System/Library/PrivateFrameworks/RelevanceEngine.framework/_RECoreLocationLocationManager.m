@interface _RECoreLocationLocationManager
- (_RECoreLocationLocationManager)initWithEffectiveBundlePath:(id)a3;
- (id)currentLocation;
- (void)_notifyUpdateHandlersWithError:(id)a3;
- (void)_updateLocation:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)startLocationUpdatesWithHandler:(id)a3;
- (void)stopLocationUpdates;
@end

@implementation _RECoreLocationLocationManager

- (_RECoreLocationLocationManager)initWithEffectiveBundlePath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_RECoreLocationLocationManager;
  id v5 = [(_RECoreLocationLocationManager *)&v16 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.relevanceengine.corelocationmanager", 0);
    v7 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v6;

    dispatch_suspend(*((dispatch_object_t *)v5 + 5));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __62___RECoreLocationLocationManager_initWithEffectiveBundlePath___block_invoke;
    v13[3] = &unk_2644BC688;
    id v14 = v4;
    v8 = v5;
    id v15 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v13);
    id v9 = objc_alloc_init(MEMORY[0x263F08958]);
    v10 = (void *)v8[2];
    v8[2] = v9;

    v11 = RELogForDomain(5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_21E6E6000, v11, OS_LOG_TYPE_DEFAULT, "_RECoreLocationLocationManager initialized. %@", buf, 0xCu);
    }
  }
  return (_RECoreLocationLocationManager *)v5;
}

- (void)dealloc
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__15;
  v5[4] = __Block_byref_object_dispose__15;
  dispatch_queue_t v6 = self->_locationManager;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41___RECoreLocationLocationManager_dealloc__block_invoke;
  block[3] = &unk_2644BC768;
  block[4] = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  _Block_object_dispose(v5, 8);

  v3.receiver = self;
  v3.super_class = (Class)_RECoreLocationLocationManager;
  [(_RECoreLocationLocationManager *)&v3 dealloc];
}

- (id)currentLocation
{
  [(NSLock *)self->_locationAccessLock lock];
  objc_super v3 = self->_currentLocation;
  [(NSLock *)self->_locationAccessLock unlock];
  return v3;
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke;
  block[3] = &unk_2644BC5E8;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_async(queue, block);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __66___RECoreLocationLocationManager_startLocationUpdatesWithHandler___block_invoke_29;
  v8[3] = &unk_2644BCCD0;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

- (void)stopLocationUpdates
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53___RECoreLocationLocationManager_stopLocationUpdates__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69___RECoreLocationLocationManager_locationManager_didUpdateLocations___block_invoke;
  v8[3] = &unk_2644BC688;
  id v9 = v5;
  v10 = self;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __67___RECoreLocationLocationManager_locationManager_didFailWithError___block_invoke;
  v8[3] = &unk_2644BC688;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_updateLocation:(id)a3
{
  id v4 = (CLLocation *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSLock *)self->_locationAccessLock lock];
  currentLocation = self->_currentLocation;
  self->_currentLocation = v4;
  id v6 = v4;

  [(NSLock *)self->_locationAccessLock unlock];
}

- (void)_notifyUpdateHandlersWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = (void *)MEMORY[0x223C31700](self->_handler);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65___RECoreLocationLocationManager__notifyUpdateHandlersWithError___block_invoke;
  block[3] = &unk_2644BEBB0;
  id v9 = v4;
  id v10 = v5;
  block[4] = self;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_locationAccessLock, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
}

@end