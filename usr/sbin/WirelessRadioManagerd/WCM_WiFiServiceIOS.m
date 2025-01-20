@interface WCM_WiFiServiceIOS
- (BOOL)deviceAssociatedOnPreferredNetwork;
- (BOOL)didWiFiDeviceReset;
- (BOOL)getAirplayStatus;
- (BOOL)getP2pRCU2CoexEventStatus;
- (BOOL)isAssociated;
- (BOOL)isCarPlaySessionInProgress;
- (BOOL)isCoPresenceInProgress;
- (BOOL)isSlowWiFi;
- (BOOL)isWiFiConnected;
- (BOOL)isWiFiNetworkCaptive;
- (BOOL)isWiFiPrimaryInterface;
- (BOOL)setLQMReportInterval:(int)a3;
- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4;
- (WCM_WiFiServiceIOS)init;
- (id)getLeastCongestedWifiParam;
- (int)getCarPlayScanRelaxReason;
- (int)getPhyMode;
- (int)getPointOfInterest;
- (int)sendMessage:(void *)a3 withValue:(void *)a4;
- (unsigned)getChannelType;
- (unsigned)getWiFiBW;
- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4;
- (void)bspGetBandSwitchStatus;
- (void)bspGetChannelQualityInfo;
- (void)bspNanPhsStateRequest;
- (void)bspRegulatoryInfoRequest;
- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8;
- (void)bspStatusRequest;
- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5;
- (void)checkWiFiState;
- (void)dealloc;
- (void)disableLQMUpdate;
- (void)disableWiFi;
- (void)dispatchCarplayInfotoBT:(BOOL)a3 reason:(int)a4;
- (void)dispatchContentionFreeWiFiNetworkToRC2:(unsigned int)a3 count:(unsigned int)a4;
- (void)enableLQMUpdate;
- (void)forceCopresence:(BOOL)a3 scanGrantDuration:(unsigned int)a4;
- (void)notifyWiFiStateChange:(BOOL)a3;
- (void)performScan:(id)a3;
- (void)processWifiDeviceExtendedLinkEvent:(__CFDictionary *)a3;
- (void)registerWiFiCallbacks;
- (void)setAntennaCellPolicy:(id)a3;
- (void)setAntennaSelection:(id)a3;
- (void)setAntennaSelectionV2:(id)a3;
- (void)setAntennaSelectionWiFiEnh:(id)a3;
- (void)setBTConnectionReport:(id)a3;
- (void)setCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4;
- (void)setCellularFrequencyConfig:(id)a3;
- (void)setChannelConfigurationForConditionId:(unsigned int)a3 enable2G:(BOOL)a4 enable5G:(BOOL)a5 enable6G:(BOOL)a6 wifi_channel_lower:(unsigned int)a7 wifi_channel_upper:(unsigned int)a8;
- (void)setChannelsForCellularScanProtectionWiFiEnh:(id)a3 wiFiEnhChannels:(id)a4 indexArrayForScanThrottling:(id)a5;
- (void)setChannelsForCellularScanProtectionWithMode:(id)a3 indexArrayForScanThrottling:(id)a4;
- (void)setChannelsForTimeSharingMode:(id)a3;
- (void)setChannelsToBlocklist:(id)a3;
- (void)setChannelsToDisableOCL:(id)a3;
- (void)setChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)setChannelsToEnableAssocProtectionModeWiFiEnh;
- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3;
- (void)setChannelsToEnableType7MSG:(id)a3;
- (void)setChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)setChannelsToEnableWCI2:(id)a3;
- (void)setChannelsToEnableWCI2V2:(id)a3;
- (void)setChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4;
- (void)setChannelsToEnablerFemModeWiFiEnh:(BOOL)a3 enable5G:(BOOL)a4 enable6G:(BOOL)a5 setDefaultForall:(BOOL)a6;
- (void)setCoexParams:(const char *)a3 withValue:(id)a4;
- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6;
- (void)setEnableAgcCoexMode:(id)a3;
- (void)setEnableEnvelopeIndicationFor2G:(id)a3;
- (void)setEnvelopeIndicationTimerFor2G:(id)a3;
- (void)setHPovrLEscanGrantDuration:(unsigned int)a3;
- (void)setLAACoexConfigEnableTxInd;
- (void)setLAACoexConfigScanThrottleMask:(id)a3;
- (void)setLAACoexConfigWci2TxDurationThreshold:(id)a3;
- (void)setLAACoexConfigWifiDwellTime:(id)a3;
- (void)setMWSChannelParameters:(id)a3;
- (void)setMWSFrameConfig:(id)a3;
- (void)setMWSSignalingConfig:(id)a3;
- (void)setMaxDurationForCellularScanProtection:(id)a3;
- (void)setMedtronicState:(int)a3;
- (void)setRCU2CoexParams:(id)a3;
- (void)setRxAntennaPreference:(id)a3;
- (void)setRxPriorityThreshold:(id)a3;
- (void)setRxProtectAutoModeParamWeight:(id)a3 andThresh:(id)a4;
- (void)setRxProtectMode:(id)a3;
- (void)setScanJoinRxProtectDuration:(id)a3;
- (void)setTxAntennaPreference:(id)a3;
- (void)setTxOnIndication:(id)a3;
- (void)setWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4;
- (void)setWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7;
- (void)setWiFiBTULOFDMAstate:(BOOL)a3;
- (void)setWiFiCallingState:(BOOL)a3;
- (void)setWiFiDevice:(__WiFiDeviceClient *)a3;
- (void)setWiFiLinkUP;
- (void)setWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6;
- (void)setWiFiRCU1ULOFDMAstate:(BOOL)a3;
- (void)setWiFiRCU2CoexMode:(id)a3;
- (void)setWiFiRCU2PMProtectionMode:(id)a3;
- (void)setWiFiRCU2TimingArray:(id)a3;
- (void)setWiFiRCU2ULOFDMAstate:(BOOL)a3;
- (void)setWiFiResetFlag;
- (void)setWifiBTA2DPLLAStatus:(int)a3;
- (void)setWifiBTA2DPStatus:(int)a3;
- (void)setWifiBTeSCOHidStatus:(int)a3 andUseCase:(int)a4;
- (void)setWifiBTeSCOStatus:(int)a3;
- (void)unregisterWiFiCallbacks;
- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4;
- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4;
- (void)updateHostAPState:(BOOL)a3 channel:(unsigned int)a4;
- (void)updateLQMReceived;
- (void)updatePointOfInterest:(int)a3;
@end

@implementation WCM_WiFiServiceIOS

- (int)getPhyMode
{
  if (!self->mWifiDevice)
  {
    CFStringRef v10 = @"WiFiS: device not attached";
    uint64_t v11 = 0;
LABEL_21:
    +[WCM_Logging logLevel:v11 message:v10];
    return 0;
  }
  uint64_t v2 = WiFiDeviceClientCopyCurrentNetwork();
  if (!v2)
  {
    CFStringRef v10 = @"WiFiS: not associated to network";
    uint64_t v11 = 2;
    goto LABEL_21;
  }
  v3 = (const void *)v2;
  uint64_t PhyMode = WiFiNetworkGetPhyMode();
  +[WCM_Logging logLevel:2, @"WiFiNetworkGetPhyMode is 0x%x", PhyMode message];
  if ((PhyMode & 4) != 0) {
    int v5 = 2;
  }
  else {
    int v5 = (PhyMode & 0x22) != 0;
  }
  if ((PhyMode & 0x48) != 0) {
    int v6 = 3;
  }
  else {
    int v6 = v5;
  }
  if ((PhyMode & 0x10) != 0) {
    int v7 = 4;
  }
  else {
    int v7 = v6;
  }
  if ((PhyMode & 0x80) != 0) {
    int v8 = 5;
  }
  else {
    int v8 = v7;
  }
  if ((PhyMode & 0x100) != 0) {
    int v9 = 6;
  }
  else {
    int v9 = v8;
  }
  CFRelease(v3);
  return v9;
}

- (BOOL)isWiFiPrimaryInterface
{
  unsigned int v3 = [[-[NWPathEvaluator path](self->mWiFiPathEvaluator, "path") usesInterfaceType:1];
  BOOL v4 = v3;
  +[WCM_Logging logLevel:19, @"isWiFiPrimaryInterface %d, path: %x", v3, self->mWiFiPathEvaluator message];
  return v4;
}

- (BOOL)isWiFiNetworkCaptive
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009B68;
  v4[3] = &unk_10020DBB8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)isSlowWiFi
{
  return self->mWifiBand == 2 || self->mBandwidthMHz < 0x28;
}

- (void)updatePointOfInterest:(int)a3
{
  self->mWiFiPointOfInterest = a3;
}

- (void)updateLQMReceived
{
  self->mLQMRecevied = 1;
}

- (void)setWifiBTeSCOHidStatus:(int)a3 andUseCase:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100023F60;
  v4[3] = &unk_10020DB90;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)setWiFiResetFlag
{
  self->mWiFiDeviceReset = 0;
}

- (void)setWiFiLinkUP
{
  self->mWiFiLinkUP = 1;
}

- (void)setCatsState:(unsigned __int8)a3 bitmap:(unint64_t)a4
{
  mDelegate = self->super.mDelegate;
  if (mDelegate) {
    [(WCM_WiFiDelegate *)mDelegate updateCatsState:a3 bitmap:a4];
  }
}

- (int)sendMessage:(void *)a3 withValue:(void *)a4
{
  if ((objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "coexSupported") & 1) == 0)
  {
    CFStringRef v8 = @"WiFiS: not send message as LTE Coex is not enabled";
    uint64_t v9 = 1;
LABEL_11:
    +[WCM_Logging logLevel:v9 message:v8];
    return -3902;
  }
  if (!self->mWifiDevice)
  {
    CFStringRef v8 = @"WiFiS: not send message as device not attached";
LABEL_10:
    uint64_t v9 = 2;
    goto LABEL_11;
  }
  if (!self->mWifiDevicePowerState)
  {
    CFStringRef v8 = @"WiFiS: not send message as device power off";
    goto LABEL_10;
  }
  +[WCM_Logging logLevel:2, @"WiFiS: send WiFi message (%@)", a3 message];
  mWifiDevice = self->mWifiDevice;

  return _WiFiDeviceClientSetCoexParameters(mWifiDevice, a3, a4);
}

- (BOOL)didWiFiDeviceReset
{
  return self->mWiFiDeviceReset;
}

- (WCM_WiFiServiceIOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_WiFiServiceIOS;
  char v2 = [(WCM_WiFiService *)&v5 init];
  unsigned int v3 = v2;
  if (v2)
  {
    v2->mWifiDevice = 0;
    v2->mWifiManager = 0;
    v2->mLQMRecevied = 0;
    v2->mAWDLInProgress = 0;
    v2->mP2pRCU2CoexEventInProgress = 0;
    v2->mCarPlaySessionInProgress = 0;
    v2->mCarPlayBTScanRelaxReason = 4;
    v2->mLeastCongestedChannel = 0;
    v2->mLeastCongestedChannelCount = 0;
    v2->mWiFiDeviceReset = 0;
    v2->mWifiDevicePowerState = 0;
    v2->mWiFiLinkUP = 0;
    v2->mWiFiPathEvaluator = (NWPathEvaluator *)[objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:0];
    v3->mWifiBand = 0;
    v3->mBandwidthMHz = 0;
  }
  return v3;
}

- (void)dealloc
{
  mWiFiPathEvaluator = self->mWiFiPathEvaluator;
  if (mWiFiPathEvaluator)
  {

    self->mWiFiPathEvaluator = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)WCM_WiFiServiceIOS;
  [(WCM_WiFiService *)&v4 dealloc];
}

- (void)registerWiFiCallbacks
{
  if (self->mWifiManager)
  {
    +[WCM_Logging logLevel:0 message:@"WiFiS: mWifiManager was not releaed previously"];
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->mWifiManager);
  }
  unsigned int v3 = (__WiFiManagerClient *)WiFiManagerClientCreate();
  self->mWifiManager = v3;
  if (v3)
  {
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
    WiFiManagerClientRegisterWowStateChangedCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    CFArrayRef v4 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (CFArrayGetCount(v4))
      {
        [(WCM_WiFiServiceIOS *)self setWiFiDevice:CFArrayGetValueAtIndex(v5, 0)];
      }
      else
      {
        self->mWifiDevicePowerState = 0;
        +[WCM_Logging logLevel:0 message:@"WiFiS: there is no device attached"];
      }
      CFRelease(v5);
      return;
    }
    self->mWifiDevicePowerState = 0;
    CFStringRef v6 = @"WiFiS: there is no device attached";
  }
  else
  {
    CFStringRef v6 = @"WiFiS: failed to create WiFi manager client";
  }

  +[WCM_Logging logLevel:0 message:v6];
}

- (void)unregisterWiFiCallbacks
{
  if (self->mWifiDevice)
  {
    +[WCM_Logging logLevel:2 message:@"WiFiS: unregister device callbacks and release the device"];
    WiFiDeviceClientRegisterDeviceAvailableCallback();
    WiFiDeviceClientRegisterExtendedLinkCallback();
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterLQMCallback();
    WiFiDeviceClientRegisterWeightAvgLQMCallback();
    WiFiDeviceClientRegisterBTCoexStatsCallback();
    WiFiDeviceClientRegisterBssidChangeCallback();
    WiFiDeviceClientRegisterCatsUpdateCallback();
    WiFiDeviceClientRegisterBTScanIntervalRelaxCallback();
    WiFiDeviceClientRegisterScanUpdateCallback();
    WiFiDeviceClientRegisterResumeScanCallback();
    WiFiDeviceClientRegisterBgScanSuspendResumeCallback();
    WiFiDeviceClientRegisterBSPEventCallback();
    WiFiDeviceClientRegisterUCMEventCallback();
    CFRelease(self->mWifiDevice);
    self->mWifiDevice = 0;
    self->super.m_lqmRefCount = 0;
    self->mLQMRecevied = 0;
  }
  if (self->mWifiManager)
  {
    +[WCM_Logging logLevel:2 message:@"WiFiS: unregister manager callbacks and release the manager"];
    WiFiManagerClientRegisterWowStateChangedCallback();
    WiFiManagerClientRegisterDeviceAttachmentCallback();
    CFRunLoopGetMain();
    WiFiManagerClientUnscheduleFromRunLoop();
    CFRelease(self->mWifiManager);
    self->mWifiManager = 0;
  }
}

- (BOOL)setLQMReportInterval:(int)a3
{
  if (self->mWifiManager)
  {
    uint64_t v3 = *(void *)&a3;
    CFArrayRef v4 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v4)
    {
      CFArrayRef v5 = v4;
      if (CFArrayGetCount(v4))
      {
        CFArrayGetValueAtIndex(v5, 0);
        uint64_t v6 = WiFiDeviceClientSetLQMEventInterval();
        +[WCM_Logging logLevel:3, @"setLQMReportInterval: success, LQM report interval: %d,result: %d ", v3, v6 message];
      }
      else
      {
        +[WCM_Logging logLevel:3, @"setLQMReportInterval: failed, LQM report interval: %d", v3 message];
        LODWORD(v6) = -1;
      }
      CFRelease(v5);
    }
    else
    {
      +[WCM_Logging logLevel:3, @"setLQMReportInterval: failed, LQM report interval: %d", v3 message];
      LODWORD(v6) = -1;
    }
    return (int)v6 >= 0;
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"setLQMReportInterval: failed, null pointer"];
    return 0;
  }
}

- (BOOL)isAssociated
{
  if (self->mWifiDevice)
  {
    char v2 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    if (v2)
    {
      CFRelease(v2);
      return 1;
    }
    CFStringRef v4 = @"WiFiS: not associated to network";
    uint64_t v5 = 2;
  }
  else
  {
    CFStringRef v4 = @"WiFiS: device not attached";
    uint64_t v5 = 0;
  }
  +[WCM_Logging logLevel:v5 message:v4];
  return 0;
}

- (BOOL)isWiFiConnected
{
  return self->mWiFiLinkUP;
}

- (BOOL)isCoPresenceInProgress
{
  return (((unint64_t)[[WCM_PolicyManager singleton] wifiController] catsAppBitmap) >> 6) & 1;
}

- (void)setChannelsToBlocklist:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E09B0;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E0BA8;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2V2:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E0DA0;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableWCI2WiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E12B4;
  block[3] = &unk_10020DE88;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToEnableType7MSG:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E1C4C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableType7MSG2GWiFi:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E20A4;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableType7MSGWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E22DC;
  block[3] = &unk_10020DE88;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToDisableOCL:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E2C74;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToDisableOCLWiFiEnh:(id)a3 WiFiEnhChannels:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E2EA0;
  block[3] = &unk_10020DE88;
  block[4] = a3;
  block[5] = a4;
  block[6] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setRxPriorityThreshold:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3838;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSChannelParameters:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E392C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSFrameConfig:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3A20;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setMWSSignalingConfig:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3B2C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setRxAntennaPreference:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3C38;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setTxAntennaPreference:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3D34;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaCellPolicy:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3E30;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelection:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E3F2C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelectionV2:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E4020;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setAntennaSelectionWiFiEnh:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E4114;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsForCellularScanProtectionWithMode:(id)a3 indexArrayForScanThrottling:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E423C;
  block[3] = &unk_10020DE88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsForCellularScanProtectionWiFiEnh:(id)a3 wiFiEnhChannels:(id)a4 indexArrayForScanThrottling:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000E4C6C;
  v12[3] = &unk_100211B98;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = a5;
  v12[7] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

- (void)setChannelConfigurationForConditionId:(unsigned int)a3 enable2G:(BOOL)a4 enable5G:(BOOL)a5 enable6G:(BOOL)a6 wifi_channel_lower:(unsigned int)a7 wifi_channel_upper:(unsigned int)a8
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E6224;
  block[3] = &unk_100211BC0;
  unsigned int v9 = a3;
  unsigned int v10 = a7;
  unsigned int v11 = a8;
  BOOL v12 = a4;
  BOOL v13 = a5;
  BOOL v14 = a6;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setChannelsToEnablerFemModeWiFiEnh:(BOOL)a3 enable5G:(BOOL)a4 enable6G:(BOOL)a5 setDefaultForall:(BOOL)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E6F94;
  v6[3] = &unk_10020E678;
  BOOL v7 = a3;
  BOOL v8 = a4;
  BOOL v9 = a5;
  BOOL v10 = a6;
  v6[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsToEnableAssocProtectionModeWiFiEnh
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E763C;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setMaxDurationForCellularScanProtection:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E7B98;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setChannelsForTimeSharingMode:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E7C8C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setRxProtectMode:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E7DB8;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setRxProtectAutoModeParamWeight:(id)a3 andThresh:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v7 = a3;
      id v8 = a4;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000E7ECC;
      block[3] = &unk_10020DE88;
      block[4] = a3;
      void block[5] = a4;
      block[6] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)setTxOnIndication:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8028;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setScanJoinRxProtectDuration:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E811C;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setCellularFrequencyConfig:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8224;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnableEnvelopeIndicationFor2G:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8320;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnvelopeIndicationTimerFor2G:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E841C;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setEnableAgcCoexMode:(id)a3
{
  id v5 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000E8510;
  v6[3] = &unk_10020DAB0;
  v6[4] = a3;
  void v6[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)setLAACoexConfigEnableTxInd
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000E85F0;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setLAACoexConfigWci2TxDurationThreshold:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E870C;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setLAACoexConfigScanThrottleMask:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8808;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setLAACoexConfigWifiDwellTime:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8904;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setHPovrLEscanGrantDuration:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:2, @"WiFiS: Setting HPovrLEscanGrantDuration to %lu", *(void *)&a3 message];
  id v5 = +[NSNumber numberWithUnsignedInt:v3];

  [(WCM_WiFiServiceIOS *)self sendMessage:@"MWS_LE_NORM_SCAN_GRANT_DUR" withValue:v5];
}

- (void)setCriticalWiFiTraffic:(BOOL)a3 duration:(unsigned int)a4 criticalityPercentage:(unsigned __int16)a5 forProcessID:(int)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = *(void *)&a4;
  BOOL v9 = a3;
  unsigned int v11 = "off";
  if (a3) {
    unsigned int v11 = "on";
  }
  +[WCM_Logging logLevel:4, @"WiFiS: Setting critical wifi traffic to %s for %llu", v11, *(void *)&a6 message];
  v13[0] = @"APPLE80211KEY_MWS_WIFI_CRITICAL";
  v14[0] = +[NSNumber numberWithInt:v9];
  v13[1] = @"APPLE80211KEY_MWS_WIFI_CRITICAL_TYPE";
  if (a6 == 31) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  v14[1] = +[NSNumber numberWithInt:v12];
  v13[2] = @"APPLE80211KEY_MWS_WIFI_CRITICAL_DURATION";
  v14[2] = +[NSNumber numberWithUnsignedInt:v8];
  v13[3] = @"APPLE80211KEY_MWS_WIFI_CRITICAL_RESERVED";
  v14[3] = +[NSNumber numberWithUnsignedShort:v7];
  [(WCM_WiFiServiceIOS *)self sendMessage:@"APPLE80211KEY_MWS_WIFI_CRITICAL_PARAM" withValue:+[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4]];
}

- (void)setWiFiBTULOFDMAstate:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E8BB0;
  v3[3] = &unk_10020DE10;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU1ULOFDMAstate:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E8CA8;
  v3[3] = &unk_10020DE10;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU2ULOFDMAstate:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E8DA0;
  v3[3] = &unk_10020DE10;
  BOOL v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWiFiRCU1ModeChanged:(BOOL)a3 andChannelChanged:(BOOL)a4 andMode:(id)a5 andChannel:(id)a6
{
  if (a5)
  {
    if (a6)
    {
      id v11 = a5;
      id v12 = a6;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000E8EE0;
      v13[3] = &unk_100211BE8;
      BOOL v14 = a3;
      BOOL v15 = a4;
      void v13[4] = a5;
      v13[5] = a6;
      v13[6] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    }
  }
}

- (void)setWiFiBTLeConnEnable:(BOOL)a3 andPeakOutageMs:(unsigned int)a4 andDurationMs:(unsigned int)a5 andDutyCycle:(unsigned int)a6 andReason:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  uint64_t v8 = *(void *)&a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  BOOL v11 = a3;
  +[WCM_Logging logLevel:2 message:@"WiFiS: Update WiFi LEConn params"];
  v13[0] = @"MWS_LE_SCAN_EN";
  v14[0] = +[NSNumber numberWithInt:v11];
  v13[1] = @"MWS_LE_SCAN_PEAK";
  v14[1] = +[NSNumber numberWithUnsignedInt:v10];
  v13[2] = @"MWS_LE_SCAN_DUR";
  v14[2] = +[NSNumber numberWithUnsignedInt:v9];
  v13[3] = @"MWS_LE_SCAN_DC";
  v14[3] = +[NSNumber numberWithUnsignedInt:v8];
  void v13[4] = @"MWS_LE_SCAN_REASON";
  void v14[4] = +[NSNumber numberWithUnsignedInt:v7];
  [(WCM_WiFiServiceIOS *)self sendMessage:@"MWS_LE_SCAN_PARAM_INFO" withValue:+[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5]];
}

- (void)setWiFiRCU2CoexMode:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E91C4;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWiFiRCU2PMProtectionMode:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E92C0;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWiFiRCU2TimingArray:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E93BC;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setWifiBTeSCOStatus:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E94E4;
  v3[3] = &unk_10020E678;
  int v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWifiBTA2DPStatus:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E95D8;
  v3[3] = &unk_10020E678;
  int v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setWifiBTA2DPLLAStatus:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E96CC;
  v3[3] = &unk_10020E678;
  int v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (void)setBTConnectionReport:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E97D8;
    v6[3] = &unk_10020DAB0;
    v6[4] = a3;
    void v6[5] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)setRCU2CoexParams:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"RCU2Support"))
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000E9A08;
      v6[3] = &unk_10020DAB0;
      v6[4] = a3;
      void v6[5] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    }
  }
}

- (void)enableLQMUpdate
{
  +[WCM_Logging logLevel:26, @"WiFiS: enableLQMUpdate. %d", self->super.m_lqmRefCount message];
  if (self->super.m_lqmRefCount)
  {
    +[WCM_Logging logLevel:26 message:@"WiFiS: not registering to WiFi manager because LQM is already registered.\n"];
    ++self->super.m_lqmRefCount;
  }
  else
  {
    if (self->mWifiDevice)
    {
      WiFiDeviceClientRegisterLQMCallback();
      WiFiDeviceClientRegisterWeightAvgLQMCallback();
      self->super.m_lqmRefCount = 1;
      +[WCM_Logging logLevel:26, @"WiFiS: Client: WiFiDeviceClientRegisterLQMCallback.ref count %d", 1 message];
      mWifiDevice = self->mWifiDevice;
    }
    else
    {
      mWifiDevice = 0;
    }
    int v4 = "YES";
    if (!mWifiDevice) {
      int v4 = "NO";
    }
    +[WCM_Logging logLevel:19, @"WiFiS: Register Wifi LQM. result=%s mWiFiDevice=%p context=%p", v4, mWifiDevice, self message];
  }
}

- (void)disableLQMUpdate
{
  +[WCM_Logging logLevel:26, @"WiFiS: disableLQMUpdate. %d", self->super.m_lqmRefCount message];
  int m_lqmRefCount = self->super.m_lqmRefCount;
  BOOL v4 = __OFSUB__(m_lqmRefCount--, 1);
  self->super.int m_lqmRefCount = m_lqmRefCount;
  if ((m_lqmRefCount < 0) ^ v4 | (m_lqmRefCount == 0))
  {
    if (self->mWifiDevice)
    {
      WiFiDeviceClientRegisterLQMCallback();
      WiFiDeviceClientRegisterWeightAvgLQMCallback();
      self->super.int m_lqmRefCount = 0;
      +[WCM_Logging logLevel:26, @"WiFiS: Client: WiFiDeviceClientRegisterLQMCallback.ref count %d", 0 message];
      mWifiDevice = self->mWifiDevice;
    }
    else
    {
      mWifiDevice = 0;
    }
    uint64_t v6 = "YES";
    if (!mWifiDevice) {
      uint64_t v6 = "NO";
    }
    +[WCM_Logging logLevel:19, @"WiFiS: Unregister Wifi LQM. result=%s mWiFiDevice=%p context=%p", v6, mWifiDevice, self message];
  }
  else
  {
    +[WCM_Logging logLevel:26 message:@"WiFiS: Not de-registering LQM from WiFi Manager becuase reference count is non zero"];
  }
}

- (void)setWiFiDevice:(__WiFiDeviceClient *)a3
{
  if (a3)
  {
    if (self->mWifiDevice)
    {
      +[WCM_Logging logLevel:2 message:@"WiFiS: unregister device callbacks and release the existing device"];
      WiFiDeviceClientRegisterDeviceAvailableCallback();
      WiFiDeviceClientRegisterExtendedLinkCallback();
      WiFiDeviceClientRegisterHostApStateChangedCallback();
      WiFiDeviceClientRegisterLQMCallback();
      WiFiDeviceClientRegisterCatsUpdateCallback();
      WiFiDeviceClientRegisterBTScanIntervalRelaxCallback();
      WiFiDeviceClientRegisterScanUpdateCallback();
      WiFiDeviceClientRegisterResumeScanCallback();
      WiFiDeviceClientRegisterBgScanSuspendResumeCallback();
      WiFiDeviceClientRegisterWeightAvgLQMCallback();
      WiFiDeviceClientRegisterBTCoexStatsCallback();
      WiFiDeviceClientRegisterBSPEventCallback();
      WiFiDeviceClientRegisterUCMEventCallback();
      CFRelease(self->mWifiDevice);
      self->mWifiDevice = 0;
    }
    self->mWifiDevice = (__WiFiDeviceClient *)CFRetain(a3);
    int Power = WiFiDeviceClientGetPower();
    self->mWifiDevicePowerState = Power != 0;
    uint64_t v6 = "off";
    if (Power) {
      uint64_t v6 = "on";
    }
    +[WCM_Logging logLevel:5, @"WiFiS: device power %s", v6 message];
    [(WCM_WiFiDelegate *)self->super.mDelegate updatePowerState:self->mWifiDevicePowerState];
    if (objc_msgSend(objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "activeCoexFeatures"), "containsObject:", @"CellularNeedWiFiStatus"))
    {
      [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wrmPlatformId];
      [(WCM_WiFiDelegate *)self->super.mDelegate updateTxPowerCapForHead:14 forBody:14];
    }
    if (self->mWifiDevicePowerState) {
      [(WCM_WiFiServiceIOS *)self checkWiFiState];
    }
    +[WCM_Logging logLevel:2 message:@"WiFiS: register device callbacks"];
    WiFiDeviceClientRegisterDeviceAvailableCallback();
    WiFiDeviceClientRegisterExtendedLinkCallback();
    WiFiDeviceClientRegisterHostApStateChangedCallback();
    WiFiDeviceClientRegisterBssidChangeCallback();
    WiFiDeviceClientRegisterCatsUpdateCallback();
    WiFiDeviceClientRegisterBTScanIntervalRelaxCallback();
    WiFiDeviceClientRegisterScanUpdateCallback();
    WiFiDeviceClientRegisterResumeScanCallback();
    WiFiDeviceClientRegisterBgScanSuspendResumeCallback();
    WiFiDeviceClientRegisterLQMCallback();
    WiFiDeviceClientRegisterWeightAvgLQMCallback();
    ++self->super.m_lqmRefCount;
    if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
    {
      if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "needWiFiLQM"))
      {
        self->super.int m_lqmRefCount = 0;
        [(WCM_WiFiServiceIOS *)self enableLQMUpdate];
      }
      if ([+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") needWiFiLQM])[-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
      if ([+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") needWiFiLQM])-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate");
      }
      if ([+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton") needWiFiLQM])-[WCM_WiFiServiceIOS enableLQMUpdate](self, "enableLQMUpdate"); {
    }
      }
    WiFiDeviceClientRegisterBTCoexStatsCallback();
    WiFiDeviceClientRegisterBSPEventCallback();
    [+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") handleWiFiStatusUpdateEvent:self->mWifiDevicePowerState];
    WiFiDeviceClientRegisterUCMEventCallback();
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"WiFiS: setWiFiDevice: device is NULL"];
  }
}

- (void)processWifiDeviceExtendedLinkEvent:(__CFDictionary *)a3
{
  unsigned __int8 value_7 = 0;
  if (a3)
  {
    CFNumberRef v5 = (const __CFNumber *)CFDictionaryGetValue(a3, @"LINK_CHANGED_IS_LINKDOWN");
    CFNumberGetValue(v5, kCFNumberCharType, &value_7);
    if (value_7)
    {
      LOBYTE(value) = 0;
      LODWORD(keys[0]) = 0;
      LODWORD(values) = 0;
      CFNumberRef v6 = (const __CFNumber *)CFDictionaryGetValue(a3, @"LINKDOWN_IS_INVOL");
      CFNumberGetValue(v6, kCFNumberCharType, &value);
      CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a3, @"LINKDOWN_REASON_CODE");
      CFNumberGetValue(v7, kCFNumberSInt32Type, keys);
      CFNumberRef v8 = (const __CFNumber *)CFDictionaryGetValue(a3, @"LINKDOWN_SUBREASON_CODE");
      CFNumberGetValue(v8, kCFNumberSInt32Type, &values);
      +[WCM_Logging logLevel:5, @"WiFiS: WiFi linkdown: Invol=%d, Reason=%d, Subreason=%d", value, LODWORD(keys[0]), values message];
      if ((_BYTE)value) {
        [(WCM_WiFiDelegate *)self->super.mDelegate reportWiFiError];
      }
      [(WCM_WiFiDelegate *)self->super.mDelegate updateWiFiState:0 channel:0 centerFreq:0 bandwidth:0 hostAp:0];
    }
    else
    {
      [(WCM_WiFiServiceIOS *)self checkWiFiState];
    }
  }
  if (objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "iRATSupported"))
  {
    if (value_7)
    {
      +[WCM_Logging logLevel:18 message:@"WiFiS: send WiFi linkdown status to iRAT managers"];
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v9, "kWRM_WiFi_LINK_STATUS", value_7);
      *(_OWORD *)keys = *(_OWORD *)off_100211C68;
      xpc_object_t values = xpc_uint64_create(0x67uLL);
      xpc_object_t v24 = v9;
      xpc_object_t v10 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
      [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v10];
      [+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") updateControllerState:v10];
      [+[WRM_BWEvalManager WRM_BWEvalManagerSingleton](WRM_BWEvalManager, "WRM_BWEvalManagerSingleton") updateControllerState:v10];
      [+[WRM_FT_HandoverManager WRM_FT_HandoverManagerSingleton](WRM_FT_HandoverManager, "WRM_FT_HandoverManagerSingleton") updateControllerState:v10];
      self->mWiFiLinkUP = 0;
      xpc_release(values);
      xpc_release(v10);
      xpc_release(v9);
      return;
    }
    int value = 0;
    if (self->mWifiDevice)
    {
      uint64_t v11 = WiFiDeviceClientCopyCurrentNetwork();
      if (v11)
      {
        id v12 = (const void *)v11;
        CFNumberRef NetworkChannel = (const __CFNumber *)WiFiGetNetworkChannel();
        CFNumberGetValue(NetworkChannel, kCFNumberIntType, &value);
        if (WiFiNetworkGetProperty() || WiFiNetworkGetProperty() || WiFiNetworkGetProperty())
        {
          if (WiFiNetworkGetProperty())
          {
            if (WiFiNetworkGetProperty()) {
              CFNumberGetValue(NetworkChannel, kCFNumberIntType, &value);
            }
            Property = (void *)WiFiNetworkGetProperty();
            if (Property) {
              goto LABEL_20;
            }
            +[WCM_Logging logLevel:0 message:@"WiFiS: WiFi network has invalid SSID"];
          }
LABEL_32:
          CFRelease(v12);
          return;
        }
        Property = 0;
LABEL_20:
        int64_t valuePtr = 0xFFFFFDA8FFFFFDA8;
        CFNumberRef v15 = (const __CFNumber *)WiFiNetworkGetProperty();
        if (v15) {
          CFNumberGetValue(v15, kCFNumberIntType, (char *)&valuePtr + 4);
        }
        CFNumberRef v16 = (const __CFNumber *)WiFiNetworkGetProperty();
        if (v16) {
          CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
        }
        if ((valuePtr & 0x8000000000000000) == 0) {
          int64_t valuePtr = 0xFFFFFDA8FFFFFDA8;
        }
        self->mWiFiLinkUP = 1;
        +[WCM_Logging logLevel:3 message:@"WiFiS: send WiFi linkup status to Handover Manager"];
        xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v17, "kWRM_WiFi_LINK_STATUS", 0);
        xpc_dictionary_set_int64(v17, "kWRM_CONNECTED_CHANNEL_ID", value);
        xpc_dictionary_set_int64(v17, "kWRMM_WiFi_SNR", (int)valuePtr);
        xpc_dictionary_set_int64(v17, "kWRMM_WiFi_RSSI", SHIDWORD(valuePtr));
        if (Property) {
          xpc_dictionary_set_string(v17, "kWRM_CONNECTED_AP_SSID", (const char *)[Property UTF8String]);
        }
        v18 = (void *)WiFiNetworkGetProperty();
        if (v18) {
          xpc_dictionary_set_string(v17, "kWRM_CONNECTED_AP_BSSID", (const char *)[v18 UTF8String]);
        }
        *(_OWORD *)keys = *(_OWORD *)off_100211C68;
        xpc_object_t values = xpc_uint64_create(0x67uLL);
        xpc_object_t v24 = v17;
        xpc_object_t v19 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v19];
        [+[WRM_IDSLinkEvalManager WRM_IDSLinkEvalManagerSingleton](WRM_IDSLinkEvalManager, "WRM_IDSLinkEvalManagerSingleton") updateControllerState:v19];
        xpc_release(values);
        xpc_release(v19);
        xpc_release(v17);
        goto LABEL_32;
      }
    }
  }
}

- (void)notifyWiFiStateChange:(BOOL)a3
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "kWRM_is5G", a3);
  *(_OWORD *)keys = *(_OWORD *)off_100211C68;
  object[0] = xpc_uint64_create(0x6DuLL);
  object[1] = v4;
  xpc_object_t v5 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  [+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton") updateControllerState:v5];
  xpc_release(object[0]);
  xpc_release(v5);
  xpc_release(v4);
}

- (void)checkWiFiState
{
  unsigned int valuePtr = 0;
  if (self->mWifiDevice)
  {
    uint64_t v3 = WiFiDeviceClientCopyCurrentNetwork();
    if (v3)
    {
      xpc_object_t v4 = (const void *)v3;
      CFNumberRef Channel = (const __CFNumber *)WiFiNetworkGetChannel();
      if (!Channel
        || ((CFNumberGetValue(Channel, kCFNumberIntType, &valuePtr), (int OperatingBand = WiFiNetworkGetOperatingBand()) != 0)
          ? (BOOL v7 = valuePtr == 0)
          : (BOOL v7 = 1),
            v7))
      {
        uint64_t v8 = 0;
        uint64_t ChannelWidthInMHz = 0;
      }
      else
      {
        int v11 = OperatingBand;
        uint64_t ChannelWidthInMHz = WiFiNetworkGetChannelWidthInMHz();
        if (v11 == 2) {
          unsigned int v12 = 3;
        }
        else {
          unsigned int v12 = 4;
        }
        if (v11 == 1) {
          unsigned int v12 = 2;
        }
        self->mWifiBand = v12;
        if ([WCM_PolicyManager singleton].activeCoexFeatures.containsObject(@"WiFiEnhCoexSupport"))double v13 = sub_10008C254(valuePtr, ChannelWidthInMHz, self->mWifiBand); {
        else
        }
          double v13 = sub_10008C1B8(valuePtr);
        uint64_t v8 = v13;
        self->mBandwidthMHz = ChannelWidthInMHz;
      }
      mDelegate = self->super.mDelegate;
      if (mDelegate) {
        [(WCM_WiFiDelegate *)mDelegate updateWiFiState:self->mWifiBand channel:valuePtr centerFreq:v8 bandwidth:ChannelWidthInMHz hostAp:0];
      }
      CFRelease(v4);
      return;
    }
    CFStringRef v10 = @"WiFiS: not associated to network";
  }
  else
  {
    CFStringRef v10 = @"WiFiS: device not attached";
  }

  +[WCM_Logging logLevel:0 message:v10];
}

- (void)updateHostAPState:(BOOL)a3 channel:(unsigned int)a4
{
  BOOL v4 = a3;
  unsigned int v7 = a4;
  CFArrayRef theArray = 0;
  WiFiDeviceClientCopyHostedNetworks();
  [(WCM_WiFiService *)self updateCurrentHostAPState:v4 channel:v7 centerFreq:0 bandwidth:0 apState:1];
  [(WCM_WiFiServiceIOS *)self checkWiFiState];
}

- (void)forceCopresence:(BOOL)a3 scanGrantDuration:(unsigned int)a4
{
  if (self->super.mDelegate)
  {
    if (a3) {
      uint64_t v5 = 64;
    }
    else {
      uint64_t v5 = 0;
    }
    if (a3) {
      uint64_t v6 = a4;
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = 2;
    if (a3) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    if (!a3) {
      uint64_t v7 = 0;
    }
    +[WCM_Logging logLevel:2, @"Forcing Copresence=%d via priority=%d, bitmap=0x%X, and scanGrantDur=%d.", a3, v7, v5, v6 message];
    mDelegate = self->super.mDelegate;
    [(WCM_WiFiDelegate *)mDelegate updateCatsStateWrapper:v8 bitmap:v5 scanGrantDuration:v6];
  }
}

- (void)dispatchCarplayInfotoBT:(BOOL)a3 reason:(int)a4
{
  if (self->mWifiDevice)
  {
    if (self->super.mDelegate)
    {
      uint64_t v5 = *(void *)&a4;
      BOOL v6 = a3;
      +[WCM_Logging logLevel:2, @"WiFiS: dispatchCarplayInfotoBT Carplay state:(%d) , reason: (%d)", a3, *(void *)&a4 message];
      mDelegate = self->super.mDelegate;
      [(WCM_WiFiDelegate *)mDelegate updateCarPlaySessionState:v6 reason:v5];
      return;
    }
    CFStringRef v8 = @"WiFiS: dispatchCarplayInfotoBT failed no controller delegate";
    uint64_t v9 = 2;
  }
  else
  {
    CFStringRef v8 = @"WiFiS: device not attached";
    uint64_t v9 = 0;
  }

  +[WCM_Logging logLevel:v9 message:v8];
}

- (void)dispatchContentionFreeWiFiNetworkToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (self->mWifiDevice)
  {
    if (self->super.mDelegate)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"WiFiS: %s channel :(%d) , count: (%d)", "-[WCM_WiFiServiceIOS dispatchContentionFreeWiFiNetworkToRC2:count:]", *(void *)&a3, *(void *)&a4);
      mDelegate = self->super.mDelegate;
      [(WCM_WiFiDelegate *)mDelegate updateContentionFreeWiFiInfoToRC2:v5 count:v4];
    }
    else
    {
      +[WCM_Logging logLevel:3 message:@"WiFiS: dispatchContentionFreeWiFiNetworkToRC2 failed no controller delegate"];
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WiFiS: %s device not attached", "-[WCM_WiFiServiceIOS dispatchContentionFreeWiFiNetworkToRC2:count:]", *(void *)&a3, *(void *)&a4);
  }
}

- (void)performScan:(id)a3
{
  if (self->mWifiDevice)
  {
    +[NSMutableArray array];
    CFRunLoopGetCurrent();
    +[NSMutableDictionary dictionary];
    uint64_t v3 = WiFiDeviceClientScanAsync();
    if (CFRunLoopRunInMode((CFRunLoopMode)NSDefaultRunLoopMode, 120.0, 0) == kCFRunLoopRunTimedOut) {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"%s WiFiS: Runloop timed out", "-[WCM_WiFiServiceIOS performScan:]");
    }
    if (v3) {
      +[WCM_Logging logLevel:0, @"WiFiS: Async Scan returned error %d %d", v3, 0 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"%s WiFiS: device not attached", "-[WCM_WiFiServiceIOS performScan:]", v4);
  }
}

- (BOOL)deviceAssociatedOnPreferredNetwork
{
  int mWiFiPointOfInterest = self->mWiFiPointOfInterest;
  return mWiFiPointOfInterest
      && (mWiFiPointOfInterest != 3 || ![(WCM_WiFiServiceIOS *)self isWiFiNetworkCaptive]);
}

- (int)getPointOfInterest
{
  return self->mWiFiPointOfInterest;
}

- (BOOL)getAirplayStatus
{
  return self->mAWDLInProgress;
}

- (BOOL)getP2pRCU2CoexEventStatus
{
  return self->mP2pRCU2CoexEventInProgress;
}

- (BOOL)isCarPlaySessionInProgress
{
  return self->mCarPlaySessionInProgress;
}

- (int)getCarPlayScanRelaxReason
{
  return self->mCarPlayBTScanRelaxReason;
}

- (void)updateCarPlaySessionState:(BOOL)a3 reason:(int)a4
{
  self->mCarPlaySessionInProgress = a3;
  self->mCarPlayBTScanRelaxReason = a4;
}

- (void)updateContentionFreeWiFiInfoToRC2:(unsigned int)a3 count:(unsigned int)a4
{
  self->mLeastCongestedCFNumberRef Channel = a3;
  self->mLeastCongestedChannelCount = a4;
}

- (id)getLeastCongestedWifiParam
{
  +[WCM_Logging logLevel:0 message:@"WCM_WiFiService getLeastCongestedWifiParam"];
  id v3 = +[NSMutableArray array];
  [v3 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->mLeastCongestedChannel)]];
  [v3 addObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->mLeastCongestedChannelCount)];
  return v3;
}

- (void)setWiFiCallingState:(BOOL)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC1FC;
  block[3] = &unk_10020DE10;
  block[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  +[WCM_Logging logLevel:19, @"setWiFiCallingState called, mWifiManager: %x", self->mWifiManager message];
}

- (void)disableWiFi
{
  if (self->mWifiDevice)
  {
    uint64_t v2 = WiFiDeviceClientCopyCurrentNetwork();
    if (v2)
    {
      id v3 = (const void *)v2;
      +[WCM_Logging logLevel:19, @"DisableWiFi %@", WiFiNetworkGetSSID() message];
      WiFiManagerClientTemporarilyDisableNetwork();
      CFRelease(v3);
      if (WiFiManagerClientGetDevice())
      {
        uint64_t v4 = WiFiDeviceClientDisassociate();
        if (v4) {
          +[WCM_Logging logLevel:19, @"WiFiDeviceClientDisassociate failed: %d", v4 message];
        }
      }
      return;
    }
    CFStringRef v5 = @"returning from disableWiFi, network is NULL";
  }
  else
  {
    CFStringRef v5 = @"returning from disableWiFi, mWiFiDevice is NULL";
  }

  +[WCM_Logging logLevel:19 message:v5];
}

- (void)setMedtronicState:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000EC3B8;
  v3[3] = &unk_10020E678;
  int v4 = a3;
  v3[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (unsigned)getWiFiBW
{
  return self->mBandwidthMHz;
}

- (unsigned)getChannelType
{
  return self->mWifiBand;
}

- (BOOL)setWiFiBTCoexProfile:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  [(NSMutableDictionary *)v7 setObject:+[NSNumber numberWithInteger:a4] forKey:@"UCM_PROFILE_INDEX"];
  unsigned int v8 = [(WCM_WiFiServiceIOS *)self sendMessage:&off_10023DBF0 withValue:v7];
  if (v8) {
    +[WCM_Logging logLevel:0, @"WiFiS: failed to download profile to index %d with error(%s)\n%@", a4, Apple80211ErrToStr(), a3 message];
  }
  else {
    +[WCM_Logging logLevel:2, @"WiFiS: succeed to download profile to index %d\n%@", a4, v7, v10 message];
  }
  return v8 == 0;
}

- (void)setWiFiBTCoexActiveProfileFor2G:(int64_t)a3 and5G:(int64_t)a4
{
  uint64_t v5 = (unsigned __int16)a3 | ((unsigned __int16)a4 << 16);
  +[WCM_Logging logLevel:2, @"WiFiS: Set Active Profile index2G(%ld) and index5G(%ld)", a3, a4 message];
  BOOL v6 = +[NSNumber numberWithUnsignedInt:v5];

  [(WCM_WiFiServiceIOS *)self sendMessage:&off_10023DC08 withValue:v6];
}

- (void)bspUpdateBTStatus_powerState:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EC62C;
  block[3] = &unk_10020DD48;
  BOOL v8 = a3;
  int v6 = a4;
  int v7 = a5;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspBandSwitchRequest:(int)a3 targetBand:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000EC818;
  v4[3] = &unk_10020DB90;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)bspStatusRequest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECA0C;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspRegulatoryInfoRequest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECBB0;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspNanPhsStateRequest
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ECD54;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspSetCoexMode:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000ECF08;
  v8[3] = &unk_100211C10;
  BOOL v13 = a3;
  int v9 = a4;
  int v10 = a5;
  BOOL v14 = a7;
  int v11 = a6;
  int v12 = a8;
  v8[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

- (void)bspGetBandSwitchStatus
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED18C;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)bspGetChannelQualityInfo
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000ED364;
  block[3] = &unk_10020D980;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setCoexParams:(const char *)a3 withValue:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"%s: %s", "-[WCM_WiFiServiceIOS setCoexParams:withValue:]", a3);
  CFStringRef v7 = CFStringCreateWithCString(0, a3, 0x8000100u);

  [(WCM_WiFiServiceIOS *)self sendMessage:v7 withValue:a4];
}

@end