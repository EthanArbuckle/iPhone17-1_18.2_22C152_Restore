@interface SUAutoUpdatePasscodePolicy
+ (id)sharedInstance;
- (BOOL)_isValidPasscodePolicyType:(unint64_t)a3;
- (SUAutoUpdatePasscodePolicy)init;
- (id)_init;
- (id)description;
- (id)stringForCurrentPolicy;
- (unint64_t)currentPolicyType;
- (void)addObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCurrentPolicyType:(unint64_t)a3;
@end

@implementation SUAutoUpdatePasscodePolicy

- (SUAutoUpdatePasscodePolicy)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SUAutoUpdatePasscodePolicy.m" lineNumber:41 description:@"Please use the sharedInstance."];

  return 0;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)SUAutoUpdatePasscodePolicy;
  v2 = [(SUAutoUpdatePasscodePolicy *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.softwareupdateservices.passcodePolicy", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.softwareupdateservices.passcodepolicy.observerCallout", 0);
    observerCalloutQueue = v2->_observerCalloutQueue;
    v2->_observerCalloutQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = [MEMORY[0x263F088B0] hashTableWithOptions:517];
    queue_observers = v2->_queue_observers;
    v2->_queue_observers = (NSHashTable *)v7;

    [(SUAutoUpdatePasscodePolicy *)v2 setCurrentPolicyType:0];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __44__SUAutoUpdatePasscodePolicy_sharedInstance__block_invoke()
{
  sharedInstance___instance = [[SUAutoUpdatePasscodePolicy alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (unint64_t)currentPolicyType
{
  BSDispatchQueueAssertNot();
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SUAutoUpdatePasscodePolicy_currentPolicyType__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __47__SUAutoUpdatePasscodePolicy_currentPolicyType__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (BOOL)_isValidPasscodePolicyType:(unint64_t)a3
{
  return a3 < 3;
}

- (id)stringForCurrentPolicy
{
  unint64_t v2 = [(SUAutoUpdatePasscodePolicy *)self currentPolicyType];
  if (v2 > 2) {
    return @"Unknown";
  }
  else {
    return off_26447CA50[v2];
  }
}

- (void)setCurrentPolicyType:(unint64_t)a3
{
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUAutoUpdatePasscodePolicy_setCurrentPolicyType___block_invoke;
  v6[3] = &unk_26447CA30;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(queue, v6);
}

void __51__SUAutoUpdatePasscodePolicy_setCurrentPolicyType___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) _isValidPasscodePolicyType:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    unint64_t v4 = +[SUKeybagInterface sharedInstance];
    if ([v4 hasPasscodeSet])
    {
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 40);

      if (v5)
      {
        SULogInfo(@"%s: Tried to change passcode policy to %@, but passcode is not set, so override policy to not required", v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUAutoUpdatePasscodePolicy setCurrentPolicyType:]_block_invoke");
        uint64_t v3 = 0;
      }
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(void *)(v13 + 40) != v3)
    {
      *(void *)(v13 + 40) = v3;
      v14 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v28 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v19 passcodePolicyInterface:*(void *)(a1 + 32) passcodePolicyTypeChanged:v3];
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
        }
        while (v16);
      }
    }
  }
  else
  {
    [*(id *)(a1 + 32) currentPolicyType];
    SULogInfo(@"Invalid passcode policy type: %lu. Leaving policy as %@", v20, v21, v22, v23, v24, v25, v26, v3);
  }
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUAutoUpdatePasscodePolicy.m", 121, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SUAutoUpdatePasscodePolicy_addObserver___block_invoke;
  block[3] = &unk_26447C8C8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __42__SUAutoUpdatePasscodePolicy_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SUAutoUpdatePasscodePolicy.m", 130, @"Invalid parameter not satisfying: %@", @"observer" object file lineNumber description];
  }
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SUAutoUpdatePasscodePolicy_removeObserver___block_invoke;
  block[3] = &unk_26447C8C8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

uint64_t __45__SUAutoUpdatePasscodePolicy_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (id)description
{
  char v2 = NSString;
  unint64_t v3 = [(SUAutoUpdatePasscodePolicy *)self currentPolicyType];
  if (v3 > 2) {
    unint64_t v4 = @"Unknown";
  }
  else {
    unint64_t v4 = off_26447CA50[v3];
  }
  return (id)[v2 stringWithFormat:@"%@", v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observerCalloutQueue, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
}

@end