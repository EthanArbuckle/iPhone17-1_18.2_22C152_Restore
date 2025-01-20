@interface PLNetworkAgent
+ (id)accountingGroupDefinitions;
+ (id)defaults;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionNetworkIsExpensive;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionUnattributedWake;
+ (id)entryEventPointDefinitionWake;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (OS_dispatch_queue)nwPathMonitorQueue;
- (OS_nw_path_monitor)nwPathMonitorCellular;
- (OS_nw_path_monitor)nwPathMonitorLoopback;
- (OS_nw_path_monitor)nwPathMonitorOther;
- (OS_nw_path_monitor)nwPathMonitorWiFi;
- (OS_nw_path_monitor)nwPathMonitorWired;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)canSleep;
- (PLNetworkAgent)init;
- (PLSemaphore)canSleepSemaphore;
- (PLXPCListenerOperatorComposition)downloadAutoAssetDownloadsListener;
- (PLXPCListenerOperatorComposition)downloadV2AssetDownloadsListener;
- (id)NWPathMonitorWithInterface:(int)a3;
- (int)wakeSocket;
- (void)handleNWPathUpdate:(id)a3;
- (void)initKernelEvent;
- (void)initOperatorDependancies;
- (void)logEventBackwardCumulativeNetworkUsage;
- (void)logEventPointWake;
- (void)logMobileAssetDownload:(id)a3 withCategory:(id)a4;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setCanSleep:(id)a3;
- (void)setCanSleepSemaphore:(id)a3;
- (void)setDownloadAutoAssetDownloadsListener:(id)a3;
- (void)setDownloadV2AssetDownloadsListener:(id)a3;
- (void)setNwPathMonitorCellular:(id)a3;
- (void)setNwPathMonitorLoopback:(id)a3;
- (void)setNwPathMonitorOther:(id)a3;
- (void)setNwPathMonitorQueue:(id)a3;
- (void)setNwPathMonitorWiFi:(id)a3;
- (void)setNwPathMonitorWired:(id)a3;
- (void)setWakeSocket:(int)a3;
@end

@implementation PLNetworkAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLNetworkAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"IsExpensive";
  objc_super v2 = +[PLNetworkAgent entryEventForwardDefinitionNetworkIsExpensive];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventForwardDefinitionNetworkIsExpensive
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0ED0;
  v14[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"NetworkType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"IsExpensive";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventBackwardDefinitions
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v20 = @"CumulativeNetworkUsage";
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v16[0] = *MEMORY[0x1E4F92CD0];
  v16[1] = v2;
  v17[0] = &unk_1F29F0ED0;
  v17[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v19[0] = v3;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"Interface";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v15[0] = v5;
  v14[1] = @"UpBytes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[1] = v7;
  void v14[2] = @"DownBytes";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v15[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"Wake";
  v3 = [a1 entryEventPointDefinitionWake];
  v7[1] = @"UnattributedWake";
  v8[0] = v3;
  v4 = [a1 entryEventPointDefinitionUnattributedWake];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventPointDefinitionWake
{
  v40[2] = *MEMORY[0x1E4F143B8];
  v39[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v37[0] = *MEMORY[0x1E4F92CD0];
  v37[1] = v2;
  v38[0] = &unk_1F29F0EE0;
  v38[1] = MEMORY[0x1E4F1CC38];
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v40[0] = v34;
  v39[1] = *MEMORY[0x1E4F92CA8];
  v35[0] = @"wakeUUID";
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_StringFormat");
  v36[0] = v32;
  v35[1] = @"Interface";
  v31 = [MEMORY[0x1E4F929D8] sharedInstance];
  v30 = objc_msgSend(v31, "commonTypeDict_StringFormat");
  v36[1] = v30;
  v35[2] = @"PID";
  v29 = [MEMORY[0x1E4F929D8] sharedInstance];
  v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
  v36[2] = v28;
  v35[3] = @"ProcessName";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_StringFormat_withProcessName");
  v36[3] = v26;
  v35[4] = @"EffectivePID";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v36[4] = v24;
  v35[5] = @"EffectiveProcessName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_StringFormat_withProcessName");
  v36[5] = v22;
  v35[6] = @"packetDataLength";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v36[6] = v20;
  v35[7] = @"controlFlagType";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v36[7] = v18;
  v35[8] = @"InterfaceType";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v36[8] = v16;
  v35[9] = @"CompanionLink";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_BoolFormat");
  v36[9] = v14;
  v35[10] = @"sourcePort";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v36[10] = v4;
  v35[11] = @"sourceAddress";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v36[11] = v6;
  v35[12] = @"destinationPort";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v36[12] = v8;
  v35[13] = @"destinationAddress";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v36[13] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:14];
  v40[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionUnattributedWake
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v28 = *MEMORY[0x1E4F92CD0];
  v29 = &unk_1F29F0EF0;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
  v31[0] = v25;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"wakeUUID";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_StringFormat");
  v27[0] = v23;
  v26[1] = @"Interface";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v27[1] = v21;
  v26[2] = @"sourcePort";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v27[2] = v19;
  v26[3] = @"sourceAddress";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v27[3] = v17;
  v26[4] = @"destinationPort";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v27[4] = v15;
  v26[5] = @"destinationAddress";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v27[5] = v13;
  v26[6] = @"packetDataLength";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v27[6] = v3;
  v26[7] = @"controlFlagType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v27[7] = v5;
  v26[8] = @"InterfaceType";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v27[8] = v7;
  v26[9] = @"CompanionLink";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_BoolFormat");
  v27[9] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:10];
  v31[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

  return v11;
}

- (void)initKernelEvent
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  self->_uintptr_t wakeSocket = -1;
  int v3 = socket(32, 3, 1);
  self->_uintptr_t wakeSocket = v3;
  if (v3 == -1)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v12;
      if (qword_1EBD59F08 != -1) {
        dispatch_once(&qword_1EBD59F08, v50);
      }
      if (_MergedGlobals_1_46)
      {
        v13 = [NSString stringWithFormat:@"socket(PF_SYSTEM, SOCK_RAW, SYSPROTO_EVENT) error"];
        v14 = (void *)MEMORY[0x1E4F929B8];
        v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
        v16 = [v15 lastPathComponent];
        v17 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:246];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v13;
          v42 = buf;
          goto LABEL_40;
        }
LABEL_14:
      }
    }
  }
  else
  {
    int v49 = 1;
    if (ioctl(v3, 0x8004667EuLL, &v49))
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_22;
      }
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_86;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v4;
      if (qword_1EBD59F10 != -1) {
        dispatch_once(&qword_1EBD59F10, block);
      }
      if (!byte_1EBD59EF9) {
        goto LABEL_22;
      }
      v5 = [NSString stringWithFormat:@"ioctl(FIONBIO) error"];
      v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      v8 = [v7 lastPathComponent];
      v9 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:253];

      v10 = PLLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
LABEL_21:

LABEL_22:
        close(self->_wakeSocket);
        return;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v5;
      v11 = buf;
LABEL_42:
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", v11, 0xCu);
      goto LABEL_21;
    }
    *(void *)buf = 0x100000001;
    *(_DWORD *)&buf[8] = 14;
    int v19 = ioctl(self->_wakeSocket, 0x800C6502uLL, buf);
    int v20 = [MEMORY[0x1E4F929C0] debugEnabled];
    if (v19)
    {
      if (!v20) {
        goto LABEL_22;
      }
      uint64_t v21 = objc_opt_class();
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_92;
      v47[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v47[4] = v21;
      if (qword_1EBD59F18 != -1) {
        dispatch_once(&qword_1EBD59F18, v47);
      }
      if (!byte_1EBD59EFA) {
        goto LABEL_22;
      }
      v5 = [NSString stringWithFormat:@"ioctl(SIOCSKEVFILT) error"];
      v22 = (void *)MEMORY[0x1E4F929B8];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      v24 = [v23 lastPathComponent];
      v25 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]"];
      [v22 logMessage:v5 fromFile:v24 fromFunction:v25 fromLineNumber:263];

      v10 = PLLogCommon();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      *(_DWORD *)v51 = 138412290;
      v52 = v5;
      v11 = v51;
      goto LABEL_42;
    }
    if (v20)
    {
      uint64_t v26 = objc_opt_class();
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_98;
      v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v46[4] = v26;
      if (qword_1EBD59F20 != -1) {
        dispatch_once(&qword_1EBD59F20, v46);
      }
      if (byte_1EBD59EFB)
      {
        v27 = objc_msgSend(NSString, "stringWithFormat:", @"power wake socket number %d", self->_wakeSocket);
        uint64_t v28 = (void *)MEMORY[0x1E4F929B8];
        v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
        v30 = [v29 lastPathComponent];
        v31 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]"];
        [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:269];

        v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412290;
          v52 = v27;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", v51, 0xCu);
        }
      }
    }
    uintptr_t wakeSocket = self->_wakeSocket;
    v34 = [(PLOperator *)self workQueue];
    dispatch_source_t v35 = dispatch_source_create(MEMORY[0x1E4F14478], wakeSocket, 0, v34);
    v36 = (void *)qword_1EBD59F28;
    qword_1EBD59F28 = (uint64_t)v35;

    if (qword_1EBD59F28)
    {
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_102;
      handler[3] = &unk_1E692A250;
      handler[4] = self;
      dispatch_source_set_cancel_handler((dispatch_source_t)qword_1EBD59F28, handler);
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_106;
      v44[3] = &unk_1E692A250;
      v44[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)qword_1EBD59F28, v44);
      dispatch_resume((dispatch_object_t)qword_1EBD59F28);
      return;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v37 = objc_opt_class();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_2_109;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v37;
      if (qword_1EBD59F38 != -1) {
        dispatch_once(&qword_1EBD59F38, v43);
      }
      if (byte_1EBD59EFD)
      {
        v13 = [NSString stringWithFormat:@"wakeSrc is invalid"];
        v38 = (void *)MEMORY[0x1E4F929B8];
        v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
        v40 = [v39 lastPathComponent];
        v41 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]"];
        [v38 logMessage:v13 fromFile:v40 fromFunction:v41 fromLineNumber:282];

        v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v51 = 138412290;
          v52 = v13;
          v42 = v51;
LABEL_40:
          _os_log_debug_impl(&dword_1D2690000, v18, OS_LOG_TYPE_DEBUG, "%@", v42, 0xCu);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
  }
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_46 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_86(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EF9 = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_92(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFA = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_98(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFB = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_102(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __33__PLNetworkAgent_initKernelEvent__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD59F30 != -1) {
      dispatch_once(&qword_1EBD59F30, block);
    }
    if (byte_1EBD59EFC)
    {
      int v3 = [NSString stringWithFormat:@"wake cancel event!!!!"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLNetworkAgent initKernelEvent]_block_invoke"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:274];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  return close([*(id *)(a1 + 32) wakeSocket]);
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFC = result;
  return result;
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_106(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventPointWake];
}

uint64_t __33__PLNetworkAgent_initKernelEvent__block_invoke_2_109(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFD = result;
  return result;
}

- (PLNetworkAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLNetworkAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if ([(PLOperator *)self isDebugEnabled])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F929E8]);
    v25[0] = &unk_1F29E6F58;
    v25[1] = &unk_1F29E6F70;
    v26[0] = &unk_1F29F0ED0;
    v26[1] = &unk_1F29E6F88;
    v27 = @"Level";
    uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v28[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke;
    v24[3] = &unk_1E692A0F0;
    v24[4] = self;
    v6 = (void *)[v3 initWithOperator:self forEntryKey:@"PLBatteryAgent_EventBackward_Battery" withFilter:v5 withBlock:v24];
  }
  else
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_2;
    v23[3] = &unk_1E692A0F0;
    v23[4] = self;
    v6 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v23];
  }
  [(PLNetworkAgent *)self setBatteryLevelChanged:v6];
  v7 = [MEMORY[0x1E4F92A48] sharedSemaphoreForKey:*MEMORY[0x1E4F92BD0]];
  [(PLNetworkAgent *)self setCanSleepSemaphore:v7];

  v8 = [(PLNetworkAgent *)self canSleepSemaphore];
  [v8 signalInterestByObject:self];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_3;
  v22[3] = &unk_1E692A0F0;
  v22[4] = self;
  v9 = [MEMORY[0x1E4F929E8] canSleepEntryNotificationWithOperator:self withBlock:v22];
  [(PLNetworkAgent *)self setCanSleep:v9];

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.powerlog.networkPathMonitor", 0);
  [(PLNetworkAgent *)self setNwPathMonitorQueue:v10];

  v11 = [(PLNetworkAgent *)self NWPathMonitorWithInterface:2];
  [(PLNetworkAgent *)self setNwPathMonitorCellular:v11];

  uint64_t v12 = [(PLNetworkAgent *)self NWPathMonitorWithInterface:1];
  [(PLNetworkAgent *)self setNwPathMonitorWiFi:v12];

  uint64_t v13 = [(PLNetworkAgent *)self NWPathMonitorWithInterface:3];
  [(PLNetworkAgent *)self setNwPathMonitorWired:v13];

  v14 = [(PLNetworkAgent *)self NWPathMonitorWithInterface:4];
  [(PLNetworkAgent *)self setNwPathMonitorLoopback:v14];

  v15 = [(PLNetworkAgent *)self NWPathMonitorWithInterface:0];
  [(PLNetworkAgent *)self setNwPathMonitorOther:v15];

  [(PLNetworkAgent *)self initKernelEvent];
  id v16 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_156;
  v21[3] = &unk_1E692A6F8;
  v21[4] = self;
  v17 = (void *)[v16 initWithOperator:self withRegistration:&unk_1F29EAAF8 withBlock:v21];
  [(PLNetworkAgent *)self setDownloadAutoAssetDownloadsListener:v17];
  id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_168;
  v20[3] = &unk_1E692A6F8;
  v20[4] = self;
  int v19 = (void *)[v18 initWithOperator:self withRegistration:&unk_1F29EAB20 withBlock:v20];
  [(PLNetworkAgent *)self setDownloadV2AssetDownloadsListener:v19];
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_4;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (qword_1EBD59F40 != -1) {
      dispatch_once(&qword_1EBD59F40, block);
    }
    if (byte_1EBD59EFE)
    {
      id v3 = [NSString stringWithFormat:@"Sleep triggered"];
      uint64_t v4 = (void *)MEMORY[0x1E4F929B8];
      v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      v6 = [v5 lastPathComponent];
      v7 = [NSString stringWithUTF8String:"-[PLNetworkAgent initOperatorDependancies]_block_invoke_3"];
      [v4 logMessage:v3 fromFile:v6 fromFunction:v7 fromLineNumber:313];

      v8 = PLLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v3;
        _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v9 = +[PLProcessPortMap sharedInstance];
  [v9 clearPortMap];

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v10 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __42__PLNetworkAgent_initOperatorDependancies__block_invoke_137;
    v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v10;
    if (qword_1EBD59F48 != -1) {
      dispatch_once(&qword_1EBD59F48, v18);
    }
    if (byte_1EBD59EFF)
    {
      v11 = [NSString stringWithFormat:@"%@ signaling done", *(void *)(a1 + 32)];
      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      v14 = [v13 lastPathComponent];
      v15 = [NSString stringWithUTF8String:"-[PLNetworkAgent initOperatorDependancies]_block_invoke_2"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:318];

      id v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v11;
        _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  v17 = [*(id *)(a1 + 32) canSleepSemaphore];
  [v17 signalDoneByObject:*(void *)(a1 + 32)];
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFE = result;
  return result;
}

uint64_t __42__PLNetworkAgent_initOperatorDependancies__block_invoke_137(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59EFF = result;
  return result;
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_156(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "DownloadMetrics AutoAssetDownloads payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logMobileAssetDownload:v6 withCategory:@"AutoAssetDownloads"];
}

void __42__PLNetworkAgent_initOperatorDependancies__block_invoke_168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "DownloadMetrics v2AssetDownloads payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logMobileAssetDownload:v6 withCategory:@"v2AssetDownloads"];
}

- (id)NWPathMonitorWithInterface:(int)a3
{
  uint64_t v4 = nw_path_monitor_create_with_type((nw_interface_type_t)a3);
  update_handler[0] = MEMORY[0x1E4F143A8];
  update_handler[1] = 3221225472;
  update_handler[2] = __45__PLNetworkAgent_NWPathMonitorWithInterface___block_invoke;
  update_handler[3] = &unk_1E69308A8;
  update_handler[4] = self;
  nw_path_monitor_set_update_handler(v4, update_handler);
  v5 = [(PLNetworkAgent *)self nwPathMonitorQueue];
  nw_path_monitor_set_queue(v4, v5);

  nw_path_monitor_start(v4);
  return v4;
}

uint64_t __45__PLNetworkAgent_NWPathMonitorWithInterface___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleNWPathUpdate:a2];
}

- (void)logEventPointWake
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F92A30] handlePowerWakeEvent:self->_wakeSocket];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v4 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __35__PLNetworkAgent_logEventPointWake__block_invoke;
    int v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v20 = v4;
    if (qword_1EBD59F50 != -1) {
      dispatch_once(&qword_1EBD59F50, &block);
    }
    if (byte_1EBD59F00)
    {
      v5 = [NSString stringWithFormat:@"Power wake packet dictionary %@", v3, block, v17, v18, v19, v20];
      id v6 = (void *)MEMORY[0x1E4F929B8];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLNetworkAgent.m"];
      int v8 = [v7 lastPathComponent];
      id v9 = [NSString stringWithUTF8String:"-[PLNetworkAgent logEventPointWake]"];
      [v6 logMessage:v5 fromFile:v8 fromFunction:v9 fromLineNumber:378];

      uint64_t v10 = PLLogCommon();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v22 = v5;
        _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (v3)
  {
    v11 = [v3 objectForKeyedSubscript:@"AttributedWake"];
    int v12 = [v11 BOOLValue];

    if (v12) {
      uint64_t v13 = @"Wake";
    }
    else {
      uint64_t v13 = @"UnattributedWake";
    }
    v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:v13];
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v3];
    [(PLOperator *)self logEntry:v15];
  }
}

uint64_t __35__PLNetworkAgent_logEventPointWake__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD59F00 = result;
  return result;
}

- (void)logEventBackwardCumulativeNetworkUsage
{
  uint64_t v13 = 0;
  if (!getifaddrs(&v13))
  {
    id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CumulativeNetworkUsage"];
    uint64_t v4 = v13;
    if (v13)
    {
      do
      {
        ifa_addr = v4->ifa_addr;
        if (ifa_addr)
        {
          ifa_data = (unsigned int *)v4->ifa_data;
          if (ifa_data)
          {
            if ((v4->ifa_flags & 8) == 0 && ifa_addr->sa_family == 18)
            {
              ifa_name = v4->ifa_name;
              if (!strcmp(ifa_name, "pdp_ip0") || !strcmp(ifa_name, "en0") || !strcmp(ifa_name, "awdl0"))
              {
                int v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
                id v9 = [NSString stringWithUTF8String:v4->ifa_name];
                [v8 setObject:v9 forKeyedSubscript:@"Interface"];

                uint64_t v10 = [NSNumber numberWithUnsignedInt:ifa_data[11]];
                [v8 setObject:v10 forKeyedSubscript:@"UpBytes"];

                v11 = [NSNumber numberWithUnsignedInt:ifa_data[10]];
                [v8 setObject:v11 forKeyedSubscript:@"DownBytes"];

                [(PLOperator *)self logEntry:v8];
              }
            }
          }
        }
        uint64_t v4 = v4->ifa_next;
      }
      while (v4);
      int v12 = v13;
    }
    else
    {
      int v12 = 0;
    }
    MEMORY[0x1D9429FA0](v12);
  }
}

- (void)logMobileAssetDownload:(id)a3 withCategory:(id)a4
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)[v5 mutableCopy];
  int v8 = [v5 objectForKeyedSubscript:@"timestampStart"];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = [v8 convertFromSystemToMonotonic];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  }
  [v7 removeObjectForKey:@"timestampStart"];
  v11 = [v5 objectForKeyedSubscript:@"timestampEnd"];
  if (v11)
  {
    int v12 = v11;
    uint64_t v13 = [v11 convertFromSystemToMonotonic];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  }
  [v7 setObject:v13 forKeyedSubscript:@"timestampEnd"];
  v14 = [v5 objectForKeyedSubscript:@"clientName"];
  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F92A88];
    id v16 = [v5 objectForKeyedSubscript:@"clientName"];
    uint64_t v17 = [v15 removeFirstPartyBundleIDPrefix:v16];
    [v7 setObject:v17 forKeyedSubscript:@"clientName"];
  }
  else
  {
    [v7 setObject:&stru_1F294E108 forKeyedSubscript:@"clientName"];
  }

  id v18 = [v5 objectForKeyedSubscript:@"assetType"];
  if (v18)
  {
    int v19 = (void *)MEMORY[0x1E4F92A88];
    uint64_t v20 = [v5 objectForKeyedSubscript:@"assetType"];
    uint64_t v21 = [v19 removeFirstPartyBundleIDPrefix:v20];
    [v7 setObject:v21 forKeyedSubscript:@"assetType"];
  }
  else
  {
    [v7 setObject:&stru_1F294E108 forKeyedSubscript:@"assetType"];
  }

  uint64_t v22 = [v7 objectForKeyedSubscript:@"bytesDownloaded"];

  if (v22)
  {
    uint64_t v23 = NSNumber;
    v24 = [v5 objectForKeyedSubscript:@"bytesDownloaded"];
    v25 = objc_msgSend(v23, "numberWithDouble:", (double)((int)objc_msgSend(v24, "intValue") / 0x100000));
    [v7 setObject:v25 forKeyedSubscript:@"bytesDownloaded"];

    uint64_t v26 = PLLogCommon();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v28 = [v5 objectForKeyedSubscript:@"bytesDownloaded"];
      int v29 = [v28 intValue];
      v30 = [v7 objectForKeyedSubscript:@"bytesDownloaded"];
      *(_DWORD *)buf = 138412802;
      id v33 = v6;
      __int16 v34 = 1024;
      *(_DWORD *)dispatch_source_t v35 = v29;
      v35[2] = 1024;
      *(_DWORD *)&v35[3] = [v30 intValue];
      _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "DownloadMetrics %@ rounded bytesDownloaded from %d to %d", buf, 0x18u);
    }
  }
  v27 = PLLogCommon();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v6;
    __int16 v34 = 2112;
    *(void *)dispatch_source_t v35 = v7;
    _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "DownloadMetrics %@ updated payload: %@", buf, 0x16u);
  }

  [(PLOperator *)self logForSubsystem:@"DownloadMetrics" category:v6 data:v7 date:v10];
}

- (void)handleNWPathUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_INFO, "Received NWPath update: %@", buf, 0xCu);
  }

  if ((nw_path_get_status(v4) & 0xFFFFFFFD) != 0)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    enumerate_block[0] = MEMORY[0x1E4F143A8];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __37__PLNetworkAgent_handleNWPathUpdate___block_invoke;
    enumerate_block[3] = &unk_1E69308D0;
    id v7 = v6;
    id v14 = v7;
    nw_path_enumerate_interfaces(v4, enumerate_block);
    if ([v7 count] == 1)
    {
      BOOL is_expensive = nw_path_is_expensive(v4);
      id v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"IsExpensive"];
      uint64_t v10 = [v7 firstObject];
      v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
      [v11 setObject:v10 forKeyedSubscript:@"NetworkType"];
      int v12 = [NSNumber numberWithBool:is_expensive];
      [v11 setObject:v12 forKeyedSubscript:@"IsExpensive"];

      [(PLOperator *)self logEntry:v11];
    }
    else
    {
      id v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, "NWPath does not have valid interface: %@", buf, 0xCu);
      }
    }
  }
}

uint64_t __37__PLNetworkAgent_handleNWPathUpdate___block_invoke(uint64_t a1, nw_interface_t interface)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:nw_interface_get_type(interface)];
  [v2 addObject:v3];

  return 1;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)canSleep
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCanSleep:(id)a3
{
}

- (PLSemaphore)canSleepSemaphore
{
  return (PLSemaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCanSleepSemaphore:(id)a3
{
}

- (PLXPCListenerOperatorComposition)downloadAutoAssetDownloadsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDownloadAutoAssetDownloadsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)downloadV2AssetDownloadsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDownloadV2AssetDownloadsListener:(id)a3
{
}

- (int)wakeSocket
{
  return self->_wakeSocket;
}

- (void)setWakeSocket:(int)a3
{
  self->_uintptr_t wakeSocket = a3;
}

- (OS_nw_path_monitor)nwPathMonitorCellular
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setNwPathMonitorCellular:(id)a3
{
}

- (OS_nw_path_monitor)nwPathMonitorWiFi
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 104, 1);
}

- (void)setNwPathMonitorWiFi:(id)a3
{
}

- (OS_nw_path_monitor)nwPathMonitorWired
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNwPathMonitorWired:(id)a3
{
}

- (OS_nw_path_monitor)nwPathMonitorLoopback
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNwPathMonitorLoopback:(id)a3
{
}

- (OS_nw_path_monitor)nwPathMonitorOther
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNwPathMonitorOther:(id)a3
{
}

- (OS_dispatch_queue)nwPathMonitorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNwPathMonitorQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nwPathMonitorQueue, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorOther, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorLoopback, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorWired, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorWiFi, 0);
  objc_storeStrong((id *)&self->_nwPathMonitorCellular, 0);
  objc_storeStrong((id *)&self->_downloadV2AssetDownloadsListener, 0);
  objc_storeStrong((id *)&self->_downloadAutoAssetDownloadsListener, 0);
  objc_storeStrong((id *)&self->_canSleepSemaphore, 0);
  objc_storeStrong((id *)&self->_canSleep, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
}

@end