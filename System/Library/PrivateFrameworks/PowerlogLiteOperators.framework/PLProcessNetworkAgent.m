@interface PLProcessNetworkAgent
+ (id)entryEventBackwardDefinitionNetworkBitmap;
+ (id)entryEventBackwardDefinitionUsage;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionHighCellularBWTransactions;
+ (id)entryEventForwardDefinitionHighCellularBWTransactionsDetail;
+ (id)entryEventForwardDefinitionLowInternet;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionUsage;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionConnection;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)hasSymptomsLogging;
- (BOOL)outcomeHasDataUsage:(id)a3;
- (NSDate)lastEntryDate;
- (NSDictionary)lastProcessNameToNetworkUsageEntry;
- (NSMutableSet)processes;
- (PLCFNotificationOperatorComposition)flushNetworkBitmapsListener;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEntryNotificationOperatorComposition)batteryLevelChangedListenerForNetworkBitmap;
- (PLMonotonicTimer)logUsageTimer;
- (PLNSNotificationOperatorComposition)sysdiagnoseListener;
- (PLProcessNetworkAgent)init;
- (PLXPCListenerOperatorComposition)highBWEndlistener;
- (PLXPCListenerOperatorComposition)highBWStartListener;
- (UsageFeed)usageFeed;
- (__NStatManager)statManagerRef;
- (id)compressNetworkBitmap:(id)a3;
- (unint64_t)curNetworkBitmapTimestampForSysdiagnoseTrigger;
- (unint64_t)lastNetworkBitmapTimestamp;
- (void)accountWithNetworkUsageDiffEntries:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5;
- (void)aggregateAndLogNetworkBitmaps:(id)a3 withStartTime:(unint64_t)a4 andEndTime:(unint64_t)a5;
- (void)didAddNewSource:(__NStatSource *)a3;
- (void)didRemoveSource:(id)a3;
- (void)didSetCountsBlock:(id)a3 withCounts:(id)a4;
- (void)didSetDescriptionBlock:(id)a3 withDescription:(id)a4;
- (void)getNetWorkBitmapForEndTime:(unint64_t)a3 andSysdiagnoseTrigger:(BOOL)a4;
- (void)handleHighBWEndCallback:(id)a3;
- (void)handleHighBWStartCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)log;
- (void)logEventBackwardNetworkBitmaps;
- (void)logEventBackwardNetworkBitmapsSysdiagnoseTrigger;
- (void)logEventBackwardUsage;
- (void)logEventBackwardUsageWithOutcome:(id)a3;
- (void)logEventForwardLowInternet;
- (void)logEventPointConnectionEvent:(signed __int16)a3 forSource:(id)a4;
- (void)processesOfInterest:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setBatteryLevelChangedListenerForNetworkBitmap:(id)a3;
- (void)setCurNetworkBitmapTimestampForSysdiagnoseTrigger:(unint64_t)a3;
- (void)setFlushNetworkBitmapsListener:(id)a3;
- (void)setHighBWEndlistener:(id)a3;
- (void)setHighBWStartListener:(id)a3;
- (void)setLastEntryDate:(id)a3;
- (void)setLastNetworkBitmapTimestamp:(unint64_t)a3;
- (void)setLastNetworkBitmapTimestampFor:(id)a3;
- (void)setLastProcessNameToNetworkUsageEntry:(id)a3;
- (void)setLogUsageTimer:(id)a3;
- (void)setProcesses:(id)a3;
- (void)setStatManagerRef:(__NStatManager *)a3;
- (void)setSysdiagnoseListener:(id)a3;
- (void)setUsageFeed:(id)a3;
- (void)timestampNetConnectEntry:(id)a3 withEventType:(signed __int16)a4 withSource:(id)a5;
@end

@implementation PLProcessNetworkAgent

void __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLLogNetwork();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "Notification for sysdiagnose trigger for network bitmaps: %@", (uint8_t *)&v9, 0xCu);
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Source"];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v3 objectForKeyedSubscript:@"Source"];
    int v8 = [v7 isEqual:&unk_1F29E4DC8];

    if (v8)
    {
      [*(id *)(a1 + 32) setCurNetworkBitmapTimestampForSysdiagnoseTrigger:-1];
      [*(id *)(a1 + 32) logEventBackwardNetworkBitmapsSysdiagnoseTrigger];
    }
  }
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProcessNetworkAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"Connection";
  objc_super v2 = +[PLProcessNetworkAgent entryEventPointDefinitionConnection];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionConnection
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v42[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v40[0] = *MEMORY[0x1E4F92CD0];
  v40[1] = v2;
  v41[0] = &unk_1F29F0430;
  v41[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C28];
  v40[2] = *MEMORY[0x1E4F92C30];
  v40[3] = v3;
  v41[2] = &unk_1F29E4D80;
  v41[3] = &unk_1F29E4D98;
  v40[4] = *MEMORY[0x1E4F92C08];
  v41[4] = MEMORY[0x1E4F1CC38];
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:5];
  v43[0] = v37;
  v42[1] = *MEMORY[0x1E4F92CA8];
  v38[0] = @"EventType";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
  v39[0] = v35;
  v38[1] = @"InterfaceName";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_StringFormat");
  v39[1] = v33;
  v38[2] = @"ProcessName";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_StringFormat_withBundleID");
  v39[2] = v31;
  v38[3] = @"ProcessPID";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v39[3] = v29;
  v38[4] = @"ProviderType";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v39[4] = v27;
  v38[5] = @"LocalAddress";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_StringFormat");
  v39[5] = v25;
  v38[6] = @"LocalPort";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v39[6] = v23;
  v38[7] = @"RemoteAddress";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v39[7] = v21;
  v38[8] = @"RemotePort";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v39[8] = v19;
  v38[9] = @"TrafficClass";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v39[9] = v17;
  v38[10] = @"rxWifiBytes";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v39[10] = v15;
  v38[11] = @"txWifiBytes";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v39[11] = v5;
  v38[12] = @"rxCellularBytes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v39[12] = v7;
  v38[13] = @"txCellularBytes";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v39[13] = v9;
  v38[14] = @"isChannelArch";
  id v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v39[14] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:15];
  v43[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

  return v13;
}

+ (id)entryEventForwardDefinitions
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"LowInternet";
  uint64_t v2 = +[PLProcessNetworkAgent entryEventForwardDefinitionLowInternet];
  v8[0] = v2;
  v7[1] = @"HighCellularBWTransactions";
  uint64_t v3 = +[PLProcessNetworkAgent entryEventForwardDefinitionHighCellularBWTransactions];
  v8[1] = v3;
  v7[2] = @"HighCellularBWTransactionsDetail";
  v4 = +[PLProcessNetworkAgent entryEventForwardDefinitionHighCellularBWTransactionsDetail];
  v8[2] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

+ (id)entryEventBackwardDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Usage";
  uint64_t v2 = +[PLProcessNetworkAgent entryEventBackwardDefinitionUsage];
  v6[1] = @"NetworkBitmap";
  v7[0] = v2;
  uint64_t v3 = +[PLProcessNetworkAgent entryEventBackwardDefinitionNetworkBitmap];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"UsageDiff";
  uint64_t v2 = +[PLProcessNetworkAgent entryEventIntervalDefinitionUsage];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventBackwardDefinitionNetworkBitmap
{
  v30[2] = *MEMORY[0x1E4F143B8];
  v29[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v27[0] = *MEMORY[0x1E4F92CD0];
  v27[1] = v2;
  v28[0] = &unk_1F29F0440;
  v28[1] = MEMORY[0x1E4F1CC38];
  v27[2] = *MEMORY[0x1E4F92C08];
  v28[2] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
  v30[0] = v18;
  v29[1] = *MEMORY[0x1E4F92CA8];
  v25[0] = @"BundleName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v26[0] = v16;
  v25[1] = @"CurrentMachAbsoluteTime";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v26[1] = v3;
  v25[2] = @"MachAbsoluteStartTime";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v26[2] = v5;
  v25[3] = @"MachAbsoluteEndTime";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v26[3] = v7;
  v25[4] = *MEMORY[0x1E4FA8F18];
  uint64_t v23 = *MEMORY[0x1E4F92D10];
  uint64_t v8 = v23;
  v24 = &unk_1F29E4DB0;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[4] = v9;
  v25[5] = *MEMORY[0x1E4FA8EF0];
  uint64_t v21 = v8;
  v22 = &unk_1F29E4DB0;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[5] = v10;
  v25[6] = *MEMORY[0x1E4FA8F00];
  uint64_t v19 = v8;
  v20 = &unk_1F29E4DB0;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v26[6] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  v30[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];

  return v13;
}

+ (id)entryEventForwardDefinitionLowInternet
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0450;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  int v9 = @"Mode";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  id v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventBackwardDefinitionUsage
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F0460;
  v26[1] = MEMORY[0x1E4F1CC38];
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"ProcessName";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v24[0] = v20;
  v23[1] = @"BundleName";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v24[1] = v18;
  v23[2] = @"ExtensionName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v24[2] = v16;
  v23[3] = @"WifiIn";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v24[3] = v14;
  v23[4] = @"WifiOut";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v24[4] = v4;
  v23[5] = @"CellIn";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v24[5] = v6;
  v23[6] = @"CellOut";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"SinceTime";
  int v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v24[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionUsage
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB0];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F0460;
  v26[1] = @"logEventBackwardUsage";
  void v25[2] = *MEMORY[0x1E4F92C08];
  void v26[2] = MEMORY[0x1E4F1CC38];
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"ProcessName";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
  v24[0] = v20;
  v23[1] = @"BundleName";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat_withBundleID");
  v24[1] = v18;
  v23[2] = @"ExtensionName";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v24[2] = v16;
  v23[3] = @"WifiIn";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v24[3] = v14;
  v23[4] = @"WifiOut";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v24[4] = v4;
  v23[5] = @"CellIn";
  uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v24[5] = v6;
  v23[6] = @"CellOut";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"timestampEnd";
  int v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v24[7] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactions
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F29F0450;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"HighThroughputStartReason";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"HighThroughputLinkRxTputAfterStart";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  v14[2] = @"HighThroughputLinkTxTputAfterStart";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  void v14[3] = @"HighThroughputOriginators";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactionsDetail
{
  v38[3] = *MEMORY[0x1E4F143B8];
  v37[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v35[0] = *MEMORY[0x1E4F92CD0];
  v35[1] = v2;
  v36[0] = &unk_1F29F0450;
  v36[1] = MEMORY[0x1E4F1CC38];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
  v38[0] = v28;
  v37[1] = *MEMORY[0x1E4F92CA8];
  v33[0] = @"HighThroughputStartReason";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v34[0] = v26;
  v33[1] = @"HighThroughputLinkRxTputAfterStart";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v34[1] = v24;
  v33[2] = @"HighThroughputLinkTxTputAfterStart";
  uint64_t v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v34[2] = v22;
  v33[3] = @"HighThroughputOriginators";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_StringFormat");
  v34[3] = v20;
  v33[4] = @"HighThroughputDuration";
  uint64_t v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v34[4] = v18;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:5];
  v38[1] = v17;
  v37[2] = *MEMORY[0x1E4F92C68];
  v31[0] = @"key";
  v29[0] = @"Participant";
  uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v30[0] = v15;
  v29[1] = @"Duration";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v30[1] = v3;
  void v29[2] = @"RxBytes";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v30[2] = v5;
  v29[3] = @"TxBytes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v30[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  v31[1] = @"value";
  v32[0] = v8;
  int v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v32[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v38[2] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];

  return v12;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLProcessNetworkAgent)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLProcessNetworkAgent;
  uint64_t v2 = [(PLAgent *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    processes = v2->_processes;
    v2->_processes = (NSMutableSet *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_processesOfInterest_ name:@"PLProcessNetworkAgent.addProcessesOfInterest" object:0];
  }
  return v2;
}

- (void)initOperatorDependancies
{
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    uint64_t v3 = [(PLOperator *)self workQueue];
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    v35 = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke;
    v36 = &unk_1E692B2E0;
    v37 = self;
    [(PLProcessNetworkAgent *)self setStatManagerRef:NStatManagerCreate()];

    if ([(PLProcessNetworkAgent *)self statManagerRef])
    {
      NStatManagerAddAllTCP();
      NStatManagerAddAllUDP();
    }
    else
    {
      v4 = PLLogNetwork();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2690000, v4, OS_LOG_TYPE_ERROR, "Failed to create NStatManager, not tracking network connection statistics", buf, 2u);
      }
    }
  }
  [(PLProcessNetworkAgent *)self setLastNetworkBitmapTimestamp:-1];
  [(PLProcessNetworkAgent *)self setCurNetworkBitmapTimestampForSysdiagnoseTrigger:-1];
  if ([(PLProcessNetworkAgent *)self hasSymptomsLogging])
  {
    id v5 = objc_alloc(MEMORY[0x1E4FA8E10]);
    v6 = (void *)[v5 initWorkspaceWithService:*MEMORY[0x1E4FA9068]];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4FA91D8]) initWithWorkspace:v6];
      if (v7)
      {
        uint64_t v8 = v7;
        [(PLProcessNetworkAgent *)self setUsageFeed:v7];
      }
      else
      {
        int v9 = PLLogNetwork();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1D2690000, v9, OS_LOG_TYPE_ERROR, "Failed to initialize usage feed", buf, 2u);
        }

        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = PLLogNetwork();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D2690000, v8, OS_LOG_TYPE_ERROR, "Failed to create AnalyticsWorkspace", buf, 2u);
      }
    }

    if ([(PLOperator *)self isDebugEnabled])
    {
      id v10 = (void *)MEMORY[0x1E4F92A18];
      uint64_t v11 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:5.0];
      v12 = [(PLOperator *)self workQueue];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      void v31[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_206;
      v31[3] = &unk_1E692B308;
      v31[4] = self;
      v13 = [v10 scheduledTimerWithMonotonicFireDate:v11 withInterval:v12 withQueue:v31 withBlock:5.0];
      [(PLProcessNetworkAgent *)self setLogUsageTimer:v13];

      if ([(PLProcessNetworkAgent *)self hasSymptomsLogging])
      {
        id v14 = objc_alloc(MEMORY[0x1E4F929A0]);
        v15 = [(PLOperator *)self workQueue];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2;
        v30[3] = &unk_1E692A0F0;
        void v30[4] = self;
        uint64_t v16 = (void *)[v14 initWithWorkQueue:v15 forNotification:@"com.apple.powerlogd.flushNetworkBitmaps" requireState:0 withBlock:v30];
        [(PLProcessNetworkAgent *)self setFlushNetworkBitmapsListener:v16];
      }
      v17 = 0;
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      void v29[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_3;
      v29[3] = &unk_1E692A0F0;
      void v29[4] = self;
      v17 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v29];
    }
    if ([(PLProcessNetworkAgent *)self hasSymptomsLogging])
    {
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_4;
      void v28[3] = &unk_1E692A0F0;
      void v28[4] = self;
      v18 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withMaxIntervalInSecs:v28 withBlock:900.0];
      [(PLProcessNetworkAgent *)self setBatteryLevelChangedListenerForNetworkBitmap:v18];

      id v19 = objc_alloc(MEMORY[0x1E4F92A28]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      void v27[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5;
      void v27[3] = &unk_1E692A0F0;
      v27[4] = self;
      v20 = (void *)[v19 initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:v27];
      [(PLProcessNetworkAgent *)self setSysdiagnoseListener:v20];
    }
    [(PLProcessNetworkAgent *)self setBatteryLevelChanged:v17];
    [(PLProcessNetworkAgent *)self logEventForwardLowInternet];
    [(PLProcessNetworkAgent *)self logEventBackwardNetworkBitmaps];
    id v21 = objc_alloc(MEMORY[0x1E4F92AA0]);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    void v26[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_236;
    void v26[3] = &unk_1E692A6F8;
    v26[4] = self;
    v22 = (void *)[v21 initWithOperator:self withRegistration:&unk_1F29E8E60 withBlock:v26];
    [(PLProcessNetworkAgent *)self setHighBWStartListener:v22];

    if ([MEMORY[0x1E4F929C0] fullMode])
    {
      id v23 = objc_alloc(MEMORY[0x1E4F92AA0]);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2_245;
      void v25[3] = &unk_1E692A6F8;
      v25[4] = self;
      v24 = (void *)[v23 initWithOperator:self withRegistration:&unk_1F29E8E88 withBlock:v25];
      [(PLProcessNetworkAgent *)self setHighBWEndlistener:v24];
    }
  }
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didAddNewSource:a2];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_206(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventBackwardNetworkBitmaps];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventBackwardNetworkBitmaps];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_236(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleHighBWStartCallback:a5];
}

uint64_t __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_2_245(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) handleHighBWEndCallback:a5];
}

- (BOOL)hasSymptomsLogging
{
  return 1;
}

- (void)processesOfInterest:(id)a3
{
  v4 = [a3 userInfo];
  if (v4)
  {
    id v8 = v4;
    id v5 = [v4 objectForKeyedSubscript:@"entry"];
    if (v5)
    {
      v6 = [(PLProcessNetworkAgent *)self processes];
      uint64_t v7 = [v8 objectForKeyedSubscript:@"entry"];
      [v6 unionSet:v7];
    }
    v4 = v8;
  }
}

- (void)didAddNewSource:(__NStatSource *)a3
{
  id v5 = [[PLProcessNetworkSource alloc] initWithSource:a3];
  NStatSourceSetCountsBlock();
  v4 = v5;
  NStatSourceSetDescriptionBlock();
  uint64_t v3 = v4;
  NStatSourceSetRemovedBlock();
}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didSetCountsBlock:*(void *)(a1 + 40) withCounts:a2];
}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) didSetDescriptionBlock:*(void *)(a1 + 40) withDescription:a2];
}

uint64_t __41__PLProcessNetworkAgent_didAddNewSource___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) didRemoveSource:*(void *)(a1 + 40)];
}

- (void)didSetCountsBlock:(id)a3 withCounts:(id)a4
{
  if (a4)
  {
    [a3 setCountsDictionary:a4];
  }
  else
  {
    uint64_t v8 = v4;
    uint64_t v9 = v5;
    v6 = PLLogNetwork();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl(&dword_1D2690000, v6, OS_LOG_TYPE_ERROR, "WARNING: null counts dictionary passed in", v7, 2u);
    }
  }
}

- (void)didSetDescriptionBlock:(id)a3 withDescription:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = [v6 descriptionDictionary];

    if (v8)
    {
      uint64_t v9 = [v6 descriptionDictionary];
      id v10 = (void *)MEMORY[0x1E4F7A198];
      uint64_t v11 = [v9 objectForCFString:*MEMORY[0x1E4F7A198]];

      v12 = [v7 objectForCFString:*v10];
      v13 = [v6 descriptionDictionary];
      id v14 = (void *)MEMORY[0x1E4F7A1E0];
      v15 = [v13 objectForCFString:*MEMORY[0x1E4F7A1E0]];

      uint64_t v16 = [v7 objectForCFString:*v14];
      v17 = [v6 descriptionDictionary];
      v18 = (void *)MEMORY[0x1E4F7A1D8];
      id v19 = [v17 objectForCFString:*MEMORY[0x1E4F7A1D8]];

      v20 = [v7 objectForCFString:*v18];
      if ([v15 isEqualToString:v16])
      {
        id v21 = PLLogNetwork();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          [v6 descriptionDictionary];
          id v23 = v22 = v11;
          *(_DWORD *)buf = 138412546;
          v39 = v23;
          __int16 v40 = 2112;
          id v41 = v7;
          _os_log_impl(&dword_1D2690000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: new description dictionary with same process name: %@ => %@", buf, 0x16u);

          uint64_t v11 = v22;
        }

        goto LABEL_22;
      }
      if ([v15 isEqualToString:@"kernel_task"])
      {
LABEL_22:

        goto LABEL_23;
      }
      v35 = v19;
      v26 = v12;
      uint64_t v27 = [NSNumber numberWithInt:0];
      v28 = v11;
      v29 = (void *)v27;
      v37 = v28;
      int v30 = [v28 isEqualToNumber:v27];

      v31 = [NSNumber numberWithInt:0];
      v36 = v26;
      int v32 = [v26 isEqualToNumber:v31];

      if (v30)
      {
        id v19 = v35;
        if (v32)
        {
          uint64_t v33 = PLLogNetwork();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v34 = "WARNING: new dictionary with same process name and same zeroth interface number";
LABEL_19:
            _os_log_impl(&dword_1D2690000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else
      {
        id v19 = v35;
        if (v32)
        {
          uint64_t v33 = PLLogNetwork();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v34 = "WARNING: new dictionary with same process name but new zeroth interface number";
            goto LABEL_19;
          }
LABEL_20:

          uint64_t v11 = v37;
          goto LABEL_22;
        }
      }
      [(PLProcessNetworkAgent *)self transferSource:v6 fromPID:v19 toPID:v20];
      [v6 setDescriptionDictionary:v7];
      [(PLProcessNetworkAgent *)self logEventPointConnectionEvent:2 forSource:v6];
      v12 = v36;
      uint64_t v11 = v37;
      goto LABEL_22;
    }
    v25 = [v7 objectForCFString:*MEMORY[0x1E4F7A1D8]];
    [(PLProcessNetworkAgent *)self addSource:v6 toPID:v25];

    [v6 setDescriptionDictionary:v7];
    [(PLProcessNetworkAgent *)self logEventPointConnectionEvent:0 forSource:v6];
  }
  else
  {
    v24 = PLLogNetwork();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v24, OS_LOG_TYPE_ERROR, "WARNING: null description dictionary passed in", buf, 2u);
    }
  }
LABEL_23:
}

- (void)didRemoveSource:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [v5 descriptionDictionary];

  if (v4) {
    [(PLProcessNetworkAgent *)self logEventPointConnectionEvent:1 forSource:v5];
  }
}

- (void)aggregateAndLogNetworkBitmaps:(id)a3 withStartTime:(unint64_t)a4 andEndTime:(unint64_t)a5
{
  v87[3] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  context = (void *)MEMORY[0x1D942A350]();
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v60 = *MEMORY[0x1E4FA8EF0];
  uint64_t v6 = *MEMORY[0x1E4FA8EF0];
  uint64_t v61 = *MEMORY[0x1E4FA8F18];
  v87[0] = *MEMORY[0x1E4FA8F18];
  v87[1] = v6;
  uint64_t v59 = *MEMORY[0x1E4FA8F00];
  v87[2] = *MEMORY[0x1E4FA8F00];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v57 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
  if (v57)
  {
    uint64_t v55 = *(void *)v79;
    uint64_t v7 = *MEMORY[0x1E4FA8F20];
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v79 != v55) {
          objc_enumerationMutation(obj);
        }
        v64 = *(void **)(*((void *)&v78 + 1) + 8 * v8);
        uint64_t v9 = objc_msgSend(v56, "objectForKeyedSubscript:");
        id v10 = v9;
        uint64_t v62 = v8;
        if (v9)
        {
          long long v76 = 0u;
          long long v77 = 0u;
          long long v75 = 0u;
          long long v74 = 0u;
          uint64_t v11 = [v9 countByEnumeratingWithState:&v74 objects:v83 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v75;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v75 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void *)(*((void *)&v74 + 1) + 8 * i);
                uint64_t v16 = [v10 objectForKeyedSubscript:v15];
                v17 = [v5 objectForKeyedSubscript:v15];

                if (!v17)
                {
                  v18 = [MEMORY[0x1E4F1CA60] dictionary];
                  [v5 setObject:v18 forKeyedSubscript:v15];
                }
                id v19 = [v16 objectForKeyedSubscript:v7];
                v20 = [(PLProcessNetworkAgent *)self compressNetworkBitmap:v19];

                if (v20)
                {
                  id v21 = [v5 objectForKeyedSubscript:v15];
                  [v21 setObject:v20 forKeyedSubscript:v64];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v74 objects:v83 count:16];
            }
            while (v12);
          }
        }
        else
        {
          v22 = PLLogNetwork();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v85 = v64;
            _os_log_debug_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEBUG, "%@ interface does not exist in outcome dict from symptoms.", buf, 0xCu);
          }
        }
        uint64_t v8 = v62 + 1;
      }
      while (v62 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v57);
  }

  v63 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"NetworkBitmap"];
  id v72 = 0;
  uint64_t v73 = 0;
  [MEMORY[0x1E4F92A88] getCurrentMonotonicAndMachAbsTime:&v72 machAbsTime:&v73 machContTime:0];
  id v58 = v72;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v23 = v5;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v65 = *(void *)v69;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v69 != v65) {
          objc_enumerationMutation(v23);
        }
        uint64_t v27 = *(void **)(*((void *)&v68 + 1) + 8 * v26);
        v28 = PLLogNetwork();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v27;
          _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "Process %@'s network bitmaps", buf, 0xCu);
        }

        v29 = [v23 objectForKeyedSubscript:v27];
        int v30 = [v29 objectForKeyedSubscript:v61];
        if (v30) {
          goto LABEL_34;
        }
        int v30 = [v23 objectForKeyedSubscript:v27];
        v31 = [v30 objectForKeyedSubscript:v60];
        if (v31)
        {

LABEL_34:
LABEL_35:
          int v32 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v63];
          [v32 setEntryDate:v58];
          uint64_t v33 = [NSNumber numberWithUnsignedLongLong:v73];
          [v32 setObject:v33 forKeyedSubscript:@"CurrentMachAbsoluteTime"];

          [v32 setObject:v27 forKeyedSubscript:@"BundleName"];
          uint64_t v34 = [NSNumber numberWithUnsignedLongLong:a4];
          [v32 setObject:v34 forKeyedSubscript:@"MachAbsoluteStartTime"];

          v35 = [NSNumber numberWithUnsignedLongLong:a5];
          [v32 setObject:v35 forKeyedSubscript:@"MachAbsoluteEndTime"];

          v36 = [v23 objectForKeyedSubscript:v27];
          v37 = [v36 objectForKeyedSubscript:v61];
          [v32 setObject:v37 forKeyedSubscript:v61];

          v38 = [v23 objectForKeyedSubscript:v27];
          v39 = [v38 objectForKeyedSubscript:v60];
          [v32 setObject:v39 forKeyedSubscript:v60];

          __int16 v40 = [v23 objectForKeyedSubscript:v27];
          id v41 = [v40 objectForKeyedSubscript:v59];
          [v32 setObject:v41 forKeyedSubscript:v59];

          [(PLOperator *)self logEntry:v32];
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v42 = [v23 objectForKeyedSubscript:v27];
        v43 = [v42 objectForKeyedSubscript:v59];

        if (v43) {
          goto LABEL_35;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v44 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __80__PLProcessNetworkAgent_aggregateAndLogNetworkBitmaps_withStartTime_andEndTime___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v44;
          if (qword_1EBD57AC8 != -1) {
            dispatch_once(&qword_1EBD57AC8, block);
          }
          if (_MergedGlobals_1_11)
          {
            int v32 = [NSString stringWithFormat:@"Process %@'s network bitmaps on all interfaces are empty.", v27];
            v45 = (void *)MEMORY[0x1E4F929B8];
            v46 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
            v47 = [v46 lastPathComponent];
            v48 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent aggregateAndLogNetworkBitmaps:withStartTime:andEndTime:]"];
            [v45 logMessage:v32 fromFile:v47 fromFunction:v48 fromLineNumber:647];

            v49 = PLLogCommon();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v85 = v32;
              _os_log_debug_impl(&dword_1D2690000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            goto LABEL_36;
          }
        }
LABEL_37:
        ++v26;
      }
      while (v25 != v26);
      uint64_t v50 = [v23 countByEnumeratingWithState:&v68 objects:v82 count:16];
      uint64_t v25 = v50;
    }
    while (v50);
  }
}

uint64_t __80__PLProcessNetworkAgent_aggregateAndLogNetworkBitmaps_withStartTime_andEndTime___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_11 = result;
  return result;
}

- (id)compressNetworkBitmap:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3 || ![v3 length]) {
    goto LABEL_22;
  }
  unint64_t v5 = [v4 length];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  if ((v5 & 7) == 0)
  {
    unint64_t v16 = v5 >> 3;
    if (v5 >= 8)
    {
      uint64_t v17 = 0;
      if (v16 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v5 >> 3;
      }
      id v19 = (void *)(v7 + 8 * v16 - 8);
      while (!*v19--)
      {
        if (v18 == ++v17)
        {
          uint64_t v17 = v18;
          break;
        }
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    unint64_t v21 = v16 - v17;
    if (v16 != v17)
    {
      id v15 = [MEMORY[0x1E4F1CA58] dataWithCapacity:8 * v21];
      id v23 = (uint64_t *)[v6 bytes];
      do
      {
        uint64_t v24 = *v23++;
        *(void *)buf = v24;
        [v15 appendBytes:buf length:8];
        --v21;
      }
      while (v21);
      goto LABEL_23;
    }
LABEL_22:
    id v15 = 0;
    goto LABEL_23;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__PLProcessNetworkAgent_compressNetworkBitmap___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1EBD57AD0 != -1) {
      dispatch_once(&qword_1EBD57AD0, block);
    }
    if (byte_1EBD57AA9)
    {
      uint64_t v9 = [NSString stringWithFormat:@"Network bitmap's size is not a multiple of 64 bits."];
      id v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent compressNetworkBitmap:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:682];

      id v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  id v15 = v6;
LABEL_23:

  return v15;
}

uint64_t __47__PLProcessNetworkAgent_compressNetworkBitmap___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AA9 = result;
  return result;
}

- (void)log
{
  if ([(PLProcessNetworkAgent *)self hasSymptomsLogging])
  {
    [(PLProcessNetworkAgent *)self logEventBackwardUsage];
  }
}

- (void)logEventPointConnectionEvent:(signed __int16)a3 forSource:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F92A30];
  uint64_t v8 = [v6 descriptionDictionary];
  uint64_t v9 = [v8 objectForCFString:*MEMORY[0x1E4F7A198]];
  id v10 = [v7 interfaceNameForIndex:v9];

  uint64_t v11 = [v6 descriptionDictionary];
  uint64_t v12 = [v11 objectForCFString:*MEMORY[0x1E4F7A1B0]];
  if ([v12 BOOLValue])
  {

    goto LABEL_4;
  }
  uint64_t v13 = [v6 descriptionDictionary];
  id v14 = [v13 objectForCFString:*MEMORY[0x1E4F7A1B8]];
  int v15 = [v14 BOOLValue];

  if (v15)
  {
LABEL_4:
    unint64_t v16 = [v6 descriptionDictionary];
    uint64_t v17 = [v16 objectForCFString:*MEMORY[0x1E4F7A1E0]];

    if (v17)
    {
      if ([v17 length])
      {
        if ([v17 isEqualToString:@"mDNSResponder"])
        {
          uint64_t v18 = [v6 descriptionDictionary];
          id v19 = [v18 objectForCFString:*MEMORY[0x1E4F7A1B8]];
          char v20 = [v19 BOOLValue];

          if (v20) {
            goto LABEL_28;
          }
        }
        v86 = self;
        unint64_t v21 = [v6 descriptionDictionary];
        v22 = (void *)MEMORY[0x1E4F7A1D0];
        id v23 = [v21 objectForCFString:*MEMORY[0x1E4F7A1D0]];

        uint64_t v24 = [v6 descriptionDictionary];
        uint64_t v25 = (void *)MEMORY[0x1E4F7A1E8];
        uint64_t v26 = [v24 objectForCFString:*MEMORY[0x1E4F7A1E8]];

        if (v23 && v26)
        {
          v82 = v26;
          v84 = v23;
          uint64_t v27 = (void *)MEMORY[0x1E4F92A30];
          v28 = [v6 descriptionDictionary];
          CFDataRef v29 = [v28 objectForCFString:*v22];
          int v30 = [v27 sockaddrToNSDictionary:CFDataGetBytePtr(v29)];

          v31 = (void *)MEMORY[0x1E4F92A30];
          int v32 = [v6 descriptionDictionary];
          CFDataRef v33 = [v32 objectForCFString:*v25];
          uint64_t v34 = [v31 sockaddrToNSDictionary:CFDataGetBytePtr(v33)];

          long long v81 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Connection"];
          v35 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v81];
          [(PLProcessNetworkAgent *)v86 timestampNetConnectEntry:v35 withEventType:v4 withSource:v6];
          [v35 setObject:v17 forKeyedSubscript:@"ProcessName"];
          [v35 setObject:v10 forKeyedSubscript:@"InterfaceName"];
          v36 = [v6 descriptionDictionary];
          v37 = [v36 objectForCFString:*MEMORY[0x1E4F7A1D8]];
          [v35 setObject:v37 forKeyedSubscript:@"ProcessPID"];

          v38 = [v30 objectForKey:@"address"];
          [v35 setObject:v38 forKeyedSubscript:@"LocalAddress"];

          v83 = v30;
          v39 = v30;
          __int16 v40 = v34;
          id v41 = [v39 objectForKey:@"port"];
          [v35 setObject:v41 forKeyedSubscript:@"LocalPort"];

          uint64_t v42 = [v34 objectForKey:@"address"];
          [v35 setObject:v42 forKeyedSubscript:@"RemoteAddress"];

          v43 = [v34 objectForKey:@"port"];
          [v35 setObject:v43 forKeyedSubscript:@"RemotePort"];

          uint64_t v44 = (void *)MEMORY[0x1E4F92A30];
          v45 = [v6 descriptionDictionary];
          v46 = [v45 objectForCFString:*MEMORY[0x1E4F7A218]];
          v47 = objc_msgSend(v44, "stringFromTrafficClass:", objc_msgSend(v46, "intValue"));
          [v35 setObject:v47 forKeyedSubscript:@"TrafficClass"];

          v48 = [v6 descriptionDictionary];
          v49 = [v48 objectForCFString:*MEMORY[0x1E4F7A208]];
          [v35 setObject:v49 forKeyedSubscript:@"rxWifiBytes"];

          uint64_t v50 = [v6 descriptionDictionary];
          v51 = [v50 objectForCFString:*MEMORY[0x1E4F7A238]];
          [v35 setObject:v51 forKeyedSubscript:@"txWifiBytes"];

          v52 = [v6 descriptionDictionary];
          v53 = [v52 objectForCFString:*MEMORY[0x1E4F7A1F8]];
          [v35 setObject:v53 forKeyedSubscript:@"rxCellularBytes"];

          v54 = [v6 descriptionDictionary];
          uint64_t v55 = [v54 objectForCFString:*MEMORY[0x1E4F7A228]];
          [v35 setObject:v55 forKeyedSubscript:@"txCellularBytes"];

          id v56 = [v6 descriptionDictionary];
          uint64_t v57 = (void *)MEMORY[0x1E4F7A188];
          id v58 = [v56 objectForCFString:*MEMORY[0x1E4F7A188]];

          if (v58)
          {
            uint64_t v59 = [v6 descriptionDictionary];
            uint64_t v60 = [v59 objectForCFString:*v57];
            uint64_t v61 = [v60 BOOLValue];
          }
          else
          {
            uint64_t v61 = 0;
          }
          long long v80 = [NSNumber numberWithBool:v61];
          [v35 setObject:v80 forKeyedSubscript:@"isChannelArch"];

          [(PLOperator *)v86 logEntry:v35];
          id v23 = v84;
          uint64_t v26 = v82;
        }
        else if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v71 = objc_opt_class();
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_279;
          v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v87[4] = v71;
          if (qword_1EBD57AE0 != -1) {
            dispatch_once(&qword_1EBD57AE0, v87);
          }
          if (byte_1EBD57AAB)
          {
            v85 = v23;
            id v72 = NSString;
            uint64_t v73 = [(PLOperator *)v86 className];
            long long v74 = [v72 stringWithFormat:@"%@: statsrckeylocal or statsrckeylocal is null for processName=%@", v73, v17];

            long long v75 = (void *)MEMORY[0x1E4F929B8];
            long long v76 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
            long long v77 = [v76 lastPathComponent];
            long long v78 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]"];
            [v75 logMessage:v74 fromFile:v77 fromFunction:v78 fromLineNumber:766];

            long long v79 = PLLogCommon();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v90 = (uint64_t)v74;
              _os_log_debug_impl(&dword_1D2690000, v79, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            id v23 = v85;
          }
        }
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_28;
        }
        uint64_t v62 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v62;
        if (qword_1EBD57AD8 != -1) {
          dispatch_once(&qword_1EBD57AD8, block);
        }
        if (!byte_1EBD57AAA) {
          goto LABEL_28;
        }
        v63 = NSString;
        v64 = [(PLOperator *)self className];
        uint64_t v65 = [v6 descriptionDictionary];
        uint64_t v66 = [v63 stringWithFormat:@"%@: processName length == 0 detected, source = %@", v64, v65];

        v67 = (void *)MEMORY[0x1E4F929B8];
        long long v68 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        long long v69 = [v68 lastPathComponent];
        long long v70 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]"];
        [v67 logMessage:v66 fromFile:v69 fromFunction:v70 fromLineNumber:747];

        uint64_t v26 = PLLogCommon();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = (void *)v66;
          uint64_t v90 = v66;
          _os_log_debug_impl(&dword_1D2690000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        else
        {
          id v23 = (void *)v66;
        }
      }
    }
LABEL_28:
  }
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAA = result;
  return result;
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_279(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAB = result;
  return result;
}

- (void)timestampNetConnectEntry:(id)a3 withEventType:(signed __int16)a4 withSource:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = mach_continuous_time();
  id v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v11 = [NSNumber numberWithShort:v6];
  [v7 setObject:v11 forKeyedSubscript:@"EventType"];

  [v7 setEntryDate:v10];
  if (v6 <= 1)
  {
    uint64_t v12 = [v8 descriptionDictionary];
    uint64_t v13 = (void *)MEMORY[0x1E4F7A210];
    id v14 = [v12 objectForCFString:*MEMORY[0x1E4F7A210]];

    if (!v14)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v39 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v39;
        if (qword_1EBD57AE8 != -1) {
          dispatch_once(&qword_1EBD57AE8, block);
        }
        if (byte_1EBD57AAC)
        {
          __int16 v40 = NSString;
          id v41 = [v8 descriptionDictionary];
          uint64_t v42 = [v40 stringWithFormat:@"Flow %@ had no start timestamp", v41];

          v43 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
          v45 = [v44 lastPathComponent];
          v46 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]"];
          [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:816];

          v47 = PLLogCommon();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = v42;
            _os_log_debug_impl(&dword_1D2690000, v47, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v38 = &unk_1F29E4DF8;
      goto LABEL_32;
    }
    int v15 = [v8 descriptionDictionary];
    unint64_t v16 = [v15 objectForCFString:*v13];
    uint64_t v17 = [v16 unsignedLongLongValue];

    if (v6 == 1)
    {
      uint64_t v18 = [v8 descriptionDictionary];
      id v19 = (void *)MEMORY[0x1E4F7A190];
      char v20 = [v18 objectForCFString:*MEMORY[0x1E4F7A190]];

      if (!v20)
      {
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v49 = objc_opt_class();
          v63[0] = MEMORY[0x1E4F143A8];
          v63[1] = 3221225472;
          v63[2] = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_296;
          v63[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v63[4] = v49;
          if (qword_1EBD57AF0 != -1) {
            dispatch_once(&qword_1EBD57AF0, v63);
          }
          if (byte_1EBD57AAD)
          {
            uint64_t v50 = NSString;
            v51 = [v8 descriptionDictionary];
            v52 = [v50 stringWithFormat:@"Flow %@ closed, but had no duration", v51];

            v53 = (void *)MEMORY[0x1E4F929B8];
            v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
            uint64_t v55 = [v54 lastPathComponent];
            id v56 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]"];
            [v53 logMessage:v52 fromFile:v55 fromFunction:v56 fromLineNumber:823];

            uint64_t v57 = PLLogCommon();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v66 = v52;
              _os_log_debug_impl(&dword_1D2690000, v57, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
          }
        }
        v38 = &unk_1F29E4E10;
        goto LABEL_32;
      }
      unint64_t v21 = [v8 descriptionDictionary];
      v22 = [v21 objectForCFString:*v19];
      uint64_t v23 = [v22 integerValue];

      v17 += v23;
    }
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v9];
    double v25 = v24;
    [MEMORY[0x1E4F92A88] secondsFromMachTime:v17];
    double v27 = v25 - v26;
    if (v27 < 0.0)
    {
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v28 = objc_opt_class();
        uint64_t v58 = MEMORY[0x1E4F143A8];
        uint64_t v59 = 3221225472;
        uint64_t v60 = __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_304;
        uint64_t v61 = &__block_descriptor_40_e5_v8__0lu32l8;
        uint64_t v62 = v28;
        if (qword_1EBD57AF8 != -1) {
          dispatch_once(&qword_1EBD57AF8, &v58);
        }
        if (byte_1EBD57AAE)
        {
          CFDataRef v29 = NSString;
          int v30 = [v8 descriptionDictionary];
          v31 = [v10 dateByAddingTimeInterval:-v27];
          int v32 = [v29 stringWithFormat:@"Flow from %@ ends in the future -- Now: %@ End Date: %@ currentMachTime: %llu providedMachTime: %llu", v30, v10, v31, v9, v17, v58, v59, v60, v61, v62];

          CFDataRef v33 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
          v35 = [v34 lastPathComponent];
          v36 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]"];
          [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:833];

          v37 = PLLogCommon();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v66 = v32;
            _os_log_debug_impl(&dword_1D2690000, v37, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }
        }
      }
      v38 = &unk_1F29E4E28;
LABEL_32:
      [v7 setObject:v38 forKeyedSubscript:@"EventType"];
      goto LABEL_33;
    }
    v48 = [v10 dateByAddingTimeInterval:-v27];
    [v7 setEntryDate:v48];
  }
LABEL_33:
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAC = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_296(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAD = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_304(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAE = result;
  return result;
}

- (void)logEventBackwardUsage
{
  v17[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FA9070];
  v16[0] = *MEMORY[0x1E4FA9188];
  v16[1] = v3;
  v17[0] = MEMORY[0x1E4F1CC38];
  v17[1] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  char v5 = [MEMORY[0x1E4F92A88] isPowerlogHelperd];
  uint64_t v6 = [(PLProcessNetworkAgent *)self usageFeed];
  id v7 = v6;
  if (v5)
  {
    id v8 = [(PLProcessNetworkAgent *)self processes];
    uint64_t v9 = *MEMORY[0x1E4FA9220];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_311;
    v13[3] = &unk_1E692B358;
    v13[4] = self;
    [v7 usageToDateWithOptionsFor:v8 nameKind:v9 options:v4 reply:v13];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4FA9220];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke;
    v15[3] = &unk_1E692B358;
    void v15[4] = self;
    int v11 = [v6 usageToDateWithOptionsFor:0 nameKind:v10 options:v4 reply:v15];

    uint64_t v12 = PLLogNetwork();
    id v7 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEFAULT, "successfully retrieved network usage data", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "failed to retrieve network usage data", buf, 2u);
    }
  }
}

uint64_t __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logEventBackwardUsageWithOutcome:a2];
}

void __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_311(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = PLLogNetwork();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v7 = [*(id *)(a1 + 32) processes];
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "[self processes]=%@, outcome=%@", (uint8_t *)&v8, 0x16u);
  }
  char v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)[v3 copy];
  [v5 logEventBackwardUsageWithOutcome:v6];
}

- (void)logEventForwardLowInternet
{
  id v5 = (id)CFPreferencesCopyValue(@"deviceConfigType", @"com.apple.symptomsd", @"_networkd", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (v5)
  {
    id v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LowInternet"];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
    [v4 setObject:v5 forKeyedSubscript:@"Mode"];
    [(PLOperator *)self logEntry:v4];
  }
}

- (BOOL)outcomeHasDataUsage:(id)a3
{
  v20[6] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4FA91F8];
  v20[0] = *MEMORY[0x1E4FA91F0];
  v20[1] = v4;
  uint64_t v5 = *MEMORY[0x1E4FA91E8];
  v20[2] = *MEMORY[0x1E4FA91E0];
  v20[3] = v5;
  uint64_t v6 = *MEMORY[0x1E4FA9208];
  v20[4] = *MEMORY[0x1E4FA9200];
  v20[5] = v6;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = objc_msgSend(v3, "valueForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v11 doubleValue];
        double v13 = v12;

        if (v13 > 0.0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)logEventBackwardUsageWithOutcome:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  v54 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v42 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"UsageDiff"];
  v52 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Usage"];
  if (v40 && [v40 count])
  {
    id v3 = PLLogNetwork();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v40 count];
      _os_log_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEFAULT, "NetworkUsage outcome has payload size: %lu", (uint8_t *)&buf, 0xCu);
    }

    v43 = [MEMORY[0x1E4F1CA60] dictionary];
    id v41 = [MEMORY[0x1E4F1CA48] array];
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id obj = v40;
    uint64_t v4 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
    if (v4)
    {
      uint64_t v50 = *MEMORY[0x1E4FA9220];
      uint64_t v51 = *(void *)v70;
      uint64_t v49 = *MEMORY[0x1E4FA9210];
      uint64_t v47 = *MEMORY[0x1E4FA91F0];
      uint64_t v48 = *MEMORY[0x1E4FA9218];
      uint64_t v46 = *MEMORY[0x1E4FA91F8];
      uint64_t v45 = *MEMORY[0x1E4FA91E0];
      uint64_t v5 = *MEMORY[0x1E4FA91E8];
      uint64_t v6 = *MEMORY[0x1E4FA9228];
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v70 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          uint64_t v9 = (void *)MEMORY[0x1D942A350]();
          __int16 v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v52 withDate:v54];
          id v11 = [v8 valueForKey:v50];
          [v10 setObject:v11 forKeyedSubscript:@"ProcessName"];
          double v12 = [v8 valueForKey:v49];
          [v10 setObject:v12 forKeyedSubscript:@"BundleName"];

          double v13 = [v8 valueForKey:v48];
          [v10 setObject:v13 forKeyedSubscript:@"ExtensionName"];

          id v14 = [v8 valueForKey:v47];
          [v10 setObject:v14 forKeyedSubscript:@"WifiIn"];

          long long v15 = [v8 valueForKey:v46];
          [v10 setObject:v15 forKeyedSubscript:@"WifiOut"];

          long long v16 = [v8 valueForKey:v45];
          [v10 setObject:v16 forKeyedSubscript:@"CellIn"];

          long long v17 = [v8 valueForKey:v5];
          [v10 setObject:v17 forKeyedSubscript:@"CellOut"];

          long long v18 = [v8 valueForKey:v6];
          [v10 setObject:v18 forKeyedSubscript:@"SinceTime"];

          *(void *)&long long buf = 0;
          *((void *)&buf + 1) = &buf;
          uint64_t v78 = 0x2020000000;
          uint64_t v79 = 0;
          id v19 = [v10 dictionary];
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke;
          v66[3] = &unk_1E692B380;
          p_long long buf = &buf;
          id v20 = v10;
          id v67 = v20;
          [v19 enumerateKeysAndObjectsUsingBlock:v66];

          if (*(double *)(*((void *)&buf + 1) + 24) > 0.0)
          {
            [v43 setObject:v20 forKeyedSubscript:v11];
            unint64_t v21 = [(PLProcessNetworkAgent *)self lastEntryDate];
            BOOL v22 = v21 == 0;

            if (!v22)
            {
              id v23 = objc_alloc(MEMORY[0x1E4F929D0]);
              double v24 = [(PLProcessNetworkAgent *)self lastEntryDate];
              double v25 = (void *)[v23 initWithEntryKey:v42 withDate:v24];

              [v25 setObject:v54 forKeyedSubscript:@"timestampEnd"];
              [v25 setObject:v11 forKeyedSubscript:@"ProcessName"];
              double v26 = [v20 objectForKeyedSubscript:@"BundleName"];
              [v25 setObject:v26 forKeyedSubscript:@"BundleName"];

              double v27 = [v20 objectForKeyedSubscript:@"ExtensionName"];
              [v25 setObject:v27 forKeyedSubscript:@"ExtensionName"];

              uint64_t v28 = [v20 dictionary];
              v63[0] = MEMORY[0x1E4F143A8];
              v63[1] = 3221225472;
              v63[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_2;
              v63[3] = &unk_1E692B3A8;
              id v29 = v25;
              id v64 = v29;
              id v65 = v20;
              [v28 enumerateKeysAndObjectsUsingBlock:v63];

              int v30 = [(PLProcessNetworkAgent *)self lastProcessNameToNetworkUsageEntry];
              v31 = [v30 objectForKeyedSubscript:v11];

              uint64_t v59 = 0;
              uint64_t v60 = (double *)&v59;
              double v62 = 0.0;
              double v32 = *(double *)(*((void *)&buf + 1) + 24);
              uint64_t v61 = 0x2020000000;
              double v62 = v32;
              if (v31)
              {
                double v62 = 0.0;
                CFDataRef v33 = [v31 dictionary];
                v55[0] = MEMORY[0x1E4F143A8];
                v55[1] = 3221225472;
                v55[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_3;
                v55[3] = &unk_1E692B3D0;
                id v56 = v29;
                id v57 = v31;
                uint64_t v58 = &v59;
                [v33 enumerateKeysAndObjectsUsingBlock:v55];

                double v32 = v60[3];
              }
              if (v32 > 0.0) {
                [v41 addObject:v29];
              }
              _Block_object_dispose(&v59, 8);
            }
          }

          _Block_object_dispose(&buf, 8);
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v69 objects:v80 count:16];
      }
      while (v4);
    }

    if ([(PLOperator *)self isDebugEnabled]
      && ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
    {
      long long v75 = v52;
      uint64_t v34 = [v43 allValues];
      long long v76 = v34;
      v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      [(PLOperator *)self logEntries:v35 withGroupID:v52];
    }
    v36 = [(PLProcessNetworkAgent *)self lastEntryDate];

    if (v36)
    {
      uint64_t v73 = v42;
      long long v74 = v41;
      v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      [(PLOperator *)self logEntries:v37 withGroupID:v42];

      v38 = [(PLProcessNetworkAgent *)self lastEntryDate];
      [(PLProcessNetworkAgent *)self accountWithNetworkUsageDiffEntries:v41 withStartDate:v38 withEndDate:v54];
    }
    [(PLProcessNetworkAgent *)self setLastEntryDate:v54];
    [(PLProcessNetworkAgent *)self setLastProcessNameToNetworkUsageEntry:v43];
  }
  else
  {
    uint64_t v39 = PLLogNetwork();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D2690000, v39, OS_LOG_TYPE_ERROR, "NetworkUsage outcome has no payload", (uint8_t *)&buf, 2u);
    }

    v43 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v42 withDate:v54];
    [v43 setIsErrorEntry:1];
    [v43 setObject:@"NetworkUsage outcome has no payload" forKeyedSubscript:@"__PLEntryErrorString__"];
    [(PLOperator *)self logEntry:v43];
  }
}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
    [v7 doubleValue];
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  }
}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

void __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v14];
    [v7 doubleValue];
    double v9 = v8;
    __int16 v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
    [v10 doubleValue];
    double v12 = v9 - v11;

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    double v13 = [NSNumber numberWithDouble:v12];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v14];
  }
}

- (void)setLastNetworkBitmapTimestampFor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A88] deviceRebooted])
  {
    unint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = PLLogNetwork();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "[%@]: Detected that powerlog restarted", (uint8_t *)&v20, 0xCu);
    }

    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"NetworkBitmap"];
    double v8 = [(PLOperator *)self storage];
    double v9 = [v8 lastEntryForKey:v7];

    if (v9
      && ([MEMORY[0x1E4F92A88] deviceBootTime],
          __int16 v10 = objc_claimAutoreleasedReturnValue(),
          [v9 entryDate],
          double v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v10 compare:v11],
          v11,
          v10,
          v12 == -1))
    {
      id v14 = PLLogNetwork();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        long long v15 = [v9 objectForKeyedSubscript:@"MachAbsoluteEndTime"];
        int v20 = 138412546;
        id v21 = v4;
        __int16 v22 = 2112;
        unint64_t v23 = (unint64_t)v15;
        _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Recovered last entry's mach time: %@", (uint8_t *)&v20, 0x16u);
      }
      double v13 = [v9 objectForKeyedSubscript:@"MachAbsoluteEndTime"];
      unint64_t v5 = [v13 unsignedLongLongValue];
    }
    else
    {
      double v13 = PLLogNetwork();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v4;
        _os_log_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: Last entry's mach time not available", (uint8_t *)&v20, 0xCu);
      }
      unint64_t v5 = 0;
    }
  }
  unint64_t v16 = [MEMORY[0x1E4F92A88] getCurrMachAbsTimeInSecs];
  unint64_t v17 = v16 - 3072;
  if (v16 < 0xC00) {
    unint64_t v17 = 0;
  }
  if (v17 <= v5) {
    unint64_t v17 = v5;
  }
  unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFF8;
  [(PLProcessNetworkAgent *)self setLastNetworkBitmapTimestamp:v17 & 0xFFFFFFFFFFFFFFF8];
  id v19 = PLLogNetwork();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v4;
    __int16 v22 = 2048;
    unint64_t v23 = v18;
    _os_log_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps initialized start time: %llu.", (uint8_t *)&v20, 0x16u);
  }
}

- (void)getNetWorkBitmapForEndTime:(unint64_t)a3 andSysdiagnoseTrigger:(BOOL)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    id v7 = @"Sysdiagnose Bitmap";
  }
  else {
    id v7 = @"Bitmap";
  }
  uint64_t v20 = *MEMORY[0x1E4FA8F08];
  v21[0] = MEMORY[0x1E4F1CC38];
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  double v9 = [(PLProcessNetworkAgent *)self usageFeed];
  unint64_t v10 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke;
  void v14[3] = &unk_1E692B3F8;
  long long v15 = v7;
  unint64_t v16 = self;
  BOOL v17 = a4;
  int v11 = [v9 networkBitmapsToDateWithOptionsFor:0 startTime:v10 endTime:a3 options:v8 reply:v14];

  uint64_t v12 = PLLogNetwork();
  double v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: successfully obtained network bitmaps", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v19 = v7;
    _os_log_error_impl(&dword_1D2690000, v13, OS_LOG_TYPE_ERROR, "[%@]: failed to retrieve network bitmaps", buf, 0xCu);
  }
}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLLogNetwork();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_4;
    }
    uint64_t v24 = *(void *)(a1 + 32);
    int v27 = 138412546;
    uint64_t v28 = v24;
    __int16 v29 = 2112;
    unint64_t v30 = (unint64_t)v6;
    BOOL v17 = "[%@]: error in network bitmap callback: %@";
    unint64_t v18 = v7;
    uint32_t v19 = 22;
LABEL_26:
    _os_log_error_impl(&dword_1D2690000, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v27, v19);
    goto LABEL_3;
  }
  if (!v5)
  {
    id v7 = PLLogNetwork();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_3;
    }
    uint64_t v16 = *(void *)(a1 + 32);
    int v27 = 138412290;
    uint64_t v28 = v16;
    BOOL v17 = "[%@]: network bitmap dict is empty";
    unint64_t v18 = v7;
    uint32_t v19 = 12;
    goto LABEL_26;
  }
  double v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA8F10]];
  unint64_t v9 = [v8 unsignedLongLongValue];

  unint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA8EF8]];
  unint64_t v11 = [v10 unsignedLongLongValue];

  uint64_t v12 = PLLogNetwork();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v27 = 138412802;
    uint64_t v28 = v13;
    __int16 v29 = 2048;
    unint64_t v30 = v11;
    __int16 v31 = 2048;
    unint64_t v32 = v9;
    _os_log_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps endtime from symptoms: %llu, start time: %llu", (uint8_t *)&v27, 0x20u);
  }

  if (v11 <= v9)
  {
    uint64_t v20 = PLLogNetwork();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v26 = [*(id *)(a1 + 40) lastNetworkBitmapTimestamp];
      int v27 = 138412802;
      uint64_t v28 = v25;
      __int16 v29 = 2048;
      unint64_t v30 = v11;
      __int16 v31 = 2048;
      unint64_t v32 = v26;
      _os_log_error_impl(&dword_1D2690000, v20, OS_LOG_TYPE_ERROR, "[%@]: End time %llu smaller than start time %llu.", (uint8_t *)&v27, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 40) aggregateAndLogNetworkBitmaps:v5 withStartTime:v9 andEndTime:v11];
    [*(id *)(a1 + 40) setLastNetworkBitmapTimestamp:v11];
    if (*(unsigned char *)(a1 + 48))
    {
      if (v11 < [*(id *)(a1 + 40) curNetworkBitmapTimestampForSysdiagnoseTrigger]
        && [*(id *)(a1 + 40) curNetworkBitmapTimestampForSysdiagnoseTrigger] - v11 >= 8)
      {
        id v14 = PLLogNetwork();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v15 = *(void *)(a1 + 32);
          int v27 = 138412290;
          uint64_t v28 = v15;
          _os_log_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v27, 0xCu);
        }

        [*(id *)(a1 + 40) logEventBackwardNetworkBitmapsSysdiagnoseTrigger];
      }
    }
    else
    {
      unint64_t v21 = [MEMORY[0x1E4F92A88] getCurrMachAbsTimeInSecs];
      if (v21 > v11 && v21 - v11 >= 0x800)
      {
        __int16 v22 = PLLogNetwork();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v23 = *(void *)(a1 + 32);
          int v27 = 138412290;
          uint64_t v28 = v23;
          _os_log_impl(&dword_1D2690000, v22, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v27, 0xCu);
        }

        [*(id *)(a1 + 40) logEventBackwardNetworkBitmaps];
      }
    }
  }
LABEL_4:
}

- (void)logEventBackwardNetworkBitmapsSysdiagnoseTrigger
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
  id v4 = PLLogNetwork();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == -1)
  {
    if (v5)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: initialize last network bitmap log timestamp", (uint8_t *)&v19, 2u);
    }

    [(PLProcessNetworkAgent *)self setLastNetworkBitmapTimestampFor:@"Sysdiagnose Bitmap"];
    [(PLProcessNetworkAgent *)self logEventBackwardNetworkBitmapsSysdiagnoseTrigger];
  }
  else
  {
    if (v5)
    {
      int v19 = 134217984;
      unint64_t v20 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
      _os_log_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps start time: %llu.", (uint8_t *)&v19, 0xCu);
    }

    unint64_t v6 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp] + 1024;
    if ([(PLProcessNetworkAgent *)self curNetworkBitmapTimestampForSysdiagnoseTrigger] == -1)
    {
      -[PLProcessNetworkAgent setCurNetworkBitmapTimestampForSysdiagnoseTrigger:](self, "setCurNetworkBitmapTimestampForSysdiagnoseTrigger:", [MEMORY[0x1E4F92A88] getCurrMachAbsTimeInSecs]);
      id v7 = PLLogNetwork();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [(PLProcessNetworkAgent *)self curNetworkBitmapTimestampForSysdiagnoseTrigger];
        int v19 = 134217984;
        unint64_t v20 = v8;
        _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Setting network bitmaps current time for sysdiagnose trigger: %llu.", (uint8_t *)&v19, 0xCu);
      }
    }
    unint64_t v9 = [(PLProcessNetworkAgent *)self curNetworkBitmapTimestampForSysdiagnoseTrigger];
    unint64_t v10 = PLLogNetwork();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218240;
      unint64_t v20 = v6;
      __int16 v21 = 2048;
      unint64_t v22 = v9;
      _os_log_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps end time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
    }

    if (v9 > v6)
    {
      unint64_t v11 = PLLogNetwork();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
        int v19 = 134218240;
        unint64_t v20 = v12;
        __int16 v21 = 2048;
        unint64_t v22 = v6;
        _os_log_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, end time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v13 = self;
      unint64_t v14 = v6;
LABEL_21:
      [(PLProcessNetworkAgent *)v13 getNetWorkBitmapForEndTime:v14 andSysdiagnoseTrigger:1];
      return;
    }
    unint64_t v15 = v9 - [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
    uint64_t v16 = PLLogNetwork();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15 >= 8)
    {
      if (v17)
      {
        unint64_t v18 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
        int v19 = 134218240;
        unint64_t v20 = v18;
        __int16 v21 = 2048;
        unint64_t v22 = v9;
        _os_log_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v13 = self;
      unint64_t v14 = v9;
      goto LABEL_21;
    }
    if (v17)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requested network bitmap is too recent.", (uint8_t *)&v19, 2u);
    }
  }
}

- (void)logEventBackwardNetworkBitmaps
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp] == -1)
  {
    unint64_t v6 = PLLogNetwork();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_1D2690000, v6, OS_LOG_TYPE_DEFAULT, "[Bitmap]: initialize last network bitmap log timestamp", (uint8_t *)&v8, 2u);
    }

    [(PLProcessNetworkAgent *)self setLastNetworkBitmapTimestampFor:@"Bitmap"];
    [(PLProcessNetworkAgent *)self logEventBackwardNetworkBitmaps];
  }
  else
  {
    unint64_t v3 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp] + 1024;
    unint64_t v4 = [MEMORY[0x1E4F92A88] getCurrMachAbsTimeInSecs];
    BOOL v5 = PLLogNetwork();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218496;
      unint64_t v9 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
      __int16 v10 = 2048;
      unint64_t v11 = v3;
      __int16 v12 = 2048;
      unint64_t v13 = v4;
      _os_log_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEFAULT, "[Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, end time: %llu, curr time: %llu.", (uint8_t *)&v8, 0x20u);
    }

    if (v4 <= v3 || v4 - v3 <= 0x3FF)
    {
      id v7 = PLLogNetwork();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v8) = 0;
        _os_log_error_impl(&dword_1D2690000, v7, OS_LOG_TYPE_ERROR, "[Bitmap]: Requested network bitmap is too recent.", (uint8_t *)&v8, 2u);
      }
    }
    else
    {
      [(PLProcessNetworkAgent *)self getNetWorkBitmapForEndTime:v3 andSysdiagnoseTrigger:0];
    }
  }
}

- (void)accountWithNetworkUsageDiffEntries:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v10 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v10;
      if (qword_1EBD57B00 != -1) {
        dispatch_once(&qword_1EBD57B00, block);
      }
      if (byte_1EBD57AAF)
      {
        unint64_t v11 = [NSString stringWithFormat:@"networkUsageDiffEntries=%@, startDate=%@, endDate=%@", v7, v8, v9];
        __int16 v12 = (void *)MEMORY[0x1E4F929B8];
        unint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        uint64_t v14 = [v13 lastPathComponent];
        unint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1151];

        uint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v103 = v11;
          _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v80 = v9;
    id v81 = v8;
    BOOL v17 = (void *)[&unk_1F29E8EB0 mutableCopy];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v18 = v7;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v95 objects:v101 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v96 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v95 + 1) + 8 * i);
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_346;
          v92[3] = &unk_1E692B3A8;
          id v93 = v17;
          uint64_t v94 = v23;
          [v93 enumerateKeysAndObjectsUsingBlock:v92];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v95 objects:v101 count:16];
      }
      while (v20);
    }

    uint64_t v24 = [v17 objectForKeyedSubscript:@"WifiIn"];
    [v24 doubleValue];
    double v26 = v25;
    int v27 = [v17 objectForKeyedSubscript:@"WifiOut"];
    [v27 doubleValue];
    double v29 = v26 + v28;

    unint64_t v30 = [v17 objectForKeyedSubscript:@"CellIn"];
    [v30 doubleValue];
    double v32 = v31;
    uint64_t v33 = [v17 objectForKeyedSubscript:@"CellOut"];
    [v33 doubleValue];
    double v35 = v32 + v34;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v36 = objc_opt_class();
      v91[0] = MEMORY[0x1E4F143A8];
      v91[1] = 3221225472;
      v91[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_2;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v36;
      if (qword_1EBD57B08 != -1) {
        dispatch_once(&qword_1EBD57B08, v91);
      }
      if (byte_1EBD57AB0)
      {
        v37 = [NSString stringWithFormat:@"totalWiFiUsage=%f, totalBBUsage=%f", *(void *)&v29, *(void *)&v35];
        v38 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v39 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        id v40 = [v39 lastPathComponent];
        id v41 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v38 logMessage:v37 fromFile:v40 fromFunction:v41 fromLineNumber:1168];

        uint64_t v42 = PLLogCommon();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v103 = v37;
          _os_log_debug_impl(&dword_1D2690000, v42, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    v43 = [MEMORY[0x1E4F1CA60] dictionary];
    v85 = [MEMORY[0x1E4F1CA60] dictionary];
    double v44 = v29 + v35;
    v82 = v43;
    if (v29 + v35 > 0.0)
    {
      id v79 = v7;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id obj = v18;
      uint64_t v45 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v84 = *(void *)v88;
        do
        {
          for (uint64_t j = 0; j != v46; ++j)
          {
            if (*(void *)v88 != v84) {
              objc_enumerationMutation(obj);
            }
            uint64_t v48 = *(void **)(*((void *)&v87 + 1) + 8 * j);
            uint64_t v49 = [v48 objectForKeyedSubscript:@"BundleName"];
            uint64_t v50 = [v48 objectForKeyedSubscript:@"ProcessName"];
            uint64_t v51 = [v48 objectForKeyedSubscript:@"ExtensionName"];
            v52 = (void *)v51;
            if (v49) {
              v53 = v49;
            }
            else {
              v53 = v50;
            }
            if (v51) {
              v53 = (void *)v51;
            }
            id v54 = v53;
            double v55 = 0.0;
            double v56 = 0.0;
            if (v29 > 0.0)
            {
              [v48 objectForKeyedSubscript:@"WifiIn"];
              v58 = id v57 = v17;
              [v58 doubleValue];
              double v60 = v59;
              uint64_t v61 = [v48 objectForKeyedSubscript:@"WifiOut"];
              [v61 doubleValue];
              double v56 = (v60 + v62) / v29;

              BOOL v17 = v57;
              v43 = v82;
            }
            v63 = [NSNumber numberWithDouble:v56];
            [v43 setObject:v63 forKeyedSubscript:v54];

            if (v35 > 0.0)
            {
              id v64 = [v48 objectForKeyedSubscript:@"CellIn"];
              [v64 doubleValue];
              double v66 = v65;
              id v67 = [v48 objectForKeyedSubscript:@"CellOut"];
              [v67 doubleValue];
              double v55 = (v66 + v68) / v35;
            }
            long long v69 = [NSNumber numberWithDouble:v55];
            [v85 setObject:v69 forKeyedSubscript:v54];
          }
          uint64_t v46 = [obj countByEnumeratingWithState:&v87 objects:v100 count:16];
        }
        while (v46);
      }

      id v7 = v79;
    }
    id v9 = v80;
    id v8 = v81;
    if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v44))
    {
      uint64_t v70 = objc_opt_class();
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_354;
      v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v86[4] = v70;
      if (qword_1EBD57B10 != -1) {
        dispatch_once(&qword_1EBD57B10, v86);
      }
      if (byte_1EBD57AB1)
      {
        long long v71 = [NSString stringWithFormat:@"identifierToWeightWiFi=%@, identifierToWeightBB=%@", v43, v85];
        long long v72 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v73 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        long long v74 = [v73 lastPathComponent];
        long long v75 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v72 logMessage:v71 fromFile:v74 fromFunction:v75 fromLineNumber:1194];

        long long v76 = PLLogCommon();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          v103 = v71;
          _os_log_debug_impl(&dword_1D2690000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v43 = v82;
      }
    }
    long long v77 = [MEMORY[0x1E4F92900] sharedInstance];
    [v77 createDistributionEventIntervalWithDistributionID:37 withChildNodeNameToWeight:v43 withStartDate:v81 withEndDate:v80];

    uint64_t v78 = [MEMORY[0x1E4F92900] sharedInstance];
    [v78 createDistributionEventIntervalWithDistributionID:38 withChildNodeNameToWeight:v85 withStartDate:v81 withEndDate:v80];
  }
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AAF = result;
  return result;
}

void __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_346(uint64_t a1, void *a2)
{
  unint64_t v3 = NSNumber;
  unint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v11 = [v4 objectForKeyedSubscript:v5];
  [v11 doubleValue];
  double v7 = v6;
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
  [v8 doubleValue];
  uint64_t v10 = [v3 numberWithDouble:v7 + v9];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:v5];
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AB0 = result;
  return result;
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_354(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD57AB1 = result;
  return result;
}

- (void)handleHighBWStartCallback:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "High BW payload: %@", (uint8_t *)&v13, 0xCu);
  }

  double v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"HighCellularBWTransactions"];
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  id v8 = [v4 objectForKeyedSubscript:@"HighThroughputStartReason"];
  [v7 setObject:v8 forKeyedSubscript:@"HighThroughputStartReason"];

  double v9 = [v4 objectForKeyedSubscript:@"HighThroughputLinkRxTputAfterStart"];
  [v7 setObject:v9 forKeyedSubscript:@"HighThroughputLinkRxTputAfterStart"];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"HighThroughputLinkTxTputAfterStart"];
  [v7 setObject:v10 forKeyedSubscript:@"HighThroughputLinkTxTputAfterStart"];

  id v11 = [v4 objectForKeyedSubscript:@"HighThroughputOriginators"];
  __int16 v12 = [v11 componentsJoinedByString:@","];
  [v7 setObject:v12 forKeyedSubscript:@"HighThroughputOriginators"];

  [(PLOperator *)self logEntry:v7];
}

- (void)handleHighBWEndCallback:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v35 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "High BW payload details: %@", buf, 0xCu);
  }

  unint64_t v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"HighCellularBWTransactionsDetail"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F92A20]) initWithEntryKey:v22];
  double v6 = [v3 objectForKeyedSubscript:@"HighThroughputStartReason"];
  [v5 setObject:v6 forKeyedSubscript:@"HighThroughputStartReason"];

  double v7 = [v3 objectForKeyedSubscript:@"HighThroughputLinkRxTputAfterStart"];
  [v5 setObject:v7 forKeyedSubscript:@"HighThroughputLinkRxTputAfterStart"];

  id v8 = [v3 objectForKeyedSubscript:@"HighThroughputLinkTxTputAfterStart"];
  [v5 setObject:v8 forKeyedSubscript:@"HighThroughputLinkTxTputAfterStart"];

  double v9 = [v3 objectForKeyedSubscript:@"HighThroughputOriginators"];
  uint64_t v10 = [v9 componentsJoinedByString:@","];
  [v5 setObject:v10 forKeyedSubscript:@"HighThroughputOriginators"];

  id v11 = [v3 objectForKeyedSubscript:@"HighThroughputDuration"];
  double v26 = v5;
  [v5 setObject:v11 forKeyedSubscript:@"HighThroughputDuration"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v24 = v3;
  id obj = [v3 objectForKeyedSubscript:@"HighThroughputParticipants"];
  uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
        v31[0] = @"Participant";
        BOOL v17 = objc_msgSend(v16, "objectForKeyedSubscript:");
        v32[0] = v17;
        v31[1] = @"Duration";
        id v18 = objc_msgSend(v16, "objectForKeyedSubscript:");
        v32[1] = v18;
        void v31[2] = @"RxBytes";
        uint64_t v19 = [v16 objectForKeyedSubscript:@"RxBytes"];
        void v32[2] = v19;
        v31[3] = @"TxBytes";
        uint64_t v20 = [v16 objectForKeyedSubscript:@"TxBytes"];
        v32[3] = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

        [v26 setObject:&unk_1F29E4E40 forKeyedSubscript:v21];
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v13);
  }

  [(PLOperator *)self logEntry:v26];
}

- (__NStatManager)statManagerRef
{
  return self->_statManagerRef;
}

- (void)setStatManagerRef:(__NStatManager *)a3
{
  self->_statManagerRef = a3;
}

- (UsageFeed)usageFeed
{
  return (UsageFeed *)objc_getProperty(self, a2, 56, 1);
}

- (void)setUsageFeed:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)batteryLevelChangedListenerForNetworkBitmap
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatteryLevelChangedListenerForNetworkBitmap:(id)a3
{
}

- (PLMonotonicTimer)logUsageTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLogUsageTimer:(id)a3
{
}

- (NSDictionary)lastProcessNameToNetworkUsageEntry
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastProcessNameToNetworkUsageEntry:(id)a3
{
}

- (NSDate)lastEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastEntryDate:(id)a3
{
}

- (NSMutableSet)processes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProcesses:(id)a3
{
}

- (unint64_t)lastNetworkBitmapTimestamp
{
  return self->_lastNetworkBitmapTimestamp;
}

- (void)setLastNetworkBitmapTimestamp:(unint64_t)a3
{
  self->_lastNetworkBitmapTimestamp = a3;
}

- (unint64_t)curNetworkBitmapTimestampForSysdiagnoseTrigger
{
  return self->_curNetworkBitmapTimestampForSysdiagnoseTrigger;
}

- (void)setCurNetworkBitmapTimestampForSysdiagnoseTrigger:(unint64_t)a3
{
  self->_curNetworkBitmapTimestampForSysdiagnoseTrigger = a3;
}

- (PLCFNotificationOperatorComposition)flushNetworkBitmapsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFlushNetworkBitmapsListener:(id)a3
{
}

- (PLNSNotificationOperatorComposition)sysdiagnoseListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSysdiagnoseListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)highBWStartListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setHighBWStartListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)highBWEndlistener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setHighBWEndlistener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highBWEndlistener, 0);
  objc_storeStrong((id *)&self->_highBWStartListener, 0);
  objc_storeStrong((id *)&self->_sysdiagnoseListener, 0);
  objc_storeStrong((id *)&self->_flushNetworkBitmapsListener, 0);
  objc_storeStrong((id *)&self->_processes, 0);
  objc_storeStrong((id *)&self->_lastEntryDate, 0);
  objc_storeStrong((id *)&self->_lastProcessNameToNetworkUsageEntry, 0);
  objc_storeStrong((id *)&self->_logUsageTimer, 0);
  objc_storeStrong((id *)&self->_batteryLevelChangedListenerForNetworkBitmap, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_usageFeed, 0);
}

@end