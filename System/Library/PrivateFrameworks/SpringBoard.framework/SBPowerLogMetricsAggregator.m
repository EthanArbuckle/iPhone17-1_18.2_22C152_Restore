@interface SBPowerLogMetricsAggregator
- (SBPowerLogMetricsAggregator)init;
- (void)_flushEvents;
- (void)_startTimerIfNecessary;
- (void)emitEventOfType:(unint64_t)a3;
- (void)emitEventOfType:(unint64_t)a3 withDuration:(double)a4;
- (void)flushEventsDueToIminentPowerdown;
@end

@implementation SBPowerLogMetricsAggregator

- (SBPowerLogMetricsAggregator)init
{
  v10.receiver = self;
  v10.super_class = (Class)SBPowerLogMetricsAggregator;
  v2 = [(SBPowerLogMetricsAggregator *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SBPowerLogMetricsAggregatorQueue", 0);
    backgroundPowerLogQueue = v2->_backgroundPowerLogQueue;
    v2->_backgroundPowerLogQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    gregorian = v2->_gregorian;
    v2->_gregorian = (NSCalendar *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    eventsWithDuration = v2->_eventsWithDuration;
    v2->_eventsWithDuration = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)emitEventOfType:(unint64_t)a3
{
  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(backgroundPowerLogQueue, block);
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) > 1uLL)
  {
    v1 = SBLogAnalytics();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1();
    }
  }
  else
  {
    PLLogRegisteredEvent();
    v1 = SBLogAnalytics();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_2();
    }
  }
}

- (void)emitEventOfType:(unint64_t)a3 withDuration:(double)a4
{
  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke;
  block[3] = &unk_1E6AF4AE8;
  *(double *)&void block[5] = a4;
  block[6] = a3;
  block[4] = self;
  dispatch_async(backgroundPowerLogQueue, block);
}

void __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 2)
  {
    float v2 = *(double *)(a1 + 40) * 10.0;
    double v3 = roundf(v2) / 10.0;
    v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:@"IconDragging"];
    if (!v4)
    {
      v4 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKey:@"IconDragging"];
    }
    uint64_t v5 = [NSNumber numberWithDouble:v3];
    [v4 addObject:v5];

    [*(id *)(a1 + 32) _startTimerIfNecessary];
    v6 = SBLogAnalytics();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke_cold_1();
    }
  }
  else
  {
    v4 = SBLogAnalytics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1();
    }
  }
}

- (void)flushEventsDueToIminentPowerdown
{
  backgroundPowerLogQueue = self->_backgroundPowerLogQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__SBPowerLogMetricsAggregator_flushEventsDueToIminentPowerdown__block_invoke;
  block[3] = &unk_1E6AF4AC0;
  block[4] = self;
  dispatch_sync(backgroundPowerLogQueue, block);
}

uint64_t __63__SBPowerLogMetricsAggregator_flushEventsDueToIminentPowerdown__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushEvents];
}

- (void)_startTimerIfNecessary
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Scheduling SBPowerLogMetricEvent flush to PowerLog in %f seconds.", (uint8_t *)&v2, 0xCu);
}

uint64_t __53__SBPowerLogMetricsAggregator__startTimerIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushEvents];
}

- (void)_flushEvents
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D85BA000, log, OS_LOG_TYPE_DEBUG, "Flushed SBPowerLogMetricEvent to PowerLog.", v1, 2u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorian, 0);
  objc_storeStrong((id *)&self->_eventsWithDuration, 0);
  objc_storeStrong((id *)&self->_backgroundPowerLogQueue, 0);
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Attempting to emit SBPowerLogMetricEvent for unknown type %lu.", (uint8_t *)&v2, 0xCu);
}

void __47__SBPowerLogMetricsAggregator_emitEventOfType___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  int v2 = 134217984;
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_DEBUG, "Sending SBPowerLogMetricEvent type %lu to powerlog.", (uint8_t *)&v2, 0xCu);
}

void __60__SBPowerLogMetricsAggregator_emitEventOfType_withDuration___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1(*MEMORY[0x1E4F143B8]);
  int v3 = 134218240;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_debug_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_DEBUG, "Emitting SBPowerLogMetricEvent type %lu with duration: %f.", (uint8_t *)&v3, 0x16u);
}

@end