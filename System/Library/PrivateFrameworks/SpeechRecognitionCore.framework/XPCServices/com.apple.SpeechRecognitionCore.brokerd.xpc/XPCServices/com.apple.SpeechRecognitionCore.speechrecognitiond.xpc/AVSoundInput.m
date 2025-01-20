@interface AVSoundInput
- (AVAudioEngine)audioEngine;
- (AVAudioFormat)expectedFormat;
- (AVSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4;
- (BOOL)isRecording;
- (BOOL)setupAudioSession;
- (BOOL)setupDefaultAudioSession:(unint64_t)a3;
- (BOOL)startRecording:(int)a3;
- (BOOL)startRunningAudioEngine;
- (id)deliverSamples;
- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4;
- (void)_appendPCMBuffer:(id)a3;
- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3;
- (void)_didReceiveSiriSettingChanged:(BOOL)a3;
- (void)_drainAndClearAudioConverter;
- (void)_handleAudioSessionInterruption:(id)a3;
- (void)_handleConfigurationChangeNotification:(id)a3;
- (void)_handleRouteChange:(id)a3;
- (void)_recordingStateChanged:(id)a3;
- (void)activateNotifications;
- (void)deactivateNotifications;
- (void)dealloc;
- (void)setAudioEngine:(id)a3;
- (void)setDeliverSamples:(id)a3;
- (void)setExpectedFormat:(id)a3;
- (void)stopRecording;
@end

@implementation AVSoundInput

- (AVSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AVSoundInput;
  v6 = [(AVSoundInput *)&v16 init];
  if (v6)
  {
    v7 = dispatch_queue_create("RDAudioBufferQueue", 0);
    v6->_avAudioBufferQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, v6, v6, 0);
    v6->_expectedFormat = (AVAudioFormat *)a3;
    v6->_deliverSamples = _Block_copy(a4);
    v6->_isHearstConnectedFlag = +[RDSoundInputImpl isHearstConnected];
    v6->_isSiriEnabled = AFPreferencesAssistantEnabled() != 0;
    v6->_isNotificationActivated = 0;
    v6->_audioEngine = (AVAudioEngine *)objc_alloc_init((Class)AVAudioEngine);
    id v15 = 0;
    id v8 = +[AVSystemController sharedAVSystemController];
    uint64_t v19 = AVSystemController_SomeClientIsActiveDidChangeNotification;
    v9 = +[NSArray arrayWithObjects:&v19 count:1];
    [v8 setAttribute:v9 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v15];
    if (v15)
    {
      id v10 = [v15 description];
      v11 = RXOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [v10 UTF8String];
        *(_DWORD *)buf = 136315138;
        id v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AVSystemController_SubscribeToNotificationsAttribute Failed, Error = %s", buf, 0xCu);
      }
    }
    if (![(AVSoundInput *)v6 setupAudioSession])
    {
      v13 = RXOSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ERROR in setting up the audio session", buf, 2u);
      }
    }
  }
  return v6;
}

- (BOOL)setupAudioSession
{
  uint64_t v13 = 0;
  [+[AVAudioSession sharedInstance] setPrefersNoMicrophoneUsageIndicator:1 error:&v13];
  if (v13)
  {
    v3 = RXOSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "SRC:Failed to suppress mic indicator", buf, 2u);
    }
    uint64_t v13 = 0;
  }
  [+[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:41 error:&v13];
  if (v13)
  {
    v4 = RXOSLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v13;
      v6 = "startRecording error setting AVAudioSession category: %@";
LABEL_8:
      v7 = v4;
      uint32_t v8 = 12;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v6, buf, v8);
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    self->_isUsingTelephonyVAD = 0;
    if (![(AVSoundInput *)self setupDefaultAudioSession:41])
    {
      id v10 = RXOSLog();
      BOOL v5 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_WORD *)buf = 0;
      v6 = "failed to setupDefaultAudioSession";
      v7 = v10;
      uint32_t v8 = 2;
      goto LABEL_9;
    }
    [+[AVAudioSession sharedInstance] setAllowHapticsAndSystemSoundsDuringRecording:1 error:&v13];
    if (v13)
    {
      v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "startRecording error setting haptics: %@", buf, 0xCu);
      }
      uint64_t v13 = 0;
    }
    [+[AVAudioSession sharedInstance] preferDecoupledIO:1 error:&v13];
    if (v13)
    {
      v4 = RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (!v5) {
        return v5;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v13;
      v6 = "startRecording error setting AVAudioSession DecoupledIO: %@";
      goto LABEL_8;
    }
    if (_os_feature_enabled_impl())
    {
      v11 = +[AVAudioSession sharedInstance];
      [(AVAudioSession *)v11 setMXSessionProperty:kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl value:&__kCFBooleanTrue error:&v13];
      if (v13)
      {
        v4 = RXOSLog();
        BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
        if (!v5) {
          return v5;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v15 = v13;
        v6 = "AV:Error setting MX property for non-interruption: %@";
        goto LABEL_8;
      }
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)setupDefaultAudioSession:(unint64_t)a3
{
  uint64_t v10 = 0;
  [+[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord withOptions:a3 error:&v10];
  if (v10)
  {
    v4 = RXOSLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v12 = v10;
      v6 = "startRecording error setting AVAudioSession category: %@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  else if (+[RDSoundInputImpl isCallActive] {
         && +[RDSoundInputImpl isHearstConnected])
  }
  {
    v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Another call is active and AirPods connected", buf, 2u);
    }
    [+[AVAudioSession sharedInstance] setAudioHardwareControlFlags:0 error:&v10];
    if (v10)
    {
      v4 = RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        v6 = "startRecording error setting AVAudioSession hardware control flags to 0: %@";
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v5) = 1;
      self->_isUsingTelephonyVAD = 1;
    }
  }
  else
  {
    uint32_t v8 = RXOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No other call is active or AirpPods are not connected", buf, 2u);
    }
    [+[AVAudioSession sharedInstance] setAudioHardwareControlFlags:18 error:&v10];
    if (v10)
    {
      v4 = RXOSLog();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
      if (v5)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v10;
        v6 = "startRecording error setting AVAudioSession hardware control flags: %@";
        goto LABEL_16;
      }
    }
    else
    {
      self->_isUsingTelephonyVAD = 0;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)startRecording:(int)a3
{
  if (!+[RDSoundInputImpl_iOS_Shared isSystemSleeping])
  {
    if ([(AVAudioEngine *)self->_audioEngine isRunning])
    {
      if (a3 == 1 && self->_isUsingTelephonyVAD)
      {
        v11 = RXOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = "AV is already running using Telephony VAD";
LABEL_14:
          uint64_t v13 = v11;
          uint32_t v14 = 2;
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      if (a3 != 1 && !self->_isUsingTelephonyVAD)
      {
        v11 = RXOSLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          uint64_t v12 = "AV is already running";
          goto LABEL_14;
        }
LABEL_16:
        LOBYTE(v7) = 1;
        return v7;
      }
      [(AVSoundInput *)self stopRecording];
      [(AVSoundInput *)self activateNotifications];
    }
    id v32 = 0;
    unsigned __int8 v15 = [(AVSoundInput *)self setupAudioSession];
    objc_super v16 = RXOSLog();
    v17 = v16;
    if ((v15 & 1) == 0)
    {
      BOOL v7 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v7)
      {
        *(_WORD *)buf = 0;
        uint32_t v8 = "AVAudioSession setup failed";
        v9 = v17;
        os_log_type_t v10 = OS_LOG_TYPE_ERROR;
        goto LABEL_27;
      }
      return v7;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL isUsingTelephonyVAD = self->_isUsingTelephonyVAD;
      *(_DWORD *)buf = 67109120;
      LODWORD(v34) = isUsingTelephonyVAD;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Starting to record from AV and BOOL isUsingTelephonyVAD = %d", buf, 8u);
    }
    if ([+[AVAudioSession sharedInstance] setActive:1 error:&v32])
    {
      unsigned int v19 = [(AVSoundInput *)self startRunningAudioEngine];
      v20 = RXOSLog();
      v21 = v20;
      if (v19)
      {
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        BOOL v22 = self->_isUsingTelephonyVAD;
        *(_DWORD *)buf = 67109120;
        LODWORD(v34) = v22;
        uint64_t v12 = "Started Recording from AV and isUsingTelephonyVAD = %d";
        uint64_t v13 = v21;
        uint32_t v14 = 8;
        goto LABEL_15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Could not start recording from AV, deactivating the audio session", buf, 2u);
      }
      unsigned __int8 v26 = [+[AVAudioSession sharedInstance] setActive:0 withOptions:1 error:&v32];
      v27 = RXOSLog();
      BOOL v5 = v27;
      if (v26)
      {
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
        LOBYTE(v7) = 0;
        if (!v28) {
          return v7;
        }
        *(_WORD *)buf = 0;
        uint32_t v8 = "Could not start recording from AV, Audio Session deactivated";
        goto LABEL_4;
      }
      BOOL v7 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      id v29 = v32;
      id v30 = [v32 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v34 = v29;
      __int16 v35 = 2112;
      id v36 = v30;
      uint32_t v8 = "AVAudioSession could not deactivate, error code:{%@}, error message: {%@}";
    }
    else
    {
      BOOL v5 = RXOSLog();
      BOOL v7 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      id v24 = v32;
      id v25 = [v32 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v34 = v24;
      __int16 v35 = 2112;
      id v36 = v25;
      uint32_t v8 = "AVAudioSession set active failed with error code:{%@}, error message: {%@}";
    }
    v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v23 = 22;
    goto LABEL_28;
  }
  BOOL v5 = RXOSLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v7) = 0;
  if (v6)
  {
    *(_WORD *)buf = 0;
    uint32_t v8 = "System is sleeping, so don't start recording";
LABEL_4:
    v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
LABEL_27:
    uint32_t v23 = 2;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v23);
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)startRunningAudioEngine
{
  v3 = [(AVAudioEngine *)self->_audioEngine inputNode];
  id v4 = [(AVAudioInputNode *)v3 inputFormatForBus:0];
  if ([v4 channelCount])
  {
    [(AVAudioInputNode *)v3 removeTapOnBus:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000CE64;
    v10[3] = &unk_1000EE260;
    v10[4] = self;
    [(AVAudioInputNode *)v3 installTapOnBus:0 bufferSize:1024 format:v4 block:v10];
    uint64_t v9 = 0;
    BOOL v5 = [(AVAudioEngine *)self->_audioEngine startAndReturnError:&v9];
    if (!v5)
    {
      BOOL v6 = RXOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Error Starting engine: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "No audio input available, channel count 0", buf, 2u);
    }
    return 0;
  }
  return v5;
}

- (void)stopRecording
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "StopRecording from AV", buf, 2u);
  }
  [(AVAudioInputNode *)[(AVAudioEngine *)self->_audioEngine inputNode] removeTapOnBus:0];
  [(AVAudioEngine *)self->_audioEngine stop];
  if (dispatch_get_specific(self) == self)
  {
    [(AVSoundInput *)self _drainAndClearAudioConverter];
  }
  else
  {
    avAudioBufferQueue = self->_avAudioBufferQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D0E8;
    block[3] = &unk_1000EDD68;
    block[4] = self;
    dispatch_async(avAudioBufferQueue, block);
  }
  [+[AVAudioSession sharedInstance] setActive:0 withOptions:1 error:&v6];
  if (v6)
  {
    BOOL v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "stopRecording : error stopping AVAudioSession: %@", buf, 0xCu);
    }
  }
}

- (BOOL)isRecording
{
  v2 = [(AVSoundInput *)self audioEngine];
  return [(AVAudioEngine *)v2 isRunning];
}

- (void)dealloc
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deallocating RDSoundInputImpl_iOS_AV", buf, 2u);
  }
  [(AVSoundInput *)self stopRecording];

  [(AVSoundInput *)self deactivateNotifications];
  id deliverSamples = self->_deliverSamples;
  if (deliverSamples)
  {
    _Block_release(deliverSamples);
    self->_id deliverSamples = 0;
  }
  if (dispatch_get_specific(self) != self) {
    dispatch_sync((dispatch_queue_t)self->_avAudioBufferQueue, &stru_1000EE308);
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_avAudioBufferQueue, self, 0, 0);

  BOOL v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "released RDAudioBufferQueue", buf, 2u);
  }
  expectedFormat = self->_expectedFormat;
  if (expectedFormat) {

  }
  converter = self->_converter;
  if (converter) {

  }
  v8.receiver = self;
  v8.super_class = (Class)AVSoundInput;
  [(AVSoundInput *)&v8 dealloc];
}

- (void)_appendPCMBuffer:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "format"), "isEqual:", self->_expectedFormat))
  {
    [(AVSoundInput *)self _drainAndClearAudioConverter];
    uint64_t v6 = (uint64_t *)[a3 int16ChannelData];
    if (!v6) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_AV.m" lineNumber:316 description:@"Invalid audio format"];
    }
    uint64_t v7 = *v6;
    id v8 = [a3 frameLength];
    [(AVSoundInput *)self _addRecordedSpeechSampleData:v7 length:v8];
  }
  else
  {
    [(AVSoundInput *)self _convertAndFeedPCMBufferAVAudioPCMBuffer:a3];
  }
}

- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3
{
  id v6 = [a3 format];
  expectedFormat = self->_expectedFormat;
  if (![(AVAudioFormat *)[(AVAudioConverter *)self->_converter inputFormat] isEqual:v6])
  {
    [(AVSoundInput *)self _drainAndClearAudioConverter];

    id v8 = (AVAudioConverter *)[objc_alloc((Class)AVAudioConverter) initFromFormat:v6 toFormat:expectedFormat];
    self->_converter = v8;
    [(AVAudioConverter *)v8 setSampleRateConverterQuality:127];
  }
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  id v9 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:self->_expectedFormat frameCapacity:8000];
  [v9 setFrameLength:8000];
  do
  {
    v15[5] = v17;
    uint64_t v16 = 0;
    converter = self->_converter;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000D610;
    v15[3] = &unk_1000EE2A8;
    v15[4] = a3;
    id v11 = [(AVAudioConverter *)converter convertToBuffer:v9 error:&v16 withInputFromBlock:v15];
    id v12 = v11;
    if (v11 == (id)2) {
      break;
    }
    if (v11 == (id)3)
    {
      uint32_t v14 = RXOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not run audio converter %@", buf, 0xCu);
      }
      break;
    }
    uint64_t v13 = [v9 int16ChannelData];
    if (!v13) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_AV.m" lineNumber:364 description:@"Invalid audio format"];
    }
    -[AVSoundInput _addRecordedSpeechSampleData:length:](self, "_addRecordedSpeechSampleData:length:", *v13, [v9 frameLength]);
  }
  while (v12 != (id)1);
  if (v9) {

  }
  _Block_object_dispose(v17, 8);
}

- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4
{
  id deliverSamples = (void (**)(id, signed __int16 *, void))self->_deliverSamples;
  if (deliverSamples) {
    deliverSamples[2](deliverSamples, a3, a4);
  }
}

- (void)_drainAndClearAudioConverter
{
  if (self->_converter)
  {
    id v4 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:self->_expectedFormat frameCapacity:8000];
    [v4 setFrameLength:8000];
    do
    {
      uint64_t v10 = 0;
      AVAudioConverterOutputStatus v5 = [(AVAudioConverter *)self->_converter convertToBuffer:v4 error:&v10 withInputFromBlock:&stru_1000EE328];
      if (v5 == AVAudioConverterOutputStatus_EndOfStream) {
        break;
      }
      AVAudioConverterOutputStatus v6 = v5;
      if (v5 == AVAudioConverterOutputStatus_Error)
      {
        id v8 = RXOSLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v12 = v10;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Could not drain converter %@", buf, 0xCu);
        }
        break;
      }
      uint64_t v7 = [v4 int16ChannelData];
      if (!v7) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_AV.m" lineNumber:411 description:@"Invalid audio format"];
      }
      -[AVSoundInput _addRecordedSpeechSampleData:length:](self, "_addRecordedSpeechSampleData:length:", *v7, [v4 frameLength]);
    }
    while (v6 != AVAudioConverterOutputStatus_InputRanDry);
    converter = self->_converter;
    if (converter) {

    }
    self->_converter = 0;
    if (v4) {
  }
    }
}

- (void)activateNotifications
{
  objc_initWeak(&location, self);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = objc_loadWeak(&location);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)sub_10000DA50, kAFPreferencesDidChangeDarwinNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (!self->_isSiriEnabled)
  {
    id v9 = RXOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating notifications with Siri disabled", v10, 2u);
    }
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    id v8 = +[AVAudioSession sharedInstance];
    goto LABEL_9;
  }
  AVAudioConverterOutputStatus v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating notifications with Siri enabled", buf, 2u);
  }
  AVAudioConverterOutputStatus v6 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v6 addObserver:self selector:"_recordingStateChanged:" name:AVSystemController_SomeClientIsActiveDidChangeNotification object:+[AVSystemController sharedInstance]];
  [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") addObserver:self selector:"_handleRouteChange:" name:AVAudioSessionRouteChangeNotification object:+[AVAudioSession sharedInstance]];
  if (self->_isHearstConnectedFlag)
  {
    uint64_t v7 = +[NSNotificationCenter defaultCenter];
    id v8 = +[AVAudioSession sharedInstance];
LABEL_9:
    [(NSNotificationCenter *)v7 addObserver:self selector:"_handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:v8];
  }
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_handleConfigurationChangeNotification:" name:AVAudioEngineConfigurationChangeNotification object:self->_audioEngine];
  self->_isNotificationActivated = 1;
  objc_destroyWeak(&location);
}

- (void)deactivateNotifications
{
  if (self->_isNotificationActivated)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, kAFPreferencesDidChangeDarwinNotification, 0);
    BOOL isSiriEnabled = self->_isSiriEnabled;
    AVAudioConverterOutputStatus v5 = RXOSLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (isSiriEnabled)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dectivating notifications with Siri enabled", buf, 2u);
      }
      if (self->_isHearstConnectedFlag) {
        [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioSessionInterruptionNotification object:0];
      }
      uint64_t v7 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v7 removeObserver:self name:AVSystemController_SomeClientIsActiveDidChangeNotification object:0];
      id v8 = &AVAudioSessionRouteChangeNotification;
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dectivating notifications with Siri disabled", v9, 2u);
      }
      id v8 = &AVAudioSessionInterruptionNotification;
    }
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:*v8 object:0];
    [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioEngineConfigurationChangeNotification object:self->_audioEngine];
    self->_isNotificationActivated = 0;
  }
}

- (void)_didReceiveSiriSettingChanged:(BOOL)a3
{
  if (self->_isSiriEnabled != a3)
  {
    BOOL v3 = a3;
    self->_BOOL isSiriEnabled = a3;
    AVAudioConverterOutputStatus v5 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      [(NSNotificationCenter *)v5 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];
      [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioEngineConfigurationChangeNotification object:0];
      BOOL v6 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v6 addObserver:self selector:"_recordingStateChanged:" name:AVSystemController_SomeClientIsActiveDidChangeNotification object:+[AVSystemController sharedInstance]];
      [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") addObserver:self selector:"_handleRouteChange:" name:AVAudioSessionRouteChangeNotification object:+[AVAudioSession sharedInstance]];
      uint64_t v7 = RXOSLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Stopping the AV session for CS to take over as Siri is enabled", buf, 2u);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000DF04;
      block[3] = &unk_1000EDD68;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
    else
    {
      [(NSNotificationCenter *)v5 removeObserver:self name:AVSystemController_SomeClientIsActiveDidChangeNotification object:0];
      [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];
      [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") addObserver:self selector:"_handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:+[AVAudioSession sharedInstance]];
      id v8 = +[NSNotificationCenter defaultCenter];
      audioEngine = self->_audioEngine;
      [(NSNotificationCenter *)v8 addObserver:self selector:"_handleConfigurationChangeNotification:" name:AVAudioEngineConfigurationChangeNotification object:audioEngine];
    }
  }
}

- (void)_handleAudioSessionInterruption:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = objc_msgSend(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionTypeKey), "unsignedIntegerValue");
  unsigned __int8 v6 = objc_msgSend(objc_msgSend(v4, "objectForKey:", AVAudioSessionInterruptionOptionKey), "unsignedIntegerValue");
  if (v5)
  {
    if (v5 != (id)1) {
      return;
    }
    uint64_t v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Interruption: Audio Interruption started", buf, 2u);
    }
    id v8 = gRDServerQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E0C8;
    v13[3] = &unk_1000EDD68;
    v13[4] = self;
    id v9 = v13;
    goto LABEL_11;
  }
  unsigned __int8 v10 = v6;
  id v11 = RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Interruption: Audio Interruption ended", buf, 2u);
  }
  if ((v10 & 1) != 0 && ![(AVSoundInput *)self isRecording])
  {
    id v8 = gRDServerQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000E100;
    v12[3] = &unk_1000EDD68;
    v12[4] = self;
    id v9 = v12;
LABEL_11:
    dispatch_async(v8, v9);
  }
}

- (void)_handleRouteChange:(id)a3
{
  int v4 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", AVAudioSessionRouteChangeReasonKey), "intValue");
  if (v4 == 2)
  {
    if (self->_isHearstConnectedFlag
      && !+[RDSoundInputImpl isHearstConnected])
    {
      self->_isHearstConnectedFlag = 0;
      [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioSessionInterruptionNotification object:0];
      unsigned __int8 v6 = RXOSLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "handleRouteChange: AirPods are disconnected", buf, 2u);
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E318;
      block[3] = &unk_1000EDD68;
      block[4] = self;
      dispatch_async((dispatch_queue_t)gRDServerQueue, block);
    }
  }
  else if (v4 == 1 {
         && !self->_isHearstConnectedFlag
  }
         && +[RDSoundInputImpl isHearstConnected])
  {
    self->_isHearstConnectedFlag = 1;
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") addObserver:self selector:"_handleAudioSessionInterruption:" name:AVAudioSessionInterruptionNotification object:+[AVAudioSession sharedInstance]];
    id v5 = RXOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleRouteChange: AirPods are connected", buf, 2u);
    }
  }
}

- (void)_handleConfigurationChangeNotification:(id)a3
{
  id v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Audio configuration changed = %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E468;
  block[3] = &unk_1000EDD68;
  block[4] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, block);
}

- (void)_recordingStateChanged:(id)a3
{
  int v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Entering _recordingStateChanged", buf, 2u);
  }
  if (self->_isSiriEnabled)
  {
    id v5 = +[AVSystemController sharedAVSystemController];
    id v6 = [v5 attributeForKey:AVSystemController_ActiveClientPIDsThatHideTheSpeechDetectionDeviceAttribute];
    uint64_t v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AVSystemController :: Recording state changed. List of recording client PIDs : %@", buf, 0xCu);
    }
    if (!v6)
    {
      +[RDSoundInputImpl isCSVADPresent];
      return;
    }
    if (![v6 count]) {
      return;
    }
    if ([v6 count] == (id)1)
    {
      unsigned int v8 = objc_msgSend(objc_msgSend(v6, "objectAtIndex:", 0), "intValue");
      if (v8 == getpid())
      {
        if (+[RDSoundInputImpl isHearstConnected])
        {
          id v9 = RXOSLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "AirPods are connected so keep the AV session active", buf, 2u);
          }
          return;
        }
        if (!+[RDSoundInputImpl isCSVADPresent]) {
          return;
        }
        uint64_t v12 = RXOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Stopping the AV session for CS to take over", buf, 2u);
        }
        unsigned __int8 v10 = gRDServerQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000E760;
        block[3] = &unk_1000EDD68;
        block[4] = self;
        id v11 = block;
LABEL_22:
        dispatch_async(v10, v11);
        return;
      }
    }
    if (!+[RDSoundInputImpl isCSVADPresent]
      && (objc_msgSend(v6, "containsObject:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid())) & 1) == 0&& !+[RDSoundInputImpl isCallActive](RDSoundInputImpl, "isCallActive"))
    {
      unsigned __int8 v10 = gRDServerQueue;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10000E768;
      v13[3] = &unk_1000EDD68;
      v13[4] = self;
      id v11 = v13;
      goto LABEL_22;
    }
  }
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
}

- (id)deliverSamples
{
  return self->_deliverSamples;
}

- (void)setDeliverSamples:(id)a3
{
}

- (AVAudioFormat)expectedFormat
{
  return self->_expectedFormat;
}

- (void)setExpectedFormat:(id)a3
{
}

@end