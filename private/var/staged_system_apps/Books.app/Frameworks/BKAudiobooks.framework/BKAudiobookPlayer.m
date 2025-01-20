@interface BKAudiobookPlayer
+ (BKAudiobookPlayer)shared;
+ (BKAudiobookPlayer)sharedInstance;
+ (float)playbackRateFrom:(int64_t)a3;
+ (id)testInstance;
+ (int64_t)playbackSpeedFrom:(float)a3;
- (BKAVPlayer)player;
- (BKAudiobook)currentAudiobook;
- (BKAudiobookBufferInfo)bufferInfo;
- (BKAudiobookBufferProducer)bufferProducer;
- (BKAudiobookChapter)currentChapter;
- (BKAudiobookPlayer)init;
- (BKAudiobookPlayerDataSource)dataSource;
- (BKAudiobookSkipController)skipController;
- (BKAudiobookTrack)currentTrack;
- (BOOL)_setCurrentChapterIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5;
- (BOOL)isLoadingResources;
- (BOOL)isPlaying;
- (BOOL)isPositionValid;
- (BOOL)isScrubbing;
- (BOOL)isStalling;
- (BOOL)isStreaming;
- (BOOL)nextChapterOrRestartAudiobook;
- (BOOL)playChapterAtIndex:(unint64_t)a3;
- (BOOL)playChapterAtIndex:(unint64_t)a3 offset:(double)a4;
- (BOOL)playNextChapter;
- (BOOL)playPreviousChapter;
- (BOOL)previousChapterOrRestartChapter;
- (BOOL)supportsAlternateArtwork;
- (NSArray)bufferedDurations;
- (NSArray)bufferedStartTimes;
- (NSArray)precisionRates;
- (NSArray)standardRates;
- (NSDate)pausedTime;
- (NSError)lastError;
- (NSHashTable)observers;
- (NSNumber)timeRemainingInBuffer;
- (_NSRange)currentChapterRange;
- (double)durationOfCurrentAudiobook;
- (double)durationOfCurrentChapter;
- (double)durationOfCurrentTrack;
- (double)listeningSessionStartTime;
- (double)pausedDuration;
- (double)positionInCurrentAudiobook;
- (double)positionInCurrentChapter;
- (double)positionInCurrentTrack;
- (double)timeBeforeCurrentTrack;
- (double)timeRemainingInCurrentAudiobook;
- (double)timeRemainingInCurrentChapter;
- (double)timeRemainingInCurrentTrack;
- (float)_initialVolume;
- (float)playbackRate;
- (float)volume;
- (id)_playerErrorWithPlayer:(id)a3 error:(id)a4;
- (id)_stateString;
- (id)allObservers;
- (id)mediaItem;
- (int)audibleDRMGroupID;
- (int64_t)playbackSpeed;
- (int64_t)state;
- (unint64_t)_chapterAtOffset:(double)a3 inTrack:(unint64_t)a4;
- (unint64_t)currentChapterIndex;
- (unint64_t)currentTrackIndex;
- (unint64_t)secondsToRewindAfterInterruption;
- (void)_addTimeObserversForTrack:(id)a3;
- (void)_configureAudioSession;
- (void)_resetPlayer:(id)a3;
- (void)_sendArtworkDidChangeTo:(id)a3;
- (void)_sendAudiobookDidChange;
- (void)_sendAudiobookWillChange;
- (void)_sendBufferedTimeRangesDidChange;
- (void)_sendChapterDidChange;
- (void)_sendCurrentPositionDidChange;
- (void)_sendIsScrubbing;
- (void)_sendIsStallingAndIsLoadingResources;
- (void)_sendPlaybackRateDidChange;
- (void)_sendPlayerFailedWithError:(id)a3;
- (void)_sendPlayerStalledWithError:(id)a3;
- (void)_sendReachedEndOfAudiobook;
- (void)_sendStateDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_setCurrentPosition:(double)a3 track:(unint64_t)a4 chapter:(unint64_t)a5 completion:(id)a6;
- (void)_setCurrentTrackIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5;
- (void)_updatePlayerWithOffsetInTrack:(double)a3 chapterIndex:(unint64_t)a4 hasTrackChanged:(BOOL)a5 changedArtworkBlock:(id)a6 currentTimeCompletion:(id)a7;
- (void)_updateTimeBeforeCurrentTrackWithTrackIndex:(unint64_t)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)decrementPrecisionRate;
- (void)fadeIn:(double)a3;
- (void)fadeOut:(double)a3;
- (void)incrementPrecisionRate;
- (void)movePositionInCurrentAudiobook:(double)a3 completion:(id)a4;
- (void)movePositionInCurrentChapter:(double)a3 completion:(id)a4;
- (void)movePositionInCurrentTrack:(double)a3 completion:(id)a4;
- (void)pause;
- (void)play;
- (void)player:(id)a3 bitrateChangedFrom:(float)a4 to:(float)a5;
- (void)player:(id)a3 didReachPosition:(double)a4;
- (void)player:(id)a3 failedWithError:(id)a4;
- (void)player:(id)a3 loadedTimeRangesDidChange:(id)a4 durations:(id)a5;
- (void)player:(id)a3 loadingResourcesStateDidChange:(BOOL)a4;
- (void)player:(id)a3 playbackStalledWithError:(id)a4;
- (void)player:(id)a3 positionDidChange:(double)a4;
- (void)player:(id)a3 stallingStateDidChange:(BOOL)a4;
- (void)player:(id)a3 stateChangedFrom:(int64_t)a4 to:(int64_t)a5;
- (void)player:(id)a3 volumeDidChange:(float)a4;
- (void)playerCurrentItemEnded:(id)a3;
- (void)playerWasInterrupted:(id)a3;
- (void)removeObserver:(id)a3;
- (void)resetPlayer;
- (void)setAudibleDRMGroupID:(int)a3;
- (void)setBufferProducer:(id)a3;
- (void)setBufferedDurations:(id)a3;
- (void)setBufferedStartTimes:(id)a3;
- (void)setCurrentAudiobook:(id)a3;
- (void)setCurrentAudiobook:(id)a3 initialPosition:(double)a4;
- (void)setCurrentChapterIndex:(unint64_t)a3;
- (void)setCurrentChapterRange:(_NSRange)a3;
- (void)setCurrentTrackIndex:(unint64_t)a3;
- (void)setListeningSessionStartTime:(double)a3;
- (void)setObservers:(id)a3;
- (void)setPausedTime:(id)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPlaybackSpeed:(int64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setPrecisionRates:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSecondsToRewindAfterInterruption:(unint64_t)a3;
- (void)setStandardRates:(id)a3;
- (void)setSupportsAlternateArtwork:(BOOL)a3;
- (void)setTimeBeforeCurrentTrack:(double)a3;
- (void)setVolume:(float)a3;
- (void)stop;
- (void)togglePlayPause;
@end

@implementation BKAudiobookPlayer

+ (BKAudiobookPlayer)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1D774;
  block[3] = &unk_3D0A0;
  block[4] = a1;
  if (qword_48F18 != -1) {
    dispatch_once(&qword_48F18, block);
  }
  v2 = (void *)qword_48F20;

  return (BKAudiobookPlayer *)v2;
}

+ (BKAudiobookPlayer)shared
{
  return +[BKAudiobookPlayer sharedInstance];
}

+ (id)testInstance
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (BKAudiobookPlayer)init
{
  v17.receiver = self;
  v17.super_class = (Class)BKAudiobookPlayer;
  id v2 = [(BKAudiobookPlayer *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[NSHashTable weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

    [(BKAudiobookPlayer *)v3 _configureAudioSession];
    *(int64x2_t *)&v3->_currentTrackIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v6 = [[BKAudiobookSkipController alloc] initWithAudiobookControls:v3];
    skipController = v3->_skipController;
    v3->_skipController = v6;

    [(BKAudiobookSkipController *)v3->_skipController setBaseEventInterval:0.4];
    [(BKAudiobookSkipController *)v3->_skipController accelerateToInterval:6 afterEventCount:0.2];
    [(BKAudiobookSkipController *)v3->_skipController setPlaySkipSoundEffect:1];
    v3->_audibleDRMGroupID = -1;
    v3->_secondsToRewindAfterInterruption = 0;
    standardRates = v3->_standardRates;
    v3->_standardRates = (NSArray *)&off_3E0B8;

    precisionRates = v3->_precisionRates;
    v3->_precisionRates = (NSArray *)&off_3E0D0;

    v3->_playbackSpeed = -1;
    [(BKAudiobookPlayer *)v3 _initialVolume];
    v3->_volume = v10;
    v11 = objc_alloc_init(BKAudiobookPlayerDataSource);
    dataSource = v3->_dataSource;
    v3->_dataSource = v11;

    [(BKAudiobookPlayerDataSource *)v3->_dataSource setDelegate:v3];
    uint64_t v13 = objc_opt_new();
    bufferProducer = v3->_bufferProducer;
    v3->_bufferProducer = (BKAudiobookBufferProducer *)v13;

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v3 selector:"_resetPlayer:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  [(BKAudiobookPlayer *)self stop];
  [(BKAudiobookPlayer *)self setObservers:0];
  v3 = [(BKAudiobookPlayer *)self player];
  [v3 setDelegate:0];

  [(BKAudiobookPlayer *)self setPlayer:0];
  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookPlayer;
  [(BKAudiobookPlayer *)&v4 dealloc];
}

- (NSError)lastError
{
  id v2 = [(BKAudiobookPlayer *)self player];
  v3 = [v2 lastError];

  return (NSError *)v3;
}

- (void)setCurrentAudiobook:(id)a3
{
}

- (void)setCurrentAudiobook:(id)a3 initialPosition:(double)a4
{
  v7 = (BKAudiobook *)a3;
  if (self->_currentAudiobook != v7)
  {
    [(BKAudiobookPlayer *)self _sendAudiobookWillChange];
    v8 = [(BKAudiobookPlayer *)self player];
    [v8 setDelegate:0];

    *(int64x2_t *)&self->_currentTrackIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_storeStrong((id *)&self->_currentAudiobook, a3);
    if (v7)
    {
      v9 = [(BKAudiobookPlayer *)self player];

      if (!v9)
      {
        float v10 = [BKAVPlayer alloc];
        v11 = [(BKAudiobookPlayer *)self dataSource];
        v12 = [(BKAVPlayer *)v10 initWithResourceLoader:v11];
        [(BKAudiobookPlayer *)self setPlayer:v12];

        [(BKAudiobookPlayer *)self volume];
        int v14 = v13;
        v15 = [(BKAudiobookPlayer *)self player];
        LODWORD(v16) = v14;
        [v15 setVolume:v16];

        objc_super v17 = [(BKAudiobookPlayer *)self player];
        [v17 playbackRate];
        int64_t v18 = +[BKAudiobookPlayer playbackSpeedFrom:](BKAudiobookPlayer, "playbackSpeedFrom:");

        if (v18 != -1) {
          self->_playbackSpeed = v18;
        }
      }
    }
    else
    {
      [(BKAudiobookPlayer *)self setPlayer:0];
    }
    v19 = [(BKAudiobookPlayer *)self player];
    [v19 setDelegate:self];

    v20 = BKAudiobooksLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = [(BKAudiobook *)self->_currentAudiobook title];
      *(_DWORD *)buf = 138412546;
      v34 = v21;
      __int16 v35 = 2048;
      double v36 = a4;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "setCurrentAudiobook: %@ initialPosition:%.1lf", buf, 0x16u);
    }
    self->_durationOfCurrentAudiobook = 0.0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v22 = [(BKAudiobook *)self->_currentAudiobook tracks];
    id v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v29;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v29 != v25) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) duration];
          self->_durationOfCurrentAudiobook = v27 + self->_durationOfCurrentAudiobook;
        }
        id v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v24);
    }

    [(BKAudiobookPlayer *)self movePositionInCurrentAudiobook:0 completion:a4];
    [(BKAudiobookPlayer *)self setListeningSessionStartTime:a4];
    [(BKAudiobookPlayer *)self _sendAudiobookDidChange];
  }
}

- (BOOL)isStreaming
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isStreaming];

  return v3;
}

- (BOOL)isStalling
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isStalling];

  return v3;
}

- (BOOL)isLoadingResources
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isLoadingResources];

  return v3;
}

- (NSNumber)timeRemainingInBuffer
{
  unsigned __int8 v3 = [(BKAudiobookPlayer *)self bufferProducer];
  [(BKAudiobookPlayer *)self positionInCurrentTrack];
  objc_super v4 = [v3 timeRemainingInBufferFromTrackPosition:];

  return (NSNumber *)v4;
}

- (BKAudiobookBufferInfo)bufferInfo
{
  id v2 = [(BKAudiobookPlayer *)self bufferProducer];
  unsigned __int8 v3 = [v2 bufferInfo];

  return (BKAudiobookBufferInfo *)v3;
}

- (BKAudiobookTrack)currentTrack
{
  [(BKAudiobookPlayer *)self currentTrackIndex];
  unint64_t v3 = [(BKAudiobookPlayer *)self currentTrackIndex];
  objc_super v4 = [(BKAudiobookPlayer *)self currentAudiobook];
  v5 = [v4 tracks];
  id v6 = [v5 count];

  if (v3 >= (unint64_t)v6)
  {
    float v10 = BKAudiobooksLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_25994();
    }

    v9 = 0;
  }
  else
  {
    v7 = [(BKAudiobookPlayer *)self currentAudiobook];
    v8 = [v7 tracks];
    v9 = [v8 objectAtIndexedSubscript:[self currentTrackIndex]];
  }

  return (BKAudiobookTrack *)v9;
}

- (BKAudiobookChapter)currentChapter
{
  if (self->_currentAudiobook)
  {
    [(BKAudiobookPlayer *)self currentChapterIndex];
    unint64_t v3 = [(BKAudiobookPlayer *)self currentChapterIndex];
    objc_super v4 = [(BKAudiobookPlayer *)self currentAudiobook];
    v5 = [v4 chapters];
    id v6 = [v5 count];

    if (v3 < (unint64_t)v6)
    {
      v7 = [(BKAudiobookPlayer *)self currentAudiobook];
      v8 = [v7 chapters];
      v9 = [v8 objectAtIndexedSubscript:[self currentChapterIndex]];

      goto LABEL_11;
    }
    unint64_t v10 = [(BKAudiobookPlayer *)self currentChapterIndex];
    v11 = BKAudiobooksLog();
    v12 = v11;
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v14 = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "current chapter requested but not set", v14, 2u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      sub_25A4C();
    }
  }
  v9 = 0;
LABEL_11:

  return (BKAudiobookChapter *)v9;
}

- (void)_addTimeObserversForTrack:(id)a3
{
  id v4 = a3;
  v5 = [(BKAudiobookPlayer *)self player];
  [v5 removeAllTimeObservers];

  id v6 = objc_opt_new();
  v7 = [v4 alternateArtworkTimes];
  v8 = [v7 objectEnumerator];

  v9 = [v4 chapters];
  unint64_t v10 = [v9 objectEnumerator];

  v11 = [v8 nextObject];
  uint64_t v12 = [v10 nextObject];
  int v13 = (void *)v12;
  while (v11 && v13)
  {
    [v13 timeRangeInTrack];
    CMTime time = v42;
    int v14 = +[NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
    [v11 doubleValue];
    double v16 = v15;
    [v14 doubleValue];
    if (vabdd_f64(v16, v17) >= 0.01)
    {
      [v11 doubleValue];
      double v22 = v21;
      [v14 doubleValue];
      if (v22 >= v23)
      {
        [v6 addObject:v14];
        uint64_t v25 = [v10 nextObject];
        v20 = v13;
        int v13 = (void *)v25;
      }
      else
      {
        [v6 addObject:v11];
        uint64_t v24 = [v8 nextObject];
        v20 = v11;
        v11 = (void *)v24;
      }
    }
    else
    {
      [v6 addObject:v11];
      uint64_t v18 = [v8 nextObject];

      uint64_t v19 = [v10 nextObject];
      v20 = v13;
      int v13 = (void *)v19;
      v11 = (void *)v18;
    }
  }
  if (v11)
  {
    do
    {
      [v6 addObject:v11];
      uint64_t v26 = [v8 nextObject];

      v11 = (void *)v26;
    }
    while (v26);
  }
  if (v13)
  {
    do
    {
      [v13 timeRangeInTrack];
      CMTime v41 = v40;
      double v27 = +[NSNumber numberWithDouble:CMTimeGetSeconds(&v41)];
      [v6 addObject:v27];
      uint64_t v28 = [v10 nextObject];

      int v13 = (void *)v28;
    }
    while (v28);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v29 = v6;
  id v30 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v37;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v29);
        }
        v34 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        __int16 v35 = [(BKAudiobookPlayer *)self player];
        [v34 doubleValue];
        [v35 addTimeObserver:];
      }
      id v31 = [v29 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v31);
  }
}

- (void)setCurrentChapterIndex:(unint64_t)a3
{
}

- (void)_setCurrentPosition:(double)a3 track:(unint64_t)a4 chapter:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v11 = BKAudiobooksLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v24 = a4;
    __int16 v25 = 2048;
    unint64_t v26 = a5;
    __int16 v27 = 2048;
    double v28 = a3;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "_setCurrentPosition: (track,chapter,offset) = (%lu,%lu,%f)", buf, 0x20u);
  }

  if (self->_currentTrackIndex == a4)
  {
    [(BKAudiobookPlayer *)self _updatePlayerWithOffsetInTrack:a5 chapterIndex:0 hasTrackChanged:0 changedArtworkBlock:v10 currentTimeCompletion:a3];
  }
  else
  {
    self->_currentTrackIndex = a4;
    uint64_t v12 = [(BKAudiobookPlayer *)self currentAudiobook];
    int v13 = [v12 tracks];
    int v14 = [v13 objectAtIndexedSubscript:a4];

    objc_initWeak((id *)buf, self);
    double v15 = [(BKAudiobookPlayer *)self player];
    double v16 = [v14 assetURL];
    uint64_t v17 = [(BKAudiobookPlayer *)self audibleDRMGroupID];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1E6BC;
    v19[3] = &unk_3D140;
    objc_copyWeak(v22, (id *)buf);
    id v18 = v14;
    id v20 = v18;
    v22[1] = (id)a4;
    v22[2] = *(id *)&a3;
    v22[3] = (id)a5;
    id v21 = v10;
    [v15 setAssetURL:v16 audibleDRMGroupID:v17 completion:v19];

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_updatePlayerWithOffsetInTrack:(double)a3 chapterIndex:(unint64_t)a4 hasTrackChanged:(BOOL)a5 changedArtworkBlock:(id)a6 currentTimeCompletion:(id)a7
{
  BOOL v8 = a5;
  id v19 = a6;
  id v12 = a7;
  int v13 = [(BKAudiobookPlayer *)self player];
  [v13 currentTime];
  double v15 = v14;

  if (v15 != a3)
  {
    double v16 = [(BKAudiobookPlayer *)self player];
    [v16 setCurrentTime:v12 completion:a3];

    if (self->_currentChapterIndex == a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (self->_currentChapterIndex != a4)
  {
LABEL_6:
    self->_currentChapterIndex = a4;
    [(BKAudiobookPlayer *)self _sendChapterDidChange];
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_12:
    id v17 = objc_retainBlock(v12);
    id v18 = v17;
    if (v17) {
      (*((void (**)(id, uint64_t))v17 + 2))(v17, 1);
    }

    goto LABEL_15;
  }
LABEL_7:
  if ([(BKAudiobookPlayer *)self isPositionValid]) {
    [(BKAudiobookPlayer *)self _sendCurrentPositionDidChange];
  }
  if (v8) {
    [(BKAudiobookPlayer *)self _sendArtworkDidChangeTo:v19];
  }
  if (v15 == a3) {
    goto LABEL_12;
  }
LABEL_15:
}

- (void)_updateTimeBeforeCurrentTrackWithTrackIndex:(unint64_t)a3
{
  self->_timeBeforeCurrentTrack = 0.0;
  if (a3)
  {
    for (uint64_t i = 0; i != a3; ++i)
    {
      id v6 = [(BKAudiobook *)self->_currentAudiobook tracks];
      v7 = [v6 objectAtIndexedSubscript:i];
      [v7 duration];
      self->_timeBeforeCurrentTrack = v8 + self->_timeBeforeCurrentTrack;
    }
  }
}

- (void)setCurrentTrackIndex:(unint64_t)a3
{
}

- (void)_setCurrentTrackIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = [(BKAudiobookPlayer *)self currentAudiobook];
  id v10 = [v9 tracks];
  id v11 = [v10 count];

  if ((unint64_t)v11 <= a3)
  {
    double v16 = BKAudiobooksLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_25B70();
    }

    id v17 = objc_retainBlock(v8);
    double v14 = v17;
    if (v17) {
      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }
  }
  else
  {
    id v12 = [(BKAudiobookPlayer *)self currentAudiobook];
    int v13 = [v12 tracks];
    double v14 = [v13 objectAtIndexedSubscript:a3];

    [v14 duration];
    if (v15 <= a4)
    {
      id v18 = BKAudiobooksLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_25B04();
      }

      id v19 = objc_retainBlock(v8);
      id v20 = v19;
      if (v19) {
        (*((void (**)(id, void))v19 + 2))(v19, 0);
      }
    }
    else
    {
      [(BKAudiobookPlayer *)self _setCurrentPosition:a3 track:[(BKAudiobookPlayer *)self _chapterAtOffset:a3 inTrack:a4] chapter:v8 completion:a4];
    }
  }
}

- (BOOL)_setCurrentChapterIndex:(unint64_t)a3 offset:(double)a4 completion:(id)a5
{
  id v8 = a5;
  v9 = [(BKAudiobookPlayer *)self currentAudiobook];
  id v10 = [v9 chapters];
  id v11 = [v10 count];

  if ((unint64_t)v11 <= a3)
  {
    double v16 = BKAudiobooksLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_25C44();
    }

    id v17 = objc_retainBlock(v8);
    double v14 = v17;
    if (v17) {
      (*((void (**)(id, void))v17 + 2))(v17, 0);
    }
    goto LABEL_14;
  }
  id v12 = [(BKAudiobookPlayer *)self currentAudiobook];
  int v13 = [v12 chapters];
  double v14 = [v13 objectAtIndexedSubscript:a3];

  [v14 duration];
  if (v15 <= a4)
  {
    id v18 = BKAudiobooksLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_25BD8();
    }

    id v19 = objc_retainBlock(v8);
    id v20 = v19;
    if (v19) {
      (*((void (**)(id, void))v19 + 2))(v19, 0);
    }

LABEL_14:
    BOOL v21 = 0;
    goto LABEL_17;
  }
  if (v14) {
    [v14 timeRangeInTrack];
  }
  else {
    memset(&v23, 0, sizeof(v23));
  }
  CMTime time = v23;
  -[BKAudiobookPlayer _setCurrentPosition:track:chapter:completion:](self, "_setCurrentPosition:track:chapter:completion:", [v14 albumTrackNumber], a3, v8, CMTimeGetSeconds(&time) + a4);
  BOOL v21 = 1;
LABEL_17:

  return v21;
}

- (double)positionInCurrentAudiobook
{
  [(BKAudiobookPlayer *)self timeBeforeCurrentTrack];
  double v4 = v3;
  [(BKAudiobookPlayer *)self positionInCurrentTrack];
  double result = v4 + v5;
  if (self->_durationOfCurrentAudiobook < result) {
    return self->_durationOfCurrentAudiobook;
  }
  return result;
}

- (void)movePositionInCurrentAudiobook:(double)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = [(BKAudiobookPlayer *)self currentAudiobook];
  id v8 = [v7 tracks];

  v9 = (char *)[v8 count];
  if (v9)
  {
    id v10 = v9;
    id v11 = 0;
    double v12 = 0.0;
    while (1)
    {
      int v13 = [v8 objectAtIndexedSubscript:v11];
      [v13 duration];
      double v15 = v12 + v14;
      if (v12 <= a3 && v15 > a3) {
        break;
      }

      ++v11;
      double v12 = v15;
      if (v10 == v11) {
        goto LABEL_9;
      }
    }
    [(BKAudiobookPlayer *)self _setCurrentTrackIndex:v11 offset:v6 completion:a3 - v12];
  }
  else
  {
LABEL_9:
    id v17 = BKAudiobooksLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_25CAC(self);
    }

    [(BKAudiobookPlayer *)self _setCurrentTrackIndex:0 offset:v6 completion:0.0];
  }
}

- (double)timeRemainingInCurrentAudiobook
{
  [(BKAudiobookPlayer *)self durationOfCurrentAudiobook];
  double v4 = v3;
  [(BKAudiobookPlayer *)self positionInCurrentAudiobook];
  return v4 - v5;
}

- (double)durationOfCurrentAudiobook
{
  return self->_durationOfCurrentAudiobook;
}

- (double)positionInCurrentTrack
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 currentTime];
  double v4 = v3;

  return v4;
}

- (void)movePositionInCurrentTrack:(double)a3 completion:(id)a4
{
}

- (BOOL)isPositionValid
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isCurrentTimeValid];

  return v3;
}

- (double)durationOfCurrentTrack
{
  id v2 = [(BKAudiobookPlayer *)self currentTrack];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (double)timeRemainingInCurrentTrack
{
  [(BKAudiobookPlayer *)self durationOfCurrentTrack];
  double v4 = v3;
  [(BKAudiobookPlayer *)self positionInCurrentTrack];
  return v4 - v5;
}

- (double)pausedDuration
{
  double v3 = [(BKAudiobookPlayer *)self pausedTime];
  if (v3)
  {
    double v4 = +[NSDate date];
    double v5 = [(BKAudiobookPlayer *)self pausedTime];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (double)positionInCurrentChapter
{
  double v3 = [(BKAudiobookPlayer *)self currentChapter];
  double v4 = v3;
  if (v3)
  {
    [v3 timeRangeInTrack];
  }
  else
  {
    long long v10 = 0u;
    memset(v9, 0, sizeof(v9));
  }
  CMTime time = *(CMTime *)v9;
  Float64 Seconds = CMTimeGetSeconds(&time);
  [(BKAudiobookPlayer *)self positionInCurrentTrack];
  double v7 = v6 - Seconds;

  return v7;
}

- (void)movePositionInCurrentChapter:(double)a3 completion:(id)a4
{
  id v6 = a4;
  double v7 = [(BKAudiobookPlayer *)self currentChapter];
  id v8 = v7;
  if (a3 < 0.0 || ([v7 duration], v9 <= a3))
  {
    long long v10 = BKAudiobooksLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_25D48();
    }

    id v11 = objc_retainBlock(v6);
    double v12 = v11;
    if (v11) {
      (*((void (**)(id, void))v11 + 2))(v11, 0);
    }
  }
  else
  {
    if (v8) {
      [v8 timeRangeInTrack];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CMTime time = v13;
    [(BKAudiobookPlayer *)self _setCurrentPosition:[(BKAudiobookPlayer *)self currentTrackIndex] track:[(BKAudiobookPlayer *)self currentChapterIndex] chapter:v6 completion:CMTimeGetSeconds(&time) + a3];
  }
}

- (double)timeRemainingInCurrentChapter
{
  [(BKAudiobookPlayer *)self durationOfCurrentChapter];
  double v4 = v3;
  [(BKAudiobookPlayer *)self positionInCurrentChapter];
  return v4 - v5;
}

- (double)durationOfCurrentChapter
{
  id v2 = [(BKAudiobookPlayer *)self currentChapter];
  [v2 duration];
  double v4 = v3;

  return v4;
}

- (void)play
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 play];
}

- (void)pause
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 pause];
}

- (void)togglePlayPause
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 togglePlayPause];
}

- (void)stop
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 stop];
}

- (void)fadeIn:(double)a3
{
  id v4 = [(BKAudiobookPlayer *)self player];
  [v4 fadeIn:a3];
}

- (void)fadeOut:(double)a3
{
  id v4 = [(BKAudiobookPlayer *)self player];
  [v4 fadeOut:a3];
}

- (BOOL)playChapterAtIndex:(unint64_t)a3
{
  double v5 = [(BKAudiobookPlayer *)self currentAudiobook];
  id v6 = [v5 chapters];
  id v7 = [v6 count];

  if ((unint64_t)v7 <= a3)
  {
    id v8 = BKAudiobooksLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_25DC4(self);
    }

    return 0;
  }
  else
  {
    return [(BKAudiobookPlayer *)self playChapterAtIndex:a3 offset:0.0];
  }
}

- (BOOL)playChapterAtIndex:(unint64_t)a3 offset:(double)a4
{
  id v7 = BKAudiobooksLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218240;
    unint64_t v11 = a3;
    __int16 v12 = 2048;
    double v13 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "playChapterAtIndex:%lu offset:%f", (uint8_t *)&v10, 0x16u);
  }

  BOOL v8 = [(BKAudiobookPlayer *)self _setCurrentChapterIndex:a3 offset:0 completion:a4];
  if (v8) {
    [(BKAudiobookPlayer *)self play];
  }
  return v8;
}

- (BOOL)playNextChapter
{
  double v3 = [(BKAudiobookPlayer *)self currentAudiobook];

  if (v3)
  {
    unint64_t v4 = self->_currentChapterIndex + 1;
    double v5 = [(BKAudiobookPlayer *)self currentAudiobook];
    id v6 = [v5 chapters];
    id v7 = [v6 count];

    if (v4 < (unint64_t)v7)
    {
      [(BKAudiobookPlayer *)self playChapterAtIndex:v4];
      return 1;
    }
    double v9 = BKAudiobooksLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "BKAudiobookPlayer stopping playback because there are no remaining chapters", v10, 2u);
    }

    [(BKAudiobookPlayer *)self stop];
  }
  return 0;
}

- (BOOL)playPreviousChapter
{
  double v3 = [(BKAudiobookPlayer *)self currentAudiobook];
  if (v3)
  {
    unint64_t currentChapterIndex = self->_currentChapterIndex;

    if (currentChapterIndex)
    {
      [(BKAudiobookPlayer *)self playChapterAtIndex:self->_currentChapterIndex - 1];
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return (char)v3;
}

- (BOOL)previousChapterOrRestartChapter
{
  id v2 = +[BKAudiobookPlayer sharedInstance];
  [v2 positionInCurrentChapter];
  if (v3 <= 5.0 && [v2 currentChapterIndex])
  {
    unint64_t v4 = BKAudiobooksLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Within threshold. Going to previous chapter.", buf, 2u);
    }

    [v2 setCurrentChapterIndex:[v2 currentChapterIndex] - 1];
  }
  else
  {
    double v5 = BKAudiobooksLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Outside of threshold or no previous chapter. Restarting chapter.", v7, 2u);
    }

    [v2 movePositionInCurrentChapter:0 completion:0.0];
  }

  return 1;
}

- (BOOL)nextChapterOrRestartAudiobook
{
  id v2 = +[BKAudiobookPlayer sharedInstance];
  double v3 = (char *)[v2 currentChapterIndex];
  unint64_t v4 = [v2 currentAudiobook];
  double v5 = [v4 chapters];
  id v6 = (char *)[v5 count] - 1;

  id v7 = BKAudiobooksLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3 >= v6)
  {
    if (v8)
    {
      *(_WORD *)unint64_t v11 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "At the last chapter. Restarting from beginning.", v11, 2u);
    }

    double v9 = 0;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Going to next chapter.", buf, 2u);
    }

    double v9 = (char *)[v2 currentChapterIndex] + 1;
  }
  [v2 setCurrentChapterIndex:v9];

  return 1;
}

- (int64_t)state
{
  id v2 = [(BKAudiobookPlayer *)self player];
  id v3 = [v2 state];

  return (int64_t)v3;
}

- (BOOL)isPlaying
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isPlaying];

  return v3;
}

- (BOOL)isScrubbing
{
  id v2 = [(BKAudiobookPlayer *)self player];
  unsigned __int8 v3 = [v2 isScrubbing];

  return v3;
}

- (void)setScrubbing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BKAudiobookPlayer *)self isScrubbing] != a3)
  {
    double v5 = [(BKAudiobookPlayer *)self player];
    [v5 setScrubbing:v3];

    objc_initWeak(&location, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1FB18;
    v6[3] = &unk_3C850;
    objc_copyWeak(&v7, &location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (float)playbackRate
{
  id v2 = [(BKAudiobookPlayer *)self player];
  [v2 playbackRate];
  float v4 = v3;

  return v4;
}

- (void)setPlaybackRate:(float)a3
{
  double v5 = [(BKAudiobookPlayer *)self player];
  *(float *)&double v6 = a3;
  [v5 setPlaybackRate:v6];

  *(float *)&double v7 = a3;
  int64_t v8 = +[BKAudiobookPlayer playbackSpeedFrom:v7];
  if (v8 != -1) {
    self->_playbackSpeed = v8;
  }
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1FC80;
  v9[3] = &unk_3C850;
  objc_copyWeak(&v10, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)incrementPrecisionRate
{
  float v3 = [(BKAudiobookPlayer *)self player];
  [v3 playbackRate];
  int v5 = v4;

  double v6 = [(BKAudiobookPlayer *)self precisionRates];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1FE04;
  v13[3] = &unk_3D160;
  int v14 = v5;
  double v7 = (char *)[v6 indexOfObjectPassingTest:v13];

  if (v7 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = BKAudiobooksLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_25E74();
    }
  }
  else
  {
    double v9 = [(BKAudiobookPlayer *)self precisionRates];
    id v10 = (char *)[v9 count] - 1;

    if (v7 == v10) {
      unint64_t v11 = v7;
    }
    else {
      unint64_t v11 = v7 + 1;
    }
    int64_t v8 = [(BKAudiobookPlayer *)self precisionRates];
    __int16 v12 = [v8 objectAtIndexedSubscript:v11];
    [v12 floatValue];
    -[BKAudiobookPlayer setPlaybackRate:](self, "setPlaybackRate:");
  }
}

- (void)decrementPrecisionRate
{
  float v3 = [(BKAudiobookPlayer *)self player];
  [v3 playbackRate];
  int v5 = v4;

  double v6 = [(BKAudiobookPlayer *)self precisionRates];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1FF8C;
  v10[3] = &unk_3D160;
  int v11 = v5;
  double v7 = (char *)[v6 indexOfObjectPassingTest:v10];

  if (!v7) {
    goto LABEL_6;
  }
  if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    --v7;
LABEL_6:
    int64_t v8 = [(BKAudiobookPlayer *)self precisionRates];
    double v9 = [v8 objectAtIndexedSubscript:v7];
    [v9 floatValue];
    -[BKAudiobookPlayer setPlaybackRate:](self, "setPlaybackRate:");

    goto LABEL_7;
  }
  int64_t v8 = BKAudiobooksLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_25EE4();
  }
LABEL_7:
}

- (float)volume
{
  float v3 = [(BKAudiobookPlayer *)self player];
  int v4 = v3;
  if (v3)
  {
    [v3 volume];
    float volume = v5;
  }
  else
  {
    float volume = self->_volume;
  }

  return volume;
}

- (void)setVolume:(float)a3
{
  if (self->_volume != a3)
  {
    self->_float volume = a3;
    id v5 = [(BKAudiobookPlayer *)self player];
    *(float *)&double v4 = a3;
    [v5 setVolume:v4];
  }
}

- (int64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(int64_t)a3
{
  +[BKAudiobookPlayer playbackRateFrom:a3];

  -[BKAudiobookPlayer setPlaybackRate:](self, "setPlaybackRate:");
}

+ (float)playbackRateFrom:(int64_t)a3
{
  switch(a3)
  {
    case -1:
      float v3 = BKAudiobooksLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_25F54();
      }

      float result = 1.0;
      break;
    case 0:
      float result = 0.75;
      break;
    case 1:
      float result = 1.0;
      break;
    case 2:
      float result = 1.25;
      break;
    case 3:
      float result = 1.5;
      break;
    case 4:
      float result = 1.75;
      break;
    case 5:
      float result = 2.0;
      break;
    default:
      float result = 0.0;
      break;
  }
  return result;
}

+ (int64_t)playbackSpeedFrom:(float)a3
{
  double v3 = a3;
  if (fabs(v3 + -0.75) < 0.00999999978) {
    return 0;
  }
  if (fabs(v3 + -1.0) < 0.00999999978) {
    return 1;
  }
  if (fabs(v3 + -1.25) < 0.00999999978) {
    return 2;
  }
  if (fabs(v3 + -1.5) < 0.00999999978) {
    return 3;
  }
  if (fabs(v3 + -1.75) < 0.00999999978) {
    return 4;
  }
  if (fabs(v3 + -2.0) >= 0.00999999978) {
    return -1;
  }
  return 5;
}

- (void)_configureAudioSession
{
  id v2 = BKAudiobooksLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "_configureAudioSession", v4, 2u);
  }

  double v3 = +[AVAudioSession sharedInstance];
  [v3 setCategory:AVAudioSessionCategoryPlayback mode:AVAudioSessionModeSpokenAudio routeSharingPolicy:1 options:0 error:0];
}

- (void)resetPlayer
{
}

- (void)_resetPlayer:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2049C;
  v8[3] = &unk_3C850;
  objc_copyWeak(&v9, &location);
  id v5 = objc_retainBlock(v8);
  if (v5)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v5[2])(v5);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_20504;
      block[3] = &unk_3C6C0;
      double v7 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (unint64_t)_chapterAtOffset:(double)a3 inTrack:(unint64_t)a4
{
  double v7 = BKAudiobooksLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_25F88();
  }

  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  memset(&v14, 0, sizeof(v14));
  CMTimeMake(&v14, (uint64_t)((a3 + 0.001) * 1000.0), 1000);
  int64_t v8 = [(BKAudiobookPlayer *)self currentAudiobook];
  id v9 = [v8 chapters];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_20688;
  v12[3] = &unk_3D188;
  CMTime v13 = v14;
  v12[4] = &v15;
  v12[5] = a4;
  [v9 enumerateObjectsUsingBlock:v12];
  unint64_t v10 = v16[3];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (float)_initialVolume
{
  return 1.0;
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  double v6 = [(BKAudiobookPlayer *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  double v6 = [(BKAudiobookPlayer *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = [(BKAudiobookPlayer *)self observers];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_accessLock);

  return v5;
}

- (void)_sendAudiobookWillChange
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BKAudiobookPlayer *)self currentAudiobook];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observer: audiobook will change = %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKAudiobookPlayer *)self allObservers];
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
        unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          int v11 = [(BKAudiobookPlayer *)self currentAudiobook];
          [v10 player:self audiobookWillChange:v11];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_sendAudiobookDidChange
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BKAudiobookPlayer *)self currentAudiobook];
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observer: audiobook did change = %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKAudiobookPlayer *)self allObservers];
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
        unint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          int v11 = [(BKAudiobookPlayer *)self currentAudiobook];
          [v10 player:self audiobookDidChange:v11];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_sendChapterDidChange
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v17 = [(BKAudiobookPlayer *)self currentChapterIndex];
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observer: chapter = %lu", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(BKAudiobookPlayer *)self allObservers];
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          unint64_t v10 = [(BKAudiobookPlayer *)self currentChapter];
          [v9 player:self chapterDidChange:v10];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [(BKAudiobookPlayer *)self _sendBufferedTimeRangesDidChange];
}

- (void)_sendArtworkDidChangeTo:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  if (self->_supportsAlternateArtwork)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [(BKAudiobookPlayer *)self allObservers];
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    if (v6)
    {
      id v8 = v6;
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)v16;
      *(void *)&long long v7 = 134217984;
      long long v14 = v7;
      do
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v5);
          }
          long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            if (v4 && !v9)
            {
              long long v13 = BKAudiobooksLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v14;
                uint64_t v20 = 0;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "observer: artwork = %p", buf, 0xCu);
              }

              uint64_t v9 = v4[2](v4);
            }
            [v12 player:self artworkDidChange:v9];
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
      }
      while (v8);
    }
  }
}

- (id)_stateString
{
  int64_t v2 = [(BKAudiobookPlayer *)self state];
  if ((unint64_t)(v2 - 1) > 3) {
    return @"unknown";
  }
  else {
    return off_3D1D0[v2 - 1];
  }
}

- (void)_sendStateDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  long long v7 = BKAudiobooksLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(BKAudiobookPlayer *)self _stateString];
    *(_DWORD *)buf = 138412290;
    BOOL v21 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "observer: state = %@", buf, 0xCu);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v9 = [(BKAudiobookPlayer *)self allObservers];
  id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v13);
        if (objc_opt_respondsToSelector()) {
          [v14 player:self stateDidChangeFrom:a3 to:a4];
        }
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (void)_sendCurrentPositionDidChange
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_26000(self);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(BKAudiobookPlayer *)self allObservers];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          [(BKAudiobookPlayer *)self positionInCurrentChapter];
          double v11 = v10;
          unint64_t v12 = [(BKAudiobookPlayer *)self currentChapterIndex];
          [(BKAudiobookPlayer *)self positionInCurrentAudiobook];
          [v9 player:self currentPositionDidChange:v12 inChapter:v11 absolutePosition:v13];
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
}

- (void)_sendPlaybackRateDidChange
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [(BKAudiobookPlayer *)self positionInCurrentChapter];
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observer: position = %f", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(BKAudiobookPlayer *)self allObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          [(BKAudiobookPlayer *)self playbackRate];
          [v10 player:playbackRateDidChange:self];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sendPlayerFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = BKAudiobooksLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_26078();
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(BKAudiobookPlayer *)self allObservers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 player:self failedWithError:v4];
        }
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_sendPlayerStalledWithError:(id)a3
{
  id v4 = a3;
  id v5 = BKAudiobooksLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_260E0();
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(BKAudiobookPlayer *)self allObservers];
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          [v11 player:self playbackStalledWithError:v4];
        }
        double v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)_sendReachedEndOfAudiobook
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BKAudiobookPlayer *)self currentAudiobook];
    *(_DWORD *)buf = 138412290;
    long long v18 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "observer: audiobook = %@", buf, 0xCu);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKAudiobookPlayer *)self allObservers];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector())
        {
          long long v11 = [(BKAudiobookPlayer *)self currentAudiobook];
          [v10 player:self reachedEndOfAudiobook:v11];
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_sendIsScrubbing
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_26148(self);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(BKAudiobookPlayer *)self allObservers];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector()) {
          [v9 player:self isScrubbing:[self isScrubbing]];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_sendIsStallingAndIsLoadingResources
{
  double v3 = BKAudiobooksLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_26148(self);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(BKAudiobookPlayer *)self allObservers];
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v8);
        if (objc_opt_respondsToSelector())
        {
          long long v10 = [(BKAudiobookPlayer *)self player];
          id v11 = [v10 isStalling];
          long long v12 = [(BKAudiobookPlayer *)self player];
          [v9 player:self isStalling:v11 isLoadingResources:[v12 isLoadingResources]];
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)_sendBufferedTimeRangesDidChange
{
  double v3 = [(BKAudiobookPlayer *)self bufferProducer];
  id v4 = [(BKAudiobookPlayer *)self currentChapter];
  id v5 = [(BKAudiobookPlayer *)self bufferedStartTimes];
  id v6 = [(BKAudiobookPlayer *)self bufferedDurations];
  [v3 updateWithChapter:v4 bufferedTrackPositions:v5 bufferedTrackDurations:v6];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(BKAudiobookPlayer *)self allObservers];
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v11);
        if (objc_opt_respondsToSelector())
        {
          unint64_t v13 = [(BKAudiobookPlayer *)self currentChapterIndex];
          long long v14 = [(BKAudiobookPlayer *)self bufferInfo];
          [v12 player:self bufferedPositionsDidChangeInChapter:v13 bufferInfo:v14];
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)player:(id)a3 stateChangedFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8 = a3;
  id v9 = BKAudiobooksLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromBKAudiobookPlayerState(a4);
    id v11 = NSStringFromBKAudiobookPlayerState(a5);
    int v14 = 138412546;
    long long v15 = v10;
    __int16 v16 = 2112;
    long long v17 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Player state changed from %@ to %@", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [(BKAudiobookPlayer *)self player];

  if (v12 == v8)
  {
    if ((unint64_t)a5 >= 3)
    {
      if (a5 == 3)
      {
        if (a4 != 3)
        {
          unint64_t v13 = +[NSDate date];
          [(BKAudiobookPlayer *)self setPausedTime:v13];
        }
        goto LABEL_9;
      }
      if (a5 != 4)
      {
LABEL_9:
        [(BKAudiobookPlayer *)self _sendStateDidChangeFrom:a4 to:a5];
        return;
      }
      [(BKAudiobookPlayer *)self setCurrentTrackIndex:0];
    }
    [(BKAudiobookPlayer *)self setPausedTime:0];
    goto LABEL_9;
  }
}

- (void)player:(id)a3 positionDidChange:(double)a4
{
  id v5 = a3;
  id v6 = [(BKAudiobookPlayer *)self player];

  if (v6 == v5)
  {
    [(BKAudiobookPlayer *)self _sendCurrentPositionDidChange];
  }
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(BKAudiobookPlayer *)self player];

  if (v7 == v9)
  {
    id v8 = [(BKAudiobookPlayer *)self _playerErrorWithPlayer:v9 error:v6];
    [(BKAudiobookPlayer *)self _sendPlayerFailedWithError:v8];
  }
}

- (void)player:(id)a3 playbackStalledWithError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [(BKAudiobookPlayer *)self player];

  if (v7 == v9)
  {
    id v8 = [(BKAudiobookPlayer *)self _playerErrorWithPlayer:v9 error:v6];
    [(BKAudiobookPlayer *)self _sendPlayerStalledWithError:v8];
  }
}

- (id)_playerErrorWithPlayer:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [a3 assetNetworkError];
  if (v6)
  {
    id v7 = BKAudiobooksLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_262C8();
    }

    id v8 = v5;
    uint64_t v9 = 1;
    id v5 = v6;
LABEL_5:

    int v10 = 0;
    goto LABEL_13;
  }
  id v11 = [v5 domain];
  unsigned int v12 = [v11 isEqualToString:AVFoundationErrorDomain];

  if (v12)
  {
    id v13 = [v5 code];
    if (v13 == (id)-11819)
    {
      id v8 = BKAudiobooksLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_26294();
      }
      uint64_t v9 = 3;
      goto LABEL_5;
    }
    if (v13 == (id)-11835)
    {
      id v8 = BKAudiobooksLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_26260();
      }
      uint64_t v9 = 2;
      goto LABEL_5;
    }
  }
  uint64_t v9 = 0;
  int v10 = 1;
LABEL_13:
  int v14 = [v5 domain];
  if (![v14 isEqualToString:BLErrorDomain])
  {

    if (!v10) {
      goto LABEL_20;
    }
LABEL_23:
    long long v18 = BKAudiobooksLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_261CC();
    }

    uint64_t v9 = 0;
    if (v5) {
      goto LABEL_21;
    }
    goto LABEL_26;
  }
  long long v15 = (char *)[v5 code];

  if (v15 == stru_20.segname) {
    char v16 = 0;
  }
  else {
    char v16 = v10;
  }
  if (v15 == stru_20.segname) {
    uint64_t v9 = 5;
  }
  if (v16) {
    goto LABEL_23;
  }
LABEL_20:
  if (v5)
  {
LABEL_21:
    NSErrorUserInfoKey v21 = NSUnderlyingErrorKey;
    double v22 = v5;
    long long v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    goto LABEL_27;
  }
LABEL_26:
  long long v17 = 0;
LABEL_27:
  id v19 = +[NSError errorWithDomain:@"BKAudiobookPlayerErrorDomain" code:v9 userInfo:v17];

  return v19;
}

- (void)player:(id)a3 stallingStateDidChange:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(BKAudiobookPlayer *)self player];

  if (v6 == v5)
  {
    [(BKAudiobookPlayer *)self _sendIsStallingAndIsLoadingResources];
  }
}

- (void)player:(id)a3 loadingResourcesStateDidChange:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(BKAudiobookPlayer *)self player];

  if (v6 == v5)
  {
    [(BKAudiobookPlayer *)self _sendIsStallingAndIsLoadingResources];
  }
}

- (void)player:(id)a3 didReachPosition:(double)a4
{
  id v6 = a3;
  id v7 = BKAudiobooksLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v28 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "handling boundary time: %.1f", buf, 0xCu);
  }

  id v8 = [(BKAudiobookPlayer *)self player];

  if (v8 == v6)
  {
    if ([v6 isScrubbing])
    {
      [v6 pause];
    }
    else
    {
      unint64_t v9 = [(BKAudiobookPlayer *)self _chapterAtOffset:self->_currentTrackIndex inTrack:a4];
      if (v9 == self->_currentChapterIndex)
      {
        int v10 = BKAudiobooksLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_2635C();
        }
      }
      else
      {
        self->_unint64_t currentChapterIndex = v9;
        [(BKAudiobookPlayer *)self _sendChapterDidChange];
        [(BKAudiobookPlayer *)self _sendCurrentPositionDidChange];
      }
      id v11 = [(BKAudiobookPlayer *)self currentTrack];
      if ([v11 hasAlternateArtwork])
      {
        [v11 alternateArtworkTimes];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v12);
              }
              long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              [v17 doubleValue];
              if (vabdd_f64(v18, a4) < 0.01)
              {
                v19[0] = _NSConcreteStackBlock;
                v19[1] = 3221225472;
                v19[2] = sub_226D8;
                v19[3] = &unk_3D1B0;
                id v20 = v11;
                NSErrorUserInfoKey v21 = v17;
                [(BKAudiobookPlayer *)self _sendArtworkDidChangeTo:v19];

                goto LABEL_22;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }
LABEL_22:
      }
    }
  }
}

- (void)playerCurrentItemEnded:(id)a3
{
  id v4 = a3;
  id v5 = [(BKAudiobookPlayer *)self player];

  if (v5 == v4)
  {
    id v6 = BKAudiobooksLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "playerCurrentItemEnded:", buf, 2u);
    }

    id v7 = (char *)[(BKAudiobookPlayer *)self currentTrackIndex] + 1;
    id v8 = [(BKAudiobookPlayer *)self currentAudiobook];
    unint64_t v9 = [v8 tracks];
    int v10 = (char *)[v9 count];

    if (v7 >= v10)
    {
      id v11 = BKAudiobooksLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12[0] = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "playerCurrentItemEnded: stopping audiobook playback as there are no remaining tracks", (uint8_t *)v12, 2u);
      }

      [(BKAudiobookPlayer *)self stop];
      [(BKAudiobookPlayer *)self _sendReachedEndOfAudiobook];
    }
    else
    {
      [(BKAudiobookPlayer *)self setCurrentTrackIndex:v7];
      [(BKAudiobookPlayer *)self play];
    }
  }
}

- (void)player:(id)a3 loadedTimeRangesDidChange:(id)a4 durations:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(BKAudiobookPlayer *)self player];

  if (v11 == v10)
  {
    id v12 = [v8 count];
    if (v12 == [v9 count])
    {
      [(BKAudiobookPlayer *)self setBufferedStartTimes:v8];
      [(BKAudiobookPlayer *)self setBufferedDurations:v9];
      [(BKAudiobookPlayer *)self _sendBufferedTimeRangesDidChange];
    }
    else
    {
      id v13 = BKAudiobooksLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_2639C();
      }
    }
  }
}

- (void)playerWasInterrupted:(id)a3
{
  if (self->_secondsToRewindAfterInterruption)
  {
    [(BKAudiobookPlayer *)self positionInCurrentAudiobook];
    double v5 = fmax(v4 - (double)self->_secondsToRewindAfterInterruption, 0.0);
    [(BKAudiobookPlayer *)self movePositionInCurrentAudiobook:0 completion:v5];
  }
}

- (void)player:(id)a3 bitrateChangedFrom:(float)a4 to:(float)a5
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(BKAudiobookPlayer *)self allObservers];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v12);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v14 = a4;
          *(float *)&double v15 = a5;
          [v13 player:self bitRateChangedFrom:v14 to:v15];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (void)player:(id)a3 volumeDidChange:(float)a4
{
  self->_float volume = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(BKAudiobookPlayer *)self allObservers];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector())
        {
          *(float *)&double v12 = a4;
          [v11 player:self volumeDidChange:v12];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)mediaItem
{
  int64_t v2 = [(BKAudiobookPlayer *)self currentAudiobook];
  double v3 = [v2 representativeItem];

  return v3;
}

- (BKAudiobook)currentAudiobook
{
  return self->_currentAudiobook;
}

- (unint64_t)currentTrackIndex
{
  return self->_currentTrackIndex;
}

- (unint64_t)currentChapterIndex
{
  return self->_currentChapterIndex;
}

- (double)listeningSessionStartTime
{
  return self->_listeningSessionStartTime;
}

- (void)setListeningSessionStartTime:(double)a3
{
  self->_listeningSessionStartTime = a3;
}

- (int)audibleDRMGroupID
{
  return self->_audibleDRMGroupID;
}

- (void)setAudibleDRMGroupID:(int)a3
{
  self->_audibleDRMGroupID = a3;
}

- (BKAudiobookSkipController)skipController
{
  return self->_skipController;
}

- (NSArray)standardRates
{
  return self->_standardRates;
}

- (void)setStandardRates:(id)a3
{
}

- (NSArray)precisionRates
{
  return self->_precisionRates;
}

- (void)setPrecisionRates:(id)a3
{
}

- (BKAudiobookPlayerDataSource)dataSource
{
  return self->_dataSource;
}

- (unint64_t)secondsToRewindAfterInterruption
{
  return self->_secondsToRewindAfterInterruption;
}

- (void)setSecondsToRewindAfterInterruption:(unint64_t)a3
{
  self->_secondsToRewindAfterInterruption = a3;
}

- (BOOL)supportsAlternateArtwork
{
  return self->_supportsAlternateArtwork;
}

- (void)setSupportsAlternateArtwork:(BOOL)a3
{
  self->_supportsAlternateArtwork = a3;
}

- (BKAVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (double)timeBeforeCurrentTrack
{
  return self->_timeBeforeCurrentTrack;
}

- (void)setTimeBeforeCurrentTrack:(double)a3
{
  self->_timeBeforeCurrentTrack = a3;
}

- (_NSRange)currentChapterRange
{
  NSUInteger length = self->_currentChapterRange.length;
  NSUInteger location = self->_currentChapterRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setCurrentChapterRange:(_NSRange)a3
{
  self->_currentChapterRange = a3;
}

- (NSArray)bufferedStartTimes
{
  return self->_bufferedStartTimes;
}

- (void)setBufferedStartTimes:(id)a3
{
}

- (NSArray)bufferedDurations
{
  return self->_bufferedDurations;
}

- (void)setBufferedDurations:(id)a3
{
}

- (BKAudiobookBufferProducer)bufferProducer
{
  return self->_bufferProducer;
}

- (void)setBufferProducer:(id)a3
{
}

- (NSDate)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTime, 0);
  objc_storeStrong((id *)&self->_bufferProducer, 0);
  objc_storeStrong((id *)&self->_bufferedDurations, 0);
  objc_storeStrong((id *)&self->_bufferedStartTimes, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_precisionRates, 0);
  objc_storeStrong((id *)&self->_standardRates, 0);
  objc_storeStrong((id *)&self->_skipController, 0);

  objc_storeStrong((id *)&self->_currentAudiobook, 0);
}

@end