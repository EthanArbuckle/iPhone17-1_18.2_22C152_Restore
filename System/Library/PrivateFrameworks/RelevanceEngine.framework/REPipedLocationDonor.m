@interface REPipedLocationDonor
+ (id)_locationFromDefaults;
+ (void)_locationFromDefaults;
+ (void)_saveLocationIntoDefaultsWithLocation:(id)a3;
- (CLLocation)location;
- (id)_init;
- (void)_handleInvalidation;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)updateLocation:(id)a3;
@end

@implementation REPipedLocationDonor

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)REPipedLocationDonor;
  v2 = [(RESingleton *)&v13 _init];
  if (v2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"com.apple.relevanced.pipedlocationdonor.%p", v2);
    id v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create((const char *)[v3 UTF8String], 0);
    v5 = (void *)v2[3];
    v2[3] = v4;

    id v6 = objc_alloc_init(MEMORY[0x263F08958]);
    v7 = (void *)v2[5];
    v2[5] = v6;

    v8 = objc_alloc_init(REObserverStore);
    v9 = (void *)v2[1];
    v2[1] = v8;

    uint64_t v10 = [(id)objc_opt_class() _locationFromDefaults];
    v11 = (void *)v2[4];
    v2[4] = v10;
  }
  return v2;
}

- (void)setConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__REPipedLocationDonor_setConnection___block_invoke;
  v7[3] = &unk_2644BC688;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __38__REPipedLocationDonor_setConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  if (v3)
  {
    *(void *)(v2 + 16) = 0;
    id v4 = v3;

    [v4 setInvalidationHandler:0];
    [v4 setExportedObject:0];
    [v4 invalidate];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_storeStrong((id *)(v2 + 16), *(id *)(a1 + 40));
  v5 = *(void **)(*(void *)(a1 + 32) + 16);
  id v6 = REPipedLocationDonorInterface();
  [v5 setRemoteObjectInterface:v6];

  v7 = *(void **)(*(void *)(a1 + 32) + 16);
  id v8 = REPipedLocationReceiverInterface();
  [v7 setExportedInterface:v8];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "setExportedObject:");
  objc_initWeak(&location, *(id *)(a1 + 32));
  v9 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __38__REPipedLocationDonor_setConnection___block_invoke_2;
  objc_super v13 = &unk_2644BC638;
  objc_copyWeak(&v14, &location);
  [v9 setInvalidationHandler:&v10];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "resume", v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __38__REPipedLocationDonor_setConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)updateLocation:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = RELogForDomain(5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 description];
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = [v7 UTF8String];
    _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "REPipedLocationDonor updated location to %s", buf, 0xCu);
  }
  [(NSLock *)self->_locationAccessLock lock];
  objc_storeStrong((id *)&self->_location, a3);
  [(NSLock *)self->_locationAccessLock unlock];
  [(id)objc_opt_class() _saveLocationIntoDefaultsWithLocation:v5];
  observers = self->_observers;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__REPipedLocationDonor_updateLocation___block_invoke;
  v10[3] = &unk_2644C0220;
  id v11 = v5;
  id v9 = v5;
  [(REObserverStore *)observers enumerateObserversWithBlock:v10];
}

uint64_t __39__REPipedLocationDonor_updateLocation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 locationDidUpdate:*(void *)(a1 + 32)];
}

- (CLLocation)location
{
  [(NSLock *)self->_locationAccessLock lock];
  id v3 = self->_location;
  [(NSLock *)self->_locationAccessLock unlock];
  return v3;
}

- (void)_handleInvalidation
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__REPipedLocationDonor__handleInvalidation__block_invoke;
  block[3] = &unk_2644BC660;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__REPipedLocationDonor__handleInvalidation__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

+ (id)_locationFromDefaults
{
  uint64_t v2 = (void *)CFPreferencesCopyAppValue(@"LastPipedLocation", @"com.apple.RelevanceEngine");
  if (v2)
  {
    id v7 = 0;
    id v3 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:&v7];
    id v4 = v7;
    if (!v3)
    {
      id v5 = RELogForDomain(5);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[REPipedLocationDonor _locationFromDefaults];
      }
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (void)_saveLocationIntoDefaultsWithLocation:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = 0;
    goto LABEL_6;
  }
  id v4 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];
  if (v4)
  {
LABEL_6:
    CFPreferencesSetAppValue(@"LastPipedLocation", v4, @"com.apple.RelevanceEngine");
    goto LABEL_7;
  }
  id v4 = RELogForDomain(5);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[REPipedLocationDonor _saveLocationIntoDefaultsWithLocation:]((uint64_t)v3, v4);
  }
LABEL_7:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAccessLock, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

+ (void)_locationFromDefaults
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "REPipedLocationDonor: Failed to decode last location with error: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_saveLocationIntoDefaultsWithLocation:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "REPipedLocationDonor: Failed to serialize location: %@", (uint8_t *)&v2, 0xCu);
}

@end