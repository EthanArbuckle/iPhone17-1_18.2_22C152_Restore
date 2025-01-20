@interface HKSPAnalyticsManager
+ (BOOL)defaultIsDiagnosticDataSubmissionAllowed;
+ (id)activePairedWatchProductType;
+ (id)currentDeviceType;
- (BOOL)isDiagnosticDataSubmissionAllowed;
- (BOOL)isImproveHealthAndActivitySubmissionAllowed;
- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3;
- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3 ihaOptInStatusProvider:(id)a4 diagnosticsOptInStatusProvider:(id)a5 analyticsEventConsumer:(id)a6;
- (HKSPAnalyticsStore)analyticsStore;
- (id)analyticsEventConsumer;
- (id)diagnosticsOptInStatusProvider;
- (id)ihaOptInStatusProvider;
- (void)setAnalyticsEventConsumer:(id)a3;
- (void)setAnalyticsStore:(id)a3;
- (void)setDiagnosticsOptInStatusProvider:(id)a3;
- (void)setIhaOptInStatusProvider:(id)a3;
- (void)trackEvent:(id)a3;
- (void)trackEvents:(id)a3;
@end

@implementation HKSPAnalyticsManager

- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3 ihaOptInStatusProvider:(id)a4 diagnosticsOptInStatusProvider:(id)a5 analyticsEventConsumer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HKSPAnalyticsManager;
  v14 = [(HKSPAnalyticsManager *)&v25 init];
  if (v14)
  {
    v15 = [[HKSPAnalyticsStore alloc] initWithUserDefaults:v10 diagnosticsOptInStatusProvider:v12];
    analyticsStore = v14->_analyticsStore;
    v14->_analyticsStore = v15;

    uint64_t v17 = [v11 copy];
    id ihaOptInStatusProvider = v14->_ihaOptInStatusProvider;
    v14->_id ihaOptInStatusProvider = (id)v17;

    uint64_t v19 = [v12 copy];
    id diagnosticsOptInStatusProvider = v14->_diagnosticsOptInStatusProvider;
    v14->_id diagnosticsOptInStatusProvider = (id)v19;

    uint64_t v21 = [v13 copy];
    id analyticsEventConsumer = v14->_analyticsEventConsumer;
    v14->_id analyticsEventConsumer = (id)v21;

    v23 = v14;
  }

  return v14;
}

- (HKSPAnalyticsManager)initWithUserDefaults:(id)a3
{
  return [(HKSPAnalyticsManager *)self initWithUserDefaults:a3 ihaOptInStatusProvider:&__block_literal_global_1 diagnosticsOptInStatusProvider:&__block_literal_global_279_0 analyticsEventConsumer:&__block_literal_global_282];
}

uint64_t __45__HKSPAnalyticsManager_initWithUserDefaults___block_invoke()
{
  return MEMORY[0x1F40E7D50]();
}

BOOL __45__HKSPAnalyticsManager_initWithUserDefaults___block_invoke_2()
{
  return +[HKSPAnalyticsManager defaultIsDiagnosticDataSubmissionAllowed];
}

void __45__HKSPAnalyticsManager_initWithUserDefaults___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = HKSPLogForCategory(0x11uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1A7E74000, v6, OS_LOG_TYPE_INFO, "AnalyticsSendEvent(%{public}@, %{public}@)", (uint8_t *)&v7, 0x16u);
  }

  AnalyticsSendEvent();
}

- (void)trackEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  v6 = [v4 arrayWithObjects:&v7 count:1];

  -[HKSPAnalyticsManager trackEvents:](self, "trackEvents:", v6, v7, v8);
}

- (void)trackEvents:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    uint64_t v8 = "[%{public}@] Tracking event %{public}@";
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v6;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        uint64_t v11 = HKSPLogForCategory(0x11uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v36 = v12;
          __int16 v37 = 2114;
          v38 = v10;
          id v13 = v12;
          _os_log_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_INFO, v8, buf, 0x16u);
        }
        v14 = [v10 eventPayload];
        if (![(HKSPAnalyticsManager *)self isImproveHealthAndActivitySubmissionAllowed]&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          uint64_t v15 = v7;
          v16 = v8;
          id v17 = v4;
          v18 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v19 = [v10 keysRequiringIHAGating];
          v20 = [v18 setWithArray:v19];

          uint64_t v21 = HKSPLogForCategory(0x11uLL);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v22;
            __int16 v37 = 2114;
            v38 = v20;
            id v23 = v22;
            _os_log_impl(&dword_1A7E74000, v21, OS_LOG_TYPE_INFO, "[%{public}@] Removing IHA gated keys %{public}@", buf, 0x16u);
          }
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __36__HKSPAnalyticsManager_trackEvents___block_invoke;
          v29[3] = &unk_1E5D31DB0;
          id v30 = v20;
          id v24 = v20;
          uint64_t v25 = objc_msgSend(v14, "na_filter:", v29);

          v14 = (void *)v25;
          id v4 = v17;
          uint64_t v8 = v16;
          uint64_t v7 = v15;
          uint64_t v6 = v28;
        }
        if ([v14 count])
        {
          id analyticsEventConsumer = (void (**)(id, void *, void *))self->_analyticsEventConsumer;
          v27 = [v10 eventName];
          analyticsEventConsumer[2](analyticsEventConsumer, v27, v14);
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v6);
  }
}

uint64_t __36__HKSPAnalyticsManager_trackEvents___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (BOOL)defaultIsDiagnosticDataSubmissionAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

- (BOOL)isDiagnosticDataSubmissionAllowed
{
  return (*((uint64_t (**)(void))self->_diagnosticsOptInStatusProvider + 2))();
}

- (BOOL)isImproveHealthAndActivitySubmissionAllowed
{
  return (*((uint64_t (**)(void))self->_ihaOptInStatusProvider + 2))();
}

+ (id)currentDeviceType
{
  v2 = [MEMORY[0x1E4F2B860] sharedBehavior];
  uint64_t v3 = objc_msgSend(v2, "hksp_device");

  id v4 = HKSPAnalyticsDeviceWatch;
  switch(v3)
  {
    case 2:
      break;
    case 4:
      id v4 = HKSPAnalyticsDevicePad;
      break;
    case 5:
      id v4 = HKSPAnalyticsDeviceMac;
      break;
    case 6:
      id v4 = HKSPAnalyticsDeviceReality;
      break;
    default:
      id v4 = HKSPAnalyticsDevicePhone;
      break;
  }
  uint64_t v5 = *v4;
  return v5;
}

+ (id)activePairedWatchProductType
{
  v2 = [MEMORY[0x1E4F79EF0] sharedInstance];
  uint64_t v3 = [v2 getActivePairedDevice];

  id v4 = [v3 valueForProperty:*MEMORY[0x1E4F79E18]];

  return v4;
}

- (HKSPAnalyticsStore)analyticsStore
{
  return self->_analyticsStore;
}

- (void)setAnalyticsStore:(id)a3
{
}

- (id)ihaOptInStatusProvider
{
  return self->_ihaOptInStatusProvider;
}

- (void)setIhaOptInStatusProvider:(id)a3
{
}

- (id)diagnosticsOptInStatusProvider
{
  return self->_diagnosticsOptInStatusProvider;
}

- (void)setDiagnosticsOptInStatusProvider:(id)a3
{
}

- (id)analyticsEventConsumer
{
  return self->_analyticsEventConsumer;
}

- (void)setAnalyticsEventConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_analyticsEventConsumer, 0);
  objc_storeStrong(&self->_diagnosticsOptInStatusProvider, 0);
  objc_storeStrong(&self->_ihaOptInStatusProvider, 0);
  objc_storeStrong((id *)&self->_analyticsStore, 0);
}

@end