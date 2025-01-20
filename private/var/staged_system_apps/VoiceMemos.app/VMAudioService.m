@interface VMAudioService
+ (NSDictionary)compressedAudioSettings;
+ (NSDictionary)losslessAudioSettings;
+ (VMAudioService)sharedInstance;
+ (void)playStartRecordingSoundEffect:(id)a3;
- (BOOL)__activateAudioSessionOnQueue:(id)a3 recording:(BOOL)a4 overdubbing:(BOOL)a5 error:(id *)a6;
- (BOOL)__refreshRecording:(id)a3 composition:(id)a4 controller:(id)a5;
- (BOOL)_disableStereo:(id *)a3;
- (BOOL)_editRecording:(id)a3 editBlock:(id)a4 controller:(id)a5 error:(id *)a6;
- (BOOL)_enableStereo:(id *)a3;
- (BOOL)_finalizeRecording:(id)a3 controller:(id)a4 finalizationStrategy:(int)a5;
- (BOOL)_mergeRecording:(id)a3 atTime:(double)a4 controller:(id)a5 error:(id *)a6;
- (BOOL)_popFileVersion:(id)a3 error:(id *)a4;
- (BOOL)_startRecordingWithController:(id)a3 error:(id *)a4;
- (BOOL)_switchEngine:(id)a3 audioSettings:(id)a4 error:(id *)a5;
- (BOOL)_updateStereoOrientationWithOverdubbing:(BOOL)a3 error:(id *)a4;
- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3;
- (BOOL)attemptSingleFragmentFinalization:(id)a3 recording:(id)a4 controller:(id)a5;
- (BOOL)configureInputSampleRate:(double)a3 outputSampleRate:(double)a4 error:(id *)a5;
- (BOOL)cutRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6;
- (BOOL)finalizeRecording:(id)a3 controller:(id)a4 saveAsNew:(BOOL)a5;
- (BOOL)isPlaying;
- (BOOL)isRecording;
- (BOOL)isRecordingEnabled:(id *)a3;
- (BOOL)pausePlaying:(id)a3;
- (BOOL)refreshRecording:(id)a3 controller:(id)a4;
- (BOOL)sampleRecordingTime:(double *)a3;
- (BOOL)setSilenceRemoverEnabled:(BOOL)a3 controller:(id)a4;
- (BOOL)setTargetRate:(float)a3 controller:(id)a4;
- (BOOL)setTime:(double)a3 controller:(id)a4;
- (BOOL)shouldWaitForAccessTokenBeforeStartingRecording:(id)a3;
- (BOOL)stopPlaying:(id)a3;
- (BOOL)stopRecording:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)stopRecording:(id)a3 error:(id *)a4;
- (BOOL)stopRecordingWithController:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)stopRecordingWithController:(id)a3 error:(id *)a4;
- (BOOL)trimRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6;
- (NSError)recordingError;
- (VMAudioRecorder)activeAudioRecorder;
- (VMAudioService)init;
- (VMRecordingController)recordingController;
- (double)recordingDuration;
- (id)_assetForRecording:(id)a3 error:(id *)a4;
- (id)_closestAllowedSampleRate:(double)a3 allowedSampleRates:(id)a4;
- (id)_createAndConfigurePlayer;
- (id)_dataSourceSupportingStereo;
- (id)_fetchRecording:(id)a3 recordingController:(id)a4;
- (id)_newRecordingEngine;
- (id)_observeUserDefaultsForAudioSettingsChanges;
- (id)_pushFileVersion:(id)a3 error:(id *)a4;
- (id)_recordingSettingsForAudioEngine:(id)a3 error:(id *)a4;
- (id)_saveAsNew:(id)a3 withAssetBackup:(id)a4 editedComposition:(id)a5 replacingOriginal:(BOOL)a6 error:(id *)a7;
- (id)audioEngineOutputNodeAccessQueue;
- (id)deviceSampleRates:(id *)a3;
- (id)fetchRecording:(id)a3;
- (id)newRecorderWithTitleBase:(id)a3;
- (id)playerForRecordingID:(id)a3;
- (id)recorderForRecordingID:(id)a3;
- (int)editingStatus;
- (int)mode;
- (void)__eraseSecondLayerInComposition:(id)a3 outputFragment:(id)a4 audioSettings:(id)a5 completionBlock:(id)a6;
- (void)_activateAudioSessionForPlaybackWithCompletion:(id)a3;
- (void)_activateAudioSessionForRecording:(BOOL)a3 overdubbing:(BOOL)a4 completion:(id)a5;
- (void)_activateAudioSessionForRecordingWithController:(id)a3 completion:(id)a4;
- (void)_cancelFileTranscription;
- (void)_configureAudioSessionForBTSmartRoutingConsideration:(id)a3 isRecording:(BOOL)a4;
- (void)_configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:(id)a3 isRecording:(BOOL)a4;
- (void)_configureAudioSessionStereoInput:(id)a3 isRecording:(BOOL)a4 isOverdubbing:(BOOL)a5;
- (void)_configureAudioSettings;
- (void)_configureAudioSettingsIfNeeded;
- (void)_deactivateAudioSessionAsync:(BOOL)a3;
- (void)_duplicateRecordingWithID:(id)a3;
- (void)_handleAudioSessionNotification:(id)a3;
- (void)_handleSecondaryQueueAudioSessionNotification:(id)a3;
- (void)_mixDownEditedRecording:(id)a3 completion:(id)a4;
- (void)_playStartRecordingSoundEffectThenStartRecording:(id)a3 controller:(id)a4;
- (void)_prepareWithRecordingEngine:(id)a3 controller:(id)a4 assetWriter:(id)a5;
- (void)_registerAudioSessionNotificationsIfNeeded;
- (void)_restoreOriginalRecording:(id)a3 andComposition:(id)a4 forFailedRecording:(id)a5;
- (void)_schedulePlayback:(id)a3;
- (void)_shutdownEngine;
- (void)_shutdownPlaybackEngine;
- (void)_shutdownRecordingEngine;
- (void)_startPlaybackAtRate:(float)a3 immediately:(BOOL)a4;
- (void)_updateIsAudioSessionActiveForInterruption:(unint64_t)a3;
- (void)_updateNewVMAudioPlayer:(id)a3 withPropertiesForRecordingID:(id)a4;
- (void)_updateRecordingWithUniqueID:(id)a3 updateBlock:(id)a4;
- (void)deactivateAudioSession;
- (void)interfaceOrientationDidUpdate:(int64_t)a3;
- (void)isPlayingDidChange:(BOOL)a3;
- (void)prepareService;
- (void)replaceRecording:(id)a3 atTime:(double)a4 controller:(id)a5;
- (void)setEditingStatus:(int)a3;
- (void)setMode:(int)a3;
- (void)setRecordingError:(id)a3;
- (void)simulateRecordingError;
- (void)startPlaying:(id)a3;
- (void)startRecordingWithController:(id)a3;
- (void)vmPlayerError:(id)a3;
@end

@implementation VMAudioService

+ (VMAudioService)sharedInstance
{
  if (qword_10026A830 != -1) {
    dispatch_once(&qword_10026A830, &stru_1002226B8);
  }
  v2 = (void *)qword_10026A838;

  return (VMAudioService *)v2;
}

- (id)_createAndConfigurePlayer
{
  v3 = objc_opt_new();
  [v3 setDelegate:self];

  return v3;
}

- (void)_registerAudioSessionNotificationsIfNeeded
{
  if (!self->_audioSessionNotificationsAreRegistered)
  {
    self->_audioSessionNotificationsAreRegistered = 1;
    id v4 = +[NSNotificationCenter defaultCenter];
    v3 = +[AVAudioSession sharedInstance];
    [v4 addObserver:self selector:"_handleAudioSessionNotification:" name:AVAudioSessionInterruptionNotification object:v3];
    [v4 addObserver:self selector:"_handleAudioSessionNotification:" name:AVAudioSessionMediaServicesWereResetNotification object:v3];
    [v4 addObserver:self selector:"_handleAudioSessionNotification:" name:AVAudioSessionSilenceSecondaryAudioHintNotification object:v3];
    [v4 addObserver:self selector:"_handleSecondaryQueueAudioSessionNotification:" name:AVAudioSessionRouteChangeNotification object:v3];
  }
}

- (id)_observeUserDefaultsForAudioSettingsChanges
{
  v3 = +[NSUserDefaults sharedSettingsUserDefaults];
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v4 = RCObserveChangesToKeyPath();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v4;
}

- (BOOL)isRecording
{
  if ([(VMAudioService *)self mode] != 2) {
    return 0;
  }
  recordingEngine = self->_recordingEngine;

  return [(VMRecordingEngine *)recordingEngine isRunning];
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)isPlaying
{
  return [(VMPlayer *)self->_player playing];
}

- (VMAudioService)init
{
  v23.receiver = self;
  v23.super_class = (Class)VMAudioService;
  v2 = [(VMAudioService *)&v23 init];
  v3 = v2;
  if (v2)
  {
    v2->_mode = 0;
    uint64_t v4 = +[RCApplicationModel sharedApplicationModel];
    recordings = v3->_recordings;
    v3->_recordings = (RCApplicationModel *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.VoiceMemos.CallCenterQueue", 0);
    callCenterQueue = v3->_callCenterQueue;
    v3->_callCenterQueue = (OS_dispatch_queue *)v6;

    v8 = v3->_callCenterQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032264;
    block[3] = &unk_100221278;
    v9 = v3;
    v22 = v9;
    dispatch_async(v8, block);
    uint64_t v10 = [(VMAudioService *)v9 _createAndConfigurePlayer];
    player = v9->_player;
    v9->_player = (_TtC10VoiceMemos8VMPlayer *)v10;

    uint64_t v12 = objc_opt_new();
    regulatoryLogger = v9->_regulatoryLogger;
    v9->_regulatoryLogger = (RCRegulatoryLogger *)v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.VoiceMemos.AudioServiceQueue", v14);
    audioSessionQueue = v9->_audioSessionQueue;
    v9->_audioSessionQueue = (OS_dispatch_queue *)v15;

    id v17 = [(VMAudioService *)v9 _observeUserDefaultsForAudioSettingsChanges];
    v18 = objc_alloc_init(_TtC10VoiceMemos25StereoOrientationProvider);
    stereoOrientationProvider = v9->_stereoOrientationProvider;
    v9->_stereoOrientationProvider = (_TtP10VoiceMemos27RCStereoOrientationProvider_ *)v18;
  }
  return v3;
}

- (void)_configureAudioSettings
{
  v3 = +[NSUserDefaults sharedSettingsUserDefaults];
  if (objc_msgSend(v3, "rc_audioQuality")) {
    +[VMAudioService losslessAudioSettings];
  }
  else {
  uint64_t v4 = +[VMAudioService compressedAudioSettings];
  }
  audioSettings = self->_audioSettings;
  self->_audioSettings = v4;

  if (RCOverdubRecordingIsEnabled())
  {
    dispatch_queue_t v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[VMAudioService _configureAudioSettings]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s -- This device supports overdub recording.", buf, 0xCu);
    }
  }
  v7 = [(NSDictionary *)self->_audioSettings objectForKeyedSubscript:AVFormatIDKey];
  unsigned int v8 = [v7 intValue];

  *(_DWORD *)buf = v8;
  if (v8 == 1633772320)
  {
    UInt32 outPropertyDataSize = 0;
    if (!AudioFormatGetPropertyInfo(0x61657372u, 4u, buf, &outPropertyDataSize))
    {
      unint64_t v9 = outPropertyDataSize;
      unint64_t v10 = (unint64_t)outPropertyDataSize >> 4;
      v11 = (double *)(&v18 - 2 * (outPropertyDataSize >> 4));
      if (!AudioFormatGetProperty(0x61657372u, 4u, buf, &outPropertyDataSize, v11))
      {
        uint64_t v12 = (NSArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:v9 >> 4];
        if (v9 >= 0x10)
        {
          if (v10 <= 1) {
            uint64_t v13 = 1;
          }
          else {
            uint64_t v13 = v10;
          }
          do
          {
            double v14 = *v11;
            v11 += 2;
            dispatch_queue_t v15 = +[NSNumber numberWithDouble:v14];
            [(NSArray *)v12 addObject:v15];

            --v13;
          }
          while (v13);
        }
        allowedSampleRates = self->_allowedSampleRates;
        self->_allowedSampleRates = v12;
      }
    }
  }
  else
  {
    id v17 = self->_allowedSampleRates;
    self->_allowedSampleRates = 0;
  }
}

- (void)prepareService
{
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000321EC;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_async(audioSessionQueue, block);
}

- (void)_configureAudioSettingsIfNeeded
{
  if (!self->_audioSettings) {
    [(VMAudioService *)self _configureAudioSettings];
  }
}

+ (NSDictionary)compressedAudioSettings
{
  v4[0] = AVFormatIDKey;
  v4[1] = AVEncoderAudioQualityKey;
  v5[0] = &off_10022D700;
  v5[1] = &off_10022D718;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return (NSDictionary *)v2;
}

+ (NSDictionary)losslessAudioSettings
{
  v4[0] = AVFormatIDKey;
  v4[1] = AVEncoderBitDepthHintKey;
  v5[0] = &off_10022D6D0;
  v5[1] = &off_10022D6E8;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return (NSDictionary *)v2;
}

- (void)vmPlayerError:(id)a3
{
  id v4 = a3;
  v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10016CD44();
  }

  dispatch_queue_t v6 = [(VMPlayer *)self->_player currentItem];
  v7 = [v6 controller];
  unsigned int v8 = v7;
  if (v7)
  {
    [v7 setPlaybackError:v4];
    [(VMAudioService *)self stopPlaying:v8];
  }
}

- (BOOL)activateAudioSessionForPlaybackAndReturnError:(id *)a3
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C4F8;
  block[3] = &unk_1002226E0;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(audioSessionQueue, block);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)audioEngineOutputNodeAccessQueue
{
  return self->_audioSessionQueue;
}

- (void)isPlayingDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(VMPlayer *)self->_player currentItem];
  char v4 = [v7 controller];
  v5 = v4;
  if (v3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 4;
  }
  [v4 setCurrentState:v6];
}

- (id)_newRecordingEngine
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_10008C6C0;
  char v10 = sub_10008C6D0;
  id v11 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008C6D8;
  block[3] = &unk_100222708;
  void block[4] = &v6;
  dispatch_sync(audioSessionQueue, block);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_updateIsAudioSessionActiveForInterruption:(unint64_t)a3
{
  self->_isAudioSessionActive = a3 != 1;
}

- (void)_activateAudioSessionForPlaybackWithCompletion:(id)a3
{
}

- (void)_activateAudioSessionForRecordingWithController:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(VMAudioService *)self _shutdownPlaybackEngine];
  uint64_t v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10008C6C0;
  v26[4] = sub_10008C6D0;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  char v25 = 0;
  id v9 = [v6 overdubbing];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10008CA74;
  v20[3] = &unk_100222730;
  v22 = v24;
  objc_super v23 = v26;
  char v10 = v8;
  v21 = v10;
  [(VMAudioService *)self _activateAudioSessionForRecording:1 overdubbing:v9 completion:v20];
  dispatch_group_enter(v10);
  id v11 = +[RCRecordingTranscriptionService sharedInstance];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10008CAE4;
  v18[3] = &unk_100221278;
  uint64_t v12 = v10;
  v19 = v12;
  [v11 cancelFileTranscriptionWithCompletionHandler:v18];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CAEC;
  block[3] = &unk_100222758;
  id v15 = v7;
  v16 = v24;
  id v17 = v26;
  id v13 = v7;
  dispatch_group_notify(v12, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
}

- (void)_activateAudioSessionForRecording:(BOOL)a3 overdubbing:(BOOL)a4 completion:(id)a5
{
  id v8 = a5;
  audioSessionQueue = self->_audioSessionQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008CBC4;
  block[3] = &unk_1002227A8;
  BOOL v13 = a3;
  BOOL v14 = a4;
  void block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(audioSessionQueue, block);
}

- (BOOL)__activateAudioSessionOnQueue:(id)a3 recording:(BOOL)a4 overdubbing:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  [(VMAudioService *)self _registerAudioSessionNotificationsIfNeeded];
  long long v22 = 0u;
  long long v23 = 0u;
  RCGetAudioConfiguration();
  id v11 = [v10 category];
  if (v11) {
    goto LABEL_7;
  }
  id v12 = [v10 mode];
  if (v12 != *((void **)&v22 + 1) || [v10 routeSharingPolicy] != *((id *)&v23 + 1))
  {

LABEL_7:
LABEL_8:
    if (self->_isAudioSessionActive)
    {
      self->_isAudioSessionActive = 0;
      [v10 setActive:0 error:0];
    }
    id v14 = (id)v22;
    id v19 = v14;
    id v15 = *((id *)&v22 + 1);
    id v20 = v15;
    long long v21 = v23;
    if (v10)
    {
      if (objc_msgSend(v10, "rc_configureSession:error:", &v19, a6))
      {
        -[VMAudioService _configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:isRecording:](self, "_configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:isRecording:", v10, v8, v19, v20, v21);
        [(VMAudioService *)self _configureAudioSessionForBTSmartRoutingConsideration:v10 isRecording:v8];
        [(VMAudioService *)self _configureAudioSessionStereoInput:v10 isRecording:v8 isOverdubbing:v7];
        goto LABEL_13;
      }
    }
    else
    {
      id v17 = v15;
    }
    unsigned __int8 v16 = 0;
    goto LABEL_17;
  }
  id v13 = [v10 categoryOptions];

  if (v13 != (id)v23) {
    goto LABEL_8;
  }
LABEL_13:
  if (self->_isAudioSessionActive)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    unsigned __int8 v16 = [v10 setActive:1 withOptions:0 error:a6];
    self->_isAudioSessionActive = v16;
  }
LABEL_17:

  return v16;
}

- (void)_configureAudioSessionPrefersNoInterruptionsFromSystemAlerts:(id)a3 isRecording:(BOOL)a4
{
  id v7 = 0;
  unsigned __int8 v4 = [a3 setPrefersNoInterruptionsFromSystemAlerts:a4 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10016CDB8();
    }
  }
}

- (void)_configureAudioSessionForBTSmartRoutingConsideration:(id)a3 isRecording:(BOOL)a4
{
  id v7 = 0;
  unsigned __int8 v4 = [a3 setEligibleForBTSmartRoutingConsideration:!a4 error:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10016CE2C();
    }
  }
}

- (void)_configureAudioSessionStereoInput:(id)a3 isRecording:(BOOL)a4 isOverdubbing:(BOOL)a5
{
  if (a4)
  {
    id v8 = 0;
    unsigned __int8 v5 = [(VMAudioService *)self _updateStereoOrientationWithOverdubbing:a5 error:&v8];
    id v6 = v8;
    if ((v5 & 1) == 0)
    {
      id v7 = OSLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10016CEA0();
      }
    }
  }
}

- (BOOL)_updateStereoOrientationWithOverdubbing:(BOOL)a3 error:(id *)a4
{
  if (!RCStereoRecordingIsAvailable()) {
    return 1;
  }
  if (a3
    || (+[NSUserDefaults sharedSettingsUserDefaults],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = objc_msgSend(v7, "rc_useStereoRecording"),
        v7,
        !v8))
  {
    return [(VMAudioService *)self _disableStereo:a4];
  }
  else
  {
    return [(VMAudioService *)self _enableStereo:a4];
  }
}

- (id)_dataSourceSupportingStereo
{
  id v3 = +[AVAudioSession sharedInstance];
  unsigned __int8 v4 = [v3 availableInputs];
  unsigned __int8 v5 = [v4 na_firstObjectPassingTest:&stru_1002227E8];

  id v6 = [v5 dataSources];
  id v7 = [v6 na_filter:&stru_100222828];

  [(RCStereoOrientationProvider *)self->_stereoOrientationProvider preferredDataSourceOrientation];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10008D304;
  v14[3] = &unk_100222850;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v15;
  id v9 = [v7 na_firstObjectPassingTest:v14];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [v7 firstObject];
  }
  id v12 = v11;

  return v12;
}

- (BOOL)_disableStereo:(id *)a3
{
  unsigned __int8 v4 = [(VMAudioService *)self _dataSourceSupportingStereo];
  unsigned __int8 v5 = v4;
  if (v4) {
    unsigned __int8 v6 = [v4 setPreferredPolarPattern:0 error:a3];
  }
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (BOOL)_enableStereo:(id *)a3
{
  unsigned __int8 v5 = [(VMAudioService *)self _dataSourceSupportingStereo];
  if (!v5)
  {
    if (!a3) {
      goto LABEL_7;
    }
    uint64_t v8 = RCVoiceMemosErrorDomain;
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    CFStringRef v12 = @"Built in mic does not support stereo";
    id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    *a3 = +[NSError errorWithDomain:v8 code:1 userInfo:v9];

LABEL_6:
    LOBYTE(a3) = 0;
    goto LABEL_7;
  }
  id v6 = [(RCStereoOrientationProvider *)self->_stereoOrientationProvider preferredInputOrientationFor:v5];
  if (![v5 setPreferredPolarPattern:AVAudioSessionPolarPatternStereo error:a3]) {
    goto LABEL_6;
  }
  id v7 = +[AVAudioSession sharedInstance];
  LOBYTE(a3) = [v7 setPreferredInputOrientation:v6 error:a3];

LABEL_7:
  return (char)a3;
}

- (void)_deactivateAudioSessionAsync:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = [(VMPlayer *)self->_player currentItem];
  id v6 = [v5 controller];
  id v7 = v6;
  if (v6 && [v6 currentState] == 3) {
    [(VMAudioService *)self pausePlaying:v7];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008D5D8;
  v10[3] = &unk_100221278;
  v10[4] = self;
  uint64_t v8 = objc_retainBlock(v10);
  audioSessionQueue = self->_audioSessionQueue;
  if (v3) {
    dispatch_async(audioSessionQueue, v8);
  }
  else {
    dispatch_sync(audioSessionQueue, v8);
  }
}

- (void)deactivateAudioSession
{
}

- (void)_handleSecondaryQueueAudioSessionNotification:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  void v4[2] = sub_10008D6E4;
  v4[3] = &unk_100221C38;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_handleAudioSessionNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 name];
  id v6 = [v4 userInfo];
  id v7 = OSLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10016D0DC();
  }

  if ([v5 isEqualToString:AVAudioSessionRouteChangeNotification])
  {
    uint64_t v8 = [v4 object];
    id v9 = [v6 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
    id v10 = [v9 integerValue];

    NSErrorUserInfoKey v11 = OSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10016CF14((uint64_t)v10, v8, v11);
    }

    if ([(VMAudioService *)self mode] == 2
      && [(VMRecordingEngine *)self->_recordingEngine isRunning])
    {
      if ((unint64_t)v10 > 2)
      {
LABEL_46:

        goto LABEL_47;
      }
      CFStringRef v12 = [(VMRecordingEngine *)self->_recordingEngine controller];
      if (v12) {
        [(VMAudioService *)self stopRecordingWithController:v12 error:0];
      }
    }
    if (v10 != (id)2 || ![(VMPlayer *)self->_player playing]) {
      goto LABEL_46;
    }
    id v13 = [(VMPlayer *)self->_player currentItem];
    id v14 = [v13 controller];
    [(VMAudioService *)self pausePlaying:v14];
LABEL_15:

LABEL_45:
    goto LABEL_46;
  }
  if ([v5 isEqualToString:AVAudioSessionInterruptionNotification])
  {
    id v15 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
    id v16 = [v15 integerValue];

    [(VMAudioService *)self _updateIsAudioSessionActiveForInterruption:v16];
    if (v16 == (id)1)
    {
      unsigned int v17 = [(VMAudioService *)self mode];
      uint64_t v18 = [(VMPlayer *)self->_player currentItem];
      uint64_t v8 = v18;
      if (v18)
      {
        id v19 = [(VMAudioEngine *)v18 controller];
        self->_lastInterruptionStoppedPlayer = [v19 targetState] == 3;
      }
      else
      {
        self->_lastInterruptionStoppedPlayer = 0;
      }
      if ([(VMPlayer *)self->_player playing])
      {
        v28 = [(VMPlayer *)self->_player currentItem];
        v29 = [v28 controller];
        [(VMAudioService *)self pausePlaying:v29];
      }
      if (v17 != 2) {
        goto LABEL_46;
      }
      id v13 = [(VMRecordingEngine *)self->_recordingEngine controller];
      if (v13)
      {
        id v34 = 0;
        unsigned __int8 v30 = [(VMAudioService *)self stopRecordingWithController:v13 error:&v34];
        id v31 = v34;
        if ((v30 & 1) == 0)
        {
          v32 = OSLogForCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_10016CFF4();
          }
        }
      }
      goto LABEL_45;
    }
    v26 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionOptionKey];
    unsigned __int8 v27 = [v26 integerValue];

    if ((v27 & 1) != 0 && self->_lastInterruptionStoppedPlayer)
    {
      uint64_t v8 = [(VMPlayer *)self->_player currentItem];
      id v13 = [(VMAudioEngine *)v8 controller];
      [v13 targetRate];
      -[VMAudioService _startPlaybackAtRate:immediately:](self, "_startPlaybackAtRate:immediately:", 0);
      goto LABEL_45;
    }
  }
  else if ([v5 isEqualToString:AVAudioSessionMediaServicesWereResetNotification])
  {
    [(VMAudioService *)self _deactivateAudioSessionAsync:0];
    uint64_t v8 = self->_currentEngine;
    if (v8 && [(VMAudioService *)self mode] == 1)
    {
      id v33 = 0;
      unsigned __int8 v20 = [(VMAudioEngine *)v8 startAndReturnError:&v33];
      id v21 = v33;
      if ((v20 & 1) == 0)
      {
        long long v22 = OSLogForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_10016D068();
        }
      }
    }
    player = self->_player;
    if (!player) {
      goto LABEL_46;
    }
    id v13 = [(VMPlayer *)player currentItem];
    v24 = [(VMAudioService *)self _createAndConfigurePlayer];
    char v25 = self->_player;
    self->_player = v24;

    if (!v13 || [(VMAudioService *)self mode] != 1) {
      goto LABEL_45;
    }
    id v14 = [v13 controller];
    [v14 setPlayerItem:0];
    [(VMAudioService *)self startPlaying:v14];
    goto LABEL_15;
  }
LABEL_47:
}

- (BOOL)_switchEngine:(id)a3 audioSettings:(id)a4 error:(id *)a5
{
  id v9 = (VMAudioEngine *)a3;
  id v10 = a4;
  NSErrorUserInfoKey v11 = self->_currentEngine;
  if (v11 == v9)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    CFStringRef v12 = v11;
    id v13 = +[NSNotificationCenter defaultCenter];
    if (v12)
    {
      [(VMAudioEngine *)v12 stop];
      [(VMAudioEngine *)v12 shutdown];
      [v13 removeObserver:self name:AVAudioEngineConfigurationChangeNotification object:v12];
    }
    objc_storeStrong((id *)&self->_currentEngine, a3);
    id v14 = v9;

    unsigned int v15 = [(VMAudioEngine *)v14 configureWithAudioSettings:v10 error:a5];
    if (v15) {
      [v13 addObserver:v14 selector:"handleConfigurationChangeNotification:" name:AVAudioEngineConfigurationChangeNotification object:v14];
    }
  }
  return v15;
}

- (void)_shutdownEngine
{
  id v5 = self->_currentEngine;
  if (v5)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:v5 name:AVAudioEngineConfigurationChangeNotification object:v5];
    [(VMAudioEngine *)v5 stop];
    [(VMAudioEngine *)v5 shutdown];
  }
  currentEngine = self->_currentEngine;
  self->_currentEngine = 0;
}

- (void)_schedulePlayback:(id)a3
{
  id v4 = a3;
  id v5 = [v4 playerItem];
  if (v5)
  {
    id v6 = self->_player;
    recordingEnhancedObservance = self->_recordingEnhancedObservance;
    if (recordingEnhancedObservance)
    {
      [(RCKeyPathObservance *)recordingEnhancedObservance remove];
      uint64_t v8 = self->_recordingEnhancedObservance;
      self->_recordingEnhancedObservance = 0;
    }
    recordings = self->_recordings;
    id v10 = [v4 recordingID];
    NSErrorUserInfoKey v11 = [(RCApplicationModel *)recordings recordingWithUniqueID:v10];

    if (v11)
    {
      CFStringRef v12 = +[NSString stringWithUTF8String:"enhanced"];
      long long v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      char v25 = sub_10008DF44;
      v26 = &unk_100222878;
      unsigned __int8 v27 = v6;
      id v28 = v11;
      RCObserveChangesToKeyPath();
      id v13 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue();
      id v14 = self->_recordingEnhancedObservance;
      self->_recordingEnhancedObservance = v13;
    }
    [v4 playableRange];
    [v5 setPlayableRangeEndTime:v15];
    [v4 setCurrentState:2];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10008DF84;
    v18[3] = &unk_1002228C8;
    void v18[4] = self;
    id v19 = v4;
    unsigned __int8 v20 = v6;
    id v21 = v5;
    id v22 = v11;
    id v16 = v11;
    unsigned int v17 = v6;
    [(VMPlayer *)v17 prepareItem:v21 withCompletionHandler:v18];
  }
}

- (void)_shutdownPlaybackEngine
{
  player = self->_player;
  if (player)
  {
    id v4 = [(VMPlayer *)player currentItem];
    id v8 = v4;
    if (v4)
    {
      id v5 = [v4 controller];
      [(VMAudioService *)self stopPlaying:v5];

      id v4 = v8;
    }
    preparingToPlayController = self->_preparingToPlayController;
    if (preparingToPlayController)
    {
      self->_preparingToPlayController = 0;
      id v7 = preparingToPlayController;

      [(VMAudioService *)self stopPlaying:v7];
      id v4 = v8;
    }
  }
}

- (id)playerForRecordingID:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setRecordingID:v4];
  [v5 setService:self];
  [v5 setTargetState:4];
  [(VMAudioService *)self _updateNewVMAudioPlayer:v5 withPropertiesForRecordingID:v4];

  [(VMAudioService *)self startPlaying:v5];

  return v5;
}

- (void)_updateNewVMAudioPlayer:(id)a3 withPropertiesForRecordingID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[RCApplicationModel sharedApplicationModel];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008E440;
  v10[3] = &unk_100221CB0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v6;
  id v13 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = v11;
  [v9 performBlockAndWait:v10];
}

- (id)newRecorderWithTitleBase:(id)a3
{
  id v4 = a3;
  id v5 = [[VMAudioRecorderImp alloc] _initWithRecordingID:0 model:self->_recordings];
  [v5 setIsNewRecording:1];
  [v5 setService:self];
  [v5 setTitleBase:v4];

  return v5;
}

- (id)recorderForRecordingID:(id)a3
{
  id v4 = a3;
  id v5 = [[VMAudioRecorderImp alloc] _initWithRecordingID:v4 model:self->_recordings];

  [v5 setService:self];

  return v5;
}

- (VMAudioRecorder)activeAudioRecorder
{
  v2 = [(VMAudioService *)self recordingController];
  id v3 = v2;
  if (v2 && [v2 conformsToProtocol:&OBJC_PROTOCOL___VMAudioRecorder]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (VMAudioRecorder *)v4;
}

- (id)_assetForRecording:(id)a3 error:(id *)a4
{
  id v5 = +[RCComposition compositionLoadedForSavedRecording:a3];
  id v6 = [v5 playableAsset:a4];

  return v6;
}

- (BOOL)shouldWaitForAccessTokenBeforeStartingRecording:(id)a3
{
  preparingToPlayController = self->_preparingToPlayController;
  if (preparingToPlayController)
  {
    id v4 = a3;
    id v5 = [(VMPlaybackController *)preparingToPlayController recordingID];
    id v6 = [v4 recordingID];

    LOBYTE(preparingToPlayController) = v5 == v6;
  }
  return (char)preparingToPlayController;
}

- (void)startPlaying:(id)a3
{
  id v5 = a3;
  if ([(VMAudioService *)self mode] == 2)
  {
    CFStringRef v24 = @"VMAudioErrorModeKey";
    id v6 = +[NSNumber numberWithInt:[(VMAudioService *)self mode]];
    char v25 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v8 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:1 userInfo:v7];

    [v5 setPlaybackError:v8];
  }
  else
  {
    if ([v5 targetState] == 3)
    {
      [v5 targetRate];
      if (v9 > 0.0) {
        [(VMAudioService *)self _activateAudioSessionForPlaybackWithCompletion:0];
      }
    }
    id v8 = [v5 recordingID];
    id v10 = [v5 playerItem];
    if (v10)
    {
      unsigned int v11 = [v5 currentState];
      if (v11 == 4)
      {
        [v5 targetTime];
        double v16 = v15;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10008EA88;
        v22[3] = &unk_100221C88;
        v22[4] = self;
        id v23 = v5;
        [v10 seekToTime:v22 completionHandler:v16];
      }
      else if (v11 == 2)
      {
        [v5 targetState];
      }
    }
    else
    {
      id v12 = [(RCApplicationModel *)self->_recordings recordingWithUniqueID:v8];
      if (v12)
      {
        if ([v5 currentState] != 1)
        {
          [v5 setCurrentState:1];
          objc_initWeak(&location, v5);
          objc_storeStrong((id *)&self->_preparingToPlayController, a3);
          id v13 = +[RCSSavedRecordingService sharedService];
          id v14 = [v12 url];
          v18[0] = _NSConcreteStackBlock;
          v18[1] = 3221225472;
          v18[2] = sub_10008EACC;
          v18[3] = &unk_1002228F0;
          objc_copyWeak(&v20, &location);
          void v18[4] = self;
          id v19 = v12;
          [v13 prepareToPreviewCompositionAVURL:v14 accessRequestHandler:v18];

          objc_destroyWeak(&v20);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        unsigned int v17 = OSLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10016D15C();
        }
      }
    }
  }
}

- (BOOL)pausePlaying:(id)a3
{
  id v4 = a3;
  id v5 = [v4 playerItem];
  if (v5
    && ([(VMPlayer *)self->_player currentItem],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    [(VMPlayer *)self->_player pause];
  }
  else
  {
    [v4 setCurrentState:4];
  }

  return 1;
}

- (BOOL)stopPlaying:(id)a3
{
  id v4 = a3;
  id v5 = [v4 playerItem];
  if (v5)
  {
    [v4 setTargetState:0];
    id v6 = [(VMPlayer *)self->_player currentItem];

    if (v5 == v6) {
      [(VMPlayer *)self->_player replaceCurrentItemWithPlayerItem:0];
    }
    [v4 setPlayerItem:0];
  }
  id v7 = [v4 playbackToken];
  if (v7)
  {
    id v8 = +[RCSSavedRecordingService sharedService];
    id v13 = 0;
    unsigned __int8 v9 = [v8 endAccessSessionWithToken:v7 error:&v13];
    id v10 = v13;

    if ((v9 & 1) == 0)
    {
      unsigned int v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10016D1D0();
      }
    }
    [v4 setPlaybackToken:0];
  }
  [v4 setCurrentState:0];

  return 0;
}

- (BOOL)setTargetRate:(float)a3 controller:(id)a4
{
  id v6 = a4;
  id v7 = [v6 recordingID];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008EF58;
  v12[3] = &unk_100222910;
  float v13 = a3;
  [(VMAudioService *)self _updateRecordingWithUniqueID:v7 updateBlock:v12];

  id v8 = [v6 playerItem];

  unsigned __int8 v9 = [(VMPlayer *)self->_player currentItem];

  if (v9 == v8)
  {
    *(float *)&double v10 = a3;
    [(VMPlayer *)self->_player setTargetRate:v10];
  }

  return v9 == v8;
}

- (BOOL)setSilenceRemoverEnabled:(BOOL)a3 controller:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [v6 recordingID];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008F054;
  v11[3] = &unk_100222930;
  BOOL v12 = v4;
  [(VMAudioService *)self _updateRecordingWithUniqueID:v7 updateBlock:v11];

  id v8 = [v6 playerItem];

  unsigned __int8 v9 = [(VMPlayer *)self->_player currentItem];

  if (v9 == v8) {
    [(VMPlayer *)self->_player setSilenceRemoverEnabled:v4];
  }

  return v9 == v8;
}

- (void)_updateRecordingWithUniqueID:(id)a3 updateBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  recordings = self->_recordings;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008F124;
  v11[3] = &unk_1002221D0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(RCApplicationModel *)recordings performBlockAndWait:v11];
}

- (void)_startPlaybackAtRate:(float)a3 immediately:(BOOL)a4
{
  player = self->_player;
  if (player)
  {
    regulatoryLogger = self->_regulatoryLogger;
    id v8 = player;
    [(RCRegulatoryLogger *)regulatoryLogger readingAudioData];
    *(float *)&double v7 = a3;
    [(VMPlayer *)v8 setTargetRate:v7];
    [(VMPlayer *)v8 play];
  }
}

- (BOOL)setTime:(double)a3 controller:(id)a4
{
  id v6 = a4;
  double v7 = [v6 playerItem];
  id v8 = self->_player;
  id v9 = v8;
  if (v7
    && ([(VMPlayer *)v8 currentItem],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10 == v7))
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10008F344;
    v13[3] = &unk_100222958;
    id v14 = v9;
    id v15 = v7;
    id v16 = v6;
    double v17 = a3;
    [v15 seekToTime:v13 completionHandler:a3];

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_closestAllowedSampleRate:(double)a3 allowedSampleRates:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (v5)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      double v11 = 1.79769313e308;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v13 doubleValue];
          double v15 = vabdd_f64(a3, v14);
          if (v15 < v11)
          {
            id v16 = v13;

            double v11 = v15;
            id v9 = v16;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
  else if (a3 <= 384000.0)
  {
    id v9 = +[NSNumber numberWithDouble:a3];
  }
  else
  {
    id v9 = &off_10022DA00;
  }

  return v9;
}

- (id)_recordingSettingsForAudioEngine:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  CFStringRef v24 = sub_10008C6C0;
  char v25 = sub_10008C6D0;
  id v26 = 0;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = sub_10008C6C0;
  long long v19 = sub_10008C6D0;
  id v20 = 0;
  audioSessionQueue = self->_audioSessionQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008F6E4;
  v11[3] = &unk_100222980;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  id v13 = &v21;
  double v14 = &v15;
  dispatch_sync(audioSessionQueue, v11);
  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

- (void)_prepareWithRecordingEngine:(id)a3 controller:(id)a4 assetWriter:(id)a5
{
  id v8 = (VMRecordingEngine *)a3;
  id v18 = a4;
  id v9 = a5;
  uint64_t v10 = [v18 waveformDataSource];

  if (!v10)
  {
    id v11 = [v18 targetTrackIndex];
    id v12 = [v9 url];
    id v13 = +[RCWaveform waveformURLForAVURL:v12 trackIndex:v11];

    id v14 = [objc_alloc((Class)RCWaveformGenerator) initWithSegmentFlushInterval:v11 trackIndex:0.0];
    id v15 = [objc_alloc((Class)RCWaveformDataSource) initWithWaveformGenerator:v14 generatedWaveformOutputURL:v13 trackIndex:v11];
    [v15 beginLoading];
    [v18 setWaveformDataSource:v15];
  }
  recordingEngine = self->_recordingEngine;
  self->_recordingEngine = v8;
  uint64_t v17 = v8;

  [(VMRecordingEngine *)self->_recordingEngine setAssetWriter:v9];
  [(VMRecordingEngine *)self->_recordingEngine setController:v18];
}

- (void)_shutdownRecordingEngine
{
  recordingEngine = self->_recordingEngine;
  if (recordingEngine)
  {
    if ((VMRecordingEngine *)self->_currentEngine == recordingEngine)
    {
      [(VMAudioService *)self _shutdownEngine];
      recordingEngine = self->_recordingEngine;
    }
    self->_recordingEngine = 0;
  }
}

- (void)_playStartRecordingSoundEffectThenStartRecording:(id)a3 controller:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008FB70;
  v9[3] = &unk_100221CB0;
  id v10 = a4;
  id v11 = self;
  id v12 = v6;
  id v7 = v6;
  id v8 = v10;
  +[VMAudioService playStartRecordingSoundEffect:v9];
}

- (void)startRecordingWithController:(id)a3
{
  id v4 = a3;
  if ([(VMAudioService *)self mode] == 2)
  {
    id v5 = [(VMRecordingEngine *)self->_recordingEngine controller];

    if (v5 == v4)
    {
      id v8 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:4 userInfo:0];
    }
    else
    {
      CFStringRef v13 = @"VMAudioErrorModeKey";
      id v6 = +[NSNumber numberWithInt:[(VMAudioService *)self mode]];
      id v14 = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v8 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:1 userInfo:v7];
    }
    [v4 setRecordingError:v8];
  }
  else
  {
    id v8 = +[NSUUID UUID];
    id v9 = [v8 UUIDString];
    [v4 setRecordingID:v9];
    id v10 = objc_alloc_init(RCActivityWaveformProcessor);
    [v4 setActivityWaveformProcessor:v10];

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008FE78;
    v11[3] = &unk_1002229A8;
    void v11[4] = self;
    id v12 = v4;
    [(VMAudioService *)self _activateAudioSessionForRecordingWithController:v12 completion:v11];
  }
}

- (BOOL)_startRecordingWithController:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[NSDate date];
  id v8 = +[RCSavedRecordingsModel standardURLForRecordingWithCreationDate:v7 fileExtension:RCAudioFileExtensionForIntermediateCapture];
  id v9 = +[RCSSavedRecordingService sharedService];
  id v10 = [v9 prepareToCaptureToCompositionAVURL:v8 error:a4];
  if (v10)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10009030C;
    v28[3] = &unk_1002229D0;
    id v11 = v9;
    id v29 = v11;
    uint64_t v21 = objc_retainBlock(v28);
    id v22 = [(VMAudioService *)self _newRecordingEngine];
    id v12 = -[VMAudioService _recordingSettingsForAudioEngine:error:](self, "_recordingSettingsForAudioEngine:error:");
    if (v12)
    {
      v31[0] = v7;
      v30[0] = @"date";
      v30[1] = @"uniqueID";
      CFStringRef v13 = [v6 recordingID];
      v31[1] = v13;
      id v20 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];

      id v14 = [v11 openAudioFile:v8 settings:v12 metadata:v20 error:a4];
      if (v14)
      {
        [v6 setRecordingURL:v8];
        [v6 setRecordingDate:v7];
        [(VMAudioService *)self _prepareWithRecordingEngine:v22 controller:v6 assetWriter:v14];
        if ([(VMAudioService *)self _switchEngine:self->_recordingEngine audioSettings:v12 error:a4])
        {
          [(VMAudioService *)self setMode:2];
          [v6 setCurrentState:2];
          [v6 setRecordingToken:v10];

          id v15 = [(VMRecordingEngine *)self->_recordingEngine group];
          dispatch_group_enter(v15);
          id v16 = [v6 waveformDataSource];
          BOOL v17 = v16 == 0;

          if (!v17) {
            dispatch_group_enter(v15);
          }
          id v18 = [v6 recordingID:v20];
          [(VMAudioService *)self _playStartRecordingSoundEffectThenStartRecording:v18 controller:v6];

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10009039C;
          block[3] = &unk_1002229F8;
          unsigned __int8 v27 = v21;
          id v24 = v6;
          char v25 = self;
          id v26 = v14;
          dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, block);

          id v10 = 0;
        }
      }
    }
    ((void (*)(void *, void *))v21[2])(v21, v10);
  }
  return 0;
}

- (BOOL)stopRecording:(id)a3 error:(id *)a4
{
  id v6 = a3;
  RCCurrentMediaTime();
  LOBYTE(a4) = -[VMAudioService stopRecording:atTime:error:](self, "stopRecording:atTime:error:", v6, a4);

  return (char)a4;
}

- (BOOL)stopRecording:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(VMAudioService *)self mode] == 2)
  {
    id v9 = self->_recordingEngine;
    id v10 = v9;
    if (v9)
    {
      id v11 = [(VMRecordingEngine *)v9 controller];
      id v12 = [v11 recordingID];
      unsigned __int8 v13 = [v12 isEqualToString:v8];

      if (v13)
      {
        unsigned int v14 = [v11 currentState];
        BOOL v15 = 1;
        if (v14 && v14 != 3)
        {
          [v11 setCurrentState:3];
          id v16 = [v10 assetWriter];
          BOOL v15 = v16 != 0;
          if (v16)
          {
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1000908C0;
            v19[3] = &unk_100221858;
            id v20 = v10;
            uint64_t v21 = self;
            id v22 = v16;
            id v23 = v11;
            [v20 stopRecordingAtTime:v19 completion:a4];
          }
        }
      }
      else if (a5)
      {
        +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:4 userInfo:0];
        BOOL v15 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v15 = 0;
      }

      goto LABEL_19;
    }
    if (a5)
    {
      +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:3 userInfo:0];
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
LABEL_11:
    BOOL v15 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (a5)
  {
    CFStringRef v24 = @"VMAudioErrorModeKey";
    id v10 = +[NSNumber numberWithInt:[(VMAudioService *)self mode]];
    char v25 = v10;
    BOOL v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    *a5 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:1 userInfo:v17];

    goto LABEL_11;
  }
  BOOL v15 = 0;
LABEL_20:

  return v15;
}

- (BOOL)stopRecordingWithController:(id)a3 error:(id *)a4
{
  id v6 = a3;
  RCCurrentMediaTime();
  LOBYTE(a4) = -[VMAudioService stopRecordingWithController:atTime:error:](self, "stopRecordingWithController:atTime:error:", v6, a4);

  return (char)a4;
}

- (BOOL)stopRecordingWithController:(id)a3 atTime:(double)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(VMRecordingEngine *)self->_recordingEngine controller];

  if (v9 == v8)
  {
    id v11 = [v8 recordingID];
    BOOL v10 = [(VMAudioService *)self stopRecording:v11 atTime:a5 error:a4];
  }
  else if (a5)
  {
    +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:4 userInfo:0];
    BOOL v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)simulateRecordingError
{
  id v3 = [(VMRecordingEngine *)self->_recordingEngine group];
  id v4 = [(VMRecordingEngine *)self->_recordingEngine controller];
  id v5 = [v4 recordingID];
  [v4 setRecordingID:0];
  id v6 = +[RCSSavedRecordingService sharedService];
  id v7 = [(VMRecordingEngine *)self->_recordingEngine assetWriter];
  id v14 = 0;
  unsigned int v8 = [v6 closeAudioFile:v7 error:&v14];
  id v9 = v14;

  if (v8)
  {
    BOOL v10 = [(RCApplicationModel *)self->_recordings recordingWithUniqueID:v5];
    if (v10) {
      [(RCApplicationModel *)self->_recordings eraseRecording:v10];
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100090F04;
    v12[3] = &unk_100222A70;
    void v12[4] = self;
    id v13 = v3;
    id v11 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v12 block:1.0];
  }
}

- (id)deviceSampleRates:(id *)a3
{
  id v4 = +[VMAudioDevice defaultInputAndReturnError:](VMAudioDevice, "defaultInputAndReturnError:");
  if (v4)
  {
    id v5 = +[VMAudioDevice defaultOutputAndReturnError:a3];
    if (v5)
    {
      v10[0] = @"input";
      id v6 = [v4 sampleRates];
      v10[1] = @"output";
      v11[0] = v6;
      id v7 = [v5 sampleRates];
      v11[1] = v7;
      unsigned int v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    }
    else
    {
      unsigned int v8 = 0;
    }
  }
  else
  {
    unsigned int v8 = 0;
  }

  return v8;
}

- (BOOL)configureInputSampleRate:(double)a3 outputSampleRate:(double)a4 error:(id *)a5
{
  unsigned int v8 = +[VMAudioDevice defaultInputAndReturnError:](VMAudioDevice, "defaultInputAndReturnError:");
  id v9 = v8;
  if (v8
    && (([v8 sampleRate], v10 == a3) || objc_msgSend(v9, "setSampleRate:error:", a5, a3)))
  {
    id v11 = +[VMAudioDevice defaultOutputAndReturnError:a5];
    id v12 = v11;
    BOOL v14 = 0;
    if (v11)
    {
      [v11 sampleRate];
      if (v13 == a4 || [v12 setSampleRate:a5 error:a4]) {
        BOOL v14 = 1;
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (VMRecordingController)recordingController
{
  return [(VMRecordingEngine *)self->_recordingEngine controller];
}

- (id)_fetchRecording:(id)a3 recordingController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RCApplicationModel *)self->_recordings recordingWithUniqueID:v6];
  id v9 = (void *)v8;
  if (v7 && !v8)
  {
    double v10 = [v7 recordingID];
    unsigned int v11 = [v10 isEqualToString:v6];

    if (v11)
    {
      id v12 = [v7 recordingURL];
      double v13 = [v7 recordingDate];
      [v7 currentDuration];
      double v15 = v14;
      recordings = self->_recordings;
      BOOL v17 = [v12 path];
      id v18 = [v7 titleBase];
      id v9 = [(RCApplicationModel *)recordings insertRecordingWithAudioFile:v17 duration:v13 date:v18 customTitleBase:v6 uniqueID:v15];
    }
    else
    {
      id v9 = 0;
    }
  }

  return v9;
}

- (id)fetchRecording:(id)a3
{
  recordingEngine = self->_recordingEngine;
  id v5 = a3;
  id v6 = [(VMRecordingEngine *)recordingEngine controller];
  id v7 = [(VMAudioService *)self _fetchRecording:v5 recordingController:v6];

  return v7;
}

- (BOOL)isRecordingEnabled:(id *)a3
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  callCenterQueue = self->_callCenterQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000915CC;
  block[3] = &unk_100222690;
  void block[4] = self;
  void block[5] = &v13;
  dispatch_sync(callCenterQueue, block);
  uint64_t v5 = v14[3];
  if (v5)
  {
    v17[0] = NSLocalizedFailureReasonErrorKey;
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"UNABLE_TO_RECORD_WITH_ACTIVE_PHONE_CALL_TITLE" value:&stru_100228BC8 table:0];
    v18[0] = v7;
    v17[1] = NSLocalizedRecoverySuggestionErrorKey;
    uint64_t v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"UNABLE_TO_RECORD_WITH_ACTIVE_PHONE_CALL_BODY" value:&stru_100228BC8 table:0];
    v18[1] = v9;
    double v10 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];

    if (a3)
    {
      *a3 = +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:5 userInfo:v10];
    }
  }
  _Block_object_dispose(&v13, 8);
  return v5 == 0;
}

+ (void)playStartRecordingSoundEffect:(id)a3
{
  inCompletionBlock[0] = _NSConcreteStackBlock;
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = sub_100091694;
  inCompletionBlock[3] = &unk_1002221F8;
  id v5 = a3;
  id v3 = v5;
  AudioServicesPlaySystemSoundWithCompletion(0x459u, inCompletionBlock);
}

- (double)recordingDuration
{
  double v3 = 0.0;
  double result = 0.0;
  if (self->_mode == 2)
  {
    -[VMRecordingEngine sampleRecordingTime:](self->_recordingEngine, "sampleRecordingTime:", &v3, 0.0);
    return v3;
  }
  return result;
}

- (BOOL)sampleRecordingTime:(double *)a3
{
  if (self->_mode == 2) {
    return [(VMRecordingEngine *)self->_recordingEngine sampleRecordingTime:a3];
  }
  else {
    return 0;
  }
}

- (id)_pushFileVersion:(id)a3 error:(id *)a4
{
  return +[NSFileVersion _addVersionOfItemAtURL:a3 withContentsOfURL:a3 options:0 temporaryStorageIdentifier:0 error:a4];
}

- (BOOL)_popFileVersion:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileVersion otherVersionsOfItemAtURL:v5];
  id v7 = [v6 lastObject];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 replaceItemAtURL:v5 options:1 error:a4];
    double v10 = v9;
    if (v9) {
      unsigned __int8 v11 = [v9 isEqual:v5];
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)__refreshRecording:(id)a3 composition:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [v9 composedDuration];
  double v12 = v11;
  [v10 setRecordingComposition:v9];
  [v10 setCurrentDuration:v12];
  uint64_t v13 = +[NSFileManager defaultManager];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  double v14 = [v9 composedWaveformURLs];
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      id v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        [v13 removeItemAtURL:*(void *)(*((void *)&v28 + 1) + 8 * (void)v18) error:0];
        id v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v16);
  }

  [v8 setLength:v12];
  long long v19 = [v9 composedFragments];
  id v20 = [v19 count];

  if (!v20) {
    [v8 setPlayable:1];
  }
  uint64_t v21 = [v10 liveTranscription];
  [v21 refreshWithComposition:v9];

  recordings = self->_recordings;
  id v27 = 0;
  unsigned __int8 v23 = [(RCApplicationModel *)recordings saveIfNecessary:&v27];
  id v24 = v27;
  if (v23)
  {
    +[RCAnalyticsUtilities sendNewRecordingDuration:v12];
  }
  else
  {
    char v25 = OSLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_10016D488();
    }

    [v10 setRecordingError:v24];
  }

  return v23;
}

- (BOOL)refreshRecording:(id)a3 controller:(id)a4
{
  id v6 = a4;
  id v7 = [(VMAudioService *)self fetchRecording:a3];
  if (!v7) {
    goto LABEL_9;
  }
  player = self->_player;
  if (player)
  {
    id v9 = [(VMPlayer *)player currentItem];
    id v10 = v9;
    if (v9)
    {
      double v11 = [v9 asset];
      double v12 = [v11 rc_composedAVURL];
      uint64_t v13 = [v7 url];
      unsigned int v14 = [v12 isEqual:v13];

      if (v14)
      {
        id v15 = [v10 controller];
        [(VMAudioService *)self stopPlaying:v15];
      }
    }
  }
  uint64_t v16 = +[RCComposition compositionLoadedForSavedRecording:v7];
  if (v16)
  {
    uint64_t v17 = (void *)v16;
    BOOL v18 = [(VMAudioService *)self __refreshRecording:v7 composition:v16 controller:v6];
  }
  else
  {
LABEL_9:
    BOOL v18 = 0;
  }

  return v18;
}

- (void)__eraseSecondLayerInComposition:(id)a3 outputFragment:(id)a4 audioSettings:(id)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v10 timeRangeInComposition];
  id v13 = [v9 newRandomFragmentWithInsertionTimeRangeInComposition:1 trackIndex:RCAudioFileExtensionM4A];
  id v14 = [v13 mutableCopy];

  [v10 contentDuration];
  [v14 setContentDuration:];
  [v10 timeRangeInContentToUse];
  [v14 setTimeRangeInContentToUse:];
  id v15 = [v14 AVOutputURL];
  id v39 = 0;
  id v16 = [objc_alloc((Class)RCAssetWriter) initForWriting:v15 settings:v11 error:&v39];
  id v17 = v39;
  if (v16)
  {
    id v33 = (void (**)(void, void, void))v12;
    BOOL v18 = [v16 processingFormat];
    id v19 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:v18 frameCapacity:0x2000];
    [v19 setFrameLength:0x2000];
    [v14 contentDuration];
    double v21 = v20;
    v32 = v18;
    [v18 sampleRate];
    double v23 = v22;
    id v38 = v17;
    LODWORD(v18) = [v16 startWritingAudioFile:&v38];
    id v24 = v38;

    if (v18)
    {
      uint64_t v25 = (v21 * v23);
      id v30 = v11;
      id v31 = v9;
      if (!v25)
      {
LABEL_9:
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100091E7C;
        v34[3] = &unk_100222A98;
        id v12 = v33;
        v36 = v33;
        id v35 = v14;
        [v16 finishWritingAudioFile:v34];

        id v11 = v30;
        id v9 = v31;
LABEL_15:

        id v17 = v24;
        goto LABEL_16;
      }
      unsigned int v26 = 0x2000;
      id v27 = v24;
      while (1)
      {
        if (v26 > v25)
        {
          [v19 setFrameLength:v25];
          unsigned int v26 = v25;
        }
        id v37 = v27;
        unsigned __int8 v28 = [v16 writeFromBuffer:v19 error:&v37];
        id v24 = v37;

        if ((v28 & 1) == 0) {
          break;
        }
        id v27 = v24;
        uint64_t v25 = v25 - v26;
        if (!v25) {
          goto LABEL_9;
        }
      }
      long long v29 = OSLogForCategory();
      id v11 = v30;
      id v9 = v31;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10016D4FC();
      }
    }
    else
    {
      long long v29 = OSLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10016D570();
      }
    }

    id v12 = v33;
    ((void (**)(void, void, id))v33)[2](v33, 0, v24);
    goto LABEL_15;
  }
LABEL_16:
}

- (BOOL)_mergeRecording:(id)a3 atTime:(double)a4 controller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = [(VMAudioService *)self fetchRecording:v10];
  id v13 = v12;
  if (v12)
  {
    v54 = [v12 url];
    v55 = +[RCSSavedRecordingService sharedService];
    id v76 = 0;
    id v14 = [v55 prepareToTrimCompositionAVURL:v54 error:&v76];
    id v53 = v76;
    if (v14)
    {
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_100092730;
      v73[3] = &unk_100222AC0;
      id v15 = v55;
      id v74 = v15;
      v75 = self;
      v48 = objc_retainBlock(v73);
      id v50 = [(VMAudioService *)self _newRecordingEngine];
      v52 = -[VMAudioService _recordingSettingsForAudioEngine:error:](self, "_recordingSettingsForAudioEngine:error:");
      if (!v52) {
        goto LABEL_24;
      }
      id v16 = [v11 recordingComposition];
      if (v16) {
        goto LABEL_10;
      }
      id v17 = [VMRecordingAssetsBackup alloc];
      [v13 length];
      id v72 = 0;
      BOOL v18 = -[VMRecordingAssetsBackup initWithComposedAVURL:duration:error:](v17, "initWithComposedAVURL:duration:error:", v54, &v72);
      id v19 = v72;
      [v11 setAssetBackup:v18];

      double v20 = [v11 assetBackup];
      LODWORD(v18) = v20 == 0;

      if (v18)
      {
        double v21 = OSLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10016D5E4();
        }
      }
      id v16 = +[RCComposition compositionLoadedForEditingSavedRecording:v13 error:a6];
      [v11 setRecordingComposition:v16];

      if (v16)
      {
LABEL_10:
        [v16 composedDuration];
        double v23 = v22;
        [v11 setCurrentDuration:];
        if (v23 < a4) {
          a4 = v23;
        }
        [v11 setRecordingURL:v54];
        id v46 = [v11 targetTrackIndex];
        RCTimeRangeMake();
        id v24 = [v16 newRandomFragmentWithInsertionTimeRangeInComposition:v46 trackIndex:RCAudioFileExtensionM4A];
        id v51 = [v24 mutableCopy];

        v49 = [v51 AVOutputURL];
        uint64_t v25 = +[NSFileManager defaultManager];
        [v25 removeItemAtURL:v49 error:0];

        v77[0] = RCSSavedRecordingServiceAudioFileMetadataKey_Composition;
        unsigned int v26 = [v16 dictionaryPListRepresentation];
        v78[0] = v26;
        v77[1] = RCSSavedRecordingServiceAudioFileMetadataKey_OutputFragment;
        id v27 = [v51 dictionaryPListRepresentation];
        v77[2] = RCSSavedRecordingServiceAudioFileMetadataKey_UniqueID;
        v78[1] = v27;
        v78[2] = v10;
        v47 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];

        unsigned __int8 v28 = [v15 openAudioFile:v49 settings:v52 metadata:v47 error:a6];
        if (v28)
        {
          [(VMAudioService *)self setMode:3];
          [v11 setRecordingToken:v14];

          id v29 = &_dispatch_main_q;
          id v30 = [v11 waveformDataSource];
          id v31 = v30;
          if (v30 && ([v30 finished] & 1) == 0) {
            [v31 cancelLoading];
          }
          id v32 = [objc_alloc((Class)RCCaptureInputWaveformDataSource) initWithDestinationComposition:v16 destinationFragment:v51 trackIndex:v46];
          [v11 setWaveformDataSource:v32];
          [v32 beginLoading];
          [(VMAudioService *)self _prepareWithRecordingEngine:v50 controller:v11 assetWriter:v28];
          [v50 setInternalRecording:1];
          [v11 setCurrentTime:a4];
          id v71 = 0;
          unsigned int v33 = [(VMAudioService *)self _switchEngine:v50 audioSettings:v52 error:&v71];
          id v34 = v71;
          if (v33)
          {
            id v44 = v34;
            id v35 = [v50 group];
            dispatch_group_enter(v35);
            [(VMAudioService *)self setMode:2];
            [v11 setRecordingID:v10];
            [v11 setCurrentState:2];
            [v50 setPunchInTime:a4];
            [(VMAudioService *)self _playStartRecordingSoundEffectThenStartRecording:v10 controller:v11];
            group = v35;
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_1000927D8;
            v67[3] = &unk_100222AE8;
            v70 = v48;
            id v36 = v11;
            id v68 = v36;
            v69 = self;
            id v37 = objc_retainBlock(v67);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_10009285C;
            block[3] = &unk_100222B88;
            void block[4] = self;
            id v57 = v49;
            id v65 = v37;
            double v66 = a4;
            id v58 = v51;
            id v59 = v54;
            id v60 = v16;
            id v61 = v13;
            id v62 = v36;
            id v63 = v52;
            id v38 = &_dispatch_main_q;
            id v64 = &_dispatch_main_q;
            id v39 = v37;
            dispatch_group_notify(group, (dispatch_queue_t)&_dispatch_main_q, block);

            id v34 = v44;
          }

          id v14 = 0;
          int v40 = 0;
        }
        else
        {
          int v40 = 1;
        }
      }
      else
      {
LABEL_24:
        int v40 = 1;
      }

      ((void (*)(void *, void *))v48[2])(v48, v14);
      BOOL v41 = v40 == 0;
    }
    else
    {
      v42 = OSLogForCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v80 = "-[VMAudioService _mergeRecording:atTime:controller:error:]";
        __int16 v81 = 2112;
        id v82 = v53;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%s -- accessError = %@", buf, 0x16u);
      }

      BOOL v41 = 0;
      if (a6) {
        *a6 = v53;
      }
    }
  }
  else
  {
    BOOL v41 = 0;
  }

  return v41;
}

- (void)replaceRecording:(id)a3 atTime:(double)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(RCActivityWaveformProcessor);
  [v9 setActivityWaveformProcessor:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100092F24;
  v13[3] = &unk_100222BB0;
  void v13[4] = self;
  id v14 = v8;
  double v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(VMAudioService *)self _activateAudioSessionForRecordingWithController:v11 completion:v13];
}

- (void)_cancelFileTranscription
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  double v3 = +[RCRecordingTranscriptionService sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100093078;
  v5[3] = &unk_100221278;
  dispatch_semaphore_t v6 = v2;
  id v4 = v2;
  [v3 cancelFileTranscriptionWithCompletionHandler:v5];

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_editRecording:(id)a3 editBlock:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v30 = (void (**)(id, void *, void *, id *))a4;
  id v11 = a5;
  [(VMAudioService *)self _shutdownPlaybackEngine];
  id v12 = [(VMAudioService *)self fetchRecording:v10];
  if (v12)
  {
    [(VMAudioService *)self _cancelFileTranscription];
    id v29 = [v12 url];
    id v13 = +[RCSSavedRecordingService sharedService];
    id v34 = 0;
    id v14 = [v13 prepareToTrimCompositionAVURL:v29 error:&v34];
    id v28 = v34;
    if (!v14)
    {
      unsigned int v26 = OSLogForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v36 = "-[VMAudioService _editRecording:editBlock:controller:error:]";
        __int16 v37 = 2112;
        id v38 = v28;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s -- accessError = %@", buf, 0x16u);
      }

      BOOL v25 = 0;
      if (a6) {
        *a6 = v28;
      }
      goto LABEL_23;
    }
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000934D8;
    v32[3] = &unk_1002229D0;
    id v33 = v13;
    id v15 = objc_retainBlock(v32);
    double v16 = [v11 recordingComposition];
    if (!v16)
    {
      id v17 = [VMRecordingAssetsBackup alloc];
      [v12 length];
      id v31 = 0;
      BOOL v18 = -[VMRecordingAssetsBackup initWithComposedAVURL:duration:error:](v17, "initWithComposedAVURL:duration:error:", v29, &v31);
      id v19 = v31;
      [v11 setAssetBackup:v18];

      double v20 = [v11 assetBackup];
      LODWORD(v18) = v20 == 0;

      if (v18)
      {
        double v21 = OSLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_10016D6CC();
        }
      }
      double v16 = +[RCComposition compositionLoadedForEditingSavedRecording:error:](RCComposition, "compositionLoadedForEditingSavedRecording:error:", v12, a6, v28);
      if (!v16)
      {

        double v22 = 0;
        goto LABEL_21;
      }
      [v11 setRecordingComposition:v16];
    }
    double v22 = v30[2](v30, v16, v12, a6);

    if (v22)
    {
      double v23 = +[RCComposition compositionMetadataURLForComposedAVURL:v29];
      id v24 = [(VMAudioService *)self _pushFileVersion:v23 error:a6];

      [v22 saveMetadataToDefaultLocation];
      BOOL v25 = [(VMAudioService *)self __refreshRecording:v12 composition:v22 controller:v11];
LABEL_22:

      ((void (*)(void *, void *))v15[2])(v15, v14);
LABEL_23:

      goto LABEL_24;
    }
LABEL_21:
    BOOL v25 = 0;
    goto LABEL_22;
  }
  if (a6)
  {
    +[NSError errorWithDomain:@"VMAudioServiceErrorDomain" code:4 userInfo:0];
    BOOL v25 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_24:

  return v25;
}

- (BOOL)trimRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100093638;
  double v16 = &unk_100222BD0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v17 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_retainBlock(&v13);
  LOBYTE(a6) = -[VMAudioService _editRecording:editBlock:controller:error:](self, "_editRecording:editBlock:controller:error:", v10, v11, v9, a6, v13, v14, v15, v16, *(void *)&v17.var0, *(void *)&v17.var1);

  return (char)a6;
}

- (BOOL)cutRecording:(id)a3 timeRange:(id)a4 controller:(id)a5 error:(id *)a6
{
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_100093714;
  double v16 = &unk_100222BD0;
  $F24F406B2B787EFB06265DBA3D28CBD5 v17 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_retainBlock(&v13);
  LOBYTE(a6) = -[VMAudioService _editRecording:editBlock:controller:error:](self, "_editRecording:editBlock:controller:error:", v10, v11, v9, a6, v13, v14, v15, v16, *(void *)&v17.var0, *(void *)&v17.var1);

  return (char)a6;
}

- (BOOL)finalizeRecording:(id)a3 controller:(id)a4 saveAsNew:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 recordingComposition];
  id v11 = v10;
  if (a5)
  {
    uint64_t v12 = 1;
  }
  else if ([v10 willMigrateFromM4aToQta])
  {
    uint64_t v12 = 2;
  }
  else
  {
    uint64_t v12 = 0;
  }
  BOOL v13 = [(VMAudioService *)self _finalizeRecording:v8 controller:v9 finalizationStrategy:v12];

  return v13;
}

- (BOOL)_finalizeRecording:(id)a3 controller:(id)a4 finalizationStrategy:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  [(VMAudioService *)self _deactivateAudioSessionAsync:1];
  unsigned int v10 = a5 - 1;
  id v11 = [v9 recordingComposition];
  if (v11)
  {
    uint64_t v12 = [(VMAudioService *)self fetchRecording:v8];
    BOOL v13 = v12 != 0;
    if (v12)
    {
      if (v10 >= 2
        && [(VMAudioService *)self attemptSingleFragmentFinalization:v11 recording:v12 controller:v9])
      {
        goto LABEL_22;
      }
      uint64_t v14 = [v12 url];
      id v15 = v9;
      double v16 = v15;
      if (v10 <= 1)
      {
        $F24F406B2B787EFB06265DBA3D28CBD5 v17 = [v15 assetBackup];
        if (v17)
        {
          id v43 = 0;
          id v39 = v17;
          BOOL v18 = [(VMAudioService *)self _saveAsNew:v12 withAssetBackup:v17 editedComposition:v11 replacingOriginal:a5 == 2 error:&v43];
          int v40 = v43;
          if (v18)
          {
            id v19 = [v18 uuid];
            [v16 setRecordingID:v19];

            uint64_t v38 = [v18 url];

            double v20 = +[RCComposition compositionLoadedForSavedRecording:v18];
            [(VMAudioService *)self __refreshRecording:v18 composition:v20 controller:v16];
            double v16 = 0;
            uint64_t v14 = v38;
          }
          else
          {
            double v20 = OSLogForCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_10016D82C();
            }
          }

          $F24F406B2B787EFB06265DBA3D28CBD5 v17 = v39;
          id v28 = v40;
        }
        else
        {
          id v28 = OSLogForCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10016D7B4(v28, v29, v30, v31, v32, v33, v34, v35);
          }
        }
      }
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100093AA8;
      v41[3] = &unk_100222BF8;
      id v42 = v16;
      id v36 = v16;
      [(VMAudioService *)self _mixDownEditedRecording:v14 completion:v41];
    }
    else
    {
      uint64_t v14 = OSLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10016D8A0(v14, v21, v22, v23, v24, v25, v26, v27);
      }
    }

LABEL_22:
    goto LABEL_23;
  }
  if (v10 <= 1) {
    [(VMAudioService *)self _duplicateRecordingWithID:v8];
  }
  BOOL v13 = 1;
LABEL_23:

  return v13;
}

- (void)_duplicateRecordingWithID:(id)a3
{
  id v4 = [(VMAudioService *)self fetchRecording:a3];
  if (!v4)
  {
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10016D918(v7, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_7;
  }
  recordings = self->_recordings;
  uint64_t v22 = 0;
  dispatch_semaphore_t v6 = [(RCApplicationModel *)recordings duplicateRecording:v4 error:&v22];

  if (!v6)
  {
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10016D990(v7, v8, v9, v10, v11, v12, v13, v14);
    }
LABEL_7:
  }
}

- (void)_restoreOriginalRecording:(id)a3 andComposition:(id)a4 forFailedRecording:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10) {
    [(RCApplicationModel *)self->_recordings eraseRecording:v10];
  }
  if (v9)
  {
    uint64_t v11 = [v8 url];
    uint64_t v12 = [v8 uuid];
    id v16 = 0;
    uint64_t v13 = [v9 moveTo:v11 recordingID:v12 error:&v16];
    id v14 = v16;

    if (!v13)
    {
      uint64_t v15 = OSLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10016DA08();
      }
    }
  }
}

- (id)_saveAsNew:(id)a3 withAssetBackup:(id)a4 editedComposition:(id)a5 replacingOriginal:(BOOL)a6 error:(id *)a7
{
  BOOL v7 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v7) {
    [v11 creationDate];
  }
  else {
  id v14 = +[NSDate now];
  }
  recordings = self->_recordings;
  id v53 = 0;
  id v16 = [(RCApplicationModel *)recordings duplicateRecording:v11 copyingResources:0 creationDate:v14 error:&v53];
  id v17 = v53;
  uint64_t v18 = v17;
  if (!v16)
  {
    id v40 = 0;
    goto LABEL_25;
  }
  BOOL v46 = v7;
  id v47 = v17;
  v48 = self;
  v49 = v14;
  id v50 = v12;
  uint64_t v19 = [v16 creationDate];
  uint64_t v20 = [v16 uuid];
  [v13 composedAVURL];
  v22 = uint64_t v21 = v13;
  uint64_t v23 = [v22 pathExtension];
  uint64_t v24 = +[RCSavedRecordingsModel standardPathForRecordingWithCreationDate:v19 uniqueID:v20 fileExtension:v23];
  uint64_t v25 = +[NSURL fileURLWithPath:v24];

  id v13 = v21;
  uint64_t v26 = [v16 uuid];
  id v51 = (void *)v25;
  uint64_t v27 = [v21 moveTo:v25 recordingID:v26 error:a7];

  if (v27)
  {
    id v12 = v50;
    id v28 = [v50 composedAVURLBackup];
    uint64_t v29 = [v11 url];
    id v30 = v28;
    uint64_t v31 = +[NSFileManager defaultManager];
    *(void *)buf = 0;
    unsigned int v32 = [v31 moveItemAtURL:v30 toURL:v29 error:buf];

    id v33 = *(id *)buf;
    uint64_t v34 = v33;
    if (v32)
    {

      id v13 = v21;
LABEL_8:
      [v12 originalDuration];
      [v11 setLength:];
      uint64_t v35 = [v51 lastPathComponent];
      [v16 setFileName:v35];

      id v14 = v49;
      uint64_t v18 = v47;
      if (v46)
      {
        id v36 = OSLogForCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v37 = [v11 uuid];
          uint64_t v38 = [v16 uuid];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "-[VMAudioService _saveAsNew:withAssetBackup:editedComposition:replacingOriginal:error:]";
          __int16 v55 = 2112;
          v56 = v37;
          __int16 v57 = 2112;
          id v58 = v38;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s -- Migrating uniqueID %@ to multitrack with uniqueID %@", buf, 0x20u);
        }
        id v39 = [v11 title];
        [v16 setTitle:v39];

        [(RCApplicationModel *)v48->_recordings eraseRecording:v11];
      }
      [(RCApplicationModel *)v48->_recordings saveIfNecessary];
      id v40 = v16;
      goto LABEL_24;
    }
    id v41 = v33;
    id v42 = [v41 domain];
    if ([v42 isEqualToString:NSCocoaErrorDomain]) {
      BOOL v43 = [v41 code] == (id)516;
    }
    else {
      BOOL v43 = 0;
    }

    if (!a7 || v43)
    {

      id v12 = v50;
      id v13 = v21;
      if (v43) {
        goto LABEL_8;
      }
    }
    else
    {
      id v44 = v41;
      *a7 = v44;

      id v12 = v50;
      id v13 = v21;
    }
    [(VMAudioService *)v48 _restoreOriginalRecording:v11 andComposition:v27 forFailedRecording:v16];
    id v40 = 0;
  }
  else
  {
    [(VMAudioService *)v48 _restoreOriginalRecording:v11 andComposition:0 forFailedRecording:v16];
    id v40 = 0;
    id v12 = v50;
  }
  id v14 = v49;
  uint64_t v18 = v47;
LABEL_24:

LABEL_25:

  return v40;
}

- (BOOL)attemptSingleFragmentFinalization:(id)a3 recording:(id)a4 controller:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 composedFragments];
  if ([v11 count] == (id)1)
  {
    id v12 = [v11 firstObject];
    [v12 contentDuration];
    double v14 = v13;
    [v12 timeRangeInComposition];
    RCTimeRangeDeltaWithExactPrecision();
    if (v14 == v15)
    {
      id v16 = +[NSFileManager defaultManager];
      id v17 = [v12 AVOutputURL];
      uint64_t v18 = [v8 composedAVURL];
      id v26 = 0;
      unsigned __int8 v19 = [v16 moveItemAtURL:v17 toURL:v18 error:&v26];
      id v25 = v26;

      if (v19)
      {
        id v20 = [v8 mutableCopy];
        [v20 setDecomposedFragments:&__NSArray0__struct];
        [v20 saveMetadataToDefaultLocation];
        BOOL v21 = [(VMAudioService *)self __refreshRecording:v9 composition:v20 controller:v10];

        uint64_t v22 = v25;
      }
      else
      {
        uint64_t v23 = OSLogForCategory();
        uint64_t v22 = v25;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_10016DA7C();
        }

        [v10 setRecordingError:v25];
        BOOL v21 = 0;
      }
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (void)_mixDownEditedRecording:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VMAudioService *)self setEditingStatus:1];
  +[RCSSavedRecordingService sharedService];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  void v10[2] = sub_100094480;
  v10[3] = &unk_100222C20;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v11;
  [v9 prepareToExportCompositionAVURL:v7 accessRequestHandler:v10];
}

- (void)interfaceOrientationDidUpdate:(int64_t)a3
{
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (void)setRecordingError:(id)a3
{
}

- (int)editingStatus
{
  return self->_editingStatus;
}

- (void)setEditingStatus:(int)a3
{
  self->_editingStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_stereoOrientationProvider, 0);
  objc_storeStrong((id *)&self->_preparingToPlayController, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_regulatoryLogger, 0);
  objc_storeStrong((id *)&self->_recordingEnhancedObservance, 0);
  objc_destroyWeak((id *)&self->_monitoringObservance);
  objc_storeStrong((id *)&self->_allowedSampleRates, 0);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_currentEngine, 0);
  objc_storeStrong((id *)&self->_recordingEngine, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_callCenterQueue, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);

  objc_storeStrong((id *)&self->_recordings, 0);
}

@end