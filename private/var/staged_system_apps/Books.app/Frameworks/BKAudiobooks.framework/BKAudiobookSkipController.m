@interface BKAudiobookSkipController
+ (void)initialize;
- (AVAudioPlayer)fxPlayer;
- (BKAudiobookControls)audiobookControls;
- (BKAudiobookSkipController)initWithAudiobookControls:(id)a3;
- (BOOL)_canStartSeek;
- (BOOL)_canStartSkip;
- (BOOL)endSeek;
- (BOOL)endSkip;
- (BOOL)isActive;
- (BOOL)isSeeking;
- (BOOL)isSkipping;
- (BOOL)playSkipSoundEffect;
- (BOOL)singleSkip:(unint64_t)a3 interval:(double)a4;
- (BOOL)startSeek:(unint64_t)a3;
- (BOOL)startSkip:(unint64_t)a3 actionSource:(unint64_t)a4;
- (BOOL)wasPlaying;
- (BOOL)wasPlayingBeforeSkipSeek;
- (NSHashTable)observers;
- (NSMutableDictionary)accelerationMap;
- (OS_dispatch_source)seekDispatchSource;
- (OS_dispatch_source)skipDispatchSource;
- (double)_pushTemporaryTimeInterval:(double)a3 skipDirection:(unint64_t)a4;
- (double)backwardSeekSpeedMultiplier;
- (double)backwardSkipTime;
- (double)baseEventInterval;
- (double)deltaFromStartingPoint:(double)a3;
- (double)forwardSeekSpeedMultiplier;
- (double)forwardSkipTime;
- (double)seekDelta;
- (double)seekSampleTime;
- (double)skipStartAudiobookTime;
- (float)playbackRateBeforeSeek;
- (id)allObservers;
- (unint64_t)actionSource;
- (unint64_t)direction;
- (unint64_t)skipStepCount;
- (void)_cancelSeek;
- (void)_cancelSkip;
- (void)_popToStashedTimeInterval:(double)a3 skipDirection:(unint64_t)a4;
- (void)_processSeekEvent;
- (void)_processSkipEvent;
- (void)_scheduleSeekTimerWithInterval:(double)a3;
- (void)_scheduleSkipTimerWithInterval:(double)a3;
- (void)_seekTimerFired;
- (void)_sendDidEndSeekingObserverCallbacks;
- (void)_sendDidEndSkippingObserverCallbacks;
- (void)_sendSkipControllerSettingsDidChange;
- (void)_sendUpdatedCumulativeDeltaCallbacks:(double)a3;
- (void)_sendWillPauseObserverCallbacks;
- (void)_sendWillWillBeginSeekingObserverCallbacksWithDirection:(unint64_t)a3;
- (void)_sendWillWillBeginSkippingObserverCallbacksWithDirection:(unint64_t)a3;
- (void)accelerateToInterval:(double)a3 afterEventCount:(unint64_t)a4;
- (void)addObserver:(id)a3;
- (void)clearAccelerationStops;
- (void)dealloc;
- (void)endSeekIfSeeking;
- (void)endSkipIfSkipping;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3;
- (void)reset;
- (void)setAccelerationMap:(id)a3;
- (void)setActionSource:(unint64_t)a3;
- (void)setAudiobookControls:(id)a3;
- (void)setBackwardSeekSpeedMultiplier:(double)a3;
- (void)setBackwardSkipTime:(double)a3;
- (void)setBaseEventInterval:(double)a3;
- (void)setDirection:(unint64_t)a3;
- (void)setForwardSeekSpeedMultiplier:(double)a3;
- (void)setForwardSkipTime:(double)a3;
- (void)setFxPlayer:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlaySkipSoundEffect:(BOOL)a3;
- (void)setPlaybackRateBeforeSeek:(float)a3;
- (void)setSeekDelta:(double)a3;
- (void)setSeekDispatchSource:(id)a3;
- (void)setSeekSampleTime:(double)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setSkipDispatchSource:(id)a3;
- (void)setSkipStartAudiobookTime:(double)a3;
- (void)setSkipStepCount:(unint64_t)a3;
- (void)setSkipping:(BOOL)a3;
- (void)setWasPlaying:(BOOL)a3;
- (void)updateSkipInterval;
@end

@implementation BKAudiobookSkipController

+ (void)initialize
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v6[0] = @"BKAudioBookSkipForward";
  v3 = +[NSNumber numberWithDouble:15.0];
  v6[1] = @"BKAudioBookSkipBackward";
  v7[0] = v3;
  v4 = +[NSNumber numberWithDouble:15.0];
  v7[1] = v4;
  v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  [v2 registerDefaults:v5];
}

- (BKAudiobookSkipController)initWithAudiobookControls:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BKAudiobookSkipController;
  v5 = [(BKAudiobookSkipController *)&v19 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_audiobookControls, v4);
    id v7 = objc_alloc((Class)AVAudioPlayer);
    v8 = +[NSBundle bundleForClass:objc_opt_class()];
    v9 = [v8 URLForResource:@"skipFX" withExtension:@"aiff"];
    v10 = (AVAudioPlayer *)[v7 initWithContentsOfURL:v9 error:0];
    fxPlayer = v6->_fxPlayer;
    v6->_fxPlayer = v10;

    *(_OWORD *)&v6->_seekDelta = xmmword_2EBA0;
    *(_OWORD *)&v6->_forwardSeekSpeedMultiplier = xmmword_2EBB0;
    uint64_t v12 = objc_opt_new();
    accelerationMap = v6->_accelerationMap;
    v6->_accelerationMap = (NSMutableDictionary *)v12;

    v14 = +[NSNumber numberWithDouble:0.4];
    [(NSMutableDictionary *)v6->_accelerationMap setObject:v14 forKeyedSubscript:&off_3E118];

    v15 = +[NSUserDefaults standardUserDefaults];
    [v15 addObserver:v6 forKeyPath:@"BKAudioBookSkipForward" options:5 context:off_48998];
    [v15 addObserver:v6 forKeyPath:@"BKAudioBookSkipBackward" options:5 context:off_489A0];
    v6->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v16 = +[NSHashTable weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v16;
  }
  return v6;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"BKAudioBookSkipForward" context:off_48998];
  [v3 removeObserver:self forKeyPath:@"BKAudioBookSkipBackward" context:off_489A0];

  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookSkipController;
  [(BKAudiobookSkipController *)&v4 dealloc];
}

- (void)setForwardSkipTime:(double)a3
{
  self->_forwardSkipTime = a3;
  [(BKAudiobookSkipController *)self _sendSkipControllerSettingsDidChange];
}

- (void)setBackwardSkipTime:(double)a3
{
  self->_backwardSkipTime = a3;
  [(BKAudiobookSkipController *)self _sendSkipControllerSettingsDidChange];
}

- (BOOL)isActive
{
  return self->_skipping || self->_seeking;
}

- (BOOL)startSkip:(unint64_t)a3 actionSource:(unint64_t)a4
{
  id v7 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109120;
    v14[1] = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "startSkip: %d", (uint8_t *)v14, 8u);
  }

  BOOL v8 = [(BKAudiobookSkipController *)self _canStartSkip];
  if (v8)
  {
    [(BKAudiobookSkipController *)self _cancelSkip];
    v9 = [(BKAudiobookSkipController *)self audiobookControls];
    [v9 positionInCurrentAudiobook];
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    [(BKAudiobookSkipController *)self setSkipping:1];
    [(BKAudiobookSkipController *)self setDirection:a3];
    [(BKAudiobookSkipController *)self setActionSource:a4];
    [(BKAudiobookSkipController *)self _sendWillWillBeginSkippingObserverCallbacksWithDirection:a3];
    [(BKAudiobookSkipController *)self _sendWillPauseObserverCallbacks];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    LODWORD(v9) = [WeakRetained isPlaying];

    if (v9)
    {
      [(BKAudiobookSkipController *)self setWasPlaying:1];
      id v11 = objc_loadWeakRetained((id *)&self->_audiobookControls);
      [v11 pause];
    }
    self->_skipStepCount = 0;
    [(BKAudiobookSkipController *)self baseEventInterval];
    -[BKAudiobookSkipController _scheduleSkipTimerWithInterval:](self, "_scheduleSkipTimerWithInterval:");
  }
  else
  {
    uint64_t v12 = BKAudiobooksSkipControllerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_25468();
    }
  }
  return v8;
}

- (BOOL)endSkip
{
  v3 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "endSkip", v8, 2u);
  }

  BOOL v4 = [(BKAudiobookSkipController *)self _canEndSkip];
  if (v4)
  {
    [(BKAudiobookSkipController *)self _cancelSkip];
    if ([(BKAudiobookSkipController *)self wasPlaying])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
      [WeakRetained play];
    }
    if (!self->_skipStepCount)
    {
      [(BKAudiobookSkipController *)self _processSkipEvent];
      [(BKAudiobookSkipController *)self _cancelSkip];
    }
    [(BKAudiobookSkipController *)self setSkipping:0];
    [(BKAudiobookSkipController *)self _sendDidEndSkippingObserverCallbacks];
    [(BKAudiobookSkipController *)self setWasPlaying:0];
    [(BKAudiobookSkipController *)self setSkipStartAudiobookTime:0.0];
  }
  else
  {
    v6 = BKAudiobooksSkipControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_2549C();
    }
  }
  return v4;
}

- (void)endSkipIfSkipping
{
  if ([(BKAudiobookSkipController *)self isSkipping])
  {
    [(BKAudiobookSkipController *)self endSkip];
  }
}

- (BOOL)singleSkip:(unint64_t)a3 interval:(double)a4
{
  id v7 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109376;
    v14[1] = a3;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "singleSkip: %d interval:%lf", (uint8_t *)v14, 0x12u);
  }

  BOOL v8 = [(BKAudiobookSkipController *)self _canStartSkip];
  if (v8)
  {
    [(BKAudiobookSkipController *)self _cancelSkip];
    [(BKAudiobookSkipController *)self setSkipStepCount:0];
    [(BKAudiobookSkipController *)self setDirection:a3];
    v9 = [(BKAudiobookSkipController *)self audiobookControls];
    [v9 positionInCurrentAudiobook];
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    [(BKAudiobookSkipController *)self _sendWillWillBeginSkippingObserverCallbacksWithDirection:a3];
    [(BKAudiobookSkipController *)self _pushTemporaryTimeInterval:[(BKAudiobookSkipController *)self direction] skipDirection:a4];
    double v11 = v10;
    [(BKAudiobookSkipController *)self _processSkipEvent];
    [(BKAudiobookSkipController *)self _popToStashedTimeInterval:[(BKAudiobookSkipController *)self direction] skipDirection:v11];
    [(BKAudiobookSkipController *)self _sendDidEndSkippingObserverCallbacks];
    [(BKAudiobookSkipController *)self _cancelSkip];
  }
  else
  {
    uint64_t v12 = BKAudiobooksSkipControllerLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_254D0();
    }
  }
  return v8;
}

- (BOOL)startSeek:(unint64_t)a3
{
  v5 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = a3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "startSeek: %d", (uint8_t *)v19, 8u);
  }

  BOOL v6 = [(BKAudiobookSkipController *)self _canStartSeek];
  if (v6)
  {
    [(BKAudiobookSkipController *)self _cancelSeek];
    id v7 = [(BKAudiobookSkipController *)self audiobookControls];
    [v7 positionInCurrentAudiobook];
    -[BKAudiobookSkipController setSkipStartAudiobookTime:](self, "setSkipStartAudiobookTime:");

    [(BKAudiobookSkipController *)self setSeeking:1];
    [(BKAudiobookSkipController *)self setDirection:a3];
    [(BKAudiobookSkipController *)self _sendWillWillBeginSeekingObserverCallbacksWithDirection:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    -[BKAudiobookSkipController setWasPlaying:](self, "setWasPlaying:", [WeakRetained isPlaying]);

    id v9 = objc_loadWeakRetained((id *)&self->_audiobookControls);
    [v9 playbackRate];
    self->_float playbackRateBeforeSeek = v10;

    float playbackRateBeforeSeek = self->_playbackRateBeforeSeek;
    if (playbackRateBeforeSeek == 0.0) {
      float playbackRateBeforeSeek = 1.0;
    }
    double v12 = playbackRateBeforeSeek;
    if (a3 == 1) {
      [(BKAudiobookSkipController *)self forwardSeekSpeedMultiplier];
    }
    else {
      [(BKAudiobookSkipController *)self backwardSeekSpeedMultiplier];
    }
    float v15 = v13 * v12;
    id v16 = objc_loadWeakRetained((id *)&self->_audiobookControls);
    *(float *)&double v17 = v15;
    [v16 setPlaybackRate:v17];

    [(BKAudiobookSkipController *)self seekSampleTime];
    -[BKAudiobookSkipController _scheduleSeekTimerWithInterval:](self, "_scheduleSeekTimerWithInterval:");
  }
  else
  {
    v14 = BKAudiobooksSkipControllerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_25504();
    }
  }
  return v6;
}

- (BOOL)endSeek
{
  v3 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v11 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "endSeek", v11, 2u);
  }

  BOOL v4 = [(BKAudiobookSkipController *)self _canEndSeek];
  if (v4)
  {
    [(BKAudiobookSkipController *)self _cancelSeek];
    float playbackRateBeforeSeek = self->_playbackRateBeforeSeek;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
    *(float *)&double v7 = playbackRateBeforeSeek;
    [WeakRetained setPlaybackRate:v7];

    if ([(BKAudiobookSkipController *)self wasPlaying])
    {
      id v8 = objc_loadWeakRetained((id *)&self->_audiobookControls);
      [v8 play];
    }
    [(BKAudiobookSkipController *)self _sendDidEndSeekingObserverCallbacks];
    [(BKAudiobookSkipController *)self setWasPlaying:0];
    [(BKAudiobookSkipController *)self setSeeking:0];
  }
  else
  {
    id v9 = BKAudiobooksSkipControllerLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_25538();
    }
  }
  return v4;
}

- (void)endSeekIfSeeking
{
  if ([(BKAudiobookSkipController *)self isSeeking])
  {
    [(BKAudiobookSkipController *)self endSeek];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_opt_class();
  double v13 = [v12 objectForKeyedSubscript:NSKeyValueChangeNewKey];
  v14 = BUDynamicCast();

  if (off_48998 == a6)
  {
    if (v14)
    {
      [v14 doubleValue];
      -[BKAudiobookSkipController setForwardSkipTime:](self, "setForwardSkipTime:");
    }
  }
  else if (off_489A0 == a6)
  {
    if (v14)
    {
      [v14 doubleValue];
      -[BKAudiobookSkipController setBackwardSkipTime:](self, "setBackwardSkipTime:");
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKAudiobookSkipController;
    [(BKAudiobookSkipController *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)updateSkipInterval
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 doubleForKey:@"BKAudioBookSkipForward"];
  -[BKAudiobookSkipController setForwardSkipTime:](self, "setForwardSkipTime:");

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 doubleForKey:@"BKAudioBookSkipBackward"];
  -[BKAudiobookSkipController setBackwardSkipTime:](self, "setBackwardSkipTime:");
}

- (void)reset
{
  v3 = BKAudiobooksSkipControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "reset", v4, 2u);
  }

  if ([(BKAudiobookSkipController *)self isSkipping])
  {
    [(BKAudiobookSkipController *)self _cancelSkip];
    [(BKAudiobookSkipController *)self _sendDidEndSkippingObserverCallbacks];
    [(BKAudiobookSkipController *)self setWasPlaying:0];
    [(BKAudiobookSkipController *)self setSkipping:0];
  }
  else if ([(BKAudiobookSkipController *)self isSeeking])
  {
    [(BKAudiobookSkipController *)self endSeek];
  }
  [(BKAudiobookSkipController *)self setSkipStartAudiobookTime:0.0];
}

- (BOOL)wasPlayingBeforeSkipSeek
{
  BOOL v3 = [(BKAudiobookSkipController *)self isSkipping];
  if (v3)
  {
    LOBYTE(v3) = [(BKAudiobookSkipController *)self wasPlaying];
  }
  return v3;
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  BOOL v6 = [(BKAudiobookSkipController *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  BOOL v6 = [(BKAudiobookSkipController *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v4 = [(BKAudiobookSkipController *)self observers];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_accessLock);

  return v5;
}

- (double)baseEventInterval
{
  v2 = [(NSMutableDictionary *)self->_accelerationMap objectForKeyedSubscript:&off_3E118];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setBaseEventInterval:(double)a3
{
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  BOOL v6 = [(NSMutableDictionary *)self->_accelerationMap objectForKeyedSubscript:&off_3E118];
  unsigned __int8 v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = +[NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_accelerationMap setObject:v8 forKeyedSubscript:&off_3E118];
  }
}

- (void)clearAccelerationStops
{
  [(BKAudiobookSkipController *)self baseEventInterval];
  double v4 = v3;
  [(NSMutableDictionary *)self->_accelerationMap removeAllObjects];

  [(BKAudiobookSkipController *)self setBaseEventInterval:v4];
}

- (void)accelerateToInterval:(double)a3 afterEventCount:(unint64_t)a4
{
  unsigned __int8 v7 = [(NSMutableDictionary *)self->_accelerationMap allKeys];
  id v13 = [v7 sortedArrayUsingSelector:"compare:"];

  id v8 = [v13 lastObject];
  id v9 = (char *)[v8 unsignedIntegerValue];

  id v10 = +[NSNumber numberWithDouble:a3];
  accelerationMap = self->_accelerationMap;
  id v12 = +[NSNumber numberWithUnsignedInteger:&v9[a4]];
  [(NSMutableDictionary *)accelerationMap setObject:v10 forKeyedSubscript:v12];
}

- (double)deltaFromStartingPoint:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);
  [WeakRetained positionInCurrentAudiobook];
  double v6 = v5 - a3;

  return v6;
}

- (BOOL)_canStartSkip
{
  return !self->_skipping && !self->_seeking;
}

- (BOOL)_canStartSeek
{
  return !self->_skipping && !self->_seeking;
}

- (void)_cancelSkip
{
  double v3 = [(BKAudiobookSkipController *)self skipDispatchSource];

  if (v3)
  {
    double v4 = [(BKAudiobookSkipController *)self skipDispatchSource];
    dispatch_source_cancel(v4);

    [(BKAudiobookSkipController *)self setSkipDispatchSource:0];
  }
}

- (void)_cancelSeek
{
  double v3 = [(BKAudiobookSkipController *)self seekDispatchSource];

  if (v3)
  {
    double v4 = [(BKAudiobookSkipController *)self seekDispatchSource];
    dispatch_source_cancel(v4);

    [(BKAudiobookSkipController *)self setSeekDispatchSource:0];
  }
}

- (void)_scheduleSkipTimerWithInterval:(double)a3
{
  double v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  [(BKAudiobookSkipController *)self setSkipDispatchSource:v5];
  objc_initWeak(&location, self);
  dispatch_source_set_timer(v5, 0, (unint64_t)(a3 * 1000000000.0), (unint64_t)(a3 / 10.0 * 1000000000.0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_13B0C;
  v6[3] = &unk_3C850;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume(v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_processSkipEvent
{
  ++self->_skipStepCount;
  id v23 = [(BKAudiobookSkipController *)self audiobookControls];
  [v23 positionInCurrentAudiobook];
  double v4 = v3;
  unint64_t v5 = [(BKAudiobookSkipController *)self direction];
  p_audiobookControls = &self->_audiobookControls;
  if (v5 == 1)
  {
    double forwardSkipTime = self->_forwardSkipTime;
    id WeakRetained = objc_loadWeakRetained((id *)p_audiobookControls);
    [WeakRetained playbackRate];
    double v10 = v4 + forwardSkipTime * v9;
  }
  else
  {
    double backwardSkipTime = self->_backwardSkipTime;
    id WeakRetained = objc_loadWeakRetained((id *)p_audiobookControls);
    [WeakRetained playbackRate];
    double v10 = v4 - backwardSkipTime * v12;
  }

  [v23 durationOfCurrentAudiobook];
  double v14 = v13 + -0.01;
  if (v14 >= v10) {
    double v14 = v10;
  }
  [v23 movePositionInCurrentAudiobook:0 completion:fmax(v14, 0.0)];
  [(BKAudiobookSkipController *)self skipStartAudiobookTime];
  -[BKAudiobookSkipController deltaFromStartingPoint:](self, "deltaFromStartingPoint:");
  -[BKAudiobookSkipController _sendUpdatedCumulativeDeltaCallbacks:](self, "_sendUpdatedCumulativeDeltaCallbacks:");
  if ([(BKAudiobookSkipController *)self playSkipSoundEffect] && self->_skipStepCount >= 2)
  {
    [(AVAudioPlayer *)self->_fxPlayer setCurrentTime:0.0];
    [(AVAudioPlayer *)self->_fxPlayer play];
  }
  objc_super v15 = [(BKAudiobookSkipController *)self accelerationMap];
  id v16 = +[NSNumber numberWithUnsignedInteger:self->_skipStepCount];
  double v17 = [v15 objectForKeyedSubscript:v16];

  if (v17)
  {
    [(BKAudiobookSkipController *)self _cancelSkip];
    v18 = [(BKAudiobookSkipController *)self accelerationMap];
    objc_super v19 = +[NSNumber numberWithUnsignedInteger:self->_skipStepCount];
    v20 = [v18 objectForKeyedSubscript:v19];
    [v20 doubleValue];
    double v22 = v21;

    [(BKAudiobookSkipController *)self _scheduleSkipTimerWithInterval:v22];
  }
}

- (double)_pushTemporaryTimeInterval:(double)a3 skipDirection:(unint64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v5 = 24;
  }
  else
  {
    double v4 = 0.0;
    if (a4) {
      return v4;
    }
    uint64_t v5 = 32;
  }
  double v4 = *(double *)((char *)&self->super.isa + v5);
  if (a3 == 0.0) {
    a3 = *(double *)((char *)&self->super.isa + v5);
  }
  *(double *)((char *)&self->super.isa + v5) = a3;
  return v4;
}

- (void)_popToStashedTimeInterval:(double)a3 skipDirection:(unint64_t)a4
{
  if (a4 == 1)
  {
    uint64_t v4 = 24;
  }
  else
  {
    if (a4) {
      return;
    }
    uint64_t v4 = 32;
  }
  *(double *)((char *)&self->super.isa + v4) = a3;
}

- (void)_scheduleSeekTimerWithInterval:(double)a3
{
  uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  [(BKAudiobookSkipController *)self setSeekDispatchSource:v5];
  objc_initWeak(&location, self);
  dispatch_source_set_timer(v5, 0, (unint64_t)(a3 * 1000000000.0), (unint64_t)(a3 / 10.0 * 1000000000.0));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_13EA0;
  v6[3] = &unk_3C850;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_resume(v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_seekTimerFired
{
}

- (void)_processSeekEvent
{
  id v10 = [(BKAudiobookSkipController *)self audiobookControls];
  [v10 positionInCurrentAudiobook];
  double v4 = v3;
  unint64_t v5 = [(BKAudiobookSkipController *)self direction];
  double seekDelta = self->_seekDelta;
  if (v5 != 1) {
    double seekDelta = -seekDelta;
  }
  double v7 = v4 + seekDelta;
  [v10 durationOfCurrentAudiobook];
  double v9 = v8 + -0.01;
  if (v9 >= v7) {
    double v9 = v7;
  }
  [v10 movePositionInCurrentAudiobook:0 completion:fmax(v9, 0.0)];
}

- (void)_sendWillWillBeginSkippingObserverCallbacksWithDirection:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v5 = [(BKAudiobookSkipController *)self allObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      double v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 skipController:self willBeginSkippingInDirection:a3];
        }
        double v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sendDidEndSkippingObserverCallbacks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(BKAudiobookSkipController *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 skipControllerDidEndSkipping:self actionSource:[self actionSource]];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendWillPauseObserverCallbacks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(BKAudiobookSkipController *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 skipControllerWillPausePlayback:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendUpdatedCumulativeDeltaCallbacks:(double)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKAudiobookSkipController *)self allObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 skipController:self updatedCumulativeDelta:a3];
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sendWillWillBeginSeekingObserverCallbacksWithDirection:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(BKAudiobookSkipController *)self allObservers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v9);
        if (objc_opt_respondsToSelector()) {
          [v10 skipController:self willBeginSeekingInDirection:a3];
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sendDidEndSeekingObserverCallbacks
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(BKAudiobookSkipController *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 skipControllerDidEndSeeking:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_sendSkipControllerSettingsDidChange
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(BKAudiobookSkipController *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 skipControllerSettingsDidChange:self];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)isSkipping
{
  return self->_skipping;
}

- (void)setSkipping:(BOOL)a3
{
  self->_skipping = a3;
}

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
}

- (double)forwardSkipTime
{
  return self->_forwardSkipTime;
}

- (double)backwardSkipTime
{
  return self->_backwardSkipTime;
}

- (double)seekDelta
{
  return self->_seekDelta;
}

- (void)setSeekDelta:(double)a3
{
  self->_double seekDelta = a3;
}

- (double)seekSampleTime
{
  return self->_seekSampleTime;
}

- (void)setSeekSampleTime:(double)a3
{
  self->_seekSampleTime = a3;
}

- (double)forwardSeekSpeedMultiplier
{
  return self->_forwardSeekSpeedMultiplier;
}

- (void)setForwardSeekSpeedMultiplier:(double)a3
{
  self->_forwardSeekSpeedMultiplier = a3;
}

- (double)backwardSeekSpeedMultiplier
{
  return self->_backwardSeekSpeedMultiplier;
}

- (void)setBackwardSeekSpeedMultiplier:(double)a3
{
  self->_backwardSeekSpeedMultiplier = a3;
}

- (BOOL)playSkipSoundEffect
{
  return self->_playSkipSoundEffect;
}

- (void)setPlaySkipSoundEffect:(BOOL)a3
{
  self->_playSkipSoundEffect = a3;
}

- (BKAudiobookControls)audiobookControls
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audiobookControls);

  return (BKAudiobookControls *)WeakRetained;
}

- (void)setAudiobookControls:(id)a3
{
}

- (AVAudioPlayer)fxPlayer
{
  return self->_fxPlayer;
}

- (void)setFxPlayer:(id)a3
{
}

- (OS_dispatch_source)skipDispatchSource
{
  return self->_skipDispatchSource;
}

- (void)setSkipDispatchSource:(id)a3
{
}

- (OS_dispatch_source)seekDispatchSource
{
  return self->_seekDispatchSource;
}

- (void)setSeekDispatchSource:(id)a3
{
}

- (unint64_t)skipStepCount
{
  return self->_skipStepCount;
}

- (void)setSkipStepCount:(unint64_t)a3
{
  self->_skipStepCount = a3;
}

- (BOOL)wasPlaying
{
  return self->_wasPlaying;
}

- (void)setWasPlaying:(BOOL)a3
{
  self->_wasPlaying = a3;
}

- (unint64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(unint64_t)a3
{
  self->_direction = a3;
}

- (unint64_t)actionSource
{
  return self->_actionSource;
}

- (void)setActionSource:(unint64_t)a3
{
  self->_actionSource = a3;
}

- (double)skipStartAudiobookTime
{
  return self->_skipStartAudiobookTime;
}

- (void)setSkipStartAudiobookTime:(double)a3
{
  self->_skipStartAudiobookTime = a3;
}

- (float)playbackRateBeforeSeek
{
  return self->_playbackRateBeforeSeek;
}

- (void)setPlaybackRateBeforeSeek:(float)a3
{
  self->_float playbackRateBeforeSeek = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)accelerationMap
{
  return self->_accelerationMap;
}

- (void)setAccelerationMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accelerationMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_seekDispatchSource, 0);
  objc_storeStrong((id *)&self->_skipDispatchSource, 0);
  objc_storeStrong((id *)&self->_fxPlayer, 0);

  objc_destroyWeak((id *)&self->_audiobookControls);
}

@end