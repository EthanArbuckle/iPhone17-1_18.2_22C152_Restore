@interface CSMartyDetectionService
- (BOOL)coinflip:(double)a3;
- (BOOL)getForceDecision:(id)a3;
- (BOOL)isIdle;
- (BOOL)shouldKeepCrashTTR;
- (BOOL)shouldKeepTriggerTTR;
- (CSCompanionServiceProtocol)companionProxy;
- (CSMSLDataRecording)mslRecording;
- (CSMartyDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6;
- (float)querySamplingRate:(id)a3 withDefault:(float)a4;
- (id).cxx_construct;
- (id)userInfoUploader;
- (int)performanceSampling;
- (int64_t)daysSinceTimestamp:(double)a3;
- (unsigned)shouldUploadRecording;
- (void)_updateArmingTimes;
- (void)abortSession;
- (void)cacheUserInfo;
- (void)clearCAStats;
- (void)companionDecidedToUpload:(id)a3;
- (void)decideToShowTTR;
- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4;
- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4;
- (void)dumpSample:(id)a3;
- (void)escalateUI;
- (void)feedAccel800:(id)a3;
- (void)feedCompanionStatus:(id)a3;
- (void)feedDeviceMotion:(id)a3;
- (void)feedGPS:(id)a3;
- (void)feedHertzSample:(id)a3;
- (void)feedHgAccel:(id)a3;
- (void)feedKappaTrigger:(id)a3;
- (void)feedLocationManagerResults:(id)a3;
- (void)feedPressure:(id)a3;
- (void)feedRemoteSample:(id)a3;
- (void)feedRoads:(id)a3;
- (void)feedSortedSamples:(id)a3;
- (void)feedSoundPressureLevel:(id)a3;
- (void)feedSteps:(id)a3;
- (void)feedTrustedAudioResult:(id)a3;
- (void)finishAnomalyEvent;
- (void)initStateMachine;
- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4;
- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5;
- (void)printSamplingDefaults;
- (void)receiveCompanionTrigger:(id)a3;
- (void)receiveDeviceInfo:(id)a3;
- (void)receiveUUID:(id)a3;
- (void)requestCompanionUpload:(int)a3;
- (void)requestDeviceInfo;
- (void)resetSession;
- (void)sendCompanionTrigger:(id)a3;
- (void)sendCompanionUUID:(id)a3;
- (void)sendDeviceInfo;
- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5;
- (void)sendSessionInfoToCoreAnalytics;
- (void)setMslRecording:(id)a3;
- (void)setRecording:(id)a3 withUUID:(id)a4;
- (void)setUploader:(id)a3;
- (void)sosActivated;
- (void)start;
- (void)stopSession:(unint64_t)a3;
- (void)triggered:(id)a3;
- (void)updateMartyUserInfoWithInfo:(id)a3;
- (void)uploadUserInfoToCoreAnalyticsWithHandler:(id)a3;
@end

@implementation CSMartyDetectionService

- (float)querySamplingRate:(id)a3 withDefault:(float)a4
{
  optional<float> v5 = [(CSPersistentConfiguration *)self->_persist getFloatDefault:a3];
  float result = v5.var0.var1;
  if ((*(void *)&v5 & 0xFF00000000) == 0) {
    return a4;
  }
  return result;
}

- (void)resetSession
{
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  v3 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "resetSession Marty", v4, 2u);
  }
  [(CSMartyDetectionService *)self sendSessionInfoToCoreAnalytics];
  operator new();
}

- (void)start
{
  optional<int> v2 = [(CSPersistentConfiguration *)self->_persist getIntegerDefault:@"MaxSessionTimeInSeconds"];
  if (v2.var0.var1 <= 0x78u) {
    int var1 = v2.var0.var1;
  }
  else {
    int var1 = 600;
  }
  if ((*(void *)&v2 & 0xFF00000000) != 0) {
    int v4 = var1;
  }
  else {
    int v4 = 120;
  }
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  optional<float> v5 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "configuring flow controller to have a max session of %d seconds", (uint8_t *)v6, 8u);
  }
  operator new();
}

- (void)initStateMachine
{
  id v3 = objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002AB6F4;
  v19[3] = &unk_1003B67A8;
  v19[4] = self;
  int v4 = objc_retainBlock(v19);
  id idleState = self->_idleState;
  self->_id idleState = v4;

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1002AB764;
  v18[3] = &unk_1003B67A8;
  v18[4] = self;
  v6 = objc_retainBlock(v18);
  id readingState = self->_readingState;
  self->_id readingState = v6;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1002ABA10;
  v17[3] = &unk_1003B67A8;
  v17[4] = self;
  v8 = objc_retainBlock(v17);
  id waitForSOSState = self->_waitForSOSState;
  self->_id waitForSOSState = v8;

  v10 = [CSHSMObjc alloc];
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v11 = (id)qword_1003DB6D8;
  v12 = [(CSHSMObjc *)v10 initWithCategory:v11 state:self->_idleState];
  hsm = self->_hsm;
  self->_hsm = v12;

  v14 = (CLTimer *)[(CLSilo *)self->_silo newTimer];
  triggerTimer = self->_triggerTimer;
  self->_triggerTimer = v14;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1002ABCB0;
  v16[3] = &unk_10039F568;
  v16[4] = self;
  [(CLTimer *)self->_triggerTimer setHandler:v16];

  objc_destroyWeak(&location);
}

- (void)abortSession
{
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v3 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "aborting marty session", v4, 2u);
  }
  CSAOPSvc::suppressTriggers((CSAOPSvc *)self->_aop, 1);
  CSAOPSvc::stopDetection((uint64_t)self->_aop);
  self->_aborted = 1;
  [(CSHSMObjc *)self->_hsm signal:6 data:0];
}

- (void)triggered:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (unsigned __int16)[(CSPersistentConfiguration *)self->_persist getBooleanDefault:@"MartyForceTriggersAreCycling"];
  if (v5 >= 0x100u)
  {
    *((unsigned char *)[v4 c_struct] + 94) = v5;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v6 = (id)qword_1003DB6D8;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = *((unsigned __int8 *)[v4 c_struct] + 94);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "forcing marty cycling mode %d", buf, 8u);
    }
  }
  if (self->_uuid)
  {
    if (qword_1003DB6D0 == -1) {
      goto LABEL_9;
    }
  }
  else
  {
    sub_1002B4D48(buf);

    uint64_t v21 = 455;
    v22 = "-[CSMartyDetectionService triggered:]";
    v20 = "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm";
    abort_report_np();
    __break(1u);
  }
  dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
LABEL_9:
  v8 = (id)qword_1003DB6D8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *((unsigned __int8 *)[v4 c_struct] + 46);
    int v10 = *((unsigned __int8 *)[v4 c_struct] + 94);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v9;
    __int16 v24 = 1024;
    int v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "marty path value %d type %d", buf, 0xEu);
  }

  [(CSHSMObjc *)self->_hsm signal:1 data:0];
  double v11 = *(double *)self->_details.__ptr_.__value_;
  if (v11 == 0.0)
  {
    if (*((unsigned char *)objc_msgSend(v4, "c_struct", v11) + 94))
    {
      *((unsigned char *)self->_details.__ptr_.__value_ + 8) = 1;
      v12 = (char *)self->_userInfoStats.__ptr_.__value_ + 24;
    }
    else
    {
      v12 = (char *)self->_userInfoStats.__ptr_.__value_ + 28;
    }
    ++*(_DWORD *)v12;
    *(CFAbsoluteTime *)self->_details.__ptr_.__value_ = CFAbsoluteTimeGetCurrent();
    [(CSMartyDetectionService *)self requestDeviceInfo];
    [(CSMartyDetectionService *)self sendCompanionUUID:self->_uuid];
  }
  if ((*((unsigned char *)objc_msgSend(v4, "c_struct", v11, v20, v21, v22) + 46) & 4) == 0
    && (*((unsigned char *)objc_msgSend(v4, "c_struct") + 46) & 0x10) == 0)
  {
    *(unsigned char *)self->_sessionInfoStats.__ptr_.__value_ = 1;
  }
  -[CSSafetySOSStateMachine feedPotentialEventWithTimestamp:forMode:martyIsBicycle:](self->_sosSM, "feedPotentialEventWithTimestamp:forMode:martyIsBicycle:", *(objc_msgSend(v4, "c_struct") + 1), 2, *((unsigned __int8 *)self->_details.__ptr_.__value_ + 8));
  if ((*((unsigned char *)objc_msgSend(v4, "c_struct") + 46) & 9) != 0) {
    [(CSMartyDetectionService *)self sendCompanionTrigger:v4];
  }
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  v13 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(re)start the flow controller", buf, 2u);
  }
  [self->fFlowControl.__ptr_.__value_ start:*(objc_msgSend(v4, "c_struct") + 1)];
  if ((*((unsigned char *)objc_msgSend(v4, "c_struct") + 46) & 8) != 0
    || (*((unsigned char *)objc_msgSend(v4, "c_struct") + 46) & 1) != 0)
  {
    v14 = [v4 c_struct];
    value = self->_sessionInfoStats.__ptr_.__value_;
    if (v14[94])
    {
      ++*((_DWORD *)value + 13);
      v16 = (char *)self->_userInfoStats.__ptr_.__value_ + 40;
    }
    else
    {
      ++*((_DWORD *)value + 14);
      v16 = (char *)self->_userInfoStats.__ptr_.__value_ + 48;
    }
    ++*(_DWORD *)v16;
  }
  if ((*((unsigned char *)objc_msgSend(v4, "c_struct") + 46) & 4) != 0)
  {
    v17 = [v4 c_struct];
    v18 = self->_sessionInfoStats.__ptr_.__value_;
    if (v17[94])
    {
      *((unsigned char *)v18 + 14) = 1;
      v19 = (char *)self->_userInfoStats.__ptr_.__value_ + 44;
    }
    else
    {
      *((unsigned char *)v18 + 15) = 1;
      v19 = (char *)self->_userInfoStats.__ptr_.__value_ + 52;
    }
    ++*(_DWORD *)v19;
  }
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 8) |= *((unsigned __int8 *)[v4 c_struct] + 92);
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 15) |= *((unsigned __int8 *)[v4 c_struct] + 93);
}

- (void)sosActivated
{
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v3 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
  {
    BOOL inSession = self->_inSession;
    mslRecording = self->_mslRecording;
    v8[0] = 67109376;
    v8[1] = inSession;
    __int16 v9 = 2048;
    int v10 = mslRecording;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sosActivated _inSession %d _mslRecording %p", (uint8_t *)v8, 0x12u);
  }
  if (self->_inSession && (v6 = self->_mslRecording) != 0)
  {
    [(CSMSLDataRecording *)v6 updateMetadata:&off_1003C34F0];
  }
  else
  {
    int v7 = [[CSStudiesServerUploadOutOfBandMetadata alloc] initWithLookingBack:&off_1003C3518 keyValuePairs:900.0];
    [(CSStudiesServerUploader *)self->_uploader addOutOfBandMetadata:v7 error:0];
  }
}

- (void)escalateUI
{
  unsigned __int16 v3 = (unsigned __int16)[(CSPersistentConfiguration *)self->_persist getBooleanDefault:@"MartyShouldEscalateUI"];
  if (v3 < 0x100u || v3 == 0)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    unsigned __int16 v5 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "refused to escalating UI", v7, 2u);
    }
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v6 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "escalating UI", buf, 2u);
    }
    *((unsigned char *)self->_details.__ptr_.__value_ + 44) = 1;
    self->_SOSInProgress = 1;
    [(CSSafetySOSStateMachine *)self->_sosSM feedDetectionDecision:1 uuid:self->_uuid forMode:2];
  }
}

- (void)onCloseEpoch:(unint64_t)a3 epochNumber:(int)a4
{
  unint64_t v5 = +[CSTimeManager SPU_estimate_current_timestamp];
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  v6 = (id)qword_1003DB6D8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240704;
    int v57 = a4;
    __int16 v58 = 2050;
    *(void *)v59 = a3;
    *(_WORD *)&v59[8] = 2050;
    unint64_t v60 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "close epoch %{public}d aop timestamp %{public}llu, %{public}llu", buf, 0x1Cu);
  }

  value = self->fFlowControl.__ptr_.__value_;
  uint64_t v8 = *((void *)value + 52);
  __int16 v9 = (std::__shared_weak_count *)*((void *)value + 53);
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  (*(void (**)(uint64_t *__return_ptr))(*(void *)v8 + 160))(&v50);
  sub_1002A4EC0((uint64_t)&v50, &v52);
  if (v51) {
    sub_10000BB9C(v51);
  }
  uint64_t v10 = v52;
  unint64_t v11 = *(void *)(v52 + 40);
  if (v11) {
    *((double *)self->_details.__ptr_.__value_ + 2) = (double)v11;
  }
  if (*(int *)(v10 + 56) >= 1) {
    *((unsigned char *)self->_details.__ptr_.__value_ + 40) = 1;
  }
  unsigned __int8 v12 = [(CSMartyDetectionService *)self getForceDecision:@"MartyForceEarlyCrashDetectorDecision"];
  uint64_t v13 = v52;
  if (v12)
  {
    if (!*(unsigned char *)(v52 + 64)) {
      goto LABEL_18;
    }
  }
  else if (!*(unsigned char *)(v52 + 64))
  {
    if (!*(unsigned char *)(v52 + 65)) {
      goto LABEL_29;
    }
    goto LABEL_18;
  }
  *((_WORD *)self->_details.__ptr_.__value_ + 12) |= 1u;
LABEL_18:
  v14 = self->_details.__ptr_.__value_;
  if (*(unsigned char *)(v13 + 65)) {
    *((_WORD *)v14 + 12) |= 2u;
  }
  uint64_t v15 = 44;
  if (!*((unsigned char *)v14 + 8)) {
    uint64_t v15 = 48;
  }
  ++*(_DWORD *)((char *)self->_sessionInfoStats.__ptr_.__value_ + v15);
  if (!*((unsigned char *)v14 + 41))
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v16 = (id)qword_1003DB6D8;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "requesting companion upload for early crash", buf, 2u);
    }

    [(CSMartyDetectionService *)self requestCompanionUpload:3];
    v14 = self->_details.__ptr_.__value_;
    uint64_t v13 = v52;
  }
  *((unsigned char *)v14 + 41) = 1;
LABEL_29:
  if (*(unsigned char *)(v13 + 49) && !*((unsigned char *)self->_details.__ptr_.__value_ + 52))
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v17 = (id)qword_1003DB6D8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "lending companion punch thru", buf, 2u);
    }

    *((unsigned char *)self->_details.__ptr_.__value_ + 52) = 1;
    v18 = sub_10001B0A8();
    [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v18 type:402];
  }
  if ([(CSMartyDetectionService *)self getForceDecision:@"MartyForceAlphaCrashDetectorDecision"]|| *(_DWORD *)(v52 + 56))
  {
    v19 = self->_details.__ptr_.__value_;
    uint64_t v20 = 36;
    if (!*((unsigned char *)v19 + 8)) {
      uint64_t v20 = 40;
    }
    ++*(_DWORD *)((char *)self->_sessionInfoStats.__ptr_.__value_ + v20);
    if (!*((unsigned char *)v19 + 40))
    {
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      uint64_t v21 = (id)qword_1003DB6D8;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "requesting companion upload for alpha crash", buf, 2u);
      }

      [(CSMartyDetectionService *)self requestCompanionUpload:1];
      v19 = self->_details.__ptr_.__value_;
    }
    *((unsigned char *)v19 + 40) = 1;
  }
  if ([(CSMartyDetectionService *)self getForceDecision:@"MartyForceSevereCrashDetectorDecision"]|| *(unsigned char *)(v52 + 48))
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v22 = (id)qword_1003DB6D8;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = *((unsigned __int8 *)self->_details.__ptr_.__value_ + 42);
      *(_DWORD *)buf = 67109120;
      int v57 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "_details->severeCrashDetected %d", buf, 8u);
    }

    if (!*((unsigned char *)self->_details.__ptr_.__value_ + 42))
    {
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      __int16 v24 = (id)qword_1003DB6D8;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "escalating UI", buf, 2u);
      }

      [(CSMartyDetectionService *)self escalateUI];
      uint64_t v25 = v52;
      v26 = self->_details.__ptr_.__value_;
      *((double *)v26 + 4) = (double)*(unint64_t *)(v52 + 32);
      *((unsigned char *)v26 + 42) = 1;
      *((unsigned char *)v26 + 43) = *(unsigned char *)(v25 + 52);
      v27 = self->_sessionInfoStats.__ptr_.__value_;
      if (*((unsigned char *)v26 + 8)) {
        *((unsigned char *)v27 + 22) = 1;
      }
      else {
        *((unsigned char *)v27 + 23) = 1;
      }
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      v28 = (id)qword_1003DB6D8;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "requesting companion upload for severe crash", buf, 2u);
      }

      [(CSMartyDetectionService *)self requestCompanionUpload:2];
      v29 = [(NSUUID *)self->_uuid UUIDString];
      +[CSFeedbackAssistant showFeedbackAssistantSurveyWithUUID:v29];
    }
  }
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  v30 = (id)qword_1003DB6D8;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    int v31 = *(unsigned __int8 *)(v52 + 49);
    int v32 = *((unsigned __int8 *)self->_details.__ptr_.__value_ + 52);
    int v33 = *(unsigned __int8 *)(v52 + 50);
    int v34 = *(unsigned __int8 *)(v52 + 48);
    int v35 = *(unsigned __int8 *)(v52 + 52);
    *(_DWORD *)buf = 67110144;
    int v57 = v31;
    __int16 v58 = 1024;
    *(_DWORD *)v59 = v32;
    *(_WORD *)&v59[4] = 1024;
    *(_DWORD *)&v59[6] = v33;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = v34;
    HIWORD(v60) = 1024;
    int v61 = v35;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "punch thru early %d lend %d decided %d severe %d cand %d", buf, 0x20u);
  }

  char v36 = *(unsigned char *)(v52 + 50);
  if (v36)
  {
    if (*(unsigned char *)(v52 + 48)) {
      char v36 = 0;
    }
    else {
      char v36 = *(unsigned char *)(v52 + 52) == 0;
    }
  }
  v37 = self->_details.__ptr_.__value_;
  if (*((unsigned char *)v37 + 52))
  {
    char v38 = v36 ^ 1;
    if (*((unsigned char *)v37 + 53)) {
      char v38 = 1;
    }
    if ((v38 & 1) == 0)
    {
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      v39 = (id)qword_1003DB6D8;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "retracting companion punch thru", buf, 2u);
      }

      *((unsigned char *)self->_details.__ptr_.__value_ + 53) = 1;
      v40 = sub_10001B37C();
      [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v40 type:403];

      v37 = self->_details.__ptr_.__value_;
    }
  }
  mslRecording = self->_mslRecording;
  v54[0] = @"crashTimestamp";
  v42 = +[NSNumber numberWithDouble:*((double *)v37 + 2)];
  v55[0] = v42;
  v54[1] = @"severeCrashDetectorDecision";
  v43 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_details.__ptr_.__value_ + 42)];
  v55[1] = v43;
  v54[2] = @"severeCrashTimestamp";
  v44 = +[NSNumber numberWithDouble:*((double *)self->_details.__ptr_.__value_ + 4)];
  v55[2] = v44;
  v54[3] = @"alphaDetectorDecision";
  v45 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_details.__ptr_.__value_ + 40)];
  v55[3] = v45;
  v54[4] = @"escalationCandidateSuppressed";
  v46 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_details.__ptr_.__value_ + 43)];
  v55[4] = v46;
  v47 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:5];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v47];

  [(CSMartyDetectionService *)self sendRemoteSampleToCompanion:v5 epochTs:a3 epochNumber:a4];
  if (v53) {
    sub_10000BB9C(v53);
  }
  if (v9) {
    sub_10000BB9C(v9);
  }
}

- (void)sendRemoteSampleToCompanion:(unint64_t)a3 epochTs:(unint64_t)a4 epochNumber:(int)a5
{
  value = self->fFlowControl.__ptr_.__value_;
  if (value)
  {
    CLKappaAlgFlowController::createRemoteSample(value, (uint64_t)&v11);
    if (v14)
    {
      v11.i32[2] = a5;
      unint64_t v12 = a3;
      unint64_t v13 = a4;
      uint64_t v10 = sub_10001AC6C(&v11);
      [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v10 type:401];
    }
  }
}

- (BOOL)shouldKeepTriggerTTR
{
  optional<float> v3 = [(CSPersistentConfiguration *)self->_persist getFloatDefault:@"MartyTTRTriggerOnlyPopupRate"];
  if ((*(void *)&v3 & 0xFF00000000) != 0) {
    float var1 = v3.var0.var1;
  }
  else {
    float var1 = 0.0;
  }
  [(CSPersistentConfiguration *)self->_persist doubleForKey:@"MartyLastTTRTriggerTimestamp"];
  uint64_t v5 = -[CSMartyDetectionService daysSinceTimestamp:](self, "daysSinceTimestamp:");
  int v6 = v5;
  if (v5 >= 1 && [(CSMartyDetectionService *)self coinflip:var1])
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    int v7 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109376;
      int v12 = v6;
      __int16 v13 = 2048;
      double v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[TTR] Trigger chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
    }
    return 1;
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    __int16 v9 = qword_1003DB6D8;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v10)
    {
      int v11 = 67109376;
      int v12 = v6;
      __int16 v13 = 2048;
      double v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[TTR] Trigger not chosen TTR days %d, rate: %4.2f", (uint8_t *)&v11, 0x12u);
      return 0;
    }
  }
  return result;
}

- (BOOL)shouldKeepCrashTTR
{
  optional<float> v3 = [(CSPersistentConfiguration *)self->_persist getFloatDefault:@"MartyTTREarlyCrashPopupRate"];
  [(CSPersistentConfiguration *)self->_persist doubleForKey:@"MartyLastTTREarlyCrashTimestamp"];
  uint64_t v4 = -[CSMartyDetectionService daysSinceTimestamp:](self, "daysSinceTimestamp:");
  int v5 = v4;
  if ((*(void *)&v3 & 0xFF00000000) != 0) {
    float var1 = v3.var0.var1;
  }
  else {
    float var1 = 1.0;
  }
  if (v4 >= 1 && [(CSMartyDetectionService *)self coinflip:var1])
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    int v7 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 67109376;
      int v12 = v5;
      __int16 v13 = 2048;
      double v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[TTR] EarlyCrash alert cooldown expired daysSinceLast,%d,rate,%4.2f", (uint8_t *)&v11, 0x12u);
    }
    return 1;
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    __int16 v9 = qword_1003DB6D8;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v10)
    {
      int v11 = 67109376;
      int v12 = v5;
      __int16 v13 = 2048;
      double v14 = var1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[TTR] EarlyCrash alert still cooling down daysSinceLast,%d,rate,%4.2f", (uint8_t *)&v11, 0x12u);
      return 0;
    }
  }
  return result;
}

- (void)stopSession:(unint64_t)a3
{
  if (self->_detectionEvent >= 2)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    optional<float> v3 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "subsequent detection events cannot take tokens or update metadata", buf, 2u);
    }
    return;
  }
  uint64_t v6 = [(CSMartyDetectionService *)self shouldUploadRecording];
  mslRecording = self->_mslRecording;
  v78[0] = @"algsEndTimestamp";
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:a3];
  v79[0] = v8;
  v78[1] = @"curationAlgBitmap";
  __int16 v9 = +[NSNumber numberWithUnsignedChar:*((unsigned __int8 *)self->_details.__ptr_.__value_ + 9)];
  v79[1] = v9;
  v78[2] = @"samplingBitmap";
  BOOL v10 = +[NSNumber numberWithUnsignedChar:v6];
  v79[2] = v10;
  v78[3] = @"shouldUploadIndependentlyOfSOS";
  int v11 = +[NSNumber numberWithBool:v6 != 0];
  v79[3] = v11;
  v78[4] = @"deescalationPath";
  int v12 = +[NSNumber numberWithInt:[(CSMartyDetectionService *)self getDeescalationPath]];
  v79[4] = v12;
  __int16 v13 = +[NSDictionary dictionaryWithObjects:v79 forKeys:v78 count:5];
  [(CSMSLDataRecording *)mslRecording updateMetadata:v13];

  if (v6 && self->_mslRecording && self->_companionUUID.__ptr_.__value_)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    double v14 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "requesting companion to upload", buf, 2u);
    }
    [(CSMartyDetectionService *)self requestCompanionUpload:0];
  }
  int MartyToken = getMartyToken(0);
  int MartyAlphaCrashToken = getMartyAlphaCrashToken(0);
  int MartyEarlyCrashToken = getMartyEarlyCrashToken(0);
  int MartyPunchThruToken = getMartyPunchThruToken(0);
  value = self->_details.__ptr_.__value_;
  if (*((unsigned char *)value + 41)) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = *((unsigned char *)value + 46) != 0;
  }
  if (*((unsigned char *)value + 40)) {
    BOOL v21 = 1;
  }
  else {
    BOOL v21 = *((unsigned char *)value + 45) != 0;
  }
  if (*((unsigned char *)value + 42)) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = *((unsigned __int8 *)value + 47) != 0;
  }
  unsigned int v23 = [(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl];
  unsigned int v24 = v23;
  char v25 = !v22;
  if (MartyPunchThruToken < 1) {
    char v25 = 1;
  }
  if (v25)
  {
    char v27 = !v20;
    if (MartyEarlyCrashToken < 1) {
      char v27 = 1;
    }
    if (v27)
    {
      char v29 = !v21;
      if (MartyAlphaCrashToken < 1) {
        char v29 = 1;
      }
      if (v29)
      {
        if (MartyToken < 1)
        {
          if ((v23 & 1) == 0)
          {
            v67 = sub_1002AB0C8();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "non-ttr collection stopping early", buf, 2u);
            }

            goto LABEL_61;
          }
          int v32 = 0;
          if (v22) {
            goto LABEL_55;
          }
          goto LABEL_84;
        }
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        int v31 = qword_1003DB6D8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "acquiring trigger token", buf, 2u);
        }
        getMartyToken(1);
      }
      else
      {
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        v30 = qword_1003DB6D8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "acquiring alpha crash token", buf, 2u);
        }
        getMartyAlphaCrashToken(1);
      }
    }
    else
    {
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      v28 = qword_1003DB6D8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "acquiring early crash token", buf, 2u);
      }
      getMartyEarlyCrashToken(1);
    }
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v26 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "escalation, using punchthru token", buf, 2u);
    }
    getMartyPunchThruToken(1);
  }
  if (v24)
  {
    int v32 = 1;
    if (v22)
    {
LABEL_55:
      int v33 = 0;
      int v34 = self->_details.__ptr_.__value_;
      uint64_t v35 = 4;
LABEL_56:
      *((void *)v34 + 7) = v35;
      goto LABEL_57;
    }
LABEL_84:
    if (v20 || v21)
    {
      if ([(CSMartyDetectionService *)self shouldKeepCrashTTR])
      {
        int v34 = self->_details.__ptr_.__value_;
        int v33 = 0;
        if (v20) {
          uint64_t v35 = 3;
        }
        else {
          uint64_t v35 = 2;
        }
        goto LABEL_56;
      }
      v64 = sub_1002AB0C8();
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
      if (v32)
      {
        if (v65)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "[TTR] _mslRecording.shouldDeleteTTR = YES", buf, 2u);
        }
LABEL_97:

        [(CSMSLDataRecording *)self->_mslRecording setShouldDeleteTTR:1];
        int v33 = 0;
        goto LABEL_57;
      }
      if (v65)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "[TTR] alpha/early ttr not selected, stopping early", buf, 2u);
      }
    }
    else
    {
      if ([(CSMartyDetectionService *)self shouldKeepTriggerTTR])
      {
        int v33 = 0;
        int v34 = self->_details.__ptr_.__value_;
        uint64_t v35 = 1;
        goto LABEL_56;
      }
      v64 = sub_1002AB0C8();
      BOOL v66 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
      if (v32)
      {
        if (v66)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "[TTR] _mslRecording.shouldDeleteTTR = YES", buf, 2u);
        }
        goto LABEL_97;
      }
      if (v66)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "[TTR] trigger ttr not selected, stopping early", buf, 2u);
      }
    }

    int v33 = 1;
LABEL_57:
    char v36 = +[CSPermissions sharedInstance];
    unsigned int v37 = [v36 isAuthorizedToCollectData];

    if (((v33 | v37 ^ 1) & 1) == 0 && ((v32 ^ 1) & 1) == 0)
    {
      char v38 = [(NSUUID *)self->_uuid UUIDString];
      v39 = +[CSAnomalyEventService generateMslUrl:v38 andSessionType:2 ttrManagedMsl:0];
      [(CSMSLDataRecording *)self->_mslRecording setUrlToCopyToOnStop:v39];

      goto LABEL_66;
    }
    [(CSMSLDataRecording *)self->_mslRecording setShouldUpload:0];
    if ((v33 & 1) == 0) {
      goto LABEL_66;
    }
LABEL_61:
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    v40 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "forcefully stopping aop collection", buf, 2u);
    }
    CSAOPSvc::forceStopCollection((CSAOPSvc *)self->_aop);
  }
LABEL_66:
  v41 = self->_companionDeviceInfo.__ptr_.__value_;
  if (v41)
  {
    *((unsigned char *)self->_sessionInfoStats.__ptr_.__value_ + 24) = 1;
    v42 = self->_mslRecording;
    v77[0] = &__kCFBooleanTrue;
    v76[0] = @"companionConnected";
    v76[1] = @"companionDeviceModel";
    v43 = (void *)((char *)v41 + 8);
    if (*((char *)v41 + 31) < 0) {
      v43 = (void *)*v43;
    }
    v44 = +[NSString stringWithUTF8String:v43];
    v77[1] = v44;
    v76[2] = @"companionKappaDeviceType";
    v68 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 8)];
    v77[2] = v68;
    v76[3] = @"companionMartyDeviceType";
    v45 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 9)];
    v77[3] = v45;
    v76[4] = @"companionKappaTokenCount";
    v46 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 10)];
    v77[4] = v46;
    v76[5] = @"companionMartyTokenCount";
    v47 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 11)];
    v77[5] = v47;
    v76[6] = @"companionKappaArmedSeconds";
    v48 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 12)];
    v77[6] = v48;
    v76[7] = @"companionMartyArmedSeconds";
    v49 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 13)];
    v77[7] = v49;
    v76[8] = @"companionEnableMode";
    uint64_t v50 = +[NSNumber numberWithInt:*((unsigned int *)self->_companionDeviceInfo.__ptr_.__value_ + 14)];
    v77[8] = v50;
    v51 = +[NSDictionary dictionaryWithObjects:v77 forKeys:v76 count:9];
    [(CSMSLDataRecording *)v42 updateMetadata:v51];
  }
  uint64_t v52 = self->_companionUUID.__ptr_.__value_;
  if (v52)
  {
    v53 = self->_mslRecording;
    v72[0] = @"companionUUID";
    if (*((char *)v52 + 23) < 0) {
      uint64_t v52 = *(CompanionUUID **)v52;
    }
    v54 = +[NSString stringWithUTF8String:v52];
    v72[1] = @"collectionUUID";
    v73[0] = v54;
    v55 = [(NSUUID *)self->_uuid UUIDString];
    v73[1] = v55;
    v56 = +[NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
    [(CSMSLDataRecording *)v53 updateMetadata:v56];
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    int v57 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "no companion marty collection", buf, 2u);
    }
    __int16 v58 = self->_mslRecording;
    CFStringRef v74 = @"collectionUUID";
    v54 = [(NSUUID *)self->_uuid UUIDString];
    v75 = v54;
    v55 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
    [(CSMSLDataRecording *)v58 updateMetadata:v55];
  }

  double companionTriggerTime = self->_companionTriggerTime;
  if (companionTriggerTime != 0.0)
  {
    unint64_t v60 = +[NSNumber numberWithDouble:*(double *)self->_details.__ptr_.__value_ - companionTriggerTime];
    int v61 = [v60 stringValue];

    v62 = self->_mslRecording;
    CFStringRef v70 = @"deltaTrigger";
    v71 = v61;
    v63 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    [(CSMSLDataRecording *)v62 updateMetadata:v63];
  }
}

- (BOOL)isIdle
{
  return [(CSHSMObjc *)self->_hsm isIn:self->_idleState];
}

- (void)finishAnomalyEvent
{
  self->_detectionEvent = 0;
  [(CSMartyDetectionService *)self decideToShowTTR];
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;
}

- (int64_t)daysSinceTimestamp:(double)a3
{
  optional<float> v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:a3];
  uint64_t v4 = +[NSCalendar currentCalendar];
  int v5 = +[NSDate now];
  uint64_t v6 = [v4 components:16 fromDate:v3 toDate:v5 options:0];

  id v7 = [v6 day];
  return (int64_t)v7;
}

- (void)decideToShowTTR
{
  if (!self->_aborted)
  {
    if (!self->_details.__ptr_.__value_
      || ![(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl]
      || !*((void *)self->_details.__ptr_.__value_ + 7))
    {
      return;
    }
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v4 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *((void *)self->_details.__ptr_.__value_ + 7);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[TTR] show TTR %d", buf, 8u);
    }
    uint64_t v6 = [(NSUUID *)self->_uuid UUIDString];
    id v7 = +[CSAnomalyEventService generateMslUrl:v6 andSessionType:2 ttrManagedMsl:1];

    uint64_t v8 = *((void *)self->_details.__ptr_.__value_ + 7);
    if ((unint64_t)(v8 - 2) >= 2)
    {
      if (v8 == 1)
      {
        persist = self->_persist;
        double Current = CFAbsoluteTimeGetCurrent();
        CFStringRef v11 = @"MartyLastTTRTriggerTimestamp";
        goto LABEL_19;
      }
      if (v8) {
        goto LABEL_20;
      }
      sub_1002B50DC(buf);

      uint64_t v26 = 958;
      char v27 = "-[CSMartyDetectionService decideToShowTTR]";
      char v25 = "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CSMartyDetectionService.mm";
      abort_report_np();
      __break(1u);
    }
    persist = self->_persist;
    double Current = CFAbsoluteTimeGetCurrent();
    CFStringRef v11 = @"MartyLastTTREarlyCrashTimestamp";
LABEL_19:
    -[CSPersistentConfiguration setDouble:forKey:](persist, "setDouble:forKey:", v11, Current, v25, v26, v27);
LABEL_20:
    [(CSMSLDataRecording *)self->_mslRecording writeMetadataToDisk:v7];
    martyTTR = self->_martyTTR;
    uuid = self->_uuid;
    if (*((void *)self->_details.__ptr_.__value_ + 7) != 4)
    {
      id v16 = [(NSUUID *)uuid UUIDString];
      [(CSMartyTap2Radar *)martyTTR showTTRWithTriggerUUID:v16 ttrManagedFiles:[(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl] withEventType:*((void *)self->_details.__ptr_.__value_ + 7)];
LABEL_29:

      return;
    }
    double v14 = [(NSUUID *)uuid UUIDString];
    BOOL v15 = [(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl];
    id v28 = 0;
    [(CSMartyTap2Radar *)martyTTR enqueueTTRWithTriggerUUID:v14 ttrManagedFiles:v15 error:&v28];
    id v16 = v28;

    v17 = sub_1002AB0C8();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v19 = [(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v16;
        __int16 v30 = 1024;
        unsigned int v31 = v19;
        BOOL v20 = "[TTR] Error enqueuing TTR: %@, ttrManaged,%d";
        BOOL v21 = v18;
        os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v21, v22, v20, buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unsigned int v23 = self->_uuid;
      unsigned int v24 = [(CSMSLDataRecording *)self->_mslRecording ttrManagedMsl];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v23;
      __int16 v30 = 1024;
      unsigned int v31 = v24;
      BOOL v20 = "[TTR] Enqueued TTR with UUID %@, ttrManaged,%d";
      BOOL v21 = v18;
      os_log_type_t v22 = OS_LOG_TYPE_INFO;
      goto LABEL_27;
    }

    goto LABEL_29;
  }
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  optional<int> v2 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[TTR] do not send ttr on aborted sessions", buf, 2u);
  }
}

- (void)setRecording:(id)a3 withUUID:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (self->_hsm)
  {
    p_info = GPBUInt32Array.info;
    if (qword_1003DB6D0 == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    sub_1002B51F0(buf);

    abort_report_np();
    __break(1u);
  }
  dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
LABEL_3:
  BOOL v10 = (id)qword_1003DB6D8;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(CSHSMObjc *)self->_hsm isIn:self->_idleState];
    unsigned int v12 = [(CSHSMObjc *)self->_hsm isIn:self->_readingState];
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v11;
    __int16 v15 = 1024;
    unsigned int v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "set recording state %d %d", buf, 0xEu);
  }

  if ([(CSHSMObjc *)self->_hsm isIn:self->_idleState])
  {
    objc_storeStrong((id *)&self->_mslRecording, a3);
    objc_storeStrong((id *)&self->_uuid, a4);
  }
  else
  {
    if (p_info[218] != (__objc2_class_ro *)-1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    __int16 v13 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "recording details may only be set in idle", buf, 2u);
    }
  }
}

- (void)setUploader:(id)a3
{
}

- (CSMartyDetectionService)initWithSilo:(id)a3 vendor:(id)a4 aopService:(void *)a5 sosStateMachine:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)&self->_silo, a3);
  self->_aop = a5;
  mslRecording = self->_mslRecording;
  self->_mslRecording = 0;

  self->_detectionEvent = 0;
  objc_storeStrong((id *)&self->_sosSM, a6);
  __int16 v15 = +[CSPersistentConfiguration sharedConfiguration];
  persist = self->_persist;
  self->_persist = v15;

  v17 = [v12 proxyForService:@"CSCompanionService"];
  companionProxy = self->_companionProxy;
  self->_companionProxy = v17;

  unsigned int v19 = +[NSUserDefaults standardUserDefaults];
  defaults = self->_defaults;
  self->_defaults = v19;

  operator new();
}

- (void)dumpSample:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = (id)qword_1003DB6D8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    uint64_t v6 = *(void **)[v4 c_struct];
    float v7 = *((float *)[v4 c_struct] + 2);
    float v8 = *((float *)[v4 c_struct] + 3);
    double v9 = [v4 c_struct].field4;
    int v57 = 134218752;
    id v58 = v6;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v7;
    *(_WORD *)&v60[8] = 2048;
    *(double *)int v61 = v8;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v9;
    BOOL v10 = "accel800 %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v3;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = (id)qword_1003DB6D8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    id v12 = *(void **)[v11 c_struct];
    float v13 = *((float *)[v11 c_struct] + 2);
    float v14 = *((float *)[v11 c_struct] + 3);
    double v15 = *((float *)[v11 c_struct] + 4);
    int v57 = 134218752;
    id v58 = v12;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v13;
    *(_WORD *)&v60[8] = 2048;
    *(double *)int v61 = v14;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v15;
    BOOL v10 = "hgaccel %llu x %.7f y %.7f z %.7f\n";
    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v3;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = (id)qword_1003DB6D8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v17 = *(void **)[v16 c_struct];
    float v18 = *((float *)[v16 c_struct] + 2);
    float v19 = *((float *)[v16 c_struct] + 3);
    double v20 = *((float *)[v16 c_struct] + 4);
    int v57 = 134218752;
    id v58 = v17;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v18;
    *(_WORD *)&v60[8] = 2048;
    *(double *)int v61 = v19;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v20;
    BOOL v10 = "accel %llu x %.7f y %.7f z %.7f\n";
LABEL_16:
    BOOL v21 = v5;
    uint32_t v22 = 42;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v57, v22);
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v3;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = (id)qword_1003DB6D8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    unsigned int v24 = (void *)*[v23 c_struct] + 1;
    int v57 = 134217984;
    id v58 = v24;
    BOOL v10 = "trigger %llu\n";
    BOOL v21 = v5;
    uint32_t v22 = 12;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = v3;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = (id)qword_1003DB6D8;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    uint64_t v26 = *(void **)[v25 c_struct] + 42;
    float v27 = [v25 c_struct];
    float v28 = *((float *)[v25 c_struct] + 1);
    float v29 = *((float *)[v25 c_struct] + 2);
    float v30 = *((float *)[v25 c_struct] + 3);
    float v31 = *((float *)[v25 c_struct] + 4);
    float v32 = *((float *)[v25 c_struct] + 5);
    float v33 = *((float *)[v25 c_struct] + 6);
    int v57 = 134219776;
    id v58 = v26;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v27;
    *(_WORD *)&v60[8] = 2048;
    *(double *)int v61 = v28;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v29;
    __int16 v63 = 2048;
    double v64 = v30;
    __int16 v65 = 2048;
    double v66 = v31;
    __int16 v67 = 2048;
    double v68 = v32;
    __int16 v69 = 2048;
    double v70 = v33;
    BOOL v10 = "dm6 %llu %.7f %.7f %.7f %.7f %.7f %.7f %.7f\n";
    BOOL v21 = v5;
    uint32_t v22 = 82;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v3;
    uint64_t v5 = sub_1002AB0C8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    uint64_t v35 = (void *)*((*(v34->c_struct) + 5));
    uint64_t v36 = *([v34 c_struct] + 8);
    float v37 = [v34 c_struct];
    float v38 = *((float *)[v34 c_struct] + 1);
    float v39 = *((float *)[v34 c_struct] + 2);
    double v40 = *((float *)[v34 c_struct] + 3);
    int v57 = 134219264;
    id v58 = v35;
    __int16 v59 = 2048;
    *(void *)unint64_t v60 = v36;
    *(_WORD *)&v60[8] = 2048;
    *(double *)int v61 = v37;
    *(_WORD *)&v61[8] = 2048;
    double v62 = v38;
    __int16 v63 = 2048;
    double v64 = v39;
    __int16 v65 = 2048;
    double v66 = v40;
    BOOL v10 = "gps %llu %f %.7f %.7f %.7f %.7f\n";
    BOOL v21 = v5;
    uint32_t v22 = 62;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v41 = v3;
    uint64_t v5 = sub_1002AB0C8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v42 = *(void **)[v41 c_struct];
    int v43 = *((_DWORD *)[v41 c_struct] + 2);
    int v44 = *((_DWORD *)[v41 c_struct] + 3);
    float v45 = *((float *)[v41 c_struct] + 4);
    int v46 = *((unsigned __int8 *)[v41 c_struct] + 20);
    int v57 = 134219008;
    id v58 = v42;
    __int16 v59 = 1024;
    *(_DWORD *)unint64_t v60 = v43;
    *(_WORD *)&v60[4] = 1024;
    *(_DWORD *)&v60[6] = v44;
    *(_WORD *)int v61 = 2048;
    *(double *)&v61[2] = v45;
    LOWORD(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 2) = v46;
    BOOL v10 = "steps %llu %d %d %.7f %d\n";
    BOOL v21 = v5;
    uint32_t v22 = 40;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v47 = v3;
    uint64_t v5 = sub_1002AB0C8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v48 = *(void **)[v47 c_struct];
    double v49 = *((float *)[v47 c_struct] + 2);
    int v57 = 134218240;
    id v58 = v48;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v49;
    BOOL v10 = "SPL %llu %f\n";
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v50 = v3;
    uint64_t v5 = sub_1002AB0C8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    v51 = *(void **)[v50 c_struct];
    double v52 = *((float *)[v50 c_struct] + 2);
    int v57 = 134218240;
    id v58 = v51;
    __int16 v59 = 2048;
    *(double *)unint64_t v60 = v52;
    BOOL v10 = "pressure %llu %f\n";
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v53 = v3;
    uint64_t v5 = sub_1002AB0C8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_18;
    }
    int v57 = 134218240;
    id v58 = [v53 timestamp];
    __int16 v59 = 1024;
    *(_DWORD *)unint64_t v60 = [v53 type];
    BOOL v10 = "SUI %llu %u\n";
    BOOL v21 = v5;
    uint32_t v22 = 18;
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  id v54 = v3;
  uint64_t v5 = sub_1002AB0C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v55 = *(void **)[v54 c_struct];
    uint64_t v56 = *((*(v54->c_struct) + 1));
    int v57 = 134218240;
    id v58 = v55;
    __int16 v59 = 2048;
    *(void *)unint64_t v60 = v56;
    BOOL v10 = "roads %llu %f\n";
LABEL_42:
    BOOL v21 = v5;
    uint32_t v22 = 22;
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
}

- (void)feedAccel800:(id)a3
{
  id v4 = (CSSPUAccel800 *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedFastAccel(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5304(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedHgAccel:(id)a3
{
  id v4 = (CSSPUHgAccel *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHgAccel(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5418(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedDeviceMotion:(id)a3
{
  id v4 = (CSSPUDM *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedDM(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B566C(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedGPS:(id)a3
{
  id v4 = (CSSPUGps *)a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    sub_1002B5780(buf);

    abort_report_np();
    __break(1u);
LABEL_9:
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    goto LABEL_4;
  }
  value = self->_details.__ptr_.__value_;
  int v7 = *((_DWORD *)value + 12);
  if (v7) {
    goto LABEL_7;
  }
  *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 16) = *((unsigned __int8 *)[(CSSPUGps *)v4 c_struct]
                                                              + 32);
  if (qword_1003DB6D0 != -1) {
    goto LABEL_9;
  }
LABEL_4:
  float v8 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 16);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SessionInfo signal %d", buf, 8u);
  }
  value = self->_details.__ptr_.__value_;
  int v7 = *((_DWORD *)value + 12);
LABEL_7:
  *((_DWORD *)value + 12) = v7 + 1;
  CLKappaAlgFlowController::feedGPS(self->fFlowControl.__ptr_.__value_, v5);
}

- (void)feedSteps:(id)a3
{
  id v4 = (CSSPUSteps *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedSteps(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5894(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedKappaTrigger:(id)a3
{
  id v4 = (CSSPUKappaTrigger *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrigger(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B59A8(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedPressure:(id)a3
{
  id v4 = (CSSPUPressure *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedPressure(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5BFC(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedSoundPressureLevel:(id)a3
{
  id v4 = (CSSPUSpl *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedAudioRms(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5D10(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedTrustedAudioResult:(id)a3
{
  id v4 = (CSSPUTrustedAudioResult *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedTrustedAudioResult(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B5E24(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedRoads:(id)a3
{
  id v4 = (CSSPURoadInfo *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRoads(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B6078(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedHertzSample:(id)a3
{
  id v4 = (CSSPUHertzSample *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedHertzSample(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B618C(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedCompanionStatus:(id)a3
{
  id v4 = (CSCompanionStatus *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedCompanionStatus(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B62A0(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedRemoteSample:(id)a3
{
  id v4 = (CSRemoteSample *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    CLKappaAlgFlowController::feedRemoteSample(self->fFlowControl.__ptr_.__value_, v4);
  }
  else
  {
    sub_1002B63B4(&v6);

    abort_report_np();
    __break(1u);
  }
}

- (void)feedSortedSamples:(id)a3
{
  id v4 = a3;
  for (unint64_t i = 0; (unint64_t)[v4 count] > i; ++i)
  {
    value = self->fFlowControl.__ptr_.__value_;
    if (!value)
    {
      sub_1002B64C8(buf);

      abort_report_np();
      __break(1u);
LABEL_51:
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
LABEL_47:
      id v11 = qword_1003DB6D8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "stop consuming samples", buf, 2u);
      }
      break;
    }
    if (!*((unsigned char *)value + 8))
    {
      if (qword_1003DB6D0 == -1) {
        goto LABEL_47;
      }
      goto LABEL_51;
    }
    int v7 = [v4 objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedAccel800:v8];
LABEL_31:

      goto LABEL_32;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedAccel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedHgAccel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      if ((char)[v8 meta] < 0)
      {
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        int v9 = (id)qword_1003DB6D8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v8 timestamp];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "ignoring stop trigger from aop %llu", buf, 0xCu);
        }
      }
      else
      {
        [(CSMartyDetectionService *)self feedKappaTrigger:v8];
      }
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedDeviceMotion:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedGPS:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedSteps:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedSoundPressureLevel:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedTrustedAudioResult:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      float v8 = v7;
      [(CSMartyDetectionService *)self feedPressure:v8];
      goto LABEL_31;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(CSMartyDetectionService *)self feedSignificantUserInteraction:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v8 = v7;
        [(CSMartyDetectionService *)self feedRoads:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v8 = v7;
        [(CSMartyDetectionService *)self feedHertzSample:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v8 = v7;
        [(CSMartyDetectionService *)self feedCompanionStatus:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        float v8 = v7;
        [(CSMartyDetectionService *)self feedRemoteSample:v8];
        goto LABEL_31;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        float v8 = sub_1002AB0C8();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CSMartyDetectionService ignoring %@", buf, 0xCu);
        }
        goto LABEL_31;
      }
    }
LABEL_32:
  }
}

- (void)feedLocationManagerResults:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_mslRecording)
  {
    id v6 = [v4 firstObject];
    [v6 coordinate];
    double v8 = v7;

    int v9 = [v5 firstObject];
    [v9 coordinate];
    float v11 = v10;

    value = self->_sessionInfoStats.__ptr_.__value_;
    *(float *)&double v8 = v8;
    *((_DWORD *)value + 1) = LODWORD(v8);
    *((float *)value + 2) = v11;
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    float v13 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "coarse location cannot be stored: IS=0 or IS=1 and not the first session in the recording", v14, 2u);
    }
  }
}

- (BOOL)coinflip:(double)a3
{
  if (a3 >= 0.0 && a3 <= 1.0)
  {
    double v7 = drand48();
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    double v8 = v7 * 100.0;
    double v9 = a3 * 100.0;
    double v10 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
    {
      int v12 = 134218240;
      double v13 = v8;
      __int16 v14 = 2048;
      double v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "coin flip = %f, rbound = %f", (uint8_t *)&v12, 0x16u);
    }
    LOBYTE(v6) = v8 <= v9 && v8 >= 0.0;
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v5 = qword_1003DB6D8;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO);
    if (v6)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "invalid rate specified", (uint8_t *)&v12, 2u);
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (void)printSamplingDefaults
{
  LODWORD(v2) = 981668463;
  [(CSMartyDetectionService *)self querySamplingRate:@"MartyPerfStandaloneScarifAcceptanceRate" withDefault:v2];
  float v5 = v4;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  BOOL v6 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    double v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "performance standalone rate %f", (uint8_t *)&v22, 0xCu);
  }
  LODWORD(v7) = 0.75;
  [(CSMartyDetectionService *)self querySamplingRate:@"MartyPerfPairedScarifAcceptanceRate" withDefault:v7];
  float v9 = v8;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  double v10 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    double v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "performance paired sampling rate %f", (uint8_t *)&v22, 0xCu);
  }
  [(CSMartyDetectionService *)self querySamplingRate:@"MartyCurStandaloneScarifAcceptanceRate" withDefault:0.0];
  float v12 = v11;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  double v13 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    double v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "curation standalone rate %f", (uint8_t *)&v22, 0xCu);
  }
  LODWORD(v14) = 1.0;
  [(CSMartyDetectionService *)self querySamplingRate:@"MartyCurCrashDetectedAcceptanceRatePaired" withDefault:v14];
  float v16 = v15;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  v17 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    double v23 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "curation paired decision rate %f", (uint8_t *)&v22, 0xCu);
  }
  LODWORD(v18) = 1.0;
  [(CSMartyDetectionService *)self querySamplingRate:@"MartyCurCrashDetectedAcceptanceRateStandalone" withDefault:v18];
  float v20 = v19;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  BOOL v21 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    int v22 = 134217984;
    double v23 = v20;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "curation standalone decision rate %f", (uint8_t *)&v22, 0xCu);
  }
}

- (BOOL)getForceDecision:(id)a3
{
  id v4 = a3;
  unsigned __int16 v5 = (unsigned __int16)[(CSPersistentConfiguration *)self->_persist getBooleanDefault:v4];
  unsigned __int8 v6 = v5;
  if (v5 >= 0x100u)
  {
    BOOL v7 = v5 != 0;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    float v8 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 1024;
      int v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "forcing %@ decision to %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int)performanceSampling
{
  value = self->_companionDeviceInfo.__ptr_.__value_;
  if (value && *((_DWORD *)value + 8))
  {
    LODWORD(v2) = 0.75;
    [(CSMartyDetectionService *)self querySamplingRate:@"MartyPerfPairedScarifAcceptanceRate" withDefault:v2];
    float v6 = v5;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    BOOL v7 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
    {
      double v8 = v6;
      *(_DWORD *)__int16 v12 = 134217984;
      *(double *)&v12[4] = v8;
      float v9 = "performance paired sampling rate %f";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, v9, v12, 0xCu);
      goto LABEL_13;
    }
  }
  else
  {
    LODWORD(v2) = 981668463;
    [(CSMartyDetectionService *)self querySamplingRate:@"MartyPerfStandaloneScarifAcceptanceRate" withDefault:v2];
    float v6 = v10;
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    BOOL v7 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
    {
      double v8 = v6;
      *(_DWORD *)__int16 v12 = 134217984;
      *(double *)&v12[4] = v8;
      float v9 = "performance standalone rate %f";
      goto LABEL_11;
    }
  }
  double v8 = v6;
LABEL_13:
  if (-[CSMartyDetectionService coinflip:](self, "coinflip:", v8, *(_OWORD *)v12)) {
    return 2;
  }
  else {
    return 0;
  }
}

- (unsigned)shouldUploadRecording
{
  unsigned __int8 v3 = [(CSMartyDetectionService *)self curationSampling];
  return [(CSMartyDetectionService *)self performanceSampling] | v3;
}

- (void)requestDeviceInfo
{
  int v4 = rand();
  unsigned __int8 v3 = MartyCompanion::serializeDeviceInfoRequest(&v4);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v3 type:303];
}

- (void)requestCompanionUpload:(int)a3
{
  value = self->_companionUUID.__ptr_.__value_;
  if (value)
  {
    if (*((char *)value + 23) < 0) {
      value = *(CompanionUUID **)value;
    }
    sub_100007BC0(&__p, (char *)value);
    int v8 = a3;
    float v6 = MartyCompanion::serializeRequestUpload(&__p);
    [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v6 type:304];

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
}

- (void)sendDeviceInfo
{
  unsigned __int8 v3 = +[CSPlatformInfo sharedInstance];
  unsigned int v4 = [v3 getSystemHardware];
  id v5 = [v3 getSystemModel];
  float v6 = (char *)[v5 UTF8String];

  if ([v3 isKappaLoggingDevice])
  {
    int v7 = 0;
  }
  else if ([v3 isKappaDetectionDevice])
  {
    int v7 = 1;
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    int v8 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "invalid kappa device type detected", (uint8_t *)&v13, 2u);
    }
    int v7 = -1;
  }
  float v9 = objc_alloc_init(CSArmedClients);
  if ((CSAOPSvc::getArmedClients((id *)self->_aop, v9) & 1) == 0)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    float v10 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "failed to get armed clients state", (uint8_t *)&v13, 2u);
    }
  }
  unsigned int v13 = v4;
  sub_100007BC0(&__p, v6);
  int v16 = v7;
  int v17 = 0;
  int KappaToken = getKappaToken(0);
  int MartyToken = getMartyToken(0);
  unsigned int v20 = [(CSArmedClients *)v9 kappaArmedSeconds];
  unsigned int v21 = [(CSArmedClients *)v9 martyArmedSecondsLocal];
  unsigned int v22 = [(CSArmedClients *)v9 enableMode];
  __int16 v12 = MartyCompanion::serializeDeviceInfo((MartyCompanion *)&v13, v11);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v12 type:300];

  if (v15 < 0) {
    operator delete(__p);
  }
}

- (void)sendCompanionUUID:(id)a3
{
  id v4 = [a3 UUIDString];
  sub_100007BC0(&__p, (char *)[v4 UTF8String]);

  float v6 = MartyCompanion::serializeCompanionUUID(&__p, v5);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v6 type:302];

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

- (void)receiveUUID:(id)a3
{
}

- (void)receiveCompanionTrigger:(id)a3
{
  MartyCompanion::deserializeTrigger((MartyCompanion *)a3, (const NSData *)a2);
  id v4 = (CompanionTrigger *)v7[0];
  v7[0] = 0;
  value = self->_companionTrigger.__ptr_.__value_;
  self->_companionTrigger.__ptr_.__value_ = v4;
  if (value) {
    operator delete();
  }
  float v6 = self->_companionTrigger.__ptr_.__value_;
  if ((*((unsigned char *)v6 + 54) & 4) == 0)
  {
    LOWORD(v7[0]) = 3;
    BYTE2(v7[0]) = 4;
    v7[1] = *((void *)v6 + 2);
    CSAOPSvc::sendCommand((CSAOPSvc *)self->_aop, (const unsigned __int8 *)v7, 0x10u);
    self->_double companionTriggerTime = *(double *)self->_companionTrigger.__ptr_.__value_;
  }
  [(CSMartyDetectionService *)self cacheUserInfo];
}

- (void)sendCompanionTrigger:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    sub_1002B6714(&Current);

    abort_report_np();
    __break(1u);
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v5 = (long long *)[v4 c_struct];
  long long v6 = *v5;
  long long v7 = v5[1];
  long long v16 = v5[2];
  long long v15 = v7;
  long long v14 = v6;
  long long v8 = v5[3];
  long long v9 = v5[4];
  long long v10 = v5[5];
  long long v20 = v5[6];
  long long v19 = v10;
  long long v18 = v9;
  long long v17 = v8;
  __int16 v12 = MartyCompanion::serializeTrigger((float16x4_t *)&Current, v11);
  [(CSCompanionServiceProtocol *)self->_companionProxy sendData:v12 type:301];
}

- (void)receiveDeviceInfo:(id)a3
{
  unsigned __int8 v3 = (MartyCompanion *)a3;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v4 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "setting companion device info", buf, 2u);
  }
  MartyCompanion::deserializeDeviceInfo(v3, v5);
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v8 = a4;
  id v9 = [objc_alloc((Class)NSString) initWithData:v8 encoding:4];
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  long long v10 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
  {
    v13[0] = 67109890;
    v13[1] = a3;
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 2112;
    id v17 = v8;
    __int16 v18 = 2048;
    double v19 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "onCompanionMessage: type: %d, msg: %@ data: %@, receivedTimestamp: %f", (uint8_t *)v13, 0x26u);
  }
  switch(a3)
  {
    case 300:
      [(CSMartyDetectionService *)self receiveDeviceInfo:v8];
      break;
    case 301:
      [(CSMartyDetectionService *)self receiveCompanionTrigger:v8];
      break;
    case 302:
      [(CSMartyDetectionService *)self receiveUUID:v8];
      break;
    case 303:
      [(CSMartyDetectionService *)self sendDeviceInfo];
      break;
    case 304:
      [(CSMartyDetectionService *)self companionDecidedToUpload:v8];
      break;
    case 305:
      value = self->_sessionInfoStats.__ptr_.__value_;
      if (value) {
        *((unsigned char *)value + 13) = 1;
      }
      break;
    case 306:
      __int16 v12 = self->_sessionInfoStats.__ptr_.__value_;
      if (v12) {
        *((unsigned char *)v12 + 12) = 1;
      }
      break;
    default:
      break;
  }
}

- (void)onCompanionStatusUpdate:(BOOL)a3 pairedDevice:(id)a4 updatedTimestamp:(double)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v8 = qword_1003DB6D8;
  if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 67109376;
    *(_DWORD *)__int16 v16 = v6;
    *(_WORD *)&v16[4] = 2048;
    *(double *)&v16[6] = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "onCompanionStatusUpdate: isConnected: %d, updatedTimestamp: %f", (uint8_t *)&v15, 0x12u);
  }
  if (qword_1003DB6D0 != -1) {
    dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
  }
  id v9 = (id)qword_1003DB6D8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 name];
    id v11 = [v10 UTF8String];
    unsigned int v12 = [v7 isNearby];
    unsigned int v13 = [v7 isDefaultPairedDevice];
    unsigned int v14 = [v7 isConnected];
    int v15 = 136315906;
    *(void *)__int16 v16 = v11;
    *(_WORD *)&v16[8] = 1024;
    *(_DWORD *)&v16[10] = v12;
    __int16 v17 = 1024;
    unsigned int v18 = v13;
    __int16 v19 = 1024;
    unsigned int v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Paired device info: name %s, isNearby %d, isDefaultPairedDevice %d, isConnected %d", (uint8_t *)&v15, 0x1Eu);
  }
}

- (void)companionDecidedToUpload:(id)a3
{
}

- (void)uploadUserInfoToCoreAnalyticsWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003B6830);
  }
  id v5 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "sendUserInfoToCoreAnalytics", buf, 2u);
  }
  BOOL v6 = +[CSPermissions sharedInstance];
  unsigned int v7 = [v6 isAuthorizedForIS];

  +[CSCoreAnalyticsUtils getSecondsSinceReboot];
  double v9 = v8;
  if (v8 > (double)self->_userInfoUploadCadence)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B6830);
    }
    id v10 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      unint64_t userInfoUploadCadence = self->_userInfoUploadCadence;
      *(_DWORD *)buf = 134217984;
      unint64_t v40 = userInfoUploadCadence;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "secondsSinceReboot exceeds UserInfo cadence. Capping at cadence pd:%llu", buf, 0xCu);
    }
    double v9 = (double)self->_userInfoUploadCadence;
  }
  [(CSMartyDetectionService *)self _updateArmingTimes];
  if (+[CSCoreAnalyticsUtils shouldAttemptCoreAnalyticsUploadWithInterval:@"CSMartyCoreAnalyticsLastSuccessfulUpload" persistentKey:(double)self->_userInfoUploadCadence])
  {
    if (v7 && (value = self->_userInfoStats.__ptr_.__value_) != 0)
    {
      v43[0] = @"didEnableKappaDetection";
      v44[0] = +[NSNumber numberWithBool:*((unsigned __int8 *)value + 2)];
      v43[1] = @"didEnableKappaDetection_companion";
      float v38 = (void *)v44[0];
      float v37 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_userInfoStats.__ptr_.__value_ + 3)];
      v44[1] = v37;
      v43[2] = @"isImproveSafetyEnabled";
      uint64_t v36 = +[NSNumber numberWithBool:*(unsigned char *)self->_userInfoStats.__ptr_.__value_];
      v44[2] = v36;
      v43[3] = @"isImproveSafetyEnabled_companion";
      uint64_t v35 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_userInfoStats.__ptr_.__value_ + 1)];
      v44[3] = v35;
      v43[4] = @"numKappaSessions";
      id v34 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 3)];
      v44[4] = v34;
      v43[5] = @"numKappaSessions_companion";
      float v33 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 4)];
      v44[5] = v33;
      v43[6] = @"numKappaTriggersAllSessions";
      float v32 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 1)];
      v44[6] = v32;
      v43[7] = @"numKappaTriggersAllSessions_companion";
      float v31 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 2)];
      v44[7] = v31;
      v43[8] = @"numMartySessionsCycle";
      float v30 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 6)];
      v44[8] = v30;
      v43[9] = @"numMartySessionsMotorbike";
      float v29 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 7)];
      v44[9] = v29;
      v43[10] = @"numMartySessionsCycle_companion";
      float v28 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 8)];
      v44[10] = v28;
      v43[11] = @"numMartySessionsMotorbike_companion";
      float v27 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 9)];
      v44[11] = v27;
      v43[12] = @"numMartyTriggersAllSessionsCycle";
      uint64_t v26 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 10)];
      v44[12] = v26;
      v43[13] = @"numMartyTriggersAllSessionsMotorBike";
      id v25 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 12)];
      v44[13] = v25;
      v43[14] = @"numMartyTriggersAllSessionsCycle_companion";
      unsigned int v24 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 11)];
      v44[14] = v24;
      v43[15] = @"numMartyTriggersAllSessionsMotorBike_companion";
      double v23 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 13)];
      v44[15] = v23;
      v43[16] = @"totalDrivingTimeCycle";
      unsigned int v22 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 14)];
      v44[16] = v22;
      v43[17] = @"totalDrivingTimeMotorcycle";
      unsigned int v21 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 15)];
      v44[17] = v21;
      v43[18] = @"totalKappaDrivingTime";
      unsigned int v20 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 16)];
      v44[18] = v20;
      v43[19] = @"minutesSinceReboot_capped";
      unsigned int v13 = +[NSNumber numberWithDouble:v9 / 60.0];
      v44[19] = v13;
      v43[20] = @"numCrashesDetectedAllSessionsCycle";
      unsigned int v14 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 19)];
      v44[20] = v14;
      v43[21] = @"numCrashesDetectedAllSessionsMotorbike";
      int v15 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 20)];
      v44[21] = v15;
      v43[22] = @"totalDrivingTimeMotorcycleLocal";
      __int16 v16 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 17)];
      v44[22] = v16;
      v43[23] = @"totalDrivingTimeMotorcycleRemote";
      __int16 v17 = +[NSNumber numberWithInt:*((unsigned int *)self->_userInfoStats.__ptr_.__value_ + 18)];
      v44[23] = v17;
      unsigned int v18 = +[NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:24];
    }
    else
    {
      unsigned int v18 = 0;
    }
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B6830);
    }
    __int16 v19 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v40 = (unint64_t)v18;
      __int16 v41 = 1024;
      unsigned int v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "UserInfo:%@, ImproveSafety:%d", buf, 0x12u);
    }
    v18;
    AnalyticsSendEventLazy();
    operator new();
  }
  if (v4) {
    v4[2](v4, 1, 0);
  }
}

- (void)_updateArmingTimes
{
  unsigned __int8 v3 = +[CSPlatformInfo sharedInstance];
  unsigned __int8 v4 = [v3 isKappaLoggingDevice];

  if (v4)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B6830);
    }
    id v5 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "getStat not supported", (uint8_t *)&v14, 2u);
    }
    *((void *)self->_userInfoStats.__ptr_.__value_ + 7) = -1;
  }
  else
  {
    BOOL v6 = objc_alloc_init(CSCAStat);
    aop = (CSAOPSvc *)self->_aop;
    if (aop && self->_userInfoStats.__ptr_.__value_)
    {
      CSAOPSvc::getStat(aop, v6);
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 14) = [(CSCAStat *)v6 armedSecMartyBicycle];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 15) = [(CSCAStat *)v6 armedSecMartyLocal];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 18) = [(CSCAStat *)v6 armedSecMartyRemote];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 17) = [(CSCAStat *)v6 armedSecMartyLocal];
    }
    else
    {
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_1003B6830);
      }
      double v8 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
      {
        BOOL v9 = self->_aop != 0;
        BOOL v10 = self->_userInfoStats.__ptr_.__value_ != 0;
        int v14 = 67109376;
        BOOL v15 = v9;
        __int16 v16 = 1024;
        BOOL v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Unable to query AOP, _aop valid:%d, _userInfoStats valid:%d", (uint8_t *)&v14, 0xEu);
      }
    }
  }
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003B6830);
  }
  id v11 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 14);
    int v13 = *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 15);
    int v14 = 67109376;
    BOOL v15 = v13;
    __int16 v16 = 1024;
    BOOL v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "martyDrivingTimeMotorcycle:%d, martyDrivingTimeCycle:%d", (uint8_t *)&v14, 0xEu);
  }
}

- (void)sendSessionInfoToCoreAnalytics
{
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003B6830);
  }
  unsigned __int8 v3 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "sendSessionInfoToCoreAnalytics", buf, 2u);
  }
  if (self->_aborted)
  {
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B6830);
    }
    unsigned __int8 v4 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v5 = "aborted sessions will not be sent";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
  else
  {
    value = self->_sessionInfoStats.__ptr_.__value_;
    if (value)
    {
      if (*(unsigned char *)value)
      {
        unsigned int v7 = +[CSPermissions sharedInstance];
        unsigned int v42 = [v7 isAuthorizedForIS];

        if (v42 && (BOOL v9 = self->_sessionInfoStats.__ptr_.__value_) != 0)
        {
          v47[0] = @"coarseLat";
          LODWORD(v8) = *((_DWORD *)v9 + 1);
          BOOL v10 = +[NSNumber numberWithFloat:v8];
          v48[0] = v10;
          v47[1] = @"coarseLong";
          LODWORD(v11) = *((_DWORD *)self->_sessionInfoStats.__ptr_.__value_ + 2);
          __int16 v41 = +[NSNumber numberWithFloat:v11];
          v48[1] = v41;
          v47[2] = @"companionEscalationDecisionCycle";
          unint64_t v40 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 12)];
          v48[2] = v40;
          v47[3] = @"companionEscalationDecisionMotorbike";
          float v39 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 13)];
          v48[3] = v39;
          v47[4] = @"didCompanionTriggerCycle";
          float v38 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 14)];
          v48[4] = v38;
          v47[5] = @"didCompanionTriggerMotorbike";
          float v37 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 15)];
          v48[5] = v37;
          v47[6] = @"didPlaceCallCycle";
          uint64_t v36 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 16)];
          v48[6] = v36;
          v47[7] = @"didPlaceCallMotorbike";
          uint64_t v35 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 17)];
          v48[7] = v35;
          v47[8] = @"didRaiseUICycle";
          id v34 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 18)];
          v48[8] = v34;
          v47[9] = @"didRaiseUICycle_companion";
          float v33 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 19)];
          v48[9] = v33;
          v47[10] = @"didRaiseUIMotorbike";
          float v32 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 20)];
          v48[10] = v32;
          v47[11] = @"didRaiseUIMotorbike_companion";
          float v31 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 21)];
          v48[11] = v31;
          v47[12] = @"escalationDecisionCycle";
          float v30 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 22)];
          v48[12] = v30;
          v47[13] = @"escalationDecisionMotorbike";
          float v29 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 23)];
          v48[13] = v29;
          v47[14] = @"isCompanionConnected";
          float v28 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 24)];
          v48[14] = v28;
          v47[15] = @"isSOSAutoInitiatedCycle";
          float v27 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 25)];
          v48[15] = v27;
          v47[16] = @"isSOSAutoInitiatedMotorbike";
          uint64_t v26 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 26)];
          v48[16] = v26;
          v47[17] = @"isSOSUserInitiatedCycle";
          id v25 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 27)];
          v48[17] = v25;
          v47[18] = @"isSOSUserInitiatedMotorbike";
          unsigned int v24 = +[NSNumber numberWithBool:*((unsigned __int8 *)self->_sessionInfoStats.__ptr_.__value_ + 28)];
          v48[18] = v24;
          v47[19] = @"locallyArmedBitmap";
          double v23 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 8)];
          v48[19] = v23;
          v47[20] = @"numAlphaDetectedCycle";
          unsigned int v22 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 9)];
          v48[20] = v22;
          v47[21] = @"numAlphaDetectedMotorbike";
          unsigned int v21 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 10)];
          v48[21] = v21;
          v47[22] = @"numEarlyCrashesDetectedCycle";
          int v12 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 11)];
          v48[22] = v12;
          v47[23] = @"numEarlyCrashesDetectedMotorbike";
          int v13 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 12)];
          v48[23] = v13;
          v47[24] = @"numTriggersCycle";
          int v14 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 13)];
          v48[24] = v14;
          v47[25] = @"numTriggersMotorbike";
          BOOL v15 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 14)];
          v48[25] = v15;
          v47[26] = @"overrideModeBitmap";
          __int16 v16 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 15)];
          v48[26] = v16;
          v47[27] = @"signalEnvironment";
          BOOL v17 = +[NSNumber numberWithInt:*((unsigned int *)self->_sessionInfoStats.__ptr_.__value_ + 16)];
          v48[27] = v17;
          unsigned int v20 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:28];

          id v18 = v20;
          AnalyticsSendEventLazy();
        }
        else
        {
          id v18 = 0;
        }
        if (qword_1003DB750 != -1) {
          dispatch_once(&qword_1003DB750, &stru_1003B6830);
        }
        __int16 v19 = qword_1003DB758;
        if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = v18;
          __int16 v45 = 1024;
          unsigned int v46 = v42;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "SessionInfo:%@, ImproveSafety:%d", buf, 0x12u);
        }
      }
      else
      {
        if (qword_1003DB750 != -1) {
          dispatch_once(&qword_1003DB750, &stru_1003B6830);
        }
        unsigned __int8 v4 = qword_1003DB758;
        if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          id v5 = "refusing to send a session that was forced or postRiding only";
          goto LABEL_10;
        }
      }
    }
    else
    {
      if (qword_1003DB750 != -1) {
        dispatch_once(&qword_1003DB750, &stru_1003B6830);
      }
      unsigned __int8 v4 = qword_1003DB758;
      if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v5 = "_sessionInfoStats is null";
        goto LABEL_10;
      }
    }
  }
}

- (void)cacheUserInfo
{
  value = self->_userInfoStats.__ptr_.__value_;
  if (value)
  {
    id v4 = +[NSData dataWithBytes:value length:84];
    -[NSUserDefaults setObject:forKey:](self->_defaults, "setObject:forKey:");
  }
}

- (void)updateMartyUserInfoWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && self->_userInfoStats.__ptr_.__value_)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"isImproveSafetyEnabled"];

    if (v6)
    {
      unsigned int v7 = [v5 objectForKeyedSubscript:@"isImproveSafetyEnabled"];
      *(unsigned char *)self->_userInfoStats.__ptr_.__value_ = [v7 BOOLValue];
    }
    double v8 = [v5 objectForKeyedSubscript:@"isImproveSafetyEnabled_companion"];

    if (v8)
    {
      BOOL v9 = [v5 objectForKeyedSubscript:@"isImproveSafetyEnabled_companion"];
      *((unsigned char *)self->_userInfoStats.__ptr_.__value_ + 1) = [v9 BOOLValue];
    }
    BOOL v10 = [v5 objectForKeyedSubscript:@"didEnableKappaDetection"];

    if (v10)
    {
      double v11 = [v5 objectForKeyedSubscript:@"didEnableKappaDetection"];
      *((unsigned char *)self->_userInfoStats.__ptr_.__value_ + 2) = [v11 BOOLValue];
    }
    int v12 = [v5 objectForKeyedSubscript:@"didEnableKappaDetection_companion"];

    if (v12)
    {
      int v13 = [v5 objectForKeyedSubscript:@"didEnableKappaDetection_companion"];
      *((unsigned char *)self->_userInfoStats.__ptr_.__value_ + 3) = [v13 BOOLValue];
    }
    int v14 = [v5 objectForKeyedSubscript:@"numTriggersAllSessions"];

    if (v14)
    {
      BOOL v15 = [v5 objectForKeyedSubscript:@"numTriggersAllSessions"];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 1) = [v15 intValue];
    }
    __int16 v16 = [v5 objectForKeyedSubscript:@"numTriggersAllSessions_companion"];

    if (v16)
    {
      BOOL v17 = [v5 objectForKeyedSubscript:@"numTriggersAllSessions_companion"];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 2) = [v17 intValue];
    }
    id v18 = [v5 objectForKeyedSubscript:@"numKappaSessions"];

    if (v18)
    {
      __int16 v19 = [v5 objectForKeyedSubscript:@"numKappaSessions"];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 3) = [v19 intValue];
    }
    unsigned int v20 = [v5 objectForKeyedSubscript:@"numKappaSessions_companion"];

    if (v20)
    {
      unsigned int v21 = [v5 objectForKeyedSubscript:@"numKappaSessions_companion"];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 4) = [v21 intValue];
    }
    unsigned int v22 = [v5 objectForKeyedSubscript:@"totalDrivingTime"];

    if (v22)
    {
      double v23 = [v5 objectForKeyedSubscript:@"totalDrivingTime"];
      *((_DWORD *)self->_userInfoStats.__ptr_.__value_ + 16) = [v23 intValue];
    }
    if (qword_1003DB750 != -1) {
      dispatch_once(&qword_1003DB750, &stru_1003B6830);
    }
    unsigned int v24 = qword_1003DB758;
    if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v26) = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "updateMartyUserInfoWithInfo updated stats", (uint8_t *)&v26, 2u);
    }
  }
  if (qword_1003DB750 != -1) {
    dispatch_once(&qword_1003DB750, &stru_1003B6830);
  }
  id v25 = qword_1003DB758;
  if (os_log_type_enabled((os_log_t)qword_1003DB758, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 138412290;
    float v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v26, 0xCu);
  }
}

- (void)clearCAStats
{
  aop = (CSAOPSvc *)self->_aop;
  if (aop) {
    CSAOPSvc::clearStat(aop);
  }
}

- (id)userInfoUploader
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1002B3F54;
  v5[3] = &unk_1003B67D0;
  objc_copyWeak(&v6, &location);
  double v2 = objc_retainBlock(v5);
  unsigned __int8 v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)didReceiveSOSAck:(int64_t)a3 forMode:(unsigned __int8)a4
{
  if (a4 == 2)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    id v6 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 134217984;
      int64_t v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "didReceiveSOSAck response:%ld", (uint8_t *)&v16, 0xCu);
    }
    if ((unint64_t)a3 <= 6)
    {
      if (((1 << a3) & 0x65) != 0)
      {
        self->_BOOL SOSInProgress = 1;
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        uint64_t v7 = qword_1003DB6D8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
        {
          BOOL SOSInProgress = self->_SOSInProgress;
          int v16 = 67109120;
          LODWORD(v17) = SOSInProgress;
          BOOL v9 = "didReceiveSOSAck setting _SOSInProgress to %d";
          BOOL v10 = v7;
          os_log_type_t v11 = OS_LOG_TYPE_INFO;
          uint32_t v12 = 8;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v16, v12);
        }
      }
      else
      {
        self->_BOOL SOSInProgress = 0;
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        int v14 = qword_1003DB6D8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_INFO))
        {
          BOOL v15 = self->_SOSInProgress;
          int v16 = 67109120;
          LODWORD(v17) = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "didReceiveSOSAck setting _SOSInProgress to %d", (uint8_t *)&v16, 8u);
        }
        [(CSMSLDataRecording *)self->_mslRecording updateMetadata:&off_1003C3568];
        [(CSHSMObjc *)self->_hsm signal:5 data:0];
      }
    }
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v13 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      BOOL v9 = "sos status ack invalid mode";
      BOOL v10 = v13;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 2;
      goto LABEL_16;
    }
  }
}

- (void)didReceiveSOSStatusUpdate:(id)a3 forMode:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  if (v4 == 2)
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    uint64_t v7 = (id)qword_1003DB6D8;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v8 = [v6 sosStatus];
      id v9 = [v8 flowState];
      unsigned int v10 = [v6 isKappaFlow];
      unsigned int v11 = [v6 isKappaFlowActive];
      uint32_t v12 = [v6 sosStatus];
      *(_DWORD *)buf = 134218752;
      *(void *)__int16 v41 = v9;
      *(_WORD *)&v41[8] = 1024;
      unsigned int v42 = v10;
      __int16 v43 = 1024;
      unsigned int v44 = v11;
      __int16 v45 = 1024;
      unsigned int v46 = [v12 isPairedDeviceStatus];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate state:%ld, isKappaFlow:%d, isKappaFlowActive:%d isFromPaired:%d", buf, 0x1Eu);
    }
    if (([v6 isKappaFlow] & 1) == 0)
    {
      if (qword_1003DB6D0 != -1) {
        dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
      }
      uint64_t v13 = qword_1003DB6D8;
      if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Received non-Kappa flow state from SOS SM (should never happen)", buf, 2u);
      }
    }
    int v14 = [v6 sosStatus];
    unsigned int v15 = [v14 isPairedDeviceStatus];

    switch((unint64_t)[v6 sosKappaState])
    {
      case 1uLL:
        if (v15) {
          int v16 = &off_1003C35B8;
        }
        else {
          int v16 = &off_1003C3590;
        }
        [(CSMSLDataRecording *)self->_mslRecording updateMetadata:v16];
        if (qword_1003DB6D0 != -1) {
          dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
        }
        int64_t v17 = qword_1003DB6D8;
        if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)__int16 v41 = v15 ^ 1;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "didReceiveSOSStatusUpdate SOSKappaStateUserCheckIn isLocal %d", buf, 8u);
        }
        value = self->_sessionInfoStats.__ptr_.__value_;
        if (*((unsigned char *)self->_details.__ptr_.__value_ + 8))
        {
          if (v15) {
            *((unsigned char *)value + 19) = 1;
          }
          else {
            *((unsigned char *)value + 18) = 1;
          }
        }
        else if (v15)
        {
          *((unsigned char *)value + 21) = 1;
        }
        else
        {
          *((unsigned char *)value + 20) = 1;
        }
        break;
      case 3uLL:
        mslRecording = self->_mslRecording;
        CFStringRef v38 = @"userResponse";
        unsigned int v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 sosKappaState]);
        float v39 = v21;
        unsigned int v22 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        [(CSMSLDataRecording *)mslRecording updateMetadata:v22];

        double v23 = self->_sessionInfoStats.__ptr_.__value_;
        if (*((unsigned char *)self->_details.__ptr_.__value_ + 8))
        {
          *((unsigned char *)v23 + 16) = 1;
          *((unsigned char *)v23 + 27) = 1;
        }
        else
        {
          *((unsigned char *)v23 + 17) = 1;
          *((unsigned char *)v23 + 28) = 1;
        }
        break;
      case 4uLL:
        unsigned int v24 = self->_mslRecording;
        CFStringRef v36 = @"userResponse";
        id v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 sosKappaState]);
        float v37 = v25;
        int v26 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        [(CSMSLDataRecording *)v24 updateMetadata:v26];

        float v27 = self->_sessionInfoStats.__ptr_.__value_;
        if (*((unsigned char *)self->_details.__ptr_.__value_ + 8))
        {
          *((unsigned char *)v27 + 16) = 1;
          *((unsigned char *)v27 + 25) = 1;
        }
        else
        {
          *((unsigned char *)v27 + 17) = 1;
          *((unsigned char *)v27 + 26) = 1;
        }
        break;
      case 6uLL:
        float v28 = self->_mslRecording;
        float v29 = +[NSNumber numberWithInteger:[v6 sosKappaState:@"userResponse"]];
        uint64_t v35 = v29;
        float v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        [(CSMSLDataRecording *)v28 updateMetadata:v30];

        break;
      default:
        break;
    }
    BOOL SOSInProgress = self->_SOSInProgress;
    if (self->_SOSInProgress)
    {
      unsigned int v32 = 1;
    }
    else
    {
      unsigned int v32 = [v6 isKappaFlowActive];
      self->_BOOL SOSInProgress = v32;
    }
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    float v33 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)__int16 v41 = SOSInProgress;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "prev %d, current %d", buf, 0xEu);
    }
    if (SOSInProgress && !v32) {
      [(CSHSMObjc *)self->_hsm signal:5 data:0];
    }
  }
  else
  {
    if (qword_1003DB6D0 != -1) {
      dispatch_once(&qword_1003DB6D0, &stru_1003B67F0);
    }
    __int16 v19 = qword_1003DB6D8;
    if (os_log_type_enabled((os_log_t)qword_1003DB6D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "sos status update for invalid mode", buf, 2u);
    }
  }
}

- (CSMSLDataRecording)mslRecording
{
  return self->_mslRecording;
}

- (void)setMslRecording:(id)a3
{
}

- (CSCompanionServiceProtocol)companionProxy
{
  return self->_companionProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionProxy, 0);
  objc_storeStrong((id *)&self->_mslRecording, 0);
  value = self->_details.__ptr_.__value_;
  self->_details.__ptr_.__value_ = 0;
  if (value) {
    operator delete();
  }
  int v4 = self->_sessionInfoStats.__ptr_.__value_;
  self->_sessionInfoStats.__ptr_.__value_ = 0;
  if (v4) {
    operator delete();
  }
  id v5 = self->_userInfoStats.__ptr_.__value_;
  self->_userInfoStats.__ptr_.__value_ = 0;
  if (v5) {
    operator delete();
  }
  objc_storeStrong((id *)&self->_uuid, 0);
  id v6 = self->_companionUUID.__ptr_.__value_;
  self->_companionUUID.__ptr_.__value_ = 0;
  if (v6) {
    sub_100012E84((uint64_t)&self->_companionUUID, (uint64_t)v6);
  }
  uint64_t v7 = self->_companionTrigger.__ptr_.__value_;
  self->_companionTrigger.__ptr_.__value_ = 0;
  if (v7) {
    operator delete();
  }
  double v8 = self->_companionDeviceInfo.__ptr_.__value_;
  self->_companionDeviceInfo.__ptr_.__value_ = 0;
  if (v8) {
    sub_1002B4B84((uint64_t)&self->_companionDeviceInfo, (uint64_t)v8);
  }
  id v9 = self->fFlowControl.__ptr_.__value_;
  self->fFlowControl.__ptr_.__value_ = 0;
  if (v9) {
    (*(void (**)(CLKappaAlgFlowController *))(*(void *)v9 + 8))(v9);
  }
  objc_storeStrong((id *)&self->_sosTimer, 0);
  objc_storeStrong((id *)&self->_triggerTimer, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_persist, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
  objc_storeStrong((id *)&self->_sosSM, 0);
  objc_storeStrong((id *)&self->_vendor, 0);
  objc_storeStrong((id *)&self->_silo, 0);
  objc_storeStrong((id *)&self->_martyTTR, 0);
  objc_storeStrong(&self->_waitForSOSState, 0);
  objc_storeStrong(&self->_readingState, 0);
  objc_storeStrong(&self->_idleState, 0);

  objc_storeStrong((id *)&self->_hsm, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 21) = 0;
  return self;
}

@end