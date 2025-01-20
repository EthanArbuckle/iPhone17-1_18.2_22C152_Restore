@interface SOSEmergencyCallVoiceLoopManager
+ (BOOL)_activeCallSupportsDTMF;
+ (id)_activeCallPreferringEmergencyOrSOS;
+ (id)_messageKeyForReason:(int64_t)a3 shortVersion:(BOOL)a4;
+ (id)_validDTMFDigits;
- (BOOL)_isSpeaking;
- (BOOL)callSupportsRemoteControl;
- (BOOL)outputToTelephonyUplink;
- (BOOL)testMode;
- (CLLocation)locationToSynthesize;
- (CLLocationManager)locationManager;
- (NSTimer)messageRepeatTimer;
- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3;
- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3 playbackMode:(int64_t)a4;
- (SOSEmergencyCallVoiceLoopManagerDelegate)delegate;
- (SOSVoiceLoopAnalyticsReporter)loopAnalyticsReporter;
- (SOSVoiceUtterer)localVoiceUtterer;
- (SOSVoiceUtterer)uplinkVoiceUtterer;
- (_MKLocationShifter)locationShifter;
- (float)loopVolume;
- (id)_coordinatesStringFromLocation:(id)a3 shortVersion:(BOOL)a4;
- (id)_emergencyDescriptorUtterancesForRemoteVariant:(BOOL)a3 repeatVariant:(BOOL)a4;
- (id)_languageToUseInVoiceLoopForCountryCode:(id)a3;
- (id)_overrideLocation;
- (id)_preferredVoiceLanguageForCountryCode:(id)a3;
- (id)emergencyDescriptorUtteranceVariantsForRepeatVariant:(BOOL)a3;
- (id)localizedStringForKey:(id)a3;
- (id)stopConfirmationUtterancesForPlaybackState:(unint64_t)a3 remoteVariant:(BOOL)a4 verbalizedActionOut:(unint64_t *)a5;
- (id)voiceLanguage;
- (int64_t)reason;
- (unint64_t)_loopPhaseFromUtteranceIndex:(unint64_t)a3;
- (unint64_t)playbackState;
- (unint64_t)playingLoopIndex;
- (void)_handleDTMFDigit:(char)a3;
- (void)_handleDTMFMessageRepeatCommand;
- (void)_handleDTMFMessageResumeCommand;
- (void)_handleDTMFMessageStopCommand;
- (void)_handleRemoteDTMFDigits:(id)a3;
- (void)_speakLoopMessage;
- (void)_startListeningForRemoteControl;
- (void)_startLoopPlayback;
- (void)_stopListeningForRemoteControl;
- (void)_stopMessagePlayback;
- (void)_updateLocation:(id)a3;
- (void)callCenter:(id)a3 reportedCall:(id)a4 receivedDTMFUpdate:(id)a5;
- (void)dealloc;
- (void)invalidate;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocalVoiceUtterer:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLocationShifter:(id)a3;
- (void)setLocationToSynthesize:(id)a3;
- (void)setLoopVolume:(float)a3;
- (void)setMessageRepeatTimer:(id)a3;
- (void)setPlaybackState:(unint64_t)a3;
- (void)setPlayingLoopIndex:(unint64_t)a3;
- (void)setReason:(int64_t)a3;
- (void)setTestMode:(BOOL)a3;
- (void)setUplinkVoiceUtterer:(id)a3;
- (void)shiftedLocationIfApplicable:(id)a3 withcompletion:(id)a4;
- (void)speakResponseUtteranceVariants:(id)a3;
- (void)speakUtteranceVariants:(id)a3 withPlaybackState:(unint64_t)a4;
- (void)startLoopPlayback;
- (void)startMessagePlayback;
- (void)stopLoopPlayback;
- (void)stopMessagePlayback;
- (void)voiceUtterer:(id)a3 didFinishSpeakingUtterances:(id)a4;
- (void)voiceUtterer:(id)a3 willStartSpeakingUtteranceAtIndex:(unint64_t)a4 fromUtterances:(id)a5;
@end

@implementation SOSEmergencyCallVoiceLoopManager

- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SOSEmergencyCallVoiceLoopManager;
  v4 = [(SOSEmergencyCallVoiceLoopManager *)&v12 init];
  v5 = v4;
  if (v4)
  {
    v4->_reason = a3;
    id v6 = objc_alloc(MEMORY[0x1E4F1E600]);
    v7 = +[SOSUtilities sosLocationBundle];
    uint64_t v8 = [v6 initWithEffectiveBundle:v7 delegate:v5 onQueue:MEMORY[0x1E4F14428]];
    locationManager = v5->_locationManager;
    v5->_locationManager = (CLLocationManager *)v8;

    [(CLLocationManager *)v5->_locationManager setDesiredAccuracy:-1.0];
    [(CLLocationManager *)v5->_locationManager startUpdatingLocation];
    v10 = [(CLLocationManager *)v5->_locationManager location];
    [(SOSEmergencyCallVoiceLoopManager *)v5 _updateLocation:v10];

    [(SOSEmergencyCallVoiceLoopManager *)v5 _startListeningForRemoteControl];
  }
  return v5;
}

- (void)dealloc
{
  [(SOSEmergencyCallVoiceLoopManager *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SOSEmergencyCallVoiceLoopManager;
  [(SOSEmergencyCallVoiceLoopManager *)&v3 dealloc];
}

- (void)startLoopPlayback
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    v11 = "-[SOSEmergencyCallVoiceLoopManager startLoopPlayback]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  uint64_t v4 = [(id)objc_opt_class() _activeCallSupportsDTMF];
  v5 = [SOSVoiceLoopAnalyticsReporter alloc];
  int64_t reason = self->_reason;
  v7 = [(SOSEmergencyCallVoiceLoopManager *)self voiceLanguage];
  uint64_t v8 = [(SOSVoiceLoopAnalyticsReporter *)v5 initWithReason:reason language:v7 dtmfAvailable:v4];
  loopAnalyticsReporter = self->_loopAnalyticsReporter;
  self->_loopAnalyticsReporter = v8;

  [(SOSEmergencyCallVoiceLoopManager *)self _startLoopPlayback];
}

- (void)stopLoopPlayback
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "Asked to stopLoopPlayback when not looping", v1, 2u);
}

- (void)invalidate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    v7 = "-[SOSEmergencyCallVoiceLoopManager invalidate]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(SOSVoiceLoopAnalyticsReporter *)self->_loopAnalyticsReporter reportVoiceLoopWillTerminate];
  loopAnalyticsReporter = self->_loopAnalyticsReporter;
  self->_loopAnalyticsReporter = 0;

  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  locationManager = self->_locationManager;
  self->_locationManager = 0;

  [(SOSEmergencyCallVoiceLoopManager *)self _stopMessagePlayback];
  [(SOSEmergencyCallVoiceLoopManager *)self _stopListeningForRemoteControl];
}

- (SOSEmergencyCallVoiceLoopManager)initWithReason:(int64_t)a3 playbackMode:(int64_t)a4
{
  v5 = [(SOSEmergencyCallVoiceLoopManager *)self initWithReason:a3];
  int v6 = v5;
  if (v5) {
    [(SOSEmergencyCallVoiceLoopManager *)v5 setTestMode:a4 == 1];
  }
  return v6;
}

- (void)startMessagePlayback
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SOSEmergencyCallVoiceLoopManager startMessagePlayback]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(SOSEmergencyCallVoiceLoopManager *)self startLoopPlayback];
}

- (void)stopMessagePlayback
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[SOSEmergencyCallVoiceLoopManager stopMessagePlayback]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(SOSEmergencyCallVoiceLoopManager *)self stopLoopPlayback];
}

- (SOSVoiceUtterer)uplinkVoiceUtterer
{
  if (!self->_uplinkVoiceUtterer
    && [(SOSEmergencyCallVoiceLoopManager *)self outputToTelephonyUplink])
  {
    objc_super v3 = objc_alloc_init(SOSVoiceUtterer);
    uplinkVoiceUtterer = self->_uplinkVoiceUtterer;
    self->_uplinkVoiceUtterer = v3;

    [(SOSVoiceUtterer *)self->_uplinkVoiceUtterer setDelegate:self];
    [(SOSVoiceUtterer *)self->_uplinkVoiceUtterer setMixToTelephonyUplink:1];
  }
  v5 = self->_uplinkVoiceUtterer;

  return v5;
}

- (BOOL)outputToTelephonyUplink
{
  BOOL v2 = [(SOSEmergencyCallVoiceLoopManager *)self testMode];
  if (v2)
  {
    objc_super v3 = sos_voiceloop_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "SOSEmergencyCallVoiceLoopManager testMode == YES, => outputToTelephonyUplink = NO", v5, 2u);
    }
  }
  return !v2;
}

- (SOSVoiceUtterer)localVoiceUtterer
{
  if (!self->_localVoiceUtterer
    && [(SOSEmergencyCallVoiceLoopManager *)self outputToTelephonyUplink])
  {
    objc_super v3 = objc_alloc_init(SOSVoiceUtterer);
    localVoiceUtterer = self->_localVoiceUtterer;
    self->_localVoiceUtterer = v3;

    [(SOSVoiceUtterer *)self->_localVoiceUtterer setDelegate:self];
    [(SOSVoiceUtterer *)self->_localVoiceUtterer setMixToTelephonyUplink:0];
  }
  v5 = self->_localVoiceUtterer;

  return v5;
}

- (void)speakUtteranceVariants:(id)a3 withPlaybackState:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = sos_voiceloop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    v18 = "-[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:]";
    __int16 v19 = 2048;
    unint64_t v20 = a4;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_INFO, "%s - newPlaybackState:%tu, utteranceVariants:%@", (uint8_t *)&v17, 0x20u);
  }

  BOOL v8 = +[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.audio.playRemoteAsLocal" defaultValue:0];
  BOOL v9 = +[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.audio.playLocalAsRemote" defaultValue:0];
  if (v8) {
    [v6 remoteUtterances];
  }
  else {
  int v10 = [v6 localUtterances];
  }
  if (v9) {
    [v6 localUtterances];
  }
  else {
  v11 = [v6 remoteUtterances];
  }
  uint64_t v12 = [v10 count];
  if ([(SOSEmergencyCallVoiceLoopManager *)self outputToTelephonyUplink]) {
    BOOL v13 = [v11 count] != 0;
  }
  else {
    BOOL v13 = 0;
  }
  v14 = sos_voiceloop_log();
  v15 = v14;
  if (!v12 && !v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SOSEmergencyCallVoiceLoopManager speakUtteranceVariants:withPlaybackState:]();
    }
    goto LABEL_22;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    v18 = (const char *)a4;
    _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "speakUtteranceVariants - setting newPlaybackState:%tu", (uint8_t *)&v17, 0xCu);
  }

  [(SOSEmergencyCallVoiceLoopManager *)self setPlaybackState:a4];
  if (v12)
  {
    v16 = [(SOSEmergencyCallVoiceLoopManager *)self localVoiceUtterer];
    [v16 speakUtterances:v10];
  }
  if (v13)
  {
    v15 = [(SOSEmergencyCallVoiceLoopManager *)self uplinkVoiceUtterer];
    [v15 speakUtterances:v11];
LABEL_22:
  }
}

- (BOOL)_isSpeaking
{
  if ([(SOSVoiceUtterer *)self->_localVoiceUtterer isSpeaking]) {
    return 1;
  }
  uplinkVoiceUtterer = self->_uplinkVoiceUtterer;

  return [(SOSVoiceUtterer *)uplinkVoiceUtterer isSpeaking];
}

- (void)_stopMessagePlayback
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SOSEmergencyCallVoiceLoopManager _stopMessagePlayback]";
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  [(SOSVoiceUtterer *)self->_localVoiceUtterer stopSpeaking];
  [(SOSVoiceUtterer *)self->_uplinkVoiceUtterer stopSpeaking];
  [(SOSEmergencyCallVoiceLoopManager *)self setPlaybackState:200];
  [(NSTimer *)self->_messageRepeatTimer invalidate];
  messageRepeatTimer = self->_messageRepeatTimer;
  self->_messageRepeatTimer = 0;
}

- (void)setPlaybackState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_playbackState != a3)
  {
    int v5 = sos_voiceloop_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t playbackState = self->_playbackState;
      int v10 = 134218240;
      unint64_t v11 = playbackState;
      __int16 v12 = 2048;
      unint64_t v13 = a3;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "setPlaybackState: %tu => %tu", (uint8_t *)&v10, 0x16u);
    }

    unint64_t v7 = self->_playbackState;
    self->_unint64_t playbackState = a3;
    BOOL v8 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v8 reportVoiceLoopPlaybackStateChanged:a3];

    if (a3 == 100)
    {
      BOOL v9 = [(SOSEmergencyCallVoiceLoopManager *)self delegate];
      [v9 voiceLoopManagerDidStartLoopPlayback:self];
    }
    else
    {
      if (v7 != 100) {
        return;
      }
      BOOL v9 = [(SOSEmergencyCallVoiceLoopManager *)self delegate];
      [v9 voiceLoopManagerDidStopLoopPlayback:self];
    }
  }
}

- (void)setPlayingLoopIndex:(unint64_t)a3
{
  int v5 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v5 reportVoiceLoopIndexChanged:a3];

  if (self->_playingLoopIndex != a3) {
    self->_playingLoopIndex = a3;
  }
}

- (void)_startLoopPlayback
{
  LODWORD(v2) = 1.0;
  [(SOSEmergencyCallVoiceLoopManager *)self setLoopVolume:v2];
  [(SOSEmergencyCallVoiceLoopManager *)self setPlayingLoopIndex:0];

  [(SOSEmergencyCallVoiceLoopManager *)self _speakLoopMessage];
}

- (void)_speakLoopMessage
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(SOSEmergencyCallVoiceLoopManager *)self setPlayingLoopIndex:[(SOSEmergencyCallVoiceLoopManager *)self playingLoopIndex] + 1];
  objc_super v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[SOSEmergencyCallVoiceLoopManager _speakLoopMessage]";
    __int16 v7 = 2048;
    unint64_t v8 = [(SOSEmergencyCallVoiceLoopManager *)self playingLoopIndex];
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "%s - Playing SOS loop #: %lu", (uint8_t *)&v5, 0x16u);
  }

  int v4 = [(SOSEmergencyCallVoiceLoopManager *)self emergencyDescriptorUtteranceVariantsForRepeatVariant:0];
  [(SOSEmergencyCallVoiceLoopManager *)self speakUtteranceVariants:v4 withPlaybackState:100];
}

- (id)emergencyDescriptorUtteranceVariantsForRepeatVariant:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SOSEmergencyCallVoiceLoopManager *)self _emergencyDescriptorUtterancesForRemoteVariant:0 repeatVariant:a3];
  id v6 = [(SOSEmergencyCallVoiceLoopManager *)self _emergencyDescriptorUtterancesForRemoteVariant:1 repeatVariant:v3];
  __int16 v7 = +[SOSVoiceUtteranceVariants utteranceVariantsWithLocalUtterances:v5 remoteUtterances:v6];

  return v7;
}

- (id)_emergencyDescriptorUtterancesForRemoteVariant:(BOOL)a3 repeatVariant:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v42[1] = *MEMORY[0x1E4F143B8];
  if (a4
    && !a3
    && !+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.config.repeat.playLocally" defaultValue:0])
  {
    unint64_t v8 = +[SOSVoiceUtterance silentUtterance];
    v42[0] = v8;
    __int16 v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
    goto LABEL_29;
  }
  __int16 v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  unint64_t v8 = [(SOSEmergencyCallVoiceLoopManager *)self voiceLanguage];
  float v9 = 1.0;
  if (!v4)
  {
    [(SOSEmergencyCallVoiceLoopManager *)self loopVolume];
    float v9 = v10;
  }
  unint64_t v11 = objc_msgSend((id)objc_opt_class(), "_messageKeyForReason:shortVersion:", -[SOSEmergencyCallVoiceLoopManager reason](self, "reason"), v4);
  __int16 v12 = [SOSVoiceUtterance alloc];
  LODWORD(v13) = 1.0;
  *(float *)&double v14 = v9;
  v15 = [(SOSVoiceUtterance *)v12 initWithMessageKey:v11 voiceLanguage:v8 volume:v14 rateMultiplier:v13];
  [v7 addObject:v15];

  v16 = [(SOSEmergencyCallVoiceLoopManager *)self locationToSynthesize];
  if (v16)
  {
    int v17 = [(SOSEmergencyCallVoiceLoopManager *)self _coordinatesStringFromLocation:v16 shortVersion:v4];
    if (v17)
    {
      v18 = [SOSVoiceUtterance alloc];
      LODWORD(v19) = 1061997773;
      *(float *)&double v20 = v9;
      __int16 v21 = [(SOSVoiceUtterance *)v18 initWithLocalizedMessageString:v17 voiceLanguage:v8 volume:v20 rateMultiplier:v19];
      [v7 addObject:v21];
    }
    else
    {
      __int16 v21 = sos_voiceloop_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SOSEmergencyCallVoiceLoopManager _emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:]();
      }
    }
  }
  BOOL v22 = [(SOSEmergencyCallVoiceLoopManager *)self callSupportsRemoteControl];
  BOOL v23 = v22;
  if (!v4)
  {
    v24 = NSString;
    if (v22 && v5)
    {
      v25 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_LOOP_HOW_TO_STOP"];
      uint64_t v26 = 48;
    }
    else
    {
      v25 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_LOOP_REPEAT"];
      uint64_t v26 = 5;
    }
    goto LABEL_20;
  }
  if (v5)
  {
    v24 = NSString;
    v25 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_BRIEF_HOW_TO_REPEAT"];
    uint64_t v26 = 49;
LABEL_20:
    v27 = objc_msgSend(v24, "stringWithFormat:", v25, v26);

    goto LABEL_21;
  }
  v27 = 0;
LABEL_21:
  v28 = sos_voiceloop_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v37 = v5;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v4;
    __int16 v38 = 1024;
    BOOL v39 = v23;
    __int16 v40 = 2114;
    v41 = v27;
    _os_log_impl(&dword_1B3A94000, v28, OS_LOG_TYPE_DEFAULT, "remoteVariant:%{BOOL}d repeatVariant:%{BOOL}d, callSupportsRemoteControl: %{BOOL}d => %{public}@", buf, 0x1Eu);
  }

  if ([v27 length])
  {
    v29 = [SOSVoiceUtterance alloc];
    LODWORD(v30) = 1.0;
    *(float *)&double v31 = v9;
    uint64_t v32 = [(SOSVoiceUtterance *)v29 initWithLocalizedMessageString:v27 voiceLanguage:v8 volume:v31 rateMultiplier:v30];
  }
  else
  {
    uint64_t v32 = +[SOSVoiceUtterance silentUtterance];
  }
  v33 = (void *)v32;
  [v7 addObject:v32];

  v34 = sos_voiceloop_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v37 = v7;
    _os_log_impl(&dword_1B3A94000, v34, OS_LOG_TYPE_DEFAULT, "Generated loop utterances: %@", buf, 0xCu);
  }

LABEL_29:

  return v7;
}

- (unint64_t)_loopPhaseFromUtteranceIndex:(unint64_t)a3
{
  if (a3 < 3) {
    return 100 * a3 + 100;
  }
  BOOL v4 = sos_voiceloop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[SOSEmergencyCallVoiceLoopManager _loopPhaseFromUtteranceIndex:]();
  }

  return 0;
}

+ (id)_messageKeyForReason:(int64_t)a3 shortVersion:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3 == 1)
  {
    BOOL v5 = @"NEWTON_WATCH";
  }
  else if (a3 == 2)
  {
    BOOL v5 = @"KAPPA_PHONE";
  }
  else
  {
    id v6 = sos_voiceloop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SOSEmergencyCallVoiceLoopManager _messageKeyForReason:shortVersion:]();
    }

    BOOL v5 = 0;
  }
  __int16 v7 = @"LOOP";
  if (v4) {
    __int16 v7 = @"BRIEF";
  }
  unint64_t v8 = [NSString stringWithFormat:@"SOS_VOICELOOP_SPEECH_%@_INTRO_%@", v7, v5];

  return v8;
}

- (void)voiceUtterer:(id)a3 willStartSpeakingUtteranceAtIndex:(unint64_t)a4 fromUtterances:(id)a5
{
  unint64_t v7 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
  id v9 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  if (v7 == 100) {
    unint64_t v8 = [(SOSEmergencyCallVoiceLoopManager *)self _loopPhaseFromUtteranceIndex:a4];
  }
  else {
    unint64_t v8 = 0;
  }
  [v9 reportVoiceLoopLoopPhaseChanged:v8];
}

- (void)voiceUtterer:(id)a3 didFinishSpeakingUtterances:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (SOSVoiceUtterer *)a3;
  if ([(SOSEmergencyCallVoiceLoopManager *)self _isSpeaking])
  {
    id v6 = sos_voiceloop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      localVoiceUtterer = self->_localVoiceUtterer;
      BOOL v8 = localVoiceUtterer == v5;
      BOOL v9 = [(SOSVoiceUtterer *)localVoiceUtterer isSpeaking];
      uplinkVoiceUtterer = self->_uplinkVoiceUtterer;
      int v19 = 67109888;
      *(_DWORD *)double v20 = v8;
      *(_WORD *)&v20[4] = 1024;
      *(_DWORD *)&v20[6] = v9;
      __int16 v21 = 1024;
      BOOL v22 = uplinkVoiceUtterer == v5;
      __int16 v23 = 1024;
      BOOL v24 = [(SOSVoiceUtterer *)uplinkVoiceUtterer isSpeaking];
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - !doneSpeaking; NOP until notified after doneSpeaking (isLocalUtterer:%{BOOL}d loca"
        "lUttererSpeaking:%{BOOL}d isRemoteUtterer:%{BOOL}d remoteUttererSpeaking:%{BOOL}d",
        (uint8_t *)&v19,
        0x1Au);
    }
LABEL_10:

    goto LABEL_14;
  }
  unint64_t v11 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
  __int16 v12 = sos_voiceloop_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 == 100)
  {
    if (v13)
    {
      int v19 = 134217984;
      *(void *)double v20 = [(SOSEmergencyCallVoiceLoopManager *)self playingLoopIndex];
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - Finished spoken portion of loop: %lu", (uint8_t *)&v19, 0xCu);
    }

    double v14 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v14 reportVoiceLoopLoopPhaseChanged:10000];

    v15 = sos_voiceloop_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - More loops to come; Creating new timer",
        (uint8_t *)&v19,
        2u);
    }

    v16 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__speakLoopMessage selector:0 userInfo:0 repeats:5.0];
    messageRepeatTimer = self->_messageRepeatTimer;
    self->_messageRepeatTimer = v16;

    v18 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [v18 addTimer:self->_messageRepeatTimer forMode:*MEMORY[0x1E4F1C4B0]];

    id v6 = +[SOSUtilities numberOverrideForDefaultsKey:@"debug.voiceloop.loop.subsequent.volume" defaultValue:&unk_1F0C4AD38];
    [v6 floatValue];
    -[SOSEmergencyCallVoiceLoopManager setLoopVolume:](self, "setLoopVolume:");
    goto LABEL_10;
  }
  if (v13)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "didFinishSpeakingUtterances - !VoiceLoopPlaybackStatePlayingLoop - Done playing", (uint8_t *)&v19, 2u);
  }

  [(SOSEmergencyCallVoiceLoopManager *)self setPlaybackState:200];
LABEL_14:
}

- (void)shiftedLocationIfApplicable:(id)a3 withcompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x2050000000;
  BOOL v8 = (void *)get_MKLocationShifterClass_softClass_0;
  uint64_t v26 = get_MKLocationShifterClass_softClass_0;
  if (!get_MKLocationShifterClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __get_MKLocationShifterClass_block_invoke_0;
    v28 = &unk_1E60640A0;
    v29 = &v23;
    __get_MKLocationShifterClass_block_invoke_0((uint64_t)buf);
    BOOL v8 = (void *)v24[3];
  }
  BOOL v9 = v8;
  _Block_object_dispose(&v23, 8);
  id v10 = objc_alloc_init(v9);
  [(SOSEmergencyCallVoiceLoopManager *)self setLocationShifter:v10];

  unint64_t v11 = sos_voiceloop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = [(SOSEmergencyCallVoiceLoopManager *)self locationShifter];
    BOOL v13 = [(SOSEmergencyCallVoiceLoopManager *)self locationShifter];
    int v14 = [(id)objc_opt_class() isLocationShiftRequiredForLocation:v6];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v14;
    _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "Location shifter: %@ - isLocationShiftRequiredForLocation: %{BOOL}d", buf, 0x12u);
  }
  if (v6
    && ([(SOSEmergencyCallVoiceLoopManager *)self locationShifter],
        (v15 = objc_claimAutoreleasedReturnValue()) != 0)
    && ([(SOSEmergencyCallVoiceLoopManager *)self locationShifter],
        v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = [(id)objc_opt_class() isLocationShiftRequiredForLocation:v6],
        v16,
        v15,
        v17))
  {
    objc_initWeak((id *)buf, self);
    v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke;
    block[3] = &unk_1E6064C30;
    id v21 = v7;
    objc_copyWeak(&v22, (id *)buf);
    id v20 = v6;
    dispatch_async(v18, block);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke(uint64_t a1)
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_2;
  v19[3] = &unk_1E6064968;
  id v21 = v22;
  id v20 = *(id *)(a1 + 40);
  BOOL v3 = (void *)MEMORY[0x1B3EC08A0](v19);
  BOOL v4 = sos_voiceloop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift started", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained locationShifter];
  id v7 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_96;
  v14[3] = &unk_1E6064990;
  id v15 = v7;
  id v8 = v3;
  id v17 = v8;
  BOOL v9 = v2;
  v16 = v9;
  uint64_t v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  [v6 shiftLocation:v15 withCompletionHandler:v14 callbackQueue:v10];

  dispatch_time_t v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v9, v12))
  {
    BOOL v13 = sos_voiceloop_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "SOS location shift timed out.", buf, 2u);
    }

    (*((void (**)(id, void))v8 + 2))(v8, *(void *)(a1 + 32));
  }

  _Block_object_dispose(v22, 8);
}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_3;
  block[3] = &unk_1E6064940;
  long long v6 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v6;
  long long v9 = v6;
  id v8 = v3;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void *__79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_3(void *result)
{
  uint64_t v1 = *(void *)(result[6] + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (void *)(*(uint64_t (**)(void, void))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

void __79__SOSEmergencyCallVoiceLoopManager_shiftedLocationIfApplicable_withcompletion___block_invoke_96(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sos_voiceloop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift completed. Shifted from %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  int v6 = sos_voiceloop_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int16 v8 = 0;
    _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Received location update", v8, 2u);
  }

  uint64_t v7 = [v5 lastObject];

  [(SOSEmergencyCallVoiceLoopManager *)self _updateLocation:v7];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = sos_voiceloop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "locationManager:didFailWithError:%{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (CLLocation)locationToSynthesize
{
  if (+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation" defaultValue:0])
  {
    id v3 = [(SOSEmergencyCallVoiceLoopManager *)self _overrideLocation];
  }
  else
  {
    id v3 = self->_locationToSynthesize;
  }

  return v3;
}

- (void)_updateLocation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    int v14 = sos_voiceloop_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SOSEmergencyCallVoiceLoopManager _updateLocation:](v14);
    }
    goto LABEL_11;
  }
  locationToSynthesize = self->_locationToSynthesize;
  if (locationToSynthesize)
  {
    [(CLLocation *)locationToSynthesize horizontalAccuracy];
    double v7 = v6;
    [v4 horizontalAccuracy];
    if (v7 <= v8 || ([v4 horizontalAccuracy], v9 <= 0.0))
    {
      uint64_t v10 = [v4 timestamp];
      id v11 = [(CLLocation *)self->_locationToSynthesize timestamp];
      [v10 timeIntervalSinceDate:v11];
      double v13 = v12;

      if (v13 <= 5.0)
      {
        int v14 = sos_voiceloop_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[SOSEmergencyCallVoiceLoopManager _updateLocation:]();
        }
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__SOSEmergencyCallVoiceLoopManager__updateLocation___block_invoke;
  v15[3] = &unk_1E6064C58;
  objc_copyWeak(&v16, &location);
  [(SOSEmergencyCallVoiceLoopManager *)self shiftedLocationIfApplicable:v4 withcompletion:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_12:
}

void __52__SOSEmergencyCallVoiceLoopManager__updateLocation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = sos_voiceloop_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1B3A94000, v4, OS_LOG_TYPE_DEFAULT, "Updating location: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setLocationToSynthesize:v3];
}

- (id)_coordinatesStringFromLocation:(id)a3 shortVersion:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = sos_voiceloop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v31 = v6;
    __int16 v32 = 1024;
    BOOL v33 = v4;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "Creating location string from location:%@ shortVersion:%{BOOL}d", buf, 0x12u);
  }

  if (v6)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v8 setNumberStyle:1];
    [v8 setMaximumFractionDigits:4];
    double v9 = [(SOSEmergencyCallVoiceLoopManager *)self voiceLanguage];
    if (v9) {
      [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
    }
    else {
    id v11 = [MEMORY[0x1E4F1CA20] currentLocale];
    }
    [v8 setLocale:v11];
    double v12 = sos_voiceloop_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v11;
      _os_log_impl(&dword_1B3A94000, v12, OS_LOG_TYPE_DEFAULT, "Setting locale %{public}@ for number formatter", buf, 0xCu);
    }

    double v13 = NSNumber;
    [v6 coordinate];
    int v14 = objc_msgSend(v13, "numberWithDouble:");
    id v15 = [v8 stringFromNumber:v14];

    id v16 = NSNumber;
    [v6 coordinate];
    v18 = [v16 numberWithDouble:v17];
    int v19 = [v8 stringFromNumber:v18];

    id v20 = NSNumber;
    [v6 horizontalAccuracy];
    LODWORD(v22) = vcvtpd_s64_f64(v21);
    char v23 = [v20 numberWithInt:v22];
    BOOL v24 = [v8 stringFromNumber:v23];

    if (v4) {
      uint64_t v25 = @"SOS_VOICELOOP_SPEECH_BRIEF_LOCATION";
    }
    else {
      uint64_t v25 = @"SOS_VOICELOOP_SPEECH_LOOP_LOCATION";
    }
    uint64_t v26 = NSString;
    v27 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:v25];
    uint64_t v10 = objc_msgSend(v26, "stringWithFormat:", v27, v15, v19, v24);
  }
  else
  {
    uint64_t v10 = 0;
  }
  v28 = sos_voiceloop_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v31 = v10;
    _os_log_impl(&dword_1B3A94000, v28, OS_LOG_TYPE_DEFAULT, "New location string: %@", buf, 0xCu);
  }

  return v10;
}

- (id)voiceLanguage
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self->_voiceLanguage length])
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SOS"];
    BOOL v4 = [v3 valueForKey:@"SimulateActiveCountry"];
    if (v4)
    {
      id v5 = sos_voiceloop_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138543362;
        int v14 = v4;
        _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "Setting to TEST country code: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      id v6 = v4;
    }
    else
    {
      id v6 = (id)CPPhoneNumberCopyNetworkCountryCode();
    }
    id v7 = v6;
    id v8 = sos_voiceloop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      int v14 = v7;
      _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "Active country code: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    double v9 = [(SOSEmergencyCallVoiceLoopManager *)self _languageToUseInVoiceLoopForCountryCode:v7];
    voiceLanguage = self->_voiceLanguage;
    self->_voiceLanguage = v9;
  }
  id v11 = self->_voiceLanguage;

  return v11;
}

- (id)_languageToUseInVoiceLoopForCountryCode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (__CFString *)a3;
  id v5 = sos_voiceloop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    double v12 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_languageToUseInVoiceLoopForCountryCode:%{public}@", (uint8_t *)&v11, 0xCu);
  }

  if ([(__CFString *)v4 isEqualToString:@"IN"])
  {
    id v6 = sos_voiceloop_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      double v12 = @"en_GB";
      _os_log_impl(&dword_1B3A94000, v6, OS_LOG_TYPE_DEFAULT, "Forcing language to: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    id v7 = @"en_GB";
  }
  else
  {
    id v7 = [(SOSEmergencyCallVoiceLoopManager *)self _preferredVoiceLanguageForCountryCode:v4];
  }
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = @"en_GB";
  }
  double v9 = v8;

  return v9;
}

- (id)_preferredVoiceLanguageForCountryCode:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v3 = sos_voiceloop_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v25;
    _os_log_impl(&dword_1B3A94000, v3, OS_LOG_TYPE_DEFAULT, "_preferredVoiceLanguageForCountryCode:%{public}@", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2050000000;
  BOOL v4 = (void *)getIntlUtilityClass_softClass;
  uint64_t v33 = getIntlUtilityClass_softClass;
  if (!getIntlUtilityClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v37 = __getIntlUtilityClass_block_invoke;
    __int16 v38 = &unk_1E60640A0;
    BOOL v39 = &v30;
    __getIntlUtilityClass_block_invoke((uint64_t)&buf);
    BOOL v4 = (void *)v31[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v30, 8);
  id v6 = [v5 preferredLanguagesForRegion:v25];
  id v7 = sos_voiceloop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "Preferred filtered languages retrieved: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v9 = [v8 localizations];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v11 = 138543362;
    long long v23 = v11;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        int v14 = objc_msgSend(MEMORY[0x1E4F1CA20], "languageFromLanguage:byReplacingRegion:", *(void *)(*((void *)&v26 + 1) + 8 * i), v25, v23);
        uint64_t v15 = sos_voiceloop_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = v23;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1B3A94000, v15, OS_LOG_TYPE_DEFAULT, "Language with region: %{public}@", (uint8_t *)&buf, 0xCu);
        }

        id v16 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v34 = v14;
        double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        v18 = [v16 preferredLocalizationsFromArray:v9 forPreferences:v17];
        int v19 = [v18 firstObject];

        id v20 = [MEMORY[0x1E4F15470] voiceWithLanguage:v19];

        if (v19 && v20)
        {
          double v21 = sos_voiceloop_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = v23;
            *(void *)((char *)&buf + 4) = v19;
            _os_log_impl(&dword_1B3A94000, v21, OS_LOG_TYPE_DEFAULT, "Language selected for speaking: %{public}@", (uint8_t *)&buf, 0xCu);
          }

          goto LABEL_22;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  int v19 = 0;
LABEL_22:

  return v19;
}

- (id)localizedStringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SOSEmergencyCallVoiceLoopManager *)self voiceLanguage];
  id v6 = +[SOSVoiceUtterance localizedStringForKey:v4 forLocalization:v5];

  return v6;
}

- (void)callCenter:(id)a3 reportedCall:(id)a4 receivedDTMFUpdate:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  double v9 = sos_voiceloop_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1B3A94000, v9, OS_LOG_TYPE_DEFAULT, "receivedDTMFUpdate:%{public}@ call:%@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v10 = [v8 digits];
  [(SOSEmergencyCallVoiceLoopManager *)self _handleRemoteDTMFDigits:v10];
}

- (BOOL)callSupportsRemoteControl
{
  uint64_t v3 = [(id)objc_opt_class() _activeCallSupportsDTMF];
  [(SOSVoiceLoopAnalyticsReporter *)self->_loopAnalyticsReporter reportVoiceLoopSupportsDTMF:v3];

  return +[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.call.supportsDTMF" defaultValue:v3];
}

+ (BOOL)_activeCallSupportsDTMF
{
  dispatch_semaphore_t v2 = [(id)objc_opt_class() _activeCallPreferringEmergencyOrSOS];
  char v3 = [v2 supportsDTMFUpdates];

  return v3;
}

+ (id)_activeCallPreferringEmergencyOrSOS
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1CA48]);
  char v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v4 = [v3 currentCalls];
  id v5 = (void *)[v2 initWithArray:v4];

  id v6 = [MEMORY[0x1E4FADA90] sharedInstance];
  id v7 = [v6 callsOnDefaultPairedDevice];
  [v5 addObjectsFromArray:v7];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (v14)
        {
          if ((objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "isEmergency", (void)v17) & 1) != 0
            || [v14 isSOS])
          {
            id v15 = v14;

            id v11 = v15;
            goto LABEL_16;
          }
          if (!v11) {
            id v11 = v14;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_16:

  return v11;
}

- (void)_startListeningForRemoteControl
{
  id v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v3 addDelegate:self queue:MEMORY[0x1E4F14428]];
}

- (void)_stopListeningForRemoteControl
{
  id v3 = [MEMORY[0x1E4FADA90] sharedInstance];
  [v3 removeDelegate:self];
}

+ (id)_validDTMFDigits
{
  if (_validDTMFDigits_onceToken != -1) {
    dispatch_once(&_validDTMFDigits_onceToken, &__block_literal_global_6);
  }
  id v2 = (void *)_validDTMFDigits_validDTMFDigits;

  return v2;
}

uint64_t __52__SOSEmergencyCallVoiceLoopManager__validDTMFDigits__block_invoke()
{
  _validDTMFDigits_validDTMFDigits = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"0123456789#*"];

  return MEMORY[0x1F41817F8]();
}

- (void)_handleRemoteDTMFDigits:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 1)
  {
    char v5 = [v4 characterAtIndex:0];
    id v6 = [(id)objc_opt_class() _validDTMFDigits];
    uint64_t v7 = [v4 rangeOfCharacterFromSet:v6];

    if (!v7)
    {
      [(SOSEmergencyCallVoiceLoopManager *)self _handleDTMFDigit:v5];
      goto LABEL_7;
    }
    id v8 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    uint64_t v9 = v5;
    [v8 reportVoiceLoopDidStartHandlingDTMFDigitReceived:v9];

    uint64_t v10 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v10 reportVoiceLoopDidFinishHandlingDTMFDigitReceived:v9];
  }
  id v11 = sos_voiceloop_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SOSEmergencyCallVoiceLoopManager _handleRemoteDTMFDigits:]();
  }

LABEL_7:
}

- (void)_handleDTMFDigit:(char)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v5 = sos_voiceloop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109376;
    int v11 = v3;
    __int16 v12 = 2048;
    unint64_t v13 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFDigit:%c; current playbackState: %tu",
      (uint8_t *)&v10,
      0x12u);
  }

  id v6 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v6 reportVoiceLoopDidStartHandlingDTMFDigitReceived:v3];

  switch(v3)
  {
    case '*':
      if (+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.voiceloop.demo.allowResume" defaultValue:0])
      {
        [(SOSEmergencyCallVoiceLoopManager *)self _handleDTMFMessageResumeCommand];
        goto LABEL_13;
      }
      break;
    case '1':
      [(SOSEmergencyCallVoiceLoopManager *)self _handleDTMFMessageRepeatCommand];
      goto LABEL_13;
    case '0':
      [(SOSEmergencyCallVoiceLoopManager *)self _handleDTMFMessageStopCommand];
      goto LABEL_13;
  }
  uint64_t v7 = sos_voiceloop_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    int v11 = v3;
    _os_log_impl(&dword_1B3A94000, v7, OS_LOG_TYPE_DEFAULT, "_handleDTMFDigit %c - Unknown command; ignoring",
      (uint8_t *)&v10,
      8u);
  }

  id v8 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v8 reportVoiceLoopDidReceiveCommand:10000];

LABEL_13:
  uint64_t v9 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v9 reportVoiceLoopDidFinishHandlingDTMFDigitReceived:v3];
}

- (void)_handleDTMFMessageStopCommand
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v3 reportVoiceLoopDidReceiveCommand:100];

  uint64_t v10 = 10000;
  unint64_t v4 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
  char v5 = [(SOSEmergencyCallVoiceLoopManager *)self stopConfirmationUtterancesForPlaybackState:v4 remoteVariant:0 verbalizedActionOut:0];
  id v6 = [(SOSEmergencyCallVoiceLoopManager *)self stopConfirmationUtterancesForPlaybackState:v4 remoteVariant:1 verbalizedActionOut:&v10];
  uint64_t v7 = +[SOSVoiceUtteranceVariants utteranceVariantsWithLocalUtterances:v5 remoteUtterances:v6];

  id v8 = sos_voiceloop_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    unint64_t v12 = v4;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1B3A94000, v8, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageStopCommand -- Stopping from playbackState: %tu (action: %tu)", buf, 0x16u);
  }

  uint64_t v9 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v9 reportVoiceLoopWillPerformAction:v10];

  [(SOSEmergencyCallVoiceLoopManager *)self speakResponseUtteranceVariants:v7];
}

- (void)_handleDTMFMessageRepeatCommand
{
  uint64_t v3 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v3 reportVoiceLoopDidReceiveCommand:200];

  unint64_t v4 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
  char v5 = sos_voiceloop_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 100)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageRepeatCommand - Received repeat, but not stopped; ignoring",
        buf,
        2u);
    }

    uint64_t v7 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v7 reportVoiceLoopWillPerformAction:10000];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageRepeatCommand - Repeating", v9, 2u);
    }

    id v8 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v8 reportVoiceLoopWillPerformAction:200];

    [(SOSEmergencyCallVoiceLoopManager *)self _stopMessagePlayback];
    uint64_t v7 = [(SOSEmergencyCallVoiceLoopManager *)self emergencyDescriptorUtteranceVariantsForRepeatVariant:1];
    [(SOSEmergencyCallVoiceLoopManager *)self speakUtteranceVariants:v7 withPlaybackState:400];
  }
}

- (void)_handleDTMFMessageResumeCommand
{
  uint64_t v3 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
  [v3 reportVoiceLoopDidReceiveCommand:5000];

  unint64_t v4 = [(SOSEmergencyCallVoiceLoopManager *)self playbackState];
  char v5 = sos_voiceloop_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 100)
  {
    if (v6)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageResumeCommand - Received resume, but not stopped; ignoring",
        buf,
        2u);
    }

    uint64_t v7 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v7 reportVoiceLoopWillPerformAction:10000];
  }
  else
  {
    if (v6)
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "_handleDTMFMessageResumeCommand - Resuming", v9, 2u);
    }

    id v8 = [(SOSEmergencyCallVoiceLoopManager *)self loopAnalyticsReporter];
    [v8 reportVoiceLoopWillPerformAction:5000];

    [(SOSEmergencyCallVoiceLoopManager *)self _stopMessagePlayback];
    [(SOSEmergencyCallVoiceLoopManager *)self _startLoopPlayback];
  }
}

- (id)stopConfirmationUtterancesForPlaybackState:(unint64_t)a3 remoteVariant:(BOOL)a4 verbalizedActionOut:(unint64_t *)a5
{
  BOOL v6 = a4;
  id v8 = 0;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v9 = 10000;
  if ((uint64_t)a3 > 299)
  {
    if (a3 == 300 || (int v11 = 0, a3 == 400))
    {
      id v8 = 0;
      int v11 = 0;
      unint64_t v9 = 300;
    }
  }
  else
  {
    if (a3 == 100)
    {
      if (a4)
      {
        uint64_t v14 = NSString;
        uint64_t v15 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_LOOP_STOPPED_HOW_TO_REPEAT"];
        id v8 = objc_msgSend(v14, "stringWithFormat:", v15, 49);
      }
      else
      {
        id v8 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_LOOP_STOPPED_REMOTELY"];
      }
      unint64_t v9 = 100;
      if (!v8) {
        goto LABEL_6;
      }
    }
    else
    {
      int v11 = 0;
      if (a3 != 200) {
        goto LABEL_16;
      }
      if (!a4)
      {
        id v8 = 0;
        int v11 = 0;
        unint64_t v9 = 400;
        goto LABEL_16;
      }
      unint64_t v12 = NSString;
      __int16 v13 = [(SOSEmergencyCallVoiceLoopManager *)self localizedStringForKey:@"SOS_VOICELOOP_SPEECH_LOOP_STOPPED_HOW_TO_REPEAT"];
      id v8 = objc_msgSend(v12, "stringWithFormat:", v13, 49);

      unint64_t v9 = 400;
      if (!v8)
      {
LABEL_6:
        int v11 = 0;
        goto LABEL_16;
      }
    }
    id v16 = [SOSVoiceUtterance alloc];
    long long v17 = [(SOSEmergencyCallVoiceLoopManager *)self voiceLanguage];
    int v11 = [(SOSVoiceUtterance *)v16 initWithLocalizedMessageString:v8 voiceLanguage:v17];
  }
LABEL_16:
  long long v18 = sos_voiceloop_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218754;
    unint64_t v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v6;
    __int16 v26 = 2114;
    long long v27 = v11;
    __int16 v28 = 2048;
    unint64_t v29 = v9;
    _os_log_impl(&dword_1B3A94000, v18, OS_LOG_TYPE_INFO, "stopConfirmationUtterancesForPlaybackState:%tu remoteVariant:%{BOOL}d => %{public}@ (action: %tu)", buf, 0x26u);
  }

  if (a5) {
    *a5 = v9;
  }
  if (v11)
  {
    double v21 = v11;
    long long v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

- (void)speakResponseUtteranceVariants:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = sos_voiceloop_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1B3A94000, v5, OS_LOG_TYPE_DEFAULT, "speakResponseUtteranceVariants:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(SOSEmergencyCallVoiceLoopManager *)self _stopMessagePlayback];
  [(SOSEmergencyCallVoiceLoopManager *)self speakUtteranceVariants:v4 withPlaybackState:300];
}

- (id)_overrideLocation
{
  id v2 = +[SOSUtilities numberOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation.lat" defaultValue:&unk_1F0C4ABD0];
  [v2 doubleValue];
  double v4 = v3;

  char v5 = +[SOSUtilities numberOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation.long" defaultValue:&unk_1F0C4ABD0];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = +[SOSUtilities numberOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation.elev" defaultValue:&unk_1F0C4ABD0];
  [v8 doubleValue];
  double v10 = v9;

  int v11 = +[SOSUtilities numberOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation.accuracy" defaultValue:&unk_1F0C4ABE8];
  [v11 doubleValue];
  double v13 = v12;

  if (v10 == 0.0 && v7 == 0.0 && v4 == 0.0) {
    id v16 = @"ApplePark";
  }
  else {
    id v16 = &stru_1F0C40F10;
  }
  long long v17 = +[SOSUtilities stringOverrideForDefaultsKey:@"debug.voiceloop.demo.fakeLocation.poi" defaultValue:v16];
  if ([v17 isEqualToIgnoringCase:@"ApplePark"])
  {
    double v7 = -122.01;
    double v18 = 37.3353;
  }
  else
  {
    double v18 = v4;
  }
  int v19 = [v17 isEqualToIgnoringCase:@"NENA2024"];
  if (v19) {
    double v20 = -81.52789;
  }
  else {
    double v20 = v7;
  }
  if (v19) {
    double v21 = 28.34244;
  }
  else {
    double v21 = v18;
  }
  if (v21 == 0.0 && v20 == 0.0 && v10 == 0.0)
  {
    uint64_t v22 = 0;
  }
  else
  {
    if (v19) {
      double v13 = 30.0;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    __int16 v24 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v22 = objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v24, v21, v20, v10, v13, v13);
  }

  return v22;
}

- (SOSEmergencyCallVoiceLoopManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SOSEmergencyCallVoiceLoopManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_int64_t reason = a3;
}

- (void)setUplinkVoiceUtterer:(id)a3
{
}

- (void)setLocalVoiceUtterer:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NSTimer)messageRepeatTimer
{
  return self->_messageRepeatTimer;
}

- (void)setMessageRepeatTimer:(id)a3
{
}

- (float)loopVolume
{
  return self->_loopVolume;
}

- (void)setLoopVolume:(float)a3
{
  self->_loopVolume = a3;
}

- (_MKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
}

- (void)setLocationToSynthesize:(id)a3
{
}

- (unint64_t)playingLoopIndex
{
  return self->_playingLoopIndex;
}

- (unint64_t)playbackState
{
  return self->_playbackState;
}

- (SOSVoiceLoopAnalyticsReporter)loopAnalyticsReporter
{
  return self->_loopAnalyticsReporter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loopAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_locationToSynthesize, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_messageRepeatTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_localVoiceUtterer, 0);
  objc_storeStrong((id *)&self->_uplinkVoiceUtterer, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_voiceLanguage, 0);
}

- (void)speakUtteranceVariants:withPlaybackState:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "speakUtteranceVariants - nothing to speak for utteranceVariants:%@", v2, v3, v4, v5, v6);
}

- (void)_emergencyDescriptorUtterancesForRemoteVariant:repeatVariant:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Location but no locationString; location: %@", v2, v3, v4, v5, v6);
}

- (void)_loopPhaseFromUtteranceIndex:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "_loopPhaseFromUtteranceIndex - Unexpected index:%tu", v2, v3, v4, v5, v6);
}

+ (void)_messageKeyForReason:shortVersion:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "_messageKeyForReason - Unexpected reason:%ld", v2, v3, v4, v5, v6);
}

- (void)_updateLocation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B3A94000, log, OS_LOG_TYPE_ERROR, "[SOSEmergencyCallVoiceLoopManager _updateLocation] was called with an empty location", v1, 2u);
}

- (void)_updateLocation:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_1B3A94000, v0, OS_LOG_TYPE_DEBUG, "Ignoring location: %@", v1, 0xCu);
}

- (void)_handleRemoteDTMFDigits:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1B3A94000, v0, v1, "Unexpected dtmfUpdateDigits:%{public}@", v2, v3, v4, v5, v6);
}

@end