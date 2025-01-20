@interface MNTracePlayerScheduler
- (MNTracePlayerScheduler)init;
- (MNTracePlayerSchedulerDelegate)delegate;
- (double)position;
- (double)speedMultiplier;
- (void)_timerUpdated:(id)a3;
- (void)_update;
- (void)addTimelineStream:(id)a3;
- (void)dealloc;
- (void)pause;
- (void)removeAllTimelineStreams;
- (void)removeTimelineStream:(id)a3;
- (void)resume;
- (void)setDelegate:(id)a3;
- (void)setPosition:(double)a3;
- (void)setSpeedMultiplier:(double)a3;
@end

@implementation MNTracePlayerScheduler

- (MNTracePlayerScheduler)init
{
  v6.receiver = self;
  v6.super_class = (Class)MNTracePlayerScheduler;
  v2 = [(MNTracePlayerScheduler *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_speedMultiplier = 1.0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  [(NSTimer *)self->_timer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MNTracePlayerScheduler;
  [(MNTracePlayerScheduler *)&v3 dealloc];
}

- (void)setPosition:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_position = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = self->_timelineStreams;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "jumpToPosition:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addTimelineStream:(id)a3
{
  id v4 = a3;
  timelineStreams = self->_timelineStreams;
  id v8 = v4;
  if (!timelineStreams)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_timelineStreams;
    self->_timelineStreams = v6;

    id v4 = v8;
    timelineStreams = self->_timelineStreams;
  }
  [(NSMutableArray *)timelineStreams addObject:v4];
  [v8 jumpToPosition:self->_position];
}

- (void)removeTimelineStream:(id)a3
{
  uint64_t v5 = (MNTracePlayerTimelineStream *)a3;
  [(NSMutableArray *)self->_timelineStreams removeObject:v5];
  id v4 = v5;
  if (self->_nextTimelineStream == v5)
  {
    self->_nextTimelineStream = 0;

    id v4 = v5;
  }
}

- (void)removeAllTimelineStreams
{
  [(NSMutableArray *)self->_timelineStreams removeAllObjects];
  nextTimelineStream = self->_nextTimelineStream;
  self->_nextTimelineStream = 0;
}

- (void)resume
{
  if (!self->_timer)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_lastTimerScheduleTime = v3;
    [(NSTimer *)self->_timer invalidate];
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__timerUpdated_ selector:0 userInfo:1 repeats:0.0333333333];
    timer = self->_timer;
    self->_timer = v4;
    MEMORY[0x1F41817F8](v4, timer);
  }
}

- (void)pause
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (void)_update
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_nextTimelineStream = &self->_nextTimelineStream;
  double position = self->_position;
  [(MNTracePlayerTimelineStream *)self->_nextTimelineStream nextUpdatePosition];
  if (position >= v5) {
    [(MNTracePlayerTimelineStream *)*p_nextTimelineStream triggerNextUpdate];
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_timelineStreams;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    long long v9 = 0;
    uint64_t v10 = *(void *)v20;
    double v11 = 978307200.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v13, "nextUpdatePosition", (void)v19);
        if (v14 < v11)
        {
          [v13 nextUpdatePosition];
          double v11 = v15;
          id v16 = v13;

          long long v9 = v16;
        }
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
  else
  {
    long long v9 = 0;
  }

  objc_storeStrong((id *)p_nextTimelineStream, v9);
  if (*p_nextTimelineStream)
  {
    double v17 = self->_position;
    [(MNTracePlayerTimelineStream *)*p_nextTimelineStream nextUpdatePosition];
    if (v17 >= v18) {
      [(MNTracePlayerScheduler *)self _update];
    }
  }
}

- (void)_timerUpdated:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F1C9C8], "timeIntervalSinceReferenceDate", a3);
  double speedMultiplier = self->_speedMultiplier;
  double v6 = v5 - self->_lastTimerScheduleTime;
  self->_lastTimerScheduleTime = v5;
  double v7 = 0.0333333333;
  if (v6 <= 1.0) {
    double v7 = v6;
  }
  double position = self->_position;
  double v9 = position + v7 * speedMultiplier;
  self->_double position = v9;
  if (floor(position) != floor(v9))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained tracePlayerScheduler:self didUpdatePosition:self->_position];
  }
  [(MNTracePlayerScheduler *)self _update];
}

- (MNTracePlayerSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MNTracePlayerSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)speedMultiplier
{
  return self->_speedMultiplier;
}

- (void)setSpeedMultiplier:(double)a3
{
  self->_double speedMultiplier = a3;
}

- (double)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextTimelineStream, 0);
  objc_storeStrong((id *)&self->_timelineStreams, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end