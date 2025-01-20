@interface PFPosterExtensionProvider
+ (id)extensionKitQuery;
- (BOOL)_lock_updateExtensions;
- (BOOL)_lock_updateExtensions:(id)a3;
- (BOOL)hasPosterExtensions;
- (BOOL)reloadExtensions;
- (NSArray)knownPosterExtensions;
- (NSDictionary)extensionForIdentifier;
- (NSPredicate)predicate;
- (NSSet)supportedRoles;
- (NSUUID)defaultInstanceIdentifier;
- (OS_dispatch_queue)observerQueue;
- (PFPosterExtensionInstanceProvider)instanceProvider;
- (PFPosterExtensionProvider)init;
- (PFPosterExtensionProvider)initWithDefaultInstanceIdentifier:(id)a3;
- (id)_lock_buildQuery;
- (id)acquireInstanceForExtensionWithIdentifier:(id)a3 reason:(id)a4 error:(id *)a5;
- (id)defaultInstanceOfProvider:(id)a3 error:(id *)a4;
- (void)_lock_executeCancellationAndRestartIfAlreadyStarted:(BOOL)a3;
- (void)_lock_executeQuery;
- (void)_lock_notifyDataStoreOfUpdatedExtensions:(id)a3 fromExtensions:(id)a4;
- (void)_lock_start;
- (void)_lock_teardownQueryController;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4;
- (void)relinquishExtensionInstanceWithIdentifier:(id)a3 reason:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setSupportedRoles:(id)a3;
- (void)start;
@end

@implementation PFPosterExtensionProvider

+ (id)extensionKitQuery
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F04DE8]) initWithExtensionPointIdentifier:@"com.apple.posterkit.provider"];
  return v2;
}

- (PFPosterExtensionProvider)init
{
  return [(PFPosterExtensionProvider *)self initWithDefaultInstanceIdentifier:0];
}

- (PFPosterExtensionProvider)initWithDefaultInstanceIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PFPosterExtensionProvider;
  v5 = [(PFPosterExtensionProvider *)&v17 init];
  if (v5)
  {
    v6 = +[PFWorkloop serialQueueTargetingSharedWorkloop:@"com.apple.PosterFoundation.extensionProvider.observerQueue"];
    [(PFPosterExtensionProvider *)v5 setObserverQueue:v6];

    v7 = [[PFPosterExtensionInstanceProvider alloc] initWithDefaultInstanceIdentifier:v4];
    instanceProvider = v5->_instanceProvider;
    v5->_instanceProvider = v7;

    v5->_lock._os_unfair_lock_opaque = 0;
    uint64_t v9 = [MEMORY[0x263F08A98] predicateWithValue:1];
    lock_predicate = v5->_lock_predicate;
    v5->_lock_predicate = (NSPredicate *)v9;

    uint64_t v11 = PFPosterRolesSupportedForCurrentDeviceClass();
    lock_supportedRoles = v5->_lock_supportedRoles;
    v5->_lock_supportedRoles = (NSSet *)v11;

    uint64_t v13 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    lock_observers = v5->_lock_observers;
    v5->_lock_observers = (NSHashTable *)v13;

    v15 = PFLogExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v5;
      _os_log_impl(&dword_25A085000, v15, OS_LOG_TYPE_DEFAULT, "(%p) init", buf, 0xCu);
    }
  }
  return v5;
}

- (NSUUID)defaultInstanceIdentifier
{
  return [(PFPosterExtensionInstanceProvider *)self->_instanceProvider defaultInstanceIdentifier];
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

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = PFLogExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_25A085000, v4, OS_LOG_TYPE_DEFAULT, "(%p) cancel", (uint8_t *)&v5, 0xCu);
  }

  [(PFPosterExtensionProvider *)self _lock_executeCancellationAndRestartIfAlreadyStarted:0];
  os_unfair_lock_unlock(p_lock);
}

- (void)start
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = PFLogExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    v6 = self;
    _os_log_impl(&dword_25A085000, v4, OS_LOG_TYPE_DEFAULT, "(%p) start", (uint8_t *)&v5, 0xCu);
  }

  [(PFPosterExtensionProvider *)self _lock_start];
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)reloadExtensions
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = PFLogExtensions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_25A085000, v4, OS_LOG_TYPE_DEFAULT, "(%p) reloadExtensions", (uint8_t *)&v7, 0xCu);
  }

  BOOL v5 = [(PFPosterExtensionProvider *)self _lock_updateExtensions];
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSArray)knownPosterExtensions
{
  v2 = [(PFPosterExtensionProvider *)self extensionForIdentifier];
  v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_0];

  return (NSArray *)v4;
}

uint64_t __50__PFPosterExtensionProvider_knownPosterExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 posterExtensionBundleIdentifier];
  v6 = [v4 posterExtensionBundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)hasPosterExtensions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger v4 = [(NSDictionary *)self->_lock_extensionByProvider count];
  os_unfair_lock_unlock(p_lock);
  BOOL v5 = PFLogExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v4 != 0;
    _os_log_impl(&dword_25A085000, v5, OS_LOG_TYPE_DEFAULT, "(%p) hasPosterExtensions:%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  return v4 != 0;
}

- (NSDictionary)extensionForIdentifier
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger v4 = (void *)[(NSDictionary *)self->_lock_extensionByProvider copy];
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (NSSet)supportedRoles
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSUInteger v4 = (void *)[(NSSet *)self->_lock_supportedRoles copy];
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)setSupportedRoles:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4)
  {
    PFPosterRolesSupportedForCurrentDeviceClass();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_lock(&self->_lock);
  if (([(NSSet *)self->_lock_supportedRoles isEqual:v4] & 1) == 0)
  {
    BOOL v5 = (NSSet *)[v4 copy];
    lock_supportedRoles = self->_lock_supportedRoles;
    self->_lock_supportedRoles = v5;

    lock_rolePredicate = self->_lock_rolePredicate;
    self->_lock_rolePredicate = 0;

    v8 = PFLogExtensions();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134218242;
      BOOL v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_25A085000, v8, OS_LOG_TYPE_DEFAULT, "(%p) updating supported roles:%{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (self->_lock_started)
    {
      [(PFPosterExtensionProvider *)self _lock_teardownQueryController];
      self->_lock_started = 0;
      [(PFPosterExtensionProvider *)self _lock_start];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)setPredicate:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = (NSPredicate *)a3;
  if (!v4)
  {
    id v4 = [MEMORY[0x263F08A98] predicateWithValue:1];
  }
  os_unfair_lock_lock(&self->_lock);
  BOOL v5 = PFLogExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218242;
    int v9 = self;
    __int16 v10 = 2114;
    __int16 v11 = v4;
    _os_log_impl(&dword_25A085000, v5, OS_LOG_TYPE_DEFAULT, "(%p) updating predicate:%{public}@", (uint8_t *)&v8, 0x16u);
  }

  if (self->_lock_started)
  {
    [(PFPosterExtensionProvider *)self _lock_executeCancellationAndRestartIfAlreadyStarted:0];
    self->_lock_started = 0;
    lock_predicate = self->_lock_predicate;
    self->_lock_predicate = v4;

    [(PFPosterExtensionProvider *)self _lock_start];
  }
  else
  {
    int v7 = self->_lock_predicate;
    self->_lock_predicate = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (NSPredicate)predicate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_lock_predicate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)defaultInstanceOfProvider:(id)a3 error:(id *)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    v15 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"providerId"];
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[PFPosterExtensionProvider defaultInstanceOfProvider:error:](a2, (uint64_t)self, (uint64_t)v15);
    }
    [v15 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x25A08A618);
  }
  int v8 = v7;
  os_unfair_lock_lock(&self->_lock);
  int v9 = [(NSDictionary *)self->_lock_extensionByProvider objectForKey:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (v9)
  {
    __int16 v10 = [(PFPosterExtensionProvider *)self instanceProvider];
    a4 = [v10 acquireInstanceForExtension:v9 reason:0 error:a4];
  }
  else if (a4)
  {
    __int16 v11 = (void *)MEMORY[0x263F087E8];
    v16[0] = *MEMORY[0x263F08338];
    uint64_t v12 = NSStringFromSelector(a2);
    v16[1] = @"providerId";
    v17[0] = v12;
    v17[1] = v8;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    objc_msgSend(v11, "pf_errorWithCode:userInfo:", 3, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

- (id)acquireInstanceForExtensionWithIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  __int16 v10 = [(PFPosterExtensionProvider *)self extensionForIdentifier];
  __int16 v11 = [v10 objectForKey:v9];

  uint64_t v12 = [(PFPosterExtensionProvider *)self instanceProvider];
  uint64_t v13 = [v12 acquireInstanceForExtension:v11 reason:v8 error:a5];

  return v13;
}

- (void)relinquishExtensionInstanceWithIdentifier:(id)a3 reason:(id)a4
{
  id v12 = a4;
  id v6 = a3;
  id v7 = [(PFPosterExtensionProvider *)self extensionForIdentifier];
  id v8 = [v7 objectForKey:v6];

  id v9 = [(PFPosterExtensionProvider *)self instanceProvider];
  __int16 v10 = [v9 instanceForExtension:v8 reason:v12];

  if (v10)
  {
    __int16 v11 = [(PFPosterExtensionProvider *)self instanceProvider];
    [v11 relinquishExtensionInstance:v10 reason:v12];
  }
}

- (void)_lock_executeQuery
{
  if (self->_lock_started)
  {
    id v4 = [MEMORY[0x263F04DF0] executeQueries:self->_lock_queries];
    v3 = [MEMORY[0x263EFFA08] setWithArray:v4];
    [(PFPosterExtensionProvider *)self _lock_updateExtensions:v3];
  }
}

- (void)_lock_start
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!self->_lock_started)
  {
    v3 = PFLogExtensions();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v11 = self;
      _os_log_impl(&dword_25A085000, v3, OS_LOG_TYPE_DEFAULT, "(%p) start", buf, 0xCu);
    }

    if (!self->_lock_queries)
    {
      id v4 = [(PFPosterExtensionProvider *)self _lock_buildQuery];
      id v9 = v4;
      BOOL v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v9 count:1];
      lock_queries = self->_lock_queries;
      self->_lock_queries = v5;
    }
    if (!self->_lock_queryController)
    {
      id v7 = (_EXQueryController *)[objc_alloc(MEMORY[0x263F04DF0]) initWithQueries:self->_lock_queries delegate:self];
      lock_queryController = self->_lock_queryController;
      self->_lock_queryController = v7;

      [(_EXQueryController *)self->_lock_queryController setDelegate:self];
      [(_EXQueryController *)self->_lock_queryController resume];
    }
    self->_lock_started = 1;
  }
  [(PFPosterExtensionProvider *)self _lock_executeQuery];
}

- (id)_lock_buildQuery
{
  v3 = [(id)objc_opt_class() extensionKitQuery];
  id v4 = objc_opt_new();
  objc_msgSend(v4, "bs_safeAddObject:", self->_lock_predicate);
  if (!self->_lock_rolePredicate)
  {
    BOOL v5 = self->_lock_supportedRoles;
    id v6 = (void *)MEMORY[0x263F08A98];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__PFPosterExtensionProvider__lock_buildQuery__block_invoke;
    v12[3] = &unk_26546EB48;
    uint64_t v13 = v5;
    id v7 = v5;
    id v8 = [v6 predicateWithBlock:v12];
    lock_rolePredicate = self->_lock_rolePredicate;
    self->_lock_rolePredicate = v8;

    [v4 addObject:self->_lock_rolePredicate];
  }
  if ([v4 count])
  {
    __int16 v10 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v4];
  }
  else
  {
    __int16 v10 = 0;
  }
  [v3 setPredicate:v10];

  return v3;
}

uint64_t __45__PFPosterExtensionProvider__lock_buildQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 applicationExtensionRecord];
  BOOL v5 = [v4 infoDictionary];

  uint64_t v6 = *MEMORY[0x263EFFB58];
  id v7 = self;
  id v8 = [v5 objectForKey:v6 ofClass:v7];

  if (v8)
  {
    id v9 = objc_msgSend(v5, "pf_supportedRoles");
  }
  else
  {
    __int16 v10 = [v3 applicationExtensionRecord];
    __int16 v11 = PFRoleProviderForLSApplicationExtensionRecord(v10);
    id v9 = objc_msgSend(v11, "pf_supportedRoles");
  }
  uint64_t v12 = [*(id *)(a1 + 32) intersectsSet:v9];

  return v12;
}

- (void)_lock_teardownQueryController
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = PFLogExtensions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl(&dword_25A085000, v3, OS_LOG_TYPE_DEFAULT, "(%p) teardownQueryController", (uint8_t *)&v6, 0xCu);
  }

  lock_queries = self->_lock_queries;
  self->_lock_queries = 0;

  [(_EXQueryController *)self->_lock_queryController setDelegate:0];
  [(_EXQueryController *)self->_lock_queryController suspend];
  lock_queryController = self->_lock_queryController;
  self->_lock_queryController = 0;
}

- (void)_lock_executeCancellationAndRestartIfAlreadyStarted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v5 = PFLogExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218240;
    uint64_t v8 = self;
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_25A085000, v5, OS_LOG_TYPE_DEFAULT, "(%p) _lock_executeCancellationAndRestartIfAlreadyStarted:%{BOOL}u", (uint8_t *)&v7, 0x12u);
  }

  [(PFPosterExtensionProvider *)self _lock_teardownQueryController];
  BOOL lock_started = self->_lock_started;
  self->_BOOL lock_started = 0;
  if (lock_started && v3) {
    [(PFPosterExtensionProvider *)self _lock_start];
  }
  [(PFPosterExtensionInstanceProvider *)self->_instanceProvider cancel];
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v6 = (_EXQueryController *)a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  lock_queryController = self->_lock_queryController;
  __int16 v9 = PFLogExtensions();
  BOOL v10 = v9;
  if (lock_queryController == v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134218498;
      objc_super v17 = self;
      __int16 v18 = 2112;
      v19 = v6;
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_25A085000, v10, OS_LOG_TYPE_DEFAULT, "(%p) queryControllerDidUpdate:%@ resultDifference:%@", (uint8_t *)&v16, 0x20u);
    }

    uint64_t v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = [(_EXQueryController *)v6 extensionIdentities];
    BOOL v10 = v13;
    if (v13) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = MEMORY[0x263EFFA68];
    }
    v15 = [v12 setWithArray:v14];
    [(PFPosterExtensionProvider *)self _lock_updateExtensions:v15];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = self->_lock_queryController;
    int v16 = 134218754;
    objc_super v17 = self;
    __int16 v18 = 2112;
    v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v11;
    _os_log_error_impl(&dword_25A085000, v10, OS_LOG_TYPE_ERROR, "(%p) ignoring imposter queryControllerDidUpdate:%@ resultDifference:%@ - My controller is %@", (uint8_t *)&v16, 0x2Au);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_lock_updateExtensions
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263F04DF0];
  id v4 = [(PFPosterExtensionProvider *)self _lock_buildQuery];
  BOOL v5 = [v3 executeQuery:v4];

  if (v5) {
    int v6 = v5;
  }
  else {
    int v6 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = [MEMORY[0x263EFFA08] setWithArray:v6];
  BOOL v8 = [(PFPosterExtensionProvider *)self _lock_updateExtensions:v7];

  __int16 v9 = PFLogExtensions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218240;
    uint64_t v12 = self;
    __int16 v13 = 1024;
    BOOL v14 = v8;
    _os_log_impl(&dword_25A085000, v9, OS_LOG_TYPE_DEFAULT, "(%p) didUpdateExtensions:%{BOOL}u", (uint8_t *)&v11, 0x12u);
  }

  return v8;
}

- (BOOL)_lock_updateExtensions:(id)a3
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    int v6 = (void *)[(NSDictionary *)self->_lock_extensionByProvider copy];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v45 = v6;
    id v7 = [v6 allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v62 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v54 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          __int16 v13 = [v12 identity];
          [v5 setObject:v12 forKey:v13];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v62 count:16];
      }
      while (v9);
    }

    BOOL v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = [v45 allValues];
    v44 = [v14 setWithArray:v15];

    v46 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v43 = v4;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v50;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8 * v20);
          if (!-[NSPredicate evaluateWithObject:](self->_lock_predicate, "evaluateWithObject:", v21, v43))
          {
            v23 = PFLogExtensions();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 134218242;
            v58 = self;
            __int16 v59 = 2112;
            uint64_t v60 = v21;
            v27 = v23;
            v28 = "(%p) Predicate rejected extension identity %@";
LABEL_26:
            _os_log_impl(&dword_25A085000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x16u);
            goto LABEL_29;
          }
          BOOL v22 = [(NSPredicate *)self->_lock_rolePredicate evaluateWithObject:v21];
          v23 = PFLogExtensions();
          BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          if (!v22)
          {
            if (!v24) {
              goto LABEL_29;
            }
            *(_DWORD *)buf = 134218242;
            v58 = self;
            __int16 v59 = 2112;
            uint64_t v60 = v21;
            v27 = v23;
            v28 = "(%p) Role Predicate rejected extension identity %@";
            goto LABEL_26;
          }
          if (v24)
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            __int16 v59 = 2112;
            uint64_t v60 = v21;
            _os_log_impl(&dword_25A085000, v23, OS_LOG_TYPE_DEFAULT, "(%p) Examining extension identity %@", buf, 0x16u);
          }

          uint64_t v25 = [v5 objectForKey:v21];
          if (v25)
          {
            v23 = v25;
            v26 = PFLogExtensions();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v58 = self;
              __int16 v59 = 2112;
              uint64_t v60 = v21;
              _os_log_impl(&dword_25A085000, v26, OS_LOG_TYPE_DEFAULT, "(%p) Extension identity %@ already tracked", buf, 0x16u);
            }

LABEL_28:
            [v46 addObject:v23];
            goto LABEL_29;
          }
          v23 = +[PFPosterExtension extensionWithIdentity:v21];
          if (v23) {
            goto LABEL_28;
          }
          v29 = PFLogExtensions();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            __int16 v59 = 2112;
            uint64_t v60 = v21;
            _os_log_impl(&dword_25A085000, v29, OS_LOG_TYPE_DEFAULT, "(%p) Failed to add new extension wrapper: %@; PFPosterExtension unable to create extension",
              buf,
              0x16u);
          }

          v23 = PFLogExtensions();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v58 = self;
            __int16 v59 = 2112;
            uint64_t v60 = v21;
            _os_log_error_impl(&dword_25A085000, v23, OS_LOG_TYPE_ERROR, "(%p) Extension identity %@ could not be used to create a PFPosterExtension. Bailing.", buf, 0x16u);
          }
LABEL_29:

          ++v20;
        }
        while (v18 != v20);
        uint64_t v30 = [v16 countByEnumeratingWithState:&v49 objects:v61 count:16];
        uint64_t v18 = v30;
      }
      while (v30);
    }

    v31 = (void *)[v46 copy];
    v32 = [MEMORY[0x263EFFA08] setWithArray:v31];
    v33 = v44;
    int v34 = [v44 isEqual:v32];
    v35 = PFLogExtensions();
    BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
    if (v34)
    {
      if (v36)
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_25A085000, v35, OS_LOG_TYPE_DEFAULT, "(%p) Extension update received; no updates found.",
          buf,
          0xCu);
      }
      id v4 = v43;
    }
    else
    {
      if (v36)
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_25A085000, v35, OS_LOG_TYPE_DEFAULT, "(%p) Extension update received; pushing out updates",
          buf,
          0xCu);
      }

      v38 = objc_opt_new();
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __52__PFPosterExtensionProvider__lock_updateExtensions___block_invoke;
      v47[3] = &unk_26546EB70;
      v35 = v38;
      v48 = v35;
      [v31 enumerateObjectsUsingBlock:v47];
      v39 = [v35 copy];
      lock_extensionByProvider = self->_lock_extensionByProvider;
      self->_lock_extensionByProvider = v39;

      [(PFPosterExtensionProvider *)self _lock_notifyDataStoreOfUpdatedExtensions:v32 fromExtensions:v44];
      v41 = PFLogExtensions();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v58 = self;
        _os_log_impl(&dword_25A085000, v41, OS_LOG_TYPE_DEFAULT, "(%p) Extension update complete", buf, 0xCu);
      }

      id v4 = v43;
      v33 = v44;
    }

    char v37 = v34 ^ 1;
  }
  else
  {
    v33 = PFLogExtensions();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v58 = self;
      _os_log_impl(&dword_25A085000, v33, OS_LOG_TYPE_DEFAULT, "(%p) Rejecting updateExtensions; no extensions received.",
        buf,
        0xCu);
    }
    char v37 = 0;
  }

  return v37;
}

void __52__PFPosterExtensionProvider__lock_updateExtensions___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 posterExtensionBundleIdentifier];
  [v2 setObject:v3 forKey:v4];
}

- (void)_lock_notifyDataStoreOfUpdatedExtensions:(id)a3 fromExtensions:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  id v7 = PFLogExtensions();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = self;
    __int16 v31 = 2048;
    uint64_t v32 = [v6 count];
    __int16 v33 = 2112;
    id v34 = v6;
    _os_log_impl(&dword_25A085000, v7, OS_LOG_TYPE_DEFAULT, "(%p) Extensions updated; Received %lu extensions: %@",
      buf,
      0x20u);
  }

  uint64_t v8 = self->_lock_observers;
  uint64_t v9 = [(NSHashTable *)v8 count];
  log = PFLogExtensions();
  BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v10)
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v30 = self;
      __int16 v31 = 2112;
      uint64_t v32 = (uint64_t)v6;
      _os_log_impl(&dword_25A085000, log, OS_LOG_TYPE_DEFAULT, "(%p) Notifying delegate of updated Poster Extensions %@", buf, 0x16u);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    log = v8;
    uint64_t v11 = [log countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v18 = v8;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(log);
          }
          uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v16 = [(PFPosterExtensionProvider *)self observerQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke;
          block[3] = &unk_26546EB98;
          block[4] = v15;
          block[5] = self;
          id v22 = v6;
          id v23 = v20;
          dispatch_async(v16, block);
        }
        uint64_t v12 = [log countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v12);
      uint64_t v8 = v18;
    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    uint64_t v32 = (uint64_t)v6;
    _os_log_impl(&dword_25A085000, log, OS_LOG_TYPE_DEFAULT, "(%p) Observers were not set; Poster Extensions were updated: %@",
      buf,
      0x16u);
  }

  uint64_t v17 = [(PFPosterExtensionProvider *)self instanceProvider];
  [v17 noteExtensionsWereUpdated:v6];
}

uint64_t __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = objc_msgSend(*(id *)(a1 + 48), "bs_array");
    BOOL v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_37];
    [v2 posterExtensionProvider:v3 foundExtensions:v5];
  }
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    return [v7 posterExtensionProvider:v8 updatedExtensionsFrom:v9 to:v10];
  }
  return result;
}

uint64_t __85__PFPosterExtensionProvider__lock_notifyDataStoreOfUpdatedExtensions_fromExtensions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 posterExtensionBundleIdentifier];
  id v6 = [v4 posterExtensionBundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 88, 1);
}

- (void)setObserverQueue:(id)a3
{
}

- (PFPosterExtensionInstanceProvider)instanceProvider
{
  return self->_instanceProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceProvider, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_lock_supportedRoles, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_rolePredicate, 0);
  objc_storeStrong((id *)&self->_lock_predicate, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_lock_extensionByProvider, 0);
  objc_storeStrong((id *)&self->_lock_queryController, 0);
  objc_storeStrong((id *)&self->_lock_queries, 0);
}

- (void)defaultInstanceOfProvider:(uint64_t)a3 error:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_0_0();
  uint64_t v10 = a2;
  __int16 v11 = v8;
  uint64_t v12 = @"PFPosterExtensionProvider.m";
  __int16 v13 = 1024;
  int v14 = 189;
  __int16 v15 = v8;
  uint64_t v16 = a3;
  _os_log_error_impl(&dword_25A085000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v9, 0x3Au);
}

@end