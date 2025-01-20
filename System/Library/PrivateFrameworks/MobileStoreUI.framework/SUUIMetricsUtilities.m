@interface SUUIMetricsUtilities
+ (BOOL)shouldLogTimingMetrics;
+ (BOOL)showEventNotifications;
+ (BOOL)trackAllEvents;
+ (double)timeIntervalFromJSTime:(id)a3;
+ (id)jsTimeFromTimeInterval:(double)a3;
+ (id)newErrorPageEvent;
+ (id)newErrorRetryClickEvent;
@end

@implementation SUUIMetricsUtilities

+ (BOOL)showEventNotifications
{
  if (showEventNotifications_onceToken != -1) {
    dispatch_once(&showEventNotifications_onceToken, &__block_literal_global_31);
  }
  return showEventNotifications_showEventNotifications;
}

uint64_t __46__SUUIMetricsUtilities_showEventNotifications__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SUUIMetricsShowEventNotifications", (CFStringRef)*MEMORY[0x263F7BDC8], 0);
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
  if (trackAllEvents_onceToken != -1) {
    dispatch_once(&trackAllEvents_onceToken, &__block_literal_global_6_0);
  }
  return trackAllEvents_trackAllEvents;
}

uint64_t __38__SUUIMetricsUtilities_trackAllEvents__block_invoke()
{
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SUUIMetricsTrackAll", (CFStringRef)*MEMORY[0x263F7BDC8], 0);
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
  return MEMORY[0x270F78E48](a1, a2);
}

+ (double)timeIntervalFromJSTime:(id)a3
{
  [a3 doubleValue];
  return v3 / 1000.0;
}

+ (id)jsTimeFromTimeInterval:(double)a3
{
  return (id)[NSNumber numberWithLongLong:(uint64_t)(a3 * 1000.0)];
}

+ (id)newErrorPageEvent
{
  id v2 = objc_alloc_init(MEMORY[0x263F7B270]);
  [v2 setPageDescription:@"Error"];
  return v2;
}

+ (id)newErrorRetryClickEvent
{
  id v2 = objc_alloc_init(MEMORY[0x263F7B228]);
  [v2 setPageDescription:@"Error"];
  [v2 setActionType:@"retry"];
  [v2 setTargetType:*MEMORY[0x263F7BBA8]];
  return v2;
}

@end