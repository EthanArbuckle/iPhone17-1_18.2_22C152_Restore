@interface MBDriveRestoreDomainManagerDelegate
+ (id)domainForName:(id)a3 containerID:(id)a4 engine:(id)a5;
@end

@implementation MBDriveRestoreDomainManagerDelegate

+ (id)domainForName:(id)a3 containerID:(id)a4 engine:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 persona];
  if (!v10) {
    sub_10009A730();
  }
  if (!v8) {
    sub_10009A75C();
  }
  v11 = (void *)v10;
  if (+[MBDomain isSystemContainerName:v7])
  {
    v12 = [v11 systemContainerRestoreRootWithContainerID:v8];
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v7;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "=drive-domain-delegate= Creating system container domain for %@ at %@", buf, 0x16u);
      _MBLog();
    }

    v14 = [v11 systemContainersVolumeMountPoint];
    uint64_t v15 = +[MBDomain systemContainerDomainWithIdentifier:v8 volumeMountPoint:v14 rootPath:v12];
LABEL_11:
    v17 = (void *)v15;

    v18 = +[NSSet set];
    [v17 setRelativePathsToBackupAndRestore:v18];

    v19 = +[NSSet setWithObject:&stru_1000F43B0];
    [v17 setRelativePathsToRestoreOnly:v19];

    [v17 setShouldDigest:0];
LABEL_12:

    goto LABEL_13;
  }
  if (+[MBDomain isSystemSharedContainerName:v7])
  {
    v12 = [v11 sharedSystemContainerRestoreRootWithContainerID:v8];
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v31 = v7;
      __int16 v32 = 2112;
      v33 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "=drive-domain-delegate= Creating system shared container domain for %@ at %@", buf, 0x16u);
      _MBLog();
    }

    v14 = [v11 systemContainersVolumeMountPoint];
    uint64_t v15 = +[MBDomain systemSharedContainerDomainWithIdentifier:v8 volumeMountPoint:v14 rootPath:v12];
    goto LABEL_11;
  }
  v21 = [v9 settingsContext];
  unsigned int v22 = [v21 shouldRestoreAppWithID:v8];

  if (v22)
  {
    v23 = [v9 manifest];
    v24 = [v23 properties];
    v12 = [v24 containerWithIdentifier:v8];

    if (v12)
    {
      v25 = [v9 appManager];
      v26 = [v25 containerWithIdentifier:v8];

      if (v26)
      {
        v17 = [v26 domain];
      }
      else
      {
        v27 = [v9 appManager];
        id v29 = 0;
        v26 = [v27 createSafeHarborForContainer:v12 withPersona:v11 error:&v29];
        id v28 = v29;

        if (!v26) {
          objc_exception_throw([objc_alloc((Class)MBException) initWithCode:1, @"Error creating safe harbor for %@: %@", v8, v28 format]);
        }
        v17 = [v26 domain];
      }
    }
    else
    {
      v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "=drive-domain-delegate= Container domain %@ without an entry in manifest properties", buf, 0xCu);
        _MBLog();
      }
      v17 = 0;
    }

    goto LABEL_12;
  }
  v17 = +[MBDomain uninstalledDomainWithName:v7];
LABEL_13:

  return v17;
}

@end