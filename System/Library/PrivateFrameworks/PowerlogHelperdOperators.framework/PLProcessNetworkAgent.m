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

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLProcessNetworkAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"Connection";
  objc_super v2 = +[PLProcessNetworkAgent entryEventPointDefinitionConnection];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointDefinitionConnection
{
  v43[2] = *MEMORY[0x1E4F143B8];
  v42[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v40[0] = *MEMORY[0x1E4F92CD0];
  v40[1] = v2;
  v41[0] = &unk_1F4011F48;
  v41[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C28];
  v40[2] = *MEMORY[0x1E4F92C30];
  v40[3] = v3;
  v41[2] = &unk_1F400CB68;
  v41[3] = &unk_1F400CB80;
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
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v39[11] = v5;
  v38[12] = @"rxCellularBytes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v39[12] = v7;
  v38[13] = @"txCellularBytes";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v39[13] = v9;
  v38[14] = @"isChannelArch";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
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
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

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
  v5 = @"UsageDiff";
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
  v28[0] = &unk_1F4011F58;
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
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v26[2] = v5;
  v25[3] = @"MachAbsoluteEndTime";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v26[3] = v7;
  v25[4] = *MEMORY[0x1E4FA8F18];
  uint64_t v23 = *MEMORY[0x1E4F92D10];
  uint64_t v8 = v23;
  v24 = &unk_1F400CB98;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  v26[4] = v9;
  v25[5] = *MEMORY[0x1E4FA8EF0];
  uint64_t v21 = v8;
  v22 = &unk_1F400CB98;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  v26[5] = v10;
  v25[6] = *MEMORY[0x1E4FA8F00];
  uint64_t v19 = v8;
  v20 = &unk_1F400CB98;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
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
  v12[0] = &unk_1F4011F68;
  v12[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"Mode";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
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
  v26[0] = &unk_1F4011F78;
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
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v24[5] = v6;
  v23[6] = @"CellOut";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"SinceTime";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v24[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
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
  v26[0] = &unk_1F4011F78;
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
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v24[5] = v6;
  v23[6] = @"CellOut";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"timestampEnd";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v24[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactions
{
  v19[2] = *MEMORY[0x1E4F143B8];
  v18[0] = *MEMORY[0x1E4F92C50];
  uint64_t v16 = *MEMORY[0x1E4F92CD0];
  v17 = &unk_1F4011F68;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v19[0] = v13;
  v18[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"HighThroughputStartReason";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v15[0] = v3;
  v14[1] = @"HighThroughputLinkRxTputAfterStart";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v15[1] = v5;
  v14[2] = @"HighThroughputLinkTxTputAfterStart";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v15[2] = v7;
  void v14[3] = @"HighThroughputOriginators";
  uint64_t v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v15[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
  v19[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionHighCellularBWTransactionsDetail
{
  v38[3] = *MEMORY[0x1E4F143B8];
  v37[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C60];
  v35[0] = *MEMORY[0x1E4F92CD0];
  v35[1] = v2;
  v36[0] = &unk_1F4011F68;
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
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v30[2] = v5;
  v29[3] = @"TxBytes";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v30[3] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:4];
  v31[1] = @"value";
  v32[0] = v8;
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v32[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
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

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_processesOfInterest_ name:@"PLProcessNetworkAgent.addProcessesOfInterest" object:0];
  }
  return v2;
}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Failed to create NStatManager, not tracking network connection statistics", v2, v3, v4, v5, v6);
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

void __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLLogNetwork();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5_cold_1();
  }

  uint64_t v5 = [v3 objectForKeyedSubscript:@"Source"];
  if (v5)
  {
    uint8_t v6 = (void *)v5;
    objc_super v7 = [v3 objectForKeyedSubscript:@"Source"];
    int v8 = [v7 isEqual:&unk_1F400CBB0];

    if (v8)
    {
      [*(id *)(a1 + 32) setCurNetworkBitmapTimestampForSysdiagnoseTrigger:-1];
      [*(id *)(a1 + 32) logEventBackwardNetworkBitmapsSysdiagnoseTrigger];
    }
  }
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
  uint64_t v4 = [a3 userInfo];
  if (v4)
  {
    id v8 = v4;
    uint64_t v5 = [v4 objectForKeyedSubscript:@"entry"];
    if (v5)
    {
      uint8_t v6 = [(PLProcessNetworkAgent *)self processes];
      objc_super v7 = [v8 objectForKeyedSubscript:@"entry"];
      [v6 unionSet:v7];
    }
    uint64_t v4 = v8;
  }
}

- (void)didAddNewSource:(__NStatSource *)a3
{
  uint64_t v5 = [[PLProcessNetworkSource alloc] initWithSource:a3];
  NStatSourceSetCountsBlock();
  uint64_t v4 = v5;
  NStatSourceSetDescriptionBlock();
  id v3 = v4;
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
    uint64_t v5 = PLLogNetwork();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLProcessNetworkAgent didSetCountsBlock:withCounts:]();
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
    id v8 = [v6 descriptionDictionary];

    if (v8)
    {
      v9 = [v6 descriptionDictionary];
      v10 = (void *)MEMORY[0x1E4F7A198];
      v11 = [v9 objectForCFString:*MEMORY[0x1E4F7A198]];

      v12 = [v7 objectForCFString:*v10];
      v13 = [v6 descriptionDictionary];
      v14 = (void *)MEMORY[0x1E4F7A1E0];
      v15 = [v13 objectForCFString:*MEMORY[0x1E4F7A1E0]];

      uint64_t v16 = [v7 objectForCFString:*v14];
      v17 = [v6 descriptionDictionary];
      v18 = (void *)MEMORY[0x1E4F7A1D8];
      uint64_t v19 = [v17 objectForCFString:*MEMORY[0x1E4F7A1D8]];

      v20 = [v7 objectForCFString:*v18];
      if ([v15 isEqualToString:v16])
      {
        uint64_t v21 = PLLogNetwork();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          [v6 descriptionDictionary];
          uint64_t v23 = v22 = v11;
          *(_DWORD *)buf = 138412546;
          v39 = v23;
          __int16 v40 = 2112;
          id v41 = v7;
          _os_log_impl(&dword_1E4220000, v21, OS_LOG_TYPE_DEFAULT, "WARNING: new description dictionary with same process name: %@ => %@", buf, 0x16u);

          v11 = v22;
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
      uint64_t v27 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
      v28 = v11;
      v29 = (void *)v27;
      v37 = v28;
      int v30 = [v28 isEqualToNumber:v27];

      v31 = [MEMORY[0x1E4F28ED0] numberWithInt:0];
      v36 = v26;
      int v32 = [v26 isEqualToNumber:v31];

      if (v30)
      {
        uint64_t v19 = v35;
        if (v32)
        {
          v33 = PLLogNetwork();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v34 = "WARNING: new dictionary with same process name and same zeroth interface number";
LABEL_19:
            _os_log_impl(&dword_1E4220000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 2u);
            goto LABEL_20;
          }
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v19 = v35;
        if (v32)
        {
          v33 = PLLogNetwork();
          v12 = v36;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v34 = "WARNING: new dictionary with same process name but new zeroth interface number";
            goto LABEL_19;
          }
LABEL_20:

          v11 = v37;
          goto LABEL_22;
        }
      }
      [(PLProcessNetworkAgent *)self transferSource:v6 fromPID:v19 toPID:v20];
      [v6 setDescriptionDictionary:v7];
      [(PLProcessNetworkAgent *)self logEventPointConnectionEvent:2 forSource:v6];
      v12 = v36;
      v11 = v37;
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
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PLProcessNetworkAgent didSetDescriptionBlock:withDescription:]();
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
  context = (void *)MEMORY[0x1E4E7EF70]();
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
        v9 = objc_msgSend(v56, "objectForKeyedSubscript:");
        v10 = v9;
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
                uint64_t v19 = [v16 objectForKeyedSubscript:v7];
                v20 = [(PLProcessNetworkAgent *)self compressNetworkBitmap:v19];

                if (v20)
                {
                  uint64_t v21 = [v5 objectForKeyedSubscript:v15];
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
            _os_log_debug_impl(&dword_1E4220000, v22, OS_LOG_TYPE_DEBUG, "%@ interface does not exist in outcome dict from symptoms.", buf, 0xCu);
          }
        }
        uint64_t v8 = v62 + 1;
      }
      while (v62 + 1 != v57);
      uint64_t v57 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
    }
    while (v57);
  }

  uint64_t v23 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"NetworkBitmap"];
  id v72 = 0;
  uint64_t v73 = 0;
  +[PLUtilities getCurrentMonotonicAndMachAbsTime:&v72 machAbsTime:&v73 machContTime:0];
  id v58 = v72;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v24 = v5;
  uint64_t v65 = [v24 countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (v65)
  {
    uint64_t v63 = *(void *)v69;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v69 != v63) {
          objc_enumerationMutation(v24);
        }
        v26 = *(void **)(*((void *)&v68 + 1) + 8 * v25);
        uint64_t v27 = PLLogNetwork();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v85 = v26;
          _os_log_debug_impl(&dword_1E4220000, v27, OS_LOG_TYPE_DEBUG, "Process %@'s network bitmaps", buf, 0xCu);
        }

        v28 = [v24 objectForKeyedSubscript:v26];
        v29 = [v28 objectForKeyedSubscript:v61];
        if (v29) {
          goto LABEL_34;
        }
        int v30 = v23;
        v29 = [v24 objectForKeyedSubscript:v26];
        v31 = [v29 objectForKeyedSubscript:v60];
        if (v31)
        {

LABEL_34:
LABEL_35:
          int v32 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v23];
          [v32 setEntryDate:v58];
          v33 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v73];
          [v32 setObject:v33 forKeyedSubscript:@"CurrentMachAbsoluteTime"];

          [v32 setObject:v26 forKeyedSubscript:@"BundleName"];
          v34 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a4];
          [v32 setObject:v34 forKeyedSubscript:@"MachAbsoluteStartTime"];

          v35 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a5];
          [v32 setObject:v35 forKeyedSubscript:@"MachAbsoluteEndTime"];

          v36 = [v24 objectForKeyedSubscript:v26];
          v37 = [v36 objectForKeyedSubscript:v61];
          [v32 setObject:v37 forKeyedSubscript:v61];

          v38 = [v24 objectForKeyedSubscript:v26];
          v39 = [v38 objectForKeyedSubscript:v60];
          [v32 setObject:v39 forKeyedSubscript:v60];

          __int16 v40 = [v24 objectForKeyedSubscript:v26];
          id v41 = [v40 objectForKeyedSubscript:v59];
          [v32 setObject:v41 forKeyedSubscript:v59];

          [(PLOperator *)self logEntry:v32];
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v42 = [v24 objectForKeyedSubscript:v26];
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
          if (aggregateAndLogNetworkBitmaps_withStartTime_andEndTime__defaultOnce != -1) {
            dispatch_once(&aggregateAndLogNetworkBitmaps_withStartTime_andEndTime__defaultOnce, block);
          }
          if (aggregateAndLogNetworkBitmaps_withStartTime_andEndTime__classDebugEnabled)
          {
            int v32 = [NSString stringWithFormat:@"Process %@'s network bitmaps on all interfaces are empty.", v26];
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
              _os_log_debug_impl(&dword_1E4220000, v49, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            uint64_t v23 = v30;
            goto LABEL_36;
          }
        }
LABEL_37:
        ++v25;
      }
      while (v65 != v25);
      uint64_t v50 = [v24 countByEnumeratingWithState:&v68 objects:v82 count:16];
      uint64_t v65 = v50;
    }
    while (v50);
  }
}

uint64_t __80__PLProcessNetworkAgent_aggregateAndLogNetworkBitmaps_withStartTime_andEndTime___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  aggregateAndLogNetworkBitmaps_withStartTime_andEndTime__classDebugEnabled = result;
  return result;
}

- (id)compressNetworkBitmap:(id)a3
{
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
      uint64_t v19 = (void *)(v7 + 8 * v16 - 8);
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
      uint64_t v23 = (uint64_t *)[v6 bytes];
      do
      {
        uint64_t v24 = *v23++;
        uint64_t v25 = v24;
        [v15 appendBytes:&v25 length:8];
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
    if (compressNetworkBitmap__defaultOnce != -1) {
      dispatch_once(&compressNetworkBitmap__defaultOnce, block);
    }
    if (compressNetworkBitmap__classDebugEnabled)
    {
      v9 = [NSString stringWithFormat:@"Network bitmap's size is not a multiple of 64 bits."];
      v10 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
      uint64_t v12 = [v11 lastPathComponent];
      uint64_t v13 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent compressNetworkBitmap:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:682];

      v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
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
  compressNetworkBitmap__classDebugEnabled = result;
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
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E4F92A30];
  uint64_t v8 = [v6 descriptionDictionary];
  v9 = [v8 objectForCFString:*MEMORY[0x1E4F7A198]];
  v10 = [v7 interfaceNameForIndex:v9];

  uint64_t v11 = [v6 descriptionDictionary];
  uint64_t v12 = [v11 objectForCFString:*MEMORY[0x1E4F7A1B0]];
  if ([v12 BOOLValue])
  {

    goto LABEL_4;
  }
  uint64_t v13 = [v6 descriptionDictionary];
  v14 = [v13 objectForCFString:*MEMORY[0x1E4F7A1B8]];
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
          uint64_t v19 = [v18 objectForCFString:*MEMORY[0x1E4F7A1B8]];
          char v20 = [v19 BOOLValue];

          if (v20) {
            goto LABEL_28;
          }
        }
        v83 = self;
        unint64_t v21 = [v6 descriptionDictionary];
        v22 = (void *)MEMORY[0x1E4F7A1D0];
        uint64_t v23 = [v21 objectForCFString:*MEMORY[0x1E4F7A1D0]];

        uint64_t v24 = [v6 descriptionDictionary];
        uint64_t v25 = (void *)MEMORY[0x1E4F7A1E8];
        v26 = [v24 objectForCFString:*MEMORY[0x1E4F7A1E8]];

        if (v23 && v26)
        {
          long long v80 = v26;
          long long v81 = v23;
          uint64_t v27 = (void *)MEMORY[0x1E4F92A30];
          v28 = [v6 descriptionDictionary];
          CFDataRef v29 = [v28 objectForCFString:*v22];
          int v30 = [v27 sockaddrToNSDictionary:CFDataGetBytePtr(v29)];

          v31 = (void *)MEMORY[0x1E4F92A30];
          int v32 = [v6 descriptionDictionary];
          CFDataRef v33 = [v32 objectForCFString:*v25];
          v34 = [v31 sockaddrToNSDictionary:CFDataGetBytePtr(v33)];

          long long v79 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Connection"];
          v35 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v79];
          [(PLProcessNetworkAgent *)v83 timestampNetConnectEntry:v35 withEventType:v4 withSource:v6];
          [v35 setObject:v17 forKeyedSubscript:@"ProcessName"];
          [v35 setObject:v10 forKeyedSubscript:@"InterfaceName"];
          v36 = [v6 descriptionDictionary];
          v37 = [v36 objectForCFString:*MEMORY[0x1E4F7A1D8]];
          [v35 setObject:v37 forKeyedSubscript:@"ProcessPID"];

          v38 = [v30 objectForKey:@"address"];
          [v35 setObject:v38 forKeyedSubscript:@"LocalAddress"];

          v39 = [v30 objectForKey:@"port"];
          [v35 setObject:v39 forKeyedSubscript:@"LocalPort"];

          __int16 v40 = [v34 objectForKey:@"address"];
          [v35 setObject:v40 forKeyedSubscript:@"RemoteAddress"];

          id v41 = [v34 objectForKey:@"port"];
          [v35 setObject:v41 forKeyedSubscript:@"RemotePort"];

          uint64_t v42 = (void *)MEMORY[0x1E4F92A30];
          v43 = [v6 descriptionDictionary];
          uint64_t v44 = [v43 objectForCFString:*MEMORY[0x1E4F7A218]];
          v45 = objc_msgSend(v42, "stringFromTrafficClass:", objc_msgSend(v44, "intValue"));
          [v35 setObject:v45 forKeyedSubscript:@"TrafficClass"];

          v46 = [v6 descriptionDictionary];
          v47 = [v46 objectForCFString:*MEMORY[0x1E4F7A208]];
          [v35 setObject:v47 forKeyedSubscript:@"rxWifiBytes"];

          v48 = [v6 descriptionDictionary];
          v49 = [v48 objectForCFString:*MEMORY[0x1E4F7A238]];
          [v35 setObject:v49 forKeyedSubscript:@"txWifiBytes"];

          uint64_t v50 = [v6 descriptionDictionary];
          v51 = [v50 objectForCFString:*MEMORY[0x1E4F7A1F8]];
          [v35 setObject:v51 forKeyedSubscript:@"rxCellularBytes"];

          v52 = [v6 descriptionDictionary];
          v53 = [v52 objectForCFString:*MEMORY[0x1E4F7A228]];
          [v35 setObject:v53 forKeyedSubscript:@"txCellularBytes"];

          v54 = [v6 descriptionDictionary];
          uint64_t v55 = (void *)MEMORY[0x1E4F7A188];
          id v56 = [v54 objectForCFString:*MEMORY[0x1E4F7A188]];

          if (v56)
          {
            uint64_t v57 = [v6 descriptionDictionary];
            id v58 = [v57 objectForCFString:*v55];
            uint64_t v59 = [v58 BOOLValue];
          }
          else
          {
            uint64_t v59 = 0;
          }
          long long v78 = [MEMORY[0x1E4F28ED0] numberWithBool:v59];
          [v35 setObject:v78 forKeyedSubscript:@"isChannelArch"];

          [(PLOperator *)v83 logEntry:v35];
          uint64_t v23 = v81;
          v26 = v80;
        }
        else if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v69 = objc_opt_class();
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_279;
          v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v84[4] = v69;
          if (logEventPointConnectionEvent_forSource__defaultOnce_277 != -1) {
            dispatch_once(&logEventPointConnectionEvent_forSource__defaultOnce_277, v84);
          }
          if (logEventPointConnectionEvent_forSource__classDebugEnabled_278)
          {
            v82 = v23;
            long long v70 = NSString;
            long long v71 = [(PLOperator *)v83 className];
            id v72 = [v70 stringWithFormat:@"%@: statsrckeylocal or statsrckeylocal is null for processName=%@", v71, v17];

            uint64_t v73 = (void *)MEMORY[0x1E4F929B8];
            long long v74 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
            long long v75 = [v74 lastPathComponent];
            long long v76 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]"];
            [v73 logMessage:v72 fromFile:v75 fromFunction:v76 fromLineNumber:766];

            long long v77 = PLLogCommon();
            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }

            uint64_t v23 = v82;
          }
        }
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_28;
        }
        uint64_t v60 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v60;
        if (logEventPointConnectionEvent_forSource__defaultOnce != -1) {
          dispatch_once(&logEventPointConnectionEvent_forSource__defaultOnce, block);
        }
        if (!logEventPointConnectionEvent_forSource__classDebugEnabled) {
          goto LABEL_28;
        }
        uint64_t v61 = NSString;
        uint64_t v62 = [(PLOperator *)self className];
        uint64_t v63 = [v6 descriptionDictionary];
        uint64_t v64 = [v61 stringWithFormat:@"%@: processName length == 0 detected, source = %@", v62, v63];

        uint64_t v65 = (void *)MEMORY[0x1E4F929B8];
        v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        v67 = [v66 lastPathComponent];
        long long v68 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent logEventPointConnectionEvent:forSource:]"];
        [v65 logMessage:v64 fromFile:v67 fromFunction:v68 fromLineNumber:747];

        v26 = PLLogCommon();
        uint64_t v23 = (void *)v64;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
LABEL_28:
  }
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointConnectionEvent_forSource__classDebugEnabled = result;
  return result;
}

uint64_t __64__PLProcessNetworkAgent_logEventPointConnectionEvent_forSource___block_invoke_279(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointConnectionEvent_forSource__classDebugEnabled_278 = result;
  return result;
}

- (void)timestampNetConnectEntry:(id)a3 withEventType:(signed __int16)a4 withSource:(id)a5
{
  uint64_t v6 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = mach_continuous_time();
  v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithShort:v6];
  [v7 setObject:v11 forKeyedSubscript:@"EventType"];

  [v7 setEntryDate:v10];
  if (v6 <= 1)
  {
    uint64_t v12 = [v8 descriptionDictionary];
    uint64_t v13 = (void *)MEMORY[0x1E4F7A210];
    v14 = [v12 objectForCFString:*MEMORY[0x1E4F7A210]];

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
        if (timestampNetConnectEntry_withEventType_withSource__defaultOnce != -1) {
          dispatch_once(&timestampNetConnectEntry_withEventType_withSource__defaultOnce, block);
        }
        if (timestampNetConnectEntry_withEventType_withSource__classDebugEnabled)
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
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v38 = &unk_1F400CBE0;
      goto LABEL_32;
    }
    int v15 = [v8 descriptionDictionary];
    unint64_t v16 = [v15 objectForCFString:*v13];
    uint64_t v17 = [v16 unsignedLongLongValue];

    if (v6 == 1)
    {
      uint64_t v18 = [v8 descriptionDictionary];
      uint64_t v19 = (void *)MEMORY[0x1E4F7A190];
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
          if (timestampNetConnectEntry_withEventType_withSource__defaultOnce_294 != -1) {
            dispatch_once(&timestampNetConnectEntry_withEventType_withSource__defaultOnce_294, v63);
          }
          if (timestampNetConnectEntry_withEventType_withSource__classDebugEnabled_295)
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
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
        v38 = &unk_1F400CBF8;
        goto LABEL_32;
      }
      unint64_t v21 = [v8 descriptionDictionary];
      v22 = [v21 objectForCFString:*v19];
      uint64_t v23 = [v22 integerValue];

      v17 += v23;
    }
    +[PLUtilities secondsFromMachTime:v9];
    double v25 = v24;
    +[PLUtilities secondsFromMachTime:v17];
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
        if (timestampNetConnectEntry_withEventType_withSource__defaultOnce_302 != -1) {
          dispatch_once(&timestampNetConnectEntry_withEventType_withSource__defaultOnce_302, &v58);
        }
        if (timestampNetConnectEntry_withEventType_withSource__classDebugEnabled_303)
        {
          CFDataRef v29 = NSString;
          int v30 = [v8 descriptionDictionary];
          v31 = [v10 dateByAddingTimeInterval:-v27];
          int v32 = [v29 stringWithFormat:@"Flow from %@ ends in the future -- Now: %@ End Date: %@ currentMachTime: %llu providedMachTime: %llu", v30, v10, v31, v9, v17, v58, v59, v60, v61, v62];

          CFDataRef v33 = (void *)MEMORY[0x1E4F929B8];
          v34 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
          v35 = [v34 lastPathComponent];
          v36 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent timestampNetConnectEntry:withEventType:withSource:]"];
          [v33 logMessage:v32 fromFile:v35 fromFunction:v36 fromLineNumber:833];

          v37 = PLLogCommon();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v38 = &unk_1F400CC10;
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
  timestampNetConnectEntry_withEventType_withSource__classDebugEnabled = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_296(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  timestampNetConnectEntry_withEventType_withSource__classDebugEnabled_295 = result;
  return result;
}

uint64_t __75__PLProcessNetworkAgent_timestampNetConnectEntry_withEventType_withSource___block_invoke_304(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  timestampNetConnectEntry_withEventType_withSource__classDebugEnabled_303 = result;
  return result;
}

- (void)logEventBackwardUsage
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "failed to retrieve network usage data", v2, v3, v4, v5, v6);
}

uint64_t __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) logEventBackwardUsageWithOutcome:a2];
}

void __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_311(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = PLLogNetwork();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_311_cold_1(a1, (uint64_t)v3, v4);
  }

  uint64_t v5 = *(void **)(a1 + 32);
  uint8_t v6 = (void *)[v3 copy];
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
        uint64_t v11 = objc_msgSend(v3, "valueForKey:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
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
      _os_log_impl(&dword_1E4220000, v3, OS_LOG_TYPE_DEFAULT, "NetworkUsage outcome has payload size: %lu", (uint8_t *)&buf, 0xCu);
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
          uint64_t v9 = (void *)MEMORY[0x1E4E7EF70]();
          v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v52 withDate:v54];
          uint64_t v11 = [v8 valueForKey:v50];
          [v10 setObject:v11 forKeyedSubscript:@"ProcessName"];
          double v12 = [v8 valueForKey:v49];
          [v10 setObject:v12 forKeyedSubscript:@"BundleName"];

          double v13 = [v8 valueForKey:v48];
          [v10 setObject:v13 forKeyedSubscript:@"ExtensionName"];

          v14 = [v8 valueForKey:v47];
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
          uint64_t v19 = [v10 dictionary];
          v66[0] = MEMORY[0x1E4F143A8];
          v66[1] = 3221225472;
          v66[2] = __58__PLProcessNetworkAgent_logEventBackwardUsageWithOutcome___block_invoke;
          v66[3] = &unk_1E6E48FE8;
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
              v63[3] = &unk_1E6E47BA8;
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
                v55[3] = &unk_1E6E49010;
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
      && !+[PLUtilities isPowerlogHelperd])
    {
      long long v75 = v52;
      v34 = [v43 allValues];
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
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[PLProcessNetworkAgent logEventBackwardUsageWithOutcome:]();
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
    v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:v14];
    [v10 doubleValue];
    double v12 = v9 - v11;

    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12
                                                                + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
    double v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:v12];
    [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v14];
  }
}

- (void)setLastNetworkBitmapTimestampFor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[PLUtilities deviceRebooted])
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
      _os_log_impl(&dword_1E4220000, v6, OS_LOG_TYPE_DEFAULT, "[%@]: Detected that powerlog restarted", (uint8_t *)&v20, 0xCu);
    }

    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"NetworkBitmap"];
    double v8 = [(PLOperator *)self storage];
    double v9 = [v8 lastEntryForKey:v7];

    if (v9
      && (+[PLUtilities deviceBootTime],
          v10 = objc_claimAutoreleasedReturnValue(),
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
        _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: Recovered last entry's mach time: %@", (uint8_t *)&v20, 0x16u);
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
        _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: Last entry's mach time not available", (uint8_t *)&v20, 0xCu);
      }
      unint64_t v5 = 0;
    }
  }
  unint64_t v16 = +[PLUtilities getCurrMachAbsTimeInSecs];
  unint64_t v17 = v16 - 3072;
  if (v16 < 0xC00) {
    unint64_t v17 = 0;
  }
  if (v17 <= v5) {
    unint64_t v17 = v5;
  }
  unint64_t v18 = v17 & 0xFFFFFFFFFFFFFFF8;
  [(PLProcessNetworkAgent *)self setLastNetworkBitmapTimestamp:v17 & 0xFFFFFFFFFFFFFFF8];
  uint64_t v19 = PLLogNetwork();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v4;
    __int16 v22 = 2048;
    unint64_t v23 = v18;
    _os_log_impl(&dword_1E4220000, v19, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps initialized start time: %llu.", (uint8_t *)&v20, 0x16u);
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
  void v14[3] = &unk_1E6E49038;
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
      uint64_t v19 = v7;
      _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEFAULT, "[%@]: successfully obtained network bitmaps", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    -[PLProcessNetworkAgent getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:]();
  }
}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLLogNetwork();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_3(a1, (uint64_t)v6, v7);
    }
LABEL_4:

    goto LABEL_5;
  }
  if (!v5)
  {
    id v7 = PLLogNetwork();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_1(a1, v7);
    }
    goto LABEL_4;
  }
  double v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA8F10]];
  unint64_t v9 = [v8 unsignedLongLongValue];

  unint64_t v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4FA8EF8]];
  unint64_t v11 = [v10 unsignedLongLongValue];

  uint64_t v12 = PLLogNetwork();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v20 = 138412802;
    uint64_t v21 = v13;
    __int16 v22 = 2048;
    unint64_t v23 = v11;
    __int16 v24 = 2048;
    unint64_t v25 = v9;
    _os_log_impl(&dword_1E4220000, v12, OS_LOG_TYPE_DEFAULT, "[%@]: Network bitmaps endtime from symptoms: %llu, start time: %llu", (uint8_t *)&v20, 0x20u);
  }

  if (v11 <= v9)
  {
    unint64_t v16 = PLLogNetwork();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_2(a1, v11, v16);
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
          int v20 = 138412290;
          uint64_t v21 = v15;
          _os_log_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v20, 0xCu);
        }

        [*(id *)(a1 + 40) logEventBackwardNetworkBitmapsSysdiagnoseTrigger];
      }
    }
    else
    {
      unint64_t v17 = +[PLUtilities getCurrMachAbsTimeInSecs];
      if (v17 > v11 && v17 - v11 >= 0x800)
      {
        unint64_t v18 = PLLogNetwork();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v20 = 138412290;
          uint64_t v21 = v19;
          _os_log_impl(&dword_1E4220000, v18, OS_LOG_TYPE_DEFAULT, "[%@]: trying to retrieve more network bitmaps", (uint8_t *)&v20, 0xCu);
        }

        [*(id *)(a1 + 40) logEventBackwardNetworkBitmaps];
      }
    }
  }
LABEL_5:
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
      _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: initialize last network bitmap log timestamp", (uint8_t *)&v19, 2u);
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
      _os_log_impl(&dword_1E4220000, v4, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps start time: %llu.", (uint8_t *)&v19, 0xCu);
    }

    unint64_t v6 = [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp] + 1024;
    if ([(PLProcessNetworkAgent *)self curNetworkBitmapTimestampForSysdiagnoseTrigger] == -1)
    {
      [(PLProcessNetworkAgent *)self setCurNetworkBitmapTimestampForSysdiagnoseTrigger:+[PLUtilities getCurrMachAbsTimeInSecs]];
      id v7 = PLLogNetwork();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [(PLProcessNetworkAgent *)self curNetworkBitmapTimestampForSysdiagnoseTrigger];
        int v19 = 134217984;
        unint64_t v20 = v8;
        _os_log_impl(&dword_1E4220000, v7, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Setting network bitmaps current time for sysdiagnose trigger: %llu.", (uint8_t *)&v19, 0xCu);
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
      _os_log_impl(&dword_1E4220000, v10, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Network bitmaps end time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
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
        _os_log_impl(&dword_1E4220000, v11, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, end time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v13 = self;
      unint64_t v14 = v6;
LABEL_21:
      [(PLProcessNetworkAgent *)v13 getNetWorkBitmapForEndTime:v14 andSysdiagnoseTrigger:1];
      return;
    }
    unint64_t v15 = v9 - [(PLProcessNetworkAgent *)self lastNetworkBitmapTimestamp];
    unint64_t v16 = PLLogNetwork();
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
        _os_log_impl(&dword_1E4220000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requesting network bitmaps from symptoms with start time: %llu, curr time: %llu.", (uint8_t *)&v19, 0x16u);
      }

      uint64_t v13 = self;
      unint64_t v14 = v9;
      goto LABEL_21;
    }
    if (v17)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1E4220000, v16, OS_LOG_TYPE_DEFAULT, "[Sysdiagnose Bitmap]: Requested network bitmap is too recent.", (uint8_t *)&v19, 2u);
    }
  }
}

- (void)logEventBackwardNetworkBitmaps
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "[Bitmap]: Requested network bitmap is too recent.", v2, v3, v4, v5, v6);
}

- (void)accountWithNetworkUsageDiffEntries:(id)a3 withStartDate:(id)a4 withEndDate:(id)a5
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
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
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce != -1) {
        dispatch_once(&accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce, block);
      }
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled)
      {
        unint64_t v11 = [NSString stringWithFormat:@"networkUsageDiffEntries=%@, startDate=%@, endDate=%@", v7, v8, v9];
        unint64_t v12 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        unint64_t v14 = [v13 lastPathComponent];
        unint64_t v15 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1151];

        unint64_t v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    id v78 = v9;
    v83 = (void *)[&unk_1F400F740 mutableCopy];
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v93 objects:v99 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v94 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v93 + 1) + 8 * i);
          v90[0] = MEMORY[0x1E4F143A8];
          v90[1] = 3221225472;
          v90[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_346;
          v90[3] = &unk_1E6E47BA8;
          id v91 = v83;
          uint64_t v92 = v22;
          [v91 enumerateKeysAndObjectsUsingBlock:v90];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v93 objects:v99 count:16];
      }
      while (v19);
    }

    uint64_t v23 = [v83 objectForKeyedSubscript:@"WifiIn"];
    [v23 doubleValue];
    double v25 = v24;
    uint64_t v26 = [v83 objectForKeyedSubscript:@"WifiOut"];
    [v26 doubleValue];
    double v28 = v25 + v27;

    id v29 = [v83 objectForKeyedSubscript:@"CellIn"];
    [v29 doubleValue];
    double v31 = v30;
    double v32 = [v83 objectForKeyedSubscript:@"CellOut"];
    [v32 doubleValue];
    double v34 = v31 + v33;

    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v35 = objc_opt_class();
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_2;
      v89[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v89[4] = v35;
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce_347 != -1) {
        dispatch_once(&accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce_347, v89);
      }
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled_348)
      {
        v36 = [NSString stringWithFormat:@"totalWiFiUsage=%f, totalBBUsage=%f", *(void *)&v28, *(void *)&v34];
        v37 = (void *)MEMORY[0x1E4F929B8];
        v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        uint64_t v39 = [v38 lastPathComponent];
        id v40 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:1168];

        id v41 = PLLogCommon();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    v82 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v81 = [MEMORY[0x1E4F1CA60] dictionary];
    double v42 = v28 + v34;
    if (v28 + v34 > 0.0)
    {
      id v76 = v8;
      id v77 = v7;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id obj = v17;
      uint64_t v43 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v80 = *(void *)v86;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v86 != v80) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void **)(*((void *)&v85 + 1) + 8 * j);
            uint64_t v47 = [v46 objectForKeyedSubscript:@"BundleName"];
            uint64_t v48 = [v46 objectForKeyedSubscript:@"ProcessName"];
            uint64_t v49 = [v46 objectForKeyedSubscript:@"ExtensionName"];
            uint64_t v50 = (void *)v49;
            if (v47) {
              uint64_t v51 = v47;
            }
            else {
              uint64_t v51 = v48;
            }
            if (v49) {
              uint64_t v51 = (void *)v49;
            }
            id v52 = v51;
            double v53 = 0.0;
            double v54 = 0.0;
            if (v28 > 0.0)
            {
              uint64_t v55 = [v46 objectForKeyedSubscript:@"WifiIn"];
              [v55 doubleValue];
              double v57 = v56;
              uint64_t v58 = [v46 objectForKeyedSubscript:@"WifiOut"];
              [v58 doubleValue];
              double v54 = (v57 + v59) / v28;
            }
            uint64_t v60 = [MEMORY[0x1E4F28ED0] numberWithDouble:v54];
            [v82 setObject:v60 forKeyedSubscript:v52];

            if (v34 > 0.0)
            {
              uint64_t v61 = [v46 objectForKeyedSubscript:@"CellIn"];
              [v61 doubleValue];
              double v63 = v62;
              id v64 = [v46 objectForKeyedSubscript:@"CellOut"];
              [v64 doubleValue];
              double v53 = (v63 + v65) / v34;
            }
            v66 = [MEMORY[0x1E4F28ED0] numberWithDouble:v53];
            [v81 setObject:v66 forKeyedSubscript:v52];
          }
          uint64_t v44 = [obj countByEnumeratingWithState:&v85 objects:v98 count:16];
        }
        while (v44);
      }

      id v8 = v76;
      id v7 = v77;
    }
    id v9 = v78;
    if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", v42))
    {
      uint64_t v67 = objc_opt_class();
      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_354;
      v84[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v84[4] = v67;
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce_352 != -1) {
        dispatch_once(&accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__defaultOnce_352, v84);
      }
      if (accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled_353)
      {
        long long v68 = [NSString stringWithFormat:@"identifierToWeightWiFi=%@, identifierToWeightBB=%@", v82, v81];
        long long v69 = (void *)MEMORY[0x1E4F929B8];
        long long v70 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLProcessNetworkAgent.m"];
        long long v71 = [v70 lastPathComponent];
        long long v72 = [NSString stringWithUTF8String:"-[PLProcessNetworkAgent accountWithNetworkUsageDiffEntries:withStartDate:withEndDate:]"];
        [v69 logMessage:v68 fromFile:v71 fromFunction:v72 fromLineNumber:1194];

        uint64_t v73 = PLLogCommon();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    long long v74 = [MEMORY[0x1E4F92900] sharedInstance];
    [v74 createDistributionEventIntervalWithDistributionID:37 withChildNodeNameToWeight:v82 withStartDate:v8 withEndDate:v78];

    long long v75 = [MEMORY[0x1E4F92900] sharedInstance];
    [v75 createDistributionEventIntervalWithDistributionID:38 withChildNodeNameToWeight:v81 withStartDate:v8 withEndDate:v78];
  }
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled = result;
  return result;
}

void __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_346(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v4 = *(void **)(a1 + 32);
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
  accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled_348 = result;
  return result;
}

uint64_t __86__PLProcessNetworkAgent_accountWithNetworkUsageDiffEntries_withStartDate_withEndDate___block_invoke_354(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  accountWithNetworkUsageDiffEntries_withStartDate_withEndDate__classDebugEnabled_353 = result;
  return result;
}

- (void)handleHighBWStartCallback:(id)a3
{
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLProcessNetworkAgent handleHighBWStartCallback:]();
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
  unint64_t v12 = [v11 componentsJoinedByString:@","];
  [v7 setObject:v12 forKeyedSubscript:@"HighThroughputOriginators"];

  [(PLOperator *)self logEntry:v7];
}

- (void)handleHighBWEndCallback:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLProcessNetworkAgent handleHighBWEndCallback:]();
  }

  uint64_t v22 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"HighCellularBWTransactionsDetail"];
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
  uint64_t v26 = v5;
  [v5 setObject:v11 forKeyedSubscript:@"HighThroughputDuration"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  double v24 = v3;
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
        unint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * v15);
        v31[0] = @"Participant";
        id v17 = objc_msgSend(v16, "objectForKeyedSubscript:");
        v32[0] = v17;
        v31[1] = @"Duration";
        uint64_t v18 = objc_msgSend(v16, "objectForKeyedSubscript:");
        v32[1] = v18;
        void v31[2] = @"RxBytes";
        uint64_t v19 = [v16 objectForKeyedSubscript:@"RxBytes"];
        void v32[2] = v19;
        v31[3] = @"TxBytes";
        uint64_t v20 = [v16 objectForKeyedSubscript:@"TxBytes"];
        v32[3] = v20;
        __int16 v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:4];

        [v26 setObject:&unk_1F400CC28 forKeyedSubscript:v21];
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

void __49__PLProcessNetworkAgent_initOperatorDependancies__block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Notification for sysdiagnose trigger for network bitmaps: %@", v2, v3, v4, v5, v6);
}

- (void)didSetCountsBlock:withCounts:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "WARNING: null counts dictionary passed in", v2, v3, v4, v5, v6);
}

- (void)didSetDescriptionBlock:withDescription:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "WARNING: null description dictionary passed in", v2, v3, v4, v5, v6);
}

void __46__PLProcessNetworkAgent_logEventBackwardUsage__block_invoke_311_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) processes];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1E4220000, a3, OS_LOG_TYPE_DEBUG, "[self processes]=%@, outcome=%@", v6, 0x16u);
}

- (void)logEventBackwardUsageWithOutcome:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "NetworkUsage outcome has no payload", v2, v3, v4, v5, v6);
}

- (void)getNetWorkBitmapForEndTime:andSysdiagnoseTrigger:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "[%@]: failed to retrieve network bitmaps", v1, 0xCu);
}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "[%@]: network bitmap dict is empty", (uint8_t *)&v3, 0xCu);
}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) lastNetworkBitmapTimestamp];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2048;
  uint64_t v12 = v6;
  _os_log_error_impl(&dword_1E4220000, a3, OS_LOG_TYPE_ERROR, "[%@]: End time %llu smaller than start time %llu.", (uint8_t *)&v7, 0x20u);
}

void __74__PLProcessNetworkAgent_getNetWorkBitmapForEndTime_andSysdiagnoseTrigger___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "[%@]: error in network bitmap callback: %@", (uint8_t *)&v4, 0x16u);
}

- (void)handleHighBWStartCallback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "High BW payload: %@", v2, v3, v4, v5, v6);
}

- (void)handleHighBWEndCallback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "High BW payload details: %@", v2, v3, v4, v5, v6);
}

@end