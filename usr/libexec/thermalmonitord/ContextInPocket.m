@interface ContextInPocket
- (BOOL)_acquireBacklightAssertion;
- (BOOL)audioIsOn;
- (BOOL)backlightIsOn;
- (BOOL)connectedExternally;
- (BOOL)contextIsActive;
- (BOOL)powerIsOn;
- (BOOL)synchContext;
- (BOOL)usesPackagePowerControl;
- (BrightnessSystemMonitorable)brightnessSystemMonitor;
- (ContextInPocket)initWithParams:(id)a3;
- (IONotificationPort)notificationPort;
- (OS_dispatch_queue)inPocketQueue;
- (__CFString)copyFieldCurrentValueForIndex:(int)a3;
- (__CFString)copyHeaderForIndex:(int)a3;
- (int)audioRunningToken;
- (int)displayToken;
- (int)getContextState;
- (int)minPackagePower;
- (int)mitigationControllerListID;
- (int)numberOfFields;
- (int)stockholmToken;
- (int)uncapRequestClientID;
- (unint64_t)stockholmFieldDetectInProgressUntilTime;
- (unint64_t)wakeInProgressUntilTime;
- (unsigned)ioIterator;
- (unsigned)minCPU;
- (unsigned)minGPU;
- (unsigned)notification;
- (unsigned)pmuPowerService;
- (void)dealloc;
- (void)handleCurrentTopOffStatusWithContext:(id)a3;
- (void)initAudioHandling;
- (void)initPowerHandling;
- (void)initStockholmHandling;
- (void)logHiPSignalsToPowerLog:(char)a3 :(BOOL)a4 :(BOOL)a5 :(BOOL)a6;
- (void)registerForTopOffStatusChanges;
- (void)sessionDidConnect:(id)a3;
- (void)sessionDidDisconnect:(id)a3;
- (void)setAudioIsOn:(BOOL)a3;
- (void)setAudioRunningToken:(int)a3;
- (void)setBacklightIsOn:(BOOL)a3;
- (void)setBrightnessSystemMonitor:(id)a3;
- (void)setConnectedExternally:(BOOL)a3;
- (void)setContextIsActive:(BOOL)a3;
- (void)setDisplayToken:(int)a3;
- (void)setInPocketQueue:(id)a3;
- (void)setIoIterator:(unsigned int)a3;
- (void)setMinCPU:(unsigned __int8)a3;
- (void)setMinGPU:(unsigned __int8)a3;
- (void)setMinPackagePower:(int)a3;
- (void)setMitigationControllerListID:(int)a3;
- (void)setNotification:(unsigned int)a3;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setPmuPowerService:(unsigned int)a3;
- (void)setPowerIsOn:(BOOL)a3;
- (void)setStockholmFieldDetectInProgressUntilTime:(unint64_t)a3;
- (void)setStockholmToken:(int)a3;
- (void)setUncapRequestClientID:(int)a3;
- (void)setUsesPackagePowerControl:(BOOL)a3;
- (void)setWakeInProgressUntilTime:(unint64_t)a3;
- (void)updateContextActiveState;
- (void)updateSystemPowerState:(BOOL)a3;
@end

@implementation ContextInPocket

- (void)handleCurrentTopOffStatusWithContext:(id)a3
{
  byte_1000AA780 = (char *)[((id)objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", qword_1000AA090), "unsignedIntegerValue"))- 5 < (char *)2];
}

- (void)registerForTopOffStatusChanges
{
  id v3 = +[_CDClientContext userContext];
  qword_1000AA090 = +[_CDContextualKeyPath keyPathWithKey:@"/charging/topOffCheckpoint"];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000270D4;
  v5[3] = &unk_100085BA8;
  v5[4] = self;
  v5[5] = v3;
  id v4 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:](_CDContextualChangeRegistration, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", @"com.apple.cltm.obcstatus", +[_CDContextualPredicate predicateForChangeAtKeyPath:qword_1000AA090], @"com.apple.cltm.context", v5);
  [(ContextInPocket *)self handleCurrentTopOffStatusWithContext:v3];
  [(ContextInPocket *)self updateContextActiveState];
  [v3 registerCallback:v4];
}

- (ContextInPocket)initWithParams:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ContextInPocket;
  id v4 = [(ContextInPocket *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->super.ctxType = 1;
    [(ContextInPocket *)v4 setContextIsActive:0];
    [(ContextInPocket *)v5 setConnectedExternally:1];
    [(ContextInPocket *)v5 setAudioIsOn:1];
    [(ContextInPocket *)v5 setPowerIsOn:1];
    v5->_carSessionActive = 0;
    atomic_store(1u, (unsigned __int8 *)&v5->_atomic_isBacklightOn);
    [(ContextInPocket *)v5 setUsesPackagePowerControl:0];
    if (a3)
    {
      sub_100008280((CFDictionaryRef)a3, @"minPackagePower", kCFNumberIntType, &v5->_minPackagePower);
      if (v5->_minPackagePower < 1)
      {
        v5->_minCPU = [[objc_msgSend(a3, "objectForKey:", @"minCPU") intValue];
        v5->_minGPU = [[objc_msgSend(a3, "objectForKey:", @"minGPU") intValue];
      }
      else
      {
        [(ContextInPocket *)v5 setUsesPackagePowerControl:1];
      }
    }
    else
    {
      v5->_minCPU = 0;
      v5->_minGPU = 0;
    }
    v5->_inPocketQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.ThermalMonitor.context.pocket", 0);
    [(ContextInPocket *)v5 setBrightnessSystemMonitor:objc_opt_new()];
    if (v5->_inPocketQueue)
    {
      -[ContextInPocket setMitigationControllerListID:](v5, "setMitigationControllerListID:", [(id)qword_1000AB158 requestListID]);
      [(ContextInPocket *)v5 initPowerHandling];
      [(ContextInPocket *)v5 _acquireBacklightAssertion];
      [(ContextInPocket *)v5 initAudioHandling];
      [(ContextInPocket *)v5 initStockholmHandling];
    }
    else
    {
      v6 = qword_1000AABC0;
      if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
        sub_100056810(v6);
      }
    }
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = sub_100028D48;
    v12[4] = sub_100028D58;
    v12[5] = qword_1000AA098;
    if (!qword_1000AA098)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100028D64;
      v11[3] = &unk_100085BF8;
      v11[4] = v12;
      sub_100028D64((uint64_t)v11);
    }
    _Block_object_dispose(v12, 8);
    v7 = (CARSessionStatus *)objc_opt_new();
    v5->_carSessionStatus = v7;
    [(CARSessionStatus *)v7 addSessionObserver:v5];
    v5->_carSessionActive = [(CARSessionStatus *)v5->_carSessionStatus currentSession] != 0;
    if ([(ContextInPocket *)v5 inPocketQueue])
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10002752C;
      v9[3] = &unk_100085248;
      v9[4] = v5;
      dispatch_async((dispatch_queue_t)[(ContextInPocket *)v5 inPocketQueue], v9);
    }
    if (byte_1000AB0E0)
    {
      [+[SensorExchangeHelper sharedInstance] registerCLTMSensorIndex:11 forSMCKey:@"zETM" atSMCIndex:11];
      *(float *)&dword_1000AAE0C = (float)[(ContextInPocket *)v5 contextIsActive];
    }
    [+[TGraphSampler sharedInstance] addtGraphDataSource:v5];
  }
  return v5;
}

- (void)dealloc
{
  io_object_t notification = self->_notification;
  if (notification) {
    IOObjectRelease(notification);
  }
  io_object_t ioIterator = self->_ioIterator;
  if (ioIterator) {
    IOObjectRelease(ioIterator);
  }
  backlightAssertion = self->_backlightAssertion;
  if (backlightAssertion) {
    [(TMInvalidatable *)backlightAssertion invalidate];
  }
  int audioRunningToken = self->_audioRunningToken;
  if (audioRunningToken) {
    notify_cancel(audioRunningToken);
  }
  int stockholmToken = self->_stockholmToken;
  if (stockholmToken) {
    notify_cancel(stockholmToken);
  }
  if ([(ContextInPocket *)self notificationPort]) {
    IONotificationPortDestroy([(ContextInPocket *)self notificationPort]);
  }
  [(CARSessionStatus *)self->_carSessionStatus removeSessionObserver:self];
  v8.receiver = self;
  v8.super_class = (Class)ContextInPocket;
  [(ContextInPocket *)&v8 dealloc];
}

- (void)initPowerHandling
{
  [(ContextInPocket *)self setNotificationPort:IONotificationPortCreate(kIOMainPortDefault)];
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  if (v3)
  {
    IOServiceAddMatchingNotification([(ContextInPocket *)self notificationPort], "IOServiceFirstPublish", v3, (IOServiceMatchingCallback)sub_1000276F0, self, &self->_ioIterator);
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource([(ContextInPocket *)self notificationPort]);
    CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
    io_iterator_t ioIterator = self->_ioIterator;
    sub_1000276F0(self, ioIterator);
  }
}

- (void)initAudioHandling
{
  objc_initWeak(&location, self);
  inPocketQueue = self->_inPocketQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027930;
  v4[3] = &unk_1000850E8;
  objc_copyWeak(&v5, &location);
  sub_1000395F0("com.apple.coreaudio.IORunning", &self->_audioRunningToken, inPocketQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)initStockholmHandling
{
  objc_initWeak(&location, self);
  inPocketQueue = self->_inPocketQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100027A80;
  v4[3] = &unk_1000850E8;
  objc_copyWeak(&v5, &location);
  sub_1000395F0("com.apple.request.hipuncap", &self->_stockholmToken, inPocketQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (int)getContextState
{
  return [(ContextInPocket *)self contextIsActive];
}

- (void)updateContextActiveState
{
  dispatch_assert_queue_V2((dispatch_queue_t)[(ContextInPocket *)self inPocketQueue]);
  dispatch_time_t v3 = dispatch_time(0, 0);
  unint64_t v4 = [(ContextInPocket *)self wakeInProgressUntilTime];
  BOOL v5 = v3 <= v4;
  dispatch_time_t v6 = dispatch_time(0, 0);
  unint64_t v7 = [(ContextInPocket *)self stockholmFieldDetectInProgressUntilTime];
  BOOL v8 = v6 <= v7;
  BOOL v9 = [(ContextInPocket *)self backlightIsOn];
  BOOL v10 = v9;
  if (!byte_1000AA7B1)
  {
    if (byte_1000AA7B2)
    {
      unsigned __int8 v12 = 0;
      if (v9)
      {
LABEL_13:
        if (![(ContextInPocket *)self contextIsActive]) {
          goto LABEL_38;
        }
        BOOL v11 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      unsigned __int8 v13 = [(ContextInPocket *)self connectedExternally];
      if (byte_1000AA780) {
        unsigned __int8 v12 = 0;
      }
      else {
        unsigned __int8 v12 = v13;
      }
      if (v10) {
        goto LABEL_13;
      }
    }
    if ((v12 & 1) == 0
      && ![(ContextInPocket *)self audioIsOn]
      && !self->_carSessionActive
      && v3 > v4
      && v6 > v7)
    {
      BOOL v11 = [(ContextInPocket *)self powerIsOn];
      if (v11 == [(ContextInPocket *)self contextIsActive]) {
        goto LABEL_38;
      }
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if ([(ContextInPocket *)self contextIsActive]) {
    goto LABEL_38;
  }
  BOOL v11 = 1;
LABEL_15:
  [(ContextInPocket *)self setContextIsActive:v11];
  unsigned int v14 = [(ContextInPocket *)self contextIsActive];
  int v15 = byte_1000A2510;
  int v16 = byte_1000A2511;
  v17 = qword_1000AABC0;
  BOOL v18 = os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT);
  if (v14 && v15 && v16)
  {
    if (v18)
    {
      unsigned int v19 = [(ContextInPocket *)self connectedExternally];
      int v31 = byte_1000AA780;
      unsigned int v20 = [(ContextInPocket *)self audioIsOn];
      BOOL carSessionActive = self->_carSessionActive;
      *(_DWORD *)buf = 67110912;
      BOOL v34 = v10;
      __int16 v35 = 1024;
      unsigned int v36 = v19;
      __int16 v37 = 1024;
      int v38 = v31;
      __int16 v39 = 1024;
      unsigned int v40 = v20;
      __int16 v41 = 1024;
      BOOL v42 = carSessionActive;
      __int16 v43 = 1024;
      BOOL v44 = v3 <= v4;
      __int16 v45 = 1024;
      BOOL v46 = v6 <= v7;
      __int16 v47 = 1024;
      unsigned int v48 = [(ContextInPocket *)self powerIsOn];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Engaging HiP - backlightIsOn %d, connectedExternally %d, toppingOff %d, audioIsOn %d, carSessionActive %d, wakeInProgress %d, fieldDetectInProgress %d, powerIsOn %d", buf, 0x32u);
    }
    kdebug_trace();
    if ([(ContextInPocket *)self usesPackagePowerControl])
    {
      [qword_1000AB158 setPackagePowerCeiling:self->_minPackagePower fromDecisionSource:-[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID")];
    }
    else
    {
      [(id)qword_1000AB158 setCPUPowerCeiling:self->_minCPU forDVD1Contributor:1];
      [((id)qword_1000AB158) setCPUPowerCeiling:self->_minCPU fromDecisionSource:-[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID")];
      [objc_msgSend((id)qword_1000AB158, "setGPUPowerCeiling:fromDecisionSource:", self->_minGPU, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    BOOL v8 = v6 <= v7;
    BOOL v5 = v3 <= v4;
    BOOL v25 = v6 <= v7;
    BOOL v26 = v3 <= v4;
    v27 = self;
    uint64_t v28 = 1;
  }
  else
  {
    if (v18)
    {
      unsigned int v22 = [(ContextInPocket *)self connectedExternally];
      int v32 = byte_1000AA780;
      unsigned int v23 = [(ContextInPocket *)self audioIsOn];
      BOOL v24 = self->_carSessionActive;
      *(_DWORD *)buf = 67110912;
      BOOL v34 = v10;
      __int16 v35 = 1024;
      unsigned int v36 = v22;
      __int16 v37 = 1024;
      int v38 = v32;
      __int16 v39 = 1024;
      unsigned int v40 = v23;
      __int16 v41 = 1024;
      BOOL v42 = v24;
      __int16 v43 = 1024;
      BOOL v44 = v3 <= v4;
      __int16 v45 = 1024;
      BOOL v46 = v6 <= v7;
      __int16 v47 = 1024;
      unsigned int v48 = [(ContextInPocket *)self powerIsOn];
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "<Notice> Disengaging HiP - backlightIsOn %d, connectedExternally %d, toppingOff %d, audioIsOn %d, carSessionActive %d, wakeInProgress %d, fieldDetectInProgress %d, powerIsOn %d", buf, 0x32u);
    }
    kdebug_trace();
    if ([(ContextInPocket *)self usesPackagePowerControl])
    {
      [qword_1000AB158 setPackagePowerCeiling:65000 fromDecisionSource:[ContextInPocket mitigationControllerListID]];
    }
    else
    {
      [(id)qword_1000AB158 setCPUPowerCeiling:101 forDVD1Contributor:1];
      [objc_msgSend((id)qword_1000AB158, "setCPUPowerCeiling:fromDecisionSource:", 101, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
      [objc_msgSend((id)qword_1000AB158, "setGPUPowerCeiling:fromDecisionSource:", 100, -[ContextInPocket mitigationControllerListID](self, "mitigationControllerListID"));
    }
    BOOL v8 = v6 <= v7;
    BOOL v5 = v3 <= v4;
    BOOL v25 = v6 <= v7;
    BOOL v26 = v3 <= v4;
    v27 = self;
    uint64_t v28 = 0;
  }
  [(ContextInPocket *)v27 logHiPSignalsToPowerLog:v28 :v10 :v25 :v26];
  if (!byte_1000AB0E0)
  {
    if ([(ContextInPocket *)self usesPackagePowerControl])
    {
      [(id)qword_1000AB158 updatePackage];
    }
    else
    {
      [(id)qword_1000AB158 updateCPU];
      [(id)qword_1000AB158 updateGPU];
    }
  }
  v29 = +[TGraphSampler sharedInstance];
  if ([(ContextInPocket *)self contextIsActive]) {
    uint64_t v30 = 100;
  }
  else {
    uint64_t v30 = 0;
  }
  [(TGraphSampler *)v29 updatePowerlogMiscState:1 value:v30];
LABEL_38:
  *(float *)&dword_1000AAE0C = (float)[(ContextInPocket *)self contextIsActive];
  byte_1000AA7B3 = v10;
  byte_1000AA7B4 = [(ContextInPocket *)self connectedExternally];
  byte_1000AA7B5 = byte_1000AA780;
  byte_1000AA7B6 = [(ContextInPocket *)self audioIsOn];
  byte_1000AA7B7 = self->_carSessionActive;
  byte_1000AA7B8 = v5;
  byte_1000AA7B9 = v8;
  if (byte_1000AB0E0)
  {
    [+[SensorExchangeHelper sharedInstance] updateAllSensorExchangeData];
    [+[SensorExchangeHelper sharedInstance] sendSensorExchangeDataToSMC];
  }
}

- (void)logHiPSignalsToPowerLog:(char)a3 :(BOOL)a4 :(BOOL)a5 :(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = a3;
  if (a4) {
    int v10 = 128;
  }
  else {
    int v10 = 0;
  }
  if ([(ContextInPocket *)self connectedExternally]) {
    int v11 = 64;
  }
  else {
    int v11 = 0;
  }
  int v12 = byte_1000AA780;
  if ([(ContextInPocket *)self audioIsOn]) {
    int v13 = 16;
  }
  else {
    int v13 = 0;
  }
  if (v6) {
    int v15 = 4;
  }
  else {
    int v15 = 0;
  }
  if (v7) {
    int v16 = 2;
  }
  else {
    int v16 = 0;
  }
  BOOL carSessionActive = self->_carSessionActive;
  uint64_t v17 = (v16 | v10 | v15 | v11 | (32 * v12) | v13 | (8 * carSessionActive))
      + [(ContextInPocket *)self powerIsOn];
  BOOL v18 = +[TGraphSampler sharedInstance];

  [(TGraphSampler *)v18 updatePowerLogLiteHiP:v8 client:v17];
}

- (BOOL)synchContext
{
  return 1;
}

- (void)updateSystemPowerState:(BOOL)a3
{
  if ([(ContextInPocket *)self inPocketQueue])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100028364;
    v5[3] = &unk_1000858E0;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async((dispatch_queue_t)[(ContextInPocket *)self inPocketQueue], v5);
  }
}

- (BOOL)backlightIsOn
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_atomic_isBacklightOn);
  return v2 & 1;
}

- (void)setBacklightIsOn:(BOOL)a3
{
}

- (void)setBrightnessSystemMonitor:(id)a3
{
  if ([(ContextInPocket *)self brightnessSystemMonitor] != a3)
  {
    self->_brightnessSystemMonitor = (BrightnessSystemMonitorable *)a3;
    backlightAssertion = self->_backlightAssertion;
    if (backlightAssertion)
    {
      [(TMInvalidatable *)backlightAssertion invalidate];
      self->_backlightAssertion = 0;
      [(ContextInPocket *)self _acquireBacklightAssertion];
    }
  }
}

- (BOOL)_acquireBacklightAssertion
{
  if (self->_backlightAssertion || !self->_brightnessSystemMonitor) {
    return 0;
  }
  unint64_t v4 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> HIP: Reacquiring Backlight Assertion", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  brightnessSystemMonitor = self->_brightnessSystemMonitor;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100028740;
  v6[3] = &unk_100085BD0;
  objc_copyWeak(&v7, buf);
  v6[4] = self;
  self->_backlightAssertion = (TMInvalidatable *)[(BrightnessSystemMonitorable *)brightnessSystemMonitor monitorDisplayOnStateForReason:@"HotInPocket Backlight Signal" handler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
  return 1;
}

- (void)sessionDidConnect:(id)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028900;
    block[3] = &unk_100085248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)[(ContextInPocket *)self inPocketQueue], block);
  }
}

- (void)sessionDidDisconnect:(id)a3
{
  if (a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000289E4;
    block[3] = &unk_100085248;
    block[4] = self;
    dispatch_async((dispatch_queue_t)[(ContextInPocket *)self inPocketQueue], block);
  }
}

- (int)numberOfFields
{
  return 1;
}

- (__CFString)copyHeaderForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return @"ContextInPocket state";
  }
}

- (__CFString)copyFieldCurrentValueForIndex:(int)a3
{
  if (a3) {
    return 0;
  }
  else {
    return (__CFString *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", [(ContextInPocket *)self getContextState]);
  }
}

- (BOOL)contextIsActive
{
  return self->contextIsActive;
}

- (void)setContextIsActive:(BOOL)a3
{
  self->contextIsActive = a3;
}

- (BOOL)connectedExternally
{
  return self->connectedExternally;
}

- (void)setConnectedExternally:(BOOL)a3
{
  self->connectedExternally = a3;
}

- (BOOL)audioIsOn
{
  return self->audioIsOn;
}

- (void)setAudioIsOn:(BOOL)a3
{
  self->audioIsOn = a3;
}

- (unint64_t)stockholmFieldDetectInProgressUntilTime
{
  return self->stockholmFieldDetectInProgressUntilTime;
}

- (void)setStockholmFieldDetectInProgressUntilTime:(unint64_t)a3
{
  self->stockholmFieldDetectInProgressUntilTime = a3;
}

- (BOOL)powerIsOn
{
  return self->powerIsOn;
}

- (void)setPowerIsOn:(BOOL)a3
{
  self->powerIsOn = a3;
}

- (unint64_t)wakeInProgressUntilTime
{
  return self->wakeInProgressUntilTime;
}

- (void)setWakeInProgressUntilTime:(unint64_t)a3
{
  self->wakeInProgressUntilTime = a3;
}

- (int)mitigationControllerListID
{
  return self->mitigationControllerListID;
}

- (void)setMitigationControllerListID:(int)a3
{
  self->mitigationControllerListID = a3;
}

- (int)displayToken
{
  return self->_displayToken;
}

- (void)setDisplayToken:(int)a3
{
  self->_displayToken = a3;
}

- (int)audioRunningToken
{
  return self->_audioRunningToken;
}

- (void)setAudioRunningToken:(int)a3
{
  self->_int audioRunningToken = a3;
}

- (int)uncapRequestClientID
{
  return self->_uncapRequestClientID;
}

- (void)setUncapRequestClientID:(int)a3
{
  self->_uncapRequestClientID = a3;
}

- (int)stockholmToken
{
  return self->_stockholmToken;
}

- (void)setStockholmToken:(int)a3
{
  self->_int stockholmToken = a3;
}

- (unsigned)minCPU
{
  return self->_minCPU;
}

- (void)setMinCPU:(unsigned __int8)a3
{
  self->_minCPU = a3;
}

- (unsigned)minGPU
{
  return self->_minGPU;
}

- (void)setMinGPU:(unsigned __int8)a3
{
  self->_minGPU = a3;
}

- (unsigned)pmuPowerService
{
  return self->pmuPowerService;
}

- (void)setPmuPowerService:(unsigned int)a3
{
  self->pmuPowerService = a3;
}

- (IONotificationPort)notificationPort
{
  return self->notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->notificationPort = a3;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_io_object_t notification = a3;
}

- (unsigned)ioIterator
{
  return self->_ioIterator;
}

- (void)setIoIterator:(unsigned int)a3
{
  self->_io_iterator_t ioIterator = a3;
}

- (OS_dispatch_queue)inPocketQueue
{
  return self->_inPocketQueue;
}

- (void)setInPocketQueue:(id)a3
{
  self->_inPocketQueue = (OS_dispatch_queue *)a3;
}

- (BOOL)usesPackagePowerControl
{
  return self->usesPackagePowerControl;
}

- (void)setUsesPackagePowerControl:(BOOL)a3
{
  self->usesPackagePowerControl = a3;
}

- (int)minPackagePower
{
  return self->_minPackagePower;
}

- (void)setMinPackagePower:(int)a3
{
  self->_minPackagePower = a3;
}

- (BrightnessSystemMonitorable)brightnessSystemMonitor
{
  return self->_brightnessSystemMonitor;
}

@end