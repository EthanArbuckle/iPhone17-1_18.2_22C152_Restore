@interface PKNotifyRegistration
- (BOOL)hasSubregistrations;
- (NSString)name;
- (PKNotifyRegistration)init;
- (PKNotifyRegistration)initWithName:(id)a3;
- (id)subregisterWithHandler:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeInvalidatedSubregistration:(id)a3;
@end

@implementation PKNotifyRegistration

- (id)subregisterWithHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated || !self->_subregistrations)
  {
    v5 = 0;
  }
  else
  {
    v5 = [[PKNotifySubregistration alloc] initWithParent:self handler:v4];
    [(NSMutableArray *)self->_subregistrations addObject:v5];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (PKNotifyRegistration)initWithName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKNotifyRegistration;
  v5 = [(PKNotifyRegistration *)&v24 init];
  if (v5)
  {
    v6 = v5;
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.passkitcore.pknotifycoalescer", v8);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = [v4 copy];
    name = v6->_name;
    v6->_name = (NSString *)v11;

    v6->_token = -1;
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    subregistrations = v6->_subregistrations;
    v6->_subregistrations = v13;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__PKNotifyRegistration_initWithName___block_invoke;
    aBlock[3] = &unk_1E56E3890;
    v15 = v6;
    v23 = v15;
    v16 = _Block_copy(aBlock);
    id v17 = v4;
    uint32_t v18 = notify_register_dispatch((const char *)[v17 UTF8String], &v6->_token, (dispatch_queue_t)v6->_queue, v16);
    p_super = PKLogFacilityTypeGetObject(0);
    BOOL v20 = os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 138543618;
        id v26 = v17;
        __int16 v27 = 1024;
        uint32_t v28 = v18;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: failed to register for notification %{public}@ with status %u.", buf, 0x12u);
      }

      [(PKNotifyRegistration *)v15 invalidate];
      p_super = &v15->super;
      v15 = 0;
    }
    else if (v20)
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v17;
      _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: registered for notification %{public}@.", buf, 0xCu);
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  [(PKNotifyRegistration *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKNotifyRegistration;
  [(PKNotifyRegistration *)&v3 dealloc];
}

- (void)removeInvalidatedSubregistration:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_subregistrations removeObjectIdenticalTo:v5];

  subregistrations = self->_subregistrations;
  if (subregistrations)
  {
    uint64_t v7 = [(NSMutableArray *)subregistrations count];
    os_unfair_lock_unlock(p_lock);
    if (v7) {
      return;
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
  v10 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_221);
  if (![(PKNotifyRegistration *)v10 hasSubregistrations])
  {
    v8 = (void *)qword_1EB402D78;
    dispatch_queue_t v9 = [(PKNotifyRegistration *)v10 name];
    [v8 setObject:0 forKeyedSubscript:v9];

    [(PKNotifyRegistration *)v10 invalidate];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_221);
}

- (void)invalidate
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_token != -1)
    {
      id v4 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        name = self->_name;
        *(_DWORD *)buf = 138543362;
        uint32_t v18 = name;
        _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "PKNotifyCoalescer: unregistered for notification %{public}@.", buf, 0xCu);
      }

      notify_cancel(self->_token);
      self->_token = -1;
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_subregistrations;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "_invalidateFromParent:", 1, (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    subregistrations = self->_subregistrations;
    self->_subregistrations = 0;
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)hasSubregistrations
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  subregistrations = self->_subregistrations;
  if (subregistrations) {
    BOOL v5 = [(NSMutableArray *)subregistrations count] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_subregistrations, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (PKNotifyRegistration)init
{
  return 0;
}

void __37__PKNotifyRegistration_initWithName___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  if ([*(id *)(*(void *)(a1 + 32) + 24) count]) {
    v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  }
  else {
    v2 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "invokeHandler", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

@end