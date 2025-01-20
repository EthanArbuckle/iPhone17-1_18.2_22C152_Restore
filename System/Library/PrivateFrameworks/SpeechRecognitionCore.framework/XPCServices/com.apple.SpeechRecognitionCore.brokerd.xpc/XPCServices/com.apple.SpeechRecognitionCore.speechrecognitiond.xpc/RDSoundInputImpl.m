@interface RDSoundInputImpl
+ (BOOL)isCSVADHidden;
+ (BOOL)isCSVADPresent;
+ (BOOL)isCallActive;
+ (BOOL)isHearstConnected;
- (AVIndependentSoundInput)avIndependenRouteSoundInput;
- (AVSoundInput)avSoundInput;
- (BOOL)hasIndependentRouteCapability;
- (BOOL)isRecording;
- (BOOL)startRecording;
- (BOOL)startRecording:(int)a3;
- (CSSoundInput)csSoundInput;
- (RDSoundInputImpl)initWithExpectedFormat:(const AudioStreamBasicDescription *)a3 deliverSamples:(id)a4;
- (void)_callStatusChanged:(id)a3;
- (void)_handleSpeechDetectionVADPresentChange:(id)a3;
- (void)_handleSpeechSomeClientActiveDidChange:(id)a3;
- (void)_handleSystemControllerDied:(id)a3;
- (void)_startObservingSpeechClientsActive;
- (void)_startObservingSpeechDetectionVADPresence;
- (void)_startObservingSystemControllerLifecycle;
- (void)_stopObservingSpeechClientsActive;
- (void)dealloc;
- (void)setAvIndependenRouteSoundInput:(id)a3;
- (void)setAvSoundInput:(id)a3;
- (void)setCsSoundInput:(id)a3;
- (void)stopRecording;
@end

@implementation RDSoundInputImpl

- (RDSoundInputImpl)initWithExpectedFormat:(const AudioStreamBasicDescription *)a3 deliverSamples:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)RDSoundInputImpl;
  v6 = [(RDSoundInputImpl *)&v11 init];
  if (v6)
  {
    id v7 = [objc_alloc((Class)AVAudioFormat) initWithStreamDescription:a3];
    if (qword_1000FEAF8 != -1) {
      dispatch_once(&qword_1000FEAF8, &stru_1000EE388);
    }
    if (RXIsUseIndependentVADEnabled() && byte_1000FEAF1) {
      v6->_avIndependenRouteSoundInput = [[AVIndependentSoundInput alloc] initWithExpectedFormat:v7 deliverSamples:a4];
    }
    if (RXIsUseIndependentVADEnabled() && byte_1000FEAF1)
    {
      if (v6->_avIndependenRouteSoundInput)
      {
        v6->_hasIndependentRouteCapability = 1;
        CFPreferencesSetAppValue(@"RXUsingIndependentVAD", kCFBooleanTrue, @"com.apple.SpeechRecognitionCore.speechrecognitiond");
        v8 = RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device supports independent route", v10, 2u);
        }
      }
    }
    else
    {
      v6->_hasIndependentRouteCapability = 0;
      CFPreferencesSetAppValue(@"RXUsingIndependentVAD", kCFBooleanFalse, @"com.apple.SpeechRecognitionCore.speechrecognitiond");
      v6->_csSoundInput = [[CSSoundInput alloc] initWithDeliverSamples:a4];
      v6->_avSoundInput = [[AVSoundInput alloc] initWithExpectedFormat:v7 deliverSamples:a4];

      [(RDSoundInputImpl *)v6 _startObservingSystemControllerLifecycle];
      [(RDSoundInputImpl *)v6 _startObservingSpeechDetectionVADPresence];
    }
  }
  return v6;
}

- (void)_startObservingSystemControllerLifecycle
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:0];
  v4 = +[NSArray arrayWithObject:AVSystemController_ServerConnectionDiedNotification];
  id v5 = +[AVSystemController sharedAVSystemController];
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  v6 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v6 addObserver:self selector:"_handleSystemControllerDied:" name:AVSystemController_ServerConnectionDiedNotification object:+[AVSystemController sharedAVSystemController]];
  +[TUCallCenter sharedInstance];
  id v7 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v7 addObserver:self selector:"_callStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
  v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v9 = TUCallCenterVideoCallStatusChangedNotification;
  [(NSNotificationCenter *)v8 addObserver:self selector:"_callStatusChanged:" name:v9 object:0];
}

- (void)_handleSystemControllerDied:(id)a3
{
  v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "RDSoundInput::AVSystemControllerDied", v5, 2u);
  }
  [(RDSoundInputImpl *)self _startObservingSystemControllerLifecycle];
  [(RDSoundInputImpl *)self _startObservingSpeechDetectionVADPresence];
  [(RDSoundInputImpl *)self _handleSpeechDetectionVADPresentChange:0];
}

- (void)_startObservingSpeechDetectionVADPresence
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:AVSystemController_SpeechDetectionDevicePresentDidChangeNotification object:0];
  v4 = +[NSArray arrayWithObject:AVSystemController_SpeechDetectionDevicePresentDidChangeNotification];
  id v5 = +[AVSystemController sharedAVSystemController];
  [v5 setAttribute:v4 forKey:AVSystemController_SubscribeToNotificationsAttribute error:0];
  v6 = +[NSNotificationCenter defaultCenter];
  uint64_t v7 = AVSystemController_SpeechDetectionDevicePresentDidChangeNotification;
  id v8 = +[AVSystemController sharedAVSystemController];
  [(NSNotificationCenter *)v6 addObserver:self selector:"_handleSpeechDetectionVADPresentChange:" name:v7 object:v8];
}

- (void)_startObservingSpeechClientsActive
{
  v3 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v3 removeObserver:self name:AVSystemController_SomeClientIsActiveDidChangeNotification object:+[AVSystemController sharedInstance]];
  v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = AVSystemController_SomeClientIsActiveDidChangeNotification;
  v6 = +[AVSystemController sharedInstance];
  [(NSNotificationCenter *)v4 addObserver:self selector:"_handleSpeechSomeClientActiveDidChange:" name:v5 object:v6];
}

- (void)_stopObservingSpeechClientsActive
{
  v3 = +[NSNotificationCenter defaultCenter];
  uint64_t v4 = AVSystemController_SomeClientIsActiveDidChangeNotification;
  uint64_t v5 = +[AVSystemController sharedInstance];
  [(NSNotificationCenter *)v3 removeObserver:self name:v4 object:v5];
}

- (BOOL)startRecording
{
  return [(RDSoundInputImpl *)self startRecording:0];
}

- (BOOL)startRecording:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (RXIsUseIndependentVADEnabled() && self->_hasIndependentRouteCapability)
  {
    if ([(AVIndependentSoundInput *)[(RDSoundInputImpl *)self avIndependenRouteSoundInput] startRecording:0])
    {
      +[AudioNotification sendLiveRecordingOnNotification];
      return 1;
    }
    goto LABEL_30;
  }
  uint64_t v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109120;
    v18[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:startingRecording with reason %d", (uint8_t *)v18, 8u);
  }
  if (+[RDSoundInputImpl_iOS_Shared isSystemSleeping])
  {
    v6 = RXOSLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (!v7) {
      return result;
    }
    LOWORD(v18[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "System is sleeping, so don't start recording", (uint8_t *)v18, 2u);
    return 0;
  }
  unsigned __int8 v9 = +[RDSoundInputImpl isCSVADPresent];
  unsigned int v10 = +[RDSoundInputImpl isCSVADHidden];
  char v11 = v10;
  char v12 = v9 ^ 1;
  if ((v12 & 1) != 0 || !v10) {
    [(RDSoundInputImpl *)self _stopObservingSpeechClientsActive];
  }
  else {
    [(RDSoundInputImpl *)self _startObservingSpeechClientsActive];
  }
  char v13 = v12 | v11;
  v14 = RXOSLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((v13 & 1) == 0)
  {
    if (v15)
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:CSVAD Present", (uint8_t *)v18, 2u);
    }
    if ([(AVSoundInput *)[(RDSoundInputImpl *)self avSoundInput] isRecording]) {
      [(AVSoundInput *)[(RDSoundInputImpl *)self avSoundInput] stopRecording];
    }
    [(AVSoundInput *)[(RDSoundInputImpl *)self avSoundInput] deactivateNotifications];
    int v17 = 3;
    while (![(CSSoundInput *)[(RDSoundInputImpl *)self csSoundInput] startRecording])
    {
      usleep(0xC350u);
      if (!--v17) {
        goto LABEL_30;
      }
    }
    goto LABEL_20;
  }
  if (v15)
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:CSVAD not present", (uint8_t *)v18, 2u);
  }
  if ([(CSSoundInput *)[(RDSoundInputImpl *)self csSoundInput] isRecording]) {
    [(CSSoundInput *)[(RDSoundInputImpl *)self csSoundInput] stopRecording];
  }
  [(AVSoundInput *)[(RDSoundInputImpl *)self avSoundInput] activateNotifications];
  if ([(AVSoundInput *)[(RDSoundInputImpl *)self avSoundInput] startRecording:v3])
  {
LABEL_20:
    +[AudioNotification sendLiveRecordingOnNotification];
    v16 = RXOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:startedRecording", (uint8_t *)v18, 2u);
    }
    return 1;
  }
LABEL_30:
  +[AudioNotification sendLiveRecordingOffNotificationWithInterrupt:1];
  return 0;
}

- (void)stopRecording
{
  uint64_t v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:stoppingRecording", buf, 2u);
  }
  if (RXIsUseIndependentVADEnabled() && self->_hasIndependentRouteCapability)
  {
    uint64_t v4 = [(RDSoundInputImpl *)self avIndependenRouteSoundInput];
  }
  else if (+[RDSoundInputImpl isCSVADPresent])
  {
    uint64_t v4 = [(RDSoundInputImpl *)self csSoundInput];
  }
  else
  {
    uint64_t v4 = [(RDSoundInputImpl *)self avSoundInput];
  }
  [(AVIndependentSoundInput *)v4 stopRecording];
  uint64_t v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl_iOS:stoppedRecording", v6, 2u);
  }
  +[AudioNotification sendLiveRecordingOffNotificationWithInterrupt:0];
}

- (BOOL)isRecording
{
  if (+[RDSoundInputImpl isCSVADPresent]) {
    return [(CSSoundInput *)[(RDSoundInputImpl *)self csSoundInput] isRecording] != 0;
  }
  uint64_t v4 = [(RDSoundInputImpl *)self avSoundInput];
  return [(AVSoundInput *)v4 isRecording];
}

- (void)_handleSpeechDetectionVADPresentChange:(id)a3
{
  if (!+[RDSoundInputImpl_iOS_Shared isCarPlayActive]
    || self->_hasIndependentRouteCapability)
  {
    uint64_t v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Speech detection VAD status changed = %@", buf, 0xCu);
    }
    if (!self->_hasIndependentRouteCapability)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100010014;
      block[3] = &unk_1000EDD68;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
  }
}

- (void)_handleSpeechSomeClientActiveDidChange:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001009C;
  v3[3] = &unk_1000EE3B0;
  v3[4] = a3;
  v3[5] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, v3);
}

- (void)_callStatusChanged:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v11 = [v4 status];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RDSoundInputImpl:_callStatusChanged:%d", buf, 8u);
  }
  if (v4)
  {
    if ([v4 status] == 4 || objc_msgSend(v4, "status") == 3)
    {
      v6 = gRDServerQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000102EC;
      block[3] = &unk_1000EE3B0;
      block[4] = v4;
      void block[5] = self;
      BOOL v7 = block;
LABEL_7:
      dispatch_async(v6, v7);
      return;
    }
    if ([v4 status] == 6)
    {
      v6 = gRDServerQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100010398;
      v8[3] = &unk_1000EE3B0;
      v8[4] = v4;
      v8[5] = self;
      BOOL v7 = v8;
      goto LABEL_7;
    }
  }
}

- (void)dealloc
{
  avIndependenRouteSoundInput = self->_avIndependenRouteSoundInput;
  if (avIndependenRouteSoundInput) {

  }
  csSoundInput = self->_csSoundInput;
  if (csSoundInput) {

  }
  avSoundInput = self->_avSoundInput;
  if (avSoundInput) {

  }
  v6.receiver = self;
  v6.super_class = (Class)RDSoundInputImpl;
  [(RDSoundInputImpl *)&v6 dealloc];
}

+ (BOOL)isCSVADPresent
{
  if (+[RDSoundInputImpl_iOS_Shared isCarPlayActive]) {
    return 1;
  }
  id v3 = +[AVSystemController sharedAVSystemController];
  id v4 = [v3 attributeForKey:AVSystemController_SpeechDetectionDevicePresentAttribute];
  return [v4 BOOLValue];
}

+ (BOOL)isCSVADHidden
{
  if (+[RDSoundInputImpl_iOS_Shared isCarPlayActive]) {
    return 0;
  }
  id v3 = +[AVSystemController sharedAVSystemController];
  id v4 = [v3 attributeForKey:AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute];
  if ([v4 count] == (id)1) {
    unsigned int v5 = objc_msgSend(objc_msgSend(v4, "firstObject"), "isEqual:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid())) ^ 1;
  }
  else {
    LOBYTE(v5) = 1;
  }
  if ([v4 count]) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (BOOL)isCallActive
{
  id v2 = +[AVSystemController sharedAVSystemController];
  [v2 attributeForKey:AVSystemController_CallIsActive];
  id v3 = +[AVSystemController sharedAVSystemController];
  objc_msgSend(objc_msgSend(v3, "attributeForKey:", AVSystemController_RecordingClientPIDsAttribute), "count");
  id v4 = +[AVSystemController sharedAVSystemController];
  id v5 = [v4 attributeForKey:AVSystemController_CallIsActive];
  return [v5 BOOLValue];
}

+ (BOOL)isHearstConnected
{
  id v2 = +[AVSystemController sharedAVSystemController];
  id v3 = [v2 attributeForKey:AVSystemController_PickableRoutesAttribute];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v8, "objectForKey:", AVSystemController_RouteDescriptionKey_IsPreferredExternalRoute), "BOOLValue")&& objc_msgSend(objc_msgSend(v8, "objectForKey:", AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported), "BOOLValue")&& objc_msgSend(objc_msgSend(v8, "objectForKey:", AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive), "BOOLValue")&& (objc_msgSend(objc_msgSend(
                                v8,
                                "objectForKey:",
                                AVSystemController_RouteDescriptionKey_BTDetails_SupportsDoAP),
                              "BOOLValue") & 1) != 0)
        {
          BOOL v9 = 1;
          goto LABEL_14;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_14:
  unsigned int v10 = RXOSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Airpods Connected=%d", buf, 8u);
  }
  return v9;
}

- (BOOL)hasIndependentRouteCapability
{
  return self->_hasIndependentRouteCapability;
}

- (CSSoundInput)csSoundInput
{
  return self->_csSoundInput;
}

- (void)setCsSoundInput:(id)a3
{
}

- (AVSoundInput)avSoundInput
{
  return self->_avSoundInput;
}

- (void)setAvSoundInput:(id)a3
{
}

- (AVIndependentSoundInput)avIndependenRouteSoundInput
{
  return self->_avIndependenRouteSoundInput;
}

- (void)setAvIndependenRouteSoundInput:(id)a3
{
}

@end