@interface REHealthStore
- (BOOL)_isClockHostApp;
- (id)_createStore;
- (id)_init;
- (void)accessHealthStore:(id)a3;
@end

@implementation REHealthStore

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)REHealthStore;
  v2 = [(RESingleton *)&v8 _init];
  if (v2)
  {
    if (HealthKitLibraryCore_1())
    {
      uint64_t v3 = [v2 _createStore];
      v4 = (void *)v2[1];
      v2[1] = v3;
    }
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.RelevanceEngine.REHealthStore", 0);
    v6 = (void *)v2[2];
    v2[2] = v5;
  }
  return v2;
}

- (id)_createStore
{
  if ([(REHealthStore *)self _isClockHostApp] && FitnessUILibraryCore())
  {
    if (!FitnessUILibraryCore())
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
    objc_msgSend(getHKHealthStoreClass(), "fiui_sharedHealthStoreForCarousel");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = objc_alloc_init((Class)getHKHealthStoreClass());
  }
  return v2;
}

- (BOOL)_isClockHostApp
{
  return 0;
}

- (void)accessHealthStore:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __35__REHealthStore_accessHealthStore___block_invoke;
    v7[3] = &unk_2644BCCD0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

uint64_t __35__REHealthStore_accessHealthStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end