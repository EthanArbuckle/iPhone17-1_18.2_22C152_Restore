@interface TPSAnalyticsSessionController
+ (void)_incrementSessionViewNumberForKey:(id)a3;
+ (void)_logSessionData;
+ (void)_resetSession;
+ (void)endSession;
+ (void)incrementCollectionsViewedCount;
+ (void)incrementTipsViewedCount;
+ (void)trackSession;
@end

@implementation TPSAnalyticsSessionController

+ (void)trackSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  +[TPSDefaultsManager sessionTimeoutIntervalInSeconds];
  if (v3 == 0.0) {
    double v4 = 86400.0;
  }
  else {
    double v4 = v3;
  }
  v5 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"TPSSessionStartTime"];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    v9 = +[TPSLogger analytics];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      unint64_t v14 = (unint64_t)v8;
      _os_log_impl(&dword_19C8DC000, v9, OS_LOG_TYPE_INFO, "Previous session has been active for %lu seconds.", (uint8_t *)&v13, 0xCu);
    }

    v10 = +[TPSLogger analytics];
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v8 >= v4)
    {
      if (v11)
      {
        int v13 = 134217984;
        unint64_t v14 = (unint64_t)v4;
        _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_INFO, "Previous session will be reset now because it started more than %lu seconds ago.", (uint8_t *)&v13, 0xCu);
      }

      [a1 endSession];
    }
    else
    {
      if (v11)
      {
        int v13 = 134217984;
        unint64_t v14 = (unint64_t)v4;
        _os_log_impl(&dword_19C8DC000, v10, OS_LOG_TYPE_INFO, "Previous session is still active because it is less than %lu seconds old.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    v12 = +[TPSLogger analytics];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19C8DC000, v12, OS_LOG_TYPE_INFO, "Starting a new session and resetting content view counts.", (uint8_t *)&v13, 2u);
    }

    [a1 _resetSession];
  }
}

+ (void)endSession
{
  [a1 _logSessionData];
  [a1 _resetSession];
}

+ (void)incrementCollectionsViewedCount
{
}

+ (void)incrementTipsViewedCount
{
}

+ (void)_logSessionData
{
  v2 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"collections_viewed"];
  uint64_t v3 = [v2 integerValue];

  double v4 = +[TPSAnalyticsPersistenceController persistedObjectForKey:@"tips_viewed"];
  uint64_t v5 = [v4 integerValue];

  id v6 = +[TPSAnalyticsEventSession eventWithCollectionsViewed:v3 tipsViewed:v5];
  [v6 log];
}

+ (void)_resetSession
{
  v2 = [MEMORY[0x1E4F1C9C8] now];
  +[TPSAnalyticsPersistenceController persistObject:v2 forKey:@"TPSSessionStartTime"];

  +[TPSAnalyticsPersistenceController persistObject:&unk_1EED9AFA8 forKey:@"collections_viewed"];
  +[TPSAnalyticsPersistenceController persistObject:&unk_1EED9AFA8 forKey:@"tips_viewed"];
}

+ (void)_incrementSessionViewNumberForKey:(id)a3
{
  id v3 = a3;
  double v4 = +[TPSAnalyticsPersistenceController persistedObjectForKey:v3];
  uint64_t v5 = [v4 integerValue];

  id v6 = [NSNumber numberWithInteger:v5 + 1];
  +[TPSAnalyticsPersistenceController persistObject:v6 forKey:v3];
}

@end