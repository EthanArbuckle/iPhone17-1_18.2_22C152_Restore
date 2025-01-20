@interface BTSmartRoutingWxDevice
- (BOOL)connected;
- (BOOL)firstBannerShown;
- (BOOL)hasOwnership;
- (BOOL)hfpSetupFailureNotifyRegistered;
- (BOOL)ignoreManualConnect;
- (BOOL)inEar;
- (BOOL)inEarDisabled;
- (BOOL)isRoutingActionInitialized;
- (BOOL)isTipiHealingV2Eligible;
- (BOOL)lastPlay;
- (BOOL)manualRouteChangeInProgress;
- (BOOL)manuallyRouted;
- (BOOL)otherTipiDeviceIsStreamingAudio;
- (BOOL)otherTipiDeviceIsWatch;
- (BOOL)otherTipiDeviceLastPlay;
- (BOOL)ownershipMonitorRegistered;
- (BOOL)proactiveRoutingBackoff;
- (BOOL)routed;
- (BOOL)tipiHealingBackoff;
- (BOOL)tipitableUpdated;
- (BTAudioRoutingRequest)audioRoutingRequest;
- (BTAudioSession)audioSessionInProgress;
- (NSMutableDictionary)audioSessionMap;
- (NSNumber)otherTipiDeviceVersion;
- (NSString)conduitDeviceID;
- (NSString)deviceAddress;
- (NSString)deviceName;
- (NSString)deviceVersion;
- (NSString)identifier;
- (NSString)otherTipiDeviceBTAddress;
- (NSString)otherTipiDeviceBTName;
- (NSString)otherTipiDevicePlayingApp;
- (OS_dispatch_source)conduitMessageTimer;
- (double)lowestBudBatteryInfo;
- (id)audioRoutingResponse;
- (id)audioSessionInProgressResponse;
- (int)audioRoutingScore;
- (int)otherTipiDeviceAudioScore;
- (int)routingAction;
- (int)routingUI;
- (int64_t)otherTipiDeviceMajorBuildVersion;
- (int64_t)otherTipiDeviceMinorBuildVersion;
- (unint64_t)conduitMessageTicks;
- (unint64_t)hijackBackoffTicks;
- (unint64_t)otherTipiDeviceIdleTick;
- (unint64_t)otherTipiManuallyRouteTicks;
- (unsigned)audioRoutingClientID;
- (unsigned)otherTipiAudioCategory;
- (unsigned)productID;
- (unsigned)tipiAndRoutedState;
- (void)_setFirstBannerShown:(BOOL)a3;
- (void)_setHijackBackoffTick:(unint64_t)a3;
- (void)_setManualRoute:(BOOL)a3;
- (void)_setManualRouteChangeInProgress:(BOOL)a3;
- (void)_setOtherTipiAudioCategory:(unsigned int)a3;
- (void)_setOtherTipiDeviceBuildVersion:(int64_t)a3 andMinorBuildVersion:(int64_t)a4;
- (void)_setOtherTipiDeviceInfo:(id)a3 andName:(id)a4 andVersion:(id)a5;
- (void)_setOtherTipiDeviceIsStreamingAudio:(BOOL)a3;
- (void)_setOtherTipiDeviceIsWatch:(BOOL)a3;
- (void)_setOtherTipiManuallyRouteTick:(unint64_t)a3;
- (void)_setOtherTipiPlayingApp:(id)a3;
- (void)_setOwnership:(BOOL)a3;
- (void)_setRoutedState:(BOOL)a3;
- (void)_setRoutingAction:(int)a3;
- (void)_setRoutingInitialized:(BOOL)a3;
- (void)_setRoutingUI:(int)a3;
- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3;
- (void)setAudioRoutingClientID:(unsigned int)a3;
- (void)setAudioRoutingRequest:(id)a3;
- (void)setAudioRoutingResponse:(id)a3;
- (void)setAudioRoutingScore:(int)a3;
- (void)setAudioSessionInProgress:(id)a3;
- (void)setAudioSessionInProgressResponse:(id)a3;
- (void)setAudioSessionMap:(id)a3;
- (void)setConduitDeviceID:(id)a3;
- (void)setConduitMessageTicks:(unint64_t)a3;
- (void)setConduitMessageTimer:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceVersion:(id)a3;
- (void)setHfpSetupFailureNotifyRegistered:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreManualConnect:(BOOL)a3;
- (void)setInEar:(BOOL)a3;
- (void)setInEarDisabled:(BOOL)a3;
- (void)setIsTipiHealingV2Eligible:(BOOL)a3;
- (void)setLastPlay:(BOOL)a3;
- (void)setLowestBudBatteryInfo:(double)a3;
- (void)setOtherTipiDeviceAudioScore:(int)a3;
- (void)setOtherTipiDeviceIdleTick:(unint64_t)a3;
- (void)setOtherTipiDeviceIsWatch:(BOOL)a3;
- (void)setOtherTipiDeviceLastPlay:(BOOL)a3;
- (void)setOtherTipiDevicePlayingApp:(id)a3;
- (void)setOwnershipMonitorRegistered:(BOOL)a3;
- (void)setProactiveRoutingBackoff:(BOOL)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setTipiHealingBackoff:(BOOL)a3;
- (void)setTipitableUpdated:(BOOL)a3;
@end

@implementation BTSmartRoutingWxDevice

- (void)_setFirstBannerShown:(BOOL)a3
{
  if (self->firstBannerShown != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->firstBannerShown = a3;
  }
}

- (void)_setHijackBackoffTick:(unint64_t)a3
{
  if (self->hijackBackoffTicks != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->hijackBackoffTicks = a3;
  }
}

- (void)_setManualRoute:(BOOL)a3
{
  if (self->manuallyRouted != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->manuallyRouted = a3;
  }
}

- (void)_setManualRouteChangeInProgress:(BOOL)a3
{
  if (self->manualRouteChangeInProgress != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->manualRouteChangeInProgress = a3;
  }
}

- (void)_setOtherTipiAudioCategory:(unsigned int)a3
{
  if (self->otherTipiAudioCategory != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->otherTipiAudioCategory = a3;
  }
}

- (void)_setOtherTipiPlayingApp:(id)a3
{
  id v7 = a3;
  BOOL v5 = [(NSString *)self->otherTipiDevicePlayingApp isEqualToString:v7];
  id v6 = v7;
  if (!v5)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, a3);
    id v6 = v7;
  }

  _objc_release_x1(v5, v6);
}

- (void)_setOtherTipiDeviceInfo:(id)a3 andName:(id)a4 andVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  unint64_t v12 = (unint64_t)v9;
  otherTipiDeviceBTAddress = self->otherTipiDeviceBTAddress;
  id v25 = (id)v12;
  if (!(v12 | (unint64_t)otherTipiDeviceBTAddress)) {
    goto LABEL_9;
  }
  unsigned __int8 v14 = [(NSString *)otherTipiDeviceBTAddress isEqualToString:v12];
  id v15 = v25;
  if ((v14 & 1) == 0)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v23 = v10;
      id v24 = v11;
      v21 = self->otherTipiDeviceBTAddress;
      id v22 = v25;
      deviceAddress = self->deviceAddress;
      LogPrintF();
    }
    objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, a3);
    objc_storeStrong((id *)&self->otherTipiDeviceBTName, a4);
    objc_storeStrong((id *)&self->otherTipiDeviceVersion, a5);
    id v15 = v25;
  }
  if (!v15) {
LABEL_9:
  }
    self->otherTipiAudioCategory = 0;
  unsigned int tipiAndRoutedState = self->tipiAndRoutedState;
  if (self->otherTipiDeviceBTAddress)
  {
    if (self->otherTipiDeviceIsWatch) {
      int v17 = 3;
    }
    else {
      int v17 = 1;
    }
    uint64_t v18 = v17 | tipiAndRoutedState;
  }
  else
  {
    uint64_t v18 = tipiAndRoutedState & 0xFFFFFFFC;
  }
  v19 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  [v19 _setTipiAndRoutedStateFlags:v18 forDevice:self];
}

- (void)_setOtherTipiDeviceIsStreamingAudio:(BOOL)a3
{
  if (self->otherTipiDeviceIsStreamingAudio != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->otherTipiDeviceIsStreamingAudio = a3;
  }
}

- (void)_setOtherTipiDeviceIsWatch:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
  if (otherTipiDeviceIsWatch == a3) {
    goto LABEL_12;
  }
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 != -1)
    {
LABEL_4:
      id v6 = "yes";
      if (otherTipiDeviceIsWatch) {
        id v7 = "yes";
      }
      else {
        id v7 = "no";
      }
      if (!v3) {
        id v6 = "no";
      }
      id v10 = v7;
      id v11 = v6;
      LogPrintF();
      goto LABEL_11;
    }
    if (_LogCategory_Initialize())
    {
      BOOL otherTipiDeviceIsWatch = self->otherTipiDeviceIsWatch;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->BOOL otherTipiDeviceIsWatch = v3;
LABEL_12:
  if (v3) {
    int v8 = 2;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = v8 | self->tipiAndRoutedState & 0xFFFFFFFD;
  id v12 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  [v12 _setTipiAndRoutedStateFlags:v9 forDevice:self];
}

- (void)_setOtherTipiDeviceBuildVersion:(int64_t)a3 andMinorBuildVersion:(int64_t)a4
{
  if (*(_OWORD *)&self->otherTipiDeviceMajorBuildVersion != __PAIR128__(a4, a3))
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->otherTipiDeviceMajorBuildVersion = a3;
    self->otherTipiDeviceMinorBuildVersion = a4;
  }
}

- (void)_setOtherTipiManuallyRouteTick:(unint64_t)a3
{
  if (self->otherTipiManuallyRouteTicks != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->otherTipiManuallyRouteTicks = a3;
  }
}

- (void)_setOwnership:(BOOL)a3
{
  if (self->hasOwnership != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->hasOwnership = a3;
    if (!a3)
    {
      id v5 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
      [v5 _setConnectedBannerTick:0];
    }
  }
}

- (void)_setRoutedState:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL routed = self->routed;
  if (routed == a3) {
    goto LABEL_12;
  }
  if (dword_1002610B8 <= 30)
  {
    if (dword_1002610B8 != -1)
    {
LABEL_4:
      id v6 = "yes";
      if (routed) {
        id v7 = "yes";
      }
      else {
        id v7 = "no";
      }
      if (!v3) {
        id v6 = "no";
      }
      id v11 = v7;
      id v12 = v6;
      deviceAddress = self->deviceAddress;
      LogPrintF();
      goto LABEL_11;
    }
    if (_LogCategory_Initialize())
    {
      BOOL routed = self->routed;
      goto LABEL_4;
    }
  }
LABEL_11:
  self->BOOL routed = v3;
LABEL_12:
  if (v3) {
    int v8 = 4;
  }
  else {
    int v8 = 0;
  }
  uint64_t v9 = v8 | self->tipiAndRoutedState & 0xFFFFFFFB;
  id v13 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  [v13 _setTipiAndRoutedStateFlags:v9 forDevice:self];
}

- (void)_setRoutingInitialized:(BOOL)a3
{
  if (self->isRoutingActionInitialized != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->isRoutingActionInitialized = a3;
  }
}

- (void)_setRoutingAction:(int)a3
{
  if (self->routingAction != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->routingAction = a3;
  }
}

- (void)_setRoutingUI:(int)a3
{
  if (self->routingUI != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->routingUI = a3;
  }
}

- (void)_setTipiAndRoutedStateFlags:(unsigned int)a3
{
  if (self->tipiAndRoutedState != a3)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintFlags32();
      id v6 = CUPrintFlags32();
      LogPrintF();
    }
    self->unsigned int tipiAndRoutedState = a3;
  }
}

- (NSString)deviceAddress
{
  return self->deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (BOOL)firstBannerShown
{
  return self->firstBannerShown;
}

- (unint64_t)hijackBackoffTicks
{
  return self->hijackBackoffTicks;
}

- (BOOL)hasOwnership
{
  return self->hasOwnership;
}

- (BOOL)isRoutingActionInitialized
{
  return self->isRoutingActionInitialized;
}

- (BOOL)manuallyRouted
{
  return self->manuallyRouted;
}

- (BOOL)manualRouteChangeInProgress
{
  return self->manualRouteChangeInProgress;
}

- (unsigned)otherTipiAudioCategory
{
  return self->otherTipiAudioCategory;
}

- (NSString)otherTipiDeviceBTAddress
{
  return self->otherTipiDeviceBTAddress;
}

- (NSString)otherTipiDeviceBTName
{
  return self->otherTipiDeviceBTName;
}

- (BOOL)otherTipiDeviceIsWatch
{
  return self->otherTipiDeviceIsWatch;
}

- (void)setOtherTipiDeviceIsWatch:(BOOL)a3
{
  self->BOOL otherTipiDeviceIsWatch = a3;
}

- (BOOL)otherTipiDeviceIsStreamingAudio
{
  return self->otherTipiDeviceIsStreamingAudio;
}

- (int64_t)otherTipiDeviceMajorBuildVersion
{
  return self->otherTipiDeviceMajorBuildVersion;
}

- (int64_t)otherTipiDeviceMinorBuildVersion
{
  return self->otherTipiDeviceMinorBuildVersion;
}

- (NSString)otherTipiDevicePlayingApp
{
  return self->otherTipiDevicePlayingApp;
}

- (void)setOtherTipiDevicePlayingApp:(id)a3
{
}

- (NSNumber)otherTipiDeviceVersion
{
  return self->otherTipiDeviceVersion;
}

- (unint64_t)otherTipiManuallyRouteTicks
{
  return self->otherTipiManuallyRouteTicks;
}

- (BOOL)routed
{
  return self->routed;
}

- (int)routingAction
{
  return self->routingAction;
}

- (int)routingUI
{
  return self->routingUI;
}

- (unsigned)tipiAndRoutedState
{
  return self->tipiAndRoutedState;
}

- (id)audioRoutingResponse
{
  return self->_audioRoutingResponse;
}

- (void)setAudioRoutingResponse:(id)a3
{
}

- (BTAudioRoutingRequest)audioRoutingRequest
{
  return self->_audioRoutingRequest;
}

- (void)setAudioRoutingRequest:(id)a3
{
}

- (unsigned)audioRoutingClientID
{
  return self->_audioRoutingClientID;
}

- (void)setAudioRoutingClientID:(unsigned int)a3
{
  self->_audioRoutingClientID = a3;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (void)setAudioRoutingScore:(int)a3
{
  self->_audioRoutingScore = a3;
}

- (BTAudioSession)audioSessionInProgress
{
  return self->_audioSessionInProgress;
}

- (void)setAudioSessionInProgress:(id)a3
{
}

- (id)audioSessionInProgressResponse
{
  return self->_audioSessionInProgressResponse;
}

- (void)setAudioSessionInProgressResponse:(id)a3
{
}

- (NSMutableDictionary)audioSessionMap
{
  return self->_audioSessionMap;
}

- (void)setAudioSessionMap:(id)a3
{
}

- (NSString)conduitDeviceID
{
  return self->_conduitDeviceID;
}

- (void)setConduitDeviceID:(id)a3
{
}

- (unint64_t)conduitMessageTicks
{
  return self->_conduitMessageTicks;
}

- (void)setConduitMessageTicks:(unint64_t)a3
{
  self->_conduitMessageTicks = a3;
}

- (OS_dispatch_source)conduitMessageTimer
{
  return self->_conduitMessageTimer;
}

- (void)setConduitMessageTimer:(id)a3
{
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceVersion
{
  return self->_deviceVersion;
}

- (void)setDeviceVersion:(id)a3
{
}

- (BOOL)hfpSetupFailureNotifyRegistered
{
  return self->_hfpSetupFailureNotifyRegistered;
}

- (void)setHfpSetupFailureNotifyRegistered:(BOOL)a3
{
  self->_hfpSetupFailureNotifyRegistered = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)ignoreManualConnect
{
  return self->_ignoreManualConnect;
}

- (void)setIgnoreManualConnect:(BOOL)a3
{
  self->_ignoreManualConnect = a3;
}

- (BOOL)inEar
{
  return self->_inEar;
}

- (void)setInEar:(BOOL)a3
{
  self->_inEar = a3;
}

- (BOOL)inEarDisabled
{
  return self->_inEarDisabled;
}

- (void)setInEarDisabled:(BOOL)a3
{
  self->_inEarDisabled = a3;
}

- (BOOL)isTipiHealingV2Eligible
{
  return self->_isTipiHealingV2Eligible;
}

- (void)setIsTipiHealingV2Eligible:(BOOL)a3
{
  self->_isTipiHealingV2Eligible = a3;
}

- (BOOL)lastPlay
{
  return self->_lastPlay;
}

- (void)setLastPlay:(BOOL)a3
{
  self->_lastPlay = a3;
}

- (double)lowestBudBatteryInfo
{
  return self->_lowestBudBatteryInfo;
}

- (void)setLowestBudBatteryInfo:(double)a3
{
  self->_lowestBudBatteryInfo = a3;
}

- (int)otherTipiDeviceAudioScore
{
  return self->_otherTipiDeviceAudioScore;
}

- (void)setOtherTipiDeviceAudioScore:(int)a3
{
  self->_otherTipiDeviceAudioScore = a3;
}

- (unint64_t)otherTipiDeviceIdleTick
{
  return self->_otherTipiDeviceIdleTick;
}

- (void)setOtherTipiDeviceIdleTick:(unint64_t)a3
{
  self->_otherTipiDeviceIdleTick = a3;
}

- (BOOL)otherTipiDeviceLastPlay
{
  return self->_otherTipiDeviceLastPlay;
}

- (void)setOtherTipiDeviceLastPlay:(BOOL)a3
{
  self->_otherTipiDeviceLastPlay = a3;
}

- (BOOL)ownershipMonitorRegistered
{
  return self->_ownershipMonitorRegistered;
}

- (void)setOwnershipMonitorRegistered:(BOOL)a3
{
  self->_ownershipMonitorRegistered = a3;
}

- (BOOL)proactiveRoutingBackoff
{
  return self->_proactiveRoutingBackoff;
}

- (void)setProactiveRoutingBackoff:(BOOL)a3
{
  self->_proactiveRoutingBackoff = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (BOOL)tipiHealingBackoff
{
  return self->_tipiHealingBackoff;
}

- (void)setTipiHealingBackoff:(BOOL)a3
{
  self->_tipiHealingBackoff = a3;
}

- (BOOL)tipitableUpdated
{
  return self->_tipitableUpdated;
}

- (void)setTipitableUpdated:(BOOL)a3
{
  self->_tipitableUpdated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_conduitMessageTimer, 0);
  objc_storeStrong((id *)&self->_conduitDeviceID, 0);
  objc_storeStrong((id *)&self->_audioSessionMap, 0);
  objc_storeStrong(&self->_audioSessionInProgressResponse, 0);
  objc_storeStrong((id *)&self->_audioSessionInProgress, 0);
  objc_storeStrong((id *)&self->_audioRoutingRequest, 0);
  objc_storeStrong(&self->_audioRoutingResponse, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceVersion, 0);
  objc_storeStrong((id *)&self->otherTipiDevicePlayingApp, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTName, 0);
  objc_storeStrong((id *)&self->otherTipiDeviceBTAddress, 0);

  objc_storeStrong((id *)&self->deviceAddress, 0);
}

@end