@interface SSKDisplayAssertionCoordinatorPolicy
- (SSKDisplayAssertionCoordinatorPolicy)init;
- (SSKDisplayAssertionCoordinatorPolicy)initWithDisplayMonitor:(id)a3;
- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4;
- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4;
- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6;
@end

@implementation SSKDisplayAssertionCoordinatorPolicy

- (SSKDisplayAssertionCoordinatorPolicy)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SSKDisplayAssertionCoordinatorPolicy.m" lineNumber:32 description:@"i don't think so tim"];

  return 0;
}

- (SSKDisplayAssertionCoordinatorPolicy)initWithDisplayMonitor:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSKDisplayAssertionCoordinatorPolicy;
  v6 = [(SSKDisplayAssertionCoordinatorPolicy *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayMonitor, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    rootIdentityToDisplayArrangementItems = v7->_rootIdentityToDisplayArrangementItems;
    v7->_rootIdentityToDisplayArrangementItems = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x263EFF9A0] dictionary];
    rootIdentityToCloneMirroringMode = v7->_rootIdentityToCloneMirroringMode;
    v7->_rootIdentityToCloneMirroringMode = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    rootIdentityToCloneMirroringModeTokens = v7->_rootIdentityToCloneMirroringModeTokens;
    v7->_rootIdentityToCloneMirroringModeTokens = (NSMutableDictionary *)v12;
  }
  return v7;
}

- (void)assertionCoordinator:(id)a3 updatedAssertionPreferences:(id)a4 oldPreferences:(id)a5 forDisplay:(id)a6
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a6;
  id v9 = a4;
  uint64_t v10 = SSKLogDisplayControlling();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = _SSKLoggingMethodProem(self, 1);
    int v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_25C444000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. reevaluating", (uint8_t *)&v16, 0xCu);
  }
  uint64_t v12 = [v9 displayArrangement];
  [(SSKDisplayAssertionCoordinatorPolicy *)self _setDisplayArrangementItem:v12 forDisplay:v8];

  uint64_t v13 = [v9 cloneMirroringMode];
  [(SSKDisplayAssertionCoordinatorPolicy *)self _setCloneMirroringMode:v13 forDisplay:v8];

  v14 = SSKLogDisplayControlling();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v15 = _SSKLoggingMethodProem(self, 1);
    int v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_25C444000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ assertion preferences changed. done reevaluating", (uint8_t *)&v16, 0xCu);
  }
}

- (void)_setDisplayArrangementItem:(id)a3 forDisplay:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_rootIdentityToDisplayArrangementItems objectForKey:v7];
  if (([(id)v8 isEqual:v6] & 1) == 0 && v6 | v8)
  {
    rootIdentityToDisplayArrangementItems = self->_rootIdentityToDisplayArrangementItems;
    id v30 = v7;
    if (v6) {
      [(NSMutableDictionary *)rootIdentityToDisplayArrangementItems setObject:v6 forKey:v7];
    }
    else {
      [(NSMutableDictionary *)rootIdentityToDisplayArrangementItems removeObjectForKey:v7];
    }
    v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableDictionary count](self->_rootIdentityToDisplayArrangementItems, "count", v8));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    obj = self->_rootIdentityToDisplayArrangementItems;
    uint64_t v10 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v33 = *(void *)v35;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v33) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = [(SSKDisplayMonitor *)self->_displayMonitor configurationForIdentity:*(void *)(*((void *)&v34 + 1) + 8 * v12)];
          v14 = [v13 hardwareIdentifier];
          displayMonitor = self->_displayMonitor;
          int v16 = [(id)v6 relativeDisplayIdentity];
          v17 = [(SSKDisplayMonitor *)displayMonitor configurationForIdentity:v16];

          uint64_t v18 = [v17 hardwareIdentifier];
          if (v14)
          {
            id v19 = objc_alloc(MEMORY[0x263F297F8]);
            uint64_t v20 = [(id)v6 edge];
            [(id)v6 offset];
            v21 = objc_msgSend(v19, "initWithDisplayUUID:relativeToDisplayUUID:alongEdge:atOffset:", v14, v18, v20);
            [v32 addObject:v21];
          }
          else
          {
            v21 = SSKLogDisplayControlling();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              v22 = _SSKLoggingMethodProem(self, 0);
              *(_DWORD *)buf = 138544386;
              v39 = v22;
              __int16 v40 = 2114;
              v41 = v13;
              __int16 v42 = 2114;
              unint64_t v43 = 0;
              __int16 v44 = 2114;
              v45 = v17;
              __int16 v46 = 2114;
              v47 = v18;
              _os_log_fault_impl(&dword_25C444000, v21, OS_LOG_TYPE_FAULT, "%{public}@ got nil displayUUIDs, which shouldn't be happening for newly active assertions. rootDisplayConfig: %{public}@; rootDisplayUUID: %{public}@; relativeDisplayConfig: %{public}@; relativeDisplayUUID: %{public}@",
                buf,
                0x34u);
            }
          }

          ++v12;
        }
        while (v11 != v12);
        uint64_t v11 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v34 objects:v48 count:16];
      }
      while (v11);
    }

    v23 = SSKLogDisplayControlling();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      id v7 = v30;
      if (v24)
      {
        v25 = _SSKLoggingMethodProem(self, 1);
        *(_DWORD *)buf = 138544130;
        v39 = v25;
        __int16 v40 = 2114;
        v41 = v30;
        __int16 v42 = 2114;
        unint64_t v43 = v6;
        __int16 v44 = 2114;
        v45 = v32;
        v26 = "%{public}@ %{public}@ display arrangement item changed: %{public}@\n"
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        uint32_t v28 = 42;
LABEL_22:
        _os_log_impl(&dword_25C444000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
      }
    }
    else
    {
      id v7 = v30;
      if (v24)
      {
        v25 = _SSKLoggingMethodProem(self, 1);
        *(_DWORD *)buf = 138543874;
        v39 = v25;
        __int16 v40 = 2114;
        v41 = v30;
        __int16 v42 = 2114;
        unint64_t v43 = (unint64_t)v32;
              "updating backboard with global arrangement: %{public}@";
        v27 = v23;
        uint32_t v28 = 32;
        goto LABEL_22;
      }
    }

    BKSDisplayServicesSetArrangement();
    uint64_t v8 = v29;
  }
}

- (void)_setCloneMirroringMode:(unint64_t)a3 forDisplay:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a4;
  if (([v7 isRootIdentity] & 1) == 0)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SSKDisplayAssertionCoordinatorPolicy.m", 93, @"Invalid parameter not satisfying: %@", @"[rootIdentity isRootIdentity]" object file lineNumber description];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringMode objectForKey:v7];
  uint64_t v9 = [v8 unsignedIntegerValue];

  if (!a3)
  {
    uint64_t v12 = SSKLogDisplayControlling();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = _SSKLoggingMethodProem(self, 1);
      v14 = SSKDisplayCloneMirroringModeDescription(0);
      *(_DWORD *)buf = 138543618;
      id v30 = v13;
      __int16 v31 = 2114;
      v32 = v14;
    }
    objc_super v15 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens objectForKey:v7];
    [v15 invalidate];
    [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringMode removeObjectForKey:v7];
    goto LABEL_18;
  }
  if (v9 != a3)
  {
    rootIdentityToCloneMirroringMode = self->_rootIdentityToCloneMirroringMode;
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)rootIdentityToCloneMirroringMode setObject:v11 forKey:v7];

    if (a3 != 1 && a3 != 2)
    {
      int v16 = [MEMORY[0x263F08690] currentHandler];
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SSKDisplayAssertionCoordinatorPolicy.m", 112, @"unexpected mirroring mode: %lu", a3);
    }
    if ([v7 isMainDisplay])
    {
      objc_super v15 = SSKLogDisplayControlling();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = _SSKLoggingMethodProem(self, 1);
        uint64_t v18 = SSKDisplayCloneMirroringModeDescription(v9);
        id v19 = SSKDisplayCloneMirroringModeDescription(a3);
        *(_DWORD *)buf = 138543874;
        id v30 = v17;
        __int16 v31 = 2114;
        v32 = v18;
        __int16 v33 = 2114;
        long long v34 = v19;
      }
    }
    else
    {
      objc_super v15 = [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens objectForKey:v7];
      uint32_t v28 = [(SSKDisplayMonitor *)self->_displayMonitor configurationForIdentity:v7];
      uint64_t v20 = [v28 hardwareIdentifier];
      v21 = BKSDisplayServicesSetMainDisplayCloneMirroringModeForDestinationDisplay();
      v22 = SSKLogDisplayControlling();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = _SSKLoggingMethodProem(self, 1);
        BOOL v24 = SSKDisplayCloneMirroringModeDescription(v9);
        v25 = SSKDisplayCloneMirroringModeDescription(a3);
        v26 = NSStringFromBKSDisplayServicesCloneMirroringMode();
        *(_DWORD *)buf = 138544130;
        id v30 = v23;
        __int16 v31 = 2114;
        v32 = v24;
        __int16 v33 = 2114;
        long long v34 = v25;
        __int16 v35 = 2114;
        long long v36 = v26;
      }
      [(NSMutableDictionary *)self->_rootIdentityToCloneMirroringModeTokens setObject:v21 forKey:v7];
      [v15 invalidate];
    }
LABEL_18:
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringModeTokens, 0);
  objc_storeStrong((id *)&self->_rootIdentityToCloneMirroringMode, 0);
  objc_storeStrong((id *)&self->_rootIdentityToDisplayArrangementItems, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
}

@end