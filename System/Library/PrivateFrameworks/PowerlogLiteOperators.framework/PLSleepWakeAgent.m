@interface PLSleepWakeAgent
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionPowerState;
+ (id)entryEventForwardDefinitionUserIdle;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitionPowerNapConfig;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionCurrentKernelWakeTime;
+ (id)entryEventPointDefinitionCurrentMachWakeTime;
+ (id)entryEventPointDefinitionKernelState;
+ (id)entryEventPointDefinitionScheduledWake;
+ (id)entryEventPointDefinitionWakeGesture;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (IONotificationPort)systemPowerPortRef;
- (PLEventForwardPowerStateEntry)lastSleepEntry;
- (PLEventForwardPowerStateEntry)lastWakeEntry;
- (PLSemaphore)canSleepSemaphore;
- (PLSleepWakeAgent)init;
- (PLXPCListenerOperatorComposition)wakeGestureXPCListener;
- (__IOPMConnection)pmConnection;
- (double)apSOCBasePower;
- (id)driverWakeReasons;
- (id)getCurrentWakeTimeKey;
- (id)getLastSleepEntry;
- (id)getLastWakeEntry;
- (id)getPostWakeEntry:(unint64_t)a3;
- (id)getSleepStatisticsApps;
- (id)getThisWakeEntry:(id)a3 withCurrentWakeTime:(unint64_t)a4 withIsDarkwake:(BOOL)a5 withDidSleep:(BOOL)a6;
- (id)sleepTriggers;
- (id)wakeReasonFromIORegistry;
- (id)wakeReasons;
- (id)wakeReasonsAsNSString;
- (id)wakeType;
- (signed)getSleepState;
- (unint64_t)getCurrentWakeTime;
- (unint64_t)getSleepSubclassKey;
- (unsigned)getIOPMRootDomain;
- (unsigned)pmNotifier;
- (unsigned)rootDomainConnect;
- (void)capabilitiesChanged:(unsigned int)a3;
- (void)initOperatorDependancies;
- (void)logEventForwardUserIdle:(BOOL)a3;
- (void)logEventNonePowerNapConfig;
- (void)logEventPointCurrentScheduledWake;
- (void)logEventPointKernelState;
- (void)logEventPointWakeGesture:(id)a3;
- (void)logSleepEntries:(id)a3;
- (void)logWakeEntries:(id)a3 withCurrentTime:(unint64_t)a4;
- (void)setApSOCBasePower:(double)a3;
- (void)setCanSleepSemaphore:(id)a3;
- (void)setLastSleepEntry:(id)a3;
- (void)setLastWakeEntry:(id)a3;
- (void)setPmConnection:(__IOPMConnection *)a3;
- (void)setPmNotifier:(unsigned int)a3;
- (void)setRootDomainConnect:(unsigned int)a3;
- (void)setSystemPowerPortRef:(IONotificationPort *)a3;
- (void)setWakeGestureXPCListener:(id)a3;
- (void)systemPoweredOn;
@end

@implementation PLSleepWakeAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSleepWakeAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"PowerNapConfig";
  objc_super v2 = [(id)objc_opt_class() entryEventNoneDefinitionPowerNapConfig];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventNoneDefinitionPowerNapConfig
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    v14[0] = *MEMORY[0x1E4F92C50];
    uint64_t v12 = *MEMORY[0x1E4F92CD0];
    v13 = &unk_1F29F06C0;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v15[0] = v2;
    v14[1] = *MEMORY[0x1E4F92CA8];
    v10[0] = @"BatteryPower";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v10[1] = @"ACPower";
    v11[0] = v4;
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v11[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
    v15[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v8;
}

+ (id)entryEventPointDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"WakeGesture";
  v3 = [a1 entryEventPointDefinitionWakeGesture];
  v10[0] = v3;
  v9[1] = @"CurrentMachWakeTime";
  v4 = [a1 entryEventPointDefinitionCurrentMachWakeTime];
  v10[1] = v4;
  v9[2] = @"KernelState";
  v5 = [a1 entryEventPointDefinitionKernelState];
  void v10[2] = v5;
  v9[3] = @"ScheduledWake";
  v6 = [a1 entryEventPointDefinitionScheduledWake];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryEventPointDefinitionWakeGesture
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F06C0;
  v16[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"Mode";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"Event";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"Display";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionCurrentKernelWakeTime
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitionCurrentMachWakeTime
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F06C0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"CurrentMachWakeTime";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"WakeReasons";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionKernelState
{
  v17[3] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOT])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CC0];
    v14[0] = *MEMORY[0x1E4F92CD0];
    v14[1] = v2;
    v15[0] = &unk_1F29F06C0;
    v15[1] = MEMORY[0x1E4F1CC38];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    v17[0] = v3;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"State";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v12[1] = @"Reason";
    v13[0] = v5;
    uint64_t v10 = *MEMORY[0x1E4F92D10];
    v11 = &unk_1F29E5578;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    void v16[2] = *MEMORY[0x1E4F92C18];
    v17[1] = v7;
    void v17[2] = &unk_1F29ED808;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v8;
}

+ (id)entryEventPointDefinitionScheduledWake
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F06D0;
  v22[1] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"EventTime";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_DateFormat");
  v20[0] = v16;
  v19[1] = @"Type";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v20[1] = v14;
  v19[2] = @"PID";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  v19[3] = @"SleepWakeUUID";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v20[3] = v6;
  v19[4] = @"WakeInfo";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v20[4] = v8;
  v19[5] = @"ProcessName";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat_withProcessName");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"PowerState";
  v3 = [a1 entryEventForwardDefinitionPowerState];
  v7[1] = @"UserIdle";
  v8[0] = v3;
  v4 = [a1 entryEventForwardDefinitionUserIdle];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardDefinitionUserIdle
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionPowerState
{
  v40[5] = *MEMORY[0x1E4F143B8];
  v39[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CD8];
  v37[0] = *MEMORY[0x1E4F92CD0];
  v37[1] = v2;
  v38[0] = &unk_1F29F06E0;
  v38[1] = MEMORY[0x1E4F1CBF0];
  uint64_t v3 = *MEMORY[0x1E4F92CC0];
  v37[2] = *MEMORY[0x1E4F92CB8];
  v37[3] = v3;
  v38[2] = MEMORY[0x1E4F1CC28];
  v38[3] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F92C08];
  v37[4] = *MEMORY[0x1E4F92C60];
  v37[5] = v4;
  v38[4] = MEMORY[0x1E4F1CC38];
  v38[5] = MEMORY[0x1E4F1CC38];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
  v40[0] = v28;
  v39[1] = *MEMORY[0x1E4F92CA8];
  v35[0] = @"State";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v36[0] = v26;
  v35[1] = @"Event";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v36[1] = v24;
  v35[2] = @"Reason";
  uint64_t v33 = *MEMORY[0x1E4F92D10];
  v34 = &unk_1F29E5578;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  v36[2] = v23;
  v35[3] = @"UUID";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v36[3] = v21;
  v35[4] = @"CurrentMachWakeTime";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v36[4] = v19;
  v35[5] = @"KernelSleepDate";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v36[5] = v17;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];
  v40[1] = v5;
  v40[2] = &unk_1F29ED820;
  uint64_t v6 = *MEMORY[0x1E4F92C90];
  v39[2] = *MEMORY[0x1E4F92C18];
  v39[3] = v6;
  v40[3] = &unk_1F29ED838;
  v39[4] = *MEMORY[0x1E4F92C68];
  v31[0] = @"key";
  v29[0] = @"PID";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v29[1] = @"AppName";
  v30[0] = v8;
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat_withAppName");
  v30[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v31[1] = @"value";
  v32[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v12, "commonTypeDict_StringFormat");
  v32[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v40[4] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:5];

  return v15;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLSleepWakeAgent)init
{
  v14.receiver = self;
  v14.super_class = (Class)PLSleepWakeAgent;
  uint64_t v2 = [(PLAgent *)&v14 init];
  uint64_t v3 = v2;
  if (v2)
  {
    lastSleepEntry = v2->_lastSleepEntry;
    v2->_lastSleepEntry = 0;

    lastWakeEntry = v3->_lastWakeEntry;
    v3->_lastWakeEntry = 0;

    v3->_systemPowerPortRef = 0;
    v3->_rootDomainConnect = IORegisterForSystemPower(v3, &v3->_systemPowerPortRef, (IOServiceInterestCallback)PowerChangedCallback, &v3->_pmNotifier);
    uint64_t v6 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:*MEMORY[0x1E4F92BD0]];
    canSleepSemaphore = v3->_canSleepSemaphore;
    v3->_canSleepSemaphore = (PLSemaphore *)v6;

    if (v3->_rootDomainConnect)
    {
      systemPowerPortRef = v3->_systemPowerPortRef;
      if (systemPowerPortRef)
      {
        v9 = [(PLOperator *)v3 workQueue];
        IONotificationPortSetDispatchQueue(systemPowerPortRef, v9);
      }
    }
    [(PLSleepWakeAgent *)v3 registerForCapabilitiesChange];
    if ([(PLOperator *)v3 isDebugEnabled])
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)fakeSleep, @"com.apple.powerlogd.PLSleepWakeAgent.fakeSleep", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      v11 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v11, v3, (CFNotificationCallback)fakeWakeBB, @"com.apple.powerlogd.PLSleepWakeAgent.fakeWakeBB", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      uint64_t v12 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v12, v3, (CFNotificationCallback)fakeWakeWiFi, @"com.apple.powerlogd.PLSleepWakeAgent.fakeWakeWiFi", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  return v3;
}

- (void)initOperatorDependancies
{
  uint64_t v3 = [(PLSleepWakeAgent *)self getLastSleepEntry];
  lastSleepEntry = self->_lastSleepEntry;
  self->_lastSleepEntry = v3;

  v5 = [(PLSleepWakeAgent *)self getLastWakeEntry];
  lastWakeEntry = self->_lastWakeEntry;
  self->_lastWakeEntry = v5;

  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    v7 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"Processor"];
    uint64_t v8 = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    v9 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v8);
    uint64_t v10 = [v7 objectForKeyedSubscript:v9];
    [v10 doubleValue];
    -[PLSleepWakeAgent setApSOCBasePower:](self, "setApSOCBasePower:");

    [(PLSleepWakeAgent *)self apSOCBasePower];
    if (v11 <= 0.0) {
      [(PLSleepWakeAgent *)self setApSOCBasePower:30.0];
    }
  }
  uint64_t v12 = [(PLOperator *)self storage];
  v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"PowerState"];
  objc_super v14 = [v12 lastEntryForKey:v13];

  if (!v14) {
    [(PLSleepWakeAgent *)self systemPoweredOn];
  }
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke;
    v20[3] = &unk_1E692A6F8;
    v20[4] = self;
    v16 = (void *)[v15 initWithOperator:self withRegistration:&unk_1F29E95E0 withBlock:v20];
    [(PLSleepWakeAgent *)self setWakeGestureXPCListener:v16];
    if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001002)
    {
      v17 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      v18 = [MEMORY[0x1E4F92900] sharedInstance];
      [(PLSleepWakeAgent *)self apSOCBasePower];
      objc_msgSend(v18, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 52, v17);

      v19 = [MEMORY[0x1E4F92900] sharedInstance];
      [v19 createQualificationEventForwardWithQualificationID:8 withChildNodeNames:&unk_1F29ED850 withStartDate:v17];
    }
  }
  [(PLSleepWakeAgent *)self registerForUserIdleNotification];
  [(PLSleepWakeAgent *)self logEventForwardUserIdle:IOPMUserIsActive() ^ 1];
}

void __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD582D0 != -1) {
      dispatch_once(&qword_1EBD582D0, &block);
    }
    if (_MergedGlobals_1_24)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Lift to Wake! %@", v6, block, v15, v16, v17, v18];
      v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      double v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:363];

      v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointWakeGesture:v6];
}

uint64_t __44__PLSleepWakeAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_24 = result;
  return result;
}

- (void)logEventPointWakeGesture:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"WakeGesture"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"mode"];
  [v6 setObject:v7 forKeyedSubscript:@"Mode"];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"event"];
  [v6 setObject:v8 forKeyedSubscript:@"Event"];

  v9 = [v5 objectForKeyedSubscript:@"display"];

  [v6 setObject:v9 forKeyedSubscript:@"Display"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointKernelState
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  memset(v38, 0, 512);
  size_t v37 = 1960;
  uint64_t v3 = sysctlbyname("kern.aotmetrics", v38, &v37, 0, 0);
  if (v3)
  {
    uint64_t v4 = v3;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke_172;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD582E0 != -1) {
        dispatch_once(&qword_1EBD582E0, block);
      }
      if (byte_1EBD582B2)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to query kernel metrics (%d)", v4);
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        v9 = [v8 lastPathComponent];
        id v10 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointKernelState]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:448];

        double v11 = PLLogCommon();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = (void *)v6;
LABEL_28:

          return;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = (void *)v6;
        uint64_t v43 = v6;
        goto LABEL_27;
      }
    }
  }
  else
  {
    if (LODWORD(v38[0]))
    {
      v34 = self;
      if (LODWORD(v38[0]) >= 0x18) {
        uint64_t v13 = 24;
      }
      else {
        uint64_t v13 = LODWORD(v38[0]);
      }
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
      double v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"KernelState"];
      unint64_t v14 = 0;
      uint64_t v15 = (char *)&v38[2] + 8;
      v16 = &v39;
      unint64_t v17 = 0x1E4F1C000uLL;
      do
      {
        if (v14)
        {
          uint64_t v18 = [*(id *)(v17 + 2504) dateWithTimeIntervalSince1970:(double)(*v16 & 0x3FF) / 1000.0 + (double)((unint64_t)*v16 >> 10)];
          v19 = [v18 convertFromSystemToMonotonic];

          v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11 withDate:v19];
          [v20 setObject:&unk_1F29E55A8 forKeyedSubscript:@"State"];
          [v12 addObject:v20];
        }
        if (v14 < (v13 - 1))
        {
          uint64_t v21 = [*(id *)(v17 + 2504) dateWithTimeIntervalSince1970:(double)(v16[24] & 0x3FF) / 1000.0 + (double)((unint64_t)v16[24] >> 10)];
          v22 = [v21 convertFromSystemToMonotonic];

          v23 = [NSString stringWithUTF8String:v15];
          [v23 tokenizedByString:@" "];
          v25 = v24 = v12;

          v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11 withDate:v22];
          [v26 setObject:&unk_1F29E5578 forKeyedSubscript:@"State"];
          [v26 setObject:v25 forKeyedSubscript:@"Reason"];
          [v24 addObject:v26];

          uint64_t v12 = v24;
          unint64_t v17 = 0x1E4F1C000;
        }
        ++v14;
        v15 += 64;
        ++v16;
      }
      while (v13 != v14);
      if ([v12 count])
      {
        v40 = v11;
        v41 = v12;
        v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        [(PLOperator *)v34 logEntries:v27 withGroupID:v11];
      }
      goto LABEL_28;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v28;
      if (qword_1EBD582D8 != -1) {
        dispatch_once(&qword_1EBD582D8, v36);
      }
      if (byte_1EBD582B1)
      {
        uint64_t v29 = [NSString stringWithFormat:@"No kernel sleep in after last reading"];
        v30 = (void *)MEMORY[0x1E4F929B8];
        v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        v32 = [v31 lastPathComponent];
        uint64_t v33 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointKernelState]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:410];

        double v11 = PLLogCommon();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = (void *)v29;
          goto LABEL_28;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = (void *)v29;
        uint64_t v43 = v29;
LABEL_27:
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_28;
      }
    }
  }
}

uint64_t __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B1 = result;
  return result;
}

uint64_t __44__PLSleepWakeAgent_logEventPointKernelState__block_invoke_172(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B2 = result;
  return result;
}

- (void)logEventForwardUserIdle:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"UserIdle"];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  uint64_t v6 = [NSNumber numberWithBool:v3];
  [v5 setObject:v6 forKeyedSubscript:@"Idle"];

  [(PLOperator *)self logEntry:v5];
}

- (signed)getSleepState
{
  return 1;
}

- (void)systemPoweredOn
{
  BOOL v3 = (void *)MEMORY[0x1D942A350](self, a2);
  uint64_t v4 = mach_absolute_time();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLSleepWakeAgent *)self logSleepEntries:v5];
  [(PLSleepWakeAgent *)self logWakeEntries:v5 withCurrentTime:v4];
  if ([MEMORY[0x1E4F92A38] hasAOT]) {
    [(PLSleepWakeAgent *)self logEventPointKernelState];
  }
  [(PLSleepWakeAgent *)self logEventPointCurrentScheduledWake];
}

- (void)capabilitiesChanged:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1D942A350](self, a2);
  uint64_t v6 = mach_absolute_time();
  id v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  int v8 = IOPMIsADarkWake();
  unint64_t v9 = 0x1E4F28000;
  unint64_t v10 = 0x1E6928000;
  if ((v3 & 0x8000) != 0 || !v8) {
    goto LABEL_31;
  }
  v75 = v5;
  unint64_t v11 = [(PLSleepWakeAgent *)self getCurrentWakeTime];
  unint64_t v12 = 0x1E4F92000uLL;
  uint64_t v73 = v6;
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v6];
  double v14 = v13;
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v11];
  v76 = [v7 dateByAddingTimeInterval:-(v14 - v15)];
  v16 = [(PLSleepWakeAgent *)self getCurrentWakeTimeKey];
  lastWakeEntry = self->_lastWakeEntry;
  if (!lastWakeEntry) {
    goto LABEL_12;
  }
  uint64_t v18 = [(PLEntry *)lastWakeEntry dictionary];
  [v18 objectForKeyedSubscript:v16];
  v20 = v19 = v16;
  uint64_t v21 = [NSNumber numberWithUnsignedLongLong:v11];
  int v22 = [v20 isEqual:v21];

  v16 = v19;
  unint64_t v12 = 0x1E4F92000;

  if (v22)
  {
    unint64_t v9 = 0x1E4F28000;
    unint64_t v10 = 0x1E6928000;
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_30;
    }
    uint64_t v23 = objc_opt_class();
    v80[0] = MEMORY[0x1E4F143A8];
    v80[1] = 3221225472;
    v80[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke;
    v80[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v80[4] = v23;
    if (qword_1EBD582E8 != -1) {
      dispatch_once(&qword_1EBD582E8, v80);
    }
    if (!byte_1EBD582B3) {
      goto LABEL_30;
    }
    v24 = [NSString stringWithFormat:@"DidNotSleep with capabilities change"];
    v25 = (void *)MEMORY[0x1E4F929B8];
    v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
    v27 = [v26 lastPathComponent];
    uint64_t v28 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent capabilitiesChanged:]"];
    [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:531];

    uint64_t v29 = PLLogCommon();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v84 = 138412290;
      *(void *)&v84[4] = v24;
      _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", v84, 0xCu);
    }

    unint64_t v9 = 0x1E4F28000;
  }
  else
  {
LABEL_12:
    v74 = v16;
    *(_OWORD *)v84 = 0uLL;
    size_t v79 = 16;
    if (!sysctlbyname("kern.sleeptime", v84, &v79, 0, 0))
    {
      v30 = [*(id *)(v12 + 2696) dateFromTimeval:*(_OWORD *)v84];
      uint64_t v31 = [*(id *)(v12 + 2696) dateFromTimevalSystemTime:*(_OWORD *)v84];
      uint64_t v32 = [(PLSleepWakeAgent *)self getSleepState];
      uint64_t v33 = [PLEventForwardPowerStateEntry alloc];
      uint64_t v34 = v32;
      v35 = (void *)v31;
      id v36 = [(PLEventForwardPowerStateEntry *)v33 initEntryWithState:v34 withEvent:4 withReason:0 withKernelSleepDate:v31 withDate:v30];
      objc_storeStrong((id *)&self->_lastSleepEntry, v36);
      [(PLOperator *)self logEntry:v36];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v37 = objc_opt_class();
        v78[0] = MEMORY[0x1E4F143A8];
        v78[1] = 3221225472;
        v78[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_184;
        v78[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v78[4] = v37;
        if (qword_1EBD582F0 != -1) {
          dispatch_once(&qword_1EBD582F0, v78);
        }
        if (byte_1EBD582B4)
        {
          v38 = v30;
          uint64_t v68 = *(void *)v84;
          v70 = NSString;
          uint64_t v39 = *(unsigned int *)&v84[8];
          v72 = v38;
          [v38 timeIntervalSince1970];
          uint64_t v41 = [v70 stringWithFormat:@"Ker_sleep_time.sec=%ld,kern_sleep_time.usec=%d,sleepDate=%f,kernelSleepDate=%@,lastsleep=%@,thissleep=%@", v68, v39, v40, v35, self->_lastSleepEntry, v36];
          v67 = (void *)MEMORY[0x1E4F929B8];
          v69 = (void *)v41;
          v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v42 = [v71 lastPathComponent];
          uint64_t v43 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent capabilitiesChanged:]"];
          [v67 logMessage:v69 fromFile:v42 fromFunction:v43 fromLineNumber:548];

          uint64_t v44 = PLLogCommon();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v83 = v69;
            _os_log_debug_impl(&dword_1D2690000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v30 = v72;
        }
      }
    }
    v45 = [(PLSleepWakeAgent *)self getThisWakeEntry:v76 withCurrentWakeTime:v11 withIsDarkwake:1 withDidSleep:1];
    unint64_t v9 = 0x1E4F28000uLL;
    v46 = [NSNumber numberWithUnsignedInt:v3];
    [v45 setObject:v46 forKeyedSubscript:@"Capabilities"];

    objc_storeStrong((id *)&self->_lastWakeEntry, v45);
    [(PLOperator *)self logEntry:v45];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v47 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_193;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v47;
      if (qword_1EBD582F8 != -1) {
        dispatch_once(&qword_1EBD582F8, block);
      }
      if (byte_1EBD582B5)
      {
        v48 = NSString;
        [v7 timeIntervalSince1970];
        uint64_t v50 = v49;
        [v76 timeIntervalSince1970];
        uint64_t v52 = v51;
        [*(id *)(v12 + 2696) secondsFromMachTime:v11];
        uint64_t v54 = v53;
        [*(id *)(v12 + 2696) secondsFromMachTime:v73];
        v56 = [v48 stringWithFormat:@"now=%f wakeDate=%f currentWakeTime=%f currentTime=%f lastWake=%@ thisWake=%@", v50, v52, v54, v55, self->_lastWakeEntry, v45];
        v57 = (void *)MEMORY[0x1E4F929B8];
        v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        v59 = [v58 lastPathComponent];
        v60 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent capabilitiesChanged:]"];
        [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:556];

        v61 = PLLogCommon();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v83 = v56;
          _os_log_debug_impl(&dword_1D2690000, v61, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        unint64_t v9 = 0x1E4F28000uLL;
      }
    }
    v62 = [(PLSleepWakeAgent *)self getPostWakeEntry:v11];
    v81 = v62;
    v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    [(PLOperator *)self postEntries:v63];

    [(PLSleepWakeAgent *)self logEventPointCurrentScheduledWake];
    v16 = v74;
    uint64_t v5 = v75;
  }
  unint64_t v10 = 0x1E6928000uLL;
LABEL_30:

LABEL_31:
  if (IOPMIsASleep())
  {
    uint64_t v64 = 1;
  }
  else if (IOPMIsADarkWake())
  {
    uint64_t v64 = 5;
  }
  else
  {
    uint64_t v64 = IOPMIsAUserWake() - 1;
  }
  v65 = (void *)[objc_alloc(*(Class *)(v10 + 3960)) initEntryWithState:v64 withEvent:6 withReason:0 withDate:v7];
  v66 = [*(id *)(v9 + 3792) numberWithUnsignedInt:v3];
  [v65 setObject:v66 forKeyedSubscript:@"Capabilities"];

  [(PLOperator *)self logEntry:v65];
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B3 = result;
  return result;
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_184(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B4 = result;
  return result;
}

uint64_t __40__PLSleepWakeAgent_capabilitiesChanged___block_invoke_193(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B5 = result;
  return result;
}

- (void)logSleepEntries:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1D942A350]();
  uint64_t v65 = 0;
  uint64_t v66 = 0;
  size_t v64 = 16;
  if (!sysctlbyname("kern.sleeptime", &v65, &v64, 0, 0))
  {
    uint64_t v52 = v5;
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F92A88], "dateFromTimeval:", v65, v66);
    id v7 = objc_msgSend(MEMORY[0x1E4F92A88], "dateFromTimevalSystemTime:", v65, v66);
    p_lastSleepEntry = &self->_lastSleepEntry;
    lastSleepEntry = self->_lastSleepEntry;
    uint64_t v53 = v7;
    uint64_t v50 = &self->_lastSleepEntry;
    uint64_t v51 = (void *)v6;
    if (lastSleepEntry
      && ([(PLEntry *)lastSleepEntry dictionary],
          unint64_t v10 = objc_claimAutoreleasedReturnValue(),
          [v10 objectForKeyedSubscript:@"KernelSleepDate"],
          unint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int v12 = [v7 isEqualToDate:v11],
          v11,
          v10,
          v12))
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v13 = objc_opt_class();
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke;
        v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v63[4] = v13;
        if (qword_1EBD58300 != -1) {
          dispatch_once(&qword_1EBD58300, v63);
        }
        if (byte_1EBD582B6)
        {
          double v14 = [NSString stringWithFormat:@"DidNotSleep"];
          double v15 = (void *)MEMORY[0x1E4F929B8];
          v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          unint64_t v17 = [v16 lastPathComponent];
          uint64_t v18 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logSleepEntries:]"];
          [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:610];

          v19 = PLLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v14;
            _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      id v56 = [[PLEventForwardPowerStateEntry alloc] initEntryWithState:1 withEvent:5 withReason:0 withKernelSleepDate:v7 withDate:v4];
    }
    else
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke_203;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v20;
        if (qword_1EBD58308 != -1) {
          dispatch_once(&qword_1EBD58308, v62);
        }
        if (byte_1EBD582B7)
        {
          uint64_t v21 = [NSString stringWithFormat:@"DidSleep"];
          int v22 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          v24 = [v23 lastPathComponent];
          v25 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logSleepEntries:]"];
          [v22 logMessage:v21 fromFile:v24 fromFunction:v25 fromLineNumber:615];

          v26 = PLLogCommon();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v21;
            _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          p_lastSleepEntry = &self->_lastSleepEntry;
        }
      }
      id v56 = [[PLEventForwardPowerStateEntry alloc] initEntryWithState:[(PLSleepWakeAgent *)self getSleepState] withEvent:4 withReason:0 withKernelSleepDate:v7 withDate:v6];
      objc_storeStrong((id *)p_lastSleepEntry, v56);
      if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
      {
        if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001002)
        {
          v27 = [MEMORY[0x1E4F92900] sharedInstance];
          [v27 createPowerEventForwardWithRootNodeID:52 withPower:v6 withStartDate:0.0];
        }
        uint64_t v28 = [MEMORY[0x1E4F92900] sharedInstance];
        [v28 createQualificationEventForwardWithQualificationID:8 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v6];
      }
    }
    uint64_t v54 = self;
    [(PLSleepWakeAgent *)self getSleepStatisticsApps];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v59 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          v67[0] = @"PID";
          uint64_t v34 = [v33 objectForKeyedSubscript:@"PID"];
          v67[1] = @"AppName";
          v68[0] = v34;
          v35 = [v33 objectForKeyedSubscript:@"AppName"];
          v68[1] = v35;
          id v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v68 forKeys:v67 count:2];

          uint64_t v37 = [v33 objectForKeyedSubscript:@"ResponseType"];
          [v56 setObject:v37 forKeyedSubscript:v36];
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
      }
      while (v30);
    }
    uint64_t v5 = v52;
    v38 = v54;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLSleepWakeAgent_logSleepEntries___block_invoke_212;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v39;
      if (qword_1EBD58310 != -1) {
        dispatch_once(&qword_1EBD58310, block);
      }
      if (byte_1EBD582B8)
      {
        uint64_t v40 = NSString;
        uint64_t v41 = v65;
        uint64_t v42 = v66;
        [v51 timeIntervalSince1970];
        uint64_t v44 = [v40 stringWithFormat:@"Ker_sleep_time.sec=%ld,kern_sleep_time.usec=%d,sleepDate=%f,kernelSleepDate=%@,lastsleep=%@,thissleep=%@", v41, v42, v43, v53, *v50, v56];
        v45 = (void *)MEMORY[0x1E4F929B8];
        v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        uint64_t v47 = [v46 lastPathComponent];
        v48 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logSleepEntries:]"];
        [v45 logMessage:v44 fromFile:v47 fromFunction:v48 fromLineNumber:646];

        uint64_t v49 = PLLogCommon();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v71 = v44;
          _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v38 = v54;
      }
    }
    [(PLOperator *)v38 logEntry:v56];
  }
}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B6 = result;
  return result;
}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke_203(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B7 = result;
  return result;
}

uint64_t __36__PLSleepWakeAgent_logSleepEntries___block_invoke_212(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B8 = result;
  return result;
}

- (unint64_t)getCurrentWakeTime
{
  size_t v3 = 8;
  unint64_t v4 = 0;
  if (sysctlbyname("machdep.wake_abstime", &v4, &v3, 0, 0)) {
    return -1;
  }
  else {
    return v4;
  }
}

- (id)getCurrentWakeTimeKey
{
  return @"CurrentMachWakeTime";
}

- (id)getThisWakeEntry:(id)a3 withCurrentWakeTime:(unint64_t)a4 withIsDarkwake:(BOOL)a5 withDidSleep:(BOOL)a6
{
  BOOL v6 = a6;
  if (a5) {
    unsigned int v9 = 5;
  }
  else {
    unsigned int v9 = 0;
  }
  if (a5) {
    unsigned int v10 = 6;
  }
  else {
    unsigned int v10 = 2;
  }
  id v11 = a3;
  int v12 = [(PLSleepWakeAgent *)self getCurrentWakeTimeKey];
  uint64_t v13 = [PLEventForwardPowerStateEntry alloc];
  double v14 = [(PLSleepWakeAgent *)self wakeReasons];
  if (v6) {
    uint64_t v15 = v9;
  }
  else {
    uint64_t v15 = v10;
  }
  if (v6) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 5;
  }
  id v17 = [(PLEventForwardPowerStateEntry *)v13 initEntryWithState:v15 withEvent:v16 withReason:v14 withCurrentWakeTime:a4 withCurrentWakeTimeKey:v12 withDate:v11];

  return v17;
}

- (id)getPostWakeEntry:(unint64_t)a3
{
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"CurrentMachWakeTime"];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v7 = [NSNumber numberWithUnsignedLongLong:a3];
  [v6 setObject:v7 forKeyedSubscript:@"CurrentMachWakeTime"];

  int v8 = [(PLSleepWakeAgent *)self wakeReasonsAsNSString];
  [v6 setObject:v8 forKeyedSubscript:@"WakeReasons"];

  return v6;
}

- (void)logWakeEntries:(id)a3 withCurrentTime:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  context = (void *)MEMORY[0x1D942A350]();
  unint64_t v7 = [(PLSleepWakeAgent *)self getCurrentWakeTime];
  unint64_t v47 = a4;
  [MEMORY[0x1E4F92A88] secondsFromMachTime:a4];
  double v9 = v8;
  [MEMORY[0x1E4F92A88] secondsFromMachTime:v7];
  id v11 = [v6 dateByAddingTimeInterval:-(v9 - v10)];
  int v12 = [(PLSleepWakeAgent *)self getCurrentWakeTimeKey];
  lastWakeEntry = self->_lastWakeEntry;
  if (!lastWakeEntry) {
    goto LABEL_11;
  }
  double v14 = [(PLEntry *)lastWakeEntry dictionary];
  [v14 objectForKeyedSubscript:v12];
  v16 = uint64_t v15 = v12;
  id v17 = [NSNumber numberWithUnsignedLongLong:v7];
  int v18 = [v16 isEqual:v17];

  int v12 = v15;
  if (v18)
  {
    unint64_t v19 = 0x1E4F92000uLL;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v20 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v20;
      if (qword_1EBD58318 != -1) {
        dispatch_once(&qword_1EBD58318, v50);
      }
      if (byte_1EBD582B9)
      {
        v46 = [NSString stringWithFormat:@"DidNotSleep"];
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        int v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        uint64_t v23 = [v22 lastPathComponent];
        v24 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logWakeEntries:withCurrentTime:]"];
        [v21 logMessage:v46 fromFile:v23 fromFunction:v24 fromLineNumber:736];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v53 = v46;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        int v12 = v15;
        unint64_t v19 = 0x1E4F92000;
      }
    }
    v26 = [(PLSleepWakeAgent *)self getThisWakeEntry:v6 withCurrentWakeTime:v7 withIsDarkwake:0 withDidSleep:0];
  }
  else
  {
LABEL_11:
    v26 = [(PLSleepWakeAgent *)self getThisWakeEntry:v11 withCurrentWakeTime:v7 withIsDarkwake:0 withDidSleep:1];
    objc_storeStrong((id *)&self->_lastWakeEntry, v26);
    if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
    {
      if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] <= 1001002)
      {
        v27 = [MEMORY[0x1E4F92900] sharedInstance];
        [(PLSleepWakeAgent *)self apSOCBasePower];
        objc_msgSend(v27, "createPowerEventForwardWithRootNodeID:withPower:withStartDate:", 52, v11);
      }
      uint64_t v28 = [MEMORY[0x1E4F92900] sharedInstance];
      [v28 createQualificationEventForwardWithQualificationID:8 withChildNodeNames:&unk_1F29ED868 withStartDate:v11];
    }
    uint64_t v29 = [(PLSleepWakeAgent *)self getPostWakeEntry:v7];
    uint64_t v51 = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    [(PLOperator *)self postEntries:v30];

    unint64_t v19 = 0x1E4F92000uLL;
  }
  if ([*(id *)(v19 + 2496) debugEnabled])
  {
    uint64_t v31 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke_219;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v31;
    if (qword_1EBD58320 != -1) {
      dispatch_once(&qword_1EBD58320, block);
    }
    if (byte_1EBD582BA)
    {
      uint64_t v32 = NSString;
      [v6 timeIntervalSince1970];
      uint64_t v34 = v33;
      [v11 timeIntervalSince1970];
      uint64_t v36 = v35;
      [MEMORY[0x1E4F92A88] secondsFromMachTime:v7];
      uint64_t v38 = v37;
      [MEMORY[0x1E4F92A88] secondsFromMachTime:v47];
      uint64_t v40 = [v32 stringWithFormat:@"now=%f wakeDate=%f currentWakeTime=%f currentTime=%f lastWake=%@ thisWake=%@", v34, v36, v38, v39, self->_lastWakeEntry, v26];
      uint64_t v41 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v42 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      uint64_t v43 = [v42 lastPathComponent];
      uint64_t v44 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logWakeEntries:withCurrentTime:]"];
      [v41 logMessage:v40 fromFile:v43 fromFunction:v44 fromLineNumber:762];

      v45 = PLLogCommon();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v53 = v40;
        _os_log_debug_impl(&dword_1D2690000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLOperator *)self logEntry:v26];
}

uint64_t __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582B9 = result;
  return result;
}

uint64_t __51__PLSleepWakeAgent_logWakeEntries_withCurrentTime___block_invoke_219(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BA = result;
  return result;
}

- (id)wakeReasons
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  size_t v12 = 256;
  memset(v15, 0, sizeof(v15));
  if ((sysctlbyname("kern.wakereason", v15, &v12, 0, 0) & 0x80000000) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:v15];
    size_t v3 = [v2 tokenizedByString:@" "];
LABEL_3:

    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31__PLSleepWakeAgent_wakeReasons__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD58328 != -1) {
      dispatch_once(&qword_1EBD58328, block);
    }
    if (byte_1EBD582BB)
    {
      uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get wake reason (errno: %d)", *__error());
      uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
      id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      unint64_t v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent wakeReasons]"];
      [v5 logMessage:v2 fromFile:v7 fromFunction:v8 fromLineNumber:781];

      double v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v14 = v2;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      size_t v3 = (void *)MEMORY[0x1E4F1CBF0];
      goto LABEL_3;
    }
  }
  size_t v3 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:
  return v3;
}

uint64_t __31__PLSleepWakeAgent_wakeReasons__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BB = result;
  return result;
}

- (id)wakeReasonsAsNSString
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  size_t v12 = 256;
  memset(v15, 0, sizeof(v15));
  if ((sysctlbyname("kern.wakereason", v15, &v12, 0, 0) & 0x80000000) == 0)
  {
    uint64_t v2 = [NSString stringWithUTF8String:v15];
    size_t v3 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v4 = [v2 stringByTrimmingCharactersInSet:v3];
LABEL_3:

    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__PLSleepWakeAgent_wakeReasonsAsNSString__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD58330 != -1) {
      dispatch_once(&qword_1EBD58330, block);
    }
    if (byte_1EBD582BC)
    {
      uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"Could not get wake reason (errno: %d)", *__error());
      id v6 = (void *)MEMORY[0x1E4F929B8];
      unint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      double v8 = [v7 lastPathComponent];
      double v9 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent wakeReasonsAsNSString]"];
      [v6 logMessage:v2 fromFile:v8 fromFunction:v9 fromLineNumber:803];

      size_t v3 = PLLogCommon();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v14 = v2;
        _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      uint64_t v4 = &stru_1F294E108;
      goto LABEL_3;
    }
  }
  uint64_t v4 = &stru_1F294E108;
LABEL_12:
  return v4;
}

uint64_t __41__PLSleepWakeAgent_wakeReasonsAsNSString__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BC = result;
  return result;
}

- (unsigned)getIOPMRootDomain
{
  unsigned int result = getIOPMRootDomain_gRoot;
  if (!getIOPMRootDomain_gRoot)
  {
    unsigned int result = IORegistryEntryFromPath(*MEMORY[0x1E4F2EF00], "IOPower:/IOPowerConnection/IOPMrootDomain");
    getIOPMRootDomain_gRoot = result;
  }
  return result;
}

- (unint64_t)getSleepSubclassKey
{
  io_registry_entry_t v2 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  unint64_t result = (unint64_t)IORegistryEntryCreateCFProperty(v2, @"IOPMSystemSleepType", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  unsigned int valuePtr = 0;
  unint64_t v6 = 0;
  if (result)
  {
    CFNumberRef v4 = (const __CFNumber *)result;
    CFIndex ByteSize = CFNumberGetByteSize((CFNumberRef)result);
    if (ByteSize == 8)
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &v6);
    }
    else if (ByteSize == 4)
    {
      if (CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr)) {
        unint64_t v6 = valuePtr;
      }
    }
    CFRelease(v4);
    return v6;
  }
  return result;
}

- (id)sleepTriggers
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v2 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, @"Last Sleep Reason", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty
    && (CFStringRef v4 = CFProperty, CString = CFStringGetCString(CFProperty, (char *)&v8, 128, 0x8000100u),
                         CFRelease(v4),
                         CString))
  {
    unint64_t v6 = [NSString stringWithUTF8String:&v8];
  }
  else
  {
    unint64_t v6 = &stru_1F294E108;
  }
  return v6;
}

- (id)wakeType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v11 = 0u;
  io_registry_entry_t v2 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, @"Wake Type", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty
    && (CFStringRef v4 = CFProperty, CString = CFStringGetCString(CFProperty, buffer, 128, 0x8000100u), CFRelease(v4), CString))
  {
    unint64_t v6 = [NSString stringWithUTF8String:buffer];
    uint64_t v9 = v6;
    unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  }
  else
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (id)driverWakeReasons
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  size_t v3 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(_OWORD *)buffer = 0u;
  io_registry_entry_t v4 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  CFArrayRef CFProperty = (const __CFArray *)IORegistryEntryCreateCFProperty(v4, @"IOPMDriverWakeEvents", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    CFArrayRef v6 = CFProperty;
    CFTypeID v7 = CFGetTypeID(CFProperty);
    if (v7 == CFArrayGetTypeID() && (CFIndex Count = CFArrayGetCount(v6), Count >= 1))
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0;
      char v11 = 0;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v6, v10);
        CFTypeID v13 = CFGetTypeID(ValueAtIndex);
        if (v13 == CFDictionaryGetTypeID())
        {
          CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Reason");
          CFTypeID v15 = CFGetTypeID(Value);
          if (v15 == CFStringGetTypeID())
          {
            if (!CFStringGetCString(Value, buffer, 128, 0x8000100u)) {
              goto LABEL_12;
            }
            long long v16 = [NSString stringWithUTF8String:buffer];
            [v3 addObject:v16];

            char v11 = 1;
          }
        }
        ++v10;
      }
      while (v9 != v10);
      CFRelease(v6);
      if (v11)
      {
        id v17 = v3;
        goto LABEL_21;
      }
    }
    else
    {
LABEL_12:
      CFRelease(v6);
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PLSleepWakeAgent_driverWakeReasons__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v18;
    if (qword_1EBD58338 != -1) {
      dispatch_once(&qword_1EBD58338, block);
    }
    if (byte_1EBD582BD)
    {
      unint64_t v19 = [NSString stringWithFormat:@"Error when get kIOPMDriverWakeEventsKey"];
      uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      int v22 = [v21 lastPathComponent];
      uint64_t v23 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent driverWakeReasons]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:998];

      v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v19;
        _os_log_debug_impl(&dword_1D2690000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v17 = (id)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v17;
}

uint64_t __37__PLSleepWakeAgent_driverWakeReasons__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BD = result;
  return result;
}

- (id)wakeReasonFromIORegistry
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v11 = 0u;
  io_registry_entry_t v2 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v2, @"Wake Reason", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty
    && (CFStringRef v4 = CFProperty, CString = CFStringGetCString(CFProperty, buffer, 128, 0x8000100u), CFRelease(v4), CString))
  {
    CFArrayRef v6 = [NSString stringWithUTF8String:buffer];
    CFIndex v9 = v6;
    CFTypeID v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  }
  else
  {
    CFTypeID v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (id)getLastSleepEntry
{
  size_t v3 = [MEMORY[0x1E4F1CA48] array];
  CFStringRef v4 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Event" withValue:&unk_1F29E55C0 withComparisonOperation:0];
  [v3 addObject:v4];
  uint64_t v5 = [(PLOperator *)self storage];
  CFArrayRef v6 = +[PLEventForwardPowerStateEntry entryKey];
  CFTypeID v7 = [v5 lastEntryForKey:v6 withComparisons:v3 isSingleton:0];

  return v7;
}

- (id)getLastWakeEntry
{
  v9[1] = *MEMORY[0x1E4F143B8];
  size_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"Event" withValue:&unk_1F29E5578 withComparisonOperation:0];
  CFStringRef v4 = [(PLOperator *)self storage];
  uint64_t v5 = +[PLEventForwardPowerStateEntry entryKey];
  v9[0] = v3;
  CFArrayRef v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  CFTypeID v7 = [v4 lastEntryForKey:v5 withComparisons:v6 isSingleton:0];

  return v7;
}

- (id)getSleepStatisticsApps
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  io_registry_entry_t v4 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
  CFStringRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v4, @"AppStatistics", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = CFProperty;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    CFIndex v9 = @"ResponseType";
    CFIndex v10 = @"ResponseTimedOut";
    uint64_t v11 = *(void *)v30;
    uint64_t v28 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      uint64_t v27 = v8;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
        long long v14 = objc_msgSend(v13, "objectForKeyedSubscript:", v9, v27);
        long long v15 = v14;
        if (v14
          && (([v14 isEqualToString:v10] & 1) != 0
           || [v15 isEqualToString:@"ResponseCancel"]))
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          [v16 setObject:v15 forKeyedSubscript:v9];
          long long v17 = [v13 objectForKeyedSubscript:@"Name"];
          if (v17)
          {
            [v16 setObject:v17 forKeyedSubscript:@"AppName"];
          }
          else
          {
            [MEMORY[0x1E4F1CA98] null];
            uint64_t v18 = v10;
            unint64_t v19 = v9;
            id v20 = v6;
            v22 = id v21 = v3;
            [v16 setObject:v22 forKeyedSubscript:@"AppName"];

            id v3 = v21;
            id v6 = v20;
            CFIndex v9 = v19;
            CFIndex v10 = v18;
            uint64_t v8 = v27;
          }

          uint64_t v23 = [v13 objectForKeyedSubscript:@"Pid"];
          v24 = v23;
          if (v23) {
            objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v23, "unsignedIntValue"));
          }
          else {
          v25 = [MEMORY[0x1E4F1CA98] null];
          }
          [v16 setObject:v25 forKeyedSubscript:@"PID"];

          [v3 addObject:v16];
          uint64_t v11 = v28;
        }

        ++v12;
      }
      while (v8 != v12);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }

  return v3;
}

- (void)logEventNonePowerNapConfig
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    io_registry_entry_t v3 = [(PLSleepWakeAgent *)self getIOPMRootDomain];
    CFDictionaryRef v4 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v3, "IOService", @"SystemPowerProfileOverrideDict", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      CFTypeID v6 = CFGetTypeID(v4);
      if (v6 == CFDictionaryGetTypeID())
      {
        uint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PowerNapConfig"];
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v5, @"Battery Power");
        if (Value)
        {
          CFDictionaryRef v10 = Value;
          CFTypeID v11 = CFGetTypeID(Value);
          if (v11 == CFDictionaryGetTypeID())
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v12 = objc_opt_class();
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke;
              block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              block[4] = v12;
              if (qword_1EBD58340 != -1) {
                dispatch_once(&qword_1EBD58340, block);
              }
              if (byte_1EBD582BE)
              {
                long long v13 = [NSString stringWithFormat:@"Battery Power = %@\n", v10];
                long long v14 = (void *)MEMORY[0x1E4F929B8];
                long long v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
                id v16 = [v15 lastPathComponent];
                long long v17 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventNonePowerNapConfig]"];
                [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1193];

                uint64_t v18 = PLLogCommon();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v40 = v13;
                  _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(v10, @"DarkWakeBackgroundTasks");
            if (v19)
            {
              CFBooleanRef v20 = v19;
              CFTypeID v21 = CFGetTypeID(v19);
              if (v21 == CFBooleanGetTypeID())
              {
                int v22 = [NSNumber numberWithBool:CFBooleanGetValue(v20) != 0];
                [v8 setObject:v22 forKeyedSubscript:@"BatteryPower"];
              }
            }
          }
        }
        CFDictionaryRef v23 = (const __CFDictionary *)CFDictionaryGetValue(v5, @"AC Power");
        if (v23)
        {
          CFDictionaryRef v24 = v23;
          CFTypeID v25 = CFGetTypeID(v23);
          if (v25 == CFDictionaryGetTypeID())
          {
            if ([MEMORY[0x1E4F929C0] debugEnabled])
            {
              uint64_t v26 = objc_opt_class();
              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v37[2] = __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke_285;
              v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v37[4] = v26;
              if (qword_1EBD58348 != -1) {
                dispatch_once(&qword_1EBD58348, v37);
              }
              if (byte_1EBD582BF)
              {
                uint64_t v27 = [NSString stringWithFormat:@"AC Power = %@\n", v24];
                uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
                long long v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
                long long v30 = [v29 lastPathComponent];
                long long v31 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventNonePowerNapConfig]"];
                [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:1203];

                long long v32 = PLLogCommon();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v40 = v27;
                  _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
              }
            }
            CFBooleanRef v33 = (const __CFBoolean *)CFDictionaryGetValue(v24, @"DarkWakeBackgroundTasks");
            if (v33)
            {
              CFBooleanRef v34 = v33;
              CFTypeID v35 = CFGetTypeID(v33);
              if (v35 == CFBooleanGetTypeID())
              {
                long long v36 = [NSNumber numberWithBool:CFBooleanGetValue(v34) != 0];
                [v8 setObject:v36 forKeyedSubscript:@"ACPower"];
              }
            }
          }
        }
        [(PLOperator *)self logEntry:v8];
      }
      CFRelease(v5);
    }
  }
}

uint64_t __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BE = result;
  return result;
}

uint64_t __46__PLSleepWakeAgent_logEventNonePowerNapConfig__block_invoke_285(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582BF = result;
  return result;
}

- (void)logEventPointCurrentScheduledWake
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  io_registry_entry_t v3 = [(PLOperator *)self workQueue];
  void block[5] = MEMORY[0x1E4F143A8];
  block[6] = 3221225472;
  block[7] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke;
  block[8] = &unk_1E692C640;
  block[9] = self;
  uint64_t v4 = IOPMCopyCurrentScheduledWake();

  if (v4 && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_333;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD58370 != -1) {
      dispatch_once(&qword_1EBD58370, block);
    }
    if (byte_1EBD582C4)
    {
      CFTypeID v6 = objc_msgSend(NSString, "stringWithFormat:", @"IOPMCopyCurrentScheduledWake Error: %x", v4);
      uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      CFIndex v9 = [v8 lastPathComponent];
      CFDictionaryRef v10 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointCurrentScheduledWake]"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1247];

      CFTypeID v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

void __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  int v4 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (a2)
  {
    if (v4)
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD58350 != -1) {
        dispatch_once(&qword_1EBD58350, block);
      }
      if (byte_1EBD582C0)
      {
        CFTypeID v6 = [NSString stringWithFormat:@"IOPMCopyCurrentScheduledWake payload=%@", a2];
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        CFIndex v9 = [v8 lastPathComponent];
        CFDictionaryRef v10 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1223];

        CFTypeID v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v12 = [a2 objectForKeyedSubscript:@"returnCode"];
    uint64_t v13 = [v12 integerValue];

    if (!v13)
    {
      long long v17 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ScheduledWake"];
      int v22 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v17];
      uint64_t v28 = [a2 objectForKeyedSubscript:@"wakeData"];
      long long v29 = v28;
      if (v28)
      {
        long long v30 = (void *)MEMORY[0x1E4F1C9C8];
        long long v31 = [v28 objectForKeyedSubscript:@"time"];
        [v31 doubleValue];
        long long v32 = objc_msgSend(v30, "dateWithTimeIntervalSinceReferenceDate:");
        [v22 setObject:v32 forKeyedSubscript:@"EventTime"];

        CFBooleanRef v33 = [v29 objectForKeyedSubscript:@"eventtype"];
        [v22 setObject:v33 forKeyedSubscript:@"Type"];

        CFBooleanRef v34 = [v29 objectForKeyedSubscript:@"appPID"];
        [v22 setObject:v34 forKeyedSubscript:@"PID"];

        CFTypeID v35 = [v29 objectForKeyedSubscript:@"SleepWakeUUID"];
        [v22 setObject:v35 forKeyedSubscript:@"SleepWakeUUID"];

        long long v36 = [v29 objectForKeyedSubscript:@"wakeInfo"];
        [v22 setObject:v36 forKeyedSubscript:@"WakeInfo"];

        uint64_t v37 = [v29 objectForKeyedSubscript:@"scheduledby"];
        [v22 setObject:v37 forKeyedSubscript:@"ProcessName"];

        [*(id *)(a1 + 32) logEntry:v22];
      }
      else if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v38 = objc_opt_class();
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_307;
        v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v46[4] = v38;
        if (qword_1EBD58360 != -1) {
          dispatch_once(&qword_1EBD58360, v46);
        }
        if (byte_1EBD582C2)
        {
          uint64_t v39 = [NSString stringWithFormat:@"IOPMCopyCurrentScheduledWake payload[kPLIOKitWakeData] is nil"];
          uint64_t v40 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
          uint64_t v42 = [v41 lastPathComponent];
          uint64_t v43 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2"];
          [v40 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:1231];

          uint64_t v44 = PLLogCommon();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v50 = v39;
            _os_log_debug_impl(&dword_1D2690000, v44, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }

      goto LABEL_33;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_297;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v14;
      if (qword_1EBD58358 != -1) {
        dispatch_once(&qword_1EBD58358, v47);
      }
      if (byte_1EBD582C1)
      {
        uint64_t v15 = NSString;
        id v16 = [a2 objectForKeyedSubscript:@"returnCode"];
        long long v17 = [v15 stringWithFormat:@"Current wake is not a RTC wake. Return code: %@", v16];

        uint64_t v18 = (void *)MEMORY[0x1E4F929B8];
        CFBooleanRef v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
        CFBooleanRef v20 = [v19 lastPathComponent];
        CFTypeID v21 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1225];

        int v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v50 = v17;
LABEL_22:
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
    }
  }
  else if (v4)
  {
    uint64_t v23 = objc_opt_class();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_328;
    v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v45[4] = v23;
    if (qword_1EBD58368 != -1) {
      dispatch_once(&qword_1EBD58368, v45);
    }
    if (byte_1EBD582C3)
    {
      long long v17 = [NSString stringWithFormat:@"IOPMCopyCurrentScheduledWake payload is nil"];
      CFDictionaryRef v24 = (void *)MEMORY[0x1E4F929B8];
      CFTypeID v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m"];
      uint64_t v26 = [v25 lastPathComponent];
      uint64_t v27 = [NSString stringWithUTF8String:"-[PLSleepWakeAgent logEventPointCurrentScheduledWake]_block_invoke_2"];
      [v24 logMessage:v17 fromFile:v26 fromFunction:v27 fromLineNumber:1243];

      int v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v50 = v17;
        goto LABEL_22;
      }
LABEL_33:
    }
  }
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582C0 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_297(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582C1 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_307(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582C2 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_328(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582C3 = result;
  return result;
}

uint64_t __53__PLSleepWakeAgent_logEventPointCurrentScheduledWake__block_invoke_333(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD582C4 = result;
  return result;
}

- (unsigned)rootDomainConnect
{
  return self->_rootDomainConnect;
}

- (void)setRootDomainConnect:(unsigned int)a3
{
  self->_rootDomainConnect = a3;
}

- (unsigned)pmNotifier
{
  return self->_pmNotifier;
}

- (void)setPmNotifier:(unsigned int)a3
{
  self->_pmNotifier = a3;
}

- (IONotificationPort)systemPowerPortRef
{
  return self->_systemPowerPortRef;
}

- (void)setSystemPowerPortRef:(IONotificationPort *)a3
{
  self->_systemPowerPortRef = a3;
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
}

- (double)apSOCBasePower
{
  return self->_apSOCBasePower;
}

- (void)setApSOCBasePower:(double)a3
{
  self->_apSOCBasePower = a3;
}

- (PLXPCListenerOperatorComposition)wakeGestureXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWakeGestureXPCListener:(id)a3
{
}

- (__IOPMConnection)pmConnection
{
  return self->_pmConnection;
}

- (void)setPmConnection:(__IOPMConnection *)a3
{
  self->_pmConnection = a3;
}

- (PLEventForwardPowerStateEntry)lastSleepEntry
{
  return (PLEventForwardPowerStateEntry *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastSleepEntry:(id)a3
{
}

- (PLEventForwardPowerStateEntry)lastWakeEntry
{
  return (PLEventForwardPowerStateEntry *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLastWakeEntry:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastWakeEntry, 0);
  objc_storeStrong((id *)&self->_lastSleepEntry, 0);
  objc_storeStrong((id *)&self->_wakeGestureXPCListener, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
}

@end