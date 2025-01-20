@interface CSSafetySOSStateMachine
- (BOOL)notifySOStoAOP;
- (BOOL)valid;
- (CSSafetySOSStateMachine)initWithSilo:(id)a3 vendor:(id)a4 client:(id)a5 aopService:(void *)a6;
- (void)clearAll;
- (void)dealloc;
- (void)feedCompanionDetected;
- (void)feedDetectionDecision:(BOOL)a3 uuid:(id)a4 forMode:(unsigned __int8)a5;
- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4;
- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4 martyIsBicycle:(BOOL)a5;
- (void)notifyCompanionOfSafetyEventType:(int)a3;
- (void)notifySOSDaemon;
- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5;
- (void)resetAllPersistedValues;
- (void)setValid:(BOOL)a3;
- (void)startTimer:(double)a3;
- (void)stopTimer;
- (void)updateCompanionUUID:(id)a3;
- (void)updateLocalUUID:(id)a3;
- (void)updatedSOSKappaStatus:(id)a3;
@end

@implementation CSSafetySOSStateMachine

- (CSSafetySOSStateMachine)initWithSilo:(id)a3 vendor:(id)a4 client:(id)a5 aopService:(void *)a6
{
  id v82 = a3;
  id v81 = a4;
  id v80 = a5;
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v10 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "beginService SM", buf, 2u);
  }
  self->_valid = 1;
  objc_storeStrong((id *)&self->_client, a5);
  objc_storeStrong((id *)&self->_vendor, a4);
  self->_aopSvc = a6;
  v11 = [v81 proxyForService:@"CSCompanionService"];
  companion = self->_companion;
  self->_companion = v11;

  [(CSCompanionServiceProtocol *)self->_companion registerDelegate:self inSilo:v82];
  [(CSCompanionServiceProtocol *)self->_companion registerClient:self];
  id v13 = objc_initWeak(&location, self);
  v14 = (CLTimer *)[v82 newTimer];
  timer = self->_timer;
  self->_timer = v14;

  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1002BC4B8;
  v93[3] = &unk_10039F568;
  v16 = self;
  v94 = v16;
  [(CLTimer *)self->_timer setHandler:v93];
  v17 = +[SOSKappaManager sharedInstance];
  [v17 addObserver:v16];

  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_1002BC55C;
  v91[3] = &unk_1003B67A8;
  v18 = v16;
  v92 = v18;
  v19 = objc_retainBlock(v91);
  p_id idleState = &v18->_idleState;
  id idleState = v18->_idleState;
  v18->_id idleState = v19;

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_1002BC5E4;
  v89[3] = &unk_1003B67A8;
  v22 = v18;
  v90 = v22;
  v23 = objc_retainBlock(v89);
  id potentialCrashState = v22->_potentialCrashState;
  v22->_id potentialCrashState = v23;

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_1002BC6C0;
  v87[3] = &unk_1003B67A8;
  v25 = v22;
  v88 = v25;
  v26 = objc_retainBlock(v87);
  id crashStagingState = v25->_crashStagingState;
  v25->_id crashStagingState = v26;

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1002BC94C;
  v85[3] = &unk_1003B67A8;
  v28 = v25;
  v86 = v28;
  v29 = objc_retainBlock(v85);
  p_id notifyingCompanionState = &v28->_notifyingCompanionState;
  id notifyingCompanionState = v28->_notifyingCompanionState;
  v28->_id notifyingCompanionState = v29;

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_1002BCA18;
  v83[3] = &unk_1003B67A8;
  v32 = v28;
  v84 = v32;
  v33 = objc_retainBlock(v83);
  id crashProcessingState = v32->_crashProcessingState;
  v32->_id crashProcessingState = v33;

  uint64_t v35 = +[NSUserDefaults standardUserDefaults];
  defaults = v32->_defaults;
  v32->_defaults = (NSUserDefaults *)v35;

  [(NSUserDefaults *)v32->_defaults removeObjectForKey:kSOSEventKey];
  v37 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned int v38 = [v37 BOOLForKey:@"ActiveKappaDecision"];

  v39 = +[CSPersistentConfiguration sharedConfiguration];
  unsigned int v79 = [v39 BOOLForKey:@"WaitingForSOSAck"];

  id v40 = objc_alloc((Class)NSUUID);
  v41 = +[CSPersistentConfiguration sharedConfiguration];
  v42 = [v41 objectForKey:@"KappaSOSUUID"];
  id v43 = [v40 initWithUUIDString:v42];

  if (v38)
  {
    v44 = +[SOSKappaManager currentSOSStatus];
    double v45 = [v44 uuid];

    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    v46 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v97 = v43;
      *(_WORD *)&v97[8] = 2112;
      CFAbsoluteTime v98 = v45;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "Start - SOS UUID: lastReceivedSOSUUID: %@, currentSOSUUID: %@", buf, 0x16u);
    }
    if ([*(id *)&v45 isEqual:v43])
    {
      v47 = +[CSPersistentConfiguration sharedConfiguration];
      [v47 doubleForKey:@"KappaLocalTimestamp"];
      v32->_double localDecisionTimestamp = v48;

      v49 = +[CSPersistentConfiguration sharedConfiguration];
      [v49 doubleForKey:@"KappaExpirationTimestamp"];
      double v51 = v50;

      double localDecisionTimestamp = v32->_localDecisionTimestamp;
      if (localDecisionTimestamp >= CFAbsoluteTimeGetCurrent() || CFAbsoluteTimeGetCurrent() >= v51)
      {
        if (qword_1003DB7E0 != -1) {
          dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
        }
        v64 = (id)qword_1003DB7E8;
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134218240;
          *(double *)v97 = v51;
          *(_WORD *)&v97[8] = 2048;
          CFAbsoluteTime v98 = Current;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Recovered expired crash, discarding. expirationTime:%f, currentTime:%f", buf, 0x16u);
        }

        [(CSSafetySOSStateMachine *)v32 resetAllPersistedValues];
      }
      else
      {
        if (qword_1003DB7E0 != -1) {
          dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
        }
        v53 = qword_1003DB7E8;
        if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_INFO))
        {
          double v54 = v32->_localDecisionTimestamp;
          *(_DWORD *)buf = 134217984;
          *(double *)v97 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Recovered valid crash, crashDecisionTimestamp:%f", buf, 0xCu);
        }
        v32->_BOOL sendUnprocessedCrash = 1;
        v32->_localShouldSend = 1;
        id v55 = objc_alloc((Class)NSUUID);
        v78 = +[CSPersistentConfiguration sharedConfiguration];
        v56 = [v78 objectForKey:@"KappaLocalUUID"];
        v57 = (NSUUID *)[v55 initWithUUIDString:v56];
        localTriggerUUID = v32->_localTriggerUUID;
        v32->_localTriggerUUID = v57;

        id v59 = objc_alloc((Class)NSUUID);
        v60 = +[CSPersistentConfiguration sharedConfiguration];
        v61 = [v60 objectForKey:@"KappaCompanionUUID"];
        v62 = (NSUUID *)[v59 initWithUUIDString:v61];
        companionTriggerUUID = v32->_companionTriggerUUID;
        v32->_companionTriggerUUID = v62;

        [(CSSafetySOSStateMachineClientProtocol *)self->_client didInitWithUnprocessedCrash:v32->_localTriggerUUID withCompanionUUID:v32->_companionTriggerUUID];
      }
    }
  }
  else
  {
    v32->_BOOL sendUnprocessedCrash = 0;
  }
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v66 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    BOOL sendUnprocessedCrash = v32->_sendUnprocessedCrash;
    v69 = v32->_companionTriggerUUID;
    double v68 = v32->_localDecisionTimestamp;
    v70 = v32->_localTriggerUUID;
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v97 = v38;
    *(_WORD *)&v97[4] = 1024;
    *(_DWORD *)&v97[6] = v79;
    LOWORD(v98) = 1024;
    *(_DWORD *)((char *)&v98 + 2) = sendUnprocessedCrash;
    HIWORD(v98) = 2112;
    v99 = v70;
    __int16 v100 = 2048;
    double v101 = v68;
    __int16 v102 = 2112;
    v103 = v69;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "activeKappaDecision:%d, waitingForSOSAck:%d, _sendUnprocessedCrash:%d, localUUID:%@, localDecisionTimestamp:%f, companionUUID:%@", buf, 0x32u);
  }
  v71 = [CSHSMObjc alloc];
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  id v72 = (id)qword_1003DB7E8;
  if (v32->_sendUnprocessedCrash) {
    v73 = p_notifyingCompanionState;
  }
  else {
    v73 = p_idleState;
  }
  v74 = [(CSHSMObjc *)v71 initWithCategory:v72 state:*v73];
  hsm = v32->_hsm;
  v32->_hsm = v74;

  v76 = v32;
  objc_destroyWeak(&location);

  return v76;
}

- (void)dealloc
{
  v3 = +[SOSKappaManager sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSSafetySOSStateMachine;
  [(CSSafetySOSStateMachine *)&v4 dealloc];
}

- (void)startTimer:(double)a3
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v5 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "startTimer", v6, 2u);
  }
  [(CLTimer *)self->_timer setNextFireDelay:a3 interval:1.79769313e308];
}

- (void)stopTimer
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v3 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "stopTimer", v4, 2u);
  }
  [(CLTimer *)self->_timer setNextFireDelay:1.79769313e308 interval:1.79769313e308];
}

- (void)updateLocalUUID:(id)a3
{
  id v4 = a3;
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v5 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 138412290;
    id v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateLocalUUID with %@", (uint8_t *)&v22, 0xCu);
  }
  if (self->_localTriggerUUID)
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    v6 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Overwriting previous UUID", (uint8_t *)&v22, 2u);
    }
  }
  if (!v4)
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    v7 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "UUID is nil in updateLocalUUID", (uint8_t *)&v22, 2u);
    }
  }
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v8 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    localTriggerUUID = self->_localTriggerUUID;
    int v22 = 138412546;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = localTriggerUUID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "UUID new: %@ prev: %@", (uint8_t *)&v22, 0x16u);
  }
  id v10 = objc_alloc((Class)NSUUID);
  v11 = [v4 UUIDString];
  v12 = (NSUUID *)[v10 initWithUUIDString:v11];
  id v13 = self->_localTriggerUUID;
  self->_localTriggerUUID = v12;

  self->_double localDecisionTimestamp = CFAbsoluteTimeGetCurrent();
  v14 = +[CSPersistentConfiguration sharedConfiguration];
  v15 = [v14 objectForKey:@"KappaExpirationPeriod"];

  v16 = +[CSPersistentConfiguration sharedConfiguration];
  [v16 doubleForKey:@"KappaExpirationPeriod"];
  double v18 = v17;

  double localDecisionTimestamp = self->_localDecisionTimestamp;
  if (!v15) {
    double v18 = 3600.0;
  }
  defaults = self->_defaults;
  v21 = [(NSUUID *)self->_localTriggerUUID UUIDString];
  [(NSUserDefaults *)defaults setObject:v21 forKey:@"KappaLocalUUID"];

  [(NSUserDefaults *)self->_defaults setDouble:@"KappaLocalTimestamp" forKey:self->_localDecisionTimestamp];
  [(NSUserDefaults *)self->_defaults setDouble:@"KappaExpirationTimestamp" forKey:v18 + localDecisionTimestamp];
}

- (void)updateCompanionUUID:(id)a3
{
  id v4 = a3;
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v5 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "updateCompanionUUID with %@", (uint8_t *)&v17, 0xCu);
  }
  if (self->_companionTriggerUUID)
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    v6 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Overwriting previous companion UUID", (uint8_t *)&v17, 2u);
    }
  }
  if (!v4)
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    v7 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Companion UUID is nil in updateCompanionUUID", (uint8_t *)&v17, 2u);
    }
  }
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v8 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    companionTriggerUUID = self->_companionTriggerUUID;
    int v17 = 138412546;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = companionTriggerUUID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "CompanionUUID new: %@ prev: %@", (uint8_t *)&v17, 0x16u);
  }
  id v10 = objc_alloc((Class)NSUUID);
  v11 = [v4 UUIDString];
  v12 = (NSUUID *)[v10 initWithUUIDString:v11];
  p_companionTriggerUUID = &self->_companionTriggerUUID;
  id v13 = self->_companionTriggerUUID;
  self->_companionTriggerUUID = v12;

  defaults = self->_defaults;
  v16 = [(NSUUID *)*p_companionTriggerUUID UUIDString];
  [(NSUserDefaults *)defaults setObject:v16 forKey:@"KappaCompanionUUID"];
}

- (void)notifySOSDaemon
{
  p_defaults = &self->_defaults;
  [(NSUserDefaults *)self->_defaults setBool:1 forKey:@"WaitingForSOSAck"];
  id v4 = [(NSUserDefaults *)*p_defaults objectForKey:@"SimulateCrashProbability"];

  if (v4)
  {
    [(NSUserDefaults *)*p_defaults doubleForKey:@"SimulateCrashProbability"];
    if (drand48() < v5)
    {
      v7 = (_Unwind_Exception *)sub_1002BE2EC((id *)p_defaults);
      objc_destroyWeak((id *)v4);

      objc_destroyWeak(&location);
      _Unwind_Resume(v7);
    }
  }
  objc_initWeak(&location, self);
  v6 = +[SOSKappaManager sharedInstance];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002BD4F4;
  v8[3] = &unk_1003B7678;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  [v6 triggerKappaWithCompletion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)notifyCompanionOfSafetyEventType:(int)a3
{
  if ((a3 - 3) > 0xFFFFFFFD)
  {
    v7[0] = a3;
    v6 = sub_10001A994(v7);
    [(CSCompanionServiceProtocol *)self->_companion sendData:v6 type:400];
  }
  else
  {
    if (qword_1003DB710 != -1) {
      dispatch_once(&qword_1003DB710, &stru_1003B76B8);
    }
    id v4 = qword_1003DB718;
    if (os_log_type_enabled((os_log_t)qword_1003DB718, OS_LOG_TYPE_FAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "invalid mode %d", (uint8_t *)v7, 8u);
    }
  }
}

- (BOOL)notifySOStoAOP
{
  unsigned __int8 v3 = 6;
  CSAOPSvc::sendCommand((CSAOPSvc *)self->_aopSvc, &v3, 1u);
  return 1;
}

- (void)feedCompanionDetected
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  unsigned __int8 v3 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "feedCompanionDetected", v4, 2u);
  }
  [(CSHSMObjc *)self->_hsm signal:4 data:0];
}

- (void)feedDetectionDecision:(BOOL)a3 uuid:(id)a4 forMode:(unsigned __int8)a5
{
  int v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  if (self->_mode != v5)
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    id v9 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_FAULT))
    {
      unsigned __int8 mode = self->_mode;
      LODWORD(v17) = 16777728;
      BYTE4(v17) = mode;
      *(_WORD *)((char *)&v17 + 5) = 256;
      HIBYTE(v17) = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "SOS mode switch detected %hhu -> %hhu", (uint8_t *)&v17, 8u);
    }
    self->_unsigned __int8 mode = v5;
  }
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  v11 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v17) = 67109378;
    HIDWORD(v17) = v6;
    LOWORD(v18[0]) = 2112;
    *(void *)((char *)v18 + 2) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "feedDetectionDecision: decision: %d uuid: %@", (uint8_t *)&v17, 0x12u);
  }
  uint64_t v17 = 0;
  v18[0] = 0;
  [v8 getUUIDBytes:&v17];
  defaults = self->_defaults;
  id v13 = +[SOSKappaManager currentSOSStatus];
  v14 = [v13 uuid];
  v15 = [v14 UUIDString];
  [(NSUserDefaults *)defaults setObject:v15 forKey:@"KappaSOSUUID"];

  hsm = self->_hsm;
  if (v6) {
    [(CSHSMObjc *)hsm signal:2 data:&v17];
  }
  else {
    [(CSHSMObjc *)hsm signal:3 data:0];
  }
}

- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4
{
}

- (void)feedPotentialEventWithTimestamp:(unint64_t)a3 forMode:(unsigned __int8)a4 martyIsBicycle:(BOOL)a5
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  id v9 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 134217984;
    unint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "feedPotentialEventWithTimestamp: timestamp %llu", (uint8_t *)&v10, 0xCu);
  }
  self->_unsigned __int8 mode = a4;
  self->_martyIsBicycle = a5;
  [(CSHSMObjc *)self->_hsm signal:1 data:0];
}

- (void)resetAllPersistedValues
{
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"KappaLocalUUID"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"KappaLocalTimestamp"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"KappaExpirationTimestamp"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"KappaExpirationPeriod"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"KappaCompanionUUID"];
  [(NSUserDefaults *)self->_defaults setBool:0 forKey:@"ActiveKappaDecision"];
  [(NSUserDefaults *)self->_defaults setBool:0 forKey:@"WaitingForSOSAck"];
  defaults = self->_defaults;

  [(NSUserDefaults *)defaults removeObjectForKey:@"KappaSOSUUID"];
}

- (void)clearAll
{
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  unsigned __int8 v3 = qword_1003DB7E8;
  if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "clearAll", v7, 2u);
  }
  sosStatus = self->_sosStatus;
  self->_sosStatus = 0;

  localTriggerUUID = self->_localTriggerUUID;
  self->_localTriggerUUID = 0;

  companionTriggerUUID = self->_companionTriggerUUID;
  self->_companionTriggerUUID = 0;
  self->_double localDecisionTimestamp = 0.0;

  self->_localShouldSend = 0;
  self->_BOOL sendUnprocessedCrash = 0;
  [(CSSafetySOSStateMachine *)self resetAllPersistedValues];
  [(CSSafetySOSStateMachine *)self stopTimer];
}

- (void)onCompanionMessage:(int)a3 data:(id)a4 receivedTimestamp:(double)a5
{
  id v10 = a4;
  if ((a3 - 305) < 2 || a3 == 6)
  {
    v7 = +[CSPermissions sharedInstance];
    unsigned int v8 = [v7 firstOrThirdPartyEnabled];

    if (v8)
    {
      id v9 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:[v10 bytes]];
      [(CSSafetySOSStateMachine *)self updateCompanionUUID:v9];

      [(CSSafetySOSStateMachine *)self feedCompanionDetected];
    }
  }
}

- (void)updatedSOSKappaStatus:(id)a3
{
  id v5 = a3;
  if (qword_1003DB7E0 != -1) {
    dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
  }
  BOOL v6 = (id)qword_1003DB7E8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 sosStatus];
    int v11 = 134218496;
    id v12 = [v7 flowState];
    __int16 v13 = 1024;
    unsigned int v14 = [v5 isKappaFlow];
    __int16 v15 = 1024;
    unsigned int v16 = [v5 isKappaFlowActive];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "updatedSOSSafetyStatus state:%ld, isKappaFlow:%d, isKappaFlowActive:%d", (uint8_t *)&v11, 0x18u);
  }
  if ([v5 isKappaFlow])
  {
    objc_storeStrong((id *)&self->_sosStatus, a3);
    if ([v5 isKappaFlowActive]) {
      uint64_t v8 = 7;
    }
    else {
      uint64_t v8 = 8;
    }
    [(CSHSMObjc *)self->_hsm signal:v8 data:0];
    if ([v5 sosKappaState] == (id)1)
    {
      if (qword_1003DB7E0 != -1) {
        dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
      }
      id v9 = qword_1003DB7E8;
      if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "updatedSOSSafetyStatus received alert and notifying AOP", (uint8_t *)&v11, 2u);
      }
      [(CSSafetySOSStateMachine *)self notifySOStoAOP];
    }
  }
  else
  {
    if (qword_1003DB7E0 != -1) {
      dispatch_once(&qword_1003DB7E0, &stru_1003B7698);
    }
    id v10 = qword_1003DB7E8;
    if (os_log_type_enabled((os_log_t)qword_1003DB7E8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received non-Kappa flow state, ignoring", (uint8_t *)&v11, 2u);
    }
  }
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosStatus, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_companionTriggerUUID, 0);
  objc_storeStrong((id *)&self->_localTriggerUUID, 0);
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong(&self->_crashProcessingState, 0);
  objc_storeStrong(&self->_notifyingCompanionState, 0);
  objc_storeStrong(&self->_crashStagingState, 0);
  objc_storeStrong(&self->_potentialCrashState, 0);
  objc_storeStrong(&self->_idleState, 0);
  objc_storeStrong((id *)&self->_hsm, 0);

  objc_storeStrong((id *)&self->_vendor, 0);
}

@end