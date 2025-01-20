@interface WRM_iRATClientControllerTerminus
- (OS_dispatch_queue)queue;
- (WRM_TerminusContext)mTerminusContext;
- (WRM_iRATClientControllerTerminus)init;
- (int)rxClientType;
- (void)dealloc;
- (void)handleLinkPrefSubscribeTerminus:(id)a3;
- (void)handleLinkPreferenceNotificationTerminus;
- (void)handleMessage:(id)a3;
- (void)handleSubscribeStatusUpdateTerminus:(id)a3;
- (void)setMTerminusContext:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRxClientType:(int)a3;
@end

@implementation WRM_iRATClientControllerTerminus

- (WRM_iRATClientControllerTerminus)init
{
  v4.receiver = self;
  v4.super_class = (Class)WRM_iRATClientControllerTerminus;
  v2 = [(WRM_iRATClientController *)&v4 init];
  if (v2)
  {
    [(WRM_iRATClientControllerTerminus *)v2 setQueue:dispatch_queue_create("com.apple.WirelessRadioManager.iRATClientTerminus", 0)];
    [(WRM_iRATClientControllerTerminus *)v2 setMTerminusContext:objc_alloc_init(WRM_TerminusContext)];
    [(WRM_iRATClientControllerTerminus *)v2 setRxClientType:0];
  }
  return v2;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:24 message:@"WRM_iRATClientControllerTerminus: dealloc!!!"];
  if ([(WRM_iRATClientControllerTerminus *)self queue]) {
    dispatch_release((dispatch_object_t)[(WRM_iRATClientControllerTerminus *)self queue]);
  }
  [(WRM_iRATClientControllerTerminus *)self setQueue:0];
  if ([(WRM_iRATClientControllerTerminus *)self mTerminusContext])
  {

    [(WRM_iRATClientControllerTerminus *)self setMTerminusContext:0];
  }
  [(WRM_iRATClientControllerTerminus *)self setRxClientType:0];
  v3.receiver = self;
  v3.super_class = (Class)WRM_iRATClientControllerTerminus;
  [(WRM_iRATClientController *)&v3 dealloc];
}

- (void)handleMessage:(id)a3
{
  int64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64 > 420)
  {
    if (uint64 == 421)
    {
      id v6 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
      [v6 updateControllerState:a3];
    }
    else
    {
      if (uint64 != 2500)
      {
LABEL_12:
        +[WCM_Logging logLevel:24 message:@"Received unsupported iRAT client message"];
        return;
      }
      [(WRM_iRATClientController *)self setLowPowerModePeriodicWakeUpNotificationSubscribed:1];
    }
  }
  else
  {
    if (uint64 != 413)
    {
      if (uint64 == 414)
      {
        [(WRM_iRATClientControllerTerminus *)self handleSubscribeStatusUpdateTerminus:a3];
        return;
      }
      goto LABEL_12;
    }
    [(WRM_iRATClientControllerTerminus *)self handleLinkPrefSubscribeTerminus:a3];
  }
}

- (void)handleLinkPrefSubscribeTerminus:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  if (xpc_dictionary_get_value(a3, "kMessageArgs"))
  {
    id v4 = +[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton];
    [v4 updateControllerState:a3];
  }
  else
  {
    +[WCM_Logging logLevel:16 message:@"Discarding invalid Subscribe message from Terminus client"];
  }
}

- (void)handleSubscribeStatusUpdateTerminus:(id)a3
{
  xpc_dictionary_set_uint64(a3, "kClientType", [(WRM_iRATClientController *)self getMyClientType]);
  xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
  if (value)
  {
    v5 = value;
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

- (void)handleLinkPreferenceNotificationTerminus
{
  xpc_object_t v3 = xpc_array_create(0, 0);
  if ([(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mBtLinkRecommendationUpdateNeeded]|| [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mForceUpdateNeeded])
  {
    BOOL v4 = [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mBtLinkIsRecommended];
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "kWRMProximityLinkRecommendationType", 1uLL);
    xpc_dictionary_set_BOOL(v5, "kWRMProximityLinkisRecommended", v4);
    xpc_array_append_value(v3, v5);
    [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] setMBtLinkRecommendationUpdateNeeded:0];
  }
  if ([(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mCompanionWifiLinkRecommendationUpdateNeeded])
  {
    BOOL v6 = [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mCompanionWifiLinkIsRecommended];
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "kWRMProximityLinkRecommendationType", 0);
    xpc_dictionary_set_BOOL(v7, "kWRMProximityLinkisRecommended", v6);
    xpc_array_append_value(v3, v7);
    [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] setMCompanionWifiLinkRecommendationUpdateNeeded:0];
  }
  if ([(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mDirectWifiLinkRecommendationUpdateNeeded]|| [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mForceUpdateNeeded])
  {
    BOOL v8 = [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] mDirectWifiLinkIsRecommended];
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v9, "kWRMProximityLinkRecommendationType", 2uLL);
    xpc_dictionary_set_BOOL(v9, "kWRMProximityLinkisRecommended", v8);
    xpc_dictionary_set_uint64(v9, "kWRMProximityBtRssi", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] btMovingAvgRSSI]);
    xpc_dictionary_set_int64(v9, "kWRMProximityBtRetransmissionRateTx", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] btRetransmissionRateTx]);
    xpc_dictionary_set_int64(v9, "kWRMProximityBtRetransmissionRateRx", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] btRetransmissionRateRx]);
    xpc_dictionary_set_int64(v9, "kWRMProximityBtTech", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] btTech]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiRssi", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] wifiRSSI]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiSnr", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] wifiSNR]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiBeaconPer", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] beaconPER]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiNwType", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] nwType]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiLSMBeRecommendation", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] lsmRecommendationBe]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiExpectedThroughputVIBE", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] expectedThroughputVIBE]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiPacketLifetimeVIBE", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] packetLifetimeVIBE]);
    xpc_dictionary_set_int64(v9, "kWRMProximityWifiPacketLossRateVIBE", [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] packetLossRateVIBE]);
    xpc_array_append_value(v3, v9);
    [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] setMDirectWifiLinkRecommendationUpdateNeeded:0];
  }
  size_t count = xpc_array_get_count(v3);
  if (count)
  {
    size_t v11 = count;
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_value(v12, "kWRMApplicationTypeList", v3);
    [(WCM_Controller *)self sendMessage:1305 withArgs:v12];
    +[WCM_Logging logLevel:27, @"Sending Proximity Link Preference Notification having %d recommendation(s)", v11 message];
    size_t v13 = xpc_array_get_count(v3);
    if (v13)
    {
      size_t v14 = v13;
      for (size_t i = 0; i != v14; ++i)
      {
        xpc_object_t value = xpc_array_get_value(v3, i);
        xpc_release(value);
      }
    }
    xpc_release(v12);
  }
  else
  {
    +[WCM_Logging logLevel:27 message:@"No need to send link preference notification as no change in recommendation"];
  }
  xpc_release(v3);
  [(WRM_TerminusContext *)[(WRM_iRATClientControllerTerminus *)self mTerminusContext] setMForceUpdateNeeded:0];
  v17 = [(WRM_iRATClientControllerTerminus *)self mTerminusContext];

  [(WRM_TerminusContext *)v17 setMIsRetry:0];
}

- (OS_dispatch_queue)queue
{
  return *(OS_dispatch_queue **)(&self->super.mLowPowerModePeriodicWakeUpNotificationSubscribed + 1);
}

- (void)setQueue:(id)a3
{
}

- (WRM_TerminusContext)mTerminusContext
{
  return *(WRM_TerminusContext **)((char *)&self->_rxClientType + 1);
}

- (void)setMTerminusContext:(id)a3
{
}

- (int)rxClientType
{
  return *(_DWORD *)((char *)&self->super.mActiveSlot + 5);
}

- (void)setRxClientType:(int)a3
{
  *(_DWORD *)((char *)&self->super.mActiveSlot + 5) = a3;
}

@end