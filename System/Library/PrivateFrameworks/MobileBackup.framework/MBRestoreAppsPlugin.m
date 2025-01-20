@interface MBRestoreAppsPlugin
- (id)endedBackupWithEngine:(id)a3 error:(id)a4;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (id)startingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
@end

@implementation MBRestoreAppsPlugin

- (id)startingBackupWithEngine:(id)a3
{
  id v3 = a3;
  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:@"/var/root/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist"];

  if (!v5)
  {
    v8 = 0;
    goto LABEL_10;
  }
  v6 = +[NSFileManager defaultManager];
  id v97 = 0;
  unsigned __int8 v7 = [v6 removeItemAtPath:@"/var/root/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist" error:&v97];
  v8 = v97;

  v9 = MBGetDefaultLog();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deleted demoted apps plist written to the old and outdated path", buf, 2u);
LABEL_8:
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v103 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Couldn't delete demoted apps plist written to the old and outdated path - %@", buf, 0xCu);
    v79 = v8;
    goto LABEL_8;
  }

LABEL_10:
  v11 = objc_alloc_init(MBIgnoredAccountsTracker);
  v12 = +[NSMutableArray array];
  v13 = +[NSMutableArray array];
  v14 = [v3 persona];
  v15 = [v14 personaIdentifier];

  v16 = [v3 persona];
  v17 = [v16 demotedAppsPlistPath];

  if ([v3 conformsToProtocol:&OBJC_PROTOCOL___MBHasServiceAccount])
  {
    v18 = [v3 serviceAccount];
    v19 = v18;
    if (v18) {
      unsigned int v20 = [v18 isPrimaryAccount];
    }
    else {
      unsigned int v20 = 1;
    }
  }
  else
  {
    unsigned int v20 = 1;
  }
  v21 = MBGetDefaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v103 = v15;
    __int16 v104 = 1024;
    *(_DWORD *)v105 = v20;
    *(_WORD *)&v105[4] = 2112;
    *(void *)&v105[6] = v17;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Fetching demoted apps for persona %{public}@ (%d) (%@)", buf, 0x1Cu);
    uint64_t v80 = v20;
    v81 = v17;
    v79 = v15;
    _MBLog();
  }

  if (!v17) {
    __assert_rtn("-[MBRestoreAppsPlugin startingBackupWithEngine:]", "MBRestoreAppsPlugin.m", 54, "demotedAppsPlistPath");
  }
  if (v15) {
    char v22 = 1;
  }
  else {
    char v22 = v20;
  }
  if ((v22 & 1) == 0) {
    __assert_rtn("-[MBRestoreAppsPlugin startingBackupWithEngine:]", "MBRestoreAppsPlugin.m", 55, "isPrimaryAccount || personaIdentifier");
  }
  v24 = +[LSApplicationWorkspace defaultWorkspace];
  v91[0] = _NSConcreteStackBlock;
  v91[1] = 3221225472;
  v91[2] = sub_10005CB24;
  v91[3] = &unk_100411018;
  char v96 = v20;
  v25 = v15;
  v92 = v25;
  v26 = v11;
  v93 = v26;
  id v27 = v12;
  id v94 = v27;
  id v28 = v13;
  id v95 = v28;
  [v24 enumerateBundlesOfType:0 block:v91];

  v29 = +[NSMutableDictionary dictionary];
  v86 = v29;
  if ([v28 count])
  {
    [v29 setObject:v28 forKeyedSubscript:@"IntentionalDowngrades"];
    if (![v27 count])
    {
LABEL_28:
      id v30 = v3;
      v31 = v8;
      id v90 = 0;
      v32 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v29, 200, 0, &v90, v79);
      v33 = v90;
      v34 = v33;
      if (v32)
      {
        id v85 = v27;
        v89 = v33;
        unsigned __int8 v35 = [v32 writeToFile:v17 options:268435457 error:&v89];
        v36 = v89;

        if (v35)
        {
          v82 = v26;
          v83 = v25;
          uint64_t v37 = MBMobileUID();
          v100[0] = NSFileOwnerAccountID;
          v38 = +[NSNumber numberWithUnsignedInt:v37];
          v101[0] = v38;
          v100[1] = NSFileGroupOwnerAccountID;
          v39 = +[NSNumber numberWithUnsignedInt:v37];
          v101[1] = v39;
          v100[2] = NSFilePosixPermissions;
          v40 = +[NSNumber numberWithUnsignedShort:384];
          v101[2] = v40;
          v41 = +[NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:3];

          v42 = +[NSFileManager defaultManager];
          [v42 setAttributes:v41 ofItemAtPath:v17 error:0];

          v43 = MBGetDefaultLog();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v103 = v17;
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Wrote out demoted apps plist to:%@", buf, 0xCu);
            v79 = v17;
            _MBLog();
          }

          v8 = v31;
          id v3 = v30;
          v26 = v82;
          v25 = v83;
          goto LABEL_50;
        }
        v44 = MBGetDefaultLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v103 = v17;
          __int16 v104 = 2112;
          *(void *)v105 = v36;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to write demoted app plists at %@: %@", buf, 0x16u);
          _MBLog();
        }
        v34 = v36;
        id v27 = v85;
      }
      else
      {
        v44 = MBGetDefaultLog();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v103 = v34;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to serialize demoted apps:%@", buf, 0xCu);
          _MBLog();
        }
      }

      id v45 = 0;
      v8 = v31;
      id v3 = v30;
LABEL_39:
      v46 = v86;
      goto LABEL_64;
    }
LABEL_27:
    objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, @"AutomaticDowngrades", v79, v80, v81);
    goto LABEL_28;
  }
  if ([v27 count]) {
    goto LABEL_27;
  }
  id v85 = v27;
  v47 = MBGetDefaultLog();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "No demoted apps found on device. Skipping", buf, 2u);
    _MBLog();
  }

  v48 = +[NSFileManager defaultManager];
  unsigned int v49 = [v48 fileExistsAtPath:v17];

  if (v49)
  {
    v50 = v25;
    v51 = +[NSFileManager defaultManager];
    v88 = v8;
    unsigned __int8 v52 = [v51 removeItemAtPath:v17 error:&v88];
    v53 = v88;

    v54 = MBGetDefaultLog();
    v36 = v54;
    if (v52)
    {
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Removed demoted apps plist made from a previous backup because there are no more demoted apps in the ongoing one", buf, 2u);
LABEL_48:
        _MBLog();
      }
    }
    else if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v103 = v53;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Couldn't delete demoted apps plist written to the new path during a previous backup - %@", buf, 0xCu);
      v79 = v53;
      goto LABEL_48;
    }
    v8 = v53;
    v25 = v50;
LABEL_50:
  }
  v55 = copyfile_state_alloc();
  v56 = copyfile((const char *)[@"/var/installd/Library/MobileInstallation/BackedUpState/SystemAppInstallState.plist" fileSystemRepresentation], (const char *)objc_msgSend(@"/var/installd/Library/MobileInstallation/BackedUpState/BackupSystemAppInstallState.plist", "fileSystemRepresentation"), v55, 0xEu);
  if (v56)
  {
    v57 = v56;
    v58 = MBGetDefaultLog();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v103) = v57;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "Failed to copy system app plist: %{errno}d", buf, 8u);
      v79 = v57;
      uint64_t v80 = *__error();
      _MBLog();
    }
  }
  copyfile_state_free(v55);
  if (![v3 isDeviceTransferEngine])
  {
    v67 = 0;
LABEL_60:
    id v27 = v85;
    v46 = v86;
    id v45 = v67;
    goto LABEL_64;
  }
  v84 = v25;
  v59 = v3;
  v60 = v8;
  v61 = +[NSFileManager defaultManager];
  v98[0] = NSFileOwnerAccountName;
  v98[1] = NSFileGroupOwnerAccountName;
  v99[0] = @"mobile";
  v99[1] = @"mobile";
  v62 = +[NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];
  id v87 = 0;
  unsigned __int8 v63 = [v61 createDirectoryAtPath:@"/var/mobile/Media/iTunesRestore" withIntermediateDirectories:1 attributes:v62 error:&v87];
  id v64 = v87;

  if (v63)
  {
    v65 = +[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", [@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" fileSystemRepresentation], 0, 0);
    v66 = MBWriteRestoreAppsPlist(v65);

    id v27 = v85;
    if (v66)
    {
      id v45 = v66;

      v8 = v60;
      id v3 = v59;
      v25 = v84;
      goto LABEL_39;
    }
    v71 = (const char *)[@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" fileSystemRepresentation];
    uid_t v72 = MBMobileUID();
    gid_t v73 = MBMobileUID();
    v8 = v60;
    v25 = v84;
    if (lchown(v71, v72, v73))
    {
      v67 = +[MBError posixErrorWithPath:@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" format:@"lchown failed"];
      id v3 = v59;
    }
    else
    {
      id v3 = v59;
      v74 = [v59 domainManager];
      v75 = [v74 domainForName:@"MediaDomain"];

      v76 = objc_opt_new();
      [v76 addObject:@"Media/iTunesRestore/RestoreApplications.plist"];
      v77 = [v75 relativePathsToBackupAndRestore];

      if (v77)
      {
        v78 = [v75 relativePathsToBackupAndRestore];
        [v76 unionSet:v78];
      }
      objc_msgSend(v75, "setRelativePathsToBackupAndRestore:", v76, v79, v80);

      v67 = 0;
      v25 = v84;
    }

    goto LABEL_60;
  }
  v68 = MBGetDefaultLog();
  v46 = v86;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    v69 = [@"/var/mobile/Media/iTunesRestore" fileSystemRepresentation];
    *(_DWORD *)buf = 136315394;
    v103 = v69;
    __int16 v104 = 2112;
    *(void *)v105 = v64;
    _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Failed to create directory at %s: %@", buf, 0x16u);
    [@"/var/mobile/Media/iTunesRestore" fileSystemRepresentation];
    _MBLog();
  }

  id v45 = v64;
  v8 = v60;
  id v3 = v59;
  v25 = v84;
  id v27 = v85;
LABEL_64:

  return v45;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  if ([a3 isDeviceTransferEngine])
  {
    v4 = +[NSFileManager defaultManager];
    id v9 = 0;
    unsigned __int8 v5 = [v4 removeItemAtPath:@"/var/mobile/Media/iTunesRestore/RestoreApplications.plist" error:&v9];
    id v6 = v9;

    if ((v5 & 1) == 0)
    {
      unsigned __int8 v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v11 = @"/var/mobile/Media/iTunesRestore";
        __int16 v12 = 2112;
        id v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to remove file at: %@ - %@", buf, 0x16u);
        _MBLog();
      }
    }
  }
  return 0;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v4 = a4;
  if ([v4 restoresPrimaryAccount]
    && [v4 isDeviceTransferEngine])
  {
    unsigned __int8 v5 = [v4 domainManager];
    id v6 = [v5 domainForName:@"MediaDomain"];

    unsigned __int8 v7 = objc_opt_new();
    [v7 addObject:@"Media/iTunesRestore/RestoreApplications.plist"];
    v8 = [v6 relativePathsToBackupAndRestore];

    if (v8)
    {
      id v9 = [v6 relativePathsToBackupAndRestore];
      [v7 unionSet:v9];
    }
    [v6 setRelativePathsToBackupAndRestore:v7];
  }
  return 0;
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  id v4 = a4;
  if ([v4 restoresPrimaryAccount])
  {
    unsigned __int8 v5 = [v4 persona];
    id v6 = [v5 userIncompleteRestoreDirectory];

    unsigned __int8 v7 = +[NSString stringWithFormat:@"%@%@", v6, @"/var/mobile/Library/Preferences/com.apple.MobileBackup.DemotedApps.plist"];
    if (!MBIsInternalInstall()) {
      goto LABEL_11;
    }
    v8 = +[NSFileManager defaultManager];
    unsigned int v9 = [v8 fileExistsAtPath:v7];

    if (!v9) {
      goto LABEL_11;
    }
    v10 = +[NSFileManager defaultManager];
    id v16 = 0;
    unsigned __int8 v11 = [v10 copyItemAtPath:v7 toPath:@"/var/mobile/Library/Logs/MobileBackup/DemotedAppsCopy.plist" error:&v16];
    __int16 v12 = (__CFString *)v16;

    id v13 = MBGetDefaultLog();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v18 = @"/var/mobile/Library/Logs/MobileBackup/DemotedAppsCopy.plist";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Demoted app plist copied successfully to: %@", buf, 0xCu);
LABEL_9:
        _MBLog();
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Unable to copy demoted app plist: %@", buf, 0xCu);
      goto LABEL_9;
    }

LABEL_11:
  }

  return 0;
}

@end