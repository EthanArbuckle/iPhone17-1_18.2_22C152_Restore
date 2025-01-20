@interface WFResource
+ (BOOL)alwaysMakeAvailable;
+ (BOOL)isSingleton;
+ (BOOL)mustBeAvailableForDisplay;
+ (BOOL)refreshesAvailabilityOnApplicationResume;
+ (id)sharedInstance;
- (BOOL)_isAvailable;
- (BOOL)isAvailable;
- (BOOL)shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:(BOOL)a3;
- (BOOL)shouldRefreshAvailability;
- (NSDictionary)definition;
- (NSDictionary)eventDictionary;
- (NSError)availabilityError;
- (OS_dispatch_queue)stateAccessQueue;
- (WFResource)init;
- (WFResource)initWithDefinition:(id)a3;
- (id)_availabilityError;
- (void)dealloc;
- (void)invalidateAvailability;
- (void)notifyResourcesAboutAvailabilityChange;
- (void)refreshAvailabilityIfNeeded;
- (void)refreshAvailabilityWithForcedNotification;
- (void)refreshAvailabilityWithNotification;
- (void)refreshAvailabilityWithNotification:(BOOL)a3;
- (void)updateAvailability:(BOOL)a3 withError:(id)a4;
- (void)updateAvailability:(BOOL)a3 withError:(id)a4 completionHandler:(id)a5;
@end

@implementation WFResource

- (WFResource)init
{
  return [(WFResource *)self initWithDefinition:0];
}

- (WFResource)initWithDefinition:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFResource;
  id v5 = [(WFResource *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v6;

    *((unsigned char *)v5 + 9) = 1;
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.shortcuts.WFResource.stateAccessQueue", 0);
    v9 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v8;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v5 + 4), &WFStateAccessQueueSpecificKey, *((void **)v5 + 4), 0);
    if ([(id)objc_opt_class() refreshesAvailabilityOnApplicationResume])
    {
      v10 = [MEMORY[0x1E4F5A7A0] sharedContext];
      [v10 addApplicationStateObserver:v5 forEvent:3];
    }
    id v11 = v5;
  }

  return (WFResource *)v5;
}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F5A7A0] sharedContext];
  [v3 removeApplicationStateObserver:self forEvent:3];

  v4.receiver = self;
  v4.super_class = (Class)WFResource;
  [(WFResource *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateAccessQueue, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_availabilityError, 0);
}

- (OS_dispatch_queue)stateAccessQueue
{
  return self->_stateAccessQueue;
}

- (BOOL)shouldRefreshAvailability
{
  return self->_shouldRefreshAvailability;
}

- (NSDictionary)definition
{
  return self->_definition;
}

- (void)invalidateAvailability
{
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__WFResource_invalidateAvailability__block_invoke;
  block[3] = &unk_1E6558B28;
  block[4] = self;
  dispatch_async(stateAccessQueue, block);
}

uint64_t __36__WFResource_invalidateAvailability__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 1;
  return result;
}

- (void)updateAvailability:(BOOL)a3 withError:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  stateAccessQueue = self->_stateAccessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__WFResource_updateAvailability_withError_completionHandler___block_invoke;
  v13[3] = &unk_1E6554810;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(stateAccessQueue, v13);
}

uint64_t __61__WFResource_updateAvailability_withError_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = *(unsigned char *)(a1 + 56);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateAvailability:(BOOL)a3 withError:(id)a4
{
}

- (void)refreshAvailabilityWithNotification:(BOOL)a3
{
  if ([(WFResource *)self shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:a3])
  {
    [(WFResource *)self notifyResourcesAboutAvailabilityChange];
  }
}

- (void)notifyResourcesAboutAvailabilityChange
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__WFResource_notifyResourcesAboutAvailabilityChange__block_invoke;
  aBlock[3] = &unk_1E6558B28;
  aBlock[4] = self;
  v2 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread]) {
    v2[2](v2);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v2);
  }
}

void __52__WFResource_notifyResourcesAboutAvailabilityChange__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"WFResourceAvailabilityChangedNotification" object:*(void *)(a1 + 32)];
}

- (BOOL)shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification:(BOOL)a3
{
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12372;
  v25 = __Block_byref_object_dispose__12373;
  id v26 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke;
  block[3] = &unk_1E6555A50;
  block[4] = self;
  void block[5] = &v27;
  block[6] = &v21;
  dispatch_sync(stateAccessQueue, block);
  [(WFResource *)self refreshAvailability];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  objc_super v13 = __Block_byref_object_copy__12372;
  id v14 = __Block_byref_object_dispose__12373;
  id v15 = 0;
  uint64_t v6 = self->_stateAccessQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke_2;
  v9[3] = &unk_1E6555A50;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  dispatch_sync(v6, v9);
  BOOL v7 = a3
    || *((unsigned __int8 *)v17 + 24) != *((unsigned __int8 *)v28 + 24)
    || ([(id)v11[5] isEqual:v22[5]] & 1) == 0 && v11[5] != v22[5];
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v7;
}

void __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 8);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
}

void __81__WFResource_shouldNotifyResourcesAfterAvailabilityUpdateWithForcedNotification___block_invoke_2(void *a1)
{
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *(unsigned char *)(a1[4] + 8);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 16));
}

- (void)refreshAvailabilityWithForcedNotification
{
}

- (void)refreshAvailabilityWithNotification
{
}

- (id)_availabilityError
{
  return self->_availabilityError;
}

- (BOOL)_isAvailable
{
  return self->_available;
}

- (void)refreshAvailabilityIfNeeded
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__WFResource_refreshAvailabilityIfNeeded__block_invoke;
  v4[3] = &unk_1E6558960;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync(stateAccessQueue, v4);
  if (*((unsigned char *)v6 + 24)) {
    [(WFResource *)self refreshAvailability];
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __41__WFResource_refreshAvailabilityIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

- (NSError)availabilityError
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__WFResource_availabilityError__block_invoke;
  block[3] = &unk_1E6558960;
  block[4] = self;
  void block[5] = &v15;
  dispatch_sync(stateAccessQueue, block);
  if (*((unsigned char *)v16 + 24)) {
    [(WFResource *)self refreshAvailability];
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__12372;
  uint64_t v12 = __Block_byref_object_dispose__12373;
  id v13 = 0;
  objc_super v4 = self->_stateAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__WFResource_availabilityError__block_invoke_68;
  v7[3] = &unk_1E6558960;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v15, 8);
  return (NSError *)v5;
}

uint64_t __31__WFResource_availabilityError__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

void __31__WFResource_availabilityError__block_invoke_68(uint64_t a1)
{
}

- (BOOL)isAvailable
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  stateAccessQueue = self->_stateAccessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__WFResource_isAvailable__block_invoke;
  block[3] = &unk_1E6558960;
  block[4] = self;
  void block[5] = &v13;
  dispatch_sync(stateAccessQueue, block);
  if (*((unsigned char *)v14 + 24)) {
    [(WFResource *)self refreshAvailability];
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  objc_super v4 = self->_stateAccessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__WFResource_isAvailable__block_invoke_2;
  v7[3] = &unk_1E6558960;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __25__WFResource_isAvailable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  return result;
}

uint64_t __25__WFResource_isAvailable__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

- (NSDictionary)eventDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"resource_name";
  id v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  v7[0] = v3;
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

+ (BOOL)alwaysMakeAvailable
{
  return 0;
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 0;
}

+ (BOOL)isSingleton
{
  return 0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12390 != -1) {
    dispatch_once(&sharedInstance_onceToken_12390, &__block_literal_global_12391);
  }
  [(id)sharedInstance_lock lock];
  id v2 = [(id)sharedInstance_sharedInstances objectForKey:objc_opt_class()];
  if (!v2)
  {
    id v2 = objc_opt_new();
    [(id)sharedInstance_sharedInstances setObject:v2 forKey:objc_opt_class()];
  }
  [(id)sharedInstance_lock unlock];
  return v2;
}

void __28__WFResource_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstances;
  sharedInstance_sharedInstances = v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
  v3 = (void *)sharedInstance_lock;
  sharedInstance_lock = (uint64_t)v2;
}

@end