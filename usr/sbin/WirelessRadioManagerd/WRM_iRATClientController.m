@interface WRM_iRATClientController
- (BOOL)isCallActive;
- (BOOL)isLowPowerModePeriodicWakeUpNotificationSubscribed;
- (BOOL)isStatusUpdateMsgBuffered;
- (WRM_iRATClientController)init;
- (id)getHandoverContexts;
- (id)getMobilityContextFromList:(unint64_t)a3;
- (id)getStaleContextFromList;
- (int)getBufferedLinkType;
- (int)getHandoverAlgorithmType:(unint64_t)a3;
- (int)getMyClientType;
- (int64_t)getActiveSlot;
- (unint64_t)getBufferedAppType;
- (void)addMobilityContextToList:(id)a3;
- (void)alertWRMClient:(BOOL)a3 :(id)a4 :(id)a5 :(BOOL)a6;
- (void)deactivateMobilityContexts;
- (void)dealloc;
- (void)deleteMobilityContext:(unint64_t)a3;
- (void)existingContexts;
- (void)handleBBAssertBGAppActive:(id)a3;
- (void)handleBasebandMetricsInterfaceRequest:(id)a3;
- (void)handleCommCenterBasebandOperatingChange:(id)a3;
- (void)handleDisconnection:(id)a3;
- (void)handleGetStreamingMetrics:(id)a3;
- (void)handleIWLANMetrics:(id)a3;
- (void)handleLinkPrefGetMetrics:(id)a3;
- (void)handleLinkPrefSubscribe:(id)a3;
- (void)handleLinkPrefSubscribeCM:(id)a3;
- (void)handleLinkPrefSubscribeFaceTimeCalling:(id)a3;
- (void)handleLinkPrefSubscribeIDS:(id)a3;
- (void)handleLinkPreferenceNotification:(BOOL)a3;
- (void)handleLinkPreferenceNotificationCM:(BOOL)a3;
- (void)handleLinkPreferenceNotificationFaceTimeCalling:(BOOL)a3 :(id)a4 :(id)a5;
- (void)handleLinkPreferenceNotificationIDS:(BOOL)a3;
- (void)handleLinkPreferenceNotificationInternetDataVoiceVideo:(BOOL)a3 :(id)a4 :(id)a5;
- (void)handleMessage:(id)a3;
- (void)handleMetricsReportFaceTimeCalling:(id)a3;
- (void)handleMetricsReportIDS:(id)a3;
- (void)handleSIPStalledMetrics:(id)a3;
- (void)handleStallCM:(id)a3;
- (void)handleSubscribeStatusUpdate:(id)a3;
- (void)handleSubscribeStatusUpdateCM:(id)a3;
- (void)handleSubscribeStatusUpdateFaceTimeCalling:(id)a3;
- (void)handleSubscribeStatusUpdateIDS:(id)a3;
- (void)handleSubscribeStatusUpdateTerminus:(id)a3;
- (void)postiRATNotificationToEnableDisableCellData:(unint64_t)a3 :(BOOL)a4;
- (void)purgeStaleMobilityContexts;
- (void)removeAllMobilityContextsFromList;
- (void)removeMobilityContextFromList:(id)a3;
- (void)sendPrivateNwVsMacroRecommendation:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5;
- (void)setActiveSlot:(int64_t)a3;
- (void)setBufferedAppType:(unint64_t)a3;
- (void)setBufferedLinkType:(int)a3;
- (void)setCallState:(BOOL)a3;
- (void)setHandoverAlgorithmType:(int)a3;
- (void)setLowPowerModePeriodicWakeUpNotificationSubscribed:(BOOL)a3;
- (void)setStatusUpdateMsgBuffered:(BOOL)a3;
@end

@implementation WRM_iRATClientController

- (id)getHandoverContexts
{
  return *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
}

- (int64_t)getActiveSlot
{
  return *(int64_t *)((char *)&self->mHandoverContexts + 4);
}

- (void)handleLinkPreferenceNotification:(BOOL)a3
{
  BOOL v3 = a3;
  id v25 = +[WRM_MetricsService getSingleton];
  xpc_object_t v5 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d", [*(id *)((char *)&self->mQueue + 4) count]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v26 = self;
  v6 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v7)
  {
LABEL_29:
    +[WCM_Logging logLevel:24 message:@"No need to send link preference notification."];
    if (!v3) {
      goto LABEL_31;
    }
LABEL_30:
    [(WRM_iRATClientController *)v26 purgeStaleMobilityContexts];
    [(WRM_iRATClientController *)v26 deactivateMobilityContexts];
    goto LABEL_31;
  }
  id v8 = v7;
  v9 = v5;
  char v10 = 0;
  uint64_t v11 = *(void *)v28;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(void *)v28 != v11) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (v3)
      {
        if ([v13 mobilityContextStale]) {
          continue;
        }
      }
      else if (![v13 linkPreferenceNotificationRequired])
      {
        continue;
      }
      id v14 = [v13 getConnectedLinkType];
      id v15 = [v13 getMappedApplicationType];
      id v16 = [v13 getHandoverReasonType];
      [v25 getReasonStr:v16 :string];
      xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v17, "kWRMApplicationType", (uint64_t)v15);
      xpc_dictionary_set_uint64(v17, "kWRMLinkType", v14);
      xpc_dictionary_set_uint64(v17, "kWRMSubscribeSlotInfo", [(WRM_iRATClientController *)v26 getActiveSlot]);
      xpc_dictionary_set_uint64(v17, "kWRMLinkTypeChangeReasonCode", v16);
      xpc_dictionary_set_string(v17, "kWRMLinkTypeChangeReasonString", string);
      xpc_array_append_value(v9, v17);
      v18 = "UNKNOWN_APP!!!";
      if (v15 == (id)2) {
        v18 = "CT_Th_Call";
      }
      if (v15 == (id)1) {
        v18 = "CT_VOICE";
      }
      if (!v15) {
        v18 = "CT_DATA";
      }
      if (v14 >= 3)
      {
        v19 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if (v14 == 3) {
          v19 = "WRM_IWLAN_BLUETOOTH";
        }
      }
      else
      {
        v19 = off_10020F208[(int)v14];
      }
      +[WCM_Logging logLevel:24, @"{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)", v18, v15, v14, v19 message];
      char v10 = 1;
    }
    id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v8);
  xpc_object_t v5 = v9;
  if ((v10 & 1) == 0) {
    goto LABEL_29;
  }
  xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v20, "kWRMApplicationTypeList", v5);
  [(WCM_Controller *)v26 sendMessage:1300 withArgs:v20];
  +[WCM_Logging logLevel:24 message:@"Sending Link Preference Notification."];
  size_t count = xpc_array_get_count(v5);
  if (count)
  {
    size_t v22 = count;
    for (size_t j = 0; j != v22; ++j)
    {
      xpc_object_t value = xpc_array_get_value(v5, j);
      xpc_release(value);
    }
  }
  xpc_release(v20);
  if (v3) {
    goto LABEL_30;
  }
LABEL_31:
  xpc_release(v5);
}

- (int)getMyClientType
{
  +[WCM_Logging logLevel:18, @"getMyClientType, myProcessID: %d", [(WCM_Controller *)self getProcessId] message];
  unsigned int v3 = [(WCM_Controller *)self getProcessId] - 7;
  if (v3 < 0x1C && ((0xE2FFFF3u >> v3) & 1) != 0) {
    return dword_1001E7F18[v3];
  }
  +[WCM_Logging logLevel:18 message:@"myClientType = ClientUnknown"];
  return 0;
}

- (int)getHandoverAlgorithmType:(unint64_t)a3
{
  return *(&self->super.mProcessId + 1);
}

- (void)handleLinkPreferenceNotificationIDS:(BOOL)a3
{
  xpc_object_t v4 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d", [*(id *)((char *)&self->mQueue + 4) count]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  xpc_object_t v5 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v6) {
    goto LABEL_25;
  }
  id v7 = v6;
  v23 = self;
  char v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v25;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v25 != v10) {
        objc_enumerationMutation(v5);
      }
      v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if ([v12 linkPreferenceNotificationRequired])
      {
        id v13 = [v12 getConnectedLinkType];
        id v14 = [v12 getApplicationType];
        id v9 = [v12 getSubscriptionType];
        xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v15, "kWRMApplicationType", (uint64_t)v14);
        xpc_dictionary_set_uint64(v15, "kWRMLinkType", v13);
        xpc_array_append_value(v4, v15);
        id v16 = "UNKNOWN_APP!!!";
        if (v14 == (id)2) {
          id v16 = "CT_Th_Call";
        }
        if (v14 == (id)1) {
          id v16 = "CT_VOICE";
        }
        if (!v14) {
          id v16 = "CT_DATA";
        }
        if (v13 >= 3)
        {
          xpc_object_t v17 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
          if (v13 == 3) {
            xpc_object_t v17 = "WRM_IWLAN_BLUETOOTH";
          }
        }
        else
        {
          xpc_object_t v17 = off_10020F208[(int)v13];
        }
        +[WCM_Logging logLevel:27, @"{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)", v16, v14, v13, v17 message];
        [v12 setLinkPreferenceNotificationRequired:0];
        char v8 = 1;
      }
    }
    id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v7);
  if (v8)
  {
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v18, "kWRMApplicationTypeList", v4);
    xpc_dictionary_set_uint64(v18, "kWRMSubscriptionType", (uint64_t)v9);
    [(WCM_Controller *)v23 sendMessage:1301 withArgs:v18];
    +[WCM_Logging logLevel:27 message:@"Sending Link Preference Notification."];
    size_t count = xpc_array_get_count(v4);
    if (count)
    {
      size_t v20 = count;
      for (size_t j = 0; j != v20; ++j)
      {
        xpc_object_t value = xpc_array_get_value(v4, j);
        xpc_release(value);
      }
    }
    xpc_release(v18);
  }
  else
  {
LABEL_25:
    +[WCM_Logging logLevel:27 message:@"No need to send link preference notification."];
  }
  xpc_release(v4);
}

- (void)handleLinkPreferenceNotificationInternetDataVoiceVideo:(BOOL)a3 :(id)a4 :(id)a5
{
  BOOL v7 = a3;
  uint64_t v9 = [(WRM_iRATClientController *)self getMyClientType];
  +[WCM_Logging logLevel:24, @"handleLinkPreferenceNotificationInternetDataVoiceVideo: ClientType: %d, Subscription type: %d", v9, v7 message];
  if (v9 == 14 || v9 == 7)
  {
    [(WRM_iRATClientController *)self handleLinkPreferenceNotificationFaceTimeCalling:v7 :a4 :a5];
  }
  else
  {
    [(WRM_iRATClientController *)self handleLinkPreferenceNotificationIDS:v7];
  }
}

- (WRM_iRATClientController)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientController;
  v2 = [(WCM_Controller *)&v4 init];
  if (v2)
  {
    *(void *)(v2 + 52) = dispatch_queue_create("com.apple.WirelessRadioManager.iRATClient", 0);
    v2[44] = 1;
    *((_DWORD *)v2 + 5) = 0;
    *((_DWORD *)v2 + 6) = 0;
    v2[28] = 0;
    *((_DWORD *)v2 + 8) = 2;
    *(void *)(v2 + 36) = 1;
    *(void *)(v2 + 68) = 0;
    *(void *)(v2 + 60) = objc_alloc_init((Class)NSMutableArray);
    v2[76] = 0;
  }
  return (WRM_iRATClientController *)v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:24 message:@"WRM_iRATClientController dealloc"];
  unsigned int v3 = *(NSObject **)(&self->mActive + 4);
  if (v3) {
    dispatch_release(v3);
  }
  *(void *)(&self->mActive + 4) = 0;
  if (*(OS_dispatch_queue **)((char *)&self->mQueue + 4))
  {
    [(WRM_iRATClientController *)self removeAllMobilityContextsFromList];

    *(OS_dispatch_queue **)((char *)&self->mQueue + 4) = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientController;
  [(WCM_Controller *)&v4 dealloc];
}

- (void)handleMessage:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:24, @"Received message-id: %lld from iRAT Client, params are %@", uint64, a3 message];
  if (uint64 <= 599)
  {
    switch(uint64)
    {
      case 400:
        [(WRM_iRATClientController *)self handleLinkPrefSubscribe:a3];
        break;
      case 401:
        [(WRM_iRATClientController *)self handleSubscribeStatusUpdate:a3];
        break;
      case 402:
        [(WRM_iRATClientController *)self handleLinkPrefSubscribeIDS:a3];
        break;
      case 403:
        [(WRM_iRATClientController *)self handleSubscribeStatusUpdateIDS:a3];
        break;
      case 404:
        [(WRM_iRATClientController *)self handleLinkPrefSubscribeCM:a3];
        break;
      case 405:
        [(WRM_iRATClientController *)self handleSubscribeStatusUpdateCM:a3];
        break;
      case 406:
        [(WRM_iRATClientController *)self handleLinkPrefSubscribeFaceTimeCalling:a3];
        break;
      case 407:
        [(WRM_iRATClientController *)self handleSubscribeStatusUpdateFaceTimeCalling:a3];
        break;
      case 408:
      case 409:
      case 413:
      case 414:
      case 421:
      case 422:
        goto LABEL_24;
      case 410:
        [(WRM_iRATClientController *)self handleCommCenterBasebandOperatingChange:a3];
        break;
      case 411:
        [(WRM_iRATClientController *)self handleBBAssertBGAppActive:a3];
        break;
      case 412:
      case 418:
        [(WRM_iRATClientController *)self handleStallCM:a3];
        break;
      case 415:
        [(WRM_iRATClientController *)self handleLinkPrefGetMetrics:a3];
        break;
      case 416:
        [(WRM_iRATClientController *)self handleIWLANMetrics:a3];
        break;
      case 417:
        [(WRM_iRATClientController *)self handleGetStreamingMetrics:a3];
        break;
      case 419:
        id v6 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
        [v6 handleDataPlanUpdate:a3];
        break;
      case 420:
        [(WRM_iRATClientController *)self handleSIPStalledMetrics:a3];
        break;
      case 423:
        +[WCM_Logging logLevel:28 message:@"MLPredictedThroughput: WRMMLPredictedThroughput: handleMessage"];
        id v7 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
        [v7 handleGetMLPredictedThroughput:a3];
        break;
      default:
        if ((unint64_t)(uint64 - 201) >= 2) {
          goto LABEL_24;
        }
        [(WRM_iRATClientController *)self handleMetricsReportFaceTimeCalling:a3];
        break;
    }
    return;
  }
  if (uint64 <= 2099)
  {
    if ((unint64_t)(uint64 - 2000) >= 3)
    {
      if (uint64 == 600)
      {
        [(WRM_iRATClientController *)self handleMetricsReportIDS:a3];
        return;
      }
LABEL_24:
      +[WCM_Logging logLevel:24 message:@"Received unsupported iRAT client message"];
      return;
    }
    goto LABEL_21;
  }
  if (uint64 == 2100)
  {
LABEL_21:
    [(WRM_iRATClientController *)self handleBasebandMetricsInterfaceRequest:a3];
    return;
  }
  if (uint64 != 2500) {
    goto LABEL_24;
  }

  [(WRM_iRATClientController *)self setLowPowerModePeriodicWakeUpNotificationSubscribed:1];
}

- (void)handleDisconnection:(id)a3
{
  uint64_t v5 = [(WRM_iRATClientController *)self getMyClientType];
  uint64_t v6 = [(WCM_Controller *)self getProcessId];
  +[WCM_Logging logLevel:18, @"handleDisconnection from client %d, pid %d", v5, v6 message];
  id v7 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  [v7 handleDisconnection:a3 pid:v6];
}

- (void)handleLinkPrefSubscribe:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  xpc_object_t v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
  if (v6)
  {
    id v7 = v6;
    id v19 = a3;
    size_t count = xpc_array_get_count(v6);
    if (count)
    {
      size_t v9 = count;
      size_t v10 = 0;
      if (v4 == 22) {
        uint64_t v11 = "ClientCoreMediaStreaming";
      }
      else {
        uint64_t v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      }
      uint64_t v12 = (int)v4 - 1;
      do
      {
        xpc_object_t v13 = xpc_array_get_value(v7, v10);
        uint64_t uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
        uint64_t v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
        uint64_t v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
        xpc_object_t v17 = (char *)v11;
        if (v12 <= 0x14) {
          xpc_object_t v17 = off_10020F160[v12];
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, @"%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)", "-[WRM_iRATClientController handleLinkPrefSubscribe:]", v10++, uint64, v15, v16, v4, v17);
      }
      while (v9 != v10);
    }
    id v18 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v18 updateControllerState:v19];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid Subscribe message from CT client"];
  }
}

- (void)handleLinkPrefSubscribeIDS:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (v6 = value, (xpc_object_t v7 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0))
  {
    char v8 = v7;
    id v21 = a3;
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "kWRMSubscriptionType");
    +[WCM_Logging logLevel:27, @"handleLinkPrefSubscribeIDS: Subscription Type: %llu", uint64 message];
    size_t count = xpc_array_get_count(v8);
    if (count)
    {
      size_t v10 = count;
      size_t v11 = 0;
      if (v4 == 22) {
        uint64_t v12 = "ClientCoreMediaStreaming";
      }
      else {
        uint64_t v12 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      }
      uint64_t v13 = (int)v4 - 1;
      do
      {
        xpc_object_t v14 = xpc_array_get_value(v8, v11);
        uint64_t v15 = xpc_dictionary_get_uint64(v14, "kWRMApplicationType");
        uint64_t v16 = xpc_dictionary_get_uint64(v14, "kWRMDesiredLinkQoS");
        uint64_t v17 = xpc_dictionary_get_uint64(v14, "kWRMDesiredBandwidth");
        id v18 = (char *)v12;
        if (v13 <= 0x14) {
          id v18 = off_10020F160[v13];
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 27, @"%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)", "-[WRM_iRATClientController handleLinkPrefSubscribeIDS:]", v11++, v15, v16, v17, v4, v18);
      }
      while (v10 != v11);
    }
    if (uint64 == 1) {
      id v19 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
    }
    else {
      id v19 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
    }
    [v19 updateControllerState:v21];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid Subscribe message from IDS client"];
  }
}

- (void)handleLinkPrefGetMetrics:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v4 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
    [v4 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid Subscribe message from SIRI client"];
  }
}

- (void)handleLinkPrefSubscribeFaceTimeCalling:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (xpc_object_t v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    xpc_object_t v7 = v6;
    id v19 = a3;
    size_t count = xpc_array_get_count(v6);
    if (count)
    {
      size_t v9 = count;
      size_t v10 = 0;
      if (v4 == 22) {
        size_t v11 = "ClientCoreMediaStreaming";
      }
      else {
        size_t v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
      }
      uint64_t v12 = (int)v4 - 1;
      do
      {
        xpc_object_t v13 = xpc_array_get_value(v7, v10);
        uint64_t uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
        uint64_t v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
        uint64_t v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
        uint64_t v17 = (char *)v11;
        if (v12 <= 0x14) {
          uint64_t v17 = off_10020F160[v12];
        }
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, @"%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)", "-[WRM_iRATClientController handleLinkPrefSubscribeFaceTimeCalling:]", v10++, uint64, v15, v16, v4, v17);
      }
      while (v9 != v10);
    }
    id v18 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
    [v18 updateControllerState:v19];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid Subscribe message from FaceTime Calling client"];
  }
}

- (void)handleMetricsReportIDS:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  if (xpc_dictionary_get_uint64(a3, "kWRMSubscriptionType") == 1) {
    id v4 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
  }
  else {
    id v4 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
  }

  [v4 updateControllerState:a3];
}

- (void)handleMetricsReportFaceTimeCalling:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  id v4 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];

  [v4 updateControllerState:a3];
}

- (void)handleGetStreamingMetrics:(id)a3
{
  id v4 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];

  [v4 updateControllerState:a3];
}

- (void)handleLinkPrefSubscribeCM:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    xpc_object_t v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList");
    if (v6)
    {
      xpc_object_t v7 = v6;
      id v20 = a3;
      size_t count = xpc_array_get_count(v6);
      if (count)
      {
        size_t v9 = count;
        size_t v10 = 0;
        if (v4 == 22) {
          size_t v11 = "ClientCoreMediaStreaming";
        }
        else {
          size_t v11 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
        }
        uint64_t v12 = (int)v4 - 1;
        do
        {
          xpc_object_t v13 = xpc_array_get_value(v7, v10);
          uint64_t uint64 = xpc_dictionary_get_uint64(v13, "kWRMApplicationType");
          uint64_t v15 = xpc_dictionary_get_uint64(v13, "kWRMDesiredLinkQoS");
          uint64_t v16 = xpc_dictionary_get_uint64(v13, "kWRMDesiredBandwidth");
          uint64_t v17 = (char *)v11;
          if (v12 <= 0x14) {
            uint64_t v17 = off_10020F160[v12];
          }
          +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 18, @"%s: Record#=%d, Application Type=%llu, LinkQoS=%llu, Bandwidth=%llu Client Type=%d(%s)", "-[WRM_iRATClientController handleLinkPrefSubscribeCM:]", v10++, uint64, v15, v16, v4, v17);
        }
        while (v9 != v10);
      }
      id v18 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
      [v18 updateControllerState:v20];
      return;
    }
    CFStringRef v19 = @"Discarding invalid Subscribe message from CM client";
  }
  else
  {
    CFStringRef v19 = @"Discarding invalid Subscribe message from CM  client";
  }

  +[WCM_Logging logLevel:16 message:v19];
}

- (void)handleSubscribeStatusUpdateTerminus:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    uint64_t v5 = value;
    uint64_t uint64 = xpc_dictionary_get_uint64(value, "kWRMProximityLinkRecommendationType");
    +[WCM_Logging logLevel:18, @"Application link preference %d active %d", uint64, xpc_dictionary_get_BOOL(v5, "kWRMProximityAppLinkPreferenceActive") message];
    id v7 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
    [v7 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from Terminus client"];
  }
}

- (void)handleSubscribeStatusUpdateIDS:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (uint64_t v5 = value, (v6 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0))
  {
    id v7 = v6;
    uint64_t uint64 = xpc_dictionary_get_uint64(v5, "kWRMSubscriptionType");
    size_t count = xpc_array_get_count(v7);
    if (count)
    {
      size_t v9 = count;
      for (size_t i = 0; i != v9; ++i)
      {
        xpc_object_t v11 = xpc_array_get_value(v7, i);
        uint64_t v12 = xpc_dictionary_get_uint64(v11, "kWRMApplicationType");
        +[WCM_Logging logLevel:18, @"Application Type=%llu, LinkType=%llu ", v12, xpc_dictionary_get_uint64(v11, "kWRMLinkType") message];
      }
    }
    if (uint64 == 1) {
      id v13 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
    }
    else {
      id v13 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
    }
    [v13 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from IDS client"];
  }
}

- (void)handleStallCM:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v4 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
    [v4 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from CM client"];
  }
}

- (void)handleSubscribeStatusUpdateCM:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (xpc_object_t v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    xpc_object_t v6 = v5;
    size_t count = xpc_array_get_count(v5);
    if (count)
    {
      size_t v8 = count;
      for (size_t i = 0; i != v8; ++i)
      {
        xpc_object_t v10 = xpc_array_get_value(v6, i);
        uint64_t uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:18, @"Application Type=%llu, LinkType=%llu ", uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType") message];
      }
    }
    id v12 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
    [v12 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from CM client"];
  }
}

- (void)handleSubscribeStatusUpdateFaceTimeCalling:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (xpc_object_t v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    xpc_object_t v6 = v5;
    size_t count = xpc_array_get_count(v5);
    if (count)
    {
      size_t v8 = count;
      for (size_t i = 0; i != v8; ++i)
      {
        xpc_object_t v10 = xpc_array_get_value(v6, i);
        uint64_t uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:29, @"Application Type=%llu, LinkType=%llu ", uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType") message];
      }
    }
    id v12 = +[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton];
    [v12 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from FaceTimeCalling client"];
  }
}

- (void)handleSubscribeStatusUpdate:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value && (xpc_object_t v5 = xpc_dictionary_get_value(value, "kWRMApplicationTypeList")) != 0)
  {
    xpc_object_t v6 = v5;
    size_t count = xpc_array_get_count(v5);
    if (count)
    {
      size_t v8 = count;
      for (size_t i = 0; i != v8; ++i)
      {
        xpc_object_t v10 = xpc_array_get_value(v6, i);
        uint64_t uint64 = xpc_dictionary_get_uint64(v10, "kWRMApplicationType");
        +[WCM_Logging logLevel:18, @"Application Type=%llu, LinkType=%llu ", uint64, xpc_dictionary_get_uint64(v10, "kWRMLinkType") message];
      }
    }
    id v12 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v12 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid status update message from CommCenter client"];
  }
}

- (void)handleSIPStalledMetrics:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v5 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16, @"Discarding invalid WRMIWLANWiFiCallTunnelStalled message from client : %d", v4 message];
  }
}

- (void)handleIWLANMetrics:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v5 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16, @"Discarding invalid WRMiWLANMetricsReport message from client : %d", v4 message];
  }
}

- (void)handleCommCenterBasebandOperatingChange:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];
    [v5 updateProximityState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16, @"Discarding invalid CommCenterBasebandOperatingChange message from client : %d", v4 message];
  }
}

- (void)handleBBAssertBGAppActive:(id)a3
{
  uint64_t v4 = [(WRM_iRATClientController *)self getMyClientType];
  xpc_dictionary_set_uint64(a3, "kClientType", v4);
  +[WCM_Logging logLevel:18, @"handleBBAssertBGAppActive message from client : %d", v4 message];
  id v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  [v5 updateControllerState:a3];
}

- (void)handleBasebandMetricsInterfaceRequest:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v4 = +[WRM_BWEvalManager WRM_BWEvalManagerSingleton];
    [v4 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid message from WirelessCoexManager client in iRATClientController::handleBasebandMetricsInterfaceRequest because message is nil"];
  }
}

- (BOOL)isCallActive
{
  return BYTE4(self->mApplicationType);
}

- (void)setCallState:(BOOL)a3
{
  BYTE4(self->mApplicationType) = a3;
}

- (int)getBufferedLinkType
{
  return *(_DWORD *)&self->mBufferStatusUpdateMsg;
}

- (void)setBufferedLinkType:(int)a3
{
  *(_DWORD *)&self->mBufferStatusUpdateMsg = a3;
}

- (BOOL)isStatusUpdateMsgBuffered
{
  return self->mRxClientType;
}

- (void)setStatusUpdateMsgBuffered:(BOOL)a3
{
  LOBYTE(self->mRxClientType) = a3;
}

- (unint64_t)getBufferedAppType
{
  return *(void *)&self->mBufferedLinkType;
}

- (void)setBufferedAppType:(unint64_t)a3
{
  *(void *)&self->mBufferedLinkType = a3;
}

- (void)setActiveSlot:(int64_t)a3
{
  *(NSMutableArray **)((char *)&self->mHandoverContexts + 4) = (NSMutableArray *)a3;
}

- (void)setHandoverAlgorithmType:(int)a3
{
  +[WCM_Logging logLevel:18, @"setHandoverAlgorithmType= %u", *(void *)&a3 message];
  *(&self->super.mProcessId + 1) = a3;
}

- (void)addMobilityContextToList:(id)a3
{
  [*(id *)((char *)&self->mQueue + 4) addObject:a3];

  [(WRM_iRATClientController *)self existingContexts];
}

- (void)removeMobilityContextFromList:(id)a3
{
  [*(id *)((char *)&self->mQueue + 4) removeObject:a3];

  [(WRM_iRATClientController *)self existingContexts];
}

- (void)removeAllMobilityContextsFromList
{
  [*(id *)((char *)&self->mQueue + 4) removeAllObjects];

  +[WCM_Logging logLevel:18 message:@"Released all mobility contests from iRAT Client"];
}

- (void)deleteMobilityContext:(unint64_t)a3
{
  id v4 = [(WRM_iRATClientController *)self getMobilityContextFromList:a3];
  if (v4)
  {
    id v5 = v4;
    [(WRM_iRATClientController *)self removeMobilityContextFromList:v4];
  }
}

- (id)getMobilityContextFromList:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(v4);
    }
    size_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 getApplicationType] == (id)a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)getStaleContextFromList
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v10;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v10 != v5) {
      objc_enumerationMutation(v2);
    }
    uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * v6);
    if ([v7 mobilityContextStale]) {
      return v7;
    }
    if (v4 == (id)++v6)
    {
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)purgeStaleMobilityContexts
{
  id v3 = [(WRM_iRATClientController *)self getStaleContextFromList];
  if (v3)
  {
    id v4 = v3;
    do
    {
      [(WRM_iRATClientController *)self removeMobilityContextFromList:v4];
      id v4 = [(WRM_iRATClientController *)self getStaleContextFromList];
    }
    while (v4);
  }
}

- (void)deactivateMobilityContexts
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      for (size_t i = 0; i != v4; size_t i = (char *)i + 1)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * i) activateMobilityContext:0];
      }
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)existingContexts
{
  uint64_t v3 = [(WRM_iRATClientController *)self getMyClientType];
  if ((v3 - 1) >= 0x15)
  {
    if (v3 == 22) {
      id v4 = "ClientCoreMediaStreaming";
    }
    else {
      id v4 = "UNKNOWN_WRM_CLIENT_TYPE!!!";
    }
  }
  else
  {
    id v4 = off_10020F160[(int)v3 - 1];
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"Client Type: %d(%s), Number of active sessions: %lu", v3, v4, [*(id *)((char *)&self->mQueue + 4) count]);
}

- (void)sendPrivateNwVsMacroRecommendation:(int64_t)a3 currentSlotQuality:(int)a4 anyCallState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "kWRMiWLANMetricsReport_SlotId", a3);
  xpc_dictionary_set_uint64(v9, "kWRMCbrsCurrentDataSlotQuality", v6);
  xpc_dictionary_set_uint64(v9, "kWRMAnyCallState", v5);
  [(WCM_Controller *)self sendMessage:1350 withArgs:v9];
  +[WCM_Logging logLevel:24, @"send PrivateNwVsMacroRecommendation slot=%ld, quality=%u, state=%u", a3, v6, v5 message];

  xpc_release(v9);
}

- (void)handleLinkPreferenceNotificationCM:(BOOL)a3
{
  xpc_object_t v4 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 24, @"handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d", [*(id *)((char *)&self->mQueue + 4) count]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obsize_t j = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v5 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v5) {
    goto LABEL_25;
  }
  id v6 = v5;
  long long v27 = self;
  char v7 = 0;
  uint64_t v8 = *(void *)v32;
  uint64_t v28 = *(void *)v32;
  do
  {
    xpc_object_t v9 = 0;
    id v29 = v6;
    do
    {
      if (*(void *)v32 != v8) {
        objc_enumerationMutation(obj);
      }
      long long v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v9);
      if ([v10 linkPreferenceNotificationRequired])
      {
        id v11 = [v10 getConnectedLinkType];
        id v12 = [v10 getApplicationType];
        id v13 = [v10 getMinEvalBW];
        id v14 = [v10 getMaxEvalBW];
        uint64_t v15 = v4;
        id v16 = [v10 getMinMovEvalBW];
        id v17 = [v10 getMaxMovEvalBW];
        xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v18, "kWRMApplicationType", (uint64_t)v12);
        xpc_dictionary_set_uint64(v18, "kWRMLinkType", v11);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkBandwidthEstimateMin", (uint64_t)v13);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkBandwidthEstimateMax", (uint64_t)v14);
        uint64_t v19 = (uint64_t)v16;
        xpc_object_t v4 = v15;
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkMovBandwidthEstimateMin", v19);
        xpc_dictionary_set_uint64(v18, "kWRMCurrentLinkMovBandwidthEstimateMax", (uint64_t)v17);
        xpc_dictionary_set_uint64(v18, "kWRMCellLoad", (int)[+[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton") getDataSlotLoad]);
        xpc_array_append_value(v15, v18);
        id v20 = "UNKNOWN_APP!!!";
        if (v12 == (id)2) {
          id v20 = "CT_Th_Call";
        }
        if (v12 == (id)1) {
          id v20 = "CT_VOICE";
        }
        if (!v12) {
          id v20 = "CT_DATA";
        }
        if (v11 >= 3)
        {
          id v21 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
          if (v11 == 3) {
            id v21 = "WRM_IWLAN_BLUETOOTH";
          }
        }
        else
        {
          id v21 = off_10020F208[(int)v11];
        }
        +[WCM_Logging logLevel:24, @"{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)", v20, v12, v11, v21 message];
        [v10 setLinkPreferenceNotificationRequired:0];
        char v7 = 1;
        uint64_t v8 = v28;
        id v6 = v29;
      }
      xpc_object_t v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    id v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  }
  while (v6);
  if (v7)
  {
    xpc_object_t v22 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v22, "kWRMApplicationTypeList", v4);
    [(WCM_Controller *)v27 sendMessage:1302 withArgs:v22];
    +[WCM_Logging logLevel:24 message:@"Sending Link Preference Notification."];
    size_t count = xpc_array_get_count(v4);
    if (count)
    {
      size_t v24 = count;
      for (size_t i = 0; i != v24; ++i)
      {
        xpc_object_t value = xpc_array_get_value(v4, i);
        xpc_release(value);
      }
    }
    xpc_release(v22);
  }
  else
  {
LABEL_25:
    +[WCM_Logging logLevel:24 message:@"No need to send link preference notification."];
  }
  xpc_release(v4);
}

- (void)handleLinkPreferenceNotificationFaceTimeCalling:(BOOL)a3 :(id)a4 :(id)a5
{
  BOOL v7 = a3;
  id v36 = +[WRM_MetricsService getSingleton];
  xpc_object_t v9 = xpc_array_create(0, 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 29, @"handleLinkPreferenceNotification: Total number of contexts in iRAT client: %d", [*(id *)((char *)&self->mQueue + 4) count]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v10 = *(OS_dispatch_queue **)((char *)&self->mQueue + 4);
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v11)
  {
LABEL_28:
    +[WCM_Logging logLevel:29 message:@"No need to send link preference notification."];
    if (!v7) {
      goto LABEL_30;
    }
LABEL_29:
    [(WRM_iRATClientController *)self purgeStaleMobilityContexts];
    [(WRM_iRATClientController *)self deactivateMobilityContexts];
    goto LABEL_30;
  }
  id v12 = v11;
  id v33 = a4;
  id v34 = a5;
  id v13 = v9;
  v35 = self;
  char v14 = 0;
  uint64_t v15 = *(void *)v38;
  do
  {
    for (size_t i = 0; i != v12; size_t i = (char *)i + 1)
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(v10);
      }
      id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      if (v7)
      {
        if ([v17 mobilityContextStale]) {
          continue;
        }
      }
      else if (![v17 linkPreferenceNotificationRequired])
      {
        continue;
      }
      id v18 = [v17 getConnectedLinkType];
      id v19 = [v17 getApplicationType];
      id v20 = [v17 getHandoverReasonType];
      [v36 getReasonStr:v20 :string];
      xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v21, "kWRMApplicationType", (uint64_t)v19);
      xpc_dictionary_set_uint64(v21, "kWRMLinkType", v18);
      xpc_dictionary_set_uint64(v21, "kWRMLinkTypeChangeReasonCode", v20);
      xpc_dictionary_set_string(v21, "kWRMLinkTypeChangeReasonString", string);
      xpc_array_append_value(v13, v21);
      xpc_object_t v22 = "UNKNOWN_APP!!!";
      if (v19 == (id)2) {
        xpc_object_t v22 = "CT_Th_Call";
      }
      if (v19 == (id)1) {
        xpc_object_t v22 = "CT_VOICE";
      }
      if (!v19) {
        xpc_object_t v22 = "CT_DATA";
      }
      if (v18 >= 3)
      {
        v23 = "UNKNOWN_WRM_IWLAN_LINK_TYPE!!!";
        if (v18 == 3) {
          v23 = "WRM_IWLAN_BLUETOOTH";
        }
      }
      else
      {
        v23 = off_10020F208[(int)v18];
      }
      +[WCM_Logging logLevel:29, @"{%s}Link Preference Notification required for application type =%lld, preferred = %d(%s)", v22, v19, v18, v23 message];
      char v14 = 1;
    }
    id v12 = [v10 countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v12);
  self = v35;
  xpc_object_t v9 = v13;
  if ((v14 & 1) == 0) {
    goto LABEL_28;
  }
  xpc_object_t v24 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v24, "kWRMApplicationTypeList", v9);
  unsigned int v25 = [v33 getServingCellType];
  unsigned int v26 = v25;
  switch(v25)
  {
    case 9u:
      [v33 getNrRSRP];
LABEL_33:
      xpc_dictionary_set_int64(v24, "kcSigStrength", (uint64_t)v27);
      break;
    case 2u:
      [v33 getServingCellRSCP];
      goto LABEL_33;
    case 1u:
      [v33 getServingCellRSRP];
      goto LABEL_33;
  }
  xpc_dictionary_set_int64(v24, "kcSignalBar", (int64_t)[v33 getCurrentSignalBars]);
  xpc_dictionary_set_int64(v24, "kcServingCellType", v26);
  if ([v34 isWiFiPrimaryInterface])
  {
    xpc_dictionary_set_int64(v24, "kwRSSI", (int64_t)[v34 getRSSI]);
    xpc_dictionary_set_int64(v24, "kwSNR", (int64_t)[v34 getSNR]);
    [v34 getTxPer];
    xpc_dictionary_set_int64(v24, "kwPER", (uint64_t)(v28 * 100.0));
    xpc_dictionary_set_int64(v24, "kwCCA", (int64_t)[v34 getCCA]);
  }
  [(WCM_Controller *)v35 sendMessage:1303 withArgs:v24];
  +[WCM_Logging logLevel:29 message:@"Sending Link Preference Notification."];
  size_t count = xpc_array_get_count(v9);
  if (count)
  {
    size_t v30 = count;
    for (size_t j = 0; j != v30; ++j)
    {
      xpc_object_t value = xpc_array_get_value(v9, j);
      xpc_release(value);
    }
  }
  xpc_release(v24);
  if (v7) {
    goto LABEL_29;
  }
LABEL_30:
  xpc_release(v9);
}

- (void)alertWRMClient:(BOOL)a3 :(id)a4 :(id)a5 :(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v9 = a3;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  unsigned int v12 = [a4 getServingCellType];
  id v13 = [a4 getCurrentSignalBars];
  switch(v12)
  {
    case 9u:
      [a4 getNrRSRP];
      break;
    case 2u:
      [a4 getServingCellRSCP];
      break;
    case 1u:
      [a4 getServingCellRSRP];
      break;
    default:
      goto LABEL_8;
  }
  xpc_dictionary_set_int64(v11, "kcSigStrength", (uint64_t)v14);
LABEL_8:
  xpc_dictionary_set_int64(v11, "kWRMLinkType", v6);
  xpc_dictionary_set_int64(v11, "kcSignalBar", (int64_t)v13);
  xpc_dictionary_set_int64(v11, "kcServingCellType", v12);
  if (v6)
  {
    xpc_dictionary_set_int64(v11, "kwRSSI", (int64_t)[a5 getRSSI]);
    xpc_dictionary_set_int64(v11, "kwSNR", (int64_t)[a5 getSNR]);
    [a5 getTxPer];
    xpc_dictionary_set_int64(v11, "kwPER", (uint64_t)(v15 * 100.0));
    xpc_dictionary_set_int64(v11, "kwCCA", (int64_t)[a5 getCCA]);
  }
  if (v9) {
    uint64_t v16 = 1306;
  }
  else {
    uint64_t v16 = 1307;
  }
  [(WCM_Controller *)self sendMessage:v16 withArgs:v11];
  +[WCM_Logging logLevel:24, @"Sending FaceTimeAlert: %d", v9 message];

  xpc_release(v11);
}

- (void)postiRATNotificationToEnableDisableCellData:(unint64_t)a3 :(BOOL)a4
{
  BOOL v4 = a4;
  xpc_object_t v7 = xpc_array_create(0, 0);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "kWRMApplicationType", a3);
  uint64_t v9 = !v4;
  xpc_dictionary_set_uint64(v8, "kWRMLinkType", v9);
  xpc_array_append_value(v7, v8);
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v10, "kWRMApplicationTypeList", v7);
  [(WCM_Controller *)self sendMessage:1300 withArgs:v10];
  +[WCM_Logging logLevel:24, @"Sending Link Preference notification, triggered by networking agent, %d", v9 message];
  size_t count = xpc_array_get_count(v7);
  if (count)
  {
    size_t v12 = count;
    for (size_t i = 0; i != v12; ++i)
    {
      xpc_object_t value = xpc_array_get_value(v7, i);
      xpc_release(value);
    }
  }
  xpc_release(v10);

  xpc_release(v7);
}

- (BOOL)isLowPowerModePeriodicWakeUpNotificationSubscribed
{
  uint64_t v6 = 0;
  xpc_object_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v2 = *(NSObject **)(&self->mActive + 4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100082AF4;
  v5[3] = &unk_10020DB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(v2, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setLowPowerModePeriodicWakeUpNotificationSubscribed:(BOOL)a3
{
  char v3 = *(NSObject **)(&self->mActive + 4);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082B90;
  v4[3] = &unk_10020DE10;
  BOOL v5 = a3;
  v4[4] = self;
  dispatch_async(v3, v4);
}

@end