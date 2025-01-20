@interface SBKeyboardFocusPolicyEnforcerPipeline
- (SBKeyboardFocusPolicyEnforcerPipeline)init;
- (SBKeyboardFocusPolicyEnforcerPipeline)initWithEnforcers:(id)a3;
- (void)addPolicyEnforcer:(id)a3;
- (void)enforce:(id)a3;
- (void)invalidate;
- (void)stopEnforcing;
@end

@implementation SBKeyboardFocusPolicyEnforcerPipeline

- (void)enforce:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F2A0] sharedInstance];
  v6 = [v5 transactionAssertionWithReason:@"SBKeyboardFocusPolicyEnforcerPipeline"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_policyEnforcers;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "enforce:", v4, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [v6 invalidate];
}

- (SBKeyboardFocusPolicyEnforcerPipeline)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBKeyboardFocusPolicyEnforcerPipeline;
  v2 = [(SBKeyboardFocusPolicyEnforcerPipeline *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    policyEnforcers = v2->_policyEnforcers;
    v2->_policyEnforcers = v3;
  }
  return v2;
}

- (SBKeyboardFocusPolicyEnforcerPipeline)initWithEnforcers:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKeyboardFocusPolicyEnforcerPipeline;
  v5 = [(SBKeyboardFocusPolicyEnforcerPipeline *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    policyEnforcers = v5->_policyEnforcers;
    v5->_policyEnforcers = (NSMutableArray *)v6;
  }
  return v5;
}

- (void)addPolicyEnforcer:(id)a3
{
}

- (void)stopEnforcing
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F4F2A0] sharedInstance];
  id v4 = [v3 transactionAssertionWithReason:@"SBKeyboardFocusPolicyEnforcerPipeline"];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_policyEnforcers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "stopEnforcing", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [v4 invalidate];
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_policyEnforcers;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "invalidate", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end