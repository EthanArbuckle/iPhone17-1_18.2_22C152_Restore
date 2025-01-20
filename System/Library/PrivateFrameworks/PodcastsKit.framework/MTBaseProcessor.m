@interface MTBaseProcessor
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)isRunning;
- (BOOL)isStopping;
- (BOOL)start;
- (MTBaseProcessor)init;
- (MTBaseQueryObserver)queryObserver;
- (MTDefaultsChangeNotifier)defaultsNotifier;
- (NSObject)isStoppingLock;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)timer;
- (double)updatePredicateDuration;
- (id)createQueryObserver;
- (id)defaultPropertiesThatAffectPredicate;
- (id)entityName;
- (id)predicate;
- (void)enqueueWorkBlock:(id)a3;
- (void)results:(id)a3;
- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5;
- (void)setDefaultsNotifier:(id)a3;
- (void)setIsStopping:(BOOL)a3;
- (void)setIsStoppingLock:(id)a3;
- (void)setQueryObserver:(id)a3;
- (void)setTimer:(id)a3;
- (void)stop;
- (void)updatePredicate;
@end

@implementation MTBaseProcessor

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_0);
  }
}

uint64_t __29__MTBaseProcessor_initialize__block_invoke()
{
  _instanceMap = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);
  return MEMORY[0x270F9A758]();
}

+ (id)sharedInstance
{
  v3 = NSStringFromClass((Class)a1);
  id v4 = (id)_instanceMap;
  objc_sync_enter(v4);
  v5 = [(id)_instanceMap objectForKey:v3];
  objc_sync_exit(v4);

  if (!v5)
  {
    id v6 = (id)_instanceMap;
    objc_sync_enter(v6);
    v5 = [(id)_instanceMap objectForKey:v3];
    if (!v5)
    {
      v8.receiver = a1;
      v8.super_class = (Class)&OBJC_METACLASS___MTBaseProcessor;
      v5 = objc_msgSend(objc_msgSendSuper2(&v8, sel_allocWithZone_, 0), "init");
      [(id)_instanceMap setObject:v5 forKey:v3];
    }
    objc_sync_exit(v6);
  }
  return v5;
}

- (MTBaseProcessor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTBaseProcessor;
  v2 = [(MTBaseProcessor *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    isStoppingLock = v2->_isStoppingLock;
    v2->_isStoppingLock = v3;

    v2->_isStopping = 0;
  }
  return v2;
}

- (BOOL)start
{
  BOOL v3 = [(MTBaseProcessor *)self isStopping];
  if (!v3)
  {
    id v4 = NSString;
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    v7 = [v4 stringWithFormat:@"%@SerialQueue", v6];

    id v8 = v7;
    v9 = (OS_dispatch_queue *)dispatch_queue_create((const char *)[v8 UTF8String], 0);
    workQueue = self->_workQueue;
    self->_workQueue = v9;

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __24__MTBaseProcessor_start__block_invoke;
    v12[3] = &unk_2650556A8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    [(MTBaseProcessor *)self enqueueWorkBlock:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return !v3;
}

void __24__MTBaseProcessor_start__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  BOOL v3 = [v2 createQueryObserver];
  [v2 setQueryObserver:v3];

  id v4 = [v2 queryObserver];
  [v4 startObserving];

  [v2 updatePredicateDuration];
  double v6 = v5;
  if (fabs(v5) > 2.22044605e-16)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [WeakRetained workQueue];
    dispatch_source_t v9 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);
    [v2 setTimer:v9];

    dispatch_time_t v10 = dispatch_walltime(0, 0);
    v11 = [v2 timer];
    dispatch_source_set_timer(v11, v10, (unint64_t)(v6 * 1000000000.0), 0);

    v12 = [v2 timer];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __24__MTBaseProcessor_start__block_invoke_2;
    handler[3] = &unk_265055658;
    objc_copyWeak(&v26, (id *)(a1 + 40));
    dispatch_source_set_event_handler(v12, handler);

    id v13 = [v2 timer];
    dispatch_resume(v13);

    objc_destroyWeak(&v26);
  }
  v14 = [v2 defaultPropertiesThatAffectPredicate];
  if ([v14 count])
  {
    v15 = [MTDefaultsChangeNotifier alloc];
    v16 = [MEMORY[0x263EFFA40] _applePodcastsFoundationSettingsUserDefaults];
    v17 = [(MTDefaultsChangeNotifier *)v15 initWithProperties:v14 defaults:v16];
    [v2 setDefaultsNotifier:v17];

    v18 = [v2 defaultsNotifier];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __24__MTBaseProcessor_start__block_invoke_3;
    v23 = &unk_265055680;
    objc_copyWeak(&v24, (id *)(a1 + 40));
    [v18 addCallback:&v20];

    v19 = objc_msgSend(v2, "defaultsNotifier", v20, v21, v22, v23);
    [v19 start];

    objc_destroyWeak(&v24);
  }
}

void __24__MTBaseProcessor_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePredicate];
}

void __24__MTBaseProcessor_start__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __24__MTBaseProcessor_start__block_invoke_4;
  v12[3] = &unk_265055658;
  objc_copyWeak(&v13, v10);
  [WeakRetained enqueueWorkBlock:v12];

  objc_destroyWeak(&v13);
}

void __24__MTBaseProcessor_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updatePredicate];
}

- (void)stop
{
  [(MTBaseProcessor *)self setIsStopping:1];
  BOOL v3 = [(MTBaseProcessor *)self queryObserver];
  [v3 stop];

  id v4 = [(MTBaseProcessor *)self defaultsNotifier];
  [v4 stop];
}

- (BOOL)isStopping
{
  id v2 = self;
  BOOL v3 = [(MTBaseProcessor *)self isStoppingLock];
  objc_sync_enter(v3);
  LOBYTE(v2) = v2->_isStopping;
  objc_sync_exit(v3);

  return (char)v2;
}

- (void)setIsStopping:(BOOL)a3
{
  id obj = [(MTBaseProcessor *)self isStoppingLock];
  objc_sync_enter(obj);
  self->_isStopping = a3;
  objc_sync_exit(obj);
}

- (BOOL)isRunning
{
  if (self->_workQueue) {
    return ![(MTBaseProcessor *)self isStopping];
  }
  else {
    return 0;
  }
}

- (id)createQueryObserver
{
  BOOL v3 = [MTSafeUuidQueryObserver alloc];
  id v4 = [(MTBaseProcessor *)self entityName];
  double v5 = [(MTBaseProcessor *)self predicate];
  double v6 = [(MTBaseQueryObserver *)v3 initWithEntityName:v4 predicate:v5];

  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__MTBaseProcessor_createQueryObserver__block_invoke;
  v9[3] = &unk_2650556D0;
  objc_copyWeak(&v10, &location);
  id v7 = [(MTSafeUuidQueryObserver *)v6 addResultsChangedHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

void __38__MTBaseProcessor_createQueryObserver__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__MTBaseProcessor_createQueryObserver__block_invoke_2;
  v15[3] = &unk_265055520;
  objc_copyWeak(&v19, v10);
  id v12 = v7;
  id v16 = v12;
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  [WeakRetained enqueueWorkBlock:v15];

  objc_destroyWeak(&v19);
}

void __38__MTBaseProcessor_createQueryObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained resultsChangedWithDeletedIds:*(void *)(a1 + 32) insertIds:*(void *)(a1 + 40) updatedIds:*(void *)(a1 + 48)];
}

- (void)updatePredicate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = _MTLogCategoryDefault();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl(&dword_23F08F000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ updated predicate", (uint8_t *)&v8, 0xCu);
  }
  double v6 = [(MTBaseProcessor *)self queryObserver];
  id v7 = [(MTBaseProcessor *)self predicate];
  [v6 setPredicate:v7];
}

- (double)updatePredicateDuration
{
  return 0.0;
}

- (id)entityName
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"entityName must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (id)predicate
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"Predicate must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v2);
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"resulstChanged must be implemented by subclasses" userInfo:0];
  objc_exception_throw(v10);
}

- (void)results:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseProcessor *)self queryObserver];
  [v5 results:v4];
}

- (id)defaultPropertiesThatAffectPredicate
{
  return 0;
}

- (void)enqueueWorkBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(MTBaseProcessor *)self workQueue];

  if (v5)
  {
    if (![(MTBaseProcessor *)self isStopping])
    {
      objc_initWeak(buf, self);
      id v8 = [(MTBaseProcessor *)self workQueue];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __36__MTBaseProcessor_enqueueWorkBlock___block_invoke;
      v9[3] = &unk_2650556F8;
      objc_copyWeak(&v11, buf);
      id v10 = v4;
      dispatch_async(v8, v9);

      objc_destroyWeak(&v11);
      objc_destroyWeak(buf);
      goto LABEL_10;
    }
    double v6 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v7 = "Attempting to enqueue work after the processor has stopped.";
LABEL_7:
      _os_log_impl(&dword_23F08F000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
    }
  }
  else
  {
    double v6 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      id v7 = "Attempting to enqueue work before processor has been started.";
      goto LABEL_7;
    }
  }

LABEL_10:
}

void __36__MTBaseProcessor_enqueueWorkBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (![WeakRetained isStopping])
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      goto LABEL_10;
    }
    id v4 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = 0;
      id v5 = "Attempting to execute work after the processor has stopped.";
      double v6 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl(&dword_23F08F000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else
  {
    id v4 = _MTLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v5 = "Attempting to execute work after the processor has been deallocated.";
      double v6 = buf;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (MTBaseQueryObserver)queryObserver
{
  return self->_queryObserver;
}

- (void)setQueryObserver:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MTDefaultsChangeNotifier)defaultsNotifier
{
  return self->_defaultsNotifier;
}

- (void)setDefaultsNotifier:(id)a3
{
}

- (NSObject)isStoppingLock
{
  return self->_isStoppingLock;
}

- (void)setIsStoppingLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isStoppingLock, 0);
  objc_storeStrong((id *)&self->_defaultsNotifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_queryObserver, 0);
}

@end