@interface SBAdditionalEnvironmentDeferralsPolicyEnforcer
- (NSMutableArray)rules;
- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)init;
- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)initWithDebugName:(id)a3 deliveryManager:(id)a4;
- (SBAdditionalEnvironmentDeferralsPolicyEnforcerDelegate)delegate;
- (void)enforce:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRules:(id)a3;
- (void)stopEnforcing;
@end

@implementation SBAdditionalEnvironmentDeferralsPolicyEnforcer

- (void)enforce:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(SBAdditionalEnvironmentDeferralsPolicyEnforcer *)self stopEnforcing];
  v23 = v4;
  v5 = [v4 keyboardFocusTarget];
  v26 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = [WeakRetained additionalEnvironmentDeferralsForFocusTarget:v5];

  v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v25 = v7;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [v7 allKeys];
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v13 = [MEMORY[0x1E4FA6B10] systemKeyCommandOverlayEnvironment];
        int v14 = [v12 isEqual:v13];

        if (v14)
        {
          v15 = (void *)[MEMORY[0x1E4F4F358] new];
          [v15 setEnvironment:v12];
          v16 = (void *)[MEMORY[0x1E4F4F368] new];
          v17 = [v25 objectForKeyedSubscript:v12];
          [v16 setToken:v17];

          objc_msgSend(v16, "setPid:", objc_msgSend(v5, "pid"));
          deliveryManager = v26->_deliveryManager;
          v19 = -[SBKeyboardFocusTarget deferringTarget]((uint64_t)v5);
          v20 = [(BKSHIDEventDeliveryManager *)deliveryManager deferEventsMatchingPredicate:v15 toTarget:v19 withReason:@"SpringBoard: outbound to service-requested target"];
          [(NSMutableArray *)v24 addObject:v20];

          v21 = SBLogKeyboardFocus();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v12;
            __int16 v34 = 2114;
            v35 = v5;
            _os_log_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_DEFAULT, "rules: (additionalEnvironments) by service request, deferring (%{public}@) -> %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v9);
  }

  rules = v26->_rules;
  v26->_rules = v24;
}

- (void)stopEnforcing
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_rules;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "invalidate", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  rules = self->_rules;
  self->_rules = 0;
}

- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)init
{
  v3 = [MEMORY[0x1E4F4F2A0] sharedInstance];
  uint64_t v4 = [(SBAdditionalEnvironmentDeferralsPolicyEnforcer *)self initWithDebugName:@"SBAdditionalEnvironmentDeferralsPolicyEnforcer" deliveryManager:v3];

  return v4;
}

- (SBAdditionalEnvironmentDeferralsPolicyEnforcer)initWithDebugName:(id)a3 deliveryManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBAdditionalEnvironmentDeferralsPolicyEnforcer;
  uint64_t v8 = [(SBAdditionalEnvironmentDeferralsPolicyEnforcer *)&v13 init];
  long long v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_deliveryManager, a4);
    uint64_t v10 = [v6 copy];
    debugName = v9->_debugName;
    v9->_debugName = (NSString *)v10;
  }
  return v9;
}

- (SBAdditionalEnvironmentDeferralsPolicyEnforcerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBAdditionalEnvironmentDeferralsPolicyEnforcerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end