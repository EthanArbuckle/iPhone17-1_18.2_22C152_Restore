@interface WLKPushNotificationMetricsManager
- (NSMutableDictionary)displayCriteria;
- (WLKPushNotificationMetricsManager)initWithNotificationSettings:(id)a3 notificationSettingsForTopic:(id)a4;
- (id)_createDisplayCriteriaFromSettings:(id)a3;
- (id)_stringFromNotificationSetting:(int64_t)a3;
@end

@implementation WLKPushNotificationMetricsManager

- (WLKPushNotificationMetricsManager)initWithNotificationSettings:(id)a3 notificationSettingsForTopic:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WLKPushNotificationMetricsManager;
  v8 = [(WLKPushNotificationMetricsManager *)&v29 init];
  if (v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    displayCriteria = v8->_displayCriteria;
    v8->_displayCriteria = v9;

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v12 = [(WLKPushNotificationMetricsManager *)v8 _createDisplayCriteriaFromSettings:v6];
    [v11 addEntriesFromDictionary:v12];

    if (v7 && [v7 count])
    {
      v23 = v11;
      id v24 = v6;
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v14 = [v7 keyEnumerator];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v20 = objc_msgSend(v7, "objectForKeyedSubscript:", v19, v23);
            v21 = [(WLKPushNotificationMetricsManager *)v8 _createDisplayCriteriaFromSettings:v20];
            [v13 setObject:v21 forKeyedSubscript:v19];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v30 count:16];
        }
        while (v16);
      }

      id v11 = v23;
      [v23 setObject:v13 forKeyedSubscript:@"subsections"];

      id v6 = v24;
    }
    [(NSMutableDictionary *)v8->_displayCriteria setObject:v11, @"displayCriteria", v23 forKeyedSubscript];
  }
  return v8;
}

- (id)_createDisplayCriteriaFromSettings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 alertSetting]);
  [v5 setObject:v6 forKeyedSubscript:@"alertSetting"];

  id v7 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 badgeSetting]);
  [v5 setObject:v7 forKeyedSubscript:@"badgeSetting"];

  v8 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 carPlaySetting]);
  [v5 setObject:v8 forKeyedSubscript:@"carPlaySetting"];

  v9 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 criticalAlertSetting]);
  [v5 setObject:v9 forKeyedSubscript:@"criticalAlertSetting"];

  v10 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 directMessagesSetting]);
  [v5 setObject:v10 forKeyedSubscript:@"directMessagesSetting"];

  id v11 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 lockScreenSetting]);
  [v5 setObject:v11 forKeyedSubscript:@"lockScreenSetting"];

  v12 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 notificationCenterSetting]);
  [v5 setObject:v12 forKeyedSubscript:@"notificationCenterSetting"];

  id v13 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 scheduledDeliverySetting]);
  [v5 setObject:v13 forKeyedSubscript:@"scheduledDeliverySetting"];

  v14 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 soundSetting]);
  [v5 setObject:v14 forKeyedSubscript:@"soundSetting"];

  uint64_t v15 = -[WLKPushNotificationMetricsManager _stringFromNotificationSetting:](self, "_stringFromNotificationSetting:", [v4 timeSensitiveSetting]);
  [v5 setObject:v15 forKeyedSubscript:@"timeSensitiveSetting"];

  unint64_t v16 = [v4 alertStyle];
  if (v16 > 2) {
    uint64_t v17 = &stru_1F13BCF18;
  }
  else {
    uint64_t v17 = off_1E620A628[v16];
  }
  [v5 setObject:v17 forKeyedSubscript:@"alertStyle"];
  unint64_t v18 = [v4 authorizationStatus];
  if (v18 > 4) {
    uint64_t v19 = &stru_1F13BCF18;
  }
  else {
    uint64_t v19 = off_1E620A640[v18];
  }
  [v5 setObject:v19 forKeyedSubscript:@"authorizationStatus"];
  unint64_t v20 = [v4 groupingSetting];
  if (v20 > 2) {
    v21 = &stru_1F13BCF18;
  }
  else {
    v21 = off_1E620A668[v20];
  }
  [v5 setObject:v21 forKeyedSubscript:@"groupingSetting"];
  if ([v4 providesAppNotificationSettings]) {
    v22 = @"yes";
  }
  else {
    v22 = @"no";
  }
  [v5 setObject:v22 forKeyedSubscript:@"providesAppNotificationSettings"];
  unint64_t v23 = [v4 showPreviewsSetting];
  if (v23 > 2) {
    id v24 = &stru_1F13BCF18;
  }
  else {
    id v24 = off_1E620A680[v23];
  }
  [v5 setObject:v24 forKeyedSubscript:@"showPreviewsSetting"];
  long long v25 = (void *)MEMORY[0x1E4F4DE08];
  long long v26 = WLKTVAppBundleID();
  uint64_t v27 = [v25 explicitContentSettingForBundleID:v26];

  if (v27 != -1)
  {
    if (v27 == 1) {
      long long v28 = @"explicit";
    }
    else {
      long long v28 = @"clean";
    }
    [v5 setObject:v28 forKeyedSubscript:@"explicitEnabled"];
  }

  return v5;
}

- (id)_stringFromNotificationSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return &stru_1F13BCF18;
  }
  else {
    return off_1E620A698[a3];
  }
}

- (NSMutableDictionary)displayCriteria
{
  return self->_displayCriteria;
}

- (void).cxx_destruct
{
}

@end