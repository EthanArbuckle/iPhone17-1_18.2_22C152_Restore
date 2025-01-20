@interface WRM_MetricsService
+ (WRM_MetricsService)allocWithZone:(_NSZone *)a3;
+ (id)getSingleton;
- (WRMAntSelPolicyStats)getWRMAntSelPolicyStats;
- (WRMMetriciRATLinkPrefChangeCellularToWiFi)getiRATMetricCellularToWifi;
- (WRMMetriciRATLinkPrefChangeWiFiToCellular)getiRATMetricWiFiToCellular;
- (WRMMetriciRATLinkPrefInit)getiRATMetricLinkPrefInit;
- (WRMMetrics5GVersusWiFi)getWRM5GVersusWiFiLinkPreferenceMetrics;
- (WRMMetricsiRATDataRecommendation)getStandaloneLinkPreferenceMetrics;
- (WRMMetricsiRATFaceTimeHandover)getWRMFaceTimeHandover;
- (WRMMetricsiRATStreaming)getWRMStreaming;
- (WRMPRoximityMetrics)getWRMProximity;
- (WRMULCACoexStats)getWRMULCACoexStats;
- (WRMWiFiCallingEnd)getWRMWiFiCallingEnd;
- (WRM_MetricsService)init;
- (id)getAWDService;
- (id)getLTECoexMetrics;
- (id)getQueue;
- (id)getWiFiCallingMetrics;
- (id)getiRATMetricHORecordCache;
- (unint64_t)retainCount;
- (void)appCountUpdate:(WRMMetricsAppType *)a3 :(unint64_t)a4;
- (void)dealloc;
- (void)dumpiRATCellToWifi;
- (void)dumpiRATWifiToCell;
- (void)getOpModeReasonStr:(int)a3 :(char *)a4;
- (void)getReasonStr:(int)a3 :(char *)a4;
- (void)getTelephonyReasonStr:(int)a3 :(char *)a4;
- (void)init5GVersusWiFiLinkPrefMetrics;
- (void)initAWDService;
- (void)initCoexMetrics;
- (void)initFaceTimeHandoverMetrics;
- (void)initLTECoexMetrics;
- (void)initProximityMetrics;
- (void)initStandaloneLinkPrefMetrics;
- (void)initStreamingMetrics;
- (void)initWiFiCallingMetrics;
- (void)initiRATMetrics;
- (void)mobCountUpdate:(WRMMetricsMobilityStatus *)a3 :(int)a4;
- (void)reset5GVersusWiFiMetrics;
- (void)resetAntSelPolicyStats;
- (void)resetFaceTimeHandover;
- (void)resetProximity;
- (void)resetStandaloneLinkPreferenceMetrics;
- (void)resetStreaming;
- (void)resetULCACoexStats;
- (void)resetWiFiCallingEnd;
- (void)resetiRATMetricCellularToWifi;
- (void)resetiRATMetricLinkPrefInit;
- (void)resetiRATMetricWiFiToCellular;
- (void)updateiRATMetricCellToWifi:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6;
- (void)updateiRATMetricLinkInit:(int)a3;
- (void)updateiRATMetricWifiToCell:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6;
@end

@implementation WRM_MetricsService

+ (id)getSingleton
{
  objc_sync_enter(a1);
  if (!qword_10027D348)
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___WRM_MetricsService;
    qword_10027D348 = (uint64_t)[[objc_msgSendSuper2(&v4, "allocWithZone:", 0) init]];
  }
  objc_sync_exit(a1);
  return (id)qword_10027D348;
}

- (void)initLTECoexMetrics
{
  if (!self->mLTECoexMetrics) {
    self->mLTECoexMetrics = objc_alloc_init(WRM_LTECoexMetrics);
  }
}

- (id)getLTECoexMetrics
{
  return self->mLTECoexMetrics;
}

- (WRM_MetricsService)init
{
  v3.receiver = self;
  v3.super_class = (Class)WRM_MetricsService;
  result = [(WRM_MetricsService *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->mLTECoexMetrics = 0u;
    *(_OWORD *)&result->mProximityMetrics = 0u;
    *(_OWORD *)&result->mStreamingMetrics = 0u;
    *(_OWORD *)&result->mAWDService = 0u;
    *(_OWORD *)&result->mCoexMetrics = 0u;
  }
  return result;
}

- (void)dealloc
{
  mCoexMetrics = self->mCoexMetrics;
  if (mCoexMetrics) {

  }
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {

  }
  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics) {

  }
  mAWDService = self->mAWDService;
  if (mAWDService) {

  }
  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics) {

  }
  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics) {

  }
  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics) {

  }
  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics) {

  }
  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics) {

  }
  miRAT5GVersusWiFi = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi) {

  }
  v13.receiver = self;
  v13.super_class = (Class)WRM_MetricsService;
  [(WRM_MetricsService *)&v13 dealloc];
}

+ (WRM_MetricsService)allocWithZone:(_NSZone *)a3
{
  id v3 = [a1 getSingleton:a3];

  return (WRM_MetricsService *)v3;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (void)initiRATMetrics
{
  self->miRATMetrics = objc_alloc_init(WRM_iRATMetrics);
}

- (id)getWiFiCallingMetrics
{
  return self->mWiFiCallingMetrics;
}

- (id)getAWDService
{
  return self->mAWDService;
}

- (void)initCoexMetrics
{
  self->mCoexMetrics = objc_alloc_init(WRM_CoexMetrics);
}

- (void)initWiFiCallingMetrics
{
  self->mWiFiCallingMetrics = objc_alloc_init(WRM_WiFiCallingMetrics);
}

- (void)initStreamingMetrics
{
  self->mStreamingMetrics = objc_alloc_init(WRM_StreamingMetrics);
}

- (void)initFaceTimeHandoverMetrics
{
  self->mFaceTimeMetrics = objc_alloc_init(WRM_FaceTimeMetrics);
}

- (void)initProximityMetrics
{
  self->mProximityMetrics = objc_alloc_init(WRM_ProximityMetrics);
}

- (void)initStandaloneLinkPrefMetrics
{
  self->mStandaloneLinkPreferenceMetrics = objc_alloc_init(WRM_MetricsiRATDataRecommendation);
}

- (void)init5GVersusWiFiLinkPrefMetrics
{
  self->miRAT5GVersusWiFi = objc_alloc_init(WRM_MetricsiRAT5GVersusWiFi);
}

- (void)initAWDService
{
  if (!self->mAWDService)
  {
    +[WCM_Logging logLevel:25 message:@"Init iRAT AWD service."];
    self->mAWDService = objc_alloc_init(WRM_AWDService);
  }
}

- (void)updateiRATMetricLinkInit:(int)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"========= %s ================", "-[WRM_MetricsService updateiRATMetricLinkInit:]");
  v5 = "WRM_IWLAN_CELLULAR";
  if (a3 == 1) {
    v5 = "WRM_IWLAN_WIFI";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"%s: link %s", "-[WRM_MetricsService updateiRATMetricLinkInit:]", v5);
  if (a3 == 1)
  {
    uint64_t v6 = 216;
  }
  else
  {
    if (a3) {
      goto LABEL_8;
    }
    uint64_t v6 = 220;
  }
  ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v6);
LABEL_8:
  +[WCM_Logging logLevel:25, @"LinkInit Stats: Wifi %d Cell %d", self->miRATMetrics->mLinkInit.countWiFi, self->miRATMetrics->mLinkInit.countCellular message];

  +[WCM_Logging logLevel:25 message:@"===================================================="];
}

- (void)getReasonStr:(int)a3 :(char *)a4
{
  objc_super v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (uint64_t i = 0; i != 16; ++i)
    {
      if ((dword_1002074B8[i] & a3) != 0)
      {
        v7 = "Unknown";
        if ((i & 0xFFFFFFF0) == 0) {
          v7 = off_100211E08[i];
        }
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

- (void)updateiRATMetricWifiToCell:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v9 = a3;
  [(WRM_MetricsService *)self getReasonStr:*(void *)&a6 :v14];
  self->mWiFiCallingMetrics->mWifiCallingEnd.Call_End_Reason = v14;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"========= %s === reason 0x%x =============", "-[WRM_MetricsService updateiRATMetricWifiToCell::::]", v6);
  v11 = "NO";
  if (v9) {
    v11 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"%s: callActive %s app %ld mob %ld reason 0x%x (%s)", "-[WRM_MetricsService updateiRATMetricWifiToCell::::]", v11, a4, v7, v6, v14);
  v12 = objc_alloc_init(WRM_HORecordCacheEntry);
  [(WRM_HORecordCacheEntry *)v12 setWithRecord:100 :v9 :a4 :v7 :v6];
  [(NSMutableArray *)self->miRATMetrics->mHORecordCache addObject:v12];
  if ((unint64_t)[(NSMutableArray *)self->miRATMetrics->mHORecordCache count] >= 0xB) {
    [(NSMutableArray *)self->miRATMetrics->mHORecordCache removeObjectAtIndex:0];
  }

  ++self->miRATMetrics->mWifiToCell.count;
  uint64_t v13 = 12;
  if (v9) {
    uint64_t v13 = 16;
  }
  ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v13);
  [(WRM_MetricsService *)self appCountUpdate:&self->miRATMetrics->mWifiToCell.appType :a4];
  [(WRM_MetricsService *)self mobCountUpdate:&self->miRATMetrics->mWifiToCell.mobStatus :v7];
  if (v6)
  {
    ++self->miRATMetrics->mWifiToCell.reason.nBrokenBH_DPD_or_Video;
    if ((v6 & 2) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((v6 & 2) == 0)
  {
    goto LABEL_9;
  }
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiNotReady;
  if ((v6 & 4) == 0)
  {
LABEL_10:
    if ((v6 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadSNR;
  if ((v6 & 8) == 0)
  {
LABEL_11:
    if ((v6 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI;
  if ((v6 & 0x10) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadARQ;
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadLoad;
  if ((v6 & 0x40) == 0)
  {
LABEL_14:
    if ((v6 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadBrokenBH_SIP_VideoStall;
  if ((v6 & 0x80) == 0)
  {
LABEL_15:
    if ((v6 & 0x100) == 0) {
      goto LABEL_16;
    }
LABEL_27:
    ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadRTP;
    if ((v6 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_26:
  ++self->miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom;
  if ((v6 & 0x100) != 0) {
    goto LABEL_27;
  }
LABEL_16:
  if ((v6 & 0x200) != 0) {
LABEL_17:
  }
    ++self->miRATMetrics->mWifiToCell.reason.nWiFiCellularGood;
LABEL_18:
  [(WRM_MetricsService *)self dumpiRATWifiToCell];
  +[WCM_Logging logLevel:25 message:@"=============================================================================="];
}

- (void)updateiRATMetricCellToWifi:(BOOL)a3 :(unint64_t)a4 :(int)a5 :(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  BOOL v9 = a3;
  [(WRM_MetricsService *)self getReasonStr:*(void *)&a6 :v14];
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"========= %s ==== reason 0x%x  ============", "-[WRM_MetricsService updateiRATMetricCellToWifi::::]", v6);
  v11 = "NO";
  if (v9) {
    v11 = "YES";
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 25, @"%s: callActive %s app %ld mob %ld reason 0x%x (%s)", "-[WRM_MetricsService updateiRATMetricCellToWifi::::]", v11, a4, v7, v6, v14);
  v12 = objc_alloc_init(WRM_HORecordCacheEntry);
  [(WRM_HORecordCacheEntry *)v12 setWithRecord:200 :v9 :a4 :v7 :v6];
  [(NSMutableArray *)self->miRATMetrics->mHORecordCache addObject:v12];
  if ((unint64_t)[(NSMutableArray *)self->miRATMetrics->mHORecordCache count] >= 0xB) {
    [(NSMutableArray *)self->miRATMetrics->mHORecordCache removeObjectAtIndex:0];
  }

  ++self->miRATMetrics->mCellToWifi.count;
  uint64_t v13 = 124;
  if (v9) {
    uint64_t v13 = 128;
  }
  ++*(_DWORD *)((char *)&self->miRATMetrics->super.isa + v13);
  [(WRM_MetricsService *)self appCountUpdate:&self->miRATMetrics->mCellToWifi.appType :a4];
  [(WRM_MetricsService *)self mobCountUpdate:&self->miRATMetrics->mCellToWifi.mobStatus :v7];
  if ((v6 & 0x10000) != 0)
  {
    ++self->miRATMetrics->mCellToWifi.reason.nWiFiGood;
    if ((v6 & 0x20000) == 0)
    {
LABEL_9:
      if ((v6 & 0x40000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((v6 & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  ++self->miRATMetrics->mCellToWifi.reason.nCellularNotReady;
  if ((v6 & 0x40000) == 0)
  {
LABEL_10:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_17:
  ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadSigBar;
  if ((v6 & 0x80000) == 0)
  {
LABEL_11:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_12;
    }
LABEL_19:
    ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadRsrp;
    if ((v6 & 0x200000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_18:
  ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadLQM;
  if ((v6 & 0x100000) != 0) {
    goto LABEL_19;
  }
LABEL_12:
  if ((v6 & 0x200000) != 0) {
LABEL_13:
  }
    ++self->miRATMetrics->mCellToWifi.reason.nCelluarBadEcio;
LABEL_14:
  [(WRM_MetricsService *)self dumpiRATCellToWifi];
  +[WCM_Logging logLevel:25 message:@"=============================================================================="];
}

- (void)dumpiRATCellToWifi
{
  miRATMetrics = self->miRATMetrics;
  +[WCM_Logging logLevel:25, @"C2W Stats: count %d Call [act:%d idl:%d] App [dat:%d vo:%d] Mob [sta:%d wal:%d run:%d veh:%d]", miRATMetrics->mCellToWifi.count, miRATMetrics->mCellToWifi.callStatus.nCallActive, miRATMetrics->mCellToWifi.callStatus.nCallIdle, miRATMetrics->mCellToWifi.appType.nData, miRATMetrics->mCellToWifi.appType.nIMSVoIP, miRATMetrics->mCellToWifi.mobStatus.nStationary, miRATMetrics->mCellToWifi.mobStatus.nWalking, miRATMetrics->mCellToWifi.mobStatus.nRunning, miRATMetrics->mCellToWifi.mobStatus.nVehicular message];
  +[WCM_Logging logLevel:25, @"C2W Stats: reason [wifiGood:%d cell noReady:%d sigBar:%d LQM:%d RSRP:%d ECIO:%d]", miRATMetrics->mCellToWifi.reason.nWiFiGood, miRATMetrics->mCellToWifi.reason.nCellularNotReady, miRATMetrics->mCellToWifi.reason.nCelluarBadSigBar, miRATMetrics->mCellToWifi.reason.nCelluarBadLQM, miRATMetrics->mCellToWifi.reason.nCelluarBadRsrp, miRATMetrics->mCellToWifi.reason.nCelluarBadEcio message];
}

- (void)dumpiRATWifiToCell
{
  miRATMetrics = self->miRATMetrics;
  +[WCM_Logging logLevel:25, @"W2C Stats: count %d Call [act:%d int:%d] App [dat:%d vo:%d] Mob [sta:%d wal:%d run:%d veh:%d]", miRATMetrics->mWifiToCell.count, miRATMetrics->mWifiToCell.callStatus.nCallActive, miRATMetrics->mWifiToCell.callStatus.nCallIdle, miRATMetrics->mWifiToCell.appType.nData, miRATMetrics->mWifiToCell.appType.nIMSVoIP, miRATMetrics->mWifiToCell.mobStatus.nStationary, miRATMetrics->mWifiToCell.mobStatus.nWalking, miRATMetrics->mWifiToCell.mobStatus.nRunning, miRATMetrics->mWifiToCell.mobStatus.nVehicular message];
  +[WCM_Logging logLevel:25, @"W2C Stats: reason [wifi DPD :%d noReady:%d snr:%d rssi:%d arq:%d load:%d bcn:%d sym:%d rtp:%d Cellular Good:%d]", miRATMetrics->mWifiToCell.reason.nBrokenBH_DPD_or_Video, miRATMetrics->mWifiToCell.reason.nWiFiNotReady, miRATMetrics->mWifiToCell.reason.nWiFiBadSNR, miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI, miRATMetrics->mWifiToCell.reason.nWiFiBadARQ, miRATMetrics->mWifiToCell.reason.nWiFiBadLoad, miRATMetrics->mWifiToCell.reason.nWiFiBadBrokenBH_SIP_VideoStall, miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom, miRATMetrics->mWifiToCell.reason.nWiFiBadRTP, miRATMetrics->mWifiToCell.reason.nWiFiCellularGood message];
}

- (void)appCountUpdate:(WRMMetricsAppType *)a3 :(unint64_t)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return;
    }
    a3 = (WRMMetricsAppType *)((char *)a3 + 4);
  }
  ++a3->nData;
}

- (void)mobCountUpdate:(WRMMetricsMobilityStatus *)a3 :(int)a4
{
  switch(a4)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 4);
      goto LABEL_5;
    case 2:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 8);
      goto LABEL_5;
    case 3:
      a3 = (WRMMetricsMobilityStatus *)((char *)a3 + 12);
LABEL_5:
      ++a3->nStationary;
      break;
    default:
      return;
  }
}

- (WRMMetriciRATLinkPrefChangeWiFiToCellular)getiRATMetricWiFiToCellular
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {
    return &miRATMetrics->mWifiToCell;
  }
  else {
    return 0;
  }
}

- (WRMMetriciRATLinkPrefChangeCellularToWiFi)getiRATMetricCellularToWifi
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {
    return &miRATMetrics->mCellToWifi;
  }
  else {
    return 0;
  }
}

- (WRMMetriciRATLinkPrefInit)getiRATMetricLinkPrefInit
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {
    return &miRATMetrics->mLinkInit;
  }
  else {
    return 0;
  }
}

- (WRMWiFiCallingEnd)getWRMWiFiCallingEnd
{
  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics) {
    return &mWiFiCallingMetrics->mWifiCallingEnd;
  }
  else {
    return 0;
  }
}

- (WRMAntSelPolicyStats)getWRMAntSelPolicyStats
{
  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics) {
    return &mLTECoexMetrics->mAntSelPolicyStats;
  }
  else {
    return 0;
  }
}

- (WRMULCACoexStats)getWRMULCACoexStats
{
  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics) {
    return &mLTECoexMetrics->mULCACoexStats;
  }
  else {
    return 0;
  }
}

- (WRMMetricsiRATStreaming)getWRMStreaming
{
  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics) {
    return &mStreamingMetrics->mStreaming;
  }
  else {
    return 0;
  }
}

- (WRMMetricsiRATFaceTimeHandover)getWRMFaceTimeHandover
{
  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics) {
    return &mFaceTimeMetrics->mFaceTime;
  }
  else {
    return 0;
  }
}

- (WRMPRoximityMetrics)getWRMProximity
{
  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics) {
    return &mProximityMetrics->mProximity;
  }
  else {
    return 0;
  }
}

- (WRMMetricsiRATDataRecommendation)getStandaloneLinkPreferenceMetrics
{
  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics) {
    return &mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics;
  }
  else {
    return 0;
  }
}

- (WRMMetrics5GVersusWiFi)getWRM5GVersusWiFiLinkPreferenceMetrics
{
  miRAT5GVersusWiFuint64_t i = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi) {
    return &miRAT5GVersusWiFi->m5GVersusWiFiMetrics;
  }
  else {
    return 0;
  }
}

- (id)getiRATMetricHORecordCache
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {
    return miRATMetrics->mHORecordCache;
  }
  else {
    return 0;
  }
}

- (id)getQueue
{
  id v2 = +[WRM_HandoverManager WRM_HandoverManagerSingleton];

  return [v2 getQueue];
}

- (void)resetiRATMetricWiFiToCellular
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
  {
    *(_OWORD *)&miRATMetrics->mWifiToCell.handover.nStatusUpdateDelayBin[2] = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.handover.nHandoverNotPerformed = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.reason.nWiFiBadSymptom = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.reason.nWiFiBadRSSI = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.mobStatus.nVehicular = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.appType.nIMSVoIP = 0u;
    *(_OWORD *)&miRATMetrics->mWifiToCell.count = 0u;
  }
}

- (void)resetiRATMetricCellularToWifi
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics)
  {
    *(_OWORD *)&miRATMetrics->mCellToWifi.handover.nStatusUpdateDelayBin[2] = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.handover.nHandoverNotPerformed = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.reason.nCelluarBadLQM = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.mobStatus.nVehicular = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.appType.nIMSVoIP = 0u;
    *(_OWORD *)&miRATMetrics->mCellToWifi.count = 0u;
  }
}

- (void)resetiRATMetricLinkPrefInit
{
  miRATMetrics = self->miRATMetrics;
  if (miRATMetrics) {
    miRATMetrics->mLinkInit = 0;
  }
}

- (void)resetWiFiCallingEnd
{
  mWiFiCallingMetrics = self->mWiFiCallingMetrics;
  if (mWiFiCallingMetrics)
  {
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.ATM_Registration_State = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.session_id = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.iWLAN_Status = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.HO_Bool = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.Latte_Dejitter_Buffer_Underflow = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.LTE_Data_LQM = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.LTE_Tx_Power = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.WiFi_BSSID_Change = 0u;
    *(_OWORD *)&mWiFiCallingMetrics->mWifiCallingEnd.WiFi_RSSI = 0u;
  }
}

- (void)resetAntSelPolicyStats
{
  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
  {
    *(_DWORD *)&mLTECoexMetrics->mAntSelPolicyStats.IsCoexBand = 0;
    *(void *)&mLTECoexMetrics->mAntSelPolicyStats.IssueBand = 0;
  }
}

- (void)resetULCACoexStats
{
  mLTECoexMetrics = self->mLTECoexMetrics;
  if (mLTECoexMetrics)
  {
    mLTECoexMetrics->mULCACoexStats.ULCACriticalCarrierDLBW = 0;
    *(_OWORD *)&mLTECoexMetrics->mULCACoexStats.ULCAPrimaryCarrierDLBW = 0u;
    *(_OWORD *)&mLTECoexMetrics->mULCACoexStats.ULCAHasCoexBand = 0u;
  }
}

- (void)resetStreaming
{
  mStreamingMetrics = self->mStreamingMetrics;
  if (mStreamingMetrics)
  {
    *(_OWORD *)&mStreamingMetrics->mStreaming.timestamp = 0u;
    p_mStreaming = &mStreamingMetrics->mStreaming;
    *(_OWORD *)&p_mStreaming->total_configured_mimo_layers = 0u;
    *(_OWORD *)&p_mStreaming->numStall = 0u;
    *(_OWORD *)&p_mStreaming->cellChannelBW = 0u;
    *(_OWORD *)&p_mStreaming->mac_DLCA_configured = 0u;
    *(_OWORD *)&p_mStreaming->cellNsaEnabled = 0u;
    *(_OWORD *)&p_mStreaming->cellLteRSRQ = 0u;
    *(_OWORD *)&p_mStreaming->wifinumberOfSpatialStreams = 0u;
    *(_OWORD *)&p_mStreaming->tcpRTTmin = 0u;
    *(_OWORD *)&p_mStreaming->coldStartTypeCellular = 0u;
    *(_OWORD *)&p_mStreaming->btWiFiCoexState = 0u;
    *(_OWORD *)&p_mStreaming->lqmScoreBT = 0u;
    *(_OWORD *)&p_mStreaming->wifiModelConfidenceLevel = 0u;
    *(_OWORD *)&p_mStreaming->devicePointOfInterest = 0u;
    *(_OWORD *)&p_mStreaming->rrcState = 0u;
    *(_OWORD *)&p_mStreaming->pkgLifeTimeVO = 0u;
    *(_OWORD *)&p_mStreaming->weightedAverageRssuint64_t i = 0u;
    *(_OWORD *)&p_mStreaming->goodDecisionsCounterVO = 0u;
    *(_OWORD *)&p_mStreaming->invalidDecisionCounter = 0u;
    *(_OWORD *)&p_mStreaming->wifiRssuint64_t i = 0u;
    *(_OWORD *)&p_mStreaming->StationCount = 0u;
    *(_OWORD *)&p_mStreaming->maxOfActualLowBandwidth = 0u;
    *(_OWORD *)&p_mStreaming->movingAvgHighBandwidth = 0u;
    *(_OWORD *)&p_mStreaming->buffer_interval = 0u;
  }
}

- (void)resetFaceTimeHandover
{
  mFaceTimeMetrics = self->mFaceTimeMetrics;
  if (mFaceTimeMetrics)
  {
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.audioErasure = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.cellRsrp = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.signalBar = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.facetimeDelay = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.iRATRecommendationReason = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiTxPER = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.cca = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.wifiRssuint64_t i = 0u;
    *(_OWORD *)&mFaceTimeMetrics->mFaceTime.timestamp = 0u;
  }
}

- (void)resetProximity
{
  mProximityMetrics = self->mProximityMetrics;
  if (mProximityMetrics)
  {
    *(_OWORD *)&mProximityMetrics->mProximity.btRssuint64_t i = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.newLinkState = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.ccAssertion = 0u;
    *(_OWORD *)&mProximityMetrics->mProximity.timestamp = 0u;
  }
}

- (void)resetStandaloneLinkPreferenceMetrics
{
  mStandaloneLinkPreferenceMetrics = self->mStandaloneLinkPreferenceMetrics;
  if (mStandaloneLinkPreferenceMetrics)
  {
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.packetLifetimeVIBE = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.decisionVO = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiTxPhyRate = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiEstimatedBandwitdh = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.bcnPer = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.wifiRssuint64_t i = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.ratType = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.dataAppStatus = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.motionState = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.voiceLinkPref = 0u;
    *(_OWORD *)&mStandaloneLinkPreferenceMetrics->mDataLinkPreferenceMetrics.timestamp = 0u;
  }
}

- (void)reset5GVersusWiFiMetrics
{
  miRAT5GVersusWiFuint64_t i = self->miRAT5GVersusWiFi;
  if (miRAT5GVersusWiFi)
  {
    *(void *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.total_nr_bandwidth = 0;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.radioFrequency = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiRecommendationConfidence = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.highThermalTemperatureNotification = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiWifiEstThoughtputConfidence = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiWghtAVGRXPHYRATE = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiRxRetry = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.wifiCca = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellRrcState = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellNrSNR = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellNrEstimatedThroughput = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellLteRSRQ = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.cellEstimatedBw = 0u;
    *(_OWORD *)&miRAT5GVersusWiFi->m5GVersusWiFiMetrics.timestamp = 0u;
  }
}

- (void)getTelephonyReasonStr:(int)a3 :(char *)a4
{
  objc_super v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (uint64_t i = 0; i != 8; ++i)
    {
      if ((dword_1002074F8[i] & a3) != 0)
      {
        uint64_t v7 = "tMode";
        if (i <= 6) {
          uint64_t v7 = off_100211E88[i];
        }
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

- (void)getOpModeReasonStr:(int)a3 :(char *)a4
{
  objc_super v4 = a4;
  *(_DWORD *)a4 = 4271950;
  if (a3)
  {
    for (uint64_t i = 0; i != 7; ++i)
    {
      if ((dword_100207518[i] & a3) != 0)
      {
        uint64_t v7 = "oMusicLPMAssertion";
        if (i <= 5) {
          uint64_t v7 = off_100211EC0[i];
        }
        v4 += sprintf(v4, "%s", v7);
      }
    }
  }
  else
  {
    strcpy(a4, "NONE");
  }
}

@end