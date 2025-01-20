@interface MBServiceRestoreDomainManagerDelegate
+ (id)domainForName:(id)a3 containerID:(id)a4 engine:(id)a5;
@end

@implementation MBServiceRestoreDomainManagerDelegate

+ (id)domainForName:(id)a3 containerID:(id)a4 engine:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v8 && ([v7 isEqualToString:@"SkippedFilesDomain"] & 1) == 0) {
    objc_exception_throw([objc_alloc((Class)MBException) initWithCode:11, @"Unknown domain: %@", v7 format]);
  }
  v10 = [v9 persona];
  if (!v10) {
    __assert_rtn("+[MBServiceRestoreDomainManagerDelegate domainForName:containerID:engine:]", "MBServiceRestoreDomainManagerDelegate.m", 24, "persona");
  }
  v11 = v10;
  v12 = [v10 volumeMountPoint];
  if (+[MBDomain isAppPlaceholderName:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = @"/var/mobile/Library/Backup/AppPlaceholders";
    }
    else
    {
      v13 = [v11 placeholderRestoreDirectory];
      if (!v13) {
        __assert_rtn("+[MBServiceRestoreDomainManagerDelegate domainForName:containerID:engine:]", "MBServiceRestoreDomainManagerDelegate.m", 34, "placeholderRestoreDirectory");
      }
    }
    v17 = [(__CFString *)v13 stringByAppendingPathComponent:v8];
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v7;
      __int16 v34 = 2112;
      v35 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating placeholder domain for %@ (%@)", buf, 0x16u);
      id v30 = v7;
      v31 = v17;
      _MBLog();
    }

    uint64_t v19 = +[MBDomain appPlaceholderDomainWithIdentifier:v8 volumeMountPoint:v12 rootPath:v17];
LABEL_15:
    v20 = (void *)v19;
    v21 = +[NSSet set];
    [v20 setRelativePathsToBackupAndRestore:v21];

    v22 = +[NSSet setWithObject:&stru_100418BA8];
    [v20 setRelativePathsToRestoreOnly:v22];

LABEL_21:
    goto LABEL_22;
  }
  if (+[MBDomain isSystemContainerName:v7])
  {
    v13 = [v11 systemContainerRestoreRootWithContainerID:v8];
    v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v7;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating system container domain for %@ at %@", buf, 0x16u);
      _MBLog();
    }

    v15 = [v11 systemContainersVolumeMountPoint];
    uint64_t v16 = +[MBDomain systemContainerDomainWithIdentifier:v8 volumeMountPoint:v15 rootPath:v13];
LABEL_20:
    v20 = (void *)v16;

    v24 = +[NSSet set];
    [v20 setRelativePathsToBackupAndRestore:v24];

    v17 = +[NSSet setWithObject:&stru_100418BA8];
    [v20 setRelativePathsToRestoreOnly:v17];
    goto LABEL_21;
  }
  if (+[MBDomain isSystemSharedContainerName:v7])
  {
    v13 = [v11 sharedSystemContainerRestoreRootWithContainerID:v8];
    v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v7;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating system shared container domain for %@ at %@", buf, 0x16u);
      _MBLog();
    }

    v15 = [v11 systemContainersVolumeMountPoint];
    uint64_t v16 = +[MBDomain systemSharedContainerDomainWithIdentifier:v8 volumeMountPoint:v15 rootPath:v13];
    goto LABEL_20;
  }
  if ([v7 isEqualToString:@"SkippedFilesDomain"])
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating skipped files domain", buf, 2u);
      _MBLog();
    }

    v13 = [v11 skippedFileRecordsPlistPath];
    v17 = [(__CFString *)v13 stringByDeletingLastPathComponent];
    uint64_t v19 = +[MBDomain skippedFilesDomainWithVolumeMountPoint:v12 rootPath:v17];
    goto LABEL_15;
  }
  v27 = [v9 appManager];
  v13 = [v27 containerWithIdentifier:v8];

  v28 = MBGetDefaultLog();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (v29)
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating uninstalled container domain for %@", buf, 0xCu);
      _MBLog();
    }

    v17 = +[MBContainer uninstalledContainerWithDomainName:v7 volumeMountPoint:v12];
    v20 = [(__CFString *)v17 domain];
    goto LABEL_21;
  }
  if (v29)
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v7;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "=cloud-domain-delegate= Creating container domain for %@", buf, 0xCu);
    _MBLog();
  }

  v20 = [(__CFString *)v13 domain];
LABEL_22:

  return v20;
}

@end