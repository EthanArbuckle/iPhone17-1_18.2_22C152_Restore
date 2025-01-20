@interface UNSNotificationSettingsService
- (UNSNotificationSettingsService)initWithSettingsGateway:(id)a3;
- (id)notificationSettingsForBundleIdentifier:(id)a3;
- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3;
- (id)notificationSourceForBundleIdentifier:(id)a3;
- (id)notificationSourcesForBundleIdentifiers:(id)a3;
- (id)notificationSourcesWithFilter:(id)a3;
- (id)notificationSystemSettings;
- (void)_queue_addObserver:(id)a3;
- (void)_queue_removeObserver:(id)a3;
- (void)addObserver:(id)a3;
- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4;
- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5;
- (void)resetScheduledDeliverySetting;
- (void)setNotificationSystemSettings:(id)a3;
- (void)settingsGateway:(id)a3 didUpdateGlobalSettings:(id)a4;
- (void)settingsGateway:(id)a3 didUpdateSectionInfoForSectionIDs:(id)a4;
@end

@implementation UNSNotificationSettingsService

- (id)notificationSettingsForTopicsWithBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v6 = [(UNSSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionID:v4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v7 = objc_msgSend(v6, "subsections", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 subsectionID];
        v14 = objc_msgSend(v12, "uns_notificationSettings");
        [v5 setObject:v14 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v5;
}

- (id)notificationSettingsForBundleIdentifier:(id)a3
{
  v3 = [(UNSSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionID:a3];
  id v4 = objc_msgSend(v3, "uns_notificationSettings");

  if (!v4)
  {
    id v4 = [MEMORY[0x263F1DF60] emptySettings];
  }
  return v4;
}

- (UNSNotificationSettingsService)initWithSettingsGateway:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)UNSNotificationSettingsService;
  v6 = [(UNSNotificationSettingsService *)&v17 init];
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    observers = v6->_observers;
    v6->_observers = v7;

    objc_storeStrong((id *)&v6->_settingsGateway, a3);
    [(UNSSettingsGateway *)v6->_settingsGateway addObserver:v6];
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.usernotificationsserver.SettingsService", v9);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v10;

    v12 = [(UNSAuthorizationAlertController *)[UNSCriticalAlertAuthorizationAlertController alloc] initWithQueue:v6->_queue];
    criticalAlertAuthorizationAlertController = v6->_criticalAlertAuthorizationAlertController;
    v6->_criticalAlertAuthorizationAlertController = v12;

    v14 = [(UNSAuthorizationAlertController *)[UNSNotificationAuthorizationAlertController alloc] initWithQueue:v6->_queue];
    notificationAuthorizationAlertController = v6->_notificationAuthorizationAlertController;
    v6->_notificationAuthorizationAlertController = v14;
  }
  return v6;
}

- (void)dealloc
{
  [(UNSSettingsGateway *)self->_settingsGateway removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)UNSNotificationSettingsService;
  [(UNSNotificationSettingsService *)&v3 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__UNSNotificationSettingsService_addObserver___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __46__UNSNotificationSettingsService_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addObserver:", *(void *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__UNSNotificationSettingsService_removeObserver___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __49__UNSNotificationSettingsService_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:", *(void *)(a1 + 40));
}

- (id)notificationSourceForBundleIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F1E070];
  id v6 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification Source For BundleIdentifier", (uint8_t *)&v11, 0xCu);
  }
  v7 = [(UNSSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionID:v4];
  id v8 = objc_msgSend(v7, "uns_notificationSource");
  uint64_t v9 = *v5;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543618;
    id v12 = v4;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning Notification Source For BundleIdentifier %{public}@", (uint8_t *)&v11, 0x16u);
  }

  return v8;
}

- (id)notificationSourcesForBundleIdentifiers:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E070];
  id v6 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification Sources For BundleIdentifiers", buf, 0xCu);
  }
  v7 = [(UNSSettingsGateway *)self->_settingsGateway effectiveSectionInfoForSectionIDs:v4];
  id v8 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "uns_notificationSource", (void)v17);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  uint64_t v15 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v4;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning Notification Sources For BundleIdentifiers %{public}@", buf, 0x16u);
  }

  return v8;
}

- (id)notificationSourcesWithFilter:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = (__CFString *)a3;
  id v5 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    *(_DWORD *)buf = 138543618;
    id v44 = (id)objc_opt_class();
    __int16 v45 = 2114;
    v46 = v4;
    id v7 = v44;
    _os_log_impl(&dword_22289A000, v6, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification Sources For Filter '%{public}@'", buf, 0x16u);
  }
  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  id v9 = [(UNSSettingsGateway *)self->_settingsGateway allEffectiveSectionInfo];
  uint64_t v10 = (void *)[v8 initWithArray:v9];

  id v11 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v40;
    uint64_t v16 = *MEMORY[0x263F845D0];
    uint64_t v17 = *MEMORY[0x263F845C0];
    id v37 = v12;
    id v38 = v11;
    uint64_t v36 = *MEMORY[0x263F845C0];
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
        if ([(__CFString *)v4 isEqualToString:v16]) {
          goto LABEL_9;
        }
        if ([(__CFString *)v4 isEqualToString:v17])
        {
          if ([v19 isRestricted])
          {
            int v21 = 1;
          }
          else
          {
            id v22 = [v19 sectionID];
            if ([v22 isEqualToString:@"com.apple.gamecenter"])
            {
              __int16 v23 = [MEMORY[0x263F53C50] sharedConnection];
              int v21 = [v23 isBoolSettingLockedDownByRestrictions:@"allowGameCenter"];
            }
            else
            {
              int v21 = 0;
            }
          }
          id v24 = (void *)MEMORY[0x263F251D0];
          v25 = [v19 sectionID];
          uint64_t v26 = [v24 applicationWithBundleIdentifier:v25];
          int v27 = [v26 isHidden];

          v28 = [v19 sectionID];
          if ([v28 isEqualToString:@"com.apple.mobilephone"])
          {
            if (_IsTelephonyDevice_once != -1) {
              dispatch_once(&_IsTelephonyDevice_once, &__block_literal_global_3);
            }
            BOOL v29 = _IsTelephonyDevice_telephonyDevice != 0;
          }
          else
          {
            BOOL v29 = 1;
          }

          int v30 = [v19 suppressFromSettings] | v21 | !v29 | v27;
          id v12 = v37;
          id v11 = v38;
          uint64_t v17 = v36;
          if ((v30 & 1) == 0)
          {
LABEL_9:
            long long v20 = objc_msgSend(v19, "uns_notificationSource");
            [v11 addObject:v20];
          }
        }
        ++v18;
      }
      while (v14 != v18);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v49 count:16];
    }
    while (v14);
  }

  v31 = (id)*MEMORY[0x263F1E070];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    id v32 = (id)objc_opt_class();
    char v33 = [(__CFString *)v4 isEqualToString:*MEMORY[0x263F845D0]];
    if (v33)
    {
      v34 = @"All";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"%lu of %lu", objc_msgSend(v11, "count"), objc_msgSend(v12, "count"));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    *(_DWORD *)buf = 138543874;
    id v44 = v32;
    __int16 v45 = 2114;
    v46 = v34;
    __int16 v47 = 2114;
    v48 = v4;
    _os_log_impl(&dword_22289A000, v31, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning %{public}@ Notification Sources For Filter '%{public}@'", buf, 0x20u);
    if ((v33 & 1) == 0) {
  }
    }
  return v11;
}

- (void)authorizationWithOptions:(unint64_t)a3 forNotificationSourceIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v10 = (os_log_t *)MEMORY[0x263F1E070];
  id v11 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    int v37 = 138543362;
    id v38 = v8;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Authorizing Notification Settings", (uint8_t *)&v37, 0xCu);
  }
  id v12 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v8];
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v16 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:]((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_17;
  }
  if (([v12 useDefaultDataProvider] & 1) == 0)
  {
    __int16 v23 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:]((uint64_t)v8, v23, v24, v25, v26, v27, v28, v29);
    }
    goto LABEL_17;
  }
  if ((a3 & 0x10) != 0 && ([v13 allowCriticalAlerts] & 1) == 0)
  {
    int v30 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR)) {
      -[UNSNotificationSettingsService authorizationWithOptions:forNotificationSourceIdentifier:withCompletionHandler:]((uint64_t)v8, v30, v31, v32, v33, v34, v35, v36);
    }
LABEL_17:
    uint64_t v14 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 1, 0);
    v9[2](v9, 0, v14);
    goto LABEL_18;
  }
  uint64_t v14 = [MEMORY[0x263F2BCA8] defaultSectionInfoForType:0];
  if ([v13 allowTimeSensitive]) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 0;
  }
  [v14 setTimeSensitiveSetting:v15];
  [v14 setSectionID:v8];
  objc_msgSend(v14, "uns_setPropertiesFromAuthorizationOptions:supportsProvisionalAlerts:", a3, objc_msgSend(v13, "supportsProvisionalAlerts"));
  [(UNSSettingsGateway *)self->_settingsGateway setSectionInfo:v14 forSectionID:v8];
  v9[2](v9, 1, 0);
LABEL_18:
}

- (void)replaceNotificationSettings:(id)a3 forNotificationSourceIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    *(_DWORD *)uint64_t v13 = 138543362;
    *(void *)&v13[4] = objc_opt_class();
    id v10 = *(id *)&v13[4];
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Replacing Notification Settings", v13, 0xCu);
  }
  id v11 = -[UNSSettingsGateway sectionInfoForSectionID:](self->_settingsGateway, "sectionInfoForSectionID:", v7, *(_OWORD *)v13);
  id v12 = [(UNSNotificationSettingsService *)self notificationSystemSettings];
  objc_msgSend(v11, "uns_setPropertiesFromNotificationSettings:systemSettings:", v6, v12);

  [(UNSSettingsGateway *)self->_settingsGateway setSectionInfo:v11 forSectionID:v7];
}

- (void)replaceNotificationTopicSettings:(id)a3 forNotificationSourceIdentifier:(id)a4 topicIdentifier:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = v10;
    *(_DWORD *)buf = 138543362;
    id v33 = (id)objc_opt_class();
    id v12 = v33;
    _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Replacing Notification Topic Settings", buf, 0xCu);
  }
  [(UNSSettingsGateway *)self->_settingsGateway sectionInfoForSectionID:v8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v24 = v30 = 0u;
  uint64_t v13 = [v24 subsections];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  uint64_t v25 = v8;
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = 0;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v20 = [v19 subsectionID];
        int v21 = [v20 isEqualToString:v9];

        if (v21)
        {
          id v22 = v19;

          uint64_t v16 = v22;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  __int16 v23 = [(UNSNotificationSettingsService *)self notificationSystemSettings];
  objc_msgSend(v16, "uns_setPropertiesFromNotificationSettings:systemSettings:", v26, v23);

  [(UNSSettingsGateway *)self->_settingsGateway setSectionInfo:v16 forSectionID:v25];
}

- (id)notificationSystemSettings
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)buf = 138543362;
    id v21 = (id)objc_opt_class();
    id v5 = v21;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Getting Notification System Settings", buf, 0xCu);
  }
  uint64_t v6 = UNShowPreviewsSettingFromBBContentPreviewSetting([(UNSSettingsGateway *)self->_settingsGateway globalContentPreviewSetting]);
  BOOL v7 = UNNotificationSettingFromBBAnnounceSetting([(UNSSettingsGateway *)self->_settingsGateway globalAnnounceSetting]);
  BOOL v8 = UNNotificationSettingFromBBAnnounceSetting([(UNSSettingsGateway *)self->_settingsGateway globalAnnounceHeadphonesSetting]);
  uint64_t v9 = UNNotificationAnnouncementCarPlaySettingFromBBAnnounceCarPlaySetting([(UNSSettingsGateway *)self->_settingsGateway globalAnnounceCarPlaySetting]);
  uint64_t v10 = UNNotificationSettingFromBBScheduledDeliverySetting([(UNSSettingsGateway *)self->_settingsGateway globalScheduledDeliverySetting]);
  id v11 = [(UNSSettingsGateway *)self->_settingsGateway globalScheduledDeliveryTimes];
  uint64_t v12 = UNNotificationSettingFromBBSystemSetting([(UNSSettingsGateway *)self->_settingsGateway globalScheduledDeliveryShowNextSummarySetting]);
  uint64_t v13 = UNNotificationListDisplayStyleSettingFromBBNotificationListDisplayStyleSetting([(UNSSettingsGateway *)self->_settingsGateway globalNotificationListDisplayStyleSetting]);
  uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F845A0]), "initWithShowPreviewsSetting:announcementSetting:announcementHeadphonesSetting:announcementCarPlaySetting:scheduledDeliverySetting:scheduledDeliveryTimes:scheduledDeliveryShowNextSummarySetting:notificationListDisplayStyleSetting:summarizationSetting:", v6, v7, v8, v9, v10, v11, v12, v13, UNNotificationSettingFromBBSystemSetting(-[UNSSettingsGateway globalSummarizationSetting](self->_settingsGateway, "globalSummarizationSetting")));
  uint64_t v15 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    uint64_t v17 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    id v21 = v17;
    __int16 v22 = 2114;
    __int16 v23 = v14;
    id v18 = v17;
    _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Returning System Settings %{public}@", buf, 0x16u);
  }
  return v14;
}

- (void)setNotificationSystemSettings:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F1E070];
  uint64_t v6 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    BOOL v8 = objc_opt_class();
    id v9 = v8;
    int v47 = 138543618;
    v48 = v8;
    __int16 v49 = 2048;
    uint64_t v50 = [v4 modifiedSettings];
    _os_log_impl(&dword_22289A000, v7, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Settings with modifiedSettings = %lu", (uint8_t *)&v47, 0x16u);
  }
  if ([v4 modifiedSettings])
  {
    os_log_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = objc_opt_class();
      int v47 = 138543362;
      v48 = v12;
      id v13 = v12;
      _os_log_impl(&dword_22289A000, v11, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Content Preview", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalContentPreviewSetting:](self->_settingsGateway, "setGlobalContentPreviewSetting:", BBContentPreviewSettingFromUNShowPreviewsSetting([v4 showPreviewsSetting]));
  }
  if (([v4 modifiedSettings] & 2) != 0)
  {
    os_log_t v14 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v14;
      uint64_t v16 = objc_opt_class();
      int v47 = 138543362;
      v48 = v16;
      id v17 = v16;
      _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalAnnounceSetting:](self->_settingsGateway, "setGlobalAnnounceSetting:", BBAnnounceSettingFromUNNotificationSetting([v4 announcementSetting]));
  }
  if (([v4 modifiedSettings] & 4) != 0)
  {
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = v18;
      uint64_t v20 = objc_opt_class();
      int v47 = 138543362;
      v48 = v20;
      id v21 = v20;
      _os_log_impl(&dword_22289A000, v19, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement in Headphones", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalAnnounceHeadphonesSetting:](self->_settingsGateway, "setGlobalAnnounceHeadphonesSetting:", BBAnnounceSettingFromUNNotificationSetting([v4 announcementHeadphonesSetting]));
  }
  if (([v4 modifiedSettings] & 8) != 0)
  {
    os_log_t v22 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v23 = v22;
      uint64_t v24 = objc_opt_class();
      int v47 = 138543362;
      v48 = v24;
      id v25 = v24;
      _os_log_impl(&dword_22289A000, v23, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Announcement in CarPlay", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalAnnounceCarPlaySetting:](self->_settingsGateway, "setGlobalAnnounceCarPlaySetting:", BBAnnounceCarPlaySettingFromUNNotificationAnnouncementCarPlaySetting([v4 announcementCarPlaySetting]));
  }
  if (([v4 modifiedSettings] & 0x10) != 0)
  {
    os_log_t v26 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v27 = v26;
      long long v28 = objc_opt_class();
      int v47 = 138543362;
      v48 = v28;
      id v29 = v28;
      _os_log_impl(&dword_22289A000, v27, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalScheduledDeliverySetting:](self->_settingsGateway, "setGlobalScheduledDeliverySetting:", BBScheduledDeliverySettingFromUNNotificationSetting([v4 scheduledDeliverySetting]));
  }
  if (([v4 modifiedSettings] & 0x20) != 0)
  {
    os_log_t v30 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = v30;
      uint64_t v32 = objc_opt_class();
      int v47 = 138543362;
      v48 = v32;
      id v33 = v32;
      _os_log_impl(&dword_22289A000, v31, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery Times", (uint8_t *)&v47, 0xCu);
    }
    uint64_t v34 = [v4 scheduledDeliveryTimes];
    [(UNSSettingsGateway *)self->_settingsGateway setGlobalScheduledDeliveryTimes:v34];
  }
  if (([v4 modifiedSettings] & 0x40) != 0)
  {
    os_log_t v35 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = v35;
      int v37 = objc_opt_class();
      int v47 = 138543362;
      v48 = v37;
      id v38 = v37;
      _os_log_impl(&dword_22289A000, v36, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Scheduled Delivery Show Next Summary", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalScheduledDeliveryShowNextSummarySetting:](self->_settingsGateway, "setGlobalScheduledDeliveryShowNextSummarySetting:", BBSystemSettingFromUNNotificationSetting([v4 scheduledDeliveryShowNextSummarySetting]));
  }
  if (([v4 modifiedSettings] & 0x80) != 0)
  {
    os_log_t v39 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      long long v40 = v39;
      long long v41 = objc_opt_class();
      int v47 = 138543362;
      v48 = v41;
      id v42 = v41;
      _os_log_impl(&dword_22289A000, v40, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Notification List Display Style", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalNotificationListDisplayStyleSetting:](self->_settingsGateway, "setGlobalNotificationListDisplayStyleSetting:", BBNotificationListDisplayStyleSettingFromUNNotificationListDisplayStyleSetting([v4 notificationListDisplayStyleSetting]));
  }
  if (([v4 modifiedSettings] & 0x200) != 0)
  {
    os_log_t v43 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = v43;
      __int16 v45 = objc_opt_class();
      int v47 = 138543362;
      v48 = v45;
      id v46 = v45;
      _os_log_impl(&dword_22289A000, v44, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Setting Notification System Setting for Summarization", (uint8_t *)&v47, 0xCu);
    }
    -[UNSSettingsGateway setGlobalSummarizationSetting:](self->_settingsGateway, "setGlobalSummarizationSetting:", BBSystemSettingFromUNNotificationSetting([v4 summarizationSetting]));
  }
}

- (void)resetScheduledDeliverySetting
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    *(_DWORD *)uint64_t v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v5 = *(id *)&v6[4];
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "UNSNotificationSettingsService [%{public}@] Resetting Scheduled Delivery Setting", v6, 0xCu);
  }
  -[UNSSettingsGateway setGlobalScheduledDeliverySetting:](self->_settingsGateway, "setGlobalScheduledDeliverySetting:", 0, *(_OWORD *)v6);
  [(UNSSettingsGateway *)self->_settingsGateway setGlobalScheduledDeliveryTimes:MEMORY[0x263EFFA68]];
}

- (void)_queue_addObserver:(id)a3
{
}

- (void)_queue_removeObserver:(id)a3
{
}

- (void)settingsGateway:(id)a3 didUpdateSectionInfoForSectionIDs:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = self->_observers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "settingsService:didUpdateNotificationSourcesForBundleIdentifiers:", self, v5, (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)settingsGateway:(id)a3 didUpdateGlobalSettings:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v20 = UNShowPreviewsSettingFromBBContentPreviewSetting([v5 globalContentPreviewSetting]);
  BOOL v6 = UNNotificationSettingFromBBAnnounceSetting([v5 globalAnnounceSetting]);
  BOOL v7 = UNNotificationSettingFromBBAnnounceSetting([v5 globalAnnounceHeadphonesSetting]);
  uint64_t v8 = UNNotificationAnnouncementCarPlaySettingFromBBAnnounceCarPlaySetting([v5 globalAnnounceCarPlaySetting]);
  uint64_t v9 = UNNotificationSettingFromBBScheduledDeliverySetting([v5 globalScheduledDeliverySetting]);
  uint64_t v10 = [v5 globalScheduledDeliveryTimes];
  uint64_t v11 = UNNotificationSettingFromBBSystemSetting([v5 globalScheduledDeliveryShowNextSummarySetting]);
  uint64_t v12 = UNNotificationListDisplayStyleSettingFromBBNotificationListDisplayStyleSetting([v5 globalNotificationListDisplayStyleSetting]);
  uint64_t v13 = [v5 globalSummarizationSetting];
  long long v14 = (void *)[objc_alloc(MEMORY[0x263F845A0]) initWithShowPreviewsSetting:v20 announcementSetting:v6 announcementHeadphonesSetting:v7 announcementCarPlaySetting:v8 scheduledDeliverySetting:v9 scheduledDeliveryTimes:v10 scheduledDeliveryShowNextSummarySetting:v11 notificationListDisplayStyleSetting:v12 summarizationSetting:v13];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v15 = self->_observers;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(v15);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v19++) settingsService:self didUpdateNotificationSystemSettings:v14];
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v17);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_criticalAlertAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)authorizationWithOptions:(uint64_t)a3 forNotificationSourceIdentifier:(uint64_t)a4 withCompletionHandler:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end