@interface SUBUserNotification
+ (BOOL)activeWatchShouldOfferUnpair;
- (id)internalMessageFromDenialInfo:(id)a3;
- (void)postSpaceNotificationWithUnpair;
- (void)showDownloadAndPrepareError:(id)a3;
- (void)showDuetConditions:(id)a3;
- (void)showInstallationError:(id)a3;
- (void)showUserNotificationHeader:(id)a3 message:(id)a4 internalMessage:(id)a5 defButton:(id)a6 altButton:(id)a7 bridgePane:(id)a8 showOnLockLockScreen:(BOOL)a9 dismissalHandler:(id)a10;
@end

@implementation SUBUserNotification

- (void)showUserNotificationHeader:(id)a3 message:(id)a4 internalMessage:(id)a5 defButton:(id)a6 altButton:(id)a7 bridgePane:(id)a8 showOnLockLockScreen:(BOOL)a9 dismissalHandler:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v34 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  v21 = [[SUBTransaction alloc] initWithName:@"ShowingUserNotification"];
  v22 = objc_opt_new();
  v23 = v22;
  if (v15) {
    [v22 setObject:v15 forKeyedSubscript:kCFUserNotificationAlertHeaderKey];
  }
  if (v16)
  {
    id v24 = v16;
    int v25 = MGGetBoolAnswer();
    if (v34 && v25)
    {
      uint64_t v26 = +[NSString stringWithFormat:@"%@\n[Internal Only : %@]", v24, v34];

      id v24 = (id)v26;
    }
    [v23 setObject:v24 forKeyedSubscript:kCFUserNotificationAlertMessageKey];
  }
  if (v17) {
    [v23 setObject:v17 forKeyedSubscript:kCFUserNotificationDefaultButtonTitleKey];
  }
  if (v18) {
    [v23 setObject:v18 forKeyedSubscript:kCFUserNotificationAlternateButtonTitleKey];
  }
  if (a9)
  {
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:kCFUserNotificationAlertTopMostKey];
    [v23 setObject:&__kCFBooleanTrue forKeyedSubscript:SBUserNotificationDontDismissOnUnlock];
  }
  SInt32 error = -1;
  CFUserNotificationRef v27 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, (CFDictionaryRef)v23);
  if (!v27 || error)
  {
    v28 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      SInt32 v45 = error;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "failed to display notification: %{public}d", buf, 8u);
    }
    if (v27) {
      CFRelease(v27);
    }
    if (v20)
    {
      v29 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004BBC;
      block[3] = &unk_10002C700;
      id v42 = v20;
      v41 = v21;
      dispatch_async(v29, block);
    }
  }
  v30 = dispatch_get_global_queue(0, 0);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100004C00;
  v35[3] = &unk_10002C728;
  id v38 = v20;
  CFUserNotificationRef v39 = v27;
  id v36 = v19;
  v37 = v21;
  v31 = v21;
  id v32 = v20;
  id v33 = v19;
  dispatch_async(v30, v35);
}

- (void)showDownloadAndPrepareError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userInfo];
    v7 = [v6 objectForKey:NSUnderlyingErrorKey];

    uint64_t v8 = (uint64_t)[v5 code];
    if (v8 > 9)
    {
      if (v8 != 10)
      {
        if (v8 == 23)
        {
          v28 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "update was cancelled by user action", buf, 2u);
          }
        }
        else if (v8 == 25)
        {
          id v16 = [v5 userInfo];
          id v17 = +[NSString stringWithUTF8String:SUBMessageRequiredDiskSpaceKey[0]];
          id v18 = [v16 objectForKeyedSubscript:v17];

          if ([v18 unsignedLongLongValue])
          {
            if (+[SUBUserNotification activeWatchShouldOfferUnpair])
            {
              [(SUBUserNotification *)self postSpaceNotificationWithUnpair];
            }
            else
            {
              v47 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
              v50 = v7;
              CFUserNotificationRef v39 = [v47 localizedStringForKey:@"INSTALL_DISK_SPACE_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
              SInt32 v45 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
              id v42 = [v45 localizedStringForKey:@"INSTALL_DISK_SPACE_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
              [v18 unsignedLongLongValue];
              id v38 = CPFSSizeStrings();
              +[NSString stringWithFormat:](NSString, "stringWithFormat:", v42, v38);
              v29 = v37 = self;
              v30 = [v5 description];
              v31 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
              id v32 = [v31 localizedStringForKey:@"LEARN_MORE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
              id v33 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
              id v34 = [v33 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
              LOBYTE(v36) = 1;
              [(SUBUserNotification *)v37 showUserNotificationHeader:v39 message:v29 internalMessage:v30 defButton:v32 altButton:v34 bridgePane:@"https://support.apple.com/kb/HT211283" showOnLockLockScreen:v36 dismissalHandler:0];

              v7 = v50;
            }
          }
        }
        goto LABEL_18;
      }
      id v19 = [v7 domain];
      unsigned int v20 = [v19 isEqualToString:kCFErrorDomainMobileSoftwareUpdate];

      if (v20)
      {
        v46 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v41 = [v46 localizedStringForKey:@"VERIFICATION_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v44 = v49 = v7;
        [v44 localizedStringForKey:@"VERIFICATION_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        v22 = v21 = self;
        v23 = [v5 description];
        id v24 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        int v25 = [v24 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        uint64_t v26 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        CFUserNotificationRef v27 = [v26 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        LOBYTE(v35) = 1;
        [(SUBUserNotification *)v21 showUserNotificationHeader:v41 message:v22 internalMessage:v23 defButton:v25 altButton:v27 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK" showOnLockLockScreen:v35 dismissalHandler:0];

        v7 = v49;
        goto LABEL_5;
      }
    }
    else if ((unint64_t)(v8 - 7) < 3)
    {
      v46 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      v40 = [v46 localizedStringForKey:@"GENERIC_DOWNLOAD_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      v43 = v48 = v7;
      [v43 localizedStringForKey:@"GENERIC_DOWNLOAD_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      v10 = v9 = self;
      v11 = [v5 description];
      v12 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      v13 = [v12 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      v14 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      id v15 = [v14 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      LOBYTE(v35) = 1;
      [(SUBUserNotification *)v9 showUserNotificationHeader:v40 message:v10 internalMessage:v11 defButton:v13 altButton:v15 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK" showOnLockLockScreen:v35 dismissalHandler:0];

      v7 = v48;
LABEL_5:
    }
LABEL_18:
  }
}

- (void)showInstallationError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v42 = v4;
    if ([v4 code] == (id)25)
    {
      v5 = [v42 userInfo];
      v6 = +[NSString stringWithUTF8String:SUBMessageRequiredDiskSpaceKey[0]];
      v7 = [v5 objectForKeyedSubscript:v6];

      if (![v7 unsignedLongLongValue])
      {
LABEL_17:

        id v4 = v42;
        goto LABEL_18;
      }
      v37 = self;
      id v38 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      uint64_t v39 = [v38 localizedStringForKey:@"INSTALL_DISK_SPACE_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      uint64_t v8 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      uint64_t v9 = [v8 localizedStringForKey:@"INSTALL_DISK_SPACE_MESSAGE" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      v41 = v7;
      [v7 unsignedLongLongValue];
      v10 = CPFSSizeStrings();
      v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10);
      v12 = [v42 description];
      v13 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      v14 = [v13 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      id v15 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
      id v16 = (void *)v39;
      id v17 = [v15 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
      LOBYTE(v36) = 1;
      [(SUBUserNotification *)v37 showUserNotificationHeader:v39 message:v11 internalMessage:v12 defButton:v14 altButton:v17 bridgePane:@"bridge:tab=SETTINGS&root=GENERAL_LINK&path=USAGE_LINK" showOnLockLockScreen:v36 dismissalHandler:0];

      id v18 = (void *)v9;
      id v19 = v38;
LABEL_16:

      v7 = v41;
      goto LABEL_17;
    }
    BOOL v20 = [v42 code] == (id)24;
    id v4 = v42;
    if (!v20)
    {
      BOOL v20 = [v42 code] == (id)18;
      id v4 = v42;
      if (!v20)
      {
        v21 = [v42 userInfo];
        v22 = [v21 objectForKey:NSUnderlyingErrorKey];

        v23 = [v22 domain];
        v40 = v22;
        if ([v23 isEqualToString:kCFErrorDomainMobileSoftwareUpdate])
        {
          id v24 = [v22 code];

          if (v24 == (id)2)
          {
            int v25 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
            uint64_t v26 = [v25 localizedStringForKey:@"VERIFICATION_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];

            CFUserNotificationRef v27 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
            v28 = v27;
            CFStringRef v29 = @"VERIFICATION_MESSAGE";
            goto LABEL_12;
          }
        }
        else
        {
        }
        v30 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        uint64_t v26 = [v30 localizedStringForKey:@"INSTALLATION_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];

        CFUserNotificationRef v27 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v28 = v27;
        CFStringRef v29 = @"INSTALLATION_MESSAGE";
LABEL_12:
        id v19 = [v27 localizedStringForKey:v29 value:&stru_10002D868 table:@"SoftwareUpdateBridge"];

        v31 = (void *)MGCopyAnswer();
        v41 = (void *)v26;
        if ([v31 isEqualToString:@"Internal"] && v40)
        {
          id v32 = [v40 description];
          uint64_t v33 = +[NSString stringWithFormat:@"%@\n\nInternal Only\n\n%@", v19, v32];

          id v19 = (void *)v33;
        }
        uint64_t v34 = [v42 description];
        v10 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v11 = [v10 localizedStringForKey:@"OPEN_APP_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        id v18 = (void *)v34;
        v12 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v13 = [v12 localizedStringForKey:@"CLOSE_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        LOBYTE(v35) = 1;
        [(SUBUserNotification *)self showUserNotificationHeader:v41 message:v19 internalMessage:v18 defButton:v11 altButton:v13 bridgePane:@"bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK" showOnLockLockScreen:v35 dismissalHandler:0];
        id v16 = v40;
        uint64_t v8 = v31;
        goto LABEL_16;
      }
    }
  }
LABEL_18:
}

- (id)internalMessageFromDenialInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 objectForKeyedSubscript:@"ChargerRequiredForApply"];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v6 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unexpected value passed for chargerRequiredForUpdate. Assuming required", buf, 2u);
      }

      v5 = &__kCFBooleanTrue;
    }
    v7 = [v4 objectForKeyedSubscript:@"ChargerConnected"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if ([v7 BOOLValue]) {
        uint64_t v8 = @"YES";
      }
      else {
        uint64_t v8 = @"NO";
      }
      uint64_t v9 = v8;
    }
    else
    {
      v10 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Invalid value passed for chargerConnected", buf, 2u);
      }
      uint64_t v9 = @"Unknown";
    }
    v11 = [v4 objectForKeyedSubscript:@"BatteryLevel"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v12 = +[NSString stringWithFormat:@"%@", v11];
    }
    else
    {
      v13 = softwareupdatebridge_log;
      if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Invalid value passed for battery level", buf, 2u);
      }
      v12 = @"Unknown";
    }
    if ([v5 BOOLValue]) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    id v15 = +[NSString stringWithFormat:@"ChargerRequired: %@ ChargerConnected: %@ BatteryLevel: %@", v14, v9, v12];
  }
  else
  {
    id v16 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[SUBUserNotification internalMessageFromDenialInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Invalid denialInfo passed to %s", buf, 0xCu);
    }
    id v15 = @"Unable to parse error info";
  }

  return v15;
}

- (void)showDuetConditions:(id)a3
{
  id v4 = a3;
  v5 = [v4 denialReasons];

  if (!v5) {
    goto LABEL_49;
  }
  v6 = [v4 denialReasons];
  v7 = [v6 userInfo];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = [v7 objectForKeyedSubscript:@"RichDenialReasonsSupported"];

    uint64_t v9 = softwareupdatebridge_log;
    BOOL v10 = os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v52 = (uint64_t)v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: DenialReasons passed in using new format : %@", buf, 0xCu);
      }
      v11 = [v7 objectForKeyedSubscript:@"MinNeededBatteryLevelWithoutChargerForApply"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v12 = v11;
      }
      else
      {
        v12 = +[NSNumber numberWithInteger:80];

        id v19 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = (uint64_t)v12;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for requiredBatteryLevelWithoutCharger. Assuming default(%@)", buf, 0xCu);
        }
      }
      BOOL v20 = [v7 objectForKeyedSubscript:@"MinNeededBatteryLevelWithChargerForApply"];
      if (v20 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v48 = v20;
      }
      else
      {
        uint64_t v21 = +[NSNumber numberWithInteger:50];

        v22 = softwareupdatebridge_log;
        v48 = (void *)v21;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for requiredBatteryLevelWithCharger. Assuming default(%@)", buf, 0xCu);
        }
      }
      v23 = [v7 objectForKeyedSubscript:@"ChargerRequiredForApply"];
      if (!v23 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v24 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Unexpected value passed for chargerRequiredForUpdate. Assuming required", buf, 2u);
        }

        v23 = &__kCFBooleanTrue;
      }
      int v25 = [v7 objectForKeyedSubscript:@"ChargerConnected"];
      id v15 = [(SUBUserNotification *)self internalMessageFromDenialInfo:v7];
      v46 = v25;
      v47 = v23;
      if ([v23 BOOLValue])
      {
        if (v25
          && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
          && ([v25 BOOLValue] & 1) == 0)
        {
          v44 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is required for update and not connected. Showing charger required message in notification", buf, 2u);
          }
          CFUserNotificationRef v27 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
          v28 = v27;
          CFStringRef v29 = @"INSTALLATION_PAUSED_CHARGER";
        }
        else
        {
          uint64_t v26 = softwareupdatebridge_log;
          if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is required for update and is connected. Showing low battery message in notification", buf, 2u);
          }
          CFUserNotificationRef v27 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
          v28 = v27;
          CFStringRef v29 = @"INSTALLATION_PAUSED_BATTERY";
        }
        id v18 = [v27 localizedStringForKey:v29 value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        v30 = v48;
      }
      else
      {
        v50 = self;
        id v33 = v4;
        uint64_t v34 = softwareupdatebridge_log;
        if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Charger is not required for update. Showing new combined battery/charger message in notification", buf, 2u);
        }
        v28 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        uint64_t v35 = [v28 localizedStringForKey:@"INSTALLATION_PAUSED_CHARGER_OPTIONAL" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
        v30 = v48;
        uint64_t v36 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v35, [v48 intValue], objc_msgSend(v12, "intValue"), v46, v47);
        v37 = +[NSString stringWithFormat:@"%@", v36];
        id v18 = +[NSString localizedUserNotificationStringForKey:v37 arguments:0];

        id v4 = v33;
        self = v50;
      }

      goto LABEL_45;
    }
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: DenialReasons passed in using legacy format", buf, 2u);
    }
    id v15 = [v7 valueForKey:@"ChargerConnected"];
    if (!v15) {
      goto LABEL_50;
    }
    v31 = [v4 denialReasons];
    unsigned int v32 = [v31 code];

    if ([v15 BOOLValue])
    {
      if ((*(void *)&v32 & 0x10000) != 0)
      {
        id v16 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
        v12 = v16;
        CFStringRef v17 = @"INSTALLATION_PAUSED_BATTERY";
        goto LABEL_14;
      }
LABEL_50:
      id v18 = 0;
      goto LABEL_46;
    }
  }
  else
  {
    v13 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[DenialReasons]: Invalid denialInfo passed to showDuetConditions. Showing default alert", buf, 2u);
    }
    CFStringRef v14 = [v4 denialReasons];
    id v15 = [v14 description];
  }
  id v16 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  v12 = v16;
  CFStringRef v17 = @"INSTALLATION_PAUSED_CHARGER";
LABEL_14:
  id v18 = [v16 localizedStringForKey:v17 value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
LABEL_45:

LABEL_46:
  if (v18)
  {
    id v38 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    uint64_t v39 = [v38 localizedStringForKey:@"INSTALLATION_PAUSED_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    [v4 denialReasons];
    v40 = id v49 = v4;
    v41 = [v40 description];
    id v42 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
    v43 = [v42 localizedStringForKey:@"OK_BUTTON" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
    LOBYTE(v45) = 1;
    [(SUBUserNotification *)self showUserNotificationHeader:v39 message:v18 internalMessage:v41 defButton:v43 altButton:0 bridgePane:0 showOnLockLockScreen:v45 dismissalHandler:0];

    id v4 = v49;
  }

LABEL_49:
}

+ (BOOL)activeWatchShouldOfferUnpair
{
  v2 = SUBActiveNRDevice();
  id v3 = [v2 valueForProperty:NRDevicePropertyProductType];
  id v4 = +[NSSet setWithArray:&off_10002F2A0];
  v5 = [v3 lowercaseString];
  unsigned __int8 v6 = [v4 containsObject:v5];

  return v6;
}

- (void)postSpaceNotificationWithUnpair
{
  v22[0] = kCFUserNotificationAlertHeaderKey;
  v2 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  id v3 = [v2 localizedStringForKey:@"INSTALL_DISK_SPACE_HEADER" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v23[0] = v3;
  v22[1] = kCFUserNotificationAlertMessageKey;
  id v4 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  v5 = [v4 localizedStringForKey:@"INSTALL_DISK_SPACE_MUST_UNPAIR" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v23[1] = v5;
  v22[2] = kCFUserNotificationAlternateButtonTitleKey;
  unsigned __int8 v6 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  v7 = [v6 localizedStringForKey:@"UNPAIR" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v23[2] = v7;
  v22[3] = kCFUserNotificationDefaultButtonTitleKey;
  uint64_t v8 = +[NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateBridge.framework"];
  uint64_t v9 = [v8 localizedStringForKey:@"CLOSE_DIALOG" value:&stru_10002D868 table:@"SoftwareUpdateBridge"];
  v23[3] = v9;
  CFDictionaryRef v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  SInt32 error = -1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  CFUserNotificationRef v18 = 0;
  CFUserNotificationRef v18 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, v10);
  if (!v16[3] || error)
  {
    v12 = softwareupdatebridge_log;
    if (os_log_type_enabled((os_log_t)softwareupdatebridge_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240192;
      SInt32 v21 = error;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[SpaceNotification]: failed to display notification: %{public}d", buf, 8u);
    }
    v13 = (const void *)v16[3];
    if (v13) {
      CFRelease(v13);
    }
  }
  else
  {
    v11 = dispatch_get_global_queue(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100006908;
    v14[3] = &unk_10002C790;
    v14[4] = &v15;
    dispatch_async(v11, v14);
  }
  _Block_object_dispose(&v15, 8);
}

@end