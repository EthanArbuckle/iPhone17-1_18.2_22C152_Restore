@interface NSPFlowDivert
- (BOOL)resetPolicies:(BOOL)a3;
- (BOOL)shouldResetPolicies;
- (BOOL)started;
- (NEFlowDivertFileHandle)flowDivertControlHandle;
- (NEPolicySession)policySession;
- (NSPConfiguration)configuration;
- (NSPFlowDivert)initWithDelegate:(id)a3 providerClass:(Class)a4 configuration:(id)a5;
- (id)createFlowDivertSocketHandle;
- (id)createPolicySession;
- (id)getAgentResults:(id)a3;
- (id)getAgentResultsForSelf;
- (id)getEffectiveAppRules:(id)a3;
- (id)getExecutableConditions:(id)a3;
- (void)addPoliciesForAgent:(id)a3 conditions:(id)a4;
- (void)addPoliciesForDivertDNSOnly:(id)a3 domainConditions:(id)a4 divertResult:(id)a5;
- (void)addPolicy:(id)a3;
- (void)destroyFlowDivertSocketHandles;
- (void)destroyPolicySession;
- (void)didFailWithError:(id)a3;
- (void)didStartWithError:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setFlowDivertControlHandle:(id)a3;
- (void)setPolicySession:(id)a3;
- (void)setShouldResetPolicies:(BOOL)a3;
- (void)setStarted:(BOOL)a3;
- (void)startWithOptions:(id)a3 completionHandler:(id)a4;
- (void)stop;
@end

@implementation NSPFlowDivert

- (NSPFlowDivert)initWithDelegate:(id)a3 providerClass:(Class)a4 configuration:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)NSPFlowDivert;
  v10 = [(NEAppProxyProviderContainer *)&v13 initWithDelegate:a3 providerClass:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_configuration, a5);
  }

  return v11;
}

- (void)startWithOptions:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  BOOL v8 = [(NSPFlowDivert *)self started];
  id v9 = nplog_obj();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v19 = self;
      _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_INFO, "%@ NSPFlowDivert is already started, ignoring start request", buf, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      v19 = self;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A0FEE000, v9, OS_LOG_TYPE_INFO, "%@: NSPFlowDivert starting with options: %@", buf, 0x16u);
    }

    [(NSPFlowDivert *)self setStarted:1];
    v11 = [(NSPFlowDivert *)self flowDivertControlHandle];

    if (!v11)
    {
      v12 = [(NSPFlowDivert *)self createFlowDivertSocketHandle];
      [(NSPFlowDivert *)self setFlowDivertControlHandle:v12];
    }
    objc_super v13 = [(NSPFlowDivert *)self flowDivertControlHandle];

    if (v13)
    {
      v14 = [(NSPFlowDivert *)self flowDivertControlHandle];
      v15 = [v14 handle];
      v17.receiver = self;
      v17.super_class = (Class)NSPFlowDivert;
      [(NEAppProxyProviderContainer *)&v17 setInitialFlowDivertControlSocket:v15];

      v16.receiver = self;
      v16.super_class = (Class)NSPFlowDivert;
      [(NEAppProxyProviderContainer *)&v16 startWithOptions:v6 completionHandler:v7];
      goto LABEL_13;
    }
  }
  if (v7) {
    v7[2](v7, 0);
  }
LABEL_13:
}

- (void)stop
{
  [(NSPFlowDivert *)self setStarted:0];
  v3.receiver = self;
  v3.super_class = (Class)NSPFlowDivert;
  [(NEAppProxyProviderContainer *)&v3 stop];
}

- (id)createFlowDivertSocketHandle
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  objc_super v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    BOOL v8 = self;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "%@ Creating a new flow divert control socket", (uint8_t *)&v7, 0xCu);
  }

  v4 = (void *)[objc_alloc(MEMORY[0x1E4F38CE8]) initFlowDivertControlSocketDisableAppMap:1];
  if (!v4)
  {
    v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      BOOL v8 = self;
      _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "%@: NSPFlowDivert: Failed to create a flow divert control socket", (uint8_t *)&v7, 0xCu);
    }
  }
  [(NSPFlowDivert *)self setShouldResetPolicies:0];
  return v4;
}

- (void)destroyFlowDivertSocketHandles
{
}

- (id)createPolicySession
{
  objc_super v3 = nplog_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_1A0FEE000, v3, OS_LOG_TYPE_DEFAULT, "Creating a new policy session", v7, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F38D40]);
  v5 = v4;
  if (v4) {
    [v4 setPriority:100];
  }
  [(NSPFlowDivert *)self setShouldResetPolicies:1];
  return v5;
}

- (void)destroyPolicySession
{
}

- (void)addPolicy:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = nplog_obj();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    int v7 = nplog_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412546;
      BOOL v10 = self;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_debug_impl(&dword_1A0FEE000, v7, OS_LOG_TYPE_DEBUG, "%@: NSPFlowDivert: Adding policy: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  BOOL v8 = [(NSPFlowDivert *)self policySession];
  [v8 addPolicy:v4];
}

- (id)getAgentResults:(id)a3
{
  return 0;
}

- (id)getAgentResultsForSelf
{
  return 0;
}

- (id)getExecutableConditions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 matchEffectiveApplications];
  if (v4
    && (v5 = (void *)v4,
        [v3 matchEffectiveApplications],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [v3 copyMatchEffectiveApplicationConditions];
  }
  else
  {
    uint64_t v8 = [v3 copyExecutableConditions];
  }
  int v9 = (void *)v8;

  return v9;
}

- (id)getEffectiveAppRules:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 matchEffectiveApplications];
  if (v4
    && (v5 = (void *)v4,
        [v3 matchEffectiveApplications],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v5,
        v7))
  {
    uint64_t v8 = [v3 matchEffectiveApplications];
  }
  else
  {
    v11[0] = v3;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  int v9 = (void *)v8;

  return v9;
}

- (void)addPoliciesForDivertDNSOnly:(id)a3 domainConditions:(id)a4 divertResult:(id)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [MEMORY[0x1E4F38D28] allInterfaces];
  uint64_t v12 = [MEMORY[0x1E4F38D28] ipProtocol:17];
  uint64_t v13 = (void *)v12;
  if (v8)
  {
    if (!v9) {
      goto LABEL_14;
    }
  }
  else
  {
    v29[0] = v11;
    v29[1] = v12;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    if (!v9)
    {
LABEL_14:
      id v14 = (id)[objc_alloc(MEMORY[0x1E4F38D20]) initWithOrder:481 result:v10 conditions:v8];
      [(NSPFlowDivert *)self addPolicy:v14];
      goto LABEL_15;
    }
  }
  if (![v9 count]) {
    goto LABEL_14;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v22 = v13;
    id v23 = v9;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        __int16 v20 = (void *)[v8 mutableCopy];
        [v20 addObject:v19];
        id v21 = (void *)[objc_alloc(MEMORY[0x1E4F38D20]) initWithOrder:481 result:v10 conditions:v20];
        [(NSPFlowDivert *)self addPolicy:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
    id v9 = v23;
    uint64_t v13 = v22;
  }
LABEL_15:
}

- (void)addPoliciesForAgent:(id)a3 conditions:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(NSPFlowDivert *)self getAgentResults:a3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F38D20]) initWithOrder:480 result:*(void *)(*((void *)&v13 + 1) + 8 * v11) conditions:v6];
        [(NSPFlowDivert *)self addPolicy:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)resetPolicies:(BOOL)a3
{
  return 0;
}

- (void)didStartWithError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = nplog_obj();
  id v6 = v5;
  if (v4)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      [(NSPFlowDivert *)self teardown];
      goto LABEL_9;
    }
    int v10 = 138412546;
    uint64_t v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    uint64_t v7 = "%@: flow divert provider failed to start with error: %@";
    uint64_t v8 = v6;
    uint32_t v9 = 22;
LABEL_13:
    _os_log_error_impl(&dword_1A0FEE000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v10, v9);
    goto LABEL_3;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    uint64_t v11 = self;
    _os_log_impl(&dword_1A0FEE000, v6, OS_LOG_TYPE_INFO, "%@: flow divert provider started successfully", (uint8_t *)&v10, 0xCu);
  }

  if ([(NSPFlowDivert *)self shouldResetPolicies])
  {
    if ([(NSPFlowDivert *)self resetPolicies:1])
    {
      [(NSPFlowDivert *)self setShouldResetPolicies:0];
      goto LABEL_9;
    }
    id v6 = nplog_obj();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    int v10 = 138412290;
    uint64_t v11 = self;
    uint64_t v7 = "%@: NSPFlowDivert: resetPolicies failed";
    uint64_t v8 = v6;
    uint32_t v9 = 12;
    goto LABEL_13;
  }
LABEL_9:
}

- (void)didFailWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = nplog_obj();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412546;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_error_impl(&dword_1A0FEE000, v5, OS_LOG_TYPE_ERROR, "%@: didFailWithError called with: %@", (uint8_t *)&v6, 0x16u);
  }

  [(NSPFlowDivert *)self teardown];
}

- (BOOL)shouldResetPolicies
{
  return self->_shouldResetPolicies;
}

- (void)setShouldResetPolicies:(BOOL)a3
{
  self->_shouldResetPolicies = a3;
}

- (NSPConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (NEFlowDivertFileHandle)flowDivertControlHandle
{
  return self->_flowDivertControlHandle;
}

- (void)setFlowDivertControlHandle:(id)a3
{
}

- (NEPolicySession)policySession
{
  return (NEPolicySession *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPolicySession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policySession, 0);
  objc_storeStrong((id *)&self->_flowDivertControlHandle, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end