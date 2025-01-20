@interface SSKDisplayMonitor
- (FBSDisplayIdentity)mainIdentity;
- (NSArray)connectedIdentities;
- (SSKDisplayMonitor)init;
- (SSKDisplayMonitor)initWithDisplaySource:(id)a3;
- (SSKDisplayMonitorDelegate)delegate;
- (id)addObserver:(id)a3;
- (id)configurationForIdentity:(id)a3;
- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5;
- (void)beginMonitoringForExternalDisplays;
- (void)dealloc;
- (void)displaySource:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displaySource:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5;
- (void)displaySource:(id)a3 willDisconnectIdentity:(id)a4;
- (void)setDelegate:(id)a3;
- (void)updateTransformsWithCompletion:(id)a3;
@end

@implementation SSKDisplayMonitor

- (SSKDisplayMonitor)init
{
  v3 = [SSKDisplaySource alloc];
  v4 = [MEMORY[0x263F3F430] sharedInstance];
  v5 = [(SSKDisplaySource *)v3 initWithDisplayManager:v4];
  v6 = [(SSKDisplayMonitor *)self initWithDisplaySource:v5];

  return v6;
}

- (SSKDisplayMonitor)initWithDisplaySource:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSKDisplayMonitor;
  v6 = [(SSKDisplayMonitor *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayManager, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connectedIdentityToRecordMap = v7->_connectedIdentityToRecordMap;
    v7->_connectedIdentityToRecordMap = v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    lock_observers = v7->_lock_observers;
    v7->_lock_observers = (NSHashTable *)v10;

    v12 = [(SSKDisplaySourcing *)v7->_displayManager mainConfiguration];
    v13 = [v12 identity];
    [(SSKDisplayMonitor *)v7 _connectToIdentity:v13 withConfiguration:v12 forDisplayManagerInit:1];
  }
  return v7;
}

- (void)dealloc
{
  [(SSKDisplaySourcing *)self->_displayManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SSKDisplayMonitor;
  [(SSKDisplayMonitor *)&v3 dealloc];
}

- (void)beginMonitoringForExternalDisplays
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(SSKDisplaySourcing *)self->_displayManager addObserver:self];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(SSKDisplaySourcing *)self->_displayManager connectedIdentities];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v8];

        if (!v9)
        {
          uint64_t v10 = [(SSKDisplaySourcing *)self->_displayManager configurationForIdentity:v8];
          [(SSKDisplayMonitor *)self _connectToIdentity:v8 withConfiguration:v10 forDisplayManagerInit:1];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)addObserver:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if ([(NSHashTable *)self->_lock_observers containsObject:v5])
  {
    long long v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SSKDisplayMonitor.m", 101, @"observer already registered: %@", v5 object file lineNumber description];
  }
  objc_initWeak(&location, self);
  id v6 = objc_alloc(MEMORY[0x263F29CD8]);
  v7 = [NSString stringWithFormat:&stru_2709A8A38];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__SSKDisplayMonitor_addObserver___block_invoke;
  v12[3] = &unk_2654B1580;
  objc_copyWeak(&v14, &location);
  id v8 = v5;
  id v13 = v8;
  v9 = (void *)[v6 initWithIdentifier:v7 forReason:@"displayCoordinator" invalidationBlock:v12];

  [(NSHashTable *)self->_lock_observers addObject:v8];
  os_unfair_lock_unlock(&self->_lock);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

void __33__SSKDisplayMonitor_addObserver___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = WeakRetained + 6;
    uint64_t v4 = (id *)WeakRetained;
    os_unfair_lock_lock(WeakRetained + 6);
    [v4[4] removeObject:*(void *)(a1 + 32)];
    os_unfair_lock_unlock(v3);
    WeakRetained = (os_unfair_lock_s *)v4;
  }
}

- (void)displaySource:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = SSKLogDisplayMonitor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = _SSKLoggingMethodProem(self, 1);
    long long v11 = [v8 _flbLoggingDescription];
    int v14 = 138543874;
    objc_super v15 = v10;
    __int16 v16 = 2114;
    v17 = v11;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl(&dword_25C444000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v14,
      0x20u);
  }
  long long v12 = [v8 hardwareIdentifier];
  if (v12) {
    goto LABEL_7;
  }
  if (([v8 isMainDisplay] & 1) == 0)
  {
    long long v12 = SSKLogDisplayMonitor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = _SSKLoggingMethodProem(self, 0);
      int v14 = 138544130;
      objc_super v15 = v13;
      __int16 v16 = 2114;
      v17 = @"connecting";
      __int16 v18 = 2114;
      id v19 = v7;
      __int16 v20 = 2114;
      id v21 = v8;
      _os_log_error_impl(&dword_25C444000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v14,
        0x2Au);
    }
LABEL_7:
  }
  [(SSKDisplayMonitor *)self _connectToIdentity:v7 withConfiguration:v8 forDisplayManagerInit:0];
}

- (void)_connectToIdentity:(id)a3 withConfiguration:(id)a4 forDisplayManagerInit:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  long long v11 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v9];
  long long v12 = [v10 hardwareIdentifier];
  if (v12)
  {

    goto LABEL_4;
  }
  if ([v10 isMainDisplay])
  {
LABEL_4:
    if ([v11 didConnectAtInit])
    {
      WeakRetained = SSKLogDisplayMonitor();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v24 = v9;
LABEL_13:
        _os_log_impl(&dword_25C444000, WeakRetained, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
        goto LABEL_16;
      }
    }
    else
    {
      if (v11)
      {
        objc_super v15 = [MEMORY[0x263F08690] currentHandler];
        [v15 handleFailureInMethod:a2, self, @"SSKDisplayMonitor.m", 134, @"told an identity is connecting when we're already tracking it. is frontboard telling us things out of order?: %@", v9 object file lineNumber description];
      }
      __int16 v16 = [[_SSKDisplayMonitorIdentityRecord alloc] initWithIdentity:v9 connectedAtInit:v5];

      [(NSMutableDictionary *)self->_connectedIdentityToRecordMap setObject:v16 forKey:v9];
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained) {
        [MEMORY[0x263EFFA08] setWithObject:WeakRetained];
      }
      else {
      v17 = [MEMORY[0x263EFFA08] set];
      }
      os_unfair_lock_assert_not_owner(&self->_lock);
      os_unfair_lock_lock(&self->_lock);
      __int16 v18 = (void *)[(NSHashTable *)self->_lock_observers copy];
      os_unfair_lock_unlock(&self->_lock);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __80__SSKDisplayMonitor__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke;
      aBlock[3] = &unk_2654B15A8;
      aBlock[4] = self;
      id v21 = v9;
      id v22 = v10;
      id v19 = (void (**)(void *, void *))_Block_copy(aBlock);
      v19[2](v19, v17);
      v19[2](v19, v18);

      long long v11 = v16;
    }
    goto LABEL_16;
  }
  WeakRetained = SSKLogDisplayMonitor();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v24 = v9;
    int v14 = "got a connect for an external display that is missing its hardwareIdentifier. ignoring: %{public}@";
    goto LABEL_13;
  }
LABEL_16:
}

void __80__SSKDisplayMonitor__connectToIdentity_withConfiguration_forDisplayManagerInit___block_invoke(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 displayMonitor:a1[4] didConnectIdentity:a1[5] withConfiguration:a1[6]];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)displaySource:(id)a3 didUpdateIdentity:(id)a4 withConfiguration:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v9 = SSKLogDisplayMonitor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = _SSKLoggingMethodProem(self, 1);
    long long v11 = [v8 _flbLoggingDescription];
    int v16 = 138543874;
    id v17 = v10;
    __int16 v18 = 2114;
    id v19 = v11;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_impl(&dword_25C444000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      (uint8_t *)&v16,
      0x20u);
  }
  long long v12 = [v8 hardwareIdentifier];
  if (!v12)
  {
    if ([v8 isMainDisplay]) {
      goto LABEL_8;
    }
    long long v12 = SSKLogDisplayMonitor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v15 = _SSKLoggingMethodProem(self, 0);
      int v16 = 138544130;
      id v17 = v15;
      __int16 v18 = 2114;
      id v19 = @"updating";
      __int16 v20 = 2114;
      id v21 = v7;
      __int16 v22 = 2114;
      id v23 = v8;
      _os_log_error_impl(&dword_25C444000, v12, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        (uint8_t *)&v16,
        0x2Au);
    }
  }

LABEL_8:
  id v13 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v7];
  if (v13)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0) {
      [WeakRetained displayMonitor:self didUpdateIdentity:v7 withConfiguration:v8];
    }
  }
  else
  {
    WeakRetained = SSKLogDisplayMonitor();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_impl(&dword_25C444000, WeakRetained, OS_LOG_TYPE_DEFAULT, "got an update for an identity that we aren't tracking. ignoring update: %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)displaySource:(id)a3 willDisconnectIdentity:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = [(SSKDisplaySourcing *)self->_displayManager configurationForIdentity:v5];
  id v7 = SSKLogDisplayMonitor();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = _SSKLoggingMethodProem(self, 1);
    long long v9 = [v6 _flbLoggingDescription];
    *(_DWORD *)buf = 138543874;
    id v34 = v8;
    __int16 v35 = 2114;
    v36 = v9;
    __int16 v37 = 2114;
    id v38 = v5;
    _os_log_impl(&dword_25C444000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@\n\tconfiguration: %{public}@;\n\tidentity: %{public}@",
      buf,
      0x20u);
  }
  long long v10 = [v6 hardwareIdentifier];
  if (!v10)
  {
    if ([v6 isMainDisplay]) {
      goto LABEL_8;
    }
    long long v10 = SSKLogDisplayMonitor();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = _SSKLoggingMethodProem(self, 0);
      *(_DWORD *)buf = 138544130;
      id v34 = v25;
      __int16 v35 = 2114;
      v36 = @"disconnecting";
      __int16 v37 = 2114;
      id v38 = v5;
      __int16 v39 = 2114;
      v40 = v6;
      _os_log_error_impl(&dword_25C444000, v10, OS_LOG_TYPE_ERROR, "%{public}@ told about a %{public}@ display with nil hardwareIdentifier. identity: %{public}@; configuration: %{public}@",
        buf,
        0x2Au);
    }
  }

LABEL_8:
  uint64_t v11 = [(NSMutableDictionary *)self->_connectedIdentityToRecordMap objectForKey:v5];
  long long v12 = (void *)v11;
  if (v11)
  {
    v26 = (void *)v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke;
    aBlock[3] = &unk_2654B15D0;
    aBlock[4] = self;
    id v28 = v5;
    id v13 = v5;
    id v32 = v13;
    uint64_t v14 = (void (**)(void *, void *))_Block_copy(aBlock);
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke_2;
    v29[3] = &unk_2654B15D0;
    v29[4] = self;
    id v15 = v13;
    id v30 = v15;
    int v16 = (void (**)(void *, void *))_Block_copy(v29);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v27 = v6;
    if (WeakRetained) {
      [MEMORY[0x263EFFA08] setWithObject:WeakRetained];
    }
    else {
    id v19 = [MEMORY[0x263EFFA08] set];
    }
    p_lock = &self->_lock;
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    id v21 = (void *)[(NSHashTable *)self->_lock_observers copy];
    os_unfair_lock_unlock(&self->_lock);
    v14[2](v14, v19);
    v14[2](v14, v21);
    [(NSMutableDictionary *)self->_connectedIdentityToRecordMap removeObjectForKey:v15];
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);

    if (v22) {
      [MEMORY[0x263EFFA08] setWithObject:v22];
    }
    else {
    id v23 = [MEMORY[0x263EFFA08] set];
    }

    v16[2](v16, v23);
    os_unfair_lock_assert_not_owner(&self->_lock);
    os_unfair_lock_lock(&self->_lock);
    uint64_t v24 = (void *)[(NSHashTable *)self->_lock_observers copy];

    os_unfair_lock_unlock(p_lock);
    v16[2](v16, v24);

    uint64_t v6 = v27;
    id v5 = v28;
    long long v12 = v26;
  }
  else
  {
    __int16 v18 = SSKLogDisplayMonitor();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v34 = v5;
      _os_log_impl(&dword_25C444000, v18, OS_LOG_TYPE_DEFAULT, "got a disconnect for an identity that we aren't tracking. ignoring disconnect: %{public}@", buf, 0xCu);
    }
  }
}

void __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 displayMonitor:*(void *)(a1 + 32) willDisconnectIdentity:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __58__SSKDisplayMonitor_displaySource_willDisconnectIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 displayMonitor:*(void *)(a1 + 32) didDisconnectIdentity:*(void *)(a1 + 40)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (SSKDisplayMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSKDisplayMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_connectedIdentityToRecordMap, 0);
  objc_storeStrong((id *)&self->_displayManager, 0);
}

- (void)updateTransformsWithCompletion:(id)a3
{
}

- (NSArray)connectedIdentities
{
  return (NSArray *)[(NSMutableDictionary *)self->_connectedIdentityToRecordMap allKeys];
}

- (FBSDisplayIdentity)mainIdentity
{
  return (FBSDisplayIdentity *)[(SSKDisplaySourcing *)self->_displayManager mainIdentity];
}

- (id)configurationForIdentity:(id)a3
{
  return (id)[(SSKDisplaySourcing *)self->_displayManager configurationForIdentity:a3];
}

@end