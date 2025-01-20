@interface VMAudioRecorderImp
- (BOOL)_buildUndoStackCache;
- (BOOL)_discardAllEdits;
- (BOOL)_editRecording:(id)a3 error:(id *)a4;
- (BOOL)_restoreMarkedVersion;
- (BOOL)cutRecording:(id)a3 error:(id *)a4;
- (BOOL)discardAllEdits;
- (BOOL)editing;
- (BOOL)ioStarted;
- (BOOL)isNewRecording;
- (BOOL)monitorRecordingTime:(double *)a3 duration:(double *)a4;
- (BOOL)overdubbing;
- (BOOL)paused;
- (BOOL)preparing;
- (BOOL)recording;
- (BOOL)redoEditing;
- (BOOL)restoreMarkedVersion;
- (BOOL)shouldWaitForAccessToken;
- (BOOL)silencing;
- (BOOL)startRecording;
- (BOOL)stopRecording;
- (BOOL)stopRecordingAtTime:(double)a3;
- (BOOL)trimRecording:(id)a3 error:(id *)a4;
- (BOOL)undoEditing;
- (NSArray)versions;
- (NSDate)recordingDate;
- (NSError)recordingError;
- (NSString)recordingID;
- (NSString)titleBase;
- (NSURL)recordingURL;
- (RCActivityWaveformProcessor)activityWaveformProcessor;
- (RCComposition)recordingComposition;
- (RCSSavedRecordingAccessToken)recordingToken;
- (RCWaveformDataSource)waveformDataSource;
- (VMAudioRecorderController)controller;
- (VMAudioService)service;
- (VMRecordingAssetsBackup)assetBackup;
- (_TtC10VoiceMemos18VMRecordingContext)context;
- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription;
- (double)currentDuration;
- (double)currentTime;
- (double)idleDuration;
- (double)stopRecordingTime;
- (double)targetTime;
- (id)_initWithRecordingID:(id)a3 model:(id)a4;
- (int)currentState;
- (int)targetState;
- (unint64_t)targetTrackIndex;
- (void)_clearUndoStackCache;
- (void)_commitEditing;
- (void)_discardRedoVersions;
- (void)dealloc;
- (void)finishEditing:(BOOL)a3;
- (void)markCurrentVersion;
- (void)setActivityWaveformProcessor:(id)a3;
- (void)setAssetBackup:(id)a3;
- (void)setContext:(id)a3;
- (void)setController:(id)a3;
- (void)setCurrentDuration:(double)a3;
- (void)setCurrentState:(int)a3;
- (void)setCurrentTime:(double)a3;
- (void)setEditing:(BOOL)a3;
- (void)setIoStarted:(BOOL)a3;
- (void)setIsNewRecording:(BOOL)a3;
- (void)setLiveTranscription:(id)a3;
- (void)setOverdubbing:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setRecording:(BOOL)a3;
- (void)setRecordingComposition:(id)a3;
- (void)setRecordingDate:(id)a3;
- (void)setRecordingError:(id)a3;
- (void)setRecordingID:(id)a3;
- (void)setRecordingToken:(id)a3;
- (void)setRecordingURL:(id)a3;
- (void)setService:(id)a3;
- (void)setSilencing:(BOOL)a3;
- (void)setStopRecordingTime:(double)a3;
- (void)setTargetState:(int)a3;
- (void)setTargetTime:(double)a3;
- (void)setTargetTrackIndex:(unint64_t)a3;
- (void)setTitleBase:(id)a3;
- (void)setWaveformDataSource:(id)a3;
@end

@implementation VMAudioRecorderImp

- (BOOL)preparing
{
  return self->_currentState == 1;
}

- (id)_initWithRecordingID:(id)a3 model:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)VMAudioRecorderImp;
  v9 = [(VMAudioRecorderImp *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recordingID, a3);
    if (v7)
    {
      v11 = [v8 recordingWithUniqueID:v7];
      v12 = [v11 url];
      [(VMAudioRecorderImp *)v10 setRecordingURL:v12];
    }
    v10->_markedVersionIndex = -1;
    v13 = objc_alloc_init(_TtC10VoiceMemos18VMRecordingContext);
    context = v10->_context;
    v10->_context = v13;
  }
  return v10;
}

- (void)dealloc
{
  [(VMAudioRecorderImp *)self _commitEditing];
  v3 = +[RCSSavedRecordingService sharedService];
  v4 = self->_recordingToken;
  if (v4)
  {
    id v9 = 0;
    unsigned __int8 v5 = [v3 endAccessSessionWithToken:v4 error:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      id v7 = OSLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10016B9AC();
      }
    }
  }
  if (self->_recordingURL) {
    [v3 enableOrphanedFragmentCleanupForCompositionAVURL];
  }

  v8.receiver = self;
  v8.super_class = (Class)VMAudioRecorderImp;
  [(VMAudioRecorderImp *)&v8 dealloc];
}

- (void)setRecordingURL:(id)a3
{
  id v5 = a3;
  id v6 = self->_recordingURL;
  if (([(NSURL *)v6 isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_recordingURL, a3);
    id v7 = +[RCComposition compositionMetadataURLForComposedAVURL:v5];
    metadataURL = self->_metadataURL;
    self->_metadataURL = v7;

    id v9 = +[RCSSavedRecordingService sharedService];
    id v13 = 0;
    unsigned __int8 v10 = [v9 disableOrphanedFragmentCleanupForCompositionAVURL:v5 error:&v13];
    id v11 = v13;
    if ((v10 & 1) == 0)
    {
      v12 = OSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[VMAudioRecorderImp setRecordingURL:]";
        __int16 v16 = 2112;
        id v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s -- disableError = %@", buf, 0x16u);
      }
    }
    if (v6) {
      [v9 enableOrphanedFragmentCleanupForCompositionAVURL:v6];
    }
  }
}

- (void)setController:(id)a3
{
  id v4 = a3;
  controllerObservance = self->_controllerObservance;
  if (controllerObservance)
  {
    [(RCKeyPathObservance *)controllerObservance remove];
    id v6 = self->_controllerObservance;
    self->_controllerObservance = 0;
  }
  objc_storeWeak((id *)&self->_controller, v4);
  if (v4)
  {
    [v4 targetTime];
    self->_targetTime = v7;
    self->_targetTrackIndex = (unint64_t)[v4 targetTrackIndex];
    self->_overdubbing = [v4 overdubbing];
    objc_initWeak(&location, self);
    objc_super v8 = +[NSString stringWithUTF8String:"targetTime"];
    v17[0] = v8;
    id v9 = +[NSString stringWithUTF8String:"targetTrackIndex"];
    v17[1] = v9;
    unsigned __int8 v10 = +[NSString stringWithUTF8String:"overdubbing"];
    v17[2] = v10;
    id v11 = +[NSString stringWithUTF8String:"silencing"];
    v17[3] = v11;
    v12 = +[NSArray arrayWithObjects:v17 count:4];

    objc_copyWeak(&v15, &location);
    RCObserveChangesToKeyPaths();
    id v13 = (RCKeyPathObservance *)objc_claimAutoreleasedReturnValue();
    v14 = self->_controllerObservance;
    self->_controllerObservance = v13;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (double)idleDuration
{
  return self->_currentDuration;
}

- (BOOL)monitorRecordingTime:(double *)a3 duration:(double *)a4
{
  double v11 = 0.0;
  double currentDuration = self->_currentDuration;
  double v7 = [(VMAudioRecorderImp *)self service];
  unsigned int v8 = [v7 sampleRecordingTime:&v11];

  if (v8)
  {
    double v9 = v11;
    *a3 = v11;
    if (v9 < currentDuration) {
      double v9 = currentDuration;
    }
    *a4 = v9;
  }
  return v8;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
  id v10 = [(VMAudioRecorderImp *)self service];
  id v5 = [v10 recordingError];
  if (v5)
  {
    id v6 = [(VMAudioRecorderImp *)self controller];
    [v6 setRecordingError:v5];

    [v10 setRecordingError:0];
  }
  unsigned int v7 = [v10 mode];
  BOOL v9 = a3 > 1 && v7 == 2;
  if ([(VMAudioRecorderImp *)self recording] != v9)
  {
    [(VMAudioRecorderImp *)self setRecording:v9];
    if (!a3) {
      AudioServicesPlaySystemSoundWithCompletion(0x45Au, &stru_100222130);
    }
  }
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained setCurrentTime:a3];
}

- (void)setRecordingError:(id)a3
{
  objc_storeStrong((id *)&self->_recordingError, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained setRecordingError:v5];
}

- (BOOL)startRecording
{
  self->_stopRecordingTime = 0.0;
  v3 = [(VMAudioRecorderImp *)self service];
  id v17 = 0;
  unsigned __int8 v4 = [v3 isRecordingEnabled:&v17];
  id v5 = v17;
  if (v4)
  {
    if ([(VMAudioRecorderImp *)self currentState])
    {
      id v6 = OSLogForCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10016BA20(self, v6);
      }
    }
    else
    {
      [(VMAudioRecorderImp *)self setCurrentState:1];
      id v6 = [(VMAudioRecorderImp *)self recordingID];
      if (!self->_overdubbing)
      {
        unsigned int v8 = +[TranscriptionAvailabilityProvider shared];
        unsigned int v9 = [v8 deviceIsSupported];

        if (v9)
        {
          id v10 = self->_recordingURL;
          if (v10)
          {
            double v11 = +[AVURLAsset rc_transcriptionDataForURL:self->_recordingURL];
          }
          else
          {
            double v11 = 0;
          }
          v12 = [[_TtC10VoiceMemos19RCLiveTranscription alloc] initWith:v11];
          liveTranscription = self->_liveTranscription;
          self->_liveTranscription = v12;
        }
      }
      if (v6)
      {
        [(VMAudioRecorderImp *)self _clearUndoStackCache];
        [(VMAudioRecorderImp *)self targetTime];
        [v3 replaceRecording:v6 atTime:self controller:self];
      }
      else
      {
        self->_double currentDuration = 0.0;
        [v3 startRecordingWithController:self];
      }
    }

    v14 = [(VMAudioRecorderImp *)self controller];
    id v15 = [v14 recordingError];
    BOOL v7 = v15 == 0;
  }
  else
  {
    [(VMAudioRecorderImp *)self setRecordingError:v5];
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)stopRecording
{
  v3 = [(VMAudioRecorderImp *)self context];
  [v3 setIsActionButtonInitiated:0];

  if (self->_stopRecordingTime == 0.0) {
    RCCurrentMediaTime();
  }

  return -[VMAudioRecorderImp stopRecordingAtTime:](self, "stopRecordingAtTime:");
}

- (BOOL)stopRecordingAtTime:(double)a3
{
  unsigned int v5 = [(VMAudioRecorderImp *)self currentState];
  unsigned __int8 v6 = 1;
  if (v5 && v5 != 3)
  {
    BOOL v7 = [(VMAudioRecorderImp *)self service];
    id v11 = 0;
    unsigned __int8 v6 = [v7 stopRecordingWithController:self atTime:&v11 error:a3];
    id v8 = v11;

    if ((v6 & 1) == 0)
    {
      unsigned int v9 = [(VMAudioRecorderImp *)self controller];
      [v9 setRecordingError:v8];
    }
  }
  return v6;
}

- (BOOL)_editRecording:(id)a3 error:(id *)a4
{
  unsigned __int8 v6 = (uint64_t (**)(id, void *, id *))a3;
  [(VMAudioRecorderImp *)self _discardRedoVersions];
  BOOL v7 = [(VMAudioRecorderImp *)self service];
  LOBYTE(a4) = v6[2](v6, v7, a4);

  return (char)a4;
}

- (BOOL)trimRecording:(id)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006BDD8;
  v5[3] = &unk_100222158;
  v5[4] = self;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = a3;
  return [(VMAudioRecorderImp *)self _editRecording:v5 error:a4];
}

- (BOOL)cutRecording:(id)a3 error:(id *)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006BEBC;
  v5[3] = &unk_100222158;
  v5[4] = self;
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = a3;
  return [(VMAudioRecorderImp *)self _editRecording:v5 error:a4];
}

- (void)finishEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(VMAudioRecorderImp *)self service];
  unsigned int v5 = [(VMAudioRecorderImp *)self recordingID];
  [v6 finalizeRecording:v5 controller:self saveAsNew:v3];
}

- (NSArray)versions
{
  if (self->_metadataURL)
  {
    v2 = +[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:");
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (BOOL)_buildUndoStackCache
{
  if (self->_undoStack) {
    return 1;
  }
  metadataURL = self->_metadataURL;
  if (!metadataURL) {
    return 1;
  }
  unsigned int v5 = metadataURL;
  id v6 = +[NSFileVersion otherVersionsOfItemAtURL:v5];
  BOOL v7 = +[NSMutableArray arrayWithArray:v6];
  undoStack = self->_undoStack;
  self->_undoStack = v7;

  id v15 = 0;
  unsigned int v9 = +[NSFileVersion _addVersionOfItemAtURL:v5 withContentsOfURL:v5 options:0 temporaryStorageIdentifier:0 error:&v15];
  id v10 = v15;
  BOOL v2 = v9 != 0;
  id v11 = self->_undoStack;
  if (v9)
  {
    [(NSMutableArray *)v11 addObject:v9];
    id v12 = [(NSMutableArray *)self->_undoStack count];

    self->_versionIndex = (unint64_t)v12 - 1;
  }
  else
  {
    self->_undoStack = 0;

    *(_OWORD *)&self->_versionIndex = xmmword_1001F0240;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    [WeakRetained setRecordingError:v10];
  }
  return v2;
}

- (BOOL)undoEditing
{
  BOOL v3 = self->_metadataURL;
  if (v3
    && [(VMAudioRecorderImp *)self _buildUndoStackCache]
    && (undoStack = self->_undoStack) != 0
    && (unint64_t versionIndex = self->_versionIndex) != 0)
  {
    self->_unint64_t versionIndex = versionIndex - 1;
    id v6 = -[NSMutableArray objectAtIndexedSubscript:](undoStack, "objectAtIndexedSubscript:");
    id v12 = 0;
    BOOL v7 = [v6 replaceItemAtURL:v3 options:0 error:&v12];
    id v8 = v12;
    if (v7 && ([v7 isEqual:v3] & 1) != 0)
    {
      BOOL v9 = [(VMAudioService *)self->_service refreshRecording:self->_recordingID controller:self];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      [WeakRetained setRecordingError:v8];

      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)redoEditing
{
  undoStack = self->_undoStack;
  if (!undoStack) {
    return 0;
  }
  unint64_t versionIndex = (char *)self->_versionIndex;
  if (versionIndex >= (char *)[(NSMutableArray *)undoStack count] - 1) {
    return 0;
  }
  unsigned int v5 = self->_metadataURL;
  if (v5)
  {
    id v6 = self->_undoStack;
    ++self->_versionIndex;
    BOOL v7 = -[NSMutableArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:");
    id v13 = 0;
    id v8 = [v7 replaceItemAtURL:v5 options:0 error:&v13];
    id v9 = v13;
    if (v8 && ([v8 isEqual:v5] & 1) != 0)
    {
      BOOL v10 = [(VMAudioService *)self->_service refreshRecording:self->_recordingID controller:self];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      [WeakRetained setRecordingError:v9];

      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_discardAllEdits
{
  BOOL v3 = self->_metadataURL;
  if (v3)
  {
    unsigned __int8 v4 = +[NSFileVersion otherVersionsOfItemAtURL:v3];
    unsigned int v5 = [v4 firstObject];
    id v6 = v5;
    if (v5)
    {
      id v13 = 0;
      BOOL v7 = [v5 replaceItemAtURL:v3 options:1 error:&v13];
      id v8 = v13;
      if (v7 && [v7 isEqual:v3])
      {
        [(VMAudioRecorderImp *)self _commitEditing];
        undoStack = self->_undoStack;
        self->_undoStack = 0;

        *(_OWORD *)&self->_unint64_t versionIndex = xmmword_1001F0240;
        [(VMAudioService *)self->_service refreshRecording:self->_recordingID controller:self];
        BOOL v10 = 1;
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
        [WeakRetained setRecordingError:v8];

        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)discardAllEdits
{
  return [(VMAudioRecorderImp *)self _discardAllEdits];
}

- (void)markCurrentVersion
{
  if (self->_undoStack || !self->_metadataURL)
  {
    self->_markedVersionIndex = self->_versionIndex;
  }
  else
  {
    +[NSFileVersion otherVersionsOfItemAtURL:](NSFileVersion, "otherVersionsOfItemAtURL:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [v4 count];
    self->_unint64_t versionIndex = (unint64_t)v3;
    self->_markedVersionIndex = (int64_t)v3;
  }
}

- (BOOL)_restoreMarkedVersion
{
  id v3 = self->_metadataURL;
  if (v3
    && (self->_markedVersionIndex & 0x8000000000000000) == 0
    && [(VMAudioRecorderImp *)self _buildUndoStackCache]
    && (undoStack = self->_undoStack) != 0)
  {
    self->_unint64_t versionIndex = self->_markedVersionIndex;
    self->_markedVersionIndex = -1;
    unsigned int v5 = -[NSMutableArray objectAtIndexedSubscript:](undoStack, "objectAtIndexedSubscript:");
    id v11 = 0;
    id v6 = [v5 replaceItemAtURL:v3 options:0 error:&v11];
    id v7 = v11;
    if (v6 && ([v6 isEqual:v3] & 1) != 0)
    {
      BOOL v8 = [(VMAudioService *)self->_service refreshRecording:self->_recordingID controller:self];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
      [WeakRetained setRecordingError:v7];

      [(VMAudioRecorderImp *)self _discardRedoVersions];
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)restoreMarkedVersion
{
  return [(VMAudioRecorderImp *)self _restoreMarkedVersion];
}

- (void)_discardRedoVersions
{
  undoStack = self->_undoStack;
  if (undoStack)
  {
    unint64_t v4 = self->_versionIndex + 1;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unsigned int v5 = -[NSMutableArray subarrayWithRange:](self->_undoStack, "subarrayWithRange:", v4, (char *)[(NSMutableArray *)undoStack count] - v4);
    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        id v9 = 0;
        do
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
          id v15 = 0;
          unsigned __int8 v11 = [v10 removeAndReturnError:&v15];
          id v12 = v15;
          if ((v11 & 1) == 0)
          {
            id v13 = OSLogForCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v21 = "-[VMAudioRecorderImp _discardRedoVersions]";
              __int16 v22 = 2112;
              id v23 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s -- removeError = %@", buf, 0x16u);
            }
          }
          id v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v7);
    }

    v14 = self->_undoStack;
    self->_undoStack = 0;
  }
}

- (void)_clearUndoStackCache
{
  undoStack = self->_undoStack;
  if (undoStack)
  {
    unint64_t v4 = [(NSMutableArray *)undoStack objectAtIndexedSubscript:self->_versionIndex];
    id v9 = 0;
    unsigned __int8 v5 = [v4 removeAndReturnError:&v9];
    id v6 = v9;
    if ((v5 & 1) == 0)
    {
      id v7 = OSLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10016BAC0();
      }
    }
    [(VMAudioRecorderImp *)self _discardRedoVersions];
    uint64_t v8 = self->_undoStack;
    self->_undoStack = 0;

    self->_unint64_t versionIndex = 0;
  }
}

- (void)_commitEditing
{
  BOOL v2 = self->_metadataURL;
  if (v2)
  {
    id v6 = 0;
    unsigned __int8 v3 = +[NSFileVersion removeOtherVersionsOfItemAtURL:v2 error:&v6];
    id v4 = v6;
    if ((v3 & 1) == 0)
    {
      unsigned __int8 v5 = OSLogForCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10016BB34();
      }
    }
  }
}

- (BOOL)shouldWaitForAccessToken
{
  unsigned __int8 v3 = +[VMAudioService sharedInstance];
  LOBYTE(self) = [v3 shouldWaitForAccessTokenBeforeStartingRecording:self];

  return (char)self;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
}

- (int)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(int)a3
{
  self->_targetState = a3;
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

- (BOOL)silencing
{
  return self->_silencing;
}

- (void)setSilencing:(BOOL)a3
{
  self->_silencing = a3;
}

- (int)currentState
{
  return self->_currentState;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (double)currentDuration
{
  return self->_currentDuration;
}

- (void)setCurrentDuration:(double)a3
{
  self->_double currentDuration = a3;
}

- (NSError)recordingError
{
  return self->_recordingError;
}

- (NSString)recordingID
{
  return self->_recordingID;
}

- (void)setRecordingID:(id)a3
{
}

- (NSURL)recordingURL
{
  return self->_recordingURL;
}

- (NSDate)recordingDate
{
  return self->_recordingDate;
}

- (void)setRecordingDate:(id)a3
{
}

- (VMAudioRecorderController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (VMAudioRecorderController *)WeakRetained;
}

- (RCSSavedRecordingAccessToken)recordingToken
{
  return self->_recordingToken;
}

- (void)setRecordingToken:(id)a3
{
}

- (RCComposition)recordingComposition
{
  return self->_recordingComposition;
}

- (void)setRecordingComposition:(id)a3
{
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
}

- (RCActivityWaveformProcessor)activityWaveformProcessor
{
  return self->_activityWaveformProcessor;
}

- (void)setActivityWaveformProcessor:(id)a3
{
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)editing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)ioStarted
{
  return self->_ioStarted;
}

- (void)setIoStarted:(BOOL)a3
{
  self->_ioStarted = a3;
}

- (double)stopRecordingTime
{
  return self->_stopRecordingTime;
}

- (void)setStopRecordingTime:(double)a3
{
  self->_stopRecordingTime = a3;
}

- (VMRecordingAssetsBackup)assetBackup
{
  return self->_assetBackup;
}

- (void)setAssetBackup:(id)a3
{
}

- (_TtC10VoiceMemos19RCLiveTranscription)liveTranscription
{
  return self->_liveTranscription;
}

- (void)setLiveTranscription:(id)a3
{
}

- (_TtC10VoiceMemos18VMRecordingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (VMAudioService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)titleBase
{
  return self->_titleBase;
}

- (void)setTitleBase:(id)a3
{
}

- (BOOL)isNewRecording
{
  return self->_isNewRecording;
}

- (void)setIsNewRecording:(BOOL)a3
{
  self->_isNewRecording = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBase, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_liveTranscription, 0);
  objc_storeStrong((id *)&self->_assetBackup, 0);
  objc_storeStrong((id *)&self->_activityWaveformProcessor, 0);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_recordingComposition, 0);
  objc_storeStrong((id *)&self->_recordingToken, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_recordingDate, 0);
  objc_storeStrong((id *)&self->_recordingURL, 0);
  objc_storeStrong((id *)&self->_recordingID, 0);
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_undoStack, 0);
  objc_storeStrong((id *)&self->_editingStatusObservance, 0);

  objc_storeStrong((id *)&self->_controllerObservance, 0);
}

@end