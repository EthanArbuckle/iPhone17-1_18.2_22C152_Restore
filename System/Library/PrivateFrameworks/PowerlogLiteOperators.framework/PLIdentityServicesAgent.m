@interface PLIdentityServicesAgent
+ (id)entryDefinitionCloudMessaging;
+ (id)entryDefinitionIDSMessageStats;
+ (id)entryDefinitionIDSSocketStats;
+ (id)entryDefinitionLocalInfraWiFiRequests;
+ (id)entryDefinitionLocalLink;
+ (id)entryDefinitionSession;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventPointDefinitionIDSIncomingPushReceived;
+ (id)entryEventPointDefinitionIDSLinkPreferenceRequest;
+ (id)entryEventPointDefinitionIDSLocalMessage;
+ (id)entryEventPointDefinitionIDSOutgoingPushSent;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (NRDeviceMonitor)nrdm;
- (NSDate)initialEntryDate;
- (NSDate)lastLocalDeliveryLogDate;
- (NSMutableDictionary)lastEntryDatePerCategory;
- (NSMutableDictionary)previousStatsByPriority;
- (PLIdentityServicesAgent)init;
- (PLXPCListenerOperatorComposition)cloudMessagingHandler;
- (PLXPCListenerOperatorComposition)idsIncomingPushReceivedListener;
- (PLXPCListenerOperatorComposition)idsLinkPreferenceRequestHandler;
- (PLXPCListenerOperatorComposition)idsOutgoingPushSentListener;
- (PLXPCListenerOperatorComposition)idsSessionListener;
- (PLXPCListenerOperatorComposition)infraWiFiRequestHandler;
- (PLXPCListenerOperatorComposition)ipsecLinkTypeHandler;
- (PLXPCListenerOperatorComposition)localLinkTypeHandler;
- (PLXPCListenerOperatorComposition)localMessageHandler;
- (PLXPCListenerOperatorComposition)networkStatsHandler;
- (void)createBTAccountingEvents:(id)a3;
- (void)createIDSAccountingEventsWithEntries:(id)a3;
- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)logCloudMessaging:(id)a3;
- (void)logIDSIncomingPushReceived:(id)a3;
- (void)logIDSLinkPreference:(id)a3;
- (void)logIDSNetworkEntries:(id)a3;
- (void)logIDSOutgoingPushSent:(id)a3;
- (void)logIDSSession:(id)a3;
- (void)logLocalInfraWiFiFrequests:(id)a3;
- (void)logLocalLinkType:(unint64_t)a3;
- (void)logLocalMessageTopic:(id)a3;
- (void)notifyLinkType:(unint64_t)a3;
- (void)setCloudMessagingHandler:(id)a3;
- (void)setCurrentLinkType;
- (void)setIdsIncomingPushReceivedListener:(id)a3;
- (void)setIdsLinkPreferenceRequestHandler:(id)a3;
- (void)setIdsOutgoingPushSentListener:(id)a3;
- (void)setIdsSessionListener:(id)a3;
- (void)setInfraWiFiRequestHandler:(id)a3;
- (void)setInitialEntryDate:(id)a3;
- (void)setIpsecLinkTypeHandler:(id)a3;
- (void)setLastEntryDatePerCategory:(id)a3;
- (void)setLastLocalDeliveryLogDate:(id)a3;
- (void)setLocalLinkTypeHandler:(id)a3;
- (void)setLocalMessageHandler:(id)a3;
- (void)setNetworkStatsHandler:(id)a3;
- (void)setNrdm:(id)a3;
- (void)setPreviousStatsByPriority:(id)a3;
@end

@implementation PLIdentityServicesAgent

+ (void)load
{
  v2 = (void *)MEMORY[0x1E4F929B0];
  uint64_t v3 = objc_opt_class();
  [v2 registerOperator:v3];
}

+ (id)entryEventForwardDefinitions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v8[0] = @"LocalLinkType";
  v2 = +[PLIdentityServicesAgent entryDefinitionLocalLink];
  v9[0] = v2;
  v8[1] = @"LocalInfraWiFiRequests";
  uint64_t v3 = +[PLIdentityServicesAgent entryDefinitionLocalInfraWiFiRequests];
  v9[1] = v3;
  v8[2] = @"CloudMessaging";
  v4 = +[PLIdentityServicesAgent entryDefinitionCloudMessaging];
  v9[2] = v4;
  v8[3] = @"Session";
  v5 = +[PLIdentityServicesAgent entryDefinitionSession];
  v9[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:4];

  return v6;
}

+ (id)entryDefinitionLocalLink
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F29F07E0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"linkType";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryDefinitionCloudMessaging
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F07F0;
  v12[1] = MEMORY[0x1E4F1CC28];
  v11[2] = *MEMORY[0x1E4F92CE8];
  void v12[2] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"IDSClientBringsUpCloudMessaging";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  uint64_t v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryDefinitionSession
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F07F0;
  v18[1] = MEMORY[0x1E4F1CC38];
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"isInitiator";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v16[0] = v4;
  v15[1] = @"serviceName";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v16[1] = v6;
  v15[2] = @"state";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v16[2] = v8;
  v15[3] = @"sessionID";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v16[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"IDSMessagePeriodic";
  uint64_t v2 = +[PLIdentityServicesAgent entryDefinitionIDSMessageStats];
  v6[1] = @"IDSSocketPeriodic";
  v7[0] = v2;
  uint64_t v3 = +[PLIdentityServicesAgent entryDefinitionIDSSocketStats];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryDefinitionIDSMessageStats
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v24 = *MEMORY[0x1E4F92CD0];
  v25 = &unk_1F29F0800;
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"timestampEnd";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_DateFormat");
  v23[0] = v19;
  v22[1] = @"topic";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"priority";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v23[2] = v15;
  v22[3] = @"OutgoingBytes";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v23[3] = v13;
  v22[4] = @"IncomingBytes";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v23[4] = v3;
  v22[5] = @"OutgoingMessages";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v23[5] = v5;
  v22[6] = @"IncomingMessages";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v23[6] = v7;
  v22[7] = @"LinkType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[7] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  v27[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v11;
}

+ (id)entryDefinitionIDSSocketStats
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F29F07F0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"timestampEnd";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  v19[0] = v15;
  v18[1] = @"topic";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_StringFormat");
  v19[1] = v13;
  void v18[2] = @"OutgoingBytes";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  void v19[2] = v3;
  v18[3] = @"IncomingBytes";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"OutgoingPackets";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"IncomingPackets";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[5] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
}

+ (id)entryDefinitionLocalInfraWiFiRequests
{
  v16[3] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v13 = *MEMORY[0x1E4F92CD0];
  v14 = &unk_1F29F0800;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v16[0] = v2;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"requestingServices";
  uint64_t v9 = *MEMORY[0x1E4F92D10];
  uint64_t v10 = &unk_1F29E5DB8;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v11[1] = @"reason";
  v12[0] = v3;
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v12[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v15[2] = *MEMORY[0x1E4F92C18];
  v16[1] = v6;
  v16[2] = &unk_1F29ED928;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];

  return v7;
}

+ (id)entryEventPointDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IDSLocalMessage";
  uint64_t v3 = [a1 entryEventPointDefinitionIDSLocalMessage];
  v10[0] = v3;
  v9[1] = @"IDSLinkPreferenceRequest";
  v4 = [a1 entryEventPointDefinitionIDSLinkPreferenceRequest];
  v10[1] = v4;
  v9[2] = @"IDSOutgoingPushSent";
  v5 = [a1 entryEventPointDefinitionIDSOutgoingPushSent];
  v10[2] = v5;
  v9[3] = @"IDSIncomingPushReceived";
  v6 = [a1 entryEventPointDefinitionIDSIncomingPushReceived];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryEventPointDefinitionIDSLocalMessage
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C20];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0810;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = *MEMORY[0x1E4F92C28];
  void v13[2] = *MEMORY[0x1E4F92C30];
  void v13[3] = v3;
  v14[2] = &unk_1F29E5DD0;
  void v14[3] = &unk_1F29E5DD0;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  v16[0] = v4;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11 = @"IDSDeviceDidWakeHintTopic";
  uint64_t v9 = *MEMORY[0x1E4F92D10];
  uint64_t v10 = &unk_1F29E5DE8;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v16[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionIDSLinkPreferenceRequest
{
  void v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  uint64_t v13 = &unk_1F29F07F0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"InputBytesPerSecond";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"ServiceName";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventPointDefinitionIDSOutgoingPushSent
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F07E0;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"CommandContext";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"CommandID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"Topic";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionIDSIncomingPushReceived
{
  void v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F07E0;
  v16[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"CommandContext";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"CommandID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v14[1] = v7;
  void v13[2] = @"Topic";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v9 = objc_msgSend(v8, "commonTypeDict_StringFormat_withBundleID");
  void v14[2] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

- (PLIdentityServicesAgent)init
{
  v11.receiver = self;
  v11.super_class = (Class)PLIdentityServicesAgent;
  uint64_t v2 = [(PLAgent *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    initialEntryDate = v2->_initialEntryDate;
    v2->_initialEntryDate = (NSDate *)v3;

    lastLocalDeliveryLogDate = v2->_lastLocalDeliveryLogDate;
    v2->_lastLocalDeliveryLogDate = 0;

    uint64_t v6 = objc_opt_new();
    previousStatsByPriority = v2->_previousStatsByPriority;
    v2->_previousStatsByPriority = (NSMutableDictionary *)v6;

    uint64_t v8 = objc_opt_new();
    lastEntryDatePerCategory = v2->_lastEntryDatePerCategory;
    v2->_lastEntryDatePerCategory = (NSMutableDictionary *)v8;
  }
  return v2;
}

- (void)setCurrentLinkType
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v3 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (qword_1EBD58548 != -1) {
      dispatch_once(&qword_1EBD58548, block);
    }
    if (_MergedGlobals_1_26)
    {
      v4 = [NSString stringWithFormat:@"setCurrentLinkType:: setting current linktype"];
      v5 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      v7 = [v6 lastPathComponent];
      uint64_t v8 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent setCurrentLinkType]"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:361];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v4;
        _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = [MEMORY[0x1E4F79EF0] sharedInstance];
  objc_super v11 = [v10 getActivePairedDevice];
  uint64_t v12 = [v10 deviceIDForNRDevice:v11];
  if (v12)
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v13 = objc_opt_class();
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_151;
      v37[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v37[4] = v13;
      if (qword_1EBD58550 != -1) {
        dispatch_once(&qword_1EBD58550, v37);
      }
      if (byte_1EBD58529)
      {
        v14 = [NSString stringWithFormat:@"setCurrentLinkType:: initialized companionPeerIdentifier"];
        v15 = (void *)MEMORY[0x1E4F929B8];
        v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
        v17 = [v16 lastPathComponent];
        v18 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent setCurrentLinkType]"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:374];

        v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v14;
          _os_log_debug_impl(&dword_1D2690000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    uint64_t v20 = [MEMORY[0x1E4F7A120] newDeviceIdentifierWithBluetoothUUID:v12];
    if (!v20)
    {
      v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v12;
        v33 = "setCurrentLinkType:: Failed to create NRDeviceIdentifier for bluetooth UUID %@";
        v34 = v32;
        uint32_t v35 = 12;
        goto LABEL_33;
      }
LABEL_30:

      goto LABEL_31;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v21 = objc_opt_class();
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_158;
      v36[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v36[4] = v21;
      if (qword_1EBD58558 != -1) {
        dispatch_once(&qword_1EBD58558, v36);
      }
      if (byte_1EBD5852A)
      {
        v22 = [NSString stringWithFormat:@"setCurrentLinkType:: initialized networkRelayIdentifier"];
        v23 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v24 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
        v25 = [v24 lastPathComponent];
        v26 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent setCurrentLinkType]"];
        [v23 logMessage:v22 fromFile:v25 fromFunction:v26 fromLineNumber:377];

        v27 = PLLogCommon();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v22;
          _os_log_debug_impl(&dword_1D2690000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    id v28 = objc_alloc(MEMORY[0x1E4F7A128]);
    v29 = [(PLOperator *)self workQueue];
    v30 = (void *)[v28 initWithDeviceIdentifier:v20 delegate:self queue:v29];
    [(PLIdentityServicesAgent *)self setNrdm:v30];

    v31 = [(PLIdentityServicesAgent *)self nrdm];

    if (!v31)
    {
      v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v33 = "setCurrentLinkType:: NRDeviceMonitor init failed";
        v34 = v32;
        uint32_t v35 = 2;
LABEL_33:
        _os_log_debug_impl(&dword_1D2690000, v34, OS_LOG_TYPE_DEBUG, v33, buf, v35);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v20 = PLLogCommon();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "setCurrentLinkType:: No bluetooth ID from active device %@", buf, 0xCu);
    }
  }
LABEL_31:
}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_26 = result;
  return result;
}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_151(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58529 = result;
  return result;
}

uint64_t __45__PLIdentityServicesAgent_setCurrentLinkType__block_invoke_158(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852A = result;
  return result;
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(MEMORY[0x1E4F929C0], "debugEnabled", a3))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke;
    v34 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v35 = v6;
    if (qword_1EBD58560 != -1) {
      dispatch_once(&qword_1EBD58560, &block);
    }
    if (byte_1EBD5852B)
    {
      v7 = [NSString stringWithFormat:@"deviceLinkTypeDidChange:: checking current link type"];
      uint64_t v8 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      uint64_t v10 = [v9 lastPathComponent];
      objc_super v11 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent deviceLinkTypeDidChange:linkType:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:393];

      uint64_t v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LocalLinkType"];
  v14 = [(PLOperator *)self storage];
  v15 = [v14 lastEntryForKey:v13];

  if (!v15
    || ([v15 objectForKeyedSubscript:@"linkType"],
        v16 = objc_claimAutoreleasedReturnValue(),
        [NSNumber numberWithUnsignedChar:v4],
        v17 = objc_claimAutoreleasedReturnValue(),
        char v18 = [v16 isEqual:v17],
        v17,
        v16,
        (v18 & 1) == 0))
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v26 = MEMORY[0x1E4F143A8];
      uint64_t v27 = 3221225472;
      id v28 = __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke_169;
      v29 = &__block_descriptor_40_e5_v8__0lu32l8;
      uint64_t v30 = v19;
      if (qword_1EBD58568 != -1) {
        dispatch_once(&qword_1EBD58568, &v26);
      }
      if (byte_1EBD5852C)
      {
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"deviceLinkTypeDidChange:: adding current link type", v26, v27, v28, v29, v30);
        uint64_t v21 = (void *)MEMORY[0x1E4F929B8];
        v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
        v23 = [v22 lastPathComponent];
        uint64_t v24 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent deviceLinkTypeDidChange:linkType:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:397];

        v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v37 = v20;
          _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    -[PLIdentityServicesAgent logLocalLinkType:](self, "logLocalLinkType:", v4, v26, v27, v28, v29, v30, block, v32, v33, v34, v35);
  }
}

uint64_t __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852B = result;
  return result;
}

uint64_t __60__PLIdentityServicesAgent_deviceLinkTypeDidChange_linkType___block_invoke_169(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852C = result;
  return result;
}

- (void)initOperatorDependancies
{
  [(PLIdentityServicesAgent *)self setCurrentLinkType];
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke;
  v34[3] = &unk_1E692A6F8;
  v34[4] = self;
  uint64_t v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29E9680 withBlock:v34];
  networkStatsHandler = self->_networkStatsHandler;
  self->_networkStatsHandler = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_198;
  v33[3] = &unk_1E692A6F8;
  v33[4] = self;
  v7 = (PLXPCListenerOperatorComposition *)[v6 initWithOperator:self withRegistration:&unk_1F29E96A8 withBlock:v33];
  infraWiFiRequestHandler = self->_infraWiFiRequestHandler;
  self->_infraWiFiRequestHandler = v7;

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_206;
  v32[3] = &unk_1E692A6F8;
  v32[4] = self;
  uint64_t v10 = (PLXPCListenerOperatorComposition *)[v9 initWithOperator:self withRegistration:&unk_1F29E96D0 withBlock:v32];
  localLinkTypeHandler = self->_localLinkTypeHandler;
  self->_localLinkTypeHandler = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_3;
  v31[3] = &unk_1E692A6F8;
  v31[4] = self;
  uint64_t v13 = (PLXPCListenerOperatorComposition *)[v12 initWithOperator:self withRegistration:&unk_1F29E96F8 withBlock:v31];
  localMessageHandler = self->_localMessageHandler;
  self->_localMessageHandler = v13;

  id v15 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_221;
  v30[3] = &unk_1E692A6F8;
  v30[4] = self;
  v16 = (PLXPCListenerOperatorComposition *)[v15 initWithOperator:self withRegistration:&unk_1F29E9720 withBlock:v30];
  idsLinkPreferenceRequestHandler = self->_idsLinkPreferenceRequestHandler;
  self->_idsLinkPreferenceRequestHandler = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_235;
  v29[3] = &unk_1E692A6F8;
  v29[4] = self;
  uint64_t v19 = (PLXPCListenerOperatorComposition *)[v18 initWithOperator:self withRegistration:&unk_1F29E9748 withBlock:v29];
  idsOutgoingPushSentListener = self->_idsOutgoingPushSentListener;
  self->_idsOutgoingPushSentListener = v19;

  id v21 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_243;
  v28[3] = &unk_1E692A6F8;
  v28[4] = self;
  v22 = (PLXPCListenerOperatorComposition *)[v21 initWithOperator:self withRegistration:&unk_1F29E9770 withBlock:v28];
  idsIncomingPushReceivedListener = self->_idsIncomingPushReceivedListener;
  self->_idsIncomingPushReceivedListener = v22;

  id v24 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_251;
  v27[3] = &unk_1E692A6F8;
  void v27[4] = self;
  v25 = (PLXPCListenerOperatorComposition *)[v24 initWithOperator:self withRegistration:&unk_1F29E9798 withBlock:v27];
  idsSessionListener = self->_idsSessionListener;
  self->_idsSessionListener = v25;
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58570 != -1) {
      dispatch_once(&qword_1EBD58570, &block);
    }
    if (byte_1EBD5852D)
    {
      uint64_t v8 = [NSString stringWithFormat:@"IDS Message callback recieved payload %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      objc_super v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:414];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logIDSNetworkEntries:v6];
}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852D = result;
  return result;
}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) logLocalInfraWiFiFrequests:a5];
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_206(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9 = a5;
  id v6 = [v9 objectForKey:@"IDSLinkType"];

  if (v6)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v9 objectForKey:@"IDSLinkType"];
    objc_msgSend(v7, "logLocalLinkType:", objc_msgSend(v8, "integerValue"));
  }
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_4;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58578 != -1) {
      dispatch_once(&qword_1EBD58578, &block);
    }
    if (byte_1EBD5852E)
    {
      uint64_t v8 = [NSString stringWithFormat:@"Local Message Topic callback: %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      objc_super v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke_3"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:435];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logLocalMessageTopic:v6];
}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_4(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852E = result;
  return result;
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_221(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_222;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58580 != -1) {
      dispatch_once(&qword_1EBD58580, &block);
    }
    if (byte_1EBD5852F)
    {
      uint64_t v8 = [NSString stringWithFormat:@"IDS Link Preference Request payload %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      objc_super v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent initOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:444];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logIDSLinkPreference:v6];
}

uint64_t __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_2_222(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5852F = result;
  return result;
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_235(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogIDS();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "IDS Outgoing Push Sent payload %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logIDSOutgoingPushSent:v6];
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_243(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogIDS();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1D2690000, v7, OS_LOG_TYPE_INFO, "IDS Incoming Push Received payload %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logIDSIncomingPushReceived:v6];
}

void __51__PLIdentityServicesAgent_initOperatorDependancies__block_invoke_251(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  uint64_t v7 = PLLogIDS();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "IDSDSession payload %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logIDSSession:v6];
}

- (void)initTaskOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke;
  v6[3] = &unk_1E692A6F8;
  v6[4] = self;
  uint64_t v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29E97C0 withBlock:v6];
  cloudMessagingHandler = self->_cloudMessagingHandler;
  self->_cloudMessagingHandler = v4;
}

void __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v18 = v7;
    if (qword_1EBD58588 != -1) {
      dispatch_once(&qword_1EBD58588, &block);
    }
    if (byte_1EBD58530)
    {
      int v8 = [NSString stringWithFormat:@"Cloud Messaging callback: %@", v6, block, v15, v16, v17, v18];
      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      objc_super v11 = [v10 lastPathComponent];
      id v12 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent initTaskOperatorDependancies]_block_invoke"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:479];

      uint64_t v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v8;
        _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logCloudMessaging:v6];
}

uint64_t __55__PLIdentityServicesAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58530 = result;
  return result;
}

- (void)logLocalMessageTopic:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"IDSLocalMessage"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logIDSLinkPreference:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v8 = +[PLOperator entryKeyForType:v4 andName:@"IDSLinkPreferenceRequest"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v5];
  id v7 = [v5 objectForKey:@"InputBytesPerSecond"];

  if (!v7) {
    [v6 setObject:&unk_1F29E5E30 forKeyedSubscript:@"InputBytesPerSecond"];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logIDSOutgoingPushSent:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"IDSOutgoingPushSent"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logIDSIncomingPushReceived:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"IDSIncomingPushReceived"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logIDSSession:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Session"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logCloudMessaging:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4
    && ([v4 objectForKeyedSubscript:@"IDSClientBringsUpCloudMessaging"],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CloudMessaging"];
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];
    [(PLOperator *)self logEntry:v8];
  }
  else if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v9 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLIdentityServicesAgent_logCloudMessaging___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v9;
    if (qword_1EBD58590 != -1) {
      dispatch_once(&qword_1EBD58590, block);
    }
    if (byte_1EBD58531)
    {
      uint64_t v10 = [NSString stringWithFormat:@"Payload invalid for Cloud Messaging"];
      objc_super v11 = (void *)MEMORY[0x1E4F929B8];
      id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
      uint64_t v13 = [v12 lastPathComponent];
      v14 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent logCloudMessaging:]"];
      [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:526];

      uint64_t v15 = PLLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v18 = v10;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
}

uint64_t __45__PLIdentityServicesAgent_logCloudMessaging___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58531 = result;
  return result;
}

- (void)logLocalLinkType:(unint64_t)a3
{
  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LocalLinkType"];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v6 forKeyedSubscript:@"linkType"];

  [(PLOperator *)self logEntry:v5];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0) {
    [(PLIdentityServicesAgent *)self createBTAccountingEvents:v5];
  }
}

- (void)notifyLinkType:(unint64_t)a3
{
  int out_token = 0;
  notify_register_check((const char *)[@"PLIDSStatusChangedNotification" UTF8String], &out_token);
  notify_set_state(out_token, a3);
  notify_post((const char *)[@"PLIDSStatusChangedNotification" UTF8String]);
  notify_cancel(out_token);
}

- (void)logLocalInfraWiFiFrequests:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v10 = +[PLOperator entryKeyForType:v4 andName:@"LocalInfraWiFiRequests"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
  id v7 = [v5 objectForKeyedSubscript:@"IDSServicePrefersInfraWifi"];
  id v8 = [v7 allObjects];
  [v6 setObject:v8 forKeyedSubscript:@"requestingServices"];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"Reason"];

  [v6 setObject:v9 forKeyedSubscript:@"reason"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logIDSNetworkEntries:(id)a3
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"IDSLocalStatisticsCategory"];
  v143 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  id v6 = [(PLIdentityServicesAgent *)self previousStatsByPriority];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];

  v162 = (void *)v7;
  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [(PLIdentityServicesAgent *)self previousStatsByPriority];
    v162 = (void *)v8;
    [v9 setObject:v8 forKeyedSubscript:v5];
  }
  int v10 = [v5 isEqualToString:@"Sockets"];
  v141 = objc_opt_new();
  uint64_t v11 = *MEMORY[0x1E4F92D38];
  v159 = self;
  v140 = v4;
  if (!v10)
  {
    v142 = +[PLOperator entryKeyForType:v11 andName:@"IDSMessagePeriodic"];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    id v80 = v4;
    uint64_t v81 = [v80 countByEnumeratingWithState:&v166 objects:v177 count:16];
    if (!v81) {
      goto LABEL_92;
    }
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v167;
    v155 = v80;
    uint64_t v158 = *(void *)v167;
    v161 = v5;
LABEL_54:
    uint64_t v84 = 0;
    uint64_t v153 = v82;
    while (1)
    {
      if (*(void *)v167 != v83) {
        objc_enumerationMutation(v80);
      }
      v85 = *(void **)(*((void *)&v166 + 1) + 8 * v84);
      if (([v85 isEqualToString:@"IDSLocalStatisticsCategory"] & 1) != 0
        || ([v85 containsString:@"__pl_internal"] & 1) != 0)
      {
        goto LABEL_90;
      }
      v86 = [v80 objectForKeyedSubscript:v85];
      char v87 = objc_opt_respondsToSelector();

      if (v87)
      {
        v88 = [(PLIdentityServicesAgent *)self lastEntryDatePerCategory];
        uint64_t v89 = [v88 objectForKeyedSubscript:v5];

        uint64_t v164 = v89;
        if (!v89)
        {
          uint64_t v164 = [(PLIdentityServicesAgent *)self initialEntryDate];
        }
        v90 = objc_opt_new();
        v91 = [v80 objectForKeyedSubscript:v85];
        v92 = [v91 objectForKeyedSubscript:@"IDSLocalOutgoingMessageBytes"];
        [v90 setObject:v92 atIndexedSubscript:0];

        v93 = [v80 objectForKeyedSubscript:v85];
        v94 = [v93 objectForKeyedSubscript:@"IDSLocalIncomingMessageBytes"];
        [v90 setObject:v94 atIndexedSubscript:1];

        v95 = [v80 objectForKeyedSubscript:v85];
        v96 = [v95 objectForKeyedSubscript:@"IDSLocalOutgoingMessages"];
        [v90 setObject:v96 atIndexedSubscript:2];

        v97 = [v80 objectForKeyedSubscript:v85];
        v98 = [v97 objectForKeyedSubscript:@"IDSLocalIncomingMessages"];
        [v90 setObject:v98 atIndexedSubscript:3];

        v99 = [v162 objectForKeyedSubscript:v85];
        [v162 setObject:v90 forKeyedSubscript:v85];
        if (v99 && v90)
        {
          v100 = v90;
          v101 = [v99 objectAtIndexedSubscript:0];
          unint64_t v102 = [v101 unsignedLongValue];

          v103 = [v100 objectAtIndexedSubscript:0];

          unint64_t v151 = [v103 unsignedLongValue];
          unint64_t v104 = v151 >= v102 ? v102 : 0;
          unint64_t v149 = v104;
          v105 = v100;
          v106 = [v99 objectAtIndexedSubscript:1];
          unint64_t v107 = [v106 unsignedLongValue];

          v108 = [v105 objectAtIndexedSubscript:1];

          unint64_t v145 = [v108 unsignedLongValue];
          unint64_t v109 = v145 >= v107 ? v107 : 0;
          unint64_t v147 = v109;
          v110 = v105;
          v111 = [v99 objectAtIndexedSubscript:2];
          unint64_t v112 = [v111 unsignedLongValue];

          v113 = [v110 objectAtIndexedSubscript:2];

          unint64_t v114 = [v113 unsignedLongValue];
          unint64_t v115 = v114 >= v112 ? v112 : 0;
          v116 = v110;
          v117 = [v99 objectAtIndexedSubscript:3];
          unint64_t v118 = [v117 unsignedLongValue];

          v119 = [v116 objectAtIndexedSubscript:3];

          unint64_t v120 = [v119 unsignedLongValue];
          unint64_t v121 = v120 >= v118 ? v118 : 0;
          if (v151 != v149 || v145 != v147 || v114 != v115 || v120 != v121)
          {
            unint64_t v122 = v120 - v121;
            v123 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v142 withDate:v164];
            [v123 setObject:v85 forKeyedSubscript:@"topic"];
            [v123 setObject:v161 forKeyedSubscript:@"priority"];
            v124 = [NSNumber numberWithUnsignedLongLong:v151 - v149];
            [v123 setObject:v124 forKeyedSubscript:@"OutgoingBytes"];

            v125 = [NSNumber numberWithUnsignedLongLong:v145 - v147];
            [v123 setObject:v125 forKeyedSubscript:@"IncomingBytes"];

            v126 = [NSNumber numberWithUnsignedLongLong:v114 - v115];
            [v123 setObject:v126 forKeyedSubscript:@"OutgoingMessages"];

            v127 = [NSNumber numberWithUnsignedLongLong:v122];
            [v123 setObject:v127 forKeyedSubscript:@"IncomingMessages"];

            [v123 setObject:v143 forKeyedSubscript:@"timestampEnd"];
            v128 = [v155 objectForKeyedSubscript:v85];
            v129 = [v128 objectForKeyedSubscript:@"IDSLocalLinkType"];
            [v123 setObject:v129 forKeyedSubscript:@"LinkType"];

            [v141 addObject:v123];
          }
        }

        self = v159;
        id v5 = v161;
        uint64_t v82 = v153;
        id v80 = v155;
        uint64_t v83 = v158;
        v130 = (void *)v164;
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_90;
        }
        uint64_t v131 = objc_opt_class();
        v165[0] = MEMORY[0x1E4F143A8];
        v165[1] = 3221225472;
        v165[2] = __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke_319;
        v165[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v165[4] = v131;
        if (qword_1EBD585A0 != -1) {
          dispatch_once(&qword_1EBD585A0, v165);
        }
        if (!byte_1EBD58533) {
          goto LABEL_90;
        }
        v132 = NSString;
        v133 = [v80 objectForKeyedSubscript:v85];
        v130 = [v132 stringWithFormat:@"Key %@ does not support objectForKeyedSubscript", v133];

        v134 = (void *)MEMORY[0x1E4F929B8];
        v135 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
        v136 = [v135 lastPathComponent];
        v137 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent logIDSNetworkEntries:]"];
        [v134 logMessage:v130 fromFile:v136 fromFunction:v137 fromLineNumber:704];

        v90 = PLLogCommon();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v181 = (uint64_t)v130;
          _os_log_debug_impl(&dword_1D2690000, v90, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
        uint64_t v83 = v158;
      }

LABEL_90:
      if (v82 == ++v84)
      {
        uint64_t v82 = [v80 countByEnumeratingWithState:&v166 objects:v177 count:16];
        if (!v82)
        {
LABEL_92:

          v78 = v141;
          v175 = v142;
          v176 = v141;
          v138 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
          [(PLOperator *)self logEntries:v138 withGroupID:v142];

          if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0) {
            goto LABEL_93;
          }
          goto LABEL_94;
        }
        goto LABEL_54;
      }
    }
  }
  v160 = v5;
  v142 = +[PLOperator entryKeyForType:v11 andName:@"IDSSocketPeriodic"];
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v171 objects:v182 count:16];
  if (!v13) {
    goto LABEL_50;
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v172;
  uint64_t v163 = *(void *)v172;
  do
  {
    uint64_t v16 = 0;
    uint64_t v144 = v14;
    do
    {
      if (*(void *)v172 != v15) {
        objc_enumerationMutation(v12);
      }
      v17 = *(void **)(*((void *)&v171 + 1) + 8 * v16);
      if (([v17 isEqualToString:@"IDSLocalStatisticsCategory"] & 1) == 0
        && ([v17 containsString:@"__pl_internal"] & 1) == 0)
      {
        uint64_t v18 = [v12 objectForKeyedSubscript:v17];
        char v19 = objc_opt_respondsToSelector();

        if (v19)
        {
          uint64_t v20 = objc_opt_new();
          uint64_t v21 = [v12 objectForKeyedSubscript:v17];
          v22 = [v21 objectForKeyedSubscript:@"IDSLocalOutgoingSocketBytes"];
          [v20 setObject:v22 atIndexedSubscript:0];

          v23 = [v12 objectForKeyedSubscript:v17];
          id v24 = [v23 objectForKeyedSubscript:@"IDSLocalIncomingSocketBytes"];
          [v20 setObject:v24 atIndexedSubscript:1];

          v25 = [v12 objectForKeyedSubscript:v17];
          uint64_t v26 = [v25 objectForKeyedSubscript:@"IDSLocalOutgoingSocketPackets"];
          [v20 setObject:v26 atIndexedSubscript:2];

          uint64_t v27 = [v12 objectForKeyedSubscript:v17];
          id v28 = [v27 objectForKeyedSubscript:@"IDSLocalIncomingSocketPackets"];
          [v20 setObject:v28 atIndexedSubscript:3];

          v29 = [v162 objectForKeyedSubscript:v17];
          [v162 setObject:v20 forKeyedSubscript:v17];
          uint64_t v30 = 0;
          if (!v29 || !v20) {
            goto LABEL_46;
          }
          if ([v17 isEqualToString:@"localdelivery"])
          {
            uint64_t v31 = [(PLIdentityServicesAgent *)self lastLocalDeliveryLogDate];
            if (v31)
            {
              uint64_t v32 = (void *)v31;
              v33 = [(PLIdentityServicesAgent *)self lastLocalDeliveryLogDate];
              [v143 timeIntervalSinceDate:v33];
              double v35 = fabs(v34);

              if (v35 < 600.0)
              {
                uint64_t v30 = 0;
LABEL_46:

LABEL_47:
                uint64_t v15 = v163;

                goto LABEL_48;
              }
            }
            uint64_t v154 = [(PLIdentityServicesAgent *)self lastLocalDeliveryLogDate];
            [(PLIdentityServicesAgent *)self setLastLocalDeliveryLogDate:v143];
          }
          else
          {
            v45 = [(PLIdentityServicesAgent *)self lastEntryDatePerCategory];
            uint64_t v154 = [v45 objectForKeyedSubscript:v160];
          }
          v46 = v20;
          v47 = [v29 objectAtIndexedSubscript:0];
          unint64_t v48 = [v47 unsignedLongValue];

          v49 = [v46 objectAtIndexedSubscript:0];

          unint64_t v152 = [v49 unsignedLongValue];
          if (v152 >= v48) {
            unint64_t v50 = v48;
          }
          else {
            unint64_t v50 = 0;
          }
          unint64_t v150 = v50;
          v51 = v46;
          v52 = [v29 objectAtIndexedSubscript:1];
          unint64_t v53 = [v52 unsignedLongValue];

          v54 = [v51 objectAtIndexedSubscript:1];

          v55 = v29;
          unint64_t v56 = [v54 unsignedLongValue];

          if (v56 >= v53) {
            unint64_t v57 = v53;
          }
          else {
            unint64_t v57 = 0;
          }
          unint64_t v146 = v57;
          v58 = v51;
          v59 = [v55 objectAtIndexedSubscript:2];
          unint64_t v60 = [v59 unsignedLongValue];

          v61 = [v58 objectAtIndexedSubscript:2];

          unint64_t v62 = [v61 unsignedLongValue];
          if (v62 >= v60) {
            unint64_t v63 = v60;
          }
          else {
            unint64_t v63 = 0;
          }
          unint64_t v156 = v63;
          v64 = v58;
          v148 = v55;
          v65 = [v55 objectAtIndexedSubscript:3];
          unint64_t v66 = [v65 unsignedLongValue];

          v67 = [v64 objectAtIndexedSubscript:3];

          unint64_t v68 = [v67 unsignedLongValue];
          if (v68 < v66) {
            unint64_t v66 = 0;
          }
          if (v152 == v150 && v56 == v146 && v62 == v156 && v68 == v66)
          {
            self = v159;
            uint64_t v14 = v144;
            uint64_t v30 = (void *)v154;
          }
          else
          {
            uint64_t v69 = v154;
            if (!v154)
            {
              uint64_t v69 = [(PLIdentityServicesAgent *)v159 initialEntryDate];
            }
            unint64_t v70 = v56 - v146;
            unint64_t v157 = v62 - v156;
            unint64_t v71 = v68 - v66;
            v72 = (void *)v69;
            v73 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v142 withDate:v69];
            [v73 setObject:v17 forKeyedSubscript:@"topic"];
            v74 = [NSNumber numberWithUnsignedLongLong:v152 - v150];
            [v73 setObject:v74 forKeyedSubscript:@"OutgoingBytes"];

            v75 = [NSNumber numberWithUnsignedLongLong:v70];
            [v73 setObject:v75 forKeyedSubscript:@"IncomingBytes"];

            v76 = [NSNumber numberWithUnsignedLongLong:v157];
            [v73 setObject:v76 forKeyedSubscript:@"OutgoingPackets"];

            v77 = [NSNumber numberWithUnsignedLongLong:v71];
            [v73 setObject:v77 forKeyedSubscript:@"IncomingPackets"];

            [v73 setObject:v143 forKeyedSubscript:@"timestampEnd"];
            [v141 addObject:v73];

            uint64_t v14 = v144;
            uint64_t v30 = v72;
            self = v159;
          }
          v29 = v148;
          goto LABEL_46;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v36 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v36;
          if (qword_1EBD58598 != -1) {
            dispatch_once(&qword_1EBD58598, block);
          }
          if (byte_1EBD58532)
          {
            v37 = NSString;
            uint64_t v38 = [v12 objectForKeyedSubscript:v17];
            uint64_t v39 = [v37 stringWithFormat:@"IDS Sockets - Key %@ does not support objectForKeyedSubscript", v38];

            v40 = (void *)MEMORY[0x1E4F929B8];
            uint64_t v41 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Networking/PLIdentityServicesAgent.m"];
            v42 = [v41 lastPathComponent];
            v43 = [NSString stringWithUTF8String:"-[PLIdentityServicesAgent logIDSNetworkEntries:]"];
            v44 = v40;
            uint64_t v30 = (void *)v39;
            [v44 logMessage:v39 fromFile:v42 fromFunction:v43 fromLineNumber:651];

            uint64_t v20 = PLLogCommon();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v181 = v39;
              _os_log_debug_impl(&dword_1D2690000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }
            goto LABEL_47;
          }
        }
      }
LABEL_48:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v14 = [v12 countByEnumeratingWithState:&v171 objects:v182 count:16];
  }
  while (v14);
LABEL_50:

  v78 = v141;
  v178 = v142;
  v179 = v141;
  v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v179 forKeys:&v178 count:1];
  [(PLOperator *)self logEntries:v79 withGroupID:v142];

  id v5 = v160;
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    goto LABEL_94;
  }
LABEL_93:
  [(PLIdentityServicesAgent *)self createIDSAccountingEventsWithEntries:v78];
LABEL_94:

  v139 = [(PLIdentityServicesAgent *)self lastEntryDatePerCategory];
  [v139 setObject:v143 forKeyedSubscript:v5];
}

uint64_t __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58532 = result;
  return result;
}

uint64_t __48__PLIdentityServicesAgent_logIDSNetworkEntries___block_invoke_319(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58533 = result;
  return result;
}

- (void)createBTAccountingEvents:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = [v7 objectForKey:@"linkType"];
    uint64_t v4 = [v3 integerValue];

    id v5 = [MEMORY[0x1E4F92900] sharedInstance];
    id v6 = [v7 entryDate];
    if (v4 == 1) {
      [v5 createDistributionEventForwardWithDistributionID:8 withAddingChildNodeName:@"IDSWatchBT" withStartDate:v6];
    }
    else {
      [v5 createDistributionEventForwardWithDistributionID:8 withRemovingChildNodeName:@"IDSWatchBT" withStartDate:v6];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)createIDSAccountingEventsWithEntries:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F92A38] isHomePod];
  if (v3 && (v4 & 1) == 0 && [v3 count])
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
    uint64_t v8 = v6;
    if (v7)
    {
      uint64_t v9 = v7;
      id v35 = v3;
      uint64_t v10 = *(void *)v41;
      double v11 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v14 = [v13 objectForKeyedSubscript:@"topic"];
          uint64_t v15 = v14;
          if (v14 && ([v14 isEqualToString:@"localdelivery"] & 1) == 0)
          {
            uint64_t v16 = [v13 objectForKeyedSubscript:@"OutgoingBytes"];
            [v16 doubleValue];
            double v18 = v17;
            char v19 = [v13 objectForKeyedSubscript:@"IncomingBytes"];
            [v19 doubleValue];
            double v21 = v18 + v20;

            double v11 = v11 + v21;
            v22 = [NSNumber numberWithDouble:v21];
            [v5 setObject:v22 forKeyedSubscript:v15];
          }
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v9);

      id v3 = v35;
      if (v11 <= 0.0) {
        goto LABEL_23;
      }
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      uint64_t v8 = [v5 allKeys];
      uint64_t v23 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v37;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v37 != v25) {
              objc_enumerationMutation(v8);
            }
            uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * j);
            id v28 = [v5 objectForKeyedSubscript:v27];
            [v28 doubleValue];
            double v30 = v29;

            uint64_t v31 = [NSNumber numberWithDouble:v30 / v11];
            [v5 setObject:v31 forKeyedSubscript:v27];
          }
          uint64_t v24 = [v8 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v24);
      }
    }

LABEL_23:
    uint64_t v32 = [MEMORY[0x1E4F92900] sharedInstance];
    v33 = [v6 firstObject];
    double v34 = [v33 objectForKeyedSubscript:@"timestampEnd"];
    [v32 createDistributionEventBackwardWithDistributionID:31 withChildNodeNameToWeight:v5 withEndDate:v34];
  }
}

- (PLXPCListenerOperatorComposition)localMessageHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalMessageHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)networkStatsHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNetworkStatsHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)infraWiFiRequestHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInfraWiFiRequestHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)localLinkTypeHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLocalLinkTypeHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)ipsecLinkTypeHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setIpsecLinkTypeHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cloudMessagingHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setCloudMessagingHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)idsLinkPreferenceRequestHandler
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setIdsLinkPreferenceRequestHandler:(id)a3
{
}

- (PLXPCListenerOperatorComposition)idsOutgoingPushSentListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIdsOutgoingPushSentListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)idsIncomingPushReceivedListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIdsIncomingPushReceivedListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)idsSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIdsSessionListener:(id)a3
{
}

- (NSMutableDictionary)previousStatsByPriority
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPreviousStatsByPriority:(id)a3
{
}

- (NSDate)initialEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (void)setInitialEntryDate:(id)a3
{
}

- (NSDate)lastLocalDeliveryLogDate
{
  return (NSDate *)objc_getProperty(self, a2, 144, 1);
}

- (void)setLastLocalDeliveryLogDate:(id)a3
{
}

- (NSMutableDictionary)lastEntryDatePerCategory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setLastEntryDatePerCategory:(id)a3
{
}

- (NRDeviceMonitor)nrdm
{
  return (NRDeviceMonitor *)objc_getProperty(self, a2, 160, 1);
}

- (void)setNrdm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrdm, 0);
  objc_storeStrong((id *)&self->_lastEntryDatePerCategory, 0);
  objc_storeStrong((id *)&self->_lastLocalDeliveryLogDate, 0);
  objc_storeStrong((id *)&self->_initialEntryDate, 0);
  objc_storeStrong((id *)&self->_previousStatsByPriority, 0);
  objc_storeStrong((id *)&self->_idsSessionListener, 0);
  objc_storeStrong((id *)&self->_idsIncomingPushReceivedListener, 0);
  objc_storeStrong((id *)&self->_idsOutgoingPushSentListener, 0);
  objc_storeStrong((id *)&self->_idsLinkPreferenceRequestHandler, 0);
  objc_storeStrong((id *)&self->_cloudMessagingHandler, 0);
  objc_storeStrong((id *)&self->_ipsecLinkTypeHandler, 0);
  objc_storeStrong((id *)&self->_localLinkTypeHandler, 0);
  objc_storeStrong((id *)&self->_infraWiFiRequestHandler, 0);
  objc_storeStrong((id *)&self->_networkStatsHandler, 0);
  objc_storeStrong((id *)&self->_localMessageHandler, 0);
}

@end