@interface AVIndependentSoundInput
- (AFNotifyObserver)siriObserver;
- (AVAudioEngine)audioEngine;
- (AVAudioFormat)expectedFormat;
- (AVIndependentSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4;
- (BOOL)audioSessionSetupCompleted;
- (BOOL)isRecording;
- (BOOL)setupAudioSession;
- (BOOL)startRecording:(int)a3;
- (BOOL)startRunningAudioEngine;
- (id)deliverSamples;
- (void)_addRecordedSpeechSampleData:(signed __int16 *)a3 length:(unsigned int)a4;
- (void)_appendPCMBuffer:(id)a3;
- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3;
- (void)_drainAndClearAudioConverter;
- (void)_handleConfigurationChangeNotification:(id)a3;
- (void)activateNotifications;
- (void)deactivateNotifications;
- (void)dealloc;
- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5;
- (void)setAudioEngine:(id)a3;
- (void)setDeliverSamples:(id)a3;
- (void)setExpectedFormat:(id)a3;
- (void)setSiriObserver:(id)a3;
- (void)stopRecording;
- (void)stopRunningAudioEngine;
@end

@implementation AVIndependentSoundInput

- (AVIndependentSoundInput)initWithExpectedFormat:(id)a3 deliverSamples:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AVIndependentSoundInput;
  v6 = [(AVIndependentSoundInput *)&v12 init];
  if (v6)
  {
    v7 = dispatch_queue_create("RDAudioBufferQueue", 0);
    v6->_avAudioBufferQueue = (OS_dispatch_queue *)v7;
    dispatch_queue_set_specific(v7, v6, v6, 0);
    v6->_expectedFormat = (AVAudioFormat *)a3;
    v6->_deliverSamples = _Block_copy(a4);
    v6->_audioEngine = (AVAudioEngine *)objc_alloc_init((Class)AVAudioEngine);
    unsigned __int8 v8 = [(AVIndependentSoundInput *)v6 setupAudioSession];
    v6->_audioSessionSetupCompleted = v8;
    if ((v8 & 1) == 0)
    {
      v9 = RXOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "AVI:ERROR in setting up the audio session", v11, 2u);
      }
      return 0;
    }
  }
  return v6;
}

- (BOOL)setupAudioSession
{
  uint64_t v11 = 0;
  id v2 = objc_alloc_init((Class)AVAudioSessionRouteControl);
  [v2 setRouteControlOptions:1];
  [+[AVAudioSession sharedInstance] setPreferredRouteControlConfig:v2 error:&v11];
  if (v11)
  {
    v3 = RXOSLog();
    BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v11;
      v5 = "AVI:Error setting preffered route: %@";
LABEL_7:
      v6 = v3;
      uint32_t v7 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v5, buf, v7);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    [+[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord withOptions:131073 error:&v11];
    if (v11)
    {
      v3 = RXOSLog();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      if (v4)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v11;
        v5 = "AVI:Error setting audio session category: %@";
        goto LABEL_7;
      }
    }
    else
    {
      [+[AVAudioSession sharedInstance] preferredRouteControlConfig];
      if ([v2 routeControlOptions] != (id)1)
      {
        unsigned __int8 v8 = RXOSLog();
        BOOL v4 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        *(_WORD *)buf = 0;
        v5 = "AVI:no independent route";
        v6 = v8;
        uint32_t v7 = 2;
        goto LABEL_8;
      }
      [+[AVAudioSession sharedInstance] setAllowHapticsAndSystemSoundsDuringRecording:1 error:&v11];
      if (v11)
      {
        v3 = RXOSLog();
        BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        if (!v4) {
          return v4;
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v13 = v11;
        v5 = "AVI:Error setting haptics and sounds during recording: %@";
        goto LABEL_7;
      }
      if (_os_feature_enabled_impl())
      {
        v9 = +[AVAudioSession sharedInstance];
        [(AVAudioSession *)v9 setMXSessionProperty:kMXSessionProperty_PrefersNoInterruptionsDuringRemoteDeviceControl value:&__kCFBooleanTrue error:&v11];
        if (v11)
        {
          v3 = RXOSLog();
          BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
          if (!v4) {
            return v4;
          }
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v11;
          v5 = "AVI:Error setting MX property for non-interruption: %@";
          goto LABEL_7;
        }
      }
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)activateNotifications
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AVI:AV activateNotifications", v6, 2u);
  }
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"_handleConfigurationChangeNotification:" name:AVAudioEngineConfigurationChangeNotification object:self->_audioEngine];
  if (objc_opt_class())
  {
    id v4 = [objc_alloc((Class)NSString) initWithUTF8String:"com.apple.siri.client-state-changed"];
    id v5 = objc_alloc((Class)AFNotifyObserver);
    self->_siriObserver = (AFNotifyObserver *)[v5 initWithName:v4 options:1 queue:gRDServerQueue delegate:self];
  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  unsigned __int8 v8 = RXOSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 134218240;
    unint64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AF notification didChangeStateFrom %lld to %lld ", (uint8_t *)&v19, 0x16u);
  }
  v9 = RXOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((a5 & 4) != 0) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Siri is listening: %@", (uint8_t *)&v19, 0xCu);
  }
  uint64_t v11 = RXOSLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((a5 & 8) != 0) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Siri is speaking: %@", (uint8_t *)&v19, 0xCu);
  }
  unint64_t v13 = a5 & 0xFFFFFFFFFFFFFFFDLL;
  v14 = RXOSLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v13) {
      CFStringRef v15 = @"NO";
    }
    else {
      CFStringRef v15 = @"YES";
    }
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Siri is idle: %@", (uint8_t *)&v19, 0xCu);
  }
  unsigned int v16 = [(AVIndependentSoundInput *)self isRecording];
  if (v13)
  {
    if (v16)
    {
      v17 = RXOSLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Stop recording from Independent VAD since Siri is active", (uint8_t *)&v19, 2u);
      }
      [(AVIndependentSoundInput *)self stopRecording];
    }
  }
  else if ((v16 & 1) == 0)
  {
    v18 = RXOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Start recording Independent VAD since Siri is Idle", (uint8_t *)&v19, 2u);
    }
    [(AVIndependentSoundInput *)self startRecording:0];
  }
}

- (void)deactivateNotifications
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "AVI:AV deactivateNotifications", v4, 2u);
  }
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:AVAudioEngineConfigurationChangeNotification object:self->_audioEngine];
}

- (void)_handleConfigurationChangeNotification:(id)a3
{
  id v5 = RXOSLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "AVI::Audio configuration changed = %@", buf, 0xCu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B26C;
  block[3] = &unk_1000EDD68;
  block[4] = self;
  dispatch_async((dispatch_queue_t)gRDServerQueue, block);
}

- (BOOL)startRecording:(int)a3
{
  id v4 = RXOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AVI:startRecording", buf, 2u);
  }
  if (+[RDSoundInputImpl_iOS_Shared isSystemSleeping])
  {
    id v5 = RXOSLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v7) = 0;
    if (!v6) {
      return v7;
    }
    *(_WORD *)buf = 0;
    id v8 = "AVI:System is sleeping, so don't start recording";
    goto LABEL_6;
  }
  if ([(AVAudioEngine *)self->_audioEngine isRunning])
  {
    CFStringRef v12 = RXOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v13 = "AVI:AV is already running";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  [(AVIndependentSoundInput *)self stopRunningAudioEngine];
  id v27 = 0;
  if (![(AVIndependentSoundInput *)self audioSessionSetupCompleted])
  {
    unsigned __int8 v14 = [+[AVAudioSession sharedInstance] setActive:1 error:&v27];
    CFStringRef v15 = RXOSLog();
    unsigned int v16 = v15;
    if ((v14 & 1) == 0)
    {
      BOOL v7 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      if (!v7) {
        return v7;
      }
      id v22 = v27;
      id v23 = [v27 localizedDescription];
      *(_DWORD *)buf = 138412546;
      id v29 = v22;
      __int16 v30 = 2112;
      id v31 = v23;
      id v8 = "AVI:AVAudioSession set active failed with error code:{%@}, error message: {%@}";
      v9 = v16;
      goto LABEL_30;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AVI:Audio Session already active", buf, 2u);
    }
  }
  [(AVIndependentSoundInput *)self activateNotifications];
  unsigned int v17 = [(AVIndependentSoundInput *)self startRunningAudioEngine];
  v18 = RXOSLog();
  CFStringRef v12 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      unint64_t v13 = "AVI:Started Recording from AV";
      goto LABEL_18;
    }
LABEL_19:
    LOBYTE(v7) = 1;
    return v7;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AVI:Could not start recording from AV, deactivating the audio session", buf, 2u);
  }
  unsigned __int8 v19 = [+[AVAudioSession sharedInstance] setActive:0 withOptions:1 error:&v27];
  unint64_t v20 = RXOSLog();
  id v5 = v20;
  if ((v19 & 1) == 0)
  {
    BOOL v7 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    id v24 = v27;
    id v25 = [v27 localizedDescription];
    *(_DWORD *)buf = 138412546;
    id v29 = v24;
    __int16 v30 = 2112;
    id v31 = v25;
    id v8 = "AVI:AVAudioSession could not deactivate, error code:{%@}, error message: {%@}";
    v9 = v5;
LABEL_30:
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 22;
    goto LABEL_7;
  }
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v7) = 0;
  if (!v21) {
    return v7;
  }
  *(_WORD *)buf = 0;
  id v8 = "AVI:Could not start recording from AV, Audio Session deactivated";
LABEL_6:
  v9 = v5;
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  uint32_t v11 = 2;
LABEL_7:
  _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, buf, v11);
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)startRunningAudioEngine
{
  v3 = [(AVAudioEngine *)self->_audioEngine inputNode];
  id v4 = [(AVAudioInputNode *)v3 inputFormatForBus:0];
  if ([v4 channelCount])
  {
    [+[AVAudioSession sharedInstance] availableInputs];
    [(AVAudioInputNode *)v3 removeTapOnBus:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B7C8;
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
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AVI:Error Starting engine: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v7 = RXOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "AVI:No audio input available, channel count 0", buf, 2u);
    }
    return 0;
  }
  return v5;
}

- (void)stopRunningAudioEngine
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AVI:stopRunningAudioEngine", v4, 2u);
  }
  [(AVAudioInputNode *)[(AVAudioEngine *)self->_audioEngine inputNode] removeTapOnBus:0];
  [(AVAudioEngine *)self->_audioEngine stop];
}

- (void)stopRecording
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AVI:StopRecording from AV", buf, 2u);
  }
  [(AVIndependentSoundInput *)self deactivateNotifications];
  [(AVIndependentSoundInput *)self stopRunningAudioEngine];
  if (dispatch_get_specific(self) == self)
  {
    [(AVIndependentSoundInput *)self _drainAndClearAudioConverter];
  }
  else
  {
    avAudioBufferQueue = self->_avAudioBufferQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BAC0;
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
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AVI:stopRecording : error stopping AVAudioSession: %@", buf, 0xCu);
    }
  }
}

- (BOOL)isRecording
{
  id v2 = [(AVIndependentSoundInput *)self audioEngine];
  return [(AVAudioEngine *)v2 isRunning];
}

- (void)dealloc
{
  v3 = RXOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AVI:Deallocating RDSoundInputImpl_iOS_Independent_AV", buf, 2u);
  }
  if ([(AVIndependentSoundInput *)self isRecording]) {
    [(AVIndependentSoundInput *)self stopRecording];
  }

  id deliverSamples = self->_deliverSamples;
  if (deliverSamples)
  {
    _Block_release(deliverSamples);
    self->_id deliverSamples = 0;
  }
  if (dispatch_get_specific(self) != self) {
    dispatch_sync((dispatch_queue_t)self->_avAudioBufferQueue, &stru_1000EE280);
  }
  dispatch_queue_set_specific((dispatch_queue_t)self->_avAudioBufferQueue, self, 0, 0);

  expectedFormat = self->_expectedFormat;
  if (expectedFormat) {

  }
  converter = self->_converter;
  if (converter) {

  }
  v7.receiver = self;
  v7.super_class = (Class)AVIndependentSoundInput;
  [(AVIndependentSoundInput *)&v7 dealloc];
}

- (void)_appendPCMBuffer:(id)a3
{
  if (objc_msgSend(objc_msgSend(a3, "format"), "isEqual:", self->_expectedFormat))
  {
    [(AVIndependentSoundInput *)self _drainAndClearAudioConverter];
    uint64_t v6 = (uint64_t *)[a3 int16ChannelData];
    if (!v6) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_Independent_AV.m" lineNumber:293 description:@"Invalid audio format"];
    }
    uint64_t v7 = *v6;
    id v8 = [a3 frameLength];
    [(AVIndependentSoundInput *)self _addRecordedSpeechSampleData:v7 length:v8];
  }
  else
  {
    [(AVIndependentSoundInput *)self _convertAndFeedPCMBufferAVAudioPCMBuffer:a3];
  }
}

- (void)_convertAndFeedPCMBufferAVAudioPCMBuffer:(id)a3
{
  id v6 = [a3 format];
  expectedFormat = self->_expectedFormat;
  if (![(AVAudioFormat *)[(AVAudioConverter *)self->_converter inputFormat] isEqual:v6])
  {
    [(AVIndependentSoundInput *)self _drainAndClearAudioConverter];

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
    v15[2] = sub_10000BF5C;
    v15[3] = &unk_1000EE2A8;
    v15[4] = a3;
    id v11 = [(AVAudioConverter *)converter convertToBuffer:v9 error:&v16 withInputFromBlock:v15];
    id v12 = v11;
    if (v11 == (id)2) {
      break;
    }
    if (v11 == (id)3)
    {
      unsigned __int8 v14 = RXOSLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "AVI:Could not run audio converter %@", buf, 0xCu);
      }
      break;
    }
    unint64_t v13 = [v9 int16ChannelData];
    if (!v13) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_Independent_AV.m" lineNumber:341 description:@"Invalid audio format"];
    }
    -[AVIndependentSoundInput _addRecordedSpeechSampleData:length:](self, "_addRecordedSpeechSampleData:length:", *v13, [v9 frameLength]);
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
      AVAudioConverterOutputStatus v5 = [(AVAudioConverter *)self->_converter convertToBuffer:v4 error:&v10 withInputFromBlock:&stru_1000EE2E8];
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
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "AVI:Could not drain converter %@", buf, 0xCu);
        }
        break;
      }
      uint64_t v7 = [v4 int16ChannelData];
      if (!v7) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"RDSoundInputImpl_iOS_Independent_AV.m" lineNumber:388 description:@"Invalid audio format"];
      }
      -[AVIndependentSoundInput _addRecordedSpeechSampleData:length:](self, "_addRecordedSpeechSampleData:length:", *v7, [v4 frameLength]);
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

- (BOOL)audioSessionSetupCompleted
{
  return self->_audioSessionSetupCompleted;
}

- (AFNotifyObserver)siriObserver
{
  return self->_siriObserver;
}

- (void)setSiriObserver:(id)a3
{
}

@end