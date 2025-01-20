@interface SKUIMetricsUtilities
+ (BOOL)shouldLogTimingMetrics;
+ (BOOL)showEventNotifications;
+ (BOOL)trackAllEvents;
+ (double)timeIntervalFromJSTime:(id)a3;
+ (id)jsTimeFromTimeInterval:(double)a3;
+ (id)newErrorPageEvent;
+ (id)newErrorRetryClickEvent;
+ (void)newErrorPageEvent;
+ (void)newErrorRetryClickEvent;
+ (void)shouldLogTimingMetrics;
+ (void)showEventNotifications;
+ (void)trackAllEvents;
@end

@implementation SKUIMetricsUtilities

+ (BOOL)showEventNotifications
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        +[SKUIMetricsUtilities showEventNotifications];
      }
    }
  }
  if (showEventNotifications_onceToken != -1) {
    dispatch_once(&showEventNotifications_onceToken, &__block_literal_global_15);
  }
  return showEventNotifications_showEventNotifications;
}

uint64_t __46__SKUIMetricsUtilities_showEventNotifications__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SKUIMetricsShowEventNotifications", (CFStringRef)*MEMORY[0x1E4FA89F8], 0);
  uint64_t result = MGGetBoolAnswer();
  if (AppBooleanValue) {
    char v2 = result;
  }
  else {
    char v2 = 0;
  }
  showEventNotifications_showEventNotifications = v2;
  return result;
}

+ (BOOL)trackAllEvents
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        +[SKUIMetricsUtilities trackAllEvents];
      }
    }
  }
  if (trackAllEvents_onceToken != -1) {
    dispatch_once(&trackAllEvents_onceToken, &__block_literal_global_9);
  }
  return trackAllEvents_trackAllEvents;
}

uint64_t __38__SKUIMetricsUtilities_trackAllEvents__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SKUIMetricsTrackAll", (CFStringRef)*MEMORY[0x1E4FA89F8], 0);
  uint64_t result = MGGetBoolAnswer();
  if (AppBooleanValue) {
    char v2 = result;
  }
  else {
    char v2 = 0;
  }
  trackAllEvents_trackAllEvents = v2;
  return result;
}

+ (BOOL)shouldLogTimingMetrics
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v2) {
        +[SKUIMetricsUtilities shouldLogTimingMetrics];
      }
    }
  }
  return SSDebugShouldLogNetworkTimingMetrics();
}

+ (double)timeIntervalFromJSTime:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        +[SKUIMetricsUtilities timeIntervalFromJSTime:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  [v3 doubleValue];
  double v13 = v12 / 1000.0;

  return v13;
}

+ (id)jsTimeFromTimeInterval:(double)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG);
      if (v4) {
        +[SKUIMetricsUtilities jsTimeFromTimeInterval:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  double v12 = [NSNumber numberWithLongLong:(uint64_t)(a3 * 1000.0)];

  return v12;
}

+ (id)newErrorPageEvent
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIMetricsUtilities newErrorPageEvent]();
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4FA8248]);
  [v2 setPageDescription:@"Error"];
  return v2;
}

+ (id)newErrorRetryClickEvent
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[SKUIMetricsUtilities newErrorRetryClickEvent]();
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4FA8200]);
  [v2 setPageDescription:@"Error"];
  [v2 setActionType:@"retry"];
  [v2 setTargetType:*MEMORY[0x1E4FA88D0]];
  return v2;
}

+ (void)showEventNotifications
{
}

+ (void)trackAllEvents
{
}

+ (void)shouldLogTimingMetrics
{
}

+ (void)timeIntervalFromJSTime:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)jsTimeFromTimeInterval:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)newErrorPageEvent
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIMetricsUtilities newErrorPageEvent]";
}

+ (void)newErrorRetryClickEvent
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "+[SKUIMetricsUtilities newErrorRetryClickEvent]";
}

@end