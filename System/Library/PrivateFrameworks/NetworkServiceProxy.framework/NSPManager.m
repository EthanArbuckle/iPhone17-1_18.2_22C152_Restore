@interface NSPManager
+ (id)sharedManager;
- (BOOL)currentNetworkHasProxies;
- (BOOL)disableIdleTimeout;
- (BOOL)isEnabled;
- (BOOL)isFirstTunnel;
- (BOOL)isObserving;
- (BOOL)shouldSetConfigurationToAppRule:(id)a3 edgeSet:(id)a4;
- (BOOL)testFetchDaypass;
- (BOOL)useTestDaypass;
- (BOOL)useTestLatencyMap;
- (NPKeyBag)inUseKeybag;
- (NPKeyBag)keybag;
- (NSArray)currentAgents;
- (NSArray)testLatencyMap;
- (NSDictionary)appRules;
- (NSMutableArray)knownFlows;
- (NSMutableDictionary)fallbackCounts;
- (NSMutableDictionary)flowInfoMap;
- (NSPAppRule)matchingAppRule;
- (NSPConfiguration)configuration;
- (NSPFlowDivert)flowDivert;
- (NSPManager)init;
- (NSPManagerDelegate)delegate;
- (NSString)signingIdentifier;
- (NWPathEvaluator)pathEvaluator;
- (NWPathEvaluator)policyEvaluator;
- (OS_nw_endpoint)currentTunnelEndpoint;
- (double)timeIntervalSinceLastUsage;
- (id)buildTestLatencyMap:(id)a3;
- (id)changeHandler;
- (id)connectionInfoSetHandler;
- (id)createAppRuleMapWithRules:(id)a3;
- (id)createReplacementEndpointForEndpoint:(id)a3 properties:(id)a4;
- (id)createTransformsForEndpoint:(id)a3 parameters:(id)a4;
- (id)getAppRuleMatchingParameters:(id)a3 flowProperties:(id)a4;
- (id)getConnectionInfoForIdentifier:(id)a3;
- (id)instantiateFlowWithTunnel:(id)a3 inputProtocol:(nw_protocol *)a4;
- (id)instantiateTunnelWithEndpoint:(id)a3 parameters:(id)a4;
- (id)pendingCancellationHandler;
- (id)tunnelConnectedHandler;
- (unint64_t)getTestLatencyRTT:(id)a3 parameters:(networkParameters *)a4;
- (unint64_t)testLatencyMapIndex;
- (unsigned)nextFlowID;
- (unsigned)tunnelCount;
- (void)container:(id)a3 didFailWithError:(id)a4;
- (void)container:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4;
- (void)container:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5;
- (void)container:(id)a3 didStartWithError:(id)a4;
- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5;
- (void)handlePolicyUpdate;
- (void)ingestTestLatencyMap:(id)a3 local:(BOOL)a4 completionHandler:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resetTestLatencyMapIndex:(unint64_t)a3;
- (void)sendUsageReport:(id)a3;
- (void)setAppRules:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConnectionInfo:(id)a3 forIdentifier:(id)a4;
- (void)setConnectionInfoSetHandler:(id)a3;
- (void)setCurrentAgents:(id)a3;
- (void)setCurrentTunnelEndpoint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableIdleTimeout:(BOOL)a3;
- (void)setFlowDivert:(id)a3;
- (void)setFlowInfoMap:(id)a3;
- (void)setInUseKeybag:(id)a3;
- (void)setIsObserving:(BOOL)a3;
- (void)setKeybag:(id)a3;
- (void)setMatchingAppRule:(id)a3;
- (void)setNextFlowID:(unsigned int)a3;
- (void)setPendingCancellationHandler:(id)a3;
- (void)setTestFetchDaypass:(BOOL)a3;
- (void)setTestLatencyMap:(id)a3;
- (void)setTestLatencyMapIndex:(unint64_t)a3;
- (void)setTunnelConnectedHandler:(id)a3;
- (void)setTunnelCount:(unsigned int)a3;
- (void)start;
- (void)startWithConfiguration:(id)a3 appRules:(id)a4 delegate:(id)a5;
- (void)stopWithCompletionHandler:(id)a3;
- (void)tunnel:(id)a3 flowDidFallbackWithReason:(int64_t)a4;
- (void)tunnelDidCancel:(id)a3;
- (void)tunnelDidConnect:(id)a3;
- (void)tunnelIsReady:(id)a3;
- (void)waitForTunnelsToCancelWithCompletionHandler:(id)a3;
@end

@implementation NSPManager

+ (id)sharedManager
{
  if (qword_1EB53BF48 != -1) {
    dispatch_once(&qword_1EB53BF48, &__block_literal_global_14);
  }
  v2 = (void *)qword_1EB53BF40;
  return v2;
}

void __27__NSPManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(NSPManager);
  v1 = (void *)qword_1EB53BF40;
  qword_1EB53BF40 = (uint64_t)v0;

  _MergedGlobals_40 = 0;
}

- (NSPManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)NSPManager;
  v2 = [(NSPManager *)&v15 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F38C20] sharedDefaultEvaluator];
    pathEvaluator = v2->_pathEvaluator;
    v2->_pathEvaluator = (NWPathEvaluator *)v3;

    id v5 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    [v5 setAccount:@"com.apple.NetworkServiceProxy"];
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:0 parameters:v5];
    policyEvaluator = v2->_policyEvaluator;
    v2->_policyEvaluator = (NWPathEvaluator *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fallbackCounts = v2->_fallbackCounts;
    v2->_fallbackCounts = v8;

    uint64_t v10 = getSigningIdentifier();
    signingIdentifier = v2->_signingIdentifier;
    v2->_signingIdentifier = (NSString *)v10;

    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:11];
    knownFlows = v2->_knownFlows;
    v2->_knownFlows = (NSMutableArray *)v12;

    v2->lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)waitForTunnelsToCancelWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&self->lock);
  if (self->_tunnelCount)
  {
    id v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unsigned int tunnelCount = self->_tunnelCount;
      v10[0] = 67109120;
      v10[1] = tunnelCount;
      _os_log_debug_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEBUG, "Waiting for %u tunnels to close", (uint8_t *)v10, 8u);
    }

    uint64_t v6 = (void *)MEMORY[0x1A622B750](v4);
    id pendingCancellationHandler = self->_pendingCancellationHandler;
    self->_id pendingCancellationHandler = v6;

    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->lock);
    if (v4)
    {
      v8 = nplog_obj();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v10[0]) = 0;
        _os_log_debug_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEBUG, "No open tunnels, not waiting", (uint8_t *)v10, 2u);
      }

      v4[2](v4);
    }
  }
}

- (void)stopWithCompletionHandler:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->lock);
  if (self->_isObserving)
  {
    self->_isObserving = 0;
    [(NWPathEvaluator *)self->_pathEvaluator removeObserver:self forKeyPath:@"path" context:self];
  }
  os_unfair_lock_unlock(&self->lock);
  objc_storeWeak((id *)&self->_delegate, 0);
  [(NSPManager *)self setMatchingAppRule:0];
  [(NSPManager *)self setConfiguration:0];
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }
}

- (void)handlePolicyUpdate
{
  v2 = self;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NWPathEvaluator *)self->_policyEvaluator path];
  v4 = [v3 networkAgentsOfType:objc_opt_class()];

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (-[NSArray count](v2->_currentAgents, "count") && [v4 count])
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v60 objects:v67 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v61;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v61 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ![(NSArray *)v2->_currentAgents containsObject:v11])
          {

            goto LABEL_16;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v60 objects:v67 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v12 = nplog_obj();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "All agents matched, not updating from new agents", buf, 2u);
    }
    v13 = 0;
    v14 = 0;
    objc_super v15 = 0;
    goto LABEL_65;
  }
LABEL_16:
  objc_storeStrong((id *)&v2->_currentAgents, v4);
  if ([v4 count])
  {
    v54 = v2;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    v53 = v4;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      v13 = 0;
      objc_super v15 = 0;
      uint64_t v19 = *(void *)v57;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(id *)(*((void *)&v56 + 1) + 8 * v20);
          [v21 parseAgentData];
          v22 = [v21 appRule];

          if (v22)
          {
            v23 = nplog_obj();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v31 = [v21 agentUUID];
              *(_DWORD *)buf = 138412290;
              v65 = v31;
              _os_log_debug_impl(&dword_1A0FEE000, v23, OS_LOG_TYPE_DEBUG, "Got config agent with UUID %@", buf, 0xCu);
            }
            v24 = [v21 appRule];
            [v5 addObject:v24];

            uint64_t v25 = [v21 configuration];

            objc_super v15 = (void *)v25;
          }
          else
          {
            v26 = [v21 keybag];

            if (v26)
            {
              v27 = nplog_obj();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                v32 = [v21 agentUUID];
                *(_DWORD *)buf = 138412290;
                v65 = v32;
                _os_log_debug_impl(&dword_1A0FEE000, v27, OS_LOG_TYPE_DEBUG, "Got keybag agent with UUID %@", buf, 0xCu);
              }
              v28 = [NPKeyBag alloc];
              v29 = [v21 keybag];
              v30 = [(NPKeyBag *)v28 initWithData:v29];

              if (v30)
              {
                [(NPKeyBag *)v30 createOnRamps];
                [(NPKeyBag *)v30 logWithMessage:@"Got a new keybag from the kernel" identifier:&stru_1EF4275C8];
                [(NSPManager *)v54 setKeybag:v30];
                v13 = v30;
              }
              else
              {
                v13 = 0;
              }
            }
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v33 = [v16 countByEnumeratingWithState:&v56 objects:v66 count:16];
        uint64_t v18 = v33;
      }
      while (v33);
    }
    else
    {
      v13 = 0;
      objc_super v15 = 0;
    }

    v4 = v53;
    v2 = v54;
  }
  else
  {
    v13 = 0;
    objc_super v15 = 0;
  }
  [v15 setAppRules:v5];
  [(NSPManager *)v2 setConfiguration:v15];
  v34 = [(NSPManager *)v2 createAppRuleMapWithRules:v5];
  [(NSPManager *)v2 setAppRules:v34];

  v35 = [(NSPManager *)v2 appRules];
  v14 = [v35 objectForKeyedSubscript:v2->_signingIdentifier];

  v36 = [(NSPManager *)v2 matchingAppRule];

  if (!v15 || !v14)
  {
    if (!v36) {
      goto LABEL_61;
    }
    v39 = [(NSPManager *)v2 flowDivert];

    if (!v39)
    {
      [(NSPManager *)v2 stopWithCompletionHandler:&__block_literal_global_24];
      goto LABEL_61;
    }
    v40 = [(NSPManager *)v2 flowDivert];
    [v40 stop];
    goto LABEL_60;
  }
  if (v36)
  {
    v37 = [(NSPManager *)v2 matchingAppRule];
    int v38 = [v37 isEqual:v14] ^ 1;
  }
  else
  {
    int v38 = 1;
  }
  [(NSPManager *)v2 setMatchingAppRule:v14];
  os_unfair_lock_lock(&v2->lock);
  if (!v2->_isObserving)
  {
    [(NWPathEvaluator *)v2->_pathEvaluator addObserver:v2 forKeyPath:@"path" options:0 context:v2];
    v2->_isObserving = 1;
  }
  os_unfair_lock_unlock(&v2->lock);
  +[NPTunnel initializeProtocol];
  +[NPDirectFlow initializeProtocol];
  v41 = [v14 useLocalFlowDivert];
  int v42 = [v41 BOOLValue];

  if (v42)
  {
    v43 = [(NSPManager *)v2 flowDivert];

    if (!v43)
    {
      v44 = nplog_obj();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = [v14 matchSigningIdentifier];
        *(_DWORD *)buf = 138412290;
        v65 = v45;
        _os_log_impl(&dword_1A0FEE000, v44, OS_LOG_TYPE_INFO, "Setting up local flow divert for %@", buf, 0xCu);
      }
      v46 = [[NSPFlowDivert alloc] initWithDelegate:v2 providerClass:objc_opt_class() configuration:v15];
      [(NSPManager *)v2 setFlowDivert:v46];
    }
    v47 = [(NSPManager *)v2 flowDivert];

    if (v47)
    {
      v48 = [(NSPManager *)v2 configuration];
      uint64_t v49 = [(NSPManager *)v2 flowDivert];
      [(id)v49 setConfiguration:v48];

      v50 = [(NSPManager *)v2 flowDivert];
      LOBYTE(v49) = [v50 started];

      if (v49)
      {
        if (!v38) {
          goto LABEL_61;
        }
        v51 = [(NSPManager *)v2 flowDivert];
        [v51 setShouldResetPolicies:1];

        v40 = [(NSPManager *)v2 flowDivert];
        [v40 resetPolicies:1];
      }
      else
      {
        v40 = [(NSPManager *)v2 flowDivert];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __32__NSPManager_handlePolicyUpdate__block_invoke;
        v55[3] = &unk_1E5A3BE40;
        v55[4] = v2;
        [v40 startWithOptions:MEMORY[0x1E4F1CC08] completionHandler:v55];
      }
LABEL_60:
    }
  }
LABEL_61:
  v52 = [(NSPManager *)v2 changeHandler];

  if (v52)
  {
    uint64_t v12 = [(NSPManager *)v2 changeHandler];
    if (qword_1EB53BF58 != -1) {
      dispatch_once(&qword_1EB53BF58, &__block_literal_global_26);
    }
    dispatch_async((dispatch_queue_t)qword_1EB53BF50, v12);
LABEL_65:
  }
}

void __32__NSPManager_handlePolicyUpdate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_error_impl(&dword_1A0FEE000, v4, OS_LOG_TYPE_ERROR, "NSP flow divert stopped (%@)", (uint8_t *)&v6, 0xCu);
  }

  id v5 = [*(id *)(a1 + 32) flowDivert];
  [v5 teardown];
}

uint64_t __32__NSPManager_handlePolicyUpdate__block_invoke_2()
{
  dispatch_queue_t v0 = dispatch_queue_create("NSPManager change handler queue", 0);
  uint64_t v1 = qword_1EB53BF50;
  qword_1EB53BF50 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [v10 isEqualToString:@"path"];
  if (a6 == self && v13)
  {
    if (*((id *)a6 + 3) == v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)a6 + 2);
      [*((id *)a6 + 15) removeAllObjects];
      os_unfair_lock_unlock((os_unfair_lock_t)a6 + 2);
    }
    else if (*((id *)a6 + 8) == v11)
    {
      [a6 handlePolicyUpdate];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)NSPManager;
    [(NSPManager *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)start
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19__NSPManager_start__block_invoke;
  block[3] = &unk_1E5A3B240;
  block[4] = self;
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, block);
  }
}

uint64_t __19__NSPManager_start__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 64) addObserver:*(void *)(a1 + 32) forKeyPath:@"path" options:4 context:*(void *)(a1 + 32)];
}

- (void)startWithConfiguration:(id)a3 appRules:(id)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(NSPManager *)self createAppRuleMapWithRules:a4];
  [(NSPManager *)self setAppRules:v10];

  [(NSPManager *)self setConfiguration:v9];
  objc_storeWeak((id *)&self->_delegate, v8);

  +[NPTunnel initializeProtocol];
  +[NPDirectFlow initializeProtocol];
}

- (id)instantiateFlowWithTunnel:(id)a3 inputProtocol:(nw_protocol *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self->_signingIdentifier;
  id v8 = (void (*)(nw_protocol *))*((void *)a4->callbacks + 14);
  if (v8)
  {
    id v9 = v8(a4);
    if (v9)
    {
      uint64_t v10 = nw_parameters_copy_metadata();
      id v11 = (void *)v10;
      if (v10 && MEMORY[0x1A622BC50](v10) == MEMORY[0x1E4F14580])
      {
        id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        bytes_ptr = xpc_data_get_bytes_ptr(v11);
        objc_super v15 = (void *)[v13 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v11) freeWhenDone:0];
        id v12 = createPropertiesFromMetaData(v15);
      }
      else
      {
        id v12 = 0;
      }
      uint64_t effective_bundle_id = nw_parameters_get_effective_bundle_id();
      if (effective_bundle_id)
      {
        uint64_t v17 = [NSString stringWithUTF8String:effective_bundle_id];

        id v7 = (NSString *)v17;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v18 = [(NSPManager *)self appRules];
  uint64_t v19 = [v18 objectForKeyedSubscript:v7];

  if (!v19)
  {
    uint64_t v25 = nplog_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_25:

LABEL_26:
      v22 = 0;
      goto LABEL_27;
    }
    LOWORD(v29[0]) = 0;
    v26 = "Failed to find a matching app rule";
LABEL_34:
    _os_log_error_impl(&dword_1A0FEE000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)v29, 2u);
    goto LABEL_25;
  }
  if (!v12)
  {
    uint64_t v25 = nplog_obj();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_25;
    }
    LOWORD(v29[0]) = 0;
    v26 = "No flow properties available, failed to create a new flow";
    goto LABEL_34;
  }
  uint64_t v20 = (objc_class *)objc_opt_class();
  if ([v12 dataMode] == 1)
  {
    id v21 = [v19 label];
    [v21 isEqualToString:@"dns"];

    uint64_t v20 = (objc_class *)objc_opt_class();
  }
  v22 = (void *)[[v20 alloc] initWithTunnel:v6 appRule:v19 inputProtocol:a4 extraProperties:v12];
  v23 = nplog_obj();
  v24 = v23;
  if (!v22)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29[0]) = 0;
      _os_log_error_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_ERROR, "Failed to create a new flow", (uint8_t *)v29, 2u);
    }

    goto LABEL_26;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v28 = [v22 extraFlowProperties];
    v29[0] = 67109120;
    v29[1] = [v28 flowIdentifier];
    _os_log_debug_impl(&dword_1A0FEE000, v24, OS_LOG_TYPE_DEBUG, "Created new flow %u", (uint8_t *)v29, 8u);
  }
  if ([v12 isLoopback])
  {
    [v22 setFallbackDisabled:1];
    [v22 setShouldComposeIntialData:0];
  }
LABEL_27:

  return v22;
}

- (id)instantiateTunnelWithEndpoint:(id)a3 parameters:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_signingIdentifier;
  if (g_recordTimestamps)
  {
    uint64_t v9 = mach_absolute_time();
    if (v7) {
      goto LABEL_3;
    }
LABEL_7:
    id v12 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = 0;
  if (!v7) {
    goto LABEL_7;
  }
LABEL_3:
  uint64_t v10 = nw_parameters_copy_metadata();
  id v11 = (void *)v10;
  if (v10 && MEMORY[0x1A622BC50](v10) == MEMORY[0x1E4F14580])
  {
    id v13 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    bytes_ptr = xpc_data_get_bytes_ptr(v11);
    objc_super v15 = (void *)[v13 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v11) freeWhenDone:0];
    id v12 = createPropertiesFromMetaData(v15);
  }
  else
  {
    id v12 = 0;
  }

LABEL_10:
  uint64_t v16 = [(NSPManager *)self matchingAppRule];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
  }
  else
  {
    uint64_t effective_bundle_id = nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id)
    {
      uint64_t v19 = [NSString stringWithUTF8String:effective_bundle_id];

      id v8 = (NSString *)v19;
    }
    uint64_t v20 = [(NSPManager *)self appRules];
    uint64_t v17 = [v20 objectForKeyedSubscript:v8];

    if (!v17)
    {
      uint64_t v25 = 0;
      goto LABEL_22;
    }
  }
  id v21 = [(NSPManager *)self inUseKeybag];
  v22 = [v21 getOnRampForEndpoint:v6];

  int v23 = [v12 isLoopback];
  v24 = off_1E5A3AB48;
  if (!v23) {
    v24 = off_1E5A3AB38;
  }
  uint64_t v25 = (void *)[objc_alloc(*v24) initWithEndpoint:v6 parameters:v7 appRule:v17 flowProperties:v12 onRamp:v22 delegate:self];
  if (v25)
  {
    os_unfair_lock_lock(&self->lock);
    ++self->_tunnelCount;
    os_unfair_lock_unlock(&self->lock);
    v26 = nplog_obj();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [v25 identifier];
      [v22 dayPassUUID];
      id v35 = v6;
      v28 = v8;
      uint64_t v30 = v29 = v9;
      *(_DWORD *)buf = 138412546;
      v37 = v27;
      __int16 v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_DEFAULT, "Added tunnel %@ using key %@", buf, 0x16u);

      uint64_t v9 = v29;
      id v8 = v28;
      id v6 = v35;
    }
  }

LABEL_22:
  uint64_t v31 = [v25 timestamps];
  if (v31)
  {
    if (g_recordTimestamps)
    {
      uint64_t v32 = v31;
      if (!*(void *)(v31 + 24))
      {
        if (!v9) {
          uint64_t v9 = mach_absolute_time();
        }
        *(void *)(v32 + 24) = v9;
      }
    }
  }
  uint64_t v33 = [v25 timestamps];
  if (v33 && g_recordTimestamps && !*(void *)(v33 + 32)) {
    *(void *)(v33 + 32) = mach_absolute_time();
  }
  _MergedGlobals_40 = 1;

  return v25;
}

- (void)tunnelDidCancel:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v17 = 138412290;
    uint64_t v18 = v6;
    _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Removed tunnel %@", (uint8_t *)&v17, 0xCu);
  }
  os_unfair_lock_lock(&self->lock);
  if (self->_currentTunnelEndpoint)
  {
    id v7 = objc_msgSend(MEMORY[0x1E4F38BE8], "endpointWithCEndpoint:");
    id v8 = (void *)MEMORY[0x1E4F38BE8];
    uint64_t v9 = [v4 endpoint];
    uint64_t v10 = [v8 endpointWithCEndpoint:v9];

    if ([v7 isEqual:v10])
    {

      id v7 = 0;
    }
  }
  unsigned int tunnelCount = self->_tunnelCount;
  if (!tunnelCount) {
    goto LABEL_11;
  }
  self->_unsigned int tunnelCount = tunnelCount - 1;
  id v12 = nplog_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v16 = self->_tunnelCount;
    int v17 = 67109120;
    LODWORD(v18) = v16;
    _os_log_debug_impl(&dword_1A0FEE000, v12, OS_LOG_TYPE_DEBUG, "Tunnel count is now %u", (uint8_t *)&v17, 8u);
  }

  if (!self->_tunnelCount && self->_pendingCancellationHandler)
  {
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v17) = 0;
      _os_log_debug_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEBUG, "All tunnels closed, calling cancellation handler", (uint8_t *)&v17, 2u);
    }

    objc_super v14 = (void (**)(void))MEMORY[0x1A622B750](self->_pendingCancellationHandler);
    id pendingCancellationHandler = self->_pendingCancellationHandler;
    self->_id pendingCancellationHandler = 0;

    os_unfair_lock_unlock(&self->lock);
    if (v14)
    {
      v14[2](v14);
    }
  }
  else
  {
LABEL_11:
    os_unfair_lock_unlock(&self->lock);
  }
}

- (void)tunnelDidConnect:(id)a3
{
  id v5 = a3;
  id v4 = [(NSPManager *)self tunnelConnectedHandler];
  [(NSPManager *)self setTunnelConnectedHandler:0];
  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v5);
  }
}

- (void)tunnelIsReady:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 identifier];
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_DEFAULT, "Tunnel %@ is ready", (uint8_t *)&v9, 0xCu);
  }
  os_unfair_lock_lock(&self->lock);
  if (!self->_currentTunnelEndpoint)
  {
    id v7 = [v4 endpoint];
    currentTunnelEndpoint = self->_currentTunnelEndpoint;
    self->_currentTunnelEndpoint = v7;
  }
  os_unfair_lock_unlock(&self->lock);
}

- (void)tunnel:(id)a3 flowDidFallbackWithReason:(int64_t)a4
{
  id v6 = a3;
  if ((unint64_t)(a4 - 2) < 4 || a4 == 13)
  {
    id v12 = v6;
    id v7 = [v6 appRule];
    id v8 = [v7 matchSigningIdentifier];

    if (v8)
    {
      os_unfair_lock_lock(&self->lock);
      int v9 = [(NSMutableDictionary *)self->_fallbackCounts objectForKeyedSubscript:v8];
      uint64_t v10 = [v9 unsignedIntegerValue];

      uint64_t v11 = [NSNumber numberWithUnsignedInteger:v10 + 1];
      [(NSMutableDictionary *)self->_fallbackCounts setObject:v11 forKeyedSubscript:v8];

      os_unfair_lock_unlock(&self->lock);
    }

    id v6 = v12;
  }
}

- (BOOL)isFirstTunnel
{
  return (_MergedGlobals_40 & 1) == 0;
}

- (void)setConnectionInfo:(id)a3 forIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  flowInfoMap = self->_flowInfoMap;
  if (!flowInfoMap)
  {
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v11 = self->_flowInfoMap;
    self->_flowInfoMap = v10;

    flowInfoMap = self->_flowInfoMap;
  }
  id v12 = [(NSMutableDictionary *)flowInfoMap objectForKeyedSubscript:v7];
  if (v12)
  {
    if (![v6 fallbackReason])
    {
      objc_msgSend(v6, "setFallbackReason:", objc_msgSend(v12, "fallbackReason"));
      [v12 fallbackDelay];
      objc_msgSend(v6, "setFallbackDelay:");
    }
    if (([v6 TFOSucceeded] & 1) == 0) {
      objc_msgSend(v6, "setTFOSucceeded:", objc_msgSend(v12, "TFOSucceeded"));
    }
    if (![v6 tunnelConnectionError]) {
      objc_msgSend(v6, "setTunnelConnectionError:", objc_msgSend(v12, "tunnelConnectionError"));
    }
    if (([v6 isTFOProbeSucceeded] & 1) == 0) {
      objc_msgSend(v6, "setIsTFOProbeSucceeded:", objc_msgSend(v12, "isTFOProbeSucceeded"));
    }
  }
  else
  {
    [(NSMutableArray *)self->_knownFlows addObject:v7];
    if ((unint64_t)[(NSMutableArray *)self->_knownFlows count] >= 0xB)
    {
      id v13 = [(NSMutableArray *)self->_knownFlows objectAtIndexedSubscript:0];
      [(NSMutableDictionary *)self->_flowInfoMap removeObjectForKey:v13];
      [(NSMutableArray *)self->_knownFlows removeObjectAtIndex:0];
    }
  }
  [(NSMutableDictionary *)self->_flowInfoMap setObject:v6 forKeyedSubscript:v7];
  if ([v6 pathType] == 2)
  {
    objc_super v14 = nplog_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = [v7 unsignedLongLongValue];
      unsigned int v16 = +[NSPConnectionInfo getFallbackReasonDescription:](NSPConnectionInfo, "getFallbackReasonDescription:", [v6 fallbackReason]);
      int v19 = 134218242;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      v22 = v16;
      _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEFAULT, "Flow %llu fell back with reason: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  int v17 = [(NSPManager *)self connectionInfoSetHandler];

  if (v17)
  {
    uint64_t v18 = [(NSPManager *)self connectionInfoSetHandler];
    ((void (**)(void, id))v18)[2](v18, v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)getConnectionInfoForIdentifier:(id)a3
{
  p_lock = &self->lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(NSMutableDictionary *)self->_flowInfoMap objectForKeyedSubscript:v5];

  os_unfair_lock_unlock(p_lock);
  if (v6 && [v6 pathType] == 3)
  {
    [v6 setFallbackReason:2];
    [v6 setPathType:2];
    id v7 = [NPUsageReport alloc];
    id v8 = getSigningIdentifier();
    int v9 = [(NPUsageReport *)v7 initWithSigningIdentifier:v8 fallbackReason:2];

    [(NSPManager *)self sendUsageReport:v9];
  }
  return v6;
}

- (id)getAppRuleMatchingParameters:(id)a3 flowProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSPManager *)self matchingAppRule];
  if (!v8)
  {
    int v9 = self->_signingIdentifier;
    uint64_t effective_bundle_id = nw_parameters_get_effective_bundle_id();
    if (effective_bundle_id)
    {
      uint64_t v11 = [NSString stringWithUTF8String:effective_bundle_id];

      int v9 = (NSString *)v11;
    }
    id v12 = [(NSPManager *)self appRules];
    id v8 = [v12 objectForKeyedSubscript:v9];

    if (!v8) {
      goto LABEL_11;
    }
  }
  id v13 = [v8 matchAccountIdentifiers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    account_id = (void *)nw_parameters_get_account_id();
    if (!account_id) {
      goto LABEL_14;
    }
    unsigned int v16 = [v8 matchAccountIdentifiers];
    int v17 = [NSString stringWithUTF8String:account_id];
    char v18 = [v16 containsObject:v17];

    if (v18) {
      goto LABEL_13;
    }
LABEL_11:
    account_id = 0;
    goto LABEL_14;
  }
  int v19 = [v8 enableOptInPerTask];
  if ([v19 BOOLValue])
  {
    char v20 = [v7 enableNSP];

    if ((v20 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else
  {
  }
LABEL_13:
  id v8 = v8;
  account_id = v8;
LABEL_14:

  return account_id;
}

- (id)createReplacementEndpointForEndpoint:(id)a3 properties:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 replacementEndpoint];
  if (v7)
  {
LABEL_2:
    id v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t description = nw_endpoint_get_description();
      uint64_t v10 = [(NPTunnelTuscanyEndpoint *)v7 hosts];
      *(_DWORD *)buf = 136315394;
      uint64_t v38 = description;
      __int16 v39 = 2112;
      uint64_t v40 = v10;
      _os_log_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_DEFAULT, "Replaced endpoint %s with endpoints %@", buf, 0x16u);
    }
    goto LABEL_32;
  }
  uint64_t v11 = [v6 replacementAddressMap];
  if (!v11)
  {
    id v7 = 0;
    goto LABEL_33;
  }
  id v8 = v11;
  hostname = nw_endpoint_get_hostname(v5);
  if (hostname)
  {
    id v13 = [NSString stringWithUTF8String:hostname];
    uint64_t v14 = [v8 objectForKeyedSubscript:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (![v14 count])
  {
LABEL_31:

    id v7 = 0;
LABEL_32:

    goto LABEL_33;
  }
  uint64_t v15 = nw_endpoint_copy_port_string(v5);
  if (!v15)
  {
    uint64_t v29 = nplog_obj();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A0FEE000, v29, OS_LOG_TYPE_ERROR, "Failed to get the port string from the endpoint", buf, 2u);
    }

    goto LABEL_31;
  }
  unsigned int v16 = v15;
  uint64_t v31 = v8;
  uint64_t v32 = v5;
  int v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
  char v18 = (void *)[[NSString alloc] initWithCString:v16 encoding:4];
  free(v16);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v19 = v14;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v25 = [MEMORY[0x1E4F38BF0] endpointWithHostname:v24 port:v18];
        if (v25)
        {
          [v17 addObject:v25];
        }
        else
        {
          v26 = nplog_obj();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v38 = v24;
            __int16 v39 = 2112;
            uint64_t v40 = v18;
            _os_log_error_impl(&dword_1A0FEE000, v26, OS_LOG_TYPE_ERROR, "Failed to create a NWHostEndpoint from address %@ port %@", buf, 0x16u);
          }
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v21);
  }

  if ([v17 count])
  {
    id v7 = [[NPTunnelTuscanyEndpoint alloc] initWithHosts:v17];
    id v5 = v32;
    v27 = v31;
    if (!v7)
    {
      v28 = nplog_obj();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_ERROR, "Failed to create a NPTunnelTuscanyEndpoint from endpoints", buf, 2u);
      }

      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
    id v5 = v32;
    v27 = v31;
  }

  if (v7) {
    goto LABEL_2;
  }
LABEL_33:

  return v7;
}

- (id)createTransformsForEndpoint:(id)a3 parameters:(id)a4
{
  *(void *)&v111[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (g_recordTimestamps)
  {
    uint64_t v9 = mach_absolute_time();
    if (!v8) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if (!v7)
    {
LABEL_8:
      id v12 = objc_alloc_init(NPFlowProperties);
      goto LABEL_9;
    }
  }
  uint64_t v10 = nw_parameters_copy_metadata();
  uint64_t v11 = (void *)v10;
  if (!v10 || MEMORY[0x1A622BC50](v10) != MEMORY[0x1E4F14580])
  {

    goto LABEL_8;
  }
  id v45 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  bytes_ptr = xpc_data_get_bytes_ptr(v11);
  v47 = (void *)[v45 initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(v11) freeWhenDone:0];
  createPropertiesFromMetaData(v47);
  id v12 = (NPFlowProperties *)objc_claimAutoreleasedReturnValue();

  if (!v12) {
    goto LABEL_8;
  }
LABEL_9:
  id v13 = [(NSPManager *)self createReplacementEndpointForEndpoint:v6 properties:v12];
  if (v13)
  {
    uint64_t v14 = nw_protocol_transform_create();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      unsigned int v16 = (void *)nw_array_create();
      int v17 = (void *)[v13 copyCEndpoint];
      nw_protocol_transform_replace_endpoint();

      nw_array_append();
      nw_parameters_set_transform_array();
      id v18 = v16;
    }
    else
    {
      v41 = nplog_obj();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0FEE000, v41, OS_LOG_TYPE_ERROR, "Failed to create a nw_protocol_transform", buf, 2u);
      }

      uint64_t v15 = 0;
      id v18 = 0;
    }
    goto LABEL_103;
  }
  uint64_t v19 = [(NPFlowProperties *)v12 timestamps];
  if (v19)
  {
    if (g_recordTimestamps)
    {
      uint64_t v20 = v19;
      if (!*(void *)(v19 + 8))
      {
        if (!v9) {
          uint64_t v9 = mach_absolute_time();
        }
        *(void *)(v20 + 8) = v9;
      }
    }
  }
  uint64_t v15 = [(NSPManager *)self getAppRuleMatchingParameters:v8 flowProperties:v12];
  if (!v15)
  {
    v48 = 0;
    uint64_t v49 = 0;
LABEL_102:
    id v18 = v49;

    goto LABEL_103;
  }
  uint64_t v21 = [(NSPManager *)self configuration];
  uint64_t v22 = [v21 getCurrentKeyBagForAppRule:v15];

  v106 = (void *)v22;
  if (!v22)
  {
    v106 = [(NSPManager *)self keybag];
  }
  uint64_t v23 = self;
  p_lock = &self->lock;
  os_unfair_lock_lock(p_lock);
  pid_t v25 = getpid();
  unsigned int nextFlowID = v23->_nextFlowID;
  v104 = v23;
  v23->_unsigned int nextFlowID = nextFlowID + 1;
  uint64_t v27 = nextFlowID + v25;
  os_unfair_lock_unlock(p_lock);
  unsigned int v105 = v27;
  [(NPFlowProperties *)v12 setFlowIdentifier:v27];
  v28 = nplog_obj();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v111[0] = v105;
    _os_log_impl(&dword_1A0FEE000, v28, OS_LOG_TYPE_DEFAULT, "NSP setting up flow %u", buf, 8u);
  }

  uint64_t v29 = [v15 matchSigningIdentifier];
  int v30 = [v29 isEqualToString:@"com.apple.nsputil"];

  v109 = v15;
  if (!v30 || (uint64_t v31 = serviceNameToID(@"loopback"), v31 != [(NPFlowProperties *)v12 serviceID]))
  {
    if ([(NPFlowProperties *)v12 serviceID] == 0xCF65C8DD09564F74)
    {
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      v44 = v104;
      goto LABEL_93;
    }
    v50 = [v15 disableFallback];
    if ([v50 BOOLValue])
    {
    }
    else
    {
      v51 = [v15 matchSigningIdentifier];

      if (v51)
      {
        v52 = [v15 fallbackCountBeforeImmediateFallback];
        unint64_t v53 = [v52 unsignedIntegerValue];

        os_unfair_lock_lock(p_lock);
        if (v53)
        {
          fallbackCounts = v104->_fallbackCounts;
          v55 = [v15 matchSigningIdentifier];
          long long v56 = [(NSMutableDictionary *)fallbackCounts objectForKeyedSubscript:v55];
          unint64_t v57 = [v56 unsignedIntegerValue];

          os_unfair_lock_unlock(p_lock);
          BOOL v58 = v53 > v57;
          id v13 = 0;
          if (!v58)
          {
            long long v59 = nplog_obj();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              *(void *)v111 = v53;
              _os_log_impl(&dword_1A0FEE000, v59, OS_LOG_TYPE_DEFAULT, "Fallback limit (%lu) exceeded, falling back", buf, 0xCu);
            }
            uint64_t v42 = 0;
            uint64_t v43 = 15;
            v44 = v104;
            goto LABEL_92;
          }
        }
        else
        {
          os_unfair_lock_unlock(p_lock);
        }
      }
    }
    if (v106)
    {
      os_unfair_lock_lock(p_lock);
      if (v104->_currentTunnelEndpoint)
      {
        long long v60 = objc_msgSend(v106, "getOnRampForEndpoint:");
        if (v60) {
          uint64_t v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v60, 0);
        }
        else {
          uint64_t v42 = 0;
        }

        os_unfair_lock_unlock(p_lock);
        if (v42) {
          goto LABEL_58;
        }
      }
      else
      {
        os_unfair_lock_unlock(p_lock);
      }
      long long v61 = [v15 requireTFO];
      uint64_t v42 = objc_msgSend(v106, "copyUsableOnRamps:requireTFO:", 0, objc_msgSend(v61, "BOOLValue"));
    }
    else
    {
      uint64_t v42 = 0;
    }
LABEL_58:
    v108 = v42;
    if ([v42 count])
    {
      [(NPFlowProperties *)v12 setDataMode:nw_parameters_get_data_mode()];
      long long v62 = [MEMORY[0x1E4F38BE8] endpointWithCEndpoint:v6];
      [(NPFlowProperties *)v12 setDirectEndpoint:v62];

      nw_parameters_set_no_delay();
      if (![(NPFlowProperties *)v12 serviceID])
      {
        long long v63 = [v15 serviceID];
        -[NPFlowProperties setServiceID:](v12, "setServiceID:", [v63 unsignedLongLongValue]);
      }
      v64 = nplog_obj();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v65 = [(NPFlowProperties *)v12 serviceID];
        *(_DWORD *)buf = 67109376;
        v111[0] = v105;
        LOWORD(v111[1]) = 2048;
        *(void *)((char *)&v111[1] + 2) = v65;
        _os_log_impl(&dword_1A0FEE000, v64, OS_LOG_TYPE_DEFAULT, "Flow %u using service ID %llu", buf, 0x12u);
      }

      [(NPFlowProperties *)v12 setDisableIdleTimeout:[(NSPManager *)v104 disableIdleTimeout]];
      np_tunnel_protocol_get_id();
      uint64_t protocol_parameters = nw_parameters_create_protocol_parameters();
      if (![v42 count])
      {
        uint64_t v49 = 0;
LABEL_89:
        v84 = objc_alloc_init(NSPConnectionInfo);
        [(NSPConnectionInfo *)v84 setPathType:3];
        v85 = [NSNumber numberWithUnsignedInt:v105];
        [(NSPManager *)v104 setConnectionInfo:v84 forIdentifier:v85];

        [(NSPManager *)v104 setInUseKeybag:v106];
        v86 = (void *)protocol_parameters;
        uint64_t v42 = v108;
        goto LABEL_97;
      }
      id v101 = v6;
      v103 = v13;
      v100 = v12;
      uint64_t v49 = 0;
      unint64_t v66 = 0;
      v67 = 0;
      while (1)
      {
        uint64_t v68 = v8;
        v69 = v67;
        v70 = [v42 objectAtIndexedSubscript:v66];
        v71 = (void *)nw_protocol_transform_create();
        v72 = [v70 tuscanyEndpoint];
        v73 = [v72 hosts];
        v74 = [v73 objectAtIndexedSubscript:0];
        v67 = (void *)[v74 copyCEndpoint];

        nw_protocol_transform_replace_endpoint();
        v75 = v109;
        v76 = [v109 enableTFO];
        if (![v76 BOOLValue]) {
          break;
        }
        uint64_t v77 = [v70 TFOStatus];

        v75 = v109;
        id v8 = v68;
        if (v77 == 3) {
          goto LABEL_70;
        }
        nw_protocol_transform_set_tfo();
        v78 = [v109 enableNoTFOCookie];
        int v79 = [v78 BOOLValue];

        v75 = v109;
        if (v79) {
          nw_protocol_transform_set_tfo_no_cookie();
        }
LABEL_71:
        v80 = [v75 enableMultipath];
        [v80 BOOLValue];

        nw_protocol_transform_set_multipath_service();
        nw_protocol_transform_set_no_proxy();
        nw_protocol_transform_set_no_path_fallback();
        nw_protocol_transform_append_protocol();
        if (nw_parameters_get_tls())
        {
          nw_protocol_boringssl_identifier();
          nw_protocol_transform_disable_protocol();
        }
        uint64_t v42 = v108;
        if (v66 >= [v108 count] - 1)
        {
          v81 = [v109 disableFallback];
          char v82 = [v81 BOOLValue];

          if (v82) {
            nw_protocol_transform_set_prohibit_direct();
          }
          else {
            nw_protocol_transform_set_fallback_mode();
          }
          uint64_t v42 = v108;
          if (v49) {
            goto LABEL_81;
          }
LABEL_80:
          uint64_t v49 = (void *)nw_array_create();
          goto LABEL_81;
        }
        nw_protocol_transform_set_fallback_mode();
        if (!v49) {
          goto LABEL_80;
        }
LABEL_81:
        nw_array_append();

        if (++v66 >= [v42 count])
        {

          id v12 = v100;
          id v6 = v101;
          id v13 = v103;
          goto LABEL_89;
        }
      }

      id v8 = v68;
LABEL_70:
      nw_parameters_set_tfo();
      goto LABEL_71;
    }
    v83 = nplog_obj();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v111[0] = v105;
      _os_log_impl(&dword_1A0FEE000, v83, OS_LOG_TYPE_DEFAULT, "Flow %u no usable Day Pass available, falling back", buf, 8u);
    }

    if (v106)
    {
      uint64_t v43 = [v106 fallbackReason];
      if (v43 == 24)
      {
        v44 = v104;
        goto LABEL_93;
      }
    }
    else
    {
      uint64_t v43 = 14;
    }
    v87 = [NPUsageReport alloc];
    v88 = [v15 matchSigningIdentifier];
    v89 = v87;
    uint64_t v42 = v108;
    long long v59 = [(NPUsageReport *)v89 initWithSigningIdentifier:v88 fallbackReason:v43];

    v44 = v104;
    [(NSPManager *)v104 sendUsageReport:v59];
LABEL_92:

LABEL_93:
    v90 = objc_alloc_init(NSPConnectionInfo);
    [(NSPConnectionInfo *)v90 setPathType:2];
    [(NSPConnectionInfo *)v90 setFallbackReason:v43];
    v91 = v44;
    v92 = [(NWPathEvaluator *)v44->_pathEvaluator path];
    v84 = v92;
    if (v92)
    {
      v93 = [(NSPConnectionInfo *)v92 interface];

      if (v93)
      {
        [(NSPConnectionInfo *)v84 interface];
        id v102 = v6;
        v95 = v94 = v42;
        [(NSPConnectionInfo *)v90 setInterfaceType:+[NPUtilities interfaceTypeOfNWInterface:v95]];

        uint64_t v42 = v94;
        id v6 = v102;
      }
    }
    v96 = [NSNumber numberWithUnsignedInt:v105];
    [(NSPManager *)v91 setConnectionInfo:v90 forIdentifier:v96];

    v86 = v90;
    uint64_t v49 = 0;
LABEL_97:

    uint64_t v97 = [(NPFlowProperties *)v12 timestamps];
    if (v97 && g_recordTimestamps && !*(void *)(v97 + 16)) {
      *(void *)(v97 + 16) = mach_absolute_time();
    }
    v98 = createMetadataFromProperties(v12);
    v48 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    nw_parameters_set_metadata();
    uint64_t v15 = v109;
    goto LABEL_102;
  }
  uint64_t v32 = nplog_obj();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v32, OS_LOG_TYPE_DEFAULT, "Setting up loopback transform", buf, 2u);
  }

  [(NPFlowProperties *)v12 setIsLoopback:1];
  [(NPFlowProperties *)v12 setDisableIdleTimeout:1];
  np_tunnel_protocol_get_id();
  long long v33 = (void *)nw_parameters_create_protocol_parameters();
  np_loopback_protocol_get_id();
  long long v34 = (void *)nw_parameters_create_protocol_parameters();
  long long v35 = (void *)nw_protocol_transform_create();
  nw_protocol_transform_set_no_proxy();
  nw_protocol_transform_append_protocol();
  nw_protocol_transform_append_protocol();
  nw_endpoint_t host = nw_endpoint_create_host("127.0.0.1", "5223");
  nw_protocol_transform_replace_endpoint();
  nw_protocol_transform_set_fallback_mode();
  nw_protocol_transform_set_prohibit_direct();
  v37 = (void *)nw_array_create();
  nw_array_append();
  uint64_t v38 = [(NPFlowProperties *)v12 timestamps];
  if (v38 && g_recordTimestamps && !*(void *)(v38 + 16)) {
    *(void *)(v38 + 16) = mach_absolute_time();
  }
  __int16 v39 = createMetadataFromProperties(v12);
  uint64_t v40 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  nw_parameters_set_metadata();
  id v18 = v37;

  id v13 = 0;
  uint64_t v15 = v109;
LABEL_103:

  return v18;
}

- (void)sendUsageReport:(id)a3
{
  id v4 = a3;
  id v5 = [(NSPManager *)self inUseKeybag];
  if (!v5)
  {
    id v5 = [(NSPManager *)self keybag];
  }
  objc_msgSend(v4, "setEdgeIndex:", objc_msgSend(v5, "index"));
  objc_msgSend(v4, "setKeybagGeneration:", objc_msgSend(v5, "generation"));
  if (+[NSPConnectionInfo shouldMoveToNextEdgeForFallbackReason:](NSPConnectionInfo, "shouldMoveToNextEdgeForFallbackReason:", [v4 fallbackReason]))
  {
    id v6 = [(NSPManager *)self inUseKeybag];
    [v6 moveToNextOnRamp];
  }
  else
  {
    if ([v4 fallbackReason]) {
      goto LABEL_8;
    }
    id v6 = [(NSPManager *)self inUseKeybag];
    id v7 = [v4 dayPassUUID];
    [v6 moveToOnRamp:v7];
  }
LABEL_8:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v9 = [v4 signingIdentifier];
    [WeakRetained handleUsageReport:v4 fromClient:v9];
  }
  else
  {
    uint64_t v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0FEE000, v10, OS_LOG_TYPE_INFO, "Sending usage data", buf, 2u);
    }

    uint64_t v9 = getServerConnection();
    if (v9)
    {
      uint64_t v11 = [v4 signingIdentifier];
      [v9 reportUsage:v4 fromClient:v11];
    }
    else
    {
      uint64_t v11 = nplog_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_error_impl(&dword_1A0FEE000, v11, OS_LOG_TYPE_ERROR, "Failed to create the XPC connection to the server", v12, 2u);
      }
    }
  }
}

- (void)fetchStateForClient:(id)a3 withPeerEndpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  p_delegate = &self->_delegate;
  uint64_t v11 = (void (**)(id, void *, void *, void *))a5;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v13 = WeakRetained;
  if (WeakRetained)
  {
    id v18 = 0;
    uint64_t v14 = (void *)[WeakRetained copyStateForClient:v8 withPeerEndpoint:v9 outWaldoInfo:&v18];
    id v15 = v18;
    unsigned int v16 = [v15 telemetryService];
    int v17 = [v15 telemetryURL];

    v11[2](v11, v14, v16, v17);
  }
  else
  {
    uint64_t v14 = getServerConnection();
    [v14 fetchStateForClient:v8 withPeerEndpoint:v9 completionHandler:v11];
  }
}

- (BOOL)isEnabled
{
  v2 = [(NWPathEvaluator *)self->_policyEvaluator path];
  char v3 = [v2 usesNetworkAgentType:objc_opt_class()];

  return v3;
}

- (BOOL)currentNetworkHasProxies
{
  v2 = [(NWPathEvaluator *)self->_pathEvaluator path];
  char v3 = [v2 proxySettings];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)createAppRuleMapWithRules:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v10 = [v9 matchSigningIdentifier];
        [v4 setObject:v9 forKeyedSubscript:v10];

        uint64_t v11 = [v9 matchEffectiveApplications];
        uint64_t v12 = [v11 count];

        if (v12)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          id v13 = [v9 matchEffectiveApplications];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v23 != v16) {
                  objc_enumerationMutation(v13);
                }
                id v18 = [*(id *)(*((void *)&v22 + 1) + 8 * j) matchSigningIdentifier];
                [v4 setObject:v9 forKeyedSubscript:v18];
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v15);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4];
  return v19;
}

- (BOOL)shouldSetConfigurationToAppRule:(id)a3 edgeSet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NSPManager *)self matchingAppRule];
  id v9 = [v6 enabled];
  int v10 = [v9 BOOLValue];

  if ((v8 == 0) == v10) {
    goto LABEL_15;
  }
  uint64_t v11 = [v6 enabled];
  int v12 = [v11 BOOLValue];

  if (!v12)
  {
    id v13 = nplog_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v22 = 0;
      _os_log_impl(&dword_1A0FEE000, v13, OS_LOG_TYPE_DEFAULT, "NSP is currently disabled and the new app rule does not enable it, not updating the configuration", v22, 2u);
    }
    goto LABEL_13;
  }
  id v13 = [v8 updateHash];
  uint64_t v14 = [v6 updateHash];
  uint64_t v15 = (void *)v14;
  if (!v13
    || !v14
    || (int v16 = [v13 isEqualToData:v14], !v7)
    || !v16
    || ([(NSPManager *)self keybag],
        int v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 updateHashMatchesEdgeSet:v7],
        v17,
        !v18))
  {

LABEL_15:
    BOOL v20 = 1;
    goto LABEL_16;
  }
  uint64_t v19 = nplog_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0FEE000, v19, OS_LOG_TYPE_DEFAULT, "The new NSP configuration does not differ from the current configuration, not updating the configuration", buf, 2u);
  }

LABEL_13:
  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (id)buildTestLatencyMap:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKeyedSubscript:@"latencyMap"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = v3;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    obuint64_t j = v3;
    uint64_t v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v22 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v22) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"addressFamily", v19);
          id v9 = [v7 objectForKeyedSubscript:@"ProbeTFO"];
          int v10 = [v7 objectForKeyedSubscript:@"TFONoCookie"];
          uint64_t v11 = [v7 objectForKeyedSubscript:@"TFOStatus"];
          int v12 = [v7 objectForKeyedSubscript:@"rtts"];
          id v13 = [v7 objectForKeyedSubscript:@"probeAddress"];
          uint64_t v14 = +[NPUtilities endpointFromString:v13 defaultPortString:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v15 = -[NPEdgeLatency initWithProbeEndpoint:probeTFO:]([NPEdgeLatency alloc], "initWithProbeEndpoint:probeTFO:", v14, [v9 BOOLValue]);
                [(NPEdgeLatency *)v15 addRoundTripSamples:v12];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  -[NPEdgeLatency setProbeNoTFOCookie:](v15, "setProbeNoTFOCookie:", [v10 BOOLValue]);
                }
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  -[NPEdgeLatency setTFOStatus:](v15, "setTFOStatus:", [v11 integerValue]);
                }
                [v20 addObject:v15];
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v5);
    }

    if ([v20 count]) {
      int v16 = v20;
    }
    else {
      int v16 = 0;
    }
    id v17 = v16;

    id v3 = v19;
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)ingestTestLatencyMap:(id)a3 local:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t))a5;
  if (v6)
  {
    int v10 = [(NSPManager *)self buildTestLatencyMap:v8];
    testLatencyMap = self->_testLatencyMap;
    self->_testLatencyMap = v10;

    int v12 = self->_testLatencyMap;
    id v13 = nplog_obj();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = self->_testLatencyMap;
        *(_DWORD *)buf = 138412290;
        long long v24 = v19;
        _os_log_debug_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_DEBUG, "Using test latency map data for locally: %@", buf, 0xCu);
      }

      uint64_t v15 = [v8 objectForKeyedSubscript:@"fetchDaypass"];
      int v16 = v15;
      if (v15) {
        LOBYTE(v15) = [v15 BOOLValue];
      }
      self->_testFetchDaypass = (char)v15;
      id v17 = nplog_obj();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        if (self->_testFetchDaypass) {
          id v20 = @"Will";
        }
        else {
          id v20 = @"Will not";
        }
        *(_DWORD *)buf = 138412290;
        long long v24 = v20;
        _os_log_debug_impl(&dword_1A0FEE000, v17, OS_LOG_TYPE_DEBUG, "%@ fetch day pass from network", buf, 0xCu);
      }

      v9[2](v9, 1);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0FEE000, v14, OS_LOG_TYPE_INFO, "Cleared test latency map", buf, 2u);
      }

      v9[2](v9, 1);
    }
  }
  else
  {
    int v18 = getServerConnection();
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__NSPManager_ingestTestLatencyMap_local_completionHandler___block_invoke;
    v21[3] = &unk_1E5A3C6B0;
    uint64_t v22 = v9;
    [v18 setTestLatencyMap:v8 completionHandler:v21];
  }
}

uint64_t __59__NSPManager_ingestTestLatencyMap_local_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)getTestLatencyRTT:(id)a3 parameters:(networkParameters *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  testLatencyMap = self->_testLatencyMap;
  if (testLatencyMap)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = testLatencyMap;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      unint64_t v12 = 0xFFFFFFFFLL;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v14, "isMatched:parameters:", v6, a4, (void)v16))
          {
            unint64_t v12 = [v14 getRoundTripSample:self->_testLatencyMapIndex];
            goto LABEL_14;
          }
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v12 = 0xFFFFFFFFLL;
    }
LABEL_14:
  }
  else
  {
    unint64_t v12 = 0xFFFFFFFFLL;
  }

  return v12;
}

- (BOOL)useTestLatencyMap
{
  return self->_testLatencyMap != 0;
}

- (BOOL)useTestDaypass
{
  return self->_testLatencyMap && !self->_testFetchDaypass;
}

- (void)resetTestLatencyMapIndex:(unint64_t)a3
{
  self->_testLatencyMapIndex = a3;
}

- (double)timeIntervalSinceLastUsage
{
  v2 = [(NSPManager *)self inUseKeybag];
  [v2 timeSinceLastUsed];
  double v4 = v3;

  return v4;
}

- (void)container:(id)a3 didStartWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_INFO, "didStartWithError called with: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(NSPManager *)self flowDivert];
  [v7 didStartWithError:v5];
}

- (void)container:(id)a3 didFailWithError:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_INFO, "didFailWithError with error: %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [(NSPManager *)self flowDivert];
  [v7 didFailWithError:v5];
}

- (void)container:(id)a3 didRequestFlowDivertControlSocketWithCompletionHandler:(id)a4
{
}

- (void)container:(id)a3 didSetTunnelConfiguration:(id)a4 completionHandler:(id)a5
{
}

- (NWPathEvaluator)pathEvaluator
{
  return self->_pathEvaluator;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (id)connectionInfoSetHandler
{
  return self->_connectionInfoSetHandler;
}

- (void)setConnectionInfoSetHandler:(id)a3
{
}

- (id)tunnelConnectedHandler
{
  return self->_tunnelConnectedHandler;
}

- (void)setTunnelConnectedHandler:(id)a3
{
}

- (NPKeyBag)keybag
{
  return (NPKeyBag *)objc_getProperty(self, a2, 56, 1);
}

- (void)setKeybag:(id)a3
{
}

- (BOOL)disableIdleTimeout
{
  return self->_disableIdleTimeout;
}

- (void)setDisableIdleTimeout:(BOOL)a3
{
  self->_disableIdleTimeout = a3;
}

- (NWPathEvaluator)policyEvaluator
{
  return self->_policyEvaluator;
}

- (NSDictionary)appRules
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAppRules:(id)a3
{
}

- (NPKeyBag)inUseKeybag
{
  return (NPKeyBag *)objc_getProperty(self, a2, 80, 1);
}

- (void)setInUseKeybag:(id)a3
{
}

- (NSPConfiguration)configuration
{
  return (NSPConfiguration *)objc_getProperty(self, a2, 88, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (NSPFlowDivert)flowDivert
{
  return (NSPFlowDivert *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFlowDivert:(id)a3
{
}

- (NSMutableDictionary)flowInfoMap
{
  return self->_flowInfoMap;
}

- (void)setFlowInfoMap:(id)a3
{
}

- (BOOL)isObserving
{
  return self->_isObserving;
}

- (void)setIsObserving:(BOOL)a3
{
  self->_isObserving = a3;
}

- (NSArray)currentAgents
{
  return self->_currentAgents;
}

- (void)setCurrentAgents:(id)a3
{
}

- (NSMutableDictionary)fallbackCounts
{
  return self->_fallbackCounts;
}

- (NSPManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NSPManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)signingIdentifier
{
  return self->_signingIdentifier;
}

- (NSPAppRule)matchingAppRule
{
  return (NSPAppRule *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMatchingAppRule:(id)a3
{
}

- (NSMutableArray)knownFlows
{
  return self->_knownFlows;
}

- (id)pendingCancellationHandler
{
  return self->_pendingCancellationHandler;
}

- (void)setPendingCancellationHandler:(id)a3
{
}

- (NSArray)testLatencyMap
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setTestLatencyMap:(id)a3
{
}

- (BOOL)testFetchDaypass
{
  return self->_testFetchDaypass;
}

- (void)setTestFetchDaypass:(BOOL)a3
{
  self->_testFetchDaypass = a3;
}

- (unint64_t)testLatencyMapIndex
{
  return self->_testLatencyMapIndex;
}

- (void)setTestLatencyMapIndex:(unint64_t)a3
{
  self->_testLatencyMapIndex = a3;
}

- (unsigned)nextFlowID
{
  return self->_nextFlowID;
}

- (void)setNextFlowID:(unsigned int)a3
{
  self->_unsigned int nextFlowID = a3;
}

- (unsigned)tunnelCount
{
  return self->_tunnelCount;
}

- (void)setTunnelCount:(unsigned int)a3
{
  self->_unsigned int tunnelCount = a3;
}

- (OS_nw_endpoint)currentTunnelEndpoint
{
  return self->_currentTunnelEndpoint;
}

- (void)setCurrentTunnelEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTunnelEndpoint, 0);
  objc_storeStrong((id *)&self->_testLatencyMap, 0);
  objc_storeStrong(&self->_pendingCancellationHandler, 0);
  objc_storeStrong((id *)&self->_knownFlows, 0);
  objc_storeStrong((id *)&self->_matchingAppRule, 0);
  objc_storeStrong((id *)&self->_signingIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fallbackCounts, 0);
  objc_storeStrong((id *)&self->_currentAgents, 0);
  objc_storeStrong((id *)&self->_flowInfoMap, 0);
  objc_storeStrong((id *)&self->_flowDivert, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_inUseKeybag, 0);
  objc_storeStrong((id *)&self->_appRules, 0);
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong(&self->_tunnelConnectedHandler, 0);
  objc_storeStrong(&self->_connectionInfoSetHandler, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

@end