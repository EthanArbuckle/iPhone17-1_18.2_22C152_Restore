@interface UNCSectionInfoSettings
+ (BOOL)supportsSecureCoding;
- (BOOL)allowsNotifications;
- (BOOL)hasUserConfiguredDirectMessagesSetting;
- (BOOL)hasUserConfiguredTimeSensitiveSetting;
- (BOOL)isAuthorizedTemporarily;
- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsCustomSettingsLink;
- (BOOL)showsInLockScreen;
- (BOOL)showsInNotificationCenter;
- (BOOL)showsMessagePreview;
- (BOOL)showsOnExternalDevices;
- (NSDate)authorizationExpirationDate;
- (NSDate)lastUserGrantedAuthorizationDate;
- (NSDictionary)stateCapture;
- (UNCMuteAssertion)muteAssertion;
- (UNCSectionInfoSettings)initWithCoder:(id)a3;
- (UNCSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3;
- (id)_alertTypeDescription;
- (id)_announceSettingDescription;
- (id)_authorizationStatusDescription;
- (id)_bulletinGroupingSettingDescription;
- (id)_contentPreviewSettingDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)announceSetting;
- (int64_t)authorizationStatus;
- (int64_t)bulletinGroupingSetting;
- (int64_t)carPlaySetting;
- (int64_t)contentPreviewSetting;
- (int64_t)criticalAlertSetting;
- (int64_t)directMessagesSetting;
- (int64_t)lockScreenSetting;
- (int64_t)notificationCenterSetting;
- (int64_t)remoteNotificationsSetting;
- (int64_t)scheduledDeliverySetting;
- (int64_t)spokenNotificationSetting;
- (int64_t)timeSensitiveSetting;
- (unint64_t)alertType;
- (unint64_t)hash;
- (unint64_t)pushSettings;
- (void)encodeWithCoder:(id)a3;
- (void)muteSectionUntilDate:(id)a3;
- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4;
- (void)setAlertType:(unint64_t)a3;
- (void)setAllowsNotifications:(BOOL)a3;
- (void)setAnnounceSetting:(int64_t)a3;
- (void)setAuthorizationExpirationDate:(id)a3;
- (void)setAuthorizationStatus:(int64_t)a3;
- (void)setBulletinGroupingSetting:(int64_t)a3;
- (void)setCarPlaySetting:(int64_t)a3;
- (void)setContentPreviewSetting:(int64_t)a3;
- (void)setCriticalAlertSetting:(int64_t)a3;
- (void)setDirectMessagesSetting:(int64_t)a3;
- (void)setLastUserGrantedAuthorizationDate:(id)a3;
- (void)setLockScreenSetting:(int64_t)a3;
- (void)setMuteAssertion:(id)a3;
- (void)setNotificationCenterSetting:(int64_t)a3;
- (void)setPushSettings:(unint64_t)a3;
- (void)setRemoteNotificationsSetting:(int64_t)a3;
- (void)setScheduledDeliverySetting:(int64_t)a3;
- (void)setShowsCustomSettingsLink:(BOOL)a3;
- (void)setShowsInLockScreen:(BOOL)a3;
- (void)setShowsInNotificationCenter:(BOOL)a3;
- (void)setShowsOnExternalDevices:(BOOL)a3;
- (void)setSpokenNotificationSetting:(int64_t)a3;
- (void)setTimeSensitiveSetting:(int64_t)a3;
- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3;
- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3;
- (void)unmuteSection;
- (void)unmuteThreadIdentifier:(id)a3;
@end

@implementation UNCSectionInfoSettings

- (UNCSectionInfoSettings)initWithDefaultsForSectionType:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UNCSectionInfoSettings;
  v4 = [(UNCSectionInfoSettings *)&v7 init];
  v5 = v4;
  if (v4)
  {
    [(UNCSectionInfoSettings *)v4 setAuthorizationStatus:2];
    [(UNCSectionInfoSettings *)v5 setNotificationCenterSetting:2];
    if ((a3 | 2) == 2)
    {
      [(UNCSectionInfoSettings *)v5 setLockScreenSetting:2];
      [(UNCSectionInfoSettings *)v5 setShowsOnExternalDevices:1];
      [(UNCSectionInfoSettings *)v5 setContentPreviewSetting:0];
      [(UNCSectionInfoSettings *)v5 setAlertType:1];
      [(UNCSectionInfoSettings *)v5 setPushSettings:0];
      [(UNCSectionInfoSettings *)v5 setCarPlaySetting:0];
      [(UNCSectionInfoSettings *)v5 setRemoteNotificationsSetting:2];
      [(UNCSectionInfoSettings *)v5 setCriticalAlertSetting:0];
      [(UNCSectionInfoSettings *)v5 setTimeSensitiveSetting:0];
      [(UNCSectionInfoSettings *)v5 setUserConfiguredTimeSensitiveSetting:0];
      [(UNCSectionInfoSettings *)v5 setScheduledDeliverySetting:1];
      [(UNCSectionInfoSettings *)v5 setAnnounceSetting:1];
      [(UNCSectionInfoSettings *)v5 setDirectMessagesSetting:0];
      [(UNCSectionInfoSettings *)v5 setUserConfiguredDirectMessagesSetting:0];
    }
  }
  return v5;
}

- (void)muteSectionUntilDate:(id)a3
{
  id v4 = +[UNCSectionMuteAssertion sectionMuteAssertionUntilDate:a3];
  [(UNCSectionInfoSettings *)self setMuteAssertion:v4];
}

- (void)unmuteSection
{
}

- (void)muteThreadIdentifier:(id)a3 untilDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UNCSectionInfoSettings *)self muteAssertion];
  if (v8
    && (v9 = (void *)v8,
        [(UNCSectionInfoSettings *)self muteAssertion],
        v10 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v10,
        v9,
        (isKindOfClass & 1) == 0))
  {
    v16 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      -[UNCSectionInfoSettings muteThreadIdentifier:untilDate:]((uint64_t)v6, v16);
    }
  }
  else if (v6 && [v6 length])
  {
    v12 = [(UNCSectionInfoSettings *)self muteAssertion];

    if (!v12)
    {
      v13 = +[UNCThreadsMuteAssertion threadsMuteAssertion];
      [(UNCSectionInfoSettings *)self setMuteAssertion:v13];
    }
    v14 = [(UNCSectionInfoSettings *)self muteAssertion];
    [v14 setMutedUntilDate:v7 forThreadIdentifier:v6];
  }
  else
  {
    v15 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      -[UNCSectionInfoSettings muteThreadIdentifier:untilDate:](v15);
    }
  }
}

- (void)unmuteThreadIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNCSectionInfoSettings *)self muteAssertion];
  if (v5
    && (id v6 = (void *)v5,
        [(UNCSectionInfoSettings *)self muteAssertion],
        id v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) == 0))
  {
    v11 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      -[UNCSectionInfoSettings unmuteThreadIdentifier:]((uint64_t)v4, v11);
    }
  }
  else if (v4 && [v4 length])
  {
    v9 = [(UNCSectionInfoSettings *)self muteAssertion];
    [v9 setUnmutedForThreadIdentifier:v4];
  }
  else
  {
    v10 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      -[UNCSectionInfoSettings unmuteThreadIdentifier:](v10);
    }
  }
}

- (BOOL)isBulletinMutedForThreadIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UNCSectionInfoSettings *)self muteAssertion];
  char v6 = [v5 isActiveForThreadIdentifier:v4];

  return v6;
}

- (NSDictionary)stateCapture
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(UNCSectionInfoSettings *)self _authorizationStatusDescription];
  [v3 setValue:v4 forKey:@"Authorized"];

  uint64_t v5 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  char v6 = [v5 description];
  [v3 setValue:v6 forKey:@"Authorization Expiration Date"];

  id v7 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v8 = [v7 description];
  [v3 setValue:v8 forKey:@"Last User Granted Authorizated"];

  v9 = [(UNCSectionInfoSettings *)self muteAssertion];
  v10 = [v9 description];
  [v3 setValue:v10 forKey:@"Mute Configuration"];

  if ([(UNCSectionInfoSettings *)self notificationCenterSetting])
  {
    v11 = UNCStringFromBool([(UNCSectionInfoSettings *)self notificationCenterSetting] == 2);
    [v3 setValue:v11 forKey:@"NotificationCenter"];
  }
  if ([(UNCSectionInfoSettings *)self lockScreenSetting])
  {
    v12 = UNCStringFromBool([(UNCSectionInfoSettings *)self lockScreenSetting] == 2);
    [v3 setValue:v12 forKey:@"LockScreen"];
  }
  if ([(UNCSectionInfoSettings *)self carPlaySetting])
  {
    v13 = UNCStringFromBool([(UNCSectionInfoSettings *)self carPlaySetting] == 2);
    [v3 setValue:v13 forKey:@"CarPlay"];
  }
  if ([(UNCSectionInfoSettings *)self remoteNotificationsSetting])
  {
    v14 = UNCStringFromBool([(UNCSectionInfoSettings *)self remoteNotificationsSetting] == 2);
    [v3 setValue:v14 forKey:@"RemoteNotifications"];
  }
  if ([(UNCSectionInfoSettings *)self criticalAlertSetting])
  {
    v15 = UNCStringFromBool([(UNCSectionInfoSettings *)self criticalAlertSetting] == 2);
    [v3 setValue:v15 forKey:@"CriticalAlerts"];
  }
  if ([(UNCSectionInfoSettings *)self timeSensitiveSetting])
  {
    v16 = UNCStringFromBool([(UNCSectionInfoSettings *)self timeSensitiveSetting] == 2);
    [v3 setValue:v16 forKey:@"TimeSensitive"];

    v17 = UNCStringFromBool([(UNCSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting]);
    [v3 setValue:v17 forKey:@"UserConfiguredTimeSensitive"];
  }
  if ([(UNCSectionInfoSettings *)self announceSetting])
  {
    v18 = [(UNCSectionInfoSettings *)self _announceSettingDescription];
    [v3 setValue:v18 forKey:@"AnnounceNotifications"];
  }
  if ([(UNCSectionInfoSettings *)self scheduledDeliverySetting])
  {
    v19 = UNCStringFromBool([(UNCSectionInfoSettings *)self scheduledDeliverySetting] == 2);
    [v3 setValue:v19 forKey:@"ScheduledDelivery"];
  }
  if ([(UNCSectionInfoSettings *)self directMessagesSetting])
  {
    v20 = UNCStringFromBool([(UNCSectionInfoSettings *)self directMessagesSetting] == 2);
    [v3 setValue:v20 forKey:@"DirectMessages"];

    v21 = UNCStringFromBool([(UNCSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting]);
    [v3 setValue:v21 forKey:@"UserConfiguredDirectMessages"];
  }
  v22 = UNCStringFromBool([(UNCSectionInfoSettings *)self showsOnExternalDevices]);
  [v3 setValue:v22 forKey:@"ShowsOnExternalDevices"];

  v23 = UNCStringFromBool([(UNCSectionInfoSettings *)self showsCustomSettingsLink]);
  [v3 setValue:v23 forKey:@"CustomSettingsLink"];

  v24 = [(UNCSectionInfoSettings *)self _contentPreviewSettingDescription];
  [v3 setValue:v24 forKey:@"ContentPreviewSetting"];

  v25 = [(UNCSectionInfoSettings *)self _alertTypeDescription];
  [v3 setValue:v25 forKey:@"AlertType"];

  v26 = UNCStringFromBool([(UNCSectionInfoSettings *)self pushSettings] & 1);
  [v3 setValue:v26 forKey:@"PushSettingsBadgeSupported"];

  v27 = UNCStringFromBool(([(UNCSectionInfoSettings *)self pushSettings] >> 3) & 1);
  [v3 setValue:v27 forKey:@"PushSettingsBadgeEnabled"];

  v28 = UNCStringFromBool(([(UNCSectionInfoSettings *)self pushSettings] >> 1) & 1);
  [v3 setValue:v28 forKey:@"PushSettingsSoundSupported"];

  v29 = UNCStringFromBool(([(UNCSectionInfoSettings *)self pushSettings] >> 4) & 1);
  [v3 setValue:v29 forKey:@"PushSettingsSoundEnabled"];

  v30 = UNCStringFromBool(([(UNCSectionInfoSettings *)self pushSettings] >> 2) & 1);
  [v3 setValue:v30 forKey:@"PushSettingsAlertSupported"];

  v31 = UNCStringFromBool(([(UNCSectionInfoSettings *)self pushSettings] >> 5) & 1);
  [v3 setValue:v31 forKey:@"PushSettingsAlertEnabled"];

  v32 = [(UNCSectionInfoSettings *)self _bulletinGroupingSettingDescription];
  [v3 setValue:v32 forKey:@"GroupingSetting"];

  return (NSDictionary *)v3;
}

- (id)description
{
  id v3 = [(UNCSectionInfoSettings *)self _authorizationStatusDescription];
  id v4 = [@" Section settings" stringByAppendingFormat:@": authorized = %@", v3];

  uint64_t v5 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  char v6 = [v4 stringByAppendingFormat:@", authorization expiration date = %@", v5];

  id v7 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v8 = [v6 stringByAppendingFormat:@", last user granted authorization date = %@", v7];

  v9 = [(UNCSectionInfoSettings *)self muteAssertion];
  v10 = [v8 stringByAppendingFormat:@", mute configuration = %@", v9];

  if ([(UNCSectionInfoSettings *)self notificationCenterSetting])
  {
    if ([(UNCSectionInfoSettings *)self notificationCenterSetting] == 2) {
      v11 = @"YES";
    }
    else {
      v11 = @"NO";
    }
    uint64_t v12 = [v10 stringByAppendingFormat:@", notification center = %@", v11];

    v10 = (void *)v12;
  }
  if ([(UNCSectionInfoSettings *)self lockScreenSetting])
  {
    if ([(UNCSectionInfoSettings *)self lockScreenSetting] == 2) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    uint64_t v14 = [v10 stringByAppendingFormat:@", lock screen = %@", v13];

    v10 = (void *)v14;
  }
  if ([(UNCSectionInfoSettings *)self scheduledDeliverySetting])
  {
    if ([(UNCSectionInfoSettings *)self scheduledDeliverySetting] == 2) {
      v15 = @"YES";
    }
    else {
      v15 = @"NO";
    }
    uint64_t v16 = [v10 stringByAppendingFormat:@", scheduled delivery = %@", v15];

    v10 = (void *)v16;
  }
  if ([(UNCSectionInfoSettings *)self carPlaySetting])
  {
    if ([(UNCSectionInfoSettings *)self carPlaySetting] == 2) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    uint64_t v18 = [v10 stringByAppendingFormat:@", CarPlay = %@", v17];

    v10 = (void *)v18;
  }
  if ([(UNCSectionInfoSettings *)self remoteNotificationsSetting])
  {
    if ([(UNCSectionInfoSettings *)self remoteNotificationsSetting] == 2) {
      v19 = @"YES";
    }
    else {
      v19 = @"NO";
    }
    uint64_t v20 = [v10 stringByAppendingFormat:@", remote notifications = %@", v19];

    v10 = (void *)v20;
  }
  if ([(UNCSectionInfoSettings *)self criticalAlertSetting])
  {
    if ([(UNCSectionInfoSettings *)self criticalAlertSetting] == 2) {
      v21 = @"YES";
    }
    else {
      v21 = @"NO";
    }
    uint64_t v22 = [v10 stringByAppendingFormat:@", critical alert = %@", v21];

    v10 = (void *)v22;
  }
  if ([(UNCSectionInfoSettings *)self timeSensitiveSetting])
  {
    if ([(UNCSectionInfoSettings *)self timeSensitiveSetting] == 2) {
      v23 = @"YES";
    }
    else {
      v23 = @"NO";
    }
    v24 = [v10 stringByAppendingFormat:@", time sensitive = %@", v23];

    if ([(UNCSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting]) {
      v25 = @"YES";
    }
    else {
      v25 = @"NO";
    }
    v10 = [v24 stringByAppendingFormat:@", user configured time sensitive = %@", v25];
  }
  if ([(UNCSectionInfoSettings *)self announceSetting])
  {
    v26 = [(UNCSectionInfoSettings *)self _announceSettingDescription];
    uint64_t v27 = [v10 stringByAppendingFormat:@", announce setting = %@", v26];

    v10 = (void *)v27;
  }
  if ([(UNCSectionInfoSettings *)self directMessagesSetting])
  {
    if ([(UNCSectionInfoSettings *)self directMessagesSetting] == 2) {
      v28 = @"YES";
    }
    else {
      v28 = @"NO";
    }
    v29 = [v10 stringByAppendingFormat:@", direct messages = %@", v28];

    if ([(UNCSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting])
    {
      v30 = @"YES";
    }
    else
    {
      v30 = @"NO";
    }
    v10 = [v29 stringByAppendingFormat:@", user configured direct messages = %@", v30];
  }
  if ([(UNCSectionInfoSettings *)self showsOnExternalDevices]) {
    v31 = @"YES";
  }
  else {
    v31 = @"NO";
  }
  v32 = [v10 stringByAppendingFormat:@", shows on external devices = %@", v31];

  if ([(UNCSectionInfoSettings *)self showsCustomSettingsLink]) {
    v33 = @"YES";
  }
  else {
    v33 = @"NO";
  }
  v34 = [v32 stringByAppendingFormat:@", shows custom settings = %@", v33];

  v35 = [(UNCSectionInfoSettings *)self _contentPreviewSettingDescription];
  v36 = [v34 stringByAppendingFormat:@", content preview setting = %@", v35];

  v37 = [(UNCSectionInfoSettings *)self _alertTypeDescription];
  v38 = [v36 stringByAppendingFormat:@", Alert style = %@", v37];

  v39 = UNCPushSettingsDescription([(UNCSectionInfoSettings *)self pushSettings]);
  v40 = [v38 stringByAppendingFormat:@", Push settings = %@", v39];

  v41 = [(UNCSectionInfoSettings *)self _bulletinGroupingSettingDescription];
  v42 = [v40 stringByAppendingFormat:@", grouping = %@", v41];

  v46.receiver = self;
  v46.super_class = (Class)UNCSectionInfoSettings;
  v43 = [(UNCSectionInfoSettings *)&v46 description];
  v44 = [v43 stringByAppendingString:v42];

  return v44;
}

- (id)_authorizationStatusDescription
{
  unint64_t v2 = [(UNCSectionInfoSettings *)self authorizationStatus];
  if (v2 > 4) {
    return @"<invalid>";
  }
  else {
    return off_265567BF8[v2];
  }
}

- (id)_alertTypeDescription
{
  unint64_t v2 = [(UNCSectionInfoSettings *)self alertType];
  if (v2 > 2) {
    return @"<invalid>";
  }
  else {
    return off_265567C20[v2];
  }
}

- (id)_contentPreviewSettingDescription
{
  unint64_t v2 = [(UNCSectionInfoSettings *)self contentPreviewSetting];
  if (v2 > 3) {
    return @"<invalid>";
  }
  else {
    return off_265567C38[v2];
  }
}

- (id)_bulletinGroupingSettingDescription
{
  unint64_t v2 = [(UNCSectionInfoSettings *)self bulletinGroupingSetting];
  if (v2 > 2) {
    return @"<invalid>";
  }
  else {
    return off_265567C58[v2];
  }
}

- (id)_announceSettingDescription
{
  unint64_t v2 = [(UNCSectionInfoSettings *)self announceSetting];
  if (v2 > 3) {
    return 0;
  }
  else {
    return off_265567C70[v2];
  }
}

- (unint64_t)hash
{
  int64_t v3 = [(UNCSectionInfoSettings *)self authorizationStatus];
  id v4 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  uint64_t v5 = [v4 hash] ^ v3;
  char v6 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  uint64_t v7 = [v6 hash];
  uint64_t v8 = [(UNCSectionInfoSettings *)self muteAssertion];
  uint64_t v9 = v5 ^ v7 ^ [v8 hash];
  int64_t v10 = [(UNCSectionInfoSettings *)self notificationCenterSetting];
  int64_t v11 = v10 ^ [(UNCSectionInfoSettings *)self lockScreenSetting];
  uint64_t v12 = v9 ^ v11 ^ [(UNCSectionInfoSettings *)self showsOnExternalDevices];
  uint64_t v13 = [(UNCSectionInfoSettings *)self showsCustomSettingsLink];
  int64_t v14 = v13 ^ [(UNCSectionInfoSettings *)self contentPreviewSetting];
  unint64_t v15 = v12 ^ v14 ^ [(UNCSectionInfoSettings *)self alertType];
  unint64_t v16 = [(UNCSectionInfoSettings *)self pushSettings];
  int64_t v17 = v16 ^ [(UNCSectionInfoSettings *)self carPlaySetting];
  int64_t v18 = v17 ^ [(UNCSectionInfoSettings *)self remoteNotificationsSetting];
  int64_t v19 = v18 ^ [(UNCSectionInfoSettings *)self criticalAlertSetting];
  int64_t v20 = v19 ^ [(UNCSectionInfoSettings *)self timeSensitiveSetting];
  unint64_t v21 = v15 ^ v20 ^ [(UNCSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting];
  int64_t v22 = [(UNCSectionInfoSettings *)self bulletinGroupingSetting];
  int64_t v23 = v22 ^ [(UNCSectionInfoSettings *)self announceSetting];
  int64_t v24 = v23 ^ [(UNCSectionInfoSettings *)self scheduledDeliverySetting];
  int64_t v25 = v24 ^ [(UNCSectionInfoSettings *)self directMessagesSetting];
  unint64_t v26 = v21 ^ v25 ^ [(UNCSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting];

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UNCSectionInfoSettings *)a3;
  if (self == v4)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v5 = v4;
      int64_t v6 = [(UNCSectionInfoSettings *)self authorizationStatus];
      if (v6 == [(UNCSectionInfoSettings *)v5 authorizationStatus])
      {
        uint64_t v7 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
        uint64_t v8 = [(UNCSectionInfoSettings *)v5 authorizationExpirationDate];
        if (v7 == v8)
        {
          int64_t v10 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
          int64_t v11 = [(UNCSectionInfoSettings *)v5 lastUserGrantedAuthorizationDate];
          if (v10 == v11)
          {
            uint64_t v12 = [(UNCSectionInfoSettings *)self muteAssertion];
            uint64_t v13 = [(UNCSectionInfoSettings *)v5 muteAssertion];
            if (!BSEqualObjects()) {
              goto LABEL_30;
            }
            int64_t v14 = [(UNCSectionInfoSettings *)self notificationCenterSetting];
            if (v14 != [(UNCSectionInfoSettings *)v5 notificationCenterSetting]) {
              goto LABEL_30;
            }
            int64_t v15 = [(UNCSectionInfoSettings *)self lockScreenSetting];
            if (v15 != [(UNCSectionInfoSettings *)v5 lockScreenSetting]) {
              goto LABEL_30;
            }
            BOOL v16 = [(UNCSectionInfoSettings *)self showsOnExternalDevices];
            if (v16 != [(UNCSectionInfoSettings *)v5 showsOnExternalDevices]) {
              goto LABEL_30;
            }
            BOOL v17 = [(UNCSectionInfoSettings *)self showsCustomSettingsLink];
            if (v17 != [(UNCSectionInfoSettings *)v5 showsCustomSettingsLink]) {
              goto LABEL_30;
            }
            int64_t v18 = [(UNCSectionInfoSettings *)self contentPreviewSetting];
            if (v18 != [(UNCSectionInfoSettings *)v5 contentPreviewSetting]) {
              goto LABEL_30;
            }
            unint64_t v19 = [(UNCSectionInfoSettings *)self alertType];
            if (v19 != [(UNCSectionInfoSettings *)v5 alertType]) {
              goto LABEL_30;
            }
            unint64_t v20 = [(UNCSectionInfoSettings *)self pushSettings];
            if (v20 != [(UNCSectionInfoSettings *)v5 pushSettings]) {
              goto LABEL_30;
            }
            int64_t v21 = [(UNCSectionInfoSettings *)self carPlaySetting];
            if (v21 != [(UNCSectionInfoSettings *)v5 carPlaySetting]) {
              goto LABEL_30;
            }
            int64_t v22 = [(UNCSectionInfoSettings *)self remoteNotificationsSetting];
            if (v22 != [(UNCSectionInfoSettings *)v5 remoteNotificationsSetting]) {
              goto LABEL_30;
            }
            int64_t v23 = [(UNCSectionInfoSettings *)self criticalAlertSetting];
            if (v23 == [(UNCSectionInfoSettings *)v5 criticalAlertSetting]
              && (int64_t v24 = [(UNCSectionInfoSettings *)self timeSensitiveSetting],
                  v24 == [(UNCSectionInfoSettings *)v5 timeSensitiveSetting])
              && (v25 = [(UNCSectionInfoSettings *)self hasUserConfiguredTimeSensitiveSetting], v25 == [(UNCSectionInfoSettings *)v5 hasUserConfiguredTimeSensitiveSetting])&& (v26 = [(UNCSectionInfoSettings *)self bulletinGroupingSetting], v26 == [(UNCSectionInfoSettings *)v5 bulletinGroupingSetting])&& (int64_t v27 = [(UNCSectionInfoSettings *)self announceSetting], v27 == [(UNCSectionInfoSettings *)v5 announceSetting])&& (v28 = [(UNCSectionInfoSettings *)self scheduledDeliverySetting], v28 == [(UNCSectionInfoSettings *)v5 scheduledDeliverySetting])&& (v29 = [(UNCSectionInfoSettings *)self directMessagesSetting], v29 == [(UNCSectionInfoSettings *)v5 directMessagesSetting]))
            {
              BOOL v30 = [(UNCSectionInfoSettings *)self hasUserConfiguredDirectMessagesSetting];
              BOOL v9 = v30 ^ [(UNCSectionInfoSettings *)v5 hasUserConfiguredDirectMessagesSetting] ^ 1;
            }
            else
            {
LABEL_30:
              LOBYTE(v9) = 0;
            }
          }
          else
          {
            LOBYTE(v9) = 0;
          }
        }
        else
        {
          LOBYTE(v9) = 0;
        }
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setAuthorizationStatus:", -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus"));
  int64_t v6 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  [v5 setAuthorizationExpirationDate:v6];

  uint64_t v7 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  [v5 setLastUserGrantedAuthorizationDate:v7];

  uint64_t v8 = [(UNCSectionInfoSettings *)self muteAssertion];
  BOOL v9 = (void *)[v8 copyWithZone:a3];
  [v5 setMuteAssertion:v9];

  objc_msgSend(v5, "setNotificationCenterSetting:", -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"));
  objc_msgSend(v5, "setLockScreenSetting:", -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"));
  objc_msgSend(v5, "setShowsOnExternalDevices:", -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"));
  objc_msgSend(v5, "setShowsCustomSettingsLink:", -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"));
  objc_msgSend(v5, "setContentPreviewSetting:", -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"));
  objc_msgSend(v5, "setAlertType:", -[UNCSectionInfoSettings alertType](self, "alertType"));
  objc_msgSend(v5, "setPushSettings:", -[UNCSectionInfoSettings pushSettings](self, "pushSettings"));
  objc_msgSend(v5, "setCarPlaySetting:", -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"));
  objc_msgSend(v5, "setRemoteNotificationsSetting:", -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"));
  objc_msgSend(v5, "setCriticalAlertSetting:", -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"));
  objc_msgSend(v5, "setTimeSensitiveSetting:", -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"));
  objc_msgSend(v5, "setUserConfiguredTimeSensitiveSetting:", -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"));
  objc_msgSend(v5, "setBulletinGroupingSetting:", -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"));
  objc_msgSend(v5, "setAnnounceSetting:", -[UNCSectionInfoSettings announceSetting](self, "announceSetting"));
  objc_msgSend(v5, "setScheduledDeliverySetting:", -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"));
  objc_msgSend(v5, "setDirectMessagesSetting:", -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"));
  objc_msgSend(v5, "setUserConfiguredDirectMessagesSetting:", -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"));
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UNCSectionInfoSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UNCSectionInfoSettings;
  uint64_t v5 = [(UNCSectionInfoSettings *)&v19 init];
  if (v5)
  {
    -[UNCSectionInfoSettings setAuthorizationStatus:](v5, "setAuthorizationStatus:", [v4 decodeIntegerForKey:@"authorizationStatus"]);
    int64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"authorizationExpirationDate"];
    [(UNCSectionInfoSettings *)v5 setAuthorizationExpirationDate:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUserGrantedAuthorizationDate"];
    [(UNCSectionInfoSettings *)v5 setLastUserGrantedAuthorizationDate:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"muteAssertion"];
    [(UNCSectionInfoSettings *)v5 setMuteAssertion:v8];

    -[UNCSectionInfoSettings setNotificationCenterSetting:](v5, "setNotificationCenterSetting:", [v4 decodeIntegerForKey:@"notificationCenterSetting"]);
    -[UNCSectionInfoSettings setLockScreenSetting:](v5, "setLockScreenSetting:", [v4 decodeIntegerForKey:@"lockScreenSetting"]);
    -[UNCSectionInfoSettings setShowsOnExternalDevices:](v5, "setShowsOnExternalDevices:", [v4 decodeBoolForKey:@"showsOnExternalDevices"]);
    -[UNCSectionInfoSettings setShowsCustomSettingsLink:](v5, "setShowsCustomSettingsLink:", [v4 decodeBoolForKey:@"showsCustomSettingsLink"]);
    -[UNCSectionInfoSettings setContentPreviewSetting:](v5, "setContentPreviewSetting:", [v4 decodeIntegerForKey:@"contentPreviewSetting"]);
    -[UNCSectionInfoSettings setAlertType:](v5, "setAlertType:", [v4 decodeIntegerForKey:@"alertType"]);
    -[UNCSectionInfoSettings setPushSettings:](v5, "setPushSettings:", (int)[v4 decodeInt32ForKey:@"pushSettings"]);
    -[UNCSectionInfoSettings setCarPlaySetting:](v5, "setCarPlaySetting:", [v4 decodeIntegerForKey:@"carPlaySetting"]);
    -[UNCSectionInfoSettings setRemoteNotificationsSetting:](v5, "setRemoteNotificationsSetting:", [v4 decodeIntegerForKey:@"remoteNotificationsSetting"]);
    -[UNCSectionInfoSettings setCriticalAlertSetting:](v5, "setCriticalAlertSetting:", [v4 decodeIntegerForKey:@"criticalAlertSetting"]);
    -[UNCSectionInfoSettings setTimeSensitiveSetting:](v5, "setTimeSensitiveSetting:", [v4 decodeIntegerForKey:@"timeSensitiveSetting"]);
    -[UNCSectionInfoSettings setUserConfiguredTimeSensitiveSetting:](v5, "setUserConfiguredTimeSensitiveSetting:", [v4 decodeBoolForKey:@"userConfiguredTimeSensitiveSetting"]);
    -[UNCSectionInfoSettings setBulletinGroupingSetting:](v5, "setBulletinGroupingSetting:", [v4 decodeIntegerForKey:@"bulletinGroupingSetting"]);
    if ([v4 containsValueForKey:@"announceSetting"]) {
      unint64_t v9 = [v4 decodeIntegerForKey:@"announceSetting"];
    }
    else {
      unint64_t v9 = 1;
    }
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v9;
    }
    [(UNCSectionInfoSettings *)v5 setAnnounceSetting:v10];
    if ([v4 containsValueForKey:@"scheduledDeliverySetting"]) {
      unint64_t v11 = [v4 decodeIntegerForKey:@"scheduledDeliverySetting"];
    }
    else {
      unint64_t v11 = 1;
    }
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    [(UNCSectionInfoSettings *)v5 setScheduledDeliverySetting:v12];
    if ([v4 containsValueForKey:@"directMessagesSettingKey"]) {
      uint64_t v13 = [v4 decodeIntegerForKey:@"directMessagesSettingKey"];
    }
    else {
      uint64_t v13 = 0;
    }
    [(UNCSectionInfoSettings *)v5 setDirectMessagesSetting:v13];
    -[UNCSectionInfoSettings setUserConfiguredDirectMessagesSetting:](v5, "setUserConfiguredDirectMessagesSetting:", [v4 decodeBoolForKey:@"userConfiguredDirectMessagesSetting"]);
    if ([v4 containsValueForKey:@"allowsNotifications"]) {
      -[UNCSectionInfoSettings setAllowsNotifications:](v5, "setAllowsNotifications:", [v4 decodeBoolForKey:@"allowsNotifications"]);
    }
    if ([v4 containsValueForKey:@"showsMessagePreview"]) {
      -[UNCSectionInfoSettings setShowsMessagePreview:](v5, "setShowsMessagePreview:", [v4 decodeBoolForKey:@"showsMessagePreview"]);
    }
    if (([v4 containsValueForKey:@"notificationCenterSetting"] & 1) == 0
      && [v4 containsValueForKey:@"showsInNotificationCenter"])
    {
      -[UNCSectionInfoSettings setShowsInNotificationCenter:](v5, "setShowsInNotificationCenter:", [v4 decodeBoolForKey:@"showsInNotificationCenter"]);
    }
    if (([v4 containsValueForKey:@"lockScreenSetting"] & 1) == 0
      && [v4 containsValueForKey:@"showsInLockScreen"])
    {
      -[UNCSectionInfoSettings setShowsInLockScreen:](v5, "setShowsInLockScreen:", [v4 decodeBoolForKey:@"showsInLockScreen"]);
    }
    if (([v4 containsValueForKey:@"announceSetting"] & 1) == 0
      && [v4 containsValueForKey:@"spokenNotificationSetting"])
    {
      uint64_t v14 = [v4 decodeIntegerForKey:@"spokenNotificationSetting"];
      if (v14)
      {
        if (v14 != 2)
        {
          uint64_t v15 = v14 == 1;
LABEL_37:
          [(UNCSectionInfoSettings *)v5 setAnnounceSetting:v15];
          goto LABEL_38;
        }
        BOOL v16 = [(UNCSectionInfoSettings *)v5 timeSensitiveSetting] == 0;
        uint64_t v17 = 2;
      }
      else
      {
        BOOL v16 = [(UNCSectionInfoSettings *)v5 timeSensitiveSetting] == 2;
        uint64_t v17 = 1;
      }
      if (v16) {
        uint64_t v15 = v17 + 1;
      }
      else {
        uint64_t v15 = v17;
      }
      goto LABEL_37;
    }
  }
LABEL_38:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings authorizationStatus](self, "authorizationStatus"), @"authorizationStatus");
  id v4 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  [v7 encodeObject:v4 forKey:@"authorizationExpirationDate"];

  uint64_t v5 = [(UNCSectionInfoSettings *)self lastUserGrantedAuthorizationDate];
  [v7 encodeObject:v5 forKey:@"lastUserGrantedAuthorizationDate"];

  int64_t v6 = [(UNCSectionInfoSettings *)self muteAssertion];
  [v7 encodeObject:v6 forKey:@"muteAssertion"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings notificationCenterSetting](self, "notificationCenterSetting"), @"notificationCenterSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings lockScreenSetting](self, "lockScreenSetting"), @"lockScreenSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsOnExternalDevices](self, "showsOnExternalDevices"), @"showsOnExternalDevices");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsCustomSettingsLink](self, "showsCustomSettingsLink"), @"showsCustomSettingsLink");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings contentPreviewSetting](self, "contentPreviewSetting"), @"contentPreviewSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings alertType](self, "alertType"), @"alertType");
  objc_msgSend(v7, "encodeInt32:forKey:", -[UNCSectionInfoSettings pushSettings](self, "pushSettings"), @"pushSettings");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings carPlaySetting](self, "carPlaySetting"), @"carPlaySetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings remoteNotificationsSetting](self, "remoteNotificationsSetting"), @"remoteNotificationsSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings criticalAlertSetting](self, "criticalAlertSetting"), @"criticalAlertSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings timeSensitiveSetting](self, "timeSensitiveSetting"), @"timeSensitiveSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings hasUserConfiguredTimeSensitiveSetting](self, "hasUserConfiguredTimeSensitiveSetting"), @"userConfiguredTimeSensitiveSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings bulletinGroupingSetting](self, "bulletinGroupingSetting"), @"bulletinGroupingSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings announceSetting](self, "announceSetting"), @"announceSetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings scheduledDeliverySetting](self, "scheduledDeliverySetting"), @"scheduledDeliverySetting");
  objc_msgSend(v7, "encodeInteger:forKey:", -[UNCSectionInfoSettings directMessagesSetting](self, "directMessagesSetting"), @"directMessagesSettingKey");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings hasUserConfiguredDirectMessagesSetting](self, "hasUserConfiguredDirectMessagesSetting"), @"userConfiguredDirectMessagesSetting");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsInLockScreen](self, "showsInLockScreen"), @"showsInLockScreen");
  objc_msgSend(v7, "encodeBool:forKey:", -[UNCSectionInfoSettings showsInNotificationCenter](self, "showsInNotificationCenter"), @"showsInNotificationCenter");
}

- (BOOL)isAuthorizedTemporarily
{
  int64_t v3 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
  if (v3)
  {
    id v4 = [(UNCSectionInfoSettings *)self authorizationExpirationDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)allowsNotifications
{
  if ([(UNCSectionInfoSettings *)self authorizationStatus] == 2
    || [(UNCSectionInfoSettings *)self authorizationStatus] == 3)
  {
    return 1;
  }

  return [(UNCSectionInfoSettings *)self isAuthorizedTemporarily];
}

- (void)setAllowsNotifications:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UNCSectionInfoSettings *)self setAuthorizationStatus:v3];
}

- (int64_t)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int64_t)a3
{
  self->_authorizationStatus = a3;
}

- (NSDate)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (void)setAuthorizationExpirationDate:(id)a3
{
}

- (NSDate)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (void)setLastUserGrantedAuthorizationDate:(id)a3
{
}

- (UNCMuteAssertion)muteAssertion
{
  return self->_muteAssertion;
}

- (void)setMuteAssertion:(id)a3
{
}

- (int64_t)notificationCenterSetting
{
  return self->_notificationCenterSetting;
}

- (void)setNotificationCenterSetting:(int64_t)a3
{
  self->_notificationCenterSetting = a3;
}

- (int64_t)lockScreenSetting
{
  return self->_lockScreenSetting;
}

- (void)setLockScreenSetting:(int64_t)a3
{
  self->_lockScreenSetting = a3;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  self->_showsOnExternalDevices = a3;
}

- (BOOL)showsCustomSettingsLink
{
  return self->_showsCustomSettingsLink;
}

- (void)setShowsCustomSettingsLink:(BOOL)a3
{
  self->_showsCustomSettingsLink = a3;
}

- (int64_t)contentPreviewSetting
{
  return self->_contentPreviewSetting;
}

- (void)setContentPreviewSetting:(int64_t)a3
{
  self->_contentPreviewSetting = a3;
}

- (unint64_t)alertType
{
  return self->_alertType;
}

- (void)setAlertType:(unint64_t)a3
{
  self->_alertType = a3;
}

- (unint64_t)pushSettings
{
  return self->_pushSettings;
}

- (void)setPushSettings:(unint64_t)a3
{
  self->_pushSettings = a3;
}

- (int64_t)carPlaySetting
{
  return self->_carPlaySetting;
}

- (void)setCarPlaySetting:(int64_t)a3
{
  self->_carPlaySetting = a3;
}

- (int64_t)remoteNotificationsSetting
{
  return self->_remoteNotificationsSetting;
}

- (void)setRemoteNotificationsSetting:(int64_t)a3
{
  self->_remoteNotificationsSetting = a3;
}

- (int64_t)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (void)setCriticalAlertSetting:(int64_t)a3
{
  self->_criticalAlertSetting = a3;
}

- (int64_t)timeSensitiveSetting
{
  return self->_timeSensitiveSetting;
}

- (void)setTimeSensitiveSetting:(int64_t)a3
{
  self->_timeSensitiveSetting = a3;
}

- (BOOL)hasUserConfiguredTimeSensitiveSetting
{
  return self->_userConfiguredTimeSensitiveSetting;
}

- (void)setUserConfiguredTimeSensitiveSetting:(BOOL)a3
{
  self->_userConfiguredTimeSensitiveSetting = a3;
}

- (int64_t)scheduledDeliverySetting
{
  return self->_scheduledDeliverySetting;
}

- (void)setScheduledDeliverySetting:(int64_t)a3
{
  self->_scheduledDeliverySetting = a3;
}

- (int64_t)directMessagesSetting
{
  return self->_directMessagesSetting;
}

- (void)setDirectMessagesSetting:(int64_t)a3
{
  self->_directMessagesSetting = a3;
}

- (BOOL)hasUserConfiguredDirectMessagesSetting
{
  return self->_userConfiguredDirectMessagesSetting;
}

- (void)setUserConfiguredDirectMessagesSetting:(BOOL)a3
{
  self->_userConfiguredDirectMessagesSetting = a3;
}

- (int64_t)bulletinGroupingSetting
{
  return self->_bulletinGroupingSetting;
}

- (void)setBulletinGroupingSetting:(int64_t)a3
{
  self->_bulletinGroupingSetting = a3;
}

- (int64_t)announceSetting
{
  return self->_announceSetting;
}

- (void)setAnnounceSetting:(int64_t)a3
{
  self->_announceSetting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_muteAssertion, 0);
  objc_storeStrong((id *)&self->_lastUserGrantedAuthorizationDate, 0);

  objc_storeStrong((id *)&self->_authorizationExpirationDate, 0);
}

- (BOOL)showsMessagePreview
{
  return [(UNCSectionInfoSettings *)self contentPreviewSetting] != 3;
}

- (BOOL)showsInNotificationCenter
{
  return [(UNCSectionInfoSettings *)self notificationCenterSetting] == 2;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UNCSectionInfoSettings *)self setNotificationCenterSetting:v3];
}

- (BOOL)showsInLockScreen
{
  return [(UNCSectionInfoSettings *)self lockScreenSetting] == 2;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(UNCSectionInfoSettings *)self setLockScreenSetting:v3];
}

- (int64_t)spokenNotificationSetting
{
  int64_t v2 = [(UNCSectionInfoSettings *)self announceSetting];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return qword_260A8CEE8[v2 - 1];
  }
}

- (void)setSpokenNotificationSetting:(int64_t)a3
{
  if (a3 == 2)
  {
    if ([(UNCSectionInfoSettings *)self timeSensitiveSetting] == 2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 3;
    }
  }
  else
  {
    uint64_t v4 = a3 == 1;
  }

  [(UNCSectionInfoSettings *)self setAnnounceSetting:v4];
}

- (void)muteThreadIdentifier:(os_log_t)log untilDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "UNCSectionInfoSettings: Must provide valid thread identifier in order to mute a thread", v1, 2u);
}

- (void)muteThreadIdentifier:(uint64_t)a1 untilDate:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "UNCSectionInfoSettings: Cannot mute thread because section is already muted. Thread ID:%@", (uint8_t *)&v2, 0xCu);
}

- (void)unmuteThreadIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2608DB000, log, OS_LOG_TYPE_ERROR, "UNCSectionInfoSettings: Must provide valid thread identifier in order to unmute a thread", v1, 2u);
}

- (void)unmuteThreadIdentifier:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2608DB000, a2, OS_LOG_TYPE_ERROR, "UNCSectionInfoSettings: Cannot unmute thread because section is already muted. Thread ID:%@", (uint8_t *)&v2, 0xCu);
}

@end