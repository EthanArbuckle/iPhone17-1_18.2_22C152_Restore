@interface MetricDelegate
- (void)metricMonitor:(id)a3 didEndWithError:(id)a4;
- (void)metricMonitor:(id)a3 didUpdateWithMetrics:(id)a4;
- (void)metricMonitorInterruptionDidBegin:(id)a3;
- (void)metricMonitorInterruptionDidEnd:(id)a3;
@end

@implementation MetricDelegate

- (void)metricMonitor:(id)a3 didEndWithError:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[MetricDelegate metricMonitor:didEndWithError:](a4);
  }
}

- (void)metricMonitor:(id)a3 didUpdateWithMetrics:(id)a4
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[MetricDelegate metricMonitor:didUpdateWithMetrics:](a4);
  }
}

- (void)metricMonitorInterruptionDidBegin:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "\nInterrupted; attempting to resume...",
      v3,
      2u);
  }
}

- (void)metricMonitorInterruptionDidEnd:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "\nInterruption ended!", v3, 2u);
  }
}

- (void)metricMonitor:(void *)a1 didEndWithError:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 localizedDescription];
  int v2 = 136315138;
  uint64_t v3 = [v1 UTF8String];
  _os_log_fault_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "\nError: %s\n", (uint8_t *)&v2, 0xCu);
}

- (void)metricMonitor:(void *)a1 didUpdateWithMetrics:.cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = [a1 description];
  int v2 = 136315138;
  uint64_t v3 = [v1 UTF8String];
  _os_log_fault_impl(&dword_1A11A5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "metric collect \n %s \n", (uint8_t *)&v2, 0xCu);
}

@end