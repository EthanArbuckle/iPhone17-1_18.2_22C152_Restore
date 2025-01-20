@interface PBBGatewayManager
+ (id)dateComponentsFromDNDScheduleTime:(id)a3;
+ (id)sharedManager;
- (BBSettingsGateway)settingsGateway;
- (BOOL)isScheduled;
- (BOOL)pairSyncEnabled;
- (BOOL)pairSyncStateEditable;
- (BOOL)repeatedCalls;
- (DNDGlobalConfigurationService)globalConfigurationService;
- (NSArray)bbSections;
- (NSDateComponents)dndFromComponents;
- (NSDateComponents)dndToComponents;
- (NSString)allowedGroupName;
- (NSString)doNotDisturbPrivilegedSenderTypeGroupIdentifier;
- (PBBGatewayManager)init;
- (PBBGatewayManagerDelegate)delegate;
- (unint64_t)doNotDisturbPrivilegedSenderType;
- (unint64_t)repeatedCallsEnabled;
- (void)dealloc;
- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4;
- (void)loadBBSections;
- (void)loadDNDState;
- (void)setBbSections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGlobalConfigurationService:(id)a3;
- (void)setPairSyncEnabled:(BOOL)a3;
- (void)setRepeatedCallsEnabled:(unint64_t)a3;
- (void)setSettingsGateway:(id)a3;
@end

@implementation PBBGatewayManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedManager___sharedManager;
  return v2;
}

uint64_t __34__PBBGatewayManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_alloc_init(PBBGatewayManager);
  return MEMORY[0x270F9A758]();
}

- (PBBGatewayManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)PBBGatewayManager;
  v2 = [(PBBGatewayManager *)&v12 init];
  if (v2)
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v3 = (void *)getBBSettingsGatewayClass_softClass;
    uint64_t v17 = getBBSettingsGatewayClass_softClass;
    if (!getBBSettingsGatewayClass_softClass)
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __getBBSettingsGatewayClass_block_invoke;
      v13[3] = &unk_264400C38;
      v13[4] = &v14;
      __getBBSettingsGatewayClass_block_invoke((uint64_t)v13);
      v3 = (void *)v15[3];
    }
    v4 = v3;
    _Block_object_dispose(&v14, 8);
    id v5 = [v4 alloc];
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Bridge.BBSettingsGateway", 0);
    uint64_t v7 = [v5 initWithQueue:v6];
    settingsGateway = v2->_settingsGateway;
    v2->_settingsGateway = (BBSettingsGateway *)v7;

    v9 = [MEMORY[0x263F3A6D0] serviceForClientIdentifier:@"com.apple.Bridge-PBBridgeGateway"];
    [(PBBGatewayManager *)v2 setGlobalConfigurationService:v9];

    v10 = [(PBBGatewayManager *)v2 globalConfigurationService];
    [v10 addListener:v2 withCompletionHandler:0];
  }
  return v2;
}

- (void)dealloc
{
  [(BBSettingsGateway *)self->_settingsGateway invalidate];
  v3 = [(PBBGatewayManager *)self globalConfigurationService];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)PBBGatewayManager;
  [(PBBGatewayManager *)&v4 dealloc];
}

- (void)loadBBSections
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  settingsGateway = self->_settingsGateway;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__PBBGatewayManager_loadBBSections__block_invoke;
  v6[3] = &unk_264401668;
  v6[4] = self;
  dispatch_semaphore_t v7 = v3;
  id v5 = v3;
  [(BBSettingsGateway *)settingsGateway getSectionInfoForActiveSectionsWithCompletion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __35__PBBGatewayManager_loadBBSections__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)dateComponentsFromDNDScheduleTime:(id)a3
{
  if (a3)
  {
    dispatch_semaphore_t v3 = (objc_class *)MEMORY[0x263EFF918];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
    uint64_t v6 = [v4 minute];

    [v5 setMinute:v6];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)loadDNDState
{
  dispatch_semaphore_t v3 = [MEMORY[0x263F3A7A8] serviceForClientIdentifier:@"com.apple.Bridge-PBBridgeGateway"];
  id v23 = 0;
  id v4 = [v3 scheduleSettingsReturningError:&v23];
  id v5 = v23;
  [v4 scheduleEnabledSetting];
  uint64_t v6 = DNDResolvedScheduleEnabledSetting();
  if (v5) {
    NSLog(&cfstr_Dndscheduleset.isa, v5);
  }
  self->_isScheduled = v6 == 2;
  dispatch_semaphore_t v7 = [v4 timePeriod];
  v8 = [v7 startTime];
  v9 = +[PBBGatewayManager dateComponentsFromDNDScheduleTime:v8];
  dndFromComponents = self->_dndFromComponents;
  self->_dndFromComponents = v9;

  v11 = [v4 timePeriod];
  objc_super v12 = [v11 endTime];
  v13 = +[PBBGatewayManager dateComponentsFromDNDScheduleTime:v12];
  dndToComponents = self->_dndToComponents;
  self->_dndToComponents = v13;

  id v22 = v5;
  v15 = [v3 phoneCallBypassSettingsReturningError:&v22];
  id v16 = v22;

  if (v16) {
    NSLog(&cfstr_Dndsettingsser.isa, v16);
  }
  if (v15)
  {
    uint64_t v17 = [v15 immediateBypassEventSourceType];
    if ((unint64_t)(v17 - 1) >= 5) {
      unint64_t v18 = 0;
    }
    else {
      unint64_t v18 = v17;
    }
    self->_doNotDisturbPrivilegedSenderType = v18;
    v19 = [v15 immediateBypassCNGroupIdentifier];
    v20 = (NSString *)[v19 copy];
    doNotDisturbPrivilegedSenderTypeGroupIdentifier = self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier;
    self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier = v20;

    self->_repeatedCallsEnabled = [v15 repeatEventSourceBehaviorEnabledSetting];
  }
}

- (BOOL)repeatedCalls
{
  return self->_repeatedCallsEnabled == 2;
}

- (BOOL)pairSyncStateEditable
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = [(PBBGatewayManager *)self globalConfigurationService];
  id v9 = 0;
  int v3 = [v2 getPairSyncStateReturningError:&v9];
  id v4 = v9;

  if (v4)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pair sync state editable value: %{public}@", buf, 0xCu);
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = (~v3 & 3) == 0;
  }

  return v7;
}

- (BOOL)pairSyncEnabled
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [(PBBGatewayManager *)self globalConfigurationService];
  id v8 = 0;
  unint64_t v3 = [v2 getPairSyncStateReturningError:&v8];
  id v4 = v8;

  if (v4)
  {
    id v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [v4 localizedDescription];
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Error getting pair sync enabled value: %{public}@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else
  {
    id v5 = ((v3 >> 2) & 1);
  }

  return (char)v5;
}

- (void)setPairSyncEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = [(PBBGatewayManager *)self globalConfigurationService];
  id v10 = 0;
  int v5 = [v4 setPairSyncPreferenceEnabled:v3 error:&v10];
  id v6 = v10;

  BOOL v7 = pbb_bridge_log();
  id v8 = v7;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 localizedDescription];
      *(_DWORD *)buf = 138543362;
      uint64_t v12 = v9;
      _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Error setting pair sync enabled value: %{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v12) = v3;
    _os_log_impl(&dword_21C445000, v8, OS_LOG_TYPE_DEFAULT, "Successfully updated pair sync enabled value to %i", buf, 8u);
  }
}

- (void)globalConfigurationService:(id)a3 didReceiveUpdatedPairSyncState:(unint64_t)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __79__PBBGatewayManager_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke;
  v4[3] = &unk_264401690;
  v4[4] = self;
  v4[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __79__PBBGatewayManager_globalConfigurationService_didReceiveUpdatedPairSyncState___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v7 = 136315394;
    id v8 = "-[PBBGatewayManager globalConfigurationService:didReceiveUpdatedPairSyncState:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v3;
    _os_log_impl(&dword_21C445000, v2, OS_LOG_TYPE_DEFAULT, "%s - pairSyncState: %lu", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 gatewayManagerDidUpdateFocusPairSyncValue];
  }
}

- (NSArray)bbSections
{
  return self->_bbSections;
}

- (void)setBbSections:(id)a3
{
}

- (unint64_t)repeatedCallsEnabled
{
  return self->_repeatedCallsEnabled;
}

- (void)setRepeatedCallsEnabled:(unint64_t)a3
{
  self->_repeatedCallsEnabled = a3;
}

- (DNDGlobalConfigurationService)globalConfigurationService
{
  return self->_globalConfigurationService;
}

- (void)setGlobalConfigurationService:(id)a3
{
}

- (BBSettingsGateway)settingsGateway
{
  return self->_settingsGateway;
}

- (void)setSettingsGateway:(id)a3
{
}

- (PBBGatewayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PBBGatewayManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)allowedGroupName
{
  return self->_allowedGroupName;
}

- (unint64_t)doNotDisturbPrivilegedSenderType
{
  return self->_doNotDisturbPrivilegedSenderType;
}

- (NSString)doNotDisturbPrivilegedSenderTypeGroupIdentifier
{
  return self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier;
}

- (BOOL)isScheduled
{
  return self->_isScheduled;
}

- (NSDateComponents)dndFromComponents
{
  return self->_dndFromComponents;
}

- (NSDateComponents)dndToComponents
{
  return self->_dndToComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dndToComponents, 0);
  objc_storeStrong((id *)&self->_dndFromComponents, 0);
  objc_storeStrong((id *)&self->_doNotDisturbPrivilegedSenderTypeGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedGroupName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_globalConfigurationService, 0);
  objc_storeStrong((id *)&self->_bbSections, 0);
}

@end