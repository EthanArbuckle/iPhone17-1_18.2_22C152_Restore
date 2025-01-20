@interface RCMainControllerHelper
- ($F24F406B2B787EFB06265DBA3D28CBD5)_selectedTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)allowedTimeRange;
- (BOOL)_errorIsRecordingUnavailable:(id)a3;
- (BOOL)_isSelectionTrimmableByDeletingRange:(id)a3;
- (BOOL)_isSelectionTrimmableByKeepingRange:(id)a3;
- (BOOL)_performRecordingEndTransitionWithUUID:(id)a3;
- (BOOL)_requiresUUIDForActivityType:(int64_t)a3;
- (BOOL)_shouldEnableTrimSave;
- (BOOL)_transitionToActivityType:(int64_t)a3 toSubType:(int64_t)a4 withDisplayModel:(id)a5 waveformDataSource:(id)a6 composition:(id)a7;
- (BOOL)_transitionToIdleForItemWithUUID:(id)a3;
- (BOOL)_transitionToPlayingBackForItemWithUUID:(id)a3;
- (BOOL)canJumpBackward;
- (BOOL)canJumpForward;
- (BOOL)didTrimPlayback;
- (BOOL)isFavoriteForUUID:(id)a3;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)isPlayingForUUID:(id)a3;
- (BOOL)isRecording;
- (BOOL)isSilenceRemovedForUUID:(id)a3;
- (BOOL)isSilencing;
- (BOOL)overdubbing;
- (BOOL)readyForPlayback;
- (BOOL)shouldSaveAsNew;
- (BOOL)startCapturing:(id)a3;
- (BOOL)willMigrateFromSingleLayerToMultiLayer;
- (NSArray)audioVersions;
- (NSError)playbackError;
- (NSError)recordingError;
- (NSHashTable)timeObservers;
- (NSString)uuidOfPlayingRecording;
- (RCAVWaveformViewController)overviewWaveformViewController;
- (RCAVWaveformViewController)waveformViewController;
- (RCActivityWaveformProcessor)activityWaveformProcessor;
- (RCComposition)currentComposition;
- (RCKeyPathObservance)finalizingRecordingsObservance;
- (RCKeyPathObservance)playerObservance;
- (RCKeyPathObservance)recorderObservance;
- (RCMainControllerHelper)init;
- (RCMainControllerHelperDelegate)delegate;
- (RCRecordingDisplayModel)currentRecordingDisplayModel;
- (RCUndoTarget)editModeUndoTarget;
- (RCUndoTarget)trimModeUndoTarget;
- (RCUserActivity)currentUserActivity;
- (VMAudioPlayer)audioPlayer;
- (VMAudioRecorder)audioRecorder;
- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription;
- (_TtC10VoiceMemos28RCUserActivityStatePublisher)activityStatePublisher;
- (double)currentDuration;
- (double)currentTime;
- (double)layerMixForUUID:(id)a3;
- (double)playbackSpeedForUUID:(id)a3;
- (double)targetTime;
- (float)currentRate;
- (float)targetRate;
- (id)_alertControllerWithTitle:(id)a3 message:(id)a4 isDestructive:(BOOL)a5 preferredStyle:(int64_t)a6 source:(id)a7 handler:(id)a8 actionTitle:(id)a9 cancelHandler:(id)a10;
- (id)_presentFolderDeletionConfirmationForFolder:(id)a3 source:(id)a4 completionBlock:(id)a5;
- (id)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 collectionViewController:(id)a6;
- (id)_undoActionNameForTrimMode:(int64_t)a3 isUndo:(BOOL)a4;
- (id)compositionForUUID:(id)a3;
- (id)currentPlayerForUUID:(id)a3;
- (id)deleteFolder:(id)a3 source:(id)a4 completionBlock:(id)a5;
- (id)deleteWithUUIDs:(id)a3 source:(id)a4 showInfo:(BOOL)a5;
- (id)displayLinkManager;
- (id)endTrimReloadDataSourceBlock;
- (id)eraseAllRecordingsAndConfirmWithSource:(id)a3;
- (id)eraseAndConfirmWithUUIDs:(id)a3 source:(id)a4 collectionViewController:(id)a5;
- (id)playbackSettingsForUUID:(id)a3;
- (id)recordingErrorHandler;
- (id)recordingInProgressUUID;
- (id)restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 force:(BOOL)a6 collectionViewController:(id)a7;
- (id)undoManager;
- (id)uuidOfPlayingOrSelectedRecording;
- (int64_t)timeControllerState;
- (unint64_t)targetTrackIndex;
- (void)__setupRemoteControlCommandsForPlayback;
- (void)__setupRemoteControlCommandsForRecordingForeground;
- (void)_addCommandTarget:(id)a3 withHandler:(id)a4;
- (void)_addRecordingObservations:(id)a3;
- (void)_adjustCurrentTrimOperationUndoCount:(int64_t)a3;
- (void)_audioContentOrDurationDidChange:(id)a3;
- (void)_beginOrResumeCaptureSessionWithReplace:(BOOL)a3 trackIndex:(unint64_t)a4;
- (void)_beginSelectionEditingModeAction;
- (void)_beginSelectionEditingModeForInsertMode:(BOOL)a3;
- (void)_cancelTrim;
- (void)_checkAudioPlayer:(id)a3;
- (void)_clearPlaybackInAudioPlayer:(id)a3;
- (void)_clearTrimModeUndoStack;
- (void)_defaultSceneWillEnterForeground:(id)a3;
- (void)_deleteRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4;
- (void)_endSelectionEditingMode;
- (void)_enterTrimMode;
- (void)_eraseRecordingsWithUUIDs:(id)a3;
- (void)_handleRecordingUnavailableError:(id)a3;
- (void)_jumpByIncrement:(double)a3 forUUID:(id)a4;
- (void)_jumpToTargetTime:(double)a3;
- (void)_markCurrentFileVersionIfNecessary;
- (void)_preloadRecordingForPlayback:(id)a3;
- (void)_reconcileAudioStateWithApplicationState;
- (void)_recordingFailed:(id)a3 error:(id)a4;
- (void)_recordingStarted:(id)a3;
- (void)_recordingStopped:(id)a3;
- (void)_redoCaptureFragmentWithCompositionControllerRedoInfo:(id)a3;
- (void)_redoTrim:(int64_t)a3;
- (void)_refreshAfterEditingOperation:(id)a3;
- (void)_registerUndoForSetFavorite:(BOOL)a3 changedUUIDs:(id)a4;
- (void)_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:(double)a3;
- (void)_removeRecordingObservations:(id)a3;
- (void)_removeRecordingsObservationsForUUIDs:(id)a3;
- (void)_resetSelectedTimeRangeToFullDuration;
- (void)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4;
- (void)_sceneDidActivateNotification:(id)a3;
- (void)_sceneWillDeactivateNotification:(id)a3;
- (void)_setIsInSelectionEditingMode:(BOOL)a3 forInsertMode:(BOOL)a4;
- (void)_startDisplayLink;
- (void)_startNowPlayingUpdateTimerWithPlaybackTime:(double)a3 playbackRate:(double)a4;
- (void)_startPlaybackOfUUID:(id)a3 atPosition:(double)a4;
- (void)_stopDisplayLink;
- (void)_stopForUUIDs:(id)a3;
- (void)_stopPlaybackInAudioPlayer:(id)a3;
- (void)_teardownRemoteControlCommands;
- (void)_undoCaptureFragment;
- (void)_undoTrim:(int64_t)a3;
- (void)_updateNowPlayingInfo;
- (void)_updateRemoteControlState:(int64_t)a3;
- (void)_updateTrimSaveEnabledState;
- (void)_updateWillMigrateFromSingleLayerToMultiLayer;
- (void)addTimeObserver:(id)a3;
- (void)cancelTrimModeWithDismissal:(BOOL)a3;
- (void)dealloc;
- (void)defaultSceneDidConnect:(id)a3;
- (void)deleteRecordingCanceled;
- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4;
- (void)doneButtonShouldSaveAsNew:(BOOL)a3;
- (void)endDescriptionViewTextEditing;
- (void)endScrubbingForUUID:(id)a3 atPosition:(double)a4;
- (void)enterTrimMode;
- (void)exitEditMode;
- (void)exitTrimMode;
- (void)jumpBackwardForUUID:(id)a3;
- (void)jumpForwardForUUID:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)openForModifyRecordingWithUUID:(id)a3 withSubActivityType:(int64_t)a4;
- (void)pauseCapturing;
- (void)pauseForUUID:(id)a3;
- (void)pauseTime;
- (void)performClearAllRecentlyDeleted;
- (void)performTrimByDeletingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4;
- (void)performTrimByKeepingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4;
- (void)playbackForUUID:(id)a3 atPosition:(double)a4;
- (void)prepareForPlaybackForUUID:(id)a3;
- (void)prepareForPlaybackForUUID:(id)a3 force:(BOOL)a4;
- (void)promptForRatingIfNeeded;
- (void)removeTimeObserver:(id)a3;
- (void)replaceCapturing:(unint64_t)a3;
- (void)resumeCapturing:(unint64_t)a3;
- (void)setAllowedTimeRange:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setAudioRecorder:(id)a3;
- (void)setAudioVersions:(id)a3;
- (void)setCurrentComposition:(id)a3;
- (void)setCurrentRate:(float)a3;
- (void)setCurrentRecordingDisplayModel:(id)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentUserActivity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidTrimPlayback:(BOOL)a3;
- (void)setEditModeUndoTarget:(id)a3;
- (void)setEndTrimReloadDataSourceBlock:(id)a3;
- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4;
- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4;
- (void)setFinalizingRecordingsObservance:(id)a3;
- (void)setLayerMix:(double)a3 forUUID:(id)a4;
- (void)setLooping:(BOOL)a3 forUUID:(id)a4;
- (void)setOverdubbing:(BOOL)a3;
- (void)setOverviewWaveformViewController:(id)a3;
- (void)setPlaybackError:(id)a3;
- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4;
- (void)setPlayerObservance:(id)a3;
- (void)setRecorderObservance:(id)a3;
- (void)setRecordingError:(id)a3;
- (void)setRecordingErrorHandler:(id)a3;
- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4;
- (void)setShouldSaveAsNew:(BOOL)a3;
- (void)setSilencing:(BOOL)a3;
- (void)setTargetRate:(float)a3;
- (void)setTargetTime:(double)a3;
- (void)setTargetTrackIndex:(unint64_t)a3;
- (void)setTimeObservers:(id)a3;
- (void)setTrimModeUndoTarget:(id)a3;
- (void)setUuidOfPlayingRecording:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)setWillMigrateFromSingleLayerToMultiLayer:(BOOL)a3;
- (void)shareRecordingsWithUUIDs:(id)a3 inViewController:(id)a4 source:(id)a5 isShareButton:(BOOL)a6 completionWithItemsHandler:(id)a7;
- (void)startMonitoringFinalizingRecordings;
- (void)startScrubbingForUUID:(id)a3 atPosition:(double)a4;
- (void)stopCapturing;
- (void)stopForUUID:(id)a3;
- (void)stopPlayback;
- (void)toggleFavoriteForUUID:(id)a3;
- (void)toggleForUUID:(id)a3;
- (void)togglePlayback;
- (void)updateScrubbingForUUID:(id)a3 atPosition:(double)a4;
- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4;
- (void)waveformDataSourceDidFinishLoading:(id)a3;
- (void)waveformDataSourceRequiresUpdate:(id)a3;
@end

@implementation RCMainControllerHelper

- (void)defaultSceneDidConnect:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_defaultSceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:v4];
}

- (void)startMonitoringFinalizingRecordings
{
  objc_initWeak(&location, self);
  v3 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C240;
  block[3] = &unk_1002225B0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (RCMainControllerHelper)init
{
  v31.receiver = self;
  v31.super_class = (Class)RCMainControllerHelper;
  v2 = [(RCMainControllerHelper *)&v31 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    currentUserActivity = v2->_currentUserActivity;
    v2->_currentUserActivity = (RCUserActivity *)v3;

    id v5 = [[_TtC10VoiceMemos28RCUserActivityStatePublisher alloc] initWithMainControllerHelper:v2];
    activityStatePublisher = v2->_activityStatePublisher;
    v2->_activityStatePublisher = v5;

    byte_100275330 = 0;
    uint64_t v7 = +[RCDisplayLinkManager sharedManager];
    displayLinkManager = v2->_displayLinkManager;
    v2->_displayLinkManager = (RCDisplayLinkManager *)v7;

    v9 = [(RCMainControllerHelper *)v2 timeController];
    [(RCDisplayLinkManager *)v2->_displayLinkManager setTimeController:v9];

    v10 = [[RCUndoTarget alloc] initWithUndoTargetType:1];
    trimModeUndoTarget = v2->_trimModeUndoTarget;
    v2->_trimModeUndoTarget = v10;

    v12 = [[RCUndoTarget alloc] initWithUndoTargetType:0];
    editModeUndoTarget = v2->_editModeUndoTarget;
    v2->_editModeUndoTarget = v12;

    uint64_t v14 = +[RCRecordingsModelInteractor sharedRecordingsModelInteractor];
    recordingsModelInteractor = v2->_recordingsModelInteractor;
    v2->_recordingsModelInteractor = (RCRecordingsModelInteractor *)v14;

    v16 = [(RCRecordingsModelInteractor *)v2->_recordingsModelInteractor audioProperties];
    uint64_t v17 = [v16 valueForKey:@"name"];
    audioProperties = v2->_audioProperties;
    v2->_audioProperties = (NSSet *)v17;

    uint64_t v19 = objc_opt_new();
    recordingObservances = v2->_recordingObservances;
    v2->_recordingObservances = (NSMutableSet *)v19;

    v21 = [_TtC10VoiceMemos24RCAppStoreRatingPrompter alloc];
    v22 = +[RCApplicationModel sharedApplicationModel];
    v23 = [(RCAppStoreRatingPrompter *)v21 initWithSavedRecordingsModel:v22];
    appStoreRatingPrompter = v2->_appStoreRatingPrompter;
    v2->_appStoreRatingPrompter = v23;

    v25 = +[RecorderAppDelegate sharedAppDelegate];
    v26 = [v25 defaultSceneDelegate];
    v27 = [v26 window];
    v28 = [v27 windowScene];

    v29 = +[NSNotificationCenter defaultCenter];
    [v29 addObserver:v2 selector:"_sceneDidActivateNotification:" name:UISceneDidActivateNotification object:v28];
    [v29 addObserver:v2 selector:"_sceneDidEnterBackgroundNotification:" name:UISceneDidEnterBackgroundNotification object:v28];
    [v29 addObserver:v2 selector:"_sceneWillDeactivateNotification:" name:UISceneWillDeactivateNotification object:v28];
  }
  return v2;
}

- (BOOL)isPlayingForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self audioPlayer];
  v6 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  unsigned int v7 = [v6 isEqualToString:v4];

  if (v7) {
    unsigned __int8 v8 = [v5 playing];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)uuidOfPlayingRecording
{
  return self->_uuidOfPlayingRecording;
}

- (double)currentTime
{
  uint64_t v3 = [(RCMainControllerHelper *)self currentUserActivity];
  if (![v3 activityType] && objc_msgSend(v3, "subActivityType") != (id)4) {
    goto LABEL_8;
  }
  id v4 = [(RCMainControllerHelper *)self audioRecorder];
  id v5 = v4;
  if (!v4
    || ![v4 recording]
    || (uint64_t v8 = 0, v9 = 0.0, ([v5 monitorRecordingTime:&v9 duration:&v8] & 1) == 0))
  {

LABEL_8:
    double currentTime = self->_currentTime;
    goto LABEL_9;
  }
  double currentTime = v9;

LABEL_9:
  return currentTime;
}

- (RCUserActivity)currentUserActivity
{
  return self->_currentUserActivity;
}

- (VMAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)stopPlayback
{
  id v3 = [(RCMainControllerHelper *)self audioPlayer];
  if ([v3 playing]) {
    [(RCMainControllerHelper *)self _clearPlaybackInAudioPlayer:v3];
  }
}

- (void)setDelegate:(id)a3
{
}

- (_TtC10VoiceMemos28RCUserActivityStatePublisher)activityStatePublisher
{
  return (_TtC10VoiceMemos28RCUserActivityStatePublisher *)objc_getProperty(self, a2, 176, 1);
}

- (void)_sceneDidActivateNotification:(id)a3
{
  if (self->_hasBecomeActive) {
    [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
  }
  self->_hasBecomeActive = 1;
}

- (void)_defaultSceneWillEnterForeground:(id)a3
{
}

- (void)dealloc
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v3 = self->_commandTargets;
  id v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v9 = [(NSMapTable *)self->_commandTargets objectForKey:v8];
        if (v9) {
          [v8 removeTarget:v9];
        }
      }
      id v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [(NSMutableSet *)self->_recordingObservances copy];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [(RCMainControllerHelper *)self _removeRecordingObservations:*(void *)(*((void *)&v16 + 1) + 8 * (void)j)];
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  v15.receiver = self;
  v15.super_class = (Class)RCMainControllerHelper;
  [(RCMainControllerHelper *)&v15 dealloc];
}

- (id)displayLinkManager
{
  return self->_displayLinkManager;
}

- (void)setCurrentRecordingDisplayModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentRecordingDisplayModel, a3);
  id v4 = [(RCMainControllerHelper *)self delegate];
  [v4 didUpdateCurrentRecordingDisplayModel];
}

- (BOOL)startCapturing:(id)a3
{
  id v4 = a3;
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    long long v22 = "-[RCMainControllerHelper startCapturing:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Requested start capturing", buf, 0xCu);
  }

  uint64_t v6 = +[VMAudioService sharedInstance];
  unsigned int v7 = [(RCMainControllerHelper *)self currentUserActivity];
  unsigned int v8 = [v7 isTrim];

  if (v8)
  {
    [(RCMainControllerHelper *)self exitTrimMode];
  }
  else
  {
    double v9 = [(RCMainControllerHelper *)self currentUserActivity];
    id v10 = [v9 activityType];

    if (v10 == (id)3) {
      [(RCMainControllerHelper *)self exitEditMode];
    }
  }
  id v11 = [(RCMainControllerHelper *)self currentUserActivity];
  [v11 setSubActivityType:0];

  id v20 = 0;
  unsigned int v12 = [v6 isRecordingEnabled:&v20];
  id v13 = v20;
  if (v12)
  {
    id v14 = [v6 newRecorderWithTitleBase:v4];
    [(RCMainControllerHelper *)self setAudioRecorder:v14];
    objc_super v15 = [(RCMainControllerHelper *)self timeController];
    [v15 setTargetTime:0.0];

    [(RCMainControllerHelper *)self setTargetTrackIndex:0];
    [(RCMainControllerHelper *)self setOverdubbing:0];
    [(RCMainControllerHelper *)self setSilencing:0];
    if (([v14 startRecording] & 1) == 0)
    {
      long long v16 = [(RCMainControllerHelper *)self delegate];
      long long v17 = [(RCMainControllerHelper *)self recordingError];
      [v16 captureFailedWithError:v17];
    }
  }
  else if ([(RCMainControllerHelper *)self _errorIsRecordingUnavailable:v13])
  {
    [(RCMainControllerHelper *)self _handleRecordingUnavailableError:v13];
  }
  else
  {
    long long v18 = [(RCMainControllerHelper *)self delegate];
    [v18 captureFailedWithError:v13];
  }
  return v12;
}

- (void)pauseCapturing
{
  id v3 = OSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    double v9 = "-[RCMainControllerHelper pauseCapturing]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s -- Requested pause capturing", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(RCMainControllerHelper *)self audioRecorder];
  id v5 = [(RCMainControllerHelper *)self currentUserActivity];
  [v5 setSubActivityType:4];

  if (v4)
  {
    if ([v4 recording])
    {
      [(RCMainControllerHelper *)self _stopDisplayLink];
      if (([v4 stopRecording] & 1) == 0)
      {
        uint64_t v6 = OSLogForCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10016E3AC(self);
        }
      }
    }
  }
  unsigned int v7 = [(RCMainControllerHelper *)self undoManager];
  [v7 setUndoDisabled:0];
}

- (void)resumeCapturing:(unint64_t)a3
{
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unsigned int v7 = "-[RCMainControllerHelper resumeCapturing:]";
    __int16 v8 = 2048;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Requested resume capture on track %lu", (uint8_t *)&v6, 0x16u);
  }

  [(RCMainControllerHelper *)self _beginOrResumeCaptureSessionWithReplace:0 trackIndex:a3];
}

- (void)replaceCapturing:(unint64_t)a3
{
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unsigned int v7 = "-[RCMainControllerHelper replaceCapturing:]";
    __int16 v8 = 2048;
    unint64_t v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Requested replace capture on track %lu", (uint8_t *)&v6, 0x16u);
  }

  [(RCMainControllerHelper *)self _beginOrResumeCaptureSessionWithReplace:1 trackIndex:a3];
}

- (void)stopCapturing
{
  id v8 = [(RCMainControllerHelper *)self audioRecorder];
  id v3 = [(RCMainControllerHelper *)self currentUserActivity];
  if ([v3 activityType] == (id)1 && objc_msgSend(v3, "subActivityType") == (id)4)
  {
    id v4 = [(RCMainControllerHelper *)self currentUserActivity];
    id v5 = [v3 activityType];
    int v6 = [v3 displayModel];
    [v4 transitionToActivityType:v5 subType:5 withDisplayModel:v6];
  }
  if (v8 && [v8 recording] && objc_msgSend(v8, "stopRecording"))
  {
    unsigned int v7 = [(RCMainControllerHelper *)self undoManager];
    [v7 setUndoDisabled:0];
  }
  [(RCMainControllerHelper *)self setDidTrimPlayback:0];
}

- (BOOL)isRecording
{
  v2 = [(RCMainControllerHelper *)self audioRecorder];
  id v3 = v2;
  if (v2)
  {
    if ([v2 preparing]) {
      unsigned __int8 v4 = 1;
    }
    else {
      unsigned __int8 v4 = [v3 recording];
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isPlaying
{
  v2 = [(RCMainControllerHelper *)self audioPlayer];
  id v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 playing];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)isPaused
{
  v2 = [(RCMainControllerHelper *)self audioPlayer];
  id v3 = v2;
  if (v2) {
    unsigned int v4 = [v2 playing] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (id)recordingInProgressUUID
{
  v2 = [(RCMainControllerHelper *)self audioRecorder];
  id v3 = [v2 recordingID];

  return v3;
}

- (void)_beginOrResumeCaptureSessionWithReplace:(BOOL)a3 trackIndex:(unint64_t)a4
{
  int v6 = +[VMAudioService sharedInstance];
  id v36 = 0;
  unsigned int v7 = [v6 isRecordingEnabled:&v36];
  id v8 = v36;
  if (v7)
  {
    uint64_t v9 = [(RCMainControllerHelper *)self audioRecorder];
    if ([(id)v9 shouldWaitForAccessToken])
    {
      uint64_t v10 = OSLogForCategory();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
        sub_10016E43C((os_log_t)v10);
      }
    }
    else
    {
      uint64_t v10 = [(RCMainControllerHelper *)self uuidOfPlayingOrSelectedRecording];
      if (v9 | v10)
      {
        if (!v9)
        {
          uint64_t v9 = [v6 recorderForRecordingID:v10];
          [(RCMainControllerHelper *)self setAudioRecorder:v9];
        }
        id v11 = [(id)v9 recordingID];
        id v20 = [v6 fetchRecording:v11];
        long long v21 = [(RCMainControllerHelper *)self timeController];
        [v21 currentTime];
        [v21 setTargetTime:];
        [(RCMainControllerHelper *)self setTargetTrackIndex:a4];
        [(RCMainControllerHelper *)self setOverdubbing:a4 == 1];
        unsigned int v22 = [v20 composedAssetHasMultipleTracks];
        uint64_t v23 = 0;
        if (!a4 && v22) {
          uint64_t v23 = RCOverdubRecordingIsEnabled() ^ 1;
        }
        [(RCMainControllerHelper *)self setSilencing:v23];
        self->_isResumingOrReplacing = 1;
        if ([(id)v9 startRecording])
        {
          [v20 length];
          if (v24 > 0.0)
          {
            v25 = [(RCMainControllerHelper *)self undoManager];
            editModeUndoTarget = self->_editModeUndoTarget;
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_1000BF438;
            v35[3] = &unk_1002232B0;
            v35[4] = self;
            [v25 registerUndoWithTarget:editModeUndoTarget handler:v35];

            [(RCMainControllerHelper *)self undoManager];
            v27 = v34 = v20;
            v28 = +[NSBundle mainBundle];
            v29 = [v28 localizedStringForKey:@"TITLE_FOR_OVERDUB_UNDO" value:&stru_100228BC8 table:0];
            [v27 setActionName:v29];

            id v20 = v34;
            v30 = [(RCMainControllerHelper *)self delegate];
            [v30 enableUndoFirstResponder];
          }
          objc_super v31 = [(RCMainControllerHelper *)self undoManager];
          [v31 setUndoDisabled:1];

          v32 = [(RCMainControllerHelper *)self currentUserActivity];
          [v32 setSubActivityType:4];

          [(RCMainControllerHelper *)self setUuidOfPlayingRecording:0];
        }
        else
        {
          self->_isResumingOrReplacing = 0;
          v33 = OSLogForCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10016E538(self);
          }
        }
      }
      else
      {
        id v11 = OSLogForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_10016E4C0(v11, v12, v13, v14, v15, v16, v17, v18);
        }
        uint64_t v9 = 0;
      }
    }
  }
  else if ([(RCMainControllerHelper *)self _errorIsRecordingUnavailable:v8])
  {
    [(RCMainControllerHelper *)self _handleRecordingUnavailableError:v8];
  }
  else
  {
    long long v19 = [(RCMainControllerHelper *)self delegate];
    [v19 captureFailedWithError:v8];
  }
}

- (void)_recordingStarted:(id)a3
{
  id v4 = a3;
  id v5 = +[UIApplication sharedApplication];
  unsigned int v6 = [v5 isRunningTest];

  if (v6)
  {
    unsigned int v7 = +[UIApplication sharedApplication];
    id v8 = [v7 delegate];
    [v8 ppt_didStartRecording];
  }
  uint64_t v9 = OSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[RCMainControllerHelper _recordingStarted:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s -- Recording started UI callback", buf, 0xCu);
  }

  uint64_t v10 = +[RCRecordingStartTimeInfo infoWithCurrentDateAndTime];
  [(RCMainControllerHelper *)self currentTime];
  [v10 setRecordingTimeAtStartTime:];
  [(RCMainControllerHelper *)self currentDuration];
  [v10 setRecordingDurationAtStartTime:];
  id v11 = [(RCMainControllerHelper *)self delegate];
  v33 = v10;
  [v11 recordingDidStartWithInfo:v10];

  uint64_t v12 = [v4 recordingID];
  objc_super v31 = +[VMAudioService sharedInstance];
  uint64_t v13 = [v31 fetchRecording:v12];
  if (v13) {
    [(RCMainControllerHelper *)self _addRecordingObservations:v13];
  }
  uint64_t v14 = [v13 title];
  uint64_t v15 = [v13 creationDate];
  if (self->_isResumingOrReplacing) {
    [v13 length];
  }
  else {
    double v16 = 0.0;
  }
  BYTE2(v28) = 0;
  LOWORD(v28) = 0;
  v30 = (void *)v14;
  uint64_t v17 = +[RCRecordingDisplayModel recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:](RCRecordingDisplayModel, "recordingDisplayModelWithTitle:creationDate:duration:UUID:recentlyDeleted:representsDownloadingFile:isFavorite:isEnhanced:hasTranscription:wasManuallyRenamed:", v14, v15, v12, 0, 0, 0, v16, v28);
  [(RCMainControllerHelper *)self setCurrentRecordingDisplayModel:v17];
  v32 = (void *)v12;
  uint64_t v18 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:v12];
  [(RCMainControllerHelper *)self setCurrentComposition:v18];

  v34 = v4;
  long long v19 = [v4 waveformDataSource];
  [v19 addObserver:self];
  [(RCMainControllerHelper *)self setUuidOfPlayingRecording:0];
  if (self->_isResumingOrReplacing) {
    uint64_t v20 = 4;
  }
  else {
    uint64_t v20 = 3;
  }
  long long v21 = [(RCMainControllerHelper *)self currentComposition];
  v29 = (void *)v17;
  [(RCMainControllerHelper *)self _transitionToActivityType:1 toSubType:v20 withDisplayModel:v17 waveformDataSource:v19 composition:v21];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  unsigned int v22 = [(NSHashTable *)self->_timeObservers allObjects];
  id v23 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v27 timeController:self didChangeState:2];
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v24);
  }

  [(RCMainControllerHelper *)self _startDisplayLink];
}

- (void)_recordingStopped:(id)a3
{
  id v4 = a3;
  id v5 = OSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = "-[RCMainControllerHelper _recordingStopped:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -- Recording stopped UI callback", buf, 0xCu);
  }

  unsigned int v6 = [(RCMainControllerHelper *)self delegate];
  [v6 recordingDidEnd];

  unsigned int v7 = [v4 recordingID];
  if (v7
    && ([(RCRecordingsModelInteractor *)self->_recordingsModelInteractor recordingForUUID:v7],
        (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [(RCMainControllerHelper *)self currentUserActivity];
    id v11 = [v10 subActivityType];

    if (v11 == (id)3)
    {
      uint64_t v12 = [(RCMainControllerHelper *)self timeController];
      [v12 setTargetTime:0.0];
    }
    uint64_t v13 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:v7];
    [(RCMainControllerHelper *)self setCurrentComposition:v13];

    [(RCMainControllerHelper *)self _updateWillMigrateFromSingleLayerToMultiLayer];
    v32 = v7;
    [(RCMainControllerHelper *)self _performRecordingEndTransitionWithUUID:v7];
    uint64_t v14 = [(RCMainControllerHelper *)self timeController];
    [v14 currentTime];
    double v16 = v15;

    [v9 length];
    double v18 = v17;
    long long v19 = +[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:v9];
    [(RCMainControllerHelper *)self setCurrentRecordingDisplayModel:v19];

    RCTimeRangeMake();
    double v21 = v20;
    double v23 = v22;
    id v24 = [(RCMainControllerHelper *)self timeController];
    [v24 setAllowedTimeRange:v21, v23];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v25 = [(NSHashTable *)self->_timeObservers allObjects];
    id v26 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v34;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v34 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v30 timeController:self didChangeCurrentTime:v16 didChangeDuration:v18];
          }
          if (objc_opt_respondsToSelector()) {
            [v30 timeController:self didChangeState:0];
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v27);
    }

    [(RCMainControllerHelper *)self _stopDisplayLink];
    unsigned int v7 = v32;
    [(RCMainControllerHelper *)self _preloadRecordingForPlayback:v32];
    objc_super v31 = v9;
  }
  else
  {
    objc_super v31 = OSLogForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10016E5C8();
    }
  }
}

- (void)_recordingFailed:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10016E640();
  }

  if (([v6 recording] & 1) == 0)
  {
    [(RCMainControllerHelper *)self _recordingStopped:v6];
    [(RCMainControllerHelper *)self setAudioRecorder:0];
  }
  uint64_t v9 = [(RCMainControllerHelper *)self delegate];
  [v9 captureFailedWithError:v7];
}

- (BOOL)_errorIsRecordingUnavailable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"VMAudioServiceErrorDomain"]) {
    BOOL v5 = [v3 code] == (id)5;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_handleRecordingUnavailableError:(id)a3
{
  id v4 = a3;
  p_recordingUnavailableAlertController = &self->_recordingUnavailableAlertController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_recordingUnavailableAlertController);

  if (!WeakRetained)
  {
    id v7 = [v4 userInfo];
    uint64_t v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    uint64_t v14 = sub_1000BFE14;
    double v15 = &unk_100221C38;
    double v16 = self;
    id v17 = v4;
    uint64_t v8 = objc_retainBlock(&v12);
    uint64_t v9 = [v7 objectForKeyedSubscript:NSLocalizedFailureReasonErrorKey v12, v13, v14, v15, v16];
    uint64_t v10 = [v7 objectForKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
    id v11 = +[UIAlertController rc_OKAlertControllerWithTitle:v9 message:v10 handler:v8];

    [v11 rc_showInMainWindow];
    objc_storeWeak((id *)p_recordingUnavailableAlertController, v11);
  }
}

- (void)prepareForPlaybackForUUID:(id)a3
{
}

- (void)prepareForPlaybackForUUID:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v26 = a3;
  id v6 = [(RCMainControllerHelper *)self currentComposition];
  id v7 = [v6 savedRecordingUUID];
  unsigned __int8 v8 = [v7 isEqualToString:v26];
  uint64_t v9 = [(RCMainControllerHelper *)self audioPlayer];

  if (v4 || !v9 || (v8 & 1) == 0)
  {
    [(RCMainControllerHelper *)self setUuidOfPlayingRecording:v26];
    uint64_t v10 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:v26];
    [(RCMainControllerHelper *)self setCurrentComposition:v10];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v12 = [WeakRetained waveformViewController];
    waveformViewController = self->_waveformViewController;
    self->_waveformViewController = v12;

    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    double v15 = [v14 overviewWaveformViewController];
    overviewWaveformViewController = self->_overviewWaveformViewController;
    self->_overviewWaveformViewController = v15;

    [(RCAVWaveformViewController *)self->_waveformViewController setActiveTimeController:self];
    [(RCAVWaveformViewController *)self->_overviewWaveformViewController setActiveTimeController:self];
    id v17 = self->_recordingsModelInteractor;
    double v18 = [(RCRecordingsModelInteractor *)v17 recordingForUUID:v7];
    if (v18) {
      [(RCMainControllerHelper *)self _removeRecordingObservations:v18];
    }
    long long v19 = [(RCRecordingsModelInteractor *)v17 recordingForUUID:v26];
    if (v19)
    {
      [(RCMainControllerHelper *)self _addRecordingObservations:v19];
      double v20 = +[RCRecordingDisplayModel recordingDisplayModelWithSavedRecording:v19];
      [(RCMainControllerHelper *)self setCurrentRecordingDisplayModel:v20];

      if ((v8 & 1) == 0)
      {
        [v19 length];
        RCTimeRangeMake();
        double v22 = v21;
        double v24 = v23;
        uint64_t v25 = [(RCMainControllerHelper *)self timeController];
        [v25 setAllowedTimeRange:v22, v24];
      }
    }
    [(RCMainControllerHelper *)self _preloadRecordingForPlayback:v26];
  }
}

- (BOOL)readyForPlayback
{
  id v3 = [(RCMainControllerHelper *)self audioPlayer];
  BOOL v4 = [v3 recordingID];
  if (v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    id v6 = [(RCMainControllerHelper *)self audioRecorder];
    id v7 = [v6 recordingID];
    BOOL v5 = v7 != 0;
  }
  return v5;
}

- (void)playbackForUUID:(id)a3 atPosition:(double)a4
{
  id v5 = a3;
  if ([(RCMainControllerHelper *)self isRecording])
  {
    id v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10016E6B8(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    id v14 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
    unsigned __int8 v15 = [v14 isEqualToString:v5];

    if ((v15 & 1) == 0)
    {
      [(RCMainControllerHelper *)self setUuidOfPlayingRecording:v5];
      [(RCMainControllerHelper *)self prepareForPlaybackForUUID:v5];
    }
    double v16 = [(RCMainControllerHelper *)self timeController];
    [v16 currentTime];
    -[RCMainControllerHelper _startPlaybackOfUUID:atPosition:](self, "_startPlaybackOfUUID:atPosition:", v5);
  }
}

- (void)togglePlayback
{
  id v3 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  [(RCMainControllerHelper *)self toggleForUUID:v3];
}

- (void)toggleForUUID:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[RCMainControllerHelper currentPlayerForUUID:](self, "currentPlayerForUUID:");
  id v5 = v4;
  if (v4)
  {
    if ([v4 playing])
    {
      [(RCMainControllerHelper *)self pauseForUUID:v6];
    }
    else
    {
      [v5 playerTime];
      -[RCMainControllerHelper playbackForUUID:atPosition:](self, "playbackForUUID:atPosition:", v6);
    }
  }
}

- (void)pauseForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(RCMainControllerHelper *)self currentPlayerForUUID:v4];
    [(RCMainControllerHelper *)self _stopPlaybackInAudioPlayer:v7];
  }
  else
  {
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10016E730((uint64_t)v4, self);
    }
  }
}

- (void)stopForUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = [(RCMainControllerHelper *)self currentPlayerForUUID:v4];
    [(RCMainControllerHelper *)self _clearPlaybackInAudioPlayer:v7];
  }
  else
  {
    uint64_t v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10016E7D0((uint64_t)v4, self);
    }
  }
}

- (void)startScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  id v5 = a3;
  if (([(VMAudioPlayer *)self->_audioPlayer playing] & 1) != 0
    || [(VMAudioPlayer *)self->_audioPlayer willPlayPendingPreparation])
  {
    self->_scrubState = 1;
    [(RCMainControllerHelper *)self pauseForUUID:v5];
  }
  else
  {
    self->_scrubState = 2;
  }
}

- (void)updateScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  id v5 = [(RCMainControllerHelper *)self timeController];
  [v5 setTargetTime:a4];
}

- (void)endScrubbingForUUID:(id)a3 atPosition:(double)a4
{
  if (self->_scrubState == 1) {
    [(RCMainControllerHelper *)self playbackForUUID:a3 atPosition:a4];
  }
  self->_scrubState = 0;
}

- (BOOL)canJumpForward
{
  if ([(RCMainControllerHelper *)self isRecording]) {
    goto LABEL_5;
  }
  BOOL v3 = [(RCMainControllerHelper *)self readyForPlayback];
  if (v3)
  {
    [(RCMainControllerHelper *)self currentDuration];
    if (v4 > 0.05)
    {
      [(RCMainControllerHelper *)self currentTime];
      double v6 = v5;
      [(RCMainControllerHelper *)self currentDuration];
      LOBYTE(v3) = v6 < v7;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)jumpForwardForUUID:(id)a3
{
}

- (BOOL)canJumpBackward
{
  if ([(RCMainControllerHelper *)self isRecording]) {
    goto LABEL_5;
  }
  BOOL v3 = [(RCMainControllerHelper *)self readyForPlayback];
  if (v3)
  {
    [(RCMainControllerHelper *)self currentDuration];
    if (v4 > 0.05)
    {
      [(RCMainControllerHelper *)self currentTime];
      LOBYTE(v3) = v5 > 0.0;
      return v3;
    }
LABEL_5:
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)jumpBackwardForUUID:(id)a3
{
}

- (void)_stopForUUIDs:(id)a3
{
  id v4 = a3;
  double v5 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6)
  {
    id v7 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
    [(RCMainControllerHelper *)self stopForUUID:v7];
  }
}

- (void)_preloadRecordingForPlayback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCMainControllerHelper *)self audioPlayer];
  if (!v5) {
    goto LABEL_3;
  }
  unsigned int v6 = (void *)v5;
  id v7 = [(RCMainControllerHelper *)self audioPlayer];
  uint64_t v8 = [v7 recordingID];
  unsigned __int8 v9 = [v8 isEqualToString:v4];

  if ((v9 & 1) == 0)
  {
LABEL_3:
    uint64_t v10 = [(RCMainControllerHelper *)self currentPlayerForUUID:v4];
    if (!v10)
    {
      uint64_t v11 = OSLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_10016E870();
      }
    }
  }
}

- (void)_startPlaybackOfUUID:(id)a3 atPosition:(double)a4
{
  id v6 = a3;
  id v13 = [(RCMainControllerHelper *)self timeController];
  id v7 = [(RCMainControllerHelper *)self currentPlayerForUUID:v6];

  [v13 allowedTimeRange];
  double v9 = v8;
  double v11 = v10;
  [v7 setPlayableRange:];
  if (v11 - a4 >= 0.01) {
    double v12 = a4;
  }
  else {
    double v12 = v9;
  }
  [v13 setTargetTime:v12];
  [v7 startPlaying];
}

- (void)_clearPlaybackInAudioPlayer:(id)a3
{
  [(RCMainControllerHelper *)self _stopPlaybackInAudioPlayer:a3];

  [(RCMainControllerHelper *)self setUuidOfPlayingRecording:0];
}

- (void)_stopPlaybackInAudioPlayer:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v6 = v3;
    unsigned int v5 = [v3 playing];
    id v4 = v6;
    if (v5)
    {
      [v6 stopPlaying];
      id v4 = v6;
    }
  }
}

- (id)currentPlayerForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v5 = [(RCMainControllerHelper *)self audioPlayer];
    id v6 = v5;
    if (v5
      && ([v5 recordingID],
          id v7 = objc_claimAutoreleasedReturnValue(),
          unsigned int v8 = [v4 isEqualToString:v7],
          v7,
          v8))
    {
      id v9 = v6;
    }
    else
    {
      double v10 = +[VMAudioService sharedInstance];
      id v9 = [v10 playerForRecordingID:v4];
      LODWORD(v11) = 1.0;
      [(RCMainControllerHelper *)self setTargetRate:v11];
      double v12 = [(RCMainControllerHelper *)self audioRecorder];
      id v13 = [v12 recordingID];
      unsigned __int8 v14 = [v4 isEqualToString:v13];

      if (v14)
      {
        [(RCMainControllerHelper *)self targetTime];
        [v9 setPlayerTime:];
      }
      else
      {
        [(RCMainControllerHelper *)self setTargetTime:0.0];
      }
      [v9 setController:self];
      [(RCMainControllerHelper *)self setAudioPlayer:v9];
    }
  }
  else
  {
    unsigned __int8 v15 = OSLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10016E8E8(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    id v9 = 0;
  }

  return v9;
}

- (void)_jumpByIncrement:(double)a3 forUUID:(id)a4
{
  id v8 = [(RCMainControllerHelper *)self audioPlayer];
  id v6 = [(RCMainControllerHelper *)self timeController];
  if ([v8 playing]) {
    [v8 playerTime];
  }
  else {
    [v6 currentTime];
  }
  [(RCMainControllerHelper *)self _jumpToTargetTime:v7 + a3];
}

- (void)_jumpToTargetTime:(double)a3
{
  unsigned int v5 = [(RCMainControllerHelper *)self timeController];
  id v6 = [(RCMainControllerHelper *)self audioRecorder];
  double v7 = v6;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (v6
    && objc_msgSend(v6, "recording", v10, v11)
    && [v7 monitorRecordingTime:&v11 duration:&v10])
  {
    RCTimeRangeMake();
  }
  else
  {
    [v5 allowedTimeRange:v10, v11];
  }
  if (v8 <= a3)
  {
    double v8 = a3;
    if (v9 < a3) {
      double v8 = v9;
    }
  }
  [v5 setTargetTime:v8];
  [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
}

- (void)endDescriptionViewTextEditing
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"RecordingDescriptionViewShouldEndEditingNotificationName" object:0];
}

- (void)enterTrimMode
{
  id v3 = [(RCMainControllerHelper *)self audioRecorder];
  if (!v3)
  {
    id v4 = +[VMAudioService sharedInstance];
    unsigned int v5 = [(RCMainControllerHelper *)self uuidOfPlayingOrSelectedRecording];
    id v3 = [v4 recorderForRecordingID:v5];
  }
  if ([v3 recording])
  {
    if ([v3 stopRecording])
    {
      id v6 = +[NSString stringWithUTF8String:"recording"];
      id v8 = v3;
      id v7 = (id)RCObserveChangesToKeyPath();
    }
  }
  else
  {
    [(RCMainControllerHelper *)self _enterTrimMode];
  }
}

- (void)exitTrimMode
{
  [(RCUndoTarget *)self->_trimModeUndoTarget setShouldEnableSave:0];
  id v3 = [(RCMainControllerHelper *)self delegate];
  [(RCMainControllerHelper *)self currentDuration];
  [v3 recordingDurationUpdated:];

  [(RCMainControllerHelper *)self _setIsInSelectionEditingMode:0 forInsertMode:0];
  id v4 = [(RCMainControllerHelper *)self currentUserActivity];
  [v4 setSubActivityType:0];

  unsigned int v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"TRIM_END_ANNOUNCE" value:&stru_100228BC8 table:0];

  dispatch_time_t v7 = dispatch_time(0, 800000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0F0C;
  block[3] = &unk_100221278;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cancelTrimModeWithDismissal:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(RCUndoTarget *)self->_trimModeUndoTarget sizeOfUndoStack] >= 1)
  {
    unsigned int v5 = [(RCMainControllerHelper *)self audioRecorder];
    if ([v5 restoreMarkedVersion])
    {
      [(RCMainControllerHelper *)self _reloadWaveformDataSourceAndPreviewAssetWithInitialTime:0.0];
      [(RCMainControllerHelper *)self _clearTrimModeUndoStack];
      id v6 = [(RCMainControllerHelper *)self timeController];
      [v6 setTargetTime:0.0];
    }
    else
    {
      id v6 = OSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10016E960(self);
      }
    }
  }
  if (v3) {
    [(RCMainControllerHelper *)self exitTrimMode];
  }
}

- (void)doneButtonShouldSaveAsNew:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(RCMainControllerHelper *)self audioRecorder];
  unsigned int v6 = [v5 isNewRecording];

  [(RCMainControllerHelper *)self setShouldSaveAsNew:v3 & (v6 ^ 1)];
}

- (void)exitEditMode
{
  BOOL v3 = [(RCMainControllerHelper *)self undoManager];
  [v3 removeAllActionsWithTarget:self->_editModeUndoTarget];

  [(RCUndoTarget *)self->_editModeUndoTarget setSizeOfUndoStack:0];
  [(RCMainControllerHelper *)self _clearTrimModeUndoStack];
  id v4 = [(RCMainControllerHelper *)self audioRecorder];
  +[CATransaction setFrameStallSkipRequest:1];
  if (v4)
  {
    [v4 finishEditing:[self shouldSaveAsNew]];
    [(RCMainControllerHelper *)self setAudioRecorder:0];
  }
}

- (void)performTrimByKeepingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4
{
  id v5 = a3;
  [(RCMainControllerHelper *)self _selectedTimeRange];
  double v7 = v6;
  double v9 = v8;
  if (-[RCMainControllerHelper _isSelectionTrimmableByKeepingRange:](self, "_isSelectionTrimmableByKeepingRange:"))
  {
    id v10 = +[VMAudioService sharedInstance];
    uint64_t v11 = [(RCMainControllerHelper *)self audioRecorder];
    double v12 = v11;
    if (!v11
      || ([v11 recordingID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v5 isEqualToString:v13],
          v13,
          (v14 & 1) == 0))
    {
      uint64_t v15 = [v10 recorderForRecordingID:v5];

      [(RCMainControllerHelper *)self setAudioRecorder:v15];
      double v12 = (void *)v15;
    }
    [(RCMainControllerHelper *)self _markCurrentFileVersionIfNecessary];
    id v23 = 0;
    unsigned int v16 = [v12 trimRecording:&v23 error:v7, v9];
    id v17 = v23;
    if (v16)
    {
      [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v5];
      uint64_t v18 = [(RCMainControllerHelper *)self delegate];
      [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:1];
      uint64_t v19 = [v18 undoManager];
      trimModeUndoTarget = self->_trimModeUndoTarget;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000C1330;
      v22[3] = &unk_1002232B0;
      v22[4] = self;
      [v19 registerUndoWithTarget:trimModeUndoTarget handler:v22];
      uint64_t v21 = [(RCMainControllerHelper *)self _undoActionNameForTrimMode:0 isUndo:1];
      [v19 setActionName:v21];

      [v18 enableUndoFirstResponder];
    }
    else
    {
      uint64_t v18 = OSLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10016E9F0();
      }
    }
  }
  else
  {
    [(RCMainControllerHelper *)self _cancelTrim];
  }
}

- (void)performTrimByDeletingSelectedRangeForRecordingWithUUID:(id)a3 source:(id)a4
{
  id v5 = a3;
  [(RCMainControllerHelper *)self _selectedTimeRange];
  double v7 = v6;
  double v9 = v8;
  if (-[RCMainControllerHelper _isSelectionTrimmableByDeletingRange:](self, "_isSelectionTrimmableByDeletingRange:"))
  {
    id v10 = +[VMAudioService sharedInstance];
    uint64_t v11 = [(RCMainControllerHelper *)self audioRecorder];
    double v12 = v11;
    if (!v11
      || ([v11 recordingID],
          id v13 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v14 = [v5 isEqualToString:v13],
          v13,
          (v14 & 1) == 0))
    {
      uint64_t v15 = [v10 recorderForRecordingID:v5];

      [(RCMainControllerHelper *)self setAudioRecorder:v15];
      double v12 = (void *)v15;
    }
    [(RCMainControllerHelper *)self _markCurrentFileVersionIfNecessary];
    id v23 = 0;
    unsigned int v16 = [v12 cutRecording:&v23 error:v7, v9];
    id v17 = v23;
    if (v16)
    {
      [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v5];
      uint64_t v18 = [(RCMainControllerHelper *)self delegate];
      [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:1];
      uint64_t v19 = [v18 undoManager];
      trimModeUndoTarget = self->_trimModeUndoTarget;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1000C156C;
      v22[3] = &unk_1002232B0;
      v22[4] = self;
      [v19 registerUndoWithTarget:trimModeUndoTarget handler:v22];
      uint64_t v21 = [(RCMainControllerHelper *)self _undoActionNameForTrimMode:1 isUndo:1];
      [v19 setActionName:v21];

      [v18 enableUndoFirstResponder];
    }
    else
    {
      uint64_t v18 = OSLogForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10016EA68();
      }
    }
  }
  else
  {
    [(RCMainControllerHelper *)self _cancelTrim];
  }
}

- (void)openForModifyRecordingWithUUID:(id)a3 withSubActivityType:(int64_t)a4
{
  id v12 = a3;
  double v6 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:](RCRecordingDisplayModel, "recordingDisplayModelForUUID:");
  double v7 = v6;
  if (v6 && ([v6 recentlyDeleted] & 1) == 0)
  {
    double v8 = +[VMAudioService sharedInstance];
    double v9 = [v8 recorderForRecordingID:v12];
    [(RCMainControllerHelper *)self setAudioRecorder:v9];
    id v10 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:v12];
    [(RCMainControllerHelper *)self setCurrentComposition:v10];

    uint64_t v11 = [(RCMainControllerHelper *)self currentComposition];
    [(RCMainControllerHelper *)self _transitionToActivityType:3 toSubType:a4 withDisplayModel:v7 waveformDataSource:0 composition:v11];
  }
}

- (void)_enterTrimMode
{
  [(RCMainControllerHelper *)self _setIsInSelectionEditingMode:1 forInsertMode:0];
  BOOL v3 = [(RCMainControllerHelper *)self currentUserActivity];
  [v3 setSubActivityType:2];

  [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:0];
}

- (void)_cancelTrim
{
}

- (void)_resetSelectedTimeRangeToFullDuration
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [WeakRetained waveformViewController];
  [v5 resetSelectedTimeRangeToFullDuration];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  double v7 = [v6 overviewWaveformViewController];
  [v7 resetSelectedTimeRangeToFullDuration];

  id v14 = objc_loadWeakRetained((id *)p_delegate);
  double v8 = [v14 waveformViewController];
  [v8 selectedTimeRange];
  double v10 = v9;
  double v12 = v11;
  id v13 = [(RCMainControllerHelper *)self timeController];
  [v13 setAllowedTimeRange:v10, v12];
}

- (void)_setIsInSelectionEditingMode:(BOOL)a3 forInsertMode:(BOOL)a4
{
  int v5 = byte_100275330;
  if (byte_100275330 != a3)
  {
    byte_100275330 = a3;
    if (a3) {
      [(RCMainControllerHelper *)self _beginSelectionEditingModeForInsertMode:a4];
    }
    else {
      [(RCMainControllerHelper *)self _endSelectionEditingMode];
    }
    int v5 = byte_100275330;
  }
  if (v5)
  {
    [(RCMainControllerHelper *)self _resetSelectedTimeRangeToFullDuration];
  }
}

- (void)_endSelectionEditingMode
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v5 = [WeakRetained waveformViewController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  id v7 = objc_loadWeakRetained((id *)p_delegate);
  double v8 = [v7 overviewWaveformViewController];
  overviewWaveformViewController = self->_overviewWaveformViewController;
  self->_overviewWaveformViewController = v8;

  double v10 = self->_waveformViewController;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C1930;
  v11[3] = &unk_100221278;
  v11[4] = self;
  [(RCAVWaveformViewController *)v10 hidSelectionOverlayWithCompletionBlock:v11];
  [(RCAVWaveformViewController *)self->_overviewWaveformViewController hidSelectionOverlayWithCompletionBlock:&stru_1002232D0];
  [(RCMainControllerHelper *)self pauseCapturing];
}

- (void)_beginSelectionEditingModeForInsertMode:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [WeakRetained waveformViewController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v7;

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  double v10 = [v9 overviewWaveformViewController];
  overviewWaveformViewController = self->_overviewWaveformViewController;
  self->_overviewWaveformViewController = v10;

  [(RCAVWaveformViewController *)self->_waveformViewController showSelectionOverlayAndEnableInsertMode:v3];
  double v12 = self->_overviewWaveformViewController;

  [(RCAVWaveformViewController *)v12 showSelectionOverlayAndEnableInsertMode:v3];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_selectedTimeRange
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained waveformViewController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v4;

  id v6 = self->_waveformViewController;

  [(RCAVWaveformViewController *)v6 selectedTimeRange];
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (void)_refreshAfterEditingOperation:(id)a3
{
  id v4 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:a3];
  [(RCMainControllerHelper *)self setCurrentComposition:v4];

  [(RCMainControllerHelper *)self _updateWillMigrateFromSingleLayerToMultiLayer];
  [(RCAVWaveformViewController *)self->_waveformViewController nextPreviewStartTime];
  -[RCMainControllerHelper _reloadWaveformDataSourceAndPreviewAssetWithInitialTime:](self, "_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:");

  [(RCMainControllerHelper *)self _resetSelectedTimeRangeToFullDuration];
}

- (void)_markCurrentFileVersionIfNecessary
{
  if (![(RCUndoTarget *)self->_trimModeUndoTarget sizeOfUndoStack])
  {
    id v3 = [(RCMainControllerHelper *)self audioRecorder];
    [v3 markCurrentVersion];
  }
}

- (BOOL)_isSelectionTrimmableByKeepingRange:(id)a3
{
  RCTimeRangeDeltaWithUIPrecision();
  double v5 = v4;
  if (v4 < 1.0) {
    return 0;
  }
  [(RCMainControllerHelper *)self currentDuration];
  return v7 - v5 > 0.05;
}

- (BOOL)_isSelectionTrimmableByDeletingRange:(id)a3
{
  RCTimeRangeDeltaWithUIPrecision();
  double v5 = v4;
  if (v4 <= 0.05) {
    return 0;
  }
  [(RCMainControllerHelper *)self currentDuration];
  return v6 - v5 >= 1.0;
}

- (void)_reloadWaveformDataSourceAndPreviewAssetWithInitialTime:(double)a3
{
  double v5 = [(RCMainControllerHelper *)self currentComposition];
  [v5 composedDuration];
  double v7 = v6;

  if (v7 <= a3) {
    a3 = v7;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = [(RCMainControllerHelper *)self currentComposition];
  [WeakRetained reloadWaveformsFromComposition:v9];

  id v10 = [(RCMainControllerHelper *)self timeController];
  [v10 setTargetTime:a3];
}

- (void)setFavorite:(BOOL)a3 forRecordingWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  id v6 = a4;
  double v7 = +[NSArray arrayWithObjects:&v8 count:1];

  -[RCMainControllerHelper setFavorite:forRecordingsWithUUIDs:](self, "setFavorite:forRecordingsWithUUIDs:", v4, v7, v8);
}

- (void)setFavorite:(BOOL)a3 forRecordingsWithUUIDs:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(RCMainControllerHelper *)self endDescriptionViewTextEditing];
  id v7 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor setFavorite:v4 forUUIDs:v6];

  [(RCMainControllerHelper *)self _registerUndoForSetFavorite:v4 changedUUIDs:v7];
}

- (void)_registerUndoForSetFavorite:(BOOL)a3 changedUUIDs:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RCMainControllerHelper *)self undoManager];
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_1000C1F94;
  uint64_t v22 = &unk_1002232F8;
  BOOL v24 = v4;
  id v8 = v6;
  id v23 = v8;
  [v7 registerUndoWithTarget:self handler:&v19];
  LODWORD(self) = [v7 isUndoing:v19, v20, v21, v22];
  id v9 = +[NSBundle mainBundle];
  id v10 = v9;
  if (self) {
    CFStringRef v11 = @"REMOVE_FROM_FAVORITES";
  }
  else {
    CFStringRef v11 = @"ADD_TO_FAVORITES";
  }
  double v12 = [v9 localizedStringForKey:v11 value:&stru_100228BC8 table:0];

  unsigned int v13 = [v7 isUndoing];
  id v14 = +[NSBundle mainBundle];
  uint64_t v15 = v14;
  if (v13) {
    CFStringRef v16 = @"ADD_TO_FAVORITES";
  }
  else {
    CFStringRef v16 = @"REMOVE_FROM_FAVORITES";
  }
  id v17 = [v14 localizedStringForKey:v16 value:&stru_100228BC8 table:0];

  if (v4) {
    uint64_t v18 = v12;
  }
  else {
    uint64_t v18 = v17;
  }
  [v7 setActionName:v18];
}

- (BOOL)isFavoriteForUUID:(id)a3
{
  return [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor isFavoriteForUUID:a3];
}

- (void)toggleFavoriteForUUID:(id)a3
{
  id v4 = a3;
  [(RCMainControllerHelper *)self setFavorite:[(RCMainControllerHelper *)self isFavoriteForUUID:v4] ^ 1 forRecordingWithUUID:v4];
}

- (id)compositionForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(RCMainControllerHelper *)self currentComposition];
    id v6 = [v5 savedRecordingUUID];
    unsigned int v7 = [v6 isEqualToString:v4];

    if (v7)
    {
      id v8 = v5;
    }
    else
    {
      id v8 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor compositionLoadedForSavedRecordingUUID:v4];
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)playbackSettingsForUUID:(id)a3
{
  id v4 = a3;
  double v5 = [(RCRecordingDisplayModel *)self->_currentRecordingDisplayModel UUID];
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    unsigned int v7 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor recordingForUUID:v4];
    id v8 = [v7 enhanced];
    id v9 = [v7 silenceRemoverEnabled];
    [v7 playbackRate];
    int v11 = v10;
    [v7 layerMix];
    int v13 = v12;
    id v14 = [(RCMainControllerHelper *)self currentComposition];
    id v15 = [v14 hasMultipleTracks];

    CFStringRef v16 = [RCPlaybackSettings alloc];
    LODWORD(v17) = v11;
    LODWORD(v18) = v13;
    uint64_t v19 = [(RCPlaybackSettings *)v16 initWithUUID:v4 enhanced:v8 silenceRemoved:v9 playbackSpeed:v15 layerMix:v17 hasMultipleTracks:v18];
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (BOOL)isSilenceRemovedForUUID:(id)a3
{
  id v4 = a3;
  double v5 = [(RCMainControllerHelper *)self audioPlayer];
  unsigned int v6 = [v5 recordingID];

  if ([v4 isEqualToString:v6])
  {
    unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
    unsigned __int8 v8 = [v7 silenceRemoverEnabled];
  }
  else
  {
    id v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10016EAE0();
    }

    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (double)playbackSpeedForUUID:(id)a3
{
  id v4 = a3;
  double v5 = [(RCMainControllerHelper *)self audioPlayer];
  unsigned int v6 = [v5 recordingID];

  if ([v4 isEqualToString:v6])
  {
    unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
    [v7 rate];
    double v9 = v8;
  }
  else
  {
    int v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10016EB54();
    }

    double v9 = 1.0;
  }

  return v9;
}

- (double)layerMixForUUID:(id)a3
{
  id v4 = a3;
  double v5 = [(RCMainControllerHelper *)self audioPlayer];
  unsigned int v6 = [v5 recordingID];

  if ([v4 isEqualToString:v6])
  {
    unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
    [v7 layerMix];
    double v9 = v8;
  }
  else
  {
    int v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10016EBC8();
    }

    double v9 = 0.0;
  }

  return v9;
}

- (void)setRemoveSilence:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
  float v8 = [v7 recordingID];

  if ([v6 isEqualToString:v8])
  {
    double v9 = [(RCMainControllerHelper *)self audioPlayer];
    [v9 setSilenceRemoverEnabled:v4];

    [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
  }
  else
  {
    int v10 = OSLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10016EC3C();
    }
  }
}

- (void)setPlaybackSpeed:(double)a3 forUUID:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
  float v8 = [v7 recordingID];

  if ([v6 isEqualToString:v8])
  {
    int v10 = [(RCMainControllerHelper *)self audioPlayer];
    float v9 = a3;
    *(float *)&double v11 = v9;
    [v10 setRate:v11];

    [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
  }
  else
  {
    int v12 = OSLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10016ECB0();
    }
  }
}

- (void)setLayerMix:(double)a3 forUUID:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
  float v8 = [v7 recordingID];

  if ([v6 isEqualToString:v8])
  {
    +[RCApplicationModel sharedApplicationModel];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000C2770;
    v13[3] = &unk_100223320;
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = v6;
    double v16 = a3;
    float v9 = v14;
    [v9 performBlockAndWait:v13];
    double v11 = [(RCMainControllerHelper *)self audioPlayer];
    float v10 = a3;
    *(float *)&double v12 = v10;
    [v11 setLayerMix:v12];

    [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
  }
  else
  {
    float v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10016ED24();
    }
  }
}

- (void)setLooping:(BOOL)a3 forUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(RCMainControllerHelper *)self audioPlayer];
  float v8 = [v7 recordingID];
  if ([v6 isEqualToString:v8])
  {
    [v7 setLooping:v4];
  }
  else
  {
    float v9 = OSLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10016ED98();
    }
  }
}

- (void)shareRecordingsWithUUIDs:(id)a3 inViewController:(id)a4 source:(id)a5 isShareButton:(BOOL)a6 completionWithItemsHandler:(id)a7
{
  id v24 = a4;
  id v11 = a5;
  id v12 = a7;
  int v13 = self->_recordingsModelInteractor;
  id v14 = [(RCRecordingsModelInteractor *)v13 recordingsForUUIDs:a3];
  id v15 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v16 = v14;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = +[RCComposition compositionLoadedForSavedRecording:*(void *)(*((void *)&v25 + 1) + 8 * (void)v20)];
        [v15 addObject:v21];

        uint64_t v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  LOBYTE(v22) = a6;
  +[RCShareMemoViewController presentInViewController:v24 source:v11 compositions:v15 ignoringInteraction:1 shouldContinuePreparingBlock:0 preparedToPresentBlock:0 isShareButton:v22 completionWithItemsHandler:v12];
}

- (id)eraseAndConfirmWithUUIDs:(id)a3 source:(id)a4 collectionViewController:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 count];
  id v12 = +[NSBundle mainBundle];
  int v13 = [v12 localizedStringForKey:@"ERASE_RECORDINGS" value:&stru_100228BC8 table:0];
  id v14 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v11);

  id v15 = v14;
  id v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"DELETE_FOREVER" value:&stru_100228BC8 table:0];

  id v18 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v19 = [v18 presentsRecoverConfirmationAsAlert];

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000C2C84;
  v25[3] = &unk_100223348;
  id v26 = v9;
  long long v27 = self;
  id v28 = v8;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000C2CC8;
  v24[3] = &unk_1002220E8;
  v24[4] = self;
  id v20 = v8;
  id v21 = v9;
  uint64_t v22 = [(RCMainControllerHelper *)self _alertControllerWithTitle:v15 message:0 isDestructive:1 preferredStyle:v19 source:v10 handler:v25 actionTitle:v17 cancelHandler:v24];

  return v22;
}

- (id)eraseAllRecordingsAndConfirmWithSource:(id)a3
{
  id v4 = a3;
  double v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v6 = [v5 presentsRecoverConfirmationAsAlert];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"ERASE_ALL_MEMOS_CONFIRMATION_ALERT_TITLE" value:&stru_100228BC8 table:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000C2E40;
  v13[3] = &unk_1002220E8;
  void v13[4] = self;
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"DELETE_FOREVER" value:&stru_100228BC8 table:0];
  id v11 = [(RCMainControllerHelper *)self _alertControllerWithTitle:v8 message:0 isDestructive:1 preferredStyle:v6 source:v4 handler:v13 actionTitle:v10 cancelHandler:0];

  return v11;
}

- (void)_eraseRecordingsWithUUIDs:(id)a3
{
  id v4 = a3;
  [(RCMainControllerHelper *)self _stopForUUIDs:v4];
  [(RCMainControllerHelper *)self _removeRecordingsObservationsForUUIDs:v4];
  [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor eraseRecordingsWithUUIDs:v4];
  double v5 = [(RCMainControllerHelper *)self delegate];
  [v5 userDidEraseRecordingsWithUUIDs:v4];

  id v7 = [(RCMainControllerHelper *)self delegate];
  unsigned int v6 = [v7 undoManager];
  [v6 removeAllActionsWithTarget:self];
}

- (id)deleteWithUUIDs:(id)a3 source:(id)a4 showInfo:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [(RCMainControllerHelper *)self _deleteRecordingsWithUUIDs:v7 isRecover:0];
  id v8 = +[NSUserDefaults sharedSettingsUserDefaults];
  id v9 = v8;
  id v10 = 0;
  if (v5)
  {
    if (v8)
    {
      uint64_t v11 = [v8 rc_recentlyDeletedWindow];
      unsigned __int8 v12 = [v9 rc_deletionIsImmediate];
      int v13 = +[NSUserDefaults standardUserDefaults];
      unsigned __int8 v14 = [v13 BOOLForKey:@"kRCDeleteInformationAlertAlreadyShownKey"];

      id v10 = 0;
      if ((v12 & 1) == 0 && (v14 & 1) == 0)
      {
        id v15 = [v7 count];
        id v16 = +[NSBundle mainBundle];
        id v17 = v16;
        if (v15 == (id)1) {
          CFStringRef v18 = @"DELETE_MEMO_INFORMATION_ALERT_ONE";
        }
        else {
          CFStringRef v18 = @"DELETE_MEMO_INFORMATION_ALERT_MULTIPLE";
        }
        unsigned int v19 = [v16 localizedStringForKey:v18 value:&stru_100228BC8 table:0];

        id v20 = 0;
        if (v11 > 6)
        {
          if (v11 == 7)
          {
            id v21 = +[NSBundle mainBundle];
            uint64_t v22 = v21;
            CFStringRef v23 = @"DELETE_MEMO_INFORMATION_ALERT_MESSAGE_SEVEN_DAYS";
            goto LABEL_17;
          }
          if (v11 == 30)
          {
            id v21 = +[NSBundle mainBundle];
            uint64_t v22 = v21;
            CFStringRef v23 = @"DELETE_MEMO_INFORMATION_ALERT_MESSAGE_THIRTY_DAYS";
            goto LABEL_17;
          }
        }
        else
        {
          if (v11 == -1)
          {
            id v21 = +[NSBundle mainBundle];
            uint64_t v22 = v21;
            CFStringRef v23 = @"DELETE_MEMO_INFORMATION_ALERT_MESSAGE_FOREVER";
            goto LABEL_17;
          }
          if (v11 == 1)
          {
            id v21 = +[NSBundle mainBundle];
            uint64_t v22 = v21;
            CFStringRef v23 = @"DELETE_MEMO_INFORMATION_ALERT_MESSAGE_ONE_DAY";
LABEL_17:
            id v20 = [v21 localizedStringForKey:v23 value:&stru_100228BC8 table:0];
          }
        }
        id v10 = +[UIAlertController alertControllerWithTitle:v19 message:v20 preferredStyle:1];
        id v24 = +[NSBundle mainBundle];
        long long v25 = [v24 localizedStringForKey:@"OK" value:&stru_100228BC8 table:0];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1000C31D8;
        v28[3] = &unk_1002220E8;
        v29 = @"kRCDeleteInformationAlertAlreadyShownKey";
        id v26 = +[UIAlertAction actionWithTitle:v25 style:0 handler:v28];
        [v10 addAction:v26];
      }
    }
  }

  return v10;
}

- (void)performClearAllRecentlyDeleted
{
  [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor eraseAllDeleted];
  id v3 = [(RCMainControllerHelper *)self delegate];
  id v4 = [v3 undoManager];

  [v4 removeAllActionsWithTarget:self];
}

- (id)restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 force:(BOOL)a6 collectionViewController:(id)a7
{
  if (a6)
  {
    -[RCMainControllerHelper _restoreRecordingsWithUUIDs:isRecover:](self, "_restoreRecordingsWithUUIDs:isRecover:", a3, a4, a5, a6, a7);
    id v7 = 0;
  }
  else
  {
    id v7 = [(RCMainControllerHelper *)self _restoreRecordingsWithUUIDs:a3 isRecover:a4 source:a5 collectionViewController:a7];
  }

  return v7;
}

- (void)deleteRecordingCanceled
{
  id v2 = [(RCMainControllerHelper *)self delegate];
  [v2 userDidCancelDeleteRecording];
}

- (void)_deleteRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[NSUserDefaults sharedSettingsUserDefaults];
  id v8 = v7;
  if (v7 && objc_msgSend(v7, "rc_deletionIsImmediate"))
  {
    [(RCMainControllerHelper *)self _stopForUUIDs:v6];
    [(RCMainControllerHelper *)self _removeRecordingsObservationsForUUIDs:v6];
    [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor eraseRecordingsWithUUIDs:v6];
    id v9 = [(RCMainControllerHelper *)self delegate];
    [v9 userDidEraseRecordingsWithUUIDs:v6];
  }
  else
  {
    [(RCMainControllerHelper *)self _stopForUUIDs:v6];
    [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor deleteRecordingsWithUUIDs:v6];
    id v10 = [(RCMainControllerHelper *)self delegate];
    [v10 userDidDeleteRecordingsWithUUIDs:v6];

    uint64_t v11 = [(RCMainControllerHelper *)self delegate];
    unsigned __int8 v12 = [v11 undoManager];

    id v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    unsigned int v19 = sub_1000C34F0;
    id v20 = &unk_100223370;
    id v21 = v6;
    BOOL v22 = v4;
    [v12 registerUndoWithTarget:self handler:&v17];
    int v13 = +[NSBundle mainBundle];
    unsigned __int8 v14 = v13;
    if (v4) {
      CFStringRef v15 = @"RECOVER_RECORDING_ACTION";
    }
    else {
      CFStringRef v15 = @"DELETE_RECORDING_ACTION";
    }
    id v16 = [v13 localizedStringForKey:v15 value:&stru_100228BC8 table:0];

    [v12 setActionName:v16];
  }
}

- (void)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor restoreRecordingsWithUUIDs:a3];
  id v7 = [(RCMainControllerHelper *)self delegate];
  [v7 userDidRecoverRecordingsWithUUIDs:v6];

  if ([v6 count])
  {
    id v8 = [(RCMainControllerHelper *)self delegate];
    id v9 = [v8 undoManager];

    unsigned __int8 v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    id v16 = sub_1000C3684;
    id v17 = &unk_100223370;
    id v18 = v6;
    BOOL v19 = v4;
    [v9 registerUndoWithTarget:self handler:&v14];
    id v10 = +[NSBundle mainBundle];
    uint64_t v11 = v10;
    if (v4) {
      CFStringRef v12 = @"RECOVER_RECORDING_ACTION";
    }
    else {
      CFStringRef v12 = @"DELETE_RECORDING_ACTION";
    }
    int v13 = [v10 localizedStringForKey:v12 value:&stru_100228BC8 table:0];

    [v9 setActionName:v13];
  }
}

- (id)_restoreRecordingsWithUUIDs:(id)a3 isRecover:(BOOL)a4 source:(id)a5 collectionViewController:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = [v10 count];
  unsigned __int8 v14 = +[NSBundle mainBundle];
  uint64_t v15 = v14;
  if (v8) {
    CFStringRef v16 = @"Recover %lu Recordings";
  }
  else {
    CFStringRef v16 = @"Permanently Delete %lu Recordings";
  }
  id v17 = [v14 localizedStringForKey:v16 value:&stru_100228BC8 table:0];
  id v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v13);

  BOOL v19 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned int v20 = [v19 presentsRecoverConfirmationAsAlert];

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C3860;
  v26[3] = &unk_100223398;
  BOOL v21 = !v8;
  id v27 = v11;
  id v28 = self;
  id v29 = v10;
  BOOL v30 = v8;
  id v22 = v10;
  id v23 = v11;
  id v24 = [(RCMainControllerHelper *)self _alertControllerWithTitle:0 message:0 isDestructive:v21 preferredStyle:v20 source:v12 handler:v26 actionTitle:v18 cancelHandler:0];

  return v24;
}

- (id)deleteFolder:(id)a3 source:(id)a4 completionBlock:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  recordingsModelInteractor = self->_recordingsModelInteractor;
  id v11 = a3;
  if ([(RCRecordingsModelInteractor *)recordingsModelInteractor playableCountForFolder:v11])
  {
    id v12 = [(RCMainControllerHelper *)self _presentFolderDeletionConfirmationForFolder:v11 source:v8 completionBlock:v9];
  }
  else
  {
    [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor deleteUserFolder:v11];

    if (v9) {
      v9[2](v9, 1);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)_presentFolderDeletionConfirmationForFolder:(id)a3 source:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor playableCountForFolder:v8];
  if (v11)
  {
    unint64_t v12 = v11;
    id v13 = +[NSUserDefaults sharedSettingsUserDefaults];
    id v26 = v13;
    if (v13 && objc_msgSend(v13, "rc_deletionIsImmediate"))
    {
      unsigned __int8 v14 = +[NSBundle mainBundle];
      uint64_t v15 = [v14 localizedStringForKey:@"DELETE_FOLDER_TITLE_PERMANENT" value:&stru_100228BC8 table:0];

      CFStringRef v16 = +[NSBundle mainBundle];
      id v17 = v16;
      CFStringRef v18 = @"ERASE_FOLDER_IMMEDIATE";
    }
    else
    {
      BOOL v19 = +[NSBundle mainBundle];
      uint64_t v15 = [v19 localizedStringForKey:@"DELETE_FOLDER_TITLE" value:&stru_100228BC8 table:0];

      CFStringRef v16 = +[NSBundle mainBundle];
      id v17 = v16;
      CFStringRef v18 = @"ERASE_FOLDER";
    }
    unsigned int v20 = [v16 localizedStringForKey:v18 value:&stru_100228BC8 table:0];
    BOOL v21 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v12);

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000C3C68;
    v29[3] = &unk_1002233C0;
    v29[4] = self;
    id v30 = v8;
    id v31 = v10;
    id v22 = +[NSBundle mainBundle];
    id v23 = [v22 localizedStringForKey:@"OK" value:&stru_100228BC8 table:0];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000C3CC4;
    v27[3] = &unk_1002225D8;
    id v28 = v31;
    id v24 = [(RCMainControllerHelper *)self _alertControllerWithTitle:v15 message:v21 isDestructive:1 preferredStyle:1 source:v9 handler:v29 actionTitle:v23 cancelHandler:v27];
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (void)_addCommandTarget:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v6 = [v7 addTargetWithHandler:a4];
  if (v6) {
    [(NSMapTable *)self->_commandTargets setObject:v6 forKey:v7];
  }
}

- (void)_updateRemoteControlState:(int64_t)a3
{
  if (self->_remoteControlState != a3)
  {
    self->_remoteControlState = a3;
    [(RCMainControllerHelper *)self _teardownRemoteControlCommands];
    if (a3)
    {
      BOOL v5 = +[NSMapTable weakToStrongObjectsMapTable];
      commandTargets = self->_commandTargets;
      self->_commandTargets = v5;

      if (a3 == 2)
      {
        [(RCMainControllerHelper *)self __setupRemoteControlCommandsForRecordingForeground];
      }
      else if (a3 == 1)
      {
        [(RCMainControllerHelper *)self __setupRemoteControlCommandsForPlayback];
      }
    }
  }
}

- (void)_updateNowPlayingInfo
{
  [(NSTimer *)self->_nowPlayingUpdateTimer invalidate];
  id v3 = +[MPNowPlayingInfoCenter defaultCenter];
  BOOL v4 = [(RCMainControllerHelper *)self currentRecordingDisplayModel];
  uint64_t v5 = [v4 title];
  id v6 = (void *)v5;
  if (!v4 || !self->_remoteControlState || !v5)
  {
    [v3 setNowPlayingInfo:0];
    [v3 setPlaybackState:0];
    goto LABEL_19;
  }
  id v7 = [(RCMainControllerHelper *)self audioPlayer];
  id v8 = [(RCMainControllerHelper *)self timeController];
  int64_t remoteControlState = self->_remoteControlState;
  double v10 = 1.0;
  double v11 = 0.0;
  double v12 = 3.40282347e38;
  if (remoteControlState == 2)
  {
    uint64_t v15 = 1;
  }
  else
  {
    if (remoteControlState != 1) {
      goto LABEL_15;
    }
    [v4 duration];
    double v12 = v13;
    if ([v7 playing]) {
      [v7 playerTime];
    }
    else {
      [v8 currentTime];
    }
    double v11 = v14;
    [v7 rate];
    double v10 = v16;
    if ([v7 playing]) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
  }
  [v3 setPlaybackState:v15];
LABEL_15:
  v22[0] = v6;
  v21[0] = MPMediaItemPropertyTitle;
  v21[1] = MPMediaItemPropertyPlaybackDuration;
  id v17 = +[NSNumber numberWithDouble:v12];
  v22[1] = v17;
  v22[2] = &off_10022D7F0;
  v21[2] = MPNowPlayingInfoPropertyMediaType;
  v21[3] = MPNowPlayingInfoPropertyElapsedPlaybackTime;
  CFStringRef v18 = +[NSNumber numberWithDouble:v11];
  v22[3] = v18;
  v21[4] = MPNowPlayingInfoPropertyPlaybackRate;
  BOOL v19 = +[NSNumber numberWithDouble:v10];
  v22[4] = v19;
  unsigned int v20 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  [v3 setNowPlayingInfo:v20];

  if ([v7 playing] && objc_msgSend(v7, "silenceRemoverEnabled")) {
    [(RCMainControllerHelper *)self _startNowPlayingUpdateTimerWithPlaybackTime:v11 playbackRate:v10];
  }

LABEL_19:
}

- (void)_startNowPlayingUpdateTimerWithPlaybackTime:(double)a3 playbackRate:(double)a4
{
  [(NSTimer *)self->_nowPlayingUpdateTimer invalidate];
  id v7 = +[NSDate date];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C41D4;
  v11[3] = &unk_1002233E8;
  objc_copyWeak(v13, &location);
  id v8 = v7;
  id v12 = v8;
  v13[1] = *(id *)&a3;
  v13[2] = *(id *)&a4;
  v13[3] = (id)0x3FF0000000000000;
  id v9 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v11 block:1.0];
  nowPlayingUpdateTimer = self->_nowPlayingUpdateTimer;
  self->_nowPlayingUpdateTimer = v9;

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)__setupRemoteControlCommandsForPlayback
{
  id v3 = +[MPRemoteCommandCenter sharedCommandCenter];
  objc_initWeak(location, self);
  BOOL v4 = [v3 pauseCommand];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000C47C0;
  v28[3] = &unk_100223410;
  objc_copyWeak(&v29, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v4 withHandler:v28];

  uint64_t v5 = [v3 playCommand];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000C4834;
  v26[3] = &unk_100223410;
  objc_copyWeak(&v27, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v5 withHandler:v26];

  id v6 = [v3 togglePlayPauseCommand];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000C48C4;
  v24[3] = &unk_100223410;
  objc_copyWeak(&v25, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v6 withHandler:v24];

  id v7 = [v3 skipBackwardCommand];
  [v7 setPreferredIntervals:&off_10022D940];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000C4938;
  v22[3] = &unk_100223410;
  objc_copyWeak(&v23, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v7 withHandler:v22];
  id v8 = [v3 skipForwardCommand];
  [v8 setPreferredIntervals:&off_10022D958];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000C49C8;
  v20[3] = &unk_100223410;
  objc_copyWeak(&v21, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v8 withHandler:v20];
  id v9 = [v3 seekBackwardCommand];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000C4A54;
  v17[3] = &unk_100223438;
  objc_copyWeak(&v19, location);
  CFStringRef v18 = &off_10022D940;
  [(RCMainControllerHelper *)self _addCommandTarget:v9 withHandler:v17];

  double v10 = [v3 seekForwardCommand];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C4AE8;
  v14[3] = &unk_100223438;
  objc_copyWeak(&v16, location);
  uint64_t v15 = &off_10022D940;
  [(RCMainControllerHelper *)self _addCommandTarget:v10 withHandler:v14];

  double v11 = [v3 changePlaybackPositionCommand];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000C4B78;
  v12[3] = &unk_100223410;
  objc_copyWeak(&v13, location);
  [(RCMainControllerHelper *)self _addCommandTarget:v11 withHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(location);
}

- (void)__setupRemoteControlCommandsForRecordingForeground
{
  objc_initWeak(&location, self);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  id v9 = sub_1000C4D30;
  double v10 = &unk_100223410;
  objc_copyWeak(&v11, &location);
  id v3 = objc_retainBlock(&v7);
  BOOL v4 = +[MPRemoteCommandCenter sharedCommandCenter];
  uint64_t v5 = [v4 pauseCommand];
  [(RCMainControllerHelper *)self _addCommandTarget:v5 withHandler:v3];

  id v6 = [v4 togglePlayPauseCommand];
  [(RCMainControllerHelper *)self _addCommandTarget:v6 withHandler:v3];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_teardownRemoteControlCommands
{
  commandTargets = self->_commandTargets;
  if (commandTargets)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v4 = commandTargets;
    id v5 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          double v10 = -[NSMapTable objectForKey:](self->_commandTargets, "objectForKey:", v9, (void)v12);
          [v9 removeTarget:v10];
        }
        id v6 = [(NSMapTable *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    id v11 = self->_commandTargets;
    self->_commandTargets = 0;
  }
}

- (void)_sceneWillDeactivateNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C4F40;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_startDisplayLink
{
}

- (void)_stopDisplayLink
{
}

- (void)displayLinkDidUpdate:(id)a3 withTimeController:(id)a4
{
  id v5 = [(RCMainControllerHelper *)self currentUserActivity];
  if ([v5 activityType] || objc_msgSend(v5, "subActivityType") == (id)4)
  {
    id v6 = [(RCMainControllerHelper *)self audioRecorder];
    uint64_t v7 = v6;
    if (v6 && [v6 recording])
    {
      double v19 = 0.0;
      double v20 = 0.0;
      if (![v7 monitorRecordingTime:&v20 duration:&v19])
      {
LABEL_20:

        goto LABEL_21;
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v8 = [(NSHashTable *)self->_timeObservers allObjects];
      id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            if (objc_opt_respondsToSelector()) {
              [v13 timeController:self didChangeCurrentTime:v20 didChangeDuration:v19];
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v10);
      }
    }
    else
    {
      long long v14 = [(RCMainControllerHelper *)self audioPlayer];
      uint64_t v8 = v14;
      if (v14 && [v14 playing])
      {
        [v8 playerTime];
        -[RCMainControllerHelper setCurrentTime:](self, "setCurrentTime:");
      }
    }

    goto LABEL_20;
  }
LABEL_21:
}

- (BOOL)_transitionToActivityType:(int64_t)a3 toSubType:(int64_t)a4 withDisplayModel:(id)a5 waveformDataSource:(id)a6 composition:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if ([(RCMainControllerHelper *)self _requiresUUIDForActivityType:a3])
  {
    long long v15 = [v12 UUID];

    if (!v15) {
      goto LABEL_8;
    }
  }
  long long v16 = [(RCMainControllerHelper *)self currentUserActivity];
  id v17 = [v16 activityType];

  long long v18 = [(RCMainControllerHelper *)self currentUserActivity];
  id v19 = [v18 subActivityType];

  if (v17 == (id)3)
  {
    double v20 = [(RCMainControllerHelper *)self currentUserActivity];
    id v21 = [v20 subActivityType];

    if (v21 == (id)2) {
      [(RCUndoTarget *)self->_trimModeUndoTarget setShouldEnableSave:1];
    }
  }
  id v22 = [(RCMainControllerHelper *)self currentUserActivity];
  unsigned int v23 = [v22 transitionToActivityType:a3 subType:a4 withDisplayModel:v12];

  if (v23)
  {
    id v24 = [[RCUserActivityTypeTransitionInfo alloc] initWithToActivityType:a3 toSubType:a4 fromActivityType:v17 fromSubType:v19 displayModel:v12 waveformDataSource:v13 composition:v14];
    id v25 = [(RCMainControllerHelper *)self delegate];
    [v25 didTransitionWithTransitionInfo:v24];

    BOOL v26 = 1;
  }
  else
  {
LABEL_8:
    BOOL v26 = 0;
  }

  return v26;
}

- (BOOL)_performRecordingEndTransitionWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self currentUserActivity];
  unsigned int v6 = [v5 requiresDismissalAtEndOfCapture];

  uint64_t v7 = [(RCMainControllerHelper *)self delegate];
  unsigned int v8 = [v7 isQuickRecordingWorkflowDismissal];

  id v9 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v4];

  if (v9)
  {
    if (v6 | v8) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 3;
    }
    uint64_t v11 = [(RCMainControllerHelper *)self currentComposition];
    BOOL v12 = [(RCMainControllerHelper *)self _transitionToActivityType:v10 toSubType:0 withDisplayModel:v9 waveformDataSource:0 composition:v11];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_transitionToIdleForItemWithUUID:(id)a3
{
  id v4 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:a3];
  if (v4)
  {
    if (self->_scrubState == 1)
    {
      uint64_t v5 = 6;
    }
    else
    {
      uint64_t v7 = [(RCMainControllerHelper *)self currentUserActivity];
      unsigned int v8 = [v7 isTrim];

      if (v8) {
        uint64_t v5 = 2;
      }
      else {
        uint64_t v5 = 0;
      }
    }
    id v9 = [(RCMainControllerHelper *)self currentComposition];
    BOOL v6 = [(RCMainControllerHelper *)self _transitionToActivityType:0 toSubType:v5 withDisplayModel:v4 waveformDataSource:0 composition:v9];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_transitionToPlayingBackForItemWithUUID:(id)a3
{
  id v4 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:a3];
  if (v4)
  {
    uint64_t v5 = [(RCMainControllerHelper *)self currentComposition];
    BOOL v6 = [(RCMainControllerHelper *)self _transitionToActivityType:2 toSubType:0 withDisplayModel:v4 waveformDataSource:0 composition:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_requiresUUIDForActivityType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (id)undoManager
{
  id v2 = [(RCMainControllerHelper *)self delegate];
  id v3 = [v2 undoManager];

  return v3;
}

- (void)_undoCaptureFragment
{
  id v3 = [(RCMainControllerHelper *)self audioRecorder];
  if ([v3 undoEditing])
  {
    id v4 = [v3 recordingID];
    [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v4];

    uint64_t v5 = +[NSMutableDictionary dictionary];
    BOOL v6 = [(RCMainControllerHelper *)self undoManager];
    editModeUndoTarget = self->_editModeUndoTarget;
    id v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    long long v15 = sub_1000C56C0;
    long long v16 = &unk_100223460;
    id v17 = self;
    id v18 = v5;
    id v8 = v5;
    [v6 registerUndoWithTarget:editModeUndoTarget handler:&v13];

    id v9 = [(RCMainControllerHelper *)self undoManager];
    uint64_t v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"TITLE_FOR_OVERDUB_REDO" value:&stru_100228BC8 table:0];
    [v9 setActionName:v11];

    BOOL v12 = [(RCMainControllerHelper *)self delegate];
    [v12 enableUndoFirstResponder];
  }
}

- (void)_undoTrim:(int64_t)a3
{
  uint64_t v5 = [(RCMainControllerHelper *)self audioRecorder];
  if ([v5 undoEditing])
  {
    [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:-1];
    BOOL v6 = [v5 recordingID];
    [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v6];

    uint64_t v7 = [(RCMainControllerHelper *)self delegate];
    id v8 = [v7 undoManager];

    trimModeUndoTarget = self->_trimModeUndoTarget;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C5828;
    v11[3] = &unk_100223488;
    void v11[4] = self;
    void v11[5] = a3;
    [v8 registerUndoWithTarget:trimModeUndoTarget handler:v11];
    uint64_t v10 = [(RCMainControllerHelper *)self _undoActionNameForTrimMode:a3 isUndo:0];
    [v8 setActionName:v10];
  }
  else
  {
    id v8 = OSLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10016EE0C(self);
    }
  }
}

- (void)_redoTrim:(int64_t)a3
{
  uint64_t v5 = [(RCMainControllerHelper *)self audioRecorder];
  if ([v5 redoEditing])
  {
    [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:1];
    BOOL v6 = [v5 recordingID];
    [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v6];

    uint64_t v7 = [(RCMainControllerHelper *)self delegate];
    id v8 = [v7 undoManager];

    trimModeUndoTarget = self->_trimModeUndoTarget;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C5990;
    v11[3] = &unk_100223488;
    void v11[4] = self;
    void v11[5] = a3;
    [v8 registerUndoWithTarget:trimModeUndoTarget handler:v11];
    uint64_t v10 = [(RCMainControllerHelper *)self _undoActionNameForTrimMode:a3 isUndo:1];
    [v8 setActionName:v10];
  }
  else
  {
    id v8 = OSLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10016EE9C(self);
    }
  }
}

- (void)_redoCaptureFragmentWithCompositionControllerRedoInfo:(id)a3
{
  id v4 = [(RCMainControllerHelper *)self audioRecorder];
  if ([v4 redoEditing])
  {
    uint64_t v5 = [v4 recordingID];
    [(RCMainControllerHelper *)self _refreshAfterEditingOperation:v5];

    BOOL v6 = [(RCMainControllerHelper *)self undoManager];
    editModeUndoTarget = self->_editModeUndoTarget;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000C5AE8;
    v12[3] = &unk_1002232B0;
    void v12[4] = self;
    [v6 registerUndoWithTarget:editModeUndoTarget handler:v12];

    id v8 = [(RCMainControllerHelper *)self undoManager];
    id v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"TITLE_FOR_OVERDUB_UNDO" value:&stru_100228BC8 table:0];
    [v8 setActionName:v10];

    uint64_t v11 = [(RCMainControllerHelper *)self delegate];
    [v11 enableUndoFirstResponder];
  }
}

- (id)_undoActionNameForTrimMode:(int64_t)a3 isUndo:(BOOL)a4
{
  if (a3)
  {
    if (a3 != 1)
    {
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    uint64_t v5 = +[NSBundle mainBundle];
    if (a4) {
      CFStringRef v6 = @"TITLE_FOR_DELETE_RANGE_UNDO";
    }
    else {
      CFStringRef v6 = @"TITLE_FOR_DELETE_RANGE_REDO";
    }
  }
  else
  {
    uint64_t v5 = +[NSBundle mainBundle];
    if (a4) {
      CFStringRef v6 = @"TITLE_FOR_TRIM_TO_RANGE_UNDO";
    }
    else {
      CFStringRef v6 = @"TITLE_FOR_TRIM_TO_RANGE_REDO";
    }
  }
  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_100228BC8 table:0];

LABEL_11:

  return v7;
}

- (void)_beginSelectionEditingModeAction
{
}

- (void)_adjustCurrentTrimOperationUndoCount:(int64_t)a3
{
  trimModeUndoTarget = self->_trimModeUndoTarget;
  if (a3) {
    a3 += [(RCUndoTarget *)self->_trimModeUndoTarget sizeOfUndoStack];
  }
  [(RCUndoTarget *)trimModeUndoTarget setSizeOfUndoStack:a3];

  [(RCMainControllerHelper *)self _updateTrimSaveEnabledState];
}

- (void)_clearTrimModeUndoStack
{
  id v3 = [(RCMainControllerHelper *)self undoManager];
  [v3 removeAllActionsWithTarget:self->_trimModeUndoTarget];

  [(RCMainControllerHelper *)self _adjustCurrentTrimOperationUndoCount:0];
}

- (void)_updateTrimSaveEnabledState
{
  id v3 = [(RCMainControllerHelper *)self delegate];
  [v3 shouldEnableTrimSave:[self _shouldEnableTrimSave]];
}

- (BOOL)_shouldEnableTrimSave
{
  if ([(RCUndoTarget *)self->_trimModeUndoTarget sizeOfUndoStack] > 0) {
    return 1;
  }
  trimModeUndoTarget = self->_trimModeUndoTarget;

  return [(RCUndoTarget *)trimModeUndoTarget shouldEnableSave];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  if (self->_audioProperties == a6)
  {
    id v12 = a5;
    id v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeOldKey];
    uint64_t v14 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];

    LOBYTE(v12) = [v13 isEqual:v14];
    if ((v12 & 1) == 0)
    {
      long long v15 = [(RCMainControllerHelper *)self audioPlayer];
      long long v16 = v15;
      if (v15 && [v15 playing]) {
        self->_hasDeferredContentChanges = 1;
      }
      else {
        [(RCMainControllerHelper *)self _audioContentOrDurationDidChange:v10];
      }
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)RCMainControllerHelper;
    id v11 = a5;
    [(RCMainControllerHelper *)&v17 observeValueForKeyPath:a3 ofObject:v10 change:v11 context:a6];
  }
}

- (void)_addRecordingObservations:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(NSMutableSet *)self->_recordingObservances containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10016EF2C(v4);
    }

    [(NSMutableSet *)self->_recordingObservances addObject:v4];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    CFStringRef v6 = self->_audioProperties;
    id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 addObserver:self forKeyPath:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) options:3 context:self->_audioProperties];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

- (void)_removeRecordingObservations:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(NSMutableSet *)self->_recordingObservances containsObject:v4])
  {
    uint64_t v5 = OSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10016EFBC(v4);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    CFStringRef v6 = self->_audioProperties;
    id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 removeObserver:self forKeyPath:*((void *)(*((void *)&v11 + 1) + 8 * (void)v10)) context:self->_audioProperties v11];
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [(NSMutableSet *)self->_recordingObservances removeObject:v4];
  }
}

- (void)_removeRecordingsObservationsForUUIDs:(id)a3
{
  id v4 = [(RCRecordingsModelInteractor *)self->_recordingsModelInteractor recordingsForUUIDs:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(RCMainControllerHelper *)self _removeRecordingObservations:v9];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_audioContentOrDurationDidChange:(id)a3
{
  id v4 = a3;
  id v9 = +[RCComposition compositionLoadedForSavedRecording:v4];
  -[RCMainControllerHelper setCurrentComposition:](self, "setCurrentComposition:");
  id v5 = [(RCMainControllerHelper *)self delegate];
  [v4 length];
  double v7 = v6;

  [v5 recordingDurationUpdated:v7];
  id v8 = [(RCMainControllerHelper *)self audioPlayer];
  if ([v8 playing]) {
    [v8 stopPlaying];
  }
}

- (void)waveformDataSourceDidFinishLoading:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C63BC;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waveformDataSource:(id)a3 didLoadWaveformSegment:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C648C;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)waveformDataSourceRequiresUpdate:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C655C;
  block[3] = &unk_100221278;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setAllowedTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (RCTimeRangeEqualToTimeRange())
  {
    double v6 = OSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10016F04C(v6);
    }
  }
  self->_allowedTimeRange.beginTime = var0;
  self->_allowedTimeRange.endTime = var1;
  double v7 = [(RCMainControllerHelper *)self audioPlayer];
  id v8 = v7;
  if (v7) {
    [v7 setPlayableRange:var0, var1];
  }
}

- (int64_t)timeControllerState
{
  id v3 = [(RCMainControllerHelper *)self audioRecorder];
  id v4 = v3;
  if (v3 && ([v3 recording] & 1) != 0)
  {
    int64_t v5 = 2;
  }
  else
  {
    double v6 = [(RCMainControllerHelper *)self audioPlayer];
    double v7 = v6;
    if (v6) {
      int64_t v5 = [v6 playing];
    }
    else {
      int64_t v5 = 0;
    }
  }
  return v5;
}

- (NSHashTable)timeObservers
{
  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    id v4 = +[NSHashTable weakObjectsHashTable];
    int64_t v5 = self->_timeObservers;
    self->_timeObservers = v4;

    timeObservers = self->_timeObservers;
  }

  return timeObservers;
}

- (void)pauseTime
{
  id v5 = [(RCMainControllerHelper *)self audioPlayer];
  if (v5) {
    [v5 stopPlaying];
  }
  id v3 = [(RCMainControllerHelper *)self audioRecorder];
  id v4 = v3;
  if (v3) {
    [v3 stopRecording];
  }
}

- (void)addTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self timeObservers];
  [v5 addObject:v4];
}

- (void)removeTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RCMainControllerHelper *)self timeObservers];
  [v5 removeObject:v4];
}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  id v2 = [(RCMainControllerHelper *)self audioRecorder];
  id v3 = [v2 activityWaveformProcessor];

  return (RCActivityWaveformProcessor *)v3;
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  id v2 = [(RCMainControllerHelper *)self audioRecorder];
  id v3 = [v2 liveTranscription];

  return (_TtC10VoiceMemos19RCLiveTranscription *)v3;
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
  audioPlayer = self->_audioPlayer;
  if (audioPlayer) {
    [(VMAudioPlayer *)audioPlayer setPlayerTime:a3];
  }
  if ((id)[(RCMainControllerHelper *)self timeControllerState] != (id)2)
  {
    [(RCMainControllerHelper *)self setCurrentTime:a3];
  }
}

- (void)setCurrentRate:(float)a3
{
  self->_currentRate = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(NSHashTable *)self->_timeObservers allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v11 = a3;
          [v10 timeController:self didChangeRate:v11];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)setCurrentTime:(double)a3
{
  self->_double currentTime = a3;
  id v5 = [(RCMainControllerHelper *)self delegate];
  id v6 = [(RCMainControllerHelper *)self uuidOfPlayingOrSelectedRecording];
  [v5 setCurrentTime:v6 withUUID:a3];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(NSHashTable *)self->_timeObservers allObjects];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      double v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector()) {
          [v12 timeController:self didChangeCurrentTime:a3];
        }
        double v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)setPlaybackError:(id)a3
{
}

- (void)setRecordingError:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_recordingError, a3);
  if (v5)
  {
    id v6 = objc_retainBlock(self->_recordingErrorHandler);
    id v7 = v6;
    if (v6) {
      ((void (*)(NSObject *, id))v6[2].isa)(v6, v5);
    }
  }
  else
  {
    id v7 = OSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10016F0D0(v7, v8, v9);
    }
  }
}

- (double)currentDuration
{
  id v3 = [(RCMainControllerHelper *)self audioRecorder];
  id v4 = v3;
  if (v3 && [v3 recording])
  {
    double v10 = 0.0;
    uint64_t v11 = 0;
    if ([v4 monitorRecordingTime:&v11 duration:&v10])
    {
      double v5 = v10;
    }
    else
    {
      [v4 idleDuration];
      double v5 = v9;
    }
  }
  else
  {
    id v6 = [(RCMainControllerHelper *)self currentRecordingDisplayModel];
    [v6 duration];
    double v5 = v7;
  }
  return v5;
}

- (void)_checkAudioPlayer:(id)a3
{
  id v5 = a3;
  if (![v5 playing])
  {
    [(RCMainControllerHelper *)self setCurrentRate:0.0];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v15 = [(NSHashTable *)self->_timeObservers allObjects];
    id v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          double v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v20 timeController:self didChangeRate:0.0];
          }
          if (objc_opt_respondsToSelector()) {
            [v20 timeController:self didChangeState:0];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v17);
    }

    id v21 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
    [(RCMainControllerHelper *)self _transitionToIdleForItemWithUUID:v21];

    [(RCMainControllerHelper *)self _stopDisplayLink];
    if (!self->_hasDeferredContentChanges) {
      goto LABEL_37;
    }
    recordingsModelInteractor = self->_recordingsModelInteractor;
    unsigned int v23 = [v5 recordingID];
    uint64_t v11 = [(RCRecordingsModelInteractor *)recordingsModelInteractor recordingForUUID:v23];

    if (v11)
    {
      [(RCMainControllerHelper *)self _audioContentOrDurationDidChange:v11];
      self->_hasDeferredContentChanges = 0;
    }
LABEL_36:

LABEL_37:
    [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
    goto LABEL_38;
  }
  id v6 = +[UIApplication sharedApplication];
  unsigned int v7 = [v6 isRunningTest];

  if (v7)
  {
    uint64_t v8 = +[UIApplication sharedApplication];
    double v9 = [v8 delegate];
    [v9 ppt_didStartVoiceMemoPreviewPlayback];
  }
  double v10 = [v5 recordingID];
  uint64_t v11 = +[RCRecordingDisplayModel recordingDisplayModelForUUID:v10];

  if (v11)
  {
    id v33 = v5;
    [v11 setIsPlaying:1];
    long long v12 = [(RCMainControllerHelper *)self currentUserActivity];
    unsigned int v13 = [v12 isTrim];
    if (v13)
    {
      id v3 = [(RCMainControllerHelper *)self currentUserActivity];
      id v14 = [v3 subActivityType];
    }
    else
    {
      id v14 = 0;
    }
    id v24 = [(RCMainControllerHelper *)self currentComposition];
    [(RCMainControllerHelper *)self _transitionToActivityType:2 toSubType:v14 withDisplayModel:v11 waveformDataSource:0 composition:v24];

    if (v13) {
    +[RCAnalyticsUtilities sendDidPlaybackVoiceMemo];
    }
    [(RCMainControllerHelper *)self _startDisplayLink];
    LODWORD(v25) = 1.0;
    [(RCMainControllerHelper *)self setCurrentRate:v25];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    BOOL v26 = [(NSHashTable *)self->_timeObservers allObjects];
    id v27 = [v26 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v39;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
          if (objc_opt_respondsToSelector())
          {
            LODWORD(v32) = 1.0;
            [v31 timeController:self didChangeRate:v32];
          }
          if (objc_opt_respondsToSelector()) {
            [v31 timeController:self didChangeState:1];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v28);
    }

    id v5 = v33;
    goto LABEL_36;
  }
LABEL_38:
}

- (void)setAudioPlayer:(id)a3
{
  id v5 = a3;
  playerObservance = self->_playerObservance;
  if (playerObservance)
  {
    [(RCKeyPathObservance *)playerObservance remove];
    unsigned int v7 = self->_playerObservance;
    self->_playerObservance = 0;
  }
  objc_storeStrong((id *)&self->_audioPlayer, a3);
  if (v5)
  {
    uint64_t v8 = +[NSString stringWithUTF8String:"playing"];
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    unsigned int v13 = sub_1000C7274;
    id v14 = &unk_100222878;
    long long v15 = self;
    id v16 = v5;
    RCObserveChangesToKeyPath();
    double v9 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue();
    double v10 = self->_playerObservance;
    self->_playerObservance = v9;
  }
  [(RCMainControllerHelper *)self _reconcileAudioStateWithApplicationState];
}

- (void)setAudioRecorder:(id)a3
{
  id v5 = a3;
  audioRecorder = self->_audioRecorder;
  if (audioRecorder) {
    [(VMAudioRecorder *)audioRecorder setController:0];
  }
  recorderObservance = self->_recorderObservance;
  if (recorderObservance)
  {
    [(RCKeyPathObservance *)recorderObservance remove];
    uint64_t v8 = self->_recorderObservance;
    self->_recorderObservance = 0;
  }
  audioVersions = self->_audioVersions;
  if (audioVersions)
  {
    self->_audioVersions = 0;
  }
  objc_storeStrong((id *)&self->_audioRecorder, a3);
  if (self->_audioRecorder)
  {
    objc_initWeak(&location, self);
    double v10 = +[NSString stringWithUTF8String:"recording"];
    double v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    id v22 = sub_1000C74AC;
    unsigned int v23 = &unk_1002234B0;
    objc_copyWeak(&v25, &location);
    id v11 = v5;
    id v24 = v11;
    RCObserveChangesToKeyPath();
    uint64_t v12 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue();
    unsigned int v13 = self->_recorderObservance;
    self->_recorderObservance = v12;

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000C7528;
    v18[3] = &unk_1002234D8;
    v18[4] = self;
    id v14 = v11;
    id v19 = v14;
    long long v15 = objc_retainBlock(v18);
    [(RCMainControllerHelper *)self setRecordingErrorHandler:v15];
    id v16 = [v14 versions];
    id v17 = self->_audioVersions;
    self->_audioVersions = v16;

    [(VMAudioRecorder *)self->_audioRecorder setController:self];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RCMainControllerHelper *)self setRecordingErrorHandler:0];
  }
}

- (void)_reconcileAudioStateWithApplicationState
{
  id v14 = +[RecorderAppDelegate sharedAppDelegate];
  id v3 = [v14 defaultSceneDelegate];
  id v4 = [v14 connectedLockScreenSceneDelegate];
  id v5 = [v14 dynamicIslandSceneDelegate];
  unsigned int v6 = [v3 isInForeground];
  unsigned int v7 = v6 | [v4 isInForeground];
  unsigned int v8 = [(RCMainControllerHelper *)self isPlaying];
  unsigned int v9 = [(RCMainControllerHelper *)self isPaused];
  unsigned int v10 = [(RCMainControllerHelper *)self isRecording];
  if (([v3 isInAndromeda] & 1) != 0
    || ([v4 isInAndromeda] & 1) != 0)
  {
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = (uint64_t)[v5 isInAndromeda];
  }
  [(RCDisplayLinkManager *)self->_displayLinkManager setPaused:v11];
  if (((v8 | v10 | v7) & 1) == 0)
  {
    uint64_t v12 = +[VMAudioService sharedInstance];
    [v12 deactivateAudioSession];
  }
  if ((v7 & v10) != 0) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v8 | v9 & v7;
  }
  [(RCMainControllerHelper *)self _updateRemoteControlState:v13];
  [(RCMainControllerHelper *)self _updateNowPlayingInfo];
}

- (id)_alertControllerWithTitle:(id)a3 message:(id)a4 isDestructive:(BOOL)a5 preferredStyle:(int64_t)a6 source:(id)a7 handler:(id)a8 actionTitle:(id)a9 cancelHandler:(id)a10
{
  BOOL v12 = a5;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  if (a7) {
    int64_t v18 = a6;
  }
  else {
    int64_t v18 = 1;
  }
  id v19 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:v18];
  if (v12) {
    uint64_t v20 = 2;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t v21 = +[UIAlertAction actionWithTitle:v16 style:v20 handler:v15];
  id v22 = +[NSBundle mainBundle];
  unsigned int v23 = [v22 localizedStringForKey:@"CANCEL" value:&stru_100228BC8 table:0];
  id v24 = +[UIAlertAction actionWithTitle:v23 style:1 handler:v17];

  v36[0] = v21;
  v36[1] = v24;
  +[NSArray arrayWithObjects:v36 count:2];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v32;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v32 != v28) {
          objc_enumerationMutation(v25);
        }
        [v19 addAction:*(void *)(*((void *)&v31 + 1) + 8 * i) v31];
      }
      id v27 = [v25 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v27);
  }

  return v19;
}

- (id)uuidOfPlayingOrSelectedRecording
{
  id v3 = [(RCMainControllerHelper *)self uuidOfPlayingRecording];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    unsigned int v6 = [(RCMainControllerHelper *)self delegate];
    id v5 = [v6 selectedUUID];
  }

  return v5;
}

- (void)_updateWillMigrateFromSingleLayerToMultiLayer
{
  if (RCOverdubRecordingIsEnabled()) {
    self->_willMigrateFromSingleLayerToMultiLayer = [(RCComposition *)self->_currentComposition willMigrateFromM4aToQta];
  }
}

- (void)promptForRatingIfNeeded
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)allowedTimeRange
{
  double beginTime = self->_allowedTimeRange.beginTime;
  double endTime = self->_allowedTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (float)targetRate
{
  return self->_targetRate;
}

- (void)setTargetRate:(float)a3
{
  self->_targetRate = a3;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (float)currentRate
{
  return self->_currentRate;
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (RCMainControllerHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCMainControllerHelperDelegate *)WeakRetained;
}

- (void)setUuidOfPlayingRecording:(id)a3
{
}

- (RCRecordingDisplayModel)currentRecordingDisplayModel
{
  return self->_currentRecordingDisplayModel;
}

- (BOOL)shouldSaveAsNew
{
  return self->_shouldSaveAsNew;
}

- (void)setShouldSaveAsNew:(BOOL)a3
{
  self->_shouldSaveAsNew = a3;
}

- (BOOL)willMigrateFromSingleLayerToMultiLayer
{
  return self->_willMigrateFromSingleLayerToMultiLayer;
}

- (void)setWillMigrateFromSingleLayerToMultiLayer:(BOOL)a3
{
  self->_willMigrateFromSingleLayerToMultiLayer = a3;
}

- (BOOL)isSilencing
{
  return self->_silencing;
}

- (void)setSilencing:(BOOL)a3
{
  self->_silencing = a3;
}

- (void)setTimeObservers:(id)a3
{
}

- (VMAudioRecorder)audioRecorder
{
  return self->_audioRecorder;
}

- (id)recordingErrorHandler
{
  return self->_recordingErrorHandler;
}

- (void)setRecordingErrorHandler:(id)a3
{
}

- (NSArray)audioVersions
{
  return self->_audioVersions;
}

- (void)setAudioVersions:(id)a3
{
}

- (RCKeyPathObservance)playerObservance
{
  return self->_playerObservance;
}

- (void)setPlayerObservance:(id)a3
{
}

- (RCKeyPathObservance)recorderObservance
{
  return self->_recorderObservance;
}

- (void)setRecorderObservance:(id)a3
{
}

- (RCKeyPathObservance)finalizingRecordingsObservance
{
  return self->_finalizingRecordingsObservance;
}

- (void)setFinalizingRecordingsObservance:(id)a3
{
}

- (unint64_t)targetTrackIndex
{
  return self->_targetTrackIndex;
}

- (void)setTargetTrackIndex:(unint64_t)a3
{
  self->_targetTrackIndex = a3;
}

- (BOOL)overdubbing
{
  return self->_overdubbing;
}

- (void)setOverdubbing:(BOOL)a3
{
  self->_overdubbing = a3;
}

- (void)setCurrentUserActivity:(id)a3
{
}

- (RCComposition)currentComposition
{
  return self->_currentComposition;
}

- (void)setCurrentComposition:(id)a3
{
}

- (RCAVWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (RCAVWaveformViewController)overviewWaveformViewController
{
  return self->_overviewWaveformViewController;
}

- (void)setOverviewWaveformViewController:(id)a3
{
}

- (id)endTrimReloadDataSourceBlock
{
  return self->_endTrimReloadDataSourceBlock;
}

- (void)setEndTrimReloadDataSourceBlock:(id)a3
{
}

- (RCUndoTarget)trimModeUndoTarget
{
  return self->_trimModeUndoTarget;
}

- (void)setTrimModeUndoTarget:(id)a3
{
}

- (RCUndoTarget)editModeUndoTarget
{
  return self->_editModeUndoTarget;
}

- (void)setEditModeUndoTarget:(id)a3
{
}

- (BOOL)didTrimPlayback
{
  return self->_didTrimPlayback;
}

- (void)setDidTrimPlayback:(BOOL)a3
{
  self->_didTrimPlayback = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editModeUndoTarget, 0);
  objc_storeStrong((id *)&self->_trimModeUndoTarget, 0);
  objc_storeStrong(&self->_endTrimReloadDataSourceBlock, 0);
  objc_storeStrong((id *)&self->_overviewWaveformViewController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_currentComposition, 0);
  objc_storeStrong((id *)&self->_currentUserActivity, 0);
  objc_storeStrong((id *)&self->_finalizingRecordingsObservance, 0);
  objc_storeStrong((id *)&self->_recorderObservance, 0);
  objc_storeStrong((id *)&self->_playerObservance, 0);
  objc_storeStrong((id *)&self->_audioVersions, 0);
  objc_storeStrong(&self->_recordingErrorHandler, 0);
  objc_storeStrong((id *)&self->_audioRecorder, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_storeStrong((id *)&self->_activityStatePublisher, 0);
  objc_storeStrong((id *)&self->_currentRecordingDisplayModel, 0);
  objc_storeStrong((id *)&self->_uuidOfPlayingRecording, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_appStoreRatingPrompter, 0);
  objc_storeStrong((id *)&self->_nowPlayingUpdateTimer, 0);
  objc_storeStrong((id *)&self->_commandTargets, 0);
  objc_destroyWeak((id *)&self->_recordingUnavailableAlertController);
  objc_storeStrong((id *)&self->_recordingObservances, 0);
  objc_storeStrong((id *)&self->_audioProperties, 0);
  objc_storeStrong((id *)&self->_recordingsModelInteractor, 0);

  objc_storeStrong((id *)&self->_displayLinkManager, 0);
}

@end