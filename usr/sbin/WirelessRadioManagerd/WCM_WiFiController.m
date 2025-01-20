@interface WCM_WiFiController
- (BOOL)didWiFiDeviceReset;
- (BOOL)getWiFiBTSharedAntennaDisabledStatus;
- (BOOL)hostAP;
- (BOOL)hostAP5GHzActive;
- (BOOL)isAWDLInProgress;
- (BOOL)isAssociated;
- (BOOL)isAutoUnlockRangingInProgress;
- (BOOL)isCarPlaySessionInProgress;
- (BOOL)isCoPresenceInProgress;
- (BOOL)isEnsembleInProgress;
- (BOOL)isSideCarInProgress;
- (BOOL)powerState;
- (WCM_WiFiController)init;
- (WCM_WiFiService)wifiService;
- (id)getLeastCongestedWifiParam;
- (id)getWiFiServiceSingletone;
- (int)getCarPlayScanRelaxReason;
- (int)getPhyMode;
- (int)wifiState;
- (int64_t)getNumberOfSpatialStream;
- (int64_t)getNumberOfSpatialStreamOnAccessPoint;
- (int64_t)getWiFiBTActiveProfileFor2G;
- (unint64_t)catsAppBitmap;
- (unsigned)bodyTxPowerCapdBm;
- (unsigned)catsAppPriority;
- (unsigned)channelBandwidthMHz;
- (unsigned)channelCenterFreqMHz;
- (unsigned)headTxPowerCapdBm;
- (unsigned)leScanGrantDuration;
- (unsigned)reportedChannelCenterFreqMHz;
- (unsigned)wifiChannel;
- (void)dealloc;
- (void)handleDisconnection:(id)a3;
- (void)handleMessage:(id)a3;
- (void)handlePowerState:(BOOL)a3;
- (void)handleWiFiResetFlag;
- (void)reportWiFiError;
- (void)setAntennaSelectionWiFiEnh:(id)a3;
- (void)setBodyTxPowerCapdBm:(unsigned int)a3;
- (void)setCatsAppBitmap:(unint64_t)a3;
- (void)setCatsAppPriority:(unsigned __int8)a3;
- (void)setChannelBandwidthMHz:(unsigned int)a3;
- (void)setChannelCenterFreqMHz:(unsigned int)a3;
- (void)setCoexParams:(void *)a3 withValue:(void *)a4;
- (void)setHeadTxPowerCapdBm:(unsigned int)a3;
- (void)setHostAP5GHzActive:(BOOL)a3;
- (void)setHostAP:(BOOL)a3;
- (void)setLeScanGrantDuration:(unsigned int)a3;
- (void)setPowerState:(BOOL)a3;
- (void)setReportedChannelCenterFreqMHz:(unsigned int)a3;
- (void)setWifiChannel:(unsigned int)a3;
- (void)setWifiState:(int)a3;
- (void)toggleWiFiLQMIfNeeded:(BOOL)a3;
- (void)update5GHzHostAPState:(BOOL)a3;
- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4;
- (void)updateCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4;
- (void)updateCatsStateWrapper:(unsigned __int8)a3 bitmap:(unint64_t)a4 scanGrantDuration:(unsigned int)a5;
- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4;
- (void)updatePowerState:(BOOL)a3;
- (void)updateTxPowerCapForHead:(unsigned int)a3 forBody:(unsigned int)a4;
- (void)updateWeightAvgLQM:(unsigned int)a3 txRate:(unsigned int)a4;
- (void)updateWiFiState:(int)a3 channel:(unsigned int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 hostAp:(BOOL)a7;
@end

@implementation WCM_WiFiController

- (unsigned)channelBandwidthMHz
{
  return self->_channelCenterFreqMHz;
}

- (int)wifiState
{
  return *(_DWORD *)&self->_powerState;
}

- (BOOL)didWiFiDeviceReset
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 didWiFiDeviceReset];
}

- (WCM_WiFiService)wifiService
{
  return *(WCM_WiFiService **)(&self->_leScanGrantDuration + 1);
}

- (BOOL)powerState
{
  return *((unsigned char *)&self->super.mProcessId + 4);
}

- (unsigned)wifiChannel
{
  return self->_wifiState;
}

- (void)updateWeightAvgLQM:(unsigned int)a3 txRate:(unsigned int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AFCC;
  block[3] = &unk_10020DB30;
  unsigned int v5 = a4;
  unsigned int v6 = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)updateCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EE80;
  v4[3] = &unk_100211A60;
  unsigned __int8 v5 = a3;
  v4[4] = a4;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], v4);
}

- (void)setCatsAppPriority:(unsigned __int8)a3
{
  *((unsigned char *)&self->super.mProcessId + 7) = a3;
}

- (void)setCatsAppBitmap:(unint64_t)a3
{
  *(WCM_WiFiService **)((char *)&self->_wifiService + 4) = (WCM_WiFiService *)a3;
}

- (BOOL)isSideCarInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isSideCarInProgress];
}

- (BOOL)isEnsembleInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isEnsembleInProgress];
}

- (BOOL)isAutoUnlockRangingInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isAutoUnlockRangingInProgress];
}

- (void)handleWiFiResetFlag
{
  v2 = [(WCM_WiFiController *)self wifiService];

  [(WCM_WiFiService *)v2 setWiFiResetFlag];
}

- (int)getPhyMode
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 getPhyMode];
}

- (unsigned)channelCenterFreqMHz
{
  return self->_wifiChannel;
}

- (unsigned)catsAppPriority
{
  return *((unsigned char *)&self->super.mProcessId + 7);
}

- (unint64_t)catsAppBitmap
{
  return *(unint64_t *)((char *)&self->_wifiService + 4);
}

- (WCM_WiFiController)init
{
  +[WCM_Logging logLevel:2 message:@"WiFi controller init"];
  v7.receiver = self;
  v7.super_class = (Class)WCM_WiFiController;
  v3 = [(WCM_Controller *)&v7 init];
  v4 = (WCM_WiFiController *)v3;
  if (v3)
  {
    v3[20] = 0;
    *((_DWORD *)v3 + 6) = 0;
    v3[21] = 0;
    *((_DWORD *)v3 + 7) = 0;
    *((_DWORD *)v3 + 8) = 0;
    *((_DWORD *)v3 + 9) = 0;
    *((_DWORD *)v3 + 10) = 0;
    *((_DWORD *)v3 + 11) = 0;
    v3[23] = 0;
    *(void *)(v3 + 68) = 0;
    *((_DWORD *)v3 + 13) = 10;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000D9878;
    block[3] = &unk_10020D980;
    void block[4] = v3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v4;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"WiFi controller dealloc"];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D9994;
  block[3] = &unk_10020D980;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  v3.receiver = self;
  v3.super_class = (Class)WCM_WiFiController;
  [(WCM_Controller *)&v3 dealloc];
}

- (void)handlePowerState:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (id)getWiFiServiceSingletone
{
  if ([(WCM_Controller *)self getProcessId])
  {
    if ([(WCM_Controller *)self getProcessId] == 1)
    {
      objc_super v3 = "WCMWiFi";
    }
    else if ([(WCM_Controller *)self getProcessId] == 2)
    {
      objc_super v3 = "WCMFaceTime";
    }
    else if ([(WCM_Controller *)self getProcessId] == 3)
    {
      objc_super v3 = "WCMCellular";
    }
    else if ([(WCM_Controller *)self getProcessId] == 4)
    {
      objc_super v3 = "WCMBT";
    }
    else
    {
      if ([(WCM_Controller *)self getProcessId] == 5) {
        goto LABEL_12;
      }
      if ([(WCM_Controller *)self getProcessId] == 29)
      {
        objc_super v3 = "WCMRCU1";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 30)
      {
        objc_super v3 = "WCMRCU2";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 31)
      {
        objc_super v3 = "WRMAirPlay";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 38)
      {
        objc_super v3 = "WCMP2PAWDL";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 39)
      {
        objc_super v3 = "WCMP2PNAN";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 6)
      {
        objc_super v3 = "WRMCommander";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 7)
      {
        objc_super v3 = "WRMCommCenter";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 8)
      {
        objc_super v3 = "WRMNetworkd";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 9)
      {
        objc_super v3 = "WRMWiFiCalling";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 10)
      {
        objc_super v3 = "WRMIPTelephony";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 11)
      {
        objc_super v3 = "WRMIdsClient";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 12)
      {
        objc_super v3 = "WRMIdsTool";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 13)
      {
        objc_super v3 = "WRMIMGVideo";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 14)
      {
        objc_super v3 = "WRMFaceTimeCalling";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 15)
      {
        objc_super v3 = "WRMCallKitTelephony";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 16)
      {
        objc_super v3 = "WRMLocationd";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 17)
      {
        objc_super v3 = "WRMCarousel";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 18)
      {
        objc_super v3 = "WRMMusic";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 19)
      {
        objc_super v3 = "WRMTerminus";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 20)
      {
        objc_super v3 = "WRMIMGVideoTest";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 21)
      {
        objc_super v3 = "WRMCommCenter1";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 22)
      {
        objc_super v3 = "WRMSiri";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 23)
      {
        objc_super v3 = "WRMWebkit";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 24)
      {
        objc_super v3 = "WRMWebkitMail";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 25)
      {
        objc_super v3 = "WRMWebkitNotification";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 26)
      {
        objc_super v3 = "WRMWirelessStress";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 33)
      {
        objc_super v3 = "WRMNPT";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 34)
      {
        objc_super v3 = "WRMCoreMediaStreaming";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 35)
      {
        objc_super v3 = "WCMSharing";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 37)
      {
        objc_super v3 = "WCMFrequencyTool";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 27)
      {
        objc_super v3 = "WRMTest";
        goto LABEL_82;
      }
      if ([(WCM_Controller *)self getProcessId] == 5)
      {
LABEL_12:
        objc_super v3 = "WCMTest";
      }
      else if ([(WCM_Controller *)self getProcessId] == 40)
      {
        objc_super v3 = "WRMHomeKit";
      }
      else if ([(WCM_Controller *)self getProcessId] == 41)
      {
        objc_super v3 = "WRMMIC";
      }
      else
      {
        unsigned int v4 = [(WCM_Controller *)self getProcessId];
        objc_super v3 = "INVALID_PROC_ID!!!";
        if (v4 == 42) {
          objc_super v3 = "WRMSOS";
        }
      }
    }
  }
  else
  {
    objc_super v3 = "WCMUnknown";
  }
LABEL_82:
  +[WCM_Logging logLevel:0, @"WCM_WiFiController(%s) getWiFiServiceSingletone default implementation", v3 message];
  return 0;
}

- (BOOL)isAssociated
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isAssociated];
}

- (BOOL)isAWDLInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isAWDLInProgress];
}

- (BOOL)isCarPlaySessionInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isCarPlaySessionInProgress];
}

- (int)getCarPlayScanRelaxReason
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 getCarPlayScanRelaxReason];
}

- (id)getLeastCongestedWifiParam
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 getLeastCongestedWifiParam];
}

- (BOOL)isCoPresenceInProgress
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 isCoPresenceInProgress];
}

- (int64_t)getNumberOfSpatialStream
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 getNumberOfSpatialStream];
}

- (int64_t)getNumberOfSpatialStreamOnAccessPoint
{
  v2 = [(WCM_WiFiController *)self wifiService];

  return [(WCM_WiFiService *)v2 getNumberOfSpatialStreamOnAccessPoint];
}

- (void)toggleWiFiLQMIfNeeded:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000DA110;
  v3[3] = &unk_10020DE10;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)updatePowerState:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA270;
  block[3] = &unk_10020DAD0;
  BOOL v4 = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA354;
  block[3] = &unk_100211A40;
  BOOL v6 = a3;
  int v5 = a4;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA4A0;
  block[3] = &unk_10020DB30;
  unsigned int v5 = a3;
  unsigned int v6 = a4;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)updateCatsStateWrapper:(unsigned __int8)a3 bitmap:(unint64_t)a4 scanGrantDuration:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v7 = a3;
  id v9 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  if (v9)
  {
    [v9 setLeScanGrantDuration:v5];
    [(WCM_WiFiController *)self updateCatsState:v7 bitmap:a4];
  }
}

- (void)updateWiFiState:(int)a3 channel:(unsigned int)a4 centerFreq:(unsigned int)a5 bandwidth:(unsigned int)a6 hostAp:(BOOL)a7
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DA688;
  block[3] = &unk_100211A80;
  int v8 = a3;
  unsigned int v9 = a4;
  BOOL v12 = a7;
  unsigned int v10 = a5;
  unsigned int v11 = a6;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)update5GHzHostAPState:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DAADC;
  block[3] = &unk_10020DAD0;
  BOOL v4 = a3;
  dispatch_async([+[WCM_Server singleton](WCM_Server, "singleton") getQueue], block);
}

- (void)updateTxPowerCapForHead:(unsigned int)a3 forBody:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(WCM_WiFiController *)self setHeadTxPowerCapdBm:*(void *)&a3];

  [(WCM_WiFiController *)self setBodyTxPowerCapdBm:v4];
}

- (void)reportWiFiError
{
  v2 = [[WCM_Server singleton] getQueue];

  dispatch_async(v2, &stru_100211AA0);
}

- (int64_t)getWiFiBTActiveProfileFor2G
{
  return 0;
}

- (BOOL)getWiFiBTSharedAntennaDisabledStatus
{
  return 0;
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:2 message:@"WiFiController handleDisconnection"];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") handleBTCoexWiFiStateEvent:0 wifiChannel:0];
  [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") handleWiFiBTCatsChange:1];
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") bspMonitor];

  [v3 handleWiFiStatusUpdateEvent:0];
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  +[WCM_Logging logLevel:2, @"In WCMWIFI Controller handleMessage messageId = %lld", uint64 message];
  if (uint64 == 2602)
  {
    xpc_object_t value = xpc_dictionary_get_value(a3, "kMessageArgs");
    string = xpc_dictionary_get_string(value, "kWCM_WLMWS_TestName");
    BOOL v12 = xpc_dictionary_get_string(value, "kWCM_WLMWS_TestKey");
    if (!strcmp(string, "antenna_selection"))
    {
      xpc_object_t array = xpc_dictionary_get_array(value, "kWCM_WLMWS_TestAntennaSelectionArray");
      id v16 = +[NSMutableArray array];
      size_t count = xpc_array_get_count(array);
      if (count)
      {
        size_t v18 = count;
        for (size_t i = 0; i != v18; ++i)
        {
          xpc_object_t v20 = xpc_array_get_value(array, i);
          [v16 addObject:[+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", xpc_uint64_get_value(v20))]];
        }
      }
      [(WCM_WiFiController *)self setAntennaSelectionWiFiEnh:v16];
    }
    else
    {
      xpc_object_t v13 = xpc_dictionary_get_value(value, "kWCM_WLMWS_TestChannelBitmap");
      id v14 = +[NSMutableDictionary dictionary];
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_1000DAF94;
      applier[3] = &unk_100211AC8;
      applier[4] = v14;
      xpc_dictionary_apply(v13, applier);
      [(WCM_WiFiController *)self setCoexParams:v12 withValue:v14];
    }
    +[WCM_Logging logLevel:0, @"WCMTestWifiCoexConfiguration controller dropping message-id %lld", 2602 message];
  }
  else if (uint64 == 2601)
  {
    uint64_t v6 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Band");
    uint64_t v7 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Channel");
    uint64_t v8 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_CenterFrequency");
    uint64_t v9 = xpc_dictionary_get_uint64(a3, "kWCMTestWiFiNetworkConfiguration_Bandwidth");
    [(WCM_WiFiController *)self updateWiFiState:v6 channel:v7 centerFreq:v8 bandwidth:v9 hostAp:xpc_dictionary_get_BOOL(a3, "kWCMTestWiFiNetworkConfiguration_Mode")];
    +[WCM_Logging logLevel:0, @"WCMTestWiFiNetworkConfiguration controller dropping message-id %lld", 2601 message];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"RCU1 controller dropping message-id %lld", uint64 message];
  }
}

- (void)setCoexParams:(void *)a3 withValue:(void *)a4
{
  id v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  if (v6)
  {
    [v6 setCoexParams:a3 withValue:a4];
  }
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  id v4 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
  if (v4)
  {
    [v4 setAntennaSelectionWiFiEnh:a3];
  }
}

- (void)setPowerState:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 4) = a3;
}

- (void)setWifiState:(int)a3
{
  *(_DWORD *)&self->_powerState = a3;
}

- (void)setWifiChannel:(unsigned int)a3
{
  self->_wifiState = a3;
}

- (BOOL)hostAP
{
  return *((unsigned char *)&self->super.mProcessId + 5);
}

- (void)setHostAP:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 5) = a3;
}

- (BOOL)hostAP5GHzActive
{
  return *((unsigned char *)&self->super.mProcessId + 6);
}

- (void)setHostAP5GHzActive:(BOOL)a3
{
  *((unsigned char *)&self->super.mProcessId + 6) = a3;
}

- (void)setChannelCenterFreqMHz:(unsigned int)a3
{
  self->_wifiChannel = a3;
}

- (void)setChannelBandwidthMHz:(unsigned int)a3
{
  self->_channelCenterFreqMHz = a3;
}

- (unsigned)headTxPowerCapdBm
{
  return self->_channelBandwidthMHz;
}

- (void)setHeadTxPowerCapdBm:(unsigned int)a3
{
  self->_channelBandwidthMHz = a3;
}

- (unsigned)bodyTxPowerCapdBm
{
  return self->_headTxPowerCapdBm;
}

- (void)setBodyTxPowerCapdBm:(unsigned int)a3
{
  self->_headTxPowerCapdBm = a3;
}

- (unsigned)reportedChannelCenterFreqMHz
{
  return self->_bodyTxPowerCapdBm;
}

- (void)setReportedChannelCenterFreqMHz:(unsigned int)a3
{
  self->_bodyTxPowerCapdBm = a3;
}

- (unsigned)leScanGrantDuration
{
  return self->_reportedChannelCenterFreqMHz;
}

- (void)setLeScanGrantDuration:(unsigned int)a3
{
  self->_reportedChannelCenterFreqMHz = a3;
}

@end