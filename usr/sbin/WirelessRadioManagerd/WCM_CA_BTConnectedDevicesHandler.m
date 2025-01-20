@interface WCM_CA_BTConnectedDevicesHandler
- (BOOL)isAnyDeviceConnected;
- (WCM_CA_BTConnectedDevicesHandler)init;
- (id)getProfileName:(int64_t)a3;
- (void)dealloc;
- (void)disableCoexStatsMetricsAt:(double)a3;
- (void)enableCoexStatsMetrics:(int64_t)a3 at:(double)a4;
- (void)resetBTCoexStatsMetrics;
- (void)submitEvent:(id)a3;
- (void)updateBTCoexConnectedDevices:(WCM_BTConnections *)a3 at:(double)a4;
- (void)updateBTCoexStats_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10 activeProfileFor2G:(int64_t)a11 btPowerState:(BOOL)a12 at:(double)a13;
- (void)updateBTCoexWiFiState:(int)a3 wifiChannel:(unsigned int)a4 at:(double)a5;
@end

@implementation WCM_CA_BTConnectedDevicesHandler

- (WCM_CA_BTConnectedDevicesHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)WCM_CA_BTConnectedDevicesHandler;
  v2 = [(WCM_CA_BTConnectedDevicesHandler *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->mWiFiState = 0;
    v2->mConnectedDevicesMetricsArray = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mBTCoexStatsMetrics.isActive = 0;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WCM_CA_BTConnectedDevicesHandler;
  [(WCM_CA_BTConnectedDevicesHandler *)&v3 dealloc];
}

- (void)resetBTCoexStatsMetrics
{
  self->mBTCoexStatsMetrics.btrssiCoexAccum = 0;
  *(_OWORD *)&self->mBTCoexStatsMetrics.btDurAirMs = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.btrssiValidCnt = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.hybridCnt = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.totDurMs = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.isActive = 0u;
  *(_OWORD *)&self->mBTCoexStatsMetrics.profileIndex = 0u;
  self->mBTCoexStatsMetrics.isActive = 0;
}

- (BOOL)isAnyDeviceConnected
{
  return [(NSMutableArray *)self->mConnectedDevicesMetricsArray count] != 0;
}

- (id)getProfileName:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 0xE) {
    CFStringRef v3 = @"Other";
  }
  else {
    CFStringRef v3 = (const __CFString *)*((void *)&off_10020FBD0 + a3 + 1);
  }
  return +[NSString stringWithFormat:@"%@_2.4G", v3];
}

- (void)submitEvent:(id)a3
{
  id v4 = [a3 getEnumerationString];
  [a3 getDuration];
  unint64_t v6 = (unint64_t)v5;
  [a3 getDurationInWiFi2G];
  if (v6 < 0x1F)
  {
    +[WCM_Logging logLevel:2, @"[BTCoexCA] Ignore CA event: BT_ConnectedDevices, (%@) duration is too short, %llu seconds", v4, v6 message];
  }
  else
  {
    CFStringRef v8 = &stru_100226328;
    if (v6 > 0x77) {
      CFStringRef v8 = @"s";
    }
    +[WCM_Logging logLevel:2, @"[BTCoexCA] Submit CA event: BT_ConnectedDevices, (%@) for %llu minute%@, %llu %% in WiFi 2G band", v4, v6 / 0x3C, v8, 100 * (unint64_t)v7 / v6 message];
    AnalyticsSendEventLazy();
  }
}

- (void)enableCoexStatsMetrics:(int64_t)a3 at:(double)a4
{
  if (!self->mBTCoexStatsMetrics.isActive)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"[BTCoexCA] enableCoexStatsMetrics:%@", -[WCM_CA_BTConnectedDevicesHandler getProfileName:](self, "getProfileName:"));
    self->mBTCoexStatsMetrics.profileIndex = a3;
    self->mBTCoexStatsMetrics.timestamp = a4;
    self->mBTCoexStatsMetrics.isActive = 1;
  }
}

- (void)disableCoexStatsMetricsAt:(double)a3
{
  if (self->mBTCoexStatsMetrics.isActive)
  {
    id v5 = [(WCM_CA_BTConnectedDevicesHandler *)self getProfileName:self->mBTCoexStatsMetrics.profileIndex];
    +[WCM_Logging logLevel:2, @"[BTCoexCA] disableCoexStatsMetrics:%@", v5 message];
    unint64_t v6 = (unint64_t)(a3 - self->mBTCoexStatsMetrics.timestamp);
    unint64_t totDurMs = self->mBTCoexStatsMetrics.totDurMs;
    if (v6 >= 0x1F && totDurMs && *(_OWORD *)&self->mBTCoexStatsMetrics.tddCnt != 0)
    {
      unint64_t v8 = (v6 * (unsigned __int128)0x8888888888888889) >> 64;
      int64_t wlrssiValidCnt = self->mBTCoexStatsMetrics.wlrssiValidCnt;
      if (wlrssiValidCnt) {
        int64_t v10 = self->mBTCoexStatsMetrics.wlrssiCoexAccum / wlrssiValidCnt;
      }
      else {
        int64_t v10 = 0;
      }
      unint64_t v11 = v8 >> 5;
      int64_t btrssiValidCnt = self->mBTCoexStatsMetrics.btrssiValidCnt;
      if (btrssiValidCnt) {
        int64_t v13 = self->mBTCoexStatsMetrics.btrssiCoexAccum / btrssiValidCnt;
      }
      else {
        int64_t v13 = 0;
      }
      +[WCM_Logging logLevel:2, @"[BTCoexCA] Submit CA event: BTCoexStats, profileName=%@, durMin=%llu, btDurPercent=%llu, hybridPercent=%llu, parallelPercent=%llu, btDurAirPercent=%llu, wlrssiCoexAvg=%lld, btrssiCoexAvg=%lld", v5, v11, 100 * self->mBTCoexStatsMetrics.btDurMs / totDurMs, 100* self->mBTCoexStatsMetrics.hybridCnt/ (self->mBTCoexStatsMetrics.hybridCnt + self->mBTCoexStatsMetrics.tddCnt), 100* self->mBTCoexStatsMetrics.parallelCnt/ (self->mBTCoexStatsMetrics.hybridCnt + self->mBTCoexStatsMetrics.tddCnt), 100 * self->mBTCoexStatsMetrics.btDurAirMs / totDurMs, v10, v13 message];
      AnalyticsSendEventLazy();
    }
    else
    {
      +[WCM_Logging logLevel:2, @"[BTCoexCA] Ignore CA event: BTCoexStats, durSec=%llu, tddCnt=%llu, hybridCnt=%llu, parallelCnt=%llu, btDurMs=%llu, btDurAirMs=%llu, wlrssiCoexAccum=%lld, wlrssiValidCnt=%llu, btrssiCoexAccum=%lld, btrssiValidCnt=%llu, totDurMs=%llu", v6, self->mBTCoexStatsMetrics.tddCnt, self->mBTCoexStatsMetrics.hybridCnt, self->mBTCoexStatsMetrics.parallelCnt, self->mBTCoexStatsMetrics.btDurMs, self->mBTCoexStatsMetrics.btDurAirMs, self->mBTCoexStatsMetrics.wlrssiCoexAccum, self->mBTCoexStatsMetrics.wlrssiValidCnt, self->mBTCoexStatsMetrics.btrssiCoexAccum, self->mBTCoexStatsMetrics.btrssiValidCnt, totDurMs message];
    }
    [(WCM_CA_BTConnectedDevicesHandler *)self resetBTCoexStatsMetrics];
  }
}

- (void)updateBTCoexWiFiState:(int)a3 wifiChannel:(unsigned int)a4 at:(double)a5
{
  if (a3 >= 4)
  {
    v9 = "INVALID_STATE!!!";
    if (a3 == 4) {
      v9 = "ASSOCIATED_6G";
    }
  }
  else
  {
    v9 = off_10020FC48[a3];
  }
  +[WCM_Logging logLevel:2, @"[BTCoexCA] updateBTCoexWifiState=%s wifiChannel=%u", v9, *(void *)&a4 message];
  int mWiFiState = self->mWiFiState;
  if (a3 != 2 || mWiFiState == 2)
  {
    if (a3 != 2 && mWiFiState == 2)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      mConnectedDevicesMetricsArray = self->mConnectedDevicesMetricsArray;
      id v12 = [(NSMutableArray *)mConnectedDevicesMetricsArray countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v18;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(mConnectedDevicesMetricsArray);
            }
            v16 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v16 isTimerActive]) {
              [v16 stopWiFi2GTimer:a5 wifi2GStartTime:self->mWiFi2GStartTime];
            }
          }
          id v13 = [(NSMutableArray *)mConnectedDevicesMetricsArray countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v13);
      }
      self->mWiFi2GStartTime = 0.0;
    }
    self->int mWiFiState = a3;
    self->mWiFiChannel = a4;
    if (a3 != 2) {
      [(WCM_CA_BTConnectedDevicesHandler *)self disableCoexStatsMetricsAt:a5];
    }
  }
  else
  {
    self->mWiFi2GStartTime = a5;
    self->int mWiFiState = 2;
    self->mWiFiChannel = a4;
  }
}

- (void)updateBTCoexStats_tddCnt:(unsigned int)a3 hybridCnt:(unsigned int)a4 btDurMs:(unsigned int)a5 totDurMs:(unsigned int)a6 parallelCnt:(unsigned int)a7 btDurAirMs:(unsigned int)a8 wlrssiCoex:(char)a9 btrssiCoex:(char)a10 activeProfileFor2G:(int64_t)a11 btPowerState:(BOOL)a12 at:(double)a13
{
  if (a12)
  {
    int mWiFiState = self->mWiFiState;
    if (!self->mBTCoexStatsMetrics.isActive)
    {
      if (mWiFiState != 2) {
        return;
      }
LABEL_15:
      [(WCM_CA_BTConnectedDevicesHandler *)self enableCoexStatsMetrics:a11 at:a13];
      return;
    }
    if (mWiFiState == 2)
    {
      if (self->mBTCoexStatsMetrics.profileIndex == a11)
      {
        uint64_t v16 = *(void *)&a8;
        uint64_t v17 = *(void *)&a7;
        uint64_t v18 = *(void *)&a6;
        uint64_t v19 = *(void *)&a5;
        uint64_t v20 = *(void *)&a4;
        uint64_t v21 = *(void *)&a3;
        id v22 = [(WCM_CA_BTConnectedDevicesHandler *)self getProfileName:a11];
        if (v19 <= v18)
        {
          uint64_t v25 = self->mWiFiState;
          if (v18 >> 4 < 0x753)
          {
            if (v25 >= 4)
            {
              if (v25 == 4) {
                v27 = "ASSOCIATED_6G";
              }
              else {
                v27 = "INVALID_STATE!!!";
              }
            }
            else
            {
              v27 = off_10020FC48[v25];
            }
            +[WCM_Logging logLevel:2, @"[BTCoexCA] updateBTCoexStats with tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d", v21, v20, v17, v19, v18, v22, v27, self->mWiFiChannel, v16, a9, a10 message];
            unint64_t v28 = self->mBTCoexStatsMetrics.totDurMs + v18;
            self->mBTCoexStatsMetrics.btDurMs += v19;
            self->mBTCoexStatsMetrics.unint64_t totDurMs = v28;
            unint64_t v29 = self->mBTCoexStatsMetrics.hybridCnt + v20;
            self->mBTCoexStatsMetrics.tddCnt += v21;
            self->mBTCoexStatsMetrics.hybridCnt = v29;
            unint64_t v30 = self->mBTCoexStatsMetrics.btDurAirMs + v16;
            self->mBTCoexStatsMetrics.parallelCnt += v17;
            self->mBTCoexStatsMetrics.btDurAirMs = v30;
            unint64_t v31 = self->mBTCoexStatsMetrics.btrssiValidCnt + ((a10 >> 7) & 1);
            self->mBTCoexStatsMetrics.wlrssiValidCnt += (a9 >> 7) & 1;
            self->mBTCoexStatsMetrics.int64_t btrssiValidCnt = v31;
            *(int64x2_t *)&self->mBTCoexStatsMetrics.wlrssiCoexAccum = vaddw_s32(*(int64x2_t *)&self->mBTCoexStatsMetrics.wlrssiCoexAccum, vmin_s32((int32x2_t)__PAIR64__(a10, a9), 0));
          }
          else
          {
            if (v25 >= 4)
            {
              if (v25 == 4) {
                v26 = "ASSOCIATED_6G";
              }
              else {
                v26 = "INVALID_STATE!!!";
              }
            }
            else
            {
              v26 = off_10020FC48[v25];
            }
            +[WCM_Logging logLevel:2, @"[BTCoexCA] filtering out CoexStats in system idle state, tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d", v21, v20, v17, v19, v18, v22, v26, self->mWiFiChannel, v16, a9, a10 message];
          }
        }
        else
        {
          uint64_t v23 = self->mWiFiState;
          if (v23 >= 4)
          {
            if (v23 == 4) {
              v24 = "ASSOCIATED_6G";
            }
            else {
              v24 = "INVALID_STATE!!!";
            }
          }
          else
          {
            v24 = off_10020FC48[v23];
          }
          +[WCM_Logging logLevel:2, @"[BTCoexCA] abnormal CoexStats sample, tddCnt=%lu, hybridCnt=%lu, parallelCnt=%lu, btDurMs=%lu, totDurMs=%lu, activeProfileFor2G=%@, wifiState=%s, wifiChannel=%d, btDurAirMs=%lu, wlrssiCoex=%d, btrssiCoex=%d", v21, v20, v17, v19, v18, v22, v24, self->mWiFiChannel, v16, a9, a10 message];
        }
        return;
      }
      -[WCM_CA_BTConnectedDevicesHandler disableCoexStatsMetricsAt:](self, "disableCoexStatsMetricsAt:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8, a13);
      goto LABEL_15;
    }
  }
  else if (!self->mBTCoexStatsMetrics.isActive)
  {
    return;
  }

  -[WCM_CA_BTConnectedDevicesHandler disableCoexStatsMetricsAt:](self, "disableCoexStatsMetricsAt:", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7, *(void *)&a8);
}

- (void)updateBTCoexConnectedDevices:(WCM_BTConnections *)a3 at:(double)a4
{
  +[WCM_Logging logLevel:2, @"[BTCoexCA] updateConnectedDevices with numA2DP=%lu, numLLA=%lu, numHID=%lu, numSCO=%lu, numeSCO=%lu, numLE=%lu, numLEA=%lu", a3->numA2DP, a3->numLLA, a3->numHID, a3->numSCO, a3->numeSCO, a3->numLE, a3->numLEA message];
  id v7 = +[NSMutableArray array];
  unint64_t v8 = vaddvq_s64(vaddq_s64(*(int64x2_t *)&a3->numA2DP, *(int64x2_t *)&a3->numHID))
     + a3->numeSCO
     + a3->numLE
     + a3->numLEA;
  BOOL v17 = v8 != 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  mConnectedDevicesMetricsArray = self->mConnectedDevicesMetricsArray;
  id v10 = [(NSMutableArray *)mConnectedDevicesMetricsArray countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(mConnectedDevicesMetricsArray);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v15 = [v14 numConnections];
        if (v8 <= (unint64_t)v15)
        {
          if (v8 < (unint64_t)v15 || ![v14 isEqualTo:a3])
          {
LABEL_15:
            [v14 stopTimer:a4 wifi2GStartTime:self->mWiFi2GStartTime];
            [(WCM_CA_BTConnectedDevicesHandler *)self submitEvent:v14];
            [v7 addObject:v14];
            continue;
          }
          if (([v14 isTimerActive] & 1) == 0)
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"[BTCoexCA] Resume timer: (%@)", [v14 getEnumerationString]);
            [v14 startTimer:a4];
          }
          BOOL v17 = 0;
        }
        else
        {
          if (![v14 isSubsetOf:a3]) {
            goto LABEL_15;
          }
          if ([v14 isTimerActive])
          {
            +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, @"[BTCoexCA] Pause timer: (%@)", [v14 getEnumerationString]);
            [v14 stopTimer:a4 wifi2GStartTime:self->mWiFi2GStartTime];
          }
        }
      }
      id v11 = [(NSMutableArray *)mConnectedDevicesMetricsArray countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  if ([v7 count]) {
    [(NSMutableArray *)self->mConnectedDevicesMetricsArray removeObjectsInArray:v7];
  }
  if (v17)
  {
    uint64_t v16 = [[WCM_BTConnectedDevicesMetrics alloc] initWithBTConnections:a3 at:a4];
    [(NSMutableArray *)self->mConnectedDevicesMetricsArray addObject:v16];
    +[WCM_Logging logLevel:2, @"[BTCoexCA] Start timer: (%@)", [(WCM_BTConnectedDevicesMetrics *)v16 getEnumerationString] message];
  }
}

@end