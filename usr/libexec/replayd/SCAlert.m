@interface SCAlert
+ (BOOL)showAlertWithTitle:(id)a3 bodyText:(id)a4 defaultButtonText:(id)a5 secondaryButtonText:(id)a6 url:(id)a7 requireReponse:(BOOL)a8 imageURL:(id)a9;
+ (BOOL)showLegacyAPIAlertWithBundleID:(id)a3;
+ (BOOL)showPresenterOverlayPrivacyAlertWithBundleID:(id)a3;
+ (id)privacyHintUserInfoForBundleID:(id)a3 identifier:(id)a4 count:(int64_t)a5 days:(int64_t)a6;
+ (void)userAcknowledgementAlertWithBundleID:(id)a3;
@end

@implementation SCAlert

+ (void)userAcknowledgementAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v16 = "+[SCAlert userAcknowledgementAlertWithBundleID:]";
    __int16 v17 = 1024;
    int v18 = 31;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SCREENCAPTUREKIT_USER_ALERT_TITLE"];
  v5 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SCREENCAPTUREKIT_USER_ALERT_BODY"];
  v8 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  v10 = +[NSBundle _rpFrameworkBundle];
  v11 = [v10 bundleURL];

  v12 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SCREENCAPTUREKIT_USER_ALERT_OPEN_SYSTEM_PREFERENCES"];
  v13 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"SCREENCAPTUREKIT_USER_ALERT_ALLOW"];
  id v14 = [objc_alloc((Class)NSURL) initFileURLWithPath:@"/System/Library/Frameworks/ReplayKit.framework/Resources/PrivacyScreenRecording.png"];
  +[SCAlert showAlertWithTitle:v6 bodyText:v9 defaultButtonText:v13 secondaryButtonText:v12 url:v11 requireReponse:1 imageURL:v14];
}

+ (BOOL)showPresenterOverlayPrivacyAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showPresenterOverlayPrivacyAlertWithBundleID:]";
    __int16 v16 = 1024;
    int v17 = 53;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (+[RPConnectionManager hasUnitTestEntitlement])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_TITLE"];
    v6 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

    v8 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"ACKNOWLEDGEMENT_PRESENTER_OVERLAY_ALERT_BODY"];
    v9 = +[NSBundle _rpFrameworkBundle];
    v10 = [v9 bundleURL];

    v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"ACKNOWLEDGEMENT_ALERT_DECLINE_BUTTON"];
    v12 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"BROADCAST_ACTIVITIES_PREFERRED_ACCEPT_BUTTON"];
    BOOL v4 = +[SCAlert showAlertWithTitle:v7 bodyText:v8 defaultButtonText:v11 secondaryButtonText:v12 url:v10 requireReponse:1 imageURL:0];
  }
  return v4;
}

+ (BOOL)showLegacyAPIAlertWithBundleID:(id)a3
{
  id v3 = a3;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v15 = "+[SCAlert showLegacyAPIAlertWithBundleID:]";
    __int16 v16 = 1024;
    int v17 = 74;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  BOOL v4 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"LEGACY_API_ALERT_TITLE"];
  v5 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];
  v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5);

  v7 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"LEGACY_API_ALERT_BODY"];
  v8 = +[NSBundle _rpLocalizedAppNameFromBundleID:v3];
  v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);

  v10 = +[NSBundle _rpFrameworkBundle];
  v11 = [v10 bundleURL];

  v12 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"LEGACY_API_ALERT_OK_BUTTON"];
  LOBYTE(v10) = +[SCAlert showAlertWithTitle:v6 bodyText:v9 defaultButtonText:v12 secondaryButtonText:0 url:v11 requireReponse:0 imageURL:0];

  return (char)v10;
}

+ (BOOL)showAlertWithTitle:(id)a3 bodyText:(id)a4 defaultButtonText:(id)a5 secondaryButtonText:(id)a6 url:(id)a7 requireReponse:(BOOL)a8 imageURL:(id)a9
{
  BOOL v9 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
    __int16 v30 = 1024;
    int v31 = 87;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertTopMostKey, kCFBooleanTrue);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertHeaderKey, v14);
  CFDictionaryAddValue(Mutable, kCFUserNotificationAlertMessageKey, v15);
  if (v17) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationAlternateButtonTitleKey, v17);
  }
  if (v16) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationDefaultButtonTitleKey, v16);
  }
  if (v18) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationLocalizationURLKey, v18);
  }
  if (v19) {
    CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, v19);
  }
  v21 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, Mutable);
  v22 = v21;
  if (v21 && v9)
  {
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v21, 0.0, &responseFlags);
    BOOL v23 = responseFlags == 1;
    if (responseFlags == 1)
    {
      if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
        __int16 v30 = 1024;
        int v31 = 121;
        v24 = " [INFO] %{public}s:%d user acknowledgement accepted";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v24, buf, 0x12u);
      }
    }
    else if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v29 = "+[SCAlert showAlertWithTitle:bodyText:defaultButtonText:secondaryButtonText:url:requireReponse:imageURL:]";
      __int16 v30 = 1024;
      int v31 = 124;
      v24 = " [INFO] %{public}s:%d user acknowledgement refused";
      goto LABEL_25;
    }
LABEL_26:
    CFRelease(v22);
    BOOL v25 = v23;
    if (!Mutable) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  BOOL v23 = 0;
  BOOL v25 = 0;
  if (v21) {
    goto LABEL_26;
  }
  if (Mutable) {
LABEL_20:
  }
    CFRelease(Mutable);
LABEL_21:

  return v25;
}

+ (id)privacyHintUserInfoForBundleID:(id)a3 identifier:(id)a4 count:(int64_t)a5 days:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  if (dword_100099BB8 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "+[SCAlert privacyHintUserInfoForBundleID:identifier:count:days:]";
    __int16 v25 = 1024;
    int v26 = 133;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v11 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"PRIVACY_INDICATOR_APPNAME_TITLE"];
  v12 = +[NSBundle _rpLocalizedAppNameFromBundleID:v9];
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);

  id v14 = +[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:@"PRIVACY_INDICATOR_APPNAME_BODY"];
  id v15 = +[NSBundle _rpLocalizedAppNameFromBundleID:v9];
  id v16 = +[NSNumber numberWithInteger:a5];
  id v17 = +[NSNumber numberWithInteger:a6];
  id v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15, v16, v17);

  v21[0] = @"PrivacyHintBundleIdentifier";
  v21[1] = @"PrivacyHintTitle";
  v22[0] = v9;
  v22[1] = v13;
  v21[2] = @"PrivacyHintDescription";
  v21[3] = @"PrivacyHintAppIdentifier";
  v22[2] = v18;
  v22[3] = v10;
  id v19 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];

  return v19;
}

@end