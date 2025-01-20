@interface STLocalDynamicActivityAttributionManager
- (STLocalDynamicActivityAttributionManager)init;
- (id)currentAttributedAppForClient:(id)a3;
- (id)currentAttributionForAttribution:(id)a3;
- (id)currentAttributionForClient:(id *)a3;
- (id)currentAttributionKeyForClient:(id)a3;
- (void)_updateAttributionMapWithAttribution:(void *)a3 clientID:;
- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5;
- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5;
- (void)subscribeToUpdates:(id)a3;
- (void)unsubscribeFromUpdates:(id)a3;
@end

@implementation STLocalDynamicActivityAttributionManager

- (STLocalDynamicActivityAttributionManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)STLocalDynamicActivityAttributionManager;
  v2 = [(STLocalDynamicActivityAttributionManager *)&v12 init];
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    clientAttributionMap = v2->_clientAttributionMap;
    v2->_clientAttributionMap = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    monitorClients = v2->_monitorClients;
    v2->_monitorClients = v7;

    v9 = [[STDynamicActivityAttributionListener alloc] initWithServerHandle:v2];
    dynamicAttributionListener = v2->_dynamicAttributionListener;
    v2->_dynamicAttributionListener = v9;
  }
  return v2;
}

- (id)currentAttributionKeyForClient:(id)a3
{
  id v4 = a3;
  v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (v4)
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__STLocalDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke;
    block[3] = &unk_1E6B63170;
    objc_super v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(internalQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __75__STLocalDynamicActivityAttributionManager_currentAttributionKeyForClient___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v2 = [v5 localizationKey];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)currentAttributedAppForClient:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  if (v4)
  {
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__STLocalDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke;
    block[3] = &unk_1E6B63170;
    objc_super v12 = &v13;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(internalQueue, block);

    v7 = (void *)v14[5];
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __74__STLocalDynamicActivityAttributionManager_currentAttributedAppForClient___block_invoke(void *a1)
{
  id v5 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v2 = [v5 bundleIdentifier];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)currentAttributionForClient:(id *)a3
{
  long long v4 = *(_OWORD *)&a3->var0[4];
  long long v13 = *(_OWORD *)a3->var0;
  long long v14 = v4;
  id v5 = BSExecutablePathForAuditToken();
  v6 = [v5 lastPathComponent];

  if (v6)
  {
    *(void *)&long long v13 = 0;
    *((void *)&v13 + 1) = &v13;
    *(void *)&long long v14 = 0x3032000000;
    *((void *)&v14 + 1) = __Block_byref_object_copy_;
    uint64_t v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__STLocalDynamicActivityAttributionManager_currentAttributionForClient___block_invoke;
    block[3] = &unk_1E6B63170;
    objc_super v12 = &v13;
    block[4] = self;
    id v11 = v6;
    dispatch_sync(internalQueue, block);
    id v8 = *(id *)(*((void *)&v13 + 1) + 40);

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __72__STLocalDynamicActivityAttributionManager_currentAttributionForClient___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)currentAttributionForAttribution:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  long long v19 = 0u;
  long long v20 = 0u;
  if (v4) {
    [v4 auditToken];
  }
  long long v15 = v19;
  long long v16 = v20;
  v6 = BSExecutablePathForAuditToken();
  if (!v6)
  {
    [v5 pid];
    v6 = BSExecutablePathForPID();
  }
  v7 = [v6 lastPathComponent];
  id v8 = v7;
  if (v7)
  {
    *(void *)&long long v15 = 0;
    *((void *)&v15 + 1) = &v15;
    *(void *)&long long v16 = 0x3032000000;
    *((void *)&v16 + 1) = __Block_byref_object_copy_;
    v17 = __Block_byref_object_dispose_;
    id v18 = 0;
    if (self) {
      internalQueue = self->_internalQueue;
    }
    else {
      internalQueue = 0;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__STLocalDynamicActivityAttributionManager_currentAttributionForAttribution___block_invoke;
    block[3] = &unk_1E6B63170;
    long long v14 = &v15;
    block[4] = self;
    id v13 = v7;
    dispatch_sync(internalQueue, block);
    id v10 = *(id *)(*((void *)&v15 + 1) + 40);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __77__STLocalDynamicActivityAttributionManager_currentAttributionForAttribution___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __98__STLocalDynamicActivityAttributionManager_setLocalizableAttributionKey_andApplication_forClient___block_invoke;
  v15[3] = &unk_1E6B63198;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(internalQueue, v15);
}

void __98__STLocalDynamicActivityAttributionManager_setLocalizableAttributionKey_andApplication_forClient___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 56);
  unint64_t v4 = (unint64_t)*(id *)(a1 + 40);
  unint64_t v5 = v2;
  id v6 = v3;
  v7 = v6;
  if (v1)
  {
    if (v6) {
      [v6 auditToken];
    }
    memset(buf, 0, 32);
    id v8 = BSExecutablePathForAuditToken();
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 lastPathComponent];
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
      }
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        id v11 = STSystemStatusLogDynamicAttribution();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v4;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v5;
          _os_log_impl(&dword_1D9514000, v11, OS_LOG_TYPE_DEFAULT, "setAttributionKey:andApplication:forClient: updating dynamic attribution map with values ={%@ : (%@, %@)}", buf, 0x20u);
        }
      }
      if (v4 | v5)
      {
        memset(buf, 0, 32);
        id v12 = +[STDynamicActivityAttribution attributionForClientAuditToken:buf clientExecutablePath:v9 bundleID:v5 localizationKey:v4];
      }
      else
      {
        id v12 = 0;
      }
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v1, v12, v10);
    }
    else
    {
      id v10 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v13 = BSProcessDescriptionForAuditToken();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v13;
        _os_log_error_impl(&dword_1D9514000, v10, OS_LOG_TYPE_ERROR, "setAttributionKey:andApplication:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);
      }
    }
  }
}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)&a4->var0[4];
  long long v17 = *(_OWORD *)a4->var0;
  long long v18 = v11;
  block[2] = __107__STLocalDynamicActivityAttributionManager_setAttributionLocalizableKey_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E6B631C0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(internalQueue, block);
}

void __107__STLocalDynamicActivityAttributionManager_setAttributionLocalizableKey_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v18 = v4;
  unint64_t v5 = v1;
  id v6 = v3;
  v7 = v6;
  if (v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    if (v6) {
      [v6 auditToken];
    }
    *(_OWORD *)buf = v15;
    long long v20 = v16;
    id v8 = BSExecutablePathForAuditToken();
    if (v8)
    {
      *(_OWORD *)buf = v17;
      long long v20 = v18;
      uint64_t v9 = BSExecutablePathForAuditToken();
      if (v5 | v9)
      {
        *(_OWORD *)buf = v15;
        long long v20 = v16;
        v14[0] = v17;
        v14[1] = v18;
        id v10 = +[STDynamicActivityAttribution attributionForClientAuditToken:buf maskingClientAuditToken:v14 clientExecutablePath:v8 maskingClientExecutablePath:v9 localizationKey:v5];
      }
      else
      {
        id v10 = 0;
      }
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
      }
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        id v12 = STSystemStatusLogDynamicAttribution();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl(&dword_1D9514000, v12, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", buf, 0xCu);
        }
      }
      id v13 = [v8 lastPathComponent];
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v10, v13);
    }
    else
    {
      id v10 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = BSProcessDescriptionForAuditToken();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_error_impl(&dword_1D9514000, v10, OS_LOG_TYPE_ERROR, "setAttributionLocalizableKey:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);
      }
    }
  }
}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)&a4->var0[4];
  long long v17 = *(_OWORD *)a4->var0;
  long long v18 = v11;
  block[2] = __109__STLocalDynamicActivityAttributionManager_setAttributionStringWithFormat_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E6B631C0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(internalQueue, block);
}

void __109__STLocalDynamicActivityAttributionManager_setAttributionStringWithFormat_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v16 = *(_OWORD *)(a1 + 56);
  long long v17 = v4;
  id v5 = v1;
  id v6 = v3;
  if (v2)
  {
    if ([v5 containsString:@"%@"])
    {
      *(_OWORD *)buf = 0u;
      long long v15 = 0u;
      if (v6) {
        [v6 auditToken];
      }
      *(_OWORD *)long long v18 = *(_OWORD *)buf;
      long long v19 = v15;
      v7 = BSExecutablePathForAuditToken();
      if (v7)
      {
        *(_OWORD *)long long v18 = v16;
        long long v19 = v17;
        id v8 = BSExecutablePathForAuditToken();
        if (v5)
        {
          *(_OWORD *)long long v18 = *(_OWORD *)buf;
          long long v19 = v15;
          v13[0] = v16;
          v13[1] = v17;
          id v9 = +[STDynamicActivityAttribution attributionForClientAuditToken:v18 maskingClientAuditToken:v13 clientExecutablePath:v7 maskingClientExecutablePath:v8 stringWithFormat:v5];
        }
        else
        {
          id v9 = 0;
        }
        if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
          dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
        }
        if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
        {
          long long v11 = STSystemStatusLogDynamicAttribution();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long v18 = 138412290;
            *(void *)&v18[4] = v9;
            _os_log_impl(&dword_1D9514000, v11, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", v18, 0xCu);
          }
        }
        id v12 = [v7 lastPathComponent];
        -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v9, v12);
      }
      else
      {
        id v9 = STSystemStatusLogDynamicAttribution();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = BSProcessDescriptionForAuditToken();
          *(_DWORD *)long long v18 = 138412290;
          *(void *)&v18[4] = v10;
          _os_log_error_impl(&dword_1D9514000, v9, OS_LOG_TYPE_ERROR, "setAttributionStringWithFormat:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", v18, 0xCu);
        }
      }
    }
    else
    {
      v7 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9514000, v7, OS_LOG_TYPE_ERROR, "Attribution string with format did not include a wild card for the app name. Please include a %%@.", buf, 2u);
      }
    }
  }
}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v11 = *(_OWORD *)&a4->var0[4];
  long long v17 = *(_OWORD *)a4->var0;
  long long v18 = v11;
  block[2] = __106__STLocalDynamicActivityAttributionManager_setAttributionWebsiteString_maskingClientAuditToken_forClient___block_invoke;
  block[3] = &unk_1E6B631C0;
  block[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(internalQueue, block);
}

void __106__STLocalDynamicActivityAttributionManager_setAttributionWebsiteString_maskingClientAuditToken_forClient___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v18 = v4;
  id v5 = v1;
  id v6 = v3;
  v7 = v6;
  if (v2)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    if (v6) {
      [v6 auditToken];
    }
    *(_OWORD *)buf = v15;
    long long v20 = v16;
    id v8 = BSExecutablePathForAuditToken();
    if (v8)
    {
      *(_OWORD *)buf = v17;
      long long v20 = v18;
      id v9 = BSExecutablePathForAuditToken();
      if (v5)
      {
        *(_OWORD *)buf = v15;
        long long v20 = v16;
        v14[0] = v17;
        v14[1] = v18;
        id v10 = +[STDynamicActivityAttribution attributionForClientAuditToken:buf maskingClientAuditToken:v14 clientExecutablePath:v8 maskingClientExecutablePath:v9 website:v5];
      }
      else
      {
        id v10 = 0;
      }
      if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1) {
        dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_50);
      }
      if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
      {
        id v12 = STSystemStatusLogDynamicAttribution();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v10;
          _os_log_impl(&dword_1D9514000, v12, OS_LOG_TYPE_DEFAULT, "New dynamic attribution: %@", buf, 0xCu);
        }
      }
      id v13 = [v8 lastPathComponent];
      -[STLocalDynamicActivityAttributionManager _updateAttributionMapWithAttribution:clientID:](v2, v10, v13);
    }
    else
    {
      id v10 = STSystemStatusLogDynamicAttribution();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        long long v11 = BSProcessDescriptionForAuditToken();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v11;
        _os_log_error_impl(&dword_1D9514000, v10, OS_LOG_TYPE_ERROR, "setAttributionWebsiteString:maskingClientAuditToken:forClient: unable to get executable path from client audit token: %@", buf, 0xCu);
      }
    }
  }
}

- (void)subscribeToUpdates:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__STLocalDynamicActivityAttributionManager_subscribeToUpdates___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __63__STLocalDynamicActivityAttributionManager_subscribeToUpdates___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  if ([v2 count]) {
    [*(id *)(a1 + 40) currentAttributionsDidChange:v2];
  }
}

- (void)unsubscribeFromUpdates:(id)a3
{
  id v4 = a3;
  if (self) {
    internalQueue = self->_internalQueue;
  }
  else {
    internalQueue = 0;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke;
  v7[3] = &unk_1E6B63080;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

void __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke_2;
  v14[3] = &unk_1E6B631E8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  long long v17 = &v18;
  [v2 enumerateKeysAndObjectsUsingBlock:v14];

  [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
  if (*((unsigned char *)v19 + 24) && [*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = *(id *)(*(void *)(a1 + 32) + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "currentAttributionsDidChange:", v5, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v22 count:16];
      }
      while (v7);
    }
  }
  _Block_object_dispose(&v18, 8);
}

void __67__STLocalDynamicActivityAttributionManager_unsubscribeFromUpdates___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6) {
    [v6 clientAuditToken];
  }
  uint64_t v8 = BSVersionedPIDForAuditToken();
  uint64_t v9 = (void *)a1[4];
  if (v9) {
    [v9 auditToken];
  }
  if (v8 == BSVersionedPIDForAuditToken())
  {
    [*(id *)(a1[5] + 24) removeObjectForKey:v5];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

- (void)_updateAttributionMapWithAttribution:(void *)a3 clientID:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 24);
  if (v5) {
    [v7 setObject:v5 forKey:v6];
  }
  else {
    [v7 removeObjectForKey:v6];
  }
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v8 = [*(id *)(a1 + 24) allValues];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "currentAttributionsDidChange:", v8, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitorClients, 0);
  objc_storeStrong((id *)&self->_clientAttributionMap, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);

  objc_storeStrong((id *)&self->_dynamicAttributionListener, 0);
}

@end