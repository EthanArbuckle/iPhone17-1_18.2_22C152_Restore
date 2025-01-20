@interface NCNotificationSectionSettings(Bulletin)
+ (id)notificationSectionSettingsForBBSectionInfo:()Bulletin;
- (id)_notificationSectionSettingsForSubSectionWithIdentifier:()Bulletin;
- (uint64_t)_contentPreviewSettingFromBBContentPreviewSetting:()Bulletin;
- (uint64_t)_groupingSettingFromBBGroupingSetting:()Bulletin;
- (uint64_t)contentPreviewSetting;
- (uint64_t)contentPreviewSettingForRequestWithSubSectionIdentifiers:()Bulletin;
- (uint64_t)criticalAlertsEnabled;
- (uint64_t)groupingSetting;
- (uint64_t)hasUserConfiguredDirectMessagesSetting;
- (uint64_t)hasUserConfiguredTimeSensitiveSetting;
- (uint64_t)isDirectMessagesEnabled;
- (uint64_t)isScheduledDeliveryEnabled;
- (uint64_t)isSummarizationEnabled;
- (uint64_t)isTimeSensitiveEnabled;
- (uint64_t)notificationsEnabled;
- (uint64_t)showsInLockScreen;
- (uint64_t)showsInNotificationCenter;
- (uint64_t)subSectionPriority;
@end

@implementation NCNotificationSectionSettings(Bulletin)

+ (id)notificationSectionSettingsForBBSectionInfo:()Bulletin
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4FB37C8]);
  v5 = [v3 sectionID];
  [v4 setSectionIdentifier:v5];

  v6 = [v3 subsectionID];
  [v4 setSubSectionIdentifier:v6];

  v7 = [v3 displayName];
  if (v7)
  {
    [v4 setDisplayName:v7];
  }
  else
  {
    v8 = [v3 appName];
    [v4 setDisplayName:v8];
  }
  v9 = objc_opt_new();
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "allowsNotifications"));
  [v9 setObject:v10 forKey:@"NotificationsEnabled"];

  v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "criticalAlertSetting") == 2);
  [v9 setObject:v11 forKey:@"CriticalAlertsEnabled"];

  v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "notificationCenterSetting") == 2);
  [v9 setObject:v12 forKey:@"ShowsInNotificationCenter"];

  v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "lockScreenSetting") == 2);
  [v9 setObject:v13 forKey:@"ShowsInLockScreen"];

  v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "contentPreviewSetting"));
  [v9 setObject:v14 forKey:@"ContentPreviewSetting"];

  v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "subsectionPriority"));
  [v9 setObject:v15 forKey:@"SubSectionPriorty"];

  v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "bulletinGroupingSetting"));
  [v9 setObject:v16 forKey:@"GroupingSetting"];

  v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "timeSensitiveSetting") == 2);
  [v9 setObject:v17 forKey:@"TimeSensitiveEnabled"];

  v18 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasUserConfiguredTimeSensitiveSetting"));
  [v9 setObject:v18 forKey:@"UserConfiguredTimeSensitiveSetting"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "scheduledDeliverySetting") == 2);
  [v9 setObject:v19 forKey:@"ScheduledDeliveryEnabled"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "directMessagesSetting") == 2);
  [v9 setObject:v20 forKey:@"DirectMessagesEnabled"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "hasUserConfiguredDirectMessagesSetting"));
  [v9 setObject:v21 forKey:@"UserConfiguredDirectMessagesSetting"];

  v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "summarizationSetting") == 2);
  [v9 setObject:v22 forKey:@"SummarizationEnabled"];

  [v4 setSettings:v9];
  v23 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v24 = objc_msgSend(v3, "subsections", 0);
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = [MEMORY[0x1E4FB3800] notificationSectionSettingsForBBSectionInfo:*(void *)(*((void *)&v40 + 1) + 8 * i)];
        [v23 addObject:v29];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v26);
  }

  [v4 setSubSectionSettings:v23];
  if ([v3 suppressFromSettings]) {
    uint64_t v30 = 0;
  }
  else {
    uint64_t v30 = [v3 isModificationAllowed] ^ 1;
  }
  [v4 setUserConfigurable:v30];
  v31 = [v3 icon];
  if (v31)
  {
    v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v32 scale];
    v33 = objc_msgSend(v31, "nc_imageForFormat:scale:userInterfaceStyle:usedUserInterfaceStyle:", 17, 0, 0);

    if (v33)
    {
      [v4 setSettingsIcon:v33];
    }
  }
  objc_msgSend(v4, "setShowsCustomSettingsLink:", objc_msgSend(v3, "showsCustomSettingsLink"));
  objc_msgSend(v4, "setHasProvisionalAuthorization:", objc_msgSend(v3, "authorizationStatus") == 3);
  objc_msgSend(v4, "setIsDeliveredQuietly:", objc_msgSend(v3, "isDeliveredQuietly"));
  objc_msgSend(v4, "setIsAppClip:", objc_msgSend(v3, "isAppClip"));
  v34 = [v3 muteAssertion];

  if (v34)
  {
    v35 = [v3 muteAssertion];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [MEMORY[0x1E4FB37F8] sectionMuteAssertion];
    }
    else
    {
      v37 = (void *)MEMORY[0x1E4FB3810];
      v38 = [v35 threadIDs];
      v36 = [v37 threadsMuteAssertionWithMutedThreadIDs:v38];
    }
    [v4 setMuteAssertion:v36];
  }

  return v4;
}

- (uint64_t)notificationsEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"NotificationsEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)criticalAlertsEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"CriticalAlertsEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)showsInNotificationCenter
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"ShowsInNotificationCenter"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)showsInLockScreen
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"ShowsInLockScreen"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)subSectionPriority
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"SubSectionPriorty"];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

- (uint64_t)contentPreviewSetting
{
  v2 = [a1 settings];
  uint64_t v3 = [v2 objectForKey:@"ContentPreviewSetting"];
  uint64_t v4 = [v3 integerValue];

  return [a1 _contentPreviewSettingFromBBContentPreviewSetting:v4];
}

- (uint64_t)groupingSetting
{
  v2 = [a1 settings];
  uint64_t v3 = [v2 objectForKey:@"GroupingSetting"];
  uint64_t v4 = [v3 integerValue];

  return [a1 _groupingSettingFromBBGroupingSetting:v4];
}

- (id)_notificationSectionSettingsForSubSectionWithIdentifier:()Bulletin
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  id v17 = 0;
  v5 = [a1 subSectionSettings];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__NCNotificationSectionSettings_Bulletin___notificationSectionSettingsForSubSectionWithIdentifier___block_invoke;
  v9[3] = &unk_1E6A93328;
  id v6 = v4;
  id v10 = v6;
  v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (uint64_t)contentPreviewSettingForRequestWithSubSectionIdentifiers:()Bulletin
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = objc_msgSend(a1, "_notificationSectionSettingsForSubSectionWithIdentifier:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
          v13 = v12;
          if (v12)
          {
            if (!v9 || (uint64_t v14 = [v12 subSectionPriority], v14 > objc_msgSend(v9, "subSectionPriority")))
            {
              id v15 = v13;

              v9 = v15;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    uint64_t v16 = [v9 contentPreviewSetting];
  }
  else
  {
    uint64_t v16 = [a1 contentPreviewSetting];
  }

  return v16;
}

- (uint64_t)isTimeSensitiveEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"TimeSensitiveEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)hasUserConfiguredTimeSensitiveSetting
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"UserConfiguredTimeSensitiveSetting"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)isScheduledDeliveryEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"ScheduledDeliveryEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)isDirectMessagesEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"DirectMessagesEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)hasUserConfiguredDirectMessagesSetting
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"UserConfiguredDirectMessagesSetting"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)isSummarizationEnabled
{
  v1 = [a1 settings];
  v2 = [v1 objectForKey:@"SummarizationEnabled"];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

- (uint64_t)_contentPreviewSettingFromBBContentPreviewSetting:()Bulletin
{
  uint64_t result = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    id v6 = (void *)*MEMORY[0x1E4FB3760];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3760], OS_LOG_TYPE_ERROR)) {
      [(NCNotificationSectionSettings(Bulletin) *)v6 _contentPreviewSettingFromBBContentPreviewSetting:a3];
    }
    return 0;
  }
  return result;
}

- (uint64_t)_groupingSettingFromBBGroupingSetting:()Bulletin
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)_contentPreviewSettingFromBBContentPreviewSetting:()Bulletin .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  id v6 = [a2 sectionIdentifier];
  int v7 = 134218242;
  uint64_t v8 = a3;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_ERROR, "Invalid content preview setting (%li) set on Notification Section Setting for section %@", (uint8_t *)&v7, 0x16u);
}

@end