@interface SBDoNotDisturbMetric
- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4;
- (BOOL)isDoNotDisturbActive;
- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4;
- (DNDStateService)dndStateService;
- (NSString)floatingBundleIdentifier;
- (NSString)primaryBundleIdentifier;
- (NSString)sideBundleIdentifier;
- (SBDoNotDisturbMetric)init;
- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3;
- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3 dndStateService:(id)a4;
- (SBFAnalyticsClient)analyticsClient;
- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4;
- (unint64_t)location;
- (void)dealloc;
- (void)setFloatingBundleIdentifier:(id)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setPrimaryBundleIdentifier:(id)a3;
- (void)setSideBundleIdentifier:(id)a3;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
@end

@implementation SBDoNotDisturbMetric

- (BOOL)handleEvent:(unint64_t)a3 withContext:(id)a4
{
  v24[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = v6;
  if (a3 == 49)
  {
    v10 = [v6 eventPayload];
    v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FA7490]];
    int v12 = [v11 BOOLValue];

    if (v12)
    {
      if ([(SBDoNotDisturbMetric *)self location] == 4)
      {
        v13 = [(SBDoNotDisturbMetric *)self primaryBundleIdentifier];
        v14 = [(SBDoNotDisturbMetric *)self sideBundleIdentifier];
        v15 = [(SBDoNotDisturbMetric *)self floatingBundleIdentifier];
      }
      else
      {
        v13 = @"none";
        v14 = @"none";
        v15 = @"none";
      }
      v23[0] = @"Reason";
      v19 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4FA7498]];
      v24[0] = v19;
      v23[1] = @"Location";
      v20 = NSStringFromAnalyticsLayoutLocation([(SBDoNotDisturbMetric *)self location]);
      v24[1] = v20;
      v24[2] = v13;
      v23[2] = @"PrimaryBundleID";
      v23[3] = @"SideBundleID";
      v23[4] = @"FloatingBundleID";
      v24[3] = v14;
      v24[4] = v15;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:5];
      [(SBDoNotDisturbMetric *)self sendCoreAnalyticsEventWithName:@"com.apple.SpringBoard.Analytics.DoNotDisturbEnabled" payload:v21];
    }
  }
  else
  {
    if (a3 == 5)
    {
      v16 = [(SBDoNotDisturbMetric *)self _bundleIdentifierForElementWithLayoutRole:1 fromContext:v6];
      v17 = [(SBDoNotDisturbMetric *)self _bundleIdentifierForElementWithLayoutRole:2 fromContext:v7];
      v18 = [(SBDoNotDisturbMetric *)self _bundleIdentifierForElementWithLayoutRole:3 fromContext:v7];
      [(SBDoNotDisturbMetric *)self setPrimaryBundleIdentifier:v16];
      [(SBDoNotDisturbMetric *)self setSideBundleIdentifier:v17];
      [(SBDoNotDisturbMetric *)self setFloatingBundleIdentifier:v18];
    }
    else
    {
      if (a3 != 3)
      {
        LOBYTE(v12) = 0;
        goto LABEL_14;
      }
      v8 = [v6 eventPayload];
      v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

      [(SBDoNotDisturbMetric *)self setLocation:SBAnalyticsLayoutLocationForDisplayLayoutElements(v9)];
    }
    LOBYTE(v12) = 1;
  }
LABEL_14:

  return v12;
}

- (id)_bundleIdentifierForElementWithLayoutRole:(int64_t)a3 fromContext:(id)a4
{
  v5 = [a4 eventPayload];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA75A0]];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__SBDoNotDisturbMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke;
  v12[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v12[4] = a3;
  v7 = objc_msgSend(v6, "bs_firstObjectPassingTest:", v12);
  v8 = [v7 objectForKey:*MEMORY[0x1E4FA7580]];
  v9 = v8;
  if (!v8) {
    v8 = @"none";
  }
  v10 = v8;

  return v10;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (void)setSideBundleIdentifier:(id)a3
{
}

- (void)setPrimaryBundleIdentifier:(id)a3
{
}

- (void)setFloatingBundleIdentifier:(id)a3
{
}

BOOL __78__SBDoNotDisturbMetric__bundleIdentifierForElementWithLayoutRole_fromContext___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 objectForKey:*MEMORY[0x1E4FA7598]];
  BOOL v4 = [v3 integerValue] == *(void *)(a1 + 32);

  return v4;
}

- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F5F760];
  id v5 = a3;
  id v6 = [v4 serviceForClientIdentifier:@"com.apple.springboard.SBDoNotDisturbMetric"];
  v7 = [(SBDoNotDisturbMetric *)self initWithAnalyticsClient:v5 dndStateService:v6];

  return v7;
}

- (SBDoNotDisturbMetric)initWithAnalyticsClient:(id)a3 dndStateService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBDoNotDisturbMetric;
  v9 = [(SBDoNotDisturbMetric *)&v23 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dndStateService, a4);
    objc_storeStrong((id *)&v10->_analyticsClient, a3);
    primaryBundleIdentifier = v10->_primaryBundleIdentifier;
    v10->_id location = 0;
    v10->_primaryBundleIdentifier = (NSString *)@"none";

    sideBundleIdentifier = v10->_sideBundleIdentifier;
    v10->_sideBundleIdentifier = (NSString *)@"none";

    floatingBundleIdentifier = v10->_floatingBundleIdentifier;
    v10->_floatingBundleIdentifier = (NSString *)@"none";

    [(DNDStateService *)v10->_dndStateService addStateUpdateListener:v10 withCompletionHandler:0];
    dndStateService = v10->_dndStateService;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke;
    v21[3] = &unk_1E6B0B6F8;
    v15 = v10;
    v22 = v15;
    [(DNDStateService *)dndStateService queryCurrentStateWithCompletionHandler:v21];
    objc_initWeak(&location, v15);
    analyticsClient = v10->_analyticsClient;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_3;
    v18[3] = &unk_1E6AFB778;
    objc_copyWeak(&v19, &location);
    [(SBFAnalyticsClient *)analyticsClient registerForQueryName:5 handler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v10;
}

void __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_2;
  v5[3] = &unk_1E6AF5290;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) isActive];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = result;
  return result;
}

id __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_3(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_4;
  block[3] = &unk_1E6AF4B88;
  id v8 = &v9;
  id v2 = WeakRetained;
  id v7 = v2;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  uint64_t v13 = *MEMORY[0x1E4FA7490];
  id v3 = [NSNumber numberWithBool:*((unsigned __int8 *)v10 + 24)];
  v14[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  _Block_object_dispose(&v9, 8);
  return v4;
}

uint64_t __64__SBDoNotDisturbMetric_initWithAnalyticsClient_dndStateService___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDoNotDisturbActive];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (SBDoNotDisturbMetric)init
{
  id v3 = [MEMORY[0x1E4FA5E78] sharedInstance];
  id v4 = [(SBDoNotDisturbMetric *)self initWithAnalyticsClient:v3];

  return v4;
}

- (void)dealloc
{
  [(DNDStateService *)self->_dndStateService removeStateUpdateListener:self];
  v3.receiver = self;
  v3.super_class = (Class)SBDoNotDisturbMetric;
  [(SBDoNotDisturbMetric *)&v3 dealloc];
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [v5 state];
  uint64_t v7 = [v6 isActive];
  self->_doNotDisturbActive = v7;
  analyticsClient = self->_analyticsClient;
  v13[0] = *MEMORY[0x1E4FA7490];
  uint64_t v9 = [NSNumber numberWithBool:v7];
  v14[0] = v9;
  v13[1] = *MEMORY[0x1E4FA7498];
  unint64_t v10 = [v5 reason];

  if (v10 > 4) {
    uint64_t v11 = @"NotEnumerated";
  }
  else {
    uint64_t v11 = off_1E6B0B718[v10];
  }
  v14[1] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [(SBFAnalyticsClient *)analyticsClient emitEvent:49 withPayload:v12];
}

- (BOOL)sendCoreAnalyticsEventWithName:(id)a3 payload:(id)a4
{
  id v7 = a4;
  id v4 = v7;
  char v5 = AnalyticsSendEventLazy();

  return v5;
}

id __63__SBDoNotDisturbMetric_sendCoreAnalyticsEventWithName_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isDoNotDisturbActive
{
  return self->_doNotDisturbActive;
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (unint64_t)location
{
  return self->_location;
}

- (NSString)primaryBundleIdentifier
{
  return self->_primaryBundleIdentifier;
}

- (NSString)sideBundleIdentifier
{
  return self->_sideBundleIdentifier;
}

- (NSString)floatingBundleIdentifier
{
  return self->_floatingBundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sideBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_primaryBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
}

@end