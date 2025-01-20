@interface HKSPSleepModeButtonModel
- (BOOL)isSelected;
- (HKSPSleepModeButtonModel)initWithDelegate:(id)a3;
- (HKSPSleepModeButtonModel)initWithSleepStore:(id)a3 delegate:(id)a4 behavior:(id)a5;
- (HKSPSleepModeButtonModelDelegate)delegate;
- (HKSPSleepStore)sleepStore;
- (_HKBehavior)behavior;
- (int64_t)sleepMode;
- (void)_checkSleepModeState;
- (void)_launchAppForOnboarding;
- (void)_queue_updateStateWithSleepMode:(int64_t)a3;
- (void)_updateStateWithSleepMode:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation HKSPSleepModeButtonModel

- (HKSPSleepModeButtonModel)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [HKSPSleepStore alloc];
  v6 = HKSPGenerateSleepStoreIdentifier(@"sleepModeButton");
  v7 = [(HKSPSleepStore *)v5 initWithIdentifier:v6];
  v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
  v9 = [(HKSPSleepModeButtonModel *)self initWithSleepStore:v7 delegate:v4 behavior:v8];

  return v9;
}

- (HKSPSleepModeButtonModel)initWithSleepStore:(id)a3 delegate:(id)a4 behavior:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HKSPSleepModeButtonModel;
  v12 = [(HKSPSleepModeButtonModel *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sleepStore, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_behavior, a5);
    [(HKSPSleepStore *)v13->_sleepStore addObserver:v13];
    [(HKSPSleepModeButtonModel *)v13 _checkSleepModeState];
    v14 = v13;
  }

  return v13;
}

- (void)_checkSleepModeState
{
  v3 = [(HKSPSleepStore *)self->_sleepStore sleepModeFuture];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__HKSPSleepModeButtonModel__checkSleepModeState__block_invoke;
  v5[3] = &unk_1E5D31F08;
  v5[4] = self;
  id v4 = (id)[v3 addSuccessBlock:v5];
}

uint64_t __48__HKSPSleepModeButtonModel__checkSleepModeState__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 integerValue];
  return [v2 _updateStateWithSleepMode:v3];
}

- (BOOL)isSelected
{
  int v3 = [(_HKBehavior *)self->_behavior isAppleWatch];
  int64_t sleepMode = self->_sleepMode;
  BOOL v5 = sleepMode == 2;
  BOOL v6 = sleepMode != 0;
  if (v3) {
    return v5;
  }
  else {
    return v6;
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke;
  v10[3] = &unk_1E5D31F58;
  v10[4] = self;
  BOOL v11 = a3;
  BOOL v5 = (void (**)(void))MEMORY[0x1AD0DD220](v10, a2);
  BOOL v6 = v5;
  if (v3)
  {
    sleepStore = self->_sleepStore;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_287;
    v8[3] = &unk_1E5D31FA8;
    v8[4] = self;
    id v9 = v5;
    [(HKSPSleepStore *)sleepStore currentSleepEventRecordWithCompletion:v8];
  }
  else
  {
    v5[2](v5);
  }
}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  BOOL v6 = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2;
  v7 = &unk_1E5D31F30;
  objc_copyWeak(&v8, &location);
  [v2 setSleepModeOn:v3 completion:&v4];
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateStateWithSleepMode:", 2 * *(unsigned __int8 *)(a1 + 40), v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0)
  {
    v7 = HKSPLogForCategory(7uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543618;
      id v10 = (id)objc_opt_class();
      __int16 v11 = 2114;
      id v12 = v5;
      id v8 = v10;
      _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to set sleep mode: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    [WeakRetained _checkSleepModeState];
  }
}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_287(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2_288;
  v11[3] = &unk_1E5D31F80;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v5;
  uint64_t v13 = v7;
  id v14 = v6;
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __40__HKSPSleepModeButtonModel_setSelected___block_invoke_2_288(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v3 = [v2 isAppleWatch];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3)
    {
      char v5 = [v4 isAnySleepTrackingOnboardingCompleted];

      if ((v5 & 1) == 0)
      {
LABEL_4:
        id v6 = HKSPLogForCategory(7uLL);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138543362;
          id v15 = (id)objc_opt_class();
          id v7 = v15;
          _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] onboarding not completed", (uint8_t *)&v14, 0xCu);
        }
        [*(id *)(a1 + 40) _launchAppForOnboarding];
        return;
      }
    }
    else
    {
      int v9 = [v4 isAnySleepCoachingOnboardingCompleted];

      if (!v9) {
        goto LABEL_4;
      }
    }
    id v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
  else
  {
    id v8 = HKSPLogForCategory(7uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = objc_opt_class();
      uint64_t v12 = *(void *)(a1 + 48);
      int v14 = 138543618;
      id v15 = v11;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      id v13 = v11;
      _os_log_error_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] failed to get onboarding version: %{public}@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_launchAppForOnboarding
{
  HKSPSleepURLWithOptionsFromSource(@"onboardSleepCoaching", 0, @"SleepModeButton", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  int v3 = [(HKSPSleepModeButtonModel *)self delegate];
  [v3 sleepModeButtonModel:self launchURL:v4];
}

- (void)_updateStateWithSleepMode:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__HKSPSleepModeButtonModel__updateStateWithSleepMode___block_invoke;
  v3[3] = &unk_1E5D31FD0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __54__HKSPSleepModeButtonModel__updateStateWithSleepMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateStateWithSleepMode:", *(void *)(a1 + 40));
}

- (void)_queue_updateStateWithSleepMode:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = HKSPLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = NSStringFromHKSPSleepMode(a3);
    int v10 = 138543618;
    __int16 v11 = v6;
    __int16 v12 = 2114;
    id v13 = v8;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating sleep mode state: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  self->_int64_t sleepMode = a3;
  int v9 = [(HKSPSleepModeButtonModel *)self delegate];
  [v9 sleepModeButtonModelChanged:self];
}

- (HKSPSleepModeButtonModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPSleepModeButtonModelDelegate *)WeakRetained;
}

- (HKSPSleepStore)sleepStore
{
  return self->_sleepStore;
}

- (int64_t)sleepMode
{
  return self->_sleepMode;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_sleepStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end