@interface WRM_CTService
+ (id)WRM_CTServiceControllerSingleton;
- (BOOL)cellularDataEnabled;
- (BOOL)cellularLinkActive;
- (BOOL)checkIfServingCellNonLTE;
- (BOOL)dataAttachedWithCellularNetwork;
- (BOOL)deviceInRoaming;
- (BOOL)isAudioQualityGood;
- (BOOL)isBBHighPowerState;
- (BOOL)isBBinLimitedService;
- (BOOL)isCallInConference;
- (BOOL)isCallOnHold;
- (BOOL)isCommCenterAsserted;
- (BOOL)isIMSPreferenceEnabled;
- (BOOL)isSimActive;
- (BOOL)isSrvccHandoverInProgress;
- (BOOL)isVoLTESupported;
- (BOOL)isVoiceLQMValid;
- (BOOL)isWiFiCallingSupportedAnySlot;
- (BOOL)isWiFiCallingSupportedSlot1;
- (BOOL)isWiFiCallingSupportedSlot2;
- (BOOL)qmiClientRunning;
- (BOOL)registeredWithCellularNetwork;
- (WRM_CTService)init;
- (__CTServerConnection)configureLaunchableCommCenter;
- (__CTServerConnection)getCTConnectionReference;
- (char)getDataSlotLoad;
- (double)getCurrentAudioErasure;
- (double)getMeasureBWDataSlot;
- (double)getNrRSRP;
- (double)getNrRSRQ;
- (double)getNrSNR;
- (double)getServingCellECIO;
- (double)getServingCellECIODelta;
- (double)getServingCellFilteredMeasurements;
- (double)getServingCellRSCP;
- (double)getServingCellRSCPDelta;
- (double)getServingCellRSRP;
- (double)getServingCellRSRPDelta;
- (double)getServingCellRSRQ;
- (double)getServingCellRSRQDelta;
- (double)getServingCellRSSI;
- (double)getServingCellRSSIDelta;
- (double)getServingCellSNR;
- (double)getServingCellSNRDelta;
- (float)getCurrentMovAvgSignalBars;
- (int)getBBLongSessionState;
- (int)getBandInfoDataSlot;
- (int)getBandInfoOnSlot:(int64_t)a3;
- (int)getBandWidthDataSlot;
- (int)getCTDataIndictor;
- (int)getCallState;
- (int)getLteVoiceLQM;
- (int)getRRCState;
- (int)getServingCellType;
- (int)getUARFCNDataSlot;
- (int64_t)getCellularLQM;
- (int64_t)getCurrentSignalBars;
- (int64_t)getServingCellID;
- (void)configureCTNotificationCallBacks;
- (void)dealloc;
- (void)getCurrentCTMetrics:(__CTServerConnection *)a3;
- (void)initMovAverageOfSignalBar;
- (void)invalidateAudioQualityMetrics;
- (void)resetLteVoiceLQM;
- (void)resetMovAverageOfSignalBar;
- (void)setCallInConference:(BOOL)a3;
- (void)setCallOnHold:(BOOL)a3;
- (void)setCallState:(int)a3;
- (void)setCellularLQM:(int)a3;
- (void)setCurrentSignalBars:(int64_t)a3;
- (void)setIMSPreference:(BOOL)a3;
- (void)setLteVoiceLQM:(int)a3;
- (void)setNrRSRP:(double)a3;
- (void)setNrRSRQ:(double)a3;
- (void)setNrSNR:(double)a3;
- (void)setQMIClientStatus:(BOOL)a3;
- (void)setServingCellECIO:(double)a3;
- (void)setServingCellFilteredMeasurements:(int64_t)a3;
- (void)setServingCellRSCP:(double)a3;
- (void)setServingCellRSRP:(double)a3;
- (void)setServingCellRSRQ:(double)a3;
- (void)setServingCellRSSI:(double)a3;
- (void)setServingCellSNR:(double)a3;
- (void)setServingCellType:(int)a3;
- (void)setSimState:(BOOL)a3;
- (void)setSrvccHandoverState:(BOOL)a3;
- (void)setVoiceLQMReasonCode:(int)a3;
- (void)tiggerEnhanceLQMConfiguration;
- (void)updateAudioQuality:(id)a3;
- (void)updateAudioQualityKaroo:(id *)a3;
- (void)updateBBHighPowerState:(BOOL)a3;
- (void)updateBBLimitedServiceState:(BOOL)a3;
- (void)updateBBLongSessionState:(int)a3;
- (void)updateDataEnableStatus:(BOOL)a3;
- (void)updateMovAverageOfSignalBar;
- (void)updatePSAttachStatus:(BOOL)a3;
- (void)updateRegistrationStatus:(BOOL)a3 :(BOOL)a4;
- (void)updateVoLTEEnableStatus:(BOOL)a3;
@end

@implementation WRM_CTService

- (void)updateVoLTEEnableStatus:(BOOL)a3
{
  self->mVoLTESupported = a3;
}

- (void)setServingCellType:(int)a3
{
  self->mServCellRadioTechnologyType = a3;
}

- (__CTServerConnection)getCTConnectionReference
{
  return self->mCoreTelephonyConnection;
}

+ (id)WRM_CTServiceControllerSingleton
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D7488;
  block[3] = &unk_10020D980;
  block[4] = a1;
  if (qword_10027D310 != -1) {
    dispatch_once(&qword_10027D310, block);
  }
  return (id)qword_10027D308;
}

- (WRM_CTService)init
{
  v5.receiver = self;
  v5.super_class = (Class)WRM_CTService;
  v2 = [(WRM_CTService *)&v5 init];
  if (v2)
  {
    *((void *)v2 + 3) = dispatch_queue_create("com.apple.WirelessRadioManager.CTClient", 0);
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.WirelessRadioManager.CTServerQueue", 0);
    *((void *)v2 + 1) = 0;
    *((void *)v2 + 2) = 0;
    *((void *)v2 + 4) = v3;
    *((void *)v2 + 5) = 0;
    *(void *)(v2 + 45) = 0;
    *(_WORD *)(v2 + 53) = 0;
    *((void *)v2 + 30) = 10;
    *((_WORD *)v2 + 124) = 0;
    *((_WORD *)v2 + 86) = 0;
    *((void *)v2 + 7) = 0;
    *((void *)v2 + 32) = 0;
    *((void *)v2 + 33) = 0;
    v2[65] = 1;
    *((_DWORD *)v2 + 38) = 0;
    *(_OWORD *)(v2 + 136) = 0u;
    *(_OWORD *)(v2 + 120) = 0u;
    *(_OWORD *)(v2 + 104) = 0u;
    *((void *)v2 + 24) = 0;
    *((void *)v2 + 25) = 0;
    *((void *)v2 + 23) = 0;
    *((_WORD *)v2 + 82) = 1;
    v2[166] = 0;
    *((_DWORD *)v2 + 42) = 0;
    *((_DWORD *)v2 + 22) = 1084227584;
    *(_OWORD *)(v2 + 72) = xmmword_1001EB0E0;
    *((_OWORD *)v2 + 13) = 0u;
    *((_OWORD *)v2 + 14) = 0u;
    v2[272] = 1;
    *(void *)(v2 + 276) = 0;
  }
  return (WRM_CTService *)v2;
}

- (void)dealloc
{
  mQueue = self->mQueue;
  if (mQueue)
  {
    dispatch_release(mQueue);
    self->mQueue = 0;
  }
  mServerQueue = self->mServerQueue;
  if (mServerQueue)
  {
    dispatch_release(mServerQueue);
    self->mServerQueue = 0;
  }
  mCoreTelephonyConnection = self->mCoreTelephonyConnection;
  if (mCoreTelephonyConnection) {
    CFRelease(mCoreTelephonyConnection);
  }
  mCTLaunchableConnection = self->mCTLaunchableConnection;
  if (mCTLaunchableConnection) {
    CFRelease(mCTLaunchableConnection);
  }
  +[WCM_Logging logLevel:22 message:@"WRM_CTService dealloc"];
  self->mCellularActive = 0;
  *(_WORD *)&self->mDataAttached = 0;
  self->mRoaming = 0;
  self->mServingCellId = 0;
  self->mCoreTelephonyConnection = 0;
  self->mCTLaunchableConnection = 0;
  *(void *)&self->mServCellRadioTechnologyType = 10;
  *(void *)&self->mValidRsrpMeasurement = 0;
  self->mCommCenterKeepAliveAssertion = 0;
  self->mCommCenterPDPActiveAssertion = 0;
  self->mMovingAverageSignalBar = 5.0;
  self->mCurrentSignalBars = 5;
  *(_WORD *)&self->mPrevAudioQualityWasGood = 1;
  self->mIMSVoiceOverPSMetricsValid = 0;
  self->mBBLongSessionStatus = 0;
  *(_WORD *)&self->mBBHighPowerState = 0;
  self->mDataEnabled = 1;
  self->mLqm = 0;
  self->mRsrp = 0.0;
  self->mSnr = 0.0;
  self->mRsrq = 0.0;
  *(_OWORD *)&self->mRsrpDelta = 0u;
  *(_OWORD *)&self->mRsrqDelta = 0u;
  *(_OWORD *)&self->mEcio = 0u;
  self->mEcioDelta = 0.0;
  self->mIsSimActive = 1;
  *(void *)&self->m_CommCenterAssertionRefCount = 0;
  v7.receiver = self;
  v7.super_class = (Class)WRM_CTService;
  [(WRM_CTService *)&v7 dealloc];
}

- (BOOL)isCommCenterAsserted
{
  return 0;
}

- (__CTServerConnection)configureLaunchableCommCenter
{
  v2 = getprogname();
  CFStringRef v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s-iRAT Manager", v2);
  v4 = (__CTServerConnection *)_CTServerConnectionCreateAndLaunchWithIdentifier();
  _CTServerConnectionSetTargetQueue();
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)getCurrentCTMetrics:(__CTServerConnection *)a3
{
  char v17 = 0;
  CFTypeRef cf = 0;
  unint64_t VoiceLinkQualityMetric = _CTServerConnectionGetVoiceLinkQualityMetric();
  +[WCM_Logging logLevel:22, @"_CTServerConnectionGetVoiceLinkQualityMetric: error: %d, domain: %d", HIDWORD(VoiceLinkQualityMetric), VoiceLinkQualityMetric message];
  Enhancedunint64_t VoiceLinkQualityMetric = _CTServerConnectionGetEnhancedVoiceLinkQualityMetric();
  +[WCM_Logging logLevel:22, @"LQM Blob Pointer: %p, error:%d, domain:%d", 0, HIDWORD(EnhancedVoiceLinkQualityMetric), EnhancedVoiceLinkQualityMetric message];
  +[WCM_Logging logLevel:22 message:@"Did not receive LQM BLOB from CT"];
  sub_1000D874C(0, self);
  LOBYTE(theString1) = 1;
  if (!a3)
  {
    +[WCM_Logging logLevel:22 message:@"iRAT currently not connected to telephony service"];
    CFStringRef v7 = @"iRAT currently not connected to telephony service";
LABEL_8:
    +[WCM_Logging logLevel:22 message:v7];
    goto LABEL_10;
  }
  if (_CTServerConnectionIsDataAttached())
  {
    +[WCM_Logging logLevel:22 message:@"Unable to retrieve data attach status"];
  }
  else
  {
    +[WCM_Logging logLevel:22, @"isDataAttached status: %d", theString1 message];
    [(WRM_CTService *)self updatePSAttachStatus:(_BYTE)theString1 != 0];
  }
  LOBYTE(theString1) = 0;
  if (_CTServerConnectionGetCellularDataIsEnabled())
  {
    CFStringRef v7 = @"Unable to retrieve data enable status";
    goto LABEL_8;
  }
  +[WCM_Logging logLevel:22, @"isDataEnabled status: %d", theString1 message];
  [(WRM_CTService *)self updateDataEnableStatus:(_BYTE)theString1 != 0];
LABEL_10:
  CFStringRef theString1 = 0;
  unint64_t RegistrationStatus = _CTServerConnectionGetRegistrationStatus();
  if (RegistrationStatus)
  {
    +[WCM_Logging logLevel:22, @"_CTServerConnectionGetRegistrationStatus error %d domain %d", HIDWORD(RegistrationStatus), RegistrationStatus message];
  }
  else
  {
    CFComparisonResult v9 = CFStringCompare(theString1, kCTRegistrationStatusRegisteredHome, 0);
    CFStringRef v10 = (const __CFString *)kCTRegistrationStatusRegisteredRoaming;
    if (v9) {
      BOOL v11 = CFEqual(theString1, kCTRegistrationStatusRegisteredRoaming);
    }
    else {
      BOOL v11 = 1;
    }
    BOOL v12 = CFEqual(theString1, v10);
    [(WRM_CTService *)self updateRegistrationStatus:v11 :v12];
    +[WCM_Logging logLevel:22, @"WRM_CTService:_CTServerConnectionGetRegistrationStatus reg status %d, roaming Status %d", v11, v12 message];
  }
  sub_10000C870((uint64_t)a3, self);
  unint64_t CapabilityStatusExtended = _CTServerConnectionGetCapabilityStatusExtended();
  if (HIDWORD(CapabilityStatusExtended))
  {
    +[WCM_Logging logLevel:22, @"_CTServerConnectionGetCapabilityStatusExtended: error: %d, domain: %d", HIDWORD(CapabilityStatusExtended), CapabilityStatusExtended message];
    BOOL v14 = 0;
    char v17 = 0;
  }
  else
  {
    BOOL v14 = v17 != 0;
  }
  [(WRM_CTService *)self updateVoLTEEnableStatus:v14];
  if (v17) {
    CFStringRef v15 = @"_CTServerConnectionGetCapabilityStatusExtended: volteSupported";
  }
  else {
    CFStringRef v15 = @"_CTServerConnectionGetCapabilityStatusExtended: volte not Supported";
  }
  +[WCM_Logging logLevel:22 message:v15];
  if (cf) {
    CFRelease(cf);
  }
}

- (void)configureCTNotificationCallBacks
{
  +[WCM_Logging logLevel:22 message:@"WRM_CTService:configureCTNotificationCallBacks"];
  CFStringRef v3 = getprogname();
  CFStringRef v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s-iRAT Manager", v3);
  self->mCoreTelephonyConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  _CTServerConnectionRegisterForNotification();
  [(WRM_CTService *)self getCurrentCTMetrics:self->mCoreTelephonyConnection];
  if (v4) {
    CFRelease(v4);
  }

  +[WCM_Logging logLevel:22 message:@"WRM_CTService:configureCTNotificationCallBacks completed"];
}

- (void)tiggerEnhanceLQMConfiguration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D8A70;
  block[3] = &unk_10020D980;
  block[4] = self;
  if (qword_10027D318 != -1) {
    dispatch_once(&qword_10027D318, block);
  }
}

- (BOOL)cellularLinkActive
{
  return self->mCellularActive;
}

- (double)getServingCellRSSI
{
  return self->mRssi;
}

- (double)getServingCellRSRP
{
  if (self->mValidRsrpMeasurement) {
    return self->mRsrp;
  }
  else {
    return (double)self->mRawFilteredMeasurements;
  }
}

- (double)getServingCellRSRQ
{
  return self->mRsrq;
}

- (double)getServingCellSNR
{
  return self->mSnr;
}

- (double)getServingCellRSCP
{
  return self->mRscp;
}

- (double)getServingCellECIO
{
  return self->mEcio;
}

- (int64_t)getCellularLQM
{
  return self->mLqm;
}

- (int)getLteVoiceLQM
{
  return self->mLTEVoiceLQM;
}

- (double)getServingCellRSSIDelta
{
  return self->mRssiDelta;
}

- (double)getServingCellRSRPDelta
{
  return self->mRsrpDelta;
}

- (double)getServingCellRSRQDelta
{
  return self->mRsrqDelta;
}

- (double)getServingCellSNRDelta
{
  return self->mSnrDelta;
}

- (double)getServingCellRSCPDelta
{
  return self->mRscpDelta;
}

- (double)getServingCellECIODelta
{
  return self->mEcioDelta;
}

- (double)getServingCellFilteredMeasurements
{
  if (self->mValidRsrpMeasurement) {
    return self->mRsrp;
  }
  else {
    return (double)self->mRawFilteredMeasurements;
  }
}

- (int64_t)getCurrentSignalBars
{
  return self->mCurrentSignalBars;
}

- (int64_t)getServingCellID
{
  return self->mServingCellId;
}

- (void)setServingCellRSSI:(double)a3
{
  if (self->mValidRssiMeasurement)
  {
    self->mRssiDelta = self->mRssi - a3;
    self->mRssi = a3;
  }
  else
  {
    self->mRssi = a3;
    self->mValidRssiMeasurement = 1;
  }
}

- (void)setServingCellRSRP:(double)a3
{
  if (self->mValidRsrpMeasurement)
  {
    self->mRsrpDelta = self->mRsrp - a3;
    self->mRsrp = a3;
  }
  else
  {
    self->mRsrp = a3;
    self->mValidRsrpMeasurement = 1;
  }
}

- (void)setServingCellRSRQ:(double)a3
{
  if (self->mValidRsrqMeasurement)
  {
    self->mRsrqDelta = self->mRsrq - a3;
    self->mRsrq = a3;
  }
  else
  {
    self->mRsrq = a3;
    self->mValidRsrqMeasurement = 1;
  }
}

- (void)setServingCellSNR:(double)a3
{
  if (self->mValidSnrMeasurement)
  {
    self->mSnrDelta = self->mSnr - a3;
    self->mSnr = a3;
  }
  else
  {
    self->mSnr = a3;
    self->mValidSnrMeasurement = 1;
  }
}

- (void)setServingCellRSCP:(double)a3
{
  if (self->mValidRscpMeasurement)
  {
    self->mRscpDelta = self->mRscp - a3;
    self->mRscp = a3;
  }
  else
  {
    self->mRscp = a3;
    self->mValidRscpMeasurement = 1;
  }
}

- (void)setServingCellECIO:(double)a3
{
  if (self->mValidEcioMeasurement)
  {
    self->mEcioDelta = self->mEcio - a3;
    self->mEcio = a3;
  }
  else
  {
    self->mEcio = a3;
    self->mValidEcioMeasurement = 1;
  }
}

- (void)setCellularLQM:(int)a3
{
  self->mLqm = a3;
  self->mValidLqm = 1;
}

- (BOOL)qmiClientRunning
{
  return self->mQMIClientActive;
}

- (void)setQMIClientStatus:(BOOL)a3
{
  self->mQMIClientActive = a3;
}

- (void)setLteVoiceLQM:(int)a3
{
  if (a3 && (a3 + 2) <= 0x66)
  {
    self->mLTEVoiceLQM = a3;
    self->mValidLTEVoIPLqm = 1;
  }
  else
  {
    +[WCM_Logging logLevel:22, @"setLteVoiceLQM, discarding invalid voiceLQM %d", *(void *)&a3 message];
  }
}

- (void)setVoiceLQMReasonCode:(int)a3
{
  self->mReasongCode = a3;
}

- (void)resetLteVoiceLQM
{
  self->mValidLTEVoIPLqm = 0;
}

- (BOOL)isVoiceLQMValid
{
  return self->mValidLTEVoIPLqm;
}

- (void)updateDataEnableStatus:(BOOL)a3
{
  self->mDataEnabled = a3;
}

- (void)updatePSAttachStatus:(BOOL)a3
{
  self->mDataAttached = a3;
}

- (void)updateRegistrationStatus:(BOOL)a3 :(BOOL)a4
{
  self->mRegistered = a3;
  self->mRoaming = a4;
}

- (BOOL)cellularDataEnabled
{
  return self->mDataEnabled;
}

- (BOOL)dataAttachedWithCellularNetwork
{
  return self->mDataAttached;
}

- (BOOL)registeredWithCellularNetwork
{
  return self->mRegistered;
}

- (BOOL)deviceInRoaming
{
  return self->mRoaming;
}

- (int)getServingCellType
{
  return self->mServCellRadioTechnologyType;
}

- (void)setServingCellFilteredMeasurements:(int64_t)a3
{
  self->mRawFilteredMeasurements = a3;
}

- (void)setCurrentSignalBars:(int64_t)a3
{
  if (a3)
  {
    self->mCurrentSignalBars = a3;
  }
  else
  {
    self->mCurrentSignalBars = 5;
    +[WCM_Logging logLevel:22, @"Ignorning signal bar: %d", 0 message];
  }
}

- (BOOL)isSrvccHandoverInProgress
{
  return self->mServCellRadioTechnologyType == 1 && self->mSrvccHandoverStarted;
}

- (void)setSrvccHandoverState:(BOOL)a3
{
  self->mSrvccHandoverStarted = a3;
}

- (int)getCallState
{
  return self->mCallStatus;
}

- (void)setCallState:(int)a3
{
  self->mCallStatus = a3;
}

- (BOOL)isCallInConference
{
  return self->mCallInConference;
}

- (void)setCallInConference:(BOOL)a3
{
  self->mCallInConference = a3;
}

- (BOOL)isCallOnHold
{
  return self->mCallOnHold;
}

- (void)setCallOnHold:(BOOL)a3
{
  self->mCallOnHold = a3;
}

- (BOOL)isVoLTESupported
{
  return self->mVoLTESupported;
}

- (void)setSimState:(BOOL)a3
{
  self->mIsSimActive = a3;
}

- (BOOL)isSimActive
{
  return self->mIsSimActive;
}

- (void)invalidateAudioQualityMetrics
{
  self->mPrevAudioQualityWasGood = 1;
}

- (void)updateAudioQuality:(id)a3
{
  BOOL v4 = (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001) < 80.0 || a3.var1 < 0x1F5;
  self->mPrevAudioQualityWasGood = v4;
  +[WCM_Logging logLevel:22, @"BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d", *(void *)&a3.var2, *(void *)&a3.var0, a3.var1, (double)(100 * a3.var0) / ((double)a3.var1 + 0.000001), *(void *)&self->mRscp, *(void *)&self->mEcio, v4 message];
}

- (void)updateAudioQualityKaroo:(id *)a3
{
  uint64_t var0 = a3->var0;
  uint64_t var1 = a3->var1;
  BOOL v6 = (double)(100 * var0) / ((double)var1 + 0.000001) < 80.0 || var1 < 0x1F5;
  self->mPrevAudioQualityWasGood = v6;
  +[WCM_Logging logLevel:22, @"BB Audio Metrics, CodecType: %d, Total Erasures: %d, Total playbacks: %d, Percent Erasures: %f, RSCP: %f, ECIO:%f, Eval Quality: %d", a3->var2, var0, var1, (double)(100 * var0) / ((double)var1 + 0.000001), *(void *)&self->mRscp, *(void *)&self->mEcio, v6 message];
}

- (BOOL)isAudioQualityGood
{
  return self->mPrevAudioQualityWasGood;
}

- (void)setIMSPreference:(BOOL)a3
{
  self->mIMSVoiceOverPSMetricsValid = 1;
  self->mIMSVoiceOverPSSupported = a3;
}

- (BOOL)isIMSPreferenceEnabled
{
  return !self->mIMSVoiceOverPSMetricsValid || self->mIMSVoiceOverPSSupported;
}

- (void)updateBBLongSessionState:(int)a3
{
  self->mBBLongSessionStatus = a3;
}

- (int)getBBLongSessionState
{
  return self->mBBLongSessionStatus;
}

- (float)getCurrentMovAvgSignalBars
{
  return self->mMovingAverageSignalBar;
}

- (void)initMovAverageOfSignalBar
{
  self->mMovingAverageSignalBar = (float)self->mCurrentSignalBars;
}

- (void)resetMovAverageOfSignalBar
{
  self->mMovingAverageSignalBar = 5.0;
}

- (void)updateMovAverageOfSignalBar
{
  int64_t mCurrentSignalBars = self->mCurrentSignalBars;
  float v3 = (float)((float)mCurrentSignalBars + (float)(self->mMovingAverageSignalBar * 23.0)) / 24.0;
  self->mMovingAverageSignalBar = v3;
  +[WCM_Logging logLevel:24, @"Sampled Moving Average: %f, CurrentSignal Bars:%d", v3, mCurrentSignalBars message];
}

- (void)updateBBHighPowerState:(BOOL)a3
{
  self->mBBHighPowerState = a3;
}

- (BOOL)isBBHighPowerState
{
  return self->mBBHighPowerState;
}

- (void)updateBBLimitedServiceState:(BOOL)a3
{
  self->mBBinTrueLimitedService = a3;
}

- (BOOL)isBBinLimitedService
{
  return self->mBBinTrueLimitedService;
}

- (BOOL)checkIfServingCellNonLTE
{
  return self->mServCellRadioTechnologyType != 1;
}

- (int)getRRCState
{
  return 0;
}

- (void)setNrRSRP:(double)a3
{
  self->mNrRsrp = a3;
}

- (void)setNrSNR:(double)a3
{
  self->mNrSnr = a3;
}

- (void)setNrRSRQ:(double)a3
{
  self->mNrRsrq = a3;
}

- (double)getNrRSRP
{
  return self->mNrRsrp;
}

- (double)getNrRSRQ
{
  return self->mNrRsrq;
}

- (double)getNrSNR
{
  return self->mNrSnr;
}

- (char)getDataSlotLoad
{
  return 0;
}

- (int)getCTDataIndictor
{
  return 0;
}

- (double)getCurrentAudioErasure
{
  return 0.0;
}

- (double)getMeasureBWDataSlot
{
  return 0.0;
}

- (int)getUARFCNDataSlot
{
  return 0;
}

- (int)getBandInfoDataSlot
{
  return 0;
}

- (int)getBandWidthDataSlot
{
  return 0;
}

- (int)getBandInfoOnSlot:(int64_t)a3
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedAnySlot
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedSlot1
{
  return 0;
}

- (BOOL)isWiFiCallingSupportedSlot2
{
  return 0;
}

@end