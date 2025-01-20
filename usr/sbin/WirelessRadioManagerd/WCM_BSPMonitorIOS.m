@interface WCM_BSPMonitorIOS
- (WCM_BSPMonitorIOS)init;
- (int)selectBandWithPreferredBands:(int)a3;
- (int)selectBand_preferred:(int)a3 prohibited:(int)a4;
- (void)ULLAModeTransition;
- (void)checkBTRegulatoryInfo;
- (void)dealloc;
- (void)didEnterBSPActiveState;
- (void)handleBTBandSwitchRequestEvent:(int)a3 targetBand:(int)a4;
- (void)handleBTRegulatoryInfoEvent:(id)a3 allowedBands:(int)a4;
- (void)handleBTStatusUpdateEvent:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5;
- (void)handleBandSwitchRejectEvent:(int)a3 btTargetBand:(int)a4;
- (void)handleBandSwitchStatusEvent:(BOOL)a3 btSubband:(int)a4 successCount:(unint64_t)a5 failCount:(unint64_t)a6;
- (void)handleBandSwitchStatusUpdatedEvent;
- (void)handleChannelQualityInfoEvent:(__CFDictionary *)a3;
- (void)handleChannelQualityInfoUpdatedEvent;
- (void)handleCoexModeFailEvent:(int)a3 btSubband:(int)a4;
- (void)handleRDCountryCodeChangedEvent;
- (void)handleShowUCMStatusEvent;
- (void)handleWiFiChannelQualityEvent:(int)a3 quality:(unint64_t)a4;
- (void)handleWiFiCountryCodeChangedEvent;
- (void)handleWiFiFrequencyBandForBTEvent:(int)a3;
- (void)handleWiFiRegulatoryInfoEvent:(unint64_t)a3;
- (void)handleWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4 isNanPhs:(BOOL)a5;
- (void)handleWiFiStatusUpdateEvent:(BOOL)a3;
- (void)initBTStatus;
- (void)initWiFiStatus;
- (void)printStatus:(const char *)a3;
- (void)printStatus:(const char *)a3 withLogLevel:(id)a4;
- (void)readRDCountryCode;
- (void)requestBTStatus;
- (void)sendBTStatusRequestToBT;
- (void)sendBTStatusToWiFi;
- (void)sendBandSwitchRejectToBT:(int)a3 targetBand:(int)a4;
- (void)sendBandSwitchRequestToWiFi:(int)a3 targetBand:(int)a4;
- (void)sendChannelQualityToBT:(int)a3 quality:(unint64_t)a4;
- (void)sendGetBandSwitchStatusToWiFi;
- (void)sendGetChannelQualityInfoToWiFi;
- (void)sendGetNanPhsStateToWiFi;
- (void)sendGetRegulatoryInfoToWiFi;
- (void)sendRegulatoryInfoRequestToBT;
- (void)sendSetCoexModeToWiFi:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8;
- (void)sendSetFrequencyBandToBT:(int)a3;
- (void)sendSetFrequencyBandToBT:(int)a3 forced:(BOOL)a4;
- (void)sendWiFiStatusToBT;
- (void)updateBSPState;
- (void)updateChannelQualityInfo:(WCMBSP_ChannelQualityInfo *)a3 bandCode:(int)a4 chqInfoDict:(__CFDictionary *)a5 ts:(double)a6;
- (void)updateFrequencyBandForBT;
- (void)willLeaveBSPActiveState;
@end

@implementation WCM_BSPMonitorIOS

- (WCM_BSPMonitorIOS)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCM_BSPMonitorIOS;
  v2 = [(WCM_BSPMonitor *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(WCM_BSPMonitorIOS *)v2 initWiFiStatus];
    [(WCM_BSPMonitorIOS *)v3 initBTStatus];
    v3->mBSPState = 0;
    v3->mLastGetBandSwitchStatusTs = 0.0;
    v3->mLastGetChannelQualityInfoTs = 0.0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100057F2C, kRegulatoryDomainUpdateNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(WCM_BSPMonitorIOS *)v3 readRDCountryCode];
  }
  +[WCM_Logging logLevel:2 message:@"BSPMonitor Init"];
  return v3;
}

- (void)dealloc
{
  +[WCM_Logging logLevel:2 message:@"BSPMonitor Dealloc"];
  v3.receiver = self;
  v3.super_class = (Class)WCM_BSPMonitorIOS;
  [(WCM_BSPMonitorIOS *)&v3 dealloc];
}

- (void)initWiFiStatus
{
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_Low.timestamp = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_High.quality = 0u;
  *(_OWORD *)&self->mWiFiStatus.powerState = 0u;
  *(_OWORD *)&self->mWiFiStatus.allowedBands = 0u;
  *(_OWORD *)&self->mWiFiStatus.frequencyBandForBTInfo.timestamp = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_2_4G.quality = 0u;
  *(_OWORD *)&self->mWiFiStatus.chqInfo_5G_Low.band = 0u;
  *(void *)&self->mWiFiStatus.coexMode = 0;
  self->mWiFiStatus.allowedBands = 19;
  self->mWiFiStatus.chqInfo_2_4G.quality = -1;
  self->mWiFiStatus.chqInfo_5G_Low.quality = -1;
  self->mWiFiStatus.chqInfo_5G_High.quality = -1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"%s", "-[WCM_BSPMonitorIOS initWiFiStatus]");
}

- (void)initBTStatus
{
  p_mBTStatus = &self->mBTStatus;
  countryCode = self->mBTStatus.countryCode;
  if (countryCode) {

  }
  *(_OWORD *)&p_mBTStatus->powerState = 0u;
  *(_OWORD *)&p_mBTStatus->countryCode = 0u;
  self->mBTConfig.targetBand = 0;
  p_mBTStatus->allowedBands = 1;
  p_mBTStatus->frequencyBand = -1;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"%s", "-[WCM_BSPMonitorIOS initBTStatus]");
}

- (void)printStatus:(const char *)a3 withLogLevel:(id)a4
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", a4, @"BSP(%s): mBSPState=%d, mCountryCode=%@, mCountryCodeTimeStampUnixSec=%lld, WiFi(pwrState=0x%x, state=%d, channel=%d, bandForBT=0x%x, allowedBands=0x%x), BT(debugMode=%d, pwrState=0x%x, curBand=0x%x, ullaMode=%d, countryCode=%@, allowedBands=0x%x, targetBand=0x%x)", a3, self->mBSPState, self->mCountryCode, self->mCountryCodeTimeStampUnixSec, self->mWiFiStatus.powerState, self->mWiFiStatus.wifiState, self->mWiFiStatus.wifiChannel, self->mWiFiStatus.frequencyBandForBTInfo.band, self->mWiFiStatus.allowedBands, self->mBTStatus.debugMode, self->mBTStatus.powerState, self->mBTStatus.frequencyBand, self->mBTStatus.ullaMode, self->mBTStatus.countryCode, self->mBTStatus.allowedBands,
    self->mBTConfig.targetBand);
}

- (void)printStatus:(const char *)a3
{
}

- (int)selectBand_preferred:(int)a3 prohibited:(int)a4
{
  if (!self->mWiFiStatus.powerState
    && (self->mBTStatus.allowedBands & 0x40) == 0
    && ((self->mBTStatus.allowedBands & 0x12) == 2 || (self->mBTStatus.allowedBands & 0x12) == 16))
  {
    return 1;
  }
  if (a3) {
    char v7 = a3;
  }
  else {
    char v7 = -1;
  }
  char v8 = self->mBTStatus.allowedBands & v7;
  if ((a4 & 0x40) == 0 && (v8 & 0x40) != 0) {
    return 64;
  }
  if ((a4 & 0x10) == 0 && (v8 & 0x10) != 0) {
    return 16;
  }
  if ((((a4 & 2) == 0) & ((v8 & 2) >> 1)) != 0) {
    return 2;
  }
  return 1;
}

- (int)selectBandWithPreferredBands:(int)a3
{
  return [(WCM_BSPMonitorIOS *)self selectBand_preferred:*(void *)&a3 prohibited:0];
}

- (void)readRDCountryCode
{
  objc_super v3 = &xpc_dictionary_get_BOOL_ptr;
  id v4 = +[RDEstimate currentEstimates];
  if (v4
    && (v5 = v4, [v4 count])
    && (long long v41 = 0u,
        long long v42 = 0u,
        long long v39 = 0u,
        long long v40 = 0u,
        (id v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16]) != 0))
  {
    id v7 = v6;
    v33 = self;
    char v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v40;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v13 = [v12 countryCode];
        if (v13)
        {
          id v14 = v13;
          if ([v13 length])
          {
            if (v8)
            {
              +[WCM_Logging logLevel:message:](WCM_Logging, @"%s: currentCountryCode count = %d, ignore %@", @"-[WCM_BSPMonitorIOS readRDCountryCode]", [v5 count], [v12 countryCode], v32);
            }
            else
            {
              char v8 = +[NSString stringWithFormat:@"%s%s%@", "CC", ":", v14];
              [objc_msgSend(v12, "timestamp") timeIntervalSince1970];
              int64_t v9 = (uint64_t)v15;
              +[WCM_Logging logLevel:message:](WCM_Logging, @"%s: currentCountryCode = %@, timestamp = %@, timeStampUnixTimeSec = %lld", @"-[WCM_BSPMonitorIOS readRDCountryCode]", [v12 countryCode], [v12 timestamp], (uint64_t)v15);
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v7);
    self = v33;
    objc_super v3 = &xpc_dictionary_get_BOOL_ptr;
    if (v8) {
      goto LABEL_37;
    }
  }
  else
  {
    int64_t v9 = 0;
  }
  id v16 = [v3[95] lastKnownEstimates];
  if (!v16) {
    goto LABEL_33;
  }
  v17 = v16;
  if (![v16 count]) {
    goto LABEL_33;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v18) {
    goto LABEL_33;
  }
  id v19 = v18;
  v34 = self;
  char v8 = 0;
  uint64_t v20 = *(void *)v36;
  do
  {
    for (j = 0; j != v19; j = (char *)j + 1)
    {
      if (*(void *)v36 != v20) {
        objc_enumerationMutation(v17);
      }
      v22 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
      id v23 = [v22 countryCode];
      if (v23)
      {
        id v24 = v23;
        if ([v23 length])
        {
          if (v8)
          {
            [WCM_Logging logLevel:2 message:@"%s: lastKnownCountryCode count = %d, ignore %@", @"-[WCM_BSPMonitorIOS readRDCountryCode]", [v17 count], [v22 countryCode], v32];
          }
          else
          {
            char v8 = +[NSString stringWithFormat:@"%s%s%@", "LKC", ":", v24];
            [objc_msgSend(v22, "timestamp") timeIntervalSince1970];
            int64_t v9 = (uint64_t)v25;
            [WCM_Logging logLevel:2 message:@"%s: lastKnownCountryCode = %@, timestamp = %@, timeStampUnixTimeSec = %lld", @"-[WCM_BSPMonitorIOS readRDCountryCode]", [v22 countryCode], [v22 timestamp], (uint64_t)v25];
          }
        }
      }
    }
    id v19 = [v17 countByEnumeratingWithState:&v35 objects:v43 count:16];
  }
  while (v19);
  self = v34;
  if (!v8)
  {
LABEL_33:
    v26 = (void *)MGCopyAnswer();
    if (!v26) {
      goto LABEL_51;
    }
    v27 = v26;
    if (![v26 length]) {
      goto LABEL_51;
    }
    char v8 = +[NSString stringWithFormat:@"%s%s%@", "RC", ":", v27];
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"%s: regionCode = %@", "-[WCM_BSPMonitorIOS readRDCountryCode]", v27);
    if (!v8) {
      goto LABEL_51;
    }
    int64_t v9 = 0;
  }
LABEL_37:
  if (![(NSString *)v8 length]
    || ![(NSString *)v8 hasPrefix:@"CC:"]
    && ![(NSString *)v8 hasPrefix:@"RC:"]
    && ![(NSString *)v8 hasPrefix:@"LKC:"])
  {
LABEL_51:
    self->mCountryCode = 0;
    self->mCountryCodeTimeStampUnixSec = 0;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"%s: invalid countryCode", "-[WCM_BSPMonitorIOS readRDCountryCode]", v30, v31);
    return;
  }
  mCountryCode = self->mCountryCode;
  if (!mCountryCode)
  {
LABEL_50:
    self->mCountryCode = v8;
    self->mCountryCodeTimeStampUnixSec = v9;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"%s final read RD country code: %@, mCountryCodeTimeStampUnixSec: %lld", "-[WCM_BSPMonitorIOS readRDCountryCode]", self->mCountryCode, v9);
    return;
  }
  if (![(NSString *)mCountryCode length]
    || ![(NSString *)self->mCountryCode hasPrefix:@"CC:"]
    && ![(NSString *)self->mCountryCode hasPrefix:@"RC:"]
    && ![(NSString *)self->mCountryCode hasPrefix:@"LKC:"]
    || ![(NSString *)self->mCountryCode isEqualToString:v8]
    || self->mCountryCodeTimeStampUnixSec != v9)
  {
    v29 = self->mCountryCode;
    if (v29) {

    }
    goto LABEL_50;
  }
}

- (void)sendSetFrequencyBandToBT:(int)a3 forced:(BOOL)a4
{
  if (a3 == 1 || self->mBTStatus.powerState)
  {
    self->mBTConfig.targetBand = a3;
    if (a4
      || (int frequencyBand = self->mBTStatus.frequencyBand, frequencyBand != a3)
      && (frequencyBand != -1 ? (BOOL v7 = self->mBSPState == 4) : (BOOL v7 = 1), !v7 && self->mBTStatus.countryCode))
    {
      id v5 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
      if (v5)
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCMBSP:%s sending new targetBand=0x%x to BT.", "-[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:forced:]", self->mBTConfig.targetBand);
        [v5 bspSetFrequencyBandToUse:];
      }
      else
      {
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendSetFrequencyBandToBT:forced:]");
      }
    }
  }
}

- (void)sendSetFrequencyBandToBT:(int)a3
{
}

- (void)sendWiFiStatusToBT
{
  if (self->mBTStatus.powerState)
  {
    id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
    if (v3)
    {
      BOOL powerState = self->mWiFiStatus.powerState;
      [v3 bspUpdateWiFiStatus:powerState];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendWiFiStatusToBT]");
    }
  }
}

- (void)sendChannelQualityToBT:(int)a3 quality:(unint64_t)a4
{
  if (self->mBTStatus.powerState)
  {
    uint64_t v5 = *(void *)&a3;
    id v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
    if (v6)
    {
      [v6 bspNotifyChannelQuality:v5 quality:a4];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendChannelQualityToBT:quality:]");
    }
  }
}

- (void)sendBTStatusRequestToBT
{
  id v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
  if (v2)
  {
    [v2 bspStatusRequest];
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendBTStatusRequestToBT]");
  }
}

- (void)sendBandSwitchRejectToBT:(int)a3 targetBand:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
  if (v6)
  {
    [v6 bspBandSwitchReject:v5 targetBand:v4];
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendBandSwitchRejectToBT:targetBand:]");
  }
}

- (void)sendRegulatoryInfoRequestToBT
{
  id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") btController];
  if (v3)
  {
    mCountryCode = self->mCountryCode;
    int64_t mCountryCodeTimeStampUnixSec = self->mCountryCodeTimeStampUnixSec;
    [v3 bspRegulatoryInfoRequest:mCountryCode timeStamp:mCountryCodeTimeStampUnixSec];
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s btController not available", "-[WCM_BSPMonitorIOS sendRegulatoryInfoRequestToBT]");
  }
}

- (void)checkBTRegulatoryInfo
{
  mCountryCode = self->mCountryCode;
  if (mCountryCode
    && [(NSString *)mCountryCode length]
    && ([(NSString *)self->mCountryCode hasPrefix:@"CC:"]
     || [(NSString *)self->mCountryCode hasPrefix:@"RC:"]
     || [(NSString *)self->mCountryCode hasPrefix:@"LKC:"])
    && ((countryCode = self->mBTStatus.countryCode) == 0
     || ![(NSString *)countryCode length]
     || ![(NSString *)self->mBTStatus.countryCode hasPrefix:@"CC:"]
     && ![(NSString *)self->mBTStatus.countryCode hasPrefix:@"RC:"]
     && ![(NSString *)self->mBTStatus.countryCode hasPrefix:@"LKC:"]
     || ![(NSString *)self->mCountryCode isEqualToString:self->mBTStatus.countryCode]))
  {
    [(WCM_BSPMonitorIOS *)self sendRegulatoryInfoRequestToBT];
  }
}

- (void)sendGetRegulatoryInfoToWiFi
{
  if (self->mWiFiStatus.powerState)
  {
    id v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v2)
    {
      [v2 bspRegulatoryInfoRequest];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendGetRegulatoryInfoToWiFi]");
    }
  }
}

- (void)sendGetNanPhsStateToWiFi
{
  if (self->mWiFiStatus.powerState)
  {
    id v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v2)
    {
      [v2 bspNanPhsStateRequest];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendGetNanPhsStateToWiFi]");
    }
  }
}

- (void)sendGetBandSwitchStatusToWiFi
{
  if (self->mWiFiStatus.powerState)
  {
    id v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v2)
    {
      [v2 bspGetBandSwitchStatus];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendGetBandSwitchStatusToWiFi]");
    }
  }
}

- (void)sendGetChannelQualityInfoToWiFi
{
  if (self->mWiFiStatus.powerState)
  {
    id v2 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v2)
    {
      [v2 bspGetChannelQualityInfo];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendGetChannelQualityInfoToWiFi]");
    }
  }
}

- (void)sendBTStatusToWiFi
{
  if (self->mWiFiStatus.powerState)
  {
    id v3 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v3)
    {
      BOOL powerState = self->mBTStatus.powerState;
      uint64_t frequencyBand = self->mBTStatus.frequencyBand;
      uint64_t ullaMode = self->mBTStatus.ullaMode;
      [v3 bspUpdateBTStatus_powerState:powerState frequencyBand:frequencyBand ullaMode:ullaMode];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendBTStatusToWiFi]");
    }
  }
}

- (void)sendBandSwitchRequestToWiFi:(int)a3 targetBand:(int)a4
{
  if (self->mWiFiStatus.powerState)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v5 = *(void *)&a3;
    id v6 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v6)
    {
      [v6 bspBandSwitchRequest:v5 targetBand:v4];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendBandSwitchRequestToWiFi:targetBand:]");
    }
  }
}

- (void)sendSetCoexModeToWiFi:(BOOL)a3 wifiSupportedBands:(int)a4 btCurrentBand:(int)a5 btSupportedBands:(int)a6 setTimeToTSTOnly:(BOOL)a7 timeToTST:(int)a8
{
  if (self->mWiFiStatus.powerState)
  {
    uint64_t v8 = *(void *)&a8;
    BOOL v9 = a7;
    uint64_t v10 = *(void *)&a6;
    uint64_t v11 = *(void *)&a5;
    uint64_t v12 = *(void *)&a4;
    BOOL v13 = a3;
    id v14 = [[+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton") wifiController];
    if (v14)
    {
      [v14 bspSetCoexMode:v13 wifiSupportedBands:v12 btCurrentBand:v11 btSupportedBands:v10 setTimeToTSTOnly:v9 timeToTST:v8];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, @"WCMBSP:%s wifiController not available", "-[WCM_BSPMonitorIOS sendSetCoexModeToWiFi:wifiSupportedBands:btCurrentBand:btSupportedBands:setTimeToTSTOnly:timeToTST:]");
    }
  }
}

- (void)updateFrequencyBandForBT
{
  int mBSPState = self->mBSPState;
  if (mBSPState)
  {
    if (mBSPState == 4) {
      return;
    }
    if (mBSPState != 2)
    {
      int allowedBands = self->mBTStatus.allowedBands;
      if ((allowedBands & 0x40) != 0)
      {
        uint64_t v7 = 64;
LABEL_19:
        uint64_t v8 = 0;
        goto LABEL_20;
      }
      int v6 = self->mWiFiStatus.allowedBands & 0x12;
      switch(v6)
      {
        case 18:
          if ((~allowedBands & 0x12) != 0)
          {
            uint64_t v7 = 0;
            uint64_t v8 = 18;
            goto LABEL_20;
          }
          if (self->mWiFiStatus.wifiState != 3) {
            goto LABEL_18;
          }
          unsigned int wifiChannel = self->mWiFiStatus.wifiChannel;
          if (wifiChannel - 32 <= 0x24) {
            goto LABEL_10;
          }
          if (wifiChannel == 163 || wifiChannel - 166 < 0xFFFFFFBA) {
            goto LABEL_18;
          }
          break;
        case 16:
          break;
        case 2:
LABEL_10:
          uint64_t v7 = 16;
          uint64_t v8 = 2;
LABEL_20:
          uint64_t v4 = [(WCM_BSPMonitorIOS *)self selectBand_preferred:v7 prohibited:v8];
          goto LABEL_21;
        default:
LABEL_18:
          uint64_t v7 = 0;
          goto LABEL_19;
      }
      uint64_t v7 = 2;
      uint64_t v8 = 16;
      goto LABEL_20;
    }
  }
  uint64_t v4 = [(WCM_BSPMonitorIOS *)self selectBandWithPreferredBands:0];
LABEL_21:

  [(WCM_BSPMonitorIOS *)self sendSetFrequencyBandToBT:v4];
}

- (void)didEnterBSPActiveState
{
  uint64_t allowedBands = self->mWiFiStatus.allowedBands;
  uint64_t frequencyBand = self->mBTStatus.frequencyBand;
  uint64_t v5 = [(WCM_BSPMonitor *)self getTimeToTSTForULLAMode:self->mBTStatus.ullaMode];

  [(WCM_BSPMonitorIOS *)self sendSetCoexModeToWiFi:1 wifiSupportedBands:allowedBands btCurrentBand:frequencyBand btSupportedBands:19 setTimeToTSTOnly:0 timeToTST:v5];
}

- (void)ULLAModeTransition
{
  uint64_t allowedBands = self->mWiFiStatus.allowedBands;
  uint64_t targetBand = self->mBTConfig.targetBand;
  uint64_t v5 = [(WCM_BSPMonitor *)self getTimeToTSTForULLAMode:self->mBTStatus.ullaMode];

  [(WCM_BSPMonitorIOS *)self sendSetCoexModeToWiFi:1 wifiSupportedBands:allowedBands btCurrentBand:targetBand btSupportedBands:19 setTimeToTSTOnly:1 timeToTST:v5];
}

- (void)willLeaveBSPActiveState
{
  uint64_t v3 = [(WCM_BSPMonitor *)self getTimeToTSTForULLAMode:0];

  [(WCM_BSPMonitorIOS *)self sendSetCoexModeToWiFi:0 wifiSupportedBands:0 btCurrentBand:0 btSupportedBands:0 setTimeToTSTOnly:0 timeToTST:v3];
}

- (void)updateBSPState
{
  int mBSPState = self->mBSPState;
  p_mBTStatus = &self->mBTStatus;
  if (self->mWiFiStatus.powerState)
  {
    if (self->mBTStatus.powerState)
    {
      if ((~self->mWiFiStatus.allowedBands & 0x12) == 0
        && (self->mBTStatus.allowedBands & 0x52) == 0x12
        && self->mBTStatus.ullaMode)
      {
        self->int mBSPState = 4;
        if (mBSPState == 4)
        {
          if (self->mBTStatus.ullaModeTransitioned)
          {
            [(WCM_BSPMonitorIOS *)self ULLAModeTransition];
            p_mBTStatus->ullaModeTransitioned = 0;
          }
        }
        else
        {
          [(WCM_BSPMonitorIOS *)self didEnterBSPActiveState];
        }
        return;
      }
      int v5 = 3;
    }
    else
    {
      int v5 = 1;
    }
  }
  else
  {
    int v5 = 2 * self->mBTStatus.powerState;
  }
  self->int mBSPState = v5;
  if (mBSPState == 4)
  {
    [(WCM_BSPMonitorIOS *)self willLeaveBSPActiveState];
    if (p_mBTStatus->powerState)
    {
      [(WCM_BSPMonitorIOS *)self requestBTStatus];
    }
    else
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCMBSP:%s Not sending requestBTStatus due to Durant powered off.", "-[WCM_BSPMonitorIOS updateBSPState]");
    }
  }
}

- (void)handleWiFiStatusUpdateEvent:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100059598;
  v3[3] = &unk_10020DE10;
  BOOL v4 = a3;
  v3[4] = self;
  sub_100059510((uint64_t)v3);
}

- (void)handleWiFiFrequencyBandForBTEvent:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000597A4;
  v3[3] = &unk_10020E678;
  int v4 = a3;
  v3[4] = self;
  sub_100059510((uint64_t)v3);
}

- (void)handleWiFiChannelQualityEvent:(int)a3 quality:(unint64_t)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059940;
  v4[3] = &unk_10020DED8;
  int v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  sub_100059510((uint64_t)v4);
}

- (void)handleWiFiRegulatoryInfoEvent:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100059B88;
  v3[3] = &unk_10020DB90;
  v3[4] = self;
  void v3[5] = a3;
  sub_100059510((uint64_t)v3);
}

- (void)handleWiFiStateEvent:(int)a3 wifiChannel:(unsigned int)a4 isNanPhs:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100059CF0;
  v5[3] = &unk_10020DD48;
  int v6 = a3;
  unsigned int v7 = a4;
  BOOL v8 = a5;
  v5[4] = self;
  sub_100059510((uint64_t)v5);
}

- (void)handleWiFiCountryCodeChangedEvent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100059ED0;
  v2[3] = &unk_10020D980;
  v2[4] = self;
  sub_100059510((uint64_t)v2);
}

- (void)handleBandSwitchStatusUpdatedEvent
{
  +[NSDate timeIntervalSinceReferenceDate];
  double mLastGetBandSwitchStatusTs = self->mLastGetBandSwitchStatusTs;
  if (v3 >= mLastGetBandSwitchStatusTs + 1.0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (unint64_t)((mLastGetBandSwitchStatusTs - v3 + 1.0) * 1000.0);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A0F8;
  v6[3] = &unk_10020D980;
  v6[4] = self;
  sub_100059FE8(v5, (uint64_t)v6);
}

- (void)handleChannelQualityInfoUpdatedEvent
{
  +[NSDate timeIntervalSinceReferenceDate];
  double mLastGetChannelQualityInfoTs = self->mLastGetChannelQualityInfoTs;
  if (v3 >= mLastGetChannelQualityInfoTs + 1.0) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = (unint64_t)((mLastGetChannelQualityInfoTs - v3 + 1.0) * 1000.0);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A220;
  v6[3] = &unk_10020D980;
  v6[4] = self;
  sub_100059FE8(v5, (uint64_t)v6);
}

- (void)handleBandSwitchStatusEvent:(BOOL)a3 btSubband:(int)a4 successCount:(unint64_t)a5 failCount:(unint64_t)a6
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005A308;
  v6[3] = &unk_10020E6A0;
  BOOL v8 = a3;
  int v7 = a4;
  void v6[5] = a5;
  v6[6] = a6;
  v6[4] = self;
  sub_100059510((uint64_t)v6);
}

- (void)updateChannelQualityInfo:(WCMBSP_ChannelQualityInfo *)a3 bandCode:(int)a4 chqInfoDict:(__CFDictionary *)a5 ts:(double)a6
{
  uint64_t v8 = *(void *)&a4;
  CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%lu", a4);
  if (v10)
  {
    CFStringRef v11 = v10;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, v10);
    if (Value)
    {
      CFDictionaryRef v13 = Value;
      unint64_t v20 = 0;
      unint64_t valuePtr = 0;
      CFNumberRef v14 = (const __CFNumber *)CFDictionaryGetValue(Value, @"BSP_ChqAgeMs");
      CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v13, @"BSP_ChqHealth");
      if (v14) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        CFNumberRef v17 = v15;
        CFNumberGetValue(v14, kCFNumberLongLongType, &valuePtr);
        CFNumberGetValue(v17, kCFNumberLongLongType, &v20);
        unint64_t v18 = v20;
        unint64_t v19 = valuePtr;
        a3->quality = v20;
        a3->timestamp = a6 + (double)v19 / -1000.0;
        +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, @"WCMBSP:%s bandCode:%d, quality:0x%llx age:%llums", "-[WCM_BSPMonitorIOS updateChannelQualityInfo:bandCode:chqInfoDict:ts:]", v8, v18, v19);
      }
    }
    CFRelease(v11);
  }
}

- (void)handleChannelQualityInfoEvent:(__CFDictionary *)a3
{
  CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, a3);
  if (Copy)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10005A54C;
    v5[3] = &unk_10020DB90;
    v5[4] = self;
    void v5[5] = Copy;
    sub_100059510((uint64_t)v5);
  }
}

- (void)handleCoexModeFailEvent:(int)a3 btSubband:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005A654;
  v4[3] = &unk_10020DB90;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  sub_100059510((uint64_t)v4);
}

- (void)handleBandSwitchRejectEvent:(int)a3 btTargetBand:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005A824;
  v4[3] = &unk_10020DB90;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  sub_100059510((uint64_t)v4);
}

- (void)requestBTStatus
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005A8FC;
  v2[3] = &unk_10020D980;
  v2[4] = self;
  sub_100059510((uint64_t)v2);
}

- (void)handleShowUCMStatusEvent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005A9C8;
  v2[3] = &unk_10020D980;
  v2[4] = self;
  sub_100059510((uint64_t)v2);
}

- (void)handleBTStatusUpdateEvent:(BOOL)a3 frequencyBand:(int)a4 ullaMode:(int)a5
{
  if ((a5 & 0x100) != 0)
  {
    BOOL v5 = 1;
LABEL_7:
    a5 &= 0xFFFF00FF;
    self->mBTStatus.debugMode = v5;
    goto LABEL_8;
  }
  if ((a5 & 0x200) != 0)
  {
    BOOL v5 = 0;
    goto LABEL_7;
  }
  if (self->mBTStatus.debugMode)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"WCMBSP:%s Ignored [powerState=0x%x, band=0x%x, ullaMode=%d]", "-[WCM_BSPMonitorIOS handleBTStatusUpdateEvent:frequencyBand:ullaMode:]", a3, *(void *)&a4, *(void *)&a5);
    return;
  }
LABEL_8:
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005AB7C;
  v6[3] = &unk_10020DD48;
  v6[4] = self;
  int v7 = a4;
  int v8 = a5;
  BOOL v9 = a3;
  sub_100059510((uint64_t)v6);
}

- (void)handleBTBandSwitchRequestEvent:(int)a3 targetBand:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005AE48;
  v4[3] = &unk_10020DB90;
  int v5 = a3;
  int v6 = a4;
  v4[4] = self;
  sub_100059510((uint64_t)v4);
}

- (void)handleBTRegulatoryInfoEvent:(id)a3 allowedBands:(int)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10005AFF8;
  v4[3] = &unk_10020E048;
  int v5 = a4;
  v4[4] = a3;
  void v4[5] = self;
  sub_100059510((uint64_t)v4);
}

- (void)handleRDCountryCodeChangedEvent
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005B284;
  v2[3] = &unk_10020D980;
  v2[4] = self;
  sub_100059510((uint64_t)v2);
}

@end