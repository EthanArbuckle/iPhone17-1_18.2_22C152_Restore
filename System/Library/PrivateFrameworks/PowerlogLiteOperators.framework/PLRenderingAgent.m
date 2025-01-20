@interface PLRenderingAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionFrameCount;
+ (id)entryEventBackwardDefinitionFrameStats;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)shouldLogFrameStats;
- (FBSDisplayLayoutMonitor)mainDisplayMonitor;
- (NSNumber)deviceIsPlugged;
- (PLEntryNotificationOperatorComposition)pluggedInStateNotification;
- (PLRenderingAgent)init;
- (PLXPCListenerOperatorComposition)frameStatsListener;
- (unsigned)lastFrameCount;
- (void)dealloc;
- (void)disableCAScreenTelemetry;
- (void)enableCAScreenTelemetry;
- (void)handleConnectedChange:(id)a3;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)log;
- (void)logEventBackwardFrameStats:(id)a3;
- (void)logEventForwardFrameCount:(id)a3;
- (void)logFrameCount:(unsigned int)a3 forConnectedState:(BOOL)a4;
- (void)setDeviceIsPlugged:(id)a3;
- (void)setFrameStatsListener:(id)a3;
- (void)setLastFrameCount:(unsigned int)a3;
- (void)setMainDisplayMonitor:(id)a3;
- (void)setPluggedInStateNotification:(id)a3;
@end

@implementation PLRenderingAgent

id __52__PLRenderingAgent_logFrameCount_forConnectedState___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logEventForwardFrameCount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v13 = v4;
    BOOL v5 = [v4 displayBacklightLevel] < 1;
    id v4 = v13;
    if (!v5)
    {
      v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"FrameCount"];
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
      v8 = [NSNumber numberWithUnsignedInt:CARenderServerGetFrameCounter()];
      [v7 setObject:v8 forKeyedSubscript:@"FrameCount"];

      [(PLOperator *)self logEntry:v7];
      v9 = [(PLRenderingAgent *)self deviceIsPlugged];

      if (v9)
      {
        v10 = [v7 objectForKeyedSubscript:@"FrameCount"];
        uint64_t v11 = [v10 unsignedIntValue];
        v12 = [(PLRenderingAgent *)self deviceIsPlugged];
        -[PLRenderingAgent logFrameCount:forConnectedState:](self, "logFrameCount:forConnectedState:", v11, [v12 BOOLValue]);
      }
      id v4 = v13;
    }
  }
}

- (NSNumber)deviceIsPlugged
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)logFrameCount:(unsigned int)a3 forConnectedState:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(PLRenderingAgent *)self lastFrameCount])
  {
    uint64_t v7 = v5;
    if ([(PLRenderingAgent *)self lastFrameCount] <= v5) {
      uint64_t v7 = v5 - [(PLRenderingAgent *)self lastFrameCount];
    }
    v8 = objc_opt_new();
    v9 = [NSNumber numberWithUnsignedInt:v7];
    [v8 setObject:v9 forKeyedSubscript:@"frameCount"];

    v10 = PLLogCommon();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v4)
    {
      if (v11)
      {
        unsigned int lastFrameCount = self->_lastFrameCount;
        *(_DWORD *)buf = 67109632;
        int v19 = v5;
        __int16 v20 = 1024;
        unsigned int v21 = lastFrameCount;
        __int16 v22 = 1024;
        int v23 = v7;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Plugged: framesRendered=%d, lastFrameCount=%d, delta=%d", buf, 0x14u);
      }
      v12 = @"plugged";
      id v13 = @"com.apple.power.framecount.plugged";
    }
    else
    {
      if (v11)
      {
        unsigned int v16 = self->_lastFrameCount;
        *(_DWORD *)buf = 67109632;
        int v19 = v5;
        __int16 v20 = 1024;
        unsigned int v21 = v16;
        __int16 v22 = 1024;
        int v23 = v7;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "Unplugged: framesRendered=%d, lastFrameCount=%d, delta=%d", buf, 0x14u);
      }
      v12 = @"unplugged";
      id v13 = @"com.apple.power.framecount.unplugged";
    }

    MEMORY[0x1D94294C0](v13, v7);
    [v8 setObject:v12 forKeyedSubscript:@"state"];
    v17 = v8;
    id v14 = v8;
    AnalyticsSendEventLazy();
  }
  [(PLRenderingAgent *)self setLastFrameCount:v5];
}

- (unsigned)lastFrameCount
{
  return self->_lastFrameCount;
}

- (void)setLastFrameCount:(unsigned int)a3
{
  self->_unsigned int lastFrameCount = a3;
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v9 = a4;
  uint64_t v7 = [a5 transitionReason];
  uint64_t v8 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (v8 != 8 && v8 != 28) {
    [(PLRenderingAgent *)self logEventForwardFrameCount:v9];
  }
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLRenderingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"FrameCount";
  v3 = [a1 entryEventBackwardDefinitionFrameCount];
  v7[1] = @"FrameStats";
  v8[0] = v3;
  BOOL v4 = [a1 entryEventBackwardDefinitionFrameStats];
  v8[1] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventBackwardDefinitionFrameCount
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0500;
  v12[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  id v9 = @"FrameCount";
  BOOL v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventBackwardDefinitionFrameStats
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0510;
  v24[1] = MEMORY[0x1E4F1CC28];
  v23[2] = *MEMORY[0x1E4F92CE8];
  v24[2] = MEMORY[0x1E4F1CC38];
  __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"APL_r";
  int v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v22[0] = v18;
  v21[1] = @"APL_g";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  unsigned int v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v22[1] = v16;
  v21[2] = @"APL_b";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v22[2] = v14;
  v21[3] = @"AZLE_max";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  BOOL v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v22[3] = v4;
  v21[4] = @"AZLE_min";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
  v22[4] = v6;
  v21[5] = @"AZLE_mean";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v22[5] = v8;
  v21[6] = @"EDR_headroom";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
  v22[6] = v10;
  BOOL v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLRenderingAgent)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLRenderingAgent;
    BOOL v4 = [(PLAgent *)&v8 init];
    if (v4)
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:0];
      mainDisplayMonitor = v4->_mainDisplayMonitor;
      v4->_mainDisplayMonitor = (FBSDisplayLayoutMonitor *)v5;

      [(FBSDisplayLayoutMonitor *)v4->_mainDisplayMonitor addObserver:v4];
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  v12[1] = *MEMORY[0x1E4F143B8];
  [(PLRenderingAgent *)self setLastFrameCount:0];
  [(PLRenderingAgent *)self setDeviceIsPlugged:0];
  id v3 = objc_alloc(MEMORY[0x1E4F929E8]);
  BOOL v11 = @"ExternalConnected";
  id v9 = &unk_1F29E50F8;
  BOOL v4 = [MEMORY[0x1E4F1CA98] null];
  v10 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PLRenderingAgent_initOperatorDependancies__block_invoke;
  void v8[3] = &unk_1E692A0F0;
  v8[4] = self;
  uint64_t v7 = (void *)[v3 initWithOperator:self forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v6 withBlock:v8];
  [(PLRenderingAgent *)self setPluggedInStateNotification:v7];

  if ([(PLRenderingAgent *)self shouldLogFrameStats]) {
    [(PLRenderingAgent *)self disableCAScreenTelemetry];
  }
}

uint64_t __44__PLRenderingAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleConnectedChange:a2];
}

- (void)initTaskOperatorDependancies
{
  if ([(PLRenderingAgent *)self shouldLogFrameStats])
  {
    if ([MEMORY[0x1E4F929C0] taskMode])
    {
      id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __48__PLRenderingAgent_initTaskOperatorDependancies__block_invoke;
      v5[3] = &unk_1E692A6F8;
      v5[4] = self;
      BOOL v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29E90E0 withBlock:v5];
      [(PLRenderingAgent *)self setFrameStatsListener:v4];

      [(PLRenderingAgent *)self enableCAScreenTelemetry];
    }
  }
}

void __48__PLRenderingAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Frame Stats callback: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventBackwardFrameStats:v6];
}

- (void)dealloc
{
  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)mainDisplayMonitor invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)PLRenderingAgent;
  [(PLAgent *)&v4 dealloc];
}

- (void)log
{
  id v4 = [(PLRenderingAgent *)self mainDisplayMonitor];
  id v3 = [v4 currentLayout];
  [(PLRenderingAgent *)self logEventForwardFrameCount:v3];
}

- (void)handleConnectedChange:(id)a3
{
  id v4 = [a3 objectForKey:@"entry"];
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"ExternalConnected"];
    uint64_t v6 = [v5 BOOLValue];

    uint64_t v7 = [NSNumber numberWithBool:v6];
    [(PLRenderingAgent *)self setDeviceIsPlugged:v7];

    [(PLRenderingAgent *)self logFrameCount:CARenderServerGetFrameCounter() forConnectedState:v6 ^ 1];
    id v4 = v8;
  }
}

- (void)logEventBackwardFrameStats:(id)a3
{
  if (a3)
  {
    uint64_t v4 = *MEMORY[0x1E4F92D28];
    id v5 = a3;
    id v7 = +[PLOperator entryKeyForType:v4 andName:@"FrameStats"];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

    [(PLOperator *)self logEntry:v6];
  }
}

- (BOOL)shouldLogFrameStats
{
  if (qword_1EBD57D18 != -1) {
    dispatch_once(&qword_1EBD57D18, &__block_literal_global_15);
  }
  return _MergedGlobals_1_17;
}

uint64_t __39__PLRenderingAgent_shouldLogFrameStats__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPad];
  if (result)
  {
    uint64_t result = [MEMORY[0x1E4F92A38] kPLSoCClassOfDevice];
    BOOL v1 = result == 1001012;
  }
  else
  {
    BOOL v1 = 0;
  }
  _MergedGlobals_1_17 = v1;
  return result;
}

- (void)enableCAScreenTelemetry
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F39B60] mainDisplay];
  [v2 bounds];
  unint64_t v4 = (unint64_t)v3;

  id v5 = [MEMORY[0x1E4F39B60] mainDisplay];
  [v5 bounds];
  unint64_t v7 = (unint64_t)v6;

  int v8 = MGGetSInt32Answer();
  if (v8 == 20) {
    unint64_t v9 = 36;
  }
  else {
    unint64_t v9 = 44;
  }
  if (v8 == 20) {
    unint64_t v10 = 52;
  }
  else {
    unint64_t v10 = 59;
  }
  unint64_t v11 = (v4 + v9 - 1) / v9;
  unint64_t v12 = (v7 + v10 - 1) / v10;
  id v13 = PLLogCommon();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218752;
    unint64_t v18 = v4;
    __int16 v19 = 2048;
    unint64_t v20 = v7;
    __int16 v21 = 2048;
    unint64_t v22 = v9;
    __int16 v23 = 2048;
    unint64_t v24 = v10;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "sW: %lu, sH: %lu, nX: %lu, nY: %lu", (uint8_t *)&v17, 0x2Au);
  }
  unint64_t v14 = vcvtpd_u64_f64((float)v11 * 1.9);
  unint64_t v15 = vcvtpd_u64_f64((float)v12 * 1.9);

  unsigned int v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134218752;
    unint64_t v18 = v11;
    __int16 v19 = 2048;
    unint64_t v20 = v12;
    __int16 v21 = 2048;
    unint64_t v22 = v14;
    __int16 v23 = 2048;
    unint64_t v24 = v15;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "rW: %lu, rH: %lu, zW: %lu, zH: %lu", (uint8_t *)&v17, 0x2Au);
  }

  [MEMORY[0x1E4F929C0] longForKey:@"FrameStatsSampleInterval" ifNotSet:60];
  CARenderServerSetScreenTelemetryParameters();
}

- (void)disableCAScreenTelemetry
{
}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)pluggedInStateNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPluggedInStateNotification:(id)a3
{
}

- (void)setDeviceIsPlugged:(id)a3
{
}

- (PLXPCListenerOperatorComposition)frameStatsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFrameStatsListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameStatsListener, 0);
  objc_storeStrong((id *)&self->_deviceIsPlugged, 0);
  objc_storeStrong((id *)&self->_pluggedInStateNotification, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

@end