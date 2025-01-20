@interface UNCNotificationSourceSettingsDescription(Factory)
+ (id)notificationSourceSettingsDescriptionFromDictionary:()Factory;
@end

@implementation UNCNotificationSourceSettingsDescription(Factory)

+ (id)notificationSourceSettingsDescriptionFromDictionary:()Factory
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingAlerts", objc_opt_class());
    unsigned int v30 = objc_msgSend(v4, "un_safeBoolValue");

    v5 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingSounds", objc_opt_class());
    unsigned int v29 = objc_msgSend(v5, "un_safeBoolValue");

    v6 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingBadges", objc_opt_class());
    unsigned int v28 = objc_msgSend(v6, "un_safeBoolValue");

    v7 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingLockScreen", objc_opt_class());
    unsigned int v27 = objc_msgSend(v7, "un_safeBoolValue");

    v8 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingNotificationCenter", objc_opt_class());
    uint64_t v9 = objc_msgSend(v8, "un_safeBoolValue");

    v10 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingCarPlay", objc_opt_class());
    uint64_t v11 = objc_msgSend(v10, "un_safeBoolValue");

    v12 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingAnnouncement", objc_opt_class());
    if (objc_msgSend(v12, "un_safeBoolValue"))
    {
      uint64_t v13 = 1;
    }
    else
    {
      v15 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingSpoken", objc_opt_class());
      uint64_t v13 = objc_msgSend(v15, "un_safeBoolValue");
    }
    v16 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingAlwaysShowPreviews", objc_opt_class());
    uint64_t v17 = objc_msgSend(v16, "un_safeBoolValue");

    v18 = objc_msgSend(v3, "bs_safeObjectForKey:ofType:", @"UNSettingModalAlertStyle", objc_opt_class());
    uint64_t v19 = objc_msgSend(v18, "un_safeBoolValue");

    v20 = [v3 objectForKey:@"UNSettingProvidesAppNotificationSettings"];
    uint64_t v21 = objc_msgSend(v20, "un_safeBoolValue");

    v22 = [v3 objectForKey:@"UNSettingTimeSensitive"];
    uint64_t v23 = objc_msgSend(v22, "un_safeBoolValue");

    v24 = [v3 objectForKey:@"UNSettingCriticalAlerts"];
    uint64_t v25 = objc_msgSend(v24, "un_safeBoolValue");

    id v14 = objc_alloc(MEMORY[0x263F84280]);
    [v14 setSupportsAlerts:v30];
    [v14 setSupportsSounds:v29];
    [v14 setSupportsBadges:v28];
    [v14 setSupportsLockScreen:v27];
    [v14 setSupportsNotificationCenter:v9];
    [v14 setSupportsCarPlay:v11];
    [v14 setSupportsSpoken:v13];
    [v14 setAlwaysShowPreviews:v17];
    [v14 setModalAlertStyle:v19];
    [v14 setProvidesAppNotificationSettings:v21];
    [v14 setSupportsTimeSensitive:v23];
    [v14 setSupportsCriticalAlerts:v25];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end