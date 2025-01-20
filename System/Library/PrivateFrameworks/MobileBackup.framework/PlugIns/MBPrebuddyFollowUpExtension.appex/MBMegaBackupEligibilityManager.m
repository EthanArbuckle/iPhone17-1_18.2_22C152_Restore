@interface MBMegaBackupEligibilityManager
- (BOOL)_isAccountModificationDisabledByRestrictions;
- (BOOL)_isCloudBackupRestricted;
- (BOOL)_isHSA2AvailableForAuthenticationContext:(id)a3;
- (BOOL)needsAccountSignIn;
- (id)_account;
- (id)_queue;
- (id)_usedCapacityForVolume:(id)a3;
- (int64_t)_entryMethodForEntryPoint:(int64_t)a3;
- (void)checkMegaBackupEligibility:(int64_t)a3 deepLinkURL:(id)a4 backupDeviceUUID:(id)a5 queue:(id)a6 completion:(id)a7;
@end

@implementation MBMegaBackupEligibilityManager

- (id)_queue
{
  if (qword_1000233F8 != -1) {
    dispatch_once(&qword_1000233F8, &stru_10001C7C8);
  }
  v2 = (void *)qword_1000233F0;
  return v2;
}

- (int64_t)_entryMethodForEntryPoint:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return 4 - a3;
  }
}

- (id)_account
{
  v2 = +[ACAccountStore defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (BOOL)needsAccountSignIn
{
  v2 = [(MBMegaBackupEligibilityManager *)self _account];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)checkMegaBackupEligibility:(int64_t)a3 deepLinkURL:(id)a4 backupDeviceUUID:(id)a5 queue:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = [(MBMegaBackupEligibilityManager *)self _queue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006D70;
  v21[3] = &unk_10001C868;
  v21[4] = self;
  id v22 = v14;
  id v25 = v15;
  int64_t v26 = a3;
  id v23 = v13;
  id v24 = v12;
  id v17 = v12;
  id v18 = v13;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v16, v21);
}

- (id)_usedCapacityForVolume:(id)a3
{
  id v3 = a3;
  unint64_t v4 = MBUsedDiskSpaceForVolume();
  v5 = +[NSURL fileURLWithPath:v3];
  v34[0] = NSURLVolumeAvailableCapacityKey;
  v34[1] = NSURLVolumeAvailableCapacityForImportantUsageKey;
  v6 = +[NSArray arrayWithObjects:v34 count:2];
  id v27 = 0;
  v7 = [v5 resourceValuesForKeys:v6 error:&v27];
  id v8 = v27;

  if (v7)
  {
    v9 = [v7 objectForKeyedSubscript:NSURLVolumeAvailableCapacityKey];
    v10 = [v7 objectForKeyedSubscript:NSURLVolumeAvailableCapacityForImportantUsageKey];
    id v11 = [v9 unsignedLongLongValue];
    if (v11 <= [v10 unsignedLongLongValue])
    {
      id v15 = [v10 unsignedLongLongValue];
      unint64_t v12 = v15 - (unsigned char *)[v9 unsignedLongLongValue];
      if (v12 > v4)
      {
        v16 = MBGetDefaultLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          +[NSNumber numberWithUnsignedLongLong:v4];
          id v17 = log = v16;
          id v18 = +[NSNumber numberWithUnsignedLongLong:v12];
          *(_DWORD *)buf = 138543874;
          id v29 = v3;
          __int16 v30 = 2114;
          id v31 = v17;
          __int16 v32 = 2114;
          v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Somehow reclaimable space is bigger than used space for %{public}@: %{public}@, %{public}@", buf, 0x20u);

          v16 = log;
          id v19 = +[NSNumber numberWithUnsignedLongLong:v4];
          +[NSNumber numberWithUnsignedLongLong:v12];
          v25 = id v24 = v19;
          id v23 = v3;
          _MBLog();
        }
        unint64_t v20 = v4;
        goto LABEL_12;
      }
    }
    else
    {
      unint64_t v12 = 0;
    }
    unint64_t v20 = v4 - v12;
LABEL_12:
    id v14 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v20, v23, v24, v25);
    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v29 = v3;
      __int16 v30 = 2114;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Used Capacity on %{public}@: %{public}@", buf, 0x16u);
      _MBLog();
    }

    goto LABEL_15;
  }
  id v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v5;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to get resource values for %@: %@", buf, 0x16u);
    _MBLog();
  }

  id v14 = +[NSNumber numberWithUnsignedLongLong:v4];
LABEL_15:

  return v14;
}

- (BOOL)_isHSA2AvailableForAuthenticationContext:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[AKAccountManager sharedInstance];
  v5 = objc_msgSend(v3, "aa_altDSID");
  v6 = [v4 authKitAccountWithAltDSID:v5];

  if (v3)
  {
    id v7 = [v4 securityLevelForAccount:v6];
    id v8 = objc_msgSend(v3, "aa_personID");
    unsigned __int8 v9 = +[CDPAccount isICDPEnabledForDSID:v8];

    if (v7 == (id)4) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isAccountModificationDisabledByRestrictions
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] == 2;

  return v3;
}

- (BOOL)_isCloudBackupRestricted
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureCloudBackupAllowed] == 2;

  return v3;
}

@end