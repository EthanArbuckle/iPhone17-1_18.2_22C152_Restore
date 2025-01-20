@interface FMFDUserNotification
+ (BOOL)displayiCloudUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4 switchString:(id)a5 doNotSwitch:(id)a6;
+ (BOOL)shouldDisplayAlerts;
+ (void)displayUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4;
+ (void)notLoggedIntoiCloudAlert;
+ (void)show5XXDuringStartOfferAlert;
+ (void)show5XXDuringStopOfferAlert;
+ (void)showActiveDeviceChangedAlert;
+ (void)showForbiddenRegionAlert;
+ (void)showGenericErrorAlert;
+ (void)showLocationServicesSwitchOffAlert;
+ (void)showMaxFollowersLimitReachedAlert;
+ (void)showNetworkOfflineDuringOfferAlert;
+ (void)showNetworkOfflineDuringStopOfferAlert;
+ (void)showRestrictedAlert;
+ (void)showShareMyLocationSystemServiceOffAlert;
+ (void)showShareMyLocationiCloudSettingsOffAlert;
+ (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4;
+ (void)upselliCloudAlert;
@end

@implementation FMFDUserNotification

+ (BOOL)shouldDisplayAlerts
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisplayDebugAlerts"];

  return v3;
}

+ (void)displayUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:v6 value:&stru_1000A3938 table:0];

  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:v5 value:&stru_1000A3938 table:0];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1000A3938 table:0];

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v9);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v11);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v13);
  SInt32 error = -1;
  CFUserNotificationRef v14 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  CFRelease(v14);
}

+ (void)showActiveDeviceChangedAlert
{
  if ([a1 shouldDisplayAlerts])
  {
    _[a1 displayUserNotificationWithTitleLocKey:@"THIS_DEVICE_ACTIVE_ALERT_TITLE" messageLocKey:@"THIS_DEVICE_ACTIVE_ALERT_TEXT"];
  }
}

+ (void)showRestrictedAlert
{
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FMFDUserNotification: showRestrictedAlert", (uint8_t *)v8, 2u);
  }

  if ([a1 shouldDisplayAlerts])
  {
    unsigned int v4 = [a1 displayiCloudUserNotificationWithTitleLocKey:@"RESTRICTED_ALERT_TITLE" messageLocKey:@"RESTRICTED_ALERT_TEXT" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"];
    id v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Showing restrictions alert, user selected: %d", (uint8_t *)v8, 8u);
    }

    if ((v4 & 1) == 0)
    {
      id v6 = +[NSURL URLWithString:@"prefs:root=General&path=RESTRICTIONS"];
      v7 = +[LSApplicationWorkspace defaultWorkspace];
      [v7 openSensitiveURL:v6 withOptions:0];
    }
  }
}

+ (void)showMaxFollowersLimitReachedAlert
{
}

+ (void)showLocationServicesSwitchOffAlert
{
  unsigned int v2 = [a1 displayiCloudUserNotificationWithTitleLocKey:@"GLOBAL_LOCATION_SERVICES_SWITCH_OFF_TITLE" messageLocKey:@"GLOBAL_LOCATION_SERVICES_SWITCH_OFF_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"];
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing global location services off alert, user selected: %d", (uint8_t *)v6, 8u);
  }

  if ((v2 & 1) == 0)
  {
    unsigned int v4 = +[NSURL URLWithString:@"prefs:root=Privacy&path=LOCATION"];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

+ (void)showShareMyLocationSystemServiceOffAlert
{
  unsigned int v2 = [a1 displayiCloudUserNotificationWithTitleLocKey:@"LOCATION_SHARING_SYSTEM_SERVICE_SWITCH_OFF_TITLE" messageLocKey:@"LOCATION_SHARING_SYSTEM_SERVICE_SWITCH_OFF_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"];
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing location sharing system service switch off alert, user selected: %d", (uint8_t *)v6, 8u);
  }

  if ((v2 & 1) == 0)
  {
    unsigned int v4 = +[NSURL URLWithString:@"prefs:root=Privacy&path=LOCATION/SYSTEM_SERVICES"];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

+ (void)showShareMyLocationiCloudSettingsOffAlert
{
  unsigned int v2 = [a1 displayiCloudUserNotificationWithTitleLocKey:@"SHARE_MY_LOCATION_ICLOUD_SETTINGS_OFF_TITLE" messageLocKey:@"SHARE_MY_LOCATION_ICLOUD_SETTINGS_OFF_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"];
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Showing share my location icloud settings off alert, user selected: %d", (uint8_t *)v6, 8u);
  }

  if ((v2 & 1) == 0)
  {
    unsigned int v4 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=LOCATION_SHARING"];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

+ (void)showForbiddenRegionAlert
{
  if ([a1 shouldDisplayAlerts])
  {
    _[a1 displayUserNotificationWithTitleLocKey:@"FORBIDDEN_REGION_ALERT_TITLE" messageLocKey:@"FORBIDDEN_REGION_ALERT_MESSAGE"];
  }
}

+ (void)show5XXDuringStartOfferAlert
{
}

+ (void)show5XXDuringStopOfferAlert
{
}

+ (void)showGenericErrorAlert
{
}

+ (void)showSwitchMeDeviceAlertUsingCurrentMeDeviceName:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100005560();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMFDUserNotification: showSwitchMeDeviceAlertUsingCurrentMeDeviceName", buf, 2u);
  }

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v9 = [v5 length];
  v10 = +[NSBundle bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SWITCH_ME_DEVICE_ALERT_NO_ME_DEVICE_TITLE" value:&stru_1000A3938 table:0];

  v12 = +[NSBundle bundleForClass:objc_opt_class()];
  if (v9)
  {
    v13 = [v12 localizedStringForKey:@"SWITCH_ME_DEVICE_ALERT_MESSAGE" value:&stru_1000A3938 table:0];
    CFUserNotificationRef v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v5);
  }
  else
  {
    CFUserNotificationRef v14 = [v12 localizedStringForKey:@"SWITCH_ME_DEVICE_ALERT_NO_ME_DEVICE_MESSAGE" value:&stru_1000A3938 table:0];
  }

  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"USE_BUTTON" value:&stru_1000A3938 table:0];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"NOT_NOW_BUTTON" value:&stru_1000A3938 table:0];

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v11);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v14);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v16);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v18);
  SInt32 error = -1;
  CFUserNotificationRef v19 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  CFOptionFlags responseFlags = 0;
  if (error)
  {
    CFRelease(v19);
    v20 = v5;
    if (v6) {
      v6[2](v6, 3);
    }
  }
  else
  {
    CFUserNotificationReceiveResponse(v19, 0.0, &responseFlags);
    CFRelease(v19);
    v6[2](v6, responseFlags);
    v20 = v5;
  }
}

+ (BOOL)displayiCloudUserNotificationWithTitleLocKey:(id)a3 messageLocKey:(id)a4 switchString:(id)a5 doNotSwitch:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFUserNotificationRef v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:v12 value:&stru_1000A3938 table:0];

  v16 = +[NSBundle bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:v11 value:&stru_1000A3938 table:0];

  v18 = +[NSBundle bundleForClass:objc_opt_class()];
  CFUserNotificationRef v19 = [v18 localizedStringForKey:v10 value:&stru_1000A3938 table:0];

  v20 = +[NSBundle bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:v9 value:&stru_1000A3938 table:0];

  v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"OK_BUTTON_TITLE" value:&stru_1000A3938 table:0];

  CFDictionarySetValue(Mutable, kCFUserNotificationAlertHeaderKey, v15);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlertMessageKey, v17);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v23);
  CFDictionarySetValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v19);
  CFDictionarySetValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v21);
  SInt32 error = -1;
  v24 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, Mutable);
  CFRelease(Mutable);
  CFOptionFlags responseFlags = 0;
  if (error)
  {
    BOOL v25 = 0;
  }
  else
  {
    CFUserNotificationReceiveResponse(v24, 0.0, &responseFlags);
    BOOL v25 = responseFlags == 0;
  }
  CFRelease(v24);

  return v25;
}

+ (void)notLoggedIntoiCloudAlert
{
  unsigned int v2 = [a1 displayiCloudUserNotificationWithTitleLocKey:@"NOT_LOGGED_INTO_ICLOUD_ALERT_TITLE" messageLocKey:@"NOT_LOGGED_INTO_ICLOUD_ALERT_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"NOT_NOW_BUTTON"];
  unsigned __int8 v3 = sub_100005560();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No iCloud Account do not go to settings: %d", (uint8_t *)v6, 8u);
  }

  if ((v2 & 1) == 0)
  {
    unsigned int v4 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
    id v5 = +[LSApplicationWorkspace defaultWorkspace];
    [v5 openSensitiveURL:v4 withOptions:0];
  }
}

+ (void)upselliCloudAlert
{
  if (([a1 displayiCloudUserNotificationWithTitleLocKey:@"UPSELL_ICLOUD_ALERT_TITLE" messageLocKey:@"UPSELL_ICLOUD_ALERT_MESSAGE" switchString:@"SIGN_IN" doNotSwitch:@"NOT_NOW_BUTTON"] & 1) == 0)
  {
    +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE"];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v2 = +[LSApplicationWorkspace defaultWorkspace];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
}

+ (void)showNetworkOfflineDuringOfferAlert
{
  if (([a1 displayiCloudUserNotificationWithTitleLocKey:@"NETWORK_OFFLINE_OFFER_TITLE" messageLocKey:@"NETWORK_OFFLINE_OFFER_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"] & 1) == 0)
  {
    +[NSURL URLWithString:@"prefs:root=ROOT"];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v2 = +[LSApplicationWorkspace defaultWorkspace];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
}

+ (void)showNetworkOfflineDuringStopOfferAlert
{
  if (([a1 displayiCloudUserNotificationWithTitleLocKey:@"NETWORK_OFFLINE_STOP_TITLE" messageLocKey:@"NETWORK_OFFLINE_STOP_MESSAGE" switchString:@"SETTINGS_BUTTON" doNotSwitch:@"OK_BUTTON_TITLE"] & 1) == 0)
  {
    +[NSURL URLWithString:@"prefs:root=ROOT"];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v2 = +[LSApplicationWorkspace defaultWorkspace];
    [v2 openSensitiveURL:v3 withOptions:0];
  }
}

@end