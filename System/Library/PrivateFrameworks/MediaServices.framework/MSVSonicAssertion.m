@interface MSVSonicAssertion
+ (BOOL)hasEntitlement;
+ (BOOL)shouldAlsoUseOSTransaction;
+ (id)sharedObserver;
- (MSVSonicAssertion)initWithName:(id)a3;
- (NSString)name;
- (id)description;
- (id)invalidationHandler;
- (void)dealloc;
- (void)handleInvalidation:(id)a3;
- (void)invalidate;
- (void)setInvalidationHandler:(id)a3;
@end

@implementation MSVSonicAssertion

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %@>", objc_opt_class(), self, self->_name];
}

BOOL __35__MSVSonicAssertion_hasEntitlement__block_invoke()
{
  BOOL result = +[MSVEntitlementUtilities hasBoolEntitlement:@"com.apple.runningboard.sonic"];
  hasEntitlement_hasEntitlement = result;
  return result;
}

- (void)setInvalidationHandler:(id)a3
{
}

+ (BOOL)hasEntitlement
{
  if (hasEntitlement_onceToken != -1) {
    dispatch_once(&hasEntitlement_onceToken, &__block_literal_global_5552);
  }
  return hasEntitlement_hasEntitlement;
}

- (MSVSonicAssertion)initWithName:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MSVSonicAssertion;
  v5 = [(MSVSonicAssertion *)&v41 init];
  if (!v5) {
    goto LABEL_37;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5507);
  id v6 = (id)__assertion_5513;
  v7 = v6;
  unint64_t v8 = 0x1E5AD9000;
  if (v6)
  {
    if ([v6 isValid])
    {
      v9 = [MEMORY[0x1E4F1C9C8] date];
      [v9 timeIntervalSince1970];
      double v11 = v10 + 30.0 - *(double *)&__assertionCreatedTime;

      if (v11 >= 5.0) {
        goto LABEL_18;
      }
    }
  }
  v12 = [MEMORY[0x1E4F96478] currentProcess];
  v13 = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.sonic.backgroundtask" name:@"SonicBackgroundTask"];
  v46[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];

  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F96318]) initWithExplanation:v4 target:v12 attributes:v14];
  v16 = (void *)__assertion_5513;
  __assertion_5513 = v15;

  v17 = [MEMORY[0x1E4F1C9C8] date];
  [v17 timeIntervalSince1970];
  __assertionCreatedTime = v18;

  id v40 = 0;
  int v19 = [(id)__assertion_5513 acquireWithError:&v40];
  id v20 = v40;
  v21 = os_log_create("com.apple.amp.MediaServices", "Default");
  v22 = v21;
  if (v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v43 = __assertion_5513;
      __int16 v44 = 2114;
      id v45 = v20;
      _os_log_impl(&dword_1A30CD000, v22, OS_LOG_TYPE_ERROR, "[MSVSonicAssertion] Failed to acquire RBSAssertion %p error=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    id v39 = v4;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v43 = __assertion_5513;
      _os_log_impl(&dword_1A30CD000, v22, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Acquired RBSAssertion %p", buf, 0xCu);
    }

    uint64_t v23 = __assertion_5513;
    v22 = +[MSVSonicAssertion sharedObserver];
    v24 = (void *)v23;
    unint64_t v8 = 0x1E5AD9000uLL;
    [v24 addObserver:v22];
  }

  if (v7)
  {
    if ([v7 isValid])
    {
      v25 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = (uint64_t)v7;
        _os_log_impl(&dword_1A30CD000, v25, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Invalidating existing RBSAssertion %p", buf, 0xCu);
      }
    }
    objc_msgSend(v7, "invalidate", v39);
  }

  if (v19)
  {
LABEL_18:
    ++__assertionCount_5508;
    int v26 = 1;
  }
  else
  {
    v27 = (void *)__assertion_5513;
    __assertion_5513 = 0;

    int v26 = 0;
  }
  if (objc_msgSend(*(id *)(v8 + 664), "shouldAlsoUseOSTransaction", v39))
  {
    if (__transaction) {
      int v28 = 0;
    }
    else {
      int v28 = v26;
    }
    if (v28 == 1)
    {
      [v4 UTF8String];
      uint64_t v29 = os_transaction_create();
      v30 = (void *)__transaction;
      __transaction = v29;

      v31 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = __transaction;
        _os_log_impl(&dword_1A30CD000, v31, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Created os_transaction %p", buf, 0xCu);
      }
    }
    else
    {
      if (__transaction) {
        char v32 = v26;
      }
      else {
        char v32 = 1;
      }
      if (v32) {
        goto LABEL_35;
      }
      v33 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v43 = __transaction;
        _os_log_impl(&dword_1A30CD000, v33, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Releasing os_transaction %p", buf, 0xCu);
      }

      v31 = __transaction;
      __transaction = 0;
    }
  }
LABEL_35:
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5507);
  if (!v26)
  {

    v37 = 0;
    goto LABEL_39;
  }
  uint64_t v34 = [v4 copy];
  name = v5->_name;
  v5->_name = (NSString *)v34;

  v5->_needsInvalidation = 1;
  v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v36 addObserver:v5 selector:sel_handleInvalidation_ name:@"MSVSonicAssertionsWereInvalidatedNotification" object:0];

LABEL_37:
  v37 = v5;
LABEL_39:

  return v37;
}

+ (BOOL)shouldAlsoUseOSTransaction
{
  if (shouldAlsoUseOSTransaction_onceToken != -1) {
    dispatch_once(&shouldAlsoUseOSTransaction_onceToken, &__block_literal_global_55);
  }
  return shouldAlsoUseOSTransaction_useOSTransaction;
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken != -1) {
    dispatch_once(&sharedObserver_onceToken, &__block_literal_global_61);
  }
  v2 = (void *)sharedObserver_observer;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __47__MSVSonicAssertion_shouldAlsoUseOSTransaction__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  shouldAlsoUseOSTransaction_useOSTransaction = [v0 isEqualToString:@"com.apple.MediaPlayer.RemotePlayerService"];
}

uint64_t __35__MSVSonicAssertion_sharedObserver__block_invoke()
{
  sharedObserver_observer = objc_alloc_init(MSVSonicAssertionObserver);
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(MSVSonicAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MSVSonicAssertion;
  [(MSVSonicAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5507);
  if (self->_needsInvalidation)
  {
    self->_needsInvalidation = 0;
    uint64_t v4 = __assertionCount_5508;
    uint64_t v5 = --__assertionCount_5508;
    if (v4 <= 0)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"MSVSonicAssertion.m" lineNumber:151 description:@"__assertionCount can't be negative"];

      if (__assertionCount_5508) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    if (!v5)
    {
LABEL_4:
      uint32_t v6 = arc4random();
      __assertionInvalidationNonce_5512 = v6;
      dispatch_time_t v7 = dispatch_time(0, 2000000000);
      unint64_t v8 = dispatch_get_global_queue(9, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__MSVSonicAssertion_invalidate__block_invoke;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      uint32_t v11 = v6;
      dispatch_after(v7, v8, block);
    }
  }
LABEL_5:
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5507);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (NSString)name
{
  return self->_name;
}

- (void)handleInvalidation:(id)a3
{
  uint64_t v4 = [(MSVSonicAssertion *)self invalidationHandler];

  if (v4)
  {
    uint64_t v5 = [(MSVSonicAssertion *)self invalidationHandler];
    ((void (**)(void, MSVSonicAssertion *))v5)[2](v5, self);

    [(MSVSonicAssertion *)self setInvalidationHandler:0];
  }
}

void __31__MSVSonicAssertion_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock_5507);
  if (*(_DWORD *)(a1 + 32) == __assertionInvalidationNonce_5512 && !__assertionCount_5508 && __assertion_5513 != 0)
  {
    if ([(id)__assertion_5513 isValid])
    {
      objc_super v3 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = __assertion_5513;
        _os_log_impl(&dword_1A30CD000, v3, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Invalidating RBSAssertion %p] Timeout", (uint8_t *)&v7, 0xCu);
      }
    }
    [(id)__assertion_5513 invalidate];
    uint64_t v4 = (void *)__assertion_5513;
    __assertion_5513 = 0;

    if (__transaction)
    {
      uint64_t v5 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 134217984;
        uint64_t v8 = __transaction;
        _os_log_impl(&dword_1A30CD000, v5, OS_LOG_TYPE_DEFAULT, "[MSVSonicAssertion] Releasing os_transaction %p Timeout", (uint8_t *)&v7, 0xCu);
      }

      uint32_t v6 = (void *)__transaction;
      __transaction = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock_5507);
}

@end