@interface PLProximityAgent
+ (BOOL)isProximityLiteSupported;
+ (BOOL)isProximitySupported;
+ (id)defaults;
+ (id)entryEventBackwardDefinitionRadioPower;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionClientState;
+ (id)entryEventForwardDefinitionRadioState;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionBinnedDeviceConnection;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionDeviceConnection;
+ (id)entryEventPointDefinitionMaintainedDevices;
+ (id)entryEventPointDefinitionRadioHeartbeat;
+ (id)entryEventPointDefinitionTimerState;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NSDate)lastSBCTimestamp;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLProximityAgent)init;
- (PLTimer)runTimeAggregatorTimer;
- (PLXPCListenerOperatorComposition)clientStateListener;
- (PLXPCListenerOperatorComposition)deviceConnectionListener;
- (PLXPCListenerOperatorComposition)maintenanceListener;
- (PLXPCListenerOperatorComposition)radioHeartbeatListener;
- (PLXPCListenerOperatorComposition)radioPowerListener;
- (PLXPCListenerOperatorComposition)radioStateListener;
- (PLXPCListenerOperatorComposition)timerStateListener;
- (unint64_t)numBTLines;
- (unint64_t)numConnects;
- (unint64_t)numDisconnects;
- (void)initOperatorDependancies;
- (void)logEventBackwardPowerStats:(id)a3;
- (void)logEventForwardClientState:(id)a3;
- (void)logEventForwardRadioState:(id)a3;
- (void)logEventIntervalBinnedDeviceConnection;
- (void)logEventPointDeviceConnection:(id)a3;
- (void)logEventPointMaintenance:(id)a3;
- (void)logEventPointRadioHeartbeat:(id)a3;
- (void)logEventPointTimerState:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setClientStateListener:(id)a3;
- (void)setDeviceConnectionListener:(id)a3;
- (void)setLastSBCTimestamp:(id)a3;
- (void)setMaintenanceListener:(id)a3;
- (void)setNumBTLines:(unint64_t)a3;
- (void)setNumConnects:(unint64_t)a3;
- (void)setNumDisconnects:(unint64_t)a3;
- (void)setRadioHeartbeatListener:(id)a3;
- (void)setRadioPowerListener:(id)a3;
- (void)setRadioStateListener:(id)a3;
- (void)setRunTimeAggregatorTimer:(id)a3;
- (void)setTimerStateListener:(id)a3;
@end

@implementation PLProximityAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProximityAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1F29EB228;
}

+ (id)entryEventPointDefinitions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"TimerState";
  objc_super v2 = +[PLProximityAgent entryEventPointDefinitionTimerState];
  v9[0] = v2;
  v8[1] = @"MaintainedDevices";
  v3 = +[PLProximityAgent entryEventPointDefinitionMaintainedDevices];
  v9[1] = v3;
  v8[2] = @"DeviceConnection";
  v4 = +[PLProximityAgent entryEventPointDefinitionDeviceConnection];
  v9[2] = v4;
  v8[3] = @"RadioHeartbeat";
  v5 = +[PLProximityAgent entryEventPointDefinitionRadioHeartbeat];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)entryEventPointDefinitionTimerState
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F1190;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"targetInterval";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v13[0] = v4;
  v12[1] = @"actualInterval";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v13[1] = v6;
  v12[2] = @"earlypct";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionMaintainedDevices
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F1190;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"duration";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"numDevices";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionDeviceConnection
{
  v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F1190;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"type";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v13[0] = v4;
  v12[1] = @"reason";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v13[1] = v6;
  v12[2] = @"firmwareVersion";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventPointDefinitionRadioHeartbeat
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F1190;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"state";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"State";
  objc_super v2 = +[PLProximityAgent entryEventForwardDefinitionRadioState];
  v6[1] = @"ClientState";
  v7[0] = v2;
  v3 = +[PLProximityAgent entryEventForwardDefinitionClientState];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventForwardDefinitionRadioState
{
  v13[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isProximityLiteSupported])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F29F11A0;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"State";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v9 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionClientState
{
  v18[2] = *MEMORY[0x1E4F143B8];
  if (([a1 isProximitySupported] & 1) != 0 || objc_msgSend(a1, "isProximityLiteSupported"))
  {
    v17[0] = *MEMORY[0x1E4F92C50];
    uint64_t v15 = *MEMORY[0x1E4F92CD0];
    v16 = &unk_1F29F11B0;
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v18[0] = v3;
    v17[1] = *MEMORY[0x1E4F92CA8];
    v13[0] = @"EventID";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v14[0] = v5;
    v13[1] = @"ClientName";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v14[1] = v7;
    v13[2] = @"State";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
    void v14[2] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v18[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"PowerStatistics";
  objc_super v2 = +[PLProximityAgent entryEventBackwardDefinitionRadioPower];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventBackwardDefinitionRadioPower
{
  v36[2] = *MEMORY[0x1E4F143B8];
  if (([a1 isProximitySupported] & 1) != 0 || objc_msgSend(a1, "isProximityLiteSupported"))
  {
    v35[0] = *MEMORY[0x1E4F92C50];
    uint64_t v33 = *MEMORY[0x1E4F92CD0];
    v34 = &unk_1F29F11B0;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    v36[0] = v30;
    v35[1] = *MEMORY[0x1E4F92CA8];
    v31[0] = @"SleepDuration";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v32[0] = v28;
    v31[1] = @"WakeDuration";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v32[1] = v26;
    v31[2] = @"SingleAntennaSearchDuration";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v32[2] = v24;
    v31[3] = @"DoubleAntennaSearchDuration";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v32[3] = v22;
    v31[4] = @"SingleChainRxPacketDuration";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v32[4] = v20;
    v31[5] = @"DoubleChainRxPacketDuration";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v32[5] = v18;
    v31[6] = @"TripleChainRxPacketDuration";
    v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v32[6] = v16;
    v31[7] = @"DSPProcessingDuration";
    uint64_t v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v32[7] = v14;
    v31[8] = @"TxDuration";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v32[8] = v4;
    v31[9] = @"ReceivedPacketsCount";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v32[9] = v6;
    v31[10] = @"TransmittedPacketsCount";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v32[10] = v8;
    v31[11] = @"DeepSleepDuration";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v32[11] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:12];
    v36[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"BinnedDeviceConnection";
  objc_super v2 = [a1 entryEventIntervalDefinitionBinnedDeviceConnection];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionBinnedDeviceConnection
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  uint64_t v15 = &unk_1F29F1190;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"timestampEnd";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_DateFormat");
  v13[0] = v4;
  v12[1] = @"connects";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  void v12[2] = @"disconnects";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v13[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (BOOL)isProximitySupported
{
  if (qword_1EBD5A780 != -1) {
    dispatch_once(&qword_1EBD5A780, &__block_literal_global_45);
  }
  return _MergedGlobals_1_57;
}

uint64_t __40__PLProximityAgent_isProximitySupported__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 102030, 102031, 102032, 102034, 102035, 102036, 102037, 102038, 102039, 102040, 102041, 102043, 102044, 102045, 102046, 102047, 102048,
             102049,
             102050,
             0);
  if (result) {
    _MergedGlobals_1_57 = 1;
  }
  return result;
}

+ (BOOL)isProximityLiteSupported
{
  if (qword_1EBD5A788 != -1) {
    dispatch_once(&qword_1EBD5A788, &__block_literal_global_130);
  }
  return byte_1EBD5A769;
}

uint64_t __44__PLProximityAgent_isProximityLiteSupported__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
  if ((int)result >= 1001205)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] isWatch];
    if (result) {
      byte_1EBD5A769 = 1;
    }
  }
  return result;
}

- (PLProximityAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLProximityAgent;
  objc_super v2 = [(PLAgent *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_numBTLines = 0;
    v2->_numConnects = 0;
    v2->_numDisconnects = 0;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    lastSBCTimestamp = v3->_lastSBCTimestamp;
    v3->_lastSBCTimestamp = (NSDate *)v4;
  }
  return v3;
}

- (void)initOperatorDependancies
{
  if (+[PLProximityAgent isProximityLiteSupported])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke;
    v34[3] = &unk_1E692A6F8;
    v34[4] = self;
    uint64_t v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EB250 withBlock:v34];
    [(PLProximityAgent *)self setRadioStateListener:v4];
  }
  if (+[PLProximityAgent isProximitySupported]
    || +[PLProximityAgent isProximityLiteSupported])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_162;
    v33[3] = &unk_1E692A6F8;
    v33[4] = self;
    v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29EB278 withBlock:v33];
    [(PLProximityAgent *)self setClientStateListener:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_171;
    v32[3] = &unk_1E692A6F8;
    v32[4] = self;
    v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29EB2A0 withBlock:v32];
    [(PLProximityAgent *)self setRadioPowerListener:v8];
  }
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_177;
  v31[3] = &unk_1E692A0F0;
  v31[4] = self;
  v9 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v31];
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v9;

  [(PLOperator *)self defaultDoubleForKey:@"RunTimeAggregatorTimerCadence"];
  double v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F92A80]);
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v12];
  uint64_t v15 = [(PLOperator *)self workQueue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_180;
  v30[3] = &unk_1E692A200;
  v30[4] = self;
  v16 = (PLTimer *)[v13 initWithFireDate:v14 withInterval:1 withTolerance:0 repeats:v15 withUserInfo:v30 withQueue:v12 withBlock:0.0];
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_192;
  v29[3] = &unk_1E692A6F8;
  v29[4] = self;
  v19 = (void *)[v18 initWithOperator:self withRegistration:&unk_1F29EB2C8 withBlock:v29];
  [(PLProximityAgent *)self setTimerStateListener:v19];

  id v20 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_204;
  v28[3] = &unk_1E692A6F8;
  v28[4] = self;
  v21 = (void *)[v20 initWithOperator:self withRegistration:&unk_1F29EB2F0 withBlock:v28];
  [(PLProximityAgent *)self setMaintenanceListener:v21];

  id v22 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_213;
  v27[3] = &unk_1E692A6F8;
  v27[4] = self;
  v23 = (void *)[v22 initWithOperator:self withRegistration:&unk_1F29EB318 withBlock:v27];
  [(PLProximityAgent *)self setDeviceConnectionListener:v23];

  id v24 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_234;
  v26[3] = &unk_1E692A6F8;
  v26[4] = self;
  v25 = (void *)[v24 initWithOperator:self withRegistration:&unk_1F29EB340 withBlock:v26];
  [(PLProximityAgent *)self setRadioHeartbeatListener:v25];
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A790 != -1) {
      dispatch_once(&qword_1EBD5A790, block);
    }
    if (byte_1EBD5A76A)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: radio state with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:320];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardRadioState:v8];
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76A = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_162(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_163;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A798 != -1) {
      dispatch_once(&qword_1EBD5A798, block);
    }
    if (byte_1EBD5A76B)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: client state with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:327];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardClientState:v8];
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_163(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76B = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_171(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [*(id *)(a1 + 32) logEventBackwardPowerStats:v8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_172;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A7A0 != -1) {
      dispatch_once(&qword_1EBD5A7A0, block);
    }
    if (byte_1EBD5A76C)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: Radio power stats with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      id v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:335];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_172(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76C = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_177(uint64_t a1)
{
  if ([*(id *)(a1 + 32) numConnects] || objc_msgSend(*(id *)(a1 + 32), "numDisconnects"))
  {
    if (([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
      || ([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
    {
      [*(id *)(a1 + 32) logEventIntervalBinnedDeviceConnection];
    }
    [*(id *)(a1 + 32) setNumConnects:0];
    [*(id *)(a1 + 32) setNumDisconnects:0];
  }
  id v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) setLastSBCTimestamp:v2];
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_180(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 112) = 0;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __44__PLProximityAgent_initOperatorDependancies__block_invoke_3;
    double v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (qword_1EBD5A7A8 != -1) {
      dispatch_once(&qword_1EBD5A7A8, &block);
    }
    if (byte_1EBD5A76D)
    {
      id v3 = objc_msgSend(NSString, "stringWithFormat:", @"PLProximityAgent:: Device connection credit refreshed %lu", *(void *)(*(void *)(a1 + 32) + 112), block, v10, v11, v12, v13);
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      v6 = [v5 lastPathComponent];
      id v7 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke_2"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:358];

      id v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76D = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_192(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_193;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A7B0 != -1) {
      dispatch_once(&qword_1EBD5A7B0, block);
    }
    if (byte_1EBD5A76E)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: Timer state with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:363];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointTimerState:v8];
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_193(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76E = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_204(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_205;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A7B8 != -1) {
      dispatch_once(&qword_1EBD5A7B8, block);
    }
    if (byte_1EBD5A76F)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: Maintenance with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:369];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMaintenance:v8];
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_205(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A76F = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_213(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_214;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD5A7C0 != -1) {
      dispatch_once(&qword_1EBD5A7C0, block);
    }
    if (byte_1EBD5A770)
    {
      uint64_t v10 = [NSString stringWithFormat:@"PLProximityAgent:: Device connection with payload=%@ for %@", v8, v7];
      double v11 = (void *)MEMORY[0x1E4F929B8];
      double v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:374];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v16 = [v8 objectForKeyedSubscript:@"type"];
  int v17 = [v16 isEqual:@"BtConnect"];

  id v18 = *(void **)(a1 + 32);
  if (v17) {
    objc_msgSend(v18, "setNumConnects:", objc_msgSend(v18, "numConnects") + 1);
  }
  else {
    objc_msgSend(v18, "setNumDisconnects:", objc_msgSend(v18, "numDisconnects") + 1);
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __44__PLProximityAgent_initOperatorDependancies__block_invoke_223;
    v32 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v33 = v19;
    if (qword_1EBD5A7C8 != -1) {
      dispatch_once(&qword_1EBD5A7C8, &v29);
    }
    if (byte_1EBD5A771)
    {
      id v20 = NSString;
      uint64_t v21 = [*(id *)(a1 + 32) numConnects];
      uint64_t v22 = [*(id *)(a1 + 32) numDisconnects];
      v23 = objc_msgSend(v20, "stringWithFormat:", @"PLProximityAgent:: Updated Connects %lu disconnects %lu", v21, v22, v29, v30, v31, v32, v33);
      id v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLProximityAgent initOperatorDependancies]_block_invoke_2"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:380];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] fullMode]) {
    [*(id *)(a1 + 32) logEventPointDeviceConnection:v8];
  }
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_2_214(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A770 = result;
  return result;
}

uint64_t __44__PLProximityAgent_initOperatorDependancies__block_invoke_223(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A771 = result;
  return result;
}

void __44__PLProximityAgent_initOperatorDependancies__block_invoke_234(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  [*(id *)(a1 + 32) logEventPointRadioHeartbeat:v8];
  uint64_t v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "PLProximityAgent:: Radio Heartbeat with payload=%@ for %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)logEventForwardRadioState:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"State"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardClientState:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ClientState"];
    v6 = [objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    id v7 = [v4 objectForKeyedSubscript:@"TicketID"];
    [v6 setObject:v7 forKeyedSubscript:@"EventID"];

    id v8 = [v4 objectForKeyedSubscript:@"ClientName"];
    [v6 setObject:v8 forKeyedSubscript:@"ClientName"];

    uint64_t v9 = [v4 objectForKeyedSubscript:@"State"];
    [v6 setObject:v9 forKeyedSubscript:@"State"];

    uint64_t v10 = [v4 objectForKeyedSubscript:@"Timestamp"];
    if (v10)
    {
      id v11 = (void *)v10;
      __int16 v12 = [v4 objectForKeyedSubscript:@"Timestamp"];
      id v13 = [MEMORY[0x1E4F1CA98] null];

      if (v12 != v13)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v14 = objc_opt_class();
          v47[0] = MEMORY[0x1E4F143A8];
          v47[1] = 3221225472;
          v47[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke_242;
          v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v47[4] = v14;
          if (qword_1EBD5A7D8 != -1) {
            dispatch_once(&qword_1EBD5A7D8, v47);
          }
          if (byte_1EBD5A773)
          {
            uint64_t v15 = NSString;
            uint64_t v16 = [v6 entryDate];
            [v16 timeIntervalSince1970];
            id v18 = objc_msgSend(v15, "stringWithFormat:", @"Previous TS: %f ", v17);

            uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
            id v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
            uint64_t v21 = [v20 lastPathComponent];
            uint64_t v22 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventForwardClientState:]"];
            [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:418];

            v23 = PLLogCommon();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v18;
              _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        id v24 = (void *)MEMORY[0x1E4F1C9C8];
        v25 = [v4 objectForKeyedSubscript:@"Timestamp"];
        [v25 doubleValue];
        v26 = objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
        [v6 setObject:v26 forKeyedSubscript:@"entryDate"];

        v27 = NSNumber;
        v28 = [v6 entryDate];
        [v28 timeIntervalSince1970];
        uint64_t v29 = objc_msgSend(v27, "numberWithDouble:");
        [v6 setObject:v29 forKeyedSubscript:@"timestamp"];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v30 = objc_opt_class();
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke_255;
          v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v46[4] = v30;
          if (qword_1EBD5A7E0 != -1) {
            dispatch_once(&qword_1EBD5A7E0, v46);
          }
          if (byte_1EBD5A774)
          {
            v31 = NSString;
            v32 = [v6 objectForKeyedSubscript:@"timestamp"];
            uint64_t v33 = [v4 objectForKeyedSubscript:@"Timestamp"];
            [v33 doubleValue];
            v35 = [v31 stringWithFormat:@"Corrected TS :%@ with %f\n", v32, v34];

            v36 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
            v38 = [v37 lastPathComponent];
            v39 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventForwardClientState:]"];
            [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:421];

            v40 = PLLogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v35;
              _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
      }
    }
    [(PLOperator *)self logEntry:v6];
LABEL_19:

    goto LABEL_26;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v41 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLProximityAgent_logEventForwardClientState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v41;
    if (qword_1EBD5A7D0 != -1) {
      dispatch_once(&qword_1EBD5A7D0, block);
    }
    if (byte_1EBD5A772)
    {
      id v5 = [NSString stringWithFormat:@"Received nil payload for logEventForwardClientState"];
      v42 = (void *)MEMORY[0x1E4F929B8];
      v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      v44 = [v43 lastPathComponent];
      v45 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventForwardClientState:]"];
      [v42 logMessage:v5 fromFile:v44 fromFunction:v45 fromLineNumber:408];

      v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v5;
        _os_log_debug_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_19;
    }
  }
LABEL_26:
}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A772 = result;
  return result;
}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke_242(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A773 = result;
  return result;
}

uint64_t __47__PLProximityAgent_logEventForwardClientState___block_invoke_255(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A774 = result;
  return result;
}

- (void)logEventBackwardPowerStats:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"PowerStatistics"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointTimerState:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"TimerState"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointDeviceConnection:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  v6 = +[PLOperator entryKeyForType:v4 andName:@"DeviceConnection"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v5];

  unint64_t v8 = self->_numBTLines + 1;
  self->_numBTLines = v8;
  if (v8 > 0x13)
  {
    if (v8 == 20)
    {
      [v7 setObject:@"RateLimit" forKeyedSubscript:@"reason"];
      [(PLOperator *)self logEntry:v7];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v16 = objc_opt_class();
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_267;
        v31[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v31[4] = v16;
        if (qword_1EBD5A7F0 != -1) {
          dispatch_once(&qword_1EBD5A7F0, v31);
        }
        if (byte_1EBD5A776)
        {
          uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"ProxDevice:At credit in DeviceConnection %lu", self->_numBTLines);
          uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
          id v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
          uint64_t v19 = [v18 lastPathComponent];
          id v20 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventPointDeviceConnection:]"];
          [v17 logMessage:v10 fromFile:v19 fromFunction:v20 fromLineNumber:448];

          uint64_t v15 = PLLogCommon();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v10;
            goto LABEL_23;
          }
LABEL_20:
        }
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      v28 = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_273;
      uint64_t v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v30 = v21;
      if (qword_1EBD5A7F8 != -1) {
        dispatch_once(&qword_1EBD5A7F8, &v26);
      }
      if (byte_1EBD5A777)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"ProxDevice:Exceeded credit in DeviceConnection %lu", self->_numBTLines, v26, v27, v28, v29, v30);
        uint64_t v22 = (void *)MEMORY[0x1E4F929B8];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
        id v24 = [v23 lastPathComponent];
        v25 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventPointDeviceConnection:]"];
        [v22 logMessage:v10 fromFile:v24 fromFunction:v25 fromLineNumber:450];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v10;
          goto LABEL_23;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
    [(PLOperator *)self logEntry:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1EBD5A7E8 != -1) {
        dispatch_once(&qword_1EBD5A7E8, block);
      }
      if (byte_1EBD5A775)
      {
        uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"ProxDevice: Below credit in DeviceConnection %lu", self->_numBTLines);
        id v11 = (void *)MEMORY[0x1E4F929B8];
        __int16 v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
        id v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventPointDeviceConnection:]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:444];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v10;
LABEL_23:
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_20;
        }
        goto LABEL_20;
      }
    }
  }
}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A775 = result;
  return result;
}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_267(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A776 = result;
  return result;
}

uint64_t __50__PLProximityAgent_logEventPointDeviceConnection___block_invoke_273(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A777 = result;
  return result;
}

- (void)logEventIntervalBinnedDeviceConnection
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"BinnedDeviceConnection"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  id v5 = [v4 entryDate];
  [v4 setEntryDate:self->_lastSBCTimestamp];
  [v4 setObject:v5 forKeyedSubscript:@"timestampEnd"];
  v6 = [NSNumber numberWithInteger:self->_numConnects];
  [v4 setObject:v6 forKeyedSubscript:@"connects"];

  id v7 = [NSNumber numberWithInteger:self->_numDisconnects];
  [v4 setObject:v7 forKeyedSubscript:@"disconnects"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    uint64_t v17 = __58__PLProximityAgent_logEventIntervalBinnedDeviceConnection__block_invoke;
    id v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v19 = v8;
    if (qword_1EBD5A800 != -1) {
      dispatch_once(&qword_1EBD5A800, &block);
    }
    if (byte_1EBD5A778)
    {
      uint64_t v9 = [NSString stringWithFormat:@"ProxDevice:Logging ts:%@ %lu %lu", self->_lastSBCTimestamp, self->_numConnects, self->_numDisconnects, block, v16, v17, v18, v19];
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      id v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      __int16 v12 = [v11 lastPathComponent];
      id v13 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventIntervalBinnedDeviceConnection]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:461];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLOperator *)self logEntry:v4];
}

uint64_t __58__PLProximityAgent_logEventIntervalBinnedDeviceConnection__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A778 = result;
  return result;
}

- (void)logEventPointMaintenance:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  v6 = +[PLOperator entryKeyForType:v4 andName:@"MaintainedDevices"];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withRawData:v5];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"numDevices"];

  int v9 = [v8 intValue];
  if (v9 >= 20) {
    int v10 = 20;
  }
  else {
    int v10 = v9;
  }
  if ((v9 - 10) >= 0xA) {
    unsigned int v11 = v10;
  }
  else {
    unsigned int v11 = 10;
  }
  if ((v9 - 5) >= 5) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 5;
  }
  id v13 = [NSNumber numberWithInt:v12];
  [v7 setObject:v13 forKeyedSubscript:@"numDevices"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v14 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __45__PLProximityAgent_logEventPointMaintenance___block_invoke;
    id v24 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v25 = v14;
    if (qword_1EBD5A808 != -1) {
      dispatch_once(&qword_1EBD5A808, &block);
    }
    if (byte_1EBD5A779)
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"Number of devices %d", v12, block, v22, v23, v24, v25);
      uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLProximityAgent.m"];
      id v18 = [v17 lastPathComponent];
      uint64_t v19 = [NSString stringWithUTF8String:"-[PLProximityAgent logEventPointMaintenance:]"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:480];

      id v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLOperator *)self logEntry:v7];
}

uint64_t __45__PLProximityAgent_logEventPointMaintenance___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A779 = result;
  return result;
}

- (void)logEventPointRadioHeartbeat:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"RadioHeartbeat"];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (PLXPCListenerOperatorComposition)radioStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRadioStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)clientStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)radioPowerListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRadioPowerListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)timerStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTimerStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)maintenanceListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMaintenanceListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)deviceConnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceConnectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)radioHeartbeatListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRadioHeartbeatListener:(id)a3
{
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
}

- (unint64_t)numBTLines
{
  return self->_numBTLines;
}

- (void)setNumBTLines:(unint64_t)a3
{
  self->_numBTLines = a3;
}

- (unint64_t)numConnects
{
  return self->_numConnects;
}

- (void)setNumConnects:(unint64_t)a3
{
  self->_numConnects = a3;
}

- (unint64_t)numDisconnects
{
  return self->_numDisconnects;
}

- (void)setNumDisconnects:(unint64_t)a3
{
  self->_numDisconnects = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (NSDate)lastSBCTimestamp
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastSBCTimestamp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSBCTimestamp, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_radioHeartbeatListener, 0);
  objc_storeStrong((id *)&self->_deviceConnectionListener, 0);
  objc_storeStrong((id *)&self->_maintenanceListener, 0);
  objc_storeStrong((id *)&self->_timerStateListener, 0);
  objc_storeStrong((id *)&self->_radioPowerListener, 0);
  objc_storeStrong((id *)&self->_clientStateListener, 0);
  objc_storeStrong((id *)&self->_radioStateListener, 0);
}

@end