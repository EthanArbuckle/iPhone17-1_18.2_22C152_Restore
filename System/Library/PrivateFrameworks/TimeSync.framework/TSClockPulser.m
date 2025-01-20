@interface TSClockPulser
- (BOOL)startPulsing;
- (BOOL)stopPulsing;
- (BOOL)useRealtimePriority;
- (TSClockPulser)init;
- (TSClockPulser)initWithPulseClock:(id)a3;
- (id)pulseHandler;
- (int)pulseOffset;
- (unint64_t)pulsePeriod;
- (void)dealloc;
- (void)didBeginClockGrandmasterChangeForClock:(id)a3;
- (void)didChangeClockMasterForClock:(id)a3;
- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4;
- (void)didEndClockGrandmasterChangeForClock:(id)a3;
- (void)pulseThread;
- (void)setPulseHandler:(id)a3;
- (void)setPulseOffset:(int)a3;
- (void)setPulsePeriod:(unint64_t)a3;
- (void)setUseRealtimePriority:(BOOL)a3;
@end

@implementation TSClockPulser

- (TSClockPulser)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[TSClockPulser init]"];
  [v3 raise:v4, @"Do not call %@", v5 format];

  return 0;
}

- (TSClockPulser)initWithPulseClock:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSClockPulser;
  v6 = [(TSClockPulser *)&v10 init];
  if (v6)
  {
    v7 = (task_t *)MEMORY[0x1E4F14960];
    if (semaphore_create(*MEMORY[0x1E4F14960], &v6->_startSemaphore, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v12 = "status == KERN_SUCCESS";
        __int16 v13 = 2048;
        uint64_t v14 = 0;
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        __int16 v17 = 2080;
        v18 = "";
        __int16 v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
        __int16 v21 = 1024;
        int v22 = 69;
        v9 = MEMORY[0x1E4F14500];
LABEL_10:
        _os_log_impl(&dword_1BA88B000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
    }
    else
    {
      if (!semaphore_create(*v7, &v6->_stopSemaphore, 0, 0))
      {
        objc_storeStrong((id *)&v6->_pulseClock, a3);
        v6->_pulsePeriod = 1000000000;
        goto LABEL_5;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v12 = "status == KERN_SUCCESS";
        __int16 v13 = 2048;
        uint64_t v14 = 0;
        __int16 v15 = 2048;
        uint64_t v16 = 0;
        __int16 v17 = 2080;
        v18 = "";
        __int16 v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
        __int16 v21 = 1024;
        int v22 = 71;
        v9 = MEMORY[0x1E4F14500];
        goto LABEL_10;
      }
    }

    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (BOOL)startPulsing
{
  if ([(TSClockPulser *)self pulsePeriod] < 0xF4240) {
    return 0;
  }
  [(TSClock *)self->_pulseClock addClient:self];
  self->_threadShouldBeRunning = 1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__TSClockPulser_startPulsing__block_invoke;
  v4[3] = &unk_1E622A8F8;
  v4[4] = self;
  [MEMORY[0x1E4F29060] detachNewThreadWithBlock:v4];
  MEMORY[0x1BA9F2230](self->_startSemaphore);
  return self->_threadIsRunning;
}

uint64_t __29__TSClockPulser_startPulsing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) pulseThread];
}

- (BOOL)stopPulsing
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_threadIsRunning)
  {
    self->_threadShouldBeRunning = 0;
    MEMORY[0x1BA9F2230](self->_stopSemaphore, a2);
    self->_lastLockState = 0;
    [(TSClock *)self->_pulseClock removeClient:self];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136316418;
    id v5 = "_threadIsRunning";
    __int16 v6 = 2048;
    uint64_t v7 = 0;
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2080;
    v11 = "";
    __int16 v12 = 2080;
    __int16 v13 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/Utilities/TSClockPulser.m";
    __int16 v14 = 1024;
    int v15 = 106;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v4, 0x3Au);
  }
  return !self->_threadIsRunning;
}

- (void)didChangeClockMasterForClock:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Changed master clock", v3, 2u);
  }
}

- (void)didChangeLockStateTo:(int)a3 forClock:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Change lock state to %u", (uint8_t *)v7, 8u);
  }
  self->_holdoverMode = a3 != 2;
}

- (void)didBeginClockGrandmasterChangeForClock:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Begin grandmaster change", v3, 2u);
  }
}

- (void)didEndClockGrandmasterChangeForClock:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "End grandmaster change", v3, 2u);
  }
}

- (void)pulseThread
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to convert pulse thread to realtime. Error 0x%08x\n", (uint8_t *)v1, 8u);
}

- (void)dealloc
{
  semaphore_t startSemaphore = self->_startSemaphore;
  int v4 = (task_t *)MEMORY[0x1E4F14960];
  if (startSemaphore)
  {
    semaphore_destroy(*MEMORY[0x1E4F14960], startSemaphore);
    self->_semaphore_t startSemaphore = 0;
  }
  semaphore_t stopSemaphore = self->_stopSemaphore;
  if (stopSemaphore)
  {
    semaphore_destroy(*v4, stopSemaphore);
    self->_semaphore_t stopSemaphore = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSClockPulser;
  [(TSClockPulser *)&v6 dealloc];
}

- (id)pulseHandler
{
  return self->_pulseHandler;
}

- (void)setPulseHandler:(id)a3
{
}

- (BOOL)useRealtimePriority
{
  return self->_useRealtimePriority;
}

- (void)setUseRealtimePriority:(BOOL)a3
{
  self->_useRealtimePriority = a3;
}

- (unint64_t)pulsePeriod
{
  return self->_pulsePeriod;
}

- (void)setPulsePeriod:(unint64_t)a3
{
  self->_pulsePeriod = a3;
}

- (int)pulseOffset
{
  return self->_pulseOffset;
}

- (void)setPulseOffset:(int)a3
{
  self->_pulseOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pulseHandler, 0);
  objc_storeStrong((id *)&self->_pulseClock, 0);
}

@end