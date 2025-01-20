@interface MBDataMigratorPlugin
+ (BOOL)setUpMobileBackupPreferencesForBackgroundRestoreWithAccount:(id)a3 restoreSession:(id)a4 cloudFormatInfo:(id)a5 performanceStatistics:(id)a6 backupPolicy:(int64_t)a7 error:(id *)a8;
- (id)_restoreDefaultsWithEngine:(id)a3;
- (id)_setDMContextWithPolicy:(id)a3 engine:(id)a4;
- (id)_updateMobileBackupPreferencesWithEngine:(id)a3;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (id)preparingBackupWithEngine:(id)a3;
- (void)_updateDeviceTransferInfoWithPlist:(id)a3;
@end

@implementation MBDataMigratorPlugin

- (id)preparingBackupWithEngine:(id)a3
{
  id v3 = a3;
  if ([v3 backsUpPrimaryAccount])
  {
    v4 = +[MCProfileConnection sharedConnection];
    id v5 = [v4 isPasscodeSet];
    v6 = [v3 properties];
    [v6 setPasscodeSet:v5];

    v7 = +[NSFileManager defaultManager];
    if ([v7 fileExistsAtPath:@"/var/root/Library/Caches/Backup"])
    {
      v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v15 = @"/var/root/Library/Caches/Backup";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing %{public}@", buf, 0xCu);
        _MBLog();
      }

      id v13 = 0;
      unsigned __int8 v9 = [v7 removeItemAtPath:@"/var/root/Library/Caches/Backup" error:&v13];
      id v10 = v13;
      if ((v9 & 1) == 0)
      {
        v11 = MBGetDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          CFStringRef v15 = @"/var/root/Library/Caches/Backup";
          __int16 v16 = 2114;
          id v17 = v10;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@: %{public}@", buf, 0x16u);
          _MBLog();
        }
      }
    }
  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MBDataMigratorPlugin *)self _updateMobileBackupPreferencesWithEngine:v7];
  if (!v8)
  {
    if ([v7 restoresPrimaryAccount])
    {
      v8 = [(MBDataMigratorPlugin *)self _setDMContextWithPolicy:v6 engine:v7];
      if (!v8)
      {
        v8 = [(MBDataMigratorPlugin *)self _restoreDefaultsWithEngine:v7];
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)_setDMContextWithPolicy:(id)a3 engine:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 settingsContext];
  v8 = [v6 properties];
  uint64_t v9 = [v8 deviceName];
  unsigned int v10 = [v5 isRestoringToSameDevice];
  v41 = (void *)v9;
  if (v10)
  {
    v46 = @"same device";
  }
  else
  {
    v11 = [v8 productType];
    v12 = [v8 deviceID];
    v46 = +[NSString stringWithFormat:@"\"%@\" (%@ %@)", v9, v11, v12];
  }
  uint64_t v13 = [v8 buildVersion];
  v45 = [v8 date];
  id v14 = [v7 shouldPreserveSettings];
  id v15 = [v8 wasPasscodeSet];
  id v16 = [v6 isServiceEngine];
  id v17 = [v6 isDeviceTransferEngine];
  v43 = v6;
  if (v17) {
    id v18 = 0;
  }
  else {
    id v18 = [v6 isDriveEngine];
  }
  v40 = [v8 buildVersion];
  v39 = [v8 productType];
  v44 = v5;
  v42 = v7;
  if (v17)
  {
    if (v16) {
      sub_10009A5D0();
    }
    if (v18) {
      sub_10009A5FC();
    }
    uint64_t v19 = +[NSString stringWithFormat:@"Restored from a %@ backup of %@ created using %@ at %@", @"D2D", v46, v13, v45];
  }
  else
  {
    if ((v16 & v18) == 1) {
      sub_10009A654();
    }
    id v20 = v14;
    if (v16)
    {
      id v21 = v15;
      v22 = @"iCloud";
    }
    else
    {
      if (!v18) {
        goto LABEL_38;
      }
      id v21 = v15;
      unsigned int v23 = [v8 encrypted];
      CFStringRef v24 = @"unencrypted";
      if (v23) {
        CFStringRef v24 = @"encrypted";
      }
      v22 = +[NSString stringWithFormat:@"%@ iTunes", v24];
      if (!v22) {
LABEL_38:
      }
        sub_10009A6AC();
    }
    uint64_t v25 = +[NSString stringWithFormat:@"Restored from an %@ backup of %@ created using %@ at %@", v22, v46, v13, v45];

    uint64_t v19 = v25;
    id v15 = v21;
    id v14 = v20;
  }
  if (!v19) {
    sub_10009A628();
  }
  v38 = (void *)v13;
  v49[0] = @"Reason";
  v49[1] = @"DidRestoreFromBackup";
  v37 = (void *)v19;
  v50[0] = v19;
  v50[1] = &__kCFBooleanTrue;
  v49[2] = @"DidMigrateBackupFromDifferentDevice";
  v26 = +[NSNumber numberWithInt:v10 ^ 1];
  v50[2] = v26;
  v49[3] = @"ShouldPreserveSettingsAfterRestore";
  v27 = +[NSNumber numberWithBool:v14];
  v50[3] = v27;
  v49[4] = @"WasPasscodeSetInBackup";
  v28 = +[NSNumber numberWithBool:v15];
  v50[4] = v28;
  v49[5] = @"RestoreFromBackupSourceiTunes";
  v29 = +[NSNumber numberWithBool:v18];
  v50[5] = v29;
  v49[6] = @"RestoreFromBackupSourceDeviceToDevice";
  v30 = +[NSNumber numberWithBool:v17];
  v50[6] = v30;
  v49[7] = @"DidRestoreFromCloudBackup";
  v31 = +[NSNumber numberWithBool:v16];
  v50[7] = v31;
  v32 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:8];
  id v33 = [v32 mutableCopy];

  if (v40) {
    [v33 setObject:v40 forKeyedSubscript:@"RestoredBackupBuildVersion"];
  }
  if (v39) {
    [v33 setObject:v39 forKeyedSubscript:@"RestoredBackupProductType"];
  }
  v34 = MBDeviceUUID();
  if (v34) {
    [v33 setObject:v34 forKeyedSubscript:@"BackupDeviceUUID"];
  }
  if (v41) {
    [v33 setObject:v41 forKeyedSubscript:@"RestoredBackupDeviceName"];
  }
  if (v16 && [v43 backupPolicy] == (id)1) {
    [v33 setObject:&__kCFBooleanTrue forKeyedSubscript:@"RestoredBackupIsMegaBackup"];
  }
  v35 = MBGetDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v33;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Setting data migration context: %@", buf, 0xCu);
    _MBLog();
  }

  DMSetContext();
  return 0;
}

- (void)_updateDeviceTransferInfoWithPlist:(id)a3
{
  id v3 = a3;
  v4 = +[MBPersona personalPersonaWithError:0];
  id v5 = [v4 copyPreferencesValueForKey:@"DeviceTransferInfo" class:objc_opt_class()];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 mutableCopy];
    v8 = [v7 objectForKeyedSubscript:@"RestoreStartDate"];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = +[NSDate date];
        [v9 timeIntervalSinceDate:v8];
        uint64_t v11 = (uint64_t)v10;

        v12 = +[NSNumber numberWithLongLong:v11];
        [v7 setObject:v12 forKeyedSubscript:@"RestoreDuration"];
      }
    }
    [v3 setObject:v7 forKeyedSubscript:@"DeviceTransferInfo"];
    uint64_t v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v15 = @"DeviceTransferInfo";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updated \"%{public}@\": %@", buf, 0x16u);
      _MBLog();
    }
  }
}

- (id)_updateMobileBackupPreferencesWithEngine:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  uint64_t v6 = [v4 persona];
  if (!v6) {
    sub_10009A6D8();
  }
  id v7 = (void *)v6;
  v67 = self;
  v70 = (void *)v6;
  v71 = v4;
  if ([v4 restoresPrimaryAccount])
  {
    v8 = [v7 userIncompleteRestoreDirectory];
    uint64_t v9 = [v8 stringByAppendingPathComponent:@"/var/mobile/Library/Preferences/com.apple.MobileBackup.plist"];

    id v10 = v9;
    uint64_t v11 = +[NSMutableDictionary dictionaryWithContentsOfFile:v10];
    if (v11)
    {
      v12 = (void *)v11;
      id v68 = 0;
      v69 = v5;
      id v72 = v10;
      v73 = v10;
      goto LABEL_17;
    }
    CFStringRef v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v85 = (uint64_t)v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MobileBackup preferences not found in backup at %{public}@", buf, 0xCu);
      id v64 = v10;
      _MBLog();
    }

    __int16 v16 = [v7 sharedIncompleteRestoreDirectory];
    uint64_t v17 = [v16 stringByAppendingPathComponent:@"/var/root/Library/Preferences/com.apple.MobileBackup.plist"];

    v12 = +[NSMutableDictionary dictionaryWithContentsOfFile:v17];
    v73 = (void *)v17;
    [v5 removeItemAtPath:v17 error:0];
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v85 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Trying to find MobileBackup preferences at %{public}@", buf, 0xCu);
      id v64 = (id)v17;
      _MBLog();
    }
  }
  else
  {
    uint64_t v13 = [v7 preferencesDirectory];
    id v14 = [v13 stringByAppendingPathComponent:@"com.apple.MobileBackup.plist"];

    v12 = +[NSMutableDictionary dictionaryWithContentsOfFile:v14];
    id v10 = v14;
    v73 = v10;
  }
  id v72 = v10;
  if (v12)
  {
    id v68 = 0;
    v69 = v5;
  }
  else
  {
    uint64_t v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v85 = (uint64_t)v73;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "MobileBackup preferences not found in backup at %{public}@", buf, 0xCu);
      id v64 = v73;
      _MBLog();
    }

    v74 = +[NSMutableDictionary dictionary];
    id v20 = [v10 stringByDeletingLastPathComponent];
    v91[0] = NSFileOwnerAccountName;
    v91[1] = NSFileGroupOwnerAccountName;
    v92[0] = @"mobile";
    v92[1] = @"mobile";
    id v21 = +[NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:2];
    id v82 = 0;
    unsigned __int8 v22 = [v5 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v21 error:&v82];
    id v23 = v82;

    if ((v22 & 1) == 0)
    {
      if (+[MBError codeForNSError:v23] != 3) {
        goto LABEL_50;
      }
      v38 = MBGetDefaultLog();
      v39 = v72;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v85 = (uint64_t)v20;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Removing existing file at %@", buf, 0xCu);
        id v64 = v20;
        _MBLog();
      }

      id v81 = v23;
      unsigned __int8 v40 = [v5 removeItemAtPath:v20 error:&v81];
      id v41 = v81;

      if ((v40 & 1) == 0)
      {
        v51 = +[MBError errorWithCode:1 error:v41 path:v20 format:@"Error removing file"];
        id v33 = v70;
        id v23 = v41;
        goto LABEL_75;
      }
      v89[0] = NSFileOwnerAccountName;
      v89[1] = NSFileGroupOwnerAccountName;
      v90[0] = @"mobile";
      v90[1] = @"mobile";
      v42 = +[NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:2];
      id v80 = v41;
      unsigned __int8 v43 = [v5 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v42 error:&v80];
      id v23 = v80;

      if ((v43 & 1) == 0)
      {
LABEL_50:
        v51 = +[MBError errorWithCode:1, v23, v20, @"Error creating directory", v64 error path format];
        id v33 = v70;
        v39 = v72;
        goto LABEL_75;
      }
    }
    v69 = v5;

    id v68 = v23;
    v12 = v74;
  }
LABEL_17:
  +[NSSet setWithObjects:](NSSet, "setWithObjects:", @"DebugContext", @"Options", @"DisabledDomains", @"AllowiTunesBackup", @"EnableBackupScheduling", @"BackupEnabledForMegaBackup", @"SyncSettingsEnabledForMegaBackup", @"BackupDomainsEnabledForMegaBackup", @"EnableBackupOnCellular", @"MegaBackupTurnOnAllAppsSync", @"MegaBackupTurnOniCloudBackup", @"SyncSettingsEnabledForMegaBackup", @"MegaBackupEntryPoint", @"MegaBackupFlowStartDate", @"EnterPrebuddyUIDateDelta", @"InitialMegaBackupStartDateDelta", @"InitialMegaBackupFinishedDateDelta",
    @"RestoreAfterMegaBackupDateDelta",
    @"RestoreFinishedAfterMegaBackupDateDelta",
    @"MegaBackupRefreshDelta",
    @"PrebuddyFlowStep",
    @"MegaBackupSourceDeviceUUID",
  id v20 = 0);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v74 = v12;
  CFStringRef v24 = [v12 allKeys];
  id v25 = [v24 countByEnumeratingWithState:&v76 objects:v88 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v77;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v77 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        unsigned int v30 = [v20 containsObject:v29, v65];
        v31 = MBGetDefaultLog();
        BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
        if (v30)
        {
          if (v32)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v85 = (uint64_t)v29;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Restoring MobileBackup preference: %{public}@", buf, 0xCu);
            v65 = v29;
            _MBLog();
          }
        }
        else
        {
          if (v32)
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v85 = (uint64_t)v29;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Not restoring MobileBackup preference: %{public}@", buf, 0xCu);
            v65 = v29;
            _MBLog();
          }

          [v74 removeObjectForKey:v29];
        }
      }
      id v26 = [v24 countByEnumeratingWithState:&v76 objects:v88 count:16];
    }
    while (v26);
  }

  id v4 = v71;
  id v33 = v70;
  if ([v71 isCloudKitEngine])
  {
    if ([v71 conformsToProtocol:&OBJC_PROTOCOL___MBHasServiceAccount])
    {
      v34 = [v71 serviceAccount];

      if (v34)
      {
        if ([v71 restoresPrimaryAccount])
        {
          v35 = [v70 userIncompleteRestoreDirectory];
          v36 = [v70 skippedFileRecordsPlistPath];
          v37 = [v35 stringByAppendingPathComponent:v36];
        }
        else
        {
          v37 = [v70 skippedFileRecordsPlistPath];
        }
        if (objc_msgSend(v69, "fileExistsAtPath:", v37, v65))
        {
          v44 = MBGetDefaultLog();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v85 = (uint64_t)v37;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Copying skipped file records plist (%@) to preferences", buf, 0xCu);
            v66 = v37;
            _MBLog();
          }

          v45 = v37;
          v46 = +[NSData dataWithContentsOfFile:v45];
          if (v46)
          {
            id v83 = 0;
            v47 = +[NSPropertyListSerialization propertyListWithData:v46 options:0 format:0 error:&v83];
            id v48 = v83;
            v49 = v48;
            if (!v47 || v48)
            {
              v52 = MBGetDefaultLog();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v85 = (uint64_t)v49;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "NSPropertyListSerialization failed %@", buf, 0xCu);
                v66 = v49;
                _MBLog();
              }

              id v50 = 0;
            }
            else
            {
              id v50 = v47;
            }
          }
          else
          {
            v49 = MBGetDefaultLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v85 = (uint64_t)v45;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "dataWithContentsOfFile returned nil for path %@", buf, 0xCu);
              v66 = v45;
              _MBLog();
            }
            id v50 = 0;
          }

          if (v50) {
            [v74 setObject:v50 forKeyedSubscript:@"RestoredFilesSkippedFromBackup"];
          }
          id v75 = 0;
          unsigned __int8 v53 = [v69 removeItemAtPath:v45 error:&v75];
          id v54 = v75;
          if ((v53 & 1) == 0)
          {
            v55 = MBGetDefaultLog();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v85 = (uint64_t)v45;
              __int16 v86 = 2112;
              id v87 = v54;
              _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Failed to remove skipped file records plist %@ %@", buf, 0x16u);
              _MBLog();
            }
          }
        }
      }
    }
  }
  id v56 = objc_alloc_init((Class)MBRestoreInfo);
  v57 = +[NSDate date];
  [v56 setDate:v57];

  [v56 setWasCloudRestore:[v71 isServiceEngine]];
  v58 = [v71 properties];
  v59 = [v58 buildVersion];
  [v56 setBackupBuildVersion:v59];

  v60 = MBBuildVersion();
  [v56 setDeviceBuildVersion:v60];

  v61 = [v56 dictionaryRepresentation];
  [v74 setObject:v61 forKeyedSubscript:@"RestoreInfo"];

  id v5 = v69;
  if ([v71 isDeviceTransferEngine]) {
    [(MBDataMigratorPlugin *)v67 _updateDeviceTransferInfoWithPlist:v74];
  }
  v62 = MBGetDefaultLog();
  v39 = v72;
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v85 = (uint64_t)v72;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Writing out trimmed MobileBackup plist at %@", buf, 0xCu);
    _MBLog();
  }

  if ([v74 writeToFile:v72 atomically:1])
  {
    v51 = 0;
  }
  else
  {
    v51 = +[MBError errorWithCode:1 path:v73 format:@"Error saving MobileBackup preferences"];
  }

  id v23 = v68;
LABEL_75:

  return v51;
}

- (id)_restoreDefaultsWithEngine:(id)a3
{
  id v28 = a3;
  id v3 = [v28 persona];
  id v4 = [v3 copyPreferencesValueForKey:@"RestoredDefaults" class:objc_opt_class()];

  if (v4)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v4;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v31;
      id v27 = v5;
      do
      {
        uint64_t v9 = 0;
        id v29 = v7;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v9);
          uint64_t v11 = [v5 objectForKeyedSubscript:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v12 = [v10 componentsSeparatedByString:@":"];
            id v13 = [v12 count];
            id v14 = [v12 objectAtIndexedSubscript:0];
            if (v13 == (id)1)
            {
              CFStringRef v15 = @".GlobalPreferences";
            }
            else
            {
              [v12 objectAtIndexedSubscript:1];
              CFStringRef v15 = v14;
              id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            __int16 v16 = MBGetDefaultLog();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v35 = v15;
              __int16 v36 = 2112;
              v37 = v10;
              __int16 v38 = 2112;
              v39 = v11;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Restoring default %@ %@ = %@", buf, 0x20u);
              _MBLog();
            }

            uint64_t v17 = [v28 persona];
            id v18 = [v17 userRestoreDirectory];
            uint64_t v19 = [v18 stringByAppendingFormat:@"/var/mobile/Library/Preferences/%@.plist", v15];

            id v20 = +[NSMutableDictionary dictionaryWithContentsOfFile:v19];
            if (!v20)
            {
              id v20 = +[NSMutableDictionary dictionary];
            }
            [v20 setObject:v11 forKeyedSubscript:v14];
            [v20 writeToFile:v19 atomically:1];
            id v21 = v19;
            unsigned __int8 v22 = (const char *)[v21 fileSystemRepresentation];
            uid_t v23 = MBMobileUID();
            gid_t v24 = MBMobileUID();
            lchown(v22, v23, v24);

            id v5 = v27;
            id v7 = v29;
          }

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v30 objects:v40 count:16];
      }
      while (v7);
    }

    id v4 = v26;
  }

  return 0;
}

+ (BOOL)setUpMobileBackupPreferencesForBackgroundRestoreWithAccount:(id)a3 restoreSession:(id)a4 cloudFormatInfo:(id)a5 performanceStatistics:(id)a6 backupPolicy:(int64_t)a7 error:(id *)a8
{
  return 1;
}

@end