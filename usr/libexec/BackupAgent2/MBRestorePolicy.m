@interface MBRestorePolicy
- (BOOL)_isCloudKitEngine;
- (BOOL)_isDeviceTransferEngine;
- (BOOL)_isDriveEngine;
- (BOOL)_isDriveOrMegaBackupPolicy;
- (BOOL)_isEncrypted;
- (BOOL)_isForegroundRestore;
- (BOOL)_isMegaBackup;
- (BOOL)_isServiceEngine;
- (BOOL)_pluginsAllowForegroundRestoreFile:(id)a3;
- (BOOL)isRestoringPrimaryAccount;
- (BOOL)isRestoringToSameDevice;
- (BOOL)shouldAlwaysRestoreSystemSharedContainerDomain:(id)a3;
- (BOOL)shouldCreateMissingIntermediateDirectories;
- (BOOL)shouldForegroundRestoreDomain:(id)a3;
- (BOOL)shouldRemoveAndRetryPlacingAssetsForRestorable:(id)a3;
- (BOOL)shouldRestoreFile:(id)a3 markFileAsSkipped:(BOOL *)a4 error:(id *)a5;
- (BOOL)shouldRestoreSystemFile:(id)a3;
- (MBPersona)persona;
- (MBRestorePolicy)initWithPersona:(id)a3 enginePolicyProvider:(id)a4 appManager:(id)a5 plugins:(id)a6 serviceRestoreMode:(id)a7 osBuildVersionOfBackup:(id)a8 shouldRestoreSystemFiles:(BOOL)a9 isRestoringPrimaryAccount:(BOOL)a10 shouldCreateMissingIntermediateDirectories:(BOOL)a11;
- (MBServiceRestoreMode)serviceRestoreMode;
- (NSSet)domainNamesToForegroundInstall;
- (NSString)osBuildVersionOfBackup;
- (id)_localRootPathForDomain:(id)a3;
- (id)deprecated_validateFile:(id)a3 debugContext:(id)a4;
- (id)deriveATCPolicy;
- (id)destinationPathForRestorable:(id)a3 safeHarborDir:(id)a4;
- (id)notifyPluginsEndedRestoreWithEngine:(id)a3 error:(id)a4;
- (id)notifyPluginsEndingRestoreWithEngine:(id)a3;
- (id)notifyPluginsPreparingRestoreWithEngine:(id)a3;
- (id)notifyPluginsStartingRestoreWithEngine:(id)a3;
- (id)restoreRootForDomain:(id)a3;
- (id)validateRestoreDomain:(id)a3 relativePath:(id)a4;
- (int)restoreType;
- (int64_t)restoreBehaviorForDomain:(id)a3 error:(id *)a4;
- (int64_t)restoreBehaviorForFile:(id)a3 debugContext:(id)a4 error:(id *)a5;
- (int64_t)restoreBehaviorForFile:(id)a3 withValidation:(BOOL)a4 debugContext:(id)a5 error:(id *)a6;
- (unint64_t)_enginePolicy;
- (unint64_t)foregroundStateForRestorable:(id)a3;
- (void)setDomainNamesToForegroundRestore:(id)a3;
@end

@implementation MBRestorePolicy

- (MBRestorePolicy)initWithPersona:(id)a3 enginePolicyProvider:(id)a4 appManager:(id)a5 plugins:(id)a6 serviceRestoreMode:(id)a7 osBuildVersionOfBackup:(id)a8 shouldRestoreSystemFiles:(BOOL)a9 isRestoringPrimaryAccount:(BOOL)a10 shouldCreateMissingIntermediateDirectories:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v28 = a7;
  id v22 = a8;
  if (!v18) {
    sub_10009A260();
  }
  if (!v20) {
    sub_10009A28C();
  }
  v23 = v22;
  v29.receiver = self;
  v29.super_class = (Class)MBRestorePolicy;
  v24 = [(MBRestorePolicy *)&v29 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_persona, a3);
    objc_storeWeak((id *)&v25->_enginePolicyProvider, v19);
    v25->_enginePolicy = 0;
    objc_storeStrong((id *)&v25->_appManager, a5);
    if (v21) {
      v26 = v21;
    }
    else {
      v26 = &__NSArray0__struct;
    }
    objc_storeStrong((id *)&v25->_plugins, v26);
    objc_storeStrong((id *)&v25->_serviceRestoreMode, a7);
    objc_storeStrong((id *)&v25->_osBuildVersionOfBackup, a8);
    v25->_shouldRestoreSystemFiles = a9;
    v25->_isRestoringPrimaryAccount = a10;
    v25->_shouldCreateMissingIntermediateDirectories = a11;
  }

  return v25;
}

- (id)deriveATCPolicy
{
  v3 = [MBRestorePolicy alloc];
  persona = self->_persona;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enginePolicyProvider);
  BYTE2(v8) = 1;
  BYTE1(v8) = self->_isRestoringPrimaryAccount;
  LOBYTE(v8) = self->_shouldRestoreSystemFiles;
  v6 = -[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:](v3, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:", persona, WeakRetained, self->_appManager, self->_plugins, self->_serviceRestoreMode, self->_osBuildVersionOfBackup, v8);

  return v6;
}

- (unint64_t)_enginePolicy
{
  unint64_t result = self->_enginePolicy;
  if (!result)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_enginePolicyProvider);
    self->_enginePolicy = (unint64_t)[WeakRetained enginePolicy];

    unint64_t result = self->_enginePolicy;
    if (!result) {
      sub_10009A2B8();
    }
  }
  return result;
}

- (BOOL)isRestoringToSameDevice
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 7) & 1;
}

- (BOOL)_isCloudKitEngine
{
  return [(MBRestorePolicy *)self _enginePolicy] & 1;
}

- (BOOL)_isDriveEngine
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 1) & 1;
}

- (BOOL)_isServiceEngine
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 3) & 1;
}

- (BOOL)_isDeviceTransferEngine
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 2) & 1;
}

- (BOOL)_isMegaBackup
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 5) & 1;
}

- (BOOL)_isEncrypted
{
  return ([(MBRestorePolicy *)self _enginePolicy] >> 4) & 1;
}

- (BOOL)_isDriveOrMegaBackupPolicy
{
  if ([(MBRestorePolicy *)self _isDriveEngine]) {
    return 1;
  }

  return [(MBRestorePolicy *)self _isMegaBackup];
}

- (int)restoreType
{
  serviceRestoreMode = self->_serviceRestoreMode;
  if (serviceRestoreMode && (unsigned int v3 = [(MBServiceRestoreMode *)serviceRestoreMode type] - 1, v3 <= 6)) {
    return dword_1000B0E58[v3];
  }
  else {
    return 1;
  }
}

- (BOOL)_isForegroundRestore
{
  return [(MBRestorePolicy *)self restoreType] == 1;
}

- (BOOL)shouldForegroundRestoreDomain:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_domainNamesToForegroundInstall containsObject:v4]
    || !+[MBDomain isContainerizedName:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"];
  }

  return v5;
}

- (void)setDomainNamesToForegroundRestore:(id)a3
{
}

- (unint64_t)foregroundStateForRestorable:(id)a3
{
  char v8 = 0;
  id v7 = 0;
  unsigned __int8 v3 = [(MBRestorePolicy *)self shouldRestoreFile:a3 markFileAsSkipped:&v8 error:&v7];
  id v4 = v7;
  unint64_t v5 = 0;
  if ((v3 & 1) == 0)
  {
    if (+[MBError isError:v4 withCode:213])
    {
      unint64_t v5 = 3;
    }
    else if (v8)
    {
      unint64_t v5 = 2;
    }
    else
    {
      unint64_t v5 = 6;
    }
  }

  return v5;
}

- (id)restoreRootForDomain:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MBRestorePolicy *)self persona];
  v6 = [v4 rootPath];
  if ([(MBServiceRestoreMode *)self->_serviceRestoreMode type] == 6)
  {
    if ([v4 isBackupDomain])
    {
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "=restore-policy= Restoring BackupDomain for EDS persona in-place at %@", buf, 0xCu);
LABEL_11:
        _MBLog();
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    if ([v4 isPlaceholderAppDomain])
    {
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "=restore-policy= Restoring legacy placeholder for EDS persona in-place at %@", buf, 0xCu);
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ([(MBServiceRestoreMode *)self->_serviceRestoreMode type])
  {
LABEL_13:
    id v9 = v6;
    goto LABEL_16;
  }
  if (![v4 shouldRestoreToSharedVolume])
  {
LABEL_14:
    char v8 = [v5 userIncompleteRestoreDirectory];
    goto LABEL_15;
  }
  char v8 = [v5 sharedIncompleteRestoreDirectory];
LABEL_15:
  v10 = v8;
  id v9 = [v8 stringByAppendingPathComponent:v6];

LABEL_16:

  return v9;
}

- (id)destinationPathForRestorable:(id)a3 safeHarborDir:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MBServiceRestoreMode *)self->_serviceRestoreMode type] == 6)
  {
    char v8 = [v6 domain];
    if (([v8 isBackupDomain] & 1) != 0
      || [v8 isPlaceholderAppDomain])
    {
      id v9 = [v6 absolutePath];
LABEL_15:

      goto LABEL_16;
    }
    v12 = [(MBRestorePolicy *)self persona];
    v10 = v12;
    goto LABEL_12;
  }
  if ([(MBRestorePolicy *)self _isForegroundRestore])
  {
    char v8 = [(MBRestorePolicy *)self persona];
    v10 = [v6 domain];
    if ([v10 shouldRestoreToSharedVolume])
    {
      uint64_t v11 = [v8 sharedIncompleteRestoreDirectory];
LABEL_13:
      v13 = (void *)v11;
      v14 = [v6 absolutePath];
      id v9 = [v13 stringByAppendingPathComponent:v14];

      goto LABEL_14;
    }
    v12 = v8;
LABEL_12:
    uint64_t v11 = [v12 userIncompleteRestoreDirectory];
    goto LABEL_13;
  }
  if ([v7 length])
  {
    char v8 = [v7 stringByAppendingPathComponent:kMBSafeHarborDataDirName];
    v10 = [v6 relativePath];
    id v9 = [v8 stringByAppendingPathComponent:v10];
LABEL_14:

    goto LABEL_15;
  }
  id v9 = [v6 absolutePath];
LABEL_16:

  return v9;
}

- (BOOL)shouldRestoreSystemFile:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 domain];
  if (([v5 isPlaceholderDomain] & 1) == 0
    && (![v5 isSystemSharedContainerDomain]
     || ![(MBRestorePolicy *)self shouldAlwaysRestoreSystemSharedContainerDomain:v5]))
  {
    id v7 = [v5 relativePathsOfSystemFilesToAlwaysRestore];
    if ([v7 count])
    {
      v32 = v7;
      char v8 = [v4 relativePath];
      id v9 = [v8 pathComponents];

      id v10 = [v9 count];
      unint64_t v11 = 0;
      v33 = v9;
      do
      {
        v13 = -[NSObject subarrayWithRange:](v9, "subarrayWithRange:", 0, v11);
        v14 = +[NSString pathWithComponents:v13];

        v15 = [v5 relativePathsOfSystemFilesToAlwaysRestore];
        unsigned __int8 v16 = [v15 containsObject:v14];

        if (v16)
        {
          BOOL v6 = 1;
          id v7 = v32;
          id v28 = v33;
          goto LABEL_30;
        }
        ++v11;
        id v9 = v33;
      }
      while (v11 <= (unint64_t)v10);
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v7 = v32;
      id v17 = v32;
      id v36 = [v17 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v36)
      {
        v30 = self;
        v31 = v5;
        char v18 = 0;
        id obj = v17;
        uint64_t v35 = *(void *)v39;
        do
        {
          for (i = 0; i != v36; i = (char *)i + 1)
          {
            if (*(void *)v39 != v35) {
              objc_enumerationMutation(obj);
            }
            id v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            id v21 = [v20 pathComponents];
            id v22 = [v21 count];
            unint64_t v23 = 0;
            do
            {
              v24 = [v21 subarrayWithRange:0, v23];
              v25 = +[NSString pathWithComponents:v24];

              v26 = [v4 relativePath];
              unsigned int v27 = [v26 isEqualToString:v25];

              if (v27) {
                char v18 = 1;
              }

              ++v23;
            }
            while (v23 <= (unint64_t)v22);
          }
          id v36 = [obj countByEnumeratingWithState:&v38 objects:v44 count:16];
        }
        while (v36);

        unint64_t v5 = v31;
        id v7 = v32;
        self = v30;
        if (v18) {
          goto LABEL_26;
        }
      }
      else
      {
      }
    }
    if (([v5 isAppDomain] & 1) == 0 && !self->_shouldRestoreSystemFiles)
    {
      id v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v4;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring system file: %@", buf, 0xCu);
        _MBLog();
      }
      BOOL v6 = 0;
LABEL_30:

      goto LABEL_31;
    }
LABEL_26:
    BOOL v6 = 1;
LABEL_31:

    goto LABEL_32;
  }
  BOOL v6 = 1;
LABEL_32:

  return v6;
}

- (BOOL)shouldRestoreFile:(id)a3 markFileAsSkipped:(BOOL *)a4 error:(id *)a5
{
  id v9 = a3;
  if (a4) {
    *a4 = 0;
  }
  unint64_t v11 = [v9 domain];
  if (!v11) {
    sub_10009A2E4();
  }
  v12 = v11;
  v13 = [v11 rootPath];
  if ([v13 hasPrefix:@"/private"])
  {
    v14 = [v12 rootPath];
    unsigned __int8 v15 = [v14 hasPrefix:@"/private/var/PersonaVolumes"];

    if ((v15 & 1) == 0)
    {
      unsigned __int8 v16 = MBGetDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring (invalid path prefix): %@", buf, 0xCu);
        _MBLog();
      }

      id v17 = [v12 rootPath];
      char v18 = [v12 rootPath];
      id v19 = +[MBError errorWithCode:205, v17, @"Domain %@ has an invalid root path: %@", v12, v18 path format];

      goto LABEL_74;
    }
  }
  else
  {
  }
  id v20 = [v12 rootPath];
  id v21 = [v9 relativePath];
  id v22 = [v20 stringByAppendingPathComponent:v21];

  id v23 = v22;
  context = v10;
  if (strlen((const char *)[v23 fileSystemRepresentation]) >= 0x3E6)
  {
    v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v9;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring (file name too long): %@", buf, 0xCu);
      id v64 = v9;
      _MBLog();
    }

    if (a4) {
      *a4 = 1;
    }
    id v19 = +[MBError errorWithCode:107, v23, @"Cannot restore file with path name that is too long", v64 path format];
LABEL_16:
    int v25 = 6;
    goto LABEL_73;
  }
  id v71 = 0;
  int64_t v26 = [(MBRestorePolicy *)self restoreBehaviorForFile:v9 debugContext:0 error:&v71];
  v67 = v71;
  if (v26 == -1)
  {
    int v25 = 6;
    id v19 = v67;
    goto LABEL_73;
  }
  if (v26 == 1)
  {
    id v19 = v67;
    if (a4) {
      *a4 = 1;
    }
    goto LABEL_16;
  }
  id v66 = v23;
  if (_os_feature_enabled_impl())
  {
    if ([(MBRestorePolicy *)self _isForegroundRestore])
    {
      unsigned int v27 = [v9 domain];
      id v28 = [v27 name];
      unsigned int v29 = [v28 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"];

      if (v29)
      {
        v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v73 = v9;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "=restore-policy= Not restoring in foreground because file is in LocalStorage domain: %@", buf, 0xCu);
          _MBLog();
        }

        v31 = [v9 relativePath];
        id v19 = +[MBError errorWithCode:213 path:v31 format:@"Not restoring in foreground because file is in LocalStorage domain"];

        int v25 = 6;
        id v23 = v66;
        goto LABEL_73;
      }
    }
  }
  v65 = a5;
  v68 = v9;
  v32 = [v9 relativePath];
  v33 = [v32 pathComponents];

  v69 = v33;
  id v34 = [v33 count];
  unint64_t v35 = 0;
  do
  {
    v37 = [v69 subarrayWithRange:0, v35];
    long long v38 = +[NSString pathWithComponents:v37];

    long long v39 = [v12 relativePathsNotToRestore];
    unsigned int v40 = [v39 containsObject:v38];

    if (v40)
    {
      if (a4) {
        *a4 = 1;
      }
      v54 = MBGetDefaultLog();
      int v25 = 1;
      id v19 = v67;
      id v9 = v68;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v68;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring: %@", buf, 0xCu);
        goto LABEL_58;
      }
LABEL_68:

      char v5 = 0;
      a5 = v65;
      id v23 = v66;
      goto LABEL_72;
    }
    if ([(MBRestorePolicy *)self _isForegroundRestore]
      && ([v68 type] & 0xF000) == 0x8000)
    {
      long long v41 = [v12 relativePathsToBackgroundRestore];
      if ([v41 containsObject:v38])
      {
        BOOL shouldRestoreSystemFiles = self->_shouldRestoreSystemFiles;

        if (shouldRestoreSystemFiles)
        {
          v56 = MBGetDefaultLog();
          BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
          id v9 = v68;
          if (v57)
          {
            *(_DWORD *)buf = 138412290;
            id v73 = v68;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "=restore-policy= Ignoring file since it needs to be restored in the background: %@", buf, 0xCu);
            _MBLog();
          }

          id v19 = +[MBError errorWithCode:213 format:@"Domain policy requires file must be restored in the background"];
          v54 = v67;
          int v25 = 6;
          goto LABEL_68;
        }
      }
      else
      {
      }
    }
    if (![(MBRestorePolicy *)self isRestoringToSameDevice])
    {
      id v43 = [v12 relativePathsNotToMigrate];
      unsigned int v44 = [v43 containsObject:v38];

      if (v44)
      {
        v54 = MBGetDefaultLog();
        int v25 = 1;
        id v19 = v67;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v9 = v68;
          id v73 = v68;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring because this is a migrate: %@", buf, 0xCu);
LABEL_58:
          _MBLog();
        }
        else
        {
          id v9 = v68;
        }
        goto LABEL_68;
      }
    }
    v45 = MBDeviceClass();
    if ([v45 isEqualToString:@"iPod"])
    {
      v46 = [v12 relativePathsNotToRestoreToIPods];
      unsigned int v47 = [v46 containsObject:v38];

      if (v47)
      {
        v54 = MBGetDefaultLog();
        int v25 = 1;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v9 = v68;
          id v73 = v68;
          _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring because this is an iPod: %@", buf, 0xCu);
          _MBLog();
        }
        else
        {
          id v9 = v68;
        }
        id v19 = v67;
        goto LABEL_68;
      }
    }
    else
    {
    }
    ++v35;
  }
  while (v35 <= (unint64_t)v34);
  id v9 = v68;
  if (![(MBRestorePolicy *)self shouldRestoreSystemFile:v68])
  {
    char v5 = 0;
    int v25 = 1;
    a5 = v65;
    id v23 = v66;
LABEL_71:
    id v19 = v67;
    goto LABEL_72;
  }
  a5 = v65;
  id v23 = v66;
  if (![(MBRestorePolicy *)self _isForegroundRestore])
  {
LABEL_70:
    int v25 = 1;
    char v5 = 1;
    goto LABEL_71;
  }
  if (![v12 isAppDomain])
  {
    if (![(MBRestorePolicy *)self _pluginsAllowForegroundRestoreFile:v68])
    {
      id v19 = +[MBError errorWithCode:213 format:@"Plug-in requested file must be restored in the background"];

      char v5 = 0;
      int v25 = 6;
      goto LABEL_72;
    }
    goto LABEL_70;
  }
  appManager = self->_appManager;
  v49 = [v12 containerID];
  v50 = [(MBAppManager *)appManager appWithIdentifier:v49];

  if (([v50 isSystemApp] & 1) != 0
    || ([v12 name],
        v51 = objc_claimAutoreleasedReturnValue(),
        unsigned int v52 = [(MBRestorePolicy *)self shouldForegroundRestoreDomain:v51],
        v51,
        v52))
  {
    v53 = MBGetDefaultLog();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v68;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "=restore-policy= Restoring system app in the foreground: %@", buf, 0xCu);
      _MBLog();
    }
    int v25 = 1;
    char v5 = 1;
    id v19 = v67;
  }
  else if ([v12 isPlaceholderAppDomain])
  {
    v53 = MBGetDefaultLog();
    id v19 = v67;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v68;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "=restore-policy= Restoring app placeholder file in the foreground: %@", buf, 0xCu);
      _MBLog();
    }
    int v25 = 1;
    char v5 = 1;
  }
  else
  {
    if ([v12 isPluginAppDomain])
    {
      v59 = MBGetDefaultLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v68;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "=restore-policy= Restoring app plugin file in the background: %@", buf, 0xCu);
        id v64 = v68;
        _MBLog();
      }

      CFStringRef v60 = @"App plug-in file must be restored in the background";
    }
    else
    {
      unsigned int v61 = [v12 isGroupAppDomain];
      v62 = MBGetDefaultLog();
      BOOL v63 = os_log_type_enabled(v62, OS_LOG_TYPE_INFO);
      if (v61)
      {
        if (v63)
        {
          *(_DWORD *)buf = 138412290;
          id v73 = v68;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "=restore-policy= Restoring group container file in the background: %@", buf, 0xCu);
          id v64 = v68;
          _MBLog();
        }

        CFStringRef v60 = @"Group container file must be restored in the background";
      }
      else
      {
        if (v63)
        {
          *(_DWORD *)buf = 138412290;
          id v73 = v68;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "=restore-policy= Restoring app file in the background: %@", buf, 0xCu);
          id v64 = v68;
          _MBLog();
        }

        CFStringRef v60 = @"App file must be restored in the background";
      }
    }
    +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 213, v60, v64);
    char v5 = 0;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    v53 = v67;
    int v25 = 6;
  }

  id v23 = v66;
LABEL_72:

LABEL_73:
  if (v25 == 6)
  {
LABEL_74:
    if (a5)
    {
      id v19 = v19;
      char v5 = 0;
      *a5 = v19;
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5 & 1;
}

- (BOOL)_pluginsAllowForegroundRestoreFile:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = self->_plugins;
  id v5 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v5)
  {
    BOOL v13 = 1;
    goto LABEL_33;
  }
  id v6 = v5;
  int64_t v26 = v4;
  uint64_t v7 = *(void *)v28;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(obj);
      }
      id v9 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if (objc_opt_respondsToSelector())
      {
        id v10 = [v26 absolutePath];
        unsigned __int8 v11 = [v9 shouldRestoreContentWithPolicy:self atPath:v10];

        if ((v11 & 1) == 0)
        {
          v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v14 = (objc_class *)objc_opt_class();
            Name = class_getName(v14);
            *(_DWORD *)buf = 136446466;
            v32 = Name;
            __int16 v33 = 2112;
            id v4 = v26;
            id v34 = v26;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);
            unsigned __int8 v16 = (objc_class *)objc_opt_class();
            class_getName(v16);
            _MBLog();
          }
          else
          {
            id v4 = v26;
          }
          goto LABEL_32;
        }
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v12 = 0;
          goto LABEL_18;
        }
LABEL_14:
        v12 = +[MBFileInfo fileInfoWithRestorable:v26];
LABEL_15:
        if (([v9 shouldRestoreContentWithPolicy:self fileInfo:v12] & 1) == 0)
        {
          id v19 = MBGetDefaultLog();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            id v21 = (objc_class *)objc_opt_class();
            id v22 = class_getName(v21);
            *(_DWORD *)buf = 136446466;
            v32 = v22;
            __int16 v33 = 2112;
            id v4 = v26;
            id v34 = v26;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring because it was refused by plugin %{public}s: %@", buf, 0x16u);
            goto LABEL_28;
          }
          goto LABEL_29;
        }
        goto LABEL_18;
      }
      v12 = +[MBFileInfo fileInfoWithRestorable:v26];
      if ([v9 shouldBackgroundRestoreContentWithPolicy:self fileInfo:v12])
      {
        id v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v17 = (objc_class *)objc_opt_class();
          char v18 = class_getName(v17);
          *(_DWORD *)buf = 136446466;
          v32 = v18;
          __int16 v33 = 2112;
          id v4 = v26;
          id v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "=restore-policy= Restoring system file in the background (requested by plugin %{public}s: %@", buf, 0x16u);
LABEL_28:
          id v23 = (objc_class *)objc_opt_class();
          class_getName(v23);
          _MBLog();
LABEL_30:

LABEL_32:
          BOOL v13 = 0;
          goto LABEL_33;
        }
LABEL_29:
        id v4 = v26;
        goto LABEL_30;
      }
      if (objc_opt_respondsToSelector())
      {
        if (!v12) {
          goto LABEL_14;
        }
        goto LABEL_15;
      }
LABEL_18:
    }
    id v6 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v6) {
      continue;
    }
    break;
  }
  BOOL v13 = 1;
  id v4 = v26;
LABEL_33:

  return v13;
}

- (int64_t)restoreBehaviorForDomain:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 isPlaceholderDomain]) {
    goto LABEL_2;
  }
  if (self->_shouldRestoreSystemFiles
    || ([v6 isAppDomain] & 1) != 0
    || ([v6 relativePathsOfSystemFilesToAlwaysRestore],
        char v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [v6 rootPath];
    if ([v9 hasPrefix:@"/private"])
    {
      id v10 = [v6 rootPath];
      unsigned __int8 v11 = [v10 hasPrefix:@"/private/var/PersonaVolumes"];

      if ((v11 & 1) == 0)
      {
        if (a4)
        {
          v12 = [v6 rootPath];
          BOOL v13 = [v6 rootPath];
          *a4 = +[MBError errorWithCode:205, v12, @"Domain %@ has an invalid root path: %@", v6, v13 path format];
        }
        int64_t v7 = -1;
        goto LABEL_49;
      }
    }
    else
    {
    }
    cachedDomainRestoreBehaviors = self->_cachedDomainRestoreBehaviors;
    unsigned __int8 v15 = [v6 name];
    unsigned __int8 v16 = [(NSMutableDictionary *)cachedDomainRestoreBehaviors objectForKeyedSubscript:v15];

    if (v16)
    {
      int64_t v7 = (int64_t)[v16 integerValue];
LABEL_48:

      goto LABEL_49;
    }
    id v17 = [(MBRestorePolicy *)self _localRootPathForDomain:v6];
    char v18 = +[NSURL fileURLWithPath:v17];

    id v41 = 0;
    id v40 = 0;
    unsigned int v19 = [v18 getResourceValue:&v41 forKey:NSURLIsExcludedFromBackupKey error:&v40];
    id v20 = v41;
    id v21 = v40;
    if (v19 && [v20 BOOLValue])
    {
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v6;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring domain (attribute set locally): %@", buf, 0xCu);
        _MBLog();
      }

      id v23 = self->_cachedDomainRestoreBehaviors;
      v24 = [v6 name];
      [(NSMutableDictionary *)v23 setObject:&off_1000FDDC8 forKeyedSubscript:v24];

      goto LABEL_19;
    }
    if (![(MBRestorePolicy *)self _isDriveOrMegaBackupPolicy]
      || [(MBRestorePolicy *)self _isEncrypted]
      || [(MBRestorePolicy *)self _isDeviceTransferEngine])
    {
      if (![(MBRestorePolicy *)self _isCloudKitEngine]) {
        goto LABEL_46;
      }
      CFErrorRef error = 0;
      CFBooleanRef propertyValueTypeRefPtr = 0;
      int v25 = (void *)_kCFURLIsExcludedFromCloudBackupKey;
      if (CFURLCopyResourcePropertyForKey((CFURLRef)v18, _kCFURLIsExcludedFromCloudBackupKey, &propertyValueTypeRefPtr, &error))
      {
        CFBooleanRef v26 = propertyValueTypeRefPtr;
        if (propertyValueTypeRefPtr)
        {
          CFRelease(propertyValueTypeRefPtr);
          if (v26 == kCFBooleanTrue)
          {
            long long v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v6;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring domain from iCloud (attribute set locally): %@", buf, 0xCu);
LABEL_40:
              _MBLog();
              goto LABEL_41;
            }
            goto LABEL_41;
          }
        }
        goto LABEL_46;
      }
      long long v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_43:
        *(_DWORD *)buf = 138543618;
        id v43 = v25;
        __int16 v44 = 2112;
        CFErrorRef v45 = error;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "=restore-policy= Error fetching value for property %{public}@: %@", buf, 0x16u);
        unint64_t v35 = v25;
        CFErrorRef v37 = error;
        _MBLog();
      }
    }
    else
    {
      CFErrorRef error = 0;
      CFBooleanRef propertyValueTypeRefPtr = 0;
      int v25 = (void *)_kCFURLIsExcludedFromUnencryptedBackupKey;
      if (CFURLCopyResourcePropertyForKey((CFURLRef)v18, _kCFURLIsExcludedFromUnencryptedBackupKey, &propertyValueTypeRefPtr, &error))
      {
        CFBooleanRef v31 = propertyValueTypeRefPtr;
        if (propertyValueTypeRefPtr)
        {
          CFRelease(propertyValueTypeRefPtr);
          if (v31 == kCFBooleanTrue)
          {
            long long v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v43 = v6;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring domain from unencrypted iTunes backup (attribute set locally): %@", buf, 0xCu);
              goto LABEL_40;
            }
LABEL_41:

LABEL_19:
            int64_t v7 = 1;
LABEL_47:

            goto LABEL_48;
          }
        }
LABEL_46:
        v32 = self->_cachedDomainRestoreBehaviors;
        __int16 v33 = [v6 name:v35, v37];
        [(NSMutableDictionary *)v32 setObject:&off_1000FDDE0 forKeyedSubscript:v33];

        int64_t v7 = 0;
        goto LABEL_47;
      }
      long long v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
    }

    if (error) {
      CFRelease(error);
    }
    goto LABEL_46;
  }
  if ([(MBRestorePolicy *)self shouldAlwaysRestoreSystemSharedContainerDomain:v6])
  {
LABEL_2:
    int64_t v7 = 0;
    goto LABEL_49;
  }
  long long v28 = MBGetDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    long long v29 = [v6 name];
    *(_DWORD *)buf = 138412290;
    id v43 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring system domain: %@", buf, 0xCu);

    id v36 = [v6 name];
    _MBLog();
  }
  int64_t v7 = 1;
LABEL_49:

  return v7;
}

- (int64_t)restoreBehaviorForFile:(id)a3 debugContext:(id)a4 error:(id *)a5
{
  return [(MBRestorePolicy *)self restoreBehaviorForFile:a3 withValidation:1 debugContext:a4 error:a5];
}

- (int64_t)restoreBehaviorForFile:(id)a3 withValidation:(BOOL)a4 debugContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = a4;
  id v10 = a3;
  id v11 = a5;
  v12 = [v10 domain];
  int64_t v13 = [(MBRestorePolicy *)self restoreBehaviorForDomain:v12 error:a6];

  if (v13) {
    goto LABEL_81;
  }
  v14 = buf;
  unsigned __int8 v15 = [v10 domain];
  unsigned __int8 v16 = [v10 relativePath];
  id v17 = [v16 length];
  if (v17 - (unsigned char *)[@".plist.1234567" length] >= 1)
  {
    char v18 = -[NSObject substringFromIndex:](v16, "substringFromIndex:");
    unsigned int v19 = [v18 hasPrefix:@".plist."];

    if (v19)
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        NSURLResourceKey p_isa = (NSURLResourceKey)&v16->isa;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring up failed plist safe save: %@", buf, 0xCu);
LABEL_10:
        _MBLog();
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  id v21 = [v16 pathExtension];
  if ([v21 isEqualToString:@"dat"])
  {
    unsigned int v22 = [v16 containsString:@"binarycookies_tmp"];

    if (v22)
    {
      id v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        NSURLResourceKey p_isa = (NSURLResourceKey)&v16->isa;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "=restore-policy= Not restoring up temporary cookie: %@", buf, 0xCu);
        goto LABEL_10;
      }
LABEL_11:

LABEL_12:
      int64_t v13 = 1;
      goto LABEL_80;
    }
  }
  else
  {
  }
  if (v8)
  {
    if ((MBIsValidRelativePath() & 1) == 0)
    {
      if (a6)
      {
        id v40 = [v15 name];
        *a6 = +[MBError errorWithCode:205, @"File path is invalid: %@:%@", v40, v16 format];
      }
      int64_t v13 = -1;
      goto LABEL_80;
    }
    if ([v16 length])
    {
      id v23 = [v15 rootPath];
      size_t v24 = strlen((const char *)[v23 fileSystemRepresentation]);
      v108 = v16;
      int v25 = self;
      unint64_t v26 = strlen((const char *)[v108 fileSystemRepresentation]) + v24;

      BOOL v27 = v26 >= 0x3E6;
      self = v25;
      if (v27)
      {
        v59 = MBGetDefaultLog();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          NSURLResourceKey p_isa = (NSURLResourceKey)v15;
          __int16 v119 = 2112;
          v120 = v108;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "=restore-policy= File path is too long and will be skipped: %@:%@", buf, 0x16u);
          _MBLog();
        }

        goto LABEL_12;
      }
    }
  }
  unsigned int v105 = [(MBRestorePolicy *)self _isMegaBackup];
  unsigned int v28 = [(MBRestorePolicy *)self _isDriveEngine] | v105;
  unsigned int v29 = [(MBRestorePolicy *)self _isServiceEngine];
  unsigned int v109 = v28;
  int v30 = v28 ^ 1;
  v96 = v11;
  v97 = (NSString *)v10;
  int v103 = v8;
  if ([(MBRestorePolicy *)self _isDriveEngine]) {
    unsigned int v106 = ![(MBRestorePolicy *)self _isDeviceTransferEngine];
  }
  else {
    unsigned int v106 = 0;
  }
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100060CF4;
  v115[3] = &unk_1000F1ED8;
  int v107 = v29 & v30;
  char v116 = v109;
  v115[4] = self;
  v98 = objc_retainBlock(v115);
  v114[0] = _NSConcreteStackBlock;
  v114[1] = 3221225472;
  v114[2] = sub_1000610DC;
  v114[3] = &unk_1000F1F00;
  v101 = self;
  v114[4] = self;
  v99 = objc_retainBlock(v114);
  v100 = v16;
  CFBooleanRef v31 = [v16 pathComponents];
  [v31 count];
  uint64_t v32 = -1;
  v104 = v31;
  while (1)
  {
    __int16 v33 = [v31 subarrayWithRange:0, v32 + 1];
    id v34 = +[NSString pathWithComponents:v33];

    unint64_t v35 = [v15 relativePathsNotToBackup];
    if ([v35 containsObject:v34]) {
      break;
    }
    if (v109)
    {
      v14 = [v15 relativePathsNotToBackupToDrive];
      if ([v14 containsObject:v34])
      {

        break;
      }
    }
    if (v107)
    {
      id v10 = [v15 relativePathsNotToBackupToService];
      if ([v10 containsObject:v34])
      {
        unsigned __int8 v36 = 1;
LABEL_41:

        if ((v109 & 1) == 0) {
          goto LABEL_43;
        }
LABEL_42:

        goto LABEL_43;
      }
    }
    if (v106)
    {
      uint64_t v8 = [v15 relativePathsNotToBackupToLocal];
      if ([(id)v8 containsObject:v34])
      {
        unsigned __int8 v36 = 1;
LABEL_40:

        if (v107) {
          goto LABEL_41;
        }
        goto LABEL_50;
      }
    }
    if (v105)
    {
      v102 = [v15 relativePathsNotToBackupInMegaBackup];
      if ([v102 containsObject:v34])
      {
        unsigned __int8 v36 = 1;
        goto LABEL_39;
      }
    }
    CFErrorRef v37 = v15;
    long long v38 = MBDeviceClass();
    if ([v38 isEqualToString:@"AppleTV"])
    {
      long long v39 = [v37 relativePathsNotToBackupAndRestoreToAppleTVs];
      unsigned __int8 v36 = [v39 containsObject:v34];

      if (v105)
      {
        unsigned __int8 v15 = v37;
        CFBooleanRef v31 = v104;
        goto LABEL_39;
      }
      unsigned __int8 v15 = v37;
      CFBooleanRef v31 = v104;
    }
    else
    {

      unsigned __int8 v36 = 0;
      if (v105)
      {
        unsigned __int8 v15 = v37;
LABEL_39:

        if (v106) {
          goto LABEL_40;
        }
        goto LABEL_49;
      }
      unsigned __int8 v15 = v37;
    }
    if (v106) {
      goto LABEL_40;
    }
LABEL_49:
    if (v107) {
      goto LABEL_41;
    }
LABEL_50:
    if (v109) {
      goto LABEL_42;
    }
LABEL_43:

    if (v36) {
      goto LABEL_76;
    }

    if ((unint64_t)[v31 count] <= ++v32)
    {
      int v41 = 1;
      v42 = (unsigned int (**)(void, void))v98;
      if (!v109) {
        goto LABEL_93;
      }
      [v15 relativePathsToIgnoreExclusionsForDrive];
      long long v110 = 0u;
      long long v111 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      id v44 = [v43 countByEnumeratingWithState:&v110 objects:v123 count:16];
      if (!v44)
      {
        v56 = v43;
        goto LABEL_92;
      }
      id v45 = v44;
      v46 = v15;
      uint64_t v47 = *(void *)v111;
      v48 = v100;
      while (1)
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v111 != v47) {
            objc_enumerationMutation(v43);
          }
          v50 = *(NSObject **)(*((void *)&v110 + 1) + 8 * i);
          if ([v50 hasSuffix:@"/", v85, v89])
          {
            v51 = MBGetDefaultLog();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            {
              unsigned int v52 = v51;
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
              {
                v53 = [v46 name];
                *(_DWORD *)buf = 138412546;
                NSURLResourceKey p_isa = v53;
                __int16 v119 = 2112;
                v120 = v50;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "=restore-policy= Found an invalid path in relativePathsToIgnoreExclusionsForDrive for %@: %@", buf, 0x16u);
              }
              v85 = [v46 name];
              v89 = v50;
              _MBLog();

              v48 = v100;
            }
          }
          else if ([v48 hasPrefix:v50])
          {
            id v54 = [v48 length];
            id v55 = [v50 length];
            if (v54 == v55
              || v55 < v54 && [v48 characterAtIndex:v55] == 47)
            {

              v56 = MBGetDefaultLog();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
              {
                v56 = v56;
                unsigned __int8 v15 = v46;
                CFBooleanRef v31 = v104;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  NSURLResourceKey p_isa = v97;
                  _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "=restore-policy= Skipping exclusion check for %@", buf, 0xCu);
                }

                v85 = v97;
                _MBLog();
                int v41 = 0;
                v42 = (unsigned int (**)(void, void))v98;
LABEL_92:

LABEL_93:
                [v31 count:v85];
                uint64_t v60 = -1;
                int64_t v13 = 1;
                int v95 = v41;
                while (2)
                {
                  v62 = [v31 subarrayWithRange:0, v60 + 1];
                  BOOL v63 = +[NSString pathWithComponents:v62];

                  if (v41)
                  {
                    id v64 = [(MBRestorePolicy *)v101 _localRootPathForDomain:v15];
                    v65 = [v64 stringByAppendingPathComponent:v63];

                    if (((unsigned int (**)(void, NSObject *))v42)[2](v42, v65))
                    {
                      if (![v65 isEqualToString:@"/var/mobile/Library/Preferences"])
                      {
                        v79 = MBGetDefaultLog();
                        if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                        {
                          v80 = [v15 name];
                          *(_DWORD *)buf = 138412802;
                          NSURLResourceKey p_isa = v80;
                          __int16 v119 = 2112;
                          unsigned __int8 v16 = v100;
                          v120 = v100;
                          __int16 v121 = 2112;
                          v122 = v63;
                          _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring file (attribute set locally): %@:%@ (%@)", buf, 0x20u);

                          v87 = [v15 name];
                          _MBLog();

                          goto LABEL_165;
                        }
                        id v11 = v96;
                        unsigned __int8 v16 = v100;
LABEL_173:

                        goto LABEL_175;
                      }
                      if ((byte_100112FC0 & 1) == 0)
                      {
                        byte_100112FC0 = 1;
                        id v66 = MBGetDefaultLog();
                        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
                        {
                          v67 = v15;
                          v68 = v66;
                          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138412546;
                            NSURLResourceKey p_isa = NSURLIsExcludedFromBackupKey;
                            __int16 v119 = 2112;
                            v120 = v65;
                            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "=restore-policy= Found %@ at %@ - ignoring", buf, 0x16u);
                          }

                          NSURLResourceKey v86 = NSURLIsExcludedFromBackupKey;
                          v89 = v65;
                          _MBLog();
                          unsigned __int8 v15 = v67;
                          v42 = (unsigned int (**)(void, void))v98;
                        }

                        int v41 = v95;
                      }
                    }
                  }
                  if (!v103)
                  {
                    CFBooleanRef v31 = v104;
                    goto LABEL_113;
                  }
                  CFBooleanRef v31 = v104;
                  if ((unint64_t)[v104 count] > v60 + 1
                    && ((unsigned int (*)(void *, void *, void *))v99[2])(v99, v15, v63))
                  {
                    v65 = MBGetDefaultLog();
                    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
                    {
                      v81 = [v15 name];
                      *(_DWORD *)buf = 138412546;
                      NSURLResourceKey p_isa = v81;
                      __int16 v119 = 2112;
                      unsigned __int8 v16 = v100;
                      v120 = v100;
                      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring file (path contains a symlink): %@:%@", buf, 0x16u);

                      v79 = [v15 name];
                      _MBLog();
LABEL_165:
                      id v11 = v96;
                      goto LABEL_173;
                    }
                    id v11 = v96;
                    unsigned __int8 v16 = v100;
LABEL_175:

                    int64_t v13 = 1;
                    id v10 = v97;
                    goto LABEL_79;
                  }
                  v69 = [v15 relativePathsToRestore:v86, v89];
                  if ([v69 containsObject:v63])
                  {
LABEL_111:

                    int64_t v13 = 0;
                    goto LABEL_113;
                  }
                  if (v107)
                  {
                    v70 = [v15 relativePathsToRestoreOnlyFromService];
                    v94 = v70;
                    if ([v70 containsObject:v63])
                    {

                      goto LABEL_111;
                    }
                  }
                  id v71 = [v15 relativePathsToBackupToDriveAndStandardAccount];
                  if ([v71 containsObject:v63])
                  {
                    char v72 = 1;
                    goto LABEL_119;
                  }
                  if ([v15 isExternalConfig])
                  {
                    char v72 = [v15 hasExternalConfig] ^ 1;
LABEL_119:

                    if (v107) {
                    if (v72)
                    }
                    {
                      int64_t v13 = 0;
                      v42 = (unsigned int (**)(void, void))v98;
                      goto LABEL_113;
                    }
                  }
                  else
                  {

                    if (v107) {
                  }
                    }
                  id v73 = [v15 relativePathsNotToBackup];
                  if (([v73 containsObject:v63] & 1) == 0)
                  {
                    if (v109)
                    {
                      v74 = [v15 relativePathsNotToBackupToDrive];
                      v92 = v74;
                      if ([v74 containsObject:v63])
                      {

                        break;
                      }
                    }
                    v42 = (unsigned int (**)(void, void))v98;
                    if (v107)
                    {
                      v93 = [v15 relativePathsNotToBackupToService];
                      if ([v93 containsObject:v63])
                      {
                        unsigned __int8 v75 = 1;
                        goto LABEL_146;
                      }
                    }
                    if (v106)
                    {
                      v90 = [v15 relativePathsNotToBackupToLocal];
                      if ([v90 containsObject:v63])
                      {
                        unsigned __int8 v75 = 1;
                        goto LABEL_145;
                      }
                    }
                    if (v105)
                    {
                      v91 = [v15 relativePathsNotToBackupInMegaBackup];
                      if ([v91 containsObject:v63])
                      {
                        unsigned __int8 v75 = 1;
                        goto LABEL_144;
                      }
                    }
                    v76 = MBDeviceClass();
                    if ([v76 isEqualToString:@"AppleTV"])
                    {
                      v77 = [v15 relativePathsNotToBackupAndRestoreToAppleTVs];
                      unsigned __int8 v75 = [v77 containsObject:v63];

                      if (v105)
                      {
                        CFBooleanRef v31 = v104;
                        goto LABEL_144;
                      }
                      CFBooleanRef v31 = v104;
LABEL_148:
                      if (!v106) {
                        goto LABEL_149;
                      }
LABEL_145:

                      if (v107)
                      {
LABEL_146:
                        v78 = v93;
                        goto LABEL_150;
                      }
LABEL_155:
                      if (!v109) {
                        goto LABEL_152;
                      }
LABEL_151:

                      goto LABEL_152;
                    }

                    unsigned __int8 v75 = 0;
                    if (!v105) {
                      goto LABEL_148;
                    }
LABEL_144:

                    if (v106) {
                      goto LABEL_145;
                    }
LABEL_149:
                    v78 = v93;
                    if (!v107) {
                      goto LABEL_155;
                    }
LABEL_150:
                    v93 = v78;

                    if (v109) {
                      goto LABEL_151;
                    }
LABEL_152:

                    if (v75) {
LABEL_153:
                    }
                      int64_t v13 = 1;
                    int v41 = v95;
LABEL_113:

                    if ((unint64_t)[v31 count] <= ++v60)
                    {
                      if (v103)
                      {
                        id v10 = v97;
                        id v11 = v96;
                        unsigned __int8 v16 = v100;
                        if (([(NSString *)v97 type] & 0xF000) == 0x4000)
                        {
                          int64_t v13 = 0;
                        }
                        else if (v13 == 1)
                        {
                          [v96 setFlag:@"RestorePathNotInSetOfPathsToBackup"];
                          v82 = MBGetDefaultLog();
                          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                          {
                            v83 = v82;
                            if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                            {
                              v84 = [v15 name];
                              *(_DWORD *)buf = 138412546;
                              NSURLResourceKey p_isa = v84;
                              __int16 v119 = 2112;
                              v120 = v100;
                              _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "=restore-policy= Not restoring file (skipped): %@:%@", buf, 0x16u);
                            }
                            v88 = [v15 name];
                            _MBLog();
                          }
                          int64_t v13 = 1;
                        }
                      }
                      else
                      {
                        int64_t v13 = 0;
                        id v11 = v96;
                        id v10 = v97;
                        unsigned __int8 v16 = v100;
                      }
                      goto LABEL_79;
                    }
                    continue;
                  }
                  break;
                }

                v42 = (unsigned int (**)(void, void))v98;
                goto LABEL_153;
              }
              int v41 = 0;
LABEL_91:
              unsigned __int8 v15 = v46;
              v42 = (unsigned int (**)(void, void))v98;
              CFBooleanRef v31 = v104;
              goto LABEL_92;
            }
          }
        }
        id v45 = [v43 countByEnumeratingWithState:&v110 objects:v123 count:16];
        if (!v45)
        {
          int v41 = 1;
          v56 = v43;
          goto LABEL_91;
        }
      }
    }
  }

LABEL_76:
  BOOL v57 = MBGetDefaultLog();
  id v10 = v97;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    NSURLResourceKey p_isa = (NSURLResourceKey)v34;
    _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "=restore-policy= Skipping file %@", buf, 0xCu);
    _MBLog();
  }

  int64_t v13 = 1;
  id v11 = v96;
  unsigned __int8 v16 = v100;
  v42 = (unsigned int (**)(void, void))v98;
LABEL_79:

LABEL_80:
LABEL_81:

  return v13;
}

- (id)_localRootPathForDomain:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_appManager) {
    goto LABEL_9;
  }
  if ([v4 isSystemContainerDomain])
  {
    appManager = self->_appManager;
    int64_t v7 = [v5 name];
    uint64_t v8 = +[MBDomain containerIDWithName:v7];
    uint64_t v9 = [(MBAppManager *)appManager systemDataContainerWithIdentifier:v8];
    goto LABEL_6;
  }
  if (![v5 isSystemSharedContainerDomain])
  {
LABEL_9:
    unsigned __int8 v15 = [v5 rootPath];
    goto LABEL_12;
  }
  id v10 = self->_appManager;
  int64_t v7 = [v5 name];
  uint64_t v8 = +[MBDomain containerIDWithName:v7];
  uint64_t v9 = [(MBAppManager *)v10 systemSharedContainerWithIdentifier:v8];
LABEL_6:
  id v11 = (void *)v9;

  if (v11
    && ([v11 domain],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v12 hasRootPath],
        v12,
        (v13 & 1) != 0))
  {
    v14 = [v11 domain];
    unsigned __int8 v15 = [v14 rootPath];
  }
  else
  {
    unsigned __int8 v15 = [v5 rootPath];
  }

LABEL_12:

  return v15;
}

- (id)deprecated_validateFile:(id)a3 debugContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 relativePath];
  char valid = MBIsValidRelativePath();

  if ((valid & 1) == 0)
  {
    v12 = [v6 domain];
    unsigned __int8 v13 = [v12 name];
    v14 = [v6 relativePath];
    unsigned __int8 v15 = +[MBError errorWithCode:205, @"File path is invalid: %@:%@", v13, v14 format];
LABEL_58:

    goto LABEL_59;
  }
  unsigned int v10 = [(MBRestorePolicy *)self _isMegaBackup];
  unsigned int v11 = [(MBRestorePolicy *)self _isDriveEngine];
  if ([(MBRestorePolicy *)self _isDriveEngine]) {
    unsigned int v46 = ![(MBRestorePolicy *)self _isDeviceTransferEngine];
  }
  else {
    unsigned int v46 = 0;
  }
  unsigned int v16 = [(MBRestorePolicy *)self _isServiceEngine];
  v12 = [v6 relativePath];
  unsigned __int8 v13 = [v6 domain];
  v14 = [v13 relativePathsToRestore];
  if ([v14 containsObject:v12])
  {
    unsigned __int8 v15 = 0;
    goto LABEL_58;
  }
  uint64_t v32 = v7;
  int v17 = v11 | v10;
  int v18 = v16 & ((v11 | v10) ^ 1);
  unsigned int v37 = v10;
  while (1)
  {
    if (v18)
    {
      id v45 = [v6 domain];
      id v44 = [v45 relativePathsToRestoreOnlyFromService];
      if ([v44 containsObject:v12])
      {
        char v19 = 1;
        goto LABEL_20;
      }
      long long v39 = [v6 domain];
      long long v38 = [v39 relativePathsToBackupToDriveAndStandardAccount];
      if ([v38 containsObject:v12])
      {
        char v19 = 1;
LABEL_19:

LABEL_20:
        if (v19) {
          goto LABEL_62;
        }
        goto LABEL_21;
      }
    }
    id v20 = [v6 domain];
    if (![v20 isExternalConfig])
    {

      if (!v18)
      {

        goto LABEL_21;
      }
      char v19 = 0;
      goto LABEL_19;
    }
    id v21 = [v6 domain];
    unsigned __int8 v22 = [v21 hasExternalConfig];

    if (v18)
    {
      char v19 = v22 ^ 1;
      unsigned int v10 = v37;
      goto LABEL_19;
    }

    unsigned int v10 = v37;
    if ((v22 & 1) == 0) {
      goto LABEL_62;
    }
LABEL_21:
    id v23 = [v6 domain];
    size_t v24 = [v23 relativePathsNotToBackup];
    if ([v24 containsObject:v12])
    {

LABEL_53:
      id v7 = v32;
      [v32 setFlag:@"RestorePathInSetOfPathsNotToBackup"];
      unsigned __int8 v13 = [v6 domain];
      v14 = [v13 name];
      int v30 = [v6 relativePath];
      +[MBError errorWithCode:205, @"File path in set of paths not to back up: %@:%@", v14, v30 format];
      unsigned __int8 v15 = LABEL_57:;

      goto LABEL_58;
    }
    if (v17)
    {
      id v43 = [v6 domain];
      v42 = [v43 relativePathsNotToBackupToDrive];
      if ([v42 containsObject:v12])
      {
        LOBYTE(v25) = 1;
LABEL_39:

        if (v25) {
          goto LABEL_53;
        }
        goto LABEL_49;
      }
    }
    if (v18)
    {
      int v41 = [v6 domain];
      id v40 = [v41 relativePathsNotToBackupToService];
      if ([v40 containsObject:v12])
      {
        unsigned int v25 = 1;
LABEL_38:

        if (v17) {
          goto LABEL_39;
        }
        goto LABEL_48;
      }
    }
    if (v46)
    {
      unsigned __int8 v36 = [v6 domain];
      unint64_t v35 = [v36 relativePathsNotToBackupToLocal];
      if ([v35 containsObject:v12])
      {
        unsigned int v25 = 1;
LABEL_37:

        if (v18) {
          goto LABEL_38;
        }
        goto LABEL_47;
      }
    }
    if (v10)
    {
      id v34 = [v6 domain];
      __int16 v33 = [v34 relativePathsNotToBackupInMegaBackup];
      if ([v33 containsObject:v12])
      {
        unsigned int v25 = 1;
LABEL_36:

        if (v46) {
          goto LABEL_37;
        }
        goto LABEL_46;
      }
    }
    unint64_t v26 = MBDeviceClass();
    if ([v26 isEqualToString:@"AppleTV"])
    {
      BOOL v27 = [v6 domain];
      unsigned int v28 = [v27 relativePathsNotToBackupAndRestoreToAppleTVs];
      unsigned int v25 = [v28 containsObject:v12];

      unsigned int v10 = v37;
      if (v37) {
        goto LABEL_36;
      }
    }
    else
    {

      unsigned int v25 = 0;
      if (v10) {
        goto LABEL_36;
      }
    }
    if (v46) {
      goto LABEL_37;
    }
LABEL_46:
    if (v18) {
      goto LABEL_38;
    }
LABEL_47:
    if (v17) {
      goto LABEL_39;
    }
LABEL_48:

    if (v25) {
      goto LABEL_53;
    }
LABEL_49:
    if (![v12 length]) {
      break;
    }
    uint64_t v29 = [v12 stringByDeletingLastPathComponent];

    unsigned __int8 v13 = [v6 domain];
    v14 = [v13 relativePathsToRestore];
    v12 = (void *)v29;
    if ([v14 containsObject:v29])
    {
      unsigned __int8 v15 = 0;
      v12 = (void *)v29;
      id v7 = v32;
      goto LABEL_58;
    }
  }
  if (([v6 type] & 0xF000) != 0x4000 || objc_msgSend(v12, "length"))
  {
    id v7 = v32;
    [v32 setFlag:@"RestorePathNotInSetOfPathsToBackup"];
    unsigned __int8 v13 = [v6 domain];
    v14 = [v13 name];
    int v30 = [v6 relativePath];
    +[MBError errorWithCode:205, @"File path not in set of paths to back up: %@:%@", v14, v30 format];
    goto LABEL_57;
  }
LABEL_62:
  unsigned __int8 v15 = 0;
  id v7 = v32;
LABEL_59:

  return v15;
}

- (id)validateRestoreDomain:(id)a3 relativePath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 rootPath];
  if ([v8 hasPrefix:@"/private"])
  {
    uint64_t v9 = [v6 rootPath];
    unsigned __int8 v10 = [v9 hasPrefix:@"/private/var/PersonaVolumes"];

    if ((v10 & 1) == 0)
    {
      unsigned int v11 = [v6 rootPath];
      v12 = [v6 rootPath];
      unsigned __int8 v13 = +[MBError errorWithCode:205, v11, @"Domain %@ has an invalid root path: %@", v6, v12 path format];

      goto LABEL_24;
    }
  }
  else
  {
  }
  v14 = [v6 rootPath];
  unsigned __int8 v15 = [v14 stringByAppendingPathComponent:v7];

  id v16 = v15;
  if (strlen((const char *)[v16 fileSystemRepresentation]) >= 0x3E6)
  {
    unsigned __int8 v13 = +[MBError errorWithCode:205 path:v16 format:@"Cannot restore file with path name that is too long"];
    goto LABEL_23;
  }
  int v17 = [v7 stringByDeletingLastPathComponent];

  if (![v17 length])
  {
    unsigned __int8 v13 = 0;
    id v7 = v17;
    goto LABEL_23;
  }
  id v7 = v17;
  while (1)
  {
    int v18 = [(MBRestorePolicy *)self persona];
    char v19 = sub_1000611B8(v6, v18);
    id v20 = [v19 stringByAppendingPathComponent:v7];

    int v29 = 0;
    unsigned int v28 = 0;
    [v20 mb_splitIntoBase:&v29 andRelativePath:&v28];
    memset(&v27, 0, sizeof(v27));
    int v21 = fstatat(v29, v28, &v27, 32);
    if ((v29 & 0x80000000) == 0) {
      close(v29);
    }
    if (v21) {
      break;
    }
    if ((~v27.st_mode & 0xA000) == 0)
    {
      unsigned __int8 v13 = +[MBError errorWithCode:205 path:v20 format:@"Restore path parent directory is a symlink"];
      goto LABEL_22;
    }
LABEL_15:
    unsigned __int8 v22 = [v7 stringByDeletingLastPathComponent];

    id v7 = v22;
    if (![v22 length])
    {
      unsigned __int8 v13 = 0;
      id v7 = v22;
      goto LABEL_23;
    }
  }
  if (*__error() == 2) {
    goto LABEL_15;
  }
  unsigned __int8 v13 = +[MBError posixErrorWithPath:v20 format:@"lstat error"];
  id v23 = MBGetDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    int v25 = *__error();
    *(_DWORD *)buf = 138412546;
    CFBooleanRef v31 = v20;
    __int16 v32 = 1024;
    int v33 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "=restore-policy= lstat failed at %@: %{errno}d", buf, 0x12u);
    __error();
    _MBLog();
  }

LABEL_22:
LABEL_23:

LABEL_24:

  return v13;
}

- (BOOL)shouldAlwaysRestoreSystemSharedContainerDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isSystemSharedContainerDomain])
  {
    id v4 = [v3 name];
    unsigned __int8 v5 = [v4 isEqualToString:@"SysSharedContainerDomain-systemgroup.com.apple.configurationprofiles"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)shouldRemoveAndRetryPlacingAssetsForRestorable:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(MBRestorePolicy *)self serviceRestoreMode];
  BOOL v9 = 1;
  if (([v5 isBackgroundFiles] & 1) != 0
    || [v5 isBackgroundFile])
  {
    id v6 = [v4 domain];
    id v7 = [v6 name];
    unsigned __int8 v8 = [v7 isEqualToString:@"AppDomainGroup-group.com.apple.FileProvider.LocalStorage"];

    if (v8) {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)notifyPluginsStartingRestoreWithEngine:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSArray *)self->_plugins objectEnumerator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100061F2C;
  v9[3] = &unk_1000F1F28;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = sub_10003EF34(v6, v5, "startingRestoreWithPolicy:engine:", (uint64_t)v9);

  return v7;
}

- (id)notifyPluginsPreparingRestoreWithEngine:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSArray *)self->_plugins objectEnumerator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100062014;
  v9[3] = &unk_1000F1F28;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = sub_10003EF34(v6, v5, "preparingRestoreWithPolicy:engine:", (uint64_t)v9);

  return v7;
}

- (id)notifyPluginsEndingRestoreWithEngine:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(NSArray *)self->_plugins reverseObjectEnumerator];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000620FC;
  v9[3] = &unk_1000F1F28;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = sub_10003EF34(v6, v5, "endingRestoreWithPolicy:engine:", (uint64_t)v9);

  return v7;
}

- (id)notifyPluginsEndedRestoreWithEngine:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(NSArray *)self->_plugins reverseObjectEnumerator];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100062210;
  v13[3] = &unk_1000F1F50;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  unsigned int v11 = sub_10003EF34(v10, v8, "endedRestoreWithPolicy:engine:error:", (uint64_t)v13);

  return v11;
}

- (MBPersona)persona
{
  return self->_persona;
}

- (MBServiceRestoreMode)serviceRestoreMode
{
  return self->_serviceRestoreMode;
}

- (NSString)osBuildVersionOfBackup
{
  return self->_osBuildVersionOfBackup;
}

- (BOOL)shouldCreateMissingIntermediateDirectories
{
  return self->_shouldCreateMissingIntermediateDirectories;
}

- (BOOL)isRestoringPrimaryAccount
{
  return self->_isRestoringPrimaryAccount;
}

- (NSSet)domainNamesToForegroundInstall
{
  return self->_domainNamesToForegroundInstall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainNamesToForegroundInstall, 0);
  objc_storeStrong((id *)&self->_osBuildVersionOfBackup, 0);
  objc_storeStrong((id *)&self->_serviceRestoreMode, 0);
  objc_storeStrong((id *)&self->_persona, 0);
  objc_storeStrong((id *)&self->_cachedDomainRestoreBehaviors, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_appManager, 0);

  objc_destroyWeak((id *)&self->_enginePolicyProvider);
}

@end