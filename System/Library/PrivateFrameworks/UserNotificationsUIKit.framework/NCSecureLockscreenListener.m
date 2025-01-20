@interface NCSecureLockscreenListener
+ (BOOL)isSensitiveUIEnabled;
+ (id)_shared;
+ (void)addObserver:(id)a3 changeBlock:(id)a4;
+ (void)removeObserver:(id)a3;
- (BOOL)_sensitiveUIEnabled;
- (NSMapTable)observers;
- (id)_init;
- (void)_setSensitiveUIEnabled:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setObservers:(id)a3;
@end

@implementation NCSecureLockscreenListener

+ (BOOL)isSensitiveUIEnabled
{
  if (!os_variant_has_internal_content()) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.internal.NotificationsUITool"];

  if (v5) {
    return 1;
  }
  v7 = [a1 _shared];
  char v8 = [v7 _sensitiveUIEnabled];

  return v8;
}

+ (void)addObserver:(id)a3 changeBlock:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (os_variant_has_internal_content())
  {
    v7 = [a1 _shared];
    char v8 = [v7 observers];
    v9 = _Block_copy(v6);
    [v8 setObject:v9 forKey:v10];
  }
}

+ (void)removeObserver:(id)a3
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    v4 = [a1 _shared];
    char v5 = [v4 observers];
    [v5 removeObjectForKey:v6];
  }
}

- (id)_init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)NCSecureLockscreenListener;
  v2 = [(NCSecureLockscreenListener *)&v10 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v2->_BOOL sensitiveUIEnabled = [v3 BOOLForKey:@"SBSensitiveUIEnabled"];

    v4 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      BOOL sensitiveUIEnabled = v2->_sensitiveUIEnabled;
      *(_DWORD *)buf = 138543618;
      v12 = @"SBSensitiveUIEnabled";
      __int16 v13 = 1024;
      BOOL v14 = sensitiveUIEnabled;
      _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "Secure Lock Screen: %{public}@ initing to %d", buf, 0x12u);
    }
    id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v6 addObserver:v2 forKeyPath:@"SBSensitiveUIEnabled" options:1 context:0];

    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v7;
  }
  return v2;
}

+ (id)_shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NCSecureLockscreenListener__shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_shared_onceToken != -1) {
    dispatch_once(&_shared_onceToken, block);
  }
  v2 = (void *)_shared_shared;

  return v2;
}

void __37__NCSecureLockscreenListener__shared__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)_shared_shared;
  _shared_shared = v1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v9 isEqualToString:@"SBSensitiveUIEnabled"])
  {
    v25 = [v11 objectForKey:*MEMORY[0x1E4F284C8]];
    uint64_t v12 = [v25 BOOLValue];
    BOOL sensitiveUIEnabled = self->_sensitiveUIEnabled;
    self->_BOOL sensitiveUIEnabled = v12;
    BOOL v14 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v32 = @"SBSensitiveUIEnabled";
      __int16 v33 = 1024;
      BOOL v34 = sensitiveUIEnabled;
      __int16 v35 = 1024;
      int v36 = v12;
      _os_log_impl(&dword_1D7C04000, v14, OS_LOG_TYPE_DEFAULT, "Secure Lock Screen: %{public}@ changed from %d to %d", buf, 0x18u);
    }
    uint64_t v15 = (void *)MEMORY[0x1D9481450]();
    v16 = [(NSMapTable *)self->_observers objectEnumerator];
    v17 = [v16 allObjects];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v18 = v17;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * v22);
          v24 = (void *)MEMORY[0x1D9481450]();
          (*(void (**)(uint64_t, uint64_t))(v23 + 16))(v23, v12);
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v20);
    }
  }
}

- (BOOL)_sensitiveUIEnabled
{
  return self->_sensitiveUIEnabled;
}

- (void)_setSensitiveUIEnabled:(BOOL)a3
{
  self->_BOOL sensitiveUIEnabled = a3;
}

- (NSMapTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end