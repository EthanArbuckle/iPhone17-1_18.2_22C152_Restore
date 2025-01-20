@interface PLHomeKitAgent
+ (id)defaults;
+ (id)entryAggregateDefinitionIDSPushMessageTypes;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionCameraConfiguration;
+ (id)entryEventForwardDefinitionHomeConfiguration;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionHomeKitAdvt;
+ (id)entryEventPointDefinitionHomeKitEvents;
+ (id)entryEventPointDefinitionHomeKitRegistration;
+ (id)entryEventPointDefinitionHomeKitSummary;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)enablelog;
- (BOOL)isAllowedMessageType:(id)a3;
- (PLEntryNotificationOperatorComposition)deviceWake;
- (PLEntryNotificationOperatorComposition)sbcLevelChanged;
- (PLHomeKitAgent)init;
- (PLTimer)runTimeAggregatorTimer;
- (PLXPCListenerOperatorComposition)cameraConfigurationListener;
- (PLXPCListenerOperatorComposition)homeConfigurationListener;
- (PLXPCListenerOperatorComposition)homeKitEventsListener;
- (PLXPCListenerOperatorComposition)homeKitRegistrationListener;
- (double)lastapwake;
- (int64_t)eventTypeStringToEnum:(id)a3;
- (int64_t)registrationTypeStringToEnum:(id)a3;
- (unint64_t)numBTConnections;
- (unint64_t)numBTPushes;
- (unint64_t)numBTWakeAdvt;
- (unint64_t)numBTWakes;
- (unint64_t)numBTlines;
- (unint64_t)numBonjour;
- (unint64_t)numCloudPushes;
- (unint64_t)numConnections;
- (unint64_t)numIDSPushes;
- (unint64_t)numIPConnections;
- (unint64_t)numIPEvents;
- (unint64_t)numPrevBTPushes;
- (unint64_t)numPrevConnections;
- (unint64_t)numaggregatelines;
- (void)initOperatorDependancies;
- (void)logAggregateIDSPushMessageTypes:(id)a3;
- (void)logEventForwardCameraConfiguration:(id)a3;
- (void)logEventForwardHomeConfiguration:(id)a3;
- (void)logEventPointHomeKitEvents:(id)a3;
- (void)logEventPointHomeKitRegistration:(id)a3;
- (void)setCameraConfigurationListener:(id)a3;
- (void)setDeviceWake:(id)a3;
- (void)setEnablelog:(BOOL)a3;
- (void)setHomeConfigurationListener:(id)a3;
- (void)setHomeKitEventsListener:(id)a3;
- (void)setHomeKitRegistrationListener:(id)a3;
- (void)setLastapwake:(double)a3;
- (void)setNumBTConnections:(unint64_t)a3;
- (void)setNumBTPushes:(unint64_t)a3;
- (void)setNumBTWakeAdvt:(unint64_t)a3;
- (void)setNumBTWakes:(unint64_t)a3;
- (void)setNumBTlines:(unint64_t)a3;
- (void)setNumBonjour:(unint64_t)a3;
- (void)setNumCloudPushes:(unint64_t)a3;
- (void)setNumConnections:(unint64_t)a3;
- (void)setNumIDSPushes:(unint64_t)a3;
- (void)setNumIPConnections:(unint64_t)a3;
- (void)setNumIPEvents:(unint64_t)a3;
- (void)setNumPrevBTPushes:(unint64_t)a3;
- (void)setNumPrevConnections:(unint64_t)a3;
- (void)setNumaggregatelines:(unint64_t)a3;
- (void)setRunTimeAggregatorTimer:(id)a3;
- (void)setSbcLevelChanged:(id)a3;
- (void)writeAggregateCounters:(id)a3;
@end

@implementation PLHomeKitAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLHomeKitAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return &unk_1F29E8B90;
}

+ (id)entryEventPointDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"HomeKitBTLE";
  v3 = [a1 entryEventPointDefinitionHomeKitAdvt];
  v10[0] = v3;
  v9[1] = @"HomeKitEvents";
  v4 = [a1 entryEventPointDefinitionHomeKitEvents];
  v10[1] = v4;
  v9[2] = @"HomeKitSummary";
  v5 = [a1 entryEventPointDefinitionHomeKitSummary];
  v10[2] = v5;
  v9[3] = @"HomeKitRegistration";
  v6 = [a1 entryEventPointDefinitionHomeKitRegistration];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryEventPointDefinitionHomeKitEvents
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F02D0;
  v16[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"eventType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v14[0] = v5;
  v13[1] = @"kHMFPowerLogDeviceIdentiferKey";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v14[1] = v7;
  v13[2] = @"accessoryCategory";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionHomeKitAdvt
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F02D0;
  v14[1] = MEMORY[0x1E4F1CC28];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"kHMFPowerLogEventType";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v11[1] = @"kHMFPowerLogDeviceIdentiferKey";
  v12[0] = v5;
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v12[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventPointDefinitionHomeKitRegistration
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v15[0] = *MEMORY[0x1E4F92CD0];
  v15[1] = v2;
  v16[0] = &unk_1F29F02E0;
  v16[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E4F92CA8];
  v13[0] = @"Enabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v14[0] = v5;
  v13[1] = @"BundleID";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v14[1] = v7;
  void v13[2] = @"RegistrationType";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v18[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  return v11;
}

+ (id)entryEventPointDefinitionHomeKitSummary
{
  v34[2] = *MEMORY[0x1E4F143B8];
  v33[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v31[0] = *MEMORY[0x1E4F92CD0];
  v31[1] = v2;
  v32[0] = &unk_1F29F02E0;
  v32[1] = MEMORY[0x1E4F1CC28];
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
  v34[0] = v28;
  v33[1] = *MEMORY[0x1E4F92CA8];
  v29[0] = @"numBTPushes";
  v27 = [MEMORY[0x1E4F929D8] sharedInstance];
  v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
  v30[0] = v26;
  v29[1] = @"numConnections";
  v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
  v30[1] = v24;
  v29[2] = @"numBTConnections";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v30[2] = v22;
  v29[3] = @"numIPConnections";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
  v30[3] = v20;
  v29[4] = @"numIPEvents";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v30[4] = v18;
  v29[5] = @"numIDSPushes";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v30[5] = v16;
  v29[6] = @"numCloudPushes";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v30[6] = v14;
  v29[7] = @"numBonjour";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v30[7] = v4;
  v29[8] = @"numBTWakeAdvt";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v30[8] = v6;
  v29[9] = @"numBTWakes";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v30[9] = v8;
  v29[10] = @"Reason";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v30[10] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:11];
  v34[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"HomeConfiguration";
  v3 = [a1 entryEventForwardDefinitionHomeConfiguration];
  v7[1] = @"CameraConfiguration";
  v8[0] = v3;
  v4 = [a1 entryEventForwardDefinitionCameraConfiguration];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardDefinitionHomeConfiguration
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v22 = *MEMORY[0x1E4F92CD0];
  v23 = &unk_1F29F02F0;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"numHomes";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v21[0] = v17;
  v20[1] = @"numNonEmptyHomes";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v21[1] = v15;
  v20[2] = @"numUsers";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v21[2] = v13;
  v20[3] = @"numHAPAccessories";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v21[3] = v3;
  v20[4] = @"numEnabledResidents";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v21[4] = v5;
  v20[5] = @"isCurrentDevicePrimaryResident";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_BoolFormat");
  v21[5] = v7;
  v20[6] = @"HomeHubVersion";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v21[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v11;
}

+ (id)entryEventForwardDefinitionCameraConfiguration
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F29F02D0;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v17;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"numCameras";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v19[0] = v15;
  v18[1] = @"numCamerasRecordingEnabled";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v19[1] = v13;
  v18[2] = @"numCamerasSmartBulletinNotificationEnabled";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v19[2] = v3;
  void v18[3] = @"numCamerasReachabilityNotificationEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v19[3] = v5;
  v18[4] = @"numCamerasAnyMotionEventEnabled";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v19[4] = v7;
  v18[5] = @"numCamerasHSVMotionEventEnabled";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v19[5] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:6];
  v23[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];

  return v11;
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
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"IDSPushMessageTypes";
  uint64_t v2 = [a1 entryAggregateDefinitionIDSPushMessageTypes];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryAggregateDefinitionIDSPushMessageTypes
{
  void v23[4] = *MEMORY[0x1E4F143B8];
  v22[0] = *MEMORY[0x1E4F92C50];
  uint64_t v20 = *MEMORY[0x1E4F92CD0];
  v21 = &unk_1F29F02E0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  v23[0] = v2;
  v22[1] = *MEMORY[0x1E4F92CA8];
  v18[0] = @"MessageType";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_StringFormat");
  v18[1] = @"Count";
  v19[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v19[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v23[1] = v7;
  void v22[2] = *MEMORY[0x1E4F92BE0];
  v16 = &unk_1F29F0300;
  uint64_t v14 = *MEMORY[0x1E4F92BD8];
  v15 = &unk_1F29F0310;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17 = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  v23[2] = v9;
  v22[3] = *MEMORY[0x1E4F92BF0];
  v13 = @"Count";
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v23[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:4];

  return v11;
}

- (PLHomeKitAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLHomeKitAgent;
  result = [(PLAgent *)&v3 init];
  if (result)
  {
    result->_numBTPushes = 0;
    result->_numConnections = 0;
    result->_numPrevBTPushes = 0;
    result->_numPrevConnections = 0;
    result->_numBTConnections = 0;
    result->_numIPConnections = 0;
    result->_numBonjour = 0;
    result->_numIPEvents = 0;
    result->_numIDSPushes = 0;
    result->_numCloudPushes = 0;
    result->_numBTWakeAdvt = 0;
    result->_numBTWakes = 0;
    result->_lastapwake = 0.0;
    result->_enablelog = 0;
    result->_numaggregatelines = 0;
    result->_numBTlines = 0;
  }
  return result;
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  void v32[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke;
  v32[3] = &unk_1E692A6F8;
  v32[4] = self;
  v4 = (PLXPCListenerOperatorComposition *)[v3 initWithOperator:self withRegistration:&unk_1F29E8BB8 withBlock:v32];
  homeKitEventsListener = self->_homeKitEventsListener;
  self->_homeKitEventsListener = v4;

  id v6 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  void v31[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_308;
  v31[3] = &unk_1E692A6F8;
  v31[4] = self;
  v7 = (PLXPCListenerOperatorComposition *)[v6 initWithOperator:self withRegistration:&unk_1F29E8BE0 withBlock:v31];
  homeConfigurationListener = self->_homeConfigurationListener;
  self->_homeConfigurationListener = v7;

  id v9 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_313;
  v30[3] = &unk_1E692A6F8;
  v30[4] = self;
  v10 = (PLXPCListenerOperatorComposition *)[v9 initWithOperator:self withRegistration:&unk_1F29E8C08 withBlock:v30];
  cameraConfigurationListener = self->_cameraConfigurationListener;
  self->_cameraConfigurationListener = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_318;
  v29[3] = &unk_1E692A6F8;
  v29[4] = self;
  v13 = (PLXPCListenerOperatorComposition *)[v12 initWithOperator:self withRegistration:&unk_1F29E8C30 withBlock:v29];
  homeKitRegistrationListener = self->_homeKitRegistrationListener;
  self->_homeKitRegistrationListener = v13;

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_320;
  v28[3] = &unk_1E692A0F0;
  v28[4] = self;
  v15 = [MEMORY[0x1E4F929E8] significantBatteryChangeNotificationWithOperator:self withBlock:v28];
  sbcLevelChanged = self->_sbcLevelChanged;
  self->_sbcLevelChanged = v15;

  id v17 = objc_alloc(MEMORY[0x1E4F929E8]);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_2;
  v27[3] = &unk_1E692A0F0;
  v27[4] = self;
  v18 = (void *)[v17 initWithOperator:self forEntryKey:@"PLSleepWakeAgent_EventForward_PowerState" withBlock:v27];
  [(PLHomeKitAgent *)self setDeviceWake:v18];
  [(PLOperator *)self defaultDoubleForKey:@"RunTimeAggregatorTimerCadence"];
  double v20 = v19;
  id v21 = objc_alloc(MEMORY[0x1E4F92A80]);
  uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v20];
  v23 = [(PLOperator *)self workQueue];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_346;
  v26[3] = &unk_1E692A200;
  v26[4] = self;
  v24 = (PLTimer *)[v21 initWithFireDate:v22 withInterval:1 withTolerance:0 repeats:v23 withUserInfo:v26 withQueue:v20 withBlock:0.0];
  runTimeAggregatorTimer = self->_runTimeAggregatorTimer;
  self->_runTimeAggregatorTimer = v24;
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogHomeKit();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLHomeKitAgent_EventPoint_HomeKitEvents: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointHomeKitEvents:v6];
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogHomeKit();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "HomeConfiguration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardHomeConfiguration:v6];
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_313(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogHomeKit();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "CameraConfiguration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardCameraConfiguration:v6];
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = PLLogHomeKit();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "HomeKitRegistration payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointHomeKitRegistration:v6];
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_320(uint64_t a1)
{
  return [*(id *)(a1 + 32) writeAggregateCounters:@"sbc"];
}

void __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [a2 objectForKey:@"entry"];
    v4 = v3;
    if (v3)
    {
      v5 = [v3 objectForKeyedSubscript:@"Reason"];

      if (v5)
      {
        id v6 = [v4 objectForKeyedSubscript:@"Reason"];
        if ([v6 containsObject:@"bluetooth"])
        {
          ++*(void *)(*(void *)(a1 + 32) + 176);
          v7 = [v4 entryDate];
          [v7 timeIntervalSince1970];
          *(void *)(*(void *)(a1 + 32) + 184) = v8;

          [*(id *)(a1 + 32) writeAggregateCounters:@"btwake"];
        }
      }
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_3;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v9;
      if (qword_1EBD578F0 != -1) {
        dispatch_once(&qword_1EBD578F0, block);
      }
      if (_MergedGlobals_1_4)
      {
        uint64_t v10 = [NSString stringWithFormat:@"WARNING: No entry object associated with SleepWake entry"];
        v11 = (void *)MEMORY[0x1E4F929B8];
        id v12 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHomeKitAgent.m"];
        v13 = [v12 lastPathComponent];
        uint64_t v14 = [NSString stringWithUTF8String:"-[PLHomeKitAgent initOperatorDependancies]_block_invoke_2"];
        [v11 logMessage:v10 fromFile:v13 fromFunction:v14 fromLineNumber:450];

        v15 = PLLogCommon();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v10;
          _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_3(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_4 = result;
  return result;
}

uint64_t __42__PLHomeKitAgent_initOperatorDependancies__block_invoke_346(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 216) = 0;
  *(void *)(*(void *)(result + 32) + 224) = 0;
  return result;
}

- (int64_t)eventTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HomeKit BLE Advertisement"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"HomeKit Connection"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"HomeKit IDS Push"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"HomeKit Cloud Push"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"HomeKit IP Event"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"HomeKit Loxy Event"])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"HomeKit Bonjour"])
  {
    int64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"HomeKit Disconnection"])
  {
    int64_t v4 = 10;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)registrationTypeStringToEnum:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"HomeKit Remote Reachability Registration Event"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"HomeKit Characteristic Registration Event"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isAllowedMessageType:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  objc_msgSend(v3, "setWithObjects:", @"HMDFetchHomeDataMessage", @"RemoteEventRouterRequestMessage", @"kModifyCharacterisiticNotificationsRequestKey", @"HMDHouseholdMetricsHomeDataLogEventRequest", @"kEnableAccessoryReachabilityNotificationRequestKey", @"kDisableAccessoryReachabilityNotificationRequestKey", @"kPingInternalRequestKey", @"RemoteEventRouterUpdateMessageName", @"primaryResidentDiscovery", @"kMultipleCharacteristicReadRequestKey", @"kCharacterisiticsChangedInternalNotificationKey", @"kRemoteReachabilityChangedNotificationKey", @"kDeviceMeshUpdateKey", @"kMultipleCharacteristicWriteRequestKey", @"kDeviceMeshUpdateRequestKey", @"mesh.requestCapabilities", @"kHomeLocationUpdatedNotificationKey",
    @"kElectDeviceForIDSSessionKey",
    @"kEventTriggerUserPermissionRemoveDialogKey",
    @"mesh.currentPrimaryUpdate",
    @"kTakeSnapshotRemoteRequestKey",
    @"kCurrentHomeChangedNotificationKey",
    @"mesh.meshInformationRequest",
    @"HMDRemotePersonDataMessengerPerformCloudPullMessage",
    @"kTakeSnapshotRemoteReceivedKey",
    @"HMDMAR.RouteMediaAction",
    @"HMDUCM.rRepr",
    @"kStartRecordingSessionRequestKey",
    @"HMDRemoteCameraReachabilityDidChangeMessage",
    @"kNegotitateRemoteStreamRequestKey",
    @"kStopRemoteStreamRequestKey",
    @"HMAccessoryFetchManagedConfigurationProfilesMessage",
    @"kStreamStoppedRemoteNotificationKey",
    @"HMDCloudShareInviteMessage",
    @"HMDCloudShareRequestInviteMessage",
    @"kStartRemoteStreamRequestKey",
    @"HMDMediaProfileSetPowerRequestKey",
    @"HMDCameraAnalysisStatePublisherStateUpdateMessage",
    @"kSetAppDataRequestKey",
    @"kTakeSnapshotSendFailedNotificationKey",
    @"kRenameAccessoryRequestKey",
    @"kUpdateRoomForAccessoryRequestKey",
    @"kMediaPropertiesReadRequestKey",
    @"kPredicateEvaluatePredicateRequestKey",
    @"HMDUCM.rsr",
    @"kReconfigureRemoteStreamRequestKey",
    @"kRenameServiceRequestKey",
    @"HMAccessorySettingsUpdateRequestMessage",
    @"kRemoveAccessoryRequestKey",
    @"kHomeDataFragmentedSyncRequestKey",
    @"kSecureClientIDSMessageRequestKey",
    @"kAssistantTeamIdentifierChangeInternalNotificationKey",
    @"kRemoveTriggerRequestKey",
    @"HMDHomeQueryResidentReachabilityForAccessoriesMessageKey",
    @"kRequestForCompanionKeysSyncInternalRequestKey",
    @"HMDHomeCHIPSendReportMessage",
    @"HMAccessoryFetchCHIPPairingsMessage",
    @"kAddRoomRequestKey",
    @"kSetAssociatedServiceTypeRequestKey",
    @"HMAccessorySettingsFetchRequestMessage",
  v5 = @"HMDHomeResolveLockNotificationContextIdentifierMessage");
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)logEventPointHomeKitEvents:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kHMFPowerLogEventType"];
  int64_t v6 = [(PLHomeKitAgent *)self eventTypeStringToEnum:v5];
  if (v6 == 2)
  {
    v7 = [v4 objectForKeyedSubscript:@"kHMFPowerLogLinkTypeKey"];
    if ([v7 isEqualToString:@"HomeKitLinkTypeBluetoothLE"])
    {
      int64_t v6 = 8;
    }
    else if ([v7 isEqualToString:@"HomeKitLinkTypeIP"])
    {
      int64_t v6 = 9;
    }
    else
    {
      int64_t v6 = 2;
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __45__PLHomeKitAgent_logEventPointHomeKitEvents___block_invoke;
    v37 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v38 = v8;
    if (qword_1EBD578F8 != -1) {
      dispatch_once(&qword_1EBD578F8, &block);
    }
    if (byte_1EBD578D9)
    {
      uint64_t v9 = [NSString stringWithFormat:@"Logging for type HomeKit %@\n", v5, block, v35, v36, v37, v38];
      uint64_t v10 = (void *)MEMORY[0x1E4F929B8];
      v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLHomeKitAgent.m"];
      id v12 = [v11 lastPathComponent];
      v13 = [NSString stringWithUTF8String:"-[PLHomeKitAgent logEventPointHomeKitEvents:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:643];

      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v9;
        _os_log_debug_impl(&dword_1D2690000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  if (!self->_enablelog) {
    self->_enablelog = 1;
  }
  uint64_t v15 = *MEMORY[0x1E4F92D48];
  v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"HomeKitEvents"];
  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
  v18 = [v4 objectForKeyedSubscript:@"accessoryCategory"];
  [v17 setObject:v18 forKeyedSubscript:@"accessoryCategory"];

  uint64_t v19 = [v4 objectForKeyedSubscript:@"kHMFPowerLogDeviceIdentiferKey"];
  [v17 setObject:v19 forKeyedSubscript:@"kHMFPowerLogDeviceIdentiferKey"];

  double v20 = [NSNumber numberWithInteger:v6];
  [v17 setObject:v20 forKeyedSubscript:@"eventType"];

  if (v6 == 3)
  {
    uint64_t v21 = [v4 objectForKeyedSubscript:@"kHMFPowerLogMessageTypeKey"];
    if (v21)
    {
      uint64_t v22 = (__CFString *)v21;
      if (![(PLHomeKitAgent *)self isAllowedMessageType:v21])
      {
        v23 = PLLogHomeKit();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v42 = v22;
          _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@ is not an allowed Message Type, changing to 'Unknown'", buf, 0xCu);
        }

        uint64_t v22 = @"Unknown";
      }
      v39[0] = @"MessageType";
      v39[1] = @"Count";
      v40[0] = v22;
      v40[1] = &unk_1F29E1CF0;
      v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
      v25 = PLLogHomeKit();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v24;
        _os_log_debug_impl(&dword_1D2690000, v25, OS_LOG_TYPE_DEBUG, "Got callback for IDSPushMessageTypes: %@", buf, 0xCu);
      }

      [(PLHomeKitAgent *)self logAggregateIDSPushMessageTypes:v24];
    }
  }
  [(PLOperator *)self logEntry:v17];
  if ([v5 isEqualToString:@"HomeKit BLE Advertisement"])
  {
    v26 = +[PLOperator entryKeyForType:v15 andName:@"HomeKitBTLE"];
    v27 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v26 withRawData:v4];
    v28 = [v27 entryDate];
    [v28 timeIntervalSince1970];
    double v30 = v29;

    ++self->_numBTPushes;
    if (self->_lastapwake + 2.0 >= v30) {
      ++self->_numBTWakeAdvt;
    }
    unint64_t v31 = self->_numBTlines + 1;
    self->_numBTlines = v31;
    if (v31 <= 0xA) {
      [(PLOperator *)self logEntry:v27];
    }

    goto LABEL_32;
  }
  if ([v5 isEqualToString:@"HomeKit IP Event"])
  {
    uint64_t v32 = 144;
    goto LABEL_46;
  }
  if (![v5 isEqualToString:@"HomeKit Connection"])
  {
    if ([v5 isEqualToString:@"HomeKit Cloud Push"])
    {
      uint64_t v32 = 160;
    }
    else if ([v5 isEqualToString:@"HomeKit IDS Push"])
    {
      uint64_t v32 = 152;
    }
    else
    {
      if (![v5 isEqualToString:@"HomeKit Bonjour"]) {
        goto LABEL_47;
      }
      uint64_t v32 = 136;
    }
LABEL_46:
    ++*(Class *)((char *)&self->super.super.super.isa + v32);
    goto LABEL_47;
  }
  v33 = &OBJC_IVAR___PLHomeKitAgent__numBTConnections;
  ++self->_numConnections;
  v26 = [v4 objectForKeyedSubscript:@"kHMFPowerLogLinkTypeKey"];
  if ([v26 isEqualToString:@"HomeKitLinkTypeBluetoothLE"]) {
    goto LABEL_39;
  }
  if ([v26 isEqualToString:@"HomeKitLinkTypeIP"])
  {
    v33 = &OBJC_IVAR___PLHomeKitAgent__numIPConnections;
LABEL_39:
    ++*(Class *)((char *)&self->super.super.super.isa + *v33);
  }
LABEL_32:

LABEL_47:
}

uint64_t __45__PLHomeKitAgent_logEventPointHomeKitEvents___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD578D9 = result;
  return result;
}

- (void)logEventPointHomeKitRegistration:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"kHMFPowerLogEventType"];
  int64_t v6 = [(PLHomeKitAgent *)self registrationTypeStringToEnum:v5];

  id v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"HomeKitRegistration"];
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11 withRawData:v4];
  uint64_t v8 = [NSNumber numberWithInteger:v6];
  [v7 setObject:v8 forKeyedSubscript:@"RegistrationType"];

  uint64_t v9 = [v4 objectForKeyedSubscript:@"kHMFPowerLogClientIdentifierKey"];
  [v7 setObject:v9 forKeyedSubscript:@"BundleID"];

  uint64_t v10 = [v4 objectForKeyedSubscript:@"kHMFPowerLogEnabledKey"];

  [v7 setObject:v10 forKeyedSubscript:@"Enabled"];
  [(PLOperator *)self logEntry:v7];
}

- (void)writeAggregateCounters:(id)a3
{
  v27[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"HomeKitSummary"];
  if (self->_enablelog)
  {
    int v18 = [v4 isEqualToString:@"btwake"];
    v24 = v5;
    id v25 = v4;
    if (v18)
    {
      int v19 = 0;
      uint64_t v6 = 1;
    }
    else
    {
      int v19 = [v4 isEqualToString:@"sbc"];
      if (v19) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    v26[0] = @"numBTPushes";
    v23 = objc_msgSend(NSNumber, "numberWithInteger:", self->_numBTPushes, 88);
    v27[0] = v23;
    v26[1] = @"numConnections";
    uint64_t v22 = [NSNumber numberWithInteger:self->_numConnections];
    v27[1] = v22;
    v26[2] = @"numBTConnections";
    uint64_t v21 = [NSNumber numberWithInteger:self->_numBTConnections];
    v27[2] = v21;
    v26[3] = @"numIPConnections";
    double v20 = [NSNumber numberWithInteger:self->_numIPConnections];
    v27[3] = v20;
    v26[4] = @"numIPEvents";
    v7 = [NSNumber numberWithInteger:self->_numIPEvents];
    v27[4] = v7;
    void v26[5] = @"numIDSPushes";
    uint64_t v8 = [NSNumber numberWithInteger:self->_numIDSPushes];
    void v27[5] = v8;
    v26[6] = @"numCloudPushes";
    uint64_t v9 = [NSNumber numberWithInteger:self->_numCloudPushes];
    v27[6] = v9;
    v26[7] = @"numBonjour";
    uint64_t v10 = [NSNumber numberWithInteger:self->_numBonjour];
    v27[7] = v10;
    v26[8] = @"numBTWakeAdvt";
    id v11 = [NSNumber numberWithInteger:self->_numBTWakeAdvt];
    v27[8] = v11;
    v26[9] = @"numBTWakes";
    id v12 = [NSNumber numberWithInteger:self->_numBTWakes];
    v27[9] = v12;
    v26[10] = @"Reason";
    v13 = [NSNumber numberWithInteger:v6];
    v27[10] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:11];

    v5 = v24;
    uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v24 withRawData:v14];
    unint64_t v16 = self->_numaggregatelines + 1;
    self->_numaggregatelines = v16;
    if (v16 <= 0x1D)
    {
      if (v19)
      {
        [(PLOperator *)self logEntry:v15];
      }
      else if (v18 && *(Class *)((char *)&self->super.super.super.isa + v17) > (Class)self->_numPrevBTPushes)
      {
        [(PLOperator *)self logEntry:v15];
        self->_numPrevBTPushes = *(unint64_t *)((char *)&self->super.super.super.isa + v17);
      }
    }

    id v4 = v25;
  }
}

- (void)logEventForwardHomeConfiguration:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v9 = +[PLOperator entryKeyForType:v4 andName:@"HomeConfiguration"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9 withRawData:v5];
  v7 = [v5 objectForKeyedSubscript:@"isCurrentDeviceHH2Enabled"];

  LODWORD(v5) = [v7 isEqual:MEMORY[0x1E4F1CC38]];
  if (v5) {
    uint64_t v8 = &unk_1F29E1D08;
  }
  else {
    uint64_t v8 = &unk_1F29E1CF0;
  }
  [v6 setObject:v8 forKeyedSubscript:@"HomeHubVersion"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardCameraConfiguration:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"CameraConfiguration"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logAggregateIDSPushMessageTypes:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"IDSPushMessageTypes"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (PLXPCListenerOperatorComposition)homeKitEventsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHomeKitEventsListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)homeConfigurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHomeConfigurationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cameraConfigurationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCameraConfigurationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)homeKitRegistrationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHomeKitRegistrationListener:(id)a3
{
}

- (unint64_t)numBTPushes
{
  return self->_numBTPushes;
}

- (void)setNumBTPushes:(unint64_t)a3
{
  self->_numBTPushes = a3;
}

- (unint64_t)numConnections
{
  return self->_numConnections;
}

- (void)setNumConnections:(unint64_t)a3
{
  self->_numConnections = a3;
}

- (unint64_t)numPrevBTPushes
{
  return self->_numPrevBTPushes;
}

- (void)setNumPrevBTPushes:(unint64_t)a3
{
  self->_numPrevBTPushes = a3;
}

- (unint64_t)numPrevConnections
{
  return self->_numPrevConnections;
}

- (void)setNumPrevConnections:(unint64_t)a3
{
  self->_numPrevConnections = a3;
}

- (unint64_t)numBTConnections
{
  return self->_numBTConnections;
}

- (void)setNumBTConnections:(unint64_t)a3
{
  self->_numBTConnections = a3;
}

- (unint64_t)numIPConnections
{
  return self->_numIPConnections;
}

- (void)setNumIPConnections:(unint64_t)a3
{
  self->_numIPConnections = a3;
}

- (unint64_t)numBonjour
{
  return self->_numBonjour;
}

- (void)setNumBonjour:(unint64_t)a3
{
  self->_numBonjour = a3;
}

- (unint64_t)numIPEvents
{
  return self->_numIPEvents;
}

- (void)setNumIPEvents:(unint64_t)a3
{
  self->_numIPEvents = a3;
}

- (unint64_t)numIDSPushes
{
  return self->_numIDSPushes;
}

- (void)setNumIDSPushes:(unint64_t)a3
{
  self->_numIDSPushes = a3;
}

- (unint64_t)numCloudPushes
{
  return self->_numCloudPushes;
}

- (void)setNumCloudPushes:(unint64_t)a3
{
  self->_numCloudPushes = a3;
}

- (unint64_t)numBTWakeAdvt
{
  return self->_numBTWakeAdvt;
}

- (void)setNumBTWakeAdvt:(unint64_t)a3
{
  self->_numBTWakeAdvt = a3;
}

- (unint64_t)numBTWakes
{
  return self->_numBTWakes;
}

- (void)setNumBTWakes:(unint64_t)a3
{
  self->_numBTWakes = a3;
}

- (double)lastapwake
{
  return self->_lastapwake;
}

- (void)setLastapwake:(double)a3
{
  self->_lastapwake = a3;
}

- (BOOL)enablelog
{
  return self->_enablelog;
}

- (void)setEnablelog:(BOOL)a3
{
  self->_enablelog = a3;
}

- (PLEntryNotificationOperatorComposition)sbcLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSbcLevelChanged:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)deviceWake
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setDeviceWake:(id)a3
{
}

- (PLTimer)runTimeAggregatorTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 208, 1);
}

- (void)setRunTimeAggregatorTimer:(id)a3
{
}

- (unint64_t)numaggregatelines
{
  return self->_numaggregatelines;
}

- (void)setNumaggregatelines:(unint64_t)a3
{
  self->_numaggregatelines = a3;
}

- (unint64_t)numBTlines
{
  return self->_numBTlines;
}

- (void)setNumBTlines:(unint64_t)a3
{
  self->_numBTlines = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runTimeAggregatorTimer, 0);
  objc_storeStrong((id *)&self->_deviceWake, 0);
  objc_storeStrong((id *)&self->_sbcLevelChanged, 0);
  objc_storeStrong((id *)&self->_homeKitRegistrationListener, 0);
  objc_storeStrong((id *)&self->_cameraConfigurationListener, 0);
  objc_storeStrong((id *)&self->_homeConfigurationListener, 0);
  objc_storeStrong((id *)&self->_homeKitEventsListener, 0);
}

@end