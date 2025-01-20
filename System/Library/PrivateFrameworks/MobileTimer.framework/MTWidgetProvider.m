@interface MTWidgetProvider
- (BOOL)throttleTimelineReload;
- (id)broadcastWidgetTimelineReload;
- (void)throttleTimelineReload;
@end

@implementation MTWidgetProvider

- (BOOL)throttleTimelineReload
{
  v3 = [(MTBaseAlarmWidgetProvider *)self lastReloadRequestDate];

  if (!v3) {
    return 0;
  }
  v4 = [MEMORY[0x1E4F1C9C8] now];
  v5 = [(MTBaseAlarmWidgetProvider *)self lastReloadRequestDate];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 >= 2.0) {
    return 0;
  }
  v8 = MTLogForCategory(3);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    [(MTWidgetProvider *)(uint64_t)self throttleTimelineReload];
  }

  return 1;
}

- (id)broadcastWidgetTimelineReload
{
  return +[MTWidgetUtilities reloadAlarmWidgetTimeline];
}

- (void)throttleTimelineReload
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ widget refresh requested within throttle interval, dropping", (uint8_t *)&v2, 0xCu);
}

@end