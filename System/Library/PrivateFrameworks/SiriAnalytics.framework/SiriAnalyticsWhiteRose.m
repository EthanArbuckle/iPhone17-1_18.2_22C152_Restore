@interface SiriAnalyticsWhiteRose
- (SiriAnalyticsWhiteRose)initWithQueue:(id)a3 delegate:(id)a4 metastore:(id)a5;
- (id)markTimeForAnnotatedMessage:(id)a3 withRootClock:(id)a4;
- (void)_cancelInactivityTimer;
- (void)_cancelMaximumClockLifeTimer;
- (void)_destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_ensureActiveClockStartingAt:(unint64_t)a3 completion:(id)a4;
- (void)_inactivityTimerElapsed;
- (void)_maximumClockLifeExpired;
- (void)_pulseActiveClock;
- (void)_startInactivityTimer;
- (void)_startMaximumClockLifeTimer;
- (void)bootstrapWithCompletion:(id)a3;
- (void)createTag:(id)a3 completion:(id)a4;
- (void)debounceFired:(id)a3 maximumReached:(BOOL)a4;
- (void)destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4;
- (void)markTimeForAnnotatedMessages:(id)a3 completion:(id)a4;
- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6;
- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6;
@end

@implementation SiriAnalyticsWhiteRose

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockPulse, 0);
  objc_storeStrong((id *)&self->_clockPulseTimer, 0);
  objc_storeStrong((id *)&self->_metastore, 0);
  objc_storeStrong((id *)&self->_maximumClockLifeTimer, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_activeClock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)debounceFired:(id)a3 maximumReached:(BOOL)a4
{
  if (self->_clockPulse == a3) {
    [(SiriAnalyticsWhiteRose *)self _pulseActiveClock];
  }
}

- (void)createTag:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke;
  aBlock[3] = &unk_1E5ABFD98;
  id v17 = v7;
  id v8 = v7;
  v9 = _Block_copy(aBlock);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_2;
  v13[3] = &unk_1E5AC0768;
  v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v11 = v9;
  id v12 = v6;
  dispatch_async(queue, v13);
}

uint64_t __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

void __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = mach_absolute_time();
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_3;
  v6[3] = &unk_1E5ABFDC0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v2 _ensureActiveClockStartingAt:v3 completion:v6];
}

void __47__SiriAnalyticsWhiteRose_createTag_completion___block_invoke_3(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    id v4 = *(void **)(a1[5] + 64);
    uint64_t v5 = [a2 clockIdentifier];
    id v7 = [v4 createTagWithShim:v3 onClock:v5];

    (*(void (**)(void, BOOL))(a1[6] + 16))(a1[6], v7 != 0);
  }
  else
  {
    id v6 = *(void (**)(void))(a1[6] + 16);
    v6();
  }
}

- (void)sensitiveCondition:(int)a3 endedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0010;
  id v21 = v10;
  id v11 = v10;
  id v12 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_2;
  block[3] = &unk_1E5ABFD70;
  BOOL v19 = a5;
  block[4] = self;
  id v16 = v12;
  unint64_t v17 = a4;
  int v18 = a3;
  id v14 = v12;
  dispatch_async(queue, block);
}

uint64_t __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 60) || v2[3])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_8;
    v5[3] = &unk_1E5ABFD48;
    int v8 = *(_DWORD *)(a1 + 56);
    uint64_t v7 = v3;
    id v6 = *(id *)(a1 + 40);
    [v2 _ensureActiveClockStartingAt:v3 completion:v5];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v4 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SiriAnalyticsWhiteRose sensitiveCondition:endedAt:ensureClockExists:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_INFO, "%s No active clock exists, ignoring sensitiveCondition", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __82__SiriAnalyticsWhiteRose_sensitiveCondition_endedAt_ensureClockExists_completion___block_invoke_8(uint64_t a1, void *a2)
{
  [a2 sensitiveCondition:*(unsigned int *)(a1 + 48) endedAt:*(void *)(a1 + 40)];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)sensitiveCondition:(int)a3 startedAt:(unint64_t)a4 ensureClockExists:(BOOL)a5 completion:(id)a6
{
  id v10 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke;
  aBlock[3] = &unk_1E5AC0010;
  id v21 = v10;
  id v11 = v10;
  id v12 = _Block_copy(aBlock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_2;
  block[3] = &unk_1E5ABFD70;
  BOOL v19 = a5;
  block[4] = self;
  id v16 = v12;
  unint64_t v17 = a4;
  int v18 = a3;
  id v14 = v12;
  dispatch_async(queue, block);
}

uint64_t __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 60) || v2[3])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_7;
    v5[3] = &unk_1E5ABFD48;
    int v8 = *(_DWORD *)(a1 + 56);
    uint64_t v7 = v3;
    id v6 = *(id *)(a1 + 40);
    [v2 _ensureActiveClockStartingAt:v3 completion:v5];
  }
  else
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    id v4 = SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v10 = "-[SiriAnalyticsWhiteRose sensitiveCondition:startedAt:ensureClockExists:completion:]_block_invoke_2";
      _os_log_impl(&dword_1A2B39000, v4, OS_LOG_TYPE_INFO, "%s No active clock exists, ignoring sensitiveCondition", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __84__SiriAnalyticsWhiteRose_sensitiveCondition_startedAt_ensureClockExists_completion___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 sensitiveCondition:*(unsigned int *)(a1 + 48) startedAt:*(void *)(a1 + 40)];
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

- (void)_maximumClockLifeExpired
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    uint64_t v5 = v3;
    id v6 = [(SiriAnalyticsLogicalClock *)activeClock clockIdentifier];
    int v7 = 136315394;
    int v8 = "-[SiriAnalyticsWhiteRose _maximumClockLifeExpired]";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  [(SiriAnalyticsWhiteRose *)self _destroyActiveClockWithReason:2 completion:0];
}

- (void)_cancelMaximumClockLifeTimer
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    activeClock = self->_activeClock;
    int v7 = v3;
    int v8 = [(SiriAnalyticsLogicalClock *)activeClock clockIdentifier];
    int v9 = 136315394;
    id v10 = "-[SiriAnalyticsWhiteRose _cancelMaximumClockLifeTimer]";
    __int16 v11 = 2112;
    id v12 = v8;
    _os_log_debug_impl(&dword_1A2B39000, v7, OS_LOG_TYPE_DEBUG, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  maximumClockLifeTimer = self->_maximumClockLifeTimer;
  if (maximumClockLifeTimer)
  {
    dispatch_source_cancel(maximumClockLifeTimer);
    uint64_t v5 = self->_maximumClockLifeTimer;
    self->_maximumClockLifeTimer = 0;
  }
}

- (void)_startMaximumClockLifeTimer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    uint64_t v5 = v3;
    id v6 = [(SiriAnalyticsLogicalClock *)activeClock clockIdentifier];
    *(_DWORD *)buf = 136315394;
    id v15 = "-[SiriAnalyticsWhiteRose _startMaximumClockLifeTimer]";
    __int16 v16 = 2112;
    unint64_t v17 = v6;
    _os_log_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  maximumClockLifeTimer = self->_maximumClockLifeTimer;
  self->_maximumClockLifeTimer = v7;

  int v9 = self->_maximumClockLifeTimer;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(self->_maximumClockLifeInterval * 1000000000.0));
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak((id *)buf, self);
  __int16 v11 = self->_maximumClockLifeTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __53__SiriAnalyticsWhiteRose__startMaximumClockLifeTimer__block_invoke;
  handler[3] = &unk_1E5AC05D8;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_source_set_event_handler(v11, handler);
  dispatch_resume((dispatch_object_t)self->_maximumClockLifeTimer);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __53__SiriAnalyticsWhiteRose__startMaximumClockLifeTimer__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A623C920]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _maximumClockLifeExpired];
}

- (void)_inactivityTimerElapsed
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v3 = (void *)SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    activeClock = self->_activeClock;
    uint64_t v5 = v3;
    id v6 = [(SiriAnalyticsLogicalClock *)activeClock clockIdentifier];
    int v7 = 136315394;
    int v8 = "-[SiriAnalyticsWhiteRose _inactivityTimerElapsed]";
    __int16 v9 = 2112;
    dispatch_time_t v10 = v6;
    _os_log_impl(&dword_1A2B39000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  [(SiriAnalyticsWhiteRose *)self _destroyActiveClockWithReason:1 completion:0];
}

- (void)_cancelInactivityTimer
{
  inactivityTimer = self->_inactivityTimer;
  if (inactivityTimer)
  {
    dispatch_source_cancel(inactivityTimer);
    id v4 = self->_inactivityTimer;
    self->_inactivityTimer = 0;
  }
}

- (void)_startInactivityTimer
{
  uint64_t v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_queue);
  inactivityTimer = self->_inactivityTimer;
  self->_inactivityTimer = v3;

  uint64_t v5 = self->_inactivityTimer;
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(self->_maximumInactivityInterval * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  objc_initWeak(&location, self);
  int v7 = self->_inactivityTimer;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__SiriAnalyticsWhiteRose__startInactivityTimer__block_invoke;
  v8[3] = &unk_1E5AC05D8;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_inactivityTimer);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __47__SiriAnalyticsWhiteRose__startInactivityTimer__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A623C920]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _inactivityTimerElapsed];
}

- (void)_pulseActiveClock
{
  activeClock = self->_activeClock;
  if (activeClock)
  {
    id v9 = [(SiriAnalyticsLogicalClock *)activeClock clockStatistics];
    if ([v9 messagesEmitted])
    {
      id v4 = [(SiriAnalyticsLogicalClock *)self->_activeClock clockStatistics];
      int v5 = [v4 bookkeepingDirtied];

      if (!v5) {
        return;
      }
      metastore = self->_metastore;
      int v7 = [(SiriAnalyticsLogicalClock *)self->_activeClock clockIdentifier];
      int v8 = [(SiriAnalyticsLogicalClock *)self->_activeClock clockStatistics];
      -[SiriAnalyticsMetastore pulseClock:lastEventOn:](metastore, "pulseClock:lastEventOn:", v7, [v8 lastMessageEmittedOn]);

      id v9 = [(SiriAnalyticsLogicalClock *)self->_activeClock clockStatistics];
      [v9 setBookkeepingDirtied:0];
    }
  }
}

- (void)_destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int v7 = [(SiriAnalyticsLogicalClock *)self->_activeClock clockIdentifier];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  int v8 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    unint64_t v17 = "-[SiriAnalyticsWhiteRose _destroyActiveClockWithReason:completion:]";
    __int16 v18 = 2112;
    BOOL v19 = v7;
    _os_log_impl(&dword_1A2B39000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  activeClock = self->_activeClock;
  if (activeClock)
  {
    [(SiriAnalyticsLogicalClock *)activeClock stopClock];
    dispatch_time_t v10 = self->_activeClock;
    uint64_t v11 = self->_activeClock;
    self->_activeClock = 0;
  }
  else
  {
    dispatch_time_t v10 = 0;
  }
  [(SiriAnalyticsWhiteRose *)self _cancelInactivityTimer];
  [(SiriAnalyticsWhiteRose *)self _cancelMaximumClockLifeTimer];
  [(SiriAnalyticsWhiteRose *)self _pulseActiveClock];
  [(SiriAnalyticsDebounce *)self->_clockPulse cancel];
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SiriAnalyticsWhiteRose__destroyActiveClockWithReason_completion___block_invoke;
    v13[3] = &unk_1E5AC0718;
    id v15 = v6;
    id v14 = v7;
    [WeakRetained whiteRose:self rootClockDestroyed:v10 reason:a3 completion:v13];
  }
  else if (v6)
  {
    (*((void (**)(id, void *))v6 + 2))(v6, v7);
  }
}

uint64_t __67__SiriAnalyticsWhiteRose__destroyActiveClockWithReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)destroyActiveClockWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose_destroyActiveClockWithReason_completion___block_invoke;
  block[3] = &unk_1E5ABFD20;
  id v10 = v6;
  unint64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __66__SiriAnalyticsWhiteRose_destroyActiveClockWithReason_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _destroyActiveClockWithReason:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_ensureActiveClockStartingAt:(unint64_t)a3 completion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a4;
  p_activeClock = (id *)&self->_activeClock;
  activeClock = self->_activeClock;
  if (activeClock)
  {
    id v9 = [(SiriAnalyticsLogicalClock *)activeClock clockStatistics];
    unint64_t v10 = [v9 startedOn];

    if (v10 > a3)
    {
      if (SiriAnalyticsLoggingInit_once != -1) {
        dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
      }
      unint64_t v11 = (void *)SiriAnalyticsLogContextTime;
      if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
      {
        id v22 = *p_activeClock;
        v23 = v11;
        v24 = [v22 clockIdentifier];
        v25 = [*p_activeClock clockStatistics];
        *(_DWORD *)buf = 136315906;
        v30 = "-[SiriAnalyticsWhiteRose _ensureActiveClockStartingAt:completion:]";
        __int16 v31 = 2112;
        v32 = v24;
        __int16 v33 = 2048;
        unint64_t v34 = [v25 startedOn];
        __int16 v35 = 2048;
        unint64_t v36 = a3;
        _os_log_debug_impl(&dword_1A2B39000, v23, OS_LOG_TYPE_DEBUG, "%s Backdating root clock: %@ start from: %lu to: %lu", buf, 0x2Au);
      }
      id v12 = [*p_activeClock clockStatistics];
      [v12 setStartedOn:a3];
    }
    ((void (**)(id, id))v6)[2](v6, *p_activeClock);
  }
  else
  {
    id v13 = [SiriAnalyticsRootClock alloc];
    id v14 = [MEMORY[0x1E4F29128] UUID];
    id v15 = [(SiriAnalyticsRootClock *)v13 initWithClockIdentifier:v14 timestampOffset:0 startedOn:a3 metastore:self->_metastore];

    objc_storeStrong((id *)&self->_activeClock, v15);
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    __int16 v16 = (void *)SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_INFO))
    {
      id v17 = *p_activeClock;
      __int16 v18 = v16;
      BOOL v19 = [v17 clockIdentifier];
      *(_DWORD *)buf = 136315650;
      v30 = "-[SiriAnalyticsWhiteRose _ensureActiveClockStartingAt:completion:]";
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2048;
      unint64_t v34 = a3;
      _os_log_impl(&dword_1A2B39000, v18, OS_LOG_TYPE_INFO, "%s Created primary clock: %@, starting on: %lu", buf, 0x20u);
    }
    [(SiriAnalyticsWhiteRose *)self _startMaximumClockLifeTimer];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke;
    v26[3] = &unk_1E5AC0768;
    v26[4] = self;
    v27 = v15;
    v28 = v6;
    id v21 = v15;
    [WeakRetained whiteRose:self willCreateRootClock:v21 completion:v26];
  }
}

void __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke_2;
  block[3] = &unk_1E5AC0768;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v3, block);
}

uint64_t __66__SiriAnalyticsWhiteRose__ensureActiveClockStartingAt_completion___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained whiteRose:a1[4] rootClockCreated:a1[5]];

  uint64_t v3 = *(uint64_t (**)(void))(a1[6] + 16);
  return v3();
}

- (void)markTimeForAnnotatedMessages:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke;
  block[3] = &unk_1E5AC0768;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke(id *a1)
{
  [a1[4] _cancelInactivityTimer];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1[5], "count"));
  id v3 = a1[4];
  uint64_t v4 = mach_absolute_time();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke_2;
  v8[3] = &unk_1E5ABFCF8;
  id v5 = a1[5];
  id v6 = a1[4];
  id v9 = v5;
  id v10 = v6;
  id v11 = v2;
  id v12 = a1[6];
  id v7 = v2;
  [v3 _ensureActiveClockStartingAt:v4 completion:v8];
}

void __66__SiriAnalyticsWhiteRose_markTimeForAnnotatedMessages_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(a1 + 40), "markTimeForAnnotatedMessage:withRootClock:", *(void *)(*((void *)&v10 + 1) + 8 * v8), v3, (void)v10);
        if (v9) {
          [*(id *)(a1 + 48) addObject:v9];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [*(id *)(a1 + 40) _startInactivityTimer];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)markTimeForAnnotatedMessage:(id)a3 withRootClock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 timestamp];
  id v9 = [v7 clockStatistics];
  unint64_t v10 = [v9 startedOn];

  if (v8 < v10)
  {
    if (SiriAnalyticsLoggingInit_once != -1) {
      dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
    }
    long long v11 = (void *)SiriAnalyticsLogContextTime;
    if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
    {
      v26 = v11;
      v27 = [v7 clockIdentifier];
      v28 = [v7 clockStatistics];
      int v29 = 136315906;
      v30 = "-[SiriAnalyticsWhiteRose markTimeForAnnotatedMessage:withRootClock:]";
      __int16 v31 = 2112;
      v32 = v27;
      __int16 v33 = 2048;
      uint64_t v34 = [v28 startedOn];
      __int16 v35 = 2048;
      uint64_t v36 = [v6 timestamp];
      _os_log_debug_impl(&dword_1A2B39000, v26, OS_LOG_TYPE_DEBUG, "%s Backdating root clock: %@ start from: %lu to: %lu", (uint8_t *)&v29, 0x2Au);
    }
    long long v12 = [v7 clockStatistics];
    objc_msgSend(v12, "setStartedOn:", objc_msgSend(v6, "timestamp"));
  }
  long long v13 = [v6 streamUUID];

  id v14 = v7;
  if (v13)
  {
    uint64_t v15 = [v6 streamUUID];
    char v16 = [v7 isTrackingDerivativeClockByStreamUUID:v15];

    id v17 = [v6 streamUUID];
    id v14 = [v7 derivativeClockForStreamUUID:v17];

    if ((v16 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained whiteRose:self derivativeClockCreated:v14 rootClock:v7];
    }
  }
  BOOL v19 = objc_msgSend(v14, "logicalTimestampForMachAbsoluteTime:", objc_msgSend(v6, "timestamp"));
  uint64_t v20 = [SiriAnalyticsMessage alloc];
  id v21 = [v6 messageUUID];
  id v22 = [v6 message];
  v23 = [(SiriAnalyticsMessage *)v20 initWithMessageUUID:v21 logicalTimestamp:v19 underlying:v22];

  v24 = [v14 clockStatistics];
  [v24 noteMessageEmitted];

  [(SiriAnalyticsDebounce *)self->_clockPulse pulse];
  return v23;
}

- (void)bootstrapWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__SiriAnalyticsWhiteRose_bootstrapWithCompletion___block_invoke;
  v7[3] = &unk_1E5AC0718;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__SiriAnalyticsWhiteRose_bootstrapWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (SiriAnalyticsLoggingInit_once != -1) {
    dispatch_once(&SiriAnalyticsLoggingInit_once, &__block_literal_global_749);
  }
  uint64_t v2 = SiriAnalyticsLogContextTime;
  if (os_log_type_enabled((os_log_t)SiriAnalyticsLogContextTime, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[SiriAnalyticsWhiteRose bootstrapWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_1A2B39000, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v3 = [*(id *)(*(void *)(a1 + 32) + 24) clockIdentifier];
  [*(id *)(*(void *)(a1 + 32) + 64) cleanupAbandonedClocksWithActiveClockIdentifier:v3];
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
}

- (SiriAnalyticsWhiteRose)initWithQueue:(id)a3 delegate:(id)a4 metastore:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SiriAnalyticsWhiteRose;
  long long v12 = [(SiriAnalyticsWhiteRose *)&v17 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    objc_storeStrong((id *)&v13->_metastore, a5);
    v13->_maximumInactivityInterval = 300.0;
    v13->_maximumClockLifeInterval = 900.0;
    id v14 = [[SiriAnalyticsDebounce alloc] initWithDebounceInterval:v13->_queue maximumInterval:v13 queue:2.0 delegate:5.0];
    clockPulse = v13->_clockPulse;
    v13->_clockPulse = v14;
  }
  return v13;
}

@end