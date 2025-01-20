@interface SBSceneWatchdogProvider
+ (id)defaultSceneWatchdogProvider;
+ (id)disabledSceneWatchdogProvider;
- (id)_scaleProvisions:(id)a3 byFactor:(double)a4;
- (id)initAsDisabled:(BOOL)a3;
- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4;
@end

@implementation SBSceneWatchdogProvider

+ (id)defaultSceneWatchdogProvider
{
  if (defaultSceneWatchdogProvider___once != -1) {
    dispatch_once(&defaultSceneWatchdogProvider___once, &__block_literal_global_78);
  }
  v2 = (void *)defaultSceneWatchdogProvider___instance;
  return v2;
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  explicitPolicy = self->_explicitPolicy;
  if (explicitPolicy)
  {
    v5 = explicitPolicy;
  }
  else
  {
    defaultProcessWatchdogProvider = self->_defaultProcessWatchdogProvider;
    id v9 = a4;
    v10 = [(FBApplicationProcessWatchdogPolicy *)defaultProcessWatchdogProvider watchdogPolicyForProcess:a3 eventContext:v9];
    v11 = [v9 sceneTransitionContext];

    if (v11)
    {
      [v11 watchdogScaleFactor];
      double v13 = v12;
    }
    else
    {
      double v13 = 1.0;
    }
    if (BSFloatIsOne())
    {
      v5 = v10;
    }
    else
    {
      v14 = [v10 provisions];
      v15 = [(SBSceneWatchdogProvider *)self _scaleProvisions:v14 byFactor:v13];

      v16 = (void *)MEMORY[0x1E4F62A10];
      v17 = [v10 name];
      v5 = [v16 policyWithName:v17 forProvisions:v15];
    }
  }
  return v5;
}

- (id)initAsDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)SBSceneWatchdogProvider;
  v4 = [(SBSceneWatchdogProvider *)&v13 init];
  if (v4)
  {
    if (v3)
    {
      v5 = [MEMORY[0x1E4F62A00] provisionWithResourceType:1 timeInterval:600.0];
      v6 = (void *)MEMORY[0x1E4F62A10];
      v14[0] = v5;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v8 = [v6 policyWithName:@"watchdog \"disabled\"" forProvisions:v7];
      explicitPolicy = v4->_explicitPolicy;
      v4->_explicitPolicy = (FBSProcessWatchdogPolicy *)v8;
    }
    uint64_t v10 = [MEMORY[0x1E4F62408] defaultPolicy];
    defaultProcessWatchdogProvider = v4->_defaultProcessWatchdogProvider;
    v4->_defaultProcessWatchdogProvider = (FBApplicationProcessWatchdogPolicy *)v10;
  }
  return v4;
}

void __55__SBSceneWatchdogProvider_defaultSceneWatchdogProvider__block_invoke()
{
  id v0 = [[SBSceneWatchdogProvider alloc] initAsDisabled:0];
  v1 = (void *)defaultSceneWatchdogProvider___instance;
  defaultSceneWatchdogProvider___instance = (uint64_t)v0;
}

+ (id)disabledSceneWatchdogProvider
{
  if (disabledSceneWatchdogProvider___once != -1) {
    dispatch_once(&disabledSceneWatchdogProvider___once, &__block_literal_global_7_2);
  }
  v2 = (void *)disabledSceneWatchdogProvider___instance;
  return v2;
}

void __56__SBSceneWatchdogProvider_disabledSceneWatchdogProvider__block_invoke()
{
  id v0 = [[SBSceneWatchdogProvider alloc] initAsDisabled:1];
  v1 = (void *)disabledSceneWatchdogProvider___instance;
  disabledSceneWatchdogProvider___instance = (uint64_t)v0;
}

- (id)_scaleProvisions:(id)a3 byFactor:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 isResourceProvision])
        {
          long long v20 = 0uLL;
          uint64_t v21 = 0;
          if (v11)
          {
            [v11 allowance];
          }
          else
          {
            uint64_t v17 = 0;
            uint64_t v18 = 0;
            uint64_t v19 = 0;
          }
          FBSProcessResourceAllowanceScale();
          long long v15 = v20;
          uint64_t v16 = v21;
          double v12 = [MEMORY[0x1E4F62A00] provisionWithAllowance:&v15];
          if (v12) {
            id v13 = v12;
          }
          else {
            id v13 = v11;
          }
          [v5 addObject:v13];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultProcessWatchdogProvider, 0);
  objc_storeStrong((id *)&self->_explicitPolicy, 0);
}

@end