@interface _UIUpdateTarget
+ (_UIUpdateTarget)targetWithCADisplay:(uint64_t)a1;
- (_UIUpdateTarget)init;
- (uint64_t)start;
- (uint64_t)stop;
- (uint64_t)sync;
- (unint64_t)requestPresentaionForMode:(unint64_t)a3@<X2> earliestReferenceDeadlineTime:(unint64_t)a4@<X3> earliestCommitDeadlineTime:(unint64_t *)a5@<X8>;
- (unint64_t)syncedRequestedMaxFrameDuration;
- (void)dealloc;
@end

@implementation _UIUpdateTarget

- (unint64_t)requestPresentaionForMode:(unint64_t)a3@<X2> earliestReferenceDeadlineTime:(unint64_t)a4@<X3> earliestCommitDeadlineTime:(unint64_t *)a5@<X8>
{
  if (result)
  {
    unint64_t v9 = result;
    if (a3 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = a3;
    }
    uint64_t v11 = *(void *)(v9 + 32);
    [*(id *)(v9 + 16) commitDeadlineAfterTimestamp:_UIMediaTimeForMachTime(v10)];
    result = _UIMachTimeForMediaTime(v12);
    unint64_t v13 = result;
    if (!result)
    {
      result = mach_absolute_time();
      unint64_t v14 = *(void *)(v9 + 40) + result;
      if (v14 <= a3) {
        unint64_t v14 = a3;
      }
      if (v14 <= a4) {
        unint64_t v13 = a4;
      }
      else {
        unint64_t v13 = v14;
      }
    }
    unint64_t v15 = v13 - *(void *)(v9 + 8 * a2 + 64);
    uint64_t v16 = *(void *)(v9 + 48 + 8 * a2);
    unint64_t v17 = v13 - *(void *)(v9 + 80);
    unint64_t v18 = v16 - *(void *)(v9 + 48);
    *a5 = v13;
    a5[1] = v15;
    a5[2] = v17;
    a5[3] = v16 + v13;
    a5[4] = v18;
    a5[5] = v15 + v11;
    if (_UIUpdateCycleDebugTracingCheck)
    {
      result = _UIUpdateCycleDebugTracingCheck();
      if (result)
      {
        return kdebug_trace();
      }
    }
  }
  else
  {
    *((_OWORD *)a5 + 1) = 0u;
    *((_OWORD *)a5 + 2) = 0u;
    *(_OWORD *)a5 = 0u;
  }
  return result;
}

- (uint64_t)sync
{
  if (result)
  {
    uint64_t v1 = result;
    [*(id *)(result + 8) heartbeatRate];
    unint64_t v3 = _UIMachTimeForMediaTime(v2);
    unsigned int v4 = [*(id *)(v1 + 8) minimumFrameDuration];
    if (v3)
    {
      unsigned int v5 = v4;
    }
    else
    {
      unint64_t v3 = _UIMachTimeForMediaTime(0.0166666667);
      unsigned int v5 = 1;
    }
    unint64_t v6 = v3 * v5;
    if (*(void *)(v1 + 40) == v6)
    {
      return 0;
    }
    else
    {
      *(void *)(v1 + 40) = v6;
      unint64_t v7 = _UIMachDurationForMediaDuration(0.0015);
      unint64_t v8 = v3 >> 3;
      if (v7 > v3 >> 3) {
        unint64_t v8 = v7;
      }
      *(void *)(v1 + 32) = v8;
      uint64_t v9 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
      if (v9 == 4)
      {
        char v10 = 1;
      }
      else if (v9)
      {
        char v10 = 0;
      }
      else
      {
        char v10 = _UIVariableFrameDurationEnabled();
      }
      *(void *)(v1 + 48) = v6 << v10;
      unint64_t v11 = _UIMachDurationForMediaDuration(0.004);
      uint64_t v12 = *(void *)(v1 + 32);
      *(void *)(v1 + 72) = v11;
      *(void *)(v1 + 80) = v6 - v12;
      kdebug_trace();
      return 1;
    }
  }
  return result;
}

- (unint64_t)syncedRequestedMaxFrameDuration
{
  if (result)
  {
    [*(id *)(result + 8) highestLocalPreferredFrameRateRequest];
    if (v1 <= 0.0)
    {
      return -1;
    }
    else
    {
      double v2 = 1.0 / v1;
      return _UIMachDurationForMediaDuration(v2);
    }
  }
  return result;
}

- (uint64_t)start
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 28) = 1;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck()) {
      kdebug_trace();
    }
    double v2 = *(void **)(v1 + 16);
    return [v2 setPaused:0];
  }
  return result;
}

- (uint64_t)stop
{
  if (result)
  {
    uint64_t v1 = result;
    *(unsigned char *)(result + 28) = 0;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck()) {
      kdebug_trace();
    }
    double v2 = *(void **)(v1 + 16);
    return [v2 setPaused:1];
  }
  return result;
}

+ (_UIUpdateTarget)targetWithCADisplay:(uint64_t)a1
{
  self;
  unint64_t v3 = [_UIUpdateTarget alloc];
  if (v3)
  {
    unsigned int v4 = v3;
    objc_storeStrong((id *)&v3->_display.direct, a2);
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F39B90]) initWithDisplay:a2];
    direct = v4->_frameSource.direct;
    v4->_frameSource.direct = (CADynamicFrameRateSource *)v5;

    unint64_t v3 = [(_UIUpdateTarget *)v4 init];
  }
  return v3;
}

- (_UIUpdateTarget)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIUpdateTarget;
  double v2 = [(_UIUpdateTarget *)&v5 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_displayId = [(CADisplay *)v2->_display.direct displayId];
    v3->_frameSourceActive = [(CADynamicFrameRateSource *)v3->_frameSource.direct isPaused] ^ 1;
    if (_UIUpdateCycleDebugTracingCheck && _UIUpdateCycleDebugTracingCheck()) {
      kdebug_trace();
    }
    v3->_minFrameDuration = 0;
  }
  return v3;
}

- (void)dealloc
{
  direct = self->_frameSource.direct;
  self->_frameSource.direct = 0;

  unsigned int v4 = self->_display.direct;
  self->_display.direct = 0;

  v5.receiver = self;
  v5.super_class = (Class)_UIUpdateTarget;
  [(_UIUpdateTarget *)&v5 dealloc];
}

- (void).cxx_destruct
{
  direct = self->_display.direct;
}

@end