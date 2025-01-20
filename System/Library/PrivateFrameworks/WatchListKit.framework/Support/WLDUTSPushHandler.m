@interface WLDUTSPushHandler
- (AMSMetrics)metricsController;
- (BOOL)shouldHandleNotification:(id)a3;
- (id)_debugDescriptionForNotificationType:(int64_t)a3;
- (void)_handlePayload:(id)a3 forNotificationType:(int64_t)a4;
- (void)_handlePayloadExpiredForNotificationType:(int64_t)a3;
- (void)_handlePayloadInvalidatedForNotificationType:(int64_t)a3;
- (void)_reportMetrics:(id)a3;
- (void)handleNotification:(id)a3;
- (void)setMetricsController:(id)a3;
@end

@implementation WLDUTSPushHandler

- (BOOL)shouldHandleNotification:(id)a3
{
  id v3 = a3;
  if ((char *)+[WLDPushParsing actionTypeForNotification:v3]- 34 > (char *)3)
  {
    BOOL v6 = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "wlk_dictionaryForKey:", @"payload");
    v5 = objc_msgSend(v4, "wlk_stringForKey:", @"type");
    BOOL v6 = ([v5 isEqualToString:@"upNextChanges"] & 1) != 0
      || ([v5 isEqualToString:@"favoriteTeamsChanges"] & 1) != 0
      || ([v5 isEqualToString:@"favoritesSyncSettings"] & 1) != 0
      || [v5 isEqualToString:@"favoriteLeaguesChanges"];
  }
  return v6;
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[WLDPushParsing actionTypeForNotification:v4];
  BOOL v6 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(WLDUTSPushHandler *)self _debugDescriptionForNotificationType:v5];
    int v16 = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Handling %@ notification", (uint8_t *)&v16, 0xCu);
  }
  v8 = objc_msgSend(v4, "wlk_dictionaryForKey:", @"payload");

  if (v8)
  {
    v9 = objc_msgSend(v8, "wlk_dateFromMillisecondsSince1970ForKey:", @"expiresAt");
    unsigned int v10 = objc_msgSend(v8, "wlk_BOOLForKey:defaultValue:", @"invalidate", 0);
    v11 = +[NSDate date];
    id v12 = [v11 compare:v9];

    if (v12 == (id)1)
    {
      v13 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Payload is expired %@, ignoring and invalidating", (uint8_t *)&v16, 0xCu);
      }

      [(WLDUTSPushHandler *)self _handlePayloadExpiredForNotificationType:v5];
    }
    else if (v10)
    {
      v14 = WLKPushNotificationsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Payload indicates invalidation", (uint8_t *)&v16, 2u);
      }

      [(WLDUTSPushHandler *)self _handlePayloadInvalidatedForNotificationType:v5];
    }
    else
    {
      [(WLDUTSPushHandler *)self _handlePayload:v8 forNotificationType:v5];
    }
    v15 = objc_msgSend(v8, "wlk_dictionaryForKey:", @"metrics");
    if (v15) {
      [(WLDUTSPushHandler *)self _reportMetrics:v15];
    }
  }
  else
  {
    v9 = WLKPushNotificationsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - No payload.", (uint8_t *)&v16, 2u);
    }
  }
}

- (id)_debugDescriptionForNotificationType:(int64_t)a3
{
  if ((unint64_t)(a3 - 34) > 3) {
    return 0;
  }
  else {
    return off_1000451F8[a3 - 34];
  }
}

- (void)_handlePayloadExpiredForNotificationType:(int64_t)a3
{
  switch(a3)
  {
    case '""':
      id v6 = +[WLKUpNextDeltaStore sharedInstance];
      [v6 delete:&__block_literal_global_3];

      return;
    case '#':
      id v3 = +[WLKSportsFavoriteManager defaultManager];
      [v3 handleRefreshCacheNotification];

      goto LABEL_6;
    case '$':
      int64_t v5 = +[WLKSportsFavoriteManager defaultManager];
      [v5 handleSyncSettingChangedNotification];

      uint64_t v4 = 0;
      goto LABEL_8;
    case '%':
LABEL_6:
      uint64_t v4 = 1;
LABEL_8:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:v4];
      break;
    default:
      return;
  }
}

void __62__WLDUTSPushHandler__handlePayloadExpiredForNotificationType___block_invoke(id a1, BOOL a2, NSError *a3)
{
  +[WLKUpNextWidgetCacheManager requestInvalidation];

  +[WLKUpNextWidgetCacheManager requestReload];
}

- (void)_handlePayloadInvalidatedForNotificationType:(int64_t)a3
{
  switch(a3)
  {
    case '""':
      id v6 = +[WLKUpNextDeltaStore sharedInstance];
      [v6 delete:&__block_literal_global_44];

      return;
    case '#':
      id v3 = +[WLKSportsFavoriteManager defaultManager];
      [v3 handleRefreshCacheNotification];

      goto LABEL_6;
    case '$':
      int64_t v5 = +[WLKSportsFavoriteManager defaultManager];
      [v5 handleSyncSettingChangedNotification];

      uint64_t v4 = 0;
      goto LABEL_8;
    case '%':
LABEL_6:
      uint64_t v4 = 1;
LABEL_8:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:v4];
      break;
    default:
      return;
  }
}

void __66__WLDUTSPushHandler__handlePayloadInvalidatedForNotificationType___block_invoke(id a1, BOOL a2, NSError *a3)
{
  +[WLKUpNextWidgetCacheManager requestInvalidation];

  +[WLKUpNextWidgetCacheManager requestReload];
}

- (void)_handlePayload:(id)a3 forNotificationType:(int64_t)a4
{
  id v5 = a3;
  switch(a4)
  {
    case '""':
      id v6 = [objc_alloc((Class)WLKUpNextDelta) initWithDictionary:v5];
      if (v6)
      {
        v7 = WLKPushNotificationsLogObject();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = [v6 items];
          int v13 = 134217984;
          id v14 = [v8 count];
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Processed Up Next delta with %lu items", (uint8_t *)&v13, 0xCu);
        }
        v9 = +[WLKUpNextDeltaStore sharedInstance];
        [v9 merge:v6 completion:&__block_literal_global_47];
      }
      break;
    case '#':
      unsigned int v10 = +[WLKSportsFavoriteManager defaultManager];
      [v10 handleRefreshCacheNotification];

      goto LABEL_8;
    case '$':
      id v12 = +[WLKSportsFavoriteManager defaultManager];
      [v12 handleSyncSettingChangedNotification];

      uint64_t v11 = 0;
      goto LABEL_10;
    case '%':
LABEL_8:
      uint64_t v11 = 1;
LABEL_10:
      +[SportsFavoriteServiceObjC markCacheTopicDirty:v11];
      break;
    default:
      break;
  }
}

void __56__WLDUTSPushHandler__handlePayload_forNotificationType___block_invoke(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = WLKPushNotificationsLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Successfully saved Up Next delta, requesting reload", (uint8_t *)&v7, 2u);
    }

    +[WLKUpNextWidgetCacheManager requestReload];
  }
  else
  {
    if (v6)
    {
      int v7 = 138412290;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Failed to save Up Next delta: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_reportMetrics:(id)a3
{
  id v4 = a3;
  id v5 = WLKPushNotificationsLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "WLDUTSPushHandler - Reporting metrics", v10, 2u);
  }

  id v6 = [objc_alloc((Class)AMSMetricsEvent) initWithTopic:@"xp_amp_notifications"];
  int v7 = v6;
  if (v6)
  {
    [v6 addPropertiesWithDictionary:v4];
    uint64_t v11 = v7;
    v8 = +[NSArray arrayWithObjects:&v11 count:1];
    v9 = [(WLDUTSPushHandler *)self metricsController];
    +[WLDMetricsUtilities sendMetricsEvents:v8 metricsController:v9];
  }
}

- (AMSMetrics)metricsController
{
  return self->_metricsController;
}

- (void)setMetricsController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end