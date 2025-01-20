@interface PLBluetoothAgent
+ (BOOL)shouldLogEnhancedStats;
+ (BOOL)shouldLogMarconi;
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionA2DPPower;
+ (id)entryEventBackwardDefinitionAHFPPower;
+ (id)entryEventBackwardDefinitionCBDiscoveryStats;
+ (id)entryEventBackwardDefinitionDetailedPowerProfileStats;
+ (id)entryEventBackwardDefinitionEnhancedPowerProfileStats;
+ (id)entryEventBackwardDefinitionHCITrace;
+ (id)entryEventBackwardDefinitionMaxDutyCycle;
+ (id)entryEventBackwardDefinitionPowerProfileStats;
+ (id)entryEventBackwardDefinitionThreadRadioPowerProfileStats;
+ (id)entryEventBackwardDefinitionWirelessProxScanDStats;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventBackwardWakeupVSE;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionMagnet;
+ (id)entryEventPointDefinitionMagnetOperation;
+ (id)entryEventPointDefinitions;
+ (id)getBluetooth5GKeys;
+ (id)getScanCoreKeys;
+ (void)load;
- (BOOL)bluetoothPresent;
- (BOOL)isConnectable;
- (BOOL)isConnected;
- (BOOL)isDiscoverable;
- (BOOL)modulePowered;
- (BTLocalDeviceImpl)localBluetoothDevice;
- (NSDate)lastPowerEntryDate;
- (NSMutableDictionary)ENScanCache;
- (NSString)btHardwareChipset;
- (PLBluetoothAgent)init;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)sbcChanged;
- (PLEntryNotificationOperatorComposition)wakeEntryNotifications;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLXPCListenerOperatorComposition)CBDiscoveryListener;
- (PLXPCListenerOperatorComposition)ENListener;
- (PLXPCListenerOperatorComposition)btA2DPListener;
- (PLXPCListenerOperatorComposition)btHCIListener;
- (PLXPCListenerOperatorComposition)btHCIVSEListener;
- (PLXPCListenerOperatorComposition)btHFPListener;
- (PLXPCListenerOperatorComposition)leConnectionListener;
- (PLXPCListenerOperatorComposition)magnetListener;
- (PLXPCListenerOperatorComposition)magnetOperationListener;
- (PLXPCListenerOperatorComposition)wirelessProxListener;
- (SPBeaconManager)beaconManager;
- (id)advertisingDataDescription:(const char *)a3 :(unint64_t)a4;
- (id)btHardwareChipsetQuery;
- (unsigned)logCount;
- (void)attachSession;
- (void)bluetoothDeviceEvent:(int)a3 onDevice:(BTLocalDeviceImpl *)a4 withResult:(int)a5;
- (void)bluetoothSessionEvent:(int)a3 onSession:(BTSessionImpl *)a4 withResult:(int)a5;
- (void)dealloc;
- (void)initOperatorDependancies;
- (void)log;
- (void)logEventBackwardA2DP:(id)a3;
- (void)logEventBackwardCBDiscovery:(id)a3;
- (void)logEventBackwardHFP:(id)a3;
- (void)logEventBackwardMaxDutyCycle:(id)a3;
- (void)logEventBackwardPowerProfileStats;
- (void)logEventBackwardWirelessProximity:(id)a3;
- (void)logEventForwardDeviceState;
- (void)logEventForwardPairedDevices;
- (void)logEventIntervalConnectedDevices;
- (void)logEventIntervalHCIRawData:(id)a3;
- (void)logEventIntervalLeConnectedDevices:(id)a3 withRequest:(BOOL)a4;
- (void)logEventIntervalWakeVSE:(id)a3;
- (void)logEventPointMagnet:(id)a3;
- (void)logEventPointMagnetOperation:(id)a3;
- (void)logwithBTOnCheck;
- (void)modelBluetoothOffPower;
- (void)modelBluetoothPower:(id)a3;
- (void)sessionAttached:(BTSessionImpl *)a3 withResult:(int)a4;
- (void)sessionTerminated:(BTSessionImpl *)a3 withResult:(int)a4;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setBtA2DPListener:(id)a3;
- (void)setBtHCIListener:(id)a3;
- (void)setBtHCIVSEListener:(id)a3;
- (void)setBtHFPListener:(id)a3;
- (void)setCBDiscoveryListener:(id)a3;
- (void)setENListener:(id)a3;
- (void)setENScanCache:(id)a3;
- (void)setLastPowerEntryDate:(id)a3;
- (void)setLeConnectionListener:(id)a3;
- (void)setLogCount:(unsigned __int8)a3;
- (void)setMagnetListener:(id)a3;
- (void)setMagnetOperationListener:(id)a3;
- (void)setSbcChanged:(id)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setWirelessProxListener:(id)a3;
@end

@implementation PLBluetoothAgent

void __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_921(uint64_t a1, void *a2)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) exposureNotificationEnabled];
  int v5 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v3)
  {
    double v6 = 0.0;
    if (v5)
    {
      uint64_t v7 = objc_opt_class();
      v112[0] = MEMORY[0x1E4F143A8];
      v112[1] = 3221225472;
      v112[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2_922;
      v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v112[4] = v7;
      if (qword_1EBD58188 != -1) {
        dispatch_once(&qword_1EBD58188, v112);
      }
      if (byte_1EBD57F7F)
      {
        v8 = [NSString stringWithFormat:@"ModelBTPower: activateWithCompletionHandler failed: %@", v3];
        v9 = (void *)MEMORY[0x1E4F929B8];
        v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v11 = [v10 lastPathComponent];
        v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:2287];

        v13 = PLLogCommon();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
LABEL_7:

          goto LABEL_77;
        }
        *(_DWORD *)buf = 138412290;
        v114 = v8;
LABEL_86:
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        goto LABEL_7;
      }
    }
    goto LABEL_77;
  }
  if (v5)
  {
    uint64_t v14 = objc_opt_class();
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_928;
    v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v111[4] = v14;
    if (qword_1EBD58190 != -1) {
      dispatch_once(&qword_1EBD58190, v111);
    }
    if (byte_1EBD57F80)
    {
      v15 = [NSString stringWithFormat:@"ModelBTPower: activateWithCompletionHandler: %@", *(void *)(a1 + 32)];
      v16 = (void *)MEMORY[0x1E4F929B8];
      v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v18 = [v17 lastPathComponent];
      v19 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
      [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:2291];

      v20 = PLLogCommon();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v15;
        _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v4)
  {
    double v21 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      double v22 = *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      int v23 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v21 >= v22)
      {
        if (v23)
        {
          uint64_t v54 = objc_opt_class();
          v109[0] = MEMORY[0x1E4F143A8];
          v109[1] = 3221225472;
          v109[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_940;
          v109[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v109[4] = v54;
          if (qword_1EBD581A0 != -1) {
            dispatch_once(&qword_1EBD581A0, v109);
          }
          if (byte_1EBD57F82)
          {
            v55 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f > %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
            v56 = (void *)MEMORY[0x1E4F929B8];
            v57 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
            v58 = [v57 lastPathComponent];
            v59 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
            [v56 logMessage:v55 fromFile:v58 fromFunction:v59 fromLineNumber:2300];

            v60 = PLLogCommon();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v114 = v55;
              _os_log_debug_impl(&dword_1D2690000, v60, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                                + 24);
        *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                + 24);
        goto LABEL_76;
      }
      if (v23)
      {
        uint64_t v24 = objc_opt_class();
        v110[0] = MEMORY[0x1E4F143A8];
        v110[1] = 3221225472;
        v110[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_934;
        v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v110[4] = v24;
        if (qword_1EBD58198 != -1) {
          dispatch_once(&qword_1EBD58198, v110);
        }
        if (byte_1EBD57F81)
        {
          v25 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f < %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24));
          v26 = (void *)MEMORY[0x1E4F929B8];
          v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v28 = [v27 lastPathComponent];
          v29 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
          [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:2295];

          v30 = PLLogCommon();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v25;
            _os_log_debug_impl(&dword_1D2690000, v30, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                              + 24);
    }
    else
    {
      int v41 = [MEMORY[0x1E4F929C0] debugEnabled];
      if (v21 >= 3.2)
      {
        if (v41)
        {
          uint64_t v68 = objc_opt_class();
          v107[0] = MEMORY[0x1E4F143A8];
          v107[1] = 3221225472;
          v107[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_949;
          v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v107[4] = v68;
          if (qword_1EBD581B0 != -1) {
            dispatch_once(&qword_1EBD581B0, v107);
          }
          if (byte_1EBD57F84)
          {
            v69 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f > %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), 0x400999999999999ALL);
            v70 = (void *)MEMORY[0x1E4F929B8];
            v71 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
            v72 = [v71 lastPathComponent];
            v73 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
            [v70 logMessage:v69 fromFile:v72 fromFunction:v73 fromLineNumber:2313];

            v74 = PLLogCommon();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v114 = v69;
              _os_log_debug_impl(&dword_1D2690000, v74, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0x400999999999999ALL;
        goto LABEL_76;
      }
      if (v41)
      {
        uint64_t v42 = objc_opt_class();
        v108[0] = MEMORY[0x1E4F143A8];
        v108[1] = 3221225472;
        v108[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_946;
        v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v108[4] = v42;
        if (qword_1EBD581A8 != -1) {
          dispatch_once(&qword_1EBD581A8, v108);
        }
        if (byte_1EBD57F83)
        {
          v43 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f < %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), 0x400999999999999ALL);
          v44 = (void *)MEMORY[0x1E4F929B8];
          v45 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v46 = [v45 lastPathComponent];
          v47 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
          [v44 logMessage:v43 fromFile:v46 fromFunction:v47 fromLineNumber:2309];

          v48 = PLLogCommon();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v43;
            _os_log_debug_impl(&dword_1D2690000, v48, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_76:
    double v6 = 9.0;
    goto LABEL_77;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    double v31 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    double v32 = *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24);
    int v33 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v31 >= v32)
    {
      if (v33)
      {
        uint64_t v61 = objc_opt_class();
        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_955;
        v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v105[4] = v61;
        if (qword_1EBD581C0 != -1) {
          dispatch_once(&qword_1EBD581C0, v105);
        }
        if (byte_1EBD57F86)
        {
          v62 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f > %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
          v63 = (void *)MEMORY[0x1E4F929B8];
          v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v65 = [v64 lastPathComponent];
          v66 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
          [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:2326];

          v67 = PLLogCommon();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v62;
            _os_log_debug_impl(&dword_1D2690000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                              + 24);
      *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                              + 24);
    }
    else
    {
      if (v33)
      {
        uint64_t v34 = objc_opt_class();
        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_952;
        v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v106[4] = v34;
        if (qword_1EBD581B8 != -1) {
          dispatch_once(&qword_1EBD581B8, v106);
        }
        if (byte_1EBD57F85)
        {
          v35 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f < %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24));
          v36 = (void *)MEMORY[0x1E4F929B8];
          v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v38 = [v37 lastPathComponent];
          v39 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
          [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:2322];

          v40 = PLLogCommon();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v114 = v35;
            _os_log_debug_impl(&dword_1D2690000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 88) + 8)
                                                                              + 24);
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
    double v6 = 0.0;
  }
  else
  {
    double v6 = 0.0;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v49 = objc_opt_class();
      v104[0] = MEMORY[0x1E4F143A8];
      v104[1] = 3221225472;
      v104[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_958;
      v104[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v104[4] = v49;
      if (qword_1EBD581C8 != -1) {
        dispatch_once(&qword_1EBD581C8, v104);
      }
      if (byte_1EBD57F87)
      {
        v8 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTPower: %f", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
        v50 = (void *)MEMORY[0x1E4F929B8];
        v51 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v52 = [v51 lastPathComponent];
        v53 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
        [v50 logMessage:v8 fromFile:v52 fromFunction:v53 fromLineNumber:2334];

        v13 = PLLogCommon();
        if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_7;
        }
        *(_DWORD *)buf = 138412290;
        v114 = v8;
        goto LABEL_86;
      }
    }
  }
LABEL_77:
  [*(id *)(a1 + 32) invalidate];
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = fmax(*(double *)(*(void *)(*(void *)(a1 + 64) + 8)+ 24)- *(double *)(*(void *)(*(void *)(a1 + 96) + 8)+ 24), 0.0);
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v75 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v100 = 3221225472;
    v101 = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_964;
    v102 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v103 = v75;
    if (qword_1EBD581D0 != -1) {
      dispatch_once(&qword_1EBD581D0, &block);
    }
    if (byte_1EBD57F88)
    {
      v76 = NSString;
      uint64_t v77 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      uint64_t v78 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
      v79 = [*(id *)(a1 + 48) entryDate];
      v80 = [v76 stringWithFormat:@"ModelBTPower: Model %f to node 50, %f to node 58, %f to node 59 at %@", v77, *(void *)&v6, v78, v79, block, v100, v101, v102, v103];

      v81 = (void *)MEMORY[0x1E4F929B8];
      v82 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v83 = [v82 lastPathComponent];
      v84 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
      [v81 logMessage:v80 fromFile:v83 fromFunction:v84 fromLineNumber:2339];

      v85 = PLLogCommon();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v80;
        _os_log_debug_impl(&dword_1D2690000, v85, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v86 = [MEMORY[0x1E4F92900] sharedInstance];
  double v87 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v88 = [*(id *)(a1 + 48) entryDate];
  [v86 createPowerEventBackwardWithRootNodeID:50 withPower:v88 withEndDate:v87];

  v89 = [MEMORY[0x1E4F92900] sharedInstance];
  [v89 createPowerEventBackwardWithRootNodeID:58 withPower:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) withEndDate:v6];

  v90 = [MEMORY[0x1E4F92900] sharedInstance];
  v91 = [*(id *)(a1 + 48) entryDate];
  [v90 createPowerEventBackwardWithRootNodeID:58 withPower:v91 withEndDate:0.0];

  v92 = [MEMORY[0x1E4F92900] sharedInstance];
  v93 = [*(id *)(a1 + 48) entryDate];
  [v92 createDistributionEventForwardWithDistributionID:45 withChildNodeNameToWeight:&unk_1F29E9568 withStartDate:v93];

  v94 = [MEMORY[0x1E4F92900] sharedInstance];
  [v94 createPowerEventBackwardWithRootNodeID:59 withPower:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) withEndDate:*(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)];

  v95 = [MEMORY[0x1E4F92900] sharedInstance];
  v96 = [*(id *)(a1 + 48) entryDate];
  [v95 createPowerEventBackwardWithRootNodeID:59 withPower:v96 withEndDate:0.0];

  v97 = [MEMORY[0x1E4F92900] sharedInstance];
  v98 = [*(id *)(a1 + 48) entryDate];
  [v97 createDistributionEventForwardWithDistributionID:47 withChildNodeNameToWeight:&unk_1F29E9590 withStartDate:v98];
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_526(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_3;
    uint64_t v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v15 = v4;
    if (qword_1EBD57FD8 != -1) {
      dispatch_once(&qword_1EBD57FD8, &block);
    }
    if (byte_1EBD57F49)
    {
      int v5 = [NSString stringWithFormat:@"Notification from ThermalMonitor: %@", v3, block, v12, v13, v14, v15];
      double v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke_2"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:860];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventBackwardPowerProfileStats];
}

+ (BOOL)shouldLogEnhancedStats
{
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0)
  {
    return 1;
  }
  id v3 = (void *)MEMORY[0x1E4F92A38];
  return [v3 isWiFiClass:1004017];
}

- (void)logEventBackwardPowerProfileStats
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  int v185 = 0;
  int v186 = 0;
  uint64_t v3 = *MEMORY[0x1E4F92D28];
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"PowerProfileStats"];
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004011] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004012])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v6 = objc_opt_class();
      v184[0] = MEMORY[0x1E4F143A8];
      v184[1] = 3221225472;
      v184[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke;
      v184[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v184[4] = v6;
      if (qword_1EBD580F0 != -1) {
        dispatch_once(&qword_1EBD580F0, v184);
      }
      if (byte_1EBD57F6C)
      {
        uint64_t v7 = v5;
        v8 = self;
        v9 = v4;
        v10 = [NSString stringWithFormat:@"reading detailedpowerprofile"];
        v11 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1800];

        uint64_t v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v4 = v9;
        self = v8;
        int v5 = v7;
      }
    }
    uint64_t v182 = 0;
    uint64_t v183 = 0;
    uint64_t v180 = 0;
    uint64_t v181 = 0;
    uint64_t v178 = 0;
    uint64_t v179 = 0;
    uint64_t v177 = 0;
    [(PLBluetoothAgent *)self localBluetoothDevice];
    uint64_t DetailedPowerProfileStatistics = BTLocalDeviceReadDetailedPowerProfileStatistics();
    v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", DetailedPowerProfileStatistics, &v180, (char *)&v180 + 4, (char *)&v179 + 4, &v179, (char *)&v178 + 4, &v178, (char *)&v177 + 4, &v177);
    [v5 setObject:v17 forKeyedSubscript:@"ErrorCode"];

    uint64_t v18 = +[PLOperator entryKeyForType:v3 andName:@"DetailedPowerProfileStats"];
    v19 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18];
    if (DetailedPowerProfileStatistics)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v176[0] = MEMORY[0x1E4F143A8];
        v176[1] = 3221225472;
        v176[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_739;
        v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v176[4] = v20;
        if (qword_1EBD580F8 != -1) {
          dispatch_once(&qword_1EBD580F8, v176);
        }
        if (byte_1EBD57F6D)
        {
          v165 = v5;
          double v21 = v4;
          double v22 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR: could not read power profile statistics (error: %u)", DetailedPowerProfileStatistics);
          int v23 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v25 = [v24 lastPathComponent];
          v26 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
          [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:1851];

          v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v188 = v22;
            _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v4 = v21;
          int v5 = v165;
        }
      }
      if (DetailedPowerProfileStatistics == 7)
      {
        v28 = [(PLOperator *)self workQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_743;
        block[3] = &unk_1E692A250;
        block[4] = self;
        dispatch_async(v28, block);
      }
    }
    else
    {
      v167 = v4;
      v29 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      lastPowerEntryDate = self->_lastPowerEntryDate;
      self->_lastPowerEntryDate = v29;

      double v31 = [NSNumber numberWithUnsignedInt:HIDWORD(v183)];
      [v19 setObject:v31 forKeyedSubscript:@"durationTotal"];

      double v32 = [NSNumber numberWithUnsignedInt:v183];
      [v19 setObject:v32 forKeyedSubscript:@"durationActive"];

      int v33 = [NSNumber numberWithUnsignedInt:HIDWORD(v182)];
      [v19 setObject:v33 forKeyedSubscript:@"durationIdle"];

      uint64_t v34 = [NSNumber numberWithUnsignedInt:v182];
      [v19 setObject:v34 forKeyedSubscript:@"durationSleep"];

      v35 = [NSNumber numberWithUnsignedInt:HIDWORD(v181)];
      [v19 setObject:v35 forKeyedSubscript:@"disableCounter"];

      v36 = [NSNumber numberWithUnsignedInt:v181];
      [v19 setObject:v36 forKeyedSubscript:@"iPATxBT"];

      v37 = [NSNumber numberWithUnsignedInt:HIDWORD(v180)];
      [v19 setObject:v37 forKeyedSubscript:@"iPATxLE"];

      v38 = [NSNumber numberWithUnsignedInt:v180];
      [v19 setObject:v38 forKeyedSubscript:@"ePATxBT"];

      v39 = [NSNumber numberWithUnsignedInt:HIDWORD(v179)];
      [v19 setObject:v39 forKeyedSubscript:@"ePATxLE"];

      v40 = [NSNumber numberWithUnsignedInt:v179];
      [v19 setObject:v40 forKeyedSubscript:@"connectedRxBT"];

      int v41 = [NSNumber numberWithUnsignedInt:HIDWORD(v178)];
      [v19 setObject:v41 forKeyedSubscript:@"connectedRxLE"];

      uint64_t v42 = [NSNumber numberWithUnsignedInt:v178];
      [v19 setObject:v42 forKeyedSubscript:@"scanRxBT"];

      v43 = [NSNumber numberWithUnsignedInt:HIDWORD(v177)];
      [v19 setObject:v43 forKeyedSubscript:@"scanRxLE"];

      v44 = [NSNumber numberWithUnsignedInt:v177];
      [v19 setObject:v44 forKeyedSubscript:@"totalPHYCal"];

      if (HIDWORD(v183))
      {
        LODWORD(v45) = v182;
        uint64_t v46 = (int)((double)v45 / (double)HIDWORD(v183) * 10000.0);
        HIWORD(v185) = (int)((double)v45 / (double)HIDWORD(v183) * 10000.0);
        uint64_t v47 = (int)((double)(HIDWORD(v178) + v179 + v178 + HIDWORD(v177))
                                / (double)HIDWORD(v183)
                                * 10000.0);
        LOWORD(v186) = (int)((double)(HIDWORD(v178) + v179 + v178 + HIDWORD(v177))
                           / (double)HIDWORD(v183)
                           * 10000.0);
        *(double *)&unint64_t v48 = (double)(HIDWORD(v180) + v181 + v180 + HIDWORD(v179))
                        / (double)HIDWORD(v183)
                        * 10000.0;
        HIWORD(v186) = (int)*(double *)&v48;
        LODWORD(v48) = HIDWORD(v182);
        double v49 = (double)v48 / (double)HIDWORD(v183) * 10000.0;
        uint64_t v50 = (int)v49;
        LOWORD(v185) = (int)v49;
      }
      else
      {
        uint64_t v50 = 0;
        uint64_t v46 = 0;
        uint64_t v47 = 0;
      }
      uint64_t v103 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      [v5 setObject:v103 forKeyedSubscript:@"TXPower"];

      v104 = [NSNumber numberWithUnsignedInt:v47];
      [v5 setObject:v104 forKeyedSubscript:@"RXPower"];

      v105 = [NSNumber numberWithUnsignedInt:v46];
      [v5 setObject:v105 forKeyedSubscript:@"SleepPower"];

      v106 = [NSNumber numberWithUnsignedInt:v50];
      [v5 setObject:v106 forKeyedSubscript:@"OtherPower"];

      uint64_t v4 = v167;
    }
    [(PLOperator *)self logEntry:v19];

    goto LABEL_62;
  }
  BOOL v51 = +[PLBluetoothAgent shouldLogEnhancedStats];
  int v52 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (!v51)
  {
    if (v52)
    {
      uint64_t v83 = objc_opt_class();
      v171[0] = MEMORY[0x1E4F143A8];
      v171[1] = 3221225472;
      v171[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_760;
      v171[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v171[4] = v83;
      if (qword_1EBD58120 != -1) {
        dispatch_once(&qword_1EBD58120, v171);
      }
      if (byte_1EBD57F72)
      {
        v84 = self;
        v85 = v4;
        v86 = [NSString stringWithFormat:@"Getting power profile stats"];
        double v87 = (void *)MEMORY[0x1E4F929B8];
        v88 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v89 = [v88 lastPathComponent];
        v90 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
        [v87 logMessage:v86 fromFile:v89 fromFunction:v90 fromLineNumber:1972];

        v91 = PLLogCommon();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v86;
          _os_log_debug_impl(&dword_1D2690000, v91, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        uint64_t v4 = v85;
        self = v84;
      }
    }
    [(PLBluetoothAgent *)self localBluetoothDevice];
    uint64_t PowerProfileStatistics = BTLocalDeviceReadPowerProfileStatistics();
    v93 = [NSNumber numberWithUnsignedInt:PowerProfileStatistics];
    [v5 setObject:v93 forKeyedSubscript:@"ErrorCode"];

    if (PowerProfileStatistics)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v94 = objc_opt_class();
        v170[0] = MEMORY[0x1E4F143A8];
        v170[1] = 3221225472;
        v170[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_766;
        v170[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v170[4] = v94;
        if (qword_1EBD58128 != -1) {
          dispatch_once(&qword_1EBD58128, v170);
        }
        if (byte_1EBD57F73)
        {
          v95 = v4;
          v96 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR: could not read power profile statistics (error: %u)", PowerProfileStatistics);
          v97 = (void *)MEMORY[0x1E4F929B8];
          v98 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v99 = [v98 lastPathComponent];
          uint64_t v100 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
          [v97 logMessage:v96 fromFile:v99 fromFunction:v100 fromLineNumber:1982];

          v101 = PLLogCommon();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v188 = v96;
            _os_log_debug_impl(&dword_1D2690000, v101, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          uint64_t v4 = v95;
        }
      }
      if (PowerProfileStatistics == 7)
      {
        v102 = [(PLOperator *)self workQueue];
        v169[0] = MEMORY[0x1E4F143A8];
        v169[1] = 3221225472;
        v169[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_767;
        v169[3] = &unk_1E692A250;
        v169[4] = self;
        dispatch_async(v102, v169);
      }
      [(PLOperator *)self logEntry:v5];
      goto LABEL_67;
    }
    v107 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v108 = self->_lastPowerEntryDate;
    self->_lastPowerEntryDate = v107;

    v109 = [NSNumber numberWithUnsignedInt:HIWORD(v186)];
    [v5 setObject:v109 forKeyedSubscript:@"TXPower"];

    v110 = [NSNumber numberWithUnsignedInt:(unsigned __int16)v186];
    [v5 setObject:v110 forKeyedSubscript:@"RXPower"];

    v111 = [NSNumber numberWithUnsignedInt:HIWORD(v185)];
    [v5 setObject:v111 forKeyedSubscript:@"SleepPower"];

    v112 = [NSNumber numberWithUnsignedInt:(unsigned __int16)v185];
    [v5 setObject:v112 forKeyedSubscript:@"OtherPower"];

LABEL_65:
    [(PLOperator *)self logEntry:v5];
LABEL_66:
    [(PLBluetoothAgent *)self modelBluetoothPower:v5];
    goto LABEL_67;
  }
  if (v52)
  {
    uint64_t v53 = objc_opt_class();
    v174[0] = MEMORY[0x1E4F143A8];
    v174[1] = 3221225472;
    v174[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_746;
    v174[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v174[4] = v53;
    if (qword_1EBD58108 != -1) {
      dispatch_once(&qword_1EBD58108, v174);
    }
    if (byte_1EBD57F6F)
    {
      uint64_t v54 = v5;
      v55 = self;
      v56 = v4;
      v57 = [NSString stringWithFormat:@"Getting Enhanced BT stats"];
      v58 = (void *)MEMORY[0x1E4F929B8];
      v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v60 = [v59 lastPathComponent];
      uint64_t v61 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
      [v58 logMessage:v57 fromFile:v60 fromFunction:v61 fromLineNumber:1869];

      v62 = PLLogCommon();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v188 = v57;
        _os_log_debug_impl(&dword_1D2690000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      uint64_t v4 = v56;
      self = v55;
      int v5 = v54;
    }
  }
  v63 = (unsigned int *)malloc_type_malloc(0xF8uLL, 0x10000401CD0A21CuLL);
  if (!v63) {
    goto LABEL_65;
  }
  v64 = v63;
  v168 = v4;
  [(PLBluetoothAgent *)self localBluetoothDevice];
  v162 = v64;
  uint64_t EnhancedPowerProfileStatistics = BTLocalDeviceReadEnhancedPowerProfileStatistics();
  uint64_t v163 = +[PLOperator entryKeyForType:v3 andName:@"EnhancedPowerProfileStats"];
  v66 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v163];
  v67 = [NSNumber numberWithUnsignedInt:EnhancedPowerProfileStatistics];
  [v66 setObject:v67 forKeyedSubscript:@"ErrorCode"];

  uint64_t DetailedPowerProfileStatistics = EnhancedPowerProfileStatistics;
  uint64_t v68 = +[PLOperator entryKeyForType:v3 andName:@"ThreadRadioPowerProfileStats"];
  v69 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v68];
  v70 = [NSNumber numberWithUnsignedInt:EnhancedPowerProfileStatistics];
  v164 = v69;
  [v69 setObject:v70 forKeyedSubscript:@"ErrorCode"];

  v71 = [NSNumber numberWithUnsignedInt:EnhancedPowerProfileStatistics];
  [v5 setObject:v71 forKeyedSubscript:@"ErrorCode"];

  if (EnhancedPowerProfileStatistics)
  {
    v73 = v66;
    v72 = (void *)v163;
    v74 = v162;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v75 = objc_opt_class();
      v173[0] = MEMORY[0x1E4F143A8];
      v173[1] = 3221225472;
      v173[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_752;
      v173[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v173[4] = v75;
      if (qword_1EBD58110 != -1) {
        dispatch_once(&qword_1EBD58110, v173);
      }
      if (byte_1EBD57F70)
      {
        v161 = v68;
        v166 = v5;
        v76 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR: could not read enhanced power profile statistics (error: %u)", DetailedPowerProfileStatistics);
        uint64_t v77 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v79 = [v78 lastPathComponent];
        v80 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]"];
        [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:1953];

        v81 = PLLogCommon();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v188 = v76;
          _os_log_debug_impl(&dword_1D2690000, v81, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        int v5 = v166;
        v72 = (void *)v163;
        uint64_t v68 = v161;
      }
    }
    if (DetailedPowerProfileStatistics == 7)
    {
      v82 = [(PLOperator *)self workQueue];
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_756;
      v172[3] = &unk_1E692A250;
      v172[4] = self;
      dispatch_async(v82, v172);
    }
  }
  else
  {
    v113 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    v114 = self->_lastPowerEntryDate;
    self->_lastPowerEntryDate = v113;

    v74 = v162;
    uint64_t v115 = [NSNumber numberWithUnsignedInt:v162[1]];
    [v5 setObject:v115 forKeyedSubscript:@"TXPower"];

    v116 = [NSNumber numberWithUnsignedInt:v162[2]];
    [v5 setObject:v116 forKeyedSubscript:@"RXPower"];

    v117 = [NSNumber numberWithUnsignedInt:v162[3]];
    [v5 setObject:v117 forKeyedSubscript:@"SleepPower"];

    v118 = [NSNumber numberWithUnsignedInt:v162[4]];
    [v5 setObject:v118 forKeyedSubscript:@"OtherPower"];

    v119 = [NSNumber numberWithUnsignedInt:v162[1]];
    v73 = v66;
    [v66 setObject:v119 forKeyedSubscript:@"TXPower"];

    v120 = [NSNumber numberWithUnsignedInt:v162[2]];
    [v66 setObject:v120 forKeyedSubscript:@"RXPower"];

    v121 = [NSNumber numberWithUnsignedInt:v162[3]];
    [v66 setObject:v121 forKeyedSubscript:@"SleepPower"];

    v122 = [NSNumber numberWithUnsignedInt:v162[4]];
    [v66 setObject:v122 forKeyedSubscript:@"OtherPower"];

    v123 = [NSNumber numberWithUnsignedInt:v162[38]];
    [v66 setObject:v123 forKeyedSubscript:@"iPACounter"];

    v124 = [NSNumber numberWithUnsignedInt:v162[39]];
    [v66 setObject:v124 forKeyedSubscript:@"ePACounter"];

    v125 = [NSNumber numberWithUnsignedInt:v162[9]];
    [v66 setObject:v125 forKeyedSubscript:@"ActiveDuration"];

    v126 = [NSNumber numberWithUnsignedInt:v162[27]];
    [v66 setObject:v126 forKeyedSubscript:@"DeepSleepDuration"];

    v127 = [NSNumber numberWithUnsignedInt:v162[10]];
    [v66 setObject:v127 forKeyedSubscript:@"D3SuspendDuration"];

    v128 = [NSNumber numberWithUnsignedInt:v162[11]];
    [v66 setObject:v128 forKeyedSubscript:@"PerstDuration"];

    v129 = [NSNumber numberWithUnsignedInt:v162[13]];
    [v66 setObject:v129 forKeyedSubscript:@"L0Duration"];

    v130 = [NSNumber numberWithUnsignedInt:v162[17]];
    [v66 setObject:v130 forKeyedSubscript:@"L11Duration"];

    v131 = [NSNumber numberWithUnsignedInt:v162[19]];
    [v66 setObject:v131 forKeyedSubscript:@"L12Duration"];

    v132 = [NSNumber numberWithUnsignedInt:v162[21]];
    [v66 setObject:v132 forKeyedSubscript:@"L2Duration"];

    v133 = [NSNumber numberWithUnsignedInt:v162[28]];
    [v66 setObject:v133 forKeyedSubscript:@"BTTimestamp"];

    v134 = [NSNumber numberWithUnsignedInt:v162[43]];
    [v66 setObject:v134 forKeyedSubscript:@"epaTransmitPercentage"];

    v135 = [NSNumber numberWithUnsignedInt:v162[41]];
    [v66 setObject:v135 forKeyedSubscript:@"txbfTransmitPercentage"];

    v136 = [NSNumber numberWithUnsignedInt:v162[44]];
    [v66 setObject:v136 forKeyedSubscript:@"txbfEpaTransmitPercentage"];

    v137 = [NSNumber numberWithUnsignedInt:v162[42]];
    [v66 setObject:v137 forKeyedSubscript:@"mrcReceivePercentage"];

    v138 = [NSNumber numberWithUnsignedInt:v162[40]];
    [v66 setObject:v138 forKeyedSubscript:@"lpScanReceivePercentage"];

    if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
      || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
    {
      v139 = [NSNumber numberWithUnsignedInt:v162[45]];
      [v66 setObject:v139 forKeyedSubscript:@"rxScanPercentage"];

      v140 = [NSNumber numberWithUnsignedInt:v162[46]];
      [v66 setObject:v140 forKeyedSubscript:@"mainCoreELNAOnPercentage"];

      v141 = [NSNumber numberWithUnsignedInt:v162[47]];
      [v66 setObject:v141 forKeyedSubscript:@"mainCoreELNAOffPercentage"];

      v142 = [NSNumber numberWithUnsignedInt:v162[48]];
      [v66 setObject:v142 forKeyedSubscript:@"scanCoreELNAOnPercentage"];

      v143 = [NSNumber numberWithUnsignedInt:v162[49]];
      [v66 setObject:v143 forKeyedSubscript:@"scanCoreELNAOffPercentage"];

      v144 = [NSNumber numberWithUnsignedInt:v162[46]];
      [v5 setObject:v144 forKeyedSubscript:@"mainCoreELNAOnPercentage"];

      v145 = [NSNumber numberWithUnsignedInt:v162[47]];
      [v5 setObject:v145 forKeyedSubscript:@"mainCoreELNAOffPercentage"];

      v146 = [NSNumber numberWithUnsignedInt:v162[48]];
      [v5 setObject:v146 forKeyedSubscript:@"scanCoreELNAOnPercentage"];

      v147 = [NSNumber numberWithUnsignedInt:v162[49]];
      [v5 setObject:v147 forKeyedSubscript:@"scanCoreELNAOffPercentage"];
    }
    if (([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
      || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
    {
      v148 = [NSNumber numberWithUnsignedInt:v162[54]];
      [v66 setObject:v148 forKeyedSubscript:@"iPA5GCounter"];

      v149 = [NSNumber numberWithUnsignedInt:v162[55]];
      [v66 setObject:v149 forKeyedSubscript:@"ePA5GCounter"];

      v150 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v162 + 112)];
      [v66 setObject:v150 forKeyedSubscript:@"txbf5GTransmitPercentage"];

      v151 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v162 + 113)];
      [v66 setObject:v151 forKeyedSubscript:@"mrc5GReceivePercentage"];

      v152 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v162 + 114)];
      [v66 setObject:v152 forKeyedSubscript:@"epa5GTransmitPercentage"];

      v153 = [NSNumber numberWithUnsignedInt:*((unsigned __int16 *)v162 + 115)];
      [v66 setObject:v153 forKeyedSubscript:@"txbf5GEpaTransmitPercentage"];

      v154 = [NSNumber numberWithUnsignedLongLong:*((void *)v162 + 29)];
      [v66 setObject:v154 forKeyedSubscript:@"Duration5GTx"];

      v155 = [NSNumber numberWithUnsignedLongLong:*((void *)v162 + 30)];
      [v66 setObject:v155 forKeyedSubscript:@"Duration5GRx"];
    }
    if (([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
      || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
    {
      v156 = [NSNumber numberWithUnsignedInt:v162[28]];
      [v69 setObject:v156 forKeyedSubscript:@"RadioTimestamp"];

      v157 = [NSNumber numberWithUnsignedInt:v162[50]];
      [v69 setObject:v157 forKeyedSubscript:@"m154TransmitPercentage"];

      v158 = [NSNumber numberWithUnsignedInt:v162[51]];
      [v69 setObject:v158 forKeyedSubscript:@"m154ReceivePercentage"];

      v159 = [NSNumber numberWithUnsignedInt:v162[52]];
      [v69 setObject:v159 forKeyedSubscript:@"iPAThreadCounter"];

      v160 = [NSNumber numberWithUnsignedInt:v162[53]];
      [v69 setObject:v160 forKeyedSubscript:@"ePAThreadCounter"];

      [(PLOperator *)self logEntry:v69];
    }
    [(PLOperator *)self logEntry:v66];
    v72 = (void *)v163;
  }
  free(v74);

  uint64_t v4 = v168;
LABEL_62:
  [(PLOperator *)self logEntry:v5];
  if (!DetailedPowerProfileStatistics) {
    goto LABEL_66;
  }
LABEL_67:
}

- (void)modelBluetoothPower:(id)a3
{
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    goto LABEL_102;
  }
  int v5 = [(PLBluetoothAgent *)self btHardwareChipsetQuery];
  uint64_t v6 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"bluetooth"];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  v8 = [v7 objectForKeyedSubscript:@"tx"];
  [v8 doubleValue];
  double v145 = v9;

  v10 = [v6 objectForKeyedSubscript:v5];
  v11 = [v10 objectForKeyedSubscript:@"rx"];
  [v11 doubleValue];
  double v144 = v12;

  v13 = [v6 objectForKeyedSubscript:v5];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"other"];
  [v14 doubleValue];
  double v143 = v15;

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (qword_1EBD58150 != -1) {
      dispatch_once(&qword_1EBD58150, block);
    }
    if (byte_1EBD57F78)
    {
      v17 = [NSString stringWithFormat:@"coefficientTxPower = %f, coefficientTxPower = %f, coefficientOtherPower = %f", *(void *)&v145, *(void *)&v144, *(void *)&v143];
      uint64_t v18 = (void *)MEMORY[0x1E4F929B8];
      v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      uint64_t v20 = [v19 lastPathComponent];
      double v21 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2155];

      double v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  int v23 = [v4 objectForKeyedSubscript:@"TXPower"];
  [v23 doubleValue];
  double v25 = v24;

  v26 = [v4 objectForKeyedSubscript:@"RXPower"];
  [v26 doubleValue];
  double v28 = v27;

  v29 = [v4 objectForKeyedSubscript:@"OtherPower"];
  [v29 doubleValue];
  double v31 = v30;

  double v32 = [v4 objectForKeyedSubscript:@"SleepPower"];
  [v32 doubleValue];
  uint64_t v139 = v33;

  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004015]) {
    goto LABEL_12;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004016]) {
    goto LABEL_12;
  }
  double v34 = 0.0;
  double v140 = 0.0;
  double v141 = 0.0;
  double v142 = 0.0;
  double v35 = 0.0;
  double v36 = 0.0;
  double v37 = 0.0;
  double v38 = 0.0;
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
LABEL_12:
    v39 = [v6 objectForKeyedSubscript:v5];
    v40 = [v39 objectForKeyedSubscript:@"mcon"];
    [v40 doubleValue];
    double v142 = v41;

    uint64_t v42 = [v6 objectForKeyedSubscript:v5];
    v43 = [v42 objectForKeyedSubscript:@"mcoff"];
    [v43 doubleValue];
    double v141 = v44;

    unint64_t v45 = [v6 objectForKeyedSubscript:v5];
    uint64_t v46 = [v45 objectForKeyedSubscript:@"scon"];
    [v46 doubleValue];
    double v140 = v47;

    unint64_t v48 = [v6 objectForKeyedSubscript:v5];
    double v49 = [v48 objectForKeyedSubscript:@"scoff"];
    [v49 doubleValue];
    double v34 = v50;

    BOOL v51 = [v4 objectForKeyedSubscript:@"mainCoreELNAOnPercentage"];
    [v51 doubleValue];
    double v38 = v52;

    uint64_t v53 = [v4 objectForKeyedSubscript:@"mainCoreELNAOffPercentage"];
    [v53 doubleValue];
    double v37 = v54;

    v55 = [v4 objectForKeyedSubscript:@"scanCoreELNAOnPercentage"];
    [v55 doubleValue];
    double v36 = v56;

    v57 = [v4 objectForKeyedSubscript:@"scanCoreELNAOffPercentage"];
    [v57 doubleValue];
    double v35 = v58;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v59 = objc_opt_class();
    v194[0] = MEMORY[0x1E4F143A8];
    v194[1] = 3221225472;
    v194[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_885;
    v194[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v194[4] = v59;
    if (qword_1EBD58158 != -1) {
      dispatch_once(&qword_1EBD58158, v194);
    }
    if (byte_1EBD57F79)
    {
      v60 = [NSString stringWithFormat:@"txDur=%f, rxDur=%f, otherDur=%f, sleepDur=%f, mcondur=%f, mcoffdur=%f, scondur=%f, scoffdur=%f", *(void *)&v25, *(void *)&v28, *(void *)&v31, v139, *(void *)&v38, *(void *)&v37, *(void *)&v36, *(void *)&v35];
      uint64_t v61 = (void *)MEMORY[0x1E4F929B8];
      v62 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v63 = [v62 lastPathComponent];
      v64 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v61 logMessage:v60 fromFile:v63 fromFunction:v64 fromLineNumber:2186];

      v65 = PLLogCommon();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v60;
        _os_log_debug_impl(&dword_1D2690000, v65, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  double v66 = 0.0;
  double v67 = 0.0;
  double v68 = 0.0;
  double v69 = 0.0;
  if (v37 + v35 + v36 + v38 < v28)
  {
    double v28 = v28 - v36 - v35 - v38 - v37;
    double v66 = v35;
    double v67 = v36;
    double v68 = v37;
    double v69 = v38;
  }
  if (v25 <= 10000.0) {
    double v70 = v25;
  }
  else {
    double v70 = 0.0;
  }
  if (v28 <= 10000.0) {
    double v71 = v28;
  }
  else {
    double v71 = 0.0;
  }
  if (v31 <= 10000.0) {
    double v72 = v31;
  }
  else {
    double v72 = 0.0;
  }
  if (v69 > 10000.0) {
    double v69 = 0.0;
  }
  if (v68 > 10000.0) {
    double v68 = 0.0;
  }
  if (v67 > 10000.0) {
    double v67 = 0.0;
  }
  if (v66 > 10000.0) {
    double v66 = 0.0;
  }
  double v73 = (v144 * v71 + v145 * v70 + v143 * v72 + v69 * v142 + v68 * v141 + v67 * v140 + v66 * v34) / 10000.0;
  if (v73 >= 0.0) {
    double v74 = v73;
  }
  else {
    double v74 = 0.0;
  }
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", 0.0))
  {
    uint64_t v75 = objc_opt_class();
    v193[0] = MEMORY[0x1E4F143A8];
    v193[1] = 3221225472;
    v193[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_891;
    v193[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v193[4] = v75;
    if (qword_1EBD58160 != -1) {
      dispatch_once(&qword_1EBD58160, v193);
    }
    if (byte_1EBD57F7A)
    {
      v76 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power=%f", *(void *)&v74);
      uint64_t v77 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v78 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v79 = [v78 lastPathComponent];
      v80 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v77 logMessage:v76 fromFile:v79 fromFunction:v80 fromLineNumber:2227];

      v81 = PLLogCommon();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v76;
        _os_log_debug_impl(&dword_1D2690000, v81, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  uint64_t v189 = 0;
  v190 = (double *)&v189;
  uint64_t v191 = 0x2020000000;
  double v192 = v74;
  uint64_t v185 = 0;
  int v186 = &v185;
  uint64_t v187 = 0x2020000000;
  char v188 = 0;
  uint64_t v181 = 0;
  uint64_t v182 = (double *)&v181;
  uint64_t v183 = 0x2020000000;
  uint64_t v184 = 0;
  v146 = [MEMORY[0x1E4F1CA80] setWithObject:*MEMORY[0x1E4F97DA0]];
  [v146 addObject:*MEMORY[0x1E4F97D98]];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v82 = objc_opt_class();
    v180[0] = MEMORY[0x1E4F143A8];
    v180[1] = 3221225472;
    v180[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_898;
    v180[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v180[4] = v82;
    if (qword_1EBD58168 != -1) {
      dispatch_once(&qword_1EBD58168, v180);
    }
    if (byte_1EBD57F7B)
    {
      uint64_t v83 = [NSString stringWithFormat:@"Types: %@", v146];
      v84 = (void *)MEMORY[0x1E4F929B8];
      v85 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v86 = [v85 lastPathComponent];
      double v87 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v84 logMessage:v83 fromFile:v86 fromFunction:v87 fromLineNumber:2241];

      v88 = PLLogCommon();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v83;
        _os_log_debug_impl(&dword_1D2690000, v88, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_t v89 = dispatch_semaphore_create(0);
  v90 = [(PLBluetoothAgent *)self beaconManager];
  v177[0] = MEMORY[0x1E4F143A8];
  v177[1] = 3221225472;
  v177[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_902;
  v177[3] = &unk_1E692BD58;
  v177[4] = self;
  uint64_t v179 = &v185;
  v91 = v89;
  uint64_t v178 = v91;
  [v90 allBeaconsOfTypes:v146 completion:v177];

  dispatch_time_t v92 = dispatch_time(0, 120000000000);
  if (dispatch_semaphore_wait(v91, v92) && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v93 = objc_opt_class();
    v176[0] = MEMORY[0x1E4F143A8];
    v176[1] = 3221225472;
    v176[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_916;
    v176[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v176[4] = v93;
    if (qword_1EBD58180 != -1) {
      dispatch_once(&qword_1EBD58180, v176);
    }
    if (byte_1EBD57F7E)
    {
      uint64_t v94 = [NSString stringWithFormat:@"Timed out, ItemPaired: %d", *((unsigned __int8 *)v186 + 24)];
      v95 = (void *)MEMORY[0x1E4F929B8];
      v96 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v97 = [v96 lastPathComponent];
      v98 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v95 logMessage:v94 fromFile:v97 fromFunction:v98 fromLineNumber:2253];

      v99 = PLLogCommon();
      if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v94;
        _os_log_debug_impl(&dword_1D2690000, v99, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  uint64_t v172 = 0;
  v173 = (double *)&v172;
  uint64_t v174 = 0x2020000000;
  uint64_t v175 = 0x4016000000000000;
  uint64_t v168 = 0;
  v169 = (double *)&v168;
  uint64_t v170 = 0x2020000000;
  uint64_t v171 = 0x3FF6666666666666;
  v167[0] = 0;
  v167[1] = v167;
  v167[2] = 0x2020000000;
  v167[3] = 0x401199999999999ALL;
  uint64_t v163 = 0;
  v164 = (double *)&v163;
  uint64_t v165 = 0x2020000000;
  uint64_t v166 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v199 = 0x3032000000;
  v200 = __Block_byref_object_copy__5;
  v201 = __Block_byref_object_dispose__5;
  uint64_t v100 = [v4 entryDate];
  id v202 = [v100 dateByAddingTimeInterval:-5.0];

  if (![MEMORY[0x1E4F92A38] isiPhone])
  {
    if (*((unsigned char *)v186 + 24))
    {
      if (v190[3] >= v169[3])
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v119 = objc_opt_class();
          v149[0] = MEMORY[0x1E4F143A8];
          v149[1] = 3221225472;
          v149[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_982;
          v149[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v149[4] = v119;
          if (qword_1EBD581E0 != -1) {
            dispatch_once(&qword_1EBD581E0, v149);
          }
          if (byte_1EBD57F8A)
          {
            v120 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f > %f", *((void *)v190 + 3), *((void *)v173 + 3));
            v121 = (void *)MEMORY[0x1E4F929B8];
            v122 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
            v123 = [v122 lastPathComponent];
            v124 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
            [v121 logMessage:v120 fromFile:v123 fromFunction:v124 fromLineNumber:2376];

            v125 = PLLogCommon();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v196 = 138412290;
              v197 = v120;
              _os_log_debug_impl(&dword_1D2690000, v125, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
            }
          }
        }
        v164[3] = v173[3];
        v182[3] = v169[3];
        goto LABEL_93;
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v104 = objc_opt_class();
        v150[0] = MEMORY[0x1E4F143A8];
        v150[1] = 3221225472;
        v150[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_979;
        v150[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v150[4] = v104;
        if (qword_1EBD581D8 != -1) {
          dispatch_once(&qword_1EBD581D8, v150);
        }
        if (byte_1EBD57F89)
        {
          v105 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTpower %f < %f", *((void *)v190 + 3), *((void *)v173 + 3));
          v106 = (void *)MEMORY[0x1E4F929B8];
          v107 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v108 = [v107 lastPathComponent];
          v109 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
          [v106 logMessage:v105 fromFile:v108 fromFunction:v109 fromLineNumber:2372];

          v110 = PLLogCommon();
          if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v196 = 138412290;
            v197 = v105;
            _os_log_debug_impl(&dword_1D2690000, v110, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
          }
        }
      }
      v164[3] = v173[3];
      v111 = v190;
    }
    else
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v112 = objc_opt_class();
        v148[0] = MEMORY[0x1E4F143A8];
        v148[1] = 3221225472;
        v148[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_985;
        v148[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v148[4] = v112;
        if (qword_1EBD581E8 != -1) {
          dispatch_once(&qword_1EBD581E8, v148);
        }
        if (byte_1EBD57F8B)
        {
          v113 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTPower: BTPower: %f", *((void *)v190 + 3));
          v114 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v115 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          v116 = [v115 lastPathComponent];
          v117 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
          [v114 logMessage:v113 fromFile:v116 fromFunction:v117 fromLineNumber:2381];

          v118 = PLLogCommon();
          if (os_log_type_enabled(v118, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v196 = 138412290;
            v197 = v113;
            _os_log_debug_impl(&dword_1D2690000, v118, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
          }
        }
      }
      v111 = v164;
    }
    v111[3] = 0.0;
LABEL_93:
    v190[3] = fmax(v190[3] - v182[3], 0.0);
    v126 = [MEMORY[0x1E4F92900] sharedInstance];
    double v127 = v190[3];
    v128 = [v4 entryDate];
    [v126 createPowerEventBackwardWithRootNodeID:50 withPower:v128 withEndDate:v127];

    v129 = [MEMORY[0x1E4F92900] sharedInstance];
    [v129 createPowerEventBackwardWithRootNodeID:59 withPower:*(void *)(*((void *)&buf + 1) + 40) withEndDate:v164[3]];

    v130 = [MEMORY[0x1E4F92900] sharedInstance];
    v131 = [v4 entryDate];
    [v130 createPowerEventBackwardWithRootNodeID:59 withPower:v131 withEndDate:0.0];

    id v102 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v103 = [v4 entryDate];
    [v102 createDistributionEventForwardWithDistributionID:47 withChildNodeNameToWeight:&unk_1F29E95B8 withStartDate:v103];
    goto LABEL_94;
  }
  id v101 = objc_alloc_init(MEMORY[0x1E4F25798]);
  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v151[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_921;
  v151[3] = &unk_1E692BD80;
  id v102 = v101;
  id v152 = v102;
  v153 = self;
  v155 = &v185;
  v156 = &v189;
  v157 = v167;
  v158 = &v163;
  v159 = &v172;
  v160 = &v181;
  v161 = &v168;
  id v154 = v4;
  p_long long buf = &buf;
  [v102 activateWithCompletionHandler:v151];

  uint64_t v103 = v152;
LABEL_94:

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v132 = objc_opt_class();
    v147[0] = MEMORY[0x1E4F143A8];
    v147[1] = 3221225472;
    v147[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_992;
    v147[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v147[4] = v132;
    if (qword_1EBD581F0 != -1) {
      dispatch_once(&qword_1EBD581F0, v147);
    }
    if (byte_1EBD57F8C)
    {
      v133 = objc_msgSend(NSString, "stringWithFormat:", @"ITpower: %f", *((void *)v164 + 3));
      v134 = (void *)MEMORY[0x1E4F929B8];
      v135 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v136 = [v135 lastPathComponent];
      v137 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]"];
      [v134 logMessage:v133 fromFile:v136 fromFunction:v137 fromLineNumber:2404];

      v138 = PLLogCommon();
      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v196 = 138412290;
        v197 = v133;
        _os_log_debug_impl(&dword_1D2690000, v138, OS_LOG_TYPE_DEBUG, "%@", v196, 0xCu);
      }
    }
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v163, 8);
  _Block_object_dispose(v167, 8);
  _Block_object_dispose(&v168, 8);
  _Block_object_dispose(&v172, 8);

  _Block_object_dispose(&v181, 8);
  _Block_object_dispose(&v185, 8);
  _Block_object_dispose(&v189, 8);

LABEL_102:
}

- (BTLocalDeviceImpl)localBluetoothDevice
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_localBluetoothDevice = &self->localBluetoothDevice;
  result = self->localBluetoothDevice;
  if (!result)
  {
    result = (BTLocalDeviceImpl *)self->session;
    if (result)
    {
      uint64_t Default = BTLocalDeviceGetDefault();
      if (Default || (result = *p_localBluetoothDevice) == 0)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v6 = objc_opt_class();
          uint64_t block = MEMORY[0x1E4F143A8];
          uint64_t v14 = 3221225472;
          double v15 = __40__PLBluetoothAgent_localBluetoothDevice__block_invoke;
          uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
          uint64_t v17 = v6;
          if (qword_1EBD57FF8 != -1) {
            dispatch_once(&qword_1EBD57FF8, &block);
          }
          if (byte_1EBD57F4D)
          {
            uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetDefault: failed! %d\n", Default, block, v14, v15, v16, v17);
            v8 = (void *)MEMORY[0x1E4F929B8];
            double v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
            v10 = [v9 lastPathComponent];
            v11 = [NSString stringWithUTF8String:"-[PLBluetoothAgent localBluetoothDevice]"];
            [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:934];

            double v12 = PLLogCommon();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)long long buf = 138412290;
              v19 = v7;
              _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        result = 0;
        *p_localBluetoothDevice = 0;
      }
    }
  }
  return result;
}

- (id)btHardwareChipsetQuery
{
  if (!self->_btHardwareChipset)
  {
    if ([MEMORY[0x1E4F92A38] isWiFiClass:1004001])
    {
      uint64_t v3 = @"4334";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004002])
    {
      uint64_t v3 = @"43342";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004003])
    {
      uint64_t v3 = @"4324";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004006])
    {
      uint64_t v3 = @"4345";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004005])
    {
      uint64_t v3 = @"4350";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004008])
    {
      uint64_t v3 = @"43452";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004007])
    {
      uint64_t v3 = @"4355";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004010])
    {
      uint64_t v3 = @"4357";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004013])
    {
      uint64_t v3 = @"4377";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004014])
    {
      uint64_t v3 = @"4378";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004015])
    {
      uint64_t v3 = @"4387";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004016])
    {
      uint64_t v3 = @"4388";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004017])
    {
      uint64_t v3 = @"4399";
    }
    else if ([MEMORY[0x1E4F92A38] isWiFiClass:1004011])
    {
      uint64_t v3 = @"1001";
    }
    else
    {
      if (![MEMORY[0x1E4F92A38] isWiFiClass:1004012]) {
        goto LABEL_33;
      }
      uint64_t v3 = @"2001";
    }
    btHardwareChipset = self->_btHardwareChipset;
    self->_btHardwareChipset = &v3->isa;
  }
LABEL_33:
  int v5 = self->_btHardwareChipset;
  return v5;
}

- (SPBeaconManager)beaconManager
{
  return (SPBeaconManager *)objc_getProperty(self, a2, 200, 1);
}

void __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_902(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v4;
    if (qword_1EBD58170 != -1) {
      dispatch_once(&qword_1EBD58170, block);
    }
    if (byte_1EBD57F7C)
    {
      int v5 = objc_msgSend(NSString, "stringWithFormat:", @"Count: %lu", objc_msgSend(v3, "count"));
      uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      v8 = [v7 lastPathComponent];
      double v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:2244];

      v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v21 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count] != 0;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_908;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v11;
    if (qword_1EBD58178 != -1) {
      dispatch_once(&qword_1EBD58178, v18);
    }
    if (byte_1EBD57F7D)
    {
      double v12 = objc_msgSend(NSString, "stringWithFormat:", @"ItemPaired: %d", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      double v15 = [v14 lastPathComponent];
      uint64_t v16 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothPower:]_block_invoke_2"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:2246];

      uint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v21 = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBluetoothAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Magnet";
  id v3 = [a1 entryEventPointDefinitionMagnet];
  v7[1] = @"MagnetOperation";
  v8[0] = v3;
  uint64_t v4 = [a1 entryEventPointDefinitionMagnetOperation];
  v8[1] = v4;
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionMagnet
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  uint64_t v17 = &unk_1F29F0620;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"clientname";
  objc_super v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
  v15[0] = v3;
  v14[1] = @"inputBytesPerSecond";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  v14[2] = @"packetsPerSecond";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  v14[3] = @"sessionId";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionMagnetOperation
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F29F0620;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"state";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"value";
  v11[0] = v4;
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v41[2] = *MEMORY[0x1E4F143B8];
  v40[0] = @"PairedDevices";
  uint64_t v37 = *MEMORY[0x1E4F92C50];
  uint64_t v2 = v37;
  uint64_t v35 = *MEMORY[0x1E4F92CD0];
  uint64_t v3 = v35;
  double v36 = &unk_1F29F0620;
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v39[0] = v26;
  uint64_t v38 = *MEMORY[0x1E4F92CA8];
  uint64_t v4 = v38;
  v33[0] = @"PairedDevicesName";
  double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v24 = objc_msgSend(v25, "commonTypeDict_StringFormat");
  v34[0] = v24;
  v33[1] = @"PairedDevicesDefaultName";
  int v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_StringFormat");
  v34[1] = v22;
  v33[2] = @"PairedDevicesMac";
  double v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v34[2] = v20;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
  v39[1] = v19;
  uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v37 count:2];
  v40[1] = @"DeviceState";
  v41[0] = v18;
  uint64_t v29 = v3;
  double v30 = &unk_1F29F0630;
  v31[0] = v2;
  uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  v31[1] = v4;
  v32[0] = v17;
  v27[0] = @"DevicePowered";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v16, "commonTypeDict_BoolFormat");
  v28[0] = v5;
  v27[1] = @"DeviceDiscoverable";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v28[1] = v7;
  v27[2] = @"DeviceConnectable";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v28[2] = v9;
  v27[3] = @"DeviceConnected";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v28[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:4];
  v32[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v41[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];

  return v14;
}

+ (id)entryEventBackwardDefinitions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 67109120;
    int v27 = [MEMORY[0x1E4F92A38] kPLWiFiClassOfDevice];
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Wifi/BT Chipset for Device is  = %d\n", buf, 8u);
  }

  if ([a1 shouldLogMarconi])
  {
    v24[0] = @"DetailedPowerProfileStats";
    uint64_t v4 = [a1 entryEventBackwardDefinitionDetailedPowerProfileStats];
    v25[0] = v4;
    v24[1] = @"HCITrace";
    int v5 = [a1 entryEventBackwardDefinitionHCITrace];
    v25[1] = v5;
    v24[2] = @"PowerProfileStats";
    uint64_t v6 = [a1 entryEventBackwardDefinitionPowerProfileStats];
    v25[2] = v6;
    v24[3] = @"BTWakeupVSE";
    uint64_t v7 = [a1 entryEventBackwardWakeupVSE];
    v25[3] = v7;
    v24[4] = @"WirelessProxScanDStats";
    v8 = [a1 entryEventBackwardDefinitionWirelessProxScanDStats];
    v25[4] = v8;
    v24[5] = @"CBDiscoveryStats";
    double v9 = [a1 entryEventBackwardDefinitionCBDiscoveryStats];
    v25[5] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:6];
LABEL_8:

    goto LABEL_9;
  }
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004007] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004010])
  {
    v22[0] = @"HFPPower";
    uint64_t v4 = [a1 entryEventBackwardDefinitionAHFPPower];
    v23[0] = v4;
    v22[1] = @"A2DPPower";
    int v5 = [a1 entryEventBackwardDefinitionA2DPPower];
    v23[1] = v5;
    v22[2] = @"HCITrace";
    uint64_t v6 = [a1 entryEventBackwardDefinitionHCITrace];
    v23[2] = v6;
    v22[3] = @"MaxDutyCycle";
    uint64_t v7 = [a1 entryEventBackwardDefinitionMaxDutyCycle];
    v23[3] = v7;
    v22[4] = @"PowerProfileStats";
    v8 = [a1 entryEventBackwardDefinitionPowerProfileStats];
    v23[4] = v8;
    v22[5] = @"WirelessProxScanDStats";
    double v9 = [a1 entryEventBackwardDefinitionWirelessProxScanDStats];
    v23[5] = v9;
    v22[6] = @"CBDiscoveryStats";
    uint64_t v11 = [a1 entryEventBackwardDefinitionCBDiscoveryStats];
    v23[6] = v11;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];

    goto LABEL_8;
  }
  if ([a1 shouldLogEnhancedStats])
  {
    v20[0] = @"PowerProfileStats";
    uint64_t v4 = [a1 entryEventBackwardDefinitionPowerProfileStats];
    v21[0] = v4;
    v20[1] = @"EnhancedPowerProfileStats";
    int v5 = [a1 entryEventBackwardDefinitionEnhancedPowerProfileStats];
    v21[1] = v5;
    v20[2] = @"ThreadRadioPowerProfileStats";
    uint64_t v6 = [a1 entryEventBackwardDefinitionThreadRadioPowerProfileStats];
    v21[2] = v6;
    v20[3] = @"HCITrace";
    uint64_t v7 = [a1 entryEventBackwardDefinitionHCITrace];
    v21[3] = v7;
    v20[4] = @"WirelessProxScanDStats";
    v8 = [a1 entryEventBackwardDefinitionWirelessProxScanDStats];
    v21[4] = v8;
    v20[5] = @"CBDiscoveryStats";
    uint64_t v17 = [a1 entryEventBackwardDefinitionCBDiscoveryStats];
    v21[5] = v17;
    v20[6] = @"A2DPPower";
    v13 = [a1 entryEventBackwardDefinitionA2DPPower];
    v21[6] = v13;
    v20[7] = @"HFPPower";
    uint64_t v14 = [a1 entryEventBackwardDefinitionAHFPPower];
    v21[7] = v14;
    v20[8] = @"BTWakeupVSE";
    double v15 = [a1 entryEventBackwardWakeupVSE];
    v21[8] = v15;
    v20[9] = @"MaxDutyCycle";
    uint64_t v16 = [a1 entryEventBackwardDefinitionMaxDutyCycle];
    v21[9] = v16;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:10];
  }
  else
  {
    v18[0] = @"HCITrace";
    uint64_t v4 = [a1 entryEventBackwardDefinitionHCITrace];
    v19[0] = v4;
    v18[1] = @"MaxDutyCycle";
    int v5 = [a1 entryEventBackwardDefinitionMaxDutyCycle];
    v19[1] = v5;
    void v18[2] = @"PowerProfileStats";
    uint64_t v6 = [a1 entryEventBackwardDefinitionPowerProfileStats];
    v19[2] = v6;
    v18[3] = @"WirelessProxScanDStats";
    uint64_t v7 = [a1 entryEventBackwardDefinitionWirelessProxScanDStats];
    void v19[3] = v7;
    v18[4] = @"CBDiscoveryStats";
    v8 = [a1 entryEventBackwardDefinitionCBDiscoveryStats];
    v19[4] = v8;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:5];
  }
LABEL_9:

  return v10;
}

+ (id)entryEventBackwardDefinitionAHFPPower
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0620;
  v20[1] = @"log";
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"HFPDuration";
  double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"HFPpercantageePA1";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v18[1] = v4;
  v17[2] = @"HFPpercentageiPA1";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v18[2] = v6;
  v17[3] = @"HFPpercantageePA2";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v18[3] = v8;
  v17[4] = @"HFPpercentageiPA2";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionA2DPPower
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F0620;
  v16[1] = @"log";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"A2DPDuration";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"A2DPpercantageePA";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  v13[2] = @"A2DPpercantageiPA";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventBackwardDefinitionDetailedPowerProfileStats
{
  void v40[2] = *MEMORY[0x1E4F143B8];
  v39[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v37[0] = *MEMORY[0x1E4F92CD0];
  v37[1] = v2;
  v38[0] = &unk_1F29F0620;
  v38[1] = @"log";
  double v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v40[0] = v34;
  v39[1] = *MEMORY[0x1E4F92CA8];
  v35[0] = @"durationTotal";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v36[0] = v32;
  v35[1] = @"durationActive";
  double v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v36[1] = v30;
  v35[2] = @"durationIdle";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v36[2] = v28;
  v35[3] = @"durationSleep";
  int v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v36[3] = v26;
  v35[4] = @"disableCounter";
  double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v36[4] = v24;
  v35[5] = @"iPATxBT";
  int v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v36[5] = v22;
  v35[6] = @"iPATxLE";
  double v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v36[6] = v20;
  v35[7] = @"ePATxBT";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v36[7] = v18;
  v35[8] = @"ePATxLE";
  uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v36[8] = v16;
  v35[9] = @"connectedRxBT";
  double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v36[9] = v14;
  v35[10] = @"connectedRxLE";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v36[10] = v4;
  v35[11] = @"scanRxBT";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v36[11] = v6;
  v35[12] = @"scanRxLE";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v36[12] = v8;
  v35[13] = @"totalPHYCal";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v36[13] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:14];
  v40[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionHCITrace
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    v13[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v11[0] = *MEMORY[0x1E4F92CD0];
    v11[1] = v2;
    v12[0] = &unk_1F29F0640;
    v12[1] = @"log";
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
    v14[0] = v3;
    v13[1] = *MEMORY[0x1E4F92CA8];
    double v9 = @"HCIRawData";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v5 = objc_msgSend(v4, "commonTypeDict_RawDataFormat");
    v10 = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v14[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventBackwardDefinitionMaxDutyCycle
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0620;
  v14[1] = @"log";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"Count";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"Duration";
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventBackwardDefinitionPowerProfileStats
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0630;
  v20[1] = @"log";
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"ErrorCode";
  double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"TXPower";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v18[1] = v4;
  void v17[2] = @"RXPower";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v18[2] = v6;
  v17[3] = @"SleepPower";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v18[3] = v8;
  v17[4] = @"OtherPower";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitionEnhancedPowerProfileStats
{
  v70[21] = *MEMORY[0x1E4F143B8];
  id v38 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v69[0] = @"ErrorCode";
  v55 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v54 = objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v70[0] = v54;
  v69[1] = @"TXPower";
  uint64_t v53 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v70[1] = v52;
  v69[2] = @"RXPower";
  BOOL v51 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v50 = objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v70[2] = v50;
  v69[3] = @"SleepPower";
  double v49 = [MEMORY[0x1E4F929D8] sharedInstance];
  unint64_t v48 = objc_msgSend(v49, "commonTypeDict_IntegerFormat");
  v70[3] = v48;
  v69[4] = @"OtherPower";
  double v47 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v46 = objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v70[4] = v46;
  v69[5] = @"iPACounter";
  unint64_t v45 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v44 = objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v70[5] = v44;
  v69[6] = @"ePACounter";
  v43 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v42 = objc_msgSend(v43, "commonTypeDict_IntegerFormat");
  v70[6] = v42;
  v69[7] = @"ActiveDuration";
  double v41 = [MEMORY[0x1E4F929D8] sharedInstance];
  v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
  v70[7] = v40;
  v69[8] = @"D3SuspendDuration";
  uint64_t v37 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v36 = objc_msgSend(v37, "commonTypeDict_IntegerFormat");
  v70[8] = v36;
  v69[9] = @"PerstDuration";
  uint64_t v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
  v70[9] = v34;
  v69[10] = @"DeepSleepDuration";
  uint64_t v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v70[10] = v32;
  v69[11] = @"L0Duration";
  double v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
  v70[11] = v30;
  v69[12] = @"L11Duration";
  uint64_t v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v70[12] = v28;
  v69[13] = @"L12Duration";
  int v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v70[13] = v26;
  v69[14] = @"L2Duration";
  double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v70[14] = v24;
  v69[15] = @"BTTimestamp";
  int v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v70[15] = v22;
  v69[16] = @"epaTransmitPercentage";
  double v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v2 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v70[16] = v2;
  v69[17] = @"txbfTransmitPercentage";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v70[17] = v4;
  v69[18] = @"txbfEpaTransmitPercentage";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v70[18] = v6;
  v69[19] = @"mrcReceivePercentage";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v70[19] = v8;
  v69[20] = @"lpScanReceivePercentage";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v70[20] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:v69 count:21];
  v39 = (void *)[v38 initWithDictionary:v11];

  uint64_t v12 = [a1 getScanCoreKeys];
  [v39 addEntriesFromDictionary:v12];

  v13 = [a1 getBluetooth5GKeys];
  [v39 addEntriesFromDictionary:v13];

  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v67[0] = *MEMORY[0x1E4F92C50];
    uint64_t v65 = *MEMORY[0x1E4F92CD0];
    double v66 = &unk_1F29F0650;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v67[1] = *MEMORY[0x1E4F92CA8];
    v68[0] = v14;
    v68[1] = v39;
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v68;
    uint64_t v17 = v67;
LABEL_4:
    uint64_t v18 = [v15 dictionaryWithObjects:v16 forKeys:v17 count:2];

    goto LABEL_5;
  }
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004015])
  {
    v63[0] = *MEMORY[0x1E4F92C50];
    uint64_t v61 = *MEMORY[0x1E4F92CD0];
    v62 = &unk_1F29F0660;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v63[1] = *MEMORY[0x1E4F92CA8];
    v64[0] = v14;
    v64[1] = v39;
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v64;
    uint64_t v17 = v63;
    goto LABEL_4;
  }
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004013] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004014])
  {
    v59[0] = *MEMORY[0x1E4F92C50];
    uint64_t v20 = *MEMORY[0x1E4F92CB0];
    v57[0] = *MEMORY[0x1E4F92CD0];
    v57[1] = v20;
    v58[0] = &unk_1F29F0670;
    v58[1] = @"log";
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
    v59[1] = *MEMORY[0x1E4F92CA8];
    v60[0] = v14;
    v60[1] = v39;
    double v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = v60;
    uint64_t v17 = v59;
    goto LABEL_4;
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F1CC08];
LABEL_5:

  return v18;
}

+ (id)getScanCoreKeys
{
  v15[5] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004015] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v14[0] = @"rxScanPercentage";
    v13 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
    v15[0] = v2;
    v14[1] = @"mainCoreELNAOnPercentage";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v15[1] = v4;
    void v14[2] = @"mainCoreELNAOffPercentage";
    int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v15[2] = v6;
    void v14[3] = @"scanCoreELNAOnPercentage";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v15[3] = v8;
    void v14[4] = @"scanCoreELNAOffPercentage";
    double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    void v15[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)getBluetooth5GKeys
{
  v21[8] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v20[0] = @"iPA5GCounter";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v21[0] = v18;
    v20[1] = @"ePA5GCounter";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v21[1] = v16;
    void v20[2] = @"txbf5GTransmitPercentage";
    double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    void v21[2] = v14;
    v20[3] = @"mrc5GReceivePercentage";
    v13 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v2 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
    v21[3] = v2;
    v20[4] = @"epa5GTransmitPercentage";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v21[4] = v4;
    v20[5] = @"txbf5GEpaTransmitPercentage";
    int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v21[5] = v6;
    v20[6] = @"Duration5GTx";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v21[6] = v8;
    v20[7] = @"Duration5GRx";
    double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v21[7] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:8];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionThreadRadioPowerProfileStats
{
  v26[6] = *MEMORY[0x1E4F143B8];
  id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v25[0] = @"ErrorCode";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v26[0] = v19;
  v25[1] = @"RadioTimestamp";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v2 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v26[1] = v2;
  v25[2] = @"m154TransmitPercentage";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v26[2] = v4;
  v25[3] = @"m154ReceivePercentage";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v26[3] = v6;
  v25[4] = @"iPAThreadCounter";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v26[4] = v8;
  v25[5] = @"ePAThreadCounter";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v26[5] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:6];
  uint64_t v18 = [v17 initWithDictionary:v11];

  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004016] & 1) != 0
    || [MEMORY[0x1E4F92A38] isWiFiClass:1004017])
  {
    v23[0] = *MEMORY[0x1E4F92C50];
    uint64_t v21 = *MEMORY[0x1E4F92CD0];
    uint64_t v22 = &unk_1F29F0620;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    v23[1] = *MEMORY[0x1E4F92CA8];
    v24[0] = v12;
    v13 = (void *)v18;
    v24[1] = v18;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
    v13 = (void *)v18;
  }

  return v14;
}

+ (id)entryEventBackwardWakeupVSE
{
  v29[2] = *MEMORY[0x1E4F143B8];
  v28[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v26[0] = *MEMORY[0x1E4F92CD0];
  v26[1] = v2;
  v27[0] = &unk_1F29F0680;
  v27[1] = @"log";
  uint64_t v3 = *MEMORY[0x1E4F92C58];
  v26[2] = *MEMORY[0x1E4F92C08];
  v26[3] = v3;
  v27[2] = MEMORY[0x1E4F1CC38];
  v27[3] = &unk_1F29ED7D8;
  int v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:4];
  v29[0] = v23;
  v28[1] = *MEMORY[0x1E4F92CA8];
  v24[0] = @"VSEType";
  uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v25[0] = v21;
  v24[1] = @"VSEReasonCode";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v25[1] = v19;
  void v24[2] = @"VSEReasonString";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v25[2] = v17;
  v24[3] = @"VSERaw";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v15 = objc_msgSend(v16, "commonTypeDict_RawDataFormat");
  v25[3] = v15;
  v24[4] = @"WakeEventType";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v25[4] = v5;
  v24[5] = @"BundleID";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v25[5] = v7;
  void v24[6] = @"DeviceName";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  void v25[6] = v9;
  v24[7] = @"PeerType";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v25[7] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];
  v29[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

  return v13;
}

+ (id)entryEventBackwardDefinitionWirelessProxScanDStats
{
  void v16[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F92D00];
  v15[0] = *MEMORY[0x1E4F92D10];
  v15[1] = v2;
  v16[0] = &unk_1F29E54B8;
  v16[1] = &unk_1F29E54D0;
  void v15[2] = *MEMORY[0x1E4F92D08];
  void v16[2] = &unk_1F29E54E8;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v4 = *MEMORY[0x1E4F92CB0];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v4;
  v12[0] = &unk_1F29F0690;
  v12[1] = @"log";
  int v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v5;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9[0] = @"ClientScanDuration";
  v9[1] = @"ClientAdvDuration";
  v10[0] = v3;
  v10[1] = v3;
  v9[2] = @"ClientScanConfig";
  void v10[2] = v3;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];
  v14[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventBackwardDefinitionCBDiscoveryStats
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0620;
  v24[1] = @"log";
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"apID";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v22[0] = v18;
  v21[1] = @"apIX";
  id v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v22[1] = v16;
  void v21[2] = @"sonC";
  double v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v22[2] = v14;
  v21[3] = @"sofC";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v22[3] = v4;
  v21[4] = @"sonD";
  int v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v22[4] = v6;
  v21[5] = @"sofD";
  uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"dsFl";
  double v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v22[6] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v29[1] = *MEMORY[0x1E4F143B8];
  uint64_t v28 = @"ConnectedDevices";
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F06A0;
  v25[1] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"Name";
  uint64_t v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  v23[0] = v19;
  v22[1] = @"MAC";
  uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"timestampEnd";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v23[2] = v15;
  v22[3] = @"DeviceType";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v23[3] = v3;
  void v22[4] = @"DefaultName";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[4] = v5;
  v22[5] = @"IsRequest";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v23[5] = v7;
  v22[6] = @"BundleID";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  v23[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v27[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v29[0] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];

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

- (PLBluetoothAgent)init
{
  v10.receiver = self;
  v10.super_class = (Class)PLBluetoothAgent;
  uint64_t v2 = [(PLAgent *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->session = 0;
    v2->localBluetoothDevice = 0;
    btHardwareChipset = v2->_btHardwareChipset;
    v2->_btHardwareChipset = 0;

    v3->_logCount = 0;
    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    ENScanCache = v3->_ENScanCache;
    v3->_ENScanCache = (NSMutableDictionary *)v5;

    uint64_t v7 = (SPBeaconManager *)objc_alloc_init(MEMORY[0x1E4F97C08]);
    beaconManager = v3->_beaconManager;
    v3->_beaconManager = v7;

    [(PLBluetoothAgent *)v3 attachSession];
  }
  return v3;
}

- (void)initOperatorDependancies
{
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke;
  v50[3] = &unk_1E692A0F0;
  v50[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v50];
  batteryLevelChanged = self->_batteryLevelChanged;
  self->_batteryLevelChanged = v3;

  if (([MEMORY[0x1E4F929C0] debugEnabled] & 1) != 0
    || [MEMORY[0x1E4F929C0] isDevBoard])
  {
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2;
    v49[3] = &unk_1E692A0F0;
    v49[4] = self;
    uint64_t v5 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v49];
    sbcChanged = self->_sbcChanged;
    self->_sbcChanged = v5;
  }
  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_416;
    v48[3] = &unk_1E692A6F8;
    v48[4] = self;
    v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29E9388 withBlock:v48];
    [(PLBluetoothAgent *)self setLeConnectionListener:v8];
  }
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_433;
    v47[3] = &unk_1E692A6F8;
    v47[4] = self;
    objc_super v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29E93B0 withBlock:v47];
    [(PLBluetoothAgent *)self setBtHCIListener:v10];
  }
  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_442;
  v46[3] = &unk_1E692A6F8;
  v46[4] = self;
  uint64_t v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29E93D8 withBlock:v46];
  [(PLBluetoothAgent *)self setWirelessProxListener:v12];
  id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_454;
  v45[3] = &unk_1E692A6F8;
  v45[4] = self;
  uint64_t v14 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F29E9400 withBlock:v45];
  [(PLBluetoothAgent *)self setCBDiscoveryListener:v14];
  id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_466;
  v44[3] = &unk_1E692A6F8;
  v44[4] = self;
  uint64_t v16 = (void *)[v15 initWithOperator:self withRegistration:&unk_1F29E9428 withBlock:v44];
  [(PLBluetoothAgent *)self setENListener:v16];

  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004007] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isWiFiClass:1004010] & 1) != 0
    || +[PLBluetoothAgent shouldLogEnhancedStats])
  {
    id v17 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_485;
    v43[3] = &unk_1E692A6F8;
    v43[4] = self;
    uint64_t v18 = (void *)[v17 initWithOperator:self withRegistration:&unk_1F29E9450 withBlock:v43];
    [(PLBluetoothAgent *)self setBtA2DPListener:v18];
    id v19 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_494;
    v42[3] = &unk_1E692A6F8;
    v42[4] = self;
    uint64_t v20 = (void *)[v19 initWithOperator:self withRegistration:&unk_1F29E9478 withBlock:v42];
    [(PLBluetoothAgent *)self setBtHFPListener:v20];
  }
  if (+[PLBluetoothAgent shouldLogMarconi]
    || +[PLBluetoothAgent shouldLogEnhancedStats])
  {
    id v21 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_503;
    v41[3] = &unk_1E692A6F8;
    void v41[4] = self;
    uint64_t v22 = (void *)[v21 initWithOperator:self withRegistration:&unk_1F29E94A0 withBlock:v41];
    [(PLBluetoothAgent *)self setBtHCIVSEListener:v22];
  }
  dispatch_time_t v23 = dispatch_time(0, 2000000000);
  double v24 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_505;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_after(v23, v24, block);

  double v25 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  v26 = [MEMORY[0x1E4F92900] sharedInstance];
  [v26 createDistributionEventForwardWithDistributionID:47 withChildNodeNameToWeight:&unk_1F29E94C8 withStartDate:v25];

  if ([MEMORY[0x1E4F92A38] isiPhone])
  {
    int v27 = [MEMORY[0x1E4F92900] sharedInstance];
    [v27 createDistributionEventForwardWithDistributionID:45 withChildNodeNameToWeight:&unk_1F29E94F0 withStartDate:v25];
  }
  id v28 = objc_alloc(MEMORY[0x1E4F92A28]);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  void v39[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_526;
  v39[3] = &unk_1E692A0F0;
  v39[4] = self;
  uint64_t v29 = (PLNSNotificationOperatorComposition *)[v28 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v39];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v29;

  id v31 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  void v38[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_534;
  v38[3] = &unk_1E692A6F8;
  v38[4] = self;
  double v32 = (PLXPCListenerOperatorComposition *)[v31 initWithOperator:self withRegistration:&unk_1F29E9518 withBlock:v38];
  magnetListener = self->_magnetListener;
  self->_magnetListener = v32;

  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    id v34 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    void v37[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_546;
    v37[3] = &unk_1E692A6F8;
    v37[4] = self;
    uint64_t v35 = (PLXPCListenerOperatorComposition *)[v34 initWithOperator:self withRegistration:&unk_1F29E9540 withBlock:v37];
    magnetOperationListener = self->_magnetOperationListener;
    self->_magnetOperationListener = v35;
  }
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) logwithBTOnCheck];
  uint64_t v2 = [*(id *)(a1 + 32) ENScanCache];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v4 ENScanCache];
    [v4 logEventBackwardMaxDutyCycle:v5];

    id v6 = [*(id *)(a1 + 32) ENScanCache];
    [v6 removeAllObjects];
  }
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logwithBTOnCheck];
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_416(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_417;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57F90 != -1) {
      dispatch_once(&qword_1EBD57F90, &block);
    }
    if (_MergedGlobals_1_21)
    {
      v8 = [NSString stringWithFormat:@"got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:761];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalLeConnectedDevices:v6 withRequest:0];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_21 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_433(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_434;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57F98 != -1) {
      dispatch_once(&qword_1EBD57F98, &block);
    }
    if (byte_1EBD57F41)
    {
      v8 = [NSString stringWithFormat:@"got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:773];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalHCIRawData:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_434(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F41 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_442(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_443;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FA0 != -1) {
      dispatch_once(&qword_1EBD57FA0, &block);
    }
    if (byte_1EBD57F42)
    {
      v8 = [NSString stringWithFormat:@"WirelessProximityListener got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:783];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventBackwardWirelessProximity:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_443(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F42 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_454(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_455;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FA8 != -1) {
      dispatch_once(&qword_1EBD57FA8, &block);
    }
    if (byte_1EBD57F43)
    {
      v8 = [NSString stringWithFormat:@"CBDiscoveryScanListener got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:792];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventBackwardCBDiscovery:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_455(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F43 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_466(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_467;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD57FB0 != -1) {
      dispatch_once(&qword_1EBD57FB0, block);
    }
    if (byte_1EBD57F44)
    {
      v8 = [NSString stringWithFormat:@"EN BT Status Listener got callback! %@", v6];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:800];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v37 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"CTScanCount"];
  uint64_t v15 = [*(id *)(a1 + 32) ENScanCache];
  [v15 setObject:v14 forKeyedSubscript:@"Count"];

  uint64_t v16 = [v6 objectForKeyedSubscript:@"CTScanDuration"];
  id v17 = [*(id *)(a1 + 32) ENScanCache];
  [v17 setObject:v16 forKeyedSubscript:@"Duration"];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v18 = objc_opt_class();
    uint64_t v30 = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    double v32 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_473;
    uint64_t v33 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v34 = v18;
    if (qword_1EBD57FB8 != -1) {
      dispatch_once(&qword_1EBD57FB8, &v30);
    }
    if (byte_1EBD57F45)
    {
      id v19 = NSString;
      uint64_t v20 = [*(id *)(a1 + 32) ENScanCache];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"Count"];
      uint64_t v22 = [*(id *)(a1 + 32) ENScanCache];
      dispatch_time_t v23 = [v22 objectForKeyedSubscript:@"Duration"];
      double v24 = [v19 stringWithFormat:@"Updated Cache to %@ %@!", v21, v23, v30, v31, v32, v33, v34];

      double v25 = (void *)MEMORY[0x1E4F929B8];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      int v27 = [v26 lastPathComponent];
      id v28 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke_2"];
      [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:803];

      uint64_t v29 = PLLogCommon();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v37 = v24;
        _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_467(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F44 = result;
  return result;
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_473(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F45 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_485(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_486;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FC0 != -1) {
      dispatch_once(&qword_1EBD57FC0, &block);
    }
    if (byte_1EBD57F46)
    {
      v8 = [NSString stringWithFormat:@"got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:812];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventBackwardA2DP:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_486(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F46 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_495;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FC8 != -1) {
      dispatch_once(&qword_1EBD57FC8, &block);
    }
    if (byte_1EBD57F47)
    {
      v8 = [NSString stringWithFormat:@"got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:820];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventBackwardHFP:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_495(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F47 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_503(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_504;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FD0 != -1) {
      dispatch_once(&qword_1EBD57FD0, &block);
    }
    if (byte_1EBD57F48)
    {
      v8 = [NSString stringWithFormat:@"got callback! %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:830];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventIntervalWakeVSE:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_504(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F48 = result;
  return result;
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_505(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isConnected];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 logEventIntervalConnectedDevices];
  }
  return result;
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F49 = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_535;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FE0 != -1) {
      dispatch_once(&qword_1EBD57FE0, &block);
    }
    if (byte_1EBD57F4A)
    {
      v8 = [NSString stringWithFormat:@"Magnet Listener Payload %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:871];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMagnet:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_535(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4A = result;
  return result;
}

void __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_546(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_547;
    id v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD57FE8 != -1) {
      dispatch_once(&qword_1EBD57FE8, &block);
    }
    if (byte_1EBD57F4B)
    {
      v8 = [NSString stringWithFormat:@"Magnet Operation Listener Payload %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:880];

      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventPointMagnetOperation:v6];
}

uint64_t __44__PLBluetoothAgent_initOperatorDependancies__block_invoke_2_547(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4B = result;
  return result;
}

- (void)logEventPointMagnet:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Magnet"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointMagnetOperation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MagnetOperation"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->keepSessionAlive = 0;
  if (self->session)
  {
    uint64_t v3 = BTSessionDetachWithQueue();
    if (v3)
    {
      uint64_t v4 = v3;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v5 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __27__PLBluetoothAgent_dealloc__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v5;
        if (qword_1EBD57FF0 != -1) {
          dispatch_once(&qword_1EBD57FF0, block);
        }
        if (byte_1EBD57F4C)
        {
          id v6 = objc_msgSend(NSString, "stringWithFormat:", @"Could not detach the Bluetooth session. (error: %d)", v4);
          id v7 = (void *)MEMORY[0x1E4F929B8];
          v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          id v9 = [v8 lastPathComponent];
          objc_super v10 = [NSString stringWithUTF8String:"-[PLBluetoothAgent dealloc]"];
          [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:916];

          id v11 = PLLogCommon();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v15 = v6;
            _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLBluetoothAgent;
  [(PLAgent *)&v12 dealloc];
}

uint64_t __27__PLBluetoothAgent_dealloc__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4C = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_localBluetoothDevice__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4D = result;
  return result;
}

- (BOOL)bluetoothPresent
{
  return [(PLBluetoothAgent *)self localBluetoothDevice] != 0;
}

- (BOOL)modulePowered
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v13 = 0;
  [(PLBluetoothAgent *)self localBluetoothDevice];
  uint64_t ModulePower = BTLocalDeviceGetModulePower();
  if (ModulePower)
  {
    uint64_t v3 = ModulePower;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_modulePowered__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD58000 != -1) {
        dispatch_once(&qword_1EBD58000, block);
      }
      if (byte_1EBD57F4E)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetModulePower: failed! %d\n", v3);
        id v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modulePowered]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:959];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v15 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v13 == -1;
}

uint64_t __33__PLBluetoothAgent_modulePowered__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4E = result;
  return result;
}

- (BOOL)isDiscoverable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v13 = 0;
  [(PLBluetoothAgent *)self localBluetoothDevice];
  uint64_t Discoverable = BTLocalDeviceGetDiscoverable();
  if (Discoverable)
  {
    uint64_t v3 = Discoverable;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __34__PLBluetoothAgent_isDiscoverable__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD58008 != -1) {
        dispatch_once(&qword_1EBD58008, block);
      }
      if (byte_1EBD57F4F)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetDiscoverable: failed! %d\n", v3);
        id v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent isDiscoverable]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:975];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v15 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v13 == -1;
}

uint64_t __34__PLBluetoothAgent_isDiscoverable__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F4F = result;
  return result;
}

- (BOOL)isConnected
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v13 = 0;
  [(PLBluetoothAgent *)self localBluetoothDevice];
  uint64_t ConnectionStatus = BTLocalDeviceGetConnectionStatus();
  if (ConnectionStatus)
  {
    uint64_t v3 = ConnectionStatus;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__PLBluetoothAgent_isConnected__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD58010 != -1) {
        dispatch_once(&qword_1EBD58010, block);
      }
      if (byte_1EBD57F50)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetConnectionStatus: failed! %d\n", v3);
        id v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent isConnected]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:995];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v15 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v13 == -1;
}

uint64_t __31__PLBluetoothAgent_isConnected__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F50 = result;
  return result;
}

- (BOOL)isConnectable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v13 = 0;
  [(PLBluetoothAgent *)self localBluetoothDevice];
  uint64_t Connectable = BTLocalDeviceGetConnectable();
  if (Connectable)
  {
    uint64_t v3 = Connectable;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_isConnectable__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD58018 != -1) {
        dispatch_once(&qword_1EBD58018, block);
      }
      if (byte_1EBD57F51)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetConnectable: failed! %d\n", v3);
        id v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent isConnectable]"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1018];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v15 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  return v13 == -1;
}

uint64_t __33__PLBluetoothAgent_isConnectable__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F51 = result;
  return result;
}

- (void)attachSession
{
  uint64_t v3 = [(PLOperator *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PLBluetoothAgent_attachSession__block_invoke;
  block[3] = &unk_1E692A250;
  block[4] = self;
  dispatch_async(v3, block);
}

void __33__PLBluetoothAgent_attachSession__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  if (!*(void *)(*(void *)(a1 + 32) + 56))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v2 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLBluetoothAgent_attachSession__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v2;
      if (qword_1EBD58020 != -1) {
        dispatch_once(&qword_1EBD58020, block);
      }
      if (byte_1EBD57F52)
      {
        uint64_t v3 = [NSString stringWithFormat:@"Attempting to attach to session"];
        uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        id v6 = [v5 lastPathComponent];
        id v7 = [NSString stringWithUTF8String:"-[PLBluetoothAgent attachSession]_block_invoke"];
        [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1038];

        v8 = PLLogCommon();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v26 = v3;
          _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v9 = NSString;
    objc_super v10 = [MEMORY[0x1E4F28B50] mainBundle];
    id v11 = [v10 bundleIdentifier];
    objc_super v12 = [v9 stringWithFormat:@"PowerLogV2-%@-%u", v11, getpid()];

    id v13 = v12;
    [v13 cStringUsingEncoding:4];
    uint64_t v14 = [*(id *)(a1 + 32) workQueue];
    uint64_t v15 = BTSessionAttachWithQueue();

    if (v15 && [MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __33__PLBluetoothAgent_attachSession__block_invoke_581;
      v23[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v23[4] = v16;
      if (qword_1EBD58028 != -1) {
        dispatch_once(&qword_1EBD58028, v23);
      }
      if (byte_1EBD57F53)
      {
        id v17 = objc_msgSend(NSString, "stringWithFormat:", @"ERROR: Could not attach the Bluetooth session. (error: %d)", v15);
        uint64_t v18 = (void *)MEMORY[0x1E4F929B8];
        id v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        uint64_t v20 = [v19 lastPathComponent];
        uint64_t v21 = [NSString stringWithUTF8String:"-[PLBluetoothAgent attachSession]_block_invoke_2"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:1043];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v26 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __33__PLBluetoothAgent_attachSession__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F52 = result;
  return result;
}

uint64_t __33__PLBluetoothAgent_attachSession__block_invoke_581(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F53 = result;
  return result;
}

- (void)sessionAttached:(BTSessionImpl *)a3 withResult:(int)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v27 = xmmword_1F29472A8;
  uint64_t v28 = qword_1F29472B8;
  if (a4)
  {
    uint64_t v5 = *(void *)&a4;
    if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", a3))
    {
      uint64_t v6 = objc_opt_class();
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      void v26[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void v26[4] = v6;
      if (qword_1EBD58030 != -1) {
        dispatch_once(&qword_1EBD58030, v26);
      }
      if (byte_1EBD57F54)
      {
        id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Could not attach session. (error: %d)", v5);
        v8 = (void *)MEMORY[0x1E4F929B8];
        id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        objc_super v10 = [v9 lastPathComponent];
        id v11 = [NSString stringWithUTF8String:"-[PLBluetoothAgent sessionAttached:withResult:]"];
        [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1055];

        objc_super v12 = PLLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v30 = v7;
          _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (self->session != a3) {
      self->session = a3;
    }
    [(PLBluetoothAgent *)self localBluetoothDevice];
    uint64_t v13 = BTLocalDeviceAddCallbacks();
    if (v13)
    {
      uint64_t v14 = v13;
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v15 = objc_opt_class();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_591;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v15;
        if (qword_1EBD58038 != -1) {
          dispatch_once(&qword_1EBD58038, v25);
        }
        if (byte_1EBD57F55)
        {
          uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"Could not add local device callbacks. (error: %d)", v14);
          id v17 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          id v19 = [v18 lastPathComponent];
          uint64_t v20 = [NSString stringWithUTF8String:"-[PLBluetoothAgent sessionAttached:withResult:]"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1065];

          uint64_t v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v30 = v16;
            _os_log_debug_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    dispatch_time_t v22 = dispatch_time(0, 2000000000);
    dispatch_time_t v23 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_595;
    block[3] = &unk_1E692A250;
    block[4] = self;
    dispatch_after(v22, v23, block);
  }
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F54 = result;
  return result;
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_591(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F55 = result;
  return result;
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_595(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  void block[5] = 0;
  [*(id *)(a1 + 32) localBluetoothDevice];
  uint64_t v2 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if (v2)
  {
    uint64_t v3 = v2;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD58040 != -1) {
        dispatch_once(&qword_1EBD58040, block);
      }
      if (byte_1EBD57F56)
      {
        uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Could not register for Power notifications. (error: %d)", v3);
        uint64_t v6 = (void *)MEMORY[0x1E4F929B8];
        id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        v8 = [v7 lastPathComponent];
        id v9 = [NSString stringWithUTF8String:"-[PLBluetoothAgent sessionAttached:withResult:]_block_invoke"];
        [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:1075];

        objc_super v10 = PLLogCommon();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v16 = v5;
          _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  objc_super v12 = *(void **)(v11 + 176);
  *(void *)(v11 + 176) = 0;

  return [*(id *)(a1 + 32) log];
}

uint64_t __47__PLBluetoothAgent_sessionAttached_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F56 = result;
  return result;
}

- (void)sessionTerminated:(BTSessionImpl *)a3 withResult:(int)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  self->session = 0;
  self->localBluetoothDevice = 0;
  if (self->keepSessionAlive)
  {
    if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", a3, *(void *)&a4))
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD58048 != -1) {
        dispatch_once(&qword_1EBD58048, block);
      }
      if (byte_1EBD57F57)
      {
        uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Connection to bluetoothd lost - attempting a reconnect in %d seconds", 30);
        id v7 = (void *)MEMORY[0x1E4F929B8];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        id v9 = [v8 lastPathComponent];
        objc_super v10 = [NSString stringWithUTF8String:"-[PLBluetoothAgent sessionTerminated:withResult:]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:1093];

        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(location[0]) = 138412290;
          *(id *)((char *)location + 4) = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)location, 0xCu);
        }
      }
    }
    objc_initWeak(location, self);
    id v12 = objc_alloc(MEMORY[0x1E4F92A80]);
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:30.0];
    uint64_t v14 = [(PLOperator *)self workQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke_603;
    void v16[3] = &unk_1E692AC18;
    objc_copyWeak(&v17, location);
    uint64_t v15 = (void *)[v12 initWithFireDate:v13 withInterval:0 withTolerance:0 repeats:v14 withUserInfo:v16 withQueue:0.0 withBlock:0.0];

    [v15 arm];
    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }
}

uint64_t __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F57 = result;
  return result;
}

void __49__PLBluetoothAgent_sessionTerminated_withResult___block_invoke_603(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained attachSession];
}

- (void)bluetoothSessionEvent:(int)a3 onSession:(BTSessionImpl *)a4 withResult:(int)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    [(PLBluetoothAgent *)self sessionTerminated:a4 withResult:*(void *)&a5];
  }
  else
  {
    uint64_t v5 = *(void *)&a3;
    if (a3)
    {
      if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", *(void *)&a3, a4, *(void *)&a5))
      {
        uint64_t v6 = objc_opt_class();
        uint64_t block = MEMORY[0x1E4F143A8];
        uint64_t v14 = 3221225472;
        uint64_t v15 = __63__PLBluetoothAgent_bluetoothSessionEvent_onSession_withResult___block_invoke;
        uint64_t v16 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v17 = v6;
        if (qword_1EBD58050 != -1) {
          dispatch_once(&qword_1EBD58050, &block);
        }
        if (byte_1EBD57F58)
        {
          id v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unexpected Bluetooth session event. (event: %d)", v5, block, v14, v15, v16, v17);
          v8 = (void *)MEMORY[0x1E4F929B8];
          id v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          objc_super v10 = [v9 lastPathComponent];
          uint64_t v11 = [NSString stringWithUTF8String:"-[PLBluetoothAgent bluetoothSessionEvent:onSession:withResult:]"];
          [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1117];

          id v12 = PLLogCommon();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            id v19 = v7;
            _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      [(PLBluetoothAgent *)self sessionAttached:a4 withResult:*(void *)&a5];
    }
  }
}

uint64_t __63__PLBluetoothAgent_bluetoothSessionEvent_onSession_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F58 = result;
  return result;
}

- (void)bluetoothDeviceEvent:(int)a3 onDevice:(BTLocalDeviceImpl *)a4 withResult:(int)a5
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", *(void *)&a3, a4, *(void *)&a5))
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v7;
    if (qword_1EBD58058 != -1) {
      dispatch_once(&qword_1EBD58058, block);
    }
    if (byte_1EBD57F59)
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth callback code: %u", v5);
      id v9 = (void *)MEMORY[0x1E4F929B8];
      objc_super v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:1122];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v40 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v5 >= 4)
  {
    if (v5 == 4)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v21 = objc_opt_class();
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        void v37[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_613;
        v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v37[4] = v21;
        if (qword_1EBD58060 != -1) {
          dispatch_once(&qword_1EBD58060, v37);
        }
        if (byte_1EBD57F5A)
        {
          dispatch_time_t v22 = [NSString stringWithFormat:@"Pairing status changed"];
          dispatch_time_t v23 = (void *)MEMORY[0x1E4F929B8];
          double v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          double v25 = [v24 lastPathComponent];
          v26 = [NSString stringWithUTF8String:"-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]"];
          [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:1134];

          long long v27 = PLLogCommon();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v40 = v22;
            _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      if ([MEMORY[0x1E4F929C0] fullMode]) {
        [(PLBluetoothAgent *)self logEventForwardPairedDevices];
      }
    }
    else if (v5 == 5)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v14 = objc_opt_class();
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_619;
        v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v36[4] = v14;
        if (qword_1EBD58068 != -1) {
          dispatch_once(&qword_1EBD58068, v36);
        }
        if (byte_1EBD57F5B)
        {
          uint64_t v15 = [NSString stringWithFormat:@"Connection status changed"];
          uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          uint64_t v18 = [v17 lastPathComponent];
          id v19 = [NSString stringWithUTF8String:"-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]"];
          [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:1140];

          uint64_t v20 = PLLogCommon();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            v40 = v15;
            _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      if ([MEMORY[0x1E4F929C0] fullMode]) {
        [(PLBluetoothAgent *)self logEventIntervalConnectedDevices];
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v28 = objc_opt_class();
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_625;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = v28;
      if (qword_1EBD58070 != -1) {
        dispatch_once(&qword_1EBD58070, v35);
      }
      if (byte_1EBD57F5C)
      {
        uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"WARNING: Unwanted event code for bluetooth callback: %u", v5);
        uint64_t v30 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v31 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        double v32 = [v31 lastPathComponent];
        uint64_t v33 = [NSString stringWithUTF8String:"-[PLBluetoothAgent bluetoothDeviceEvent:onDevice:withResult:]"];
        [v30 logMessage:v29 fromFile:v32 fromFunction:v33 fromLineNumber:1146];

        uint64_t v34 = PLLogCommon();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v40 = v29;
          _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    [(PLBluetoothAgent *)self logEventForwardDeviceState];
  }
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F59 = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_613(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5A = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_619(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5B = result;
  return result;
}

uint64_t __61__PLBluetoothAgent_bluetoothDeviceEvent_onDevice_withResult___block_invoke_625(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5C = result;
  return result;
}

- (void)log
{
  if ([(PLBluetoothAgent *)self modulePowered])
  {
    if (!self->_lastPowerEntryDate
      || ([MEMORY[0x1E4F1C9C8] monotonicDate],
          uint64_t v3 = objc_claimAutoreleasedReturnValue(),
          [v3 timeIntervalSinceDate:self->_lastPowerEntryDate],
          double v5 = v4,
          v3,
          v5 > 60.0))
    {
      [(PLBluetoothAgent *)self logEventBackwardPowerProfileStats];
    }
  }
  [(PLBluetoothAgent *)self logEventForwardDeviceState];
}

- (void)logwithBTOnCheck
{
  if ([(PLBluetoothAgent *)self modulePowered])
  {
    [(PLBluetoothAgent *)self log];
  }
  else
  {
    [(PLBluetoothAgent *)self modelBluetoothOffPower];
  }
}

- (void)logEventForwardDeviceState
{
  id v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DeviceState"];
  BOOL v3 = [(PLBluetoothAgent *)self modulePowered];
  BOOL v4 = [(PLBluetoothAgent *)self isDiscoverable];
  BOOL v5 = [(PLBluetoothAgent *)self isConnected];
  BOOL v6 = [(PLBluetoothAgent *)self isConnectable];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  v8 = [NSNumber numberWithBool:v3];
  [v7 setObject:v8 forKeyedSubscript:@"DevicePowered"];

  id v9 = [NSNumber numberWithBool:v4];
  [v7 setObject:v9 forKeyedSubscript:@"DeviceDiscoverable"];

  objc_super v10 = [NSNumber numberWithBool:v5];
  [v7 setObject:v10 forKeyedSubscript:@"DeviceConnected"];

  uint64_t v11 = [NSNumber numberWithBool:v6];
  [v7 setObject:v11 forKeyedSubscript:@"DeviceConnectable"];

  [(PLOperator *)self logEntry:v7];
}

- (void)logEventForwardPairedDevices
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  unint64_t v60 = 0;
  long long v61 = 0u;
  long long v62 = 0u;
  BOOL v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLBluetoothAgent *)self localBluetoothDevice];
  uint64_t PairedDevices = BTLocalDeviceGetPairedDevices();
  unint64_t v5 = 0x1E4F92000uLL;
  BOOL v6 = (void *)MEMORY[0x1E4F92D30];
  unint64_t v7 = 0x1E4F92000uLL;
  double v52 = v3;
  if (PairedDevices)
  {
    uint64_t v8 = PairedDevices;
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_29;
    }
    uint64_t v9 = objc_opt_class();
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    void v59[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke;
    v59[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v59[4] = v9;
    if (qword_1EBD58078 != -1) {
      dispatch_once(&qword_1EBD58078, v59);
    }
    if (!byte_1EBD57F5D) {
      goto LABEL_29;
    }
    objc_super v10 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetPairedDevices: failed! %d\n", v8);
    uint64_t v11 = (void *)MEMORY[0x1E4F929B8];
    id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
    uint64_t v13 = [v12 lastPathComponent];
    uint64_t v14 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventForwardPairedDevices]"];
    [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:1260];

    uint64_t v15 = PLLogCommon();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v96) = 138412290;
      *(void *)((char *)&v96 + 4) = v10;
      _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v96, 0xCu);
    }

    BOOL v3 = v52;
    unint64_t v7 = 0x1E4F92000uLL;
    BOOL v6 = (void *)MEMORY[0x1E4F92D30];
LABEL_28:
    unint64_t v5 = 0x1E4F92000uLL;
LABEL_29:
    if ([*(id *)(v5 + 2496) debugEnabled])
    {
      uint64_t v39 = objc_opt_class();
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_647;
      v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v55[4] = v39;
      if (qword_1EBD58090 != -1) {
        dispatch_once(&qword_1EBD58090, v55);
      }
      if (byte_1EBD57F60)
      {
        unint64_t v40 = v7;
        uint64_t v41 = [NSString stringWithFormat:@"No BT paired device, nothing to log"];
        uint64_t v42 = (void *)MEMORY[0x1E4F929B8];
        v43 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        double v44 = [v43 lastPathComponent];
        unint64_t v45 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventForwardPairedDevices]"];
        [v42 logMessage:v41 fromFile:v44 fromFunction:v45 fromLineNumber:1289];

        uint64_t v46 = PLLogCommon();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(v96) = 138412290;
          *(void *)((char *)&v96 + 4) = v41;
          _os_log_debug_impl(&dword_1D2690000, v46, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v96, 0xCu);
        }

        BOOL v3 = v52;
        unint64_t v7 = v40;
        BOOL v6 = (void *)MEMORY[0x1E4F92D30];
      }
    }
    double v47 = +[PLOperator entryKeyForType:*v6 andName:@"PairedDevices"];
    unint64_t v48 = (void *)[objc_alloc(*(Class *)(v7 + 2512)) initWithEntryKey:v47];
    [v48 setIsErrorEntry:1];
    [v48 setObject:@"No BT paired device, nothing to log", @"__PLEntryErrorString__" forKeyedSubscript];
    [(PLOperator *)self logEntry:v48];

    goto LABEL_37;
  }
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  memset(v79, 0, sizeof(v79));
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v65 = 0u;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    void v58[2] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_635;
    v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v58[4] = v17;
    if (qword_1EBD58080 != -1) {
      dispatch_once(&qword_1EBD58080, v58);
    }
    if (byte_1EBD57F5E)
    {
      uint64_t v18 = [NSString stringWithFormat:@"Bluetooth: No devices paired"];
      id v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      uint64_t v21 = [v20 lastPathComponent];
      dispatch_time_t v22 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventForwardPairedDevices]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1266];

      dispatch_time_t v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        v64 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      BOOL v3 = v52;
      unint64_t v7 = 0x1E4F92000;
      BOOL v6 = (void *)MEMORY[0x1E4F92D30];
    }
  }
  if (!v60) {
    goto LABEL_28;
  }
  BOOL v51 = &v49;
  unint64_t v24 = 0;
  uint64_t v25 = *v6;
  uint64_t v53 = v57;
  uint64_t v54 = v25;
  *(void *)&long long v16 = 138412290;
  long long v50 = v16;
  do
  {
    BTDeviceGetAddressString();
    BTDeviceGetDefaultName();
    BTDeviceGetName();
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v26 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      v57[0] = __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_641;
      v57[1] = &__block_descriptor_40_e5_v8__0lu32l8;
      void v57[2] = v26;
      if (qword_1EBD58088 != -1) {
        dispatch_once(&qword_1EBD58088, block);
      }
      if (byte_1EBD57F5F)
      {
        long long v27 = self;
        uint64_t v28 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth: Local device is paired to device : \"%s\" (%s) with mac : %s\n", &v96, &v80, &v65);
        uint64_t v29 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        uint64_t v31 = [v30 lastPathComponent];
        double v32 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventForwardPairedDevices]"];
        [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:1273];

        uint64_t v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = v50;
          v64 = v28;
          _os_log_debug_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        self = v27;
        BOOL v3 = v52;
        unint64_t v7 = 0x1E4F92000uLL;
      }
    }
    uint64_t v34 = +[PLOperator entryKeyForType:v54 andName:@"PairedDevices"];
    uint64_t v35 = (void *)[objc_alloc(*(Class *)(v7 + 2512)) initWithEntryKey:v34];
    double v36 = [NSString stringWithUTF8String:&v80];
    [v35 setObject:v36 forKeyedSubscript:@"PairedDevicesDefaultName"];

    uint64_t v37 = [NSString stringWithUTF8String:&v96];
    [v35 setObject:v37 forKeyedSubscript:@"PairedDevicesName"];

    uint64_t v38 = [NSString stringWithUTF8String:&v65];
    [v35 setObject:v38 forKeyedSubscript:@"PairedDevicesMac"];

    [v35 setEntryDate:v3];
    [(PLOperator *)self logEntry:v35];
    long long v65 = 0uLL;
    *(void *)&long long v66 = 0;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;

    ++v24;
  }
  while (v24 < v60);
  BOOL v6 = (void *)MEMORY[0x1E4F92D30];
  unint64_t v5 = 0x1E4F92000;
  if (!v60) {
    goto LABEL_29;
  }
LABEL_37:
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5D = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_635(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5E = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_641(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F5F = result;
  return result;
}

uint64_t __48__PLBluetoothAgent_logEventForwardPairedDevices__block_invoke_647(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F60 = result;
  return result;
}

- (void)logEventIntervalLeConnectedDevices:(id)a3 withRequest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ConnectedDevices"];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  uint64_t v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v8 setEntryDate:v9];

  objc_super v10 = [NSNumber numberWithBool:v4];
  [v8 setObject:v10 forKeyedSubscript:@"IsRequest"];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"PeerType"];
  id v12 = v11;
  if (!v11) {
    goto LABEL_5;
  }
  int v13 = [v11 intValue];
  if (v13 == 2)
  {
    uint64_t v14 = NSNumber;
    uint64_t v15 = 42;
    goto LABEL_7;
  }
  if (v13 != 1)
  {
LABEL_5:
    long long v16 = [NSNumber numberWithInt:48];
    [v8 setObject:v16 forKeyedSubscript:@"DeviceType"];

    goto LABEL_8;
  }
  uint64_t v14 = NSNumber;
  uint64_t v15 = 12;
LABEL_7:
  uint64_t v17 = [v14 numberWithInt:v15];
  [v8 setObject:v17 forKeyedSubscript:@"DeviceType"];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"IsRequest"];
LABEL_8:
  uint64_t v18 = [v6 objectForKeyedSubscript:@"Connect"];
  id v19 = [NSNumber numberWithBool:0];
  int v20 = [v18 isEqual:v19];

  int v21 = [MEMORY[0x1E4F929C0] debugEnabled];
  if (v20)
  {
    if (v21)
    {
      uint64_t v22 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v22;
      if (qword_1EBD58098 != -1) {
        dispatch_once(&qword_1EBD58098, block);
      }
      if (byte_1EBD57F61)
      {
        dispatch_time_t v23 = [NSString stringWithFormat:@"BTLE disconnect"];
        unint64_t v24 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        uint64_t v26 = [v25 lastPathComponent];
        long long v27 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalLeConnectedDevices:withRequest:]"];
        [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:1336];

        uint64_t v28 = PLLogCommon();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v46 = v23;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v29 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v8 setObject:v29 forKeyedSubscript:@"timestampEnd"];
  }
  else
  {
    if (v21)
    {
      uint64_t v30 = objc_opt_class();
      uint64_t v39 = MEMORY[0x1E4F143A8];
      uint64_t v40 = 3221225472;
      uint64_t v41 = __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke_662;
      uint64_t v42 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v43 = v30;
      if (qword_1EBD580A0 != -1) {
        dispatch_once(&qword_1EBD580A0, &v39);
      }
      if (byte_1EBD57F62)
      {
        uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"BTLE connect", v39, v40, v41, v42, v43);
        double v32 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v33 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        uint64_t v34 = [v33 lastPathComponent];
        uint64_t v35 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalLeConnectedDevices:withRequest:]"];
        [v32 logMessage:v31 fromFile:v34 fromFunction:v35 fromLineNumber:1340];

        double v36 = PLLogCommon();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v46 = v31;
          _os_log_debug_impl(&dword_1D2690000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, @"timestampEnd", v39, v40, v41, v42, v43);
  }
  uint64_t v37 = [v6 objectForKeyedSubscript:@"CBUUID"];
  [v8 setObject:v37 forKeyedSubscript:@"Name"];

  uint64_t v38 = [v6 objectForKeyedSubscript:@"BundleID"];
  [v8 setObject:v38 forKeyedSubscript:@"BundleID"];

  [(PLOperator *)self logEntry:v8];
}

uint64_t __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F61 = result;
  return result;
}

uint64_t __67__PLBluetoothAgent_logEventIntervalLeConnectedDevices_withRequest___block_invoke_662(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F62 = result;
  return result;
}

- (void)logEventIntervalHCIRawData:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F929C0];
  id v5 = a3;
  if ([v4 debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __47__PLBluetoothAgent_logEventIntervalHCIRawData___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD580A8 != -1) {
      dispatch_once(&qword_1EBD580A8, block);
    }
    if (byte_1EBD57F63)
    {
      unint64_t v7 = [NSString stringWithFormat:@"inside HCI trace callback logEventIntervalHCIRawData"];
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      objc_super v10 = [v9 lastPathComponent];
      uint64_t v11 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalHCIRawData:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1354];

      id v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v18 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  int v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"HCITrace"];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  uint64_t v15 = [v5 objectForKey:@"HCITrace"];

  [v14 setObject:v15 forKeyedSubscript:@"HCIRawData"];
  [(PLOperator *)self logEntry:v14];
}

uint64_t __47__PLBluetoothAgent_logEventIntervalHCIRawData___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F63 = result;
  return result;
}

- (id)advertisingDataDescription:(const char *)a3 :(unint64_t)a4
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  if (a4 >= 2)
  {
    do
    {
      unint64_t v7 = *(unsigned __int8 *)a3;
      if (*a3) {
        BOOL v8 = a4 > v7;
      }
      else {
        BOOL v8 = 0;
      }
      if (!v8) {
        break;
      }
      int v9 = *((unsigned __int8 *)a3 + 1);
      if (v9 == 255)
      {
        if (v7 >= 5 && a3[2] == 76)
        {
          int v11 = 4;
          do
          {
            int v12 = v11 + (a3[(v11 + 1)] & 0x1F);
            [v6 appendFormat:@" --%@: %d,", @"LE_adv_type", a3[v11]];
            int v11 = v12 + 2;
          }
          while ((int)v7 + 1 >= (v12 + 2) + 2);
        }
      }
      else if (v9 == 1 && v7 >= 2)
      {
        objc_msgSend(v6, "appendFormat:", @" Flags: %#04X,", *((unsigned __int8 *)a3 + 2));
      }
      a3 += v7 + 1;
      a4 -= v7 + 1;
    }
    while (a4 > 1);
  }
  return v6;
}

- (void)logEventIntervalWakeVSE:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    void block[2] = __44__PLBluetoothAgent_logEventIntervalWakeVSE___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (qword_1EBD580B0 != -1) {
      dispatch_once(&qword_1EBD580B0, block);
    }
    if (byte_1EBD57F64)
    {
      id v6 = self;
      unint64_t v7 = [NSString stringWithFormat:@"wake payload = %@", v4];
      BOOL v8 = (void *)MEMORY[0x1E4F929B8];
      int v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      objc_super v10 = [v9 lastPathComponent];
      int v11 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalWakeVSE:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:1447];

      int v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        unint64_t v60 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v6;
    }
  }
  int v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BTWakeupVSE"];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13];
  uint64_t v15 = [v4 objectForKey:@"WakeEventType"];
  long long v16 = [v4 objectForKey:@"HostWakeReport"];
  unint64_t v17 = [v16 length];
  v57 = v4;
  if (v15)
  {
    [v14 setObject:v15 forKeyedSubscript:@"WakeEventType"];
    if ((int)[v15 intValue] >= 1)
    {
      uint64_t v18 = [v4 objectForKey:@"BundleID"];
      [v14 setObject:v18 forKeyedSubscript:@"BundleID"];

      uint64_t v19 = [v4 objectForKey:@"DeviceName"];
      [v14 setObject:v19 forKeyedSubscript:@"DeviceName"];

      int v20 = [v4 objectForKey:@"PeerType"];
      [v14 setObject:v20 forKeyedSubscript:@"PeerType"];

      [v14 setObject:v16 forKeyedSubscript:@"VSERaw"];
      int v21 = [v15 intValue];
      if ((v21 - 1) < 2)
      {
        double v36 = [NSNumber numberWithInt:4];
        [v14 setObject:v36 forKeyedSubscript:@"VSEType"];

        uint64_t v37 = [NSNumber numberWithInt:62013];
        [v14 setObject:v37 forKeyedSubscript:@"VSEReasonCode"];

        if (v16)
        {
          -[PLBluetoothAgent advertisingDataDescription::](self, "advertisingDataDescription::", [v16 bytes], v17);
          uint64_t v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v39 = v38;
          uint64_t v40 = @"undecodable LE ADV";
          if (v38 && [(__CFString *)v38 length]) {
            uint64_t v40 = v39;
          }
          uint64_t v41 = @"VSEReasonString";
          uint64_t v42 = v14;
          uint64_t v43 = v40;
          goto LABEL_52;
        }
      }
      else
      {
        if (v21 == 3)
        {
          uint64_t v46 = [NSNumber numberWithInt:4];
          [v14 setObject:v46 forKeyedSubscript:@"VSEType"];

          dispatch_time_t v23 = NSNumber;
          uint64_t v24 = 3000;
          goto LABEL_51;
        }
        if (v21 == 5)
        {
          uint64_t v22 = [NSNumber numberWithInt:4];
          [v14 setObject:v22 forKeyedSubscript:@"VSEType"];

          dispatch_time_t v23 = NSNumber;
          uint64_t v24 = 5000;
LABEL_51:
          uint64_t v39 = [v23 numberWithInt:v24];
          uint64_t v41 = @"VSEReasonCode";
          uint64_t v42 = v14;
          uint64_t v43 = v39;
LABEL_52:
          [v42 setObject:v43 forKeyedSubscript:v41];
        }
      }
LABEL_74:
      [(PLOperator *)self logEntry:v14];
      goto LABEL_75;
    }
  }
  if ([MEMORY[0x1E4F92A38] isWatch]) {
    unsigned int v25 = 2;
  }
  else {
    unsigned int v25 = 0;
  }
  if (v17 < (v25 | 5))
  {
    int v26 = 0;
    int v27 = 0;
    uint64_t v28 = 0xFFFFFFFFLL;
LABEL_73:
    uint64_t v54 = [NSNumber numberWithUnsignedInt:v28];
    [v14 setObject:v54 forKeyedSubscript:@"VSEType"];

    v55 = [NSNumber numberWithUnsignedInt:(v26 + 1000 * v27)];
    [v14 setObject:v55 forKeyedSubscript:@"VSEReasonCode"];

    [v14 setObject:v16 forKeyedSubscript:@"VSERaw"];
    goto LABEL_74;
  }
  double v56 = self;
  uint64_t v29 = (unsigned __int8 *)([v16 bytes] + v25);
  uint64_t v28 = *v29;
  int v27 = v29[1];
  int v26 = v29[3];
  if (([MEMORY[0x1E4F92A38] isWiFiClass:1004014] & 1) != 0
    || (v28 == 6 ? (BOOL v44 = v27 == 0) : (BOOL v44 = 0),
        !v44 && (v28 != 4 || v27 != 62 || (v26 != 2 ? (BOOL v45 = v26 == 13) : (BOOL v45 = 1), !v45))))
  {
    if ([MEMORY[0x1E4F92A38] isWatch])
    {
      if (v27 == 62 && v17 > (v25 | 8)) {
        int v26 = v29[8];
      }
    }
    int v31 = [MEMORY[0x1E4F92A38] isWatch];
    if (v28 != 4 || v27 != 62)
    {
      self = v56;
      goto LABEL_73;
    }
    double v32 = &v29[v31];
    if (v26 == 2)
    {
      self = v56;
      if (v17 >= 0x19)
      {
        if (v32[5] != 62) {
          goto LABEL_68;
        }
        uint64_t v33 = v32 + 18;
        unint64_t v34 = v17 - 18;
        unint64_t v35 = v32[17];
LABEL_57:
        if (v34 >= v35) {
          unint64_t v47 = v35;
        }
        else {
          unint64_t v47 = v34;
        }
        unint64_t v48 = [(PLBluetoothAgent *)self advertisingDataDescription:v33 :v47];
        uint64_t v49 = v48;
        if (v48)
        {
          if ([(__CFString *)v48 length]) {
            long long v50 = v49;
          }
          else {
            long long v50 = @"undecodable LE ADV";
          }
        }
        else
        {
          long long v50 = @"undecodable LE ADV";
        }
        [v14 setObject:v50 forKeyedSubscript:@"VSEReasonString"];

        goto LABEL_68;
      }
    }
    else
    {
      self = v56;
      if (v26 == 13 && v17 >= 0x28)
      {
        if (v32[5] != 62) {
          goto LABEL_68;
        }
        uint64_t v33 = v32 + 33;
        unint64_t v34 = v17 - 33;
        unint64_t v35 = v32[32];
        goto LABEL_57;
      }
    }
    if (v17 <= 0xD)
    {
LABEL_72:
      uint64_t v28 = 4;
      int v27 = 62;
      goto LABEL_73;
    }
LABEL_68:
    if ((v32[10] & 0xF0) == 0xA0)
    {
      id v51 = objc_alloc_init(MEMORY[0x1E4F28E78]);
      double v52 = [v14 objectForKeyedSubscript:@"VSEReasonString"];

      if (v52)
      {
        uint64_t v53 = [v14 objectForKeyedSubscript:@"VSEReasonString"];
        [v51 appendString:v53];
      }
      [v51 appendString:@" passup ADV,"];
      [v14 setObject:v51 forKeyedSubscript:@"VSEReasonString"];
    }
    goto LABEL_72;
  }
LABEL_75:
}

uint64_t __44__PLBluetoothAgent_logEventIntervalWakeVSE___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F64 = result;
  return result;
}

- (void)logEventIntervalConnectedDevices
{
  v116 = self;
  long long v101 = &v99;
  uint64_t v203 = *MEMORY[0x1E4F143B8];
  unint64_t v154 = 0;
  long long v155 = 0u;
  long long v156 = 0u;
  id v110 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v102 = (id)objc_opt_new();
  [(PLBluetoothAgent *)v116 localBluetoothDevice];
  uint64_t ConnectedDevices = BTLocalDeviceGetConnectedDevices();
  if (ConnectedDevices)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      v153[0] = MEMORY[0x1E4F143A8];
      v153[1] = 3221225472;
      v153[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke;
      v153[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v153[4] = v3;
      if (qword_1EBD580B8 != -1) {
        dispatch_once(&qword_1EBD580B8, v153);
      }
      if (byte_1EBD57F65)
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Bluetooth power ERROR: BTLocalDeviceGetConnectedDevices: failed! %d\n", ConnectedDevices);
        uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        unint64_t v7 = [v6 lastPathComponent];
        BOOL v8 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1669];

        int v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v187 = 138412290;
          *(void *)&v187[4] = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", v187, 0xCu);
        }
      }
    }
LABEL_111:
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v90 = objc_opt_class();
      v118[0] = MEMORY[0x1E4F143A8];
      v118[1] = 3221225472;
      v118[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_730;
      v118[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v118[4] = v90;
      if (qword_1EBD580E8 != -1) {
        dispatch_once(&qword_1EBD580E8, v118);
      }
      if (byte_1EBD57F6B)
      {
        long long v91 = [NSString stringWithFormat:@"Nothing changes in BT connected device list"];
        long long v92 = (void *)MEMORY[0x1E4F929B8];
        long long v93 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        long long v94 = [v93 lastPathComponent];
        long long v95 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
        [v92 logMessage:v91 fromFile:v94 fromFunction:v95 fromLineNumber:1780];

        long long v96 = PLLogCommon();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)uint64_t v187 = 138412290;
          *(void *)&v187[4] = v91;
          _os_log_debug_impl(&dword_1D2690000, v96, OS_LOG_TYPE_DEBUG, "%@", v187, 0xCu);
        }
      }
    }
    long long v97 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ConnectedDevices"];
    long long v98 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v97];
    [v98 setIsErrorEntry:1];
    [v98 setObject:@"Nothing changes in BT connected device list" forKeyedSubscript:@"__PLEntryErrorString__"];
    [(PLOperator *)v116 logEntry:v98];

    goto LABEL_119;
  }
  *((void *)&v10 + 1) = 0;
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  long long v198 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  long long v194 = 0u;
  long long v193 = 0u;
  long long v192 = 0u;
  long long v191 = 0u;
  long long v190 = 0u;
  long long v189 = 0u;
  long long v188 = 0u;
  *(_OWORD *)uint64_t v187 = 0u;
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  long long v178 = 0u;
  long long v177 = 0u;
  long long v176 = 0u;
  long long v175 = 0u;
  long long v174 = 0u;
  long long v173 = 0u;
  long long v172 = 0u;
  long long v171 = 0u;
  uint64_t v169 = 0;
  uint64_t v168 = 0;
  uint64_t v170 = 0;
  unsigned int v152 = 0;
  if (v154) {
    goto LABEL_18;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v11 = objc_opt_class();
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_697;
    v151[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void v151[4] = v11;
    if (qword_1EBD580C0 != -1) {
      dispatch_once(&qword_1EBD580C0, v151);
    }
    if (byte_1EBD57F66)
    {
      int v12 = [NSString stringWithFormat:@"Bluetooth: No devices connected"];
      int v13 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      uint64_t v15 = [v14 lastPathComponent];
      long long v16 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
      [v13 logMessage:v12 fromFile:v15 fromFunction:v16 fromLineNumber:1676];

      unint64_t v17 = PLLogCommon();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  if (v154)
  {
LABEL_18:
    unint64_t v18 = 0;
    *(void *)&long long v10 = 138412290;
    *(_OWORD *)v117 = v10;
    do
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
      if (!BTDeviceGetAddressString())
      {
        int v20 = [NSString stringWithUTF8String:&v168];
        if (v20) {
          [v19 setObject:v20 forKeyedSubscript:@"MAC"];
        }
      }
      if (!BTDeviceGetDefaultName())
      {
        int v21 = [NSString stringWithUTF8String:&v171];
        if (v21) {
          [v19 setObject:v21 forKeyedSubscript:@"DefaultName"];
        }
      }
      if (!BTDeviceGetName())
      {
        uint64_t v22 = [NSString stringWithUTF8String:v187];
        if (v22) {
          [v19 setObject:v22 forKeyedSubscript:@"Name"];
        }
      }
      if ([v19 count])
      {
        if (!BTDeviceGetDeviceType())
        {
          dispatch_time_t v23 = [NSNumber numberWithInt:v152];
          if (v23) {
            [v19 setObject:v23 forKeyedSubscript:@"DeviceType"];
          }
        }
        [v102 addObject:v19];
      }
      else
      {
        uint64_t v24 = [NSString stringWithFormat:@"Cannot get BT device attributes."];
        unsigned int v25 = (void *)MEMORY[0x1E4F929B8];
        int v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        int v27 = [v26 lastPathComponent];
        uint64_t v28 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
        [v25 logMessage:v24 fromFile:v27 fromFunction:v28 fromLineNumber:1695];

        uint64_t v29 = PLLogCommon();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(buf) = v117[0];
          *(void *)((char *)&buf + 4) = v24;
          _os_log_debug_impl(&dword_1D2690000, v29, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v169 = 0;
      uint64_t v168 = 0;
      uint64_t v170 = 0;
      long long v171 = 0u;
      long long v172 = 0u;
      long long v173 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      long long v176 = 0u;
      long long v177 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      long long v180 = 0u;
      long long v181 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      long long v184 = 0u;
      long long v185 = 0u;
      long long v186 = 0u;
      long long v202 = 0u;
      long long v201 = 0u;
      long long v200 = 0u;
      long long v199 = 0u;
      long long v198 = 0u;
      long long v197 = 0u;
      long long v196 = 0u;
      long long v195 = 0u;
      long long v194 = 0u;
      long long v193 = 0u;
      long long v192 = 0u;
      long long v191 = 0u;
      long long v190 = 0u;
      long long v189 = 0u;
      long long v188 = 0u;
      *(_OWORD *)uint64_t v187 = 0u;

      ++v18;
    }
    while (v18 < v154);
  }
  id v109 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"ConnectedDevices"];
  uint64_t v30 = (void *)[objc_alloc(MEMORY[0x1E4F92A90]) initWithKey:@"timestampEnd" withValue:0 withComparisonOperation:6];
  v167 = v30;
  id v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v167 count:1];

  int v31 = [(PLOperator *)v116 storage];
  double v32 = [v31 entriesForKey:v109 withComparisons:v100];

  uint64_t v112 = (uint64_t (**)(uint64_t, uint64_t))objc_opt_new();
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  obuint64_t j = v32;
  uint64_t v33 = [obj countByEnumeratingWithState:&v147 objects:v166 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v148;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v148 != v34) {
          objc_enumerationMutation(obj);
        }
        double v36 = *(void **)(*((void *)&v147 + 1) + 8 * i);
        if (v36)
        {
          uint64_t v37 = [*(id *)(*((void *)&v147 + 1) + 8 * i) objectForKeyedSubscript:@"Name"];
          if (v37)
          {
            uint64_t v38 = [v36 objectForKeyedSubscript:@"MAC"];
            if (v38)
            {
              uint64_t v39 = [v36 objectForKeyedSubscript:@"DeviceType"];
              BOOL v40 = v39 == 0;

              if (!v40) {
                [v112 addObject:v36];
              }
            }
            else
            {
            }
          }
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v147 objects:v166 count:16];
    }
    while (v33);
  }

  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  id v113 = v102;
  long long v111 = (void (**)(uint64_t))[v113 countByEnumeratingWithState:&v143 objects:v165 count:16];
  if (v111)
  {
    int v107 = 0;
    long long v105 = v142;
    long long v108 = *(void **)v144;
    uint64_t v115 = v136;
    long long v103 = v134;
    *(void *)&long long v41 = 138412290;
    long long v104 = v41;
    do
    {
      uint64_t v42 = 0;
      do
      {
        if (*(void **)v144 != v108)
        {
          uint64_t v43 = v42;
          objc_enumerationMutation(v113);
          uint64_t v42 = v43;
        }
        id v114 = v42;
        uint64_t v44 = *(void *)(*((void *)&v143 + 1) + 8 * (void)v42);
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v45 = objc_opt_class();
          v141[0] = MEMORY[0x1E4F143A8];
          v141[1] = 3221225472;
          v142[0] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_708;
          v142[1] = &__block_descriptor_40_e5_v8__0lu32l8;
          v142[2] = v45;
          if (qword_1EBD580C8 != -1) {
            dispatch_once(&qword_1EBD580C8, v141);
          }
          if (byte_1EBD57F67)
          {
            uint64_t v46 = [NSString stringWithFormat:@"Bluetooth: Local device is connected to device :%@", v44];
            unint64_t v47 = (void *)MEMORY[0x1E4F929B8];
            unint64_t v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
            uint64_t v49 = [v48 lastPathComponent];
            long long v50 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
            [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:1734];

            id v51 = PLLogCommon();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(buf) = v104;
              *(void *)((char *)&buf + 4) = v46;
              _os_log_debug_impl(&dword_1D2690000, v51, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        id v52 = objc_alloc(MEMORY[0x1E4F929D0]);
        uint64_t v53 = (void *)[v52 initWithEntryKey:v109 withRawData:v44];
        [v53 setEntryDate:v110];
        long long v139 = 0u;
        long long v140 = 0u;
        long long v137 = 0u;
        long long v138 = 0u;
        v117[0] = v112;
        uint64_t v54 = [v117[0] countByEnumeratingWithState:&v137 objects:v164 count:16];
        if (v54)
        {
          uint64_t v55 = *(void *)v138;
          while (2)
          {
            uint64_t v56 = 0;
            do
            {
              if (*(void *)v138 != v55) {
                objc_enumerationMutation(v117[0]);
              }
              v57 = *(void **)(*((void *)&v137 + 1) + 8 * v56);
              if ([MEMORY[0x1E4F929C0] debugEnabled])
              {
                uint64_t v58 = objc_opt_class();
                block[0] = MEMORY[0x1E4F143A8];
                block[1] = 3221225472;
                v136[0] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_714;
                v136[1] = &__block_descriptor_40_e5_v8__0lu32l8;
                v136[2] = v58;
                if (qword_1EBD580D0 != -1) {
                  dispatch_once(&qword_1EBD580D0, block);
                }
                if (byte_1EBD57F68)
                {
                  uint64_t v59 = NSString;
                  unint64_t v60 = [v57 objectForKeyedSubscript:@"MAC"];
                  uint64_t v61 = [v53 objectForKeyedSubscript:@"MAC"];
                  long long v62 = [v59 stringWithFormat:@"Bluetooth: checking for duplicate |%@| ==?== |%@|", v60, v61];

                  v63 = (void *)MEMORY[0x1E4F929B8];
                  v64 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
                  long long v65 = [v64 lastPathComponent];
                  long long v66 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
                  [v63 logMessage:v62 fromFile:v65 fromFunction:v66 fromLineNumber:1741];

                  long long v67 = PLLogCommon();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                  {
                    LODWORD(buf) = v104;
                    *(void *)((char *)&buf + 4) = v62;
                    _os_log_debug_impl(&dword_1D2690000, v67, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
                  }
                }
              }
              long long v68 = [v57 objectForKeyedSubscript:@"MAC"];
              long long v69 = [v53 objectForKeyedSubscript:@"MAC"];
              char v70 = [v68 isEqualToString:v69];

              if (v70)
              {

                if ([MEMORY[0x1E4F929C0] debugEnabled])
                {
                  uint64_t v71 = objc_opt_class();
                  v133[0] = MEMORY[0x1E4F143A8];
                  v133[1] = 3221225472;
                  v134[0] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_720;
                  v134[1] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v134[2] = v71;
                  if (qword_1EBD580D8 != -1) {
                    dispatch_once(&qword_1EBD580D8, v133);
                  }
                  if (byte_1EBD57F69)
                  {
                    long long v72 = NSString;
                    long long v73 = [v53 objectForKeyedSubscript:@"MAC"];
                    long long v74 = [v72 stringWithFormat:@"Bluetooth: Entry already exists for MAC %@", v73];

                    long long v75 = (void *)MEMORY[0x1E4F929B8];
                    long long v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
                    long long v77 = [v76 lastPathComponent];
                    long long v78 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]"];
                    [v75 logMessage:v74 fromFile:v77 fromFunction:v78 fromLineNumber:1754];

                    v79 = PLLogCommon();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
                    {
                      LODWORD(buf) = v104;
                      *(void *)((char *)&buf + 4) = v74;
                      _os_log_debug_impl(&dword_1D2690000, v79, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);
                    }
                  }
                }
                goto LABEL_89;
              }
              ++v56;
            }
            while (v54 != v56);
            uint64_t v54 = [v117[0] countByEnumeratingWithState:&v137 objects:v164 count:16];
            if (v54) {
              continue;
            }
            break;
          }
        }

        [(PLOperator *)v116 logEntry:v53];
        int v107 = 1;
LABEL_89:

        uint64_t v42 = (char *)v114 + 1;
      }
      while ((char *)v114 + 1 != (char *)v111);
      long long v111 = (void (**)(uint64_t))[v113 countByEnumeratingWithState:&v143 objects:v165 count:16];
    }
    while (v111);
  }
  else
  {
    int v107 = 0;
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__5;
  v162 = __Block_byref_object_dispose__5;
  id v163 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v114 = v112;
  long long v80 = (void *)[v114 countByEnumeratingWithState:&v129 objects:v158 count:16];
  if (v80)
  {
    uint64_t v115 = *(void **)v130;
    long long v111 = &v123;
    uint64_t v112 = &v122;
    long long v108 = v120;
    do
    {
      v117[0] = v80;
      long long v81 = 0;
      do
      {
        if (*(void **)v130 != v115) {
          objc_enumerationMutation(v114);
        }
        long long v82 = *(void **)(*((void *)&v129 + 1) + 8 * (void)v81);
        long long v125 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v128 = 0u;
        id v83 = v113;
        uint64_t v84 = [v83 countByEnumeratingWithState:&v125 objects:v157 count:16];
        if (v84)
        {
          uint64_t v85 = *(void *)v126;
          while (2)
          {
            for (uint64_t j = 0; j != v84; ++j)
            {
              if (*(void *)v126 != v85) {
                objc_enumerationMutation(v83);
              }
              long long v87 = [*(id *)(*((void *)&v125 + 1) + 8 * j) objectForKeyedSubscript:@"MAC"];
              long long v88 = [v82 objectForKeyedSubscript:@"MAC"];
              char v89 = [v87 isEqualToString:v88];

              if (v89)
              {

                goto LABEL_108;
              }
            }
            uint64_t v84 = [v83 countByEnumeratingWithState:&v125 objects:v157 count:16];
            if (v84) {
              continue;
            }
            break;
          }
        }

        v121[0] = 0;
        v121[1] = v121;
        v121[2] = 0x3032000000;
        v122 = __Block_byref_object_copy__5;
        v123 = __Block_byref_object_dispose__5;
        id v124 = v82;
        v119[0] = MEMORY[0x1E4F143A8];
        v119[1] = 3221225472;
        v120[0] = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_724;
        v120[1] = &unk_1E692BD30;
        v120[3] = v121;
        v120[4] = &buf;
        v120[2] = v116;
        [(PLOperator *)v116 updateEntry:v124 withBlock:v119];
        _Block_object_dispose(v121, 8);

        int v107 = 1;
LABEL_108:
        long long v81 = (char *)v81 + 1;
      }
      while (v81 != v117[0]);
      long long v80 = (void *)[v114 countByEnumeratingWithState:&v129 objects:v158 count:16];
    }
    while (v80);
  }

  _Block_object_dispose(&buf, 8);
  if ((v107 & 1) == 0) {
    goto LABEL_111;
  }
LABEL_119:
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F65 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_697(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F66 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_708(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F67 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_714(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F68 = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_720(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F69 = result;
  return result;
}

void __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_724(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:@"timestampEnd"];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_2;
    int v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v13 = v2;
    if (qword_1EBD580E0 != -1) {
      dispatch_once(&qword_1EBD580E0, &block);
    }
    if (byte_1EBD57F6A)
    {
      uint64_t v3 = [NSString stringWithFormat:@"Bluetooth: Device disconnected:%@", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), block, v10, v11, v12, v13];
      id v4 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      id v6 = [v5 lastPathComponent];
      unint64_t v7 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventIntervalConnectedDevices]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:1772];

      BOOL v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v15 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6A = result;
  return result;
}

uint64_t __52__PLBluetoothAgent_logEventIntervalConnectedDevices__block_invoke_730(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6B = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6C = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_739(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6D = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_743(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  void block[5] = 0;
  [*(id *)(a1 + 32) localBluetoothDevice];
  uint64_t v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if (v1)
  {
    uint64_t v2 = v1;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1EBD58100 != -1) {
        dispatch_once(&qword_1EBD58100, block);
      }
      if (byte_1EBD57F6E)
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Could not register for Power notifications. (error: %d)", v2);
        uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        unint64_t v7 = [v6 lastPathComponent];
        BOOL v8 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1857];

        int v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          int v12 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6E = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_746(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F6F = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_752(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F70 = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_756(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  void block[5] = 0;
  [*(id *)(a1 + 32) localBluetoothDevice];
  uint64_t v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if (v1)
  {
    uint64_t v2 = v1;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_757;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1EBD58118 != -1) {
        dispatch_once(&qword_1EBD58118, block);
      }
      if (byte_1EBD57F71)
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Could not register for Power notifications. (error: %d)", v2);
        uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        unint64_t v7 = [v6 lastPathComponent];
        BOOL v8 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1961];

        int v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          int v12 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_757(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F71 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_760(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F72 = result;
  return result;
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_766(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F73 = result;
  return result;
}

void __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_767(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  void block[5] = 0;
  [*(id *)(a1 + 32) localBluetoothDevice];
  uint64_t v1 = BTLocalDeviceRegisterForPowerProfileStatistics();
  if (v1)
  {
    uint64_t v2 = v1;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v3 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_768;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (qword_1EBD58130 != -1) {
        dispatch_once(&qword_1EBD58130, block);
      }
      if (byte_1EBD57F74)
      {
        id v4 = objc_msgSend(NSString, "stringWithFormat:", @"Could not register for Power notifications. (error: %d)", v2);
        uint64_t v5 = (void *)MEMORY[0x1E4F929B8];
        id v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        unint64_t v7 = [v6 lastPathComponent];
        BOOL v8 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardPowerProfileStats]_block_invoke"];
        [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:1988];

        int v9 = PLLogCommon();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          int v12 = v4;
          _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __53__PLBluetoothAgent_logEventBackwardPowerProfileStats__block_invoke_2_768(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F74 = result;
  return result;
}

+ (BOOL)shouldLogMarconi
{
  if ([MEMORY[0x1E4F92A38] isWiFiClass:1004011]) {
    return 1;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F92A38];
  return [v3 isWiFiClass:1004012];
}

- (void)logEventBackwardCBDiscovery:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v24 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CBDiscoveryStats"];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v24];
  unsigned int v25 = v3;
  uint64_t v5 = [v3 objectForKeyedSubscript:@"agsE"];
  id v6 = v5;
  if (v5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      obuint64_t j = v6;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v11 = [v10 objectForKeyedSubscript:@"apID"];
          [v4 setObject:v11 forKeyedSubscript:@"apID"];

          int v12 = [v10 objectForKeyedSubscript:@"apIX"];
          [v4 setObject:v12 forKeyedSubscript:@"apIX"];

          uint64_t v13 = [v10 objectForKeyedSubscript:@"sonC"];
          [v4 setObject:v13 forKeyedSubscript:@"sonC"];

          uint64_t v14 = [v10 objectForKeyedSubscript:@"sofC"];
          [v4 setObject:v14 forKeyedSubscript:@"sofC"];

          uint64_t v15 = [v10 objectForKeyedSubscript:@"dsFl"];
          [v4 setObject:v15 forKeyedSubscript:@"dsFl"];

          [(PLOperator *)self logEntry:v4];
        }
        id v6 = obj;
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __48__PLBluetoothAgent_logEventBackwardCBDiscovery___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (qword_1EBD58138 != -1) {
        dispatch_once(&qword_1EBD58138, block);
      }
      if (byte_1EBD57F75)
      {
        unint64_t v17 = [NSString stringWithFormat:@"ERROR: CBDiscovery return empty dictionary"];
        unint64_t v18 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        int v20 = [v19 lastPathComponent];
        int v21 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardCBDiscovery:]"];
        [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:2023];

        uint64_t v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          double v36 = v17;
          _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    dispatch_time_t v23 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    [v4 setObject:v23 forKeyedSubscript:@"apIX"];

    [(PLOperator *)self logEntry:v4];
  }
}

uint64_t __48__PLBluetoothAgent_logEventBackwardCBDiscovery___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F75 = result;
  return result;
}

- (void)logEventBackwardWirelessProximity:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"WirelessProxScanDStats"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  if (v4)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"Scan"];
    [v6 setObject:v7 forKeyedSubscript:@"ClientScanDuration"];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"Advertise"];
    [v6 setObject:v8 forKeyedSubscript:@"ClientAdvDuration"];

    int v9 = [v4 objectForKeyedSubscript:@"AggressiveScan"];
    [v6 setObject:v9 forKeyedSubscript:@"ClientScanConfig"];
  }
  else
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __54__PLBluetoothAgent_logEventBackwardWirelessProximity___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (qword_1EBD58140 != -1) {
        dispatch_once(&qword_1EBD58140, block);
      }
      if (byte_1EBD57F76)
      {
        uint64_t v11 = [NSString stringWithFormat:@"ERROR: WirelessProximity return empty dictionary"];
        int v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        uint64_t v15 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardWirelessProximity:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:2046];

        uint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v19 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    [v6 setObject:&unk_1F29ED7F0 forKeyedSubscript:@"ClientScanDuration"];
  }
  [(PLOperator *)self logEntry:v6];
}

uint64_t __54__PLBluetoothAgent_logEventBackwardWirelessProximity___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F76 = result;
  return result;
}

- (void)logEventBackwardMaxDutyCycle:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"MaxDutyCycle"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __49__PLBluetoothAgent_logEventBackwardMaxDutyCycle___block_invoke;
    unint64_t v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58148 != -1) {
      dispatch_once(&qword_1EBD58148, &block);
    }
    if (byte_1EBD57F77)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Write to dB: %@", v4, block, v15, v16, v17, v18];
      int v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
      uint64_t v11 = [v10 lastPathComponent];
      int v12 = [NSString stringWithUTF8String:"-[PLBluetoothAgent logEventBackwardMaxDutyCycle:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:2065];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [(PLOperator *)self logEntry:v6];
}

uint64_t __49__PLBluetoothAgent_logEventBackwardMaxDutyCycle___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F77 = result;
  return result;
}

- (void)logEventBackwardA2DP:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"A2DPPower"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  uint64_t v7 = [v5 objectForKey:@"Duration"];
  [v6 setObject:v7 forKeyedSubscript:@"A2DPDuration"];

  uint64_t v8 = [v5 objectForKey:@"PercentageEPAPower"];
  [v6 setObject:v8 forKeyedSubscript:@"A2DPpercantageePA"];

  int v9 = [v5 objectForKey:@"PercentageIPAPower"];

  [v6 setObject:v9 forKeyedSubscript:@"A2DPpercantageiPA"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardHFP:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v12 = +[PLOperator entryKeyForType:v4 andName:@"HFPPower"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  uint64_t v7 = [v5 objectForKey:@"Duration"];
  [v6 setObject:v7 forKeyedSubscript:@"HFPDuration"];

  uint64_t v8 = [v5 objectForKey:@"PercentageEPAPowerFirstWindow"];
  [v6 setObject:v8 forKeyedSubscript:@"HFPpercantageePA1"];

  int v9 = [v5 objectForKey:@"PercentageEPAPowerSecondWindow"];
  [v6 setObject:v9 forKeyedSubscript:@"HFPpercantageePA2"];

  id v10 = [v5 objectForKey:@"PercentageIPAPowerFirstWindow"];
  [v6 setObject:v10 forKeyedSubscript:@"HFPpercentageiPA1"];

  uint64_t v11 = [v5 objectForKey:@"PercentageIPAPowerSecondWindow"];

  [v6 setObject:v11 forKeyedSubscript:@"HFPpercentageiPA2"];
  [(PLOperator *)self logEntry:v6];
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F78 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_885(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F79 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_891(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7A = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_898(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7B = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7C = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_908(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7D = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_916(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7E = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_2_922(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F7F = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_928(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F80 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_934(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F81 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_940(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F82 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_946(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F83 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_949(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F84 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_952(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F85 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_955(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F86 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_958(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F87 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_964(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F88 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_979(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F89 = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_982(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F8A = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_985(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F8B = result;
  return result;
}

uint64_t __40__PLBluetoothAgent_modelBluetoothPower___block_invoke_992(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F8C = result;
  return result;
}

- (void)modelBluetoothOffPower
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v3 = [MEMORY[0x1E4F92900] sharedInstance];
    [v3 createPowerEventBackwardWithRootNodeID:50 withPower:v2 withEndDate:0.0];

    uint64_t v4 = [MEMORY[0x1E4F92900] sharedInstance];
    [v4 createPowerEventBackwardWithRootNodeID:59 withPower:v2 withEndDate:0.0];

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v5 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      void block[2] = __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1EBD581F8 != -1) {
        dispatch_once(&qword_1EBD581F8, block);
      }
      if (byte_1EBD57F8D)
      {
        id v6 = [NSString stringWithFormat:@"ModelBTOffPower"];
        uint64_t v7 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
        int v9 = [v8 lastPathComponent];
        id v10 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothOffPower]"];
        [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:2424];

        uint64_t v11 = PLLogCommon();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = v6;
          _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    if ([MEMORY[0x1E4F92A38] isiPhone])
    {
      id v12 = [MEMORY[0x1E4F92900] sharedInstance];
      [v12 createPowerEventBackwardWithRootNodeID:58 withPower:v2 withEndDate:0.0];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v13 = objc_opt_class();
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        uint64_t v22 = __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke_1001;
        dispatch_time_t v23 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v24 = v13;
        if (qword_1EBD58200 != -1) {
          dispatch_once(&qword_1EBD58200, &v20);
        }
        if (byte_1EBD57F8E)
        {
          uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"ModelBTOffPower", v20, v21, v22, v23, v24);
          uint64_t v15 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Radios/PLBluetoothAgent.m"];
          unint64_t v17 = [v16 lastPathComponent];
          uint64_t v18 = [NSString stringWithUTF8String:"-[PLBluetoothAgent modelBluetoothOffPower]"];
          [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:2429];

          uint64_t v19 = PLLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v27 = v14;
            _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
    }
  }
}

uint64_t __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F8D = result;
  return result;
}

uint64_t __42__PLBluetoothAgent_modelBluetoothOffPower__block_invoke_1001(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57F8E = result;
  return result;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)sbcChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSbcChanged:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (NSString)btHardwareChipset
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (PLXPCListenerOperatorComposition)leConnectionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLeConnectionListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)btHCIListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBtHCIListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)btA2DPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBtA2DPListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)btHFPListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBtHFPListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)btHCIVSEListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBtHCIVSEListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)wirelessProxListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setWirelessProxListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CBDiscoveryListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setCBDiscoveryListener:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotifications
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (NSDate)lastPowerEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 176, 1);
}

- (void)setLastPowerEntryDate:(id)a3
{
}

- (unsigned)logCount
{
  return self->_logCount;
}

- (void)setLogCount:(unsigned __int8)a3
{
  self->_logCount = a3;
}

- (NSMutableDictionary)ENScanCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setENScanCache:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ENListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setENListener:(id)a3
{
}

- (void)setBeaconManager:(id)a3
{
}

- (PLXPCListenerOperatorComposition)magnetListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 208, 1);
}

- (void)setMagnetListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)magnetOperationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 216, 1);
}

- (void)setMagnetOperationListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_magnetOperationListener, 0);
  objc_storeStrong((id *)&self->_magnetListener, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_ENListener, 0);
  objc_storeStrong((id *)&self->_ENScanCache, 0);
  objc_storeStrong((id *)&self->_lastPowerEntryDate, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotifications, 0);
  objc_storeStrong((id *)&self->_CBDiscoveryListener, 0);
  objc_storeStrong((id *)&self->_wirelessProxListener, 0);
  objc_storeStrong((id *)&self->_btHCIVSEListener, 0);
  objc_storeStrong((id *)&self->_btHFPListener, 0);
  objc_storeStrong((id *)&self->_btA2DPListener, 0);
  objc_storeStrong((id *)&self->_btHCIListener, 0);
  objc_storeStrong((id *)&self->_leConnectionListener, 0);
  objc_storeStrong((id *)&self->_btHardwareChipset, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_sbcChanged, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end