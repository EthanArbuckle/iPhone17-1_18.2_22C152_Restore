@interface SAAutomaticallyInvalidatingAssertion
- (BOOL)_setAutomaticallyInvalidatable:(BOOL)a3 lockingWithKey:(id)a4 reason:(id)a5;
- (BOOL)isAutomaticallyInvalidatable;
- (SAAutomaticallyInvalidatingAssertion)initWithInvalidationInterval:(double)a3;
- (double)invalidationInterval;
- (id)_descriptionConstituents;
- (void)_invalidateInvalidationTimerIfNecessary;
- (void)_scheduleInvalidationTimerIfNecessary;
- (void)resetAutomaticInvalidationTimer;
- (void)setAutomaticallyInvalidatable:(BOOL)a3;
@end

@implementation SAAutomaticallyInvalidatingAssertion

- (SAAutomaticallyInvalidatingAssertion)initWithInvalidationInterval:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SAAutomaticallyInvalidatingAssertion;
  result = [(SAAssertion *)&v5 init];
  if (result) {
    result->_invalidationInterval = a3;
  }
  return result;
}

- (id)_descriptionConstituents
{
  id v3 = objc_alloc(MEMORY[0x263EFF9A0]);
  v4 = [NSNumber numberWithDouble:self->_invalidationInterval];
  [(NSTimer *)self->_invalidationTimer isValid];
  objc_super v5 = NSStringFromBOOL();
  v6 = NSStringFromBOOL();
  v7 = objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"invalidation interval", v5, @"timer scheduled", v6, @"locked", 0);

  if ([(NSString *)self->_lockReason length]) {
    [v7 setValue:self->_lockReason forKey:@"lock reason"];
  }
  v11.receiver = self;
  v11.super_class = (Class)SAAutomaticallyInvalidatingAssertion;
  v8 = [(SAAssertion *)&v11 _descriptionConstituents];
  v9 = [v8 arrayByAddingObject:v7];

  return v9;
}

- (void)setAutomaticallyInvalidatable:(BOOL)a3
{
}

- (void)resetAutomaticInvalidationTimer
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if ([(SAAssertion *)v2 isValid] && [(NSTimer *)v2->_invalidationTimer isValid])
  {
    id v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138543362;
      objc_super v5 = v2;
      _os_log_impl(&dword_25E6DD000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer reset: %{public}@", (uint8_t *)&v4, 0xCu);
    }
    [(SAAutomaticallyInvalidatingAssertion *)v2 _invalidateInvalidationTimerIfNecessary];
    [(SAAutomaticallyInvalidatingAssertion *)v2 _scheduleInvalidationTimerIfNecessary];
  }
  objc_sync_exit(v2);
}

- (BOOL)_setAutomaticallyInvalidatable:(BOOL)a3 lockingWithKey:(id)a4 reason:(id)a5
{
  int v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  if (![(SAAssertion *)v10 isValid]) {
    goto LABEL_11;
  }
  int automaticallyInvalidatable = v10->_automaticallyInvalidatable;
  key = v10->_key;
  if (automaticallyInvalidatable == v6)
  {
    BOOL v13 = 0;
    if (!v8 || key) {
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  if (key)
  {
    if ([(NSString *)key isEqualToString:v8])
    {
      int automaticallyInvalidatable = v10->_automaticallyInvalidatable;
      goto LABEL_9;
    }
LABEL_11:
    BOOL v13 = 0;
    goto LABEL_21;
  }
LABEL_9:
  BOOL v13 = automaticallyInvalidatable != v6;
  v10->_int automaticallyInvalidatable = v6;
  if (v6) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = [v8 copy];
  }
  v15 = v10->_key;
  v10->_key = (NSString *)v14;

  v16 = SALogSystem;
  if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
  {
    if (v10->_automaticallyInvalidatable) {
      v17 = @"enabled";
    }
    else {
      v17 = @"disabled";
    }
    int v19 = 138412546;
    v20 = v17;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_25E6DD000, v16, OS_LOG_TYPE_DEFAULT, "Automatic invalidation %@: %{public}@", (uint8_t *)&v19, 0x16u);
  }
  if (v10->_automaticallyInvalidatable) {
    [(SAAutomaticallyInvalidatingAssertion *)v10 _scheduleInvalidationTimerIfNecessary];
  }
  else {
    [(SAAutomaticallyInvalidatingAssertion *)v10 _invalidateInvalidationTimerIfNecessary];
  }
LABEL_21:
  objc_sync_exit(v10);

  return v13;
}

- (void)_scheduleInvalidationTimerIfNecessary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if ([(SAAssertion *)v2 isValid] && ![(NSTimer *)v2->_invalidationTimer isValid])
  {
    id v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v11 = v2;
      _os_log_impl(&dword_25E6DD000, v3, OS_LOG_TYPE_DEFAULT, "Scheduling automatic invalidation timer: %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, v2);
    int v4 = (void *)MEMORY[0x263EFFA20];
    double invalidationInterval = v2->_invalidationInterval;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__SAAutomaticallyInvalidatingAssertion__scheduleInvalidationTimerIfNecessary__block_invoke;
    v8[3] = &unk_26552B6C8;
    objc_copyWeak(&v9, (id *)buf);
    uint64_t v6 = [v4 scheduledTimerWithTimeInterval:0 repeats:v8 block:invalidationInterval];
    invalidationTimer = v2->_invalidationTimer;
    v2->_invalidationTimer = (NSTimer *)v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v2);
}

void __77__SAAutomaticallyInvalidatingAssertion__scheduleInvalidationTimerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*((id *)WeakRetained + 7) == v5)
    {
      *((void *)WeakRetained + 7) = 0;
    }
    [v4 invalidateWithReason:@"automatic invalidation interval elapsed"];
  }
}

- (void)_invalidateInvalidationTimerIfNecessary
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if ([(NSTimer *)v2->_invalidationTimer isValid])
  {
    id v3 = SALogSystem;
    if (os_log_type_enabled((os_log_t)SALogSystem, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      uint64_t v6 = v2;
      _os_log_impl(&dword_25E6DD000, v3, OS_LOG_TYPE_DEFAULT, "Automatic invalidation timer invalidated: %{public}@", (uint8_t *)&v5, 0xCu);
    }
    [(NSTimer *)v2->_invalidationTimer invalidate];
    invalidationTimer = v2->_invalidationTimer;
    v2->_invalidationTimer = 0;
  }
  objc_sync_exit(v2);
}

- (BOOL)isAutomaticallyInvalidatable
{
  return self->_automaticallyInvalidatable;
}

- (double)invalidationInterval
{
  return self->_invalidationInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_lockReason, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end