@interface VFXClock
- (BOOL)isPaused;
- (VFXClock)init;
- (VFXClockTimeRange)replayLoopRange;
- (double)time;
- (float)speed;
- (void)_updateVFXCorePause;
- (void)_updateVFXCoreSpeedFactor;
- (void)_updateVFXCoreTime:(double)a3;
- (void)_updateWithAbsoluteTime:(double)a3 usingLoopRange:(VFXClockTimeRange)a4;
- (void)dealloc;
- (void)setPaused:(BOOL)a3;
- (void)setReplayLoopRange:(VFXClockTimeRange)a3;
- (void)setSpeed:(float)a3;
- (void)setTime:(double)a3;
- (void)setWorld:(__CFXWorld *)a3;
- (void)updateWithAbsoluteTime:(double)a3;
@end

@implementation VFXClock

- (VFXClock)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXClock;
  result = [(VFXClock *)&v3 init];
  if (result)
  {
    result->_speed = 1.0;
    result->_replayLoopRange.begin = 0.0;
    result->_replayLoopRange.end = 0.0;
  }
  return result;
}

- (void)dealloc
{
  world = self->_world;
  if (world)
  {
    CFRelease(world);
    self->_world = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXClock;
  [(VFXClock *)&v4 dealloc];
}

- (void)_updateVFXCoreSpeedFactor
{
  uint64_t v8 = sub_1B64B2054((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v8)
  {
    MEMORY[0x1F4181798](v8, sel_setSpeedFactor_, v9, v10);
  }
}

- (void)_updateVFXCorePause
{
  uint64_t v9 = (void *)sub_1B64B2054((uint64_t)self->_world, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (v9)
  {
    BOOL paused = self->_paused;
    objc_msgSend_setPaused_(v9, v10, paused, v11);
  }
}

- (void)_updateVFXCoreTime:(double)a3
{
  uint64_t v10 = (void *)sub_1B64B2054((uint64_t)self->_world, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  if (v10)
  {
    *(float *)&double v14 = a3;
    objc_msgSend_setTime_(v10, v11, v12, v13, v14);
  }
}

- (void)setSpeed:(float)a3
{
  if (self->_speed != a3)
  {
    self->_speed = a3;
    ((void (*)(VFXClock *, char *))MEMORY[0x1F4181798])(self, sel__updateVFXCoreSpeedFactor);
  }
}

- (float)speed
{
  return self->_speed;
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_BOOL paused = a3;
    if (a3) {
      self->_wasPaused = 1;
    }
    ((void (*)(VFXClock *, char *, BOOL))MEMORY[0x1F4181798])(self, sel__updateVFXCorePause, a3);
  }
}

- (void)updateWithAbsoluteTime:(double)a3
{
  if (self->_replayLoopRange.end == self->_replayLoopRange.begin)
  {
    double lastUpdateTime = self->_lastUpdateTime;
    if (lastUpdateTime < a3)
    {
      if (lastUpdateTime == 0.0) {
        double lastUpdateTime = a3;
      }
      if (self->_paused)
      {
        self->_wasPaused = 1;
      }
      else if (self->_wasPaused)
      {
        self->_wasPaused = 0;
      }
      else
      {
        self->_time = self->_time + (a3 - lastUpdateTime) * self->_speed;
      }
      self->_double lastUpdateTime = a3;
    }
  }
  else
  {
    ((void (*)(VFXClock *, char *))MEMORY[0x1F4181798])(self, sel__updateWithAbsoluteTime_usingLoopRange_);
  }
}

- (void)_updateWithAbsoluteTime:(double)a3 usingLoopRange:(VFXClockTimeRange)a4
{
  double begin = a4.begin;
  double time = self->_time;
  if (time <= a4.end)
  {
    if (self->_paused)
    {
      self->_wasPaused = 1;
    }
    else if (self->_wasPaused)
    {
      self->_wasPaused = 0;
    }
    else
    {
      double v10 = self->_replayLoopRange.begin;
      double end = self->_replayLoopRange.end;
      double v11 = time + (a3 - self->_lastUpdateTime) * self->_speed;
      self->_double time = v11;
      if (v11 <= a4.end)
      {
        if (v11 < begin) {
          self->_double time = begin;
        }
      }
      else
      {
        self->_double time = begin + fmod(v11 - begin, end - v10);
      }
    }
    self->_double lastUpdateTime = a3;
  }
  else
  {
    BOOL paused = self->_paused;
    if (!paused)
    {
      self->_double time = a4.begin;
      self->_double lastUpdateTime = a3;
    }
    self->_wasPaused = paused;
  }
}

- (void)setWorld:(__CFXWorld *)a3
{
  world = self->_world;
  if (world != a3)
  {
    if (world)
    {
      CFRelease(world);
      self->_world = 0;
    }
    if (a3) {
      uint64_t v6 = (__CFXWorld *)CFRetain(a3);
    }
    else {
      uint64_t v6 = 0;
    }
    self->_world = v6;
  }
}

- (void)setTime:(double)a3
{
  self->_double time = a3;
  world = self->_world;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1B641F61C;
  v4[3] = &unk_1E61412A8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, (uint64_t)world, 0, v4);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)time
{
  return self->_time;
}

- (VFXClockTimeRange)replayLoopRange
{
  double begin = self->_replayLoopRange.begin;
  double end = self->_replayLoopRange.end;
  result.double end = end;
  result.double begin = begin;
  return result;
}

- (void)setReplayLoopRange:(VFXClockTimeRange)a3
{
  self->_replayLoopRange = a3;
}

@end