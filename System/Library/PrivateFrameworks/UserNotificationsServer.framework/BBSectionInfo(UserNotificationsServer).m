@interface BBSectionInfo(UserNotificationsServer)
- (id)_uns_muteAssertion;
- (id)uns_bundlePath;
- (id)uns_notificationSource;
- (id)uns_settingsIcon;
- (id)uns_topicSettings;
- (uint64_t)uns_BBSectionAnnounceSettingForUNNotificationSetting:()UserNotificationsServer;
- (uint64_t)uns_BBSectionInfoSettingForUNNotificationSetting:()UserNotificationsServer;
- (uint64_t)uns_notificationSettingForBBSectionAnnounceSetting:()UserNotificationsServer;
- (uint64_t)uns_notificationSettingForBBSectionInfoSetting:()UserNotificationsServer;
- (uint64_t)uns_notificationSettings;
- (uint64_t)uns_setPropertiesFromAuthorizationOptions:()UserNotificationsServer supportsProvisionalAlerts:;
- (void)uns_setPropertiesFromNotificationSettings:()UserNotificationsServer systemSettings:;
- (void)uns_setPropertiesFromSourceSettingsDescription:()UserNotificationsServer;
- (void)uns_setPropertiesFromTopicRecord:()UserNotificationsServer;
@end

@implementation BBSectionInfo(UserNotificationsServer)

- (uint64_t)uns_setPropertiesFromAuthorizationOptions:()UserNotificationsServer supportsProvisionalAlerts:
{
  unsigned __int8 v7 = [a1 pushSettings];
  uint64_t v8 = [a1 authorizationStatus];
  uint64_t v9 = [a1 carPlaySetting];
  uint64_t v10 = v9;
  if ((a3 & 8) != 0 && !v9)
  {
    if ([a1 authorizationStatus] == 3) {
      int v11 = a4;
    }
    else {
      int v11 = 1;
    }
    if (v11) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  uint64_t v12 = [a1 remoteNotificationsSetting];
  if (!v12)
  {
    if ([a1 authorizationStatus] == 3) {
      int v13 = a4;
    }
    else {
      int v13 = 1;
    }
    if (v13) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  uint64_t v14 = [a1 criticalAlertSetting];
  unint64_t v15 = [a1 timeSensitiveSetting];
  uint64_t v16 = [a1 announceSetting];
  if (!v16)
  {
    if (v15 >= 2)
    {
      if ([a1 authorizationStatus] == 3) {
        int v17 = a4;
      }
      else {
        int v17 = 1;
      }
      if (v17) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = 1;
      }
    }
    else
    {
      uint64_t v16 = 1;
    }
  }
  if (v8 == 3) {
    int v18 = a4;
  }
  else {
    int v18 = 1;
  }
  if (v18) {
    uint64_t v19 = (v7 | (8 * ((v7 & 7 | a3) ^ v7))) & 0x38;
  }
  else {
    uint64_t v19 = 0;
  }
  unint64_t v20 = v19 & 0xFFFFFFFFFFFFFFF8 | v7 & 7 | a3 & 7;
  unint64_t v21 = (a3 >> 5) & 1 | [a1 showsCustomSettingsLink];
  if (((v14 == 0) & (a3 >> 4)) != 0) {
    uint64_t v22 = 2;
  }
  else {
    uint64_t v22 = v14;
  }
  [a1 setPushSettings:v20];
  [a1 setCarPlaySetting:v10];
  [a1 setRemoteNotificationsSetting:v12];
  [a1 setAnnounceSetting:v16];
  [a1 setCriticalAlertSetting:v22];
  [a1 setTimeSensitiveSetting:v15];
  return [a1 setShowsCustomSettingsLink:v21];
}

- (uint64_t)uns_notificationSettings
{
  uint64_t v2 = [a1 alertType];
  uint64_t v3 = [a1 pushSettings];
  uint64_t v4 = [a1 authorizationStatus];
  if ((unint64_t)(v4 - 1) >= 3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4;
  }
  v6 = [a1 sectionInfoSettings];
  int v7 = [v6 isAuthorizedTemporarily];

  if (v7) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v5;
  }
  uint64_t v9 = v3 << 61;
  uint64_t v10 = 2 * (v2 == 2);
  if (v2 == 1) {
    uint64_t v10 = 1;
  }
  uint64_t v31 = v10 & (v9 >> 63);
  uint64_t v32 = v8;
  uint64_t v30 = UNShowPreviewsSettingFromBBContentPreviewSetting([a1 contentPreviewSetting]);
  BOOL v26 = UNNotificationGroupingSettingFromBBBulletinGroupingSetting([a1 bulletinGroupingSetting]);
  if ((v3 & 0x10) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  uint64_t v29 = v11 & (v3 << 62 >> 63);
  if ((v3 & 8) != 0) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  uint64_t v28 = (v3 << 63 >> 63) & v12;
  if (v2) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  uint64_t v27 = v13 & (v9 >> 63);
  uint64_t v25 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "notificationCenterSetting"));
  uint64_t v14 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "lockScreenSetting"));
  uint64_t v15 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "carPlaySetting"));
  uint64_t v16 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "remoteNotificationsSetting"));
  uint64_t v17 = objc_msgSend(a1, "uns_notificationSettingForBBSectionAnnounceSetting:", objc_msgSend(a1, "announceSetting"));
  uint64_t v18 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "criticalAlertSetting"));
  uint64_t v19 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "timeSensitiveSetting"));
  uint64_t v20 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "scheduledDeliverySetting"));
  uint64_t v21 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "directMessagesSetting"));
  uint64_t v22 = objc_msgSend(a1, "uns_notificationSettingForBBSectionInfoSetting:", objc_msgSend(a1, "summarizationSetting"));
  LOBYTE(v24) = [a1 showsCustomSettingsLink];
  return objc_msgSend(MEMORY[0x263F1DF60], "settingsWithAuthorizationStatus:soundSetting:badgeSetting:alertSetting:notificationCenterSetting:lockScreenSetting:carPlaySetting:remoteNotificationsSetting:announcementSetting:criticalAlertSetting:timeSensitiveSetting:scheduledDeliverySetting:directMessagesSetting:summarizationSetting:alertStyle:showPreviewsSetting:groupingSetting:providesAppNotificationSettings:", v32, v29, v28, v27, v25, v14, v15, v16, v17, v18, v19, v20, v21, v22,
           v31,
           v30,
           v26,
           v24);
}

- (uint64_t)uns_notificationSettingForBBSectionInfoSetting:()UserNotificationsServer
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (uint64_t)uns_notificationSettingForBBSectionAnnounceSetting:()UserNotificationsServer
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return qword_2228DAA38[a3 - 1];
  }
}

- (void)uns_setPropertiesFromNotificationSettings:()UserNotificationsServer systemSettings:
{
  id v23 = a3;
  id v6 = a4;
  uint64_t v7 = [v23 authorizationStatus];
  if ((unint64_t)(v7 - 1) >= 4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v7;
  }
  [a1 setAuthorizationStatus:v8];
  uint64_t v9 = [v23 soundSetting];
  uint64_t v10 = 2;
  if (v9 == 2) {
    uint64_t v10 = 18;
  }
  if (v9) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [v23 alertSetting];
  uint64_t v13 = 4;
  if (v12 == 2) {
    uint64_t v13 = 36;
  }
  if (!v12) {
    uint64_t v13 = 0;
  }
  uint64_t v14 = v13 | v11;
  uint64_t v15 = [v23 badgeSetting];
  uint64_t v16 = 9;
  if (v15 != 2) {
    uint64_t v16 = 1;
  }
  if (!v15) {
    uint64_t v16 = 0;
  }
  [a1 setPushSettings:v14 | v16];
  uint64_t v17 = [v23 alertStyle];
  uint64_t v18 = 1;
  if (v17 == 2) {
    uint64_t v18 = 2;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  [a1 setAlertType:v19];
  uint64_t v20 = BBContentPreviewSettingFromUNShowPreviewsSetting([v23 showPreviewsSetting]);
  uint64_t v21 = [v6 showPreviewsSetting];

  if (v20 == BBContentPreviewSettingFromUNShowPreviewsSetting(v21)) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = v20;
  }
  [a1 setContentPreviewSetting:v22];
  objc_msgSend(a1, "setBulletinGroupingSetting:", BBBulletinGroupingSettingFromUNNotificationGroupingSetting(objc_msgSend(v23, "groupingSetting")));
  objc_msgSend(a1, "setNotificationCenterSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "notificationCenterSetting")));
  objc_msgSend(a1, "setLockScreenSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "lockScreenSetting")));
  objc_msgSend(a1, "setCarPlaySetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "carPlaySetting")));
  objc_msgSend(a1, "setRemoteNotificationsSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "remoteNotificationsSetting")));
  objc_msgSend(a1, "setCriticalAlertSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "criticalAlertSetting")));
  objc_msgSend(a1, "setShowsCustomSettingsLink:", objc_msgSend(v23, "providesAppNotificationSettings"));
  if ([v23 announcementSetting]) {
    objc_msgSend(a1, "setAnnounceSetting:", objc_msgSend(a1, "uns_BBSectionAnnounceSettingForUNNotificationSetting:", objc_msgSend(v23, "announcementSetting")));
  }
  if ([v23 scheduledDeliverySetting]) {
    objc_msgSend(a1, "setScheduledDeliverySetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "scheduledDeliverySetting")));
  }
  if ([v23 summarizationSetting]) {
    objc_msgSend(a1, "setSummarizationSetting:", objc_msgSend(a1, "uns_BBSectionInfoSettingForUNNotificationSetting:", objc_msgSend(v23, "summarizationSetting")));
  }
}

- (uint64_t)uns_BBSectionInfoSettingForUNNotificationSetting:()UserNotificationsServer
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (uint64_t)uns_BBSectionAnnounceSettingForUNNotificationSetting:()UserNotificationsServer
{
  if (a3 != 2) {
    return a3 == 1;
  }
  if (objc_msgSend(a1, "timeSensitiveSetting", v3, v4) == 2) {
    return 2;
  }
  return 3;
}

- (void)uns_setPropertiesFromSourceSettingsDescription:()UserNotificationsServer
{
  id v18 = a3;
  if ([v18 supportsAlerts])
  {
    if ([v18 modalAlertStyle]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    uint64_t v5 = 36;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 1;
  }
  if ([v18 supportsBadges]) {
    v5 |= 9uLL;
  }
  if ([v18 supportsSounds]) {
    uint64_t v6 = v5 | 0x12;
  }
  else {
    uint64_t v6 = v5;
  }
  if ([v18 supportsLockScreen]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v18 supportsNotificationCenter]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v18 supportsCarPlay]) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  int v10 = [v18 supportsTimeSensitive];
  int v11 = [v18 supportsSpoken];
  BOOL v12 = v10 == 0;
  if (v10) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = 1;
  if (!v12) {
    uint64_t v14 = 2;
  }
  if (v11) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  uint64_t v16 = [v18 alwaysShowPreviews];
  uint64_t v17 = [v18 providesAppNotificationSettings];
  [a1 setPushSettings:v6];
  [a1 setLockScreenSetting:v7];
  [a1 setNotificationCenterSetting:v8];
  [a1 setCarPlaySetting:v9];
  [a1 setRemoteNotificationsSetting:2];
  [a1 setAnnounceSetting:v15];
  [a1 setAlertType:v4];
  [a1 setContentPreviewSetting:v16];
  [a1 setShowsCustomSettingsLink:v17];
  [a1 setTimeSensitiveSetting:v13];
}

- (void)uns_setPropertiesFromTopicRecord:()UserNotificationsServer
{
  id v14 = a3;
  objc_msgSend(a1, "setAllowsNotifications:", objc_msgSend(v14, "enablesAlerts"));
  if ([v14 supportsAlerts])
  {
    if ([v14 enablesAlerts])
    {
      if ([v14 modalAlertStyle]) {
        uint64_t v4 = 2;
      }
      else {
        uint64_t v4 = 1;
      }
      uint64_t v5 = 36;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 4;
    }
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v4 = 1;
  }
  if ([v14 supportsBadges])
  {
    int v6 = [v14 enablesBadges];
    uint64_t v7 = 9;
    if (!v6) {
      uint64_t v7 = 1;
    }
    v5 |= v7;
  }
  if ([v14 supportsSounds])
  {
    int v8 = [v14 enablesSounds];
    uint64_t v9 = 2;
    if (v8) {
      uint64_t v9 = 18;
    }
    v5 |= v9;
  }
  if ([v14 supportsLockScreen])
  {
    if ([v14 enablesLockScreen]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v14 supportsNotificationCenter])
  {
    if ([v14 enablesNotificationCenter]) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([v14 supportsCarPlay])
  {
    if ([v14 enablesCarPlay]) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if ([v14 supportsTimeSensitive])
  {
    if ([v14 enablesTimeSensitive]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 1;
  }
  if ([v14 supportsSpoken])
  {
    if (![v14 enablesSpoken]) {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  [a1 setPushSettings:v5];
  [a1 setLockScreenSetting:v10];
  [a1 setNotificationCenterSetting:v11];
  [a1 setCarPlaySetting:v12];
  [a1 setRemoteNotificationsSetting:2];
  [a1 setAnnounceSetting:v13];
  [a1 setAlertType:v4];
  objc_msgSend(a1, "setSubsectionPriority:", objc_msgSend(v14, "priority"));
}

- (id)uns_notificationSource
{
  uint64_t v2 = objc_msgSend(a1, "uns_notificationSettings");
  uint64_t v3 = objc_msgSend(a1, "uns_topicSettings");
  id v4 = objc_alloc(MEMORY[0x263F84598]);
  uint64_t v5 = objc_msgSend(a1, "_uns_muteAssertion");
  int v6 = (void *)[v4 initWithNotificationSettings:v2 topicSettings:v3 muteAssertion:v5 isRestricted:*(void *)&a1[*MEMORY[0x263F2BCF8]] != 0];

  uint64_t v7 = objc_msgSend(a1, "uns_settingsIcon");
  int v8 = [a1 displayName];
  if ([v8 length]) {
    [a1 displayName];
  }
  else {
  uint64_t v9 = [a1 appName];
  }

  id v10 = objc_alloc(MEMORY[0x263F84588]);
  uint64_t v11 = [a1 sectionID];
  uint64_t v12 = [a1 suppressFromSettings];
  uint64_t v13 = objc_msgSend(a1, "uns_bundlePath");
  id v14 = (void *)[v10 initWithIdentifier:v11 isHidden:v12 displayName:v9 icon:v7 settings:v6 bundlePath:v13];

  return v14;
}

- (id)uns_settingsIcon
{
  uint64_t v2 = (void *)MEMORY[0x263F01878];
  uint64_t v3 = [a1 sectionID];
  id v4 = objc_msgSend(v2, "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v3);

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F1DF40];
    int v6 = [a1 sectionID];
    uint64_t v7 = [v5 iconForApplicationIdentifier:v6];
    goto LABEL_7;
  }
  int v6 = [a1 icon];
  int v8 = [v6 _bestVariantForFormat:1];
  uint64_t v9 = [v8 imageData];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x263F1DF40];
    uint64_t v11 = [a1 iconData];
    uint64_t v12 = [v10 iconWithData:v11];
  }
  else
  {
    uint64_t v14 = [v8 bundlePath];
    if (v14
      && (uint64_t v15 = (void *)v14,
          [v8 imageName],
          uint64_t v16 = objc_claimAutoreleasedReturnValue(),
          v16,
          v15,
          v16))
    {
      uint64_t v17 = (void *)MEMORY[0x263F1DF40];
      uint64_t v11 = [v8 imageName];
      uint64_t v12 = [v17 iconNamed:v11];
    }
    else
    {
      uint64_t v7 = [v8 imagePath];

      if (!v7) {
        goto LABEL_6;
      }
      id v18 = (void *)MEMORY[0x263F1DF40];
      uint64_t v11 = [v8 imagePath];
      uint64_t v12 = [v18 iconAtPath:v11];
    }
  }
  uint64_t v7 = (void *)v12;

LABEL_6:
LABEL_7:

  return v7;
}

- (id)uns_bundlePath
{
  uint64_t v2 = (void *)MEMORY[0x263F01878];
  uint64_t v3 = [a1 sectionID];
  id v4 = objc_msgSend(v2, "unkit_applicationRecordIfEligibleToDeliverNotificationsForBundleIdentifier:", v3);

  if (v4)
  {
    uint64_t v5 = [v4 URL];
    int v6 = [v5 path];
  }
  else
  {
    uint64_t v5 = [a1 icon];
    uint64_t v7 = [v5 _bestVariantForFormat:1];
    int v6 = [v7 bundlePath];
  }
  return v6;
}

- (id)uns_topicSettings
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = *(id *)(a1 + (int)*MEMORY[0x263F2BD00]);
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v8 = (void *)MEMORY[0x263F1DF70];
        uint64_t v9 = [v7 subsectionID];
        id v10 = [v7 displayName];
        uint64_t v11 = objc_msgSend(v8, "topicWithIdentifier:displayName:priority:sortIdentifier:", v9, v10, objc_msgSend(v7, "subsectionPriority"), &stru_26D509FA0);

        uint64_t v12 = objc_msgSend(v7, "uns_notificationSettings");
        uint64_t v13 = objc_msgSend(v7, "_uns_muteAssertion");
        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F845B0]) initWithTopic:v11 settings:v12 muteAssertion:v13];
        [v2 addObject:v14];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  return v2;
}

- (id)_uns_muteAssertion
{
  v1 = [a1 muteAssertion];
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = (void *)MEMORY[0x263F84590];
      uint64_t v3 = [v1 expirationDate];
      uint64_t v4 = [v2 sourceMuteAssertionUntilDate:v3];
LABEL_6:
      int v6 = (void *)v4;

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = (void *)MEMORY[0x263F845A8];
      uint64_t v3 = [v1 expirationDateByThreadID];
      uint64_t v4 = [v5 threadsMuteAssertionWithExpirationDateByThreadID:v3];
      goto LABEL_6;
    }
  }
  int v6 = 0;
LABEL_8:

  return v6;
}

@end