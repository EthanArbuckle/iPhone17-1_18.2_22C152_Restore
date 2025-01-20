@interface BKAudiobookSleepTimer
+ (double)sleepTimerDurationFrom:(int64_t)a3;
+ (id)defaultTimer;
- (BKAudiobookControls)audiobookControls;
- (BKAudiobookSleepTimer)init;
- (BOOL)_expiresAtChapterEnd;
- (BOOL)expiresAtChapterEnd;
- (BOOL)isActive;
- (BOOL)waitingForPlayerStatePlaying;
- (BOOL)waitingForPlayerStatePlayingThenPause;
- (NSDate)sleepStartDate;
- (NSHashTable)observers;
- (NSTimer)sleepTimer;
- (double)initialDuration;
- (double)lastSentRemainingTime;
- (double)updateInterval;
- (id)allObservers;
- (int64_t)sleepTimerOption;
- (void)_expired;
- (void)_invalidateAllowingCancelNotification:(BOOL)a3;
- (void)_notifyObserversRemainingTimeUpdated:(double)a3;
- (void)_notifyObserversTimerCanceled;
- (void)_notifyObserversTimerEnabled;
- (void)_notifyObserversTimerExpired;
- (void)_setTimer;
- (void)_sleepTimer:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)player:(id)a3 chapterDidChange:(id)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
- (void)removeObserver:(id)a3;
- (void)setAudiobookControls:(id)a3;
- (void)setChapterFinishedTimer;
- (void)setFixedTimerWithDuration:(double)a3;
- (void)setInitialDuration:(double)a3;
- (void)setLastSentRemainingTime:(double)a3;
- (void)setObservers:(id)a3;
- (void)setSleepStartDate:(id)a3;
- (void)setSleepTimer:(id)a3;
- (void)setSleepTimerOption:(int64_t)a3;
- (void)setUpdateInterval:(double)a3;
- (void)setWaitingForPlayerStatePlaying:(BOOL)a3;
- (void)setWaitingForPlayerStatePlayingThenPause:(BOOL)a3;
@end

@implementation BKAudiobookSleepTimer

+ (id)defaultTimer
{
  if (qword_48EF0 != -1) {
    dispatch_once(&qword_48EF0, &stru_3D038);
  }
  v2 = (void *)qword_48EE8;

  return v2;
}

- (BOOL)isActive
{
  [(BKAudiobookSleepTimer *)self initialDuration];
  return v2 > 0.0 || v2 == -1000.0;
}

- (BOOL)expiresAtChapterEnd
{
  [(BKAudiobookSleepTimer *)self initialDuration];
  return v2 == -1000.0;
}

- (void)setUpdateInterval:(double)a3
{
  if (self->_updateInterval != a3)
  {
    self->_updateInterval = a3;
    sleepTimer = self->_sleepTimer;
    if (sleepTimer)
    {
      [(NSTimer *)sleepTimer invalidate];
      self->_sleepTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_sleepTimer:" selector:0 userInfo:1 repeats:a3];
      _objc_release_x1();
    }
  }
}

- (void)setFixedTimerWithDuration:(double)a3
{
  [(BKAudiobookSleepTimer *)self invalidate];
  self->_initialDuration = a3;
  v5 = [(BKAudiobookSleepTimer *)self audiobookControls];
  v6 = (char *)[v5 state];

  if (v6 == (unsigned char *)&dword_0 + 2) {
    [(BKAudiobookSleepTimer *)self _setTimer];
  }
  else {
    [(BKAudiobookSleepTimer *)self setWaitingForPlayerStatePlaying:1];
  }

  [(BKAudiobookSleepTimer *)self _notifyObserversTimerEnabled];
}

- (void)setChapterFinishedTimer
{
  [(BKAudiobookSleepTimer *)self invalidate];
  self->_initialDuration = -1000.0;
  v3 = +[NSDate date];
  sleepStartDate = self->_sleepStartDate;
  self->_sleepStartDate = v3;

  self->_lastSentRemainingTime = 2.22507386e-308;

  [(BKAudiobookSleepTimer *)self _notifyObserversTimerEnabled];
}

- (BKAudiobookSleepTimer)init
{
  v12.receiver = self;
  v12.super_class = (Class)BKAudiobookSleepTimer;
  double v2 = [(BKAudiobookSleepTimer *)&v12 init];
  v3 = v2;
  if (v2)
  {
    v2->_lastSentRemainingTime = 2.22507386e-308;
    uint64_t v4 = +[NSDate distantFuture];
    sleepStartDate = v3->_sleepStartDate;
    v3->_sleepStartDate = (NSDate *)v4;

    *(_OWORD *)&v3->_updateInterval = xmmword_2EC10;
    v3->_accessLock._os_unfair_lock_opaque = 0;
    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

    v8 = +[BKAudiobookPlayer sharedInstance];
    audiobookControls = v3->_audiobookControls;
    v3->_audiobookControls = v8;
    v10 = v8;

    [(BKAudiobookControls *)v10 addObserver:v3];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[BKAudiobookPlayer sharedInstance];
  [v3 removeObserver:self];

  [(BKAudiobookSleepTimer *)self invalidate];
  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookSleepTimer;
  [(BKAudiobookSleepTimer *)&v4 dealloc];
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(BKAudiobookSleepTimer *)self _expiresAtChapterEnd])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_19680;
    block[3] = &unk_3D060;
    id v9 = v7;
    v10 = self;
    id v11 = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(BKAudiobookSleepTimer *)self _expired];
  }
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  if (a5 == 4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_198F8;
    block[3] = &unk_3C710;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (a5 == 2)
  {
    if ([(BKAudiobookSleepTimer *)self waitingForPlayerStatePlaying])
    {
      [(BKAudiobookSleepTimer *)self setWaitingForPlayerStatePlaying:0];
      [(BKAudiobookSleepTimer *)self _setTimer];
    }
    else if ([(BKAudiobookSleepTimer *)self waitingForPlayerStatePlayingThenPause])
    {
      v8 = BKAudiobooksSleepTimerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Player state has just returned to Playing; pausing to respect a chapter-end expired timer",
          buf,
          2u);
      }

      [(BKAudiobookSleepTimer *)self setWaitingForPlayerStatePlayingThenPause:0];
      [v7 pause];
    }
  }
}

- (void)invalidate
{
}

- (int64_t)sleepTimerOption
{
  if (![(BKAudiobookSleepTimer *)self isActive]) {
    return 0;
  }
  if ([(BKAudiobookSleepTimer *)self expiresAtChapterEnd]) {
    return 1;
  }
  [(BKAudiobookSleepTimer *)self initialDuration];
  double v6 = v5;
  int64_t v3 = 2;
  +[BKAudiobookSleepTimer sleepTimerDurationFrom:2];
  if (vabdd_f64(v6, v7) >= 0.00999999978)
  {
    uint64_t v8 = 2;
    int64_t v3 = 8;
    do
    {
      +[BKAudiobookSleepTimer sleepTimerDurationFrom:v8];
      double v10 = v9;
      [(BKAudiobookSleepTimer *)self initialDuration];
      if (vabdd_f64(v11, v10) < 0.00999999978) {
        int64_t v3 = v8;
      }
      ++v8;
    }
    while (v8 != 8);
  }
  return v3;
}

- (void)setSleepTimerOption:(int64_t)a3
{
  if (a3 != 8)
  {
    if (a3 == 1)
    {
      [(BKAudiobookSleepTimer *)self setChapterFinishedTimer];
    }
    else if (a3)
    {
      +[BKAudiobookSleepTimer sleepTimerDurationFrom:](BKAudiobookSleepTimer, "sleepTimerDurationFrom:");
      -[BKAudiobookSleepTimer setFixedTimerWithDuration:](self, "setFixedTimerWithDuration:");
    }
    else
    {
      [(BKAudiobookSleepTimer *)self invalidate];
    }
  }
}

+ (double)sleepTimerDurationFrom:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 2) <= 5) {
    return dbl_2EC20[a3 - 2];
  }
  return result;
}

- (void)addObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  double v6 = [(BKAudiobookSleepTimer *)self observers];
  [v6 addObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (void)removeObserver:(id)a3
{
  p_accessLock = &self->_accessLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessLock);
  double v6 = [(BKAudiobookSleepTimer *)self observers];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_accessLock);
}

- (id)allObservers
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  objc_super v4 = [(BKAudiobookSleepTimer *)self observers];
  id v5 = [v4 allObjects];

  os_unfair_lock_unlock(p_accessLock);

  return v5;
}

- (BOOL)_expiresAtChapterEnd
{
  [(BKAudiobookSleepTimer *)self initialDuration];
  return v2 == -1000.0;
}

- (void)_sleepTimer:(id)a3
{
  if ([(BKAudiobookSleepTimer *)self _expiresAtChapterEnd])
  {
    double v4 = 0.0;
LABEL_5:
    [(BKAudiobookSleepTimer *)self _notifyObserversRemainingTimeUpdated:v4];
    return;
  }
  id v5 = +[NSDate date];
  [v5 timeIntervalSinceDate:self->_sleepStartDate];
  double v7 = v6;

  [(BKAudiobookSleepTimer *)self initialDuration];
  double v9 = v8;
  if (v7 < v8)
  {
    double v4 = v8 - v7;
    goto LABEL_5;
  }
  double v10 = BKAudiobooksSleepTimerLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134217984;
    double v13 = v9;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Sleep timer expired after %lfs.  Pausing playback", (uint8_t *)&v12, 0xCu);
  }

  double v11 = [(BKAudiobookSleepTimer *)self audiobookControls];
  [v11 pause];

  [(BKAudiobookSleepTimer *)self _expired];
}

- (void)_expired
{
  [(BKAudiobookSleepTimer *)self _invalidateAllowingCancelNotification:0];

  [(BKAudiobookSleepTimer *)self _notifyObserversTimerExpired];
}

- (void)_notifyObserversTimerEnabled
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(BKAudiobookSleepTimer *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 sleepTimerEnabled:self];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversTimerExpired
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(BKAudiobookSleepTimer *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 sleepTimerDidExpire:self];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversTimerCanceled
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = [(BKAudiobookSleepTimer *)self allObservers];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 sleepTimerCanceled:self];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_notifyObserversRemainingTimeUpdated:(double)a3
{
  [(BKAudiobookSleepTimer *)self lastSentRemainingTime];
  if (vabdd_f64(a3, v5) >= 0.01)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [(BKAudiobookSleepTimer *)self allObservers];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v11 sleepTimer:self remainingTimeDidUpdate:a3];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(BKAudiobookSleepTimer *)self setLastSentRemainingTime:a3];
  }
}

- (void)_invalidateAllowingCancelNotification:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(BKAudiobookSleepTimer *)self sleepTimer];

  if (v5)
  {
    [(NSTimer *)self->_sleepTimer invalidate];
    sleepTimer = self->_sleepTimer;
    self->_sleepTimer = 0;
  }
  if (self->_initialDuration == -2000.0)
  {
    if (!v5 || !v3) {
      return;
    }
  }
  else
  {
    self->_initialDuration = -2000.0;
    if (!v3) {
      return;
    }
  }

  [(BKAudiobookSleepTimer *)self _notifyObserversTimerCanceled];
}

- (void)_setTimer
{
  BOOL v3 = +[NSDate date];
  sleepStartDate = self->_sleepStartDate;
  self->_sleepStartDate = v3;

  self->_lastSentRemainingTime = 2.22507386e-308;
  self->_sleepTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_sleepTimer:" selector:0 userInfo:1 repeats:self->_updateInterval];

  _objc_release_x1();
}

- (BKAudiobookControls)audiobookControls
{
  return self->_audiobookControls;
}

- (void)setAudiobookControls:(id)a3
{
}

- (double)updateInterval
{
  return self->_updateInterval;
}

- (double)initialDuration
{
  return self->_initialDuration;
}

- (void)setInitialDuration:(double)a3
{
  self->_initialDuration = a3;
}

- (double)lastSentRemainingTime
{
  return self->_lastSentRemainingTime;
}

- (void)setLastSentRemainingTime:(double)a3
{
  self->_lastSentRemainingTime = a3;
}

- (NSDate)sleepStartDate
{
  return self->_sleepStartDate;
}

- (void)setSleepStartDate:(id)a3
{
}

- (NSTimer)sleepTimer
{
  return self->_sleepTimer;
}

- (void)setSleepTimer:(id)a3
{
}

- (BOOL)waitingForPlayerStatePlaying
{
  return self->_waitingForPlayerStatePlaying;
}

- (void)setWaitingForPlayerStatePlaying:(BOOL)a3
{
  self->_waitingForPlayerStatePlaying = a3;
}

- (BOOL)waitingForPlayerStatePlayingThenPause
{
  return self->_waitingForPlayerStatePlayingThenPause;
}

- (void)setWaitingForPlayerStatePlayingThenPause:(BOOL)a3
{
  self->_waitingForPlayerStatePlayingThenPause = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sleepTimer, 0);
  objc_storeStrong((id *)&self->_sleepStartDate, 0);

  objc_storeStrong((id *)&self->_audiobookControls, 0);
}

@end