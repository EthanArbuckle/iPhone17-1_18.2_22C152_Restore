@interface PCDispatchTimer
- (BOOL)isValid;
- (NSDate)fireDate;
- (PCDispatchTimer)initWithQueue:(id)a3 target:(id)a4 selector:(SEL)a5 fireTime:(unint64_t)a6;
- (void)_callTarget;
- (void)_cleanupTimer;
- (void)dealloc;
- (void)invalidate;
- (void)setFireDate:(id)a3;
- (void)start;
@end

@implementation PCDispatchTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
}

- (void)start
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v2->_isValid = 1;
  dispatch_source_set_timer((dispatch_source_t)v2->_timerSource, v2->_fireTime, 0xFFFFFFFFFFFFFFFFLL, 0);
  v3 = +[PCLog timer];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    target = v2->_target;
    if (v2->_selector) {
      selector = v2->_selector;
    }
    else {
      selector = 0;
    }
    Name = sel_getName(selector);
    unint64_t fireTime = v2->_fireTime;
    timerSource = v2->_timerSource;
    int v9 = 138544386;
    v10 = v2;
    __int16 v11 = 2114;
    v12 = target;
    __int16 v13 = 2082;
    v14 = Name;
    __int16 v15 = 2048;
    unint64_t v16 = fireTime;
    __int16 v17 = 2114;
    v18 = timerSource;
    _os_log_debug_impl(&dword_1D340D000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ start with target %{public}@ selector %{public}s firetime %llu timerSource %{public}@", (uint8_t *)&v9, 0x34u);
  }

  objc_sync_exit(v2);
}

- (void)setFireDate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v5 = (NSDate *)a3;
  v6 = self;
  objc_sync_enter(v6);
  [(NSDate *)v5 timeIntervalSinceNow];
  double v8 = fmax(v7, 0.0);
  if (v8 >= 9223372040.0) {
    int64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    int64_t v9 = (uint64_t)(v8 * 1000000000.0);
  }
  dispatch_time_t v10 = dispatch_time(0, v9);
  v6->_unint64_t fireTime = v10;
  if (v6->_isValid)
  {
    dispatch_source_set_timer((dispatch_source_t)v6->_timerSource, v10, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
    __int16 v11 = +[PCLog timer];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = [(CUTWeakReference *)v6->_target object];
      if (v6->_selector) {
        selector = v6->_selector;
      }
      else {
        selector = 0;
      }
      Name = sel_getName(selector);
      unint64_t fireTime = v6->_fireTime;
      unint64_t v16 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)v9 / 1000000000.0];
      __int16 v17 = PCStringFromDate(v16);
      timerSource = v6->_timerSource;
      int v19 = 138544898;
      v20 = v6;
      __int16 v21 = 2114;
      v22 = v5;
      __int16 v23 = 2114;
      id v24 = v12;
      __int16 v25 = 2082;
      v26 = Name;
      __int16 v27 = 2048;
      unint64_t v28 = fireTime;
      __int16 v29 = 2114;
      v30 = v17;
      __int16 v31 = 2114;
      v32 = timerSource;
      _os_log_debug_impl(&dword_1D340D000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ setFireDate %{public}@ and start with target %{public}@ selector %{public}s fireTime %llu deltaNanosec %{public}@ timerSource %{public}@", (uint8_t *)&v19, 0x48u);
    }
  }
  else
  {
    __int16 v11 = +[PCLog timer];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PCDispatchTimer setFireDate:]();
    }
  }

  if (v6->_fireDate != v5) {
    objc_storeStrong((id *)&v6->_fireDate, a3);
  }
  objc_sync_exit(v6);
}

- (PCDispatchTimer)initWithQueue:(id)a3 target:(id)a4 selector:(SEL)a5 fireTime:(unint64_t)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  v31.receiver = self;
  v31.super_class = (Class)PCDispatchTimer;
  __int16 v13 = [(PCDispatchTimer *)&v31 init];
  v14 = v13;
  if (v11 && v13)
  {
    objc_storeStrong((id *)&v13->_queue, a3);
    uint64_t v15 = [MEMORY[0x1E4F59E30] weakRefWithObject:v12];
    target = v14->_target;
    v14->_target = (CUTWeakReference *)v15;

    if (a5) {
      SEL v17 = a5;
    }
    else {
      SEL v17 = 0;
    }
    v14->_selector = v17;
    v14->_isValid = 1;
    v14->_unint64_t fireTime = a6;
    dispatch_source_t v18 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v14->_queue);
    timerSource = v14->_timerSource;
    v14->_timerSource = (OS_dispatch_source *)v18;

    dispatch_source_set_timer((dispatch_source_t)v14->_timerSource, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v20 = +[PCLog timer];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int16 v25 = [(CUTWeakReference *)v14->_target object];
      if (v14->_selector) {
        selector = v14->_selector;
      }
      else {
        selector = 0;
      }
      Name = sel_getName(selector);
      unint64_t v28 = v14->_timerSource;
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = v14;
      __int16 v34 = 2114;
      v35 = v25;
      __int16 v36 = 2082;
      v37 = Name;
      __int16 v38 = 2114;
      v39 = v28;
      _os_log_debug_impl(&dword_1D340D000, v20, OS_LOG_TYPE_DEBUG, "%{public}@ initialized with target %{public}@ selector %{public}s timerSource %{public}@", buf, 0x2Au);
    }
    __int16 v21 = [MEMORY[0x1E4F59E30] weakRefWithObject:v14];
    v22 = v14->_timerSource;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke;
    handler[3] = &unk_1E698DE90;
    id v30 = v21;
    id v23 = v21;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_resume((dispatch_object_t)v14->_timerSource);
  }
  return v14;
}

- (void)invalidate
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D340D000, log, OS_LOG_TYPE_DEBUG, "%{public}@ is invalidated \nCallstack %{public}@", buf, 0x16u);
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D340D000, v0, v1, "%{public}@ dealloced", v2, v3, v4, v5, v6);
}

- (void)_cleanupTimer
{
  obj = self;
  objc_sync_enter(obj);
  timerSource = obj->_timerSource;
  if (timerSource)
  {
    dispatch_source_set_event_handler(timerSource, &__block_literal_global_10);
    dispatch_source_cancel((dispatch_source_t)obj->_timerSource);
    uint64_t v3 = obj->_timerSource;
    obj->_timerSource = 0;
  }
  objc_sync_exit(obj);
}

- (BOOL)isValid
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  BOOL isValid = v2->_isValid;
  objc_sync_exit(v2);

  return isValid;
}

void __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) object];
  uint64_t v2 = +[PCLog timer];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke_cold_1();
  }

  [v1 invalidate];
  [v1 _callTarget];
}

- (void)_callTarget
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D340D000, v0, v1, "%{public}@ performing call back", v2, v3, v4, v5, v6);
}

- (NSDate)fireDate
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

void __58__PCDispatchTimer_initWithQueue_target_selector_fireTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D340D000, v0, v1, "%{public}@ in call back event handler", v2, v3, v4, v5, v6);
}

- (void)setFireDate:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1D340D000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ tried to setFireDate %{public}@ but the timer is not valid", v2, 0x16u);
}

@end