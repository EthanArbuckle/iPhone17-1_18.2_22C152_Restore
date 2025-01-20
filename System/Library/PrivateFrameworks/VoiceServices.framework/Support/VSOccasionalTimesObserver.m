@interface VSOccasionalTimesObserver
- (OpaqueCMTimebase)timebase;
- (VSOccasionalTimesObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6;
- (void)_reallyInvalidate;
- (void)_resetNextFireTime;
- (void)dealloc;
- (void)invalidate;
@end

@implementation VSOccasionalTimesObserver

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_times, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
}

- (OpaqueCMTimebase)timebase
{
  return self->_timebase;
}

- (void)_resetNextFireTime
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (self->_timerSource && self->_timebase)
  {
    memset(&v22, 0, sizeof(v22));
    CMTimebaseGetTimeClampedAboveAnchorTime();
    BOOL v3 = (unsigned __int128)0 >> 96 == 1 && v22.epoch == 0;
    v4 = (CMTime *)MEMORY[0x263F010E0];
    if (!v3 || (time1 = v22, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0], CMTimeCompare(&time1, &time2) < 0)) {
      CMTime v22 = *v4;
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v5 = self->_times;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          memset(&time1, 0, sizeof(time1));
          if (v10) {
            [v10 CMTimeValue];
          }
          CMTime time2 = time1;
          CMTime v15 = v22;
          if (CMTimeCompare(&time2, &v15) >= 1)
          {
            long long v11 = *(_OWORD *)&time1.value;
            *(_OWORD *)&self->_nextFireTime.value = *(_OWORD *)&time1.value;
            CMTimeEpoch epoch = time1.epoch;
            self->_nextFireTime.CMTimeEpoch epoch = time1.epoch;
            timebase = self->_timebase;
            timerSource = self->_timerSource;
            *(_OWORD *)&time2.value = v11;
            time2.CMTimeEpoch epoch = epoch;
            CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &time2, 0);
            goto LABEL_22;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_reallyInvalidate
{
  if (!self->_invalid)
  {
    self->_invalid = 1;
    timebase = self->_timebase;
    if (timebase)
    {
      timerSource = self->_timerSource;
      if (!timerSource
        || (CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x263F01090],
            CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &v6, 0),
            CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timerSource),
            (timebase = self->_timebase) != 0))
      {
        CFRelease(timebase);
        self->_timebase = 0;
      }
    }
    v5 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (void)invalidate
{
  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__VSOccasionalTimesObserver_invalidate__block_invoke;
    block[3] = &unk_2647DCD78;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
  else
  {
    [(VSOccasionalTimesObserver *)self _reallyInvalidate];
  }
}

uint64_t __39__VSOccasionalTimesObserver_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reallyInvalidate];
}

- (void)dealloc
{
  timerQueue = self->_timerQueue;
  self->_timerQueue = 0;

  timebase = self->_timebase;
  if (timebase)
  {
    CFRelease(timebase);
    self->_timebase = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)VSOccasionalTimesObserver;
  [(VSOccasionalTimesObserver *)&v5 dealloc];
}

- (VSOccasionalTimesObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)VSOccasionalTimesObserver;
  id v13 = [(VSOccasionalTimesObserver *)&v32 init];
  if (v13)
  {
    *((void *)v13 + 9) = CFRetain(a3);
    uint64_t v14 = [v10 sortedArrayUsingComparator:&__block_literal_global_1367];
    CMTime v15 = (void *)*((void *)v13 + 4);
    *((void *)v13 + 4) = v14;

    if (v11)
    {
      id v16 = v11;
      long long v17 = (void *)*((void *)v13 + 1);
      *((void *)v13 + 1) = v16;
    }
    else
    {
      uint64_t v18 = MEMORY[0x263EF83A0];
      id v19 = MEMORY[0x263EF83A0];
      long long v17 = (void *)*((void *)v13 + 1);
      *((void *)v13 + 1) = v18;
    }

    uint64_t v20 = [v12 copy];
    v21 = (void *)*((void *)v13 + 8);
    *((void *)v13 + 8) = v20;

    dispatch_source_t v22 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v13 + 1));
    v23 = (void *)*((void *)v13 + 2);
    *((void *)v13 + 2) = v22;

    objc_initWeak(&location, v13);
    uint64_t v24 = *((void *)v13 + 2);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_2;
    handler[3] = &unk_2647DCA50;
    objc_copyWeak(&v30, &location);
    dispatch_source_set_event_handler(v24, handler);
    dispatch_resume(*((dispatch_object_t *)v13 + 2));
    CMTimebaseAddTimerDispatchSource(*((CMTimebaseRef *)v13 + 9), *((dispatch_source_t *)v13 + 2));
    v25 = *((void *)v13 + 1);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_3;
    block[3] = &unk_2647DCD78;
    id v28 = v13;
    dispatch_async(v25, block);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return (VSOccasionalTimesObserver *)v13;
}

void __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_2(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[24])
    {
      uint64_t v5 = *((void *)WeakRetained + 7);
      uint64_t v4 = *((void *)WeakRetained + 8);
      CMTime v6 = *(void (**)(uint64_t, long long *, uint64_t))(*((void *)v3 + 8) + 16);
      long long v7 = *(_OWORD *)(v3 + 40);
      uint64_t v8 = v5;
      v6(v4, &v7, v2);
    }
    if (*((void *)v3 + 9)) {
      [v3 _resetNextFireTime];
    }
  }
}

uint64_t __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetNextFireTime];
}

uint64_t __64__VSOccasionalTimesObserver_initWithTimebase_times_queue_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  CMTime v6 = v5;
  if (!v4)
  {
    memset(&time1, 0, sizeof(time1));
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    memset(&v9, 0, sizeof(v9));
    goto LABEL_6;
  }
  [v4 CMTimeValue];
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  [v6 CMTimeValue];
LABEL_6:
  uint64_t v7 = CMTimeCompare(&time1, &v9);

  return v7;
}

@end