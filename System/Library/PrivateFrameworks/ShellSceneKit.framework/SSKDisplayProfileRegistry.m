@interface SSKDisplayProfileRegistry
- (NSString)description;
- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3;
- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3 displayMonitor:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6;
- (id)displayProfileForIdentity:(id)a3;
- (id)transformDisplayConfiguration:(id)a3;
- (void)_evaluateForPhysicalDisplay:(id)a3 driver:(id)a4 profile:(id)a5;
- (void)activate;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displayMonitor:(id)a3 didDisconnectIdentity:(id)a4;
- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)evaluateProfilesForConnectedDisplays;
- (void)registerDisplayProfile:(id)a3;
@end

@implementation SSKDisplayProfileRegistry

- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3 displayMonitor:(id)a4 assertionCoordinator:(id)a5 builderClass:(Class)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_12:
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 49, @"Invalid parameter not satisfying: %@", @"displayMonitor" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_13;
  }
  v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 48, @"Invalid parameter not satisfying: %@", @"registry" object file lineNumber description];

  if (!v12) {
    goto LABEL_12;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_13:
  v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 50, @"Invalid parameter not satisfying: %@", @"assertionCoordinator" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)SSKDisplayProfileRegistry;
  v14 = [(SSKDisplayProfileRegistry *)&v30 init];
  if (v14)
  {
    if (!a6) {
      a6 = (Class)objc_opt_class();
    }
    v14->_ConfigBuilderClass = a6;
    if (([(objc_class *)a6 conformsToProtocol:&unk_2709B7C60] & 1) == 0)
    {
      v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:a2, v14, @"SSKDisplayProfileRegistry.m", 53, @"Invalid parameter not satisfying: %@", @"[_ConfigBuilderClass conformsToProtocol:@protocol(SSKDisplayConfigurationBuilding)]" object file lineNumber description];
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    uint64_t v17 = [v11 addTransformer:v14 withIdentifier:v16];
    transformerRegistryToken = v14->_transformerRegistryToken;
    v14->_transformerRegistryToken = (BSInvalidatable *)v17;

    objc_storeStrong((id *)&v14->_displayMonitor, a4);
    [(SSKDisplayMonitor *)v14->_displayMonitor setDelegate:v14];
    v19 = [[SSKDisplayAssertionCoordinatorPolicy alloc] initWithDisplayMonitor:v14->_displayMonitor];
    assertionCoordinatorPolicy = v14->_assertionCoordinatorPolicy;
    v14->_assertionCoordinatorPolicy = v19;

    objc_storeStrong((id *)&v14->_assertionCoordinator, a5);
    [(SSKDisplayAssertionCoordinator *)v14->_assertionCoordinator setDelegate:v14->_assertionCoordinatorPolicy];
    uint64_t v21 = [MEMORY[0x263EFF9C0] set];
    registeredProfiles = v14->_registeredProfiles;
    v14->_registeredProfiles = (NSMutableSet *)v21;

    v14->_lock._os_unfair_lock_opaque = 0;
    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    lock_rootDisplayDrivers = v14->_lock_rootDisplayDrivers;
    v14->_lock_rootDisplayDrivers = v23;
  }
  return v14;
}

- (SSKDisplayProfileRegistry)initWithDisplayTransformerRegistry:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(SSKDisplayMonitor);
  v6 = objc_alloc_init(SSKDisplayAssertionCoordinator);
  v7 = [(SSKDisplayProfileRegistry *)self initWithDisplayTransformerRegistry:v4 displayMonitor:v5 assertionCoordinator:v6 builderClass:self->_ConfigBuilderClass];

  return v7;
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x263F29C48] descriptionForRootObject:self];
}

- (void)activate
{
  id v5 = [(SSKDisplayMonitor *)self->_displayMonitor mainIdentity];
  displayMonitor = self->_displayMonitor;
  id v4 = [(SSKDisplayMonitor *)displayMonitor configurationForIdentity:v5];
  [(SSKDisplayProfileRegistry *)self displayMonitor:displayMonitor didConnectIdentity:v5 withConfiguration:v4];

  [(SSKDisplayMonitor *)self->_displayMonitor beginMonitoringForExternalDisplays];
}

- (void)evaluateProfilesForConnectedDisplays
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"-[SSKDisplayProfileRegistry evaluateProfilesForConnectedDisplays]"];
    [v16 handleFailureInFunction:v17 file:@"SSKDisplayProfileRegistry.m" lineNumber:96 description:@"this call must be made on the main thread"];
  }
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v3 = (void *)[(NSMutableDictionary *)self->_lock_rootDisplayDrivers copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        v9 = [v4 objectForKey:v8];
        v10 = [(SSKDisplayMonitor *)self->_displayMonitor configurationForIdentity:v8];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v11 = self->_registeredProfiles;
        uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              [(SSKDisplayProfileRegistry *)self _evaluateForPhysicalDisplay:v10 driver:v9 profile:*(void *)(*((void *)&v19 + 1) + 8 * j)];
            }
            uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v6);
  }
}

- (void)registerDisplayProfile:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    v16 = [NSString stringWithUTF8String:"-[SSKDisplayProfileRegistry registerDisplayProfile:]"];
    [v15 handleFailureInFunction:v16 file:@"SSKDisplayProfileRegistry.m" lineNumber:111 description:@"this call must be made on the main thread"];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 112, @"Invalid parameter not satisfying: %@", @"displayProfile" object file lineNumber description];

LABEL_3:
  if ([(NSMutableSet *)self->_registeredProfiles containsObject:v5])
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 113, @"attempting to register same profile twice: %@", v5 object file lineNumber description];
  }
  [(NSMutableSet *)self->_registeredProfiles addObject:v5];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_lock_rootDisplayDrivers copy];
  os_unfair_lock_unlock(&self->_lock);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [v7 objectForKey:v12];
        uint64_t v14 = [(SSKDisplayMonitor *)self->_displayMonitor configurationForIdentity:v12];
        [(SSKDisplayProfileRegistry *)self _evaluateForPhysicalDisplay:v14 driver:v13 profile:v5];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (id)displayProfileForIdentity:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[SSKDisplayProfileRegistry displayProfileForIdentity:]"];
    [v11 handleFailureInFunction:v12 file:@"SSKDisplayProfileRegistry.m" lineNumber:127 description:@"this call must be made on the main thread"];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 128, @"Invalid parameter not satisfying: %@", @"displayIdentity" object file lineNumber description];

LABEL_3:
  uint64_t v6 = [v5 rootIdentity];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers objectForKey:v6];
  if ([v8 isTrackingProfileForDisplay:v5])
  {
    uint64_t v9 = [v8 profileForDisplay:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)displayMonitor:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 rootIdentity];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers objectForKey:v9];
  if (!v10)
  {
    uint64_t v10 = [[SSKRootDisplayDriver alloc] initWithRootIdentity:v9 transformUpdater:self->_displayMonitor assertionCoordinator:self->_assertionCoordinator builderClass:self->_ConfigBuilderClass];
    [(NSMutableDictionary *)self->_lock_rootDisplayDrivers setObject:v10 forKey:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
  [(SSKRootDisplayDriver *)v10 displayConnected:v8];
  if ([v7 isRootIdentity])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = self->_registeredProfiles;
    uint64_t v12 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          -[SSKDisplayProfileRegistry _evaluateForPhysicalDisplay:driver:profile:](self, "_evaluateForPhysicalDisplay:driver:profile:", v8, v10, *(void *)(*((void *)&v16 + 1) + 8 * v15++), (void)v16);
        }
        while (v13 != v15);
        uint64_t v13 = [(NSMutableSet *)v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
}

- (void)displayMonitor:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  uint64_t v9 = [v13 rootIdentity];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  uint64_t v10 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers objectForKey:v9];
  if (!v10)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers allKeys];
    [v11 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 174, @"told a display [%@] -> root: [%@] is updating but we don't have a driver for it, currently have drivers for %@", v13, v9, v12 object file lineNumber description];
  }
  [v10 displayUpdated:v8];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)displayMonitor:(id)a3 didDisconnectIdentity:(id)a4
{
  id v10 = a4;
  uint64_t v6 = [v10 rootIdentity];
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers objectForKey:v6];
  if (!v7)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers allKeys];
    [v8 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 186, @"told a display [%@] -> root: [%@] is disconnecting but we don't have a driver for it, currently have drivers for %@", v10, v6, v9 object file lineNumber description];
  }
  [v7 displayDisconnected:v10];
  if (([v7 isTrackingDisplays] & 1) == 0) {
    [(NSMutableDictionary *)self->_lock_rootDisplayDrivers removeObjectForKey:v6];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)transformDisplayConfiguration:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v7 = [v5 identity];
  if (([v7 isRootIdentity] & 1) == 0)
  {
    long long v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 206, @"asked to transform a non-root identity [%@]", v7 object file lineNumber description];
  }
  id v8 = [(NSMutableDictionary *)self->_lock_rootDisplayDrivers objectForKey:v7];
  uint64_t v9 = v8;
  if (v8) {
    [v8 transformDisplayConfiguration:v5];
  }
  else {
  id v10 = [MEMORY[0x263EFFA08] setWithObject:v5];
  }
  os_unfair_lock_unlock(p_lock);
  id v11 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) identity];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v35 count:16];
    }
    while (v14);
  }

  long long v18 = SSKLogDisplayTransforming();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    long long v20 = [v5 identity];
    uint64_t v21 = [v12 count];
    *(_DWORD *)buf = 138544130;
    v28 = v20;
    __int16 v29 = 2114;
    objc_super v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v21;
    __int16 v33 = 2114;
    v34 = v11;
    _os_log_debug_impl(&dword_25C444000, v18, OS_LOG_TYPE_DEBUG, "Asked to transform %{public}@ and we're using the driver: %{public}@ and we got back %lu identities: %{public}@", buf, 0x2Au);
  }
  return v12;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  registeredProfiles = self->_registeredProfiles;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke;
  v16[3] = &unk_2654B1620;
  id v10 = v8;
  id v17 = v10;
  [v10 appendCollection:registeredProfiles withName:@"Registered Profiles" itemBlock:v16];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  lock_rootDisplayDrivers = self->_lock_rootDisplayDrivers;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke_2;
  v14[3] = &unk_2654B1648;
  id v15 = v10;
  id v13 = v10;
  [v13 appendDictionary:lock_rootDisplayDrivers withName:@"Display Drivers" itemBlock:v14];
  os_unfair_lock_unlock(p_lock);
}

id __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0];
}

id __58__SSKDisplayProfileRegistry_appendDescriptionToFormatter___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)[*(id *)(a1 + 32) appendObject:a3 withName:0];
}

- (void)_evaluateForPhysicalDisplay:(id)a3 driver:(id)a4 profile:(id)a5
{
  id v19 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 identity];
  char v12 = [v11 isRootIdentity];

  if ((v12 & 1) == 0)
  {
    long long v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 242, @"Invalid parameter not satisfying: %@", @"[[rootConfig identity] isRootIdentity]" object file lineNumber description];
  }
  id v13 = v19;
  if (!v19)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 243, @"Invalid parameter not satisfying: %@", @"driver" object file lineNumber description];

    id v13 = 0;
    if (v9) {
      goto LABEL_5;
    }
LABEL_14:
    long long v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SSKDisplayProfileRegistry.m", 244, @"Invalid parameter not satisfying: %@", @"profile" object file lineNumber description];

    id v13 = v19;
    goto LABEL_5;
  }
  if (!v9) {
    goto LABEL_14;
  }
LABEL_5:
  int v14 = [v13 isTrackingProfile:v9];
  int v15 = [v9 evaluatePhysicalDisplay:v10];

  if (!v14 || (v15 & 1) != 0)
  {
    if (((v14 | v15 ^ 1) & 1) == 0) {
      [v19 addProfile:v9];
    }
  }
  else
  {
    [v19 removeProfile:v9];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_rootDisplayDrivers, 0);
  objc_storeStrong((id *)&self->_registeredProfiles, 0);
  objc_storeStrong((id *)&self->_assertionCoordinatorPolicy, 0);
  objc_storeStrong((id *)&self->_assertionCoordinator, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_transformerRegistryToken, 0);
}

@end