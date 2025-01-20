@interface NHSSRelevantWidgetDefaults
+ (NHSSRelevantWidgetDefaults)sharedInstance;
- (NHSSRelevantWidgetDefaults)init;
- (NSArray)relevantWidgets;
- (void)_mainQueue_notifyObserversDefaultsDidChange;
- (void)_observeChangesToRelevantWidgetDefaults;
- (void)addObserver:(id)a3;
- (void)relevantWidgetDefaultsDidChange;
- (void)relevantWidgets;
- (void)removeObserver:(id)a3;
- (void)setRelevantWidgets:(id)a3;
@end

@implementation NHSSRelevantWidgetDefaults

+ (NHSSRelevantWidgetDefaults)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return (NHSSRelevantWidgetDefaults *)v2;
}

uint64_t __44__NHSSRelevantWidgetDefaults_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = objc_alloc_init(NHSSRelevantWidgetDefaults);
  return MEMORY[0x270F9A758]();
}

- (NHSSRelevantWidgetDefaults)init
{
  v10.receiver = self;
  v10.super_class = (Class)NHSSRelevantWidgetDefaults;
  v2 = [(NHSSRelevantWidgetDefaults *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    lock_observers = v3->_lock_observers;
    v3->_lock_observers = (NSHashTable *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.NanoHomeScreen.RelevantWidgetDefaults.syncQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    [(NHSSRelevantWidgetDefaults *)v3 _observeChangesToRelevantWidgetDefaults];
  }
  return v3;
}

- (NSArray)relevantWidgets
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoHomeScreen.RelevantWidgetDefaults"];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 objectForKey:@"relevantWidgets"];
    id v16 = 0;
    v5 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v4 error:&v16];
    id v6 = v16;
    [v5 setDecodingFailurePolicy:1];
    dispatch_queue_t v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    objc_super v10 = [v5 decodeObjectOfClasses:v9 forKey:*MEMORY[0x263F081D0]];
    v11 = v10;
    if (v6)
    {
      v12 = NHSSLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        [(NHSSRelevantWidgetDefaults *)(uint64_t)v6 relevantWidgets];
      }
    }
    else
    {
      if (v10)
      {
        id v13 = v10;
        goto LABEL_11;
      }
      v12 = NHSSLogDefault();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_257329000, v12, OS_LOG_TYPE_DEFAULT, "NHSSRelevantWidgetDefaults: Decoded nil object when expecting array. Returning empty array as fallback.", buf, 2u);
      }
    }

    id v13 = (id)MEMORY[0x263EFFA68];
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v4 = NHSSLogDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[NHSSRelevantWidgetDefaults relevantWidgets](v4);
  }
  id v13 = (id)MEMORY[0x263EFFA68];
LABEL_12:

  return (NSArray *)v13;
}

- (void)setRelevantWidgets:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke;
  v7[3] = &unk_265427BA8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F57520]) initWithDomain:@"com.apple.NanoHomeScreen.RelevantWidgetDefaults"];
  if (v2)
  {
    id v4 = (uint64_t *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 32);
    id v15 = 0;
    v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v15];
    id v6 = v15;
    if (!v6)
    {
      if ((unint64_t)[v5 length] <= 0x3D090)
      {
        [v2 setObject:v5 forKey:@"relevantWidgets"];
        id v9 = (id)[v2 synchronize];
        id v8 = objc_alloc_init(MEMORY[0x263F57528]);
        objc_super v10 = [MEMORY[0x263EFFA08] setWithObject:@"relevantWidgets"];
        [v8 synchronizeNanoDomain:@"com.apple.NanoHomeScreen.RelevantWidgetDefaults" keys:v10];
        [*(id *)(a1 + 40) relevantWidgetDefaultsDidChange];
      }
      else
      {
        dispatch_queue_t v7 = NHSSLogDefault();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_cold_2(v5, v4, v7);
        }

        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_16;
        v11[3] = &unk_265427B80;
        id v12 = v5;
        uint64_t v14 = 250000;
        id v13 = (id)*v4;
        if (_NHSSRelevantWidgetDefaultsChangedNotificationName_block_invoke_onceToken != -1) {
          dispatch_once(&_NHSSRelevantWidgetDefaultsChangedNotificationName_block_invoke_onceToken, v11);
        }

        id v8 = v12;
      }
    }
  }
  else
  {
    id v6 = NHSSLogDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_cold_1(v6);
    }
  }
}

void __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_16(uint64_t a1)
{
  v2 = NHSSLogDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
    __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_16_cold_1(a1, v2);
  }
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_observeChangesToRelevantWidgetDefaults
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_NHSSRelevantWidgetDefaultsChangeHandler, @"com.apple.NanoHomeScreen.RelevantWidgetDefaultsChanged", self, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)relevantWidgetDefaultsDidChange
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__NHSSRelevantWidgetDefaults_relevantWidgetDefaultsDidChange__block_invoke;
  block[3] = &unk_265427B08;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__NHSSRelevantWidgetDefaults_relevantWidgetDefaultsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_notifyObserversDefaultsDidChange");
}

- (void)_mainQueue_notifyObserversDefaultsDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSHashTable *)self->_lock_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "relevantWidgetDefaultsDidChange", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)relevantWidgets
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_257329000, a2, OS_LOG_TYPE_ERROR, "NHSSRelevantWidgetDefaults: Decoding error, returning empty array as fallback. Error: %@", (uint8_t *)&v2, 0xCu);
}

void __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_257329000, log, OS_LOG_TYPE_ERROR, "NHSSRelevantWidgetDefaults: Unable to set relevantWidgets, gizmo must be paired and active", v1, 2u);
}

void __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_cold_2(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 length];
  uint64_t v6 = *a2;
  int v7 = 134218498;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = 250000;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_257329000, a3, OS_LOG_TYPE_ERROR, "NHSSRelevantWidgetDefaults: Data is %ld bytes, which is over threshold of %ld bytes. This shouldn't happen. relevantWidgets: %@", (uint8_t *)&v7, 0x20u);
}

void __49__NHSSRelevantWidgetDefaults_setRelevantWidgets___block_invoke_16_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(a1 + 32) length];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  int v7 = 134218498;
  uint64_t v8 = v4;
  __int16 v9 = 2048;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_fault_impl(&dword_257329000, a2, OS_LOG_TYPE_FAULT, "NHSSRelevantWidgetDefaults: Data is %ld bytes, which is over threshold of %ld bytes. This shouldn't happen. relevantWidgets: %@", (uint8_t *)&v7, 0x20u);
}

@end