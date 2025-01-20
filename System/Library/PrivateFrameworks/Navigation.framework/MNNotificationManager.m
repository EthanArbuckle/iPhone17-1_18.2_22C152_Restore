@interface MNNotificationManager
- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3;
@end

@implementation MNNotificationManager

- (void)showPredictedRouteTrafficIncidentBulletinForCommuteDetails:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    v6 = NSStringFromSelector(a2);
    int v7 = 136316162;
    v8 = "-[MNNotificationManager showPredictedRouteTrafficIncidentBulletinForCommuteDetails:]";
    __int16 v9 = 2080;
    v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Misc/MNNotificationManager.m";
    __int16 v11 = 1024;
    int v12 = 20;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: %@ must implement '%@'", (uint8_t *)&v7, 0x30u);
  }
}

@end