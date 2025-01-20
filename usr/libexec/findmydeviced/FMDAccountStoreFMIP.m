@interface FMDAccountStoreFMIP
- (BOOL)initialized;
- (BOOL)oldLowBatteryState;
- (FMDAccountStoreFMIP)init;
- (FMDFMIPAccount)account;
- (FMDataArchiver)backedUpDataArchiver;
- (FMDataArchiver)notBackedUpDataArchiver;
- (FMStateCapture)stateCapture;
- (NSDictionary)fmipStateChangeCriteria;
- (id)_accountFromBackedUpDictionary:(id)a3 andNotBackedUpDictionary:(id)a4;
- (id)_backedUpDictionaryFromAccount:(id)a3;
- (id)_notBackedUpDictionaryFromAccount:(id)a3;
- (id)_stateChangeCriteriaForAccount:(id)a3;
- (id)accountsFileURL;
- (id)accountsNotBackedUpFileURL;
- (id)loadAccount;
- (void)_checkOSVersionHistoryUsingBackedUpVersion:(id)a3 nonBackedUpVersion:(id)a4;
- (void)_loadTestAccount;
- (void)_saveChanges;
- (void)_saveDictionaryForAccount:(id)a3;
- (void)saveAccount:(id)a3;
- (void)setAccount:(id)a3;
- (void)setBackedUpDataArchiver:(id)a3;
- (void)setFmipStateChangeCriteria:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setNotBackedUpDataArchiver:(id)a3;
- (void)setOldLowBatteryState:(BOOL)a3;
- (void)setStateCapture:(id)a3;
@end

@implementation FMDAccountStoreFMIP

- (FMDAccountStoreFMIP)init
{
  v18.receiver = self;
  v18.super_class = (Class)FMDAccountStoreFMIP;
  v2 = [(FMDAccountStoreFMIP *)&v18 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)FMDataArchiver);
    v4 = [(FMDAccountStoreFMIP *)v2 accountsFileURL];
    id v5 = [v3 initWithFileURL:v4];
    [(FMDAccountStoreFMIP *)v2 setBackedUpDataArchiver:v5];

    v6 = [(FMDAccountStoreFMIP *)v2 backedUpDataArchiver];
    [v6 setDataProtectionClass:4];

    v7 = [(FMDAccountStoreFMIP *)v2 backedUpDataArchiver];
    [v7 setBackedUp:1];

    v8 = [(FMDAccountStoreFMIP *)v2 backedUpDataArchiver];
    [v8 setCreateDirectories:1];

    id v9 = objc_alloc((Class)FMDataArchiver);
    v10 = [(FMDAccountStoreFMIP *)v2 accountsNotBackedUpFileURL];
    id v11 = [v9 initWithFileURL:v10];
    [(FMDAccountStoreFMIP *)v2 setNotBackedUpDataArchiver:v11];

    v12 = [(FMDAccountStoreFMIP *)v2 notBackedUpDataArchiver];
    [v12 setDataProtectionClass:4];

    v13 = [(FMDAccountStoreFMIP *)v2 notBackedUpDataArchiver];
    [v13 setBackedUp:0];

    v14 = [(FMDAccountStoreFMIP *)v2 notBackedUpDataArchiver];
    [v14 setCreateDirectories:1];

    id v15 = objc_alloc_init((Class)FMStateCapture);
    [(FMDAccountStoreFMIP *)v2 setStateCapture:v15];

    v16 = [(FMDAccountStoreFMIP *)v2 stateCapture];
    [v16 setStateCaptureBlock:&stru_1002DB0A8];
  }
  return v2;
}

- (id)loadAccount
{
  if ([(FMDAccountStoreFMIP *)self initialized]) {
    goto LABEL_34;
  }
  id v3 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"];
  if (!v3)
  {
    v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10023E794();
    }

    id v5 = [(FMDAccountStoreFMIP *)self backedUpDataArchiver];
    v6 = +[NSSet setWithObject:objc_opt_class()];
    id v40 = 0;
    id v3 = [v5 readDictionaryAndClasses:v6 error:&v40];
    id v7 = v40;

    if (!v3 || v7)
    {
      v8 = sub_100004238();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_10023E72C();
      }

      id v9 = +[FMDEventLoggerGeneral sharedInstance];
      [v9 sendError:v7 forEventName:@"FMDAccountStoreFMIPFailedReadEventName"];
    }
  }
  v10 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"];
  if (!v10)
  {
    id v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10023E6F8();
    }

    v12 = [(FMDAccountStoreFMIP *)self notBackedUpDataArchiver];
    v13 = +[NSSet setWithObject:objc_opt_class()];
    id v39 = 0;
    v10 = [v12 readDictionaryAndClasses:v13 error:&v39];
    id v14 = v39;

    if (!v10 || v14)
    {
      id v15 = sub_100004238();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_10023E690();
      }

      v16 = +[FMDEventLoggerGeneral sharedInstance];
      [v16 sendError:v14 forEventName:@"FMDAccountStoreFMIPFailedReadEventName"];
    }
  }
  v17 = [(FMDAccountStoreFMIP *)self _accountFromBackedUpDictionary:v3 andNotBackedUpDictionary:v10];
  [(FMDAccountStoreFMIP *)self setAccount:v17];

  objc_super v18 = [(FMDAccountStoreFMIP *)self account];

  if (v18)
  {
    v19 = [v3 objectForKeyedSubscript:off_10031CEA0];
    v20 = [v10 objectForKeyedSubscript:off_10031CEA0];
    [(FMDAccountStoreFMIP *)self _checkOSVersionHistoryUsingBackedUpVersion:v19 nonBackedUpVersion:v20];
  }
  v21 = +[FMSystemInfo sharedInstance];
  if (([v21 isInternalBuild] & 1) == 0)
  {

    goto LABEL_26;
  }
  v22 = +[NSFileManager defaultManager];
  unsigned int v23 = [v22 fileExistsAtPath:@"/var/tmp/fmipAccountInfo.plist"];

  if (!v23)
  {
LABEL_26:
    v24 = [(FMDAccountStoreFMIP *)self account];

    if (v24)
    {
      v25 = +[FMDAppleAccountManager sharedInstance];
      v26 = [(FMDAccountStoreFMIP *)self account];
      unsigned __int8 v27 = [v25 populateiCloudAccountInfoIntoAccount:v26];

      if ((v27 & 1) == 0)
      {
        v28 = sub_100004238();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_10023E5FC(self, v28);
        }

        [(FMDAccountStoreFMIP *)self setAccount:0];
        [(FMDAccountStoreFMIP *)self _saveChanges];
      }
    }
    goto LABEL_31;
  }
  [(FMDAccountStoreFMIP *)self _loadTestAccount];
LABEL_31:
  v29 = [(FMDAccountStoreFMIP *)self account];
  v30 = [(FMDAccountStoreFMIP *)self _stateChangeCriteriaForAccount:v29];
  [(FMDAccountStoreFMIP *)self setFmipStateChangeCriteria:v30];

  v31 = [(FMDAccountStoreFMIP *)self account];
  -[FMDAccountStoreFMIP setOldLowBatteryState:](self, "setOldLowBatteryState:", [v31 lowBatteryLocateEnabled]);

  v32 = sub_100004238();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [(FMDAccountStoreFMIP *)self account];
    v34 = [v33 username];
    *(_DWORD *)buf = 138412290;
    v42 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Loaded FMIP account for user %@ from the store", buf, 0xCu);
  }
  [(FMDAccountStoreFMIP *)self setInitialized:1];
  v35 = +[FMDFMIPSharedStateManager sharedInstance];
  v36 = [(FMDAccountStoreFMIP *)self account];
  [v35 setFMiPActive:v36 != 0];

LABEL_34:
  v37 = [(FMDAccountStoreFMIP *)self account];

  return v37;
}

- (void)saveAccount:(id)a3
{
  id v5 = a3;
  if (v5
    || ([(FMDAccountStoreFMIP *)self account],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    [(FMDAccountStoreFMIP *)self setAccount:v5];
    [(FMDAccountStoreFMIP *)self _saveChanges];
  }

  _objc_release_x1();
}

- (void)_loadTestAccount
{
  id v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412290;
    CFStringRef v23 = @"/var/tmp/fmipAccountInfo.plist";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Using test account info from %@", (uint8_t *)&v22, 0xCu);
  }

  v4 = [(FMDAccountStoreFMIP *)self account];

  if (!v4)
  {
    id v5 = objc_alloc_init(FMDFMIPAccount);
    [(FMDAccountStoreFMIP *)self setAccount:v5];

    v6 = +[NSDate date];
    id v7 = [(FMDAccountStoreFMIP *)self account];
    [v7 setAccountAddTime:v6];
  }
  v8 = +[NSDictionary dictionaryWithContentsOfFile:@"/var/tmp/fmipAccountInfo.plist"];
  id v9 = [v8 objectForKeyedSubscript:off_10031D4C8];
  v10 = [(FMDAccountStoreFMIP *)self account];
  [v10 setUsername:v9];

  id v11 = [v8 objectForKeyedSubscript:off_10031D4D0];
  v12 = [(FMDAccountStoreFMIP *)self account];
  [v12 setDsid:v11];

  v13 = [v8 objectForKeyedSubscript:off_10031D4E0];
  id v14 = [(FMDAccountStoreFMIP *)self account];
  [v14 setFmipAuthToken:v13];

  id v15 = [v8 objectForKeyedSubscript:off_10031D4F8];
  v16 = [(FMDAccountStoreFMIP *)self account];
  [v16 setServerHost:v15];

  v17 = [v8 objectForKeyedSubscript:off_10031D500];
  objc_super v18 = [(FMDAccountStoreFMIP *)self account];
  [v18 setServerProtocolScheme:v17];

  v19 = [v8 objectForKeyedSubscript:off_10031D508];
  v20 = [(FMDAccountStoreFMIP *)self account];
  [v20 setApsEnvironment:v19];

  v21 = [(FMDAccountStoreFMIP *)self account];
  [v21 setFmipEnableContext:2];

  [(FMDAccountStoreFMIP *)self _saveChanges];
}

- (void)_saveChanges
{
  id v3 = [(FMDAccountStoreFMIP *)self account];

  if (!v3)
  {
    v4 = +[NSFileManager defaultManager];
    unsigned int v5 = [v4 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist"];

    if (v5)
    {
      v6 = sub_100004238();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_10023EA4C();
      }

      id v7 = +[NSFileManager defaultManager];
      id v48 = 0;
      [v7 removeItemAtPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist" error:&v48];
      id v8 = v48;

      if (v8 && (objc_msgSend(v8, "fm_isFileNotFoundError") & 1) == 0)
      {
        id v9 = sub_100004238();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10023E9E4();
        }
      }
    }
    v10 = +[NSFileManager defaultManager];
    unsigned int v11 = [v10 fileExistsAtPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist"];

    if (v11)
    {
      v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_10023E9B0();
      }

      v13 = +[NSFileManager defaultManager];
      id v47 = 0;
      [v13 removeItemAtPath:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist" error:&v47];
      id v14 = v47;

      if (v14 && (objc_msgSend(v14, "fm_isFileNotFoundError") & 1) == 0)
      {
        id v15 = sub_100004238();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_10023E948();
        }
      }
    }
    v16 = +[NSFileManager defaultManager];
    v17 = [(FMDAccountStoreFMIP *)self accountsFileURL];
    id v46 = 0;
    [v16 removeItemAtURL:v17 error:&v46];
    id v18 = v46;

    if (v18 && (objc_msgSend(v18, "fm_isFileNotFoundError") & 1) == 0)
    {
      v19 = sub_100004238();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10023E8E0();
      }
    }
    v20 = +[NSFileManager defaultManager];
    v21 = [(FMDAccountStoreFMIP *)self accountsNotBackedUpFileURL];
    id v45 = v18;
    [v20 removeItemAtURL:v21 error:&v45];
    id v22 = v45;

    if (v22 && (objc_msgSend(v22, "fm_isFileNotFoundError") & 1) == 0)
    {
      CFStringRef v23 = sub_100004238();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_10023E878();
      }
    }
  }
  v24 = [(FMDAccountStoreFMIP *)self account];

  if (v24)
  {
    v25 = [(FMDAccountStoreFMIP *)self account];
    [(FMDAccountStoreFMIP *)self _saveDictionaryForAccount:v25];
  }
  v26 = +[FMDFMIPSharedStateManager sharedInstance];
  unsigned __int8 v27 = [(FMDAccountStoreFMIP *)self account];
  [v26 setFMiPActive:v27 != 0];

  v28 = +[FMDAppleAccountManager sharedInstance];
  [v28 setFMIPDataclass:0];

  v29 = [(FMDAccountStoreFMIP *)self account];
  v30 = [(FMDAccountStoreFMIP *)self _stateChangeCriteriaForAccount:v29];

  v31 = sub_100004238();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    sub_10023E7C8(self, (uint64_t)v30, v31);
  }

  v32 = [(FMDAccountStoreFMIP *)self fmipStateChangeCriteria];
  unsigned __int8 v33 = [v30 isEqualToDictionary:v32];

  if ((v33 & 1) == 0)
  {
    v34 = sub_100004238();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Sending FMIP state change notification", v44, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, kFMIPStateDidChangeNotification, 0, 0, 1u);
    v36 = +[NSNotificationCenter defaultCenter];
    [v36 postNotificationName:@"FMIPStateChangeLocalNotification" object:0];
  }
  [(FMDAccountStoreFMIP *)self setFmipStateChangeCriteria:v30];
  unsigned int v37 = [(FMDAccountStoreFMIP *)self oldLowBatteryState];
  v38 = [(FMDAccountStoreFMIP *)self account];
  unsigned int v39 = [v38 lowBatteryLocateEnabled];

  if (v37 != v39)
  {
    id v40 = sub_100004238();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Posting FMDFMIPLowBatteryLocateStateDidChangeLocalNotification", v44, 2u);
    }

    v41 = +[NSNotificationCenter defaultCenter];
    [v41 postNotificationName:@"FMDFMIPLowBatteryLocateStateDidChangeLocalNotification" object:0];

    v42 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v42, kFMIPLowBatteryLocateStateDidChangeNotification, 0, 0, 1u);
    v43 = [(FMDAccountStoreFMIP *)self account];
    -[FMDAccountStoreFMIP setOldLowBatteryState:](self, "setOldLowBatteryState:", [v43 lowBatteryLocateEnabled]);
  }
}

- (void)_checkOSVersionHistoryUsingBackedUpVersion:(id)a3 nonBackedUpVersion:(id)a4
{
  id v6 = a3;
  id v7 = +[FMDSystemConfig sharedInstance];
  id v8 = [v7 productVersion];

  if (v6)
  {
    if ([v6 isEqualToString:v8]) {
      goto LABEL_16;
    }
    id v9 = a4 ? @"u" : @"b";
    v10 = [(__CFString *)v9 stringByAppendingString:v6];
    if (!v10) {
      goto LABEL_16;
    }
  }
  else
  {
    v10 = @"old";
  }
  unsigned int v11 = [(FMDAccountStoreFMIP *)self account];
  v12 = [v11 versionHistory];

  if ([v12 count])
  {
    v13 = [v12 lastObject];
    unsigned __int8 v14 = [(__CFString *)v10 isEqualToString:v13];

    if (v14)
    {
      id v15 = 0;
    }
    else
    {
      id v15 = [v12 arrayByAddingObject:v10];
      if ((unint64_t)[v15 count] >= 0x15)
      {
        uint64_t v16 = [v15 subarrayWithRange:1, (char *)[v15 count] - 1];

        id v15 = (void *)v16;
      }
    }
  }
  else
  {
    id v18 = v10;
    id v15 = +[NSArray arrayWithObjects:&v18 count:1];
  }
  v17 = [(FMDAccountStoreFMIP *)self account];
  [v17 setVersionHistory:v15];

  [(FMDAccountStoreFMIP *)self _saveChanges];
LABEL_16:
}

- (void)_saveDictionaryForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(FMDAccountStoreFMIP *)self _backedUpDictionaryFromAccount:v4];
  id v6 = [(FMDAccountStoreFMIP *)self _notBackedUpDictionaryFromAccount:v4];

  id v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10023EB6C(v5);
  }

  id v8 = +[NSPropertyListSerialization dataWithPropertyList:v5 format:200 options:0 error:0];
  [v8 writeToFile:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.plist" atomically:1];
  id v9 = [(FMDAccountStoreFMIP *)self backedUpDataArchiver];
  v10 = [v9 saveDictionary:v5];

  if (v10)
  {
    unsigned int v11 = sub_100004238();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10023EA80();
    }
  }
  v12 = sub_100004238();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_10023EAE8(v6);
  }

  v13 = +[NSPropertyListSerialization dataWithPropertyList:v6 format:200 options:0 error:0];
  [v13 writeToFile:@"/var/mobile/Library/Preferences/com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup.plist" atomically:1];
  unsigned __int8 v14 = [(FMDAccountStoreFMIP *)self notBackedUpDataArchiver];
  id v15 = [v14 saveDictionary:v6];

  if (v15)
  {
    uint64_t v16 = sub_100004238();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10023EA80();
    }
  }
}

- (id)_accountFromBackedUpDictionary:(id)a3 andNotBackedUpDictionary:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = a3;
    a3 = objc_alloc_init(FMDFMIPAccount);
    id v7 = [v6 objectForKeyedSubscript:off_10031CE70];
    [a3 setDsid:v7];
    id v8 = [v6 objectForKeyedSubscript:off_10031CE88];
    [a3 setFmipEnableContext:[v8 unsignedIntValue]];

    id v9 = [v6 objectForKeyedSubscript:off_10031CEA8];
    [a3 setVersionHistory:v9];

    v10 = [v6 objectForKeyedSubscript:off_10031CEB0];
    [a3 setLastLoggedInDsid:v10];

    unsigned int v11 = [v6 objectForKeyedSubscript:off_10031CEC0];
    [a3 setLowBatteryLocateEnabled:[v11 BOOLValue]];

    v12 = [v6 objectForKeyedSubscript:off_10031CEB8];

    [v12 doubleValue];
    double v14 = v13;

    if (v14 > 0.0)
    {
      id v15 = +[NSDate dateWithTimeIntervalSince1970:v14];
      [a3 setAccountAddTime:v15];
    }
    uint64_t v16 = [v5 objectForKeyedSubscript:off_10031CE70];
    if ([v16 isEqualToString:v7])
    {
      v17 = [v5 objectForKeyedSubscript:off_10031CE78];
      [a3 setLastIdentityTime:v17];

      id v18 = [v5 objectForKeyedSubscript:off_10031CE80];
      [a3 setUnregisterState:[v18 unsignedIntValue]];

      v19 = [v5 objectForKeyedSubscript:off_10031CE90];
      [a3 setFmipDisableContext:[v19 unsignedIntValue]];

      v20 = [v5 objectForKeyedSubscript:off_10031CE98];
      [a3 setLastUnregisterFailedTime:v20];
    }
  }

  return a3;
}

- (id)_backedUpDictionaryFromAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = off_10031CE70;
    id v6 = [v3 dsid];
    [v4 fm_safelyMapKey:v5 toObject:v6];

    if ([v3 fmipEnableContext])
    {
      id v7 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 fmipEnableContext]);
      [v4 setObject:v7 forKeyedSubscript:off_10031CE88];
    }
    id v8 = +[FMDSystemConfig sharedInstance];
    uint64_t v9 = [v8 productVersion];
    v10 = (void *)v9;
    if (v9) {
      CFStringRef v11 = (const __CFString *)v9;
    }
    else {
      CFStringRef v11 = &stru_1002E7428;
    }
    [v4 setObject:v11 forKeyedSubscript:off_10031CEA0];

    v12 = [v3 lastLoggedInDsid];

    if (v12)
    {
      double v13 = [v3 lastLoggedInDsid];
      [v4 setObject:v13 forKeyedSubscript:off_10031CEB0];
    }
    double v14 = [v3 versionHistory];

    if (v14)
    {
      id v15 = [v3 versionHistory];
      [v4 setObject:v15 forKeyedSubscript:off_10031CEA8];
    }
    uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 lowBatteryLocateEnabled]);
    [v4 setObject:v16 forKeyedSubscript:off_10031CEC0];

    v17 = [v3 accountAddTime];

    if (v17)
    {
      id v18 = [v3 accountAddTime];
      [v18 timeIntervalSince1970];
      v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v4 setObject:v19 forKeyedSubscript:off_10031CEB8];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_notBackedUpDictionaryFromAccount:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = off_10031CE70;
    id v6 = [v3 dsid];
    [v4 fm_safelyMapKey:v5 toObject:v6];

    id v7 = off_10031CE78;
    id v8 = [v3 lastIdentityTime];
    [v4 fm_safelyMapKey:v7 toObject:v8];

    uint64_t v9 = off_10031CE98;
    v10 = [v3 lastUnregisterFailedTime];
    [v4 fm_safelyMapKey:v9 toObject:v10];

    CFStringRef v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 unregisterState]);
    [v4 setObject:v11 forKeyedSubscript:off_10031CE80];

    if ([v3 fmipDisableContext])
    {
      v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 fmipDisableContext]);
      [v4 setObject:v12 forKeyedSubscript:off_10031CE90];
    }
    double v13 = +[FMDSystemConfig sharedInstance];
    uint64_t v14 = [v13 productVersion];
    id v15 = (void *)v14;
    if (v14) {
      CFStringRef v16 = (const __CFString *)v14;
    }
    else {
      CFStringRef v16 = &stru_1002E7428;
    }
    [v4 setObject:v16 forKeyedSubscript:off_10031CEA0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_stateChangeCriteriaForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 dsid];
  [v4 fm_safelyMapKey:@"dsid" toObject:v5];

  id v6 = [v3 unregisterState];
  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  [v4 setObject:v7 forKeyedSubscript:@"unregisterState"];

  return v4;
}

- (id)accountsFileURL
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_10031CBE0];
  id v4 = [v3 url];
  id v5 = [v4 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.FMIPAccounts"];

  return v5;
}

- (id)accountsNotBackedUpFileURL
{
  id v2 = objc_alloc((Class)FMSharedFileContainer);
  id v3 = [v2 initWithIdentifier:off_10031CBE0];
  id v4 = [v3 url];
  id v5 = [v4 fm_preferencesPathURLForDomain:@"com.apple.icloud.findmydeviced.FMIPAccounts.notbackedup"];

  return v5;
}

- (FMDFMIPAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSDictionary)fmipStateChangeCriteria
{
  return self->_fmipStateChangeCriteria;
}

- (void)setFmipStateChangeCriteria:(id)a3
{
}

- (BOOL)oldLowBatteryState
{
  return self->_oldLowBatteryState;
}

- (void)setOldLowBatteryState:(BOOL)a3
{
  self->_oldLowBatteryState = a3;
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (FMStateCapture)stateCapture
{
  return self->_stateCapture;
}

- (void)setStateCapture:(id)a3
{
}

- (FMDataArchiver)backedUpDataArchiver
{
  return self->_backedUpDataArchiver;
}

- (void)setBackedUpDataArchiver:(id)a3
{
}

- (FMDataArchiver)notBackedUpDataArchiver
{
  return self->_notBackedUpDataArchiver;
}

- (void)setNotBackedUpDataArchiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notBackedUpDataArchiver, 0);
  objc_storeStrong((id *)&self->_backedUpDataArchiver, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_fmipStateChangeCriteria, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end