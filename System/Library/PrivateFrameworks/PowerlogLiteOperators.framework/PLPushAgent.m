@interface PLPushAgent
+ (BOOL)isHighPriorityPushEntry:(id)a3;
+ (id)bundleIdFromTopic:(id)a3;
+ (id)defaults;
+ (id)entryAggregateDefinitionAPSDConnected;
+ (id)entryAggregateDefinitionSentPushes;
+ (id)entryAggregateDefinitionSuppressedPushes;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionMessage;
+ (id)entryEventPointDefinitionMessageReceived;
+ (id)entryEventPointDefinitionMessageSent;
+ (id)entryEventPointDefinitions;
+ (id)entryEventPointDefinitionsAPSDConnectedEvent;
+ (id)entryEventPointDefinitionsReceivedKeepAlive;
+ (id)entryEventPointDefinitionsReceivedPush;
+ (id)entryEventPointDefinitionsSentKeepAlive;
+ (id)entryEventPointDefinitionsSentPush;
+ (id)replaceConnectionTypeWithEnum:(id)a3;
+ (void)load;
- (NSDate)detectionStartTime;
- (NSMutableDictionary)pushUsageDict;
- (PLPushAgent)init;
- (PLTimer)runTimeAggregatorTimer;
- (PLXPCListenerOperatorComposition)apsdConnectedListener;
- (PLXPCListenerOperatorComposition)messageReceivedListener;
- (PLXPCListenerOperatorComposition)messageSentListener;
- (PLXPCListenerOperatorComposition)receivedKeepAliveListener;
- (PLXPCListenerOperatorComposition)receivedPushListener;
- (PLXPCListenerOperatorComposition)sentKeepAliveListener;
- (PLXPCListenerOperatorComposition)sentPushListener;
- (PLXPCListenerOperatorComposition)suppressedPushesListener;
- (unint64_t)convertMessageProtocol:(id)a3;
- (unint64_t)numKeepAlives;
- (void)accountReceivedPushWithEntry:(id)a3;
- (void)checkPushUsage:(id)a3 withPLEntry:(id)a4;
- (void)handleMessageEvent:(id)a3 isSentEvent:(BOOL)a4;
- (void)initOperatorDependancies;
- (void)logAggregateSuppressedPushes:(id)a3;
- (void)logEventPointReceivedKeepAlive:(id)a3;
- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4;
- (void)setApsdConnectedListener:(id)a3;
- (void)setDetectionStartTime:(id)a3;
- (void)setMessageReceivedListener:(id)a3;
- (void)setMessageSentListener:(id)a3;
- (void)setNumKeepAlives:(unint64_t)a3;
- (void)setPushUsageDict:(id)a3;
- (void)setReceivedKeepAliveListener:(id)a3;
- (void)setReceivedPushListener:(id)a3;
- (void)setRunTimeAggregatorTimer:(id)a3;
- (void)setSentKeepAliveListener:(id)a3;
- (void)setSentPushListener:(id)a3;
- (void)setSuppressedPushesListener:(id)a3;
@end

@implementation PLPushAgent

+ (id)defaults
{
  return &unk_1F29EABE8;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPushAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v13[7] = *MEMORY[0x1E4F143B8];
  v12[0] = @"ReceivedPush";
  v3 = [a1 entryEventPointDefinitionsReceivedPush];
  v13[0] = v3;
  v12[1] = @"SentPush";
  v4 = [a1 entryEventPointDefinitionsSentPush];
  v13[1] = v4;
  v12[2] = @"APSDConnectedEvent";
  v5 = [a1 entryEventPointDefinitionsAPSDConnectedEvent];
  v13[2] = v5;
  v12[3] = @"SentKeepAlive";
  v6 = [a1 entryEventPointDefinitionsSentKeepAlive];
  v13[3] = v6;
  v12[4] = @"ReceivedKeepAlive";
  v7 = [a1 entryEventPointDefinitionsReceivedKeepAlive];
  v13[4] = v7;
  v12[5] = @"MessageSent";
  v8 = [a1 entryEventPointDefinitionMessageSent];
  v13[5] = v8;
  v12[6] = @"MessageReceived";
  v9 = [a1 entryEventPointDefinitionMessageReceived];
  v13[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

+ (id)entryEventPointDefinitionsReceivedPush
{
  v39[2] = *MEMORY[0x1E4F143B8];
  v38[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v36[0] = *MEMORY[0x1E4F92CD0];
  v36[1] = v2;
  v37[0] = &unk_1F29F0F50;
  v37[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v36[2] = *MEMORY[0x1E4F92C40];
  v36[3] = v3;
  v37[2] = MEMORY[0x1E4F1CC38];
  v37[3] = MEMORY[0x1E4F1CC38];
  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:4];
  v39[0] = v33;
  v38[1] = *MEMORY[0x1E4F92CA8];
  v34[0] = @"ConnectionType";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_StringFormat");
  v35[0] = v31;
  v34[1] = @"ServerHostname";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_StringFormat");
  v35[1] = v29;
  v34[2] = @"ServerIP";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_StringFormat");
  v35[2] = v27;
  v34[3] = @"LinkQuality";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v35[3] = v25;
  v34[4] = @"MessageIdentifier";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v35[4] = v23;
  v34[5] = @"Topic";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_StringFormat");
  v35[5] = v21;
  v34[6] = @"BundleID";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat_withBundleID");
  v35[6] = v19;
  v34[7] = @"IsDropped";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v35[7] = v17;
  v34[8] = @"Priority";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v35[8] = v15;
  v34[9] = @"StorageFlag";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v35[9] = v5;
  v34[10] = @"Size";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v35[10] = v7;
  v34[11] = @"FilterList";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v35[11] = v9;
  v34[12] = @"DidWake";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v35[12] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:13];
  v39[1] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];

  return v13;
}

+ (id)entryEventPointDefinitionsSentPush
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v27[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v25[0] = *MEMORY[0x1E4F92CD0];
  v25[1] = v2;
  v26[0] = &unk_1F29F0F60;
  v26[1] = MEMORY[0x1E4F1CC38];
  v25[2] = *MEMORY[0x1E4F92CB8];
  v26[2] = MEMORY[0x1E4F1CC28];
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
  v28[0] = v22;
  v27[1] = *MEMORY[0x1E4F92CA8];
  v23[0] = @"ConnectionType";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v24[0] = v20;
  v23[1] = @"ServerHostname";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_StringFormat");
  v24[1] = v18;
  v23[2] = @"ServerIP";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v24[2] = v16;
  v23[3] = @"LinkQuality";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v24[3] = v14;
  v23[4] = @"MessageIdentifier";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v24[4] = v4;
  v23[5] = @"Topic";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v24[5] = v6;
  v23[6] = @"Priority";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v24[6] = v8;
  v23[7] = @"Size";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v24[7] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:8];
  v28[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionsAPSDConnectedEvent
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0F70;
  v20[1] = MEMORY[0x1E4F1CC38];
  v19[2] = *MEMORY[0x1E4F92CB8];
  v20[2] = MEMORY[0x1E4F1CC28];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v16;
  v21[1] = *MEMORY[0x1E4F92CA8];
  v17[0] = @"ConnectionType";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v18[0] = v14;
  v17[1] = @"ServerHostname";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = v4;
  v17[2] = @"ServerIP";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v18[2] = v6;
  v17[3] = @"LinkQuality";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v18[3] = v8;
  v17[4] = @"ExperimentID";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v18[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
  v22[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionsSentKeepAlive
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0F80;
  v14[1] = MEMORY[0x1E4F1CC38];
  v13[2] = *MEMORY[0x1E4F92CB8];
  v14[2] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"ConnectionType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"LinkQuality";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionsReceivedKeepAlive
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F0F80;
  v18[1] = MEMORY[0x1E4F1CC38];
  v17[2] = *MEMORY[0x1E4F92CB8];
  v18[2] = MEMORY[0x1E4F1CC28];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"ConnectionType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"DidWake";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v16[1] = v6;
  void v15[2] = @"Environment";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v15[3] = @"LinkQuality";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  void v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionMessageReceived
{
  return +[PLPushAgent entryEventPointDefinitionMessage];
}

+ (id)entryEventPointDefinitionMessageSent
{
  return +[PLPushAgent entryEventPointDefinitionMessage];
}

+ (id)entryEventPointDefinitionMessage
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F29F0F60;
  v22[1] = MEMORY[0x1E4F1CC38];
  void v21[2] = *MEMORY[0x1E4F92CB8];
  v22[2] = MEMORY[0x1E4F1CC28];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"MessageType";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v20[0] = v16;
  v19[1] = @"ConversationType";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v20[1] = v14;
  void v19[2] = @"Protocol";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  void v19[3] = @"Target";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  void v20[3] = v6;
  v19[4] = @"Source";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v20[4] = v8;
  v19[5] = @"MessageGUID";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"SentPushes";
  uint64_t v3 = [a1 entryAggregateDefinitionSentPushes];
  v9[0] = v3;
  v8[1] = @"SuppressedPushes";
  v4 = [a1 entryAggregateDefinitionSuppressedPushes];
  v9[1] = v4;
  v8[2] = @"APSDConnected";
  v5 = [a1 entryAggregateDefinitionAPSDConnected];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryAggregateDefinitionSentPushes
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v30[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v28[0] = *MEMORY[0x1E4F92CD0];
  v28[1] = v2;
  v29[0] = &unk_1F29F0F60;
  v29[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92CF8];
  v28[2] = *MEMORY[0x1E4F92C40];
  v28[3] = v3;
  v29[2] = MEMORY[0x1E4F1CC38];
  v29[3] = &unk_1F29E73A8;
  void v28[4] = *MEMORY[0x1E4F92CF0];
  v29[4] = &unk_1F29F0F90;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  v31[0] = v20;
  v30[1] = *MEMORY[0x1E4F92CA8];
  v26[0] = @"ConnectionType";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v27[0] = v18;
  v26[1] = @"Topic";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v27[1] = v16;
  v26[2] = @"Priority";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  void v27[2] = v4;
  void v26[3] = @"Count";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v27[3] = v6;
  v26[4] = @"Size";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v27[4] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  v31[1] = v9;
  v30[2] = *MEMORY[0x1E4F92BE0];
  v24 = &unk_1F29F0FA0;
  uint64_t v22 = *MEMORY[0x1E4F92BD8];
  v23 = &unk_1F29F0FB0;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25 = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v31[2] = v11;
  v30[3] = *MEMORY[0x1E4F92BF0];
  v21[0] = @"Count";
  v21[1] = @"Size";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
  v31[3] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:4];

  return v13;
}

+ (id)entryAggregateDefinitionSuppressedPushes
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0F80;
  v24[1] = MEMORY[0x1E4F1CC38];
  void v23[2] = *MEMORY[0x1E4F92C08];
  v24[2] = MEMORY[0x1E4F1CC38];
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v26[0] = v15;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"BundleID";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v14, "commonTypeDict_StringFormat_withBundleID");
  v22[0] = v3;
  v21[1] = @"InterruptionSuppression";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v22[1] = v5;
  void v21[2] = @"Count";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v22[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v26[1] = v8;
  v25[2] = *MEMORY[0x1E4F92BE0];
  v19 = &unk_1F29F0FC0;
  uint64_t v17 = *MEMORY[0x1E4F92BD8];
  v18 = &unk_1F29F0FB0;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v20 = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  v26[2] = v10;
  void v25[3] = *MEMORY[0x1E4F92BF0];
  v16 = @"Count";
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  void v26[3] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:4];

  return v12;
}

+ (id)entryAggregateDefinitionAPSDConnected
{
  void v22[4] = *MEMORY[0x1E4F143B8];
  v21[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v19[0] = *MEMORY[0x1E4F92CD0];
  v19[1] = v2;
  v20[0] = &unk_1F29F0F80;
  v20[1] = MEMORY[0x1E4F1CC38];
  void v19[2] = *MEMORY[0x1E4F92CB8];
  v20[2] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  v22[0] = v3;
  v21[1] = *MEMORY[0x1E4F92CA8];
  uint64_t v17 = @"Count";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v18 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v22[1] = v6;
  void v21[2] = *MEMORY[0x1E4F92BE0];
  v15 = &unk_1F29F0FC0;
  uint64_t v13 = *MEMORY[0x1E4F92BD8];
  v14 = &unk_1F29F0FB0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v22[2] = v8;
  void v21[3] = *MEMORY[0x1E4F92BF0];
  v12 = @"Count";
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
  void v22[3] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v10;
}

- (PLPushAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLPushAgent;
  result = [(PLAgent *)&v3 init];
  if (result) {
    result->_numKeepAlives = 0;
  }
  return result;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke;
  v36[3] = &unk_1E692A6F8;
  void v36[4] = self;
  v4 = (void *)[v3 initWithOperator:self withRegistration:&unk_1F29EAC10 withBlock:v36];
  [(PLPushAgent *)self setReceivedPushListener:v4];

  id v5 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_179;
  v35[3] = &unk_1E692A6F8;
  v35[4] = self;
  v6 = (void *)[v5 initWithOperator:self withRegistration:&unk_1F29EAC38 withBlock:v35];
  [(PLPushAgent *)self setSentPushListener:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_194;
  v34[3] = &unk_1E692A6F8;
  v34[4] = self;
  v8 = (void *)[v7 initWithOperator:self withRegistration:&unk_1F29EAC60 withBlock:v34];
  [(PLPushAgent *)self setSuppressedPushesListener:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_202;
  v33[3] = &unk_1E692A6F8;
  v33[4] = self;
  v10 = (void *)[v9 initWithOperator:self withRegistration:&unk_1F29EAC88 withBlock:v33];
  [(PLPushAgent *)self setApsdConnectedListener:v10];

  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_210;
  v32[3] = &unk_1E692A6F8;
  v32[4] = self;
  v12 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29EACB0 withBlock:v32];
  [(PLPushAgent *)self setSentKeepAliveListener:v12];

  [(PLOperator *)self defaultDoubleForKey:@"RunTimeAggregatorTimerCadence"];
  double v14 = v13;
  id v15 = objc_alloc(MEMORY[0x1E4F92A80]);
  v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v14];
  uint64_t v17 = [(PLOperator *)self workQueue];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_216;
  v31[3] = &unk_1E692A200;
  v31[4] = self;
  v18 = (PLTimer *)[v15 initWithFireDate:v16 withInterval:1 withTolerance:0 repeats:v17 withUserInfo:v31 withQueue:v14 withBlock:0.0];
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v18;

  id v20 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_2_225;
  v30[3] = &unk_1E692A6F8;
  void v30[4] = self;
  v21 = (void *)[v20 initWithOperator:self withRegistration:&unk_1F29EACD8 withBlock:v30];
  [(PLPushAgent *)self setReceivedKeepAliveListener:v21];

  uint64_t v22 = (NSMutableDictionary *)objc_opt_new();
  pushUsageDict = self->_pushUsageDict;
  self->_pushUsageDict = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_236;
  v29[3] = &unk_1E692A6F8;
  v29[4] = self;
  v25 = (void *)[v24 initWithOperator:self withRegistration:&unk_1F29EAD00 withBlock:v29];
  [(PLPushAgent *)self setMessageSentListener:v25];

  id v26 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __39__PLPushAgent_initOperatorDependancies__block_invoke_244;
  v28[3] = &unk_1E692A6F8;
  void v28[4] = self;
  v27 = (void *)[v26 initWithOperator:self withRegistration:&unk_1F29EAD28 withBlock:v28];
  [(PLPushAgent *)self setMessageReceivedListener:v27];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = PLLogPush();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 138412290;
    id v28 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLPushAgent:: receivedPushListener with payload=%@", (uint8_t *)&v27, 0xCu);
  }

  v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"ReceivedPush"];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v6];
  v10 = [v9 objectForKeyedSubscript:@"Topic"];
  if ([v10 containsString:@"com.apple.Safari"])
  {
    id v11 = [v9 objectForKeyedSubscript:@"Topic"];
    int v12 = [v11 containsString:@"https://"];

    if (v12) {
      [v9 setObject:@"com.apple.Safari" forKeyedSubscript:@"Topic"];
    }
  }
  else
  {
  }
  double v13 = objc_opt_class();
  double v14 = [v9 objectForKeyedSubscript:@"Topic"];
  id v15 = [v13 bundleIdFromTopic:v14];
  [v9 setObject:v15 forKeyedSubscript:@"BundleID"];

  v16 = [v6 objectForKeyedSubscript:@"IsWakingMessage"];
  [v9 setObject:v16 forKeyedSubscript:@"DidWake"];

  uint64_t v17 = NSNumber;
  v18 = (void *)MEMORY[0x1E4F92A88];
  v19 = [v9 objectForKeyedSubscript:@"Size"];
  id v20 = objc_msgSend(v17, "numberWithInt:", objc_msgSend(v18, "roundToSigFig:withSigFig:", objc_msgSend(v19, "intValue"), 2));
  [v9 setObject:v20 forKeyedSubscript:@"Size"];

  if (([MEMORY[0x1E4F929C0] fullMode] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v22 = [v9 entryDate];
    [v22 timeIntervalSince1970];
    id v24 = [v21 dateWithTimeIntervalSince1970:round(v23 / 60.0) * 60.0];
    [v9 setEntryDate:v24];
  }
  [*(id *)(a1 + 32) logEntry:v9];
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    v25 = *(void **)(a1 + 32);
    id v26 = [v9 entryDate];
    [v25 checkPushUsage:v26 withPLEntry:v9];
  }
  [*(id *)(a1 + 32) accountReceivedPushWithEntry:v9];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_179(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __39__PLPushAgent_initOperatorDependancies__block_invoke_2;
    v34 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v35 = v7;
    if (qword_1EBD5A190 != -1) {
      dispatch_once(&qword_1EBD5A190, &block);
    }
    if (_MergedGlobals_1_50)
    {
      v8 = [NSString stringWithFormat:@"PLPushAgent:: sentPushListener with payload=%@", v6, block, v32, v33, v34, v35];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m"];
      id v11 = [v10 lastPathComponent];
      int v12 = [NSString stringWithUTF8String:"-[PLPushAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:437];

      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  double v14 = (void *)[v6 mutableCopy];
  id v15 = objc_opt_class();
  v16 = [v6 objectForKeyedSubscript:@"ConnectionType"];
  uint64_t v17 = [v15 replaceConnectionTypeWithEnum:v16];
  [v14 setObject:v17 forKeyedSubscript:@"ConnectionType"];

  unint64_t v18 = 0x1E4F28000;
  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    v19 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SentPush"];
    id v20 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19 withRawData:v14];
    v21 = NSNumber;
    uint64_t v22 = (void *)MEMORY[0x1E4F92A88];
    double v23 = [v20 objectForKeyedSubscript:@"Size"];
    id v24 = objc_msgSend(v21, "numberWithInt:", objc_msgSend(v22, "roundToSigFig:withSigFig:", objc_msgSend(v23, "intValue"), 2));
    [v20 setObject:v24 forKeyedSubscript:@"Size"];

    unint64_t v18 = 0x1E4F28000uLL;
    [*(id *)(a1 + 32) logEntry:v20];
  }
  v25 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"SentPushes"];
  id v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v25 withRawData:v14];
  int v27 = *(void **)(v18 + 3792);
  id v28 = (void *)MEMORY[0x1E4F92A88];
  uint64_t v29 = [v26 objectForKeyedSubscript:@"Size"];
  v30 = objc_msgSend(v27, "numberWithInt:", objc_msgSend(v28, "roundToSigFig:withSigFig:", objc_msgSend(v29, "intValue"), 2));
  [v26 setObject:v30 forKeyedSubscript:@"Size"];

  [v26 setObject:&unk_1F29E73D8 forKeyedSubscript:@"Count"];
  [*(id *)(a1 + 32) logEntry:v26];
}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_50 = result;
  return result;
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "SuppressedPushes payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logAggregateSuppressedPushes:v6];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_202(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLPushAgent:: apsdConnectedListener with payload=%@", (uint8_t *)&v16, 0xCu);
  }

  int v8 = (void *)[v6 mutableCopy];
  id v9 = objc_opt_class();
  uint64_t v10 = [v6 objectForKeyedSubscript:@"ConnectionType"];
  id v11 = [v9 replaceConnectionTypeWithEnum:v10];
  [v8 setObject:v11 forKeyedSubscript:@"ConnectionType"];

  int v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"APSDConnectedEvent"];
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12 withRawData:v8];
  [*(id *)(a1 + 32) logEntry:v13];
  double v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"APSDConnected"];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withRawData:v8];
  [v15 setObject:&unk_1F29E73D8 forKeyedSubscript:@"Count"];
  [*(id *)(a1 + 32) logEntry:v15];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __39__PLPushAgent_initOperatorDependancies__block_invoke_2_211;
    id v26 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v27 = v7;
    if (qword_1EBD5A198 != -1) {
      dispatch_once(&qword_1EBD5A198, &block);
    }
    if (byte_1EBD5A179)
    {
      int v8 = [NSString stringWithFormat:@"PLPushAgent:: sentKeepAliveListener with payload=%@", v6, block, v24, v25, v26, v27];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m"];
      id v11 = [v10 lastPathComponent];
      int v12 = [NSString stringWithUTF8String:"-[PLPushAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:489];

      double v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  double v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SentKeepAlive"];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14];
  int v16 = [v6 objectForKeyedSubscript:@"LinkQuality"];
  [v15 setObject:v16 forKeyedSubscript:@"LinkQuality"];

  id v17 = objc_opt_class();
  uint64_t v18 = [v6 objectForKeyedSubscript:@"ConnectionType"];
  v19 = [v17 replaceConnectionTypeWithEnum:v18];
  [v15 setObject:v19 forKeyedSubscript:@"ConnectionType"];

  id v20 = *(void **)(a1 + 32);
  uint64_t v21 = v20[12];
  if (v21 == 1)
  {
    uint64_t v22 = [NSNumber numberWithInteger:500];
    [v15 setObject:v22 forKeyedSubscript:@"ConnectionType"];

    id v20 = *(void **)(a1 + 32);
  }
  else if (v21)
  {
    goto LABEL_13;
  }
  [v20 logEntry:v15];
LABEL_13:
  ++*(void *)(*(void *)(a1 + 32) + 96);
}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_2_211(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A179 = result;
  return result;
}

uint64_t __39__PLPushAgent_initOperatorDependancies__block_invoke_216(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 96) = 0;
  return result;
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_2_225(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogPush();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "PLPushAgent:: receivedKeepAliveListener with payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointReceivedKeepAlive:v6];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_236(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogPush();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "iMessageSent payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) handleMessageEvent:v6 isSentEvent:1];
}

void __39__PLPushAgent_initOperatorDependancies__block_invoke_244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogPush();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "iMessageReceived payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) handleMessageEvent:v6 isSentEvent:0];
}

- (void)logEventPointReceivedKeepAlive:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ReceivedKeepAlive"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logAggregateSuppressedPushes:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SuppressedPushes"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)accountReceivedPushWithEntry:(id)a3
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = PLLogPush();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "accounting entry %@", buf, 0xCu);
  }

  char v5 = [MEMORY[0x1E4F92A38] isHomePod];
  if (v3 && (v5 & 1) == 0)
  {
    id v6 = [v3 objectForKeyedSubscript:@"BundleID"];
    if ([v6 hasPrefix:@"com.apple.icloud-container.clouddocs."])
    {
      uint64_t v7 = 37;
    }
    else
    {
      if (![v6 hasPrefix:@"com.apple.icloud-container."]) {
        goto LABEL_10;
      }
      uint64_t v7 = 27;
    }
    uint64_t v8 = [v6 substringFromIndex:v7];

    id v6 = (void *)v8;
LABEL_10:
    id v9 = [v3 objectForKeyedSubscript:@"ConnectionType"];
    if ([v9 isEqualToString:@"wifi"])
    {
      uint64_t v10 = [MEMORY[0x1E4F92900] sharedInstance];
      v37 = v6;
      v38[0] = &unk_1F29F0F80;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      int v12 = [v3 entryDate];
      double v13 = v10;
      uint64_t v14 = 4;
    }
    else
    {
      if (![v9 isEqualToString:@"wwan"])
      {
LABEL_15:
        id v15 = [v3 objectForKeyedSubscript:@"DidWake"];
        int v16 = [v15 BOOLValue];

        id v17 = PLLogPush();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v32) = v16;
          _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "didWake = %d", buf, 8u);
        }

        if (v16)
        {
          uint64_t v18 = PLLogPush();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = [v3 entryDate];
            *(_DWORD *)buf = 138412546;
            id v32 = v3;
            __int16 v33 = 2112;
            v34 = v19;
            _os_log_impl(&dword_1D2690000, v18, OS_LOG_TYPE_INFO, "Waking push with entry=%@, entry.entryDate=%@", buf, 0x16u);
          }
          id v20 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v21 = [v3 entryDate];
          uint64_t v22 = [v3 entryDate];
          double v23 = [v22 dateByAddingTimeInterval:10.0];
          [v20 createPowerEventIntervalWithRootNodeID:60 withPower:v21 withStartDate:v23 withEndDate:150.0];

          uint64_t v24 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v29 = v6;
          uint64_t v30 = &unk_1F29F0F80;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          id v26 = [v3 entryDate];
          uint64_t v27 = [v3 entryDate];
          id v28 = [v27 dateByAddingTimeInterval:10.0];
          [v24 createDistributionEventIntervalWithDistributionID:48 withChildNodeNameToWeight:v25 withStartDate:v26 withEndDate:v28];
        }
        goto LABEL_22;
      }
      uint64_t v10 = [MEMORY[0x1E4F92900] sharedInstance];
      uint64_t v35 = v6;
      v36 = &unk_1F29F0F80;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      int v12 = [v3 entryDate];
      double v13 = v10;
      uint64_t v14 = 5;
    }
    [v13 createDistributionEventPointWithDistributionID:v14 withChildNodeNameToWeight:v11 withStartDate:v12];

    goto LABEL_15;
  }
LABEL_22:
}

+ (id)bundleIdFromTopic:(id)a3
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 length])
    {
      v22[0] = @"com.apple.madrid";
      v22[1] = @"com.apple.calendar";
      v23[0] = &__block_literal_global_266;
      v23[1] = &__block_literal_global_274;
      v22[2] = @"com.me.cal";
      void v22[3] = @"com.me.bookmarks";
      void v23[2] = &__block_literal_global_282;
      void v23[3] = &__block_literal_global_287;
      void v22[4] = @"com.me.contacts";
      void v22[5] = @"com.apple.mobilemail";
      v23[4] = &__block_literal_global_295;
      v23[5] = &__block_literal_global_303;
      v22[6] = @"com.apple.sharedstreams";
      v22[7] = @"com.apple.private.alloy.sms";
      v23[6] = &__block_literal_global_308;
      v23[7] = &__block_literal_global_316;
      v22[8] = @"com.apple.Safari";
      void v23[8] = &__block_literal_global_318;
      char v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
      uint64_t v16 = 0;
      id v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__13;
      id v20 = __Block_byref_object_dispose__13;
      id v21 = v4;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __33__PLPushAgent_bundleIdFromTopic___block_invoke_322;
      void v13[3] = &unk_1E6930CC8;
      id v6 = v21;
      id v14 = v6;
      id v15 = &v16;
      [v5 enumerateKeysAndObjectsUsingBlock:v13];
      uint64_t v7 = [v6 rangeOfString:@".voip"];
      uint64_t v8 = [v6 length];
      if (v7 == v8 - [@".voip" length])
      {
        uint64_t v9 = [v6 substringToIndex:v7];
        uint64_t v10 = (void *)v17[5];
        void v17[5] = v9;
      }
      id v11 = (__CFString *)(id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v11 = &stru_1F294E108;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke()
{
  return @"com.apple.MobileSMS";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_2()
{
  return @"com.apple.mobilecal";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_3()
{
  return @"com.apple.mobilecal";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_4()
{
  return @"com.apple.mobilesafari";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_5()
{
  return @"com.apple.MobileAddressBook";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_6()
{
  return @"com.apple.mobilemail";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_7()
{
  return @"com.apple.mobileslideshow";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_8()
{
  return @"com.apple.MobileSMS";
}

__CFString *__33__PLPushAgent_bundleIdFromTopic___block_invoke_9()
{
  return @"webpushd";
}

void __33__PLPushAgent_bundleIdFromTopic___block_invoke_322(uint64_t a1, uint64_t a2, void *a3, unsigned char *a4)
{
  uint64_t v10 = a3;
  if (![*(id *)(a1 + 32) rangeOfString:a2])
  {
    uint64_t v7 = v10[2](v10, *(void *)(a1 + 32));
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a4 = 1;
  }
}

+ (id)replaceConnectionTypeWithEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"wwan"])
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = 1;
  }
  else if ([v3 isEqual:@"wifi"])
  {
    uint64_t v4 = NSNumber;
    uint64_t v5 = 2;
  }
  else
  {
    int v6 = [v3 isEqual:@"proxy"];
    uint64_t v4 = NSNumber;
    if (v6) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 3;
    }
  }
  uint64_t v7 = [v4 numberWithInteger:v5];

  return v7;
}

+ (BOOL)isHighPriorityPushEntry:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"Priority"];
  uint64_t v4 = v3;
  if (v3) {
    BOOL v5 = [v3 integerValue] == 10;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)sendEnergyIssueSignatureNotification:(id)a3 withThreshold:(double)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4FA8AF0]);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a4);
    uint64_t v9 = [v7 signatureWithDomain:@"Energy" type:@"Push" subType:@"PushStorm" subtypeContext:&stru_1F294E108 detectedProcess:v6 triggerThresholdValues:v8];

    uint64_t v20 = *MEMORY[0x1E4FA8C28];
    uint64_t v18 = @"com.apple.PowerlogCore.DESysLogFilterProcess";
    id v15 = v6;
    uint64_t v16 = @"processNames";
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    id v17 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19 = v11;
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v12;
    double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke;
    void v14[3] = &unk_1E692A808;
    v14[4] = self;
    [v7 snapshotWithSignature:v9 duration:0 events:v13 payload:0 actions:v14 reply:120.0];
  }
}

void __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C70]];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    BOOL v5 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4FA8C68]];
    if (![MEMORY[0x1E4F929C0] debugEnabled]) {
      goto LABEL_16;
    }
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5A1A0 != -1) {
      dispatch_once(&qword_1EBD5A1A0, block);
    }
    if (!byte_1EBD5A17A) {
      goto LABEL_16;
    }
    id v7 = [NSString stringWithFormat:@"SDRDiagnosticReporter response = %@, sessionID = %@", v2, v5];
    uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
    uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m"];
    uint64_t v10 = [v9 lastPathComponent];
    id v11 = [NSString stringWithUTF8String:"-[PLPushAgent sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke"];
    [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:689];

    int v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v7;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_15:
LABEL_16:

    goto LABEL_17;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v13 = objc_opt_class();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_354;
    void v18[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v18[4] = v13;
    if (qword_1EBD5A1A8 != -1) {
      dispatch_once(&qword_1EBD5A1A8, v18);
    }
    if (byte_1EBD5A17B)
    {
      BOOL v5 = [NSString stringWithFormat:@"SDRDiagnosticReporter dampened"];
      id v14 = (void *)MEMORY[0x1E4F929B8];
      id v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m"];
      uint64_t v16 = [v15 lastPathComponent];
      id v17 = [NSString stringWithUTF8String:"-[PLPushAgent sendEnergyIssueSignatureNotification:withThreshold:]_block_invoke_2"];
      [v14 logMessage:v5 fromFile:v16 fromFunction:v17 fromLineNumber:692];

      id v7 = PLLogCommon();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
LABEL_17:
}

uint64_t __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A17A = result;
  return result;
}

uint64_t __66__PLPushAgent_sendEnergyIssueSignatureNotification_withThreshold___block_invoke_354(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A17B = result;
  return result;
}

- (void)checkPushUsage:(id)a3 withPLEntry:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (self->_detectionStartTime)
  {
    objc_msgSend(v7, "timeIntervalSinceDate:");
    if (v9 <= 86400.0)
    {
      uint64_t v10 = [v8 objectForKeyedSubscript:@"BundleID"];
      id v11 = [(NSMutableDictionary *)self->_pushUsageDict objectForKey:v10];

      if (v11)
      {
        int v12 = NSNumber;
        uint64_t v13 = [(NSMutableDictionary *)self->_pushUsageDict objectForKeyedSubscript:v10];
        id v14 = objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
        [(NSMutableDictionary *)self->_pushUsageDict setObject:v14 forKeyedSubscript:v10];
      }
      else
      {
        [(NSMutableDictionary *)self->_pushUsageDict setObject:&unk_1F29E73D8 forKeyedSubscript:v10];
      }
      id v15 = [(NSMutableDictionary *)self->_pushUsageDict objectForKeyedSubscript:v10];
      int v16 = [v15 intValue];

      if (v16 >= 1001)
      {
        [(NSMutableDictionary *)self->_pushUsageDict setObject:0 forKeyedSubscript:v10];
        if ([v10 isEqualToString:@"com.apple.private.alloy.willow"]) {
          [(PLPushAgent *)self sendEnergyIssueSignatureNotification:v10 withThreshold:1000.0];
        }
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_pushUsageDict removeAllObjects];
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_detectionStartTime, a3);
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLPushAgent_checkPushUsage_withPLEntry___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v17;
    if (qword_1EBD5A1B0 != -1) {
      dispatch_once(&qword_1EBD5A1B0, block);
    }
    if (byte_1EBD5A17C)
    {
      uint64_t v18 = [NSString stringWithFormat:@"PLPushAgent: checkPushUsage"];
      v19 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLPushAgent.m"];
      id v21 = [v20 lastPathComponent];
      uint64_t v22 = [NSString stringWithUTF8String:"-[PLPushAgent checkPushUsage:withPLEntry:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:727];

      double v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __42__PLPushAgent_checkPushUsage_withPLEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5A17C = result;
  return result;
}

- (unint64_t)convertMessageProtocol:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 isEqualToString:@"iMessage"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"iMessageLite"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"RCS"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"SMS"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"SatelliteSMS"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"Unknown"])
  {
    unint64_t v4 = 6;
  }
  else
  {
    BOOL v5 = PLLogPush();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Other Message Protocol logged: %@", (uint8_t *)&v7, 0xCu);
    }

    unint64_t v4 = 2;
  }

  return v4;
}

- (void)handleMessageEvent:(id)a3 isSentEvent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = PLLogPush();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v28 = [NSNumber numberWithBool:v4];
    int v29 = 138412546;
    uint64_t v30 = v28;
    __int16 v31 = 2112;
    id v32 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Received messages update, isSentEvent: %@, payload: %@", (uint8_t *)&v29, 0x16u);
  }
  id v8 = @"MessageReceived";
  if (v4) {
    id v8 = @"MessageSent";
  }
  uint64_t v9 = v8;
  uint64_t v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:v9];
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  int v12 = [v6 objectForKeyedSubscript:@"MessageType"];
  [v11 setObject:v12 forKeyedSubscript:@"MessageType"];

  uint64_t v13 = [v6 objectForKeyedSubscript:@"ConversationType"];
  [v11 setObject:v13 forKeyedSubscript:@"ConversationType"];

  id v14 = NSNumber;
  id v15 = [v6 objectForKeyedSubscript:@"Protocol"];
  int v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", -[PLPushAgent convertMessageProtocol:](self, "convertMessageProtocol:", v15));
  [v11 setObject:v16 forKeyedSubscript:@"Protocol"];

  if ([MEMORY[0x1E4F929C0] fullMode])
  {
    uint64_t v17 = NSNumber;
    uint64_t v18 = (void *)MEMORY[0x1E4F92A88];
    v19 = [v6 objectForKeyedSubscript:@"Target"];
    uint64_t v20 = [v18 hashString:v19];
    id v21 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v20, "hash"));
    [v11 setObject:v21 forKeyedSubscript:@"Target"];

    uint64_t v22 = NSNumber;
    double v23 = (void *)MEMORY[0x1E4F92A88];
    uint64_t v24 = [v6 objectForKeyedSubscript:@"Source"];
    v25 = [v23 hashString:v24];
    id v26 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v25, "hash"));
    [v11 setObject:v26 forKeyedSubscript:@"Source"];

    uint64_t v27 = [v6 objectForKeyedSubscript:@"MessageGUID"];
    [v11 setObject:v27 forKeyedSubscript:@"MessageGUID"];
  }
  [(PLOperator *)self logEntry:v11];
}

- (PLXPCListenerOperatorComposition)receivedPushListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceivedPushListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)sentPushListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSentPushListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)suppressedPushesListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSuppressedPushesListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)sentKeepAliveListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSentKeepAliveListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)receivedKeepAliveListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setReceivedKeepAliveListener:(id)a3
{
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
}

- (unint64_t)numKeepAlives
{
  return self->_numKeepAlives;
}

- (void)setNumKeepAlives:(unint64_t)a3
{
  self->_numKeepAlives = a3;
}

- (PLXPCListenerOperatorComposition)apsdConnectedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setApsdConnectedListener:(id)a3
{
}

- (NSMutableDictionary)pushUsageDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setPushUsageDict:(id)a3
{
}

- (NSDate)detectionStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDetectionStartTime:(id)a3
{
}

- (PLXPCListenerOperatorComposition)messageSentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setMessageSentListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)messageReceivedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setMessageReceivedListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageReceivedListener, 0);
  objc_storeStrong((id *)&self->_messageSentListener, 0);
  objc_storeStrong((id *)&self->_detectionStartTime, 0);
  objc_storeStrong((id *)&self->_pushUsageDict, 0);
  objc_storeStrong((id *)&self->_apsdConnectedListener, 0);
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_receivedKeepAliveListener, 0);
  objc_storeStrong((id *)&self->_sentKeepAliveListener, 0);
  objc_storeStrong((id *)&self->_suppressedPushesListener, 0);
  objc_storeStrong((id *)&self->_sentPushListener, 0);
  objc_storeStrong((id *)&self->_receivedPushListener, 0);
}

@end