@interface HKSPSleepWidgetManager
+ (BOOL)_shouldForceWidgetReload:(unint64_t)a3;
+ (id)_widgetReloadDescription:(unint64_t)a3;
+ (id)defaultRelevanceController;
+ (id)defaultTimelineControllers;
+ (id)widgetBundleIdentifierForCurrentDevice;
+ (id)widgetContainerBundleIdentifierForCurrentDevice;
+ (id)widgetKinds;
- (HKSPSleepWidgetManager)init;
- (HKSPSleepWidgetManager)initWithTimelineControllers:(id)a3 relevanceController:(id)a4;
- (HKSPSleepWidgetManagerDelegate)delegate;
- (HKSPWidgetRelevanceController)relevanceController;
- (NAScheduler)chsScheduler;
- (NSArray)timelineControllers;
- (void)invalidateRelevances;
- (void)reloadWidgetsWithReason:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation HKSPSleepWidgetManager

- (HKSPSleepWidgetManager)init
{
  v3 = [(id)objc_opt_class() defaultTimelineControllers];
  v4 = [(id)objc_opt_class() defaultRelevanceController];
  v5 = [(HKSPSleepWidgetManager *)self initWithTimelineControllers:v3 relevanceController:v4];

  return v5;
}

- (HKSPSleepWidgetManager)initWithTimelineControllers:(id)a3 relevanceController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepWidgetManager;
  v9 = [(HKSPSleepWidgetManager *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timelineControllers, a3);
    objc_storeStrong((id *)&v10->_relevanceController, a4);
    uint64_t v11 = [MEMORY[0x1E4F7A0F0] serialDispatchQueueSchedulerWithName:@"com.apple.HKSPSleepWidgetManager.serial"];
    chsScheduler = v10->_chsScheduler;
    v10->_chsScheduler = (NAScheduler *)v11;

    v13 = v10;
  }

  return v10;
}

+ (id)defaultTimelineControllers
{
  v3 = [a1 widgetKinds];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKSPSleepWidgetManager_defaultTimelineControllers__block_invoke;
  v6[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v6[4] = a1;
  v4 = objc_msgSend(v3, "na_map:", v6);

  return v4;
}

id __52__HKSPSleepWidgetManager_defaultTimelineControllers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  v4 = (void *)getCHSTimelineControllerClass_softClass;
  uint64_t v14 = getCHSTimelineControllerClass_softClass;
  if (!getCHSTimelineControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getCHSTimelineControllerClass_block_invoke;
    v10[3] = &unk_1E5D336E8;
    v10[4] = &v11;
    __getCHSTimelineControllerClass_block_invoke((uint64_t)v10);
    v4 = (void *)v12[3];
  }
  v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 alloc];
  id v7 = [*(id *)(a1 + 32) widgetBundleIdentifierForCurrentDevice];
  id v8 = (void *)[v6 initWithExtensionBundleIdentifier:v7 kind:v3];

  return v8;
}

+ (id)defaultRelevanceController
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  v2 = (void *)getCHSWidgetServiceClass_softClass;
  uint64_t v10 = getCHSWidgetServiceClass_softClass;
  if (!getCHSWidgetServiceClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getCHSWidgetServiceClass_block_invoke;
    v6[3] = &unk_1E5D336E8;
    v6[4] = &v7;
    __getCHSWidgetServiceClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  v4 = [v3 sharedWidgetService];
  return v4;
}

+ (id)widgetKinds
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.health.SleepStageWidget";
  v4[1] = @"com.apple.health.SleepWidget";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

- (void)reloadWidgetsWithReason:(unint64_t)a3
{
  v5 = [(id)objc_opt_class() _widgetReloadDescription:a3];
  char v6 = [(id)objc_opt_class() _shouldForceWidgetReload:a3];
  timelineControllers = self->_timelineControllers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke;
  v9[3] = &unk_1E5D33698;
  v9[4] = self;
  id v10 = v5;
  char v11 = v6;
  id v8 = v5;
  [(NSArray *)timelineControllers na_each:v9];
}

void __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [v3 kind];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  if (WeakRetained
    && (id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8)),
        int v7 = [v6 shouldReloadWidgetOfKind:v4],
        v6,
        !v7))
  {
    v16 = HKSPLogForCategory(0x12uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      v27 = v4;
      id v17 = v25;
      _os_log_impl(&dword_1A7E74000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] not reloading %{public}@ timeline", buf, 0x16u);
    }
  }
  else
  {
    id v8 = HKSPLogForCategory(0x12uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)buf = 138544130;
      id v25 = v9;
      __int16 v26 = 2114;
      v27 = v4;
      __int16 v28 = 2114;
      uint64_t v29 = v10;
      __int16 v30 = 1024;
      int v31 = v11;
      id v12 = v9;
      _os_log_impl(&dword_1A7E74000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] reloading %{public}@ timeline (reason: %{public}@, forceReload: %d)", buf, 0x26u);
    }
    uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke_300;
    v18[3] = &unk_1E5D33670;
    char v23 = *(unsigned char *)(a1 + 48);
    v19 = v3;
    id v14 = *(id *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 32);
    id v20 = v14;
    uint64_t v21 = v15;
    id v22 = v4;
    [v13 performBlock:v18];

    v16 = v19;
  }
}

void __50__HKSPSleepWidgetManager_reloadWidgetsWithReason___block_invoke_300(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v2) {
    [v3 reloadTimelineWithReason:v4];
  }
  else {
  v5 = [v3 reloadTimelineBudgetedWithReason:v4];
  }
  id v6 = HKSPLogForCategory(0x12uLL);
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_opt_class();
      uint64_t v9 = *(void *)(a1 + 56);
      int v13 = 138543874;
      id v14 = v8;
      __int16 v15 = 2114;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      v18 = v5;
      id v10 = v8;
      _os_log_error_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to reload %{public}@ timeline (error: %{public}@)", (uint8_t *)&v13, 0x20u);
LABEL_9:
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = objc_opt_class();
    uint64_t v12 = *(void *)(a1 + 56);
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2114;
    uint64_t v16 = v12;
    id v10 = v11;
    _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_INFO, "[%{public}@] successfully reloaded %{public}@ timeline", (uint8_t *)&v13, 0x16u);
    goto LABEL_9;
  }
}

- (void)invalidateRelevances
{
  id v3 = [(id)objc_opt_class() widgetKinds];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke;
  void v4[3] = &unk_1E5D336C0;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);
}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));

  if (WeakRetained
    && (id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8)),
        int v6 = [v5 shouldInvalidateRelevanceForWidgetOfKind:v3],
        v5,
        !v6))
  {
    int v11 = HKSPLogForCategory(0x12uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v3;
      id v12 = v16;
      _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] not invalidating %{public}@ relevances", buf, 0x16u);
    }
  }
  else
  {
    int v7 = HKSPLogForCategory(0x12uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v16 = (id)objc_opt_class();
      __int16 v17 = 2114;
      id v18 = v3;
      id v8 = v16;
      _os_log_impl(&dword_1A7E74000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] invalidating %{public}@ relevances", buf, 0x16u);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void **)(v9 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_303;
    v13[3] = &unk_1E5D31AA8;
    v13[4] = v9;
    id v14 = v3;
    [v10 performBlock:v13];
  }
}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_303(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [(id)objc_opt_class() widgetContainerBundleIdentifierForCurrentDevice];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_2;
  v6[3] = &unk_1E5D32E18;
  id v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 invalidateRelevancesOfKind:v2 inBundle:v4 completion:v6];
}

void __46__HKSPSleepWidgetManager_invalidateRelevances__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = HKSPLogForCategory(0x12uLL);
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = objc_opt_class();
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 138543874;
      id v12 = v6;
      __int16 v13 = 2114;
      uint64_t v14 = v7;
      __int16 v15 = 2114;
      id v16 = v3;
      id v8 = v6;
      _os_log_error_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to invalidate %{public}@ relevances (error: %{public}@)", (uint8_t *)&v11, 0x20u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = *(void *)(a1 + 40);
    int v11 = 138543618;
    id v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    id v8 = v9;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_INFO, "[%{public}@] successfully invalidated %{public}@ relevances", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }
}

+ (id)widgetBundleIdentifierForCurrentDevice
{
  uint64_t v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  unint64_t v3 = objc_msgSend(v2, "hksp_device");

  BOOL v4 = v3 > 6 || ((1 << v3) & 0x7A) == 0;
  if (!v4 || v3 == 1000) {
    return @"com.apple.Health.Sleep.SleepWidgetExtension";
  }
  else {
    return @"com.apple.NanoSleep.watchkitapp.NanoSleepWidgetExtension";
  }
}

+ (id)widgetContainerBundleIdentifierForCurrentDevice
{
  uint64_t v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  uint64_t v3 = objc_msgSend(v2, "hksp_device");

  if (v3 == 2) {
    BOOL v4 = @"com.apple.NanoSleep.watchkitapp";
  }
  else {
    BOOL v4 = @"com.apple.Health.Sleep";
  }
  return v4;
}

+ (BOOL)_shouldForceWidgetReload:(unint64_t)a3
{
  return (a3 < 5) & (0x1Du >> a3);
}

+ (id)_widgetReloadDescription:(unint64_t)a3
{
  if (a3 > 4) {
    return @"Unknown";
  }
  else {
    return off_1E5D33740[a3];
  }
}

- (HKSPSleepWidgetManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKSPSleepWidgetManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)timelineControllers
{
  return self->_timelineControllers;
}

- (HKSPWidgetRelevanceController)relevanceController
{
  return self->_relevanceController;
}

- (NAScheduler)chsScheduler
{
  return self->_chsScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chsScheduler, 0);
  objc_storeStrong((id *)&self->_relevanceController, 0);
  objc_storeStrong((id *)&self->_timelineControllers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end