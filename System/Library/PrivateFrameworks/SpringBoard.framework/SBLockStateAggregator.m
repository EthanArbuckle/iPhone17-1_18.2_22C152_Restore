@interface SBLockStateAggregator
+ (SBLockStateAggregator)sharedInstance;
- (BOOL)hasAnyLockState;
- (SBFAnalyticsClient)analyticsClient;
- (SBLockStateAggregator)init;
- (id)_descriptionForLockState:(unint64_t)a3;
- (id)_initWithAnalyticsClient:(id)a3;
- (id)description;
- (unint64_t)lockState;
- (void)_updateLockState;
- (void)dealloc;
- (void)setAnalyticsClient:(id)a3;
@end

@implementation SBLockStateAggregator

- (BOOL)hasAnyLockState
{
  return self->_lockState != 0;
}

+ (SBLockStateAggregator)sharedInstance
{
  if (sharedInstance_onceToken_36 != -1) {
    dispatch_once(&sharedInstance_onceToken_36, &__block_literal_global_255);
  }
  v2 = (void *)sharedInstance___manager_0;
  return (SBLockStateAggregator *)v2;
}

void __39__SBLockStateAggregator_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBLockStateAggregator);
  v1 = (void *)sharedInstance___manager_0;
  sharedInstance___manager_0 = (uint64_t)v0;
}

- (SBLockStateAggregator)init
{
  v3 = [MEMORY[0x1E4FA5E78] sharedInstance];
  v4 = [(SBLockStateAggregator *)self _initWithAnalyticsClient:v3];

  return v4;
}

- (id)_initWithAnalyticsClient:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockStateAggregator;
  v5 = [(SBLockStateAggregator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_analyticsClient, v4);
    v6->_lockState = 0;
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel__updateLockState name:*MEMORY[0x1E4FA7A38] object:0];
    [v7 addObserver:v6 selector:sel__updateLockState name:*MEMORY[0x1E4FA6140] object:0];
    [v7 addObserver:v6 selector:sel__updateLockState name:*MEMORY[0x1E4FA60F0] object:0];
    [(SBLockStateAggregator *)v6 _updateLockState];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBLockStateAggregator;
  [(SBLockStateAggregator *)&v4 dealloc];
}

- (id)_descriptionForLockState:(unint64_t)a3
{
  if (!a3)
  {
    v5 = @"none";
    goto LABEL_14;
  }
  char v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F28E78] string];
  v5 = v4;
  if (v3)
  {
    [(__CFString *)v4 appendString:@"UILocked"];
    if ((v3 & 2) == 0)
    {
LABEL_4:
      if ((v3 & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_11;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_4;
  }
  if ([(__CFString *)v5 length]) {
    [(__CFString *)v5 appendString:@", "];
  }
  [(__CFString *)v5 appendString:@"PasscodeLocked"];
  if ((v3 & 4) != 0)
  {
LABEL_11:
    if ([(__CFString *)v5 length]) {
      [(__CFString *)v5 appendString:@", "];
    }
    [(__CFString *)v5 appendString:@"Blocked"];
  }
LABEL_14:
  return v5;
}

- (id)description
{
  char v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t lockState = self->_lockState;
  v6 = [(SBLockStateAggregator *)self _descriptionForLockState:lockState];
  v7 = [v3 stringWithFormat:@"<%@: %p unint64_t lockState = 0x%X (%@)>", v4, self, lockState, v6];;

  return v7;
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)_updateLockState
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  char v3 = +[SBLockScreenManager sharedInstanceIfExists];
  unsigned int v4 = [v3 isUILocked];

  unint64_t v5 = v4;
  v6 = [(id)SBApp lockOutController];
  v7 = [(id)SBApp authenticationController];
  if (![v7 isAuthenticated]) {
    v5 |= 2uLL;
  }
  if ([v6 isBlocked]) {
    v5 |= 4uLL;
  }
  if (self->_lockState != v5)
  {
    v8 = SBLogCommon();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E4F28E78];
      v11 = [(SBLockStateAggregator *)self _descriptionForLockState:v5];
      v12 = [v10 stringWithFormat:@"Aggregate lock state changed: %@", v11];

      unint64_t lockState = self->_lockState;
      if (lockState)
      {
        unint64_t v14 = (lockState ^ v5) & lockState;
        if (((lockState ^ v5) & v5) != 0)
        {
          v15 = [(SBLockStateAggregator *)self _descriptionForLockState:(lockState ^ v5) & v5];
          [v12 appendFormat:@" (%@ added)", v15];
        }
        if (v14)
        {
          v16 = [(SBLockStateAggregator *)self _descriptionForLockState:v14];
          [v12 appendFormat:@" (%@ removed)", v16];
        }
      }
      else
      {
        [v12 appendString:@" (added)"];
      }
      v17 = SBLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v12;
        _os_log_impl(&dword_1D85BA000, v17, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }
    }
    self->_unint64_t lockState = v5;
    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v26 = @"SBAggregateLockStateKey";
    v19 = [NSNumber numberWithUnsignedInteger:self->_lockState];
    v27 = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v18 postNotificationName:@"SBAggregateLockStateDidChangeNotification" object:0 userInfo:v20];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
    uint64_t v24 = *MEMORY[0x1E4FA75D8];
    v22 = [NSNumber numberWithUnsignedInteger:self->_lockState];
    v25 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [WeakRetained emitEvent:48 withPayload:v23];
  }
}

- (SBFAnalyticsClient)analyticsClient
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsClient);
  return (SBFAnalyticsClient *)WeakRetained;
}

- (void)setAnalyticsClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end