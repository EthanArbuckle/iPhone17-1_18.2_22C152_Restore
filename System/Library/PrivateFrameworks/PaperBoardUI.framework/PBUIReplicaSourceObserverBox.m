@interface PBUIReplicaSourceObserverBox
- (PBUIReplicaSourceObserverBox)init;
- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3;
- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3 activeStateDidChangeHandler:(id)a4;
- (id)registerSourceObserver:(id)a3;
- (int64_t)effectiveStyle;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)dealloc;
- (void)invalidate;
- (void)setNeedsSourceUpdate;
@end

@implementation PBUIReplicaSourceObserverBox

- (id)registerSourceObserver:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  v6 = [v4 succinctDescriptionForObject:v5];
  v7 = [(BSCompoundAssertion *)self->_sharedUpdateAssertion acquireForReason:v6 withContext:v5];

  return v7;
}

- (PBUIReplicaSourceObserverBox)init
{
  return [(PBUIReplicaSourceObserverBox *)self initWithIdentifier:@"unknown ReplicaSourceObserverBox"];
}

- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3 activeStateDidChangeHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PBUIReplicaSourceObserverBox;
  v8 = [(PBUIReplicaSourceObserverBox *)&v20 init];
  v9 = v8;
  if (v8)
  {
    v8->_wasLastActive = 0;
    if (v7)
    {
      objc_initWeak(&location, v8);
      v10 = (void *)MEMORY[0x1E4F4F6E8];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __79__PBUIReplicaSourceObserverBox_initWithIdentifier_activeStateDidChangeHandler___block_invoke;
      v16[3] = &unk_1E62B4660;
      objc_copyWeak(&v18, &location);
      id v17 = v7;
      uint64_t v11 = [v10 assertionWithIdentifier:v6 stateDidChangeHandler:v16];
      sharedUpdateAssertion = v9->_sharedUpdateAssertion;
      v9->_sharedUpdateAssertion = (BSCompoundAssertion *)v11;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:v6];
      v14 = v9->_sharedUpdateAssertion;
      v9->_sharedUpdateAssertion = (BSCompoundAssertion *)v13;
    }
  }

  return v9;
}

void __79__PBUIReplicaSourceObserverBox_initWithIdentifier_activeStateDidChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = WeakRetained[8];
    if (v5 != [v6 isActive])
    {
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v6 isActive]);
      v4[8] = 1;
    }
  }
}

- (void)dealloc
{
  sharedUpdateAssertion = self->_sharedUpdateAssertion;
  if (sharedUpdateAssertion)
  {
    [(BSCompoundAssertion *)sharedUpdateAssertion invalidate];
    v4 = self->_sharedUpdateAssertion;
    self->_sharedUpdateAssertion = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PBUIReplicaSourceObserverBox;
  [(PBUIReplicaSourceObserverBox *)&v5 dealloc];
}

- (PBUIReplicaSourceObserverBox)initWithIdentifier:(id)a3
{
  return [(PBUIReplicaSourceObserverBox *)self initWithIdentifier:a3 activeStateDidChangeHandler:0];
}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = PBUILogSnapshot();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    objc_super v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    v8 = v5;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1BC4B3000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p> Invalidating", (uint8_t *)&v7, 0x16u);
  }
  [(BSCompoundAssertion *)self->_sharedUpdateAssertion invalidate];
  sharedUpdateAssertion = self->_sharedUpdateAssertion;
  self->_sharedUpdateAssertion = 0;
}

- (void)setNeedsSourceUpdate
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self;
  uint64_t v3 = [(PBUIReplicaSourceObserverBox *)v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = PBUILogSnapshot();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          __int16 v9 = (objc_class *)objc_opt_class();
          v10 = NSStringFromClass(v9);
          *(_DWORD *)buf = 138543874;
          v16 = v10;
          __int16 v17 = 2048;
          id v18 = v2;
          __int16 v19 = 2114;
          objc_super v20 = v7;
          _os_log_impl(&dword_1BC4B3000, v8, OS_LOG_TYPE_INFO, "<%{public}@:%p> Set source needs update for observer: %{public}@", buf, 0x20u);
        }
        [v7 setNeedsSourceUpdate];
      }
      uint64_t v4 = [(PBUIReplicaSourceObserverBox *)v2 countByEnumeratingWithState:&v11 objects:v21 count:16];
    }
    while (v4);
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  v8 = [(BSCompoundAssertion *)self->_sharedUpdateAssertion context];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void).cxx_destruct
{
}

@end