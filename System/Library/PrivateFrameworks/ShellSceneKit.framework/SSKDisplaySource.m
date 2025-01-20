@interface SSKDisplaySource
- (FBSDisplayConfiguration)mainConfiguration;
- (FBSDisplayIdentity)mainIdentity;
- (NSSet)connectedIdentities;
- (SSKDisplaySource)init;
- (SSKDisplaySource)initWithDisplayManager:(id)a3;
- (id)configurationForIdentity:(id)a3;
- (void)addObserver:(id)a3;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4;
- (void)removeObserver:(id)a3;
- (void)updateTransformsWithCompletion:(id)a3;
@end

@implementation SSKDisplaySource

- (SSKDisplaySource)init
{
  v3 = [MEMORY[0x263F3F430] sharedInstance];
  v4 = [(SSKDisplaySource *)self initWithDisplayManager:v3];

  return v4;
}

- (SSKDisplaySource)initWithDisplayManager:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SSKDisplaySource.m", 27, @"Invalid parameter not satisfying: %@", @"displayManager" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)SSKDisplaySource;
  v7 = [(SSKDisplaySource *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_displayManager, a3);
    [(FBDisplayManager *)v8->_displayManager addObserver:v8];
    v8->_lock._os_unfair_lock_opaque = 0;
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    lock_observers = v8->_lock_observers;
    v8->_lock_observers = v9;
  }
  return v8;
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)[(FBDisplayManager *)self->_displayManager mainIdentity];
}

- (FBSDisplayConfiguration)mainConfiguration
{
  return (FBSDisplayConfiguration *)[(FBDisplayManager *)self->_displayManager mainConfiguration];
}

- (NSSet)connectedIdentities
{
  return (NSSet *)[(FBDisplayManager *)self->_displayManager connectedIdentities];
}

- (id)configurationForIdentity:(id)a3
{
  return (id)[(FBDisplayManager *)self->_displayManager configurationForIdentity:a3];
}

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(NSMutableSet *)self->_lock_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)updateTransformsWithCompletion:(id)a3
{
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_lock_observers;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "displaySource:didConnectIdentity:withConfiguration:", self, v7, v8, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v9 = self->_lock_observers;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "displaySource:didUpdateIdentity:withConfiguration:", self, v7, v8, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)displayMonitor:(id)a3 willDisconnectIdentity:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = self->_lock_observers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "displaySource:willDisconnectIdentity:", self, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

@end