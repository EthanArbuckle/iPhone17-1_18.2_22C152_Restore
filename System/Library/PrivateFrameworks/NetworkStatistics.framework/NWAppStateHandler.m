@interface NWAppStateHandler
- (BOOL)currentForegroundStateForProcessWithPid:(int)a3;
- (BOOL)identifierShouldBeIgnored:(id)a3;
- (BOOL)rbsProcessStateToForeground:(id)a3;
- (NWAppStateHandler)init;
- (id)trackerForPid:(int)a3;
- (void)_removeStateTracker:(id)a3;
- (void)handleStateUpdate:(id)a3 forProcess:(id)a4;
@end

@implementation NWAppStateHandler

- (BOOL)currentForegroundStateForProcessWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = self->_appBundlesMonitored;
  objc_sync_enter(v5);
  v6 = [(NWAppStateHandler *)self trackerForPid:v3];
  LOBYTE(v3) = v6 != 0;

  objc_sync_exit(v5);
  return v3;
}

- (id)trackerForPid:(int)a3
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  appBundlesMonitored = self->_appBundlesMonitored;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__NWAppStateHandler_trackerForPid___block_invoke;
  v6[3] = &unk_264404E98;
  int v7 = a3;
  v6[4] = &v8;
  [(NSMutableDictionary *)appBundlesMonitored enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (void)handleStateUpdate:(id)a3 forProcess:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 identity];
  v9 = [v8 embeddedApplicationIdentifier];
  if (!v9)
  {
    v9 = [v8 xpcServiceIdentifier];
    if (!v9)
    {
      if (![v7 hasConsistentLaunchdJob]
        || ([v7 consistentJobLabel], (v9 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        uint64_t v10 = [v7 bundle];
        v9 = [v10 identifier];
      }
    }
  }
  if (![(NWAppStateHandler *)self identifierShouldBeIgnored:v9])
  {
    if (!v9)
    {
      v27 = NStatGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v7;
        _os_log_impl(&dword_21C4BC000, v27, OS_LOG_TYPE_ERROR, "handleStateUpdate no identifier from process %@", buf, 0xCu);
      }

      v12 = NStatGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v6;
        _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "handleStateUpdate failed identifier lookup was from update %@", buf, 0xCu);
      }
      goto LABEL_33;
    }
    uint64_t v11 = [v7 pid];
    v12 = pid_to_uuid(v11);
    id v13 = [v6 state];
    BOOL v14 = [(NWAppStateHandler *)self rbsProcessStateToForeground:v13];

    obj = self->_appBundlesMonitored;
    objc_sync_enter(obj);
    uint64_t v15 = [(NWAppStateHandler *)self trackerForPid:v11];
    v16 = (NWAppStateTracker *)v15;
    if (!v14)
    {
      if (v15) {
        [(NWAppStateHandler *)self _removeStateTracker:v15];
      }
      goto LABEL_32;
    }
    v17 = [v6 state];
    int v18 = [v17 taskState];

    if (v18)
    {
      if (!v16)
      {
LABEL_16:
        v25 = objc_alloc_init(NWAppStateTracker);

        if (!v25)
        {
          v16 = 0;
          goto LABEL_32;
        }
        [(NWAppStateTracker *)v25 setIdentifier:v9];
        [(NWAppStateTracker *)v25 setUuid:v12];
        [(NWAppStateTracker *)v25 setPid:v11];
        v26 = [(NSMutableDictionary *)self->_appBundlesMonitored objectForKeyedSubscript:v9];
        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          [(NSMutableDictionary *)self->_appBundlesMonitored setObject:v26 forKey:v9];
        }
        [v26 addObject:v25];
        goto LABEL_31;
      }
      v19 = [(NWAppStateTracker *)v16 uuid];
      char v20 = [v19 isEqual:v12];

      if (v20)
      {
        v21 = [(NWAppStateTracker *)v16 identifier];
        char v22 = [v21 isEqualToString:v9];

        if (v22)
        {
LABEL_32:

          objc_sync_exit(obj);
LABEL_33:

          goto LABEL_34;
        }
        v23 = [(NWAppStateTracker *)v16 identifier];
        v24 = NStatGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v31 = v11;
          *(_WORD *)&v31[4] = 2112;
          *(void *)&v31[6] = v9;
          __int16 v32 = 2112;
          v33 = v23;
          _os_log_impl(&dword_21C4BC000, v24, OS_LOG_TYPE_DEFAULT, "State change notification for pid %d now has bundle %@, not matching previous %@", buf, 0x1Cu);
        }

        [(NWAppStateHandler *)self _removeStateTracker:v16];
        goto LABEL_16;
      }
      v26 = NStatGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = [(NWAppStateTracker *)v16 uuid];
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v31 = v11;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = v12;
        __int16 v32 = 2112;
        v33 = v28;
        _os_log_impl(&dword_21C4BC000, v26, OS_LOG_TYPE_ERROR, "State change notification for pid %d has uuid %@, not matching previous %@", buf, 0x1Cu);
      }
    }
    else
    {
      v26 = NStatGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v31 = v16;
        _os_log_impl(&dword_21C4BC000, v26, OS_LOG_TYPE_ERROR, "Process state is unknown %@", buf, 0xCu);
      }
    }
    v25 = v16;
LABEL_31:

    v16 = v25;
    goto LABEL_32;
  }
LABEL_34:
}

void __35__NWAppStateHandler_trackerForPid___block_invoke(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v11 pid] == *(_DWORD *)(a1 + 40))
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v11);
          *a4 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)rbsProcessStateToForeground:(id)a3
{
  id v3 = a3;
  int v4 = [v3 taskState];
  if (v4 == 4 || v4 == 2)
  {
    id v6 = [v3 endowmentNamespaces];
    char v7 = [v6 containsObject:@"com.apple.frontboard.visibility"];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)identifierShouldBeIgnored:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (identifierShouldBeIgnored__onceToken != -1)
  {
    dispatch_once(&identifierShouldBeIgnored__onceToken, &__block_literal_global_0);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  char v5 = [(id)identifierShouldBeIgnored__kIdentifiersToIgnore containsObject:v4];
LABEL_6:

  return v5;
}

- (void)_removeStateTracker:(id)a3
{
  id v4 = a3;
  if (!v4) {
    -[NWAppStateHandler _removeStateTracker:]();
  }
  id v9 = v4;
  uint64_t v5 = [v4 identifier];
  if (!v5) {
    -[NWAppStateHandler _removeStateTracker:]();
  }
  id v6 = (void *)v5;
  char v7 = [(NSMutableDictionary *)self->_appBundlesMonitored objectForKeyedSubscript:v5];
  if (!v7) {
    -[NWAppStateHandler _removeStateTracker:]();
  }
  uint64_t v8 = v7;
  [v7 removeObject:v9];
  if (![v8 count]) {
    [(NSMutableDictionary *)self->_appBundlesMonitored removeObjectForKey:v6];
  }
}

void __47__NWAppStateHandler_identifierShouldBeIgnored___block_invoke()
{
  v0 = (void *)identifierShouldBeIgnored__kIdentifiersToIgnore;
  identifierShouldBeIgnored__kIdentifiersToIgnore = (uint64_t)&unk_26CCB1D38;
}

- (NWAppStateHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)NWAppStateHandler;
  v2 = [(NWAppStateHandler *)&v8 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    appBundlesMonitored = v2->_appBundlesMonitored;
    v2->_appBundlesMonitored = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    appsWithStates = v2->_appsWithStates;
    v2->_appsWithStates = v5;

    if (!v2->_appBundlesMonitored || !v2->_appsWithStates)
    {

      v2 = 0;
    }
  }
  objc_storeStrong(&sharedInstance, v2);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsWithStates, 0);
  objc_storeStrong((id *)&self->_appBundlesMonitored, 0);
}

- (void)_removeStateTracker:.cold.1()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 84, "stateTracker != nil");
}

- (void)_removeStateTracker:.cold.2()
{
  __assert_rtn("-[NWAppStateHandler _removeStateTracker:]", "NWAppStateHandler.m", 86, "identifier != nil");
}

- (void)_removeStateTracker:.cold.3()
{
}

@end