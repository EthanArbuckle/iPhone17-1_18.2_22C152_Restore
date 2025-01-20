@interface MTTimerIntentDonor
- (MTTimerIntentDonor)initWithStorage:(id)a3;
- (MTTimerStorage)storage;
- (NAScheduler)serializer;
- (NSMutableSet)donatedTimerIDs;
- (void)_queue_donateCreateTimerIntent:(id)a3 source:(id)a4;
- (void)setSerializer:(id)a3;
- (void)source:(id)a3 didAddTimers:(id)a4;
- (void)source:(id)a3 didFireTimer:(id)a4;
- (void)source:(id)a3 didUpdateTimers:(id)a4;
@end

@implementation MTTimerIntentDonor

- (MTTimerIntentDonor)initWithStorage:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self)
  {
    v6 = MTLogForCategory(4);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19CC95000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)&self->_storage, a3);
    [(MTTimerStorage *)self->_storage registerObserver:self];
    v7 = [MEMORY[0x1E4F1CA80] set];
    donatedTimerIDs = self->_donatedTimerIDs;
    self->_donatedTimerIDs = v7;

    v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.MTTimerIntentDonor.serialqueue", v9);

    v11 = [MEMORY[0x1E4F7A0F0] schedulerWithDispatchQueue:v10];
    serializer = self->_serializer;
    self->_serializer = v11;
  }
  return self;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 donatesIntent])
  {
    v8 = [(MTTimerIntentDonor *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __42__MTTimerIntentDonor_source_didAddTimers___block_invoke;
    v9[3] = &unk_1E5915078;
    v9[4] = self;
    id v10 = v7;
    id v11 = v6;
    [v8 performBlock:v9];
  }
}

void __42__MTTimerIntentDonor_source_didAddTimers___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v3;
    __int16 v17 = 2114;
    uint64_t v18 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didAddTimers %{public}@", buf, 0x16u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        objc_msgSend(*(id *)(a1 + 32), "_queue_donateCreateTimerIntent:source:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), *(void *)(a1 + 48), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 donatesIntent])
  {
    uint64_t v8 = [(MTTimerIntentDonor *)self serializer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__MTTimerIntentDonor_source_didUpdateTimers___block_invoke;
    v9[3] = &unk_1E5915078;
    v9[4] = self;
    id v10 = v7;
    id v11 = v6;
    [v8 performBlock:v9];
  }
}

void __45__MTTimerIntentDonor_source_didUpdateTimers___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v3;
    __int16 v20 = 2114;
    uint64_t v21 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateTimers %{public}@", buf, 0x16u);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", (void)v13) == 3)
        {
          objc_msgSend(*(id *)(a1 + 32), "_queue_donateCreateTimerIntent:source:", v10, *(void *)(a1 + 48));
        }
        else if ([v10 state] == 1)
        {
          id v11 = *(void **)(*(void *)(a1 + 32) + 16);
          long long v12 = [v10 timerID];
          [v11 removeObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(MTTimerIntentDonor *)self serializer];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MTTimerIntentDonor_source_didFireTimer___block_invoke;
  v8[3] = &unk_1E5915000;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 performBlock:v8];
}

void __42__MTTimerIntentDonor_source_didFireTimer___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = MTLogForCategory(4);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didFireTimer %{public}@", (uint8_t *)&v8, 0x16u);
  }

  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
  id v7 = [v5 timerID];
  [v6 removeObject:v7];
}

- (void)_queue_donateCreateTimerIntent:(id)a3 source:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  donatedTimerIDs = self->_donatedTimerIDs;
  uint64_t v9 = [v6 timerID];
  LOBYTE(donatedTimerIDs) = [(NSMutableSet *)donatedTimerIDs containsObject:v9];

  if ((donatedTimerIDs & 1) == 0)
  {
    if ([v6 hasDefaultTitle])
    {
      __int16 v10 = 0;
    }
    else
    {
      id v11 = objc_alloc(MEMORY[0x1E4F30750]);
      uint64_t v12 = [v6 displayTitle];
      __int16 v10 = (void *)[v11 initWithSpokenPhrase:v12];
    }
    id v13 = objc_alloc(MEMORY[0x1E4F303A8]);
    [v6 duration];
    long long v14 = objc_msgSend(v13, "initWithLabel:duration:type:", v10, 0);
    [v14 _setExtensionBundleId:@"com.apple.mobiletimer-framework.MobileTimerIntents"];
    [v14 _setLaunchId:@"com.apple.mobiletimer"];
    [v14 _setNanoLaunchId:@"com.apple.private.NanoTimer"];
    long long v15 = MTLogForCategory(4);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      __int16 v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Donating intent: %{public}@", buf, 0x16u);
    }

    long long v16 = [MEMORY[0x1E4F29230] mtUserActivityWithActivityType:@"com.apple.clock.timer"];
    v30[0] = @"identifier";
    uint64_t v17 = [v14 identifier];
    uint64_t v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = (__CFString *)v17;
    }
    else {
      uint64_t v19 = &stru_1EEDE16C8;
    }
    v30[1] = @"duration";
    v31[0] = v19;
    __int16 v20 = (void *)MEMORY[0x1E4F28ED0];
    [v14 duration];
    uint64_t v21 = objc_msgSend(v20, "numberWithDouble:");
    v31[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    [v16 setUserInfo:v22];

    v23 = (void *)[objc_alloc(MEMORY[0x1E4F303B0]) initWithCode:3 userActivity:v16];
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F30508]) initWithIntent:v14 response:v23];
    [v24 mtSetIntentDonorFromSource:v7];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke;
    v28[3] = &unk_1E5915AA8;
    id v29 = v14;
    id v25 = v14;
    [v24 donateInteractionWithCompletion:v28];
    v26 = self->_donatedTimerIDs;
    v27 = [v6 timerID];
    [(NSMutableSet *)v26 addObject:v27];
  }
}

void __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(4);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke_cold_1((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_19CC95000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }
}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (NSMutableSet)donatedTimerIDs
{
  return self->_donatedTimerIDs;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_donatedTimerIDs, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "Error donating timer create intent: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end